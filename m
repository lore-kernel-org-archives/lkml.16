Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8220C01C;
	Wed, 30 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996844; cv=none; b=lPHPmCENAtECkhUK3ApuJh84XH5QuC/Wb1tRFM4RgqXUKij/i8ua3pvjevBHSozssG6MJs1jtde9Lya5nyGoT9J1ZDkHNbU+Ue1RvOHqkEmP5BTfyBUusD8wRjt4kKTbzD/tXzFTmjRxkkgRc9SCYK4D5ubLmkNf1jkOQuoTioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996844; c=relaxed/simple;
	bh=Kyf+JgIs1pOl50ZzUQw3gg0eoEVgfjFo16SyHRTN6/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ltdN2P/clLP+OjQTdl3RTLRPjhLEAsig6t/3QNMQA0qU9RqALAoFRNUK5FDU0HBZuE5DX2lPv6uaUJljdsG+pkQdpT9gb3I1mi+nYdSoX0wLa9zknnPFSmJ+3FmIRqwSYzsxx1GcknbYbw3kXSYh2j8OroQVSpKay3MAlAhLGKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzUC9wPg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzUC9wPg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so11099788a12.3;
        Wed, 30 Apr 2025 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996841; x=1746601641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc99szM5NS9if/cxxc1jYyxG/jdxQF7Jhbt7r7vKNzw=;
        b=dzUC9wPgmuFmtFwvWFOS8TyjdYPGychUsyhhqy7GrryjbKN/odpQYJGALRGG4jUaWa
         KlSI/L9XI18adsH+S46+HehABbtVOG5ygZh/21N9cpHs4b4IujoF0QXfnbK0koxvOIwO
         Ox0mL2WiCHb3f9vMXWMoqrm6+CpVjpbLrF0nrQmBnAqS9e+L1QfGzWvb0ns1qOUzdZMq
         KcsQpZQRvdhx8c0ZIKjuc1NZ4Y82ZH6E3i8E/GAquO+DObg9z7mnS2EpiaNsfYPgqta2
         WS3tqJ7nqIGcQypzE5xqge0zLGu56LotV/+/QSmpgVtHQDSrS2zEMvOUaHweD+8HgXWK
         Siig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996841; x=1746601641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mc99szM5NS9if/cxxc1jYyxG/jdxQF7Jhbt7r7vKNzw=;
        b=YMTzV77O9mMj1OC4rnjb/YZ6AiDkvlK3WuiIbAL7I2/4wtDr7iVYSDXJRBXQIiQ0xz
         OAN3NAEvuNmVxawpM6UoFx3WFQbAK7JeUyEQQcS7tlgrel9u6YHfApt123g5NyeE6BCz
         9/7x8PIsxbUjEkKrRFx5mr2mGjpAl3ZQEdO/nMqt0uC6ybCJltiBDf1sQI1L1cfJ9RZm
         WywnpxmTicocXkAUfLp7AkYhpx7GEDeMMKWEQhrP84JIF92tTUd5BOrUsFbJA4PNum/X
         DZ3G7FXRggs2Ypwbs2hh5/vQalxfWBiJgyosKwKhrDnj+7GyOCOzOOj9J+4hogPwaCDK
         taEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4rcOswHvlGGSKwOKysZwU9qHXFBDcS9j4uMJ9+vFsfGgKupCOF+fSCmSPteVuMPmv78mi72MWLLRviLcS@vger.kernel.org, AJvYcCVU0gUAv5HkHyR0IY16mh5ypkN9eyMUrmMueRHLez5KWTqmrtWJ55pbUqBYk7h7vGrQVqJHq6uZms3K@vger.kernel.org
X-Gm-Message-State: AOJu0YzX6ouNXXS97AX/pQ4o3cCQLdZBTDTk6Pl8guPfZf30CJrIybqq
	6gJg93a2P5SClEj1LwiLwBsQnsElbJ7FaGwCFcINQpCLvrV6OuPuqq2QcA==
X-Gm-Gg: ASbGncvG3TQM80JwUR4pK0wyKaKYxOT/mWnKFfk4kQM9Fq3+gidEqXH5f0TsLzBbOz8
	tW4XRbGZ/i+PFKx1WwvsjVBynRaI6O8sr83Oz0snkoHcjl1dp5wUXP9IIOUtCJlbEBIvFKZZMcq
	xIAj3mPn/8WWrNZvONQEdvgSBZgjkaaypL5Br8IMshwfdTo8NtgC56UyYpeQzZOBSXsRpZMTmuI
	PmaLBgat4amdEKrT2rPjIcVV1yxCscLb/n1T0eKT3SOIS0xgrhixVhEQ4dOZI/K8C6Dm5fcjD+T
	FB9kryb+w5e3OcSZK1ijJKyLYx6/kuUdo6kC4+mGVGFOeRm4i6DhBrIaOEJ+EUARqK/jKB9vJ2d
	GpxgBZE0Dz2c=
X-Google-Smtp-Source: AGHT+IE9B7O3f2Zx9SbVPfFNhUAxKNJ1v598E122nhb3axEh52sxGI9kcl490JCRu0J7Tp/swxS71w==
X-Received: by 2002:a05:6402:5205:b0:5f6:dc67:639d with SMTP id 4fb4d7f45d1cf-5f89b446757mr1412264a12.15.1745996840053;
        Wed, 30 Apr 2025 00:07:20 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:19 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:08 +0200
Subject: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=3092;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Kyf+JgIs1pOl50ZzUQw3gg0eoEVgfjFo16SyHRTN6/Q=;
 b=RcNBgUy/EgquttJsiJmhHwzgwB5v+B923kqzWeEaTLVETU8zGG4yVb3HtOTi01hx70EOwijBP
 0g9wZ0RdlmcD4NZtbfhVFBJsOljxuVw83FB2IYX0bHZnMz3jbRe0Q/w
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

