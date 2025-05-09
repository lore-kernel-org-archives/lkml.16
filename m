Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896DA25E466
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820222; cv=none; b=kZcgrw5Ao74FN3V2qaY1nSZBrHOvk/kB/MEbp6S/GIJdUCfcNbXGcIctz2Won3Q8qIE5t/rAsLuItAnJ9FCunfjZ9THjs5f7P5ZMeXURhTAUw35iViIuB7sOKfOb5D9Y0/DaD0FrdI2LVmV1JPb7SO+JyaKtlI1ySDW8xIkfFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820222; c=relaxed/simple;
	bh=sPWvoQ6uBR3ckzTpPs5FjkZOzS0skkZcfdaRAudPXRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTHIbqch08lM4v6oi30x3XB+yRyUM168GPh3M6lIviF/S8qKIX5JLmkvMc0T0hyF0NjZ44cAkf1uTAjuUEuDk52P4lTXAEXR2f2mJihvc6ViHvV8CHGTlDkaParIVpTp59k9EUcAgFKIh02i8+mmkl5lmcPrFQfnKuloQ2PCLnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A3/bYKnR; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A3/bYKnR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OVxXIUWqJ5/tjRD7G2aJchTSfdNxvyPZdJR2Sbfo3xs=; b=A3/bYKnRHIfpDW5Ls9RQbgt2gI
	V5dd5nOHaMRZ2jNfOe9NL2HVEeLtkLz7QP6RtjY+BaV2kcz52hBJfv9D9ysRjiO2P2OswN7Vd3nIt
	/dvKPu5IL1kryvwx0IXjlvJPPp6xPv1NxSc75nOzASpgAqNg5wQYzFblEpWfGG1lJGSe73jPUIwK+
	In7p13mRnQ8tDMSX8SZJ84LRxptChAPbN9/qO5VM9oFJ0cZqMA6wfJRqKHZgJewDrmsU59Gu5BQiJ
	9S5zJLzhUOrMFskKzJ7UXVP2P5MsibGyfRE3rbVuIURQwLyjnPC0v96/dUBS71blgrey7lwt20+Hc
	Cs4Vntsg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDTjL-0000000GKt4-0Ydn;
	Fri, 09 May 2025 19:50:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6DF2B300781; Fri,  9 May 2025 21:49:55 +0200 (CEST)
Date: Fri, 9 May 2025 21:49:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	dietmar.eggemann@arm.com, vschneid@redhat.com
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250509194955.GA25798@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>

On Wed, May 07, 2025 at 07:13:18PM -0400, Chris Mason wrote:
> Hi everyone,
> 
> I've spent some time trying to track down a regression in a networking
> benchmark, where it looks like we're spending roughly 10% more time in
> new idle balancing than 6.9 did.
> 
> I'm not sure if I've reproduced that exact regression, but with some
> changes to schbench, I was able to bisect a regression of some kind down
> to commits in v6.11.
> 
> The actual result of the bisect was:
> 
> There are only 'skip'ped commits left to test.
> The first bad commit could be any of:
> 781773e3b68031bd001c0c18aa72e8470c225ebd
> e1459a50ba31831efdfc35278023d959e4ba775b
> f12e148892ede8d9ee82bcd3e469e6d01fc077ac
> 152e11f6df293e816a6a37c69757033cdc72667d
> 2e0199df252a536a03f4cb0810324dff523d1e79
> 54a58a78779169f9c92a51facf6de7ce94962328
> We cannot bisect more!
> 
> And this roughly matches the commits that introduce DELAY_DEQUEUE and
> DELAY_ZERO.  Sadly, echo NO_DELAY_DEQUEUE/ZERO don't fix the regression
> in 6.15.  I had to skip ~5 commits because they didn't compile, but
> Peter might have already worked that part of the bisect out by the time
> this email hits the lists.
> 
> I've landed a few modifications to schbench
> (https://github.com/masoncl/schbench), but the basic workload is:
> 
>  - 4 message threads
>   - each message thread pinned to its own single CPU
>  - each waking up 128 worker threads
>   - each worker sharing all the remaining CPUs
> 
> Neither the message threads or the worker threads are doing anything
> other than waking up and going to sleep, so the whole RPS count from
> schbench is basically just how fast can 4 threads wake up everyone else
> on the system.
> 
> The answer is that v6.9 can do it roughly 8% faster than 6.11+.  I've
> tried on a few different CPUs some have bigger or smaller deltas but the
> regression is consistently there.
> 
> The exact command line I'm using:
> 
> schbench -L -m 4 -M auto -t 128 -n 0 -r 60
> 
> -L turns off the locking complexity I use to simulate our web workload
> -m 4 is 4 message threads
> -t 128 is 128 workers per message thread
> -n 0 turns off all the think time
> -r 60 is runtime in seconds
> -M auto is the new CPU pinning described above
> 
> I haven't actually tried to fix this yet, but I do have some profiling
> that might help, or is maybe interesting.  The most important thing in
> the data down below is probably that 6.9 is calling available_idle_cpu()
> 16M times in 10 seconds, and 6.15 is calling it 56M times in 10 seconds.
> 
> The next step for me is to stall for time while hoping someone else
> fixes this, but I'll try and understand why we're available_idle_cpuing
> so hard in later kernels.
> 
> 6.15.0-rc5 (git sha 0d8d44db295c, Linus as of May 6)
> 
> schbench RPS percentiles (requests) runtime 60 (s) (61 total samples)
> 	  20.0th: 1767424    (13 samples)
> 	* 50.0th: 1816576    (18 samples)
> 	  90.0th: 1841152    (27 samples)
> 	  min=1733207, max=2027049
> average rps: 1813674.47
> 
> v6.9
> 
> schbench RPS percentiles (requests) runtime 60 (s) (61 total samples)
> 	  20.0th: 1955840    (14 samples)
> 	* 50.0th: 1968128    (17 samples)
> 	  90.0th: 1984512    (26 samples)
> 	  min=1908492, max=2122446
> average rps: 1972418.82

Right, so when you poked me on IRC I started with testing v6.9,
tip/master and the two commits on either end of that range you
mentioned.

For me, the change is outside of that range, notably both ends perform
similar to v6.9.

As you mention, I spend a good few hours doing a traditional git-bisect
and got absolutely nowhere. After a proper bit of cursing git, Ingo
helped me out and got me a git command to list all the scheduler commits
that have DELAY_ZERO on.

Using that, I've done a manual bisect today, results below.

TL;DR, it looks like for me, it is commit 729288bc6856 ("kernel/sched:
Fix util_est accounting for DELAY_DEQUEUE") where the drop happens.

I've not yet tried to make sense of this result -- or double check.

(the results from 161 onwards are from the initial bisect run and have
been re-used here)

I'll prod more at this on Monday or so.

---

$ /usr/local/src/schbench/schbench -L -m 4 -t 160 -r 60 -n 0 -M 0-3 -W 4-1024

6.9: average rps: 2117400.22
     average rps: 2143333.58
     average rps: 2105387.47

tip: average rps: 1925521.90
     average rps: 1970553.90
     average rps: 1990727.87

$ git log --oneline --no-merges --ancestry-path=54a58a787791 54a58a787791..origin/master kernel/sched/ | grep -v sched_ext | awk '{ printf "%03d %s\n", ++i, $0 }'

001 bbce3de72be5 sched/eevdf: Fix se->slice being set to U64_MAX and resulting crash
	average rps: 1932495.83
	average rps: 1946343.63

002 75da043d8f88 cpufreq/sched: Set need_freq_update in ignore_dl_rate_limit()
003 79443a7e9da3 cpufreq/sched: Explicitly synchronize limits_changed flag handling
004 cfde542df7dd cpufreq/sched: Fix the usage of CPUFREQ_NEED_UPDATE_LIMITS
005 8fa7292fee5c treewide: Switch/rename to timer_delete[_sync]()
006 169eae7711ea rseq: Eliminate useless task_work on execve
007 26f80681a09b sched: Add sched tracepoints for RV task model
008 2cbb20b008db tracing: Disable branch profiling in noinstr code
009 dd5bdaf2b72d sched/debug: Make CONFIG_SCHED_DEBUG functionality unconditional
010 57903f72f270 sched/debug: Make 'const_debug' tunables unconditional __read_mostly
011 f7d2728cc032 sched/debug: Change SCHED_WARN_ON() to WARN_ON_ONCE()
012 d128130f486b sched/topology: Stop exposing partition_sched_domains_locked
013 d735bab3d58c sched/topology: Remove redundant dl_clear_root_domain call
014 2ff899e35164 sched/deadline: Rebuild root domain accounting after every update
015 45007c6fb586 sched/deadline: Generalize unique visiting of root domains
016 56209334dda1 sched/topology: Wrappers for sched_domains_mutex
017 f6147af176ea sched/deadline: Ignore special tasks when rebuilding domains
018 8bdc5daaa01e sched: Add a generic function to return the preemption string
019 76f970ce51c8 Revert "sched/core: Reduce cost of sched_move_task when config autogroup"
020 4bc45824149e sched/uclamp: Optimize sched_uclamp_used static key enabling
021 5fca5a4cf973 sched/uclamp: Use the uclamp_is_used() helper instead of open-coding it
022 f3fa0e40df17 sched/clock: Don't define sched_clock_irqtime as static key
023 14672f059d83 sched/deadline: Use online cpus for validating runtime
024 3b4035ddbfc8 sched/fair: Fix potential memory corruption in child_cfs_rq_on_list
025 82c387ef7568 sched/core: Prevent rescheduling when interrupts are disabled
026 1a5d3492f8e1 sched: Add unlikey branch hints to several system calls
027 b796ea848991 sched/core: Remove duplicate included header file stats.h
028 ee13da875b8a sched: Switch to use hrtimer_setup()
029 02d954c0fdf9 sched: Compact RSEQ concurrency IDs with reduced threads and affinity
030 d34e798094ca sched/fair: Refactor can_migrate_task() to elimate looping
031 563bc2161b94 sched/eevdf: Force propagating min_slice of cfs_rq when {en,de}queue tasks
032 b9f2b29b9494 sched: Don't define sched_clock_irqtime as static key
033 2ae891b82695 sched: Reduce the default slice to avoid tasks getting an extra tick
034 f553741ac8c0 sched: Cancel the slice protection of the idle entity
035 bcc6244e13b4 sched: Clarify wake_up_q()'s write to task->wake_q.next
036 2c00e1199c06 sched: update __cond_resched comment about RCU quiescent states
037 9065ce69754d sched/debug: Provide slice length for fair tasks
038 1751f872cc97 treewide: const qualify ctl_tables where applicable
039 65ef17aa0711 hung_task: add task->flags, blocked by coredump to log
040 93940fbdc468 cpufreq/schedutil: Only bind threads if needed
041 3429dd57f0de sched/fair: Fix inaccurate h_nr_runnable accounting with delayed dequeue
042 21641bd9a7a7 lazy tlb: fix hotplug exit race with MMU_LAZY_TLB_SHOOTDOWN
043 d40797d6720e kasan: make kasan_record_aux_stack_noalloc() the default behaviour
044 7d9da040575b psi: Fix race when task wakes up before psi_sched_switch() adjusts flags
045 a6fd16148fdd sched, psi: Don't account irq time if sched_clock_irqtime is disabled
046 763a744e24a8 sched: Don't account irq time if sched_clock_irqtime is disabled
047 8722903cbb8f sched: Define sched_clock_irqtime as static key
048 3229adbe7875 sched/fair: Do not compute overloaded status unnecessarily during lb
049 0ac1ee9ebfb7 sched/fair: Do not compute NUMA Balancing stats unnecessarily during lb
050 873199d27bb2 sched/core: Prioritize migrating eligible tasks in sched_balance_rq()
051 8061b9f5e111 sched/debug: Change need_resched warnings to pr_err
052 2cf9ac40073d sched/fair: Encapsulate set custom slice in a __setparam_fair() function
053 5d808c78d972 sched: Fix race between yield_to() and try_to_wake_up()
054 66951e4860d3 sched/fair: Fix update_cfs_group() vs DELAY_DEQUEUE
055 f65c64f311ee delayacct: add delay min to record delay peak
056 658eb5ab916d delayacct: add delay max to record delay peak
057 6d71a9c61604 sched/fair: Fix EEVDF entity placement bug causing scheduling lag
058 b04e317b5226 treewide: Introduce kthread_run_worker[_on_cpu]()
059 3a5446612a3f sched,arm64: Handle CPU isolation on last resort fallback rq selection
060 7c8cd569ff66 docs: Update Schedstat version to 17
061 011b3a14dc66 sched/stats: Print domain name in /proc/schedstat
062 1c055a0f5d3b sched: Move sched domain name out of CONFIG_SCHED_DEBUG
063 3b2a793ea70f sched: Report the different kinds of imbalances in /proc/schedstat
064 c3856c9ce6b8 sched/fair: Cleanup in migrate_degrades_locality() to improve readability
065 a430d99e3490 sched/fair: Fix value reported by hot tasks pulled in /proc/schedstat
066 ee8118c1f186 sched/fair: Update comments after sched_tick() rename.
067 ebeeee390b6a PM: EM: Move sched domains rebuild function from schedutil to EM
068 8e461a1cb43d cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
069 af98d8a36a96 sched/fair: Fix CPU bandwidth limit bypass during CPU hotplug
070 c7f7e9c73178 sched/dlserver: Fix dlserver time accounting
071 b53127db1dbf sched/dlserver: Fix dlserver double enqueue
072 7675361ff9a1 sched: deadline: Cleanup goto label in pick_earliest_pushable_dl_task
073 2a77e4be12cb sched/fair: Untangle NEXT_BUDDY and pick_next_task()
074 95d9fed3a2ae sched/fair: Mark m*_vruntime() with __maybe_unused
075 0429489e0928 sched/fair: Fix variable declaration position
076 61b82dfb6b7e sched/fair: Do not try to migrate delayed dequeue task
077 736c55a02c47 sched/fair: Rename cfs_rq.nr_running into nr_queued
078 43eef7c3a4a6 sched/fair: Remove unused cfs_rq.idle_nr_running
079 31898e7b87dd sched/fair: Rename cfs_rq.idle_h_nr_running into h_nr_idle
080 9216582b0bfb sched/fair: Removed unsued cfs_rq.h_nr_delayed
	average rps: 1988000.78
	average rps: 1928511.27

081 1a49104496d3 sched/fair: Use the new cfs_rq.h_nr_runnable
082 c2a295bffeaf sched/fair: Add new cfs_rq.h_nr_runnable
083 7b8a702d9438 sched/fair: Rename h_nr_running into h_nr_queued
084 76f2f783294d sched/eevdf: More PELT vs DELAYED_DEQUEUE
085 c1f43c342e1f sched/fair: Fix sched_can_stop_tick() for fair tasks
086 493afbd187c4 sched/fair: Fix NEXT_BUDDY
087 5f1b64e9a9b7 sched/numa: fix memory leak due to the overwritten vma->numab_state
088 c907cd44a108 sched: Unify HK_TYPE_{TIMER|TICK|MISC} to HK_TYPE_KERNEL_NOISE
089 6010d245ddc9 sched/isolation: Consolidate housekeeping cpumasks that are always identical
090 1174b9344bc7 sched/isolation: Make "isolcpus=nohz" equivalent to "nohz_full"
091 ae5c677729e9 sched/core: Remove HK_TYPE_SCHED
092 a76328d44c7a sched/fair: Remove CONFIG_CFS_BANDWIDTH=n definition of cfs_bandwidth_used()
093 3a181f20fb4e sched/deadline: Consolidate Timer Cancellation
094 53916d5fd3c0 sched/deadline: Check bandwidth overflow earlier for hotplug
095 d4742f6ed7ea sched/deadline: Correctly account for allocated bandwidth during hotplug
096 41d4200b7103 sched/deadline: Restore dl_server bandwidth on non-destructive root domain changes
097 59297e2093ce sched: add READ_ONCE to task_on_rq_queued
098 108ad0999085 sched: Don't try to catch up excess steal time.
099 0664e2c311b9 sched/deadline: Fix warning in migrate_enable for boosted tasks
100 e932c4ab38f0 sched/core: Prevent wakeup of ksoftirqd during idle load balance
101 ff47a0acfcce sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy
102 ea9cffc0a154 sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()
103 70ee7947a290 sched: fix warning in sched_setaffinity
104 22368fe1f9bb sched/deadline: Fix replenish_dl_new_period dl_server condition
105 70d8b6485b0b sched/cpufreq: Ensure sd is rebuilt for EAS check
106 46d076af6d64 sched/idle: Switch to use hrtimer_setup_on_stack()
107 35772d627b55 sched: Enable PREEMPT_DYNAMIC for PREEMPT_RT
108 7c70cb94d29c sched: Add Lazy preemption model
109 26baa1f1c4bd sched: Add TIF_NEED_RESCHED_LAZY infrastructure
110 0f0d1b8e5010 sched/ext: Remove sched_fork() hack
111 b23decf8ac91 sched: Initialize idle tasks only once
112 69d5e722be94 sched/ext: Fix scx vs sched_delayed
113 5db91545ef81 sched: Pass correct scheduling policy to __setscheduler_class
114 1a6151017ee5 sched: psi: pass enqueue/dequeue flags to psi callbacks directly
115 9c70b2a33cd2 sched/numa: Fix the potential null pointer dereference in task_numa_work()
116 23f1178ad706 sched/uclamp: Fix unnused variable warning
117 0e7ffff1b811 scx: Fix raciness in scx_ops_bypass()
118 b55945c500c5 sched: Fix pick_next_task_fair() vs try_to_wake_up() race
119 112cca098a70 sched_getattr: port to copy_struct_to_user
120 af0c8b2bf67b sched: Split scheduler and execution contexts
	average rps: 2067733.00
	average rps: 1949134.92

121 7b3d61f6578a sched: Split out __schedule() deactivate task logic into a helper
122 18adad1dac33 sched: Consolidate pick_*_task to task_is_pushable helper
123 2b05a0b4c08f sched: Add move_queued_task_locked helper
124 7e019dcc470f sched: Improve cache locality of RSEQ concurrency IDs for intermittent workloads
125 8e113df990c9 sched: idle: Optimize the generic idle loop by removing needless memory barrier
126 cd9626e9ebc7 sched/fair: Fix external p->on_rq users
127 c6508124193d sched/psi: Fix mistaken CPU pressure indication after corrupted task state bug
128 f5aaff7bfa11 sched/core: Dequeue PSI signals for blocked tasks that are delayed
129 98442f0ccd82 sched: Fix delayed_dequeue vs switched_from_fair()
130 73ab05aa46b0 sched/core: Disable page allocation in task_tick_mm_cid()
131 d16b7eb6f523 sched/deadline: Use hrtick_enabled_dl() before start_hrtick_dl()
132 f207dc2dcdcf sched/core: Add ENQUEUE_RQ_SELECTED to indicate whether ->select_task_rq() was called
133 b62933eee41e sched/core: Make select_task_rq() take the pointer to wake_flags instead of value
134 0ac8f14ef22a sched/wait: Remove unused bit_wait_io_timeout
135 b15148ce21c1 sched/fair: fix the comment for PREEMPT_SHORT
136 4423af84b297 sched/fair: optimize the PLACE_LAG when se->vlag is zero
137 e31488c9df27 sched/fair: remove the DOUBLE_TICK feature
138 bf39882edc79 sched: Document wait_var_event() family of functions and wake_up_var()
139 3cdee6b359f1 sched: Improve documentation for wake_up_bit/wait_on_bit family of functions
140 2382d68d7d43 sched: change wake_up_bit() and related function to expect unsigned long *
	average rps: 1979616.95
	average rps: 2001639.92

141 3840cbe24cf0 sched: psi: fix bogus pressure spikes from aggregation race
142 d4ac164bde7a sched/eevdf: Fix wakeup-preempt by checking cfs_rq->nr_running
143 9b5ce1a37e90 sched: Fix sched_delayed vs cfs_bandwidth
144 161853a78bb2 sched/ext: Use tg_cgroup() to elieminate duplicate code
145 e418cd2b80f5 sched/ext: Fix unmatch trailing comment of CONFIG_EXT_GROUP_SCHED
146 7ebd84d627e4 sched: Put task_group::idle under CONFIG_GROUP_SCHED_WEIGHT
147 bdeb868c0ddf sched: Add dummy version of sched_group_set_idle()
148 902d67a2d40f sched: Move update_other_load_avgs() to kernel/sched/pelt.c
149 bc9057da1a22 sched/cpufreq: Use NSEC_PER_MSEC for deadline task
150 2cab4bd024d2 sched/debug: Fix the runnable tasks output
	average rps: 1964020.73
	average rps: 2164525.02
	average rps: 1948710.93

151 c662e2b1e8cf sched: Fix sched_delayed vs sched_core
152 729288bc6856 kernel/sched: Fix util_est accounting for DELAY_DEQUEUE
	average rps: 1936829.47
	average rps: 1950715.10

153 84d265281d6c sched/pelt: Use rq_clock_task() for hw_pressure
	average rps: 2176857.32
	average rps: 2223004.23

154 5d871a63997f sched/fair: Move effective_cpu_util() and effective_cpu_util() in fair.c
155 3dcac251b066 sched/core: Introduce SM_IDLE and an idle re-entry fast-path in __schedule()
	average rps: 2187538.05
	average rps: 2166339.93

156 e179e80c5d4f sched: Introduce CONFIG_GROUP_SCHED_WEIGHT
157 41082c1d1d2b sched: Make cpu_shares_read_u64() use tg_weight()
158 859dc4ec5a43 sched: Expose css_tg()
159 b2d70222dbf2 sched: Add put_prev_task(.next)
160 bd9bbc96e835 sched: Rework dl_server
161 436f3eed5c69 sched: Combine the last put_prev_task() and the first set_next_task()
	average rps: 2179736.88
	average rps: 2141045.32
	average rps: 2188505.50

162 fd03c5b85855 sched: Rework pick_next_task()
163 260598f142c3 sched: Split up put_prev_task_balance()
164 4686cc598f66 sched: Clean up DL server vs core sched
165 dae4320b29f0 sched: Fixup set_next_task() implementations
166 7d2180d9d943 sched: Use set_next_task(.first) where required
167 75b6499024a6 sched/fair: Properly deactivate sched_delayed task upon class change
168 9c602adb799e sched/deadline: Fix schedstats vs deadline servers
	average rps: 2006393.02
	average rps: 2214295.33
	average rps: 2217932.42

169 aef6987d8954 sched/eevdf: Propagate min_slice up the cgroup hierarchy
170 857b158dc5e8 sched/eevdf: Use sched_attr::sched_runtime to set request/slice suggestion
171 85e511df3cec sched/eevdf: Allow shorter slices to wakeup-preempt
	average rps: 2002835.95
	average rps: 2199140.30
	average rps: 2174758.77

172 82e9d0456e06 sched/fair: Avoid re-setting virtual deadline on 'migrations'
	average rps: 2011212.10
	average rps: 2160537.57

173 fc1892becd56 sched/eevdf: Fixup PELT vs DELAYED_DEQUEUE
	average rps: 2014455.98
	average rps: 2207044.23
	average rps: 2235079.32

174 54a58a787791 sched/fair: Implement DELAY_ZERO
	average rps: 2231845.500
	average rps: 2195502.80
	average rps: 2192547.32
