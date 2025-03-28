Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C11C5D4C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168668; cv=none; b=V6O3x3G8BsVmkXYMVolOLMdEHlJCIdC6Y4ns9WUL/1mVQiiY/Gfvo/mmE/+xmCNu/6y543xtY36mFgDd3ZNLpK9wSBIbEz7JMAhx3A0dmgVYXcnbUuYhgY9iIzqzVwsLO75EWJpQ0NI5LqrB2LkM0BXdRRi+YhifYfvYhtE5sYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168668; c=relaxed/simple;
	bh=y6yU6lYRyqEHU2RYOfcRxwcasP7T27SnGV4OR5isOHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8zAoIWepeDCIS34OJh2J+yd0PENUihw/gtUMl79TxDYQw7yAgahDbiexUXEAzkNNZzQX1pbEwraHMrBMNx07moWNUYgxMVMbDzhKTrKO03cKHsu6wqGCmG+SGt6OISNVrl3NUNFcrGhRZkeC5M9FZeXzm/u1/xE/GNiCf/XHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWEkT/bz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWEkT/bz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3529568a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168660; x=1743773460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=aWEkT/bzhASSI4KOxwmBNBZe6evdgGI6ePH6Mdx65HYfca1Y9xJqAaMLpivF8wQ+G3
         Qcuw9+Xq+q6S0SPAZXUEQhue8Ke3AauxFUPbUT7GCXvyS849d3aGpp1XCJNcbBsCmZN7
         zzI1RCJ4KGRmteOfJcRj18JdYm/1lAy7aSHJ0SWqzddeJBfdDdUOvbzoxuh5eN1Zh9d8
         xGiOTFFBsu09dq6fGyjVTEGwlvlCUErY5yT8oweIZyf9Vo7bL0SRHCIF4C+gTzENZa1R
         rzVIbkm9u0xpUZCvhmc1HytmIr5bDxdrM2Je39vkMMyVZ1+xMc+qVMVmL6tBckKFAqET
         IINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168660; x=1743773460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=JNY8ewS4XxSvqeLkTVw7z75bVG6q62Lfpk6hqh7/F/kWwJf4vLKoN0eSwfCLrpP37n
         lnKJDIGjSL0ZIH8xMHkDMqrJxTyf8y04MdG7P1mku6JCvwt8qQIsNj/zL8bvtvs6+qQJ
         3twDBzDwCcNMTbTanPc7BRBbpUKhcDAo4Eodnh5KCqYOAwly70ASfKVerNfvqlU4lNKE
         GGZpAhakon+7Mf5wrPh8EbxqGFeCj/txFjHLi+Pvh8UB6Eid5hzT/5ra0LjFO2knSr06
         k+zswL1Xq+Wrq3NS3oEzN6FB6IMOf/TwEz8aZY2Tf+TNXLyDH7EKUU3QN+4bJpV6K4nk
         7zVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5jhnuefeYM/8dVJvgpUcMCZlye2uKPJydr6We5cLy95R0/fcSNAXHKe+YJkaoj511VFJ9QOA2we8PHT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWIYdR5r7JVmQoXnZB4djRiQvB+TUvKMuLmFGGNTKyfhTTjE8
	2kKSDJa3XYgC8QbdsCYo7/3STf/akA0autmtSo3PngxHlngR6ymzo1grFp/pdw0=
X-Gm-Gg: ASbGncvPpB5WymcFRIS/9kDAnTT4f2krg+1aRGmlQqSAr1hC7o0kUP7c0v/qYIym+3K
	8deX/QELBhkYcVjVeraqQNL2bUmGzeo1UlFugnOIa5dCP1uDnxkkoRDXZLNvpLYs6b1ZCN3nETV
	HAVdh1U74eQiF5CeAtXxj7/PnkDolIln/9enuC27Z3PpJJ4VBaI9wSDwY3b3S4txU9EinWeRF4E
	5bdppwP3vwJVYRb6KKuiF9TOtrxPGAocFtiNCbFj9RyndjUK2U8r3FF4U6eeozTMEAl+ssYb7CD
	nn2lzchIJBnQJeYXzeXRSw/5pKperIDB4yoThcSrZt6zCQYgUTN1kZZtCYmGHUn7dykuDVnSh9I
	3TGewjQOT9ZQewWJaWa0AFzZvj6B+
X-Google-Smtp-Source: AGHT+IEfLeFVVKPzcq/g9M+Swoap13H4J7LtCPC0wmGIvXuvFF2fbhLbZmznj1q9fH3/uH0jyy0zcQ==
X-Received: by 2002:a05:6402:2753:b0:5dc:9589:9f64 with SMTP id 4fb4d7f45d1cf-5ed8e4a9609mr7684378a12.13.1743168659884;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:58 +0000
Subject: [PATCH v2 12/32] mfd: sec: sort struct of_device_id entries and
 the device type switch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-12-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 8e3a365ff3e5533e27d94fa8a15dbfa639518a5f..966d116dd781ac6ab63453f641b2a68bba3945a9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -154,12 +154,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -184,11 +184,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -201,15 +201,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.472.ge94155a9ec-goog

