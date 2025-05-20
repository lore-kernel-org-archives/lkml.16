Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFBA265CAC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736335; cv=none; b=bmxEesC4Ki80GuHHhmadCi4ip05YX+BsWxy4CRpav6QRVS3suWCWt8bIknMBHm4z941bPmFYCKYkNFO05mCtnzY9p5kmVUDw5NqoRW9dDhTURkdiGxLGa7gbFieKXNYfhK9KruSR9NrOmob/Su7029WMRwJcEpUX1N73MtAaaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736335; c=relaxed/simple;
	bh=ZFZHPQB2gr7QrnWvcowqbVRfTF6upcz8CBZDjNdGW+w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=qtjEo9Ne5fHqLYffHQN98OVeovBvd6gKo5DKhcshHH7jX/02Dlig7b2IgVM2CPgKk5CeaFo6ebavhg91t66aOIYERPbq/zz6Q7hq+u5XqGSS+Y25Tb25qZiOu669AB+2Eoxza1HB8tfQ7/pNMO8PegBdZ4/Vzzs3ZCQ+DHT89CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lVTkAkRM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lVTkAkRM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=dirTgPpnRB9/rGEebkVK3Wz8ypqGQFLT/f1SYZQ6aJs=; b=lVTkAkRMZQqgdbUrym6f8BdRNK
	nZDbeTn+1EZ111LfCdMraFR5B5Sxw/VbVH07P3HwlH1ZMPkw1RJdsXnYdDxOHiP1F6PTn/6baWjWb
	6mG1OUPmBalFGg0+QD0S40fF7FAvzObdP4bLwyvH2J4Yr9tsdc9at2g5w2VVEae5HbvyGcTKWo5kE
	YrpDlXKX+HzveGc9xX8HXFSr+wtOhoP6UlHeIFTwbLtRBdQjXO2MY1aNua+gPu+AxWXIdeqw+37Cw
	8nyiFx3Fy5lvPos8UZIpeJRje1yxbXRvPT0UTQX9r0kvlYSjs1X+Nb3P51sLyj0LrTN4VKVRfHoGg
	5CjPtDzQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK3Z-000000038Hf-2SAU;
	Tue, 20 May 2025 10:18:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B75FE300780; Tue, 20 May 2025 12:18:44 +0200 (CEST)
Message-ID: <20250520101727.507378961@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 20 May 2025 11:45:39 +0200
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
Subject: [RFC][PATCH 1/5] sched/deadline: Less agressive dl_server handling
References: <20250520094538.086709102@infradead.org>
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
---
 include/linux/sched.h   |    1 +
 kernel/sched/deadline.c |   31 +++++++++++++++++++++++++++----
 2 files changed, 28 insertions(+), 4 deletions(-)

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -702,6 +702,7 @@ struct sched_dl_entity {
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
@@ -1672,7 +1677,7 @@ void dl_server_start(struct sched_dl_ent
 		resched_curr(dl_se->rq);
 }
 
-void dl_server_stop(struct sched_dl_entity *dl_se)
+static void __dl_server_stop(struct sched_dl_entity *dl_se)
 {
 	if (!dl_se->dl_runtime)
 		return;
@@ -1684,6 +1689,24 @@ void dl_server_stop(struct sched_dl_enti
 	dl_se->dl_server_active = 0;
 }
 
+static bool dl_server_stopped(struct sched_dl_entity *dl_se)
+{
+	if (!dl_se->dl_server_active)
+		return false;
+
+	if (dl_se->dl_server_idle) {
+		__dl_server_stop(dl_se);
+		return true;
+	}
+
+	dl_se->dl_server_idle = 1;
+	return false;
+}
+
+void dl_server_stop(struct sched_dl_entity *dl_se)
+{
+}
+
 void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task)
@@ -2435,7 +2458,7 @@ static struct task_struct *__pick_task_d
 	if (dl_server(dl_se)) {
 		p = dl_se->server_pick_task(dl_se);
 		if (!p) {
-			if (dl_server_active(dl_se)) {
+			if (!dl_server_stopped(dl_se)) {
 				dl_se->dl_yielded = 1;
 				update_curr_dl_se(rq, dl_se, 0);
 			}


