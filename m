Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF325E476
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736335; cv=none; b=nUCxlm3GP36tQdxkNDX0jNEshTwCMtBk6ctSSDCMLy7H6zQ3wWj4mbTK0xq0Fpa0z8+AwdBAMSg4D6XgzIE/Fdnfb3aop/NaQIfhkHUU6ti4QAqlY1rqvJsYoF9TGy0jJLn2CU18LHXA8ualB/jfhgBixK2uSbId9Ti3fJc/2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736335; c=relaxed/simple;
	bh=Hr6d9QqfhpyBMqwme4pL/ldeGpvoK0ymIRDWfZdq7G0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=kus2HadhLhgdPchJsjSLhdWWLvXKzZqWoNZpAU4SHIHqT6U4OP7YhGDH8yZHYGp7fmuY8VRzkV9Z49J8YvyDNcsGYPYGaSORbl5FhptGWyoT9P8/u5zST2DO5kAGMgmitwxAQV8wSvgAC0SGHz0YHgPNK7leFIkVmlRQweWQDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dQPOkxJ3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dQPOkxJ3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=2dngSsfqes/njR321qIM0PyOlDn4Zv4ZW2UR6zyFv48=; b=dQPOkxJ3A34AZk1NMZk1k8GhWl
	0uCxIKblZJvGvHC2j2I0+KqOv1EBEZguxRM+2G/LE5ou7gNZbiyodJ5hzJNOvVUL6nrM+ErZzeGEZ
	6ZQmIWuvLZrxaF/8wej25BAjsKJHbhlxmskngpTGoXajEpgVCiPuYlnLUlsEUrcVaV1PLEhxntqnP
	JYUUa+CAZBpBhrXVytuODw+wbR0v2QCtcdyfgV/bbyIScV51kaaiUvS9Bl085mUXmqpPyqzzaq2s/
	ZBV5I+AnWQ2TT3fX6sVzxm5E/tSRAg5YrY23yKlS5D6trJ82JGawb4DVQID91NOyL/w1ZWYELN88r
	OJx7bqFA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK3Z-000000038Hd-2Q0l;
	Tue, 20 May 2025 10:18:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C1DD9300F1A; Tue, 20 May 2025 12:18:44 +0200 (CEST)
Message-ID: <20250520101727.874587738@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 20 May 2025 11:45:42 +0200
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
Subject: [RFC][PATCH 4/5] sched: Add ttwu_queue controls
References: <20250520094538.086709102@infradead.org>
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
---
 kernel/sched/core.c     |   22 ++++++++++++----------
 kernel/sched/features.h |    2 ++
 kernel/sched/sched.h    |    2 ++
 3 files changed, 16 insertions(+), 10 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3928,7 +3928,7 @@ bool cpus_share_resources(int this_cpu,
 	return per_cpu(sd_share_id, this_cpu) == per_cpu(sd_share_id, that_cpu);
 }
 
-static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
+static inline bool ttwu_queue_cond(struct task_struct *p, int cpu, bool def)
 {
 	/* See SCX_OPS_ALLOW_QUEUED_WAKEUP. */
 	if (!scx_allow_ttwu_queue(p))
@@ -3969,18 +3969,19 @@ static inline bool ttwu_queue_cond(struc
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
 
-	return false;
+	if (!ttwu_queue_cond(p, cpu, def))
+		return false;
+
+	sched_clock_cpu(cpu); /* Sync clocks across CPUs */
+	__ttwu_queue_wakelist(p, cpu, wake_flags);
+	return true;
 }
 
 #else /* !CONFIG_SMP */
@@ -3997,7 +3998,7 @@ static void ttwu_queue(struct task_struc
 	struct rq *rq = cpu_rq(cpu);
 	struct rq_flags rf;
 
-	if (ttwu_queue_wakelist(p, cpu, wake_flags))
+	if (sched_feat(TTWU_QUEUE) && ttwu_queue_wakelist(p, cpu, wake_flags))
 		return;
 
 	rq_lock(rq, &rf);
@@ -4301,7 +4302,8 @@ int try_to_wake_up(struct task_struct *p
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
@@ -2312,6 +2312,8 @@ static inline int task_on_rq_migrating(s
 #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU. */
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
 
+#define WF_ON_CPU		0x0100
+
 #ifdef CONFIG_SMP
 static_assert(WF_EXEC == SD_BALANCE_EXEC);
 static_assert(WF_FORK == SD_BALANCE_FORK);


