Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3241FDA82
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107667; cv=none; b=gaGfUyWohGqLMJktcKBnjqnb/D6VW5pTZfUtKaGMJXJaDXLv6kKmH4S1LhNXN1kBIFKjpF4e0KIIUSJ6Tfpk+znq4cOOPs1mK7Gg1XqomdzAS+VdalRKEQCRHifNxRDe2w1sI+IBRBJN0ay8rQOHMSLCyDNrgx5tgkGbydhswsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107667; c=relaxed/simple;
	bh=UoC0y3XzkHe79zWkNZv4k4ntOhTVcahJJcfVmOpGZqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNfii3akFLNrLBs0qA8uHlvXME6FNWjmgvyOSTal5HqoGjfQXX7GMxFEjiUwYzadftwT2G5DiZWwJbx6aC1VPJ5P5Kmiid7mUVUhIM6sSZHKwWTWr28Uieiyg3r8dMIu17FYmsQRk51Ff67HYeNFPHUYA12ZME7/p1eewRyhZmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJIjcInl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJIjcInl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a510432236so494586f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107664; x=1749712464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRIm7kyVhWBvt0NqPziCsA+yLvnjZzIa36x2nFgwovA=;
        b=FJIjcInl6CULNxYJMhQAfMMIiWGsM1iq/Pyai7VGBk59xjqYu9l+55NTv4nlS8hqAn
         uMYlYMb5wpUWPi4iJzp3wDJXBljmyhbTPxA0VjdWsH9LwumJYupY3PIa5vbDAU1GP1Ri
         gFPhZvKwalTh7iR/bH57DHe4/C+jE7BMigVGrxr5sX7QxtEtn6J1eZOcRwe1Hr003T5d
         30ZD4Ymospey25MadpnB8iCgKxnAZOtFYTXAiT43DvsF8tlcPVL5X4+q8blwVK0NYd24
         uJvX6sINNRuagep9CuZq2BAXiROTZSKqevDe3fnFDIjtAUf2RKIQ5EmDH6fqW7Ax6mv0
         HnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107664; x=1749712464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRIm7kyVhWBvt0NqPziCsA+yLvnjZzIa36x2nFgwovA=;
        b=icL52Hq7M9qpkFXmBqYwr0YPWJHk2KkILuUzBIX3ooRgd2uZ2XU521F5BWC/pZ8EON
         PsAfBzvdTwKaaSSjfK118C+cVUwM7NII8Zt+Xdzhvuq+cyM8hhuYTCdGhP/prSexSsZH
         ceCOjx96w63aafunc8s7OyQ/jTu1KglHJM38bXAWVfxEjz1ZwZYlojqifI1xeNuS3htR
         wrJ4sQ1AgbhZhgTf756AYCRJ7OEeUhRnTo+xqyKTBLRmWdlnfrkddPVW8N3QN7H76Vfj
         DUpCQOKtpNFjLRaYKtauZFWFWR90cXpY5bPDOH2XI/Fgr/zLPRiLkGbyN2jlv+F9Hr4O
         MjTg==
X-Gm-Message-State: AOJu0YxXym2qq7wLYw2Mv/AzLnBj7IfK2HSdgAYnXU1WYe3MuUD+xYcF
	3ZWbm8fzj6hcbU+FyguHpEpSfhLps5aOkBHyEZV3WzeT0pSY1MFj4nQf
X-Gm-Gg: ASbGnctcBLtt5xV91NgJwQfeghn2rZnHhmLO36fQuvjDZjk8sz1jbrIWJEd/yVe81q/
	+OZ6nNM0iBhh8gE+FW2J9YoDiE1zLL5zloEdekBG9GedRcRJ3taqMnwRjlY6yYBq4vUZ00hPCVV
	zDhBYJjGsj88fGQlK8G9gmLYUm2CfRalANjbn4mJuS3tYEOSjPsaeQriXAPc/iHAuNVdXbOn6NO
	rBZGU6JTqspNyGX8Xts06ExhLE9QGsPRxQJ9pmGBNYFzpLD3WIW5cx/JEBfl1Ohew6hbRDBz6s7
	N5sesHq4hALfjNuuxy8IzG7dQs8aS2y0qwcy4RWvonJmSr5Wmory1rbdgwx6ehux
X-Google-Smtp-Source: AGHT+IEB8tlx2hjQr+o8vhPYrXPROkc1rZxHVlD+XndPBlUlG8sisk9j+Skh1AbLwWvbnyQ1YkGDvg==
X-Received: by 2002:a05:6000:4287:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3a51d959f72mr4912018f8f.33.1749107663311;
        Thu, 05 Jun 2025 00:14:23 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:22 -0700 (PDT)
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
Subject: [RFC PATCH 3/9] sched/rt: Pass an rt_rq instead of an rq where needed
Date: Thu,  5 Jun 2025 09:14:06 +0200
Message-ID: <20250605071412.139240-4-yurand2000@gmail.com>
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

Make rt.c code access the runqueue through the rt_rq data structure rather than
passing an rq pointer directly. This allows future patches to define rt_rq data
structures which do not refer only to the global runqueue, but also to local
cgroup runqueues (rt_rq is not always equal to &rq->rt).

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/rt.c | 87 +++++++++++++++++++++++++----------------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37..046a89fc7 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -371,9 +371,9 @@ static inline void rt_clear_overload(struct rq *rq)
 	cpumask_clear_cpu(rq->cpu, rq->rd->rto_mask);
 }
 
-static inline int has_pushable_tasks(struct rq *rq)
+static inline int has_pushable_tasks(struct rt_rq *rt_rq)
 {
-	return !plist_head_empty(&rq->rt.pushable_tasks);
+	return !plist_head_empty(&rt_rq->pushable_tasks);
 }
 
 static DEFINE_PER_CPU(struct balance_callback, rt_push_head);
@@ -384,7 +384,7 @@ static void pull_rt_task(struct rq *);
 
 static inline void rt_queue_push_tasks(struct rq *rq)
 {
-	if (!has_pushable_tasks(rq))
+	if (!has_pushable_tasks(&rq->rt))
 		return;
 
 	queue_balance_callback(rq, &per_cpu(rt_push_head, rq->cpu), push_rt_tasks);
@@ -395,48 +395,48 @@ static inline void rt_queue_pull_task(struct rq *rq)
 	queue_balance_callback(rq, &per_cpu(rt_pull_head, rq->cpu), pull_rt_task);
 }
 
-static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
+static void enqueue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 {
-	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
+	plist_del(&p->pushable_tasks, &rt_rq->pushable_tasks);
 	plist_node_init(&p->pushable_tasks, p->prio);
-	plist_add(&p->pushable_tasks, &rq->rt.pushable_tasks);
+	plist_add(&p->pushable_tasks, &rt_rq->pushable_tasks);
 
 	/* Update the highest prio pushable task */
-	if (p->prio < rq->rt.highest_prio.next)
-		rq->rt.highest_prio.next = p->prio;
+	if (p->prio < rt_rq->highest_prio.next)
+		rt_rq->highest_prio.next = p->prio;
 
-	if (!rq->rt.overloaded) {
-		rt_set_overload(rq);
-		rq->rt.overloaded = 1;
+	if (!rt_rq->overloaded) {
+		rt_set_overload(rq_of_rt_rq(rt_rq));
+		rt_rq->overloaded = 1;
 	}
 }
 
-static void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
+static void dequeue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 {
-	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
+	plist_del(&p->pushable_tasks, &rt_rq->pushable_tasks);
 
 	/* Update the new highest prio pushable task */
-	if (has_pushable_tasks(rq)) {
-		p = plist_first_entry(&rq->rt.pushable_tasks,
+	if (has_pushable_tasks(rt_rq)) {
+		p = plist_first_entry(&rt_rq->pushable_tasks,
 				      struct task_struct, pushable_tasks);
-		rq->rt.highest_prio.next = p->prio;
+		rt_rq->highest_prio.next = p->prio;
 	} else {
-		rq->rt.highest_prio.next = MAX_RT_PRIO-1;
+		rt_rq->highest_prio.next = MAX_RT_PRIO-1;
 
-		if (rq->rt.overloaded) {
-			rt_clear_overload(rq);
-			rq->rt.overloaded = 0;
+		if (rt_rq->overloaded) {
+			rt_clear_overload(rq_of_rt_rq(rt_rq));
+			rt_rq->overloaded = 0;
 		}
 	}
 }
 
 #else
 
-static inline void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
+static inline void enqueue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 {
 }
 
-static inline void dequeue_pushable_task(struct rq *rq, struct task_struct *p)
+static inline void dequeue_pushable_task(struct rt_rq *rt_rq, struct task_struct *p)
 {
 }
 
@@ -1479,6 +1479,7 @@ static void
 enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
+	struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
 
 	if (flags & ENQUEUE_WAKEUP)
 		rt_se->timeout = 0;
@@ -1489,17 +1490,18 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 	enqueue_rt_entity(rt_se, flags);
 
 	if (!task_current(rq, p) && p->nr_cpus_allowed > 1)
-		enqueue_pushable_task(rq, p);
+		enqueue_pushable_task(rt_rq, p);
 }
 
 static bool dequeue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
+	struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
 
 	update_curr_rt(rq);
 	dequeue_rt_entity(rt_se, flags);
 
-	dequeue_pushable_task(rq, p);
+	dequeue_pushable_task(rt_rq, p);
 
 	return true;
 }
@@ -1688,14 +1690,14 @@ static void wakeup_preempt_rt(struct rq *rq, struct task_struct *p, int flags)
 static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool first)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
-	struct rt_rq *rt_rq = &rq->rt;
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
 
 	p->se.exec_start = rq_clock_task(rq);
 	if (on_rt_rq(&p->rt))
 		update_stats_wait_end_rt(rt_rq, rt_se);
 
 	/* The running task is never eligible for pushing */
-	dequeue_pushable_task(rq, p);
+	dequeue_pushable_task(rt_rq, p);
 
 	if (!first)
 		return;
@@ -1759,7 +1761,7 @@ static struct task_struct *pick_task_rt(struct rq *rq)
 static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_struct *next)
 {
 	struct sched_rt_entity *rt_se = &p->rt;
-	struct rt_rq *rt_rq = &rq->rt;
+	struct rt_rq *rt_rq = rt_rq_of_se(&p->rt);
 
 	if (on_rt_rq(&p->rt))
 		update_stats_wait_start_rt(rt_rq, rt_se);
@@ -1773,7 +1775,7 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 	 * if it is still active
 	 */
 	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1)
-		enqueue_pushable_task(rq, p);
+		enqueue_pushable_task(rt_rq, p);
 }
 
 #ifdef CONFIG_SMP
@@ -1785,16 +1787,16 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
  * Return the highest pushable rq's task, which is suitable to be executed
  * on the CPU, NULL otherwise
  */
-static struct task_struct *pick_highest_pushable_task(struct rq *rq, int cpu)
+static struct task_struct *pick_highest_pushable_task(struct rt_rq *rt_rq, int cpu)
 {
-	struct plist_head *head = &rq->rt.pushable_tasks;
+	struct plist_head *head = &rt_rq->pushable_tasks;
 	struct task_struct *p;
 
-	if (!has_pushable_tasks(rq))
+	if (!has_pushable_tasks(rt_rq))
 		return NULL;
 
 	plist_for_each_entry(p, head, pushable_tasks) {
-		if (task_is_pushable(rq, p, cpu))
+		if (task_is_pushable(rq_of_rt_rq(rt_rq), p, cpu))
 			return p;
 	}
 
@@ -1894,14 +1896,15 @@ static int find_lowest_rq(struct task_struct *task)
 	return -1;
 }
 
-static struct task_struct *pick_next_pushable_task(struct rq *rq)
+static struct task_struct *pick_next_pushable_task(struct rt_rq *rt_rq)
 {
+	struct rq *rq = rq_of_rt_rq(rt_rq);
 	struct task_struct *p;
 
-	if (!has_pushable_tasks(rq))
+	if (!has_pushable_tasks(rt_rq))
 		return NULL;
 
-	p = plist_first_entry(&rq->rt.pushable_tasks,
+	p = plist_first_entry(&rt_rq->pushable_tasks,
 			      struct task_struct, pushable_tasks);
 
 	BUG_ON(rq->cpu != task_cpu(p));
@@ -1954,7 +1957,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 			 */
 			if (unlikely(is_migration_disabled(task) ||
 				     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
-				     task != pick_next_pushable_task(rq))) {
+				     task != pick_next_pushable_task(&rq->rt))) {
 
 				double_unlock_balance(rq, lowest_rq);
 				lowest_rq = NULL;
@@ -1988,7 +1991,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 	if (!rq->rt.overloaded)
 		return 0;
 
-	next_task = pick_next_pushable_task(rq);
+	next_task = pick_next_pushable_task(&rq->rt);
 	if (!next_task)
 		return 0;
 
@@ -2063,7 +2066,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 		 * run-queue and is also still the next task eligible for
 		 * pushing.
 		 */
-		task = pick_next_pushable_task(rq);
+		task = pick_next_pushable_task(&rq->rt);
 		if (task == next_task) {
 			/*
 			 * The task hasn't migrated, and is still the next
@@ -2251,7 +2254,7 @@ void rto_push_irq_work_func(struct irq_work *work)
 	 * We do not need to grab the lock to check for has_pushable_tasks.
 	 * When it gets updated, a check is made if a push is possible.
 	 */
-	if (has_pushable_tasks(rq)) {
+	if (has_pushable_tasks(&rq->rt)) {
 		raw_spin_rq_lock(rq);
 		while (push_rt_task(rq, true))
 			;
@@ -2280,6 +2283,7 @@ static void pull_rt_task(struct rq *this_rq)
 	int this_cpu = this_rq->cpu, cpu;
 	bool resched = false;
 	struct task_struct *p, *push_task;
+	struct rt_rq *src_rt_rq;
 	struct rq *src_rq;
 	int rt_overload_count = rt_overloaded(this_rq);
 
@@ -2309,6 +2313,7 @@ static void pull_rt_task(struct rq *this_rq)
 			continue;
 
 		src_rq = cpu_rq(cpu);
+		src_rt_rq = &src_rq->rt;
 
 		/*
 		 * Don't bother taking the src_rq->lock if the next highest
@@ -2317,7 +2322,7 @@ static void pull_rt_task(struct rq *this_rq)
 		 * logically higher, the src_rq will push this task away.
 		 * And if its going logically lower, we do not care
 		 */
-		if (src_rq->rt.highest_prio.next >=
+		if (src_rt_rq->highest_prio.next >=
 		    this_rq->rt.highest_prio.curr)
 			continue;
 
@@ -2333,7 +2338,7 @@ static void pull_rt_task(struct rq *this_rq)
 		 * We can pull only a task, which is pushable
 		 * on its rq, and no others.
 		 */
-		p = pick_highest_pushable_task(src_rq, this_cpu);
+		p = pick_highest_pushable_task(src_rt_rq, this_cpu);
 
 		/*
 		 * Do we have an RT task that preempts
-- 
2.49.0

