Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055B1FFC53;
	Thu, 15 May 2025 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318608; cv=none; b=K9qJO3F+f94MezQ6d189dBsdiNMScM/cYCQ/pA9ctLaqH3fYq/jPPFfHeAzMh94A1dHW2xrfnwBktC4WtYm6Zk1OglUnsKKQo2z2QKhXuI6B48/U+PTB3s+ua2WhL6kTWha4RxQoHbFYJAzybHSFlX1EkStTGtoQq45paSdXgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318608; c=relaxed/simple;
	bh=GgIqAIOhSA1tBQqg8I+BSP41at2zgMr2ND8NIBrW5zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppMFgA7QlU3OlO01RF6hgw7mcjqlNPfb+4WSSxjsoLSsZjjiHEPRhDTVMHHucaQp5n0GSEX60ObVVA1Bp3Bt6PJb4Yvp6pPRGoLerH3g42BxoyNJMs3RgxcTzWA2/60SyuH6AVTLIaw5TL7faqTh6SLyOi+PJGBMiLzFAn7dzYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOsrbOU8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOsrbOU8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acb5ec407b1so154846566b.1;
        Thu, 15 May 2025 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318603; x=1747923403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGbbzu12oYfvm9H35y5KVOIUrBj8pzeyrKVGNLlXznw=;
        b=EOsrbOU8LVwuU0vE7MVRCDuH3mP0EyXKbj31VvDwpV9vHfa2N15eehyQU251HsIEJy
         An8J5Ku9QKq6Q2+EP2lInGpskbBvyGLkP0fEzTUFawLDqfR0lPtU9+ZhjAdbOAENkToP
         T+plZSkyZA1/5mnknhxvcsviTDb9vDuPvqgWmPvPgUGCg3xlFw47DzuApQcLuVlS04u7
         UUo7KsmPtmXj1hmjnz3k21rCYH5ogk+eax9ZpMPRwkOXuPcI8aEQxWi/SNOHJL8Uu1Jd
         IRRA+WFaZmOXWrLxYc7yIyU2nRUxh92f2nhNJtibe9g+qEvtusY74YSiP3AFsUovyLLV
         xI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318603; x=1747923403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGbbzu12oYfvm9H35y5KVOIUrBj8pzeyrKVGNLlXznw=;
        b=BNK9Q4/VqwDSooahR/FLcYogGwqmVULG6A5ODUiNkpp8ir2ZyCAHdH2UBd3y1jefZO
         XItPvf/TC69uXUJkFN10uI4vFBkU405GGoXSS3T0KWeqXJkqaeXZPK8YNGP73S0LvvrE
         ZnFzzAwMx+YQBvC/JQOFpn6sT4aN9ISPb+/2mJHDM5GhCmbptRZ+V40f4c90sdKxV/kC
         lQ6H7Pr3lm21ewlkx0bL3evLRXZbPylowLTtOQoFJ/hZlJpg4CNl7fMTvwXdVfSeUYLA
         uR6ldhH9hDnw5c9y5+dABKAAx875a9/3Ssi5QB5/KwMb6lEV8vfrS9Llfj5DrYR6mxWA
         lMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBfXWxg4aQoAFECbCGh9wC445jILbWKOJ6S9awxbkx8qwcErEc/VPftePKdIEpkw79VT0Syfvdb0x5UivH@vger.kernel.org, AJvYcCVIRFxcm1qrTBCK8+9Cv2Ce5+wuINvP90FOSbhUr+j+HGtklN5soJmU2j8jTUZUmA99A6xambmh3Ufn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqw0H+wW6PvMsMFuIHL/h+QqXKauHTCfkJzfgIv/L0qFqjtB+O
	Wsjbb4BdHHeO+nQk7PGBTIMypk5bt7GR6EJvdlUi0AHlCZt4f33H5PVNvw==
X-Gm-Gg: ASbGncsm0F/qNPFwt9be6clQVoeQRtTH4SGukCoQZagtHNxlPoxOT7ss4qDMLAfhiCU
	9PskY8SoD4VmXZGbzxr0LIm75HMcJLnwVzMXXStxD/pAMgjG/Hmt3Wf/bwpVivVaRv4Qcemi6T+
	rq7jaVLhrDFfU/4K9YnIBudzTj/pbVKF1f33VEgknMJSnugsoPX8KTBpFW8LY3kArQImWjrEEDC
	08e6lNWU4Kh5bH2aezp3bPQCD8A+JBepiUT2QbKj7eK2PtJfKGiWsUMz12Iih24m6/5w6MFXD9h
	aL275JQgCliHvs+1S+XpSIUZLwsPrMjcboH2o7sLVLm3GvJKCEULN4xT2ti/VmFZ1nszFLAZA/6
	WIiQB60oHkDKQRBRaFUC57Q==
X-Google-Smtp-Source: AGHT+IFmHKERBnvqZBlFlG+Xgxsax1E0yLnE4tnSe6XLELlFNUI7gZBCRI89XUAzDT0t3OqSs8/K6w==
X-Received: by 2002:a17:907:c205:b0:ad2:50d1:eb56 with SMTP id a640c23a62f3a-ad515ded462mr225280866b.16.1747318603089;
        Thu, 15 May 2025 07:16:43 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:42 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:33 +0200
Subject: [PATCH v9 6/8] regulator: bcm590xx: Store regulator descriptions
 in table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-6-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=16626;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=GgIqAIOhSA1tBQqg8I+BSP41at2zgMr2ND8NIBrW5zM=;
 b=OGdt8iqvUiZb8j4nOqnfSeiokAYIgNku0AyQ+3UlljJoGWcypI1rb6dqPw5uxmlFxx8oOeV5O
 o+Z9uqGvptFC0YjChN60ATdCYxP35Q+5Sdw0vA+jc1B0/NEWRGi3bix
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Instead of filling in the regulator description programatically,
store the data in a struct. This will make it a bit nicer to
introduce support for other BCM590xx chips besides the BCM59056.

To do this, add a new struct type, bcm590xx_reg_data, to store
all of the necessary information. Drop the old IS_LDO, IS_GPLDO...
macros in favor of the "type" field in this struct. Adapt the
old bcm590xx_reg struct to the new types.

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
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

