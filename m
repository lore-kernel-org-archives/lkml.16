Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067AA28DEE9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712735; cv=none; b=m4VQhgfhpD6qS3YWR5g0SU60Ji6neQgtjnfoPsWG+fRfcRTEZJXLefSKSRJUWs50ZgTi5Lp38ZE+1u6XVOpKQE+Yv+txUTf5tUJFx/Xl1jYqLLz55WYyOObSFeCwBpplSmrVh6+1T6a1kjY2U5amjJMLAv9ib7samegiyY08X6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712735; c=relaxed/simple;
	bh=tCUwMlpJ0PLdnGZk91rYJ+Bc4HAjRXkzO9BZr3rqAk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4cQ22LGkNnzsTwS83BnzIBUlNA3qp0NZj5ISdRyutJKWmPhIgTgotrgcdOwYj9pcOFJKoJ/lN7QgcAdt+39vo3/xokToaaLVXwlcNXoKp+EInaLXFpIlYpXpsUR9myjopaFhsty83VFdiyr8F1LhyjCDbXLOXktNDr/cUzUqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NdnNeQyh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NdnNeQyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744712732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsBUT7u//iK7sLk6YoMhB4VJF0MdfDCXAnznK/PHwiQ=;
	b=NdnNeQyh8LV36GhZ1Vskfxz0mpdmzrBWXr/FQUMLLa9iU9zAL/GcqBgPisSc6JrTgA1P7j
	abbY3UjgXf5snvdx2x55Wcf9RdHqFx5bEBpRrWyLM58/9bc09qVYjxuv+2/8f/5eSZ4yqg
	T3fNJFZNRLYoTa71dvuQnceSrMfH+0s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-L8lAnt0SPhGnrPk8ofJ7RQ-1; Tue,
 15 Apr 2025 06:25:29 -0400
X-MC-Unique: L8lAnt0SPhGnrPk8ofJ7RQ-1
X-Mimecast-MFC-AGG-ID: L8lAnt0SPhGnrPk8ofJ7RQ_1744712728
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59B421955BC9;
	Tue, 15 Apr 2025 10:25:28 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.90])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 51EA71809B67;
	Tue, 15 Apr 2025 10:25:26 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v2 2/3] timers: Add the available mask in timer migration
Date: Tue, 15 Apr 2025 12:25:03 +0200
Message-ID: <20250415102500.100415-7-gmonaco@redhat.com>
In-Reply-To: <20250415102500.100415-5-gmonaco@redhat.com>
References: <20250415102500.100415-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Keep track of the CPUs available for timer migration in a cpumask. This
prepares the ground to generalise the concept of unavailable CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/time/timer_migration.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 7efd897c79599..1fae38fbac8c2 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level __read_mostly;
 
 static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
 
+/* CPUs available for migration */
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

