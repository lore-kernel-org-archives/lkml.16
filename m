Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F66278E6D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716082; cv=none; b=T7IZsEAUTuRbB3v0JyU4e12wgEh9v0upPNDrbyQtFI8tyL4Y02W7UAsW0Osc6mC3RfXsdmFgGfjzj4AnLmFSsCIq68agcbOzjOByetY9T8f8GPnkyfZO/+c2lSxEOLBcqcmTOx0/b+2O09NaFQaBUeYvKPyTov/+HZdZXkIty2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716082; c=relaxed/simple;
	bh=IqPr2HFymXS07eT4LRAQtB8c3+gbYSQp8ALdimBc26Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbcXJmmHTWMI2OAbw5oVmAYUvGDETu15zrgct76lxLO3jAaCktBLEZEpUDJ5SlbxmVO1MaJPYN2LsMRglYCEjEibyo3t8P0jOVr525abbp+y6VYyZEycPALQlqq26nXgYiWiEL/m/TMqRuUkcvsJWC1jFudK3Bd0y7G6JEO8Ta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpxELP7f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpxELP7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746716079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdbTpT8SmXu5hk3rq62g1vaC8Yun6rcU/eUgSHBtFFo=;
	b=MpxELP7fA446SMahAzBg2DWt26He0gsQ8ZBhnCRluDASKUD9755582iJqfE1ODH5RyWffV
	h87ld64iHxvdlYLAVj+qQkvqpnkenOnQsI/nqalIVEY/t1mN6YhqHY3/WiEaz4uxc6iZJa
	64FPHHJaiD91zBMksSlx0+c3BEEVvxg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-578-y-DEwhquPVOluRhOz69X5Q-1; Thu,
 08 May 2025 10:54:33 -0400
X-MC-Unique: y-DEwhquPVOluRhOz69X5Q-1
X-Mimecast-MFC-AGG-ID: y-DEwhquPVOluRhOz69X5Q_1746716072
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2EED180087B;
	Thu,  8 May 2025 14:54:32 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.32])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 747C319560B4;
	Thu,  8 May 2025 14:54:29 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v5 4/6] sched/isolation: Force housekeeping if isolcpus and nohz_full don't leave any
Date: Thu,  8 May 2025 16:53:24 +0200
Message-ID: <20250508145319.97794-12-gmonaco@redhat.com>
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

Currently the user can set up isolcpus and nohz_full in such a way that
leaves no housekeeping CPU (i.e. no CPU that is neither domain isolated
nor nohz full). This can be a problem for other subsystems (e.g. the
timer wheel imgration).

Prevent this configuration by setting the boot CPU as housekeeping if
the union of isolcpus and nohz_full covers all CPUs. In a similar
fashion as it already happens if either of them covers all CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/tick.h     |  2 ++
 kernel/sched/isolation.c | 20 ++++++++++++++++++++
 kernel/time/tick-sched.c |  7 +++++++
 3 files changed, 29 insertions(+)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index b8ddc8e631a3..0b32c0bd3512 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -278,6 +278,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
 extern void tick_nohz_full_kick_cpu(int cpu);
 extern void __tick_nohz_task_switch(void);
 extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
+extern void __init tick_nohz_full_clear_cpu(unsigned int cpu);
 #else
 static inline bool tick_nohz_full_enabled(void) { return false; }
 static inline bool tick_nohz_full_cpu(int cpu) { return false; }
@@ -304,6 +305,7 @@ static inline void tick_dep_clear_signal(struct signal_struct *signal,
 static inline void tick_nohz_full_kick_cpu(int cpu) { }
 static inline void __tick_nohz_task_switch(void) { }
 static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { }
+static inline void tick_nohz_full_clear_cpu(unsigned int cpu) { }
 #endif
 
 static inline void tick_nohz_task_switch(void)
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 81bc8b329ef1..27b65b401534 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -165,6 +165,26 @@ static int __init housekeeping_setup(char *str, unsigned long flags)
 			}
 		}
 
+		/* Check in combination with the previously set cpumask */
+		type = find_first_bit(&housekeeping.flags, HK_TYPE_MAX);
+		first_cpu = cpumask_first_and_and(cpu_present_mask,
+						  housekeeping_staging,
+						  housekeeping.cpumasks[type]);
+		if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) {
+			pr_warn("Housekeeping: must include one present CPU neither "
+				"in nohz_full= nor in isolcpus=, using boot CPU:%d\n",
+				smp_processor_id());
+			for_each_set_bit(type, &housekeeping.flags, HK_TYPE_MAX)
+				__cpumask_set_cpu(smp_processor_id(),
+						  housekeeping.cpumasks[type]);
+			__cpumask_set_cpu(smp_processor_id(), housekeeping_staging);
+			__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask);
+			tick_nohz_full_clear_cpu(smp_processor_id());
+
+			if (cpumask_empty(non_housekeeping_mask))
+				goto free_housekeeping_staging;
+		}
+
 		iter_flags = flags & ~housekeeping.flags;
 
 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX)
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c527b421c865..2969ed13d1f4 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -604,6 +604,13 @@ void __init tick_nohz_full_setup(cpumask_var_t cpumask)
 	tick_nohz_full_running = true;
 }
 
+/* Called if boot-time nohz CPU list changes during initialisation. */
+void __init tick_nohz_full_clear_cpu(unsigned int cpu)
+{
+	if (tick_nohz_full_running)
+		cpumask_clear_cpu(cpu, tick_nohz_full_mask);
+}
+
 bool tick_nohz_cpu_hotpluggable(unsigned int cpu)
 {
 	/*
-- 
2.49.0

