Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D681F3D2A;
	Fri, 31 Jan 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347249; cv=none; b=f24jtLrb9uDJwN4Zzkip2sR3SlOXSRUEF54pejUuDl4xvFPe110/ZA1SkHEGpGS4E+8k6pCgCziSW3ts/zv7Plc1SDJDzc3YOLxzZuxXxIwMpuAeOeaRlejhSI5SWp7foxRsEouXi6nLZUgrBhdKs8VgLpSqPLuwS1JZyIHEpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347249; c=relaxed/simple;
	bh=pBCfGKkeGMipb9ovlUaMugCq3/Vs7bm2Pri7eB6WPKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDE04aQaxLmUo0cUelcMQUcN+d2v/m7Ay2c5yjI1FPqZ7PCffSu2wz/H7/vBZzhlCN8PuJzkxY/8QBTPbjGOISipFj7TB9UP097jof5l9lGCSl6wCu+TPD0p88V1JCgbdgDnt4qdxgc/8mOnNCtxHCYCVk/2CacTRGOiLvIFVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g75rZiLi; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g75rZiLi"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so3416315a12.3;
        Fri, 31 Jan 2025 10:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347245; x=1738952045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fax9kdvN216AxxcqVrOAKn7muyCEAfP6SvOfhWX/p7o=;
        b=g75rZiLiU7i91won0Kt6lyDHy8wd4Z4cvE81N2cBifgYM9bYQqkakFfACAZyFiJoCN
         WJYuqZYVpuqlmWy6MoGInMDOVNysshrJ+8Bi8g5iJdB4j12FJWTw9Xvh1gjEcUyg2URP
         6NYhK0Z41T/bekbk28N3C1oF6tAyw9jFzJmjqMiHblHswMzKgCp2ZMjQKnAP4IDcuK3o
         3S9gWmabjkcC8Id1mxWSSmcD6SnyOb+wXhjICRQmF7wgBBbXL6yYGm98hxfLv3225Gcn
         8yYhI/R2fwjalS0ycUqcaSduZlbn3pY4OOTtAfeRXoilnYF0zYWcoSVGG0hHA0KQJLa4
         r7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347245; x=1738952045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fax9kdvN216AxxcqVrOAKn7muyCEAfP6SvOfhWX/p7o=;
        b=QVhPizhoFlyaPlwbYXsH03A88pXXD0On8kWs7IxHBxjUL9FOwPxP6Kf+KqfFnfUchG
         gMxv3/5WYu7ZnseaUFAVHPb8ADtGJAZk3DSVFiJLa+LS4iL3f3fJlSMlaHzZj1o1hj+k
         ANsTbpB+uQEswjEIkxhJkr1u+2bAm47CTHYOwhnDOwdavERRNqVLlr7HutUAm3ncoaV+
         1j1qyzwxFOAqaS6KHgCqE7g0znpHkf6GKN8VZyX7O7eaV04F/V+/l7gRvQJ4FVBxznX8
         sORaP9YWDNxZWG16RmHEwhbXTMMVyLrWFIR2qW04A0eINFgeHnhIkyjAB11Lv/YbTUeW
         +yYw==
X-Forwarded-Encrypted: i=1; AJvYcCUC2cEvRQgjNnwmq3JnKnkUkAg+xJGXiVajILiAdRNjAg2FFvx+dKAS7csfUYHXE8KArQQcM1fsc9Tf@vger.kernel.org, AJvYcCWNIA70wPShB50j1E2yLlrvus4Rnl4QJdL46mTsGOiNn2dqfz0/S/3dcpCLYyKjAgPplJwx9fRePwfxrXIR@vger.kernel.org
X-Gm-Message-State: AOJu0YwOd42SyTTqBq9LjVPvYRrwiOU4rJYujCURLtnaKe/VGrsXW3ZU
	klbv5l4udo0H/59zgzba1YRLMHrnDFurp/41r3IbSrIP8w5dnKKlfdw1RA==
X-Gm-Gg: ASbGnctTy0iY7q7oHMJiq8+hYDP9YWXY8Mvc6bHsnneAfNWE5RCkmllReNyd4s5onrw
	/lGUR6f9EaqyDzvbOeImO6Z9Tmehv6VQvdwiNms8xSOTe9rt9eC0eoiD8YNL1Ev/f0wS00uq4dI
	VEB8uNhmBBB5jJ9i3fPJQvldbeqCUE5ugj66Ujf2ck3+4a3/2LXdoqGWjymt9GHZDiwA86gjRiF
	A4Cyekzw8C6lRtNoKl+yM+SUg0riijALTjIHCDn5fzjNy051YjhNFsM5XMKFEawjQuQQn3nwPWl
	DBUTisgwTKmKCys5SgOgSbtep2yus96jEFNj+zxz94iF8p2MqW62uRq8cyeKVA==
X-Google-Smtp-Source: AGHT+IHEyHP056TYgbTw+V68Tq9wyIeKZTEItE+XB7N5zT7axePSmO7prEIsz4WvU+JyQgg1KAD9Dg==
X-Received: by 2002:a05:6402:40cd:b0:5dc:8851:fc36 with SMTP id 4fb4d7f45d1cf-5dc8851fcdfmr2753489a12.11.1738347245113;
        Fri, 31 Jan 2025 10:14:05 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:14:04 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:55 +0100
Subject: [PATCH v3 7/7] regulator: bcm590xx: Add support for BCM59054
 regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-7-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=11565;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=pBCfGKkeGMipb9ovlUaMugCq3/Vs7bm2Pri7eB6WPKE=;
 b=TNigMBxjO6GRY0qMmnbCLhBYQahR/GnoNM5ziGDoACApgIU0iBxw4VbI/IewA0TVyGburyPt2
 KG4HEYJhujXCk5xhQqlh4NVlzRdyTZ3tugp27GIcYdKd1bvd4Ufb0/c
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59056 and BCM59054 are very similar in terms of regulators. Add
the register definitions for the BCM59054 and enable support for it in
the driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Adapt to regulator info being moved to tables
---
 drivers/regulator/bcm590xx-regulator.c | 394 ++++++++++++++++++++++++++++++++-
 1 file changed, 392 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index 1cc46b32572beae24890ede9edbf0fb460bf31cd..73219fdb3c92948e8796f5765ba429878d84d69d 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -113,6 +113,13 @@ static const struct regulator_ops bcm590xx_ops_vbus = {
 #define BCM59056_SR_DESC(_name, _name_lower, _ranges)			\
 	BCM590XX_SR_DESC(BCM59056, bcm59056, _name, _name_lower, _ranges)
 
+#define BCM59054_REG_DESC(_name, _name_lower)				\
+	BCM590XX_REG_DESC(BCM59054, _name, _name_lower)
+#define BCM59054_LDO_DESC(_name, _name_lower, _table)			\
+	BCM590XX_LDO_DESC(BCM59054, bcm59054, _name, _name_lower, _table)
+#define BCM59054_SR_DESC(_name, _name_lower, _ranges)			\
+	BCM590XX_SR_DESC(BCM59054, bcm59054, _name, _name_lower, _ranges)
+
 /* BCM59056 data */
 
 /* I2C slave 0 registers */
@@ -473,6 +480,376 @@ static const struct bcm590xx_reg_info bcm59056_regs[BCM59056_NUM_REGS] = {
 	},
 };
 
+/* BCM59054 data */
+
+/* I2C slave 0 registers */
+#define BCM59054_RFLDOPMCTRL1	0x60
+#define BCM59054_CAMLDO1PMCTRL1	0x62
+#define BCM59054_CAMLDO2PMCTRL1	0x64
+#define BCM59054_SIMLDO1PMCTRL1	0x66
+#define BCM59054_SIMLDO2PMCTRL1	0x68
+#define BCM59054_SDLDOPMCTRL1	0x6a
+#define BCM59054_SDXLDOPMCTRL1	0x6c
+#define BCM59054_MMCLDO1PMCTRL1	0x6e
+#define BCM59054_MMCLDO2PMCTRL1	0x70
+#define BCM59054_AUDLDOPMCTRL1	0x72
+#define BCM59054_MICLDOPMCTRL1	0x74
+#define BCM59054_USBLDOPMCTRL1	0x76
+#define BCM59054_VIBLDOPMCTRL1	0x78
+#define BCM59054_IOSR1PMCTRL1	0x7a
+#define BCM59054_IOSR2PMCTRL1	0x7c
+#define BCM59054_CSRPMCTRL1	0x7e
+#define BCM59054_SDSR1PMCTRL1	0x82
+#define BCM59054_SDSR2PMCTRL1	0x86
+#define BCM59054_MMSRPMCTRL1	0x8a
+#define BCM59054_VSRPMCTRL1	0x8e
+#define BCM59054_RFLDOCTRL	0x96
+#define BCM59054_CAMLDO1CTRL	0x97
+#define BCM59054_CAMLDO2CTRL	0x98
+#define BCM59054_SIMLDO1CTRL	0x99
+#define BCM59054_SIMLDO2CTRL	0x9a
+#define BCM59054_SDLDOCTRL	0x9b
+#define BCM59054_SDXLDOCTRL	0x9c
+#define BCM59054_MMCLDO1CTRL	0x9d
+#define BCM59054_MMCLDO2CTRL	0x9e
+#define BCM59054_AUDLDOCTRL	0x9f
+#define BCM59054_MICLDOCTRL	0xa0
+#define BCM59054_USBLDOCTRL	0xa1
+#define BCM59054_VIBLDOCTRL	0xa2
+#define BCM59054_CSRVOUT1	0xc0
+#define BCM59054_IOSR1VOUT1	0xc3
+#define BCM59054_IOSR2VOUT1	0xc6
+#define BCM59054_MMSRVOUT1	0xc9
+#define BCM59054_SDSR1VOUT1	0xcc
+#define BCM59054_SDSR2VOUT1	0xcf
+#define BCM59054_VSRVOUT1	0xd2
+
+/* I2C slave 1 registers */
+#define BCM59054_LVLDO1PMCTRL1	0x16
+#define BCM59054_LVLDO2PMCTRL1	0x18
+#define BCM59054_GPLDO1CTRL	0x1a
+#define BCM59054_GPLDO2CTRL	0x1b
+#define BCM59054_GPLDO3CTRL	0x1c
+#define BCM59054_TCXLDOCTRL	0x1d
+#define BCM59054_LVLDO1CTRL	0x1e
+#define BCM59054_LVLDO2CTRL	0x1f
+#define BCM59054_OTG_CTRL	0x40
+#define BCM59054_GPLDO1PMCTRL1	0x57
+#define BCM59054_GPLDO2PMCTRL1	0x59
+#define BCM59054_GPLDO3PMCTRL1	0x5b
+#define BCM59054_TCXLDOPMCTRL1	0x5d
+
+/*
+ * RFLDO to VSR regulators are
+ * accessed via I2C slave 0
+ */
+
+/* LDO regulator IDs */
+#define BCM59054_REG_RFLDO	0
+#define BCM59054_REG_CAMLDO1	1
+#define BCM59054_REG_CAMLDO2	2
+#define BCM59054_REG_SIMLDO1	3
+#define BCM59054_REG_SIMLDO2	4
+#define BCM59054_REG_SDLDO	5
+#define BCM59054_REG_SDXLDO	6
+#define BCM59054_REG_MMCLDO1	7
+#define BCM59054_REG_MMCLDO2	8
+#define BCM59054_REG_AUDLDO	9
+#define BCM59054_REG_MICLDO	10
+#define BCM59054_REG_USBLDO	11
+#define BCM59054_REG_VIBLDO	12
+
+/* DCDC regulator IDs */
+#define BCM59054_REG_CSR	13
+#define BCM59054_REG_IOSR1	14
+#define BCM59054_REG_IOSR2	15
+#define BCM59054_REG_MMSR	16
+#define BCM59054_REG_SDSR1	17
+#define BCM59054_REG_SDSR2	18
+#define BCM59054_REG_VSR	19
+
+/*
+ * GPLDO1 to VBUS regulators are
+ * accessed via I2C slave 1
+ */
+
+#define BCM59054_REG_GPLDO1	20
+#define BCM59054_REG_GPLDO2	21
+#define BCM59054_REG_GPLDO3	22
+#define BCM59054_REG_TCXLDO	23
+#define BCM59054_REG_LVLDO1	24
+#define BCM59054_REG_LVLDO2	25
+#define BCM59054_REG_VBUS	26
+
+#define BCM59054_NUM_REGS	27
+
+/* LDO group 1: supported voltages in microvolts */
+static const unsigned int bcm59054_ldo_1_table[] = {
+	1200000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* LDO group 2: supported voltages in microvolts */
+static const unsigned int bcm59054_ldo_2_table[] = {
+	3100000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* LDO group 3: supported voltages in microvolts */
+static const unsigned int bcm59054_ldo_3_table[] = {
+	1000000, 1107000, 1143000, 1214000, 1250000,
+	1464000, 1500000, 1786000,
+};
+
+/* DCDC group SR: supported voltages in microvolts */
+static const struct linear_range bcm59054_dcdc_sr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0, 1, 0),
+	REGULATOR_LINEAR_RANGE(860000, 2, 60, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 61, 61, 0),
+	REGULATOR_LINEAR_RANGE(1800000, 62, 62, 0),
+	REGULATOR_LINEAR_RANGE(900000, 63, 63, 0),
+};
+
+/* DCDC group VSR: supported voltages in microvolts */
+static const struct linear_range bcm59054_dcdc_vsr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0, 1, 0),
+	REGULATOR_LINEAR_RANGE(860000, 2, 59, 10000),
+	REGULATOR_LINEAR_RANGE(1700000, 60, 60, 0),
+	REGULATOR_LINEAR_RANGE(1500000, 61, 61, 0),
+	REGULATOR_LINEAR_RANGE(1800000, 62, 62, 0),
+	REGULATOR_LINEAR_RANGE(1600000, 63, 63, 0),
+};
+
+/* DCDC group CSR: supported voltages in microvolts */
+static const struct linear_range bcm59054_dcdc_csr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 1, 100000),
+	REGULATOR_LINEAR_RANGE(860000, 2, 60, 10000),
+	REGULATOR_LINEAR_RANGE(900000, 61, 63, 0),
+};
+
+static const struct bcm590xx_reg_info bcm59054_regs[BCM59054_NUM_REGS] = {
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(RFLDO, rfldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO1, camldo1, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(CAMLDO2, camldo2, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO1, simldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SIMLDO2, simldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDLDO, sdldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(SDXLDO, sdxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO1, mmcldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MMCLDO2, mmcldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(AUDLDO, audldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(MICLDO, micldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(USBLDO, usbldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_LDO_DESC(VIBLDO, vibldo, ldo_2_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(CSR, csr, dcdc_csr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR1, iosr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(IOSR2, iosr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(MMSR, mmsr, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR1, sdsr1, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(SDSR2, sdsr2, dcdc_sr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REG_REGMAP_PRI,
+		.desc = {
+			BCM59054_SR_DESC(VSR, vsr, dcdc_vsr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO1, gpldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO2, gpldo2, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(GPLDO3, gpldo3, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(TCXLDO, tcxldo, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO1, lvldo1, ldo_1_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_LDO_DESC(LVLDO2, lvldo2, ldo_3_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_VBUS,
+		.regmap = BCM590XX_REG_REGMAP_SEC,
+		.desc = {
+			BCM59054_REG_DESC(VBUS, vbus),
+			.ops = &bcm590xx_ops_vbus,
+			.n_voltages = 1,
+			.fixed_uV = 5000000,
+			.enable_reg = BCM59054_OTG_CTRL,
+			.enable_mask = BCM590XX_VBUS_ENABLE,
+		},
+	},
+};
+
 static int bcm590xx_probe(struct platform_device *pdev)
 {
 	struct bcm590xx *bcm590xx = dev_get_drvdata(pdev->dev.parent);
@@ -487,8 +864,21 @@ static int bcm590xx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pmu->mfd = bcm590xx;
-	pmu->n_regulators = BCM59056_NUM_REGS;
-	pmu->regs = bcm59056_regs;
+
+	switch (pmu->mfd->device_type) {
+	case BCM59054_TYPE:
+		pmu->n_regulators = BCM59054_NUM_REGS;
+		pmu->regs = bcm59054_regs;
+		break;
+	case BCM59056_TYPE:
+		pmu->n_regulators = BCM59056_NUM_REGS;
+		pmu->regs = bcm59056_regs;
+		break;
+	default:
+		dev_err(bcm590xx->dev,
+			"unknown device type, could not initialize");
+		return -EINVAL;
+	}
 
 	platform_set_drvdata(pdev, pmu);
 

-- 
2.48.1

