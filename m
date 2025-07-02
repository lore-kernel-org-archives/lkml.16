Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6A26D4D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458375; cv=none; b=ehkgB0eGSNT7BVEqpwiPuEiYQOUtZwiddn23a6eO2ziGjZoWE0pqJT+JIypCyrJ8ao0fR/iYyxVhwiuFTutM5yMYYD4YBdvRKXkTsGubWn5F0sQ82t4bEu9VNPHcJk9WT078KPYCAdwCu9c4OrEt6+cPhAKOnJ3YSvoXFyA3mZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458375; c=relaxed/simple;
	bh=iL6Xr1UbCXh9U0OUHMk9e+4p13YuWktvg/N7dx6E8m4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=n8/bivDAlqwdoko7ztYnpSHia/pitjDtbXEUGoRDlLXfpDLZLuCJhGCHlK8UKjdBhQ3d66U0XEvqW3ts40Eul3wZKSJBVqjT8reli1nIkaDXFsCkdECZZeM+ed6TGDWowgopyuPJk5H4FU/38KMkbwvUtIVFMjpoN0IlWQisJO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q0kmm7Bg; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q0kmm7Bg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=yzkICH1Op6XVW/c3NAJn8TeKEXZpkhzNFaNncVS++/g=; b=q0kmm7Bg88UaLh8NWPNQ8zWvbp
	cgYmOkKGzQAy81ZzkHhRbjyNTVios3ws5XyHfi43RAm98woFFDE2EhQ3Y3ghkdsZE0n0ODN7LiHcp
	kSudck+hwA8l7YCgdbpru0jaeq38FAvsB2FUDnurIrhYCx9m6hqmBZsncM7oDQO3Cha2NRBUB2ret
	QZuH2ZZRE2GCosz2HBskNc3HnjCtip8pXG/4hpOvrU8XUWEcRmtW9XDux6Of77DB1nt+jKSPfmdak
	hKGG9DJN2E+6ijiftaqsaPdiZjnLjb4lOgv5xlH8eT72h9o7VpCqEqmPByKWX/Mb9nQ4+u1EQdk9H
	DuVpcmRA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000007Lo8-0okn;
	Wed, 02 Jul 2025 12:12:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BAABF30012D; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121158.350561696@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@redhat.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 clm@meta.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH v2 01/12] sched/psi: Optimize psi_group_change() cpu_clock() usage
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Dietmar reported that commit 3840cbe24cf0 ("sched: psi: fix bogus
pressure spikes from aggregation race") caused a regression for him on
a high context switch rate benchmark (schbench) due to the now
repeating cpu_clock() calls.

In particular the problem is that get_recent_times() will extrapolate
the current state to 'now'. But if an update uses a timestamp from
before the start of the update, it is possible to get two reads
with inconsistent results. It is effectively back-dating an update.

(note that this all hard-relies on the clock being synchronized across
CPUs -- if this is not the case, all bets are off).

Combine this problem with the fact that there are per-group-per-cpu
seqcounts, the commit in question pushed the clock read into the group
iteration, causing tree-depth cpu_clock() calls. On architectures
where cpu_clock() has appreciable overhead, this hurts.

Instead move to a per-cpu seqcount, which allows us to have a single
clock read for all group updates, increasing internal consistency and
lowering update overhead. This comes at the cost of a longer update
side (proportional to the tree depth) which can cause the read side to
retry more often.

Fixes: 3840cbe24cf0 ("sched: psi: fix bogus pressure spikes from aggregation race")
Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>,
Link: https://lkml.kernel.org/20250522084844.GC31726@noisy.programming.kicks-ass.net
---
 include/linux/psi_types.h |    6 --
 kernel/sched/psi.c        |  121 +++++++++++++++++++++++++---------------------
 2 files changed, 68 insertions(+), 59 deletions(-)

--- a/include/linux/psi_types.h
+++ b/include/linux/psi_types.h
@@ -84,11 +84,9 @@ enum psi_aggregators {
 struct psi_group_cpu {
 	/* 1st cacheline updated by the scheduler */
 
-	/* Aggregator needs to know of concurrent changes */
-	seqcount_t seq ____cacheline_aligned_in_smp;
-
 	/* States of the tasks belonging to this group */
-	unsigned int tasks[NR_PSI_TASK_COUNTS];
+	unsigned int tasks[NR_PSI_TASK_COUNTS]
+			____cacheline_aligned_in_smp;
 
 	/* Aggregate pressure state derived from the tasks */
 	u32 state_mask;
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -176,6 +176,28 @@ struct psi_group psi_system = {
 	.pcpu = &system_group_pcpu,
 };
 
+static DEFINE_PER_CPU(seqcount_t, psi_seq);
+
+static inline void psi_write_begin(int cpu)
+{
+	write_seqcount_begin(per_cpu_ptr(&psi_seq, cpu));
+}
+
+static inline void psi_write_end(int cpu)
+{
+	write_seqcount_end(per_cpu_ptr(&psi_seq, cpu));
+}
+
+static inline u32 psi_read_begin(int cpu)
+{
+	return read_seqcount_begin(per_cpu_ptr(&psi_seq, cpu));
+}
+
+static inline bool psi_read_retry(int cpu, u32 seq)
+{
+	return read_seqcount_retry(per_cpu_ptr(&psi_seq, cpu), seq);
+}
+
 static void psi_avgs_work(struct work_struct *work);
 
 static void poll_timer_fn(struct timer_list *t);
@@ -186,7 +208,7 @@ static void group_init(struct psi_group
 
 	group->enabled = true;
 	for_each_possible_cpu(cpu)
-		seqcount_init(&per_cpu_ptr(group->pcpu, cpu)->seq);
+		seqcount_init(per_cpu_ptr(&psi_seq, cpu));
 	group->avg_last_update = sched_clock();
 	group->avg_next_update = group->avg_last_update + psi_period;
 	mutex_init(&group->avgs_lock);
@@ -266,14 +288,14 @@ static void get_recent_times(struct psi_
 
 	/* Snapshot a coherent view of the CPU state */
 	do {
-		seq = read_seqcount_begin(&groupc->seq);
+		seq = psi_read_begin(cpu);
 		now = cpu_clock(cpu);
 		memcpy(times, groupc->times, sizeof(groupc->times));
 		state_mask = groupc->state_mask;
 		state_start = groupc->state_start;
 		if (cpu == current_cpu)
 			memcpy(tasks, groupc->tasks, sizeof(groupc->tasks));
-	} while (read_seqcount_retry(&groupc->seq, seq));
+	} while (psi_read_retry(cpu, seq));
 
 	/* Calculate state time deltas against the previous snapshot */
 	for (s = 0; s < NR_PSI_STATES; s++) {
@@ -772,31 +794,21 @@ static void record_times(struct psi_grou
 		groupc->times[PSI_NONIDLE] += delta;
 }
 
+#define for_each_group(iter, group) \
+	for (typeof(group) iter = group; iter; iter = iter->parent)
+
 static void psi_group_change(struct psi_group *group, int cpu,
 			     unsigned int clear, unsigned int set,
-			     bool wake_clock)
+			     u64 now, bool wake_clock)
 {
 	struct psi_group_cpu *groupc;
 	unsigned int t, m;
 	u32 state_mask;
-	u64 now;
 
 	lockdep_assert_rq_held(cpu_rq(cpu));
 	groupc = per_cpu_ptr(group->pcpu, cpu);
 
 	/*
-	 * First we update the task counts according to the state
-	 * change requested through the @clear and @set bits.
-	 *
-	 * Then if the cgroup PSI stats accounting enabled, we
-	 * assess the aggregate resource states this CPU's tasks
-	 * have been in since the last change, and account any
-	 * SOME and FULL time these may have resulted in.
-	 */
-	write_seqcount_begin(&groupc->seq);
-	now = cpu_clock(cpu);
-
-	/*
 	 * Start with TSK_ONCPU, which doesn't have a corresponding
 	 * task count - it's just a boolean flag directly encoded in
 	 * the state mask. Clear, set, or carry the current state if
@@ -847,7 +859,6 @@ static void psi_group_change(struct psi_
 
 		groupc->state_mask = state_mask;
 
-		write_seqcount_end(&groupc->seq);
 		return;
 	}
 
@@ -868,8 +879,6 @@ static void psi_group_change(struct psi_
 
 	groupc->state_mask = state_mask;
 
-	write_seqcount_end(&groupc->seq);
-
 	if (state_mask & group->rtpoll_states)
 		psi_schedule_rtpoll_work(group, 1, false);
 
@@ -904,24 +913,29 @@ static void psi_flags_change(struct task
 void psi_task_change(struct task_struct *task, int clear, int set)
 {
 	int cpu = task_cpu(task);
-	struct psi_group *group;
+	u64 now;
 
 	if (!task->pid)
 		return;
 
 	psi_flags_change(task, clear, set);
 
-	group = task_psi_group(task);
-	do {
-		psi_group_change(group, cpu, clear, set, true);
-	} while ((group = group->parent));
+	psi_write_begin(cpu);
+	now = cpu_clock(cpu);
+	for_each_group(group, task_psi_group(task))
+		psi_group_change(group, cpu, clear, set, now, true);
+	psi_write_end(cpu);
 }
 
 void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		     bool sleep)
 {
-	struct psi_group *group, *common = NULL;
+	struct psi_group *common = NULL;
 	int cpu = task_cpu(prev);
+	u64 now;
+
+	psi_write_begin(cpu);
+	now = cpu_clock(cpu);
 
 	if (next->pid) {
 		psi_flags_change(next, 0, TSK_ONCPU);
@@ -930,16 +944,15 @@ void psi_task_switch(struct task_struct
 		 * ancestors with @prev, those will already have @prev's
 		 * TSK_ONCPU bit set, and we can stop the iteration there.
 		 */
-		group = task_psi_group(next);
-		do {
-			if (per_cpu_ptr(group->pcpu, cpu)->state_mask &
-			    PSI_ONCPU) {
+		for_each_group(group, task_psi_group(next)) {
+			struct psi_group_cpu *groupc = per_cpu_ptr(group->pcpu, cpu);
+
+			if (groupc->state_mask & PSI_ONCPU) {
 				common = group;
 				break;
 			}
-
-			psi_group_change(group, cpu, 0, TSK_ONCPU, true);
-		} while ((group = group->parent));
+			psi_group_change(group, cpu, 0, TSK_ONCPU, now, true);
+		}
 	}
 
 	if (prev->pid) {
@@ -972,12 +985,11 @@ void psi_task_switch(struct task_struct
 
 		psi_flags_change(prev, clear, set);
 
-		group = task_psi_group(prev);
-		do {
+		for_each_group(group, task_psi_group(prev)) {
 			if (group == common)
 				break;
-			psi_group_change(group, cpu, clear, set, wake_clock);
-		} while ((group = group->parent));
+			psi_group_change(group, cpu, clear, set, now, wake_clock);
+		}
 
 		/*
 		 * TSK_ONCPU is handled up to the common ancestor. If there are
@@ -987,20 +999,21 @@ void psi_task_switch(struct task_struct
 		 */
 		if ((prev->psi_flags ^ next->psi_flags) & ~TSK_ONCPU) {
 			clear &= ~TSK_ONCPU;
-			for (; group; group = group->parent)
-				psi_group_change(group, cpu, clear, set, wake_clock);
+			for_each_group(group, common)
+				psi_group_change(group, cpu, clear, set, now, wake_clock);
 		}
 	}
+	psi_write_end(cpu);
 }
 
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING
 void psi_account_irqtime(struct rq *rq, struct task_struct *curr, struct task_struct *prev)
 {
 	int cpu = task_cpu(curr);
-	struct psi_group *group;
 	struct psi_group_cpu *groupc;
 	s64 delta;
 	u64 irq;
+	u64 now;
 
 	if (static_branch_likely(&psi_disabled) || !irqtime_enabled())
 		return;
@@ -1009,8 +1022,7 @@ void psi_account_irqtime(struct rq *rq,
 		return;
 
 	lockdep_assert_rq_held(rq);
-	group = task_psi_group(curr);
-	if (prev && task_psi_group(prev) == group)
+	if (prev && task_psi_group(prev) == task_psi_group(curr))
 		return;
 
 	irq = irq_time_read(cpu);
@@ -1019,25 +1031,22 @@ void psi_account_irqtime(struct rq *rq,
 		return;
 	rq->psi_irq_time = irq;
 
-	do {
-		u64 now;
+	psi_write_begin(cpu);
+	now = cpu_clock(cpu);
 
+	for_each_group(group, task_psi_group(curr)) {
 		if (!group->enabled)
 			continue;
 
 		groupc = per_cpu_ptr(group->pcpu, cpu);
 
-		write_seqcount_begin(&groupc->seq);
-		now = cpu_clock(cpu);
-
 		record_times(groupc, now);
 		groupc->times[PSI_IRQ_FULL] += delta;
 
-		write_seqcount_end(&groupc->seq);
-
 		if (group->rtpoll_states & (1 << PSI_IRQ_FULL))
 			psi_schedule_rtpoll_work(group, 1, false);
-	} while ((group = group->parent));
+	}
+	psi_write_end(cpu);
 }
 #endif /* CONFIG_IRQ_TIME_ACCOUNTING */
 
@@ -1225,12 +1234,14 @@ void psi_cgroup_restart(struct psi_group
 		return;
 
 	for_each_possible_cpu(cpu) {
-		struct rq *rq = cpu_rq(cpu);
-		struct rq_flags rf;
+		u64 now;
 
-		rq_lock_irq(rq, &rf);
-		psi_group_change(group, cpu, 0, 0, true);
-		rq_unlock_irq(rq, &rf);
+		guard(rq_lock_irq)(cpu_rq(cpu));
+
+		psi_write_begin(cpu);
+		now = cpu_clock(cpu);
+		psi_group_change(group, cpu, 0, 0, now, true);
+		psi_write_end(cpu);
 	}
 }
 #endif /* CONFIG_CGROUPS */


