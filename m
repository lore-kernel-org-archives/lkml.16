Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B41F4C8E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107672; cv=none; b=nHLfAZXkczp2s1C4GEKebfBBuG0Fzb2osexEJg+ihV0avandbRPdxcu0zputelo427sR/0I7hUa0e+aGqjYttBX8VXLpg0EeFM9UsMVVSMit+IyILN9Qaynyiv7JgGv1ZN1FDYm3TQAACcqeyXVcRB2HOxnuAjoriMCGK8Kc5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107672; c=relaxed/simple;
	bh=+SLrJP+SwnpzCynRJkodV0YYCKHymXa5kVx+/59ksm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQAlDho7UITSSxuuE9GOiRu/G2mAuOVEDp64Cp4iqC6jIUB/OTOwRk9yePXhJhUK7biRCid2/rsGwpKQ1/bUfehkcuqbi5MvNAYdLX1DABqYvu2B1zi4lN7hX8P0ywLY9ZqXTdR81oWkljAUkserKutPLX+XEmumq9dVk8pBUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvW1Y6IR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvW1Y6IR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f71831abso573830f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107667; x=1749712467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl3EyhwNmJYbp+s8ngdxDvdBkfcvseywo+ids1EXZSk=;
        b=lvW1Y6IRkDyrqtvAX7cNboLXNUJgwvBW3VYhQkVyY4ZmOn+m15vujXx49PjBJFeGLG
         ABnc0u0C9+EtPJO1beIlq622aHOG5xUPy6zCrwr3QOj0itks5YN/vFZ+gwC1ajWONXOv
         2GRdsJRoTT7/SZneN2GbGg6HiFs4XSVjIa7XXOvo11xIwSZzpLxJkV3Nky17DJZfVqDS
         hGWXzuJ6qcdZ+576fF2T2SMalbEVaxY5RjzpinOwu4uu/26wMWLua/5rYb2kcxAGxIc2
         5VXxNxEMVvWwLx45YMpOABGrDqAOXcblw2Zs0UTJ0t5UfeW0xUw05cWb5aq8Brl5z18b
         S80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107667; x=1749712467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nl3EyhwNmJYbp+s8ngdxDvdBkfcvseywo+ids1EXZSk=;
        b=SYPAh3G5D7UnxblbLAIFLnmuvq7GcojO2zv9NFsSP+R1IgnoDNbMrEn23flUDP1Uke
         D1D9VJ5wGPcV85zPpr3RALtKhh5XwpqGkY0VlAvDqnUOnlVUeKU6dB5e4AEmvp63Naq9
         9NBTdEublR1nLICznCO18jXCHlVWhOhebyo+oYTb64n5IzCob9X68AM+e8q3n3NL9osL
         DGgNNFNder9pzFB2KQHydeLfJ1kLleEqlMYJ8lryX5lhGUpM4j+OyCyFmt91l+Wz47cA
         2KHbzRBKNNB0MuxH37LJvmmMuI50glp/w9anUUi284ybJjTYi1ru1tw+DNXhL2PJe26n
         orFA==
X-Gm-Message-State: AOJu0Ywi1Dx5zRD7k8/GQW9KnXeVdWXqjx6en4apyPjUi7JzFMZS5p/6
	RiZ6XjSYGswoMemYZgRuyfvwDZjW9d38ZLEU13qp+J6TMKqP+oNWDYmaxfHJLWfQ13s=
X-Gm-Gg: ASbGncs7lcTwCPQ5zWAdqdVV6/5DABar04eC1HUzfgDfjhqQa0iZ2EZJMs7WeZUDwm3
	N+okUu13vxBrhLeTJHAwK5iNxWXyyM81pR/HHNHeDC2/hD8g+8b66CzErPu0HcALxzw+WYt1wo0
	nti48nA1FCneESc1UxTZW8Xio5oihDWFPYkh01KdVWUvSSt+CurHTO1jMCtszpJ5Vtq9ZaPuF/I
	H/US4dFMvO4Aq5j2RY9RxiLubF1L1PotiMiKTHrMhzT9CUP0I42b74XKP3KF8WP6xHqNhU++KHX
	jrXw9wc989n/QulunndAsulvW3naMxK3CZywUm5VOV5pVOnhKuhpFFanb+xhFB4o
X-Google-Smtp-Source: AGHT+IFSvd/4VaY1YpesBrCGCxbgoh0VjyWHKJsJy+Zaj6L4wCy5WaRkxY/OLWy7Xh8s6cmU2kTq7w==
X-Received: by 2002:a05:6000:430d:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3a51d96b0fdmr4676637f8f.47.1749107666807;
        Thu, 05 Jun 2025 00:14:26 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:26 -0700 (PDT)
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
Subject: [RFC PATCH 5/9] sched/deadline: Hierarchical scheduling with DL on top of RT
Date: Thu,  5 Jun 2025 09:14:08 +0200
Message-ID: <20250605071412.139240-6-yurand2000@gmail.com>
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

Implement the hierarchical scheduling mechanism:
- Enforce the runtime of RT tasks controlled by cgroups using the dl_server
  mechanism, based on the runtime and period (the deadline is set equal
  to the period) parameters.
- Make sched_dl_entity store the cgroups' RT local runqueue, and provide a
  rt_rq for this runqueue.
- Allow zeroing the runtime of a rt cgroups.

Update dl_server code:
- Make check for the return value of dl_server_apply_params on initialization
  of the fair server.
- Initialize the dl_server in dl_server_start only if it is a fair server, but
  do not initialize other types of servers, regardless of its period value.
- Make inc_dl_task and dec_dl_task increase/decrease by one the value of active
  tasks if a fair_server starts/stops, while ignore rt-cgroups dl_servers in
  the accounting.

Co-developed-by: Alessio Balsini <a.balsini@sssup.it>
Signed-off-by: Alessio Balsini <a.balsini@sssup.it>
Co-developed-by: Andrea Parri <parri.andrea@gmail.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Co-developed-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/autogroup.c |   4 +-
 kernel/sched/core.c      |  15 +-
 kernel/sched/deadline.c  | 145 ++++++++++++--
 kernel/sched/rt.c        | 415 ++++++++++++++++++++++++++-------------
 kernel/sched/sched.h     |  59 +++++-
 kernel/sched/syscalls.c  |   4 +-
 6 files changed, 471 insertions(+), 171 deletions(-)

diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
index 2b331822c..a647c9265 100644
--- a/kernel/sched/autogroup.c
+++ b/kernel/sched/autogroup.c
@@ -49,7 +49,7 @@ static inline void autogroup_destroy(struct kref *kref)
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	/* We've redirected RT tasks to the root task group... */
-	ag->tg->rt_se = NULL;
+	ag->tg->dl_se = NULL;
 	ag->tg->rt_rq = NULL;
 #endif
 	sched_release_group(ag->tg);
@@ -106,7 +106,7 @@ static inline struct autogroup *autogroup_create(void)
 	 * the policy change to proceed.
 	 */
 	free_rt_sched_group(tg);
-	tg->rt_se = root_task_group.rt_se;
+	tg->dl_se = root_task_group.dl_se;
 	tg->rt_rq = root_task_group.rt_rq;
 #endif
 	tg->autogroup = ag;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dce50fa57..c07fddbf2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2196,6 +2196,9 @@ void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
 {
 	struct task_struct *donor = rq->donor;
 
+	if (is_dl_group(rt_rq_of_se(&p->rt)) && task_has_rt_policy(p))
+		resched_curr(rq);
+
 	if (p->sched_class == donor->sched_class)
 		donor->sched_class->wakeup_preempt(rq, p, flags);
 	else if (sched_class_above(p->sched_class, donor->sched_class))
@@ -8548,7 +8551,7 @@ void __init sched_init(void)
 		root_task_group.scx_weight = CGROUP_WEIGHT_DFL;
 #endif /* CONFIG_EXT_GROUP_SCHED */
 #ifdef CONFIG_RT_GROUP_SCHED
-		root_task_group.rt_se = (struct sched_rt_entity **)ptr;
+		root_task_group.dl_se = (struct sched_dl_entity **)ptr;
 		ptr += nr_cpu_ids * sizeof(void **);
 
 		root_task_group.rt_rq = (struct rt_rq **)ptr;
@@ -8562,7 +8565,7 @@ void __init sched_init(void)
 #endif
 
 #ifdef CONFIG_RT_GROUP_SCHED
-	init_rt_bandwidth(&root_task_group.rt_bandwidth,
+	init_dl_bandwidth(&root_task_group.dl_bandwidth,
 			global_rt_period(), global_rt_runtime());
 #endif /* CONFIG_RT_GROUP_SCHED */
 
@@ -8618,7 +8621,7 @@ void __init sched_init(void)
 		 * yet.
 		 */
 		rq->rt.rt_runtime = global_rt_runtime();
-		init_tg_rt_entry(&root_task_group, &rq->rt, NULL, i, NULL);
+		init_tg_rt_entry(&root_task_group, rq, NULL, i, NULL);
 #endif
 #ifdef CONFIG_SMP
 		rq->sd = NULL;
@@ -9125,6 +9128,12 @@ cpu_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 		return &root_task_group.css;
 	}
 
+	/* Do not allow cpu_cgroup hierachies with depth greater than 2. */
+#ifdef CONFIG_RT_GROUP_SCHED
+	if (parent != &root_task_group)
+		return ERR_PTR(-EINVAL);
+#endif
+
 	tg = sched_create_group(parent);
 	if (IS_ERR(tg))
 		return ERR_PTR(-ENOMEM);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 7736a625f..6589077c0 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -239,8 +239,15 @@ void __dl_add(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
 static inline bool
 __dl_overflow(struct dl_bw *dl_b, unsigned long cap, u64 old_bw, u64 new_bw)
 {
+	u64 dl_groups_root = 0;
+
+#ifdef CONFIG_RT_GROUP_SCHED
+	dl_groups_root = to_ratio(root_task_group.dl_bandwidth.dl_period,
+				  root_task_group.dl_bandwidth.dl_runtime);
+#endif
 	return dl_b->bw != -1 &&
-	       cap_scale(dl_b->bw, cap) < dl_b->total_bw - old_bw + new_bw;
+	       cap_scale(dl_b->bw, cap) < dl_b->total_bw - old_bw + new_bw
+					+ cap_scale(dl_groups_root, cap);
 }
 
 static inline
@@ -366,6 +373,93 @@ void cancel_inactive_timer(struct sched_dl_entity *dl_se)
 	cancel_dl_timer(dl_se, &dl_se->inactive_timer);
 }
 
+/*
+ * Used for dl_bw check and update, used under sched_rt_handler()::mutex and
+ * sched_domains_mutex.
+ */
+u64 dl_cookie;
+
+#ifdef CONFIG_RT_GROUP_SCHED
+int dl_check_tg(unsigned long total)
+{
+	unsigned long flags;
+	int which_cpu;
+	int cpus;
+	struct dl_bw *dl_b;
+	u64 gen = ++dl_cookie;
+
+	for_each_possible_cpu(which_cpu) {
+		rcu_read_lock_sched();
+
+		if (!dl_bw_visited(which_cpu, gen)) {
+			cpus = dl_bw_cpus(which_cpu);
+			dl_b = dl_bw_of(which_cpu);
+
+			raw_spin_lock_irqsave(&dl_b->lock, flags);
+
+			if (dl_b->bw != -1 &&
+			    dl_b->bw * cpus < dl_b->total_bw + total * cpus) {
+				raw_spin_unlock_irqrestore(&dl_b->lock, flags);
+				rcu_read_unlock_sched();
+
+				return 0;
+			}
+
+			raw_spin_unlock_irqrestore(&dl_b->lock, flags);
+		}
+
+		rcu_read_unlock_sched();
+	}
+
+	return 1;
+}
+
+int dl_init_tg(struct sched_dl_entity *dl_se, u64 rt_runtime, u64 rt_period)
+{
+	struct rq *rq = container_of(dl_se->dl_rq, struct rq, dl);
+	int is_active;
+	u64 old_runtime;
+
+	/*
+	 * Since we truncate DL_SCALE bits, make sure we're at least
+	 * that big.
+	 */
+	if (rt_runtime != 0 && rt_runtime < (1ULL << DL_SCALE))
+		return 0;
+
+	/*
+	 * Since we use the MSB for wrap-around and sign issues, make
+	 * sure it's not set (mind that period can be equal to zero).
+	 */
+	if (rt_period & (1ULL << 63))
+		return 0;
+
+	raw_spin_rq_lock_irq(rq);
+	is_active = dl_se->my_q->rt.rt_nr_running > 0;
+	old_runtime = dl_se->dl_runtime;
+	dl_se->dl_runtime  = rt_runtime;
+	dl_se->dl_period   = rt_period;
+	dl_se->dl_deadline = dl_se->dl_period;
+	if (is_active) {
+		sub_running_bw(dl_se, dl_se->dl_rq);
+	} else if (dl_se->dl_non_contending) {
+		sub_running_bw(dl_se, dl_se->dl_rq);
+		dl_se->dl_non_contending = 0;
+		hrtimer_try_to_cancel(&dl_se->inactive_timer);
+	}
+	__sub_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
+	dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
+	__add_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
+
+	if (is_active)
+		add_running_bw(dl_se, dl_se->dl_rq);
+
+	raw_spin_rq_unlock_irq(rq);
+
+	return 1;
+}
+#endif
+
 static void dl_change_utilization(struct task_struct *p, u64 new_bw)
 {
 	WARN_ON_ONCE(p->dl.flags & SCHED_FLAG_SUGOV);
@@ -539,6 +633,14 @@ static inline int is_leftmost(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq
 
 static void init_dl_rq_bw_ratio(struct dl_rq *dl_rq);
 
+void init_dl_bandwidth(struct dl_bandwidth *dl_b, u64 period, u64 runtime)
+{
+	raw_spin_lock_init(&dl_b->dl_runtime_lock);
+	dl_b->dl_period = period;
+	dl_b->dl_runtime = runtime;
+}
+
+
 void init_dl_bw(struct dl_bw *dl_b)
 {
 	raw_spin_lock_init(&dl_b->lock);
@@ -1493,6 +1595,9 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 {
 	s64 scaled_delta_exec;
 
+	if (dl_server(dl_se) && !on_dl_rq(dl_se))
+		return;
+
 	if (unlikely(delta_exec <= 0)) {
 		if (unlikely(dl_se->dl_yielded))
 			goto throttle;
@@ -1654,13 +1759,15 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 	 * this before getting generic.
 	 */
 	if (!dl_server(dl_se)) {
-		u64 runtime =  50 * NSEC_PER_MSEC;
-		u64 period = 1000 * NSEC_PER_MSEC;
-
 		dl_se->dl_server = 1;
-		dl_server_apply_params(dl_se, runtime, period, 1);
+		if (dl_se == &rq_of_dl_se(dl_se)->fair_server) {
+			u64 runtime =  50 * NSEC_PER_MSEC;
+			u64 period = 1000 * NSEC_PER_MSEC;
+
+			BUG_ON(dl_server_apply_params(dl_se, runtime, period, 1));
 
-		dl_se->dl_defer = 1;
+			dl_se->dl_defer = 1;
+		}
 		setup_new_dl_entity(dl_se);
 	}
 
@@ -1669,13 +1776,14 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 
 	dl_se->dl_server_active = 1;
 	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
-			rq = rq_of_dl_se(dl_se);
+	rq = rq_of_dl_se(dl_se);
 	if (!dl_task(rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
 		resched_curr(rq);
 }
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
 {
+//	if (!dl_server(dl_se)) return;	TODO: Check if the following is equivalent to this!!!
 	if (!dl_se->dl_runtime)
 		return;
 
@@ -1898,7 +2006,13 @@ void inc_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 	u64 deadline = dl_se->deadline;
 
 	dl_rq->dl_nr_running++;
-	add_nr_running(rq_of_dl_rq(dl_rq), 1);
+	if (!dl_server(dl_se) || dl_se == &rq_of_dl_rq(dl_rq)->fair_server) {
+		add_nr_running(rq_of_dl_rq(dl_rq), 1);
+	} else {
+		struct rt_rq *rt_rq = &dl_se->my_q->rt;
+
+		add_nr_running(rq_of_dl_rq(dl_rq), rt_rq->rt_nr_running);
+	}
 
 	inc_dl_deadline(dl_rq, deadline);
 }
@@ -1908,7 +2022,13 @@ void dec_dl_tasks(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
 {
 	WARN_ON(!dl_rq->dl_nr_running);
 	dl_rq->dl_nr_running--;
-	sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+	if ((!dl_server(dl_se)) || dl_se == &rq_of_dl_rq(dl_rq)->fair_server) {
+		sub_nr_running(rq_of_dl_rq(dl_rq), 1);
+	} else {
+		struct rt_rq *rt_rq = &dl_se->my_q->rt;
+
+		sub_nr_running(rq_of_dl_rq(dl_rq), rt_rq->rt_nr_running);
+	}
 
 	dec_dl_deadline(dl_rq, dl_se->deadline);
 }
@@ -2445,6 +2565,7 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 			}
 			goto again;
 		}
+		BUG_ON(!p);
 		rq->dl_server = dl_se;
 	} else {
 		p = dl_task_of(dl_se);
@@ -3177,12 +3298,6 @@ DEFINE_SCHED_CLASS(dl) = {
 #endif
 };
 
-/*
- * Used for dl_bw check and update, used under sched_rt_handler()::mutex and
- * sched_domains_mutex.
- */
-u64 dl_cookie;
-
 int sched_dl_global_validate(void)
 {
 	u64 runtime = global_rt_runtime();
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 382126274..e348b8aba 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1,3 +1,4 @@
+#pragma GCC diagnostic ignored "-Wunused-function"
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Real-Time Scheduling Class (mapped to the SCHED_FIFO and SCHED_RR
@@ -184,81 +185,122 @@ void free_rt_sched_group(struct task_group *tg)
 		return;
 
 	for_each_possible_cpu(i) {
-		if (tg->rt_rq)
-			kfree(tg->rt_rq[i]);
-		if (tg->rt_se)
-			kfree(tg->rt_se[i]);
+		if (tg->dl_se) {
+			unsigned long flags;
+
+			/*
+			 * Since the dl timer is going to be cancelled,
+			 * we risk to never decrease the running bw...
+			 * Fix this issue by changing the group runtime
+			 * to 0 immediately before freeing it.
+			 */
+			BUG_ON(!dl_init_tg(tg->dl_se[i], 0, tg->dl_se[i]->dl_period));
+			raw_spin_rq_lock_irqsave(cpu_rq(i), flags);
+			BUG_ON(tg->rt_rq[i]->rt_nr_running);
+			raw_spin_rq_unlock_irqrestore(cpu_rq(i), flags);
+
+			hrtimer_cancel(&tg->dl_se[i]->dl_timer);
+			kfree(tg->dl_se[i]);
+		}
+		if (tg->rt_rq) {
+			struct rq *served_rq;
+
+			served_rq = container_of(tg->rt_rq[i], struct rq, rt);
+			kfree(served_rq);
+		}
 	}
 
 	kfree(tg->rt_rq);
-	kfree(tg->rt_se);
+	kfree(tg->dl_se);
 }
 
-void init_tg_rt_entry(struct task_group *tg, struct rt_rq *rt_rq,
-		struct sched_rt_entity *rt_se, int cpu,
-		struct sched_rt_entity *parent)
+void init_tg_rt_entry(struct task_group *tg, struct rq *served_rq,
+		struct sched_dl_entity *dl_se, int cpu,
+		struct sched_dl_entity *parent)
 {
 	struct rq *rq = cpu_rq(cpu);
 
-	rt_rq->highest_prio.curr = MAX_RT_PRIO-1;
-	rt_rq->rt_nr_boosted = 0;
-	rt_rq->rq = rq;
-	rt_rq->tg = tg;
+	served_rq->rt.highest_prio.curr = MAX_RT_PRIO-1;
+	served_rq->rt.rq = rq;
+	served_rq->rt.tg = tg;
 
-	tg->rt_rq[cpu] = rt_rq;
-	tg->rt_se[cpu] = rt_se;
+	tg->rt_rq[cpu] = &served_rq->rt;
+	tg->dl_se[cpu] = dl_se;
 
-	if (!rt_se)
+	if (!dl_se)
 		return;
 
-	if (!parent)
-		rt_se->rt_rq = &rq->rt;
-	else
-		rt_se->rt_rq = parent->my_q;
+	dl_se->dl_rq = &rq->dl;
+	dl_se->my_q = served_rq;
+}
 
-	rt_se->my_q = rt_rq;
-	rt_se->parent = parent;
-	INIT_LIST_HEAD(&rt_se->run_list);
+static bool rt_server_has_tasks(struct sched_dl_entity *dl_se)
+{
+	return !!dl_se->my_q->rt.rt_nr_running;
+}
+
+static struct task_struct *_pick_next_task_rt(struct rt_rq *rt_rq);
+static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first);
+static struct task_struct *rt_server_pick(struct sched_dl_entity *dl_se)
+{
+	struct rt_rq *rt_rq = &dl_se->my_q->rt;
+	struct rq *rq = rq_of_rt_rq(rt_rq);
+	struct task_struct *p;
+
+	if (dl_se->my_q->rt.rt_nr_running == 0)
+		return NULL;
+
+	p = _pick_next_task_rt(rt_rq);
+	set_next_task_rt(rq, p, true);
+
+	return p;
 }
 
 int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 {
-	struct rt_rq *rt_rq;
-	struct sched_rt_entity *rt_se;
+	struct rq *s_rq;
+	struct sched_dl_entity *dl_se;
 	int i;
 
 	if (!rt_group_sched_enabled())
 		return 1;
 
-	tg->rt_rq = kcalloc(nr_cpu_ids, sizeof(rt_rq), GFP_KERNEL);
+	tg->rt_rq = kcalloc(nr_cpu_ids, sizeof(struct rt_rq *), GFP_KERNEL);
 	if (!tg->rt_rq)
 		goto err;
-	tg->rt_se = kcalloc(nr_cpu_ids, sizeof(rt_se), GFP_KERNEL);
-	if (!tg->rt_se)
+	tg->dl_se = kcalloc(nr_cpu_ids, sizeof(dl_se), GFP_KERNEL);
+	if (!tg->dl_se)
 		goto err;
 
-	init_rt_bandwidth(&tg->rt_bandwidth, ktime_to_ns(global_rt_period()), 0);
+	init_dl_bandwidth(&tg->dl_bandwidth, 0, 0);
 
 	for_each_possible_cpu(i) {
-		rt_rq = kzalloc_node(sizeof(struct rt_rq),
+		s_rq = kzalloc_node(sizeof(struct rq),
 				     GFP_KERNEL, cpu_to_node(i));
-		if (!rt_rq)
+		if (!s_rq)
 			goto err;
 
-		rt_se = kzalloc_node(sizeof(struct sched_rt_entity),
+		dl_se = kzalloc_node(sizeof(struct sched_dl_entity),
 				     GFP_KERNEL, cpu_to_node(i));
-		if (!rt_se)
+		if (!dl_se)
 			goto err_free_rq;
 
-		init_rt_rq(rt_rq);
-		rt_rq->rt_runtime = tg->rt_bandwidth.rt_runtime;
-		init_tg_rt_entry(tg, rt_rq, rt_se, i, parent->rt_se[i]);
+		init_rt_rq(&s_rq->rt);
+		init_dl_entity(dl_se);
+		dl_se->dl_runtime = tg->dl_bandwidth.dl_runtime;
+		dl_se->dl_period = tg->dl_bandwidth.dl_period;
+		dl_se->dl_deadline = dl_se->dl_period;
+		dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
+
+		dl_server_init(dl_se, &cpu_rq(i)->dl, s_rq, rt_server_has_tasks, rt_server_pick);
+
+		init_tg_rt_entry(tg, s_rq, dl_se, i, parent->dl_se[i]);
 	}
 
 	return 1;
 
 err_free_rq:
-	kfree(rt_rq);
+	kfree(s_rq);
 err:
 	return 0;
 }
@@ -391,6 +433,10 @@ static inline void dequeue_pushable_task(struct rt_rq *rt_rq, struct task_struct
 static inline void rt_queue_push_tasks(struct rq *rq)
 {
 }
+
+static inline void rt_queue_pull_task(struct rq *rq)
+{
+}
 #endif /* CONFIG_SMP */
 
 static void enqueue_top_rt_rq(struct rt_rq *rt_rq);
@@ -449,7 +495,7 @@ static inline u64 sched_rt_runtime(struct rt_rq *rt_rq)
 
 static inline u64 sched_rt_period(struct rt_rq *rt_rq)
 {
-	return ktime_to_ns(rt_rq->tg->rt_bandwidth.rt_period);
+	return ktime_to_ns(rt_rq->tg->dl_bandwidth.dl_period);
 }
 
 typedef struct task_group *rt_rq_iter_t;
@@ -952,6 +998,9 @@ static void update_curr_rt(struct rq *rq)
 {
 	struct task_struct *donor = rq->donor;
 	s64 delta_exec;
+#ifdef CONFIG_RT_GROUP_SCHED
+	struct rt_rq *rt_rq;
+#endif
 
 	if (donor->sched_class != &rt_sched_class)
 		return;
@@ -961,25 +1010,17 @@ static void update_curr_rt(struct rq *rq)
 		return;
 
 #ifdef CONFIG_RT_GROUP_SCHED
-	struct sched_rt_entity *rt_se = &donor->rt;
+	if (!rt_group_sched_enabled())
+		return;
 
-	if (!rt_bandwidth_enabled())
+	if (!dl_bandwidth_enabled())
 		return;
 
-	for_each_sched_rt_entity(rt_se) {
-		struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
-		int exceeded;
+	rt_rq = rt_rq_of_se(&donor->rt);
+	if (is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
 
-		if (sched_rt_runtime(rt_rq) != RUNTIME_INF) {
-			raw_spin_lock(&rt_rq->rt_runtime_lock);
-			rt_rq->rt_time += delta_exec;
-			exceeded = sched_rt_runtime_exceeded(rt_rq);
-			if (exceeded)
-				resched_curr(rq);
-			raw_spin_unlock(&rt_rq->rt_runtime_lock);
-			if (exceeded)
-				do_start_rt_bandwidth(sched_rt_bandwidth(rt_rq));
-		}
+		dl_server_update(dl_se, delta_exec);
 	}
 #endif
 }
@@ -1033,7 +1074,7 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 	/*
 	 * Change rq's cpupri only if rt_rq is the top queue.
 	 */
-	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && &rq->rt != rt_rq)
+	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && is_dl_group(rt_rq))
 		return;
 
 	if (rq->online && prio < prev_prio)
@@ -1048,7 +1089,7 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 	/*
 	 * Change rq's cpupri only if rt_rq is the top queue.
 	 */
-	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && &rq->rt != rt_rq)
+	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && is_dl_group(rt_rq))
 		return;
 
 	if (rq->online && rt_rq->highest_prio.curr != prev_prio)
@@ -1177,19 +1218,34 @@ void inc_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 	rt_rq->rr_nr_running += rt_se_rr_nr_running(rt_se);
 
 	inc_rt_prio(rt_rq, prio);
-	inc_rt_group(rt_se, rt_rq);
+
+	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		if (!dl_se->dl_throttled)
+			add_nr_running(rq_of_rt_rq(rt_rq), 1);
+	} else {
+		add_nr_running(rq_of_rt_rq(rt_rq), 1);
+	}
 }
 
 static inline
 void dec_rt_tasks(struct sched_rt_entity *rt_se, struct rt_rq *rt_rq)
 {
 	WARN_ON(!rt_prio(rt_se_prio(rt_se)));
-	WARN_ON(!rt_rq->rt_nr_running);
 	rt_rq->rt_nr_running -= rt_se_nr_running(rt_se);
 	rt_rq->rr_nr_running -= rt_se_rr_nr_running(rt_se);
 
 	dec_rt_prio(rt_rq, rt_se_prio(rt_se));
-	dec_rt_group(rt_se, rt_rq);
+
+	if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) && is_dl_group(rt_rq)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		if (!dl_se->dl_throttled)
+			sub_nr_running(rq_of_rt_rq(rt_rq), 1);
+	} else {
+		sub_nr_running(rq_of_rt_rq(rt_rq), 1);
+	}
 }
 
 /*
@@ -1323,21 +1379,8 @@ static void __enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flag
 {
 	struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
 	struct rt_prio_array *array = &rt_rq->active;
-	struct rt_rq *group_rq = group_rt_rq(rt_se);
 	struct list_head *queue = array->queue + rt_se_prio(rt_se);
 
-	/*
-	 * Don't enqueue the group if its throttled, or when empty.
-	 * The latter is a consequence of the former when a child group
-	 * get throttled and the current group doesn't have any other
-	 * active members.
-	 */
-	if (group_rq && (rt_rq_throttled(group_rq) || !group_rq->rt_nr_running)) {
-		if (rt_se->on_list)
-			__delist_rt_entity(rt_se, array);
-		return;
-	}
-
 	if (move_entity(flags)) {
 		WARN_ON_ONCE(rt_se->on_list);
 		if (flags & ENQUEUE_HEAD)
@@ -1393,31 +1436,16 @@ static void dequeue_rt_stack(struct sched_rt_entity *rt_se, unsigned int flags)
 
 static void enqueue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
-	struct rq *rq = rq_of_rt_se(rt_se);
-
 	update_stats_enqueue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
-	dequeue_rt_stack(rt_se, flags);
-	for_each_sched_rt_entity(rt_se)
-		__enqueue_rt_entity(rt_se, flags);
-	enqueue_top_rt_rq(&rq->rt);
+	__enqueue_rt_entity(rt_se, flags);
 }
 
 static void dequeue_rt_entity(struct sched_rt_entity *rt_se, unsigned int flags)
 {
-	struct rq *rq = rq_of_rt_se(rt_se);
-
 	update_stats_dequeue_rt(rt_rq_of_se(rt_se), rt_se, flags);
 
-	dequeue_rt_stack(rt_se, flags);
-
-	for_each_sched_rt_entity(rt_se) {
-		struct rt_rq *rt_rq = group_rt_rq(rt_se);
-
-		if (rt_rq && rt_rq->rt_nr_running)
-			__enqueue_rt_entity(rt_se, flags);
-	}
-	enqueue_top_rt_rq(&rq->rt);
+	__enqueue_rt_entity(rt_se, flags);
 }
 
 /*
@@ -1435,6 +1463,15 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 	check_schedstat_required();
 	update_stats_wait_start_rt(rt_rq_of_se(rt_se), rt_se);
 
+#ifdef CONFIG_RT_GROUP_SCHED
+	/* Task arriving in an idle group of tasks. */
+	if (is_dl_group(rt_rq) && (rt_rq->rt_nr_running == 0)) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		dl_server_start(dl_se);
+	}
+#endif
+
 	enqueue_rt_entity(rt_se, flags);
 
 	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
@@ -1451,6 +1488,15 @@ static bool dequeue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 
 	dequeue_pushable_task(rt_rq, p);
 
+#ifdef CONFIG_RT_GROUP_SCHED
+	/* Last task of the task group. */
+	if (is_dl_group(rt_rq) && !rt_rq->rt_nr_running) {
+		struct sched_dl_entity *dl_se = dl_group_of(rt_rq);
+
+		dl_server_stop(dl_se);
+	}
+#endif
+
 	return true;
 }
 
@@ -1477,10 +1523,8 @@ static void requeue_task_rt(struct rq *rq, struct task_struct *p, int head)
 	struct sched_rt_entity *rt_se = &p->rt;
 	struct rt_rq *rt_rq;
 
-	for_each_sched_rt_entity(rt_se) {
-		rt_rq = rt_rq_of_se(rt_se);
-		requeue_rt_entity(rt_rq, rt_se, head);
-	}
+	rt_rq = rt_rq_of_se(rt_se);
+	requeue_rt_entity(rt_rq, rt_se, head);
 }
 
 static void yield_task_rt(struct rq *rq)
@@ -1612,6 +1656,36 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
 {
 	struct task_struct *donor = rq->donor;
 
+#ifdef CONFIG_RT_GROUP_SCHED
+	if (!rt_group_sched_enabled())
+		goto no_group_sched;
+
+	if (is_dl_group(rt_rq_of_se(&p->rt)) &&
+	    is_dl_group(rt_rq_of_se(&rq->curr->rt))) {
+		struct sched_dl_entity *dl_se, *curr_dl_se;
+
+		dl_se = dl_group_of(rt_rq_of_se(&p->rt));
+		curr_dl_se = dl_group_of(rt_rq_of_se(&rq->curr->rt));
+
+		if (dl_entity_preempt(dl_se, curr_dl_se)) {
+			resched_curr(rq);
+			return;
+		} else if (!dl_entity_preempt(curr_dl_se, dl_se)) {
+			if (p->prio < rq->curr->prio) {
+				resched_curr(rq);
+				return;
+			}
+		}
+		return;
+	} else if (is_dl_group(rt_rq_of_se(&p->rt))) {
+		resched_curr(rq);
+		return;
+	} else if (is_dl_group(rt_rq_of_se(&rq->curr->rt))) {
+		return;
+	}
+#endif
+
+no_group_sched:
 	if (p->prio < donor->prio) {
 		resched_curr(rq);
 		return;
@@ -1679,17 +1753,12 @@ static struct sched_rt_entity *pick_next_rt_entity(struct rt_rq *rt_rq)
 	return next;
 }
 
-static struct task_struct *_pick_next_task_rt(struct rq *rq)
+static struct task_struct *_pick_next_task_rt(struct rt_rq *rt_rq)
 {
 	struct sched_rt_entity *rt_se;
-	struct rt_rq *rt_rq  = &rq->rt;
 
-	do {
-		rt_se = pick_next_rt_entity(rt_rq);
-		if (unlikely(!rt_se))
-			return NULL;
-		rt_rq = group_rt_rq(rt_se);
-	} while (rt_rq);
+	rt_se = pick_next_rt_entity(rt_rq);
+	BUG_ON(!rt_se);
 
 	return rt_task_of(rt_se);
 }
@@ -1701,7 +1770,7 @@ static struct task_struct *pick_task_rt(struct rq *rq)
 	if (!sched_rt_runnable(rq))
 		return NULL;
 
-	p = _pick_next_task_rt(rq);
+	p = _pick_next_task_rt(&rq->rt);
 
 	return p;
 }
@@ -2337,12 +2406,36 @@ static void pull_rt_task(struct rq *this_rq)
 		resched_curr(this_rq);
 }
 
+#ifdef CONFIG_RT_GROUP_SCHED
+static int group_push_rt_task(struct rt_rq *rt_rq)
+{
+	struct rq *rq = rq_of_rt_rq(rt_rq);
+
+	if (is_dl_group(rt_rq))
+		return 0;
+
+	return push_rt_task(rq, false);
+}
+
+static void group_push_rt_tasks(struct rt_rq *rt_rq)
+{
+	while (group_push_rt_task(rt_rq))
+		;
+}
+#else
+static void group_push_rt_tasks(struct rt_rq *rt_rq)
+{
+	push_rt_tasks(rq_of_rt_rq(rt_rq));
+}
+#endif
+
 /*
  * If we are not running and we are not going to reschedule soon, we should
  * try to push tasks away now
  */
 static void task_woken_rt(struct rq *rq, struct task_struct *p)
 {
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
 	bool need_to_push = !task_on_cpu(rq, p) &&
 			    !test_tsk_need_resched(rq->curr) &&
 			    p->nr_cpus_allowed > 1 &&
@@ -2351,7 +2444,7 @@ static void task_woken_rt(struct rq *rq, struct task_struct *p)
 			     rq->donor->prio <= p->prio);
 
 	if (need_to_push)
-		push_rt_tasks(rq);
+		group_push_rt_tasks(rt_rq);
 }
 
 /* Assumes rq->lock is held */
@@ -2360,8 +2453,6 @@ static void rq_online_rt(struct rq *rq)
 	if (rq->rt.overloaded)
 		rt_set_overload(rq);
 
-	__enable_runtime(rq);
-
 	cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
 }
 
@@ -2371,8 +2462,6 @@ static void rq_offline_rt(struct rq *rq)
 	if (rq->rt.overloaded)
 		rt_clear_overload(rq);
 
-	__disable_runtime(rq);
-
 	cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_INVALID);
 }
 
@@ -2382,6 +2471,8 @@ static void rq_offline_rt(struct rq *rq)
  */
 static void switched_from_rt(struct rq *rq, struct task_struct *p)
 {
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
+
 	/*
 	 * If there are other RT tasks then we will reschedule
 	 * and the scheduling of the other RT tasks will handle
@@ -2389,10 +2480,12 @@ static void switched_from_rt(struct rq *rq, struct task_struct *p)
 	 * we may need to handle the pulling of RT tasks
 	 * now.
 	 */
-	if (!task_on_rq_queued(p) || rq->rt.rt_nr_running)
+	if (!task_on_rq_queued(p) || rt_rq->rt_nr_running)
 		return;
 
+#ifndef CONFIG_RT_GROUP_SCHED
 	rt_queue_pull_task(rq);
+#endif
 }
 
 void __init init_sched_rt_class(void)
@@ -2429,8 +2522,16 @@ static void switched_to_rt(struct rq *rq, struct task_struct *p)
 	 */
 	if (task_on_rq_queued(p)) {
 #ifdef CONFIG_SMP
+#ifndef CONFIG_RT_GROUP_SCHED
 		if (p->nr_cpus_allowed > 1 && rq->rt.overloaded)
 			rt_queue_push_tasks(rq);
+#else
+		if (rt_rq_of_se(&p->rt)->overloaded) {
+		} else {
+			if (p->prio < rq->curr->prio)
+				resched_curr(rq);
+		}
+#endif
 #endif /* CONFIG_SMP */
 		if (p->prio < rq->donor->prio && cpu_online(cpu_of(rq)))
 			resched_curr(rq);
@@ -2444,6 +2545,10 @@ static void switched_to_rt(struct rq *rq, struct task_struct *p)
 static void
 prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
 {
+#ifdef CONFIG_SMP
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
+#endif
+
 	if (!task_on_rq_queued(p))
 		return;
 
@@ -2453,14 +2558,16 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
 		 * If our priority decreases while running, we
 		 * may need to pull tasks to this runqueue.
 		 */
+#ifndef CONFIG_RT_GROUP_SCHED
 		if (oldprio < p->prio)
 			rt_queue_pull_task(rq);
+#endif
 
 		/*
 		 * If there's a higher priority task waiting to run
 		 * then reschedule.
 		 */
-		if (p->prio > rq->rt.highest_prio.curr)
+		if (p->prio > rt_rq->highest_prio.curr)
 			resched_curr(rq);
 #else
 		/* For UP simply resched on drop of prio */
@@ -2468,6 +2575,15 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, int oldprio)
 			resched_curr(rq);
 #endif /* CONFIG_SMP */
 	} else {
+		/*
+		 * This task is not running, thus we check against the currently
+		 * running task for preemption. We can preempt only if both tasks are
+		 * in the same cgroup or on the global runqueue.
+		 */
+		if (IS_ENABLED(CONFIG_RT_GROUP_SCHED) &&
+		    rt_rq_of_se(&p->rt)->tg != rt_rq_of_se(&rq->curr->rt)->tg)
+			return;
+
 		/*
 		 * This task is not running, but if it is
 		 * greater than the current running task
@@ -2539,12 +2655,12 @@ static void task_tick_rt(struct rq *rq, struct task_struct *p, int queued)
 	 * Requeue to the end of queue if we (and all of our ancestors) are not
 	 * the only element on the queue
 	 */
-	for_each_sched_rt_entity(rt_se) {
-		if (rt_se->run_list.prev != rt_se->run_list.next) {
-			requeue_task_rt(rq, p, 0);
-			resched_curr(rq);
-			return;
-		}
+	if (rt_se->run_list.prev != rt_se->run_list.next) {
+		requeue_task_rt(rq, p, 0);
+		resched_curr(rq);
+		// set_tsk_need_resched(p);
+
+		return;
 	}
 }
 
@@ -2562,16 +2678,16 @@ static unsigned int get_rr_interval_rt(struct rq *rq, struct task_struct *task)
 #ifdef CONFIG_SCHED_CORE
 static int task_is_throttled_rt(struct task_struct *p, int cpu)
 {
-	struct rt_rq *rt_rq;
-
 #ifdef CONFIG_RT_GROUP_SCHED // XXX maybe add task_rt_rq(), see also sched_rt_period_rt_rq
+	struct rt_rq *rt_rq;
+	
 	rt_rq = task_group(p)->rt_rq[cpu];
 	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
+
+	return dl_group_of(rt_rq)->dl_throttled;
 #else
-	rt_rq = &cpu_rq(cpu)->rt;
+	return 0;
 #endif
-
-	return rt_rq_throttled(rt_rq);
 }
 #endif
 
@@ -2655,8 +2771,8 @@ static int tg_rt_schedulable(struct task_group *tg, void *data)
 	unsigned long total, sum = 0;
 	u64 period, runtime;
 
-	period = ktime_to_ns(tg->rt_bandwidth.rt_period);
-	runtime = tg->rt_bandwidth.rt_runtime;
+	period  = tg->dl_bandwidth.dl_period;
+	runtime = tg->dl_bandwidth.dl_runtime;
 
 	if (tg == d->tg) {
 		period = d->rt_period;
@@ -2672,8 +2788,7 @@ static int tg_rt_schedulable(struct task_group *tg, void *data)
 	/*
 	 * Ensure we don't starve existing RT tasks if runtime turns zero.
 	 */
-	if (rt_bandwidth_enabled() && !runtime &&
-	    tg->rt_bandwidth.rt_runtime && tg_has_rt_tasks(tg))
+	if (dl_bandwidth_enabled() && !runtime && tg_has_rt_tasks(tg))
 		return -EBUSY;
 
 	if (WARN_ON(!rt_group_sched_enabled() && tg != &root_task_group))
@@ -2687,12 +2802,17 @@ static int tg_rt_schedulable(struct task_group *tg, void *data)
 	if (total > to_ratio(global_rt_period(), global_rt_runtime()))
 		return -EINVAL;
 
+	if (tg == &root_task_group) {
+		if (!dl_check_tg(total))
+			return -EBUSY;
+	}
+
 	/*
 	 * The sum of our children's runtime should not exceed our own.
 	 */
 	list_for_each_entry_rcu(child, &tg->children, siblings) {
-		period = ktime_to_ns(child->rt_bandwidth.rt_period);
-		runtime = child->rt_bandwidth.rt_runtime;
+		period  = child->dl_bandwidth.dl_period;
+		runtime = child->dl_bandwidth.dl_runtime;
 
 		if (child == d->tg) {
 			period = d->rt_period;
@@ -2718,6 +2838,20 @@ static int __rt_schedulable(struct task_group *tg, u64 period, u64 runtime)
 		.rt_runtime = runtime,
 	};
 
+	/*
+	* Since we truncate DL_SCALE bits, make sure we're at least
+	* that big.
+	*/
+	if (runtime != 0 && runtime < (1ULL << DL_SCALE))
+		return -EINVAL;
+
+	/*
+	* Since we use the MSB for wrap-around and sign issues, make
+	* sure it's not set (mind that period can be equal to zero).
+	*/
+	if (period & (1ULL << 63))
+		return -EINVAL;
+
 	rcu_read_lock();
 	ret = walk_tg_tree(tg_rt_schedulable, tg_nop, &data);
 	rcu_read_unlock();
@@ -2752,18 +2886,21 @@ static int tg_set_rt_bandwidth(struct task_group *tg,
 	if (err)
 		goto unlock;
 
-	raw_spin_lock_irq(&tg->rt_bandwidth.rt_runtime_lock);
-	tg->rt_bandwidth.rt_period = ns_to_ktime(rt_period);
-	tg->rt_bandwidth.rt_runtime = rt_runtime;
+	raw_spin_lock_irq(&tg->dl_bandwidth.dl_runtime_lock);
+	tg->dl_bandwidth.dl_period  = rt_period;
+	tg->dl_bandwidth.dl_runtime = rt_runtime;
 
-	for_each_possible_cpu(i) {
-		struct rt_rq *rt_rq = tg->rt_rq[i];
+	if (tg == &root_task_group)
+		goto unlock_bandwidth;
 
-		raw_spin_lock(&rt_rq->rt_runtime_lock);
-		rt_rq->rt_runtime = rt_runtime;
-		raw_spin_unlock(&rt_rq->rt_runtime_lock);
+	for_each_possible_cpu(i) {
+		if (!dl_init_tg(tg->dl_se[i], rt_runtime, rt_period)) {
+			err = -EINVAL;
+			break;
+		}
 	}
-	raw_spin_unlock_irq(&tg->rt_bandwidth.rt_runtime_lock);
+unlock_bandwidth:
+	raw_spin_unlock_irq(&tg->dl_bandwidth.dl_runtime_lock);
 unlock:
 	mutex_unlock(&rt_constraints_mutex);
 
@@ -2774,7 +2911,7 @@ int sched_group_set_rt_runtime(struct task_group *tg, long rt_runtime_us)
 {
 	u64 rt_runtime, rt_period;
 
-	rt_period = ktime_to_ns(tg->rt_bandwidth.rt_period);
+	rt_period  = tg->dl_bandwidth.dl_period;
 	rt_runtime = (u64)rt_runtime_us * NSEC_PER_USEC;
 	if (rt_runtime_us < 0)
 		rt_runtime = RUNTIME_INF;
@@ -2788,10 +2925,10 @@ long sched_group_rt_runtime(struct task_group *tg)
 {
 	u64 rt_runtime_us;
 
-	if (tg->rt_bandwidth.rt_runtime == RUNTIME_INF)
+	if (tg->dl_bandwidth.dl_runtime == RUNTIME_INF)
 		return -1;
 
-	rt_runtime_us = tg->rt_bandwidth.rt_runtime;
+	rt_runtime_us = tg->dl_bandwidth.dl_runtime;
 	do_div(rt_runtime_us, NSEC_PER_USEC);
 	return rt_runtime_us;
 }
@@ -2804,7 +2941,7 @@ int sched_group_set_rt_period(struct task_group *tg, u64 rt_period_us)
 		return -EINVAL;
 
 	rt_period = rt_period_us * NSEC_PER_USEC;
-	rt_runtime = tg->rt_bandwidth.rt_runtime;
+	rt_runtime = tg->dl_bandwidth.dl_runtime;
 
 	return tg_set_rt_bandwidth(tg, rt_period, rt_runtime);
 }
@@ -2813,7 +2950,7 @@ long sched_group_rt_period(struct task_group *tg)
 {
 	u64 rt_period_us;
 
-	rt_period_us = ktime_to_ns(tg->rt_bandwidth.rt_period);
+	rt_period_us = tg->dl_bandwidth.dl_period;
 	do_div(rt_period_us, NSEC_PER_USEC);
 	return rt_period_us;
 }
@@ -2834,7 +2971,7 @@ static int sched_rt_global_constraints(void)
 int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk)
 {
 	/* Don't accept real-time tasks when there is no way for them to run */
-	if (rt_group_sched_enabled() && rt_task(tsk) && tg->rt_bandwidth.rt_runtime == 0)
+	if (rt_group_sched_enabled() && rt_task(tsk) && tg->dl_bandwidth.dl_runtime == 0)
 		return 0;
 
 	return 1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 439a95239..c7227a510 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -318,6 +318,13 @@ struct rt_bandwidth {
 	unsigned int		rt_period_active;
 };
 
+struct dl_bandwidth {
+	raw_spinlock_t          dl_runtime_lock;
+	u64                     dl_runtime;
+	u64                     dl_period;
+};
+
+
 static inline int dl_bandwidth_enabled(void)
 {
 	return sysctl_sched_rt_runtime >= 0;
@@ -385,6 +392,8 @@ extern void dl_server_init(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq,
 		    struct rq *served_rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task);
+int dl_check_tg(unsigned long total);
+int dl_init_tg(struct sched_dl_entity *dl_se, u64 rt_runtime, u64 rt_period);
 
 extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p);
@@ -455,9 +464,15 @@ struct task_group {
 
 #ifdef CONFIG_RT_GROUP_SCHED
 	struct sched_rt_entity	**rt_se;
+	/*
+	 * The scheduling entities for the task group are managed as a single
+	 * sched_dl_entity, each of them sharing the same dl_bandwidth.
+	 */
+	struct sched_dl_entity	**dl_se;
 	struct rt_rq		**rt_rq;
 
 	struct rt_bandwidth	rt_bandwidth;
+	struct dl_bandwidth	dl_bandwidth;
 #endif
 
 #ifdef CONFIG_EXT_GROUP_SCHED
@@ -552,9 +567,9 @@ extern void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b);
 extern void unthrottle_cfs_rq(struct cfs_rq *cfs_rq);
 extern bool cfs_task_bw_constrained(struct task_struct *p);
 
-extern void init_tg_rt_entry(struct task_group *tg, struct rt_rq *rt_rq,
-		struct sched_rt_entity *rt_se, int cpu,
-		struct sched_rt_entity *parent);
+extern void init_tg_rt_entry(struct task_group *tg, struct rq *s_rq,
+		struct sched_dl_entity *rt_se, int cpu,
+		struct sched_dl_entity *parent);
 extern int sched_group_set_rt_runtime(struct task_group *tg, long rt_runtime_us);
 extern int sched_group_set_rt_period(struct task_group *tg, u64 rt_period_us);
 extern long sched_group_rt_runtime(struct task_group *tg);
@@ -784,7 +799,7 @@ struct scx_rq {
 
 static inline int rt_bandwidth_enabled(void)
 {
-	return sysctl_sched_rt_runtime >= 0;
+	return 0;
 }
 
 /* RT IPI pull logic requires IRQ_WORK */
@@ -820,12 +835,12 @@ struct rt_rq {
 	raw_spinlock_t		rt_runtime_lock;
 
 	unsigned int		rt_nr_boosted;
-
-	struct rq		*rq; /* this is always top-level rq, cache? */
 #endif
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group	*tg; /* this tg has "this" rt_rq on given CPU for runnable entities */
 #endif
+
+	struct rq		*rq; /* this is always top-level rq, cache? */
 };
 
 static inline bool rt_rq_is_runnable(struct rt_rq *rt_rq)
@@ -2174,7 +2189,7 @@ static inline void set_task_rq(struct task_struct *p, unsigned int cpu)
 	if (!rt_group_sched_enabled())
 		tg = &root_task_group;
 	p->rt.rt_rq  = tg->rt_rq[cpu];
-	p->rt.parent = tg->rt_se[cpu];
+	p->dl.dl_rq  = &cpu_rq(cpu)->dl;
 #endif
 }
 
@@ -2702,6 +2717,7 @@ extern void resched_cpu(int cpu);
 extern void init_rt_bandwidth(struct rt_bandwidth *rt_b, u64 period, u64 runtime);
 extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
 
+void init_dl_bandwidth(struct dl_bandwidth *dl_b, u64 period, u64 runtime);
 extern void init_dl_entity(struct sched_dl_entity *dl_se);
 
 #define BW_SHIFT		20
@@ -2760,6 +2776,7 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 
 static inline void sub_nr_running(struct rq *rq, unsigned count)
 {
+	BUG_ON(rq->nr_running < count);
 	rq->nr_running -= count;
 	if (trace_sched_update_nr_running_tp_enabled()) {
 		call_trace_sched_update_nr_running(rq, -count);
@@ -3131,9 +3148,6 @@ static inline void double_rq_unlock(struct rq *rq1, struct rq *rq2)
 #ifdef CONFIG_RT_GROUP_SCHED
 static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
 {
-#ifdef CONFIG_SCHED_DEBUG
-	WARN_ON_ONCE(rt_se->my_q);
-#endif
 	return container_of(rt_se, struct task_struct, rt);
 }
 
@@ -3153,6 +3167,21 @@ static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
 
 	return rt_rq->rq;
 }
+
+static inline int is_dl_group(struct rt_rq *rt_rq)
+{
+	return rt_rq->tg != &root_task_group;
+}
+
+/*
+ * Return the scheduling entity of this group of tasks.
+ */
+static inline struct sched_dl_entity *dl_group_of(struct rt_rq *rt_rq)
+{
+	BUG_ON(!is_dl_group(rt_rq));
+
+	return rt_rq->tg->dl_se[cpu_of(rt_rq->rq)];
+}
 #else
 static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
 {
@@ -3177,6 +3206,16 @@ static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
 
 	return &rq->rt;
 }
+
+static inline int is_dl_group(struct rt_rq *rt_rq)
+{
+	return 0;
+}
+
+static inline struct sched_dl_entity *dl_group_of(struct rt_rq *rt_rq)
+{
+	return NULL;
+}
 #endif
 
 DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 547c1f05b..6c6666b39 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -635,8 +635,8 @@ int __sched_setscheduler(struct task_struct *p,
 		 * assigned.
 		 */
 		if (rt_group_sched_enabled() &&
-				rt_bandwidth_enabled() && rt_policy(policy) &&
-				task_group(p)->rt_bandwidth.rt_runtime == 0 &&
+				dl_bandwidth_enabled() && rt_policy(policy) &&
+				task_group(p)->dl_bandwidth.dl_runtime == 0 &&
 				!task_group_is_autogroup(task_group(p))) {
 			retval = -EPERM;
 			goto unlock;
-- 
2.49.0

