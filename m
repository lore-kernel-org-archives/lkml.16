Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2991F37BB;
	Fri, 31 Jan 2025 18:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347247; cv=none; b=DzwjQ9EKcjC/7woMJOBdMSXI2wa655Ahahix6PRi9nc8ZFH8hTI3zrSLghtuZd321dYAb6ZtCUe00vx5v5YDeswYV4FFfLFegnU3NDeZlGu5bVULPepkcTlW2X1tLF2XMwY7V1OZyCJcXlbb6fryD2+PSnKh6LJPwGPF2F/g+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347247; c=relaxed/simple;
	bh=bF7UqowP0EnW+aVGNb3fd2Srae1RJp+v4FuJZ/DIZ6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNIqSzSwSXgPAq1WjhDuAq5cUkl9QXPEvYYFk1ciV1bpR6xBywgutXGEbRAwRNnhFl+Rx6juG97fN6ti62vxIjumRsSPXvx9zDiC/KDmGJfR08K7Sp/Xw+m8fJdppU9wYGZN/aECn/XNy2Nm6YEvwnv5Sp69zmvYQQ8PBwsk1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuGEHlJc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuGEHlJc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so3416261a12.3;
        Fri, 31 Jan 2025 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347243; x=1738952043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghflrqq/EporWqaPzkgt/ShlMxv0aJQrsUmK5HuVBms=;
        b=kuGEHlJcKAS/Y3mHfnuCki/YydbYbpb26EpZaRSOjNJ1E2NSoSya5phX89DLvZwixz
         UElky/9Nk5XYXgFU0gGvsCbrW88lgsihJ7nrO0Bvg+fvcRmpiMsVExJeUTyvPNkSpTe8
         WfNNm1ySylIVLqOgEu2xJ9sWHdGPDBlTgIyTAqIQ1XUx7KJi8D8gNh8+IIQfAR3TVete
         aXJEqvenNbiWfvWSmfqppOeU3721hBJWoVvIgsMe6CN/xPLiRnzKKg1PhVX3mpS6uRD8
         CB2EhcjOo4MSVt36C1SJ82wXm/pbNelW3uT21scZb/3PnX719Bcabah3Z9b5DnqwvWLg
         xbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347243; x=1738952043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghflrqq/EporWqaPzkgt/ShlMxv0aJQrsUmK5HuVBms=;
        b=hUyZoumvkS0V4VcN/sZVq6h2PiIVqxqgLe6mykwcmrbm1yduR6FBvF6UA26z2ViVpi
         rcHu5I3in6AupJv0E+qlzgcDRFU3URN3QbRP7+lbaMSWBrYt4CZfJxk/Xvst86p2E6bH
         fIkUHzB6YQ/y3ooMhhVWclst89ZsEf3Oyl9J5vJSC7o2azsH3F/r4mVUSlCPYZiatGB5
         wCf3QwlAxBgBjr5MJx0crmn427pMx7ToiCegSgiTgM//DPqsi9SJhDLSgA5wUp32VJPt
         yTCGriDdOqM3kH4Y29NTfUJ0fAAd5DchC4yfzXv24ydKgSyaQJGA6hlSYDrgmp/vk96n
         WD2A==
X-Forwarded-Encrypted: i=1; AJvYcCWKKzPbFNtiK032vGeQPfSr8d5YkrOMitezNpQdv/TDFavyJ4dib8a03XKGHwVvnmlNbDBRY+4Pchlv@vger.kernel.org, AJvYcCX947y6Fawq9ippaUuJXbnXz1RsxOtwyk7j6Vx7GJfoYssZRMT6Rg2V0AX8amR0OIm4L9HyNrBnSxXi+LsL@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtMhqQzymDBwtUI2cVXRMR4HgISo/xt52y0/U8tPGCYl9xwSk
	DkeDlbie/PzW8QsoPfcuswgKJh7dkxo7760IGrGN8ST5dm1FG8puexWZ5Q==
X-Gm-Gg: ASbGncvRSPAhDQUA0ddpbpCCn3K+Rw0PGTy2hDzS2tZzaqMkISlDmCjBq3IpHjcXd3W
	87AR0dOiBblqV10FFTFEy5aTop1CFArQ48aaKO8hgEKeKFRZhWrrcgs1c0IoLuFJ3U1uOdKvivq
	OSm1IUbtr0lFn3lvgVi4ndZpRB2Qw6g7nKvlmyqus8ZK2MMzww7awgbhcqzBX7rUgdeVijlb099
	U1taYZzQnc7Woqf/4SUkZzN5O/2gDl3H6xn3/09orfuC0FSy/Vzd0wuorr3H5oetV92jDwYwl8i
	7pKV2NseWp3eLCE3leY9t0H+ZpO4aAI1f5XqZ8YTywg5qRDaxrI2TfzBbQGSNw==
X-Google-Smtp-Source: AGHT+IHA5Cycvs5RwSZw4U+9iaDlJ7hV5OZlUPGeJPVKhwSsN1ZGda8M754K+3d3BE8JClrD2t/b2A==
X-Received: by 2002:a05:6402:40cd:b0:5dc:8851:fc36 with SMTP id 4fb4d7f45d1cf-5dc8851fcdfmr2753276a12.11.1738347243272;
        Fri, 31 Jan 2025 10:14:03 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:14:02 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:54 +0100
Subject: [PATCH v3 6/7] regulator: bcm590xx: Rename BCM59056-specific data
 as such
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-6-bbac52a84787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=21159;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=bF7UqowP0EnW+aVGNb3fd2Srae1RJp+v4FuJZ/DIZ6E=;
 b=Ul4mNowO/S5anDPDsTamo/muVzHfN9yiQykgPO0serjN8yujKQA8Ce1m57k914/dvPo4aDObL
 tX4sXdazR5jDRo5CmNrx8mGnP1abX2KS94Br4kQOrBIswMyGtnkbTeL
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Previously, the driver used the BCM590XX prefix for register data
specific to the BCM59056. As we will be introducing other regulators
to this driver as well, make the BCM59056-specific values use the
BCM59056 prefix.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Added this commit
---
 drivers/regulator/bcm590xx-regulator.c | 369 +++++++++++++++++----------------
 1 file changed, 190 insertions(+), 179 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index 6548653a6fb7207a5aa8e006a005553bfb7b1d69..1cc46b32572beae24890ede9edbf0fb460bf31cd 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -18,146 +18,13 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/slab.h>
 
-/* I2C slave 0 registers */
-#define BCM590XX_RFLDOPMCTRL1	0x60
-#define BCM590XX_CAMLDO1PMCTRL1	0x62
-#define BCM590XX_CAMLDO2PMCTRL1	0x64
-#define BCM590XX_SIMLDO1PMCTRL1	0x66
-#define BCM590XX_SIMLDO2PMCTRL1	0x68
-#define BCM590XX_SDLDOPMCTRL1	0x6a
-#define BCM590XX_SDXLDOPMCTRL1	0x6c
-#define BCM590XX_MMCLDO1PMCTRL1	0x6e
-#define BCM590XX_MMCLDO2PMCTRL1	0x70
-#define BCM590XX_AUDLDOPMCTRL1	0x72
-#define BCM590XX_MICLDOPMCTRL1	0x74
-#define BCM590XX_USBLDOPMCTRL1	0x76
-#define BCM590XX_VIBLDOPMCTRL1	0x78
-#define BCM590XX_IOSR1PMCTRL1	0x7a
-#define BCM590XX_IOSR2PMCTRL1	0x7c
-#define BCM590XX_CSRPMCTRL1	0x7e
-#define BCM590XX_SDSR1PMCTRL1	0x82
-#define BCM590XX_SDSR2PMCTRL1	0x86
-#define BCM590XX_MSRPMCTRL1	0x8a
-#define BCM590XX_VSRPMCTRL1	0x8e
-#define BCM590XX_RFLDOCTRL	0x96
-#define BCM590XX_CAMLDO1CTRL	0x97
-#define BCM590XX_CAMLDO2CTRL	0x98
-#define BCM590XX_SIMLDO1CTRL	0x99
-#define BCM590XX_SIMLDO2CTRL	0x9a
-#define BCM590XX_SDLDOCTRL	0x9b
-#define BCM590XX_SDXLDOCTRL	0x9c
-#define BCM590XX_MMCLDO1CTRL	0x9d
-#define BCM590XX_MMCLDO2CTRL	0x9e
-#define BCM590XX_AUDLDOCTRL	0x9f
-#define BCM590XX_MICLDOCTRL	0xa0
-#define BCM590XX_USBLDOCTRL	0xa1
-#define BCM590XX_VIBLDOCTRL	0xa2
-#define BCM590XX_CSRVOUT1	0xc0
-#define BCM590XX_IOSR1VOUT1	0xc3
-#define BCM590XX_IOSR2VOUT1	0xc6
-#define BCM590XX_MSRVOUT1	0xc9
-#define BCM590XX_SDSR1VOUT1	0xcc
-#define BCM590XX_SDSR2VOUT1	0xcf
-#define BCM590XX_VSRVOUT1	0xd2
-
-/* I2C slave 1 registers */
-#define BCM590XX_GPLDO5PMCTRL1	0x16
-#define BCM590XX_GPLDO6PMCTRL1	0x18
-#define BCM590XX_GPLDO1CTRL	0x1a
-#define BCM590XX_GPLDO2CTRL	0x1b
-#define BCM590XX_GPLDO3CTRL	0x1c
-#define BCM590XX_GPLDO4CTRL	0x1d
-#define BCM590XX_GPLDO5CTRL	0x1e
-#define BCM590XX_GPLDO6CTRL	0x1f
-#define BCM590XX_OTG_CTRL	0x40
-#define BCM590XX_GPLDO1PMCTRL1	0x57
-#define BCM590XX_GPLDO2PMCTRL1	0x59
-#define BCM590XX_GPLDO3PMCTRL1	0x5b
-#define BCM590XX_GPLDO4PMCTRL1	0x5d
+#define BCM590XX_MAX_NUM_REGS	27
 
 #define BCM590XX_REG_ENABLE	BIT(7)
 #define BCM590XX_VBUS_ENABLE	BIT(2)
 #define BCM590XX_LDO_VSEL_MASK	GENMASK(5, 3)
 #define BCM590XX_SR_VSEL_MASK	GENMASK(5, 0)
 
-/*
- * RFLDO to VSR regulators are
- * accessed via I2C slave 0
- */
-
-/* LDO regulator IDs */
-#define BCM590XX_REG_RFLDO	0
-#define BCM590XX_REG_CAMLDO1	1
-#define BCM590XX_REG_CAMLDO2	2
-#define BCM590XX_REG_SIMLDO1	3
-#define BCM590XX_REG_SIMLDO2	4
-#define BCM590XX_REG_SDLDO	5
-#define BCM590XX_REG_SDXLDO	6
-#define BCM590XX_REG_MMCLDO1	7
-#define BCM590XX_REG_MMCLDO2	8
-#define BCM590XX_REG_AUDLDO	9
-#define BCM590XX_REG_MICLDO	10
-#define BCM590XX_REG_USBLDO	11
-#define BCM590XX_REG_VIBLDO	12
-
-/* DCDC regulator IDs */
-#define BCM590XX_REG_CSR	13
-#define BCM590XX_REG_IOSR1	14
-#define BCM590XX_REG_IOSR2	15
-#define BCM590XX_REG_MSR	16
-#define BCM590XX_REG_SDSR1	17
-#define BCM590XX_REG_SDSR2	18
-#define BCM590XX_REG_VSR	19
-
-/*
- * GPLDO1 to VBUS regulators are
- * accessed via I2C slave 1
- */
-
-#define BCM590XX_REG_GPLDO1	20
-#define BCM590XX_REG_GPLDO2	21
-#define BCM590XX_REG_GPLDO3	22
-#define BCM590XX_REG_GPLDO4	23
-#define BCM590XX_REG_GPLDO5	24
-#define BCM590XX_REG_GPLDO6	25
-#define BCM590XX_REG_VBUS	26
-
-#define BCM590XX_NUM_REGS	27
-
-/* LDO group A: supported voltages in microvolts */
-static const unsigned int ldo_a_table[] = {
-	1200000, 1800000, 2500000, 2700000, 2800000,
-	2900000, 3000000, 3300000,
-};
-
-/* LDO group C: supported voltages in microvolts */
-static const unsigned int ldo_c_table[] = {
-	3100000, 1800000, 2500000, 2700000, 2800000,
-	2900000, 3000000, 3300000,
-};
-
-/* DCDC group CSR: supported voltages in microvolts */
-static const struct linear_range dcdc_csr_ranges[] = {
-	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
-	REGULATOR_LINEAR_RANGE(1360000, 51, 55, 20000),
-	REGULATOR_LINEAR_RANGE(900000, 56, 63, 0),
-};
-
-/* DCDC group IOSR1: supported voltages in microvolts */
-static const struct linear_range dcdc_iosr1_ranges[] = {
-	REGULATOR_LINEAR_RANGE(860000, 2, 51, 10000),
-	REGULATOR_LINEAR_RANGE(1500000, 52, 52, 0),
-	REGULATOR_LINEAR_RANGE(1800000, 53, 53, 0),
-	REGULATOR_LINEAR_RANGE(900000, 54, 63, 0),
-};
-
-/* DCDC group SDSR1: supported voltages in microvolts */
-static const struct linear_range dcdc_sdsr1_ranges[] = {
-	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
-	REGULATOR_LINEAR_RANGE(1340000, 51, 51, 0),
-	REGULATOR_LINEAR_RANGE(900000, 52, 63, 0),
-};
-
 enum bcm590xx_reg_type {
 	BCM590XX_REG_TYPE_LDO,
 	BCM590XX_REG_TYPE_GPLDO,
@@ -208,43 +75,187 @@ static const struct regulator_ops bcm590xx_ops_vbus = {
 	.disable		= regulator_disable_regmap,
 };
 
-#define BCM590XX_REG_DESC(_name, _name_lower)				\
-	.id = BCM590XX_REG_##_name,					\
+#define BCM590XX_REG_DESC(_model, _name, _name_lower)			\
+	.id = _model##_REG_##_name,					\
 	.name = #_name_lower,						\
 	.of_match = of_match_ptr(#_name_lower),				\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.type = REGULATOR_VOLTAGE,					\
 	.owner = THIS_MODULE						\
 
-#define BCM590XX_LDO_DESC(_name, _name_lower, _table)			\
-	BCM590XX_REG_DESC(_name, _name_lower),				\
+#define BCM590XX_LDO_DESC(_model, _model_lower, _name, _name_lower, _table) \
+	BCM590XX_REG_DESC(_model, _name, _name_lower),			\
 	.ops = &bcm590xx_ops_ldo,					\
-	.n_voltages = ARRAY_SIZE(_table),				\
-	.volt_table = _table,						\
-	.vsel_reg = BCM590XX_##_name##CTRL,				\
+	.n_voltages = ARRAY_SIZE(_model_lower##_##_table),		\
+	.volt_table = _model_lower##_##_table,				\
+	.vsel_reg = _model##_##_name##CTRL,				\
 	.vsel_mask = BCM590XX_LDO_VSEL_MASK,				\
-	.enable_reg = BCM590XX_##_name##PMCTRL1,			\
+	.enable_reg = _model##_##_name##PMCTRL1,			\
 	.enable_mask = BCM590XX_REG_ENABLE,				\
 	.enable_is_inverted = true
 
-#define BCM590XX_SR_DESC(_name, _name_lower, _ranges)			\
-	BCM590XX_REG_DESC(_name, _name_lower),				\
+#define BCM590XX_SR_DESC(_model, _model_lower, _name, _name_lower, _ranges) \
+	BCM590XX_REG_DESC(_model, _name, _name_lower),			\
 	.ops = &bcm590xx_ops_dcdc,					\
 	.n_voltages = 64,						\
-	.linear_ranges = _ranges,					\
-	.n_linear_ranges = ARRAY_SIZE(_ranges),				\
-	.vsel_reg = BCM590XX_##_name##VOUT1,				\
+	.linear_ranges = _model_lower##_##_ranges,			\
+	.n_linear_ranges = ARRAY_SIZE(_model_lower##_##_ranges),	\
+	.vsel_reg = _model##_##_name##VOUT1,				\
 	.vsel_mask = BCM590XX_SR_VSEL_MASK,				\
-	.enable_reg = BCM590XX_##_name##PMCTRL1,			\
+	.enable_reg = _model##_##_name##PMCTRL1,			\
 	.enable_mask = BCM590XX_REG_ENABLE,				\
 	.enable_is_inverted = true
 
-static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
+#define BCM59056_REG_DESC(_name, _name_lower)				\
+	BCM590XX_REG_DESC(BCM59056, _name, _name_lower)
+#define BCM59056_LDO_DESC(_name, _name_lower, _table)			\
+	BCM590XX_LDO_DESC(BCM59056, bcm59056, _name, _name_lower, _table)
+#define BCM59056_SR_DESC(_name, _name_lower, _ranges)			\
+	BCM590XX_SR_DESC(BCM59056, bcm59056, _name, _name_lower, _ranges)
+
+/* BCM59056 data */
+
+/* I2C slave 0 registers */
+#define BCM59056_RFLDOPMCTRL1	0x60
+#define BCM59056_CAMLDO1PMCTRL1	0x62
+#define BCM59056_CAMLDO2PMCTRL1	0x64
+#define BCM59056_SIMLDO1PMCTRL1	0x66
+#define BCM59056_SIMLDO2PMCTRL1	0x68
+#define BCM59056_SDLDOPMCTRL1	0x6a
+#define BCM59056_SDXLDOPMCTRL1	0x6c
+#define BCM59056_MMCLDO1PMCTRL1	0x6e
+#define BCM59056_MMCLDO2PMCTRL1	0x70
+#define BCM59056_AUDLDOPMCTRL1	0x72
+#define BCM59056_MICLDOPMCTRL1	0x74
+#define BCM59056_USBLDOPMCTRL1	0x76
+#define BCM59056_VIBLDOPMCTRL1	0x78
+#define BCM59056_IOSR1PMCTRL1	0x7a
+#define BCM59056_IOSR2PMCTRL1	0x7c
+#define BCM59056_CSRPMCTRL1	0x7e
+#define BCM59056_SDSR1PMCTRL1	0x82
+#define BCM59056_SDSR2PMCTRL1	0x86
+#define BCM59056_MSRPMCTRL1	0x8a
+#define BCM59056_VSRPMCTRL1	0x8e
+#define BCM59056_RFLDOCTRL	0x96
+#define BCM59056_CAMLDO1CTRL	0x97
+#define BCM59056_CAMLDO2CTRL	0x98
+#define BCM59056_SIMLDO1CTRL	0x99
+#define BCM59056_SIMLDO2CTRL	0x9a
+#define BCM59056_SDLDOCTRL	0x9b
+#define BCM59056_SDXLDOCTRL	0x9c
+#define BCM59056_MMCLDO1CTRL	0x9d
+#define BCM59056_MMCLDO2CTRL	0x9e
+#define BCM59056_AUDLDOCTRL	0x9f
+#define BCM59056_MICLDOCTRL	0xa0
+#define BCM59056_USBLDOCTRL	0xa1
+#define BCM59056_VIBLDOCTRL	0xa2
+#define BCM59056_CSRVOUT1	0xc0
+#define BCM59056_IOSR1VOUT1	0xc3
+#define BCM59056_IOSR2VOUT1	0xc6
+#define BCM59056_MSRVOUT1	0xc9
+#define BCM59056_SDSR1VOUT1	0xcc
+#define BCM59056_SDSR2VOUT1	0xcf
+#define BCM59056_VSRVOUT1	0xd2
+
+/* I2C slave 1 registers */
+#define BCM59056_GPLDO5PMCTRL1	0x16
+#define BCM59056_GPLDO6PMCTRL1	0x18
+#define BCM59056_GPLDO1CTRL	0x1a
+#define BCM59056_GPLDO2CTRL	0x1b
+#define BCM59056_GPLDO3CTRL	0x1c
+#define BCM59056_GPLDO4CTRL	0x1d
+#define BCM59056_GPLDO5CTRL	0x1e
+#define BCM59056_GPLDO6CTRL	0x1f
+#define BCM59056_OTG_CTRL	0x40
+#define BCM59056_GPLDO1PMCTRL1	0x57
+#define BCM59056_GPLDO2PMCTRL1	0x59
+#define BCM59056_GPLDO3PMCTRL1	0x5b
+#define BCM59056_GPLDO4PMCTRL1	0x5d
+
+/*
+ * RFLDO to VSR regulators are
+ * accessed via I2C slave 0
+ */
+
+/* LDO regulator IDs */
+#define BCM59056_REG_RFLDO	0
+#define BCM59056_REG_CAMLDO1	1
+#define BCM59056_REG_CAMLDO2	2
+#define BCM59056_REG_SIMLDO1	3
+#define BCM59056_REG_SIMLDO2	4
+#define BCM59056_REG_SDLDO	5
+#define BCM59056_REG_SDXLDO	6
+#define BCM59056_REG_MMCLDO1	7
+#define BCM59056_REG_MMCLDO2	8
+#define BCM59056_REG_AUDLDO	9
+#define BCM59056_REG_MICLDO	10
+#define BCM59056_REG_USBLDO	11
+#define BCM59056_REG_VIBLDO	12
+
+/* DCDC regulator IDs */
+#define BCM59056_REG_CSR	13
+#define BCM59056_REG_IOSR1	14
+#define BCM59056_REG_IOSR2	15
+#define BCM59056_REG_MSR	16
+#define BCM59056_REG_SDSR1	17
+#define BCM59056_REG_SDSR2	18
+#define BCM59056_REG_VSR	19
+
+/*
+ * GPLDO1 to VBUS regulators are
+ * accessed via I2C slave 1
+ */
+
+#define BCM59056_REG_GPLDO1	20
+#define BCM59056_REG_GPLDO2	21
+#define BCM59056_REG_GPLDO3	22
+#define BCM59056_REG_GPLDO4	23
+#define BCM59056_REG_GPLDO5	24
+#define BCM59056_REG_GPLDO6	25
+#define BCM59056_REG_VBUS	26
+
+#define BCM59056_NUM_REGS	27
+
+/* LDO group A: supported voltages in microvolts */
+static const unsigned int bcm59056_ldo_a_table[] = {
+	1200000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* LDO group C: supported voltages in microvolts */
+static const unsigned int bcm59056_ldo_c_table[] = {
+	3100000, 1800000, 2500000, 2700000, 2800000,
+	2900000, 3000000, 3300000,
+};
+
+/* DCDC group CSR: supported voltages in microvolts */
+static const struct linear_range bcm59056_dcdc_csr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
+	REGULATOR_LINEAR_RANGE(1360000, 51, 55, 20000),
+	REGULATOR_LINEAR_RANGE(900000, 56, 63, 0),
+};
+
+/* DCDC group IOSR1: supported voltages in microvolts */
+static const struct linear_range bcm59056_dcdc_iosr1_ranges[] = {
+	REGULATOR_LINEAR_RANGE(860000, 2, 51, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 52, 52, 0),
+	REGULATOR_LINEAR_RANGE(1800000, 53, 53, 0),
+	REGULATOR_LINEAR_RANGE(900000, 54, 63, 0),
+};
+
+/* DCDC group SDSR1: supported voltages in microvolts */
+static const struct linear_range bcm59056_dcdc_sdsr1_ranges[] = {
+	REGULATOR_LINEAR_RANGE(860000, 2, 50, 10000),
+	REGULATOR_LINEAR_RANGE(1340000, 51, 51, 0),
+	REGULATOR_LINEAR_RANGE(900000, 52, 63, 0),
+};
+
+static const struct bcm590xx_reg_info bcm59056_regs[BCM59056_NUM_REGS] = {
 	{
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(RFLDO, rfldo, ldo_a_table),
+			BCM59056_LDO_DESC(RFLDO, rfldo, ldo_a_table),
 		},
 	},
 
@@ -252,7 +263,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(CAMLDO1, camldo1, ldo_c_table),
+			BCM59056_LDO_DESC(CAMLDO1, camldo1, ldo_c_table),
 		},
 	},
 
@@ -260,7 +271,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(CAMLDO2, camldo2, ldo_c_table),
+			BCM59056_LDO_DESC(CAMLDO2, camldo2, ldo_c_table),
 		},
 	},
 
@@ -268,7 +279,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SIMLDO1, simldo1, ldo_a_table),
+			BCM59056_LDO_DESC(SIMLDO1, simldo1, ldo_a_table),
 		},
 	},
 
@@ -276,7 +287,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SIMLDO2, simldo2, ldo_a_table),
+			BCM59056_LDO_DESC(SIMLDO2, simldo2, ldo_a_table),
 		},
 	},
 
@@ -284,7 +295,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SDLDO, sdldo, ldo_c_table),
+			BCM59056_LDO_DESC(SDLDO, sdldo, ldo_c_table),
 		},
 	},
 
@@ -292,7 +303,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(SDXLDO, sdxldo, ldo_a_table),
+			BCM59056_LDO_DESC(SDXLDO, sdxldo, ldo_a_table),
 		},
 	},
 
@@ -300,7 +311,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(MMCLDO1, mmcldo1, ldo_a_table),
+			BCM59056_LDO_DESC(MMCLDO1, mmcldo1, ldo_a_table),
 		},
 	},
 
@@ -308,7 +319,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(MMCLDO2, mmcldo2, ldo_a_table),
+			BCM59056_LDO_DESC(MMCLDO2, mmcldo2, ldo_a_table),
 		},
 	},
 
@@ -316,7 +327,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(AUDLDO, audldo, ldo_a_table),
+			BCM59056_LDO_DESC(AUDLDO, audldo, ldo_a_table),
 		},
 	},
 
@@ -324,7 +335,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(MICLDO, micldo, ldo_a_table),
+			BCM59056_LDO_DESC(MICLDO, micldo, ldo_a_table),
 		},
 	},
 
@@ -332,7 +343,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(USBLDO, usbldo, ldo_a_table),
+			BCM59056_LDO_DESC(USBLDO, usbldo, ldo_a_table),
 		},
 	},
 
@@ -340,7 +351,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_LDO,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_LDO_DESC(VIBLDO, vibldo, ldo_c_table),
+			BCM59056_LDO_DESC(VIBLDO, vibldo, ldo_c_table),
 		},
 	},
 
@@ -348,7 +359,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(CSR, csr, dcdc_csr_ranges),
+			BCM59056_SR_DESC(CSR, csr, dcdc_csr_ranges),
 		},
 	},
 
@@ -356,7 +367,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(IOSR1, iosr1, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(IOSR1, iosr1, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -364,7 +375,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(IOSR2, iosr2, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(IOSR2, iosr2, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -372,7 +383,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(MSR, msr, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(MSR, msr, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -380,7 +391,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(SDSR1, sdsr1, dcdc_sdsr1_ranges),
+			BCM59056_SR_DESC(SDSR1, sdsr1, dcdc_sdsr1_ranges),
 		},
 	},
 
@@ -388,7 +399,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(SDSR2, sdsr2, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(SDSR2, sdsr2, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -396,7 +407,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_SR,
 		.regmap = BCM590XX_REG_REGMAP_PRI,
 		.desc = {
-			BCM590XX_SR_DESC(VSR, vsr, dcdc_iosr1_ranges),
+			BCM59056_SR_DESC(VSR, vsr, dcdc_iosr1_ranges),
 		},
 	},
 
@@ -404,7 +415,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO1, gpldo1, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO1, gpldo1, ldo_a_table),
 		},
 	},
 
@@ -412,7 +423,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO2, gpldo2, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO2, gpldo2, ldo_a_table),
 		},
 	},
 
@@ -420,7 +431,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO3, gpldo3, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO3, gpldo3, ldo_a_table),
 		},
 	},
 
@@ -428,7 +439,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO4, gpldo4, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO4, gpldo4, ldo_a_table),
 		},
 	},
 
@@ -436,7 +447,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO5, gpldo5, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO5, gpldo5, ldo_a_table),
 		},
 	},
 
@@ -444,7 +455,7 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_GPLDO,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_LDO_DESC(GPLDO6, gpldo6, ldo_a_table),
+			BCM59056_LDO_DESC(GPLDO6, gpldo6, ldo_a_table),
 		},
 	},
 
@@ -452,11 +463,11 @@ static const struct bcm590xx_reg_info bcm590xx_regs[BCM590XX_NUM_REGS] = {
 		.type = BCM590XX_REG_TYPE_VBUS,
 		.regmap = BCM590XX_REG_REGMAP_SEC,
 		.desc = {
-			BCM590XX_REG_DESC(VBUS, vbus),
+			BCM59056_REG_DESC(VBUS, vbus),
 			.ops = &bcm590xx_ops_vbus,
 			.n_voltages = 1,
 			.fixed_uV = 5000000,
-			.enable_reg = BCM590XX_OTG_CTRL,
+			.enable_reg = BCM59056_OTG_CTRL,
 			.enable_mask = BCM590XX_VBUS_ENABLE,
 		},
 	},
@@ -476,8 +487,8 @@ static int bcm590xx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pmu->mfd = bcm590xx;
-	pmu->n_regulators = BCM590XX_NUM_REGS;
-	pmu->regs = bcm590xx_regs;
+	pmu->n_regulators = BCM59056_NUM_REGS;
+	pmu->regs = bcm59056_regs;
 
 	platform_set_drvdata(pdev, pmu);
 

-- 
2.48.1

