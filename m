Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D92E3B1D;
	Tue, 17 Jun 2025 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165532; cv=none; b=Yw/bvd4CiM6NWo1iqfWbJWODdwKHQpLMlb0tyXVnriYgAlY29VdIgBCzPHqYWaW9C0mWP98ajsFDBVoe29h/NZXtz8sEhXcAaOAb+O1SII7VsCto7HgqfHTjl54outMIgzVu62xR01EBFonrrpu/NA9yJqPKVDtsAQrwSSGQy50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165532; c=relaxed/simple;
	bh=52mB+OkXhbObcuM2sNfKTC1mh3Z99Xq9pKegXsN+DxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAOHYS67oIqDKNxuNookXT2gqvLZo+FTE+ZyctcySLNNjdegvOFRnE0UBPoivgk/LmNN+be4S4V/rednwWstF7J9ASVCaTYKr2JnRZ2pXFWRAY0zAy+lZrwewczPMPMrdTsaYmZA9hoIYMz5TVWca5UFLWASOshd+cy9rGgZ1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XU25yO4Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU25yO4Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so53723245e9.3;
        Tue, 17 Jun 2025 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165529; x=1750770329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtrByDGG0UqRbRit2/fCu6rNszxs/E/dVmgKbS88eJ8=;
        b=XU25yO4Y0Zr4MXtFZuoj9zJzcVQnXAOTiefJfJjX/b6O/AJSwr8NV9LyDUoY4DLCxH
         hoyfo9+u6pLyajoWvSHYuxSjOY6sI0tMT0p0fMSeAXQRRySFUPPvEY1rWFYVBSPygNx0
         CqyBHWj8ZIaFEVeYjRG5qPnCJ/OIEGNkBlejJm4FI2E+xpYSaL9qNVYwQ/i+4ezCmcdl
         j2c/8wemu4IZk7WfZ/Bz3JX/PvGpINI/+dzznj0JRxIazlcrSZjgF8owD+i7VG2PhQo/
         7yODBHdJ5GlwqGTaeA7ziTDqSDB3T7tx3mvzJOwoOqdaQRhHLTnmZS3U3yd1+66k/tVw
         CFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165529; x=1750770329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtrByDGG0UqRbRit2/fCu6rNszxs/E/dVmgKbS88eJ8=;
        b=j30+BagDE5A07/yvN6UGxT9H6RYHZ8nU9RnExZLNzDuS7VUQHLz7SkvXs17n2WYewP
         g3XFC/j+g9w8Rr1zbqAJLL1yFpfpWjgi37C/tNqCHFFeMJkN6ySBoQusmNT1/TLgeV1P
         iy+OFjCLPGFsrKlYxK7kY3BO1ZEH+DecSi4VJkdB+m/c+fl+tDMI7PHxMQ6m/pDkEeOf
         zB4vePJLcIFkUUBIAzroRGLCRVknSGxy8TpuyVO/NgPWxYdYdFY4G2GIv3Qo4guNGfO7
         nPoucKzhROP+Ht0Ns2RWWla0KYou3CG7cCJA62doaH+121Jsq8/o0nSNWUDmCanN9s/a
         jjXw==
X-Forwarded-Encrypted: i=1; AJvYcCV++iTkLd5+EaGs1MKF9pG4ul2kw5gVeiNSqrjt5AnT0kPXrtgPEtqXs6snfoE9S817NQdHO5jzPAt+@vger.kernel.org, AJvYcCVtcHPoEfulfPaKoAUlaLqRjwBVRiMQoHsZlvcHBaZqXYg0mCrmjIytniRyumOz9iGQnBuqi4DTZkxDfqmi@vger.kernel.org, AJvYcCWyv3KQ+tCOQWEsKjBV3AufNQd9lyOTG6H+yWdbkq2WgCyQHJeulT2Ea/zP7fqkF5Fk3wISjcycyWLe@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6tmX6OJ5cVvU5433gxITPUUWXv1pWrjpv2N97UXYY9ano/EQ
	36CA2VsVo028pryEFbL8vN17gds/gMUKegLueB/WvkxNTgx0hJ4KD7se
X-Gm-Gg: ASbGncuQFlktALsdXTZQ58kokhKgbuKrFYO4dPDLwmVjJHCr6k8ABYvtJZWhtkyB3K2
	fJ2vpaN6/2jL+8aew2yAxD3OvjTFGBAWcf+CeRzXFvqKT/7f8wsVKtkcA03dvh2LP3O4a7dulam
	/QFl9oZih7hrR3YCLNzcw3vjpS0geb3u7dnbmUHwENYN4yYn+ndEKjpNvXUZ/HX9TPOvn8GwETk
	8Z7ups/Jd1SS/g2hEaaZl3jLEV/Ak0buxiqf8ObP3ngzNU079uYHICW+f5c3tLwEEorWNEN6VS7
	lBBVveMAN0QwOMHXgSJrl0Hp5m0cEV4r4o8TgGGmbagG2ZkvmfNdd4V8HbARWnB9L1ljAdqo2fT
	VOBjlrsAP21UEcTMIksfkZyF3gw+NAkg=
X-Google-Smtp-Source: AGHT+IEzy9bLc0erMMNCdn7dMZ134pmoxoRxde0R/B29IOpgw70NNoyq3eFF9LKNA3Lc147rNDf2kA==
X-Received: by 2002:a05:600d:13:b0:453:c39:d0c6 with SMTP id 5b1f17b1804b1-45344d8f6d6mr67930375e9.32.1750165527251;
        Tue, 17 Jun 2025 06:05:27 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:26 -0700 (PDT)
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
Subject: [PATCH v2 02/10] clk: en7523: generalize register clocks function
Date: Tue, 17 Jun 2025 15:04:45 +0200
Message-ID: <20250617130455.32682-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250617130455.32682-1-ansuelsmth@gmail.com>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
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

While at it rework some function to return error and use devm variant
for clk_hw_regiser.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 148 +++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 82 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 314e7450313f..b040f0f0d727 100644
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
 
@@ -450,10 +452,11 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 		.ops = &soc_data->pcie_ops,
 	};
 	struct en_clk_gate *cg;
+	int err;
 
 	cg = devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
 	if (!cg)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	cg->map = clk_map;
 	cg->hw.init = &init;
@@ -461,12 +464,62 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
-		return NULL;
+	err = devm_clk_hw_register(dev, &cg->hw);
+	if (err)
+		return ERR_PTR(err);
 
 	return &cg->hw;
 }
 
+static int en75xx_register_clocks(struct device *dev,
+				  const struct en_clk_soc_data *soc_data,
+				  struct clk_hw_onecell_data *clk_data,
+				  struct regmap *map, struct regmap *clk_map)
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
+			return err;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		err = regmap_read(map, reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk div %s: %d\n",
+			       desc->name, err);
+			return err;
+		}
+		rate /= en7523_get_div(desc, val);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			return PTR_ERR(hw);
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, clk_map);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	return 0;
+}
+
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
@@ -504,38 +557,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
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
@@ -543,6 +564,7 @@ static const struct regmap_config en7523_clk_regmap_config = {
 };
 
 static int en7523_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	void __iomem *base, *np_base;
@@ -566,51 +588,7 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7523_register_clocks(&pdev->dev, clk_data, map, clk_map);
-
-	return 0;
-}
-
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
+	return en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -689,10 +667,12 @@ static int en7581_reset_register(struct device *dev, struct regmap *map)
 }
 
 static int en7581_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	struct regmap *map, *clk_map;
 	void __iomem *base;
+	int ret;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -706,7 +686,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, clk_map);
+	ret = en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
+	if (ret)
+		return ret;
 
 	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
 			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -732,7 +714,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, clk_data);
+	r = soc_data->hw_init(pdev, soc_data, clk_data);
 	if (r)
 		return r;
 
@@ -740,6 +722,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.base_clks = en7523_base_clks,
 	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
@@ -750,6 +733,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.48.1

