Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E192D1304
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908141; cv=none; b=i/a/ZzeRi5aiLwtJAqx9Fscgndf+iqvqeB+IGsNIsb/NKxa7LNzETB27/bVBI5pg5CiL0PS4PLoi+gWs/aKcADUIX2MfAUfglTvcqIR5CtWS5K2aScpY5RXk0lVLg5aall2i8kVjC9lpdL3A/q+kiss45WGylDN4mxdK7bVJ6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908141; c=relaxed/simple;
	bh=qrsr+0M9nXFRLoIR4+yywMzUz0aVbl4EMaZV7Lf8iw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJS8H7tMdRrryOhHyJjX/QY+0dqsTWV8Te4U7gSEunb0VAO9QBkSCWrwpinrT7twAxo2yHEhv81IMJVSsDEZdxQjEi29/AujxIh9avbtZ/HtOrSk0pUVemYoDGBjrbuGyRn3PUwsEIHOTa6tm+vi/qedoYrEcU4chGMF+2eiv4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H8P2FnJW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H8P2FnJW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1816820f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749908137; x=1750512937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRSnPZWm2tC3MPXSYTQvyR6xIG1uou0pPPYaNnjfCBM=;
        b=H8P2FnJW/dJY2SuC7CuMzZ8ZXjUyrgCEkY3MFJJeRNp+gxdNIC8Z7sMzkr47mEgemn
         JD12GYyarhY2jnBGp3vK8Y/YYLJb7lpmS+IHPE2EFnN1DHBoXtErxc3p9ZRJW4WaPaLB
         J2TapacmzLqfcBdcABE5sO20E4F3ZJtB3eCAt8fCic4AI4/giyHxs8vzUzVayziAVLp3
         5OJxAExVomoCo1gK5Oq5vXqONGktB6uNjCG3TAW5JLCMi0I2y9Sac9o7vOOPH2KgLrD8
         6+MiLi6J4hNY1RswgcoPDHq2JaMH3ZBXi90XUSyJvdDzi/sP1J187OMSz3Qq1cz2my/a
         Zm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908137; x=1750512937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRSnPZWm2tC3MPXSYTQvyR6xIG1uou0pPPYaNnjfCBM=;
        b=hhjQz/FrsYRmZaHPrx5HZKkJDmK3JGicyXBc0wxmaN3hh+t/1CNk7AI/HBe5/rGDQW
         RArusroF2QEc4koXH8m296wiXCK+QcqOS/cUO26bUyycqBx2rbT/ZQd1DP697DKPi8bp
         5SoNf0F8zDPdK0YX/4c5SLLVBZk3vhHBFzbRCXnkqT4bPhOfY41I3ZrornC9wxpY9VCf
         lWS9siHCTbNbiYTMQs555Rhl1ASN7atZU/lzAcc9t9PQQ3sor4OqVrtd4+BM7h4hZy+w
         pIvFEjl/foEjZ8tn7DNriXeySs9ht7P7/9NM5p6+aruq41dwwE0i6HFnBSS2f9KN8/PP
         6+hw==
X-Gm-Message-State: AOJu0YysFHuc+n0aFJh1vFp3DHGiYFmGYeimX7z9C+GFSvrZJhEsB4c6
	+DvkbfmuhzpPhWoiQJCwFV7CvnCknNZoqHBPgvtwB1PVifBCCijSx+FrTaBKaifceBnQOHM9p06
	hhPcaHJo=
X-Gm-Gg: ASbGncunG3qFLMSXKp4mVsa8oejskCEqSADNxTHFCxPrrtG8r0UPtCQ1LFuOaKEXHjt
	rhbGxaEOaKN/qL7LrAVjLI9dVUuxtFM6ziIM3tolGpYzJWfIOHLoOLL5wqSrQWVjxRUdfXYuiKj
	2WJlt7CeBFBpXI/r6P7kagZoDGNXm6MEqkXaAWJXDL5VCwnLsDLnz+UaTbnoUbT906EE8bgFfh0
	UM/GpDx7Ri7ZCDp3D1KJm81bcE0ZfhzhvYBG1moOPCv3LCCDYuBElUpjvNDvYbf/Io2BN+ZxRkD
	Ja/zgWzPUdWME9L937pWcBjryQjdHxXflURBlXgxmoORuTyaZEs8NU3o/dWzJuZ8sCrYBRMuGqp
	yZd4NGd1m2Q==
X-Google-Smtp-Source: AGHT+IE01w/Ouj1tkWXlhj50kZzgudDJOilj7qiUi563NWzvBG0bHUFa/ABX5ak9AzbbT0d87340Fg==
X-Received: by 2002:a05:6000:4387:b0:3a5:2d42:aa23 with SMTP id ffacd0b85a97d-3a5723720aamr2490259f8f.22.1749908137492;
        Sat, 14 Jun 2025 06:35:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm5306744f8f.67.2025.06.14.06.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 06:35:37 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v5 1/3] Workqueue: add system_percpu_wq and system_dfl_wq
Date: Sat, 14 Jun 2025 15:35:29 +0200
Message-ID: <20250614133531.76742-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614133531.76742-1-marco.crivellari@suse.com>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users. Make
it clear by adding a system_percpu_wq.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/workqueue.h |  8 +++++---
 kernel/workqueue.c        | 13 +++++++++----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 6e30f275da77..502ec4a5e32c 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -427,7 +427,7 @@ enum wq_consts {
 /*
  * System-wide workqueues which are always present.
  *
- * system_wq is the one used by schedule[_delayed]_work[_on]().
+ * system_percpu_wq is the one used by schedule[_delayed]_work[_on]().
  * Multi-CPU multi-threaded.  There are users which expect relatively
  * short queue flush time.  Don't queue works which can run for too
  * long.
@@ -438,7 +438,7 @@ enum wq_consts {
  * system_long_wq is similar to system_wq but may host long running
  * works.  Queue flushing might take relatively long.
  *
- * system_unbound_wq is unbound workqueue.  Workers are not bound to
+ * system_dfl_wq is unbound workqueue.  Workers are not bound to
  * any specific CPU, not concurrency managed, and all queued works are
  * executed immediately as long as max_active limit is not reached and
  * resources are available.
@@ -455,10 +455,12 @@ enum wq_consts {
  * system_bh[_highpri]_wq are convenience interface to softirq. BH work items
  * are executed in the queueing CPU's BH context in the queueing order.
  */
-extern struct workqueue_struct *system_wq;
+extern struct workqueue_struct *system_wq; /* use system_percpu_wq, this will be removed */
+extern struct workqueue_struct *system_percpu_wq;
 extern struct workqueue_struct *system_highpri_wq;
 extern struct workqueue_struct *system_long_wq;
 extern struct workqueue_struct *system_unbound_wq;
+extern struct workqueue_struct *system_dfl_wq;
 extern struct workqueue_struct *system_freezable_wq;
 extern struct workqueue_struct *system_power_efficient_wq;
 extern struct workqueue_struct *system_freezable_power_efficient_wq;
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97f37b5bae66..9047f658ccf2 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -505,12 +505,16 @@ static struct kthread_worker *pwq_release_worker __ro_after_init;
 
 struct workqueue_struct *system_wq __ro_after_init;
 EXPORT_SYMBOL(system_wq);
+struct workqueue_struct *system_percpu_wq __ro_after_init;
+EXPORT_SYMBOL(system_percpu_wq);
 struct workqueue_struct *system_highpri_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_highpri_wq);
 struct workqueue_struct *system_long_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_long_wq);
 struct workqueue_struct *system_unbound_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_unbound_wq);
+struct workqueue_struct *system_dfl_wq __ro_after_init;
+EXPORT_SYMBOL_GPL(system_dfl_wq);
 struct workqueue_struct *system_freezable_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_freezable_wq);
 struct workqueue_struct *system_power_efficient_wq __ro_after_init;
@@ -7829,10 +7833,11 @@ void __init workqueue_init_early(void)
 	}
 
 	system_wq = alloc_workqueue("events", 0, 0);
+	system_percpu_wq = alloc_workqueue("events", 0, 0);
 	system_highpri_wq = alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
 	system_long_wq = alloc_workqueue("events_long", 0, 0);
-	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND,
-					    WQ_MAX_ACTIVE);
+	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND, WQ_MAX_ACTIVE);
+	system_dfl_wq = alloc_workqueue("events_unbound", WQ_UNBOUND, WQ_MAX_ACTIVE);
 	system_freezable_wq = alloc_workqueue("events_freezable",
 					      WQ_FREEZABLE, 0);
 	system_power_efficient_wq = alloc_workqueue("events_power_efficient",
@@ -7843,8 +7848,8 @@ void __init workqueue_init_early(void)
 	system_bh_wq = alloc_workqueue("events_bh", WQ_BH, 0);
 	system_bh_highpri_wq = alloc_workqueue("events_bh_highpri",
 					       WQ_BH | WQ_HIGHPRI, 0);
-	BUG_ON(!system_wq || !system_highpri_wq || !system_long_wq ||
-	       !system_unbound_wq || !system_freezable_wq ||
+	BUG_ON(!system_wq || !system_percpu_wq|| !system_highpri_wq || !system_long_wq ||
+	       !system_unbound_wq || !system_freezable_wq || !system_dfl_wq ||
 	       !system_power_efficient_wq ||
 	       !system_freezable_power_efficient_wq ||
 	       !system_bh_wq || !system_bh_highpri_wq);
-- 
2.49.0

