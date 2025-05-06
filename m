Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA33227874E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522985; cv=none; b=jMhFoQYQvF5i4VoOoxzV/jr+tUF6/Xxw9BDyytWqCcVfsRloQOam6SMVBAVd+yqu+JEGzNvRHMSjqmtOegbFLvvofU1sVVKVFGP3xXC39/+UHt6uEPRSX5iEEbF+umZB6CUE5NqJuZvgHPHPFxE+Jb5EkJ7XtQfT/xjXrcHfC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522985; c=relaxed/simple;
	bh=SZu+/855vKDCouCnGeIRy0RLbJjvnek5SuoGEKsiXhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+WMf0hh7tcVU0uRe4X8V8QfYV80DeTvvIaQgqzNKxQ4ZUK8FPTh4rWUXA9tFivdUVYhT+OWQ/v6yfGWUpmM+Twy+4t9wC2CEK6NDPvYZO9J75vPPZs3xRBJcP7qiXo07uHsktwuQa7KBF0xaMzhL64xGHmIusiw+d8cL9mDjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OuW8ltnI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OuW8ltnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746522981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMJP+h90KvE0FJ+WMXj9tnu2kwwxuQ8mi50pBzYQBp0=;
	b=OuW8ltnIYWx4B6RNqXJ81kccxAkM2RNXkF2Its00U8b/gYCAyTQbs3vYQj9dDiYl+q3myN
	PO5ZK9GVjKZZ8HLA59zFGDSON3GwU1mvm01r2PTL7nTL9+LIWK61Tl+1eZIUK2AVeisx4E
	zYjsKUG8IXbI+Bq/6DitUxmpN1/0eLk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-54tXezIZNGW7ZzY7Qo_aPg-1; Tue,
 06 May 2025 05:16:19 -0400
X-MC-Unique: 54tXezIZNGW7ZzY7Qo_aPg-1
X-Mimecast-MFC-AGG-ID: 54tXezIZNGW7ZzY7Qo_aPg_1746522977
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8EF911801A19;
	Tue,  6 May 2025 09:16:17 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.215])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A9500195608D;
	Tue,  6 May 2025 09:16:14 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v4 5/5] timers: Exclude isolated cpus from timer migation
Date: Tue,  6 May 2025 11:15:40 +0200
Message-ID: <20250506091534.42117-12-gmonaco@redhat.com>
In-Reply-To: <20250506091534.42117-7-gmonaco@redhat.com>
References: <20250506091534.42117-7-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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
 include/linux/timer.h         |  6 ++++++
 kernel/cgroup/cpuset.c        |  2 ++
 kernel/time/timer_migration.c | 31 ++++++++++++++++++++++++++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a34..4722e075d984 100644
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
index 95316d39c282..866b4b818811 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1334,6 +1334,8 @@ static void update_exclusion_cpumasks(bool isolcpus_updated)
 
 	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
 	WARN_ON_ONCE(ret < 0);
+
+	tmigr_isolated_exclude_cpumask(isolated_cpus);
 }
 
 /**
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 25439f961ccf..e4b394d78a8d 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -10,6 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/timerqueue.h>
 #include <trace/events/ipi.h>
+#include <linux/sched/isolation.h>
 
 #include "timer_migration.h"
 #include "tick-internal.h"
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

