Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE1195
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903731; cv=none; b=RD3eHeA+sqhOl+HosqD76XvAczYKy1NviIKzUE/J/qj4ypDjJbOH+eoP2v22dPN2lkgxHU2XVYsoGRBd8e2qj3kafx0zvvZ3rI1X9BNrJ9o7XIlfpRbl7oTlFSWKtLMO4i9C3TSR+pOG5G0CXvr5Sf+OWU8+GCFXvHoFZjJuNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903731; c=relaxed/simple;
	bh=6qTKaYVBQrIy4x7rM1gw6NKsheCI43wbta48UiSzp5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7KcIMWJjZzqa9xtjh6SKACOX7oq1jWt3edOqcA3TKCWVNRYPULyxrM0o4AeAAiRsXDJraj+a9in3UjsN3JiZ4Dm42HSgFVV/PvNct0CN/WaqFP8XpHowZGGVfLOXZ2GWYmvr/ruOMd1hZRPPBoztIp0OTA80J+cVzYn4hQtpGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l9gJDYzT; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l9gJDYzT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c+xkE1wIT4X0Rv5rxRBt7ncg6gcoAePeMkqXebz5NzM=; b=l9gJDYzTaplIcOPhKEFRaU7Xrg
	22IU6SY8Nni1rnOc5M7YGE9iWASV6ueRxdkX9+TVIlvOo1MkVYrr5iYWxkblLqH6/7HMCBwNd0FPX
	gE1VKhRyDVg78ZJqw929LSE5zSCW8qcD7W9U9mAWSL9qBUWHfKIkV908SNDJzIxN5836N2R6qrjlW
	u3+D6J615ODCvp6VQlRxtpa/dFCpt2A2pijgWU0Xru8Y2Ds6iKSJc6bxPyyxyTQYm/kD7/QCRGoOt
	jpIyIDu74SVImgeUYxtT+E+zAObIQ57af8F92FGED0ebFspMbdo1sDtptcIDShRMVyHQ7v7zhqygw
	RTbrQ6fQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1bY-00000005qzn-2YfV;
	Thu, 22 May 2025 08:48:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2C12330035E; Thu, 22 May 2025 10:48:44 +0200 (CEST)
Date: Thu, 22 May 2025 10:48:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
	Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, hannes@cmpxchg.org
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250522084844.GC31726@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
 <20250521145447.GA31726@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521145447.GA31726@noisy.programming.kicks-ass.net>

On Wed, May 21, 2025 at 04:54:47PM +0200, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 09:38:31PM +0200, Peter Zijlstra wrote:
> > On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
> > 
> > > 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> > > 
> > > With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
> > > 4 times per task switch in my setup) in:
> > > 
> > > __schedule() -> psi_sched_switch() -> psi_task_switch() ->
> > > psi_group_change().
> > > 
> > > There seems to be another/other v6.12 related patch(es) later which
> > > cause(s) another 4% regression I yet have to discover.
> > 
> > Urgh, let me add this to the pile to look at. Thanks!
> 
> Does something like the compile tested only hackery below work?

possibly better hackery :-)

---
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 1396674fa722..8fb9d28f2bc8 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -136,6 +136,10 @@
  * cost-wise, yet way more sensitive and accurate than periodic
  * sampling of the aggregate task states would be.
  */
+#include <linux/sched/clock.h>
+#include <linux/workqueue.h>
+#include <linux/psi.h>
+#include "sched.h"
 
 static int psi_bug __read_mostly;
 
@@ -172,6 +176,30 @@ struct psi_group psi_system = {
 	.pcpu = &system_group_pcpu,
 };
 
+static inline void psi_write_begin(int cpu)
+{
+	struct psi_group_cpu *groupc = per_cpu_ptr(&system_group_pcpu, cpu);
+	write_seqcount_begin(&groupc->seq);
+}
+
+static inline void psi_write_end(int cpu)
+{
+	struct psi_group_cpu *groupc = per_cpu_ptr(&system_group_pcpu, cpu);
+	write_seqcount_end(&groupc->seq);
+}
+
+static inline u32 psi_read_begin(int cpu)
+{
+	struct psi_group_cpu *groupc = per_cpu_ptr(&system_group_pcpu, cpu);
+	return read_seqcount_begin(&groupc->seq);
+}
+
+static inline bool psi_read_retry(int cpu, u32 seq)
+{
+	struct psi_group_cpu *groupc = per_cpu_ptr(&system_group_pcpu, cpu);
+	return read_seqcount_retry(&groupc->seq, seq);
+}
+
 static void psi_avgs_work(struct work_struct *work);
 
 static void poll_timer_fn(struct timer_list *t);
@@ -262,14 +290,14 @@ static void get_recent_times(struct psi_group *group, int cpu,
 
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
@@ -768,30 +796,20 @@ static void record_times(struct psi_group_cpu *groupc, u64 now)
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
 
-	/*
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
 	/*
 	 * Start with TSK_ONCPU, which doesn't have a corresponding
 	 * task count - it's just a boolean flag directly encoded in
@@ -843,7 +861,6 @@ static void psi_group_change(struct psi_group *group, int cpu,
 
 		groupc->state_mask = state_mask;
 
-		write_seqcount_end(&groupc->seq);
 		return;
 	}
 
@@ -864,8 +881,6 @@ static void psi_group_change(struct psi_group *group, int cpu,
 
 	groupc->state_mask = state_mask;
 
-	write_seqcount_end(&groupc->seq);
-
 	if (state_mask & group->rtpoll_states)
 		psi_schedule_rtpoll_work(group, 1, false);
 
@@ -900,24 +915,29 @@ static void psi_flags_change(struct task_struct *task, int clear, int set)
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
@@ -926,16 +946,15 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
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
@@ -968,12 +987,11 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 
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
@@ -983,20 +1001,21 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
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
@@ -1005,8 +1024,7 @@ void psi_account_irqtime(struct rq *rq, struct task_struct *curr, struct task_st
 		return;
 
 	lockdep_assert_rq_held(rq);
-	group = task_psi_group(curr);
-	if (prev && task_psi_group(prev) == group)
+	if (prev && task_psi_group(prev) == task_psi_group(curr))
 		return;
 
 	irq = irq_time_read(cpu);
@@ -1015,25 +1033,22 @@ void psi_account_irqtime(struct rq *rq, struct task_struct *curr, struct task_st
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
 #endif
 
@@ -1221,12 +1236,14 @@ void psi_cgroup_restart(struct psi_group *group)
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
