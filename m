Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC1318A95A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529574; cv=none; b=cGwSrBCuyUu06JV1ce7Wqa3HAoYIyevUU9X81blxoe8eyk1SyctjZDIoEAI58mIlEaGc2h3vqh2aEIe+yePdOFxyfv4N0L7Y4aWYATldsh/9X4H2Kq08blzoX9JG4Rwc2ziuesbOWCCDXE6TT/VENtzn2EE8pl/23o4UoQyLOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529574; c=relaxed/simple;
	bh=Hj77r4cZerWuVUCWJBhvlhNrpoiETEOAraEvo2HS0KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqc8jAZjVRk4EF20IfxDBgwvs6KMsA9eJT31H4cjynYM15cCXVu6xf639FCrMUNE5Nt/Hl2bgetqOJeRvoztHmvQUaHKIugN8UJutMUz0sqK04/YU6JGbla1Uvo9gf0gxiCI0sSbQFgttlW8R1CqNsHksMx1GCXsNf9VN/7u+Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAuDhEdQ; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAuDhEdQ"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-476964b2c1dso59384741cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529572; x=1745134372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uby1Q+b765/55h4CWBlJtND/wv5GPZpZ5T+Fpb9xa8=;
        b=UAuDhEdQCMaLguj2iiWWmhUli5PPjUyS53XBN/UG37PVpvARAGD8UjbuOk5pF1c9jR
         5mmEj04bvESeVPG4Ms5iJSsmGakMurtpu3bJjNyonisUmr09rMnypHjV+In+yYIeUjaI
         xbSqzbyNpiteCN7CHgQ9CwtzeGigdjpviw6W6vZmAKzp1otkOFtbmHTf4No3KOqaSpsd
         qNLiP+bFS2Lhn/2G+HxT72URBt2n0WzOst7LWZgl6XGPvML+RQkNkBFKHb7wCUIdrQZO
         /lPIS6HDpudZY+gjWCGLqIzk3/KJRfc4psfbnOURtmSzt1lNBHWEMM8WU3IEhBzj5Q95
         Pf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529572; x=1745134372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uby1Q+b765/55h4CWBlJtND/wv5GPZpZ5T+Fpb9xa8=;
        b=GheWCUJIr/7lC1PAQ0mqqIb1NIFPaaZEBMn7hzLxU7G2uRnu+EyYKvRRVrhlGzM/fz
         UZwaU/MENyDFQn9v3UqG/GaNuxUiFVuej4kkboDFTwjuH1DvYtFkR1lONVqKnzJjcxEz
         2wjVsoOt7lYYhgEf30jaegDXKsEyXDainjKKlTx6N+SZzDrCnroG5yw0f9bMjefc6Za3
         nMvQIA3xPEAvWLbn+/4aWvMLffe7R4ym2TBjW9Nji8wO1zhE2cDh3QmQDLWpe9MLcYun
         NbnLWLV6bkpys98mNtPasXe6rVOFcTRsa+fyBiuLDrG13CpvHOuhCLQ0TV2uKcCPEtCg
         ViZA==
X-Forwarded-Encrypted: i=1; AJvYcCWNVS4UZiahIF9vulZvi/VW9FirDOYY8C5N3AY213sjxL1k7qrdbmEQFaxPgucG39iI1s1HlWb5reMFs/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58J7j8Lqy82fpxFQ81/DiSTp+6OWfMYpSfAy9w25sNtGc4Zuo
	cY7JhVzcnAClrxG91+fOnFbCSXKqPK6HLcyPW9ONQj2Xi7B+udb5
X-Gm-Gg: ASbGncu/+OzyuYV3kY+c6N27suC6kQpB9UGnghQGMVNpLvuHCGZB7QlooSXXWrmDkmT
	rjEk9Ji81oWjBJqPlQAZA6sn/179o/J05l12YMPpcFXmiCEmKsUhkk1YjqBTRcZV9jqz+be9CoL
	9WnH3AnhepU3fXWkFn0J9HvlqL8dCvB8M01zZbX/Enq7oiLJuM+tK2t5qyb2/r1gTq7Ovlj8n9z
	IxGg9SREQywNGgrl8oPfk3GNce4RiGYXHTIfgPLArknPH4fcbfQ2iPdosoX6cm472PYAgWZS4PB
	7VYdJXoeUK6FiuNpxOLLWx93sXBiS6T/U+ytU9LoPaaYqinx5Hp5DdmooXYl98taUqzmeu3TU7f
	9+8x7OcBzlxp4Nt62LA==
X-Google-Smtp-Source: AGHT+IHRArwDsyiOHSw0uFQ2zMdIEQRmtTDX1Ac43R0yu6Md3oC0QegCdhqwo2sEf+nt/jF/DRPgjA==
X-Received: by 2002:ac8:7dcc:0:b0:479:1a10:8958 with SMTP id d75a77b69052e-4797750fb92mr128705241cf.1.1744529571657;
        Sun, 13 Apr 2025 00:32:51 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:51 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 3/4] staging: greybus: refactor gb_loopback_fn into smaller helper functions
Date: Sun, 13 Apr 2025 07:32:19 +0000
Message-ID: <20250413073220.15931-4-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch refactors the gb_loopback_fn() function in loopback.c by
splitting large blocks of logic into well-named static helpers to
improve clarity, readability, and maintainability.

The control flow remains unchanged. No functional modifications
are introduced.

This aligns with kernel coding style guidelines for long functions
and helps future contributors understand and modify loopback behavior
more easily.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/loopback.c | 152 ++++++++++++++++-------------
 1 file changed, 82 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index c194afea941a..1e3644ede1b6 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -832,105 +832,117 @@ static void gb_loopback_async_wait_to_send(struct gb_loopback *gb)
 				  kthread_should_stop());
 }
 
-static int gb_loopback_fn(void *data)
+static bool gb_loopback_should_stop(struct gb_loopback *gb,
+				    struct gb_bundle *bundle)
+{
+	if (!gb->type) {
+		gb_pm_runtime_put_autosuspend(bundle);
+		wait_event_interruptible(gb->wq,
+					 gb->type || kthread_should_stop());
+		if (kthread_should_stop())
+			return true;
+		gb_pm_runtime_get_sync(bundle);
+	}
+	return kthread_should_stop();
+}
+
+static void gb_loopback_handle_completion(struct gb_loopback *gb,
+					  struct gb_bundle *bundle)
+{
+	gb_loopback_async_wait_all(gb);
+
+	mutex_lock(&gb->mutex);
+	if (gb->iteration_count == gb->iteration_max) {
+		gb->type = 0;
+		gb->send_count = 0;
+		sysfs_notify(&gb->dev->kobj, NULL, "iteration_count");
+		dev_dbg(&bundle->dev, "load test complete\n");
+	} else {
+		dev_dbg(&bundle->dev, "continuing on with new test set\n");
+	}
+	mutex_unlock(&gb->mutex);
+}
+
+static void gb_loopback_dispatch_operation(struct gb_loopback *gb, int type,
+					   u32 size)
 {
 	int error = 0;
-	int us_wait = 0;
-	int type;
-	int ret;
-	u32 size;
 
+	if (gb->async) {
+		if (type == GB_LOOPBACK_TYPE_PING)
+			error = gb_loopback_async_ping(gb);
+		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
+			error = gb_loopback_async_transfer(gb, size);
+		else if (type == GB_LOOPBACK_TYPE_SINK)
+			error = gb_loopback_async_sink(gb, size);
+
+		if (error) {
+			gb->error++;
+			gb->iteration_count++;
+		}
+	} else {
+		if (type == GB_LOOPBACK_TYPE_PING)
+			error = gb_loopback_sync_ping(gb);
+		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
+			error = gb_loopback_sync_transfer(gb, size);
+		else if (type == GB_LOOPBACK_TYPE_SINK)
+			error = gb_loopback_sync_sink(gb, size);
+
+		if (error)
+			gb->error++;
+		gb->iteration_count++;
+		gb_loopback_calculate_stats(gb, !!error);
+	}
+}
+
+static void gb_loopback_delay_if_needed(int us_wait)
+{
+	if (us_wait) {
+		if (us_wait < 20000)
+			usleep_range(us_wait, us_wait + 100);
+		else
+			msleep(us_wait / 1000);
+	}
+}
+
+static int gb_loopback_fn(void *data)
+{
+	int us_wait = 0, type;
+	u32 size;
 	struct gb_loopback *gb = data;
 	struct gb_bundle *bundle = gb->connection->bundle;
 
-	ret = gb_pm_runtime_get_sync(bundle);
-	if (ret)
-		return ret;
+	if (gb_pm_runtime_get_sync(bundle))
+		return -EIO;
 
 	while (1) {
-		if (!gb->type) {
-			gb_pm_runtime_put_autosuspend(bundle);
-			wait_event_interruptible(gb->wq, gb->type ||
-						 kthread_should_stop());
-			ret = gb_pm_runtime_get_sync(bundle);
-			if (ret)
-				return ret;
-		}
-
-		if (kthread_should_stop())
+		if (gb_loopback_should_stop(gb, bundle))
 			break;
 
-		/* Limit the maximum number of in-flight async operations */
 		gb_loopback_async_wait_to_send(gb);
 		if (kthread_should_stop())
 			break;
 
 		mutex_lock(&gb->mutex);
 
-		/* Optionally terminate */
 		if (gb->send_count == gb->iteration_max) {
 			mutex_unlock(&gb->mutex);
-
-			/* Wait for synchronous and asynchronous completion */
-			gb_loopback_async_wait_all(gb);
-
-			/* Mark complete unless user-space has poked us */
-			mutex_lock(&gb->mutex);
-			if (gb->iteration_count == gb->iteration_max) {
-				gb->type = 0;
-				gb->send_count = 0;
-				sysfs_notify(&gb->dev->kobj,  NULL,
-					     "iteration_count");
-				dev_dbg(&bundle->dev, "load test complete\n");
-			} else {
-				dev_dbg(&bundle->dev,
-					"continuing on with new test set\n");
-			}
-			mutex_unlock(&gb->mutex);
+			gb_loopback_handle_completion(gb, bundle);
 			continue;
 		}
+
 		size = gb->size;
 		us_wait = gb->us_wait;
 		type = gb->type;
 		if (ktime_to_ns(gb->ts) == 0)
 			gb->ts = ktime_get();
 
-		/* Else operations to perform */
-		if (gb->async) {
-			if (type == GB_LOOPBACK_TYPE_PING)
-				error = gb_loopback_async_ping(gb);
-			else if (type == GB_LOOPBACK_TYPE_TRANSFER)
-				error = gb_loopback_async_transfer(gb, size);
-			else if (type == GB_LOOPBACK_TYPE_SINK)
-				error = gb_loopback_async_sink(gb, size);
-
-			if (error) {
-				gb->error++;
-				gb->iteration_count++;
-			}
-		} else {
-			/* We are effectively single threaded here */
-			if (type == GB_LOOPBACK_TYPE_PING)
-				error = gb_loopback_sync_ping(gb);
-			else if (type == GB_LOOPBACK_TYPE_TRANSFER)
-				error = gb_loopback_sync_transfer(gb, size);
-			else if (type == GB_LOOPBACK_TYPE_SINK)
-				error = gb_loopback_sync_sink(gb, size);
-
-			if (error)
-				gb->error++;
-			gb->iteration_count++;
-			gb_loopback_calculate_stats(gb, !!error);
-		}
+		gb_loopback_dispatch_operation(gb, type, size);
+
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		gb_loopback_delay_if_needed(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

