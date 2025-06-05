Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF77205ABA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107673; cv=none; b=sxnJ3kIYLkee+H02E4TaRU/dLZo5fomfvwrjYILOfRxWCRPfQTc/pEpK3HjejsjVp7KNc8wV7P3s9MsRwyMrkfZbv/2qonm7rgCZJ+qr9n4JG5eauBG8mInigvQOrApEb2h6i+t44UyOgPr9eKaxNeMohALgsbZ1QGshCyD5cNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107673; c=relaxed/simple;
	bh=HlDS33kOBGBT4LPfu7vpBEDWwYjNO8ZrN08EzF9IAnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDWd5bOL3LMlccMyu4AHriJyi0yQ+UV9z+QEJgrcVxmxKwq027XgHNgV8EKjIdGsyzps5GIGbgAltBEK8W2yy4JVhAnbq6KIU4E14PsqfJCdHwj56R5u4SKP2W8vAHgkNoY6uCDkIwkvcECbJHm9KVFpw6qMOF0kuEVRtMI/Dto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJnEUn6G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJnEUn6G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450dd065828so4223275e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107669; x=1749712469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIucJawQcNvXGPrYMEIEFQvoe2AQAVhdYJJdukK2UUk=;
        b=UJnEUn6GE0DX2D3uxeUVs3NmpM1yluAg126HEuYiL7ZfZ1mYjELJXt7Yix31U3QF8+
         RN1++LPO7RaP0nk/l2zAne+tNhHOdxOcmHlao0+tUPKJM6qN3H+H3F8whHcZQRDYPu3s
         P93KCgn0l8DqLOit0obNrDNuxAQw0RlzfyGWOA6eJF7Pannr7VCIvQCUP4s7KTo4qfPb
         2bNvYKl4twNyPo2NV+s8wQWEjMVDIF6h+YGKqasWLjHutfLoavZlbPci+yn4k4rgMTGK
         vObNRGtoq9KGTn02OBNKPSd9mo3RyAopi625kKV0bBSrBF3OSfducBO9uWDLVYHQAo1i
         Zkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107669; x=1749712469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIucJawQcNvXGPrYMEIEFQvoe2AQAVhdYJJdukK2UUk=;
        b=eRA/kZnNfE2CThpu02FRrZ0/erGaxYT/rhfv+H820XqDhDiuu+729ptf+XlKN9ZdUA
         GyOIDs6d5hO8xIg9qS7JGoFqtZs7j2hCaCEMfk7K72oecTsSxDcz9kUl1loe0ZZcqKS0
         ttzQre0gtIS6ERA+CnaQG5xzEWC1psx+KSofUU8ulSAJHTZ/0It7cN/9sgCNr8x5M7+0
         L4WJwGHY1h8vbR0zrBsn1p/kIu5mNIxrvIhv0AwX0wgMsHJNAqFZz6VkyYK6dQLi2EFV
         rnKANOMF7sbw/Koo6+KiFiRngxOaW9br7OX5Vfv/LS/KeIQA97/uguZ+JlFS8AlRYXH+
         EA6w==
X-Gm-Message-State: AOJu0YyZf6ab6WyiwmNvn3Lus5juW/vrPkVXVsJz4E1wAx0p7Orqsm1T
	Jz9Ju8Jn1+5u2SU4NgOouJs/M6uuxD4hbQxx4knHGFWQvOaEstmYiVWT
X-Gm-Gg: ASbGnctmXCj0SH6ZUNG45rYh3lbuRpHsUy+MoDSpQwG3exseF4Se+MMC8pdjVo8xcLJ
	yPRhJyRp7/zbUaRSOnp7mJkmrho8PFy7Nqk1z3OPT+etYFogdB2qT2eVTRzYhfk+r8SVFFUm4Il
	sl0mq00qnv+KaLfTdAp7vhc6nki7xS865FsNmEOp3s/2FqoYAB6irpBmjCDg2ngeKikFNd376b2
	tNAd7uE76bXsBv1V2qHo1smWAIk6/sHxezHsVSwNKZsUEWQYBMo830efBev2jQd2tOrfoi9Fvc7
	/qsocLONhQ+MsddwPuFpAmhVsi7fRVhPOmTxQpKjh3LldQrO76BeNySGOlKJCO7vJTaYVAeLNy3
	ZzN4rBFc1dg==
X-Google-Smtp-Source: AGHT+IHppqw7anAAdOJNEQBWhVN9zAEwM3lpZJ6731hs9YWSSkwCDOBMt26c0EbhM6ehcXkH0n3q/A==
X-Received: by 2002:a05:600c:1d1:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-451f50a2953mr28997065e9.28.1749107668757;
        Thu, 05 Jun 2025 00:14:28 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:28 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH 6/9] sched/rt: Remove unused code
Date: Thu,  5 Jun 2025 09:14:09 +0200
Message-ID: <20250605071412.139240-7-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605071412.139240-1-yurand2000@gmail.com>
References: <20250605071412.139240-1-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: luca abeni <luca.abeni@santannapisa.it>

Remove the old RT_GROUP_SCHED code, as it is not used anymore.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 include/linux/sched.h   |   4 -
 kernel/sched/core.c     |   1 -
 kernel/sched/deadline.c |  34 --
 kernel/sched/debug.c    |   6 -
 kernel/sched/rt.c       | 698 +---------------------------------------
 kernel/sched/sched.h    |  32 +-
 6 files changed, 11 insertions(+), 764 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 6dd86d13c..d03190526 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -623,13 +623,9 @@ struct sched_rt_entity {
 	unsigned short			on_rq;
 	unsigned short			on_list;
 
-	struct sched_rt_entity		*back;
 #ifdef CONFIG_RT_GROUP_SCHED
-	struct sched_rt_entity		*parent;
 	/* rq on which this entity is (to be) queued: */
 	struct rt_rq			*rt_rq;
-	/* rq "owned" by this entity/group: */
-	struct rt_rq			*my_q;
 #endif
 } __randomize_layout;
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c07fddbf2..e90b3608a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8620,7 +8620,6 @@ void __init sched_init(void)
 		 * starts working after scheduler_running, which is not the case
 		 * yet.
 		 */
-		rq->rt.rt_runtime = global_rt_runtime();
 		init_tg_rt_entry(&root_task_group, rq, NULL, i, NULL);
 #endif
 #ifdef CONFIG_SMP
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 6589077c0..b07abbb60 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1671,40 +1671,6 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 		if (!is_leftmost(dl_se, &rq->dl))
 			resched_curr(rq);
 	}
-
-	/*
-	 * The fair server (sole dl_server) does not account for real-time
-	 * workload because it is running fair work.
-	 */
-	if (dl_se == &rq->fair_server)
-		return;
-
-#ifdef CONFIG_RT_GROUP_SCHED
-	/*
-	 * Because -- for now -- we share the rt bandwidth, we need to
-	 * account our runtime there too, otherwise actual rt tasks
-	 * would be able to exceed the shared quota.
-	 *
-	 * Account to the root rt group for now.
-	 *
-	 * The solution we're working towards is having the RT groups scheduled
-	 * using deadline servers -- however there's a few nasties to figure
-	 * out before that can happen.
-	 */
-	if (rt_bandwidth_enabled()) {
-		struct rt_rq *rt_rq = &rq->rt;
-
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-		/*
-		 * We'll let actual RT tasks worry about the overflow here, we
-		 * have our own CBS to keep us inline; only account when RT
-		 * bandwidth is relevant.
-		 */
-		if (sched_rt_bandwidth_account(rt_rq))
-			rt_rq->rt_time += delta_exec;
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
-	}
-#endif
 }
 
 /*
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08..524ae64f0 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -907,12 +907,6 @@ void print_rt_rq(struct seq_file *m, int cpu, struct rt_rq *rt_rq)
 
 	PU(rt_nr_running);
 
-#ifdef CONFIG_RT_GROUP_SCHED
-	P(rt_throttled);
-	PN(rt_time);
-	PN(rt_runtime);
-#endif
-
 #undef PN
 #undef PU
 #undef P
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e348b8aba..9d17bda66 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1,4 +1,3 @@
-#pragma GCC diagnostic ignored "-Wunused-function"
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Real-Time Scheduling Class (mapped to the SCHED_FIFO and SCHED_RR
@@ -82,99 +81,12 @@ void init_rt_rq(struct rt_rq *rt_rq)
 	rt_rq->overloaded = 0;
 	plist_head_init(&rt_rq->pushable_tasks);
 #endif /* CONFIG_SMP */
-	/* We start is dequeued state, because no RT tasks are queued */
-	rt_rq->rt_queued = 0;
-
-#ifdef CONFIG_RT_GROUP_SCHED
-	rt_rq->rt_time = 0;
-	rt_rq->rt_throttled = 0;
-	rt_rq->rt_runtime = 0;
-	raw_spin_lock_init(&rt_rq->rt_runtime_lock);
-	rt_rq->tg = &root_task_group;
-#endif
 }
 
 #ifdef CONFIG_RT_GROUP_SCHED
 
-static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun);
-
-static enum hrtimer_restart sched_rt_period_timer(struct hrtimer *timer)
-{
-	struct rt_bandwidth *rt_b =
-		container_of(timer, struct rt_bandwidth, rt_period_timer);
-	int idle = 0;
-	int overrun;
-
-	raw_spin_lock(&rt_b->rt_runtime_lock);
-	for (;;) {
-		overrun = hrtimer_forward_now(timer, rt_b->rt_period);
-		if (!overrun)
-			break;
-
-		raw_spin_unlock(&rt_b->rt_runtime_lock);
-		idle = do_sched_rt_period_timer(rt_b, overrun);
-		raw_spin_lock(&rt_b->rt_runtime_lock);
-	}
-	if (idle)
-		rt_b->rt_period_active = 0;
-	raw_spin_unlock(&rt_b->rt_runtime_lock);
-
-	return idle ? HRTIMER_NORESTART : HRTIMER_RESTART;
-}
-
-void init_rt_bandwidth(struct rt_bandwidth *rt_b, u64 period, u64 runtime)
-{
-	rt_b->rt_period = ns_to_ktime(period);
-	rt_b->rt_runtime = runtime;
-
-	raw_spin_lock_init(&rt_b->rt_runtime_lock);
-
-	hrtimer_setup(&rt_b->rt_period_timer, sched_rt_period_timer, CLOCK_MONOTONIC,
-		      HRTIMER_MODE_REL_HARD);
-}
-
-static inline void do_start_rt_bandwidth(struct rt_bandwidth *rt_b)
-{
-	raw_spin_lock(&rt_b->rt_runtime_lock);
-	if (!rt_b->rt_period_active) {
-		rt_b->rt_period_active = 1;
-		/*
-		 * SCHED_DEADLINE updates the bandwidth, as a run away
-		 * RT task with a DL task could hog a CPU. But DL does
-		 * not reset the period. If a deadline task was running
-		 * without an RT task running, it can cause RT tasks to
-		 * throttle when they start up. Kick the timer right away
-		 * to update the period.
-		 */
-		hrtimer_forward_now(&rt_b->rt_period_timer, ns_to_ktime(0));
-		hrtimer_start_expires(&rt_b->rt_period_timer,
-				      HRTIMER_MODE_ABS_PINNED_HARD);
-	}
-	raw_spin_unlock(&rt_b->rt_runtime_lock);
-}
-
-static void start_rt_bandwidth(struct rt_bandwidth *rt_b)
-{
-	if (!rt_bandwidth_enabled() || rt_b->rt_runtime == RUNTIME_INF)
-		return;
-
-	do_start_rt_bandwidth(rt_b);
-}
-
-static void destroy_rt_bandwidth(struct rt_bandwidth *rt_b)
-{
-	hrtimer_cancel(&rt_b->rt_period_timer);
-}
-
-#define rt_entity_is_task(rt_se) (!(rt_se)->my_q)
-
 void unregister_rt_sched_group(struct task_group *tg)
 {
-	if (!rt_group_sched_enabled())
-		return;
-
-	if (tg->rt_se)
-		destroy_rt_bandwidth(&tg->rt_bandwidth);
 }
 
 void free_rt_sched_group(struct task_group *tg)
@@ -307,8 +219,6 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 
 #else /* CONFIG_RT_GROUP_SCHED */
 
-#define rt_entity_is_task(rt_se) (1)
-
 void unregister_rt_sched_group(struct task_group *tg) { }
 
 void free_rt_sched_group(struct task_group *tg) { }
@@ -439,9 +349,6 @@ static inline void rt_queue_pull_task(struct rq *rq)
 }
 #endif /* CONFIG_SMP */
 
-static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
-static void dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count);
-
 static inline int on_rt_rq(struct sched_rt_entity *rt_se)
 {
 	return rt_se->on_rq;
@@ -488,16 +395,6 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
 
 #ifdef CONFIG_RT_GROUP_SCHED
 
-static inline u64 sched_rt_runtime(struct rt_rq *rt_rq)
-{
-	return rt_rq->rt_runtime;
-}
-
-static inline u64 sched_rt_period(struct rt_rq *rt_rq)
-{
-	return ktime_to_ns(rt_rq->tg->dl_bandwidth.dl_period);
-}
-
 typedef struct task_group *rt_rq_iter_t;
 
 static inline struct task_group *next_task_group(struct task_group *tg)
@@ -523,407 +420,9 @@ static inline struct task_group *next_task_group(struct task_group *tg)
 		iter && (rt_rq = iter->rt_rq[cpu_of(rq)]);		\
 		iter = next_task_group(iter))
 
-#define for_each_sched_rt_entity(rt_se) \
-	for (; rt_se; rt_se = rt_se->parent)
-
-static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
-{
-	return rt_se->my_q;
-}
-
 static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags);
 static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags);
 
-static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
-{
-	struct task_struct *donor = rq_of_rt_rq(rt_rq)->donor;
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-	struct sched_rt_entity *rt_se;
-
-	int cpu = cpu_of(rq);
-
-	rt_se = rt_rq->tg->rt_se[cpu];
-
-	if (rt_rq->rt_nr_running) {
-		if (!rt_se)
-			enqueue_top_rt_rq(rt_rq);
-		else if (!on_rt_rq(rt_se))
-			enqueue_rt_entity(rt_se, 0);
-
-		if (rt_rq->highest_prio.curr < donor->prio)
-			resched_curr(rq);
-	}
-}
-
-static void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
-{
-	struct sched_rt_entity *rt_se;
-	int cpu = cpu_of(rq_of_rt_rq(rt_rq));
-
-	rt_se = rt_rq->tg->rt_se[cpu];
-
-	if (!rt_se) {
-		dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
-		/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
-		cpufreq_update_util(rq_of_rt_rq(rt_rq), 0);
-	}
-	else if (on_rt_rq(rt_se))
-		dequeue_rt_entity(rt_se, 0);
-}
-
-static inline int rt_rq_throttled(struct rt_rq *rt_rq)
-{
-	return rt_rq->rt_throttled && !rt_rq->rt_nr_boosted;
-}
-
-static int rt_se_boosted(struct sched_rt_entity *rt_se)
-{
-	struct rt_rq *rt_rq = group_rt_rq(rt_se);
-	struct task_struct *p;
-
-	if (rt_rq)
-		return !!rt_rq->rt_nr_boosted;
-
-	p = rt_task_of(rt_se);
-	return p->prio != p->normal_prio;
-}
-
-#ifdef CONFIG_SMP
-static inline const struct cpumask *sched_rt_period_mask(void)
-{
-	return this_rq()->rd->span;
-}
-#else
-static inline const struct cpumask *sched_rt_period_mask(void)
-{
-	return cpu_online_mask;
-}
-#endif
-
-static inline
-struct rt_rq *sched_rt_period_rt_rq(struct rt_bandwidth *rt_b, int cpu)
-{
-	return container_of(rt_b, struct task_group, rt_bandwidth)->rt_rq[cpu];
-}
-
-static inline struct rt_bandwidth *sched_rt_bandwidth(struct rt_rq *rt_rq)
-{
-	return &rt_rq->tg->rt_bandwidth;
-}
-
-bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
-{
-	struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-
-	return (hrtimer_active(&rt_b->rt_period_timer) ||
-		rt_rq->rt_time < rt_b->rt_runtime);
-}
-
-#ifdef CONFIG_SMP
-/*
- * We ran out of runtime, see if we can borrow some from our neighbours.
- */
-static void do_balance_runtime(struct rt_rq *rt_rq)
-{
-	struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-	struct root_domain *rd = rq_of_rt_rq(rt_rq)->rd;
-	int i, weight;
-	u64 rt_period;
-
-	weight = cpumask_weight(rd->span);
-
-	raw_spin_lock(&rt_b->rt_runtime_lock);
-	rt_period = ktime_to_ns(rt_b->rt_period);
-	for_each_cpu(i, rd->span) {
-		struct rt_rq *iter = sched_rt_period_rt_rq(rt_b, i);
-		s64 diff;
-
-		if (iter == rt_rq)
-			continue;
-
-		raw_spin_lock(&iter->rt_runtime_lock);
-		/*
-		 * Either all rqs have inf runtime and there's nothing to steal
-		 * or __disable_runtime() below sets a specific rq to inf to
-		 * indicate its been disabled and disallow stealing.
-		 */
-		if (iter->rt_runtime == RUNTIME_INF)
-			goto next;
-
-		/*
-		 * From runqueues with spare time, take 1/n part of their
-		 * spare time, but no more than our period.
-		 */
-		diff = iter->rt_runtime - iter->rt_time;
-		if (diff > 0) {
-			diff = div_u64((u64)diff, weight);
-			if (rt_rq->rt_runtime + diff > rt_period)
-				diff = rt_period - rt_rq->rt_runtime;
-			iter->rt_runtime -= diff;
-			rt_rq->rt_runtime += diff;
-			if (rt_rq->rt_runtime == rt_period) {
-				raw_spin_unlock(&iter->rt_runtime_lock);
-				break;
-			}
-		}
-next:
-		raw_spin_unlock(&iter->rt_runtime_lock);
-	}
-	raw_spin_unlock(&rt_b->rt_runtime_lock);
-}
-
-/*
- * Ensure this RQ takes back all the runtime it lend to its neighbours.
- */
-static void __disable_runtime(struct rq *rq)
-{
-	struct root_domain *rd = rq->rd;
-	rt_rq_iter_t iter;
-	struct rt_rq *rt_rq;
-
-	if (unlikely(!scheduler_running))
-		return;
-
-	for_each_rt_rq(rt_rq, iter, rq) {
-		struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-		s64 want;
-		int i;
-
-		raw_spin_lock(&rt_b->rt_runtime_lock);
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-		/*
-		 * Either we're all inf and nobody needs to borrow, or we're
-		 * already disabled and thus have nothing to do, or we have
-		 * exactly the right amount of runtime to take out.
-		 */
-		if (rt_rq->rt_runtime == RUNTIME_INF ||
-				rt_rq->rt_runtime == rt_b->rt_runtime)
-			goto balanced;
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
-
-		/*
-		 * Calculate the difference between what we started out with
-		 * and what we current have, that's the amount of runtime
-		 * we lend and now have to reclaim.
-		 */
-		want = rt_b->rt_runtime - rt_rq->rt_runtime;
-
-		/*
-		 * Greedy reclaim, take back as much as we can.
-		 */
-		for_each_cpu(i, rd->span) {
-			struct rt_rq *iter = sched_rt_period_rt_rq(rt_b, i);
-			s64 diff;
-
-			/*
-			 * Can't reclaim from ourselves or disabled runqueues.
-			 */
-			if (iter == rt_rq || iter->rt_runtime == RUNTIME_INF)
-				continue;
-
-			raw_spin_lock(&iter->rt_runtime_lock);
-			if (want > 0) {
-				diff = min_t(s64, iter->rt_runtime, want);
-				iter->rt_runtime -= diff;
-				want -= diff;
-			} else {
-				iter->rt_runtime -= want;
-				want -= want;
-			}
-			raw_spin_unlock(&iter->rt_runtime_lock);
-
-			if (!want)
-				break;
-		}
-
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-		/*
-		 * We cannot be left wanting - that would mean some runtime
-		 * leaked out of the system.
-		 */
-		WARN_ON_ONCE(want);
-balanced:
-		/*
-		 * Disable all the borrow logic by pretending we have inf
-		 * runtime - in which case borrowing doesn't make sense.
-		 */
-		rt_rq->rt_runtime = RUNTIME_INF;
-		rt_rq->rt_throttled = 0;
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
-		raw_spin_unlock(&rt_b->rt_runtime_lock);
-
-		/* Make rt_rq available for pick_next_task() */
-		sched_rt_rq_enqueue(rt_rq);
-	}
-}
-
-static void __enable_runtime(struct rq *rq)
-{
-	rt_rq_iter_t iter;
-	struct rt_rq *rt_rq;
-
-	if (unlikely(!scheduler_running))
-		return;
-
-	/*
-	 * Reset each runqueue's bandwidth settings
-	 */
-	for_each_rt_rq(rt_rq, iter, rq) {
-		struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-
-		raw_spin_lock(&rt_b->rt_runtime_lock);
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-		rt_rq->rt_runtime = rt_b->rt_runtime;
-		rt_rq->rt_time = 0;
-		rt_rq->rt_throttled = 0;
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
-		raw_spin_unlock(&rt_b->rt_runtime_lock);
-	}
-}
-
-static void balance_runtime(struct rt_rq *rt_rq)
-{
-	if (!sched_feat(RT_RUNTIME_SHARE))
-		return;
-
-	if (rt_rq->rt_time > rt_rq->rt_runtime) {
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
-		do_balance_runtime(rt_rq);
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-	}
-}
-#else /* !CONFIG_SMP */
-static inline void balance_runtime(struct rt_rq *rt_rq) {}
-#endif /* CONFIG_SMP */
-
-static int do_sched_rt_period_timer(struct rt_bandwidth *rt_b, int overrun)
-{
-	int i, idle = 1, throttled = 0;
-	const struct cpumask *span;
-
-	span = sched_rt_period_mask();
-
-	/*
-	 * FIXME: isolated CPUs should really leave the root task group,
-	 * whether they are isolcpus or were isolated via cpusets, lest
-	 * the timer run on a CPU which does not service all runqueues,
-	 * potentially leaving other CPUs indefinitely throttled.  If
-	 * isolation is really required, the user will turn the throttle
-	 * off to kill the perturbations it causes anyway.  Meanwhile,
-	 * this maintains functionality for boot and/or troubleshooting.
-	 */
-	if (rt_b == &root_task_group.rt_bandwidth)
-		span = cpu_online_mask;
-
-	for_each_cpu(i, span) {
-		int enqueue = 0;
-		struct rt_rq *rt_rq = sched_rt_period_rt_rq(rt_b, i);
-		struct rq *rq = rq_of_rt_rq(rt_rq);
-		struct rq_flags rf;
-		int skip;
-
-		/*
-		 * When span == cpu_online_mask, taking each rq->lock
-		 * can be time-consuming. Try to avoid it when possible.
-		 */
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-		if (!sched_feat(RT_RUNTIME_SHARE) && rt_rq->rt_runtime != RUNTIME_INF)
-			rt_rq->rt_runtime = rt_b->rt_runtime;
-		skip = !rt_rq->rt_time && !rt_rq->rt_nr_running;
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
-		if (skip)
-			continue;
-
-		rq_lock(rq, &rf);
-		update_rq_clock(rq);
-
-		if (rt_rq->rt_time) {
-			u64 runtime;
-
-			raw_spin_lock(&rt_rq->rt_runtime_lock);
-			if (rt_rq->rt_throttled)
-				balance_runtime(rt_rq);
-			runtime = rt_rq->rt_runtime;
-			rt_rq->rt_time -= min(rt_rq->rt_time, overrun*runtime);
-			if (rt_rq->rt_throttled && rt_rq->rt_time < runtime) {
-				rt_rq->rt_throttled = 0;
-				enqueue = 1;
-
-				/*
-				 * When we're idle and a woken (rt) task is
-				 * throttled wakeup_preempt() will set
-				 * skip_update and the time between the wakeup
-				 * and this unthrottle will get accounted as
-				 * 'runtime'.
-				 */
-				if (rt_rq->rt_nr_running && rq->curr == rq->idle)
-					rq_clock_cancel_skipupdate(rq);
-			}
-			if (rt_rq->rt_time || rt_rq->rt_nr_running)
-				idle = 0;
-			raw_spin_unlock(&rt_rq->rt_runtime_lock);
-		} else if (rt_rq->rt_nr_running) {
-			idle = 0;
-			if (!rt_rq_throttled(rt_rq))
-				enqueue = 1;
-		}
-		if (rt_rq->rt_throttled)
-			throttled = 1;
-
-		if (enqueue)
-			sched_rt_rq_enqueue(rt_rq);
-		rq_unlock(rq, &rf);
-	}
-
-	if (!throttled && (!rt_bandwidth_enabled() || rt_b->rt_runtime == RUNTIME_INF))
-		return 1;
-
-	return idle;
-}
-
-static int sched_rt_runtime_exceeded(struct rt_rq *rt_rq)
-{
-	u64 runtime = sched_rt_runtime(rt_rq);
-
-	if (rt_rq->rt_throttled)
-		return rt_rq_throttled(rt_rq);
-
-	if (runtime >= sched_rt_period(rt_rq))
-		return 0;
-
-	balance_runtime(rt_rq);
-	runtime = sched_rt_runtime(rt_rq);
-	if (runtime == RUNTIME_INF)
-		return 0;
-
-	if (rt_rq->rt_time > runtime) {
-		struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-
-		/*
-		 * Don't actually throttle groups that have no runtime assigned
-		 * but accrue some time due to boosting.
-		 */
-		if (likely(rt_b->rt_runtime)) {
-			rt_rq->rt_throttled = 1;
-			printk_deferred_once("sched: RT throttling activated\n");
-		} else {
-			/*
-			 * In case we did anyway, make it go away,
-			 * replenishment is a joke, since it will replenish us
-			 * with exactly 0 ns.
-			 */
-			rt_rq->rt_time = 0;
-		}
-
-		if (rt_rq_throttled(rt_rq)) {
-			sched_rt_rq_dequeue(rt_rq);
-			return 1;
-		}
-	}
-
-	return 0;
-}
-
 #else /* !CONFIG_RT_GROUP_SCHED */
 
 typedef struct rt_rq *rt_rq_iter_t;
@@ -931,62 +430,10 @@ typedef struct rt_rq *rt_rq_iter_t;
 #define for_each_rt_rq(rt_rq, iter, rq) \
 	for ((void) iter, rt_rq = &rq->rt; rt_rq; rt_rq = NULL)
 
-#define for_each_sched_rt_entity(rt_se) \
-	for (; rt_se; rt_se = NULL)
-
-static inline struct rt_rq *group_rt_rq(struct sched_rt_entity *rt_se)
-{
-	return NULL;
-}
-
-static inline void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	if (!rt_rq->rt_nr_running)
-		return;
-
-	enqueue_top_rt_rq(rt_rq);
-	resched_curr(rq);
-}
-
-static inline void sched_rt_rq_dequeue(struct rt_rq *rt_rq)
-{
-	dequeue_top_rt_rq(rt_rq, rt_rq->rt_nr_running);
-}
-
-static inline int rt_rq_throttled(struct rt_rq *rt_rq)
-{
-	return false;
-}
-
-static inline const struct cpumask *sched_rt_period_mask(void)
-{
-	return cpu_online_mask;
-}
-
-static inline
-struct rt_rq *sched_rt_period_rt_rq(struct rt_bandwidth *rt_b, int cpu)
-{
-	return &cpu_rq(cpu)->rt;
-}
-
-#ifdef CONFIG_SMP
-static void __enable_runtime(struct rq *rq) { }
-static void __disable_runtime(struct rq *rq) { }
-#endif
-
 #endif /* CONFIG_RT_GROUP_SCHED */
 
 static inline int rt_se_prio(struct sched_rt_entity *rt_se)
 {
-#ifdef CONFIG_RT_GROUP_SCHED
-	struct rt_rq *rt_rq = group_rt_rq(rt_se);
-
-	if (rt_rq)
-		return rt_rq->highest_prio.curr;
-#endif
-
 	return rt_task_of(rt_se)->prio;
 }
 
@@ -1025,45 +472,6 @@ static void update_curr_rt(struct rq *rq)
 #endif
 }
 
-static void
-dequeue_top_rt_rq(struct rt_rq *rt_rq, unsigned int count)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	BUG_ON(&rq->rt != rt_rq);
-
-	if (!rt_rq->rt_queued)
-		return;
-
-	BUG_ON(!rq->nr_running);
-
-	sub_nr_running(rq, count);
-	rt_rq->rt_queued = 0;
-
-}
-
-static void
-enqueue_top_rt_rq(struct rt_rq *rt_rq)
-{
-	struct rq *rq = rq_of_rt_rq(rt_rq);
-
-	BUG_ON(&rq->rt != rt_rq);
-
-	if (rt_rq->rt_queued)
-		return;
-
-	if (rt_rq_throttled(rt_rq))
-		return;
-
-	if (rt_rq->rt_nr_running) {
-		add_nr_running(rq, rt_rq->rt_nr_running);
-		rt_rq->rt_queued = 1;
-	}
-
-	/* Kick cpufreq (see the comment in kernel/sched/sched.h). */
-	cpufreq_update_util(rq, 0);
-}
-
 #if defined CONFIG_SMP
 
 static void
@@ -1151,58 +559,17 @@ static inline void dec_rt_prio(struct rt_rq *rt_rq, int prio) {}
 
 #endif /* CONFIG_SMP || CONFIG_RT_GROUP_SCHED */
 
-#ifdef CONFIG_RT_GROUP_SCHED
-
-static void
-inc_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
-{
-	if (rt_se_boosted(rt_se))
-		rt_rq->rt_nr_boosted++;
-
-	start_rt_bandwidth(&rt_rq->tg->rt_bandwidth);
-}
-
-static void
-dec_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
-{
-	if (rt_se_boosted(rt_se))
-		rt_rq->rt_nr_boosted--;
-
-	WARN_ON(!rt_rq->rt_nr_running && rt_rq->rt_nr_boosted);
-}
-
-#else /* CONFIG_RT_GROUP_SCHED */
-
-static void
-inc_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
-{
-}
-
-static inline
-void dec_rt_group(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq) {}
-
-#endif /* CONFIG_RT_GROUP_SCHED */
-
 static inline
 unsigned int rt_se_nr_running(struct sched_rt_entity *rt_se)
 {
-	struct rt_rq *group_rq = group_rt_rq(rt_se);
-
-	if (group_rq)
-		return group_rq->rt_nr_running;
-	else
-		return 1;
+	return 1;
 }
 
 static inline
 unsigned int rt_se_rr_nr_running(struct sched_rt_entity *rt_se)
 {
-	struct rt_rq *group_rq = group_rt_rq(rt_se);
 	struct task_struct *tsk;
 
-	if (group_rq)
-		return group_rq->rr_nr_running;
-
 	tsk = rt_task_of(rt_se);
 
 	return (tsk->policy == SCHED_RR) ? 1 : 0;
@@ -1274,10 +641,6 @@ static void __delist_rt_entity(struct sched_rt_entity *rt_se, struct rt_prio_arr
 static inline struct sched_statistics *
 __schedstats_from_rt_se(struct sched_rt_entity *rt_se)
 {
-	/* schedstats is not supported for rt group. */
-	if (!rt_entity_is_task(rt_se))
-		return NULL;
-
 	return &rt_task_of(rt_se)->stats;
 }
 
@@ -1290,9 +653,7 @@ update_stats_wait_start_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se)
 	if (!schedstat_enabled())
 		return;
 
-	if (rt_entity_is_task(rt_se))
-		p = rt_task_of(rt_se);
-
+	p = rt_task_of(rt_se);
 	stats = __schedstats_from_rt_se(rt_se);
 	if (!stats)
 		return;
@@ -1309,9 +670,7 @@ update_stats_enqueue_sleeper_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_
 	if (!schedstat_enabled())
 		return;
 
-	if (rt_entity_is_task(rt_se))
-		p = rt_task_of(rt_se);
-
+	p = rt_task_of(rt_se);
 	stats = __schedstats_from_rt_se(rt_se);
 	if (!stats)
 		return;
@@ -1339,9 +698,7 @@ update_stats_wait_end_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se)
 	if (!schedstat_enabled())
 		return;
 
-	if (rt_entity_is_task(rt_se))
-		p = rt_task_of(rt_se);
-
+	p = rt_task_of(rt_se);
 	stats = __schedstats_from_rt_se(rt_se);
 	if (!stats)
 		return;
@@ -1358,9 +715,7 @@ update_stats_dequeue_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se,
 	if (!schedstat_enabled())
 		return;
 
-	if (rt_entity_is_task(rt_se))
-		p = rt_task_of(rt_se);
-
+	p = rt_task_of(rt_se);
 	if ((flags & DEQUEUE_SLEEP) && p) {
 		unsigned int state;
 
@@ -1410,30 +765,6 @@ static void __dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flag
 	dec_rt_tasks(rt_se, rt_rq);
 }
 
-/*
- * Because the prio of an upper entry depends on the lower
- * entries, we must remove entries top - down.
- */
-static void dequeue_rt_stack(struct sched_rt_entity *rt_se, unsigned int flags)
-{
-	struct sched_rt_entity *back = NULL;
-	unsigned int rt_nr_running;
-
-	for_each_sched_rt_entity(rt_se) {
-		rt_se->back = back;
-		back = rt_se;
-	}
-
-	rt_nr_running = rt_rq_of_se(back)->rt_nr_running;
-
-	for (rt_se = back; rt_se; rt_se = rt_se->back) {
-		if (on_rt_rq(rt_se))
-			__dequeue_rt_entity(rt_se, flags);
-	}
-
-	dequeue_top_rt_rq(rt_rq_of_se(back), rt_nr_running);
-}
-
 static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
 	update_stats_enqueue_rt(rt_rq_of_se(rt_se), rt_se, flags);
@@ -1445,7 +776,7 @@ static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
 	update_stats_dequeue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
-	__enqueue_rt_entity(rt_se, flags);
+	__dequeue_rt_entity(rt_se, flags);
 }
 
 /*
@@ -2453,6 +1784,7 @@ static void rq_online_rt(struct rq *rq)
 	if (rq->rt.overloaded)
 		rt_set_overload(rq);
 
+	/*FIXME: Enable the dl server! */
 	cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
 }
 
@@ -2462,6 +1794,7 @@ static void rq_offline_rt(struct rq *rq)
 	if (rq->rt.overloaded)
 		rt_clear_overload(rq);
 
+	/* FIXME: Disable the dl server! */
 	cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_INVALID);
 }
 
@@ -2958,13 +2291,7 @@ long sched_group_rt_period(struct task_group *tg)
 #ifdef CONFIG_SYSCTL
 static int sched_rt_global_constraints(void)
 {
-	int ret = 0;
-
-	mutex_lock(&rt_constraints_mutex);
-	ret = __rt_schedulable(NULL, 0, 0);
-	mutex_unlock(&rt_constraints_mutex);
-
-	return ret;
+	return 0;
 }
 #endif /* CONFIG_SYSCTL */
 
@@ -2999,10 +2326,6 @@ static int sched_rt_global_validate(void)
 	return 0;
 }
 
-static void sched_rt_do_global(void)
-{
-}
-
 static int sched_rt_handler(const struct ctl_table *table, int write, void *buffer,
 		size_t *lenp, loff_t *ppos)
 {
@@ -3029,9 +2352,6 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
 		ret = sched_rt_global_constraints();
 		if (ret)
 			goto undo;
-
-		sched_rt_do_global();
-		sched_dl_do_global();
 	}
 	if (0) {
 undo:
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c7227a510..686578666 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -309,15 +309,6 @@ struct rt_prio_array {
 	struct list_head queue[MAX_RT_PRIO];
 };
 
-struct rt_bandwidth {
-	/* nests inside the rq lock: */
-	raw_spinlock_t		rt_runtime_lock;
-	ktime_t			rt_period;
-	u64			rt_runtime;
-	struct hrtimer		rt_period_timer;
-	unsigned int		rt_period_active;
-};
-
 struct dl_bandwidth {
 	raw_spinlock_t          dl_runtime_lock;
 	u64                     dl_runtime;
@@ -471,7 +462,6 @@ struct task_group {
 	struct sched_dl_entity	**dl_se;
 	struct rt_rq		**rt_rq;
 
-	struct rt_bandwidth	rt_bandwidth;
 	struct dl_bandwidth	dl_bandwidth;
 #endif
 
@@ -797,11 +787,6 @@ struct scx_rq {
 };
 #endif /* CONFIG_SCHED_CLASS_EXT */
 
-static inline int rt_bandwidth_enabled(void)
-{
-	return 0;
-}
-
 /* RT IPI pull logic requires IRQ_WORK */
 #if defined(CONFIG_IRQ_WORK) && defined(CONFIG_SMP)
 # define HAVE_RT_PUSH_IPI
@@ -825,17 +810,7 @@ struct rt_rq {
 	struct plist_head	pushable_tasks;
 
 #endif /* CONFIG_SMP */
-	int			rt_queued;
-
-#ifdef CONFIG_RT_GROUP_SCHED
-	int			rt_throttled;
-	u64			rt_time; /* consumed RT time, goes up in update_curr_rt */
-	u64			rt_runtime; /* allotted RT time, "slice" from rt_bandwidth, RT sharing/balancing */
-	/* Nests inside the rq lock: */
-	raw_spinlock_t		rt_runtime_lock;
 
-	unsigned int		rt_nr_boosted;
-#endif
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group	*tg; /* this tg has "this" rt_rq on given CPU for runnable entities */
 #endif
@@ -845,7 +820,7 @@ struct rt_rq {
 
 static inline bool rt_rq_is_runnable(struct rt_rq *rt_rq)
 {
-	return rt_rq->rt_queued && rt_rq->rt_nr_running;
+	return rt_rq->rt_nr_running;
 }
 
 /* Deadline class' related fields in a runqueue */
@@ -2581,7 +2556,7 @@ static inline bool sched_dl_runnable(struct rq *rq)
 
 static inline bool sched_rt_runnable(struct rq *rq)
 {
-	return rq->rt.rt_queued > 0;
+	return rq->rt.rt_nr_running > 0;
 }
 
 static inline bool sched_fair_runnable(struct rq *rq)
@@ -2714,9 +2689,6 @@ extern void resched_curr(struct rq *rq);
 extern void resched_curr_lazy(struct rq *rq);
 extern void resched_cpu(int cpu);
 
-extern void init_rt_bandwidth(struct rt_bandwidth *rt_b, u64 period, u64 runtime);
-extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
-
 void init_dl_bandwidth(struct dl_bandwidth *dl_b, u64 period, u64 runtime);
 extern void init_dl_entity(struct sched_dl_entity *dl_se);
 
-- 
2.49.0

