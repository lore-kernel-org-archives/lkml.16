Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171BD275AF0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938736; cv=none; b=ELRtki57/SU1lxtZmKA0Az7vbTNyeBBPFeOyaFlTUC2XtCo7+T89nKF9LBx0dKhc9aCvMwrUJE3haxn4xk+r6ZScSM5Gh4FE2Ra3VIAy2HT9vkZATZqJfB0fkWvx3ywCpl2ovW3rFpwrXDIVy8+wn4HuqB2GFN4S12Dzr16OJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938736; c=relaxed/simple;
	bh=dCwo9dQ+Vr20/e1KAsSbtEmLD13qNZhteBWJeJeYPoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKX37vcGZ65InwAgTjnse/4423lwlJKx6JJ0/dQPXNF/pxiCC9/71rLIWwV66MQyrYN3kcmMs5C/31igbug0cNwjLVgH//xMRMcoebrITsLchNH2e3ImMthRoQlSwoyIl3gj7sSLw+Nj0Gj1vHQAvBvYgDwuB7doEuN1sGwphJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YK6XLa7U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YK6XLa7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750938734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxW6jSTb/V87JFd4N+HT8acceFkg7nuwQOVqiGyMICA=;
	b=YK6XLa7UuKx5xu8sN1ELAKjiCXy/PG5vIEdXSnbErINm7eClHyuaw7cLUlQmPk27Fh/wXX
	NYH/ikkZ/qS2nMvNsisIE5cAFQuMxvTRVRjchQvWiTA4obux1gJmiBDw0ZVn5lGNoFUP7P
	YaH35NR0NlpZgxReIwzO50Zx8Ow3sPM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-mBAs2qz8NaKID1fM14R3Hw-1; Thu,
 26 Jun 2025 07:52:12 -0400
X-MC-Unique: mBAs2qz8NaKID1fM14R3Hw-1
X-Mimecast-MFC-AGG-ID: mBAs2qz8NaKID1fM14R3Hw_1750938731
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B4DD21809C85;
	Thu, 26 Jun 2025 11:52:11 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.226.174])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4125730002C0;
	Thu, 26 Jun 2025 11:52:08 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v7 7/7] timers: Exclude isolated cpus from timer migration
Date: Thu, 26 Jun 2025 13:49:00 +0200
Message-ID: <20250626114900.106061-8-gmonaco@redhat.com>
In-Reply-To: <20250626114900.106061-1-gmonaco@redhat.com>
References: <20250626114900.106061-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The timer migration mechanism allows active CPUs to pull timers from
idle ones to improve the overall idle time. This is however undesired
when CPU intensive workloads run on isolated cores, as the algorithm
would move the timers from housekeeping to isolated cores, negatively
affecting the isolation.

Exclude isolated cores from the timer migration algorithm, extend the
concept of unavailable cores, currently used for offline ones, to
isolated ones:
* A core is unavailable if isolated or offline;
* A core is available if isolated and offline;

A core is considered unavailable as isolated if it belongs to:
* the isolcpus (domain) list
* an isolated cpuset
Except if it is:
* in the nohz_full list (already idle for the hierarchy)
* the nohz timekeeper core (must be available to handle global timers)

All online CPUs are added to the hierarchy during early boot, isolated
CPUs are removed during late boot if configured or whenever the cpuset
isolation changes.

Due to how the timer migration algorithm works, any CPU part of the
hierarchy can have their global timers pulled by remote CPUs and have to
pull remote timers, only skipping pulling remote timers would break the
logic.
For this reason, prevent isolated CPUs from pulling remote global
timers, but also the other way around: any global timer started on an
isolated CPU will run there. This does not break the concept of
isolation (global timers don't come from outside the CPU) and, if
considered inappropriate, can usually be mitigated with other isolation
techniques (e.g. IRQ pinning).

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

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/timer.h         |  9 ++++
 kernel/cgroup/cpuset.c        |  3 ++
 kernel/time/timer_migration.c | 86 +++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 0414d9e6b4fcd..62e1cea711257 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -188,4 +188,13 @@ int timers_dead_cpu(unsigned int cpu);
 #define timers_dead_cpu		NULL
 #endif
 
+#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
+extern int tmigr_isolated_exclude_cpumask(struct cpumask *exclude_cpumask);
+#else
+static inline int tmigr_isolated_exclude_cpumask(struct cpumask *exclude_cpumask)
+{
+	return 0;
+}
+#endif
+
 #endif
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index a946d85ce954a..ff5b66abd0474 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1392,6 +1392,9 @@ static void update_exclusion_cpumasks(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+
+	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
+	WARN_ON_ONCE(ret < 0);
 }
 
 /**
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index a51af4acc5e3c..2bae64a34f05f 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/timerqueue.h>
 #include <trace/events/ipi.h>
+#include <linux/sched/isolation.h>
 
 #include "timer_migration.h"
 #include "tick-internal.h"
@@ -425,6 +426,9 @@ static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
 /* CPUs available for timer migration */
 static cpumask_var_t tmigr_available_cpumask;
 
+/* Enabled during late initcall */
+static bool tmigr_exclude_isolated __read_mostly;
+
 #define TMIGR_NONE	0xFF
 #define BIT_CNT		8
 
@@ -433,6 +437,24 @@ static inline bool tmigr_is_not_available(struct tmigr_cpu *tmc)
 	return !(tmc->tmgroup && tmc->available);
 }
 
+/*
+ * Returns true if @cpu should be excluded from the hierarchy as isolated.
+ * Domain isolated CPUs don't participate in timer migration, nohz_full
+ * CPUs are still part of the hierarchy but are always considered idle.
+ * This behaviour depends on the value of tmigr_exclude_isolated, which is
+ * normally disabled during early boot.
+ * This check is necessary, for instance, to prevent offline isolated CPU from
+ * being incorrectly marked as available once getting back online.
+ */
+static inline bool tmigr_is_isolated(int cpu)
+{
+	if (!tmigr_exclude_isolated)
+		return false;
+	return (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
+		cpuset_cpu_is_isolated(cpu)) &&
+	       housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE);
+}
+
 /*
  * Returns true, when @childmask corresponds to the group migrator or when the
  * group is not active - so no migrator is set.
@@ -1450,6 +1472,8 @@ static int tmigr_clear_cpu_available(unsigned int cpu)
 	u64 firstexp;
 
 	scoped_guard(raw_spinlock_irq, &tmc->lock) {
+		if (!tmc->available)
+			return 0;
 		tmc->available = false;
 		WRITE_ONCE(tmc->wakeup, KTIME_MAX);
 		cpumask_clear_cpu(cpu, tmigr_available_cpumask);
@@ -1478,7 +1502,11 @@ static int tmigr_set_cpu_available(unsigned int cpu)
 	if (WARN_ON_ONCE(!tmc->tmgroup))
 		return -EINVAL;
 
+	if (tmigr_is_isolated(cpu))
+		return 0;
 	scoped_guard(raw_spinlock_irq, &tmc->lock) {
+		if (tmc->available)
+			return 0;
 		trace_tmigr_cpu_available(tmc);
 		tmc->idle = timer_base_is_idle();
 		if (!tmc->idle)
@@ -1489,6 +1517,63 @@ static int tmigr_set_cpu_available(unsigned int cpu)
 	return 0;
 }
 
+static void tmigr_cpu_isolate(void *ignored)
+{
+	/*
+	 * The tick CPU can be marked as isolated by the cpuset code, however
+	 * we cannot mark it as unavailable to avoid having no global migrator
+	 * for the nohz_full CPUs.
+	 */
+	if (!tick_nohz_cpu_hotpluggable(smp_processor_id()))
+		return;
+	tmigr_clear_cpu_available(smp_processor_id());
+}
+
+static void tmigr_cpu_unisolate(void *ignored)
+{
+	tmigr_set_cpu_available(smp_processor_id());
+}
+
+int tmigr_isolated_exclude_cpumask(struct cpumask *exclude_cpumask)
+{
+	cpumask_var_t cpumask;
+
+	lockdep_assert_cpus_held();
+
+	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
+		return -ENOMEM;
+
+	cpumask_and(cpumask, exclude_cpumask, tmigr_available_cpumask);
+	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
+	on_each_cpu_mask(cpumask, tmigr_cpu_isolate, NULL, 1);
+
+	cpumask_andnot(cpumask, cpu_online_mask, exclude_cpumask);
+	cpumask_andnot(cpumask, cpumask, tmigr_available_cpumask);
+	on_each_cpu_mask(cpumask, tmigr_cpu_unisolate, NULL, 1);
+
+	free_cpumask_var(cpumask);
+	return 0;
+}
+
+static int __init tmigr_init_isolation(void)
+{
+	cpumask_var_t cpumask;
+
+	if (!housekeeping_enabled(HK_TYPE_DOMAIN))
+		return 0;
+	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
+		return -ENOMEM;
+	cpumask_andnot(cpumask, tmigr_available_cpumask,
+		       housekeeping_cpumask(HK_TYPE_DOMAIN));
+	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
+	on_each_cpu_mask(cpumask, tmigr_cpu_isolate, NULL, 1);
+
+	tmigr_exclude_isolated = true;
+
+	free_cpumask_var(cpumask);
+	return 0;
+}
+
 static void tmigr_init_group(struct tmigr_group *group, unsigned int lvl,
 			     int node)
 {
@@ -1871,3 +1956,4 @@ static int __init tmigr_init(void)
 	return ret;
 }
 early_initcall(tmigr_init);
+late_initcall(tmigr_init_isolation);
-- 
2.49.0

