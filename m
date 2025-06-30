Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167328A1DD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285538; cv=none; b=PgCEhmw8qnRsApYZxhzVdZT8Kq5rMzGCYXiuaP51dXpEpff05xSPDsFxgtOEpE8P4PsctwLpfH4xuNukPlai33dKq57TQ0bvAuWpOipL0rgnd5p/ChWLt+yHH3e+ZPfmtok9lCCOD/9a3Jw1Y/XoaDIMJkyAM8Aqb+vjIcRt8rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285538; c=relaxed/simple;
	bh=BKfqqka86bDL0dJyNuOG9LjYml165Lxh5NhMO1RrfhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDDHiz01QEnIE/cJNlSMaquVhwanQApmfrvfaIkjXIBkIh1g3TRtTuw545rME4h2ZKHXRupomFX+udKaTn5ZlNXIrj0Nn4Qyhv76zZVn5GlGDXe9/9V0hI28A8WYxf6/4XTJrQa+wcOg0zIoavQykp0zGFlNCFCdtOtx8hCcnxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u2NpsNCI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u2NpsNCI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so1787885f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751285535; x=1751890335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QlXPJik67OJ+ji5i52hXuqCUQwHGO8iJergE6aP1vs=;
        b=u2NpsNCIPQa0/7jy5FSxDDbRejKyurQgt0oiypcar3yNiWL5F96Xr6Ak+6kgFecw29
         UIn47MGrLRF9UdsZfLkqUmfcE5XR01pXPbRmQaCMzCoveSTtBWZTA02tUmAWSgHXqyiM
         c913l+sfSDlp3P9StUV1yrpJEvR69SFJrgWl28a6Cnt3mpiOnEIbBRUN9roqgnPOI2Gk
         HGDtgAw99jMXR+GJfA79VlsItADByiaVf5Zin6vSry/jiSipIGwF5N8Ei1nDedL8fRu/
         EmqjRBT40jaYgHroMeWm4H5nFeuI9Qwhh4KwJ+pkpVTzqYwdHpQHD5tfi4WwqmLWB4Ee
         Gfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285535; x=1751890335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QlXPJik67OJ+ji5i52hXuqCUQwHGO8iJergE6aP1vs=;
        b=K0AwIBJNGV8cpgJ8YI2VC6iRMiPYgl5VHeDIx5ANjthwnmm+IbMX92J4baiwYo2T81
         xdsZfD8TiUdogYNJ6Al0JUkpn5NLXJ+BNs817l/7WHdxIV3jtfL71rH5eNend9sRMnsZ
         G8cfTGZXFwU6q6PDceBJdHjCkDhNpAhKW2iEjLdVdU98szFpDzAtRdyimFHF6t+lPLY/
         auj9Qzf2IdG2NbBJM4V1gibse1slnECup7Ssa/+OxHotkTPSddZAQuVxtWv1LMnUA5I2
         TSuvfbGxMjVUso4K9Fe4Kqa84wlTR3EPg2+/vi5YB0TeFJ4YA5pQT8jFFNptiBt6VEf8
         9XDw==
X-Forwarded-Encrypted: i=1; AJvYcCV9YlHR3lG8LdwVEjo2nkcbdg9d5XELLYoI8VeDKxMAvT7eD+gKJCv9bfWAGKPPFCVAKgDEJqtZdaxziRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOcKHq9dJ7t/9UnSFxlmZgWObymnmX/dCxccGRfLNbfPqz01c
	EBa3p2maqedXggPKukc+jpCN+bbfORgj0n7L0Qbfr3OLSV7xDCL28ZtC1UnA406ljog=
X-Gm-Gg: ASbGnctR66jmFOJe0KcVyucEBO1soLzG0LGbIh/hb8lpvvfxJlxhHZdFGKd+rZJy4Km
	iI8DWAQ0rzZhRlCELnQJSiUkh3DjZYJkZmjigF1nvvyDFK20317mO3/xmoAst6sjQSzyQKQzKon
	JkZT3eQSw4lhdLbxEPDig6ZZoCVemB3zyixI0zOUvrbiOTO841KDFP84zJIM7gwq1l7Xmg9y7Bw
	SsVP2bu+0A8w9cWlsn3AgDxSEnaroNMIjQNF6HMJHRTC8aFt+kfas5N0WiHEIzbVvSnxArvP8wZ
	m1LIwtx4POt3ytN1xkmvHfRDM3kYmftiWN/2kcyTzMn6idxJrU3/6+mV
X-Google-Smtp-Source: AGHT+IFQXwxIM2HUr1IQmwXbE2oEZjblR7pgcFR+7RdIC1AVXJ7VrKdoozRAzizI1O0LoBUAsA/j2A==
X-Received: by 2002:a5d:584b:0:b0:3a5:3e64:1ac4 with SMTP id ffacd0b85a97d-3a8fee64d08mr12789954f8f.33.1751285534948;
        Mon, 30 Jun 2025 05:12:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c800eaasm10470472f8f.37.2025.06.30.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:12:05 +0200
Subject: [PATCH v2 4/4] firmware: qcom: scm: request the waitqueue irq
 *after* initializing SCM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-qcom-scm-race-v2-4-fa3851c98611@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
In-Reply-To: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PcAqvM6FBpCoLkNCxS4qTB03W5O8x/84hACrv61h9wk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYn8Yx15pNqlt0atuJpYpP50OvajemYIKa09s+
 ekM0xLA3tyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGJ/GAAKCRARpy6gFHHX
 ch39D/9oDWM+eSjmgaVqiQPFLysRWcTpuyu6+mfAoyuIOI4xMyTNBOVzEH3DBCI1mFYnFA3b+W1
 mzSkILp7RIA/JbCx5b4xhxyxrdELnMDBojM9UWwGlmtcs2o+mV7TskNvGGs+Kyy/0nzHwBxdDzo
 LLhjEQ065UtVT84EyQvnfc3U1rH+r2dvWUCrH36TC9wn4yRykeF4+A0UNBYtK0n3N97dIJxJ4dH
 7aq2N+C+9CB9F9een5g5Ue7bhb5R65xMCT4v0xpkFPK01Wmmsr6AMoDPZ47yTO15u5vcSIHD8eI
 IZs4Q8fAwg3/dKPNAWS7BchTT0KejeRVRtViyBkoqnBwAh+b5DsRYoNkepK8I1FFSs+i6WRkJBs
 XyNbOncDGTYGqqQJNFOmNZjkCGeNetxEywG7N2SjSZkmdAKkoA/cQY/h/ko1fN3eljMGnd7/1vP
 rXTiJ6Mh017fjIICDjhQNr4Rb8NTfzodV04ji8/FCSq8t1rWNJxEKB4CEhFf8nC6dV8gyOZcWrw
 CzlPuZWljCl7vM/Onps19IJugJS7Zmb48M2zo9E7A/MrNWxw/oCYFkgWxnNcYvJCpck5p3+nLX9
 MeibYJ9/VLCOVwQHJwOqZfc0Jdepsc5ya6YsUm522BCdQB5jGbDjTXXNVX83FRNfaeX6690pQxl
 CBsWjW6CY+GT0VQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's a subtle race in the SCM driver: we assign the __scm pointer
before requesting the waitqueue interrupt. Assigning __scm marks the SCM
API as ready to accept calls. It's possible that a user makes a call
right after we set __scm and the firmware raises an interrupt before the
driver's ready to service it. Move the __scm assignment after we request
the interrupt.

This has the added benefit of allowing us to drop the goto label.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index b6e0420bb2b72247e4d772b66314d81f336f5d9d..26cd0458aacd67dcd36f065675e969cea97eb465 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2276,29 +2276,27 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0) {
+		if (irq != -ENXIO)
+			return irq;
+	} else {
+		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
+						IRQF_ONESHOT, "qcom-scm", scm);
+		if (ret < 0)
+			return dev_err_probe(scm->dev, ret,
+					     "Failed to request qcom-scm irq\n");
+	}
+
 	/*
 	 * Paired with smp_load_acquire() in qcom_scm_is_available().
 	 *
 	 * This marks the SCM API as ready to accept user calls and can only
-	 * be called after the TrustZone memory pool is initialized.
+	 * be called after the TrustZone memory pool is initialized and the
+	 * waitqueue interrupt requested.
 	 */
 	smp_store_release(&__scm, scm);
 
-	irq = platform_get_irq_optional(pdev, 0);
-	if (irq < 0) {
-		if (irq != -ENXIO) {
-			ret = irq;
-			goto err;
-		}
-	} else {
-		ret = devm_request_threaded_irq(__scm->dev, irq, NULL, qcom_scm_irq_handler,
-						IRQF_ONESHOT, "qcom-scm", __scm);
-		if (ret < 0) {
-			dev_err_probe(scm->dev, ret, "Failed to request qcom-scm irq\n");
-			goto err;
-		}
-	}
-
 	__get_convention();
 
 	/*
@@ -2328,12 +2326,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
 	return 0;
-
-err:
-	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
-	smp_store_release(&__scm, NULL);
-
-	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)

-- 
2.48.1

