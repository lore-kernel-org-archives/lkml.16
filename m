Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27BA1C7013;
	Thu, 15 May 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318601; cv=none; b=ASVSw2L/p9KG3A3XAjS4MbgLpKN+jLXfkn6BwUBcWiZKT5/LToN8QVGkuYfzoertLVXY82VP93dLKv5Rufj2CaX2xtLT5Vr9HdqEs+sZE+b1FeCH3kluYlDbsTKTb3fXehNS8a51jpMf9q8OKRh8aHiARhy3OhB2+py21ynuAkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318601; c=relaxed/simple;
	bh=zc/KYGv+dOB7LPpRpR+zdnpyGPVsa6Afn4PttizqeaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRJ+skfEEViQPgkcBIfpQyrO5KmRPkIBzX/GGZBzsEu1M2pC55vAlSv7gFPWprJ+laAS/8gnTfyxvjSkIQYv9r7WMhmKH72TplAlWV8vn9J8/T+ksxriBPY7Toi6b978hUmdLnevWu2xCmIFsIJwRzQHF/hIotIryUpJQTYlsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FybHy7/3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FybHy7/3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad23db02350so198737566b.1;
        Thu, 15 May 2025 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318598; x=1747923398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB7IlMr42gg8DLRiDGyDmhiIGwhSKkQAZl2FLPhXodg=;
        b=FybHy7/347Tm6OruOyfA9bKTjfFj+faV7rD9XM2iw74DLheO3npKg3YAMAA6uo9VkU
         lB5B7cxwgDE1FN7EnFIygIni2q5zEYXP9KBCkRyDhfv4SWG8e4Q8GRM0f6F6d9rcmFkZ
         4xWUrX8cGGmPcvK/yW90WXo2tpYWGd6+aXQBQrxnTo/IilhlXB6ifVazQxRZW4V1Olsf
         7YHRwC/I2F4mkWYCxjGhmmMyW6PmLAHKdar6v3teZMtB46i4I2LmxUrL4xTKbzgVQgsJ
         YUh/NfvZYklINCgo/TmuA/i1BWuCvIkkrXANCQaEOyWX2TJWhi4ADF0XSwTmq5XA/fpz
         WBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318598; x=1747923398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB7IlMr42gg8DLRiDGyDmhiIGwhSKkQAZl2FLPhXodg=;
        b=NZJiS3ezjRBQMAv+xWUVE0HnTisjk3kqXIc6r0ic40x2PE85pTe90Zc01zGMe88FVN
         wvATaSZg7tu3VNlQvm7zDuMQkmmtEdSli0v/KG1tF1PDPR+0UXbVLIJVrbEgXBngS40U
         63SqekL51sY7pnr0llbGYpAQmzwqQBAg+f2WRLvX61qG+Gfab8xQrWo9+fXjY3TC46Ib
         XeczTVnPZ54ixgAqyqoEGdTLtqHtmfrZWhRrstmdoeEPE6Hyxs8aa2l5SbIPqgdB1GPa
         rwSYQyqAnKD2pgj7Fz9e9zr+XbYwnmS2nHCOQ+a3Aj7HqglGQV1aE3+yoBzDwZs6V7of
         D28A==
X-Forwarded-Encrypted: i=1; AJvYcCWLcu+mKR/KnwQx5VeWYJcSS8A5GPjLxhDVEDhtA1gxwbCqsAtoUc/i0bVltq5FQOpOJzpDFJbJTCMLzobb@vger.kernel.org, AJvYcCWmXYynXNVaVpLit3csdcSgkNupzj/2Ycx8IinuAoWweB6VvzXnW8ug76UfjxKJoffz8u0qY/HyfK99@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1BQrwA048rgPd8UnK7fU20FK6/ydBNoVQmEdHX5cAMC54v0i
	6ByaYZR49Jxdj3OnfGQkqIMgV1dK7hZ7gAPjzkm4fpPRzfBG92HT
X-Gm-Gg: ASbGnctE/91cZFvUL5d6vjMMrtOmBpicEqvHaW6oHZYtDvWQvfhfcnVAAiGpgpKC62k
	kjaKu5qJTgoDohBBqtBo0qUQqaCKYhIVxMjP6qV+2ohphhjnSLJLIwi7yAXwHrNDVYzqXm3BwxH
	SwXwP69Qoe3WGVWeMksuysSWvuulxyb2xxxxHTKpPPjr7Hy3fplcTX3q7av4yH4g/Ao9570PHxi
	fjNJsjuGi5/M403lkO6Uk+kbbz0vuMgKoyJQOUdGV+ZC9g5nFkshW7YJ7C5M4LyFSoy3zLvIX9U
	jPseKNNRdRj5zF2Ny5AdZr6scGgtjCqdwi2p8jXVOL1lTq2fp39ODWlvEfyLRSzaSTCUk2+S5fE
	Cysn8RT8K24SwsTHP18qSag==
X-Google-Smtp-Source: AGHT+IExD8WCobcAmWiSwMceR9cRqXsORoxO5gU+uaajpgi9F6F/lCv8ew7TQkTfmbUu8IansJ4GbA==
X-Received: by 2002:a17:906:dc92:b0:ad2:50ef:492e with SMTP id a640c23a62f3a-ad4f717e01dmr778642466b.32.1747318597746;
        Thu, 15 May 2025 07:16:37 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:37 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:30 +0200
Subject: [PATCH v9 3/8] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-3-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=3150;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zc/KYGv+dOB7LPpRpR+zdnpyGPVsa6Afn4PttizqeaY=;
 b=tw9wbBZbDH75cMbnG5QmdWnMP+qBjOobs88M8T+2a8dUryao3viY7f8Qi6hbsTRbvQkjUwOA0
 jv1aJXcSlwQBfKIOrlfK4jTxC92saGWB3PIF6fqJl/+I92MmGaKdo6C
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59054 is another chip from the BCM590xx line of PMUs, commonly
used on devices with the BCM21664/BCM23550 chipsets.

Prepare the BCM590xx driver for supporting other devices by adding the
PMUID register values for supported chip types and store them in the
MFD data struct as "pmu_id". (These will be checked against the actual
PMUID register values in a later commit.)

Then, add a DT compatible for the BCM59054, and provide the PMU ID as
OF match data.

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Move PMUID value to MFD header
- Use PMUID value as OF data/device type value
- Add bcm59054 to I2C ID table

Changes in v4:
- Rewrite commit message description
- Rename "device_type" member to "dev_type"
- Drop awkward line break to fit function call
- Add PMU ID/revision parsing function

Changes in v3:
- Fix compilation warning about device_type pointer cast type
- Name the device types enum and use it as the type in the MFD struct
---
 drivers/mfd/bcm590xx.c       | 12 +++++++++++-
 include/linux/mfd/bcm590xx.h |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 8b56786d85d0182acf91da203b5f943556c08422..4620eed0066fbf1dd691a2e392e967747b4d125b 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -50,6 +50,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 	bcm590xx->dev = &i2c_pri->dev;
 	bcm590xx->i2c_pri = i2c_pri;
 
+	bcm590xx->pmu_id = (uintptr_t) of_device_get_match_data(bcm590xx->dev);
+
 	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
 						 &bcm590xx_regmap_config_pri);
 	if (IS_ERR(bcm590xx->regmap_pri)) {
@@ -91,12 +93,20 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 }
 
 static const struct of_device_id bcm590xx_of_match[] = {
-	{ .compatible = "brcm,bcm59056" },
+	{
+		.compatible = "brcm,bcm59054",
+		.data = (void *)BCM590XX_PMUID_BCM59054,
+	},
+	{
+		.compatible = "brcm,bcm59056",
+		.data = (void *)BCM590XX_PMUID_BCM59056,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
 
 static const struct i2c_device_id bcm590xx_i2c_id[] = {
+	{ "bcm59054" },
 	{ "bcm59056" },
 	{ }
 };
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index c614d1b1d8a217ac2f212908a4c19ae71fa56f63..8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -13,6 +13,10 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
+/* PMU ID register values; also used as device type */
+#define BCM590XX_PMUID_BCM59054		0x54
+#define BCM590XX_PMUID_BCM59056		0x56
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
@@ -23,6 +27,9 @@ struct bcm590xx {
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;
 	struct regmap *regmap_sec;
+
+	/* PMU ID value; also used as device type */
+	u8 pmu_id;
 };
 
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.49.0

