Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CBD21A95D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=VMlWLmyrwcjq1xzpeq68iNce9whhgXQt3HqSGy3zT7Enb8NxODGJ21EOSeB7Nlbh9cy/14cBHqgHj2MaxOlQc+gZz43gh+9LfLKCVxtyjDhTpqVCSBpSusjHElKt4VYm7XU88RmAgkqzY5qMNlZwrDH69uGcBBS9JFFHeDAzvmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=JZoZsQGu+qys2atTASOCtFxTZ7xGv8u8FbjT8AQa4aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QtYTcPKWD6rTpRMI68ecJppdXu6Z4phSBBTiJWRkRDKH7QxjFdJhEr0XIYnKwsZZixfIsKXLlhoa0SGfaWye/1wJMkXdt6mgtmFCcnMFR97PuLa5pJ2wTGiz7U5gpq5tl1384ZHAtt3wrqfb5fOxvNFGkUBhweLE1GBOQVPGLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6tCAMuX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6tCAMuX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac34257295dso22952766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=V6tCAMuXmzCFCqLb2nBg7n5ZdExxfGIyLS/rgWf+FIH9xts46XEDLeAjHGY5yMQnMj
         QIMhTx3wruviBDs+GGJ862QPA2W/IxgxmnuRYzk4hSKyiH2vPYlxZgNzPET/DU5W9P5e
         +k4azMVU4JVy1tAAXABoi0kQHoVWs/mqFmLoov7/Qzn1C0QqvfYLKhQfCF11Z9Y2KDGz
         VjNsVKc/zwmZ3tluwcaUKa/CrwacU/LsfIkjPSoHjkpSgsHrbuk/G2aMJ/7P0neb/eSp
         pGYnuxbcv9w8v1cL9Q2fy436IKvW7D1eAdTTqZUzcNH3vsxgiFfqS2jeJ16id0+ulS1T
         JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=uOlK4idXYzvsOs+V4EXrT6/Rh8QRyxZluzdR0PlLr/UXbWRZkGx5eLEywAttMCtY3F
         lEMl9jGpwMmrLNSymohXqDMj1F272He6d03PFIsTOVFTljaUHZEqvsXeztJ8YoJAEp2Z
         XdkSdbJBeVVxiDfCt8abb4q0e42mnDsyohOcdFUM+i7KeJ2E/2C3SQ57KvoMk3GFLgdo
         TIo+VqIwJEl88bAsEYjfi/CobW7cx9h8sRMkEJlStL8EiquvTvXlulV6N1nZ1hF619qb
         bm+xFfcawCFp/qMmxKvS8OtdP49lgSWxK5uWDQlh7R9ztcOcCyi0aiwxUoFPq37N+TCR
         SWDw==
X-Forwarded-Encrypted: i=1; AJvYcCVAzRiZAzNaGzzObN4ZScOAEyMfccKoi3ymIbadWkZVzLnTCOzK1snV+s+0KTZpl4ONGhxAxvbuP5tnU6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk71zIVBQ2R5OnMnn6cGxgvRmFBxGYK4rXRqxaqlaOaILErtTN
	PKQ60v6iccVEuG2eFuZafKOuJmqGHSUR2RXjh4p9IOcn1+NNEfw+JP1uAR4ss1M=
X-Gm-Gg: ASbGnctsRM7Lc6Ld2GAl4ALesG2au2qKTwaIdfHahC651zma3D/2FQWFy4hJPNWyfOr
	R+nZEuy2pBnpWb1aRDmBfp2Q1w+Z+iaIkn0hnLBEEdogrOL8Kz1gMP26NyZAwfXsDdUtx3nGOFk
	JnZPxoiXO5H7eM/rJ+736/YdxBau/IAvO7AGLAQMPHyS0EbeMvjEISuTc7JMcXr/9leJ5BMklWc
	zmABiGINHpQ+l8WwcaS+0NrDirsCHFdCiM3gpKqsld2pgsy9Z67NkjEXgHjM267P7c7wLB0NvZQ
	oRP1fbsCMBGWF38eL6AW+1Jy4weUheNaNNP7jq/Wjzd0MBOpjXHFpM5/uxXZdXpWewFb0zux8XZ
	3vDRz+F+EB/ZyKEoZhzRE1teR6Io=
X-Google-Smtp-Source: AGHT+IGcGvyBEozGeWIYo1Wmu1QpRypnZWsnec23s92Whxrsp0WWnRhv1muM1X5KK7DjvKkeOCkkGA==
X-Received: by 2002:a17:907:7248:b0:ac2:9093:6856 with SMTP id a640c23a62f3a-acabd4db31bmr9024966b.54.1744231061967;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:45 +0100
Subject: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.604.gff1f9ca942-goog

