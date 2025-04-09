Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0438621770B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231066; cv=none; b=VGAZjah/HxNPXi9j/RLbgUFr5u1XPDgvnHAdWxZsuqp7JWBPxOHPL8lBkPyZP7gY+9wEK+EeKWovJH0xu6pInPb+R8HE6Vpy909hrk8SxWlNaRkKXQcUcZEIBUyWXLKEZ2WQwjVvhKkip8cyTnjyIJBBJ4bl3HSumDTZM9+do20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231066; c=relaxed/simple;
	bh=W4s100yFl52kQPJvrE88DOF1vm0fVLWyudBdnMinRnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNsgFF5XFbrHYGly6h+3jBF816Y885RknZ8s+uqlkofkGR+U8vAGFvsvR0/CRyhFOYL/vLe1jF01Jptw6iiCwRT3H3Pmxzs4jEryMtsm0HuDCBQSbzTUiZh/vXDzT8FPXCZxNRt1UO4TWWJqGn15M2P2G1TumXX9ca+Vje9ILoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JUskW0xN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUskW0xN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so16505466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231058; x=1744835858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWLP4HLc4UA2Mdu/pVqh9n9FuWQ3oivZb2FxzUkaJvg=;
        b=JUskW0xND7cAbtwDazw+s7RU2qA6mParqJ8l8zi9jEgyBIHkNNGNxnDKlrKzVjgv9+
         EuPjzeac+3e3XDEjno/IBZMrdhBFd66pKWStKqoWWyosLqg+VA49QQOUcjHh4pQ4Y4vT
         4WJ23BRM4UFvhbzrYPQgCAbxdghpnXoM/+YQ5UbG6nniEGn3aqKdR3Md0X4BDMpOOm2r
         gXnCsr/YLpVxf5MkesY6bbm2U1dKE+sChDzqA9LeCpt1woJ8xGu/+5zji8fiHTcZS9ql
         AR56h4Mxm3c7bOi+wFkjezYLWS5gERmaFOdFMW43TNo0A02gXu0cKPdDt5A7wUp11C/+
         +UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231058; x=1744835858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWLP4HLc4UA2Mdu/pVqh9n9FuWQ3oivZb2FxzUkaJvg=;
        b=LeQTLQ/sNs31Rjxrbstq/4HlVQHL3eFnvMunX/V68eTPeoGD3w2qKQmMWoM4DjW35i
         03lVh7Sr7Pag2JszOsM2xmr/wQo9cVIKFGOaVoSp+KAtysh41xDTh5PDbzepNz82qrCU
         HIVqMMovk2kKbkt9unrifwumpq72jmP1JVi+Qz3KXH0kiKp/grnPZUbbRNHBlB0AkXAY
         5/RO6sI9rehtvXRpuhvDaKRpLcaQoYdGTNbRaasAv/W+X9NPZZtL6s7u4M/abjLPgMuT
         MghtS+qv7nwDRNttPXNTCtVdAfVMkmSLR6hV73usnvQMDjxMRmcitJtmtw8r2zDuNZ7n
         kbEw==
X-Forwarded-Encrypted: i=1; AJvYcCXxbx49RHd7Pr93Fdwl7bp+70A/KB2ZTC5SQX/HZ/IQmpQSshLwCBWtcBllCrCChmhCNvMOTfXYrfE2gNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3dl/tDew0yk98ONQzbMJxy6n+PkKppGuWw4B3rUNsy/xX3Ph
	0hmkc7XITtVmypKj9pdsksIvW1pfisgWvbqBBE7aqcaEXu5cwgofGo+tpFdL7Vg=
X-Gm-Gg: ASbGncsN2+Q99BNKCCi3w2azgGeYmOfCqwc3mR5Le+xeKY6wjGbTbcQtT6NFb/i8Nl9
	2edP9K82sevUStzuzac27VBl1bLYZGSO4/G5QNV0FPjvkcNP30RpCBu5lamb1BS/kKNsDteyUdO
	qxUL8KT750xkamatt6ovru3yoxHjiQ8Efwk3j2XGMGI6kN6FDsnrRmeL6yYfFuL6gqdaBbVzGrf
	39ydFGsZK2JuPjcdNQ9gKWyKNWjkoHEQ+GiunOaw5Y8hM5WZ6wh/TLfdZAKiTDcgSF9oez4LyC1
	Vkv66b2Smuu0NxL2Dd05mgYS9wfRthcqdL8SuMnC2tr0zv3ZtRvNL4IKI1gMgH2r13aGihZUJEH
	gcmINw1WSUkiBx2jCpyYBXnQRUnk=
X-Google-Smtp-Source: AGHT+IHOV/1MZhdPuVZA1g3x1ax7OdrN436ASrU1pnao8gKn9m3hB99bG/q0F2E9xqZW861rUz2aXg==
X-Received: by 2002:a17:907:9496:b0:ac3:b50c:c95b with SMTP id a640c23a62f3a-acabd4d7f0amr7061266b.56.1744231058355;
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:38 +0100
Subject: [PATCH v4 17/32] mfd: sec-i2c: Rework platform data and regmap
 instantiating
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-17-d66d5f39b6bf@linaro.org>
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

Instead of a large open-coded switch statement, just add both regmap
config and device type to the OF match data. This allows us to have all
related information in one place, and avoids a long switch() statement.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2: fix typo in platform data for "samsung,s2mps14-pmic"
---
 drivers/mfd/sec-i2c.c | 133 +++++++++++++++++++++++++-------------------------
 1 file changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 81f90003eea2a40f2caaebb49fc9494b89370e7f..41b09f5e3c49f410604a5d47e625cbb37d7f5fa2 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -20,11 +20,16 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
+struct sec_pmic_i2c_platform_data {
+	const struct regmap_config *regmap_cfg;
+	unsigned long device_type;
+};
+
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -136,52 +141,20 @@ static const struct regmap_config s5m8767_regmap_config = {
 
 static int sec_pmic_i2c_probe(struct i2c_client *client)
 {
-	const struct regmap_config *regmap;
-	unsigned long device_type;
+	const struct sec_pmic_i2c_platform_data *pdata;
 	struct regmap *regmap_pmic;
 
-	device_type = (unsigned long)of_device_get_match_data(&client->dev);
-
-	switch (device_type) {
-	case S2DOS05:
-		regmap = &s2dos05_regmap_config;
-		break;
-	case S2MPA01:
-		regmap = &s2mpa01_regmap_config;
-		break;
-	case S2MPS11X:
-		regmap = &s2mps11_regmap_config;
-		break;
-	case S2MPS13X:
-		regmap = &s2mps13_regmap_config;
-		break;
-	case S2MPS14X:
-		regmap = &s2mps14_regmap_config;
-		break;
-	case S2MPS15X:
-		regmap = &s2mps15_regmap_config;
-		break;
-	case S2MPU02:
-		regmap = &s2mpu02_regmap_config;
-		break;
-	case S2MPU05:
-		regmap = &s2mpu05_regmap_config;
-		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
-	default:
+	pdata = device_get_match_data(&client->dev);
+	if (!pdata)
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device type %lu\n",
-				     device_type);
-	}
+				     "Unsupported device type\n");
 
-	regmap_pmic = devm_regmap_init_i2c(client, regmap);
+	regmap_pmic = devm_regmap_init_i2c(client, pdata->regmap_cfg);
 	if (IS_ERR(regmap_pmic))
 		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
 				     "regmap init failed\n");
 
-	return sec_pmic_probe(&client->dev, device_type, client->irq,
+	return sec_pmic_probe(&client->dev, pdata->device_type, client->irq,
 			      regmap_pmic, client);
 }
 
@@ -190,35 +163,61 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 	sec_pmic_shutdown(&i2c->dev);
 }
 
+static const struct sec_pmic_i2c_platform_data s2dos05_data = {
+	.regmap_cfg = &s2dos05_regmap_config,
+	.device_type = S2DOS05
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpa01_data = {
+	.regmap_cfg = &s2mpa01_regmap_config,
+	.device_type = S2MPA01,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps11_data = {
+	.regmap_cfg = &s2mps11_regmap_config,
+	.device_type = S2MPS11X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps13_data = {
+	.regmap_cfg = &s2mps13_regmap_config,
+	.device_type = S2MPS13X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps14_data = {
+	.regmap_cfg = &s2mps14_regmap_config,
+	.device_type = S2MPS14X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps15_data = {
+	.regmap_cfg = &s2mps15_regmap_config,
+	.device_type = S2MPS15X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpu02_data = {
+	.regmap_cfg = &s2mpu02_regmap_config,
+	.device_type = S2MPU02,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpu05_data = {
+	.regmap_cfg = &s2mpu05_regmap_config,
+	.device_type = S2MPU05,
+};
+
+static const struct sec_pmic_i2c_platform_data s5m8767_data = {
+	.regmap_cfg = &s5m8767_regmap_config,
+	.device_type = S5M8767X,
+};
+
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
-	{
-		.compatible = "samsung,s2dos05",
-		.data = (void *)S2DOS05,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
-	}, {
-		.compatible = "samsung,s2mps11-pmic",
-		.data = (void *)S2MPS11X,
-	}, {
-		.compatible = "samsung,s2mps13-pmic",
-		.data = (void *)S2MPS13X,
-	}, {
-		.compatible = "samsung,s2mps14-pmic",
-		.data = (void *)S2MPS14X,
-	}, {
-		.compatible = "samsung,s2mps15-pmic",
-		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpu02-pmic",
-		.data = (void *)S2MPU02,
-	}, {
-		.compatible = "samsung,s2mpu05-pmic",
-		.data = (void *)S2MPU05,
-	}, {
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	},
+	{ .compatible = "samsung,s2dos05", .data = &s2dos05_data, },
+	{ .compatible = "samsung,s2mpa01-pmic", .data = &s2mpa01_data, },
+	{ .compatible = "samsung,s2mps11-pmic", .data = &s2mps11_data, },
+	{ .compatible = "samsung,s2mps13-pmic", .data = &s2mps13_data, },
+	{ .compatible = "samsung,s2mps14-pmic", .data = &s2mps14_data, },
+	{ .compatible = "samsung,s2mps15-pmic", .data = &s2mps15_data, },
+	{ .compatible = "samsung,s2mpu02-pmic", .data = &s2mpu02_data, },
+	{ .compatible = "samsung,s2mpu05-pmic", .data = &s2mpu05_data, },
+	{ .compatible = "samsung,s5m8767-pmic", .data = &s5m8767_data, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);

-- 
2.49.0.604.gff1f9ca942-goog

