Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE972230D0F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614891; cv=none; b=dIO38s3EMKOnjXuHAXdl/KaRuimbvHhP+cRknwYZ2bVJ/Iit/emej/ds1NcculMD/dWoXrmmoqWhQ26Vuep+ZzV5f/EISA4HRkTaNW5tKmy0t/LgcU1M0GmAGg5oxFykaUfMI/+UKGm9YIxBp8ztjzPHHCsvGRGcR1oXRumAZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614891; c=relaxed/simple;
	bh=H2wgocbVKcVtR7XzOPlkpLLqLftRpXu5qzvUNeXJ0LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLjyzXOEztpEF4WA0mcVzhuEqsTsavDD73UdREsjqgnOp7jCTu15IRzjcSRX9y3EwDBeZGUTgZF2jR5HVmlEJR92fS2SUJrT//ok1X9NZTxRVZCnGLWTy2c90lny5qDS/LS4vKWjFH8r3xGeV++cazCRcS48KHltZSE+v1rGMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dJcqP5J3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dJcqP5J3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748614888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+yGQU0A37MWbuh9tXwG6mkH726qolwRUhV6OXI4iwU=;
	b=dJcqP5J3oDRmTPg9gd5se+rgCw1BT+kFEDhvrJBloZkcd7xEeeHrTrzN1J5lC6q/vuNAtY
	8YK+hBljzDxK91BLI5R8OneouapnyeLGloNeCFZn/Qm1ICsoF3FI1k+EHbO2z3U2Vw98Ja
	0xxz3DYzxq2ovQ2VpShTDHDdRuT8uDQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-B12uBvqCMw-0p8myFMe7ZQ-1; Fri,
 30 May 2025 10:21:25 -0400
X-MC-Unique: B12uBvqCMw-0p8myFMe7ZQ-1
X-Mimecast-MFC-AGG-ID: B12uBvqCMw-0p8myFMe7ZQ_1748614884
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24BB91956086;
	Fri, 30 May 2025 14:21:24 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.33.197])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D9B0030001B7;
	Fri, 30 May 2025 14:21:20 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v6 2/6] timers: Add the available mask in timer migration
Date: Fri, 30 May 2025 16:20:27 +0200
Message-ID: <20250530142031.215594-3-gmonaco@redhat.com>
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

Keep track of the CPUs available for timer migration in a cpumask. This
prepares the ground to generalise the concept of unavailable CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/time/timer_migration.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 7efd897c79599..25439f961ccf8 100644
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

