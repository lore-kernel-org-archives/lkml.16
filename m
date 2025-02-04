Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA61754B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654471; cv=none; b=hR/+WZijtNrd4N/QgmmVTrNy0QOrf43YARnYfSAjiWwh7hOT00UcrQgUBfTlbMpM5jsHsEQFsvA9w3Ley4nhdHEKF+dEu3cvyeJGHeQoYAONd9SvAOUdyxTDA2TWQB5jCSH5o4SeuSObT3vOmZzniqyErH3tDaDC4kwH0BxmRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654471; c=relaxed/simple;
	bh=cl8ZT91z9S2tpe4krwwQNNz+rzfjEqha0MrzcdBk87M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kP14onf/yyYB5Rh0Yoirnp8fBQ82cQBMYr8cCnzVuEP6sd5MzZGfIH7m9/+BUxsFZqiQ844mCniUdkW1SxpOa0tPOdFCY81qcwOO/oQrnM0ubLr84sz/TCPJkIgQAHBz25UfkKpsRQY38dW7MHqt9AskQ+eatHA/LCKHBfXxyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAlX9YGL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAlX9YGL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21628b3fe7dso95947535ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738654468; x=1739259268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orjpaukFM37/+hASeec/fvQ2v80Tt5itf/oXBVJGIZU=;
        b=kAlX9YGLgwOXeBgAFlD9qZBE7SsYdg8UsQSxf8mW0pbSdqt9IdjYPnS5fNtFlL0d3K
         QwyrLpA35JSqUudFmXaNeEZX9ZLuleBk36YdLhQvworDnGbbTu0YMx73oAcXBb0uNJN4
         6IMhi2n2ksv/zjxjOBu7vfsMGd7d4bMHpQDKV1DPTa9vy4Hz2Rbe/ZUooAcAAkQUaugr
         PANvozS8d/aPi3r2MHzqc+4u9SQtyxKyuXchihckmliqqQcAQ3HJJaEROJq8h8lfMZ5b
         IwrMoQKVlozI0kByzu4aP4vcuWaEhslv7f0zH4Qf72FQapBN/7h7KuoHFOiEPxGNkbde
         VCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654468; x=1739259268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orjpaukFM37/+hASeec/fvQ2v80Tt5itf/oXBVJGIZU=;
        b=XF2ssxie88gmmAbWxqiwAXO0JoSAZOEBq+hMNmdYpkDqPXSNHuESs3u/Slyl79uzll
         SrMz9yLu2ZwFDhko5ZztEv3S6tQ93ns8FduKcZkfi79MEMVRjXkv+hhMM8fk5yhCvVMh
         1AeqsLgzOzULe5F1ciD8JSqOk/evG6CbYByDymMBxAVs+bxEqqqfpTYfCgrmYNoPyuH2
         KadlN6loIk6lEYpA4wmanpBoydRmSq8qi1TU0hvPBYofhlcdkY30dX1YfDW82RtXkXAF
         yRL1nYHiPhouuOnBv5WyPC3GsThlgNE0VsNy5Q7v0zejJSviN6EY7SLJdEl92Gir9TZV
         Crmg==
X-Forwarded-Encrypted: i=1; AJvYcCUgor0ADB9Zr+/WqPUaDih4DQoPNruUmzRi1GAd01MZYV6LL4xI7n/LYTiYWddWd2i23RmK9vEzvKLlECw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEDs6ycqPqFTa73A2YK5TpY+wM0UL5XEjF6tCHTpdFRDs8Txe+
	BBG2GnsDlqGUZbLXQBNtkbyCC7oAtm4iDTGw5YR4I4vgCrVMVN81nCCfOyr148s=
X-Gm-Gg: ASbGncsTYP9TiJBTAHf+upeCeLHK7Rkuh0niiD8SraqVMc6xebxCTtD+Zd/qWyHAMhe
	EG9AX8P/B483XSjWyN6RU97zM3+LyCRPvjeJr3XZXROi5AHsTskySHB2UxILd4wWvQoQyDfALkz
	FM7yprGR6qIcTV5saH4cyJhoAeQ+V/RuCzNvQxQGH+FWinvDifoQ6TAH9fT4z+/wGsMxmsBPwLH
	tmd4EaVfNuzT+1l7ZcFqpwLcmQAEj5x0qSi45h+epAQPKWmQvbeLXVt1DCt8mDfvKAIm0fQBofq
	yaU8Za8Tvnoij5yc
X-Google-Smtp-Source: AGHT+IH7iRztA6y9IjznIKh/2zF04c+yLjm/3BTLuBiqf/u/s9hr0MUSVaQHHQhZkJm6tpZj+s6tVw==
X-Received: by 2002:a17:902:d4cb:b0:215:a434:b6ad with SMTP id d9443c01a7336-21dd7ddde1bmr392541465ad.33.1738654468133;
        Mon, 03 Feb 2025 23:34:28 -0800 (PST)
Received: from sumit-X1.. ([223.178.208.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eb97csm88569225ad.123.2025.02.03.23.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:34:27 -0800 (PST)
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
Subject: [PATCH v3] tee: optee: Fix supplicant wait loop
Date: Tue,  4 Feb 2025 13:04:18 +0530
Message-ID: <20250204073418.491016-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OP-TEE supplicant is a user-space daemon and it's possible for it
be hung or crashed or killed in the middle of processing an OP-TEE
RPC call. It becomes more complicated when there is incorrect shutdown
ordering of the supplicant process vs the OP-TEE client application which
can eventually lead to system hang-up waiting for the closure of the
client application.

Allow the client process waiting in kernel for supplicant response to
be killed rather than indefinitely waiting in an unkillable state. Also,
a normal uninterruptible wait should not have resulted in the hung-task
watchdog getting triggered, but the endless loop would.

This fixes issues observed during system reboot/shutdown when supplicant
got hung for some reason or gets crashed/killed which lead to client
getting hung in an unkillable state. It in turn lead to system being in
hung up state requiring hard power off/on to recover.

Fixes: 4fb0a5eb364d ("tee: add OP-TEE driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v3:
- Use mutex_lock() instead of mutex_lock_killable().
- Update commit message to incorporate Arnd's feedback.

Changes in v2:
- Switch to killable wait instead as suggested by Arnd instead
  of supplicant timeout. It atleast allow the client to wait for
  supplicant in killable state which in turn allows system to reboot
  or shutdown gracefully.

 drivers/tee/optee/supp.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
index 322a543b8c27..d0f397c90242 100644
--- a/drivers/tee/optee/supp.c
+++ b/drivers/tee/optee/supp.c
@@ -80,7 +80,6 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	struct optee *optee = tee_get_drvdata(ctx->teedev);
 	struct optee_supp *supp = &optee->supp;
 	struct optee_supp_req *req;
-	bool interruptable;
 	u32 ret;
 
 	/*
@@ -111,36 +110,18 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
 	/*
 	 * Wait for supplicant to process and return result, once we've
 	 * returned from wait_for_completion(&req->c) successfully we have
-	 * exclusive access again.
+	 * exclusive access again. Allow the wait to be killable such that
+	 * the wait doesn't turn into an indefinite state if the supplicant
+	 * gets hung for some reason.
 	 */
-	while (wait_for_completion_interruptible(&req->c)) {
+	if (wait_for_completion_killable(&req->c)) {
 		mutex_lock(&supp->mutex);
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
-			if (req->in_queue) {
-				list_del(&req->link);
-				req->in_queue = false;
-			}
+		if (req->in_queue) {
+			list_del(&req->link);
+			req->in_queue = false;
 		}
 		mutex_unlock(&supp->mutex);
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

