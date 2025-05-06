Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D5275117
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522974; cv=none; b=GDXKa4b8W4aPC1+Vq2hq1+YrXPPe0RksbTFpxjfp/ZoIpClTFtOmFCnIky+WeSke7/PsrKPG4aHhvSQnKBZwd1I1soK/ytSny+vWV57gX4S47vEUsBjvx2gVH/0LN7XC4MeQ+fgL2OiOc/CpJnSwc9VVfjUYSff9F7ogdkz0mcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522974; c=relaxed/simple;
	bh=oJfC6o5m5P1YisWX5sseAY5o4KMr7ZyiAPQCb8q6T/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/KOL9E012GFogEx7kudoCoQ0mXu17tvAcDM/jsU6ZJbpsxt/OZZQl4itpDilA68SYD6j9YuQ6/N7n0fbq840Yrt2OsTAfj/psp3FtAObJ1fHlFii+wkeY8J0Q4Jl37ConENGbN63g5/r1WIaGwkwrIBZafeyUKBRLSdrhe9VQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BodVSFxD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BodVSFxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746522971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DBUr7Tsi3ZK47KS1wKN6MpKnbFEHSyvqrNjk76TULQ=;
	b=BodVSFxDO2BcqOeUENxmW4rIEGTiJm6NPzA4CdZJTeYDc0AF3TSHul/QVQ7GyEwopwey7U
	K/Gra/3qQkqh+CkxkDvoEFT3fTSvEPUz1jbd5E3ybb+pIRkEL6Zm7xXBWHk7y/aAmNpBdp
	tst/JLVuWg52DqBANKIYjrpYG5XSatQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-e9arhCnKMR2XeuG8ldztWw-1; Tue,
 06 May 2025 05:16:08 -0400
X-MC-Unique: e9arhCnKMR2XeuG8ldztWw-1
X-Mimecast-MFC-AGG-ID: e9arhCnKMR2XeuG8ldztWw_1746522967
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFC04180099A;
	Tue,  6 May 2025 09:16:07 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.215])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2CF361956096;
	Tue,  6 May 2025 09:16:04 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v4 2/5] timers: Add the available mask in timer migration
Date: Tue,  6 May 2025 11:15:37 +0200
Message-ID: <20250506091534.42117-9-gmonaco@redhat.com>
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

Keep track of the CPUs available for timer migration in a cpumask. This
prepares the ground to generalise the concept of unavailable CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/time/timer_migration.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 7efd897c7959..25439f961ccf 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level __read_mostly;
 
 static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
 
+/* CPUs available for timer migration */
+static cpumask_var_t tmigr_available_cpumask;
+
 #define TMIGR_NONE	0xFF
 #define BIT_CNT		8
 
@@ -1449,6 +1452,7 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
 	raw_spin_lock_irq(&tmc->lock);
 	tmc->available = false;
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
+	cpumask_clear_cpu(cpu, tmigr_available_cpumask);
 
 	/*
 	 * CPU has to handle the local events on his own, when on the way to
@@ -1459,7 +1463,7 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
 	raw_spin_unlock_irq(&tmc->lock);
 
 	if (firstexp != KTIME_MAX) {
-		migrator = cpumask_any_but(cpu_online_mask, cpu);
+		migrator = cpumask_any(tmigr_available_cpumask);
 		work_on_cpu(migrator, tmigr_trigger_active, NULL);
 	}
 
@@ -1480,6 +1484,7 @@ static int tmigr_cpu_available(unsigned int cpu)
 	if (!tmc->idle)
 		__tmigr_cpu_activate(tmc);
 	tmc->available = true;
+	cpumask_set_cpu(cpu, tmigr_available_cpumask);
 	raw_spin_unlock_irq(&tmc->lock);
 	return 0;
 }
@@ -1801,6 +1806,11 @@ static int __init tmigr_init(void)
 	if (ncpus == 1)
 		return 0;
 
+	if (!zalloc_cpumask_var(&tmigr_available_cpumask, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	/*
 	 * Calculate the required hierarchy levels. Unfortunately there is no
 	 * reliable information available, unless all possible CPUs have been
-- 
2.49.0

