Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669D21348
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390719; cv=none; b=XRV9t82P6HgZY/m7xRLsdiRi4/1VXa/fQ4MNb+oL+B0qhDoHJVSkjcwQ+TRUgqB6qUEXwYb37Tigt66Y91KZX/wMLjHp4ITqV5DBwVV1A7/I20izudPcR/5azOHL2pD/qAyL8tiTokWS+36nbw/SKI0k1OIZL4xveAzpcGlWyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390719; c=relaxed/simple;
	bh=MrP6EsJqviAhQz4o3MRxgRSgg/Abz7EHwXfiwjVApKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TixGZ9oAChIlkvlGh8yO40i3sbGwg3bdY3Hi2bpZ2dWRCGOvsHGWXGPt5ZG0Ckiq9fXX7wkg7l/ptoU3Fo0fvwNIOctcwn9L86OJvj07dsZ2XzYwfTAvOn5G9KvaaO5pcbjczEhR6tL2dBtyxBXsWD1kwwQzf8JgEROBzIZCGyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dBv+liR1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dBv+liR1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ED8saWIDf+VhAgkMufv/m3ti9EfjBcQPJpBZsJ4x8p0=; b=dBv+liR1bQtYaPdMqR0ivYfECM
	FYG8GvsZz/OKi+ra++m7CePM2hpQL10Cw4oNHnlS7HnhS2Q1tEV3HgI5rh1dLHdoMO+/0L6iqZ6hs
	3R9p4Bgoebv8udyVL/LHmxr4P0Qqe8gxYscktLiuT0fi26QCuTM2P21upg5ORFUAYGD21OCkAcES+
	ZkNVtqYQGi3ohJv0XJ6Eb2YDOU7c5YQA57kZS5tejzByQ4Gy01cUPEk3bP1UQYl164xdIJ9JGQdEY
	3zjxVMplm6MiQte5HkEQZW1P4sJqNoW7k0DFo9to6RXz+gf5y9/5FPdojllgdQyi+zNabVbsBc/Vu
	96SQJM8w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFs91-000000003dp-1tp9;
	Fri, 16 May 2025 10:18:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6C587300780; Fri, 16 May 2025 12:18:22 +0200 (CEST)
Date: Fri, 16 May 2025 12:18:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	dietmar.eggemann@arm.com, vschneid@redhat.com,
	Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250516101822.GC16434@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>

On Mon, May 12, 2025 at 06:35:24PM -0400, Chris Mason wrote:

Right, so I can reproduce on Thomas' SKL and maybe see some of it on my
SPR.

I've managed to discover a whole bunch of ways that ttwu() can explode
again :-) But as you surmised, your workload *LOVES* TTWU_QUEUE, and
DELAYED_DEQUEUE takes some of that away, because those delayed things
remain on-rq and ttwu() can't deal with that other than by doing the
wakeup in-line and that's exactly the thing this workload hates most.

(I'll keep poking at ttwu() to see if I can get a combination of
TTWU_QUEUE and DELAYED_DEQUEUE that does not explode in 'fun' ways)

However, I've found that flipping the default in ttwu_queue_cond() seems
to make up for quite a bit -- for your workload.

(basically, all the work we can get away from those pinned message CPUs
is a win)

Also, meanwhile you discovered that the other part of your performance
woes were due to dl_server, specifically, disabling that gave you back a
healthy chunk of your performance.

The problem is indeed that we toggle the dl_server on every nr_running
from 0 and to 0 transition, and your workload has a shit-ton of those,
so every time we get the overhead of starting and stopping this thing.

In hindsight, that's a fairly stupid setup, and the below patch changes
this to keep the dl_server around until it's not seen fair activity for
a whole period. This appears to fully recover this dip.

Trouble seems to be that dl_server_update() always gets tickled by
random garbage, so in the end the dl_server never stops... oh well.

Juri, could you have a look at this, perhaps I messed up something
trivial -- its been like that this week :/

---
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..1f92572b20c0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -702,6 +702,7 @@ struct sched_dl_entity {
 	unsigned int			dl_defer	  : 1;
 	unsigned int			dl_defer_armed	  : 1;
 	unsigned int			dl_defer_running  : 1;
+	unsigned int			dl_server_idle    : 1;
 
 	/*
 	 * Bandwidth enforcement timer. Each -deadline task has its
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba0..010537a2f368 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3964,7 +3964,7 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
 	if (!cpu_rq(cpu)->nr_running)
 		return true;
 
-	return false;
+	return sched_feat(TTWU_QUEUE_DEFAULT);
 }
 
 static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..dce3a95cb8bc 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1639,8 +1639,10 @@ void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
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
@@ -1663,20 +1665,24 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 		setup_new_dl_entity(dl_se);
 	}
 
-	if (!dl_se->dl_runtime)
+	if (!dl_se->dl_runtime || dl_se->dl_server_active)
 		return;
 
+	trace_printk("dl_server starting\n");
+
 	dl_se->dl_server_active = 1;
 	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
 	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))
 		resched_curr(dl_se->rq);
 }
 
-void dl_server_stop(struct sched_dl_entity *dl_se)
+static void __dl_server_stop(struct sched_dl_entity *dl_se)
 {
 	if (!dl_se->dl_runtime)
 		return;
 
+	trace_printk("dl_server stopping\n");
+
 	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
 	hrtimer_try_to_cancel(&dl_se->dl_timer);
 	dl_se->dl_defer_armed = 0;
@@ -1684,6 +1690,10 @@ void dl_server_stop(struct sched_dl_entity *dl_se)
 	dl_se->dl_server_active = 0;
 }
 
+void dl_server_stop(struct sched_dl_entity *dl_se)
+{
+}
+
 void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task)
@@ -2436,6 +2446,9 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 		p = dl_se->server_pick_task(dl_se);
 		if (!p) {
 			if (dl_server_active(dl_se)) {
+				if (dl_se->dl_server_idle)
+					__dl_server_stop(dl_se);
+				dl_se->dl_server_idle = 1;
 				dl_se->dl_yielded = 1;
 				update_curr_dl_se(rq, dl_se, 0);
 			}
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 3c12d9f93331..75aa7fdc4c98 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -81,6 +81,7 @@ SCHED_FEAT(TTWU_QUEUE, false)
  */
 SCHED_FEAT(TTWU_QUEUE, true)
 #endif
+SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
 
 /*
  * When doing wakeups, attempt to limit superfluous scans of the LLC domain.
