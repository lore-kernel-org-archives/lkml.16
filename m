Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A922741DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458382; cv=none; b=G2h+Tj+p3R4tZ39J3RZ5whrxvqRHUBTxoLqLm4hy+v0XwDsSbTQegNpSPUn3YGlhahXwOtFrNwr9LPkl0AEMHgVTlEztTMlreLThXmsAwcztRqrRiKNlQzPJwLB3+razjOwUVnTONA+krP5XZBdB3w5w1VPmt/tnZy5pYgiPVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458382; c=relaxed/simple;
	bh=p7DxqYTTk43dYWRzOSrkfoujbipH4msjgVgZ8LgoCWc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=e6btn4nTtH5/sBz+7z+iHMDsZn4zKrNfP/xafBoDga6Yiu+ay1xZvGmQZNX/NmWdKptJ7fJkf4bQPHZEI37kvEKGZXx7oJsICZIEoOeAAWVQqobOI+1JjzzvgBqWUePsO/roxfdQiQmYE8MEGMCRSXcdMhZrMnMEuHOydWUhqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EL706pbK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EL706pbK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=NLnZWeYHXBrSO+2NOeqRavvBvOOcXGVwtmqJ2vX+26g=; b=EL706pbKezLobM8owKANqdxfTh
	Tk/0XhgHEukPEt2PpV7eKodWchuU5sKg1bNCQKN/1QfBh25VoPdjoDOWrYoq/QGWtxp/8gxJTaOIe
	dqEaMFdTp52BkUhhse0Gen39MDiWEVEM71XN059XU2i7sJbUkNwQ4j6TMxp36yD6A8nzTGuQOqxS6
	9TSkhowlZeOUK/DotZJyJ7F5cjdcW8a5GJg0+PUbe/2jTH1STId0YydPNcN66andcn4bBqTvxNlLC
	G6bDpmUmjB2cH/0cNL5/GVghgSx/LPtseEWJVcOinI32MB+Zf+S/mCniulu8kOXwTVCqnZq769xeN
	e4NllWkA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwKW-00000009lFB-02Nf;
	Wed, 02 Jul 2025 12:12:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id CC7F43001E4; Wed, 02 Jul 2025 14:12:46 +0200 (CEST)
Message-ID: <20250702121158.817814031@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 02 Jul 2025 13:49:29 +0200
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
Subject: [PATCH v2 05/12] sched: Add ttwu_queue controls
References: <20250702114924.091581796@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

There are two (soon three) callers of ttwu_queue_wakelist(),
distinguish them with their own WF_ and add some knobs on.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/20250520101727.874587738@infradead.org
---
 kernel/sched/core.c     |   22 ++++++++++++----------
 kernel/sched/features.h |    2 ++
 kernel/sched/sched.h    |    2 ++
 3 files changed, 16 insertions(+), 10 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3888,7 +3888,7 @@ bool cpus_share_resources(int this_cpu,
 	return per_cpu(sd_share_id, this_cpu) == per_cpu(sd_share_id, that_cpu);
 }
 
-static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
+static inline bool ttwu_queue_cond(struct task_struct *p, int cpu, bool def)
 {
 	/* See SCX_OPS_ALLOW_QUEUED_WAKEUP. */
 	if (!scx_allow_ttwu_queue(p))
@@ -3929,18 +3929,19 @@ static inline bool ttwu_queue_cond(struc
 	if (!cpu_rq(cpu)->nr_running)
 		return true;
 
-	return false;
+	return def;
 }
 
 static bool ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
 {
-	if (sched_feat(TTWU_QUEUE) && ttwu_queue_cond(p, cpu)) {
-		sched_clock_cpu(cpu); /* Sync clocks across CPUs */
-		__ttwu_queue_wakelist(p, cpu, wake_flags);
-		return true;
-	}
+	bool def = sched_feat(TTWU_QUEUE_DEFAULT);
+
+	if (!ttwu_queue_cond(p, cpu, def))
+		return false;
 
-	return false;
+	sched_clock_cpu(cpu); /* Sync clocks across CPUs */
+	__ttwu_queue_wakelist(p, cpu, wake_flags);
+	return true;
 }
 
 static void ttwu_queue(struct task_struct *p, int cpu, int wake_flags)
@@ -3948,7 +3949,7 @@ static void ttwu_queue(struct task_struc
 	struct rq *rq = cpu_rq(cpu);
 	struct rq_flags rf;
 
-	if (ttwu_queue_wakelist(p, cpu, wake_flags))
+	if (sched_feat(TTWU_QUEUE) && ttwu_queue_wakelist(p, cpu, wake_flags))
 		return;
 
 	rq_lock(rq, &rf);
@@ -4251,7 +4252,8 @@ int try_to_wake_up(struct task_struct *p
 		 * scheduling.
 		 */
 		if (smp_load_acquire(&p->on_cpu) &&
-		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
+		    sched_feat(TTWU_QUEUE_ON_CPU) &&
+		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_ON_CPU))
 			break;
 
 		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -81,6 +81,8 @@ SCHED_FEAT(TTWU_QUEUE, false)
  */
 SCHED_FEAT(TTWU_QUEUE, true)
 #endif
+SCHED_FEAT(TTWU_QUEUE_ON_CPU, true)
+SCHED_FEAT(TTWU_QUEUE_DEFAULT, false)
 
 /*
  * When doing wakeups, attempt to limit superfluous scans of the LLC domain.
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2279,6 +2279,8 @@ static inline int task_on_rq_migrating(s
 #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU. */
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
 
+#define WF_ON_CPU		0x0100
+
 static_assert(WF_EXEC == SD_BALANCE_EXEC);
 static_assert(WF_FORK == SD_BALANCE_FORK);
 static_assert(WF_TTWU == SD_BALANCE_WAKE);


