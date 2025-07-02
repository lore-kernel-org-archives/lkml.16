Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B198274668
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458382; cv=none; b=r6o2KKn6M2jaQ+ZBT3oRTuTD5CB99QXIzd7ZYun/4QN3nZaFiOxNpMWi3SKsj+kGaNn4LAPMfY1A702iu6Qx+blCnWwUKKUcjM7NfZgJeAod2yz8FzkCl6oyzHXxU8reVfPOcaBMUn0ziIWcjaQZ2Rl6SfrjCz6aUeb/U9ySao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458382; c=relaxed/simple;
	bh=98o4EUwZvkaJiNLHs0TNmxNMeC//8w5lyaohIp/i0gc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=reJHuaEoV95pyn95bSTdBF4ZMAguQMOmUGnl+eu0ki+hofgB5+RAYQ08F5zpjus0cMiVtS8ldh98xcpi/citpbfCIM5nQmnu9M9BKRrdHiMR5V76OIx7g3GwQ9qYaCCeMWis0viCIkl3lqMh6KvRvl8wEZ+xCmnq5HJ+EUFE4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lpIgoQbS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lpIgoQbS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=QQTEg01HMGHcuECpwoqe+vJNXoQ2Sir/0YX71f4+jJQ=; b=lpIgoQbS7GXrdriJDYOyAFWJ6j
	07riU9eKQpNScyeKeEC46zoeabwfcpKGP+sf95E2DxPnwjxyooJtAUwpa9hV2oH9q+n9O2cSBAeAZ
	9rtPDG9ognst698Hdf31ckB4zwoQJh99bZeS8eNaEcYiA4WJtrvzsKJczi4NBG8XtQESTsOm4+8Zf
	/kbmeNydesD5NpOEk3euXA5dJBXCcwhGYnSQLBzdCcf4mD+morqgqFX117k54oOuVrR9JQvT5OF9q
	e+J42+MijhuNVLsiCPv4iXU9GbZlL3oqdFoIfbUxQHT9CVifY1IYAUxmpA7MALsHbrjqT/JbUfvGP
	8gKJXY/g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKV-00000009lF1-3VB2;
	Wed, 02 Jul 2025 12:12:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BF363300158; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121158.465086194@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:26 +0200
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
Subject: [PATCH v2 02/12] sched/deadline: Less agressive dl_server handling
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Chris reported that commit 5f6bd380c7bd ("sched/rt: Remove default
bandwidth control") caused a significant dip in his favourite
benchmark of the day. Simply disabling dl_server cured things.

His workload hammers the 0->1, 1->0 transitions, and the
dl_server_{start,stop}() overhead kills it -- fairly obviously a bad
idea in hind sight and all that.

Change things around to only disable the dl_server when there has not
been a fair task around for a whole period. Since the default period
is 1 second, this ensures the benchmark never trips this, overhead
gone.

Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
Reported-by: Chris Mason <clm@meta.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20250520101727.507378961@infradead.org
---
 include/linux/sched.h   |    1 +
 kernel/sched/deadline.c |   25 ++++++++++++++++++++++---
 kernel/sched/fair.c     |    9 ---------
 3 files changed, 23 insertions(+), 12 deletions(-)

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -701,6 +701,7 @@ struct sched_dl_entity {
 	unsigned int			dl_defer	  : 1;
 	unsigned int			dl_defer_armed	  : 1;
 	unsigned int			dl_defer_running  : 1;
+	unsigned int			dl_server_idle    : 1;
 
 	/*
 	 * Bandwidth enforcement timer. Each -deadline task has its
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1215,6 +1215,8 @@ static void __push_dl_task(struct rq *rq
 /* a defer timer will not be reset if the runtime consumed was < dl_server_min_res */
 static const u64 dl_server_min_res = 1 * NSEC_PER_MSEC;
 
+static bool dl_server_stopped(struct sched_dl_entity *dl_se);
+
 static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_dl_entity *dl_se)
 {
 	struct rq *rq = rq_of_dl_se(dl_se);
@@ -1234,6 +1236,7 @@ static enum hrtimer_restart dl_server_ti
 
 		if (!dl_se->server_has_tasks(dl_se)) {
 			replenish_dl_entity(dl_se);
+			dl_server_stopped(dl_se);
 			return HRTIMER_NORESTART;
 		}
 
@@ -1639,8 +1642,10 @@ void dl_server_update_idle_time(struct r
 void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec)
 {
 	/* 0 runtime = fair server disabled */
-	if (dl_se->dl_runtime)
+	if (dl_se->dl_runtime) {
+		dl_se->dl_server_idle = 0;
 		update_curr_dl_se(dl_se->rq, dl_se, delta_exec);
+	}
 }
 
 void dl_server_start(struct sched_dl_entity *dl_se)
@@ -1663,7 +1668,7 @@ void dl_server_start(struct sched_dl_ent
 		setup_new_dl_entity(dl_se);
 	}
 
-	if (!dl_se->dl_runtime)
+	if (!dl_se->dl_runtime || dl_se->dl_server_active)
 		return;
 
 	dl_se->dl_server_active = 1;
@@ -1684,6 +1689,20 @@ void dl_server_stop(struct sched_dl_enti
 	dl_se->dl_server_active = 0;
 }
 
+static bool dl_server_stopped(struct sched_dl_entity *dl_se)
+{
+	if (!dl_se->dl_server_active)
+		return false;
+
+	if (dl_se->dl_server_idle) {
+		dl_server_stop(dl_se);
+		return true;
+	}
+
+	dl_se->dl_server_idle = 1;
+	return false;
+}
+
 void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task)
@@ -2435,7 +2454,7 @@ static struct task_struct *__pick_task_d
 	if (dl_server(dl_se)) {
 		p = dl_se->server_pick_task(dl_se);
 		if (!p) {
-			if (dl_server_active(dl_se)) {
+			if (!dl_server_stopped(dl_se)) {
 				dl_se->dl_yielded = 1;
 				update_curr_dl_se(rq, dl_se, 0);
 			}
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5879,7 +5879,6 @@ static bool throttle_cfs_rq(struct cfs_r
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
 	struct sched_entity *se;
 	long queued_delta, runnable_delta, idle_delta, dequeue = 1;
-	long rq_h_nr_queued = rq->cfs.h_nr_queued;
 
 	raw_spin_lock(&cfs_b->lock);
 	/* This will start the period timer if necessary */
@@ -5963,10 +5962,6 @@ static bool throttle_cfs_rq(struct cfs_r
 
 	/* At this point se is NULL and we are at root level*/
 	sub_nr_running(rq, queued_delta);
-
-	/* Stop the fair server if throttling resulted in no runnable tasks */
-	if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
-		dl_server_stop(&rq->fair_server);
 done:
 	/*
 	 * Note: distribution will already see us throttled via the
@@ -7060,7 +7055,6 @@ static void set_next_buddy(struct sched_
 static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 {
 	bool was_sched_idle = sched_idle_rq(rq);
-	int rq_h_nr_queued = rq->cfs.h_nr_queued;
 	bool task_sleep = flags & DEQUEUE_SLEEP;
 	bool task_delayed = flags & DEQUEUE_DELAYED;
 	struct task_struct *p = NULL;
@@ -7144,9 +7138,6 @@ static int dequeue_entities(struct rq *r
 
 	sub_nr_running(rq, h_nr_queued);
 
-	if (rq_h_nr_queued && !rq->cfs.h_nr_queued)
-		dl_server_stop(&rq->fair_server);
-
 	/* balance early to pull high priority tasks */
 	if (unlikely(!was_sched_idle && sched_idle_rq(rq)))
 		rq->next_balance = jiffies;


