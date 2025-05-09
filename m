Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C808F64
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775033; cv=none; b=S3nMq9156KAf7LSyi86CWaKS5yxacR1kII2DLtUlctwU7Na8EgD1c2NFNlAywaJE7wfPqWPlwSqB1zmN1teCcX3aGFGWZVQ1c4Da7PdocDZ9SXLGnYC9Lx3fo5m+7RdccL0pXi1Ge3TKgx9jvwOLidR3gvT/gphvVQOGAEEU5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775033; c=relaxed/simple;
	bh=9n2x9Ca2geKsxpKo+eTaSVFu9pk9VeUm28tj2BhzkaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2b/riAcWCOx7Y+1z1YBjnGOQwUfkPmE6JykvRg+JLhBAvtaLqQSAjyZrTX6LPUaulXPXv/CFmBqcSxXfi3tGxZ2N5OepvcS9vlLXXBZ8IQW0aunowBc/yMADNdLdhSt4jmRb43nYVa91YahOyKSAYVza5x5kVWcV0/LojTDPSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHxX9dih; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHxX9dih"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b1808864so167175f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746775030; x=1747379830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlnvF9YC3LzR3snVvWTJ2Xw6crU4GpM6twYqKIMdbfE=;
        b=FHxX9dihMxRpuANVlUQP4nZ+nIZhe4pmKbRNWn4hpJqabPFe2rBpV5hhRt5WX8FjY6
         d6Ky9URnbR1aK2yS4orlpuXSqIF/z7thhPYy9LE3BIwH0POLMHjvtc5v0Z1keMZ3Gaul
         vVv6GNC1OKZB1ZyB9q9vWJ8SGAT3sXKBsoEb7Yrqva0qgSAyZCaMlkxVFaxUOIcKGBjx
         rAM6SNcZnUubzDnrx2cA/naXpy9AOpf1ixOBBKGa25DRGai1z6G4eoKsSuyKcKWjXToP
         uMtWeGp1UK2xJFnAl3alCdwBgUdvvAt1QHfKyHPFnY9MJx0Ds4LOXDJ2NfcTmddNfQhI
         bobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775030; x=1747379830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlnvF9YC3LzR3snVvWTJ2Xw6crU4GpM6twYqKIMdbfE=;
        b=eIEy7SnSPw1yAFcSg0leKwGBiOkmWqXEBxr8p5B+vWgpLrCf1cgLiPzClMAp+iVHb1
         QcnDo+Z8uqEBgael72rNlcabLwvXsSmBcJqAXiBHAjJkfREuf3eCSJVAjtrJsRHnjOii
         3qJtghPmnTMHwU9sOhknF78ePuQMdcycwuG2KrLJKpGxqecGeq2XH/fPjjhaGvruV+TA
         M/W6orsWdvhUsD7AeKXEJ5kL5Yh5iSSy9Yw9dj0hb0uStsYwBu7EBwaEH9pUq6C80t0X
         WxOBgMzizv7w+6PANGbypG25bHOc7fcpDnhM50eh5YlJ6HaaefF3ZUxHTyJSeW8Dl/bl
         aCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXh9Vm1qAht0iANwDIN0lsS/l/liYq0JNnvLJfF56Fj6U7kiOcMqcwTXeDDkjHdA3fXEJqA+cq3+hNAskI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5v4B4LiaHKbTcLE8yLf/pDgKKw/t0J7hkv17b0S/Nf0Hsn84
	5ZsqN1araNkgJ5VgItdGM/QENINHRZF/3Oe+bmUcEVN5FRl6qyzB2UfnR6WctAg=
X-Gm-Gg: ASbGncsfILTcwVEzxeoZoCxPpUuCQiiFjXvDWPCCrdpekv9u8qThcQSmaNnZsY2oH0t
	ptjPgfjhOv9HyF5PiuNHEleq/2d73jWN65Vg/wOXG9MJJGQak87RnOSSAoYyNoyAFJNOqauGbAa
	Ml67NeTH+ufW0rdjLPvdkZZkbtbfl7WSpEooWpdhECl0u/7NvU2KBJBL6XKNEI2VgvF66FuTI+x
	tRBsBeJJVJrye/k0KXFhJCQUk77etXxtEs6B7sRmqpH8I5nxwHRS/rW26XKmNs7fz/+lJqgx8IF
	13sJoPtSjoOPKjMci56lMvV6C2EmINCIznHGz9UEY86QxSkqyb+rGNRFRvKj
X-Google-Smtp-Source: AGHT+IGa0STf5+TTOTz0wO56H79nQcXBgcB4X0BRuhjYmf21JbPP/4LmpKEfPZXwoK3dIKe1+YClVg==
X-Received: by 2002:a05:600c:314b:b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-442d6d44b93mr6223785e9.3.1746775029947;
        Fri, 09 May 2025 00:17:09 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf0esm2329397f8f.79.2025.05.09.00.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:17:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] extcon: adc-jack: Cleanup wakeup source only if it was enabled
Date: Fri,  9 May 2025 09:17:04 +0200
Message-ID: <20250509071703.39442-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=9n2x9Ca2geKsxpKo+eTaSVFu9pk9VeUm28tj2BhzkaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHavwAIVXCeGSBRM80naUIucx9WfdqyNqTajlD
 OHjBmVH/aaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB2r8AAKCRDBN2bmhouD
 1ynPD/0Ues0ub1R7fsjGRi1X6SznnXIaP/t9GsChXHJZPktB/70jJlbUyec40pUhUtm79Lf2+Le
 dAKfcMeaRALmEQhynbc7GYoNXWt83AHtE8gdvGcBhGW9WXJ/4p6cieOf/ecmUNaxoLOJ+Ce6lxQ
 jsXzs3ck3VmElvXb0vueQTfXrgCUnEF0YJClgqyBQCGH+yl24ukX0xz9MdgJELJ5bSsoMm+4PSC
 rYnjOjqZHp3rACB+vogK42K9njOyFTTUbB5nbKWWIOBkXKjqhoqeoVV2ZVxNQrnHOS6VfFUI0MC
 gMmLhrFaanlP44F5ZrdzP8I08GXmwaGPhi9D2YioGmMnUTxSmNEWDiD1zQxRYvJHbsfr6P3vjNL
 r+HbMAz0j0jV9Zzsjo3xvyWTVVcDlAiVgrAD6inmti2vjRMVhdgr6/+fi6Ymn1ebf3oQ5T8H4YT
 TmAMdbaV3SvSI4F0H3Z/kxLwO3JdkeEKBvjjcTYPl5+/iegav3npMQYhZe9Eo0LNj3BiSQO13kH
 0aj9XMm9YlcsxyIFqy/MI2waqH4ExDNqz98llpJrqq10qbDUcsgz+GIlBjLiReMLrlyfaRI/8np
 VTF1ZwEcbSkKENPRopPIUOr7YE7I2RbStqXdFG46oCRugjroKMy1eBVT0A+o4AO/QbpwTAzoU2J few5jYuotW1pctg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver in the probe enables wakeup source conditionally, so the cleanup
path should do the same - do not release the wakeup source memory if it
was not allocated.

Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/r/22aaebb7-553b-4571-8a43-58a523241082@wanadoo.fr/
Fixes: 63c223dcdd49 ("extcon: adc-jack: Fix wakeup source leaks on device unbind")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-adc-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
index 557930394abd..7e3c9f38297b 100644
--- a/drivers/extcon/extcon-adc-jack.c
+++ b/drivers/extcon/extcon-adc-jack.c
@@ -164,7 +164,8 @@ static void adc_jack_remove(struct platform_device *pdev)
 {
 	struct adc_jack_data *data = platform_get_drvdata(pdev);
 
-	device_init_wakeup(&pdev->dev, false);
+	if (data->wakeup_source)
+		device_init_wakeup(&pdev->dev, false);
 	free_irq(data->irq, data);
 	cancel_work_sync(&data->handler.work);
 }
-- 
2.45.2

