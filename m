Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BB1C84B2;
	Wed, 28 May 2025 00:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748393402; cv=none; b=P4nUZtY2IgzCC0kVhIa1SV6sCzvnxEaOXEtqxrvNkWdNxoCzPb/gvRHJVAOcRjJKuNyavQdtx9YLXYtBeDt7ee9wc5jjEvyDKNzJXjeM9On+j9zp2yPy6kX89doEH/C9YLVBJKe9dPLD/lUdnKUSFFh45d+5mURApOEkcl1+BYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748393402; c=relaxed/simple;
	bh=gpBLtlkGM4oAG9AwfT2x15Xi285hIx49/ofZvJOQccM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/2L8YvM3kRysHlRrfDRq/Obz4nV2mTeNLG1Qq/fRD533lp4veN9k7p00AG13pnPWyMZObSWUZOSGpJfEcXDJCPm7nUF6x9crBFXvurnDObwfE/QKML+IqLXoQk0uUYr1D97QaWe3i/m6eN80nKycikORtwQaIEdn5SgEKUfLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYgSwoKR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYgSwoKR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4508287895dso75265e9.1;
        Tue, 27 May 2025 17:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748393398; x=1748998198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMepoabFQW1etE0k1cIZwoujR5CGEJouw2O2av/kOeQ=;
        b=HYgSwoKRL79BAZvwg5d483v3IiyDZfQCGhMDqsO8hIUuTflVr23deNFKCZ1tR9Tfcy
         HTPuOn0HF7elrKDVQre80xZJgdJvKU+YIvhE7S2A0dicO1CAXavbdnbVNq16XMqMSIUD
         FAus5c++9eYB9IgNnvXGMHLIYgKO2XgkVF9EeZ1FLQUzNrESCsRBE8lRQ2lTTHqDpx8b
         BiQkNaot69OhqD+gwAtO7/JI7JUKnmtN/Hd0ohTOhpC2xCEHEpuXuROKwOuMv72xo7L3
         9ZAqqmnd00/rPvf5bS5Ri/meZFHsY6v2FnQRXQAPZEdpGXb3lOBTsP64RwJXWR06502S
         2ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393398; x=1748998198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMepoabFQW1etE0k1cIZwoujR5CGEJouw2O2av/kOeQ=;
        b=Fgxb7RcXuxfoBz1lYp4gNWmN02kiGhoWlYmN9lG/5weNtCUkiveGjYWMSKDLO4ltaV
         V+ULJo4McpGWMexgq51HXV4rmXJP8d6OuUOylRlu0Cwdhm4mEfoF8mX+uC2BLqjFxRMf
         JzfALlGAHJE7B4eqKQddBWWULT2zuVC7Id+BVLnwvfDCQdNHc3HmaDlJP9PsnsId8DIp
         5YOTE0nWg/p2YOPJRSBWqMPRuucpx7GspHVRBFYUp8UNtEjqW//lsFRdrKgZAnoN0tNh
         wZl3WLy4MZ5JJ4dH5DSbARBFbeDLXqXja7ePe1GPHT9naV0ym2fi4FnSLKmHg47RP8MX
         rXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa8eu9AOKLPXN0DEHIdNgDKpgC3G0VDZvU5GZJWkTDAFyxHA9pDz2fd2G3b0KQouWVf0RZQAM9r1RJA9bB@vger.kernel.org, AJvYcCVOrR9fdtx1ZlwEMJ3KhHiT/DDXTlH0aOCKGgsFi2vtBZIjHaR6K7S4oriTpHx6KBi2uhSsfvZuSslf@vger.kernel.org, AJvYcCVwNmV36R3vjXf+dZXA1/S/dM+a0YSk+UVUpWrlpxHaOeL4DKFKVNjSNCZnkLNNx1taQHBCtUbOkSED@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTgQGBLa+/SJS9aP1agCLJ+3tKtG0GhCLByOXWE3zNmAjfE73
	QTjBK0KEkLYXDRfKSulfJZmwK0OKnVK9dyXPkq93JRD8Ibi1JcooDFLcyY5NOA==
X-Gm-Gg: ASbGncsi+qowL4svszMF2K88m2EAl+Y16nfTTCAVtYKa9ZNQ6QmET70aUFQYChxQF6/
	rTU5VleCgz7kpoZppN8qF6hYJjbGPKKg9AE/ghNULJRDT3FwY2mVrNZGBHE/HwwZqJd/pQo7DW0
	N06L/ANxs6lm5XmEfHJPepnOKyiNFyyy1aU/K7pX02oS6mD0MVzHdyxL5kfiJ0U7aeCWFXraH3o
	xmeLGe3qw5RqEdsuSMyRaqCBxkTl6hp2GZSzXMYSvfc/sbCjRs5L+mB5+hUKE3caAF4lNgzM+bI
	iQSwR/fz6vdgpkjRFKojx7sZ4AbVN8M77xv/9qs5ci3sYCb9DKcKNLpkUTvVjveBRKk1eL9Wmrt
	a5Q1ArZpvZdZBavE8++E5
X-Google-Smtp-Source: AGHT+IEuqcts/Y9EqxufAqkAoh7hMxdfIPHQIbWJcVRP6UTF+zluZL7rrWRJBesNSyU5r9iWVbJM9Q==
X-Received: by 2002:a05:600c:6818:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-44fd1a01b05mr23103845e9.3.1748393398085;
        Tue, 27 May 2025 17:49:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44fccee6c54sm33682535e9.1.2025.05.27.17.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:49:57 -0700 (PDT)
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
Subject: [PATCH 5/5] clk: en7523: add support for Airoha AN7583 clock
Date: Wed, 28 May 2025 02:49:18 +0200
Message-ID: <20250528004924.19970-6-ansuelsmth@gmail.com>
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

Add support for Airoha AN7583 clock and reset.

Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 231 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 07ab5b42fd5a..65c7b66ab78f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -11,6 +11,7 @@
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/reset/airoha,an7583-reset.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -96,6 +97,14 @@ static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
+/* AN7583 */
+static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
+static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
+static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
+static const u32 spi7583_base[] = { 100000000, 12500000 };
+static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
+static const u32 crypto7583_base[] = { 540672000, 400000000 };
+static const u32 emmc7583_base[] = { 150000000, 200000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -298,6 +307,114 @@ static const struct en_clk_desc en7581_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc an7583_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = gsw7583_base,
+		.n_base_values = ARRAY_SIZE(gsw7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = emi7583_base,
+		.n_base_values = ARRAY_SIZE(emi7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_BUS,
+		.name = "bus",
+
+		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = bus7583_base,
+		.n_base_values = ARRAY_SIZE(bus7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_SLIC,
+		.name = "slic",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 1,
+		.base_values = spi7583_base,
+		.n_base_values = ARRAY_SIZE(spi7583_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 9,
+		.base_values = npu7583_base,
+		.n_base_values = ARRAY_SIZE(npu7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_CRYPTO,
+		.name = "crypto",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = crypto7583_base,
+		.n_base_values = ARRAY_SIZE(crypto7583_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 13,
+		.base_values = emmc7583_base,
+		.n_base_values = ARRAY_SIZE(emmc7583_base),
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -361,6 +478,59 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
+static const u16 an7583_rst_map[] = {
+	/* RST_CTRL2 */
+	[AN7583_XPON_PHY_RST]		= 0,
+	[AN7583_GPON_OLT_RST]		= 1,
+	[AN7583_CPU_TIMER2_RST]		= 2,
+	[AN7583_HSUART_RST]		= 3,
+	[AN7583_UART4_RST]		= 4,
+	[AN7583_UART5_RST]		= 5,
+	[AN7583_I2C2_RST]		= 6,
+	[AN7583_XSI_MAC_RST]		= 7,
+	[AN7583_XSI_PHY_RST]		= 8,
+	[AN7583_NPU_RST]		= 9,
+	[AN7583_TRNG_MSTART_RST]	= 12,
+	[AN7583_DUAL_HSI0_RST]		= 13,
+	[AN7583_DUAL_HSI1_RST]		= 14,
+	[AN7583_DUAL_HSI0_MAC_RST]	= 16,
+	[AN7583_DUAL_HSI1_MAC_RST]	= 17,
+	[AN7583_WDMA_RST]		= 19,
+	[AN7583_WOE0_RST]		= 20,
+	[AN7583_HSDMA_RST]		= 22,
+	[AN7583_TDMA_RST]		= 24,
+	[AN7583_EMMC_RST]		= 25,
+	[AN7583_SOE_RST]		= 26,
+	[AN7583_XFP_MAC_RST]		= 28,
+	[AN7583_MDIO0]			= 30,
+	[AN7583_MDIO1]			= 31,
+	/* RST_CTRL1 */
+	[AN7583_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[AN7583_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[AN7583_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[AN7583_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[AN7583_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[AN7583_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[AN7583_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[AN7583_UART_RST]		= RST_NR_PER_BANK + 12,
+	[AN7583_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[AN7583_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[AN7583_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[AN7583_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[AN7583_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[AN7583_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[AN7583_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[AN7583_FE_RST]			= RST_NR_PER_BANK + 21,
+	[AN7583_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[AN7583_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[AN7583_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[AN7583_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[AN7583_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[AN7583_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
+	[AN7583_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[AN7583_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+};
+
 static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
 	if (!desc->base_bits)
@@ -690,6 +860,54 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	return en7581_reset_register(&pdev->dev, clk_map);
 }
 
+static int an7583_reset_register(struct device *dev, struct regmap *map)
+{
+	struct en_rst_data *rst_data;
+
+	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
+	if (!rst_data)
+		return -ENOMEM;
+
+	rst_data->bank_ofs = en7581_rst_ofs;
+	rst_data->idx_map = an7583_rst_map;
+	rst_data->map = map;
+
+	rst_data->rcdev.nr_resets = ARRAY_SIZE(an7583_rst_map);
+	rst_data->rcdev.of_xlate = en7523_reset_xlate;
+	rst_data->rcdev.ops = &en7581_reset_ops;
+	rst_data->rcdev.of_node = dev->of_node;
+	rst_data->rcdev.of_reset_n_cells = 1;
+	rst_data->rcdev.owner = THIS_MODULE;
+	rst_data->rcdev.dev = dev;
+
+	return devm_reset_controller_register(dev, &rst_data->rcdev);
+}
+
+static int an7583_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *map, *clk_map;
+
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	clk_map = device_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(clk_map))
+		return PTR_ERR(clk_map);
+
+	en75xx_register_clocks(dev, soc_data, clk_data, map, clk_map);
+
+	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
+			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
+	regmap_update_bits(clk_map, REG_NP_SCU_PCIC, REG_PCIE_CTRL,
+			   FIELD_PREP(REG_PCIE_CTRL, 3));
+
+	return an7583_reset_register(dev, clk_map);
+}
+
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -736,9 +954,22 @@ static const struct en_clk_soc_data en7581_data = {
 	.hw_init = en7581_clk_hw_init,
 };
 
+static const struct en_clk_soc_data an7583_data = {
+	.base_clks = an7583_base_clks,
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.enable = en7581_pci_enable,
+		.disable = en7581_pci_disable,
+	},
+	.hw_init = an7583_clk_hw_init,
+};
+
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-clock", .data = &an7583_data },
 	{ /* sentinel */ }
 };
 
-- 
2.48.1

