Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D21FAC56
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569642; cv=none; b=mADXnSIvUvhzckDJw0SIteZHdKShGepgYUoXxZwOmPmhJ5kWDR4wolWRlqXBFzHWV3jwmD94K2hVEIXDX3eKGJUcHZURCg8PQDI0bqnJDPMNq1Uxf8PMD/CttBjKAzG81m+/sC3ee4+vx8QzGvUrVAoCoYuTkXzJbIBQNprwTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569642; c=relaxed/simple;
	bh=jaKiohpGb5GRdH2MM0NHY0F9IMzao8bMivRAcK7K9P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0cxIcBQwaLkd/UKgplBwPhaM4K2Z5Ge430+hzsEfUWY+Rtm/cB3Hca1aupdyHsLA4wehGITBZa4/Z6EDoXhBaWu/VCEsOBNXWGgILSw+7tbSWgsZIAYJ4fNSU+a78N0qUBNq974XOl3UBo+Dcn2ccvE/YaJE4EoluS20tY89lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VOZCFPIP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VOZCFPIP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2165448243fso74151295ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738569639; x=1739174439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEhIHxdD7NA+wb7AGZrBPq/eWZXsbGs0lajgHFDORFY=;
        b=VOZCFPIPJBsFnPu+4rYTCOdUOmVhs1EhTyShILZyxefa0G9uF1IyO8VRHv1ZiKzJNH
         ZvQExOt0TpzVq4Jkj4M1KfyoX5jI+uyocCv2C1afuQIqBARvfIu85X7FmqbikqmPSZTE
         AuIBqDMM6xfqLaKg20GEYWDhGVhkDfkFvqr19J5VDAH1rkcXpdB7Einds4Vwg2aPXrHp
         ivgzTJqyO+CTiDbeKmBp8rcONn7jV7QNODlyvTutrRmvaExJT6v5sB76lfRy+AjHRE7E
         gmSTtlt6xkLLyJyGuoRPd1pQmI7/PGRQ9R/UKJ0vS/bGrk6pjg1R9dlZBJPIiM8aVzYa
         KKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738569639; x=1739174439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEhIHxdD7NA+wb7AGZrBPq/eWZXsbGs0lajgHFDORFY=;
        b=udQohZwvyYHQnjG9e4yZf7GfirMSiAdY+1Ebzqx+0ZvMLbmXIsQSY4KDiMtfdg6bfm
         BRlXTOsE1tipf7mXUDNk6c++UIFZ2MEWXkDItnyFine6nqG71SQqnRF6+hdwLTdOYeXM
         b/FJ57KQdfjBtV5J3LsoWjX8iaJuq0bVlF++iq/joO3ZoS2mbiSrclzydAioFZ2+l7rf
         XpMUbVai0FSjmR0qJ7T3enxVzRmAfSrI2ZXAGaXD05F6cXNH7t93nua3AcdNjOdcERWj
         XD2KcP2VHqKNzHJQ6m2GuFtXT/W0udjDT/0BEbf48auMbazzO+lRQ7+uNUe3ISE5Rl29
         peSg==
X-Forwarded-Encrypted: i=1; AJvYcCVWNnriRr6nN2L6fBlVBtbVtsHxJmRlQxjqjwznEzfSsrgz/9Q/hnomPlhjBMXwR6XKcpFF7UqPrMqNe/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyThm5CMkYVEpK24RsDiDWBnC2DG+adGOMKVeQz9twqhWJmy3o7
	96B+mtplwxbZJ6ceVRXJ38Ki/FqAoM/b3V4fwqEPuKPyG3Z30NkcV25SoiaNgCE=
X-Gm-Gg: ASbGncuZ6ymxvEVxRpGFClYPl0qdCyoxQmQo15qkA8xiWJ2JrvCFroYpVgDuJ7HPwQ+
	XXlQG0HR3EqhA1YPQ/7MCn3Cvzk5YSN/vsERs7Mhe1ewdAAPW4g7YpZJC9i74VHHj1zvrDPUHbq
	O34qnnorL3zcfqoCi/+tDlaYetcgBKymP11qTscrTBzSjRQslQJtPq0oGyJyUqQ94gjobUASfV7
	VKOx5rVmdsQ07mJPJQzbUKEGIK3DYbjjxg2JcBG3NYiz78LVDGh2COt15tGYmGbH3af8wwY8g+t
	HW9PWRwkgk4tXDzJ
X-Google-Smtp-Source: AGHT+IFygNmOrpVihmSPJ5OWge6wX18dOo3mm00DI8j33PuGPe0wQOTVelVmoTclLlggQpQiNOjbbg==
X-Received: by 2002:a17:902:d4c3:b0:216:6ef9:621 with SMTP id d9443c01a7336-21dd7d96eb8mr319257395ad.31.1738569639585;
        Mon, 03 Feb 2025 00:00:39 -0800 (PST)
Received: from sumit-X1.. ([223.178.212.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f71b9sm70236425ad.84.2025.02.03.00.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:00:39 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: jens.wiklander@linaro.org,
	arnd@arndb.de
Cc: op-tee@lists.trustedfirmware.org,
	jerome.forissier@linaro.org,
	dannenberg@ti.com,
	javier@javigon.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] tee: optee: Fix supplicant wait loop
Date: Mon,  3 Feb 2025 13:30:30 +0530
Message-ID: <20250203080030.384929-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OP-TEE supplicant is a user-space daemon and it's possible for it
being hung or crashed or killed in the middle of processing an OP-TEE
RPC call. It becomes more complicated when there is incorrect shutdown
ordering of the supplicant process vs the OP-TEE client application which
can eventually lead to system hang-up waiting for the closure of the
client application.

Allow the client process waiting in kernel for supplicant response to
be killed rather than indefinitetly waiting in an unkillable state. This
fixes issues observed during system reboot/shutdown when supplicant got
hung for some reason or gets crashed/killed which lead to client getting
hung in an unkillable state. It in turn lead to system being in hung up
state requiring hard power off/on to recover.

Fixes: 4fb0a5eb364d ("tee: add OP-TEE driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Switch to killable wait instead as suggested by Arnd instead
  of supplicant timeout. It atleast allow the client to wait for
  supplicant in killable state which in turn allows system to reboot
  or shutdown gracefully.

 drivers/tee/optee/supp.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index 322a543b8c27..3fbfa9751931 100644
--- a/drivers/tee/optee/supp.c
+++ b/drivers/tee/optee/supp.c
@@ -80,7 +80,6 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	struct optee *optee = tee_get_drvdata(ctx->teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req;
-	bool interruptable;
 	u32 ret;
 
 	/*
@@ -111,36 +110,19 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	/*
 	 * Wait for supplicant to process and return result, once we've
 	 * returned from wait_for_completion(&req->c) successfully we have
-	 * exclusive access again.
+	 * exclusive access again. Allow the wait to be killable such that
+	 * the wait doesn't turn into an indefinite state if the supplicant
+	 * gets hung for some reason.
 	 */
-	while (wait_for_completion_interruptible(&req->c)) {
-		mutex_lock(&supp->mutex);
-		interruptable = !supp->ctx;
-		if (interruptable) {
-			/*
-			 * There's no supplicant available and since the
-			 * supp->mutex currently is held none can
-			 * become available until the mutex released
-			 * again.
-			 *
-			 * Interrupting an RPC to supplicant is only
-			 * allowed as a way of slightly improving the user
-			 * experience in case the supplicant hasn't been
-			 * started yet. During normal operation the supplicant
-			 * will serve all requests in a timely manner and
-			 * interrupting then wouldn't make sense.
-			 */
+	if (wait_for_completion_killable(&req->c)) {
+		if (!mutex_lock_killable(&supp->mutex))	{
 			if (req->in_queue) {
 				list_del(&req->link);
 				req->in_queue = false;
 			}
+			mutex_unlock(&supp->mutex);
 		}
-		mutex_unlock(&supp->mutex);
-
-		if (interruptable) {
-			req->ret = TEEC_ERROR_COMMUNICATION;
-			break;
-		}
+		req->ret = TEEC_ERROR_COMMUNICATION;
 	}
 
 	ret = req->ret;
-- 
2.43.0

