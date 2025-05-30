Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC974685
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748579637; cv=none; b=g0VnF8BldfaUvk0ymXPiAW0KAYgf5rg2s9RUzl5Ap5dqFHMraSTrsaYRwQcjdEAu8eyBSJlqWY6+i1M7hUF/lrqfuTlMsmYfbSajfytvltKaa44fb7s0CJODdeYxg3nWoid+wJ+NgeyPYL18SCleVjj53Rmwk+u7G3MDNYNSvzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748579637; c=relaxed/simple;
	bh=rEQ7njt3OYfI+7SZlhuYTmoQK/t0Qk/9R0UCpdqtjPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MYvTDxKMCk00pjieXYQoO+t1zCaWYzqi8m9pV2ha7qU3MSPS+icUnKvk4m/s0aXVh6gYfEFkOcHJDeC1HSEzgbuBJk+tJZuqoaJ/myl3MbQEFc4SXlRiQrsgBQ3FlbK3CZ9gXkLpIqnvVYb8b5tz2inoTy6i0tGX0g+91OPCs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vdws14B6; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vdws14B6"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-530802fd5cdso212406e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748579634; x=1749184434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SkMG7VLEtFOwLFLWZsT5pmezWKsUgqRrTsvMeAZOn0=;
        b=Vdws14B65vhJs5yC98GljT64SiQ17cHQq/7WD+nYfWkVCEEnn6Ht0/NMqsT+TlX7Mk
         dCWHsW2hyldfEfrCgZIB5ZEThQR5BiBywlEMSmmYwqQ7Um5FtM8GM+HggefJygPqZEMc
         TuUnGGp9Pc93KeTPVMV4JT749UySjajSKWiGglDqs/Z7qo8mo+pfYWwrTKR/8OeenyIA
         EVMcKF/zR6/Mwg1U6zNjYQqRRLpguuF1VFgDM34CvXOKmlaOmfXcJjdxrDP/pbDxHYTn
         JbC81FJx6CLFc04dtSlX3wLBEeM5YFU9cJWhbqwUst6bym90t+vE86i5pmUkxXlpmme/
         gHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748579634; x=1749184434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SkMG7VLEtFOwLFLWZsT5pmezWKsUgqRrTsvMeAZOn0=;
        b=TBEC5y2M5F0OL3LMqPyWnER8GvU99a6WQpyex/FQV00P88fzS5rfwTsb2lhnZr59xG
         CMvl99gQ3QwQC2E5x6LG73dRyo/gcPqBrEvGBC0kCcc3SuLP8ITDnVCH/Idy+jI6EXp5
         pL3xAWvSjey2LpmkZ6oXybKkPiqEUdbDQQDOzBA25uxMGjlMQvJ+zH11HrJRcAXm1u2S
         ovJIDUMv2QUch+bbGxbAYnqhmL2bWIdPMj2Pq9y+ODYe3Gl9q/JW8DprdF1H6Qvhh5Z4
         B4Z5uwNi7ys2v1meInMARWz/6JH74Ex37ZAljxoCtSd58rDiLtSdfGoyeVDAsotz8vxm
         OxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJY98lgxKPSujAAay7EREQf7RoNfemBQmGM68Dwx8K3s/0AamxU74tGYVS2L9Aq/g9C0oCwZmO+XxvUzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1B65hardJ0SM3SGSpkCzDAJridsbX5UxVr64deCSRa/RtYBy
	ub9NHpEJLPbaRYj6SvrQyK3yTMZKZEoAg96FXeFxRsdktAI9IfWyGA4Uhn7JNxxBp24=
X-Gm-Gg: ASbGncttzZs81W107+hcvU2UCckNcKb+NXTKBCU3gY4hL5nWVoiGG9lAoWxbUBT7zos
	ikfRuZfpAYrnIPyi015DNsmxxXs9LkGBpDzPq19/NSvkwjXX+UbS+pE6RwYaKQTJhg4WcUxLQG7
	O6Th69My160AKtFBKgtcpMckrL6MsVJXLruSJF2xY2TIdqYqbus3R82IPtNmc144sQ4no41ZpuR
	hxRdxYkKV89DDA/rmW7C4qQW1HYhpxd+njZl2BV76eILSaW7hPm+KGXiuxOxL48BoniMpjD5g1R
	bnIuB5OPvUr6OPoiR4az3uogduuOrW5boHql0/YSJ7As76Qj/ztK2EFxB4BVX/GHf9s=
X-Google-Smtp-Source: AGHT+IFNDW0qg4EWhYrexMFTJg/BAUd/8b9Ray4tgDhh/oRqIkMwI2tLjMh9MQJlrBZ8dPK/yzeVqA==
X-Received: by 2002:a05:6122:1d11:b0:529:f50:7904 with SMTP id 71dfb90a1353d-530810d79f3mr1979885e0c.9.1748579633854;
        Thu, 29 May 2025 21:33:53 -0700 (PDT)
Received: from alkaleus.. ([168.0.235.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ad9192sm2461263e0c.17.2025.05.29.21.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 21:33:53 -0700 (PDT)
From: Andre Luiz da Nobrega <andreluizrodriguescastro@gmail.com>
To: lee@kernel.org
Cc: jingoohan1@gmail.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Andre Luiz da Nobrega <andreluizrodriguescastro@gmail.com>
Subject: [PATCH] backlight: lm3630a: Use scoped iterator to simplify error handling
Date: Fri, 30 May 2025 01:33:00 -0300
Message-ID: <20250530043300.89377-1-andreluizrodriguescastro@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids the need to manually call fwnode_handle_put() in error paths.
Prevents potential memory leaks if future error paths forget the cleanup.

Signed-off-by: Andre Luiz da Nobrega <andreluizrodriguescastro@gmail.com>
---
 drivers/video/backlight/lm3630a_bl.c | 121 +++++++++++++--------------
 1 file changed, 56 insertions(+), 65 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 37651c2b9393..35a13bd38133 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -16,29 +16,29 @@
 #include <linux/pwm.h>
 #include <linux/platform_data/lm3630a_bl.h>
 
-#define REG_CTRL	0x00
-#define REG_BOOST	0x02
-#define REG_CONFIG	0x01
-#define REG_BRT_A	0x03
-#define REG_BRT_B	0x04
-#define REG_I_A		0x05
-#define REG_I_B		0x06
-#define REG_INT_STATUS	0x09
-#define REG_INT_EN	0x0A
-#define REG_FAULT	0x0B
-#define REG_PWM_OUTLOW	0x12
-#define REG_PWM_OUTHIGH	0x13
-#define REG_FILTER_STRENGTH	0x50
-#define REG_MAX		0x50
-
-#define INT_DEBOUNCE_MSEC	10
-
-#define LM3630A_BANK_0		0
-#define LM3630A_BANK_1		1
-
-#define LM3630A_NUM_SINKS	2
-#define LM3630A_SINK_0		0
-#define LM3630A_SINK_1		1
+#define REG_CTRL 0x00
+#define REG_BOOST 0x02
+#define REG_CONFIG 0x01
+#define REG_BRT_A 0x03
+#define REG_BRT_B 0x04
+#define REG_I_A 0x05
+#define REG_I_B 0x06
+#define REG_INT_STATUS 0x09
+#define REG_INT_EN 0x0A
+#define REG_FAULT 0x0B
+#define REG_PWM_OUTLOW 0x12
+#define REG_PWM_OUTHIGH 0x13
+#define REG_FILTER_STRENGTH 0x50
+#define REG_MAX 0x50
+
+#define INT_DEBOUNCE_MSEC 10
+
+#define LM3630A_BANK_0 0
+#define LM3630A_BANK_1 1
+
+#define LM3630A_NUM_SINKS 2
+#define LM3630A_SINK_0 0
+#define LM3630A_SINK_1 1
 
 struct lm3630a_chip {
 	struct device *dev;
@@ -67,15 +67,14 @@ static int lm3630a_read(struct lm3630a_chip *pchip, unsigned int reg)
 	return reg_val & 0xFF;
 }
 
-static int lm3630a_write(struct lm3630a_chip *pchip,
-			 unsigned int reg, unsigned int data)
+static int lm3630a_write(struct lm3630a_chip *pchip, unsigned int reg,
+			 unsigned int data)
 {
 	return regmap_write(pchip->regmap, reg, data);
 }
 
-static int lm3630a_update(struct lm3630a_chip *pchip,
-			  unsigned int reg, unsigned int mask,
-			  unsigned int data)
+static int lm3630a_update(struct lm3630a_chip *pchip, unsigned int reg,
+			  unsigned int mask, unsigned int data)
 {
 	return regmap_update_bits(pchip->regmap, reg, mask, data);
 }
@@ -158,9 +157,9 @@ static int lm3630a_intr_config(struct lm3630a_chip *pchip)
 		dev_err(pchip->dev, "create irq thread fail\n");
 		return -ENOMEM;
 	}
-	if (request_threaded_irq
-	    (pchip->irq, NULL, lm3630a_isr_func,
-	     IRQF_TRIGGER_FALLING | IRQF_ONESHOT, "lm3630a_irq", pchip)) {
+	if (request_threaded_irq(pchip->irq, NULL, lm3630a_isr_func,
+				 IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				 "lm3630a_irq", pchip)) {
 		dev_err(pchip->dev, "request threaded irq fail\n");
 		destroy_workqueue(pchip->irqthread);
 		return -ENOMEM;
@@ -208,8 +207,8 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE, 0);
 	else
-		ret |= lm3630a_update(pchip, REG_CTRL,
-				      LM3630A_LEDA_ENABLE, LM3630A_LEDA_ENABLE);
+		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE,
+				      LM3630A_LEDA_ENABLE);
 	if (ret < 0)
 		goto out_i2c_err;
 	return 0;
@@ -283,8 +282,8 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE, 0);
 	else
-		ret |= lm3630a_update(pchip, REG_CTRL,
-				      LM3630A_LEDB_ENABLE, LM3630A_LEDB_ENABLE);
+		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE,
+				      LM3630A_LEDB_ENABLE);
 	if (ret < 0)
 		goto out_i2c_err;
 	return 0;
@@ -345,10 +344,9 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
 		props.brightness = pdata->leda_init_brt;
 		props.max_brightness = pdata->leda_max_brt;
 		label = pdata->leda_label ? pdata->leda_label : "lm3630a_leda";
-		pchip->bleda =
-		    devm_backlight_device_register(pchip->dev, label,
-						   pchip->dev, pchip,
-						   &lm3630a_bank_a_ops, &props);
+		pchip->bleda = devm_backlight_device_register(
+			pchip->dev, label, pchip->dev, pchip,
+			&lm3630a_bank_a_ops, &props);
 		if (IS_ERR(pchip->bleda))
 			return PTR_ERR(pchip->bleda);
 	}
@@ -358,10 +356,9 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
 		props.brightness = pdata->ledb_init_brt;
 		props.max_brightness = pdata->ledb_max_brt;
 		label = pdata->ledb_label ? pdata->ledb_label : "lm3630a_ledb";
-		pchip->bledb =
-		    devm_backlight_device_register(pchip->dev, label,
-						   pchip->dev, pchip,
-						   &lm3630a_bank_b_ops, &props);
+		pchip->bledb = devm_backlight_device_register(
+			pchip->dev, label, pchip->dev, pchip,
+			&lm3630a_bank_b_ops, &props);
 		if (IS_ERR(pchip->bledb))
 			return PTR_ERR(pchip->bledb);
 	}
@@ -392,7 +389,8 @@ static int lm3630a_parse_led_sources(struct fwnode_handle *node,
 		return ret;
 
 	for (i = 0; i < num_sources; i++) {
-		if (sources[i] != LM3630A_SINK_0 && sources[i] != LM3630A_SINK_1)
+		if (sources[i] != LM3630A_SINK_0 &&
+		    sources[i] != LM3630A_SINK_1)
 			return -EINVAL;
 
 		ret |= BIT(sources[i]);
@@ -425,23 +423,20 @@ static int lm3630a_parse_bank(struct lm3630a_platform_data *pdata,
 
 	*seen_led_sources |= led_sources;
 
-	linear = fwnode_property_read_bool(node,
-					   "ti,linear-mapping-mode");
+	linear = fwnode_property_read_bool(node, "ti,linear-mapping-mode");
 	if (bank) {
 		if (led_sources & BIT(LM3630A_SINK_0) ||
 		    !(led_sources & BIT(LM3630A_SINK_1)))
 			return -EINVAL;
 
-		pdata->ledb_ctrl = linear ?
-			LM3630A_LEDB_ENABLE_LINEAR :
-			LM3630A_LEDB_ENABLE;
+		pdata->ledb_ctrl = linear ? LM3630A_LEDB_ENABLE_LINEAR :
+					    LM3630A_LEDB_ENABLE;
 	} else {
 		if (!(led_sources & BIT(LM3630A_SINK_0)))
 			return -EINVAL;
 
-		pdata->leda_ctrl = linear ?
-			LM3630A_LEDA_ENABLE_LINEAR :
-			LM3630A_LEDA_ENABLE;
+		pdata->leda_ctrl = linear ? LM3630A_LEDA_ENABLE_LINEAR :
+					    LM3630A_LEDA_ENABLE;
 
 		if (led_sources & BIT(LM3630A_SINK_1))
 			pdata->ledb_ctrl = LM3630A_LEDB_ON_A;
@@ -455,8 +450,7 @@ static int lm3630a_parse_bank(struct lm3630a_platform_data *pdata,
 			pdata->leda_label = label;
 	}
 
-	ret = fwnode_property_read_u32(node, "default-brightness",
-				       &val);
+	ret = fwnode_property_read_u32(node, "default-brightness", &val);
 	if (!ret) {
 		if (bank)
 			pdata->ledb_init_brt = val;
@@ -479,12 +473,10 @@ static int lm3630a_parse_node(struct lm3630a_chip *pchip,
 			      struct lm3630a_platform_data *pdata)
 {
 	int ret = -ENODEV, seen_led_sources = 0;
-	struct fwnode_handle *node;
 
-	device_for_each_child_node(pchip->dev, node) {
+	device_for_each_child_node_scoped(pchip->dev, node) {
 		ret = lm3630a_parse_bank(pdata, node, &seen_led_sources);
 		if (ret) {
-			fwnode_handle_put(node);
 			return ret;
 		}
 	}
@@ -538,8 +530,8 @@ static int lm3630a_probe(struct i2c_client *client)
 	}
 	pchip->pdata = pdata;
 
-	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
-						GPIOD_OUT_HIGH);
+	pchip->enable_gpio =
+		devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(pchip->enable_gpio))
 		return PTR_ERR(pchip->enable_gpio);
 
@@ -595,16 +587,15 @@ static void lm3630a_remove(struct i2c_client *client)
 	}
 }
 
-static const struct i2c_device_id lm3630a_id[] = {
-	{ LM3630A_NAME },
-	{}
-};
+static const struct i2c_device_id lm3630a_id[] = { { LM3630A_NAME }, {} };
 
 MODULE_DEVICE_TABLE(i2c, lm3630a_id);
 
 static const struct of_device_id lm3630a_match_table[] = {
-	{ .compatible = "ti,lm3630a", },
-	{ },
+	{
+		.compatible = "ti,lm3630a",
+	},
+	{},
 };
 
 MODULE_DEVICE_TABLE(of, lm3630a_match_table);
-- 
2.49.0

