Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E8A72635;
	Wed, 28 May 2025 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748393397; cv=none; b=Oxg3EEvdLQ5GqMxQnIV6OAvPDS214lr+36Ovvz7VM+FYPfpJHzsjmpCkshcZskqlvk2b5Q4ctwUVFiZ1UO3Fa2xCy9ZallZ80xoggnDDFgGgMqUs+epxVR2/f+lB0pYje6t15XyuNfxrjspDQPtkBx9kNOjm/6f/Ung+tDB9OSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748393397; c=relaxed/simple;
	bh=LQAifSRcM/XF1iWlP0bQoP/dBRjcJd9pXhXVszdoiyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7JzReDw4gNPI+DF6MUoWSGzGKTdzIoTvq6Yjcb8XC1m2VEYCjWlP3EtzobheSUbDKFa5faTzAVQkoZPFYTX5uCH24XK/cQPkGj2IcVTIgUgz96HP7wlDnpTJ2fH2LghBKhX/1dHwaiIPi4szBlKuL2TkU7utlCRnoReVRMDeKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW73aU3H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW73aU3H"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-440685d6afcso48326005e9.0;
        Tue, 27 May 2025 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748393394; x=1748998194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trnS+Ovi4n5Cs0VHPzA7w7h/YZdRnPhKuNvPxs4l/Og=;
        b=EW73aU3HEjI8oj2L3Drtcsg/3ytN3l6zqUzBIdyJimUZHML/ryLyi7GfUF8431wDOH
         LiLJ2Gr8iF9Uh0PxtPQIc6/vo/y+xszWz5hvfwgqq94qhYWyD8z1Maywcl5TDy9H3yDL
         TJCbwU/4PN4nLCC6fdWRqjghCEJon5pU40tYuxv90B+pRn27rjoq41KyD5zNhZRDWiZk
         MCkhCxOOrHEdQgGD/celH/IPOCP2CahD+snoiqSrc4H/ztH8mlM7CjSrqlXgnVPeyDpw
         G2TIESOHLnNcMVcGMW9xCmnTHUflKLHvPKaswcx9GFse/iWNn7OMlx7+neF4Ba/u1P1A
         Q1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393394; x=1748998194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trnS+Ovi4n5Cs0VHPzA7w7h/YZdRnPhKuNvPxs4l/Og=;
        b=fXBLiLQvbEF8+1SSJ2Ea/MlIvUhJ85WnAbGn4Kcs+u7+UBhaupFu2f1P+EXzB9bkMh
         eu9jg6qvo+2JW3S0vE1tdEyCIrubkOxxxUktsMEzcnnO3CjEyyA8uNpzQUjxKG4LbES1
         B9UDZ4pY/xxuXavjL1XZGAJfHkDAhTNdzjJPlwSwrFaIF3a+dCUyE2EoPQB01bU5qDQT
         AucyVN2laoJT8IFzKaKZm4d6A1FoaEEFbRx4+66ERdsIGCFS3xz0EiDvTFMEaHlGVC6/
         1oNHtE95pge26KpDr6uecN3zce+N8DOaK615X/MVC/NscZ5EbXMby19b5eH+0HL5KGV6
         6Pow==
X-Forwarded-Encrypted: i=1; AJvYcCUYyUASSGjziRBVVR11Kfrwb4D6Ob2Ye9u2JmBAc171mynN5MTs8aQ1i5QeZzrzL/GY0jqaSvrjiSykidKY@vger.kernel.org, AJvYcCWsAgiRXkgwFgvDKuhamgPk375as9eax17OkftytlczqzT++NxNEOGB6GfJYx+GAjA62N618wHc0nh8@vger.kernel.org, AJvYcCXlkndSOj5h1Va3v3fDiPiDzpfN91ieBmfNzPFLiwsgrB9tJcgSFn30VPRRW7NvJVuQ1r7l5PFproTv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy67yIJ3t4PMoRR4kGhbgzfZ7z5ozAO4cka1e4QTlSANiH4u5C1
	5NadIFHZMG0NhrnCjzIY/eGMFQcTmxKpCNsR2dJs58zwy2DFim8MQ6+6
X-Gm-Gg: ASbGncsXfpqEdelq/RlgO2wdP/wnAJLA1jNjhY4ZRyRsEAxH3Wmdo4MGR1vztXx1QXV
	csMA5CCw/ZkmRrK61CF9d1Cx73SNPksgm1KSWma4qXnAxBDpowbYVynM8qjo4Fv6aTmiX5X59uT
	MqCyVmGp9ksZR/grxi3IooFaYjbtZ8FedxFzh3yy1AhkqPYph7x2kWjGQpeM2rJujEUYXKSAcBQ
	ELyY5wZNKo+/gZgQFQ5YJfsiDdWO4hFjisJqBP6j/CzQ2lFfbavCx/ZP+1MbhXoajF5JGWtj51j
	Oyvlj15qKHOxW6Y6/8uyY9putyOnQ83l0UJ/Wh7VZRxINa0aElYBZbfoYZucTsjiMPrO8tL9QoT
	K1xo8ev2MD4gd0eSk+8q4
X-Google-Smtp-Source: AGHT+IG4pxioXPr5D7tk4GyBxAQoDRASfuzKx0V/L+MmKqz6idmmCe/6/DYlgTQDId4PSafN6n8ewQ==
X-Received: by 2002:a05:600c:3e84:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-44c948455e5mr109066035e9.19.1748393394020;
        Tue, 27 May 2025 17:49:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44fccee6c54sm33682535e9.1.2025.05.27.17.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:49:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/5] clk: en7523: generalize register clocks function
Date: Wed, 28 May 2025 02:49:15 +0200
Message-ID: <20250528004924.19970-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250528004924.19970-1-ansuelsmth@gmail.com>
References: <20250528004924.19970-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize register clocks function for Airoha EN7523 and EN7581 clocks
driver. The same logic is applied for both clock hence code can be
reduced and simplified by putting the base_clocks struct in the soc_data
and passing that to a generic register clocks function.

There is always the pattern where the clock is incremented by one to
account for the PCIe one.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 130 ++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 77 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 314e7450313f..07ab5b42fd5a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -78,8 +78,10 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
+		       const struct en_clk_soc_data *soc_data,
 		       struct clk_hw_onecell_data *clk_data);
 };
 
@@ -467,6 +469,50 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	return &cg->hw;
 }
 
+static void en75xx_register_clocks(struct device *dev,
+				   const struct en_clk_soc_data *soc_data,
+				   struct clk_hw_onecell_data *clk_data,
+				   struct regmap *map, struct regmap *clk_map)
+{
+	struct clk_hw *hw;
+	u32 rate;
+	int i;
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
+		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		int err;
+
+		err = regmap_read(map, desc->base_reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk rate %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		err = regmap_read(map, reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk div %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate /= en7523_get_div(desc, val);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, clk_map);
+	clk_data->hws[EN7523_CLK_PCIE] = hw;
+}
+
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
@@ -504,38 +550,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	usleep_range(1000, 2000);
 }
 
-static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, struct regmap *clk_map)
-{
-	struct clk_hw *hw;
-	u32 rate;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7523_base_clks[i];
-		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		u32 val;
-
-		regmap_read(map, desc->base_reg, &val);
-
-		rate = en7523_get_base_rate(desc, val);
-		regmap_read(map, reg, &val);
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
-		clk_data->hws[desc->id] = hw;
-	}
-
-	hw = en7523_register_pcie_clk(dev, clk_map);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
-}
-
 static const struct regmap_config en7523_clk_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -543,6 +557,7 @@ static const struct regmap_config en7523_clk_regmap_config = {
 };
 
 static int en7523_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	void __iomem *base, *np_base;
@@ -566,53 +581,11 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7523_register_clocks(&pdev->dev, clk_data, map, clk_map);
+	en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
 
 	return 0;
 }
 
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, struct regmap *clk_map)
-{
-	struct clk_hw *hw;
-	u32 rate;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		int err;
-
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
-
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
-		clk_data->hws[desc->id] = hw;
-	}
-
-	hw = en7523_register_pcie_clk(dev, clk_map);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
-}
-
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -689,6 +662,7 @@ static int en7581_reset_register(struct device *dev, struct regmap *map)
 }
 
 static int en7581_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	struct regmap *map, *clk_map;
@@ -706,7 +680,7 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, clk_map);
+	en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
 
 	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
 			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -732,7 +706,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, clk_data);
+	r = soc_data->hw_init(pdev, soc_data, clk_data);
 	if (r)
 		return r;
 
@@ -740,6 +714,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.base_clks = en7523_base_clks,
 	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
@@ -750,6 +725,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.48.1

