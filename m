Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF42139CE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839296; cv=none; b=ZE8Umd/BTx1bb0ebet8l0gIhAOsPGVzl8eUg8q+3626NN+F48jwAx1I/5FuFOqZjTZA7R4/noy/shjRliTc5puNfzUMGUxFMbMUeKqYE+Jkt0jCDfZvG4P8QGbrTh7MtBCyxSgs7SbHjzXqk2vBu2LwO3c8r0A2EX6Yhuy2iTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839296; c=relaxed/simple;
	bh=qgULAZ4ejvJyST8VJ1J7iEB1aLSfOT96ybKjTfWIW04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLnhp/jmIXFpLC/HQ6e/ruNbLcPmQ0I9h4EOEt8O7msXGqjraqwOX9fi7vMJ+jq0TtuM5EzNXK6fbF2lve5wxOWZ8krfo9efUZrZaEXOVHY6KmFQNuKJabHIomRwPyLQ76dtfX/PBKur9jWBQKrYQ/ROb6ZT4sb5+K2bR59gtzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JxcHs9QN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JxcHs9QN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d54214adso8975035e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839293; x=1751444093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ued5N0B3YwM1DKQMfpPfS2mzB5zkHppsFH0hrxAe5fY=;
        b=JxcHs9QNdbM+lOc+P/5OzFNflzJwH2t4wskxJEOuF4Ht9MByDxbHJ/EYQQSpG125Lq
         ii7kcMbG6KB6sOe/7pi20CSzu8QiH39ADWgcLurw1e4jhpr2NkYf9wblZIgxfF3ctgJ9
         +8rt5qAAVYvvzOJ9fBCcO7vlnRViIsLTw2CDEGp0jvVHvbHfR+Hc/TyG+qSLAa5b/lWF
         eAlqLAgMLwrI+6m1GdM2ftYlFq4BA1wA451WhauseBIVet40w7J7lVxnYe+/j2wMZeVV
         Xcz+uah0D9HPUC4A2vgZYg5SRoz24IBARQ7RHUWnjLx6ycwrFwnFbHbzG9muAkf0k8MR
         U0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839293; x=1751444093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ued5N0B3YwM1DKQMfpPfS2mzB5zkHppsFH0hrxAe5fY=;
        b=PDGLNr3vhCLqWZQjfKn5x9BM+LPuLjFscyiqe2ms+txlgcr9uY1tCYvlPIvjj1F4DX
         0DtGSFtjaX/+kwoRoe7/e52Cdzxqo0dlyapRUw8zYw5oFnUMOitYgazMuXQb2tG7mzOV
         RqG9gBT2gE8GjO3CoKqnd2q9Y3KISL2C6r5YCwM6Z2jMR05J1sWOTN0UCmrckr8mFBCT
         QVXIJ9gRX708OU/3QZRmVhV/5FZ32q+ZyiLS5ofraIfGsx21GSX0aFcuvjsFTTfjzvy0
         uTHXDO9PCLC0/XrMJ/jpNPOYNVwg44pmNGQSNwMpL2GPcd6uvmC+P+2qyKcuFyw+pVj2
         76gw==
X-Forwarded-Encrypted: i=1; AJvYcCUSKz3E5hs5/PyA4j+XWmv2eDluvn+xdYvRKbD3GhMCXL0JIu2t22gGNZLhcMeTqpew6cfew3/4XoN4bd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGNUL1JSiKqc5JNro2+/VsTIHA3aiDMEtlj+Y5ZsAaLSWfb1tK
	xaGqWplVysCmjq/1WcyJJz620A517/AFWr7jczy7SBWFtrNJ8+GCDK169P8REx/ypnU=
X-Gm-Gg: ASbGncuzbEVpb3hnna/RT/nsTBwKDFlzfNuybdxwNFPymwKOeA6FgNVXKiUiywN+Hpg
	mtWxEvEzPTKp0Vmmz0G4sn5bvxogulXASQKQF89zUvPklvO1FTFTcwhu+c7tMDQw1ypQn/QlaFW
	lfnwCmMqLxj+cPSkvYlWGZq00BTbhaxioRWM0xbVM7e5zroMjBhxMLqhNhnlTt/u9/NEhiS1CwU
	WLdLvmVA6mPdCZ/H3eC2I50WBtwujcPvDr1NPAhLo+AlhffhZu/ATpTd4wgAHjVb5cnSuKVgrWq
	Oc8sx04P7H8KsRTsaLEBmXw/Dq27w7d56ZoAnuBgMg7YnWQ+QQ6KWIez
X-Google-Smtp-Source: AGHT+IHP4h3nMeaXupV+VrUriETzN9lbrTSAG3VYlh11BphFQINyLVQX851+aQWvPMNgyZh3BnjKpQ==
X-Received: by 2002:a05:600c:3590:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-45381ab8dbemr21040715e9.15.1750839292981;
        Wed, 25 Jun 2025 01:14:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380705351sm20215035e9.0.2025.06.25.01.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:14:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 10:14:50 +0200
Subject: [PATCH 3/4] firmware: qcom: scm: initialize tzmem before marking
 SCM as available
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
In-Reply-To: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2855;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CMkYqfg6jn6tgkYNQFyopS3KGK7ts84JV60qgd81Dzw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW6/5vPlaYFyYxbam2sJnqLuNuFL1aIKC30K0Y
 PHoDBc9uIKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFuv+QAKCRARpy6gFHHX
 clRaD/9y2gS8TubFhVL1o6EH7FevyTpxWqqzshQkCyYy/e/lttig9NALKYP19AXcRQ3/2O26yzg
 Wy5//EcqpswCr3t2cHMryrIPFf1rbnqXYf+wjr7bUYDNSNtkIhmWVwQ5f3iV02U+Zb/Bx2yOYim
 Htq+76ggQ/WsVXyho1Sph+OXBPDJ17BuPWeEjzu9JP/Lz69kMHFrqWFcw8KtVF9HS5ZT0iNZHe8
 1s6X4Mf8i5HwlfscNHOAz0QGTfav+R4bevEyagoHK+Xo0n/11EYjug9GVVFNxRgprXsBLVGdkI5
 8z7qnP64eFr5x4Iuk4aPiUz3+SRWehugq4yiIUmvJAFd+mSBEJ6SEePfugoN0wc0h1Lzc/tiWaP
 9+JWtdG26nJz+hGeUIsoXnQS1lIeLgBzb7T7kjLRUtWuEDOLxCcQo9Dh12HWBTuzBUmbem3lj5H
 NQww4oQhrdjpPoOMJbOlMSvacoq0xZymSDRI0jIc/Z+8IN2vWl53py1AWr34pFNposHkZIOUJnL
 ywi6byBnpFwaQriAVfQpsF3uH+ksCgkS/5ebkr8PCYF2C818enW5nSFwiglaf1QeT8Dhq0e3XHR
 /Du8s5WhYsXDIgRv+DsRbas0Awm6eVbYTfDqCOrKsxJ/O5vHM5UYaOw2l01Pg2asI365/fJlsU4
 DRtz9Au2PndmCtQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
can move the TZMem initialization before the assignment of the __scm
pointer in the SCM driver (which marks SCM as ready to users) thus
fixing the potential race between consumer calls and the memory pool
initialization.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 46 +++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3dfc7d410348a4b17b22acee18b51949c58f7351..561d4db7a847419fe5f9f034b09554de6a16a161 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2250,6 +2250,26 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = of_reserved_mem_device_init(scm->dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to setup the reserved memory region for TZ mem\n");
+
+	ret = qcom_tzmem_enable(scm->dev);
+	if (ret)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
+
+	memset(&pool_config, 0, sizeof(pool_config));
+	pool_config.initial_size = 0;
+	pool_config.policy = QCOM_TZMEM_POLICY_ON_DEMAND;
+	pool_config.max_size = SZ_256K;
+
+	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
+	if (IS_ERR(scm->mempool))
+		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				     "Failed to create the SCM memory pool\n");
+
 	/* Paired with smp_load_acquire() in qcom_scm_is_available(). */
 	smp_store_release(&__scm, scm);
 
@@ -2283,32 +2303,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)
 		qcom_scm_disable_sdi();
 
-	ret = of_reserved_mem_device_init(__scm->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err_probe(__scm->dev, ret,
-			      "Failed to setup the reserved memory region for TZ mem\n");
-		goto err;
-	}
-
-	ret = qcom_tzmem_enable(__scm->dev);
-	if (ret) {
-		dev_err_probe(__scm->dev, ret,
-			      "Failed to enable the TrustZone memory allocator\n");
-		goto err;
-	}
-
-	memset(&pool_config, 0, sizeof(pool_config));
-	pool_config.initial_size = 0;
-	pool_config.policy = QCOM_TZMEM_POLICY_ON_DEMAND;
-	pool_config.max_size = SZ_256K;
-
-	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, &pool_config);
-	if (IS_ERR(__scm->mempool)) {
-		ret = dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
-				    "Failed to create the SCM memory pool\n");
-		goto err;
-	}
-
 	/*
 	 * Initialize the QSEECOM interface.
 	 *

-- 
2.48.1

