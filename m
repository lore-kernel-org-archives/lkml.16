Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736122DCBFF
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166568; cv=none; b=JUPhGRL4B3s1h4vA708rqoq7NF4U/CdKEY6iW0BOlFNqQ3P2v5ub6cVzCU+lwKCvSuKzCuq6xs2nz1DucY5eWmA9D4vYvnSCwbecQAvjyLA97tlF56cmiO9xKs2nVaqtHM8htlzVDzXvS1KD1sUJYF/NYnS1F2Z2zeguXkWkDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166568; c=relaxed/simple;
	bh=wZY1zk0OOtzs6hG0lN9MeGovmz3sTdx9EcgqYqRFgs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GkzWCBXTmsk6uqPm61TDwI4FSSPgKk64Ik6tMvEGHUJZAoI3HsGR5eFSPxXfygaW8pXC3isQ/HoQii5KYdKqfaFF+L978WZYQ3aZHggFLAImK3zX7/QYNGgE8TS8LAmT0VaApb37R2ia6D3VBV5+MrJqSl6/n1hgteaLr6WfOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r17k0vVo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r17k0vVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37909C4CEEA;
	Sun, 25 May 2025 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748166567;
	bh=wZY1zk0OOtzs6hG0lN9MeGovmz3sTdx9EcgqYqRFgs4=;
	h=Date:From:To:Cc:Subject:From;
	b=r17k0vVop16cWk6va9RXNH7qlEDM+aeKdpbHcR9cDQzLCBhkKq3d1qX5mT9wne9wx
	 ZKQKRVvWK5iQg0rK62ji6/O/UtXUf4Scm7/XzCUspExOsoR8SLg9b69JaV6qOva4jD
	 As6TmokuiCHXBzyQ42c76S2M3hUWcZudkiHcuThHqO5mn4TNeyCP+/mHh1fIQC6LW7
	 UvolSuxMGQSd969XnsSKWpqpuP0ap1e730PhL1Ts5sIjPPQWxWztrvQDiRipxYWRD+
	 vvB7OJn6nGipFTjmtZYU42fjPK5sZN5ANEDF6QUjWQTTEbBSjWDuQlTJ7IZLIk/Aam
	 3m0xC37JN/aJg==
Date: Sun, 25 May 2025 11:49:22 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [GIT PULL] Scheduler updates for v6.16
Message-ID: <aDLnosxcYAyXpeoQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest sched/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2025-05-25

   # HEAD: 90ca9410dab21c407706726b86b6e50c6698b5af sched/uclamp: Align uclamp and util_est and call before freq update

Scheduler updates for v6.16:

Core & fair scheduler changes:

  - Tweak wait_task_inactive() to force dequeue sched_delayed tasks
    (John Stultz)

  - Adhere to place_entity() constraints (Peter Zijlstra)

  - Allow decaying util_est when util_avg > CPU capacity (Pierre Gondois)

  - Fix up wake_up_sync() vs DELAYED_DEQUEUE (Xuewen Yan)

Energy management:

  - Introduce sched_update_asym_prefer_cpu() (K Prateek Nayak)

  - cpufreq/amd-pstate: Update asym_prefer_cpu when core rankings change
    (K Prateek Nayak)

  - Align uclamp and util_est and call before freq update (Xuewen Yan)

CPU isolation:

  - Make use of more than one housekeeping CPU (Phil Auld)

RT scheduler:

  - Fix race in push_rt_task() (Harshit Agarwal)

  - Add kernel cmdline option for rt_group_sched (Michal Koutný)

Scheduler topology support:

  - Improve topology_span_sane speed (Steve Wahl)

Scheduler debugging:

  - Move and extend the sched_process_exit() tracepoint (Andrii Nakryiko)

  - Add RT_GROUP WARN checks for non-root task_groups (Michal Koutný)

  - Fix trace_sched_switch(.prev_state) (Peter Zijlstra)

  - Untangle cond_resched() and live-patching (Peter Zijlstra)

Fixes and cleanups:

  - Misc fixes and cleanups (K Prateek Nayak, Michal Koutný,
    Peter Zijlstra, Xuewen Yan)

 Thanks,

	Ingo

------------------>
Andrii Nakryiko (1):
      sched/tracepoints: Move and extend the sched_process_exit() tracepoint

Harshit Agarwal (1):
      sched/rt: Fix race in push_rt_task

John Stultz (1):
      sched/core: Tweak wait_task_inactive() to force dequeue sched_delayed tasks

K Prateek Nayak (4):
      sched/fair: Use READ_ONCE() to read sg->asym_prefer_cpu
      sched/topology: Introduce sched_update_asym_prefer_cpu()
      cpufreq/amd-pstate: Update asym_prefer_cpu when core rankings change
      sched/debug: Print the local group's asym_prefer_cpu

Michal Koutný (9):
      sched: Convert CONFIG_RT_GROUP_SCHED macros to code conditions
      sched: Remove unneeed macro wrap
      sched: Always initialize rt_rq's task_group
      sched: Add commadline option for RT_GROUP_SCHED toggling
      sched: Skip non-root task_groups with disabled RT_GROUP_SCHED
      sched: Bypass bandwitdh checks with runtime disabled RT_GROUP_SCHED
      sched: Do not construct nor expose RT_GROUP_SCHED structures if disabled
      sched: Add RT_GROUP WARN checks for non-root task_groups
      sched: Add annotations to RT_GROUP_SCHED fields

Peter Zijlstra (3):
      sched: Fix trace_sched_switch(.prev_state)
      sched/fair: Adhere to place_entity() constraints
      sched,livepatch: Untangle cond_resched() and live-patching

Phil Auld (1):
      sched/isolation: Make use of more than one housekeeping cpu

Pierre Gondois (1):
      sched/fair: Allow decaying util_est when util_avg > CPU capa

Steve Wahl (2):
      sched/topology: improve topology_span_sane speed
      sched/topology: Refinement to topology_span_sane speedup

Xuewen Yan (3):
      sched/fair: Fixup wake_up_sync() vs DELAYED_DEQUEUE
      sched/util_est: Simplify condition for util_est_{en,de}queue()
      sched/uclamp: Align uclamp and util_est and call before freq update


 Documentation/admin-guide/kernel-parameters.txt |   5 +
 drivers/cpufreq/amd-pstate.c                    |   4 +-
 include/linux/livepatch_sched.h                 |  14 +--
 include/linux/sched.h                           |   6 -
 include/linux/sched/topology.h                  |   6 +
 include/trace/events/sched.h                    |  34 +++++-
 init/Kconfig                                    |  11 ++
 kernel/exit.c                                   |   2 +-
 kernel/livepatch/transition.c                   |  49 +++-----
 kernel/sched/core.c                             | 148 +++++++++++++-----------
 kernel/sched/debug.c                            |   4 +
 kernel/sched/fair.c                             |  33 +++---
 kernel/sched/isolation.c                        |   2 +-
 kernel/sched/rt.c                               | 105 +++++++++--------
 kernel/sched/sched.h                            |  34 +++++-
 kernel/sched/syscalls.c                         |   5 +-
 kernel/sched/topology.c                         | 129 ++++++++++++++++-----
 17 files changed, 377 insertions(+), 214 deletions(-)
