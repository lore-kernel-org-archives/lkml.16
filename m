Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D98E28314B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238486; cv=none; b=pO4tZX7Q3UnZc+wIiFwOHsnmjGeoIruHNWQGQC6VWNBRSEZvgnFtN/fjVRqoXYAZGSUM31wZ2HiO60xqQzjiaP8AucKrhQwyJvS8m8Heb/XuWJlJdblko0+TZYT0AL/Riay1VfxqktC770q4JTo/4AQC9dKtOuSMxFTlss+Y9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238486; c=relaxed/simple;
	bh=3enjF236YBrEnbuxySSp/fvys4ScnWyJ4wnH5Q+q5ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bf2bfA3OaSDuTEG/1qpiGDU9j+vaHBe6Bvtqj2denNBdZptps0UviPTcAp/EMMeZrjDA84kdXjENtiySAecc/7VmC6QVAJw0SU73uH/vS0LwKGgOTjh4sVGVlDSAzOtwfMOXdDJW7OLuB4U1bVYJy5Co81rPxOwjjDrG2zBh/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyr-0003BA-6r; Wed, 18 Jun 2025 11:21:17 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-004759-2V;
	Wed, 18 Jun 2025 11:21:16 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uRoyq-005QWt-29;
	Wed, 18 Jun 2025 11:21:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 18 Jun 2025 11:21:15 +0200
Subject: [PATCH v5 4/4] clk: cdce6214: add pin configuration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-clk-cdce6214-v5-4-9938b8ed0b94@pengutronix.de>
References: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
In-Reply-To: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750238476; l=9649;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=3enjF236YBrEnbuxySSp/fvys4ScnWyJ4wnH5Q+q5ag=;
 b=VErArki/QwV7R7eG2w0nUQ9Ghq+L/Yqyvo+q11wrjUGbl/J4ugCRz2P5BSBeP9vilfrJKDoU0
 KlUTeylcv59ByquypIsdARQdlhXBMIi6acA0JTnHFOg53NCOozDm3da
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Add pin configuration support for the TI CDCE6214. The CDCE6214 has
an internal EEPROM to to fully configure the chip, but this EEPROM
might be empty, so add support for configuring the chip through
the device tree.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/clk-cdce6214.c | 312 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/drivers/clk/clk-cdce6214.c b/drivers/clk/clk-cdce6214.c
index 41d18597fbbba638b56e6e94141ee0261d355cde..ac8869b27b60cff4670538dcf13be4b5018ecf13 100644
--- a/drivers/clk/clk-cdce6214.c
+++ b/drivers/clk/clk-cdce6214.c
@@ -1017,9 +1017,313 @@ static int cdce6214_clk_register(struct cdce6214 *priv)
 	return 0;
 }
 
+static void cdce6214_setup_xtal(struct cdce6214 *priv, struct device_node *np)
+{
+	const unsigned short ip_xo_cload[] = {
+		/* index is the register value */
+		3000, 3200, 3400, 3600, 3800, 4000, 4200, 4400,
+		4600, 4800, 5000, 5200, 5400, 5600, 5800, 6000,
+		6200, 6400, 6500, 6700, 6900, 7100, 7300, 7500,
+		7700, 7900, 8100, 8300, 8500, 8700, 8900, 9000
+	};
+
+	const unsigned short ip_bias_sel_xo[] = {
+		/* index is the register value */
+		0, 14, 29, 44,
+		59, 148, 295, 443,
+		591, 884, 1177, 1468, 1758
+	};
+
+	unsigned int cload = 4400; /* reset default */
+	unsigned int bias = 295; /* reset default */
+	int i;
+
+	of_property_read_u32(np, "ti,xo-cload-femtofarad", &cload);
+	of_property_read_u32(np, "ti,xo-bias-current-microampere", &bias);
+
+	for (i = 0; i < ARRAY_SIZE(ip_xo_cload); i++)
+		if (cload <= ip_xo_cload[i])
+			break;
+
+	if (i >= ARRAY_SIZE(ip_xo_cload)) {
+		dev_warn(priv->dev, "ti,xo-cload-femtofarad value %u too high\n",
+			 cload);
+		i = ARRAY_SIZE(ip_xo_cload) - 1;
+	}
+
+	regmap_update_bits(priv->regmap, R2, R24_IP_XO_CLOAD,
+			   FIELD_PREP(R24_IP_XO_CLOAD, i));
+
+	for (i = 0; i < ARRAY_SIZE(ip_bias_sel_xo); i++)
+		if (bias <= ip_bias_sel_xo[i])
+			break;
+
+	if (i >= ARRAY_SIZE(ip_xo_cload)) {
+		dev_warn(priv->dev, "ti,xo-bias-current-microampere value %u too high\n",
+			 bias);
+		i = ARRAY_SIZE(ip_xo_cload) - 1;
+	}
+
+	regmap_update_bits(priv->regmap, R2, R24_IP_BIAS_SEL_XO,
+			   FIELD_PREP(R24_IP_BIAS_SEL_XO, i));
+}
+
+static int cdce6214_get_clkout_fmt(struct cdce6214 *priv, struct device_node *np)
+{
+	const char *fmt;
+	int ret;
+
+	ret = of_property_read_string(np, "ti,clkout-fmt", &fmt);
+	if (ret == -EINVAL)
+		return CDCE6214_CLKOUT_FMT_KEEP;
+	if (ret)
+		return ret;
+
+	return match_string(clkkout_fmt_names, ARRAY_SIZE(clkkout_fmt_names), fmt);
+}
+
+static int cdce6214_get_clkin_fmt(struct cdce6214 *priv, struct device_node *np)
+{
+	const char *fmt;
+	int ret;
+
+	ret = of_property_read_string(np, "ti,clkin-fmt", &fmt);
+	if (ret == -EINVAL)
+		return CDCE6214_CLKIN_FMT_KEEP;
+	if (ret)
+		return ret;
+
+	return match_string(clkkin_fmt_names, ARRAY_SIZE(clkkin_fmt_names), fmt);
+}
+
+static int cdce6214_get_cmos_mode(struct cdce6214 *priv, struct device_node *np,
+				  const char *propname)
+{
+	const char *fmt;
+	int ret;
+
+	ret = of_property_read_string(np, propname, &fmt);
+	if (ret == -EINVAL)
+		return CDCE6214_CMOS_MODE_KEEP;
+	if (ret)
+		return ret;
+
+	return match_string(cmos_mode_names, ARRAY_SIZE(cmos_mode_names), fmt);
+}
+
+static int cdce6214_set_cmos_mode(struct cdce6214 *priv, struct device_node *np,
+				  unsigned int reg)
+{
+	int cmosp_mode, cmosn_mode;
+	u16 cmode = 0, cmode_mask;
+
+	cmosn_mode = cdce6214_get_cmos_mode(priv, np, "ti,cmosn-mode");
+	if (cmosn_mode < 0)
+		return cmosn_mode;
+
+	cmosp_mode = cdce6214_get_cmos_mode(priv, np, "ti,cmosp-mode");
+	if (cmosp_mode < 0)
+		return cmosp_mode;
+
+	cmode_mask = R59_CH1_CMOSP_EN | R59_CH1_CMOSN_EN |
+		     R59_CH1_CMOSP_POL | R59_CH1_CMOSN_POL;
+
+	switch (cmosp_mode) {
+	case CDCE6214_CMOS_MODE_DISABLED:
+		break;
+	case CDCE6214_CMOS_MODE_HIGH:
+		cmode |= R59_CH1_CMOSP_EN | R59_CH1_CMOSP_POL;
+		break;
+	case CDCE6214_CMOS_MODE_LOW:
+		cmode |= R59_CH1_CMOSP_EN;
+		break;
+	case CDCE6214_CMOS_MODE_KEEP:
+		cmode_mask &= ~(R59_CH1_CMOSP_EN | R59_CH1_CMOSP_POL);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (cmosn_mode) {
+	case CDCE6214_CMOS_MODE_DISABLED:
+		break;
+	case CDCE6214_CMOS_MODE_HIGH:
+		cmode |= R59_CH1_CMOSN_EN | R59_CH1_CMOSN_POL;
+		break;
+	case CDCE6214_CMOS_MODE_LOW:
+		cmode |= R59_CH1_CMOSN_EN;
+		break;
+	case CDCE6214_CMOS_MODE_KEEP:
+		cmode_mask &= ~(R59_CH1_CMOSN_EN | R59_CH1_CMOSN_POL);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Relevant fields are identical for register 59 and 75 */
+	regmap_update_bits(priv->regmap, reg, cmode_mask, cmode);
+
+	return 0;
+}
+
+static int cdce6214_parse_subnode(struct cdce6214 *priv, struct device_node *np)
+{
+	struct regmap *reg = priv->regmap;
+	unsigned int idx;
+	int fmt;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &idx);
+	if (ret) {
+		dev_err(priv->dev, "missing reg property in child: %s\n",
+			np->full_name);
+		return ret;
+	}
+
+	if (idx >= CDCE6214_NUM_CLOCKS)
+		return -EINVAL;
+
+	switch (idx) {
+	case CDCE6214_CLK_OUT1:
+		fmt = cdce6214_get_clkout_fmt(priv, np);
+		switch (fmt) {
+		case CDCE6214_CLKOUT_FMT_CMOS:
+			ret = cdce6214_set_cmos_mode(priv, np, R59);
+			if (ret)
+				return ret;
+			regmap_clear_bits(reg, R59, R59_CH1_LVDS_EN);
+			regmap_clear_bits(reg, R57, R57_CH1_LPHCSL_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_LVDS:
+			regmap_clear_bits(reg, R57, R57_CH1_LPHCSL_EN);
+			regmap_set_bits(reg, R59, R59_CH1_LVDS_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_LPHCSL:
+			regmap_clear_bits(reg, R59, R59_CH1_LVDS_EN);
+			regmap_set_bits(reg, R57, R57_CH1_LPHCSL_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_KEEP:
+			break;
+		default:
+			goto err_illegal_fmt;
+		}
+		break;
+	case CDCE6214_CLK_OUT2:
+		fmt = cdce6214_get_clkout_fmt(priv, np);
+		switch (fmt) {
+		case CDCE6214_CLKOUT_FMT_CMOS:
+			goto err_illegal_fmt;
+		case CDCE6214_CLKOUT_FMT_LVDS:
+			regmap_set_bits(reg, R65, R65_CH2_LVDS_EN);
+			regmap_clear_bits(reg, R63, R63_CH2_LPHCSL_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_LPHCSL:
+			regmap_set_bits(reg, R63, R63_CH2_LPHCSL_EN);
+			regmap_clear_bits(reg, R65, R65_CH2_LVDS_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_KEEP:
+			break;
+		default:
+			goto err_illegal_fmt;
+		}
+		break;
+	case CDCE6214_CLK_OUT3:
+		fmt = cdce6214_get_clkout_fmt(priv, np);
+		switch (fmt) {
+		case CDCE6214_CLKOUT_FMT_CMOS:
+			goto err_illegal_fmt;
+		case CDCE6214_CLKOUT_FMT_LVDS:
+			regmap_set_bits(reg, R70, R70_CH3_LVDS_EN);
+			regmap_clear_bits(reg, R68, R68_CH3_LPHCSL_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_LPHCSL:
+			regmap_set_bits(reg, R70, R70_CH3_LVDS_EN);
+			regmap_clear_bits(reg, R68, R65_CH2_LVDS_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_KEEP:
+			break;
+		}
+		break;
+	case CDCE6214_CLK_OUT4:
+		fmt = cdce6214_get_clkout_fmt(priv, np);
+		switch (fmt) {
+		case CDCE6214_CLKOUT_FMT_CMOS:
+			ret = cdce6214_set_cmos_mode(priv, np, R75);
+			if (ret)
+				return ret;
+			regmap_clear_bits(reg, R75, R75_CH4_LVDS_EN);
+			regmap_clear_bits(reg, R73, R73_CH4_LPHCSL_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_LVDS:
+			regmap_clear_bits(reg, R73, R73_CH4_LPHCSL_EN);
+			regmap_set_bits(reg, R75, R75_CH4_LVDS_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_LPHCSL:
+			regmap_clear_bits(reg, R75, R75_CH4_LVDS_EN);
+			regmap_set_bits(reg, R72, R73_CH4_LPHCSL_EN);
+			break;
+		case CDCE6214_CLKOUT_FMT_KEEP:
+			break;
+		default:
+			goto err_illegal_fmt;
+		}
+		break;
+	case CDCE6214_CLK_PRIREF:
+		fmt = cdce6214_get_clkin_fmt(priv, np);
+		switch (fmt) {
+		case CDCE6214_CLKIN_FMT_CMOS:
+			regmap_clear_bits(reg, R24, R24_IP_PRIREF_BUF_SEL);
+			break;
+		case CDCE6214_CLKIN_FMT_DIFF:
+			regmap_set_bits(reg, R24, R24_IP_PRIREF_BUF_SEL);
+			break;
+		case CDCE6214_CLKIN_FMT_KEEP:
+			break;
+		case CDCE6214_CLKIN_FMT_XTAL: /* XTAL not allowed for PRIREF */
+		default:
+			goto err_illegal_fmt;
+		}
+		break;
+	case CDCE6214_CLK_SECREF:
+		fmt = cdce6214_get_clkin_fmt(priv, np);
+		switch (fmt) {
+		case CDCE6214_CLKIN_FMT_CMOS:
+			regmap_update_bits(reg, R24, R24_IP_SECREF_BUF_SEL,
+					   R24_IP_SECREF_BUF_SEL_LVCMOS);
+			break;
+		case CDCE6214_CLKIN_FMT_XTAL:
+			regmap_update_bits(reg, R24, R24_IP_SECREF_BUF_SEL,
+					   R24_IP_SECREF_BUF_SEL_XTAL);
+			cdce6214_setup_xtal(priv, np);
+			break;
+		case CDCE6214_CLKIN_FMT_DIFF:
+			regmap_update_bits(reg, R24, R24_IP_SECREF_BUF_SEL,
+					   R24_IP_SECREF_BUF_SEL_DIFF);
+			break;
+		case CDCE6214_CLKIN_FMT_KEEP:
+			break;
+		default:
+			goto err_illegal_fmt;
+		}
+
+		break;
+	}
+
+	return 0;
+
+err_illegal_fmt:
+	if (fmt < 0)
+		dev_err(priv->dev, "%pOF: missing required property\n", np);
+	else
+		dev_err(priv->dev, "%pOF: illegal format %u\n", np, fmt);
+
+	return -EINVAL;
+}
+
 static int cdce6214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct device_node *child;
 	struct cdce6214 *priv;
 	int ret;
 
@@ -1047,6 +1351,14 @@ static int cdce6214_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	for_each_child_of_node(dev->of_node, child) {
+		ret = cdce6214_parse_subnode(priv, child);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
 	ret = cdce6214_clk_register(priv);
 	if (ret)
 		return dev_err_probe(dev, ret,

-- 
2.39.5

