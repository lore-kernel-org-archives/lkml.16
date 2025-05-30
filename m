Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264E233722
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614907; cv=none; b=W6/XAH4WiaPx24qrfPFP3of+FBvLjUW+BTwwvs770twvcwOy+l/9G23QihMtNN0v05Agax5sxfjE4IMzvAvq7qZmSNE4ylN9p7fgl+xQHY6QDV0Gb3IvUjKseUnoSNhFVzuoVvRzYlbzV5WVPA5Cipjyo4PxZDwyhsb5m3ZxtAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614907; c=relaxed/simple;
	bh=bXxzjbF7ADDiXfnJhf6+XlGkn+bU/6XfFSvWj8Zgktc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMbHSPQ2TYhLmH0STvrfzD/9egMcRdrF5Zcl2mm594a02BDYiMA63qD54ZeCrdvNh1U9QG9Ipg00Gl/bpTx9ICu8TUR66OuWIKnF8FxYOryRFENzZmHhlaTEwwvlDCEwDPXSt8Iqcr1tK4ODz1CYc0xLH6NkivgrbcOp5J1i9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLyn90+9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLyn90+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748614904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5esWHN7Lixngxf6oIjmMRA2wcLPjjPu3cKumbAoaDU=;
	b=FLyn90+9PvkWG9paFWjKJsJ3D1xKDukXt+YqkwomHn6JHKdoaBCMs+T1EprEXv/UFz2Ea5
	2sQn2hYMiNLCcVsnBBZdphne58W4Cl95ffN5v3jw0HEmnKRWDfgZ6SDm9HS08fDAY1b0w8
	CeSsPxxV79J2Ac+ca1S1WCTDueEzJS4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-2WcHFq9PMu66xnhZmP7Eww-1; Fri,
 30 May 2025 10:21:40 -0400
X-MC-Unique: 2WcHFq9PMu66xnhZmP7Eww-1
X-Mimecast-MFC-AGG-ID: 2WcHFq9PMu66xnhZmP7Eww_1748614899
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 190391800ECC;
	Fri, 30 May 2025 14:21:39 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.33.197])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AF17B30001B7;
	Fri, 30 May 2025 14:21:35 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
Date: Fri, 30 May 2025 16:20:31 +0200
Message-ID: <20250530142031.215594-7-gmonaco@redhat.com>
In-Reply-To: <20250530142031.215594-1-gmonaco@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
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

A core is considered unavailable as isolated if it belongs to:
* the isolcpus (domain) list
* an isolated cpuset
Except if it is:
* in the nohz_full list (already idle for the hierarchy)
* the nohz timekeeper core (must be available to handle global timers)

Due to how the timer migration algorithm works, any CPU part of the
hierarchy can have their global timers pulled by remote CPUs and have to
pull remote timers, only skipping pulling remote timers would break the
logic.
For this reason, we prevent isolated CPUs from pulling remote global
timers, but also the other way around: any global timer started on an
isolated CPU will run there. This does not break the concept of
isolation (global timers don't come from outside the CPU) and, if
considered inappropriate, can usually be mitigated with other isolation
techniques (e.g. IRQ pinning).

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/timer.h         |  9 ++++++
 kernel/cgroup/cpuset.c        |  3 ++
 kernel/time/timer_migration.c | 54 +++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a346..a8b683d9ce25d 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -190,4 +190,13 @@ int timers_dead_cpu(unsigned int cpu);
 #define timers_dead_cpu		NULL
 #endif
 
+#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
+extern int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);
+#else
+static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
+{
+	return 0;
+}
+#endif
+
 #endif
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index e3494ed677f5c..7b26226f2a276 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1378,6 +1378,9 @@ static void update_exclusion_cpumasks(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+
+	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
+	WARN_ON_ONCE(ret < 0);
 }
 
 /**
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 25439f961ccf8..a14fbca7457fe 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/timerqueue.h>
 #include <trace/events/ipi.h>
+#include <linux/sched/isolation.h>
 
 #include "timer_migration.h"
 #include "tick-internal.h"
@@ -1449,6 +1450,13 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
 	int migrator;
 	u64 firstexp;
 
+	/*
+	 * The tick CPU can be marked as isolated by the cpuset code, however
+	 * we cannot mark it as unavailable to avoid having no global migrator
+	 * for the nohz_full CPUs.
+	 */
+	if (!tick_nohz_cpu_hotpluggable(cpu))
+		return 0;
 	raw_spin_lock_irq(&tmc->lock);
 	tmc->available = false;
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
@@ -1478,6 +1486,20 @@ static int tmigr_cpu_available(unsigned int cpu)
 	if (WARN_ON_ONCE(!tmc->tmgroup))
 		return -EINVAL;
 
+	/*
+	 * Domain isolated CPUs don't participate in timer migration, nohz_full
+	 * CPUs are still part of the hierarchy but are always considered idle.
+	 * Additionally, the tick CPU during nohz_full cannot be disabled.
+	 * Checking here guarantees that CPUs isolated at boot (e.g. isolcpus)
+	 * are not marked as available when they first become online.
+	 * During runtime, any offline isolated CPU is also not incorrectly
+	 * marked as available once it gets back online.
+	 */
+	if ((!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
+	     cpuset_cpu_is_isolated(cpu)) &&
+	    housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) &&
+	    tick_nohz_cpu_hotpluggable(cpu))
+		return 0;
 	raw_spin_lock_irq(&tmc->lock);
 	trace_tmigr_cpu_available(tmc);
 	tmc->idle = timer_base_is_idle();
@@ -1489,6 +1511,38 @@ static int tmigr_cpu_available(unsigned int cpu)
 	return 0;
 }
 
+static void tmigr_remote_cpu_unavailable(void *ignored)
+{
+	tmigr_cpu_unavailable(smp_processor_id());
+}
+
+static void tmigr_remote_cpu_available(void *ignored)
+{
+	tmigr_cpu_available(smp_processor_id());
+}
+
+int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
+{
+	cpumask_var_t cpumask;
+	int ret = 0;
+
+	lockdep_assert_cpus_held();
+
+	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
+		return -ENOMEM;
+
+	cpumask_and(cpumask, exclude_cpumask, tmigr_available_cpumask);
+	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
+	on_each_cpu_mask(cpumask, tmigr_remote_cpu_unavailable, NULL, 0);
+
+	cpumask_andnot(cpumask, cpu_online_mask, exclude_cpumask);
+	cpumask_andnot(cpumask, cpumask, tmigr_available_cpumask);
+	on_each_cpu_mask(cpumask, tmigr_remote_cpu_available, NULL, 0);
+
+	free_cpumask_var(cpumask);
+	return ret;
+}
+
 static void tmigr_init_group(struct tmigr_group *group, unsigned int lvl,
 			     int node)
 {
-- 
2.49.0

