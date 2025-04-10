Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72311DFDE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268125; cv=none; b=mhPidgj/C4t43v5MwjdEhK6+0ndTxGYtvppM9lQOfXPt8/N8qc+2xRUdOe0OsPVwEE5dijaWpHK/KPowhD9VC6o4t7vNRqXFbGWBXzwBUQ3RlOR3RWlFrm4+Hffi+BJKRfzLLkARwwY6CXQStJjYxiN8VtuiMgErtTKUZHfsJic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268125; c=relaxed/simple;
	bh=Fqg/agp7563nGgeRo5aO2HlnmEbJrIDD4haZiuSZkTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cw7S3XAohfy0X9cBGvGk+vt/3XIIJatzfz+lvKaAtFslYorGf9nsk3lSyYSXFD3TiN4bwS1iH6Zy/fQWvzvVTZoi1VbnMtYNRajRAJFFox1ZB+S27GZrqDXoTYum9J1MS2PNyS4qxCfwBkmkumx11/S2wxIFR8cdvKSXdRfWgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQkVDhui; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQkVDhui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744268122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HfQ5GS63VmIBRIWR3Z2+I8/qh3pNi/suhHnlLPBFM9U=;
	b=jQkVDhuilfE4krT+MPPBUNR2eBEdnx7dYAlRShVIYeCINomBq/Uqlw4tIWWJvdV5y2LtiG
	KoNSNRyj8QSidG+Dip8Vok+FzMfCK3OnlNJEnQQO83zH64HCDds2W1R5KI8p3f7JZOidxS
	KKdmJtR/j2SUlGAnic6XMRQUEecFGAo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-TXYdlN6eMb2Ojcd6gbDJAg-1; Thu,
 10 Apr 2025 02:55:19 -0400
X-MC-Unique: TXYdlN6eMb2Ojcd6gbDJAg-1
X-Mimecast-MFC-AGG-ID: TXYdlN6eMb2Ojcd6gbDJAg_1744268118
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34A97180035E;
	Thu, 10 Apr 2025 06:55:18 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.134])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8B7321955BEF;
	Thu, 10 Apr 2025 06:55:15 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH] timers: Exclude isolated cpus from timer migation
Date: Thu, 10 Apr 2025 08:54:47 +0200
Message-ID: <20250410065446.57304-2-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The timer migration mechanism allows timers to move from idle CPUs to
active ones to improve the overall idle time. This is however undesired
when CPU intensive workloads run on isolated cores, as the algorithm
would move the timers from housekeeping to isolated cores, negatively
affecting the isolation.

Exclude isolated cores from the timer migration algorithm, extend the
concept of unavailable cores, currently used for offline ones, to
isolated ones:
 * A core is unavailable if isolated or offline;
 * A core is available if isolated and offline;

Keep a cpumap to easily track unavailable cores and change the concept
of online/offline tmigr to available/unavailable in code and
tracepoints.

A core is considered unavailable as idle if:
 * is in the isolcpus list
 * is in the nohz_full list
 * is in an isolated cpuset

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/timer.h                  |  6 +++
 include/trace/events/timer_migration.h |  4 +-
 kernel/cgroup/cpuset.c                 | 15 +++---
 kernel/time/timer_migration.c          | 72 +++++++++++++++++++++-----
 kernel/time/timer_migration.h          |  2 +-
 5 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a346..27fb02aa3d780 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -190,4 +190,10 @@ int timers_dead_cpu(unsigned int cpu);
 #define timers_dead_cpu		NULL
 #endif
 
+#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
+extern int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);
+#else
+static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
+#endif
+
 #endif
diff --git a/include/trace/events/timer_migration.h b/include/trace/events/timer_migration.h
index 47db5eaf2f9ab..61171b13c687c 100644
--- a/include/trace/events/timer_migration.h
+++ b/include/trace/events/timer_migration.h
@@ -173,14 +173,14 @@ DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_active,
 	TP_ARGS(tmc)
 );
 
-DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_online,
+DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_available,
 
 	TP_PROTO(struct tmigr_cpu *tmc),
 
 	TP_ARGS(tmc)
 );
 
-DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_offline,
+DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_unavailable,
 
 	TP_PROTO(struct tmigr_cpu *tmc),
 
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 306b604300914..47495ba4012b5 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1323,7 +1323,7 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
 	return isolcpus_updated;
 }
 
-static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
+static void update_unbound_interference_cpumask(bool isolcpus_updated)
 {
 	int ret;
 
@@ -1334,6 +1334,9 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+
+	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
+	WARN_ON_ONCE(ret < 0);
 }
 
 /**
@@ -1454,7 +1457,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	list_add(&cs->remote_sibling, &remote_children);
 	cpumask_copy(cs->effective_xcpus, tmp->new_cpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_unbound_interference_cpumask(isolcpus_updated);
 	cpuset_force_rebuild();
 	cs->prs_err = 0;
 
@@ -1495,7 +1498,7 @@ static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
 	compute_effective_exclusive_cpumask(cs, NULL, NULL);
 	reset_partition_data(cs);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_unbound_interference_cpumask(isolcpus_updated);
 	cpuset_force_rebuild();
 
 	/*
@@ -1563,7 +1566,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 	if (xcpus)
 		cpumask_copy(cs->exclusive_cpus, xcpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_unbound_interference_cpumask(isolcpus_updated);
 	if (adding || deleting)
 		cpuset_force_rebuild();
 
@@ -1906,7 +1909,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		WARN_ON_ONCE(parent->nr_subparts < 0);
 	}
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_unbound_interference_cpumask(isolcpus_updated);
 
 	if ((old_prs != new_prs) && (cmd == partcmd_update))
 		update_partition_exclusive_flag(cs, new_prs);
@@ -2931,7 +2934,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 	else if (isolcpus_updated)
 		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_unbound_interference_cpumask(isolcpus_updated);
 
 	/* Force update if switching back to member & update effective_xcpus */
 	update_cpumasks_hier(cs, &tmpmask, !new_prs);
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 2f6330831f084..c1f7de1d28ab8 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/timerqueue.h>
 #include <trace/events/ipi.h>
+#include <linux/sched/isolation.h>
 
 #include "timer_migration.h"
 #include "tick-internal.h"
@@ -422,12 +423,15 @@ static unsigned int tmigr_crossnode_level __read_mostly;
 
 static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
 
+/*  cpumask excluded from migration */
+static cpumask_var_t tmigr_unavailable_cpumask;
+
 #define TMIGR_NONE	0xFF
 #define BIT_CNT		8
 
 static inline bool tmigr_is_not_available(struct tmigr_cpu *tmc)
 {
-	return !(tmc->tmgroup && tmc->online);
+	return !(tmc->tmgroup && tmc->available);
 }
 
 /*
@@ -926,7 +930,7 @@ static void tmigr_handle_remote_cpu(unsigned int cpu, u64 now,
 	 * updated the event takes care when hierarchy is completely
 	 * idle. Otherwise the migrator does it as the event is enqueued.
 	 */
-	if (!tmc->online || tmc->remote || tmc->cpuevt.ignore ||
+	if (!tmc->available || tmc->remote || tmc->cpuevt.ignore ||
 	    now < tmc->cpuevt.nextevt.expires) {
 		raw_spin_unlock_irq(&tmc->lock);
 		return;
@@ -973,7 +977,7 @@ static void tmigr_handle_remote_cpu(unsigned int cpu, u64 now,
 	 * (See also section "Required event and timerqueue update after a
 	 * remote expiry" in the documentation at the top)
 	 */
-	if (!tmc->online || !tmc->idle) {
+	if (!tmc->available || !tmc->idle) {
 		timer_unlock_remote_bases(cpu);
 		goto unlock;
 	}
@@ -1435,55 +1439,88 @@ static long tmigr_trigger_active(void *unused)
 {
 	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
 
-	WARN_ON_ONCE(!tmc->online || tmc->idle);
+	WARN_ON_ONCE(!tmc->available || tmc->idle);
 
 	return 0;
 }
 
-static int tmigr_cpu_offline(unsigned int cpu)
+static int tmigr_cpu_unavailable(unsigned int cpu)
 {
-	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
+	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
 	int migrator;
 	u64 firstexp;
 
 	raw_spin_lock_irq(&tmc->lock);
-	tmc->online = false;
+	tmc->available = false;
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
+	cpumask_set_cpu(cpu, tmigr_unavailable_cpumask);
 
 	/*
 	 * CPU has to handle the local events on his own, when on the way to
 	 * offline; Therefore nextevt value is set to KTIME_MAX
 	 */
 	firstexp = __tmigr_cpu_deactivate(tmc, KTIME_MAX);
-	trace_tmigr_cpu_offline(tmc);
+	trace_tmigr_cpu_unavailable(tmc);
 	raw_spin_unlock_irq(&tmc->lock);
 
 	if (firstexp != KTIME_MAX) {
-		migrator = cpumask_any_but(cpu_online_mask, cpu);
+		migrator = cpumask_nth_andnot(0, cpu_possible_mask,
+					      tmigr_unavailable_cpumask);
+		/* Fall back to any online in case all are isolated. */
+		if (migrator >= nr_cpu_ids)
+			migrator = cpumask_any_but(cpu_online_mask, cpu);
 		work_on_cpu(migrator, tmigr_trigger_active, NULL);
 	}
 
 	return 0;
 }
 
-static int tmigr_cpu_online(unsigned int cpu)
+static int tmigr_cpu_available(unsigned int cpu)
 {
-	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
+	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
 
 	/* Check whether CPU data was successfully initialized */
 	if (WARN_ON_ONCE(!tmc->tmgroup))
 		return -EINVAL;
 
+	/* Silently ignore online requests if isolated */
+	if (cpu_is_isolated(cpu))
+		return 0;
 	raw_spin_lock_irq(&tmc->lock);
-	trace_tmigr_cpu_online(tmc);
+	trace_tmigr_cpu_available(tmc);
 	tmc->idle = timer_base_is_idle();
 	if (!tmc->idle)
 		__tmigr_cpu_activate(tmc);
-	tmc->online = true;
+	tmc->available = true;
+	tmc->idle = true;
+	cpumask_clear_cpu(cpu, tmigr_unavailable_cpumask);
 	raw_spin_unlock_irq(&tmc->lock);
 	return 0;
 }
 
+int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
+{
+	int cpu;
+	cpumask_var_t cpumask;
+
+	if (!zalloc_cpumask_var(&cpumask, GFP_KERNEL))
+		return -ENOMEM;
+
+	cpumask_copy(cpumask, tmigr_unavailable_cpumask);
+
+	/* Was not excluded but should be excluded now. */
+	for_each_cpu_andnot(cpu, exclude_cpumask, cpumask)
+		tmigr_cpu_unavailable(cpu);
+
+	/* Was excluded but should be included now */
+	for_each_cpu_andnot(cpu, cpumask, exclude_cpumask)
+		if (cpu_online(cpu))
+			tmigr_cpu_available(cpu);
+
+	free_cpumask_var(cpumask);
+	return 0;
+}
+
 static void tmigr_init_group(struct tmigr_group *group, unsigned int lvl,
 			     int node)
 {
@@ -1801,6 +1838,13 @@ static int __init tmigr_init(void)
 	if (ncpus == 1)
 		return 0;
 
+	if (!zalloc_cpumask_var(&tmigr_unavailable_cpumask, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	/* Will be set by tmigr_cpu_available */
+	cpumask_setall(tmigr_unavailable_cpumask);
+
 	/*
 	 * Calculate the required hierarchy levels. Unfortunately there is no
 	 * reliable information available, unless all possible CPUs have been
@@ -1850,7 +1894,7 @@ static int __init tmigr_init(void)
 		goto err;
 
 	ret = cpuhp_setup_state(CPUHP_AP_TMIGR_ONLINE, "tmigr:online",
-				tmigr_cpu_online, tmigr_cpu_offline);
+				tmigr_cpu_available, tmigr_cpu_unavailable);
 	if (ret)
 		goto err;
 
diff --git a/kernel/time/timer_migration.h b/kernel/time/timer_migration.h
index ae19f70f8170f..70879cde6fdd0 100644
--- a/kernel/time/timer_migration.h
+++ b/kernel/time/timer_migration.h
@@ -97,7 +97,7 @@ struct tmigr_group {
  */
 struct tmigr_cpu {
 	raw_spinlock_t		lock;
-	bool			online;
+	bool			available;
 	bool			idle;
 	bool			remote;
 	struct tmigr_group	*tmgroup;

base-commit: 3b07108ada81a8ebcebf1fe61367b4e436c895bd
-- 
2.49.0

