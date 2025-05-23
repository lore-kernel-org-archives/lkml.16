Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459314885B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005954; cv=none; b=TyrBzYahsFKShMFbxUhXv3XmDjAESq6gaD5E8TwGv/nmO+iXS746+EUosBZHX1emmciz8oGJZoHMhG2eBxq9/1hQujfoDDOg6F+G2en8qL4vV42gBaix6wKIjoQhv+Vg/qa6S6+XPTMjw9enapEXcmQwsq1rOgd6D7fkfWYuQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005954; c=relaxed/simple;
	bh=mZg2oIPQ97lsMGT1hixTjniybVCl4tNDCzPpcYD93+E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZU5PAluk2CZGI7xX/CWUJq7zxRN0oohETbywfu5e6XdA1iTJgxVq57v48D357xbKY2NpNJIfrC8Yd7DP4LFzoIHU9/e5a+XT+gx2v/ej+pdPWl2019cUoCN2WLBunDhiaV1V7N6XjUOKlFBoGidUU2Ooslg4oGTsQ0iPN03V77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 May
 2025 15:12:29 +0200
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Fri, 23 May 2025 15:12:29 +0200
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] regulator: pca9450: Add support for mode operations
Date: Fri, 23 May 2025 15:12:12 +0200
Message-ID: <20250523131214.955970-2-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make the PWM mode on the buck controllers configurable from
devicetree. Some boards require forced PWM mode to keep the supply
ripple within acceptable limits under light load conditions.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
Changes in v2:
  - Add the header to the binding patch
  - Improve commit message

 drivers/regulator/pca9450-regulator.c | 120 +++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index a56f3ab754fa9..8aed8c858a47b 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -16,12 +16,18 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regulator/pca9450.h>
+#include <dt-bindings/regulator/nxp,pca9450-regulator.h>
+
+static unsigned int pca9450_buck_get_mode(struct regulator_dev *rdev);
+static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode);
 
 struct pc9450_dvs_config {
 	unsigned int run_reg; /* dvs0 */
 	unsigned int run_mask;
 	unsigned int standby_reg; /* dvs1 */
 	unsigned int standby_mask;
+	unsigned int mode_reg; /* ctrl */
+	unsigned int mode_mask;
 };
 
 struct pca9450_regulator_desc {
@@ -78,6 +84,8 @@ static const struct regulator_ops pca9450_dvs_buck_regulator_ops = {
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.set_ramp_delay	= regulator_set_ramp_delay_regmap,
+	.set_mode = pca9450_buck_set_mode,
+	.get_mode = pca9450_buck_get_mode,
 };
 
 static const struct regulator_ops pca9450_buck_regulator_ops = {
@@ -88,6 +96,8 @@ static const struct regulator_ops pca9450_buck_regulator_ops = {
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.set_mode = pca9450_buck_set_mode,
+	.get_mode = pca9450_buck_get_mode,
 };
 
 static const struct regulator_ops pca9450_ldo_regulator_ops = {
@@ -283,7 +293,64 @@ static int pca9450_set_dvs_levels(struct device_node *np,
 	return ret;
 }
 
-static const struct pca9450_regulator_desc pca9450a_regulators[] = {
+static inline unsigned int pca9450_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case PCA9450_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	case PCA9450_BUCK_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+					struct pca9450_regulator_desc, desc);
+	const struct pc9450_dvs_config *dvs = &desc->dvs;
+	int val;
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		val = dvs->mode_mask;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(&rdev->dev, "pca9450 buck set_mode %#x, %#x, %#x\n",
+		dvs->mode_reg, dvs->mode_mask, val);
+
+	return regmap_update_bits(rdev->regmap, dvs->mode_reg,
+				  dvs->mode_mask, val);
+}
+
+static unsigned int pca9450_buck_get_mode(struct regulator_dev *rdev)
+{
+	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+					struct pca9450_regulator_desc, desc);
+	const struct pc9450_dvs_config *dvs = &desc->dvs;
+	int ret = 0, regval;
+
+	ret = regmap_read(rdev->regmap, dvs->mode_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev,
+			"Failed to get pca9450 buck mode: %d\n", ret);
+		return ret;
+	}
+
+	if ((regval & dvs->mode_mask) == dvs->mode_mask)
+		return REGULATOR_MODE_FAST;
+
+	return REGULATOR_MODE_NORMAL;
+}
+
+static struct pca9450_regulator_desc pca9450a_regulators[] = {
 	{
 		.desc = {
 			.name = "buck1",
@@ -306,12 +373,15 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK1OUT_DVS0,
 			.run_mask = BUCK1OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK1OUT_DVS1,
 			.standby_mask = BUCK1OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK1CTRL,
+			.mode_mask = BUCK1_FPWM,
 		},
 	},
 	{
@@ -336,12 +406,15 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.n_ramp_values = ARRAY_SIZE(pca9450_dvs_buck_ramp_table),
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK2OUT_DVS0,
 			.run_mask = BUCK2OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK2OUT_DVS1,
 			.standby_mask = BUCK2OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK2CTRL,
+			.mode_mask = BUCK2_FPWM,
 		},
 	},
 	{
@@ -366,12 +439,15 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.n_ramp_values = ARRAY_SIZE(pca9450_dvs_buck_ramp_table),
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK3OUT_DVS0,
 			.run_mask = BUCK3OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK3OUT_DVS1,
 			.standby_mask = BUCK3OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK3CTRL,
+			.mode_mask = BUCK3_FPWM,
 		},
 	},
 	{
@@ -391,6 +467,11 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.enable_mask = BUCK4_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK4CTRL,
+			.mode_mask = BUCK4_FPWM,
 		},
 	},
 	{
@@ -410,6 +491,11 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.enable_mask = BUCK5_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK5CTRL,
+			.mode_mask = BUCK5_FPWM,
 		},
 	},
 	{
@@ -429,6 +515,11 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.enable_mask = BUCK6_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK6CTRL,
+			.mode_mask = BUCK6_FPWM,
 		},
 	},
 	{
@@ -527,7 +618,7 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
  * Buck3 removed on PCA9450B and connected with Buck1 internal for dual phase
  * on PCA9450C as no Buck3.
  */
-static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
+static struct pca9450_regulator_desc pca9450bc_regulators[] = {
 	{
 		.desc = {
 			.name = "buck1",
@@ -550,12 +641,15 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.n_ramp_values = ARRAY_SIZE(pca9450_dvs_buck_ramp_table),
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK1OUT_DVS0,
 			.run_mask = BUCK1OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK1OUT_DVS1,
 			.standby_mask = BUCK1OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK1CTRL,
+			.mode_mask = BUCK1_FPWM,
 		},
 	},
 	{
@@ -580,12 +674,15 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.n_ramp_values = ARRAY_SIZE(pca9450_dvs_buck_ramp_table),
 			.owner = THIS_MODULE,
 			.of_parse_cb = pca9450_set_dvs_levels,
+			.of_map_mode = pca9450_map_mode,
 		},
 		.dvs = {
 			.run_reg = PCA9450_REG_BUCK2OUT_DVS0,
 			.run_mask = BUCK2OUT_DVS0_MASK,
 			.standby_reg = PCA9450_REG_BUCK2OUT_DVS1,
 			.standby_mask = BUCK2OUT_DVS1_MASK,
+			.mode_reg = PCA9450_REG_BUCK2CTRL,
+			.mode_mask = BUCK2_FPWM,
 		},
 	},
 	{
@@ -605,6 +702,11 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.enable_mask = BUCK4_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK4CTRL,
+			.mode_mask = BUCK4_FPWM,
 		},
 	},
 	{
@@ -624,6 +726,11 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.enable_mask = BUCK5_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK5CTRL,
+			.mode_mask = BUCK5_FPWM,
 		},
 	},
 	{
@@ -643,6 +750,11 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.enable_mask = BUCK6_ENMODE_MASK,
 			.enable_val = BUCK_ENMODE_ONREQ,
 			.owner = THIS_MODULE,
+			.of_map_mode = pca9450_map_mode,
+		},
+		.dvs = {
+			.mode_reg = PCA9450_REG_BUCK6CTRL,
+			.mode_mask = BUCK6_FPWM,
 		},
 	},
 	{
@@ -737,7 +849,7 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 	},
 };
 
-static const struct pca9450_regulator_desc pca9451a_regulators[] = {
+static struct pca9450_regulator_desc pca9451a_regulators[] = {
 	{
 		.desc = {
 			.name = "buck1",
@@ -969,7 +1081,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 {
 	enum pca9450_chip_type type = (unsigned int)(uintptr_t)
 				      of_device_get_match_data(&i2c->dev);
-	const struct pca9450_regulator_desc	*regulator_desc;
+	const struct pca9450_regulator_desc *regulator_desc;
 	struct regulator_config config = { };
 	struct regulator_dev *ldo5;
 	struct pca9450 *pca9450;
-- 
2.39.2
