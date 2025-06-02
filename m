Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E291C84B1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865913; cv=none; b=KSgCrR6oj/aUz1lryAojhljC8NnEjB9IhVj5pQCzsExSyvQdUPZJClbKWgWJctOvilB4UGnoyFZYkkW/r+88Yh1pfwrQJRDfL4FcxfhdTaQ/ZUWHQZnsb20b1CbIgwK4LA+qojpQ6ironusSO2aUARzFhATbVfuFUVN51j8ncrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865913; c=relaxed/simple;
	bh=D70RDuxiHEgx+yx3M0hxaXY5sUCcYpAz57VaVFZuo3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKApMYDFNpD/7KyRG8lRAnzMS0bQlTt5ScBgSJjC0awwDu6i3QeyuwDUkt3p3RRgk9DB7a7fsa7x6++NiSQhkjofyk/eV6kxmLw7uGrNYZyQNN2zyXrxR6S/yxsEOKZXP3A29tBC457ZRmSaKCmzauMQQvZvsG+ELhc2EfFzIgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5DELdNi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5DELdNi"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad8826c05f2so771159966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748865909; x=1749470709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXqT1W9coYxflQ58g2BW6Pc86Dj0YWrYeMFCe9jmnks=;
        b=v5DELdNik7dpkngvY2LQNaXmpgaV0M+Xjc8JwGFer0QGrxR6yHRIwzTNKQpirL9dZn
         xpHWkVgqqqZ+Oqwpb6oGZQtmgMeeN745zABi6N5gf1E3KnKSX98uOGk6z777WXdQxtr6
         raYxSPiIRBbWoGHVL3NmDVQfWjP3bD/RZcwShxE2kZUWtkULTgZyfJEZWzDO6cijdTIG
         8Q2MYFupmNMISpzYIjMlGKL0ur5RB255ecV376y5nFO6wx8Z02Bm1T3xzukGTHJy3RxJ
         Nb1JEamnqCLMpMF39itaQRxL+09CI800l6veriJDkarWNSPxkwYZ0uNaeAUDc/B9nwk8
         WVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748865909; x=1749470709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXqT1W9coYxflQ58g2BW6Pc86Dj0YWrYeMFCe9jmnks=;
        b=LRK/m+kTn99pb3VKsjfcZgsVUnlXKLzwS29fft6hLtyeUy6kHsh4eLrx7nxN2iC8B4
         r4s4kEvlBB7xEnr8Ouu1dkVeKWpoyY3bmwrTdZMIeipHS/F5ZScTEF+SkuMGzeOQaY7k
         yDUQlmcNnfy8lgZH+jX++F8KyrAhLYMu3NaoPAvFRWeKI/igHjHzLM/+U72zWxJj56pA
         pVv34e/6JjkTfI+RcXgyV5HCxNXHOjv22z5RHOxb+iHZuaBQrEIfOp5KPEZv4jaQHkh1
         xXIVoUGb0BMMiUBTfnlf5l3yWIc1Y7tipGnlU+P2yfIGQy+cYGE/UTOdNImCD0P+zj+0
         ADRA==
X-Gm-Message-State: AOJu0Yyh9hLzKCfGkOu203QHewHUlqeuXz/vQJfX8g/KBcH4NweUEt1S
	N5ADSTLmM96Rbwq9DygvjK5/xHqEM8h/lp8puaBNsTMiqZjwkZHULAMlxjgSS57zpaZoPFfrfyO
	OkPou
X-Gm-Gg: ASbGnctC6BCCdkyCCnjVg9GFWrWOAig8IMEthX3Q/6ohnIgZW7NjDhZc/y6dXvMx0y6
	uZC5TC0j2TSOp2lyXLdDScvLdBDujIcvsPBg0UPEMWcyDfukIlVTBlhF1nf/LGXdxrRvy3DlwI5
	IE2kJo4BrRQfr1qRkdtsVbY1KIfKawFuNQRaZAR2IF2wNmL3VEQJ5UOsfHC1MHUtrdxokj3+VX4
	otkijpxt2Iaw7wddRd/wnOSwLioQFki4LHifouMKbzFD7GmGWfzMppGQxBotI5o0JD9lRkiiCHy
	UqSjsHDbwjo5BZZMz9luUoEtSGcrXVweIPmDHgqddI9uR6n+YiiqoKUEpdYdwYllWzHqgbWOjoG
	xOXE46Wmbdww/vUH6UxVlmF208zuN
X-Google-Smtp-Source: AGHT+IEVQ9uC/APOXLZA8rP51xl0Oh2FIud0sbigPbTzSlGEbMSLk7pPhiqm+QJ0ezu7OnHY+TD/yA==
X-Received: by 2002:a17:907:60d6:b0:ad8:a88c:84e3 with SMTP id a640c23a62f3a-adb36ba4bf9mr1159519166b.33.1748865909550;
        Mon, 02 Jun 2025 05:05:09 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf029sm777773466b.115.2025.06.02.05.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:05:08 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH] optee: ffa: fix sleep in atomic context
Date: Mon,  2 Jun 2025 14:04:35 +0200
Message-ID: <20250602120452.2507084-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OP-TEE driver registers the function notif_callback() for FF-A
notifications. However, this function is called in an atomic context
leading to errors like this when processing asynchronous notifications:

 | BUG: sleeping function called from invalid context at kernel/locking/mutex.c:258
 | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kworker/0:0
 | preempt_count: 1, expected: 0
 | RCU nest depth: 0, expected: 0
 | CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0-00019-g657536ebe0aa #13
 | Hardware name: linux,dummy-virt (DT)
 | Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
 | Call trace:
 |  show_stack+0x18/0x24 (C)
 |  dump_stack_lvl+0x78/0x90
 |  dump_stack+0x18/0x24
 |  __might_resched+0x114/0x170
 |  __might_sleep+0x48/0x98
 |  mutex_lock+0x24/0x80
 |  optee_get_msg_arg+0x7c/0x21c
 |  simple_call_with_arg+0x50/0xc0
 |  optee_do_bottom_half+0x14/0x20
 |  notif_callback+0x3c/0x48
 |  handle_notif_callbacks+0x9c/0xe0
 |  notif_get_and_handle+0x40/0x88
 |  generic_exec_single+0x80/0xc0
 |  smp_call_function_single+0xfc/0x1a0
 |  notif_pcpu_irq_work_fn+0x2c/0x38
 |  process_one_work+0x14c/0x2b4
 |  worker_thread+0x2e4/0x3e0
 |  kthread+0x13c/0x210
 |  ret_from_fork+0x10/0x20

Fix this by adding work queue to process the notification in a
non-atomic context.

Fixes: d0476a59de06 ("optee: ffa_abi: add asynchronous notifications")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/ffa_abi.c       | 41 ++++++++++++++++++++++++-------
 drivers/tee/optee/optee_private.h |  2 ++
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index f3af5666bb11..f9ef7d94cebd 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -728,12 +728,21 @@ static bool optee_ffa_exchange_caps(struct ffa_device *ffa_dev,
 	return true;
 }
 
+static void notif_work_fn(struct work_struct *work)
+{
+	struct optee_ffa *optee_ffa = container_of(work, struct optee_ffa,
+						   notif_work);
+	struct optee *optee = container_of(optee_ffa, struct optee, ffa);
+
+	optee_do_bottom_half(optee->ctx);
+}
+
 static void notif_callback(int notify_id, void *cb_data)
 {
 	struct optee *optee = cb_data;
 
 	if (notify_id == optee->ffa.bottom_half_value)
-		optee_do_bottom_half(optee->ctx);
+		queue_work(optee->ffa.notif_wq, &optee->ffa.notif_work);
 	else
 		optee_notif_send(optee, notify_id);
 }
@@ -817,9 +826,11 @@ static void optee_ffa_remove(struct ffa_device *ffa_dev)
 	struct optee *optee = ffa_dev_get_drvdata(ffa_dev);
 	u32 bottom_half_id = optee->ffa.bottom_half_value;
 
-	if (bottom_half_id != U32_MAX)
+	if (bottom_half_id != U32_MAX) {
 		ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev,
 							      bottom_half_id);
+		destroy_workqueue(optee->ffa.notif_wq);
+	}
 	optee_remove_common(optee);
 
 	mutex_destroy(&optee->ffa.mutex);
@@ -835,6 +846,13 @@ static int optee_ffa_async_notif_init(struct ffa_device *ffa_dev,
 	u32 notif_id = 0;
 	int rc;
 
+	INIT_WORK(&optee->ffa.notif_work, notif_work_fn);
+	optee->ffa.notif_wq = create_workqueue("optee_notification");
+	if (!optee->ffa.notif_wq) {
+		rc = -EINVAL;
+		goto err;
+	}
+
 	while (true) {
 		rc = ffa_dev->ops->notifier_ops->notify_request(ffa_dev,
 								is_per_vcpu,
@@ -851,19 +869,24 @@ static int optee_ffa_async_notif_init(struct ffa_device *ffa_dev,
 		 * notifications in that case.
 		 */
 		if (rc != -EACCES)
-			return rc;
+			goto err_wq;
 		notif_id++;
 		if (notif_id >= OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE)
-			return rc;
+			goto err_wq;
 	}
 	optee->ffa.bottom_half_value = notif_id;
 
 	rc = enable_async_notif(optee);
-	if (rc < 0) {
-		ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev,
-							      notif_id);
-		optee->ffa.bottom_half_value = U32_MAX;
-	}
+	if (rc < 0)
+		goto err_rel;
+
+	return 0;
+err_rel:
+	ffa_dev->ops->notifier_ops->notify_relinquish(ffa_dev, notif_id);
+err_wq:
+	destroy_workqueue(optee->ffa.notif_wq);
+err:
+	optee->ffa.bottom_half_value = U32_MAX;
 
 	return rc;
 }
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index dc0f355ef72a..9526087f0e68 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -165,6 +165,8 @@ struct optee_ffa {
 	/* Serializes access to @global_ids */
 	struct mutex mutex;
 	struct rhashtable global_ids;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
 };
 
 struct optee;
-- 
2.43.0

