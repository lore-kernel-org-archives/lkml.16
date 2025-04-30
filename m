Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1020F085;
	Wed, 30 Apr 2025 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996850; cv=none; b=W/h6mIIOBqtnxORuiTpdA6BEJ6gQ+pHcTx1uhklg2f9ZM4VRt6hqoo3zrzSPJieJaFO+G0aMbA3s2XY9JliddZ0WfsAEgLHMOCe4/k+MvehKUWGwZOsb0lY+OKXoXk4FD4VbgosNYU5i5bBzNt/erbE9uEddRdlYAWQ3cAoiReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996850; c=relaxed/simple;
	bh=/Q91RirYuDa4CyGsT2dDmowKYblY20IPto+sIcETrxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RY8pG9sd4sGwagXkpDTlYPuIvMUlx/Sw3/Cf2gxHZbwSzP2wiYpnXgHOGOW1Xc9rrvJGXwapa69B6HxFNr50s5qr1JDwRN1SaEpk7ndyDlgxNp+OIfkysSUs8dtWLou/LLmJ43y18tTJJJDYPzqjkIJSqxSYjFU+GnuyERyjwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EH1Pw/D/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EH1Pw/D/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso10834733a12.2;
        Wed, 30 Apr 2025 00:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996846; x=1746601646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0K6UVLuw68YjijDGDb9esqM0Bo7S4QeSoh8RnRa+xc=;
        b=EH1Pw/D/57Jb2Hn4YoAb44H7DUSihbC1lQv807Yx3wmCZ4hhwtBNxpcCz0OdACRx+/
         3wKiLoG+8TxjhU42eY3SzeyNU2nnH5kYEhhPBQm0y/7n1uxH0+dhekuTqFzBV8+0fkCw
         ysx1Gz7g9OhV2W+e2NCxHtOBHg1s3dcTjDq7w+tRME35m1cQCXIQzflIHiD7LV8CMnIW
         ZgJ73KTvuagcT3tdpFBdirczVV9pvoyTvdo70ujGL7PUIJGXtIlM9k+lxYBydvttwRq0
         bPcBQfJEQrOOrKCMDIgM72LdFoFBM/vyEDZWN7NQr3lYsNDeks2pFl+XW3p3fv2FV9nE
         Ry1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996846; x=1746601646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0K6UVLuw68YjijDGDb9esqM0Bo7S4QeSoh8RnRa+xc=;
        b=p0IpW12E/9a9P261oIGZfU+MH8AsJvEcgtX01pCpprVvITwl0Z6ZFbgzQivr7SaC/e
         hw6U3rBVHCOTd6H+Se+2AweN5lUntzmc4ZoX1yMp0P+kZXYa/yqY+CkUG9PVD1yW22EQ
         itBL8dxv8uVlW9IjlSqvhbPxdJfaxRGKHODTdWorIJtSNoOCLAkPI3TaqkwWj+fBxT2T
         WklNkAibh/m9j2vh3FMNZB8KzDfiAEidnPQV+Av6+u/Zk2zMRbtGQWqBnp+CCYIP7bBV
         uvo+QMp+o3rk6iXtaqE20jyCMZdR+6Xw11R8i0d1DY4IYxzbkeaO7L3tpfB2Dc9wXZQ2
         U55Q==
X-Forwarded-Encrypted: i=1; AJvYcCWB5syb0Vu9We668F+X2OIXj8kMHsdmxyJfnoLTIQ8jfTjsEVIBjxVP4eQ6g07egtZR7/QHEWZe+BdSzNoA@vger.kernel.org, AJvYcCX4ClToRDMBib9UmpWju189RCUrouBxksBTA1SpH4ub7EAMc2wT9qOF3SO48nTFi+S9fONhvUqCpdT8@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKq22NS3LZHEEPIfMXNf6WqRWSekhdjHpynfCH0+JQiBrxZvP
	T7vEUDProc0woBnSRNGdJqrf8FvCaFJJctIRz3uD4l4shgZUFDhI
X-Gm-Gg: ASbGncu1zEwjTd19gQoBdJkhhNRp/+AJHdCF+OBLpD0MeG+jICoVD1bnRFPoHjX5Qac
	RpSKtYMkU0idhC7A0Z8Ckr5IW8wiMFI5MLTfpoNQiDztIv8H409Io/ws4FTPzyft9/l4HrjD0PB
	W+eq6d73Jcejx9RoNZyU7Vxmw/6mAbU50TOQ5mkXh/feKdF8tX9wnb7ONYS1z8RkQ3IAFAtcmpu
	gAQKKIyX2NWhwUUvTnhOLhTazV43Nf8R5Nq74hk7F5swLzVLS2Wq0G/PSMb54Fn4e63x9nQr6Q9
	QcZb2U75PsTR2sk0KpCtB+kz8FcXMbc/s4mhlgzNPsY8XSTDBS2ZHc3Zeb/iRVJm5ZsRNGl3Hbg
	R+CAwOV0ToZAwIG5wnOXUOw==
X-Google-Smtp-Source: AGHT+IFoUHVlIIaOjOsnbrvYC50AFoNPx+nSXJNxxI2Dyv0Ch0Y8S8mvP4fiX7q7arbQLL6kdSdaNA==
X-Received: by 2002:a05:6402:3549:b0:5ed:1d8d:c6d8 with SMTP id 4fb4d7f45d1cf-5f89ae5b4f5mr1454961a12.9.1745996846347;
        Wed, 30 Apr 2025 00:07:26 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:26 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:11 +0200
Subject: [PATCH v8 7/9] regulator: bcm590xx: Store regulator descriptions
 in table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-7-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=16568;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=/Q91RirYuDa4CyGsT2dDmowKYblY20IPto+sIcETrxQ=;
 b=ouui3SM3dIBczGPZWL6ZJPBdYCq3WxASLe3Y4BAtLyP3bZrrzSEMaXoZ6Od/zggCDY/qL+ANO
 R8pkw1hqqeVBEAlMCc7PqJNIUJy4N/QQ5iAt5w9BtlHh5LBV6r3fUwv
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Instead of filling in the regulator description programatically,
store the data in a struct. This will make it a bit nicer to
introduce support for other BCM590xx chips besides the BCM59056.

To do this, add a new struct type, bcm590xx_reg_data, to store
all of the necessary information. Drop the old IS_LDO, IS_GPLDO...
macros in favor of the "type" field in this struct. Adapt the
old bcm590xx_reg struct to the new types.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Adapt to changes in MFD header

Changes in v5:
- Move the bcm590xx_regmap_type enum to the bcm590xx.h header
- Rename bcm590xx_reg_info to bcm590xx_reg_data

Changes in v4:
- Replace incorrect return in regmap selection error handling
- Use switch statement for regmap selection

Changes in v3:
- Added this commit
---
 drivers/regulator/bcm590xx-regulator.c | 473 ++++++++++++++++++++++-----------
 include/linux/mfd/bcm590xx.h           |   6 +
 2 files changed, 322 insertions(+), 157 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index a17311fa30e4d48c0a4925778d7bed486ac7a982..c2427ea166626bdc1eb7cfb99997d95e5125ed91 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -20,6 +20,18 @@
 
 /* I2C slave 0 registers */
 #define BCM590XX_RFLDOPMCTRL1	0x60
+#define BCM590XX_CAMLDO1PMCTRL1	0x62
+#define BCM590XX_CAMLDO2PMCTRL1	0x64
+#define BCM590XX_SIMLDO1PMCTRL1	0x66
+#define BCM590XX_SIMLDO2PMCTRL1	0x68
+#define BCM590XX_SDLDOPMCTRL1	0x6a
+#define BCM590XX_SDXLDOPMCTRL1	0x6c
+#define BCM590XX_MMCLDO1PMCTRL1	0x6e
+#define BCM590XX_MMCLDO2PMCTRL1	0x70
+#define BCM590XX_AUDLDOPMCTRL1	0x72
+#define BCM590XX_MICLDOPMCTRL1	0x74
+#define BCM590XX_USBLDOPMCTRL1	0x76
+#define BCM590XX_VIBLDOPMCTRL1	0x78
 #define BCM590XX_IOSR1PMCTRL1	0x7a
 #define BCM590XX_IOSR2PMCTRL1	0x7c
 #define BCM590XX_CSRPMCTRL1	0x7e
@@ -28,7 +40,25 @@
 #define BCM590XX_MSRPMCTRL1	0x8a
 #define BCM590XX_VSRPMCTRL1	0x8e
 #define BCM590XX_RFLDOCTRL	0x96
+#define BCM590XX_CAMLDO1CTRL	0x97
+#define BCM590XX_CAMLDO2CTRL	0x98
+#define BCM590XX_SIMLDO1CTRL	0x99
+#define BCM590XX_SIMLDO2CTRL	0x9a
+#define BCM590XX_SDLDOCTRL	0x9b
+#define BCM590XX_SDXLDOCTRL	0x9c
+#define BCM590XX_MMCLDO1CTRL	0x9d
+#define BCM590XX_MMCLDO2CTRL	0x9e
+#define BCM590XX_AUDLDOCTRL	0x9f
+#define BCM590XX_MICLDOCTRL	0xa0
+#define BCM590XX_USBLDOCTRL	0xa1
+#define BCM590XX_VIBLDOCTRL	0xa2
 #define BCM590XX_CSRVOUT1	0xc0
+#define BCM590XX_IOSR1VOUT1	0xc3
+#define BCM590XX_IOSR2VOUT1	0xc6
+#define BCM590XX_MSRVOUT1	0xc9
+#define BCM590XX_SDSR1VOUT1	0xcc
+#define BCM590XX_SDSR2VOUT1	0xcf
+#define BCM590XX_VSRVOUT1	0xd2
 
 /* I2C slave 1 registers */
 #define BCM590XX_GPLDO5PMCTRL1	0x16
@@ -94,11 +124,6 @@
 
 #define BCM590XX_NUM_REGS	27
 
-#define BCM590XX_REG_IS_LDO(n)	(n < BCM590XX_REG_CSR)
-#define BCM590XX_REG_IS_GPLDO(n) \
-	((n > BCM590XX_REG_VSR) && (n < BCM590XX_REG_VBUS))
-#define BCM590XX_REG_IS_VBUS(n)	(n == BCM590XX_REG_VBUS)
-
 /* LDO group A: supported voltages in microvolts */
 static const unsigned int ldo_a_table[] = {
 	1200000, 1800000, 2500000, 2700000, 2800000,
@@ -111,10 +136,6 @@ static const unsigned int ldo_c_table[] = {
 	2900000, 3000000, 3300000,
 };
 
-static const unsigned int ldo_vbus[] = {
-	5000000,
-};
-
 /* DCDC group CSR: supported voltages in microvolts */
 static const struct linear_range dcdc_csr_ranges[] = {
 	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
@@ -137,115 +158,25 @@ static const struct linear_range dcdc_sdsr1_ranges[] = {
 	REGULATOR_LINEAR_RANGE(900000, 52, 63, 0),
 };
 
-struct bcm590xx_info {
-	const char *name;
-	const char *vin_name;
-	u8 n_voltages;
-	const unsigned int *volt_table;
-	u8 n_linear_ranges;
-	const struct linear_range *linear_ranges;
+enum bcm590xx_reg_type {
+	BCM590XX_REG_TYPE_LDO,
+	BCM590XX_REG_TYPE_GPLDO,
+	BCM590XX_REG_TYPE_SR,
+	BCM590XX_REG_TYPE_VBUS
 };
 
-#define BCM590XX_REG_TABLE(_name, _table) \
-	{ \
-		.name = #_name, \
-		.n_voltages = ARRAY_SIZE(_table), \
-		.volt_table = _table, \
-	}
-
-#define BCM590XX_REG_RANGES(_name, _ranges) \
-	{ \
-		.name = #_name, \
-		.n_voltages = 64, \
-		.n_linear_ranges = ARRAY_SIZE(_ranges), \
-		.linear_ranges = _ranges, \
-	}
-
-static struct bcm590xx_info bcm590xx_regs[] = {
-	BCM590XX_REG_TABLE(rfldo, ldo_a_table),
-	BCM590XX_REG_TABLE(camldo1, ldo_c_table),
-	BCM590XX_REG_TABLE(camldo2, ldo_c_table),
-	BCM590XX_REG_TABLE(simldo1, ldo_a_table),
-	BCM590XX_REG_TABLE(simldo2, ldo_a_table),
-	BCM590XX_REG_TABLE(sdldo, ldo_c_table),
-	BCM590XX_REG_TABLE(sdxldo, ldo_a_table),
-	BCM590XX_REG_TABLE(mmcldo1, ldo_a_table),
-	BCM590XX_REG_TABLE(mmcldo2, ldo_a_table),
-	BCM590XX_REG_TABLE(audldo, ldo_a_table),
-	BCM590XX_REG_TABLE(micldo, ldo_a_table),
-	BCM590XX_REG_TABLE(usbldo, ldo_a_table),
-	BCM590XX_REG_TABLE(vibldo, ldo_c_table),
-	BCM590XX_REG_RANGES(csr, dcdc_csr_ranges),
-	BCM590XX_REG_RANGES(iosr1, dcdc_iosr1_ranges),
-	BCM590XX_REG_RANGES(iosr2, dcdc_iosr1_ranges),
-	BCM590XX_REG_RANGES(msr, dcdc_iosr1_ranges),
-	BCM590XX_REG_RANGES(sdsr1, dcdc_sdsr1_ranges),
-	BCM590XX_REG_RANGES(sdsr2, dcdc_iosr1_ranges),
-	BCM590XX_REG_RANGES(vsr, dcdc_iosr1_ranges),
-	BCM590XX_REG_TABLE(gpldo1, ldo_a_table),
-	BCM590XX_REG_TABLE(gpldo2, ldo_a_table),
-	BCM590XX_REG_TABLE(gpldo3, ldo_a_table),
-	BCM590XX_REG_TABLE(gpldo4, ldo_a_table),
-	BCM590XX_REG_TABLE(gpldo5, ldo_a_table),
-	BCM590XX_REG_TABLE(gpldo6, ldo_a_table),
-	BCM590XX_REG_TABLE(vbus, ldo_vbus),
+struct bcm590xx_reg_data {
+	enum bcm590xx_reg_type type;
+	enum bcm590xx_regmap_type regmap;
+	const struct regulator_desc desc;
 };
 
 struct bcm590xx_reg {
-	struct regulator_desc *desc;
 	struct bcm590xx *mfd;
+	unsigned int n_regulators;
+	const struct bcm590xx_reg_data *regs;
 };
 
-static int bcm590xx_get_vsel_register(int id)
-{
-	if (BCM590XX_REG_IS_LDO(id))
-		return BCM590XX_RFLDOCTRL + id;
-	else if (BCM590XX_REG_IS_GPLDO(id))
-		return BCM590XX_GPLDO1CTRL + id;
-	else
-		return BCM590XX_CSRVOUT1 + (id - BCM590XX_REG_CSR) * 3;
-}
-
-static int bcm590xx_get_enable_register(int id)
-{
-	int reg = 0;
-
-	if (BCM590XX_REG_IS_LDO(id))
-		reg = BCM590XX_RFLDOPMCTRL1 + id * 2;
-	else if (BCM590XX_REG_IS_GPLDO(id))
-		reg = BCM590XX_GPLDO1PMCTRL1 + id * 2;
-	else
-		switch (id) {
-		case BCM590XX_REG_CSR:
-			reg = BCM590XX_CSRPMCTRL1;
-			break;
-		case BCM590XX_REG_IOSR1:
-			reg = BCM590XX_IOSR1PMCTRL1;
-			break;
-		case BCM590XX_REG_IOSR2:
-			reg = BCM590XX_IOSR2PMCTRL1;
-			break;
-		case BCM590XX_REG_MSR:
-			reg = BCM590XX_MSRPMCTRL1;
-			break;
-		case BCM590XX_REG_SDSR1:
-			reg = BCM590XX_SDSR1PMCTRL1;
-			break;
-		case BCM590XX_REG_SDSR2:
-			reg = BCM590XX_SDSR2PMCTRL1;
-			break;
-		case BCM590XX_REG_VSR:
-			reg = BCM590XX_VSRPMCTRL1;
-			break;
-		case BCM590XX_REG_VBUS:
-			reg = BCM590XX_OTG_CTRL;
-			break;
-		}
-
-
-	return reg;
-}
-
 static const struct regulator_ops bcm590xx_ops_ldo = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
@@ -272,73 +203,301 @@ static const struct regulator_ops bcm590xx_ops_vbus = {
 	.disable		= regulator_disable_regmap,
 };
 
+#define BCM590XX_REG_DESC(_name, _name_lower)				\
+	.id = BCM590XX_REG_##_name,					\
+	.name = #_name_lower,						\
+	.of_match = of_match_ptr(#_name_lower),				\
+	.regulators_node = of_match_ptr("regulators"),			\
+	.type = REGULATOR_VOLTAGE,					\
+	.owner = THIS_MODULE						\
+
+#define BCM590XX_LDO_DESC(_name, _name_lower, _table)			\
+	BCM590XX_REG_DESC(_name, _name_lower),				\
+	.ops = &bcm590xx_ops_ldo,					\
+	.n_voltages = ARRAY_SIZE(_table),				\
+	.volt_table = _table,						\
+	.vsel_reg = BCM590XX_##_name##CTRL,				\
+	.vsel_mask = BCM590XX_LDO_VSEL_MASK,				\
+	.enable_reg = BCM590XX_##_name##PMCTRL1,			\
+	.enable_mask = BCM590XX_REG_ENABLE,				\
+	.enable_is_inverted = true
+
+#define BCM590XX_SR_DESC(_name, _name_lower, _ranges)			\
+	BCM590XX_REG_DESC(_name, _name_lower),				\
+	.ops = &bcm590xx_ops_dcdc,					\
+	.n_voltages = 64,						\
+	.linear_ranges = _ranges,					\
+	.n_linear_ranges = ARRAY_SIZE(_ranges),				\
+	.vsel_reg = BCM590XX_##_name##VOUT1,				\
+	.vsel_mask = BCM590XX_SR_VSEL_MASK,				\
+	.enable_reg = BCM590XX_##_name##PMCTRL1,			\
+	.enable_mask = BCM590XX_REG_ENABLE,				\
+	.enable_is_inverted = true
+
+static const struct bcm590xx_reg_data bcm590xx_regs[BCM590XX_NUM_REGS] = {
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(RFLDO, rfldo, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(CAMLDO1, camldo1, ldo_c_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(CAMLDO2, camldo2, ldo_c_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(SIMLDO1, simldo1, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(SIMLDO2, simldo2, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(SDLDO, sdldo, ldo_c_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(SDXLDO, sdxldo, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(MMCLDO1, mmcldo1, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(MMCLDO2, mmcldo2, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(AUDLDO, audldo, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(MICLDO, micldo, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(USBLDO, usbldo, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_LDO,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_LDO_DESC(VIBLDO, vibldo, ldo_c_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(CSR, csr, dcdc_csr_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(IOSR1, iosr1, dcdc_iosr1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(IOSR2, iosr2, dcdc_iosr1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(MSR, msr, dcdc_iosr1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(SDSR1, sdsr1, dcdc_sdsr1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(SDSR2, sdsr2, dcdc_iosr1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_SR,
+		.regmap = BCM590XX_REGMAP_PRI,
+		.desc = {
+			BCM590XX_SR_DESC(VSR, vsr, dcdc_iosr1_ranges),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_LDO_DESC(GPLDO1, gpldo1, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_LDO_DESC(GPLDO2, gpldo2, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_LDO_DESC(GPLDO3, gpldo3, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_LDO_DESC(GPLDO4, gpldo4, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_LDO_DESC(GPLDO5, gpldo5, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_GPLDO,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_LDO_DESC(GPLDO6, gpldo6, ldo_a_table),
+		},
+	},
+
+	{
+		.type = BCM590XX_REG_TYPE_VBUS,
+		.regmap = BCM590XX_REGMAP_SEC,
+		.desc = {
+			BCM590XX_REG_DESC(VBUS, vbus),
+			.ops = &bcm590xx_ops_vbus,
+			.n_voltages = 1,
+			.fixed_uV = 5000000,
+			.enable_reg = BCM590XX_OTG_CTRL,
+			.enable_mask = BCM590XX_VBUS_ENABLE,
+		},
+	},
+};
+
 static int bcm590xx_probe(struct platform_device *pdev)
 {
 	struct bcm590xx *bcm590xx = dev_get_drvdata(pdev->dev.parent);
 	struct bcm590xx_reg *pmu;
+	const struct bcm590xx_reg_data *info;
 	struct regulator_config config = { };
-	struct bcm590xx_info *info;
 	struct regulator_dev *rdev;
-	int i;
+	unsigned int i;
 
 	pmu = devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
 	if (!pmu)
 		return -ENOMEM;
 
 	pmu->mfd = bcm590xx;
+	pmu->n_regulators = BCM590XX_NUM_REGS;
+	pmu->regs = bcm590xx_regs;
 
 	platform_set_drvdata(pdev, pmu);
 
-	pmu->desc = devm_kcalloc(&pdev->dev,
-				 BCM590XX_NUM_REGS,
-				 sizeof(struct regulator_desc),
-				 GFP_KERNEL);
-	if (!pmu->desc)
-		return -ENOMEM;
-
-	info = bcm590xx_regs;
-
-	for (i = 0; i < BCM590XX_NUM_REGS; i++, info++) {
-		/* Register the regulators */
-		pmu->desc[i].name = info->name;
-		pmu->desc[i].of_match = of_match_ptr(info->name);
-		pmu->desc[i].regulators_node = of_match_ptr("regulators");
-		pmu->desc[i].supply_name = info->vin_name;
-		pmu->desc[i].id = i;
-		pmu->desc[i].volt_table = info->volt_table;
-		pmu->desc[i].n_voltages = info->n_voltages;
-		pmu->desc[i].linear_ranges = info->linear_ranges;
-		pmu->desc[i].n_linear_ranges = info->n_linear_ranges;
-
-		if ((BCM590XX_REG_IS_LDO(i)) || (BCM590XX_REG_IS_GPLDO(i))) {
-			pmu->desc[i].ops = &bcm590xx_ops_ldo;
-			pmu->desc[i].vsel_mask = BCM590XX_LDO_VSEL_MASK;
-		} else if (BCM590XX_REG_IS_VBUS(i))
-			pmu->desc[i].ops = &bcm590xx_ops_vbus;
-		else {
-			pmu->desc[i].ops = &bcm590xx_ops_dcdc;
-			pmu->desc[i].vsel_mask = BCM590XX_SR_VSEL_MASK;
-		}
-
-		if (BCM590XX_REG_IS_VBUS(i))
-			pmu->desc[i].enable_mask = BCM590XX_VBUS_ENABLE;
-		else {
-			pmu->desc[i].vsel_reg = bcm590xx_get_vsel_register(i);
-			pmu->desc[i].enable_is_inverted = true;
-			pmu->desc[i].enable_mask = BCM590XX_REG_ENABLE;
-		}
-		pmu->desc[i].enable_reg = bcm590xx_get_enable_register(i);
-		pmu->desc[i].type = REGULATOR_VOLTAGE;
-		pmu->desc[i].owner = THIS_MODULE;
+	/* Register the regulators */
+	for (i = 0; i < pmu->n_regulators; i++) {
+		info = &pmu->regs[i];
 
 		config.dev = bcm590xx->dev;
 		config.driver_data = pmu;
-		if (BCM590XX_REG_IS_GPLDO(i) || BCM590XX_REG_IS_VBUS(i))
-			config.regmap = bcm590xx->regmap_sec;
-		else
+
+		switch (info->regmap) {
+		case BCM590XX_REGMAP_PRI:
 			config.regmap = bcm590xx->regmap_pri;
+			break;
+		case BCM590XX_REGMAP_SEC:
+			config.regmap = bcm590xx->regmap_sec;
+			break;
+		default:
+			dev_err(bcm590xx->dev,
+				"invalid regmap for %s regulator; this is a driver bug\n",
+				pdev->name);
+			return -EINVAL;
+		}
 
-		rdev = devm_regulator_register(&pdev->dev, &pmu->desc[i],
+		rdev = devm_regulator_register(&pdev->dev, &info->desc,
 					       &config);
 		if (IS_ERR(rdev))
 			return dev_err_probe(bcm590xx->dev, PTR_ERR(rdev),
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index fbc458e94bef923ca1b69afe2cac944adf6fedf8..5a5783abd47b9a6bb6f9bb3a8cafddbd01aa7fcc 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -27,6 +27,12 @@
 #define BCM59056_REV_DIGITAL_B0		2
 #define BCM59056_REV_ANALOG_B0		2
 
+/* regmap types */
+enum bcm590xx_regmap_type {
+	BCM590XX_REGMAP_PRI,
+	BCM590XX_REGMAP_SEC,
+};
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0

-- 
2.49.0

