Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB126AAB8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844893; cv=none; b=ud5T0Lqj19VCK7yXwLJDQCJV5yWWiJqEvLrmxiqFpyWPQbt6r65FjEHQT0jAe5Xzrn02gHrBau1Q0uvFmyxYhSWf+Iq+dt18EKip2n+NsGWnD3w2hT7S1nFS8FYnShPrkllE//a3sIQx9tK3gNfansyqldpJzW/TwuhzPXn9s38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844893; c=relaxed/simple;
	bh=IkX1VgNm4xC8T0JLyDT6cVo7yPKsKtdvbJI6P7c50Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfaXx0BiUHmGhYkGhdoR0oS3d+auz2taAe2XtaaR3U2CKKwRvyBvF257AKB8sLoC9tS5Q+WhcHiylG/usXh2+HXJ2/dMmzWvyKL4h56g0KtcH74K8CKYYSO7SkUSZ+pDrCxfGORFRe8kqw4b5Zm/n4azvdk8DW+xXf9HWFEMQjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJtZYbso; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJtZYbso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745844890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OeECgjEMiQco5urhIU04+ziXhatkQ+wTnILurC9P7/Y=;
	b=iJtZYbsootbXZpZPpKFP9H9LMQfnALkIq2Jh2huIvvhREvsahD354ue2TOMhQfbQG6e7h+
	S7sLVry43NUNmUUYcTXeQasSJfmzzQwsWri9lh/bRFxp6aks5aOJWzp+nUWq0aWyleH53y
	G3NyVbLhDZcO3OR9EyBcsZaavSTEqi0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-8Z_KxyKDMZaipbzUKGWaxg-1; Mon,
 28 Apr 2025 08:54:49 -0400
X-MC-Unique: 8Z_KxyKDMZaipbzUKGWaxg-1
X-Mimecast-MFC-AGG-ID: 8Z_KxyKDMZaipbzUKGWaxg_1745844888
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FA971800877;
	Mon, 28 Apr 2025 12:54:48 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.225.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FAA019560A3;
	Mon, 28 Apr 2025 12:54:46 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v3 3/3] timers: Exclude isolated cpus from timer migation
Date: Mon, 28 Apr 2025 14:54:21 +0200
Message-ID: <20250428125417.102741-8-gmonaco@redhat.com>
In-Reply-To: <20250428125417.102741-5-gmonaco@redhat.com>
References: <20250428125417.102741-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The timer migration mechanism allows active CPUs to pull timers from
idle ones to improve the overall idle time. This is however undesired
when CPU intensive workloads run on isolated cores, as the algorithm
would move the timers from housekeeping to isolated cores, negatively
affecting the isolation.

This effect was noticed on a 128 cores machine running oslat on the
isolated cores (1-31,33-63,65-95,97-127). The tool monopolises CPUs,
and the CPU with lowest count in a timer migration hierarchy (here 1
and 65) appears as always active and continuously pulls global timers,
from the housekeeping CPUs. This ends up moving driver work (e.g.
delayed work) to isolated CPUs and causes latency spikes:

before the change:

 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
 ...
  Maximum:     1203 10 3 4 ... 5 (us)

after the change:

 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
 ...
  Maximum:      10 4 3 4 3 ... 5 (us)

Exclude isolated cores from the timer migration algorithm, extend the
concept of unavailable cores, currently used for offline ones, to
isolated ones:
* A core is unavailable if isolated or offline;
* A core is available if isolated and offline;

A core is considered unavailable as idle if:
* is in the isolcpus list
* is in the nohz_full list
* is in an isolated cpuset

Due to how the timer migration algorithm works, any CPU part of the
hierarchy can have their global timers pulled by remote CPUs and have to
pull remote timers, only skipping pulling remote timers would break the
logic.
For this reason, we prevents isolated CPUs from pulling remote global
timers, but also the other way around: any global timer started on an
isolated CPU will run there. This does not break the concept of
isolation (global timers don't come from outside the CPU) and, if
considered inappropriate, can usually be mitigated with other isolation
techniques (e.g. IRQ pinning).

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/timer.h         |  6 ++++++
 kernel/cgroup/cpuset.c        | 14 ++++++++------
 kernel/time/tick-internal.h   |  1 +
 kernel/time/timer.c           | 10 ++++++++++
 kernel/time/timer_migration.c | 33 +++++++++++++++++++++++++++++----
 5 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a346..4722e075d9843 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -190,4 +190,10 @@ int timers_dead_cpu(unsigned int cpu);
 #define timers_dead_cpu		NULL
 #endif
 
+#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
+extern void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);
+#else
+static inline void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
+#endif
+
 #endif
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 306b604300914..866b4b8188118 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1323,7 +1323,7 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
 	return isolcpus_updated;
 }
 
-static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
+static void update_exclusion_cpumasks(bool isolcpus_updated)
 {
 	int ret;
 
@@ -1334,6 +1334,8 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+
+	tmigr_isolated_exclude_cpumask(isolated_cpus);
 }
 
 /**
@@ -1454,7 +1456,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	list_add(&cs->remote_sibling, &remote_children);
 	cpumask_copy(cs->effective_xcpus, tmp->new_cpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 	cpuset_force_rebuild();
 	cs->prs_err = 0;
 
@@ -1495,7 +1497,7 @@ static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
 	compute_effective_exclusive_cpumask(cs, NULL, NULL);
 	reset_partition_data(cs);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 	cpuset_force_rebuild();
 
 	/*
@@ -1563,7 +1565,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 	if (xcpus)
 		cpumask_copy(cs->exclusive_cpus, xcpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 	if (adding || deleting)
 		cpuset_force_rebuild();
 
@@ -1906,7 +1908,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 		WARN_ON_ONCE(parent->nr_subparts < 0);
 	}
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 
 	if ((old_prs != new_prs) && (cmd == partcmd_update))
 		update_partition_exclusive_flag(cs, new_prs);
@@ -2931,7 +2933,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 	else if (isolcpus_updated)
 		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
 	spin_unlock_irq(&callback_lock);
-	update_unbound_workqueue_cpumask(isolcpus_updated);
+	update_exclusion_cpumasks(isolcpus_updated);
 
 	/* Force update if switching back to member & update effective_xcpus */
 	update_cpumasks_hier(cs, &tmpmask, !new_prs);
diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index faac36de35b9e..75580f7c69c64 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -167,6 +167,7 @@ extern void fetch_next_timer_interrupt_remote(unsigned long basej, u64 basem,
 extern void timer_lock_remote_bases(unsigned int cpu);
 extern void timer_unlock_remote_bases(unsigned int cpu);
 extern bool timer_base_is_idle(void);
+extern bool timer_base_remote_is_idle(unsigned int cpu);
 extern void timer_expire_remote(unsigned int cpu);
 # endif
 #else /* CONFIG_NO_HZ_COMMON */
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4d915c0a263c3..f04960091eba9 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -2162,6 +2162,16 @@ bool timer_base_is_idle(void)
 	return __this_cpu_read(timer_bases[BASE_LOCAL].is_idle);
 }
 
+/**
+ * timer_base_remote_is_idle() - Return whether timer base is set idle for cpu
+ *
+ * Returns value of local timer base is_idle value for remote cpu.
+ */
+bool timer_base_remote_is_idle(unsigned int cpu)
+{
+	return per_cpu(timer_bases[BASE_LOCAL].is_idle, cpu);
+}
+
 static void __run_timer_base(struct timer_base *base);
 
 /**
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 1fae38fbac8c2..e4b394d78a8d4 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/timerqueue.h>
 #include <trace/events/ipi.h>
+#include <linux/sched/isolation.h>
 
 #include "timer_migration.h"
 #include "tick-internal.h"
@@ -422,7 +423,7 @@ static unsigned int tmigr_crossnode_level __read_mostly;
 
 static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
 
-/* CPUs available for migration */
+/* CPUs available for timer migration */
 static cpumask_var_t tmigr_available_cpumask;
 
 #define TMIGR_NONE	0xFF
@@ -1445,7 +1446,7 @@ static long tmigr_trigger_active(void *unused)
 
 static int tmigr_cpu_unavailable(unsigned int cpu)
 {
-	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
+	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
 	int migrator;
 	u64 firstexp;
 
@@ -1472,15 +1473,24 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
 
 static int tmigr_cpu_available(unsigned int cpu)
 {
-	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
+	struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
 
 	/* Check whether CPU data was successfully initialized */
 	if (WARN_ON_ONCE(!tmc->tmgroup))
 		return -EINVAL;
 
+	/*
+	 * Isolated CPUs don't participate in timer migration.
+	 * Checking here guarantees that CPUs isolated at boot (e.g. isolcpus)
+	 * are not marked as available when they first become online.
+	 * During runtime, any offline isolated CPU is also not incorrectly
+	 * marked as available once it gets back online.
+	 */
+	if (cpu_is_isolated(cpu))
+		return 0;
 	raw_spin_lock_irq(&tmc->lock);
 	trace_tmigr_cpu_available(tmc);
-	tmc->idle = timer_base_is_idle();
+	tmc->idle = timer_base_remote_is_idle(cpu);
 	if (!tmc->idle)
 		__tmigr_cpu_activate(tmc);
 	tmc->available = true;
@@ -1489,6 +1499,21 @@ static int tmigr_cpu_available(unsigned int cpu)
 	return 0;
 }
 
+void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
+{
+	int cpu;
+
+	lockdep_assert_cpus_held();
+
+	for_each_cpu_and(cpu, exclude_cpumask, tmigr_available_cpumask)
+		tmigr_cpu_unavailable(cpu);
+
+	for_each_cpu_andnot(cpu, cpu_online_mask, exclude_cpumask) {
+		if (!cpumask_test_cpu(cpu, tmigr_available_cpumask))
+			tmigr_cpu_available(cpu);
+	}
+}
+
 static void tmigr_init_group(struct tmigr_group *group, unsigned int lvl,
 			     int node)
 {
-- 
2.49.0

