Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19727E7FC
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716088; cv=none; b=kaW7wpKE4lLh87fbf7XvTqeFwDQs23mLHt48RDG8DHyjdTqJV6yv4RaSrrIutgIQAkikhSURKLQUsClh7i3UcL9FxoGVt5GjeeVFnKOZ473pXJ8TYah+dgWfrfewlU7/keFPMKa/phRua23L3mw3gu0LDEUfCn/qnN+lg5Sc8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716088; c=relaxed/simple;
	bh=ZwlHWxWAsiE2SrOuNoVBfJbMDidCghq9t4QCocjjwZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAB/lmHAe+U9Ns4fk3malIICJe83X3lr4J+eVf0KC1cl4Kz0xE3yNCS8GVddSOlzZPmtzu27nCazPuEPn2lHPPOMY2WPwfeMgrLtWrCSQdIs7XZ/k//eZ980fsOA3zUdyJJ/sSZpNxJiqKnoAnlfuLgO0DpdS/GrQcrzpFLFJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pmc1cU3L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pmc1cU3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746716085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Wt3/Jp1H/L16ISWQdVM4DFlJ/35rZ+n26VCbEFV6N0=;
	b=Pmc1cU3LQ9/rGQfQqGZDJj+k2ganeKYe54+AkX9M/4WGnBypwDu93buPWQflQ9ldqM7WZf
	MM6onXY+lbR6JhnB/G6tjd34aqP9/oJtIAX01V+encDmc5EZlCy1cN7yUi97o3cKAzVt9w
	/QbXPppe/e8q0KHA1y4DicPgnWMBMzI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-2hlD2ILcO4a1uwcbsjt7Mg-1; Thu,
 08 May 2025 10:54:42 -0400
X-MC-Unique: 2hlD2ILcO4a1uwcbsjt7Mg-1
X-Mimecast-MFC-AGG-ID: 2hlD2ILcO4a1uwcbsjt7Mg_1746716081
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3FDD195608A;
	Thu,  8 May 2025 14:54:39 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.32])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF97119560B3;
	Thu,  8 May 2025 14:54:36 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v5 6/6] timers: Exclude isolated cpus from timer migation
Date: Thu,  8 May 2025 16:53:26 +0200
Message-ID: <20250508145319.97794-14-gmonaco@redhat.com>
In-Reply-To: <20250508145319.97794-8-gmonaco@redhat.com>
References: <20250508145319.97794-8-gmonaco@redhat.com>
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
For this reason, we prevent isolated CPUs from pulling remote global
timers, but also the other way around: any global timer started on an
isolated CPU will run there. This does not break the concept of
isolation (global timers don't come from outside the CPU) and, if
considered inappropriate, can usually be mitigated with other isolation
techniques (e.g. IRQ pinning).

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/timer.h         |  9 ++++++++
 kernel/cgroup/cpuset.c        |  3 +++
 kernel/time/timer_migration.c | 43 +++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a34..a8b683d9ce25 100644
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
index 2f1df6f5b988..6e36e333d8b1 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1375,6 +1375,9 @@ static void update_exclusion_cpumasks(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+
+	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
+	WARN_ON_ONCE(ret < 0);
 }
 
 /**
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 25439f961ccf..fb27e929e2cf 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/timerqueue.h>
 #include <trace/events/ipi.h>
+#include <linux/sched/isolation.h>
 
 #include "timer_migration.h"
 #include "tick-internal.h"
@@ -1478,6 +1479,16 @@ static int tmigr_cpu_available(unsigned int cpu)
 	if (WARN_ON_ONCE(!tmc->tmgroup))
 		return -EINVAL;
 
+	/*
+	 * Domain isolated CPUs don't participate in timer migration.
+	 * Checking here guarantees that CPUs isolated at boot (e.g. isolcpus)
+	 * are not marked as available when they first become online.
+	 * During runtime, any offline isolated CPU is also not incorrectly
+	 * marked as available once it gets back online.
+	 */
+	if (!housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
+	    cpuset_cpu_is_isolated(cpu))
+		return 0;
 	raw_spin_lock_irq(&tmc->lock);
 	trace_tmigr_cpu_available(tmc);
 	tmc->idle = timer_base_is_idle();
@@ -1489,6 +1500,38 @@ static int tmigr_cpu_available(unsigned int cpu)
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
+	cpumask_and(cpumask, cpumask, housekeeping_cpumask(HK_TYPE_TICK));
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

