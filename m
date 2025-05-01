Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126331DDC07
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110017; cv=none; b=GSosMw5BlcsCstlGy33R09K3U2SZM+QaMaMnUeO5b+QS9XxGQCDEWgTwU2JxOGudXXOrfShBm3CUhkNK8u2Y2JDkLW5Afj5WlkrPHfeH4seLxlbk1qzKW9W+aLIqI8ycVyHprvxbzYtps2Le/gA0kj6HBJBo4Tej/cnDR4eOsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110017; c=relaxed/simple;
	bh=KOjPiRvBuzTdyA9KgYekNongRZXa69bWcNpO3R6H1lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeISC3AkRacPuUnIsraoTnJQ/E5hB+LEH9dyPuesRUl4DXmxNr2ylKmwpuR5UiDipc3W6kKlldVjXu5VOjdadStURXZBdKBxQwiHRypXKiOi1Pn5cod/yJMZ5rlawFkyw7xbWVvV1sMdJ/qUd3yyvgMKNbAwMC+WhJrAqLfH6DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GFb/OZ02; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFb/OZ02"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43f106a3591so1316745e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746110014; x=1746714814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzBXO9nIkVYWaO7/44VWwwopE5puJwylSBUwTQi6BfE=;
        b=GFb/OZ02l/UIoOOxyNbiY9HLKXW6HKqM0fPKdsavzUFav4h+sxtGyPwfe+9j4+Wckj
         yyNrVKzv1oinw1Uw5oU6HRJYp3dOIYd0nbyM4EewITylUCSRwkNSAjY0CoBEAGC9LsAK
         bOj0AmvhlYS+sRL/0AYPyFu1hbODVV6f6RbfKj94UE1cqESlaSdKCBT005UdbRPrT+iS
         m/D1EM3OL6FC21v+cU3vK59rhEGg0rsD5fI9nAC+JMQAzWQoW/DKYEMXODmMbXMUCK+O
         dr8jGZww2Khc4DLbFoybhIlkJIN7WbFImvvV9mza1tOf9JEMl4vkGUXe34zioUy0aan+
         bpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110014; x=1746714814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzBXO9nIkVYWaO7/44VWwwopE5puJwylSBUwTQi6BfE=;
        b=HEqe6hb9D12yGUrtEyoPJkv2BLzU9nBVPHUjISf7uPRL+kaVxKwtC3EsnwdTxUEl4e
         11WZ9sYJrr3yqi7DOM/qNeLnZSvXmpbliGhA4xibirT7xo95g4YgPUXCe3Oq1yeYYi3A
         3v3+03BCapORX8QqvuDf06IqQT093aoRk4qzkXrVfmJ/hA63QTJ3+ygUkEMLE1w3raYn
         nH24+CsoCOk99DauLmr30SINnLEi7rkA6ZJoUJHllKvKvEdAmo+saLl26Ylly9ZmcsOz
         ERACUjpu/30OglVVDxI5vYNMiN+nlRyQnkJq8W+6O0/GsucTLM0uWO2v7FID04G0o0Ep
         M8EQ==
X-Gm-Message-State: AOJu0Yw2ZaGZrbphxVrN30Q69VDzsqHB46CK3q9oRKcOXBbn69DWxy+f
	maUUlRlthTQRLvgXu56KTOR6q9UM8ldhDn++K8qLXkAuXt04U6YCCGDRpCS0NaQ=
X-Gm-Gg: ASbGnctnNeuW9P0Xsz+Ui2B9pE8/kEcFO3CzqEk5UQSpP4KM15msjsiTO0x67f92lYg
	8/Bs1eQAFIYgvzxmJcOz2IF7aOkydIU8vDB1KTh62E7Ilqvz05pmko+PchsjyMVJXYM57OK0tQt
	LWfhr/KPjFV+Y+X+EGMClRiWFsziaMQDUq55f29kj5kZl58tjC7DuS7GcQr9g0dmAO8YXenx8XE
	vZFC7qap5VGDjwL0MmcxDIfIrm53ITPu9eOd4LZdRtTRwfsdGdRTEM5W5VCVBCwLLSv6Cd9p7KK
	u9LJNfezvBEK448BtbOfTZKAkBrBaWP+0ZERD8BSJpD028IloGwlk3aqqkA=
X-Google-Smtp-Source: AGHT+IH4IUQwdThBuCbMlKrsSqNcIXMd+TpCdswbDg0ShHYdnxId4ranmqCz+wI042/WGegL+9TAZA==
X-Received: by 2002:a05:6000:1846:b0:39c:30d8:a44 with SMTP id ffacd0b85a97d-3a08ff5c739mr2055285f8f.5.1746110014390;
        Thu, 01 May 2025 07:33:34 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8ef66sm957636f8f.88.2025.05.01.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:33:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 16:33:21 +0200
Subject: [PATCH v2 1/4] extcon: adc-jack: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-device-wakeup-leak-extcon-v2-1-7af77802cbea@linaro.org>
References: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
In-Reply-To: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KOjPiRvBuzTdyA9KgYekNongRZXa69bWcNpO3R6H1lo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4Y3ckCkZYT0KdcusB0kaLX7OrHflrHyVEb1O
 fAEfFOBBhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOGNwAKCRDBN2bmhouD
 1wHHD/0Sa1jUTLuT8X7ZTK+300bPK2WqFlx/xQFBrV1IRLpJOek6Degsp5UeWgt5hSmuAv89njD
 ez9nfcsN4dSS0Tcwr8BHuolknSE+vJciIPggBmUdVIor9vvJNGxwFKB54qUlVxMgUcQ7TZN6Nwn
 uoJ3TjryXn9Y+zbt2FYqpDl4ngdkBoqWAL6Tm3nJC8znIRoc8z60/TF4gF236uluGzH29QKe4zR
 FaJU6eQQemMGpJ9YscVQWLoKldgDEp1sDmdPVHbo1/97Nafu3xt4zrgFaeoHMANLxPZZ2eiUusH
 h5QRE8qyY7wFwSdc3CHum1eqBMZYLbFBvyRaPTLsuzfsCzhvEJ8MmqDbXzqVuBok04zJpNK8Y2R
 Vs2ZoeqOb8PPm0R38LaZx/LGKDjBiUCuFcFJV57RWPt+Tfw6qQF2IDpmssoM73JAYSmRoHFf8r6
 GJz5A7WEVdvxcOvYPfIiFzqR0Ha7T6iUlT6/R2frX/YqNqa9ynk3oy7v3FI89NIwlybWWGtqkf0
 Da/Mqrhxb1larw86/tMUwMuBmwk0qUyPhz5EMVkMEVgRibYiLwZHQ7hp3uqg/QHLK5qTQJ1qmFR
 7WBYDt2zeErvRnfCuOlBAT4gpgSI58tsEVmAnw/cGXjz4C7TRc8lkqmmBbvkBdC5S2W4j13tyaN
 PJH2GpeA6XuJVVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.  Do not use devm interface, because it would change the order of
cleanup.

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-adc-jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..557930394abd25771799733a22121d1f8e254918 100644
--- a/drivers/extcon/extcon-adc-jack.c
+++ b/drivers/extcon/extcon-adc-jack.c
@@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
 {
 	struct adc_jack_data *data = platform_get_drvdata(pdev);
 
+	device_init_wakeup(&pdev->dev, false);
 	free_irq(data->irq, data);
 	cancel_work_sync(&data->handler.work);
 }

-- 
2.45.2

