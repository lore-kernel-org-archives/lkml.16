Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15101221FC6;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375375; cv=none; b=bIPsaD0xMiprIm9uaLErRBpvQeE9GgnUDVoGo0BRQolw8SMHHhzE77dsV97j/cN0Ip9XHuyNqM55Clslmb2fFEt0SFFMIQJIGsevCFTZ6cArPZ/lIAZFyW7gfxlqHknXY8tK4AHnO/1pLksCV/egr3GF04+zVSmpVBQDbMaQJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375375; c=relaxed/simple;
	bh=eHEa9Kqvkam4+sJtbQR3MVChbyGpCP+iVaXdlRJkmB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYWkQ8nOFfyNBSKJPtbPm0Wvx0JjEG/wOR0Ukr3/FzJEwMpkttueK7NgdcYmWQWFvFNAceENCtDKnL7h53/KFyJeDiDsjPCgq6ESTSVV5vRC987skU9Exhp4lLxo8c58gs1VgKuP40JIpgrQsDqRXMXe4777w7AKu0KNl65ySgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUNFG7rg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUNFG7rg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F8E8C4CEE7;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=eHEa9Kqvkam4+sJtbQR3MVChbyGpCP+iVaXdlRJkmB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YUNFG7rg0bS1eJJeG9TFzmjoHKETvnFU4kLikdxmVe1+a4IR5IrgBO+LuNWdP94Rk
	 u3OZNF1NzxilLF+aVeI3i30s0c3m1Mw25Brg9uw7qe4+kbtddehSBl1YE6Iiy6l88w
	 DHJEGscmuQ2PnP5DPHXBKvfD4YIRy2H65Or0Jfr1vLIwZmDlLcMr9kcYn6HC2jpFFZ
	 4+meyA1aBIzlrym4eGflcZvgVBZSuCc3TP8//zbJ9zY18emrgolHMBsyA6f2vY91V0
	 YWlpTHuWHgcZJENOOqaYD7qR6J/JC5hu7PGbhrXjy9Yy+PLmo9+R3g5xWygYKOPwV3
	 seQMPIaaxHk1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1CCC369A8;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Apr 2025 20:42:43 +0800
Subject: [PATCH 1/7] soc: amlogic: clk-measure: Define MSR_CLK's register
 offset separately
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-clk-measure-v1-1-cb46a78d019a@amlogic.com>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
In-Reply-To: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=5785;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=o37HsmS/LhKiY/hPb95VmdLfnQkmXFWILQkMmhIbObk=;
 b=HAK7O7iFxegmwupeR2l/Z15cossX+6nAb+rCqWQ4RHW1JUspGURGfCZMjP61rjI4k0XG9jqUJ
 ZjRE4AoySr8DvoWujhHDvOsogKGfzGnRmGaPm1t6iSWIkDDloaiaGhp
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Since the MSR_CLK register offset differs between chip variants, we
replace the macro-based definition with chip-specific assignments.

Change the max_register in regmap_config to be retrieved from DTS.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 70 ++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 39638d6a593c..30387d26307c 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -14,11 +14,6 @@
 
 static DEFINE_MUTEX(measure_lock);
 
-#define MSR_CLK_DUTY		0x0
-#define MSR_CLK_REG0		0x4
-#define MSR_CLK_REG1		0x8
-#define MSR_CLK_REG2		0xc
-
 #define MSR_DURATION		GENMASK(15, 0)
 #define MSR_ENABLE		BIT(16)
 #define MSR_CONT		BIT(17) /* continuous measurement */
@@ -39,9 +34,20 @@ struct meson_msr_id {
 	const char *name;
 };
 
+struct msr_reg_offset {
+	unsigned int duty;
+	unsigned int reg0;
+	unsigned int reg1;
+	unsigned int reg2;
+	unsigned int reg3;
+	unsigned int reg4;
+	unsigned int reg5;
+};
+
 struct meson_msr_data {
 	struct meson_msr_id *msr_table;
 	unsigned int msr_count;
+	struct msr_reg_offset reg;
 };
 
 struct meson_msr {
@@ -495,6 +501,7 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 			    unsigned int duration)
 {
 	struct meson_msr *priv = clk_msr_id->priv;
+	struct msr_reg_offset *reg = &priv->data.reg;
 	unsigned int val;
 	int ret;
 
@@ -502,22 +509,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	if (ret)
 		return ret;
 
-	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
+	regmap_write(priv->regmap, reg->reg0, 0);
 
 	/* Set measurement duration */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
+	regmap_update_bits(priv->regmap, reg->reg0, MSR_DURATION,
 			   FIELD_PREP(MSR_DURATION, duration - 1));
 
 	/* Set ID */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
+	regmap_update_bits(priv->regmap, reg->reg0, MSR_CLK_SRC,
 			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
 
 	/* Enable & Start */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
+	regmap_update_bits(priv->regmap, reg->reg0,
 			   MSR_RUN | MSR_ENABLE,
 			   MSR_RUN | MSR_ENABLE);
 
-	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
+	ret = regmap_read_poll_timeout(priv->regmap, reg->reg0,
 				       val, !(val & MSR_BUSY), 10, 10000);
 	if (ret) {
 		mutex_unlock(&measure_lock);
@@ -525,10 +532,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	}
 
 	/* Disable */
-	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
+	regmap_update_bits(priv->regmap, reg->reg0, MSR_ENABLE, 0);
 
 	/* Get the value in multiple of gate time counts */
-	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
+	regmap_read(priv->regmap, reg->reg2, &val);
 
 	mutex_unlock(&measure_lock);
 
@@ -599,11 +606,10 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
 
-static const struct regmap_config meson_clk_msr_regmap_config = {
+static struct regmap_config meson_clk_msr_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.max_register = MSR_CLK_REG2,
 };
 
 static int meson_msr_probe(struct platform_device *pdev)
@@ -611,6 +617,7 @@ static int meson_msr_probe(struct platform_device *pdev)
 	const struct meson_msr_data *match_data;
 	struct meson_msr *priv;
 	struct dentry *root, *clks;
+	struct resource *res;
 	void __iomem *base;
 	int i;
 
@@ -636,15 +643,18 @@ static int meson_msr_probe(struct platform_device *pdev)
 	       match_data->msr_count * sizeof(struct meson_msr_id));
 	priv->data.msr_count = match_data->msr_count;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
 	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &meson_clk_msr_regmap_config);
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
+	memcpy(&priv->data.reg, &match_data->reg, sizeof(struct msr_reg_offset));
+
 	root = debugfs_create_dir("meson-clk-msr", NULL);
 	clks = debugfs_create_dir("clks", root);
 
@@ -667,26 +677,56 @@ static int meson_msr_probe(struct platform_device *pdev)
 static const struct meson_msr_data clk_msr_gx_data = {
 	.msr_table = (void *)clk_msr_gx,
 	.msr_count = ARRAY_SIZE(clk_msr_gx),
+	.reg = {
+		.duty = 0x0,
+		.reg0 = 0x4,
+		.reg1 = 0x8,
+		.reg2 = 0xc,
+	},
 };
 
 static const struct meson_msr_data clk_msr_m8_data = {
 	.msr_table = (void *)clk_msr_m8,
 	.msr_count = ARRAY_SIZE(clk_msr_m8),
+	.reg = {
+		.duty = 0x0,
+		.reg0 = 0x4,
+		.reg1 = 0x8,
+		.reg2 = 0xc,
+	},
 };
 
 static const struct meson_msr_data clk_msr_axg_data = {
 	.msr_table = (void *)clk_msr_axg,
 	.msr_count = ARRAY_SIZE(clk_msr_axg),
+	.reg = {
+		.duty = 0x0,
+		.reg0 = 0x4,
+		.reg1 = 0x8,
+		.reg2 = 0xc,
+	},
 };
 
 static const struct meson_msr_data clk_msr_g12a_data = {
 	.msr_table = (void *)clk_msr_g12a,
 	.msr_count = ARRAY_SIZE(clk_msr_g12a),
+	.reg = {
+		.duty = 0x0,
+		.reg0 = 0x4,
+		.reg1 = 0x8,
+		.reg2 = 0xc,
+	},
 };
 
 static const struct meson_msr_data clk_msr_sm1_data = {
 	.msr_table = (void *)clk_msr_sm1,
 	.msr_count = ARRAY_SIZE(clk_msr_sm1),
+	.reg = {
+		.duty = 0x0,
+		.reg0 = 0x4,
+		.reg1 = 0x8,
+		.reg2 = 0xc,
+	},
 };
 
 static const struct of_device_id meson_msr_match_table[] = {

-- 
2.42.0


