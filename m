Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FB218AAB
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970621; cv=none; b=ndw3Bl9WqdCy+uDrs5mApfx/xViluvir14x1T+U6XjP81+4fcxgYAzdEASMZEW8koLX0vHp4kBbCY8VCg1cjxeou912zxGnuRDKhd77z5+Dv8XZE1b8b2a6lQg1Vu6GZB8brZ8CKENhSIRx5epQA9nnKy82F+QsH8FFbRedD4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970621; c=relaxed/simple;
	bh=+LKj42cLkyjYdRGFvqe5ygUreP0AOBiPNelbPAxonio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9k8fOuVYk/9ZvPps7QpJ4jCihUUYFBk+J+bV+Zvndiyu4qPftK4wbBy43vZ3PGcEaippEGD+4FdtSm1vz00n2zHHWwe/hUWjcZxyNq011LbCHyEW9K7ob/zIcUOpIc2eLFj/IBDtnf9T1rtZeKB0nmitksfguF+NoQH4UUwOSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WspjjbiP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WspjjbiP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so3240635e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970618; x=1744575418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjlBYf0UmyquSLTb5Xkn0Wr3kIZfJKW5KgRfEo1uP0g=;
        b=WspjjbiPW6MpB/aPkUaUMFzLlzCG037cWw3MzMMzLam8PBxfkPnIc6Smqb7f/8W5Cw
         64MPoeJ4P0+EhT2H50AdKiT8bmNkbtI3+vVp+fS7vJvEofVTwvUnEvtx4/gnQgqpDSHR
         5s8W5jSfmCfLx5Dj1glMuhxNjfDwBHyaLcaWjFB+yu1ksz8Aa2SCze5R4/JSrk784NH3
         F4i9Ki5N/jZa/zQ07uvbqmLAjKjgH3pFyVvhYxcFxr1aeIrcDwugtchhWHA3lp/u42fc
         lmaKiBnJ0iIGuq+r8fMT26v1y3Kc7LZKKriPAECCQbbcZSCEuPAAZAMY5Ksb3PkmQx7h
         AKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970618; x=1744575418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjlBYf0UmyquSLTb5Xkn0Wr3kIZfJKW5KgRfEo1uP0g=;
        b=afLOJwF6vflDTHaljCEh5cWV1gtm2zf+Xt6lpYIn0wJewwtiJRtW+c11EdnaG0KLNy
         dJszwIeUGdQvR4r9YW7PYu9PvTpQeLBFNogolsrMjbUn/npTHbl5zejL1zH2PxmR72bs
         tlqBzoZtaw3hT3kIZ2FJScsLN/L157zN7JsTj2CbjWo1pz3MD0zNudyYpKbhTk91DTjV
         qVgRGrlQFP2doP3npfYEoFjlAgriceDvtHAqMVLCZc5RkFS4bjqUiCa8Eyy/geeS6Grv
         /WCCXVtOYC39HSxcDrMYm9UMaWZ/tH8Q6/6xOAu1DP/UY/3YwvijJcwxd8/gM9mrcXcL
         hVRQ==
X-Gm-Message-State: AOJu0YxDnznifzhtxqbeZ/GK2OzWuJCDFu8iBCCt3OwEE7W6VDc6aSz5
	muO87ShZpdkdy1Ev0BBosaId+TPqd6O5lgPhsZp1pHDrL9EHg/LrsrBHLf2dK2I=
X-Gm-Gg: ASbGncvK5AT0cNtqdCtQmPxncZaQbDYH2Z1/lwkTir39fjP0axNvuJnWMazdy2ByzSD
	3KHmH5HPlJqwKR+ZW8qRzxDl1B65a6U3skNIUFfgV6yRPz6eJnl1a9eNTINwR9dlB04Xci1B/u1
	chPBAlYAn09OpMOM6iytk9B1Q2S2+fPzA8Og+4N1jlk+GPK+8t8V6TBSJ8sz0l6H/j0oSdpYyUJ
	3byd0QpMkpD6r6XUOrOgB/j2n/mWFgBksO8J5Gu6CiTvzp7tUpJZI7UaEjYKM17RdQ1OPsvBpIb
	sA8uYNXmtaLY7Cz5Ad3zy4+nkpxzjfkZbHOdV1CEYDv/u7D71nCDhCjvssf4Bzc=
X-Google-Smtp-Source: AGHT+IFVbMLrWyRal0YYCi+KHaKp8d8YFDVQ0prMTHvzyQRiYIV2ETIOBojkdoCfYGTtf7CDaEwDgw==
X-Received: by 2002:a05:600c:44c6:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43edf8a2f04mr13701495e9.5.1743970617984;
        Sun, 06 Apr 2025 13:16:57 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:16:42 +0200
Subject: [PATCH 4/4] extcon: qcom-spmi-misc: Fix wakeup source leaks on
 device unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-device-wakeup-leak-extcon-v1-4-8873eca57465@linaro.org>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+LKj42cLkyjYdRGFvqe5ygUreP0AOBiPNelbPAxonio=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8uEvk/jVL56aZSTw3nP5T8trMIMnOWlq6vOHC
 z64KDiieDaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LhLwAKCRDBN2bmhouD
 19nMD/sHqz1qRUFFVM31s8UQ+C+KEVhdP1YB16EGX9gI6Nu21n7azx7Q9secX8Y7tRUik8oigNE
 U04tJRj4JPyaJSN639kP5H8VsU/sMWW7YFVtnuuafFERaij/cWBtfn73+372nFMCdcviaQiO34g
 PpMLAV+BTYHlqYvZF2Pir5gf4UBUKmWqt3CXQ7N/d6d4CVfkIijrocswczb4V9XYNTRpEGjM9Pp
 WOni9jCIZYpPZ5A+JmWA1zXrx0P0StmZ498iff3mv0ZroDgxkDbfIxW4PswBbJGkkyTexrfeHQs
 44MAbfwOAV5Nu2Zb1tc72N650YYqctK7U+17E2X4QDfDHF+eIgg2y6FKKqldVQAMex1C0AwPVLN
 ydugLoy/9X72Nf+pXr8f14SZHwPK9JsXNodOt8q+aOxHTtZ8ntv9U3caTZWeq4bR8D+CqchhqSL
 P6Xmm4rGBNLbUVfRCIHwkd2u0xMryYGE3UZtCVulM1163RHTLChIuZ9i9YHYIJx8H0Ewyu6GSau
 pd0kM6pvskLLrdbQWioLHb/lXYy91bMkaFS/52/SMtVIUBSeYI9mCqFWkIbUY7ziQQeG9ulYQdX
 /zC0yAZsQm72GzjwXGcBuInoeHGG1ER3SKzWaYSJKcj5DdDNholhvcvQx8chK6r+J6OkSoW4NrF
 fGcV3bktJvmAQNQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index 53de581a393a35bb48f637ea73e910b4c8340ace..afaba5685c3dcdbdc750c1835ec4c696bcc64fc4 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -155,7 +155,7 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, info);
-	device_init_wakeup(dev, 1);
+	devm_device_init_wakeup(dev);
 
 	/* Perform initial detection */
 	qcom_usb_extcon_detect_cable(&info->wq_detcable.work);

-- 
2.45.2

