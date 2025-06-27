Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA82BEFED
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025121; cv=none; b=HJHHpLZ8akLKJrA8AFW+QouJ7Y47fIFWXxtCuAsX4RC4Itci+RpIh3Mq5ZZ9PJGcQJuyc78KdgXNo426X/aQiNqZypF3gAsinAygpxkHmYKlnW97C4D7QNVP5a6KTiP63QKfvY0iPvBVgBYGl1K7v6aDUwoWuRYKBO9DMHsRB6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025121; c=relaxed/simple;
	bh=yy9+hyWkYP4tu1FrbCNzXA6zJDfHt7+xCgmHezVuEBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srqTNe5syjkcLzXgT2RKx5MARQmPLasKAZN68/vcZXuKE/GZxyMxy6tXONqFwkRo3vkYyUbCoGFS1OsyjgFO5ganAvXyXDqt7l1+T7Qtt7vx75meMxM2UraW/8yeNSdLxgqL3hSxPYOH561CJGtiJwWPYkoY4GvltAHqTSI2ZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2VfLTmc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O2VfLTmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgBU5EWmfQae5vywUt8Oy8bOTjAoEHoV5AIpgE2mQsQ=;
	b=O2VfLTmcBot4RNsu9JH9RsV4IVWwQKb6Y/7NXN0k4GB7QdXOQgSZ2njg6ZMlcHvpVIapgy
	F235wwaekPn/FmXVKSN+LxbHo1RbhQ76KWp7djJkNkkYOKisxweGzjFv1MeDUVofd/n3nk
	avT6hLtkSBGBuqywFzUoIFWoohMrazg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-pzEuy2HsMsW8mA7AV8t7UA-1; Fri,
 27 Jun 2025 07:51:55 -0400
X-MC-Unique: pzEuy2HsMsW8mA7AV8t7UA-1
X-Mimecast-MFC-AGG-ID: pzEuy2HsMsW8mA7AV8t7UA_1751025114
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FA6E1944A83;
	Fri, 27 Jun 2025 11:51:53 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.44.32.84])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2685819560A7;
	Fri, 27 Jun 2025 11:51:47 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 1/5] sched/deadline: Initialize dl_servers after SMP
Date: Fri, 27 Jun 2025 13:51:14 +0200
Message-ID: <20250627115118.438797-2-juri.lelli@redhat.com>
In-Reply-To: <20250627115118.438797-1-juri.lelli@redhat.com>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

dl-servers are currently initialized too early at boot when CPUs are not
fully up (only boot CPU is). This results in miscalculation of per
runqueue DEADLINE variables like extra_bw (which needs a stable CPU
count).

Move initialization of dl-servers later on after SMP has been
initialized and CPUs are all online, so that CPU count is stable and
DEADLINE variables can be computed correctly.

Fixes: d741f297bceaf ("sched/fair: Fair server interface")
Reported-by: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/core.c     |  2 ++
 kernel/sched/deadline.c | 50 ++++++++++++++++++++++++++---------------
 kernel/sched/sched.h    |  1 +
 3 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2f8caa9db78d5..89b3ed637465b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8371,6 +8371,8 @@ void __init sched_init_smp(void)
 	init_sched_rt_class();
 	init_sched_dl_class();
 
+	sched_init_dl_servers();
+
 	sched_smp_initialized = true;
 }
 
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0f30697ad7956..c1f223f372968 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -761,6 +761,8 @@ static inline void setup_new_dl_entity(struct sched_dl_entity *dl_se)
 	struct dl_rq *dl_rq = dl_rq_of_se(dl_se);
 	struct rq *rq = rq_of_dl_rq(dl_rq);
 
+	update_rq_clock(rq);
+
 	WARN_ON(is_dl_boosted(dl_se));
 	WARN_ON(dl_time_before(rq_clock(rq), dl_se->deadline));
 
@@ -1580,23 +1582,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 {
 	struct rq *rq = dl_se->rq;
 
-	/*
-	 * XXX: the apply do not work fine at the init phase for the
-	 * fair server because things are not yet set. We need to improve
-	 * this before getting generic.
-	 */
-	if (!dl_server(dl_se)) {
-		u64 runtime =  50 * NSEC_PER_MSEC;
-		u64 period = 1000 * NSEC_PER_MSEC;
-
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
-		dl_se->dl_server = 1;
-		dl_se->dl_defer = 1;
-		setup_new_dl_entity(dl_se);
-	}
-
-	if (!dl_se->dl_runtime)
+	if (!dl_server(dl_se))
 		return;
 
 	dl_se->dl_server_active = 1;
@@ -1607,7 +1593,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
 {
-	if (!dl_se->dl_runtime)
+	if (!dl_server(dl_se) || !dl_server_active(dl_se))
 		return;
 
 	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
@@ -1626,6 +1612,32 @@ void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 	dl_se->server_pick_task = pick_task;
 }
 
+void sched_init_dl_servers(void)
+{
+	int cpu;
+	struct rq *rq;
+	struct sched_dl_entity *dl_se;
+
+	for_each_online_cpu(cpu) {
+		u64 runtime =  50 * NSEC_PER_MSEC;
+		u64 period = 1000 * NSEC_PER_MSEC;
+
+		rq = cpu_rq(cpu);
+
+		guard(rq_lock_irq)(rq);
+
+		dl_se = &rq->fair_server;
+
+		WARN_ON(dl_server(dl_se));
+
+		dl_server_apply_params(dl_se, runtime, period, 1);
+
+		dl_se->dl_server = 1;
+		dl_se->dl_defer = 1;
+		setup_new_dl_entity(dl_se);
+	}
+}
+
 void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq)
 {
 	u64 new_bw = dl_se->dl_bw;
@@ -1652,6 +1664,8 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	int retval = 0;
 	int cpus;
 
+	guard(rcu)();
+
 	dl_b = dl_bw_of(cpu);
 	guard(raw_spinlock)(&dl_b->lock);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 105190b180203..3058fb6246dab 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -385,6 +385,7 @@ extern void dl_server_stop(struct sched_dl_entity *dl_se);
 extern void dl_server_init(struct sched_dl_entity *dl_se, struct rq *rq,
 		    dl_server_has_tasks_f has_tasks,
 		    dl_server_pick_f pick_task);
+extern void sched_init_dl_servers(void);
 
 extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p);
-- 
2.49.0

