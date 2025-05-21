Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80561EA7E4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839298; cv=none; b=LYZJqzWeEE7YFj5VEq7nD5HkF9gRZg2hbXKrFom150Q6w/n4N3/TMUkTLSjGVw5od0KBEjHgOwTd3aMzzcWH+4RKkemnjfklMpGn4LaJEm6+NjGF3BaY3OPf4+B4f+NxgZzF4BIYw21rYuZryjwI2vjGKjhurK+C8wc+AJwMBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839298; c=relaxed/simple;
	bh=01/B6XCblE3Kg/i9Zv84LZr6rGm5jgmGfYIKIuhfqpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj75k1R6nz4EvN52q19ImXOFJImOIIKEqnMIz6YMw4GQgtL23QgW5ZemucHPUMkqtQZZkdhtmLF1qsh/iRVbECxdOE73Tq5nFg9xmR+f3ihCcm00SGppzWDbFcugJEpRYEApuUFj2BxKPWgaoAQrugkMjRPkTINQG5R0kKI5ybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NAs6WyQn; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NAs6WyQn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5l7pgVz0D7ITocIxY3cHjWiYhQ/agl5Vzf3/Sy5sqhE=; b=NAs6WyQnL+TyjLnOA3/eZkzGyF
	TzfCRYF5jwAp32ob5RT51GYuo6Q7XuqrP9Fvh6mRIAatrdSFupHepn+dN6uAb0a1F/KXbHEHo7R3z
	jThCDaXSizknncJysdeUHOQRosN/bSucJ1x8nvADN1odM/rASNNNIUZWbzw+tim+utEEy43K1D1H2
	vcPMoYTvwqSQdW685cWK9Q85VYwn7r6UIF4sBa8maafeDqmHkPDogd2G12C7wAiS7MBYNM2aE9MOD
	kVrx0XvIAQ7tyjVYazM2C5D8LRm74WhIEvjFoUUU8to4fHnJQ6X59YH2KjLH4PSyo6qw/uStSCRkW
	lST08SbA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHkqG-00000000whl-00we;
	Wed, 21 May 2025 14:54:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 57EB6300583; Wed, 21 May 2025 16:54:47 +0200 (CEST)
Date: Wed, 21 May 2025 16:54:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
	Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, hannes@cmpxchg.org
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250521145447.GA31726@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520193831.GB39944@noisy.programming.kicks-ass.net>

On Tue, May 20, 2025 at 09:38:31PM +0200, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
> 
> > 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> > 
> > With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
> > 4 times per task switch in my setup) in:
> > 
> > __schedule() -> psi_sched_switch() -> psi_task_switch() ->
> > psi_group_change().
> > 
> > There seems to be another/other v6.12 related patch(es) later which
> > cause(s) another 4% regression I yet have to discover.
> 
> Urgh, let me add this to the pile to look at. Thanks!

Does something like the compile tested only hackery below work?

---
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 1396674fa722..98c50bd4ce76 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -768,30 +768,20 @@ static void record_times(struct psi_group_cpu *groupc, u64 now)
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
@@ -843,7 +833,6 @@ static void psi_group_change(struct psi_group *group, int cpu,
 
 		groupc->state_mask = state_mask;
 
-		write_seqcount_end(&groupc->seq);
 		return;
 	}
 
@@ -864,8 +853,6 @@ static void psi_group_change(struct psi_group *group, int cpu,
 
 	groupc->state_mask = state_mask;
 
-	write_seqcount_end(&groupc->seq);
-
 	if (state_mask & group->rtpoll_states)
 		psi_schedule_rtpoll_work(group, 1, false);
 
@@ -901,6 +888,7 @@ void psi_task_change(struct task_struct *task, int clear, int set)
 {
 	int cpu = task_cpu(task);
 	struct psi_group *group;
+	u64 now;
 
 	if (!task->pid)
 		return;
@@ -908,16 +896,31 @@ void psi_task_change(struct task_struct *task, int clear, int set)
 	psi_flags_change(task, clear, set);
 
 	group = task_psi_group(task);
-	do {
-		psi_group_change(group, cpu, clear, set, true);
-	} while ((group = group->parent));
+
+	for_each_group(tmp, group)
+		raw_write_seqcount_begin(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+
+	now = cpu_clock(cpu);
+
+	for_each_group(tmp, group) {
+		psi_group_change(tmp, cpu, clear, set, now, true);
+		raw_write_seqcount_end(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+	}
 }
 
 void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		     bool sleep)
 {
-	struct psi_group *group, *common = NULL;
+	struct psi_group *prev_group = task_psi_group(prev);
+	struct psi_group *next_group = task_psi_group(next);
+	struct psi_group *common = NULL;
 	int cpu = task_cpu(prev);
+	u64 now;
+
+	if (prev->pid) {
+		for_each_group(tmp, prev_group)
+			raw_write_seqcount_begin(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+	}
 
 	if (next->pid) {
 		psi_flags_change(next, 0, TSK_ONCPU);
@@ -926,16 +929,27 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		 * ancestors with @prev, those will already have @prev's
 		 * TSK_ONCPU bit set, and we can stop the iteration there.
 		 */
-		group = task_psi_group(next);
-		do {
-			if (per_cpu_ptr(group->pcpu, cpu)->state_mask &
-			    PSI_ONCPU) {
-				common = group;
+
+		for_each_group(tmp, next_group) {
+			struct psi_group_cpu *groupc = per_cpu_ptr(tmp->pcpu, cpu);
+
+			if (groupc->state_mask & PSI_ONCPU) {
+				common = tmp;
 				break;
 			}
+			raw_write_seqcount_begin(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+		}
+	}
+
+	now = cpu_clock(cpu);
 
-			psi_group_change(group, cpu, 0, TSK_ONCPU, true);
-		} while ((group = group->parent));
+	if (next->pid) {
+		for_each_group(tmp, next_group) {
+			if (tmp == common)
+				break;
+			psi_group_change(tmp, cpu, 0, TSK_ONCPU, now, true);
+			raw_write_seqcount_end(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+		}
 	}
 
 	if (prev->pid) {
@@ -968,12 +982,12 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 
 		psi_flags_change(prev, clear, set);
 
-		group = task_psi_group(prev);
-		do {
-			if (group == common)
+		for_each_group(tmp, prev_group) {
+			if (tmp == common)
 				break;
-			psi_group_change(group, cpu, clear, set, wake_clock);
-		} while ((group = group->parent));
+			psi_group_change(tmp, cpu, clear, set, now, wake_clock);
+			raw_write_seqcount_end(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+		}
 
 		/*
 		 * TSK_ONCPU is handled up to the common ancestor. If there are
@@ -983,8 +997,10 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
 		 */
 		if ((prev->psi_flags ^ next->psi_flags) & ~TSK_ONCPU) {
 			clear &= ~TSK_ONCPU;
-			for (; group; group = group->parent)
-				psi_group_change(group, cpu, clear, set, wake_clock);
+			for_each_group(tmp, common) {
+				psi_group_change(tmp, cpu, clear, set, now, wake_clock);
+				raw_write_seqcount_end(&per_cpu_ptr(tmp->pcpu, cpu)->seq);
+			}
 		}
 	}
 }
@@ -1221,12 +1237,14 @@ void psi_cgroup_restart(struct psi_group *group)
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
+		raw_write_seqcount_begin(&per_cpu_ptr(group->pcpu, cpu)->seq);
+		now = cpu_clock(cpu);
+		psi_group_change(group, cpu, 0, 0, now, true);
+		raw_write_seqcount_end(&per_cpu_ptr(group->pcpu, cpu)->seq);
 	}
 }
 #endif /* CONFIG_CGROUPS */
