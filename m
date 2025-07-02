Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C427465A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458383; cv=none; b=WT9aHkLDAEvY0XEIYabyterAvOfccUvJPNfGtUOxNftf4eQ3Q/Ywu3QPDdWbI3pyjQ+YF4BKjrinwm/ncCZ5Zudrrln7YHm1cB7Kjfd0DkJdEV4IzZKTefxgdYiYkjXaNA2TIWVhYtEK44GQDEJi0CSc4GszRNRaJ1tEuAkeyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458383; c=relaxed/simple;
	bh=P8jphMyMMPpfZst8bg+ufd2/3jz+uX9EB9UuFN8r+0g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=JSQWcNB0oXuTmDCPbewMpAzQwwsa8+CW9/RgPgp3E6Am0iVTeko/1kE432IuRNxtbk+vbH2ptwI8xs1v8Bp82Fu4tRJMCb2uts366d0z5cZ7iNWpN1dkXEpEPRe72KHerTpv7B6xP9nNILG6fL1XlVghNI75JMBzBuEkJN6pQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UPZGRsJ3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UPZGRsJ3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=6xCtwYthTWBcEmQ5LUN1G1tEYsMC0rBESkEr3zoStCA=; b=UPZGRsJ3JQo4jYqfnYr22wPqps
	fdJIVOGFTZ4Dq+vueGR4oXN5AjidByT9lu0XsN0NGqmtD/Gl/PvB9bQ7l8AxGmXOeC/YztEDHmDdX
	beUzaugyJ60aOEpMnzf6aIEu+R7zq/xQecJqN5qxWUDSBJ87IXKsrTZyIt5piQwUJaLhjpZKImfdO
	UTXlcK4c6f35K7x/gnh1wb3cFjRInoLvys4KZhh9ThH2CZjhqdx+KDDXLec9nvx5Ih4dH/gSEzuKK
	S082KVk2OGMX2yqpZoSUhyeU4JinBVe/hIStQhpb21ZupcBuOdc7SxcZixvp3XYSgLr/93TIDDQFo
	cH4WuCBg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000009lFA-3yzX;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D4E1F3001F7; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121159.050144163@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:31 +0200
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
 peterz@infradead.org
Subject: [PATCH v2 07/12] psi: Split psi_ttwu_dequeue()
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Currently psi_ttwu_dequeue() is called while holding p->pi_lock and
takes rq->lock. Split the function in preparation for calling
ttwu_do_migration() while already holding rq->lock.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |   18 ++++++++++++++----
 kernel/sched/stats.h |   24 +++++++++++++-----------
 2 files changed, 27 insertions(+), 15 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3774,17 +3774,27 @@ static int ttwu_runnable(struct task_str
 	return 1;
 }
 
-static inline bool ttwu_do_migrate(struct task_struct *p, int cpu)
+static inline bool ttwu_do_migrate(struct rq *rq, struct task_struct *p, int cpu)
 {
+	struct rq *p_rq = rq ? : task_rq(p);
+
 	if (task_cpu(p) == cpu)
 		return false;
 
 	if (p->in_iowait) {
 		delayacct_blkio_end(p);
-		atomic_dec(&task_rq(p)->nr_iowait);
+		atomic_dec(&p_rq->nr_iowait);
 	}
 
-	psi_ttwu_dequeue(p);
+	if (psi_ttwu_need_dequeue(p)) {
+		if (rq) {
+			lockdep_assert(task_rq(p) == rq);
+			__psi_ttwu_dequeue(p);
+		} else {
+			guard(__task_rq_lock)(p);
+			__psi_ttwu_dequeue(p);
+		}
+	}
 	set_task_cpu(p, cpu);
 	return true;
 }
@@ -4283,7 +4293,7 @@ int try_to_wake_up(struct task_struct *p
 		 * their previous state and preserve Program Order.
 		 */
 		smp_cond_load_acquire(&p->on_cpu, !VAL);
-		if (ttwu_do_migrate(p, cpu))
+		if (ttwu_do_migrate(NULL, p, cpu))
 			wake_flags |= WF_MIGRATED;
 
 		ttwu_queue(p, cpu, wake_flags);
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -191,23 +191,24 @@ static inline void psi_dequeue(struct ta
 	psi_task_change(p, p->psi_flags, 0);
 }
 
-static inline void psi_ttwu_dequeue(struct task_struct *p)
+static inline bool psi_ttwu_need_dequeue(struct task_struct *p)
 {
 	if (static_branch_likely(&psi_disabled))
-		return;
+		return false;
 	/*
 	 * Is the task being migrated during a wakeup? Make sure to
 	 * deregister its sleep-persistent psi states from the old
 	 * queue, and let psi_enqueue() know it has to requeue.
 	 */
-	if (unlikely(p->psi_flags)) {
-		struct rq_flags rf;
-		struct rq *rq;
-
-		rq = __task_rq_lock(p, &rf);
-		psi_task_change(p, p->psi_flags, 0);
-		__task_rq_unlock(rq, &rf);
-	}
+	if (!likely(!p->psi_flags))
+		return false;
+
+	return true;
+}
+
+static inline void __psi_ttwu_dequeue(struct task_struct *p)
+{
+	psi_task_change(p, p->psi_flags, 0);
 }
 
 static inline void psi_sched_switch(struct task_struct *prev,
@@ -223,7 +224,8 @@ static inline void psi_sched_switch(stru
 #else /* !CONFIG_PSI: */
 static inline void psi_enqueue(struct task_struct *p, bool migrate) {}
 static inline void psi_dequeue(struct task_struct *p, bool migrate) {}
-static inline void psi_ttwu_dequeue(struct task_struct *p) {}
+static inline bool psi_ttwu_need_dequeue(struct task_struct *p) { return false; }
+static inline void __psi_ttwu_dequeue(struct task_struct *p) {}
 static inline void psi_sched_switch(struct task_struct *prev,
 				    struct task_struct *next,
 				    bool sleep) {}


