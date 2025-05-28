Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDA319005E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419789; cv=none; b=QNm/qMQXgX+g1ikYX31PslqGJga49vKwuvTEA9RxN+Zkt4l1bN2lu45D/fhM0gN6bLhAWnQ2OinLhTBp3MDgh0s7+9iHyDbP8bLElIDXtAvjRPsvt9BmNmO0uQvpFjXovPjYrg5DpMp3SZeYsAQNBf03mtFC1td+RiJ/cyQiZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419789; c=relaxed/simple;
	bh=5Frxhoz1ICCLyAPUO80Qx8a04tT5PJs28LPKvhv8nH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPZ/ruXF7qi5Cq5Qow0HjZJCKYyQ5KlQ493ZD0K3+QwBpKXb3bgZUnNUcIcVin92hXOA44NZW86pNkHXHK2C6uVWoDgpKbouJKCrP/0BLZUvGwpa6jKanM9cJQh9ega+mp52wRzh3FH/ZPpjCXRJ6bzk1um+clAV32Ht0imkmeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj8i3mXE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj8i3mXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935FBC4CEE7;
	Wed, 28 May 2025 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419788;
	bh=5Frxhoz1ICCLyAPUO80Qx8a04tT5PJs28LPKvhv8nH0=;
	h=From:To:Cc:Subject:Date:From;
	b=gj8i3mXEqYOR9yH3ybe9j2+UcVwmA14lILx93vLBrdPK74sQbEZ+M9ElazvNWlFuV
	 M7HdxIIpOVevB3ahVjVIWspmQ0RBQM3cm3zQHPHT9sRkDn/T/GNVVXJN6H2wiyiktb
	 yZJaUm/dd7B+JPcqYWZwnYOVbWE1IqRkC92UbX8lAwoY4gUXPtbBF4UKMzEFh4VOo2
	 cBHrwMKpYjTKoFa9SQQUOnrRyr8x+e/PSgBVzTbgkg5iZ/ugzltf8bnnWs3lTJaj9h
	 NJr0c8cUigISfi4vkSUJx3hfCKRvWn2JQFqILLhxbYjSVIX0GJtUlgyNRQr4hUWKaO
	 otqy8n/B+BJ9w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 00/43] sched: Use the SMP scheduler on UP too
Date: Wed, 28 May 2025 10:08:41 +0200
Message-ID: <20250528080924.2273858-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements an idea Peter Zijlstra has mentioned
before: standardize the Linux scheduler on the SMP variant to
drastically reduce the number of CONFIG_SMP blocks of code
and related complexity in the scheduler.

Today the Linux scheduler has an obscene amount of CONFIG_SMP
preprocessor blocks of code, where UP code diverges from SMP code:

	$ git grep CONFIG_SMP kernel/sched/ | grep -v endif | wc -l
	175

Which is substantial complexity that regularly results in build
failures and the occasional boot failure when people develop on
CONFIG_SMP and (naturally) don't immediately test on !CONFIG_SMP.

These build and boot failures are in fact under-reported in the
upstream kernel Git history, because they tend to be triggered
on developer systems: but they are still there and they are still
an ongoing development and maintenance cost. It's rare to see
a larger scheduler patch series that doesn't have some sort of
build complication on !SMP.

Another problem is that these literally 175 separate blocks of
preprocessor code make the scheduler code harder to review and
harder to understand.

All the while most modern hardware platforms - even embedded ones -
tend to have two or more CPUs and use SMP kernels these days.

So there's an ongoing and largely hidden burden of maintenance
and cost of complexity on scheduler developers.

This series gets rid of much of that CONFIG_SMP complexity by building
the UP scheduler from the SMP scheduler:

	$ git grep CONFIG_SMP kernel/sched/ | grep -v endif | wc -l
	28

The plain code reduction is nice too:

	33 files changed, 237 insertions(+), 999 deletions(-)

... or, when measured from after the cleanup series:

	24 files changed, 26 insertions(+), 789 deletions(-)

Note that even after this series the UP kernel can still be
improved too, as long as it is done via sensible patches
that use well-placed IS_ENABLED(CONFIG_SMP) kind of toggles,
without these almost 200 insane #ifdef blocks.

Note that the approach I chose is pretty blunt and straightforward,
to make sure this conversion is as bug-free as possible. I'd rather
bloat the UP scheduler a bit than to break it.

The first part of the series cleans up #if/#else/#endif markers to
be consistent, this made the removal patches much easier to
review, because instead of a random, context-free #endif removal:

	@@ -658,6 +657,7 @@ int __sched_setscheduler(struct task_struct *p,
					goto unlock;
				}
			}
	-#endif
		}

We now modify properly marked-up #endif blocks:

	@@ -658,6 +657,7 @@ int __sched_setscheduler(struct task_struct *p,
					goto unlock;
				}
			}
	-#endif /* CONFIG_SMP */
		}

Which can more easily be verified for intent and correctness.

The second part of the series converts the UP scheduler to the SMP
scheduler. The biggest patch:

	sched/smp: Make SMP unconditional

Ended up being rather large and monolithic, and there's no easy way I can
see to increase granularity there without breaking the scheduler in the
interim step: because there's no clear separation of various aspects of the
UP/SMP scheduler, other than a humunguous amount of #ifdef CONFIG_SMP blocks
we grew over ~25 years...

Once that first large step was done, it was easier to do the rest more
gradually.

Note that much of the extra SMP code is unused code that will never
be triggered on a UP kernel - such as load-balancing, but there's some
extra context switching overhead on UP kernels:

  $ perf stat --null --sync --repeat 5 perf bench sched pipe

  # Before: 2.55022 +- 0.00308 seconds time elapsed  ( +-  0.12% )
  # After:  2.68700 +- 0.01600 seconds time elapsed  ( +-  0.59% )

Kernel size impact (on x86-defconfig+!CONFIG_SMP):

      text       data        bss         dec        hex    filename
  28816070    7720174    1837328    38373572    24988c4    vmlinux.defconfig.nosmp.before
  28904324    7735982    1817876    38458182    24ad346    vmlinux.defconfig.nosmp.after

+0.3% text, +0.2% data.

But at this point I think the burden of proof and the burden of
work needs to be reversed: and anyone who cares about UP performance
or size should present sensible patches to improve performance/size.

The series is lightly tested at the moment, but I've tested the UP
scheduler on every bisection point to make sure it boots & works, and
to make sure any problems can be bisected back as far as possible.

The latest version of this series can be found at:

	git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/core

Thanks,

	Ingo

================>
Ingo Molnar (43):
  sched: Clean up and standardize #if/#else/#endif markers in sched/autogroup.[ch]
  sched: Clean up and standardize #if/#else/#endif markers in sched/clock.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/core.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/cpufreq_schedutil.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/cpupri.h
  sched: Clean up and standardize #if/#else/#endif markers in sched/cputime.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/deadline.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/debug.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/fair.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/idle.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/loadavg.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/pelt.[ch]
  sched: Clean up and standardize #if/#else/#endif markers in sched/psi.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/rt.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/sched.h
  sched: Clean up and standardize #if/#else/#endif markers in sched/stats.[ch]
  sched: Clean up and standardize #if/#else/#endif markers in sched/syscalls.c
  sched: Clean up and standardize #if/#else/#endif markers in sched/topology.c
  sched/smp: Always define sched_domains_mutex_lock()/unlock(), def_root_domain and sched_domains_mutex
  sched/smp: Make SMP unconditional
  sched/smp: Always define is_percpu_thread() and scheduler_ipi()
  sched/smp: Always define rq->hrtick_csd
  sched/smp: Use the SMP version of try_to_wake_up()
  sched/smp: Use the SMP version of __task_needs_rq_lock()
  sched/smp: Use the SMP version of wake_up_new_task()
  sched/smp: Use the SMP version of sched_exec()
  sched/smp: Use the SMP version of idle_thread_set_boot_cpu()
  sched/smp: Use the SMP version of the RT scheduling class
  sched/smp: Use the SMP version of the deadline scheduling class
  sched/smp: Use the SMP version of scheduler debugging data
  sched/smp: Use the SMP version of schedstats
  sched/smp: Use the SMP version of the scheduler syscalls
  sched/smp: Use the SMP version of sched_update_asym_prefer_cpu()
  sched/smp: Use the SMP version of the idle scheduling class
  sched/smp: Use the SMP version of the stop-CPU scheduling class
  sched/smp: Use the SMP version of cpu_of()
  sched/smp: Use the SMP version of is_migration_disabled()
  sched/smp: Use the SMP version of rq_pin_lock()
  sched/smp: Use the SMP version of task_on_cpu()
  sched/smp: Use the SMP version of WF_ and SD_ flag sanity checks
  sched/smp: Use the SMP version of ENQUEUE_MIGRATED
  sched/smp: Use the SMP version of add_nr_running()
  sched/smp: Use the SMP version of double_rq_clock_clear_update()

 include/linux/preempt.h          |   9 --
 include/linux/sched.h            |  55 --------
 include/linux/sched/deadline.h   |   4 -
 include/linux/sched/idle.h       |   4 -
 include/linux/sched/nohz.h       |   4 +-
 include/linux/sched/task.h       |   4 -
 include/linux/sched/topology.h   |  32 -----
 kernel/sched/autogroup.c         |   6 +-
 kernel/sched/autogroup.h         |   4 +-
 kernel/sched/build_policy.c      |   6 +-
 kernel/sched/build_utility.c     |   9 +-
 kernel/sched/clock.c             |   4 +-
 kernel/sched/core.c              | 281 ++++++++++++---------------------------
 kernel/sched/cpudeadline.h       |   2 -
 kernel/sched/cpufreq_schedutil.c |   4 +-
 kernel/sched/cpupri.h            |   2 -
 kernel/sched/cputime.c           |  14 +-
 kernel/sched/deadline.c          | 115 +---------------
 kernel/sched/debug.c             |  44 ++----
 kernel/sched/fair.c              | 194 ++++++---------------------
 kernel/sched/idle.c              |  10 +-
 kernel/sched/loadavg.c           |   4 +-
 kernel/sched/pelt.c              |   4 +-
 kernel/sched/pelt.h              |  62 +--------
 kernel/sched/psi.c               |   4 +-
 kernel/sched/rt.c                |  98 +++-----------
 kernel/sched/sched.h             | 206 +++++-----------------------
 kernel/sched/stats.c             |   4 -
 kernel/sched/stats.h             |  10 +-
 kernel/sched/stop_task.c         |   4 -
 kernel/sched/syscalls.c          |  15 +--
 kernel/sched/topology.c          |  14 +-
 kernel/smpboot.c                 |   4 -
 33 files changed, 237 insertions(+), 999 deletions(-)

-- 
2.45.2

