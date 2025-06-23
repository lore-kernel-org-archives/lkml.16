Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B1275104
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696674; cv=none; b=O+dLaQ2tjBtfXcgSBEdF/GC71aBlAlLmA4BeQM5NL6TqyJ5jQdu702D5MZTRK3/5fm0UW9kFrIoL5ojbtBu8qqz3dxG/UtZJd12X7ZTrPwepwfqpsa/bhrsXbsT3Qz7AbsA384eCj4fMDiuxVmsh70HrzEq+6r1kCU8nKhhp3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696674; c=relaxed/simple;
	bh=XnR254nsKtItIm4mhcbKxkbaJUQzvXXFsXM0vjL9vfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYf9Qbn6Z6UmATX43Gp/IPRvYwB7/j6KjjridyCh47STubY2T4JLS22X/085fzNtiL7Aw0XK16dJ+2hPZ/vXvnUWMuHyyJ6P4OIxY3B2Slsj7nPAwRBW8rRZv0vMG9b5MoXmGr9o2aI6JDsUTLHCRkohgJ4pO6pEOMfl9HLm/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EFO2i1zq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EFO2i1zq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2849274f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696668; x=1751301468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KExF9Yfdrb1vy6bYcTrnHLuZF6n+ZuYkA3FFkjv3UoA=;
        b=EFO2i1zqmXv0xABGtAQbec5m7RbrnCSKuXE5hwShXLb7DtOjh+ihRVWB8Y9L6XXlMN
         pr/gmIKDfmIqEJA89uZrJx9lwbu4QzHXu8XJ2V0UY8ujOPolKYg9dF7/s6kbZP/CcoZB
         hX0Ud94/2gxoWny1H6LXHr5CmjbylyaBSu7qD3XIv0kZvlLcRN7PhUPAFZRXNaEisjjx
         2vAhUY0+5+uan7VRApC1F6X1hxEssf7UyijBQ5FXFz3zGw8D8/Svq9JND2V7Qi2laDLA
         L6vowGvoi9SXHp57JP3gy0VHzESZKpRLaPcBKLn6uO+Gh6V8bTG9RAXkcTmS3FNnDkAK
         HanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696668; x=1751301468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KExF9Yfdrb1vy6bYcTrnHLuZF6n+ZuYkA3FFkjv3UoA=;
        b=UDqvTLpi/vXOAqDhI113anA57degx1yIag53NPougUH3C3H1SF1DVEuEH4dNkXFQ2w
         OXJv+GIoi/FGf72sp5PQQUOj0ylCLLbUdqv/PuBBtHkJGauDLP1gHBZf5rroKbJ++VQu
         /tq57l2HpmH0XvY50mbRSD5b/VGx6NF2J/BTsRWcDvrAvpy9OK71ZXGxC7aZpBk4R4tA
         ZgPeSqT3yHu7IW7tuHydFFB9ocH4xGw9eknDu84KzUt5K1s6sKSV6jtsxbkBWS1HTlh7
         JwGegYXujP7xhnaI+t3Y9BHL9cUR3vX00W2fJNksjf3ChpgSMVaP3wM2fJr4KYcujsM0
         7kNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzfZ43+OCck7MnfQxZxtwRl1AwWcgNqVwOz1KdewscgXquLIADPhtfUK90+pFMKfY3lKBJNxR1ZVgy5LM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5VxuoZy7IV3ZTWd0LnGBJxskSbcLOFv5i4Sr0+OiUab/4HUy9
	4bt/q6IQ36/Wf4RB/7f/EDyTPr6fCRA/XiqWe/JPrW6Z31Bahnf/DDXlypEGiZtfnU0=
X-Gm-Gg: ASbGncuc/WGx9FZz5j318PS3AjZzDLMluYZk3oiJ4QS37S3/1+2ECYPN5BDWiqu8ibK
	5d2jakDvXJzBiEpz+x3BjCn7SCqd88Xc2+M9Ylme639qaUqJ3SVEEb0aRbzvn/Zv64/cKN6Jagi
	KCS2GX1UOEvE0ZKjH9MoeeSMwd1alfF++Bt8HFHnwP7P6t3SJRjnWwM0XQ1NV91RyTIMHwzwOvd
	Jtjvt5pfo2ddDL/lCBwpSpacn3FvEkbZXanBtUyn6hOBnsmOM8UG4uwA7EtRDejepINEqxhoYGr
	uzAU7rZcSueod/o05UB3K+FyXeIOY5iZImVoIPt4dPxheRSPYTGN9p9fkY4JfCf/fRL/eIHR9am
	u
X-Google-Smtp-Source: AGHT+IFmFbRbmB4KnjXwURb4U1kof0zd5slqL1+SyNLc0nhGK2ZrdIM9D6212BaWyiqiJ6ojborhQA==
X-Received: by 2002:a05:6000:188f:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a6e71df106mr175963f8f.22.1750696668037;
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 18:37:38 +0200
Subject: [PATCH v4 2/3] clk: amlogic: drop clk_regmap tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-2-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=61140; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XnR254nsKtItIm4mhcbKxkbaJUQzvXXFsXM0vjL9vfE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLXpdbkKzZBobPqH1UY+3JHDbnfeHlqwirRQ
 27kEw3s3Z2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC1wAKCRDm/A8cN/La
 hSc1D/0Uwu7mqD7g0EvVBBri3o0EGFmGi5mQ75dtGa06tqDwtNQRpt3NBMqO6wTWMBpY8hG9qCA
 hUW28pefnlPD+67zhLLJc+OnhjLJwGp5XMUZ3MxNGAmTBu3Q6uOMw78G1X8sX+C3gSH2bex+AAM
 qB4sbdbxU9lb1G8jhes9IXg2FoKfTx9b3kHenX0SmYrfhYkck/Fzj7iV5Dd4tiF3eAJimMmjH8a
 Yi5kRg24KuPJOfQ4agU/0ss5095XN3qpOpcwhI96QJn7S2KQruVtfWCRvQqD7VBQ7shEXmJL8dU
 Vh6CWBf7Fx9BncuL/QCBVagNNWogjw1XJq2fTMg3ULI+VX4FqjwNIbFkgcGwks7Rrc3ABJ0ilrZ
 w7enjYmiHPXMJj6VGoHVYL3we2qKxW2j7E8eEuZxhImoQS+w1DSkWDSjGKB96oACVYU/DN0nP33
 FOtCtKozhYgzTaXydOWRrzWspx4ui13wxwM4486ykLA4rdtYN9NQQXFDTJhmFmpUiazAFeGh2qM
 n0yvL3v4gRTkRVTo9i11oeh/vT+KYTFXqLTc4leHN8GCeWQnxtT6OQms2flAkBFPW2jo1panz7+
 9Vz2wUBGdfFADWSTX7C5xubfnSx1uth+dVYIjqkMTZY6QpiRKHAFjZcIBEoTCV2i6hlHyB1G1k4
 CxxYh4PCVrwUNAQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Remove the clk_regmap tables that are used to keep track which clock
need to be initialised before being registered. The initialisation is now
done by the .init() operation of clk_regmap.

This rework saves a bit memory and makes maintenance a bit easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/a1-peripherals.c | 163 +-------------
 drivers/clk/meson/a1-pll.c         |  16 +-
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 433 -------------------------------------
 drivers/clk/meson/axg.c            | 131 -----------
 drivers/clk/meson/c3-peripherals.c | 210 +-----------------
 drivers/clk/meson/c3-pll.c         |  32 +--
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 261 ----------------------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 393 ---------------------------------
 drivers/clk/meson/meson-aoclk.c    |   5 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   4 -
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |   9 -
 drivers/clk/meson/meson8b.c        | 200 -----------------
 drivers/clk/meson/s4-peripherals.c | 229 --------------------
 drivers/clk/meson/s4-pll.c         |  31 ---
 19 files changed, 5 insertions(+), 2191 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 8ae02df3490b4242a59b07266c741cb50dbf7b97..1f5d445d44fe7501d9f20380cd2b527109564630 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2055,163 +2055,6 @@ static struct clk_hw *a1_periphs_hw_clks[] = {
 	[CLKID_DMC_SEL2]		= &dmc_sel2.hw,
 };
 
-/* Convenience table to populate regmap in .probe */
-static struct clk_regmap *const a1_periphs_regmaps[] = {
-	&xtal_in,
-	&fixpll_in,
-	&usb_phy_in,
-	&usb_ctrl_in,
-	&hifipll_in,
-	&syspll_in,
-	&dds_in,
-	&sys,
-	&clktree,
-	&reset_ctrl,
-	&analog_ctrl,
-	&pwr_ctrl,
-	&pad_ctrl,
-	&sys_ctrl,
-	&temp_sensor,
-	&am2axi_dev,
-	&spicc_b,
-	&spicc_a,
-	&msr,
-	&audio,
-	&jtag_ctrl,
-	&saradc_en,
-	&pwm_ef,
-	&pwm_cd,
-	&pwm_ab,
-	&cec,
-	&i2c_s,
-	&ir_ctrl,
-	&i2c_m_d,
-	&i2c_m_c,
-	&i2c_m_b,
-	&i2c_m_a,
-	&acodec,
-	&otp,
-	&sd_emmc_a,
-	&usb_phy,
-	&usb_ctrl,
-	&sys_dspb,
-	&sys_dspa,
-	&dma,
-	&irq_ctrl,
-	&nic,
-	&gic,
-	&uart_c,
-	&uart_b,
-	&uart_a,
-	&sys_psram,
-	&rsa,
-	&coresight,
-	&am2axi_vad,
-	&audio_vad,
-	&axi_dmc,
-	&axi_psram,
-	&ramb,
-	&rama,
-	&axi_spifc,
-	&axi_nic,
-	&axi_dma,
-	&cpu_ctrl,
-	&rom,
-	&prod_i2c,
-	&dspa_sel,
-	&dspb_sel,
-	&dspa_en,
-	&dspa_en_nic,
-	&dspb_en,
-	&dspb_en_nic,
-	&rtc,
-	&ceca_32k_out,
-	&cecb_32k_out,
-	&clk_24m,
-	&clk_12m,
-	&fclk_div2_divn,
-	&gen,
-	&saradc_sel,
-	&saradc,
-	&pwm_a,
-	&pwm_b,
-	&pwm_c,
-	&pwm_d,
-	&pwm_e,
-	&pwm_f,
-	&spicc,
-	&ts,
-	&spifc,
-	&usb_bus,
-	&sd_emmc,
-	&psram,
-	&dmc,
-	&sys_a_sel,
-	&sys_a_div,
-	&sys_a,
-	&sys_b_sel,
-	&sys_b_div,
-	&sys_b,
-	&dspa_a_sel,
-	&dspa_a_div,
-	&dspa_a,
-	&dspa_b_sel,
-	&dspa_b_div,
-	&dspa_b,
-	&dspb_a_sel,
-	&dspb_a_div,
-	&dspb_a,
-	&dspb_b_sel,
-	&dspb_b_div,
-	&dspb_b,
-	&rtc_32k_in,
-	&rtc_32k_div,
-	&rtc_32k_xtal,
-	&rtc_32k_sel,
-	&cecb_32k_in,
-	&cecb_32k_div,
-	&cecb_32k_sel_pre,
-	&cecb_32k_sel,
-	&ceca_32k_in,
-	&ceca_32k_div,
-	&ceca_32k_sel_pre,
-	&ceca_32k_sel,
-	&fclk_div2_divn_pre,
-	&gen_sel,
-	&gen_div,
-	&saradc_div,
-	&pwm_a_sel,
-	&pwm_a_div,
-	&pwm_b_sel,
-	&pwm_b_div,
-	&pwm_c_sel,
-	&pwm_c_div,
-	&pwm_d_sel,
-	&pwm_d_div,
-	&pwm_e_sel,
-	&pwm_e_div,
-	&pwm_f_sel,
-	&pwm_f_div,
-	&spicc_sel,
-	&spicc_div,
-	&spicc_sel2,
-	&ts_div,
-	&spifc_sel,
-	&spifc_div,
-	&spifc_sel2,
-	&usb_bus_sel,
-	&usb_bus_div,
-	&sd_emmc_sel,
-	&sd_emmc_div,
-	&sd_emmc_sel2,
-	&psram_sel,
-	&psram_div,
-	&psram_sel2,
-	&dmc_sel,
-	&dmc_div,
-	&dmc_sel2,
-};
-
 static const struct regmap_config a1_periphs_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
@@ -2229,7 +2072,7 @@ static int meson_a1_periphs_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct regmap *map;
-	int clkid, i, err;
+	int clkid, err;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -2241,10 +2084,6 @@ static int meson_a1_periphs_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(map),
 				     "can't init regmap mmio region\n");
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(a1_periphs_regmaps); i++)
-		a1_periphs_regmaps[i]->map = map;
-
 	for (clkid = 0; clkid < a1_periphs_clks.num; clkid++) {
 		err = devm_clk_hw_register(dev, a1_periphs_clks.hws[clkid]);
 		if (err)
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index f0ba283cf1d0754bfe48e2e67b0d0b89498100a5..dabd4fad1f57bdfa1d755298cd07a48d345e56a9 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -295,16 +295,6 @@ static struct clk_hw *a1_pll_hw_clks[] = {
 	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
 };
 
-static struct clk_regmap *const a1_pll_regmaps[] = {
-	&fixed_pll_dco,
-	&fixed_pll,
-	&fclk_div2,
-	&fclk_div3,
-	&fclk_div5,
-	&fclk_div7,
-	&hifi_pll,
-};
-
 static const struct regmap_config a1_pll_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
@@ -322,7 +312,7 @@ static int meson_a1_pll_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct regmap *map;
-	int clkid, i, err;
+	int clkid, err;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -334,10 +324,6 @@ static int meson_a1_pll_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(map),
 				     "can't init regmap mmio region\n");
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(a1_pll_regmaps); i++)
-		a1_pll_regmaps[i]->map = map;
-
 	/* Register clocks */
 	for (clkid = 0; clkid < a1_pll_clks.num; clkid++) {
 		err = devm_clk_hw_register(dev, a1_pll_clks.hws[clkid]);
diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index f44091ffb57d93c624049b2ced878ede5540e246..cd5d0b5ebdb237a74129b44410318748e48780d1 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -270,26 +270,6 @@ static const unsigned int axg_aoclk_reset[] = {
 	[RESET_AO_IR_BLASTER]	= 23,
 };
 
-static struct clk_regmap *axg_aoclk_regmap[] = {
-	&axg_aoclk_remote,
-	&axg_aoclk_i2c_master,
-	&axg_aoclk_i2c_slave,
-	&axg_aoclk_uart1,
-	&axg_aoclk_uart2,
-	&axg_aoclk_ir_blaster,
-	&axg_aoclk_saradc,
-	&axg_aoclk_cts_oscin,
-	&axg_aoclk_32k_pre,
-	&axg_aoclk_32k_div,
-	&axg_aoclk_32k_sel,
-	&axg_aoclk_32k,
-	&axg_aoclk_cts_rtc_oscin,
-	&axg_aoclk_clk81,
-	&axg_aoclk_saradc_mux,
-	&axg_aoclk_saradc_div,
-	&axg_aoclk_saradc_gate,
-};
-
 static struct clk_hw *axg_aoclk_hw_clks[] = {
 	[CLKID_AO_REMOTE]	= &axg_aoclk_remote.hw,
 	[CLKID_AO_I2C_MASTER]	= &axg_aoclk_i2c_master.hw,
@@ -314,8 +294,6 @@ static const struct meson_aoclk_data axg_aoclkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(axg_aoclk_reset),
 	.reset		= axg_aoclk_reset,
-	.num_clks	= ARRAY_SIZE(axg_aoclk_regmap),
-	.clks		= axg_aoclk_regmap,
 	.hw_clks	= {
 		.hws	= axg_aoclk_hw_clks,
 		.num	= ARRAY_SIZE(axg_aoclk_hw_clks),
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 22940475343503c88b16b6b0e809290d9848a0d9..db77c3df974a5da5243f37d84e2e52d2796d798e 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1312,427 +1312,6 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
 	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
 };
 
-
-/* Convenience table to populate regmap in .probe(). */
-static struct clk_regmap *const axg_clk_regmaps[] = {
-	&ddr_arb,
-	&pdm,
-	&tdmin_a,
-	&tdmin_b,
-	&tdmin_c,
-	&tdmin_lb,
-	&tdmout_a,
-	&tdmout_b,
-	&tdmout_c,
-	&frddr_a,
-	&frddr_b,
-	&frddr_c,
-	&toddr_a,
-	&toddr_b,
-	&toddr_c,
-	&loopback,
-	&spdifin,
-	&spdifout,
-	&resample,
-	&power_detect,
-	&mst_a_mclk_sel,
-	&mst_b_mclk_sel,
-	&mst_c_mclk_sel,
-	&mst_d_mclk_sel,
-	&mst_e_mclk_sel,
-	&mst_f_mclk_sel,
-	&mst_a_mclk_div,
-	&mst_b_mclk_div,
-	&mst_c_mclk_div,
-	&mst_d_mclk_div,
-	&mst_e_mclk_div,
-	&mst_f_mclk_div,
-	&mst_a_mclk,
-	&mst_b_mclk,
-	&mst_c_mclk,
-	&mst_d_mclk,
-	&mst_e_mclk,
-	&mst_f_mclk,
-	&spdifout_clk_sel,
-	&spdifout_clk_div,
-	&spdifout_clk,
-	&spdifin_clk_sel,
-	&spdifin_clk_div,
-	&spdifin_clk,
-	&pdm_dclk_sel,
-	&pdm_dclk_div,
-	&pdm_dclk,
-	&pdm_sysclk_sel,
-	&pdm_sysclk_div,
-	&pdm_sysclk,
-	&mst_a_sclk_pre_en,
-	&mst_b_sclk_pre_en,
-	&mst_c_sclk_pre_en,
-	&mst_d_sclk_pre_en,
-	&mst_e_sclk_pre_en,
-	&mst_f_sclk_pre_en,
-	&mst_a_sclk_div,
-	&mst_b_sclk_div,
-	&mst_c_sclk_div,
-	&mst_d_sclk_div,
-	&mst_e_sclk_div,
-	&mst_f_sclk_div,
-	&mst_a_sclk_post_en,
-	&mst_b_sclk_post_en,
-	&mst_c_sclk_post_en,
-	&mst_d_sclk_post_en,
-	&mst_e_sclk_post_en,
-	&mst_f_sclk_post_en,
-	&mst_a_sclk,
-	&mst_b_sclk,
-	&mst_c_sclk,
-	&mst_d_sclk,
-	&mst_e_sclk,
-	&mst_f_sclk,
-	&mst_a_lrclk_div,
-	&mst_b_lrclk_div,
-	&mst_c_lrclk_div,
-	&mst_d_lrclk_div,
-	&mst_e_lrclk_div,
-	&mst_f_lrclk_div,
-	&mst_a_lrclk,
-	&mst_b_lrclk,
-	&mst_c_lrclk,
-	&mst_d_lrclk,
-	&mst_e_lrclk,
-	&mst_f_lrclk,
-	&tdmin_a_sclk_sel,
-	&tdmin_b_sclk_sel,
-	&tdmin_c_sclk_sel,
-	&tdmin_lb_sclk_sel,
-	&tdmout_a_sclk_sel,
-	&tdmout_b_sclk_sel,
-	&tdmout_c_sclk_sel,
-	&tdmin_a_sclk_pre_en,
-	&tdmin_b_sclk_pre_en,
-	&tdmin_c_sclk_pre_en,
-	&tdmin_lb_sclk_pre_en,
-	&tdmout_a_sclk_pre_en,
-	&tdmout_b_sclk_pre_en,
-	&tdmout_c_sclk_pre_en,
-	&tdmin_a_sclk_post_en,
-	&tdmin_b_sclk_post_en,
-	&tdmin_c_sclk_post_en,
-	&tdmin_lb_sclk_post_en,
-	&tdmout_a_sclk_post_en,
-	&tdmout_b_sclk_post_en,
-	&tdmout_c_sclk_post_en,
-	&tdmin_a_sclk,
-	&tdmin_b_sclk,
-	&tdmin_c_sclk,
-	&tdmin_lb_sclk,
-	&axg_tdmout_a_sclk,
-	&axg_tdmout_b_sclk,
-	&axg_tdmout_c_sclk,
-	&tdmin_a_lrclk,
-	&tdmin_b_lrclk,
-	&tdmin_c_lrclk,
-	&tdmin_lb_lrclk,
-	&tdmout_a_lrclk,
-	&tdmout_b_lrclk,
-	&tdmout_c_lrclk,
-};
-
-static struct clk_regmap *const g12a_clk_regmaps[] = {
-	&ddr_arb,
-	&pdm,
-	&tdmin_a,
-	&tdmin_b,
-	&tdmin_c,
-	&tdmin_lb,
-	&tdmout_a,
-	&tdmout_b,
-	&tdmout_c,
-	&frddr_a,
-	&frddr_b,
-	&frddr_c,
-	&toddr_a,
-	&toddr_b,
-	&toddr_c,
-	&loopback,
-	&spdifin,
-	&spdifout,
-	&resample,
-	&power_detect,
-	&spdifout_b,
-	&mst_a_mclk_sel,
-	&mst_b_mclk_sel,
-	&mst_c_mclk_sel,
-	&mst_d_mclk_sel,
-	&mst_e_mclk_sel,
-	&mst_f_mclk_sel,
-	&mst_a_mclk_div,
-	&mst_b_mclk_div,
-	&mst_c_mclk_div,
-	&mst_d_mclk_div,
-	&mst_e_mclk_div,
-	&mst_f_mclk_div,
-	&mst_a_mclk,
-	&mst_b_mclk,
-	&mst_c_mclk,
-	&mst_d_mclk,
-	&mst_e_mclk,
-	&mst_f_mclk,
-	&spdifout_clk_sel,
-	&spdifout_clk_div,
-	&spdifout_clk,
-	&spdifin_clk_sel,
-	&spdifin_clk_div,
-	&spdifin_clk,
-	&pdm_dclk_sel,
-	&pdm_dclk_div,
-	&pdm_dclk,
-	&pdm_sysclk_sel,
-	&pdm_sysclk_div,
-	&pdm_sysclk,
-	&mst_a_sclk_pre_en,
-	&mst_b_sclk_pre_en,
-	&mst_c_sclk_pre_en,
-	&mst_d_sclk_pre_en,
-	&mst_e_sclk_pre_en,
-	&mst_f_sclk_pre_en,
-	&mst_a_sclk_div,
-	&mst_b_sclk_div,
-	&mst_c_sclk_div,
-	&mst_d_sclk_div,
-	&mst_e_sclk_div,
-	&mst_f_sclk_div,
-	&mst_a_sclk_post_en,
-	&mst_b_sclk_post_en,
-	&mst_c_sclk_post_en,
-	&mst_d_sclk_post_en,
-	&mst_e_sclk_post_en,
-	&mst_f_sclk_post_en,
-	&mst_a_sclk,
-	&mst_b_sclk,
-	&mst_c_sclk,
-	&mst_d_sclk,
-	&mst_e_sclk,
-	&mst_f_sclk,
-	&mst_a_lrclk_div,
-	&mst_b_lrclk_div,
-	&mst_c_lrclk_div,
-	&mst_d_lrclk_div,
-	&mst_e_lrclk_div,
-	&mst_f_lrclk_div,
-	&mst_a_lrclk,
-	&mst_b_lrclk,
-	&mst_c_lrclk,
-	&mst_d_lrclk,
-	&mst_e_lrclk,
-	&mst_f_lrclk,
-	&tdmin_a_sclk_sel,
-	&tdmin_b_sclk_sel,
-	&tdmin_c_sclk_sel,
-	&tdmin_lb_sclk_sel,
-	&tdmout_a_sclk_sel,
-	&tdmout_b_sclk_sel,
-	&tdmout_c_sclk_sel,
-	&tdmin_a_sclk_pre_en,
-	&tdmin_b_sclk_pre_en,
-	&tdmin_c_sclk_pre_en,
-	&tdmin_lb_sclk_pre_en,
-	&tdmout_a_sclk_pre_en,
-	&tdmout_b_sclk_pre_en,
-	&tdmout_c_sclk_pre_en,
-	&tdmin_a_sclk_post_en,
-	&tdmin_b_sclk_post_en,
-	&tdmin_c_sclk_post_en,
-	&tdmin_lb_sclk_post_en,
-	&tdmout_a_sclk_post_en,
-	&tdmout_b_sclk_post_en,
-	&tdmout_c_sclk_post_en,
-	&tdmin_a_sclk,
-	&tdmin_b_sclk,
-	&tdmin_c_sclk,
-	&tdmin_lb_sclk,
-	&g12a_tdmout_a_sclk,
-	&g12a_tdmout_b_sclk,
-	&g12a_tdmout_c_sclk,
-	&tdmin_a_lrclk,
-	&tdmin_b_lrclk,
-	&tdmin_c_lrclk,
-	&tdmin_lb_lrclk,
-	&tdmout_a_lrclk,
-	&tdmout_b_lrclk,
-	&tdmout_c_lrclk,
-	&spdifout_b_clk_sel,
-	&spdifout_b_clk_div,
-	&spdifout_b_clk,
-	&g12a_tdm_mclk_pad_0,
-	&g12a_tdm_mclk_pad_1,
-	&g12a_tdm_lrclk_pad_0,
-	&g12a_tdm_lrclk_pad_1,
-	&g12a_tdm_lrclk_pad_2,
-	&g12a_tdm_sclk_pad_0,
-	&g12a_tdm_sclk_pad_1,
-	&g12a_tdm_sclk_pad_2,
-	&toram,
-	&eqdrc,
-};
-
-static struct clk_regmap *const sm1_clk_regmaps[] = {
-	&ddr_arb,
-	&pdm,
-	&tdmin_a,
-	&tdmin_b,
-	&tdmin_c,
-	&tdmin_lb,
-	&tdmout_a,
-	&tdmout_b,
-	&tdmout_c,
-	&frddr_a,
-	&frddr_b,
-	&frddr_c,
-	&toddr_a,
-	&toddr_b,
-	&toddr_c,
-	&loopback,
-	&spdifin,
-	&spdifout,
-	&resample,
-	&spdifout_b,
-	&sm1_mst_a_mclk_sel,
-	&sm1_mst_b_mclk_sel,
-	&sm1_mst_c_mclk_sel,
-	&sm1_mst_d_mclk_sel,
-	&sm1_mst_e_mclk_sel,
-	&sm1_mst_f_mclk_sel,
-	&sm1_mst_a_mclk_div,
-	&sm1_mst_b_mclk_div,
-	&sm1_mst_c_mclk_div,
-	&sm1_mst_d_mclk_div,
-	&sm1_mst_e_mclk_div,
-	&sm1_mst_f_mclk_div,
-	&sm1_mst_a_mclk,
-	&sm1_mst_b_mclk,
-	&sm1_mst_c_mclk,
-	&sm1_mst_d_mclk,
-	&sm1_mst_e_mclk,
-	&sm1_mst_f_mclk,
-	&spdifout_clk_sel,
-	&spdifout_clk_div,
-	&spdifout_clk,
-	&spdifin_clk_sel,
-	&spdifin_clk_div,
-	&spdifin_clk,
-	&pdm_dclk_sel,
-	&pdm_dclk_div,
-	&pdm_dclk,
-	&pdm_sysclk_sel,
-	&pdm_sysclk_div,
-	&pdm_sysclk,
-	&mst_a_sclk_pre_en,
-	&mst_b_sclk_pre_en,
-	&mst_c_sclk_pre_en,
-	&mst_d_sclk_pre_en,
-	&mst_e_sclk_pre_en,
-	&mst_f_sclk_pre_en,
-	&mst_a_sclk_div,
-	&mst_b_sclk_div,
-	&mst_c_sclk_div,
-	&mst_d_sclk_div,
-	&mst_e_sclk_div,
-	&mst_f_sclk_div,
-	&mst_a_sclk_post_en,
-	&mst_b_sclk_post_en,
-	&mst_c_sclk_post_en,
-	&mst_d_sclk_post_en,
-	&mst_e_sclk_post_en,
-	&mst_f_sclk_post_en,
-	&mst_a_sclk,
-	&mst_b_sclk,
-	&mst_c_sclk,
-	&mst_d_sclk,
-	&mst_e_sclk,
-	&mst_f_sclk,
-	&mst_a_lrclk_div,
-	&mst_b_lrclk_div,
-	&mst_c_lrclk_div,
-	&mst_d_lrclk_div,
-	&mst_e_lrclk_div,
-	&mst_f_lrclk_div,
-	&mst_a_lrclk,
-	&mst_b_lrclk,
-	&mst_c_lrclk,
-	&mst_d_lrclk,
-	&mst_e_lrclk,
-	&mst_f_lrclk,
-	&tdmin_a_sclk_sel,
-	&tdmin_b_sclk_sel,
-	&tdmin_c_sclk_sel,
-	&tdmin_lb_sclk_sel,
-	&tdmout_a_sclk_sel,
-	&tdmout_b_sclk_sel,
-	&tdmout_c_sclk_sel,
-	&tdmin_a_sclk_pre_en,
-	&tdmin_b_sclk_pre_en,
-	&tdmin_c_sclk_pre_en,
-	&tdmin_lb_sclk_pre_en,
-	&tdmout_a_sclk_pre_en,
-	&tdmout_b_sclk_pre_en,
-	&tdmout_c_sclk_pre_en,
-	&tdmin_a_sclk_post_en,
-	&tdmin_b_sclk_post_en,
-	&tdmin_c_sclk_post_en,
-	&tdmin_lb_sclk_post_en,
-	&tdmout_a_sclk_post_en,
-	&tdmout_b_sclk_post_en,
-	&tdmout_c_sclk_post_en,
-	&tdmin_a_sclk,
-	&tdmin_b_sclk,
-	&tdmin_c_sclk,
-	&tdmin_lb_sclk,
-	&g12a_tdmout_a_sclk,
-	&g12a_tdmout_b_sclk,
-	&g12a_tdmout_c_sclk,
-	&tdmin_a_lrclk,
-	&tdmin_b_lrclk,
-	&tdmin_c_lrclk,
-	&tdmin_lb_lrclk,
-	&tdmout_a_lrclk,
-	&tdmout_b_lrclk,
-	&tdmout_c_lrclk,
-	&spdifout_b_clk_sel,
-	&spdifout_b_clk_div,
-	&spdifout_b_clk,
-	&sm1_tdm_mclk_pad_0,
-	&sm1_tdm_mclk_pad_1,
-	&sm1_tdm_lrclk_pad_0,
-	&sm1_tdm_lrclk_pad_1,
-	&sm1_tdm_lrclk_pad_2,
-	&sm1_tdm_sclk_pad_0,
-	&sm1_tdm_sclk_pad_1,
-	&sm1_tdm_sclk_pad_2,
-	&sm1_aud_top,
-	&toram,
-	&eqdrc,
-	&resample_b,
-	&tovad,
-	&locker,
-	&spdifin_lb,
-	&frddr_d,
-	&toddr_d,
-	&loopback_b,
-	&sm1_clk81_en,
-	&sm1_sysclk_a_div,
-	&sm1_sysclk_a_en,
-	&sm1_sysclk_b_div,
-	&sm1_sysclk_b_en,
-	&earcrx,
-	&sm1_earcrx_cmdc_clk_sel,
-	&sm1_earcrx_cmdc_clk_div,
-	&sm1_earcrx_cmdc_clk,
-	&sm1_earcrx_dmac_clk_sel,
-	&sm1_earcrx_dmac_clk_div,
-	&sm1_earcrx_dmac_clk,
-};
-
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1740,8 +1319,6 @@ static struct regmap_config axg_audio_regmap_cfg = {
 };
 
 struct audioclk_data {
-	struct clk_regmap *const *regmap_clks;
-	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
 	const char *rst_drvname;
 	unsigned int max_register;
@@ -1784,10 +1361,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < data->regmap_clk_num; i++)
-		data->regmap_clks[i]->map = map;
-
 	/* Take care to skip the registered input clocks */
 	for (i = AUD_CLKID_DDR_ARB; i < data->hw_clks.num; i++) {
 		const char *name;
@@ -1822,8 +1395,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 }
 
 static const struct audioclk_data axg_audioclk_data = {
-	.regmap_clks = axg_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(axg_clk_regmaps),
 	.hw_clks = {
 		.hws = axg_audio_hw_clks,
 		.num = ARRAY_SIZE(axg_audio_hw_clks),
@@ -1832,8 +1403,6 @@ static const struct audioclk_data axg_audioclk_data = {
 };
 
 static const struct audioclk_data g12a_audioclk_data = {
-	.regmap_clks = g12a_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
 	.hw_clks = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
@@ -1843,8 +1412,6 @@ static const struct audioclk_data g12a_audioclk_data = {
 };
 
 static const struct audioclk_data sm1_audioclk_data = {
-	.regmap_clks = sm1_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(sm1_clk_regmaps),
 	.hw_clks = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 766764b50b36609784b0122656890a6de7154012..564655d4d18828d37f2383b348b686a9e0aa9adf 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -2110,138 +2110,7 @@ static struct clk_hw *axg_hw_clks[] = {
 	[CLKID_VDIN_MEAS]		= &axg_vdin_meas.hw,
 };
 
-/* Convenience table to populate regmap in .probe */
-static struct clk_regmap *const axg_clk_regmaps[] = {
-	&axg_clk81,
-	&axg_ddr,
-	&axg_audio_locker,
-	&axg_mipi_dsi_host,
-	&axg_isa,
-	&axg_pl301,
-	&axg_periphs,
-	&axg_spicc_0,
-	&axg_i2c,
-	&axg_rng0,
-	&axg_uart0,
-	&axg_mipi_dsi_phy,
-	&axg_spicc_1,
-	&axg_pcie_a,
-	&axg_pcie_b,
-	&axg_hiu_reg,
-	&axg_assist_misc,
-	&axg_emmc_b,
-	&axg_emmc_c,
-	&axg_dma,
-	&axg_spi,
-	&axg_audio,
-	&axg_eth_core,
-	&axg_uart1,
-	&axg_g2d,
-	&axg_usb0,
-	&axg_usb1,
-	&axg_reset,
-	&axg_usb_general,
-	&axg_ahb_arb0,
-	&axg_efuse,
-	&axg_boot_rom,
-	&axg_ahb_data_bus,
-	&axg_ahb_ctrl_bus,
-	&axg_usb1_to_ddr,
-	&axg_usb0_to_ddr,
-	&axg_mmc_pclk,
-	&axg_vpu_intr,
-	&axg_sec_ahb_ahb3_bridge,
-	&axg_gic,
-	&axg_ao_media_cpu,
-	&axg_ao_ahb_sram,
-	&axg_ao_ahb_bus,
-	&axg_ao_iface,
-	&axg_ao_i2c,
-	&axg_sd_emmc_b_clk0,
-	&axg_sd_emmc_c_clk0,
-	&axg_mpeg_clk_div,
-	&axg_sd_emmc_b_clk0_div,
-	&axg_sd_emmc_c_clk0_div,
-	&axg_mpeg_clk_sel,
-	&axg_sd_emmc_b_clk0_sel,
-	&axg_sd_emmc_c_clk0_sel,
-	&axg_mpll0,
-	&axg_mpll1,
-	&axg_mpll2,
-	&axg_mpll3,
-	&axg_mpll0_div,
-	&axg_mpll1_div,
-	&axg_mpll2_div,
-	&axg_mpll3_div,
-	&axg_fixed_pll,
-	&axg_sys_pll,
-	&axg_gp0_pll,
-	&axg_hifi_pll,
-	&axg_mpll_prediv,
-	&axg_fclk_div2,
-	&axg_fclk_div3,
-	&axg_fclk_div4,
-	&axg_fclk_div5,
-	&axg_fclk_div7,
-	&axg_pcie_pll_dco,
-	&axg_pcie_pll_od,
-	&axg_pcie_pll,
-	&axg_pcie_mux,
-	&axg_pcie_ref,
-	&axg_pcie_cml_en0,
-	&axg_pcie_cml_en1,
-	&axg_gen_clk_sel,
-	&axg_gen_clk_div,
-	&axg_gen_clk,
-	&axg_fixed_pll_dco,
-	&axg_sys_pll_dco,
-	&axg_gp0_pll_dco,
-	&axg_hifi_pll_dco,
-	&axg_pcie_pll_dco,
-	&axg_pcie_pll_od,
-	&axg_vpu_0_div,
-	&axg_vpu_0_sel,
-	&axg_vpu_0,
-	&axg_vpu_1_div,
-	&axg_vpu_1_sel,
-	&axg_vpu_1,
-	&axg_vpu,
-	&axg_vapb_0_div,
-	&axg_vapb_0_sel,
-	&axg_vapb_0,
-	&axg_vapb_1_div,
-	&axg_vapb_1_sel,
-	&axg_vapb_1,
-	&axg_vapb_sel,
-	&axg_vapb,
-	&axg_vclk,
-	&axg_vclk2,
-	&axg_vclk_sel,
-	&axg_vclk2_sel,
-	&axg_vclk_input,
-	&axg_vclk2_input,
-	&axg_vclk_div,
-	&axg_vclk_div1,
-	&axg_vclk2_div,
-	&axg_vclk2_div1,
-	&axg_vclk_div2_en,
-	&axg_vclk_div4_en,
-	&axg_vclk_div6_en,
-	&axg_vclk_div12_en,
-	&axg_vclk2_div2_en,
-	&axg_vclk2_div4_en,
-	&axg_vclk2_div6_en,
-	&axg_vclk2_div12_en,
-	&axg_cts_encl_sel,
-	&axg_cts_encl,
-	&axg_vdin_meas_sel,
-	&axg_vdin_meas_div,
-	&axg_vdin_meas,
-};
-
 static const struct meson_eeclkc_data axg_clkc_data = {
-	.regmap_clks = axg_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(axg_clk_regmaps),
 	.hw_clks = {
 		.hws = axg_hw_clks,
 		.num = ARRAY_SIZE(axg_hw_clks),
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 2075668ed3062e8957f2a79049ea5c56a61ba867..a25e7d5dc6691d2d4a852e3d3da2b36f251cc141 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2092,210 +2092,6 @@ static struct clk_hw *c3_periphs_hw_clks[] = {
 	[CLKID_VAPB]			= &vapb.hw,
 };
 
-/* Convenience table to populate regmap in .probe */
-static struct clk_regmap *const c3_periphs_clk_regmaps[] = {
-	&rtc_xtal_clkin,
-	&rtc_32k_div,
-	&rtc_32k_mux,
-	&rtc_32k,
-	&rtc_clk,
-	&sys_reset_ctrl,
-	&sys_pwr_ctrl,
-	&sys_pad_ctrl,
-	&sys_ctrl,
-	&sys_ts_pll,
-	&sys_dev_arb,
-	&sys_mmc_pclk,
-	&sys_cpu_ctrl,
-	&sys_jtag_ctrl,
-	&sys_ir_ctrl,
-	&sys_irq_ctrl,
-	&sys_msr_clk,
-	&sys_rom,
-	&sys_uart_f,
-	&sys_cpu_apb,
-	&sys_rsa,
-	&sys_sar_adc,
-	&sys_startup,
-	&sys_secure,
-	&sys_spifc,
-	&sys_nna,
-	&sys_eth_mac,
-	&sys_gic,
-	&sys_rama,
-	&sys_big_nic,
-	&sys_ramb,
-	&sys_audio_pclk,
-	&sys_pwm_kl,
-	&sys_pwm_ij,
-	&sys_usb,
-	&sys_sd_emmc_a,
-	&sys_sd_emmc_c,
-	&sys_pwm_ab,
-	&sys_pwm_cd,
-	&sys_pwm_ef,
-	&sys_pwm_gh,
-	&sys_spicc_1,
-	&sys_spicc_0,
-	&sys_uart_a,
-	&sys_uart_b,
-	&sys_uart_c,
-	&sys_uart_d,
-	&sys_uart_e,
-	&sys_i2c_m_a,
-	&sys_i2c_m_b,
-	&sys_i2c_m_c,
-	&sys_i2c_m_d,
-	&sys_i2c_s_a,
-	&sys_rtc,
-	&sys_ge2d,
-	&sys_isp,
-	&sys_gpv_isp_nic,
-	&sys_gpv_cve_nic,
-	&sys_mipi_dsi_host,
-	&sys_mipi_dsi_phy,
-	&sys_eth_phy,
-	&sys_acodec,
-	&sys_dwap,
-	&sys_dos,
-	&sys_cve,
-	&sys_vout,
-	&sys_vc9000e,
-	&sys_pwm_mn,
-	&sys_sd_emmc_b,
-	&axi_sys_nic,
-	&axi_isp_nic,
-	&axi_cve_nic,
-	&axi_ramb,
-	&axi_rama,
-	&axi_cpu_dmc,
-	&axi_nic,
-	&axi_dma,
-	&axi_mux_nic,
-	&axi_cve,
-	&axi_dev1_dmc,
-	&axi_dev0_dmc,
-	&axi_dsp_dmc,
-	&clk_12_24m_in,
-	&clk_12_24m,
-	&fclk_25m_div,
-	&fclk_25m,
-	&gen_sel,
-	&gen_div,
-	&gen,
-	&saradc_sel,
-	&saradc_div,
-	&saradc,
-	&pwm_a_sel,
-	&pwm_a_div,
-	&pwm_a,
-	&pwm_b_sel,
-	&pwm_b_div,
-	&pwm_b,
-	&pwm_c_sel,
-	&pwm_c_div,
-	&pwm_c,
-	&pwm_d_sel,
-	&pwm_d_div,
-	&pwm_d,
-	&pwm_e_sel,
-	&pwm_e_div,
-	&pwm_e,
-	&pwm_f_sel,
-	&pwm_f_div,
-	&pwm_f,
-	&pwm_g_sel,
-	&pwm_g_div,
-	&pwm_g,
-	&pwm_h_sel,
-	&pwm_h_div,
-	&pwm_h,
-	&pwm_i_sel,
-	&pwm_i_div,
-	&pwm_i,
-	&pwm_j_sel,
-	&pwm_j_div,
-	&pwm_j,
-	&pwm_k_sel,
-	&pwm_k_div,
-	&pwm_k,
-	&pwm_l_sel,
-	&pwm_l_div,
-	&pwm_l,
-	&pwm_m_sel,
-	&pwm_m_div,
-	&pwm_m,
-	&pwm_n_sel,
-	&pwm_n_div,
-	&pwm_n,
-	&spicc_a_sel,
-	&spicc_a_div,
-	&spicc_a,
-	&spicc_b_sel,
-	&spicc_b_div,
-	&spicc_b,
-	&spifc_sel,
-	&spifc_div,
-	&spifc,
-	&sd_emmc_a_sel,
-	&sd_emmc_a_div,
-	&sd_emmc_a,
-	&sd_emmc_b_sel,
-	&sd_emmc_b_div,
-	&sd_emmc_b,
-	&sd_emmc_c_sel,
-	&sd_emmc_c_div,
-	&sd_emmc_c,
-	&ts_div,
-	&ts,
-	&eth_125m,
-	&eth_rmii_div,
-	&eth_rmii,
-	&mipi_dsi_meas_sel,
-	&mipi_dsi_meas_div,
-	&mipi_dsi_meas,
-	&dsi_phy_sel,
-	&dsi_phy_div,
-	&dsi_phy,
-	&vout_mclk_sel,
-	&vout_mclk_div,
-	&vout_mclk,
-	&vout_enc_sel,
-	&vout_enc_div,
-	&vout_enc,
-	&hcodec_0_sel,
-	&hcodec_0_div,
-	&hcodec_0,
-	&hcodec_1_sel,
-	&hcodec_1_div,
-	&hcodec_1,
-	&hcodec,
-	&vc9000e_aclk_sel,
-	&vc9000e_aclk_div,
-	&vc9000e_aclk,
-	&vc9000e_core_sel,
-	&vc9000e_core_div,
-	&vc9000e_core,
-	&csi_phy0_sel,
-	&csi_phy0_div,
-	&csi_phy0,
-	&dewarpa_sel,
-	&dewarpa_div,
-	&dewarpa,
-	&isp0_sel,
-	&isp0_div,
-	&isp0,
-	&nna_core_sel,
-	&nna_core_div,
-	&nna_core,
-	&ge2d_sel,
-	&ge2d_div,
-	&ge2d,
-	&vapb_sel,
-	&vapb_div,
-	&vapb,
-};
-
 static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
@@ -2313,7 +2109,7 @@ static int c3_peripherals_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	void __iomem *base;
-	int clkid, ret, i;
+	int clkid, ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -2323,10 +2119,6 @@ static int c3_peripherals_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(c3_periphs_clk_regmaps); i++)
-		c3_periphs_clk_regmaps[i]->map = regmap;
-
 	for (clkid = 0; clkid < c3_periphs_clks.num; clkid++) {
 		/* array might be sparse */
 		if (!c3_periphs_clks.hws[clkid])
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index ed4bc495862e1a1f49e2026979d7f5be5caaf2c0..2c5594b8e49a24ae8067117465ee4c0e29d7420d 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -653,32 +653,6 @@ static struct clk_hw *c3_pll_hw_clks[] = {
 	[CLKID_MCLK1]		= &mclk1.hw
 };
 
-/* Convenience table to populate regmap in .probe */
-static struct clk_regmap *const c3_pll_clk_regmaps[] = {
-	&fclk_50m_en,
-	&fclk_div2,
-	&fclk_div2p5,
-	&fclk_div3,
-	&fclk_div4,
-	&fclk_div5,
-	&fclk_div7,
-	&gp0_pll_dco,
-	&gp0_pll,
-	&hifi_pll_dco,
-	&hifi_pll,
-	&mclk_pll_dco,
-	&mclk_pll_od,
-	&mclk_pll,
-	&mclk0_sel,
-	&mclk0_div_en,
-	&mclk0_div,
-	&mclk0,
-	&mclk1_sel,
-	&mclk1_div_en,
-	&mclk1_div,
-	&mclk1,
-};
-
 static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
@@ -696,7 +670,7 @@ static int c3_pll_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	void __iomem *base;
-	int clkid, ret, i;
+	int clkid, ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -706,10 +680,6 @@ static int c3_pll_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(c3_pll_clk_regmaps); i++)
-		c3_pll_clk_regmaps[i]->map = regmap;
-
 	for (clkid = 0; clkid < c3_pll_clks.num; clkid++) {
 		/* array might be sparse */
 		if (!c3_pll_clks.hws[clkid])
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 71c758ffa4934d984a73012b37e43833de953637..4095a1b2bb80ee430f8aeb56cbcf5ed549188781 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -381,38 +381,6 @@ static const unsigned int g12a_aoclk_reset[] = {
 	[RESET_AO_IR_OUT]	= 23,
 };
 
-static struct clk_regmap *g12a_aoclk_regmap[] = {
-	&g12a_aoclk_ahb,
-	&g12a_aoclk_ir_in,
-	&g12a_aoclk_i2c_m0,
-	&g12a_aoclk_i2c_s0,
-	&g12a_aoclk_uart,
-	&g12a_aoclk_prod_i2c,
-	&g12a_aoclk_uart2,
-	&g12a_aoclk_ir_out,
-	&g12a_aoclk_saradc,
-	&g12a_aoclk_mailbox,
-	&g12a_aoclk_m3,
-	&g12a_aoclk_ahb_sram,
-	&g12a_aoclk_rti,
-	&g12a_aoclk_m4_fclk,
-	&g12a_aoclk_m4_hclk,
-	&g12a_aoclk_cts_oscin,
-	&g12a_aoclk_32k_by_oscin_pre,
-	&g12a_aoclk_32k_by_oscin_div,
-	&g12a_aoclk_32k_by_oscin_sel,
-	&g12a_aoclk_32k_by_oscin,
-	&g12a_aoclk_cec_pre,
-	&g12a_aoclk_cec_div,
-	&g12a_aoclk_cec_sel,
-	&g12a_aoclk_cec,
-	&g12a_aoclk_cts_rtc_oscin,
-	&g12a_aoclk_clk81,
-	&g12a_aoclk_saradc_mux,
-	&g12a_aoclk_saradc_div,
-	&g12a_aoclk_saradc_gate,
-};
-
 static struct clk_hw *g12a_aoclk_hw_clks[] = {
 	[CLKID_AO_AHB]		= &g12a_aoclk_ahb.hw,
 	[CLKID_AO_IR_IN]	= &g12a_aoclk_ir_in.hw,
@@ -449,8 +417,6 @@ static const struct meson_aoclk_data g12a_aoclkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(g12a_aoclk_reset),
 	.reset		= g12a_aoclk_reset,
-	.num_clks	= ARRAY_SIZE(g12a_aoclk_regmap),
-	.clks		= g12a_aoclk_regmap,
 	.hw_clks	= {
 		.hws	= g12a_aoclk_hw_clks,
 		.num	= ARRAY_SIZE(g12a_aoclk_hw_clks),
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index e59bae56a4a5c9604a63038ce79e904b91025d2a..1b30f1bcca5535cabbfeca16338f6d9f7e79198d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5235,261 +5235,6 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
 };
 
-/* Convenience table to populate regmap in .probe */
-static struct clk_regmap *const g12a_clk_regmaps[] = {
-	&g12a_clk81,
-	&g12a_dos,
-	&g12a_ddr,
-	&g12a_audio_locker,
-	&g12a_mipi_dsi_host,
-	&g12a_eth_phy,
-	&g12a_isa,
-	&g12a_pl301,
-	&g12a_periphs,
-	&g12a_spicc_0,
-	&g12a_i2c,
-	&g12a_sana,
-	&g12a_sd,
-	&g12a_rng0,
-	&g12a_uart0,
-	&g12a_spicc_1,
-	&g12a_hiu_reg,
-	&g12a_mipi_dsi_phy,
-	&g12a_assist_misc,
-	&g12a_emmc_a,
-	&g12a_emmc_b,
-	&g12a_emmc_c,
-	&g12a_audio_codec,
-	&g12a_audio,
-	&g12a_eth_core,
-	&g12a_demux,
-	&g12a_audio_ififo,
-	&g12a_adc,
-	&g12a_uart1,
-	&g12a_g2d,
-	&g12a_reset,
-	&g12a_pcie_comb,
-	&g12a_parser,
-	&g12a_usb_general,
-	&g12a_pcie_phy,
-	&g12a_ahb_arb0,
-	&g12a_ahb_data_bus,
-	&g12a_ahb_ctrl_bus,
-	&g12a_htx_hdcp22,
-	&g12a_htx_pclk,
-	&g12a_bt656,
-	&g12a_usb1_to_ddr,
-	&g12a_mmc_pclk,
-	&g12a_uart2,
-	&g12a_vpu_intr,
-	&g12a_gic,
-	&g12a_sd_emmc_a_clk0,
-	&g12a_sd_emmc_b_clk0,
-	&g12a_sd_emmc_c_clk0,
-	&g12a_mpeg_clk_div,
-	&g12a_sd_emmc_a_clk0_div,
-	&g12a_sd_emmc_b_clk0_div,
-	&g12a_sd_emmc_c_clk0_div,
-	&g12a_mpeg_clk_sel,
-	&g12a_sd_emmc_a_clk0_sel,
-	&g12a_sd_emmc_b_clk0_sel,
-	&g12a_sd_emmc_c_clk0_sel,
-	&g12a_mpll0,
-	&g12a_mpll1,
-	&g12a_mpll2,
-	&g12a_mpll3,
-	&g12a_mpll0_div,
-	&g12a_mpll1_div,
-	&g12a_mpll2_div,
-	&g12a_mpll3_div,
-	&g12a_fixed_pll,
-	&g12a_sys_pll,
-	&g12a_gp0_pll,
-	&g12a_hifi_pll,
-	&g12a_vclk2_venci0,
-	&g12a_vclk2_venci1,
-	&g12a_vclk2_vencp0,
-	&g12a_vclk2_vencp1,
-	&g12a_vclk2_venct0,
-	&g12a_vclk2_venct1,
-	&g12a_vclk2_other,
-	&g12a_vclk2_enci,
-	&g12a_vclk2_encp,
-	&g12a_dac_clk,
-	&g12a_aoclk_gate,
-	&g12a_iec958_gate,
-	&g12a_enc480p,
-	&g12a_rng1,
-	&g12a_vclk2_enct,
-	&g12a_vclk2_encl,
-	&g12a_vclk2_venclmmc,
-	&g12a_vclk2_vencl,
-	&g12a_vclk2_other1,
-	&g12a_fixed_pll_dco,
-	&g12a_sys_pll_dco,
-	&g12a_gp0_pll_dco,
-	&g12a_hifi_pll_dco,
-	&g12a_fclk_div2,
-	&g12a_fclk_div3,
-	&g12a_fclk_div4,
-	&g12a_fclk_div5,
-	&g12a_fclk_div7,
-	&g12a_fclk_div2p5,
-	&g12a_dma,
-	&g12a_efuse,
-	&g12a_rom_boot,
-	&g12a_reset_sec,
-	&g12a_sec_ahb_apb3,
-	&g12a_vpu_0_sel,
-	&g12a_vpu_0_div,
-	&g12a_vpu_0,
-	&g12a_vpu_1_sel,
-	&g12a_vpu_1_div,
-	&g12a_vpu_1,
-	&g12a_vpu,
-	&g12a_vapb_0_sel,
-	&g12a_vapb_0_div,
-	&g12a_vapb_0,
-	&g12a_vapb_1_sel,
-	&g12a_vapb_1_div,
-	&g12a_vapb_1,
-	&g12a_vapb_sel,
-	&g12a_vapb,
-	&g12a_hdmi_pll_dco,
-	&g12a_hdmi_pll_od,
-	&g12a_hdmi_pll_od2,
-	&g12a_hdmi_pll,
-	&g12a_vid_pll_div,
-	&g12a_vid_pll_sel,
-	&g12a_vid_pll,
-	&g12a_vclk_sel,
-	&g12a_vclk2_sel,
-	&g12a_vclk_input,
-	&g12a_vclk2_input,
-	&g12a_vclk_div,
-	&g12a_vclk2_div,
-	&g12a_vclk,
-	&g12a_vclk2,
-	&g12a_vclk_div1,
-	&g12a_vclk_div2_en,
-	&g12a_vclk_div4_en,
-	&g12a_vclk_div6_en,
-	&g12a_vclk_div12_en,
-	&g12a_vclk2_div1,
-	&g12a_vclk2_div2_en,
-	&g12a_vclk2_div4_en,
-	&g12a_vclk2_div6_en,
-	&g12a_vclk2_div12_en,
-	&g12a_cts_enci_sel,
-	&g12a_cts_encp_sel,
-	&g12a_cts_encl_sel,
-	&g12a_cts_vdac_sel,
-	&g12a_hdmi_tx_sel,
-	&g12a_cts_enci,
-	&g12a_cts_encp,
-	&g12a_cts_encl,
-	&g12a_cts_vdac,
-	&g12a_hdmi_tx,
-	&g12a_hdmi_sel,
-	&g12a_hdmi_div,
-	&g12a_hdmi,
-	&g12a_mali_0_sel,
-	&g12a_mali_0_div,
-	&g12a_mali_0,
-	&g12a_mali_1_sel,
-	&g12a_mali_1_div,
-	&g12a_mali_1,
-	&g12a_mali,
-	&g12a_mpll_50m,
-	&g12a_sys_pll_div16_en,
-	&g12a_cpu_clk_premux0,
-	&g12a_cpu_clk_mux0_div,
-	&g12a_cpu_clk_postmux0,
-	&g12a_cpu_clk_premux1,
-	&g12a_cpu_clk_mux1_div,
-	&g12a_cpu_clk_postmux1,
-	&g12a_cpu_clk_dyn,
-	&g12a_cpu_clk,
-	&g12a_cpu_clk_div16_en,
-	&g12a_cpu_clk_apb_div,
-	&g12a_cpu_clk_apb,
-	&g12a_cpu_clk_atb_div,
-	&g12a_cpu_clk_atb,
-	&g12a_cpu_clk_axi_div,
-	&g12a_cpu_clk_axi,
-	&g12a_cpu_clk_trace_div,
-	&g12a_cpu_clk_trace,
-	&g12a_pcie_pll_od,
-	&g12a_pcie_pll_dco,
-	&g12a_vdec_1_sel,
-	&g12a_vdec_1_div,
-	&g12a_vdec_1,
-	&g12a_vdec_hevc_sel,
-	&g12a_vdec_hevc_div,
-	&g12a_vdec_hevc,
-	&g12a_vdec_hevcf_sel,
-	&g12a_vdec_hevcf_div,
-	&g12a_vdec_hevcf,
-	&g12a_ts_div,
-	&g12a_ts,
-	&g12b_cpu_clk,
-	&g12b_sys1_pll_dco,
-	&g12b_sys1_pll,
-	&g12b_sys1_pll_div16_en,
-	&g12b_cpub_clk_premux0,
-	&g12b_cpub_clk_mux0_div,
-	&g12b_cpub_clk_postmux0,
-	&g12b_cpub_clk_premux1,
-	&g12b_cpub_clk_mux1_div,
-	&g12b_cpub_clk_postmux1,
-	&g12b_cpub_clk_dyn,
-	&g12b_cpub_clk,
-	&g12b_cpub_clk_div16_en,
-	&g12b_cpub_clk_apb_sel,
-	&g12b_cpub_clk_apb,
-	&g12b_cpub_clk_atb_sel,
-	&g12b_cpub_clk_atb,
-	&g12b_cpub_clk_axi_sel,
-	&g12b_cpub_clk_axi,
-	&g12b_cpub_clk_trace_sel,
-	&g12b_cpub_clk_trace,
-	&sm1_gp1_pll_dco,
-	&sm1_gp1_pll,
-	&sm1_dsu_clk_premux0,
-	&sm1_dsu_clk_premux1,
-	&sm1_dsu_clk_mux0_div,
-	&sm1_dsu_clk_postmux0,
-	&sm1_dsu_clk_mux1_div,
-	&sm1_dsu_clk_postmux1,
-	&sm1_dsu_clk_dyn,
-	&sm1_dsu_final_clk,
-	&sm1_dsu_clk,
-	&sm1_cpu1_clk,
-	&sm1_cpu2_clk,
-	&sm1_cpu3_clk,
-	&g12a_spicc0_sclk_sel,
-	&g12a_spicc0_sclk_div,
-	&g12a_spicc0_sclk,
-	&g12a_spicc1_sclk_sel,
-	&g12a_spicc1_sclk_div,
-	&g12a_spicc1_sclk,
-	&sm1_nna_axi_clk_sel,
-	&sm1_nna_axi_clk_div,
-	&sm1_nna_axi_clk,
-	&sm1_nna_core_clk_sel,
-	&sm1_nna_core_clk_div,
-	&sm1_nna_core_clk,
-	&g12a_mipi_dsi_pxclk_sel,
-	&g12a_mipi_dsi_pxclk_div,
-	&g12a_mipi_dsi_pxclk,
-	&g12b_mipi_isp_sel,
-	&g12b_mipi_isp_div,
-	&g12b_mipi_isp,
-	&g12b_mipi_isp_gate,
-	&g12b_csi_phy1,
-	&g12b_csi_phy0,
-};
-
 static const struct reg_sequence g12a_init_regs[] = {
 	{ .reg = HHI_MPLL_CNTL0,	.def = 0x00000543 },
 };
@@ -5668,8 +5413,6 @@ static int meson_g12a_probe(struct platform_device *pdev)
 
 static const struct meson_g12a_data g12a_clkc_data = {
 	.eeclkc_data = {
-		.regmap_clks = g12a_clk_regmaps,
-		.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
 		.hw_clks = {
 			.hws = g12a_hw_clks,
 			.num = ARRAY_SIZE(g12a_hw_clks),
@@ -5682,8 +5425,6 @@ static const struct meson_g12a_data g12a_clkc_data = {
 
 static const struct meson_g12a_data g12b_clkc_data = {
 	.eeclkc_data = {
-		.regmap_clks = g12a_clk_regmaps,
-		.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
 		.hw_clks = {
 			.hws = g12b_hw_clks,
 			.num = ARRAY_SIZE(g12b_hw_clks),
@@ -5694,8 +5435,6 @@ static const struct meson_g12a_data g12b_clkc_data = {
 
 static const struct meson_g12a_data sm1_clkc_data = {
 	.eeclkc_data = {
-		.regmap_clks = g12a_clk_regmaps,
-		.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
 		.hw_clks = {
 			.hws = sm1_hw_clks,
 			.num = ARRAY_SIZE(sm1_hw_clks),
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 43940232f7180262d458f1914f94b1bc3dc5e20e..f075fbd450f34bac9b2f9f969930337d3831a893 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -237,23 +237,6 @@ static const unsigned int gxbb_aoclk_reset[] = {
 	[RESET_AO_IR_BLASTER] = 23,
 };
 
-static struct clk_regmap *gxbb_aoclk[] = {
-	&remote_ao,
-	&i2c_master_ao,
-	&i2c_slave_ao,
-	&uart1_ao,
-	&uart2_ao,
-	&ir_blaster_ao,
-	&ao_cts_oscin,
-	&ao_32k_pre,
-	&ao_32k_div,
-	&ao_32k_sel,
-	&ao_32k,
-	&ao_cts_rtc_oscin,
-	&ao_clk81,
-	&ao_cts_cec,
-};
-
 static struct clk_hw *gxbb_aoclk_hw_clks[] = {
 		[CLKID_AO_REMOTE] = &remote_ao.hw,
 		[CLKID_AO_I2C_MASTER] = &i2c_master_ao.hw,
@@ -275,8 +258,6 @@ static const struct meson_aoclk_data gxbb_aoclkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(gxbb_aoclk_reset),
 	.reset		= gxbb_aoclk_reset,
-	.num_clks	= ARRAY_SIZE(gxbb_aoclk),
-	.clks		= gxbb_aoclk,
 	.hw_clks	= {
 		.hws	= gxbb_aoclk_hw_clks,
 		.num	= ARRAY_SIZE(gxbb_aoclk_hw_clks),
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 9aed0ea657abddfed2a8b19fe92f511ec7bd1c72..3b8731ec20168eaee01cc55cf805e24431afaffe 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -3237,398 +3237,7 @@ static struct clk_hw *gxl_hw_clks[] = {
 	[CLKID_ACODEC]		    = &gxl_acodec.hw,
 };
 
-static struct clk_regmap *const gxbb_clk_regmaps[] = {
-	&gxbb_clk81,
-	&gxbb_ddr,
-	&gxbb_dos,
-	&gxbb_isa,
-	&gxbb_pl301,
-	&gxbb_periphs,
-	&gxbb_spicc,
-	&gxbb_i2c,
-	&gxbb_sar_adc,
-	&gxbb_smart_card,
-	&gxbb_rng0,
-	&gxbb_uart0,
-	&gxbb_sdhc,
-	&gxbb_stream,
-	&gxbb_async_fifo,
-	&gxbb_sdio,
-	&gxbb_abuf,
-	&gxbb_hiu_iface,
-	&gxbb_assist_misc,
-	&gxbb_spi,
-	&gxbb_i2s_spdif,
-	&gxbb_eth,
-	&gxbb_demux,
-	&gxbb_aiu_glue,
-	&gxbb_iec958,
-	&gxbb_i2s_out,
-	&gxbb_amclk,
-	&gxbb_aififo2,
-	&gxbb_mixer,
-	&gxbb_mixer_iface,
-	&gxbb_adc,
-	&gxbb_blkmv,
-	&gxbb_aiu,
-	&gxbb_uart1,
-	&gxbb_g2d,
-	&gxbb_usb0,
-	&gxbb_usb1,
-	&gxbb_reset,
-	&gxbb_nand,
-	&gxbb_dos_parser,
-	&gxbb_usb,
-	&gxbb_vdin1,
-	&gxbb_ahb_arb0,
-	&gxbb_efuse,
-	&gxbb_boot_rom,
-	&gxbb_ahb_data_bus,
-	&gxbb_ahb_ctrl_bus,
-	&gxbb_hdmi_intr_sync,
-	&gxbb_hdmi_pclk,
-	&gxbb_usb1_ddr_bridge,
-	&gxbb_usb0_ddr_bridge,
-	&gxbb_mmc_pclk,
-	&gxbb_dvin,
-	&gxbb_uart2,
-	&gxbb_sana,
-	&gxbb_vpu_intr,
-	&gxbb_sec_ahb_ahb3_bridge,
-	&gxbb_clk81_a53,
-	&gxbb_vclk2_venci0,
-	&gxbb_vclk2_venci1,
-	&gxbb_vclk2_vencp0,
-	&gxbb_vclk2_vencp1,
-	&gxbb_gclk_venci_int0,
-	&gxbb_gclk_vencp_int,
-	&gxbb_dac_clk,
-	&gxbb_aoclk_gate,
-	&gxbb_iec958_gate,
-	&gxbb_enc480p,
-	&gxbb_rng1,
-	&gxbb_gclk_venci_int1,
-	&gxbb_vclk2_venclmcc,
-	&gxbb_vclk2_vencl,
-	&gxbb_vclk_other,
-	&gxbb_edp,
-	&gxbb_ao_media_cpu,
-	&gxbb_ao_ahb_sram,
-	&gxbb_ao_ahb_bus,
-	&gxbb_ao_iface,
-	&gxbb_ao_i2c,
-	&gxbb_emmc_a,
-	&gxbb_emmc_b,
-	&gxbb_emmc_c,
-	&gxbb_sar_adc_clk,
-	&gxbb_mali_0,
-	&gxbb_mali_1,
-	&gxbb_cts_amclk,
-	&gxbb_cts_mclk_i958,
-	&gxbb_32k_clk,
-	&gxbb_sd_emmc_a_clk0,
-	&gxbb_sd_emmc_b_clk0,
-	&gxbb_sd_emmc_c_clk0,
-	&gxbb_vpu_0,
-	&gxbb_vpu_1,
-	&gxbb_vapb_0,
-	&gxbb_vapb_1,
-	&gxbb_vapb,
-	&gxbb_mpeg_clk_div,
-	&gxbb_sar_adc_clk_div,
-	&gxbb_mali_0_div,
-	&gxbb_mali_1_div,
-	&gxbb_cts_mclk_i958_div,
-	&gxbb_32k_clk_div,
-	&gxbb_sd_emmc_a_clk0_div,
-	&gxbb_sd_emmc_b_clk0_div,
-	&gxbb_sd_emmc_c_clk0_div,
-	&gxbb_vpu_0_div,
-	&gxbb_vpu_1_div,
-	&gxbb_vapb_0_div,
-	&gxbb_vapb_1_div,
-	&gxbb_mpeg_clk_sel,
-	&gxbb_sar_adc_clk_sel,
-	&gxbb_mali_0_sel,
-	&gxbb_mali_1_sel,
-	&gxbb_mali,
-	&gxbb_cts_amclk_sel,
-	&gxbb_cts_mclk_i958_sel,
-	&gxbb_cts_i958,
-	&gxbb_32k_clk_sel,
-	&gxbb_sd_emmc_a_clk0_sel,
-	&gxbb_sd_emmc_b_clk0_sel,
-	&gxbb_sd_emmc_c_clk0_sel,
-	&gxbb_vpu_0_sel,
-	&gxbb_vpu_1_sel,
-	&gxbb_vpu,
-	&gxbb_vapb_0_sel,
-	&gxbb_vapb_1_sel,
-	&gxbb_vapb_sel,
-	&gxbb_mpll0,
-	&gxbb_mpll1,
-	&gxbb_mpll2,
-	&gxbb_mpll0_div,
-	&gxbb_mpll1_div,
-	&gxbb_mpll2_div,
-	&gxbb_cts_amclk_div,
-	&gxbb_fixed_pll,
-	&gxbb_sys_pll,
-	&gxbb_mpll_prediv,
-	&gxbb_fclk_div2,
-	&gxbb_fclk_div3,
-	&gxbb_fclk_div4,
-	&gxbb_fclk_div5,
-	&gxbb_fclk_div7,
-	&gxbb_vdec_1_sel,
-	&gxbb_vdec_1_div,
-	&gxbb_vdec_1,
-	&gxbb_vdec_hevc_sel,
-	&gxbb_vdec_hevc_div,
-	&gxbb_vdec_hevc,
-	&gxbb_gen_clk_sel,
-	&gxbb_gen_clk_div,
-	&gxbb_gen_clk,
-	&gxbb_fixed_pll_dco,
-	&gxbb_sys_pll_dco,
-	&gxbb_gp0_pll,
-	&gxbb_vid_pll,
-	&gxbb_vid_pll_sel,
-	&gxbb_vid_pll_div,
-	&gxbb_vclk,
-	&gxbb_vclk_sel,
-	&gxbb_vclk_div,
-	&gxbb_vclk_input,
-	&gxbb_vclk_div1,
-	&gxbb_vclk_div2_en,
-	&gxbb_vclk_div4_en,
-	&gxbb_vclk_div6_en,
-	&gxbb_vclk_div12_en,
-	&gxbb_vclk2,
-	&gxbb_vclk2_sel,
-	&gxbb_vclk2_div,
-	&gxbb_vclk2_input,
-	&gxbb_vclk2_div1,
-	&gxbb_vclk2_div2_en,
-	&gxbb_vclk2_div4_en,
-	&gxbb_vclk2_div6_en,
-	&gxbb_vclk2_div12_en,
-	&gxbb_cts_enci,
-	&gxbb_cts_enci_sel,
-	&gxbb_cts_encp,
-	&gxbb_cts_encp_sel,
-	&gxbb_cts_vdac,
-	&gxbb_cts_vdac_sel,
-	&gxbb_hdmi_tx,
-	&gxbb_hdmi_tx_sel,
-	&gxbb_hdmi_sel,
-	&gxbb_hdmi_div,
-	&gxbb_hdmi,
-	&gxbb_gp0_pll_dco,
-	&gxbb_hdmi_pll,
-	&gxbb_hdmi_pll_od,
-	&gxbb_hdmi_pll_od2,
-	&gxbb_hdmi_pll_dco,
-};
-
-static struct clk_regmap *const gxl_clk_regmaps[] = {
-	&gxbb_clk81,
-	&gxbb_ddr,
-	&gxbb_dos,
-	&gxbb_isa,
-	&gxbb_pl301,
-	&gxbb_periphs,
-	&gxbb_spicc,
-	&gxbb_i2c,
-	&gxbb_sar_adc,
-	&gxbb_smart_card,
-	&gxbb_rng0,
-	&gxbb_uart0,
-	&gxbb_sdhc,
-	&gxbb_stream,
-	&gxbb_async_fifo,
-	&gxbb_sdio,
-	&gxbb_abuf,
-	&gxbb_hiu_iface,
-	&gxbb_assist_misc,
-	&gxbb_spi,
-	&gxbb_i2s_spdif,
-	&gxbb_eth,
-	&gxbb_demux,
-	&gxbb_aiu_glue,
-	&gxbb_iec958,
-	&gxbb_i2s_out,
-	&gxbb_amclk,
-	&gxbb_aififo2,
-	&gxbb_mixer,
-	&gxbb_mixer_iface,
-	&gxbb_adc,
-	&gxbb_blkmv,
-	&gxbb_aiu,
-	&gxbb_uart1,
-	&gxbb_g2d,
-	&gxbb_usb0,
-	&gxbb_usb1,
-	&gxbb_reset,
-	&gxbb_nand,
-	&gxbb_dos_parser,
-	&gxbb_usb,
-	&gxbb_vdin1,
-	&gxbb_ahb_arb0,
-	&gxbb_efuse,
-	&gxbb_boot_rom,
-	&gxbb_ahb_data_bus,
-	&gxbb_ahb_ctrl_bus,
-	&gxbb_hdmi_intr_sync,
-	&gxbb_hdmi_pclk,
-	&gxbb_usb1_ddr_bridge,
-	&gxbb_usb0_ddr_bridge,
-	&gxbb_mmc_pclk,
-	&gxbb_dvin,
-	&gxbb_uart2,
-	&gxbb_sana,
-	&gxbb_vpu_intr,
-	&gxbb_sec_ahb_ahb3_bridge,
-	&gxbb_clk81_a53,
-	&gxbb_vclk2_venci0,
-	&gxbb_vclk2_venci1,
-	&gxbb_vclk2_vencp0,
-	&gxbb_vclk2_vencp1,
-	&gxbb_gclk_venci_int0,
-	&gxbb_gclk_vencp_int,
-	&gxbb_dac_clk,
-	&gxbb_aoclk_gate,
-	&gxbb_iec958_gate,
-	&gxbb_enc480p,
-	&gxbb_rng1,
-	&gxbb_gclk_venci_int1,
-	&gxbb_vclk2_venclmcc,
-	&gxbb_vclk2_vencl,
-	&gxbb_vclk_other,
-	&gxbb_edp,
-	&gxbb_ao_media_cpu,
-	&gxbb_ao_ahb_sram,
-	&gxbb_ao_ahb_bus,
-	&gxbb_ao_iface,
-	&gxbb_ao_i2c,
-	&gxbb_emmc_a,
-	&gxbb_emmc_b,
-	&gxbb_emmc_c,
-	&gxbb_sar_adc_clk,
-	&gxbb_mali_0,
-	&gxbb_mali_1,
-	&gxbb_cts_amclk,
-	&gxbb_cts_mclk_i958,
-	&gxbb_32k_clk,
-	&gxbb_sd_emmc_a_clk0,
-	&gxbb_sd_emmc_b_clk0,
-	&gxbb_sd_emmc_c_clk0,
-	&gxbb_vpu_0,
-	&gxbb_vpu_1,
-	&gxbb_vapb_0,
-	&gxbb_vapb_1,
-	&gxbb_vapb,
-	&gxbb_mpeg_clk_div,
-	&gxbb_sar_adc_clk_div,
-	&gxbb_mali_0_div,
-	&gxbb_mali_1_div,
-	&gxbb_cts_mclk_i958_div,
-	&gxbb_32k_clk_div,
-	&gxbb_sd_emmc_a_clk0_div,
-	&gxbb_sd_emmc_b_clk0_div,
-	&gxbb_sd_emmc_c_clk0_div,
-	&gxbb_vpu_0_div,
-	&gxbb_vpu_1_div,
-	&gxbb_vapb_0_div,
-	&gxbb_vapb_1_div,
-	&gxbb_mpeg_clk_sel,
-	&gxbb_sar_adc_clk_sel,
-	&gxbb_mali_0_sel,
-	&gxbb_mali_1_sel,
-	&gxbb_mali,
-	&gxbb_cts_amclk_sel,
-	&gxbb_cts_mclk_i958_sel,
-	&gxbb_cts_i958,
-	&gxbb_32k_clk_sel,
-	&gxbb_sd_emmc_a_clk0_sel,
-	&gxbb_sd_emmc_b_clk0_sel,
-	&gxbb_sd_emmc_c_clk0_sel,
-	&gxbb_vpu_0_sel,
-	&gxbb_vpu_1_sel,
-	&gxbb_vpu,
-	&gxbb_vapb_0_sel,
-	&gxbb_vapb_1_sel,
-	&gxbb_vapb_sel,
-	&gxbb_mpll0,
-	&gxbb_mpll1,
-	&gxbb_mpll2,
-	&gxl_mpll0_div,
-	&gxbb_mpll1_div,
-	&gxbb_mpll2_div,
-	&gxbb_cts_amclk_div,
-	&gxbb_fixed_pll,
-	&gxbb_sys_pll,
-	&gxbb_mpll_prediv,
-	&gxbb_fclk_div2,
-	&gxbb_fclk_div3,
-	&gxbb_fclk_div4,
-	&gxbb_fclk_div5,
-	&gxbb_fclk_div7,
-	&gxbb_vdec_1_sel,
-	&gxbb_vdec_1_div,
-	&gxbb_vdec_1,
-	&gxbb_vdec_hevc_sel,
-	&gxbb_vdec_hevc_div,
-	&gxbb_vdec_hevc,
-	&gxbb_gen_clk_sel,
-	&gxbb_gen_clk_div,
-	&gxbb_gen_clk,
-	&gxbb_fixed_pll_dco,
-	&gxbb_sys_pll_dco,
-	&gxbb_gp0_pll,
-	&gxbb_vid_pll,
-	&gxbb_vid_pll_sel,
-	&gxbb_vid_pll_div,
-	&gxbb_vclk,
-	&gxbb_vclk_sel,
-	&gxbb_vclk_div,
-	&gxbb_vclk_input,
-	&gxbb_vclk_div1,
-	&gxbb_vclk_div2_en,
-	&gxbb_vclk_div4_en,
-	&gxbb_vclk_div6_en,
-	&gxbb_vclk_div12_en,
-	&gxbb_vclk2,
-	&gxbb_vclk2_sel,
-	&gxbb_vclk2_div,
-	&gxbb_vclk2_input,
-	&gxbb_vclk2_div1,
-	&gxbb_vclk2_div2_en,
-	&gxbb_vclk2_div4_en,
-	&gxbb_vclk2_div6_en,
-	&gxbb_vclk2_div12_en,
-	&gxbb_cts_enci,
-	&gxbb_cts_enci_sel,
-	&gxbb_cts_encp,
-	&gxbb_cts_encp_sel,
-	&gxbb_cts_vdac,
-	&gxbb_cts_vdac_sel,
-	&gxbb_hdmi_tx,
-	&gxbb_hdmi_tx_sel,
-	&gxbb_hdmi_sel,
-	&gxbb_hdmi_div,
-	&gxbb_hdmi,
-	&gxl_gp0_pll_dco,
-	&gxl_hdmi_pll,
-	&gxl_hdmi_pll_od,
-	&gxl_hdmi_pll_od2,
-	&gxl_hdmi_pll_dco,
-	&gxl_acodec,
-};
-
 static const struct meson_eeclkc_data gxbb_clkc_data = {
-	.regmap_clks = gxbb_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(gxbb_clk_regmaps),
 	.hw_clks = {
 		.hws = gxbb_hw_clks,
 		.num = ARRAY_SIZE(gxbb_hw_clks),
@@ -3636,8 +3245,6 @@ static const struct meson_eeclkc_data gxbb_clkc_data = {
 };
 
 static const struct meson_eeclkc_data gxl_clkc_data = {
-	.regmap_clks = gxl_clk_regmaps,
-	.regmap_clk_num = ARRAY_SIZE(gxl_clk_regmaps),
 	.hw_clks = {
 		.hws = gxl_hw_clks,
 		.num = ARRAY_SIZE(gxl_hw_clks),
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 995be51987f4821311f9db6606547352d9235c57..894c02fda072ddd0733165d5f60efe1d0da2388d 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -18,6 +18,7 @@
 
 #include <linux/slab.h>
 #include "meson-aoclk.h"
+#include "clk-regmap.h"
 
 static int meson_aoclk_do_reset(struct reset_controller_dev *rcdev,
 			       unsigned long id)
@@ -70,10 +71,6 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Populate regmap */
-	for (clkid = 0; clkid < data->num_clks; clkid++)
-		data->clks[clkid]->map = regmap;
-
 	/* Register all clks */
 	for (clkid = 0; clkid < data->hw_clks.num; clkid++) {
 		if (!data->hw_clks.hws[clkid])
diff --git a/drivers/clk/meson/meson-aoclk.h b/drivers/clk/meson/meson-aoclk.h
index 308be3e4814a9477287c5d1df5138142e3fa38f1..ea5fc61308af14c63489b7c72410d9d981d8745b 100644
--- a/drivers/clk/meson/meson-aoclk.h
+++ b/drivers/clk/meson/meson-aoclk.h
@@ -23,8 +23,6 @@ struct meson_aoclk_data {
 	const unsigned int			reset_reg;
 	const int				num_reset;
 	const unsigned int			*reset;
-	const int				num_clks;
-	struct clk_regmap			**clks;
 	struct meson_clk_hw_data		hw_clks;
 };
 
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 3053ee7425eb5cccaa8430b1b67e5cbb43af4d2e..6236bf970d79e85b1e739c713c03f35a00c291b9 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -39,10 +39,6 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < data->regmap_clk_num; i++)
-		data->regmap_clks[i]->map = map;
-
 	for (i = 0; i < data->hw_clks.num; i++) {
 		/* array might be sparse */
 		if (!data->hw_clks.hws[i])
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 37a48b75c66051b68730f808f7c01e6397c34231..6a81d67b46b2270315e24eb58042de8c09b37763 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -14,8 +14,6 @@
 struct platform_device;
 
 struct meson_eeclkc_data {
-	struct clk_regmap *const	*regmap_clks;
-	unsigned int			regmap_clk_num;
 	const struct reg_sequence	*init_regs;
 	unsigned int			init_count;
 	struct meson_clk_hw_data	hw_clks;
diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
index 4b73ea244b630fb4cfb6525a8cb4848c987a8107..1975fc3987e2cb28823ffd69a5e2aa7b33f4853e 100644
--- a/drivers/clk/meson/meson8-ddr.c
+++ b/drivers/clk/meson/meson8-ddr.c
@@ -85,11 +85,6 @@ static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
 	.num = 2,
 };
 
-static struct clk_regmap *const meson8_ddr_clk_regmaps[] = {
-	&meson8_ddr_pll_dco,
-	&meson8_ddr_pll,
-};
-
 static const struct regmap_config meson8_ddr_clkc_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 32,
@@ -113,10 +108,6 @@ static int meson8_ddr_clkc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Populate regmap */
-	for (i = 0; i < ARRAY_SIZE(meson8_ddr_clk_regmaps); i++)
-		meson8_ddr_clk_regmaps[i]->map = regmap;
-
 	/* Register all clks */
 	for (i = 0; i < meson8_ddr_clk_hw_onecell_data.num; i++) {
 		hw = meson8_ddr_clk_hw_onecell_data.hws[i];
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index cff07006016bcf37b6381364cf2d83d22feffee8..2065383266145b76f86e7f945cbf552a24ae881e 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3472,202 +3472,6 @@ static struct clk_hw *meson8m2_hw_clks[] = {
 	[CLKID_HDMI_PLL_DCO_IN]	    = &hdmi_pll_dco_in.hw,
 };
 
-static struct clk_regmap *const meson8b_clk_regmaps[] = {
-	&meson8b_clk81,
-	&meson8b_ddr,
-	&meson8b_dos,
-	&meson8b_isa,
-	&meson8b_pl301,
-	&meson8b_periphs,
-	&meson8b_spicc,
-	&meson8b_i2c,
-	&meson8b_sar_adc,
-	&meson8b_smart_card,
-	&meson8b_rng0,
-	&meson8b_uart0,
-	&meson8b_sdhc,
-	&meson8b_stream,
-	&meson8b_async_fifo,
-	&meson8b_sdio,
-	&meson8b_abuf,
-	&meson8b_hiu_iface,
-	&meson8b_assist_misc,
-	&meson8b_spi,
-	&meson8b_i2s_spdif,
-	&meson8b_eth,
-	&meson8b_demux,
-	&meson8b_aiu_glue,
-	&meson8b_iec958,
-	&meson8b_i2s_out,
-	&meson8b_amclk,
-	&meson8b_aififo2,
-	&meson8b_mixer,
-	&meson8b_mixer_iface,
-	&meson8b_adc,
-	&meson8b_blkmv,
-	&meson8b_aiu,
-	&meson8b_uart1,
-	&meson8b_g2d,
-	&meson8b_usb0,
-	&meson8b_usb1,
-	&meson8b_reset,
-	&meson8b_nand,
-	&meson8b_dos_parser,
-	&meson8b_usb,
-	&meson8b_vdin1,
-	&meson8b_ahb_arb0,
-	&meson8b_efuse,
-	&meson8b_boot_rom,
-	&meson8b_ahb_data_bus,
-	&meson8b_ahb_ctrl_bus,
-	&meson8b_hdmi_intr_sync,
-	&meson8b_hdmi_pclk,
-	&meson8b_usb1_ddr_bridge,
-	&meson8b_usb0_ddr_bridge,
-	&meson8b_mmc_pclk,
-	&meson8b_dvin,
-	&meson8b_uart2,
-	&meson8b_sana,
-	&meson8b_vpu_intr,
-	&meson8b_sec_ahb_ahb3_bridge,
-	&meson8b_clk81_a9,
-	&meson8b_vclk2_venci0,
-	&meson8b_vclk2_venci1,
-	&meson8b_vclk2_vencp0,
-	&meson8b_vclk2_vencp1,
-	&meson8b_gclk_venci_int,
-	&meson8b_gclk_vencp_int,
-	&meson8b_dac_clk,
-	&meson8b_aoclk_gate,
-	&meson8b_iec958_gate,
-	&meson8b_enc480p,
-	&meson8b_rng1,
-	&meson8b_gclk_vencl_int,
-	&meson8b_vclk2_venclmcc,
-	&meson8b_vclk2_vencl,
-	&meson8b_vclk2_other,
-	&meson8b_edp,
-	&meson8b_ao_media_cpu,
-	&meson8b_ao_ahb_sram,
-	&meson8b_ao_ahb_bus,
-	&meson8b_ao_iface,
-	&meson8b_mpeg_clk_div,
-	&meson8b_mpeg_clk_sel,
-	&meson8b_mpll0,
-	&meson8b_mpll1,
-	&meson8b_mpll2,
-	&meson8b_mpll0_div,
-	&meson8b_mpll1_div,
-	&meson8b_mpll2_div,
-	&meson8b_fixed_pll,
-	&meson8b_sys_pll,
-	&meson8b_cpu_in_sel,
-	&meson8b_cpu_scale_div,
-	&meson8b_cpu_scale_out_sel,
-	&meson8b_cpu_clk,
-	&meson8b_mpll_prediv,
-	&meson8b_fclk_div2,
-	&meson8b_fclk_div3,
-	&meson8b_fclk_div4,
-	&meson8b_fclk_div5,
-	&meson8b_fclk_div7,
-	&meson8b_nand_clk_sel,
-	&meson8b_nand_clk_div,
-	&meson8b_nand_clk_gate,
-	&meson8b_fixed_pll_dco,
-	&meson8b_hdmi_pll_dco,
-	&meson8b_sys_pll_dco,
-	&meson8b_apb_clk_sel,
-	&meson8b_apb_clk_gate,
-	&meson8b_periph_clk_sel,
-	&meson8b_periph_clk_gate,
-	&meson8b_axi_clk_sel,
-	&meson8b_axi_clk_gate,
-	&meson8b_l2_dram_clk_sel,
-	&meson8b_l2_dram_clk_gate,
-	&meson8b_hdmi_pll_lvds_out,
-	&meson8b_hdmi_pll_hdmi_out,
-	&meson8b_vid_pll_in_sel,
-	&meson8b_vid_pll_in_en,
-	&meson8b_vid_pll_pre_div,
-	&meson8b_vid_pll_post_div,
-	&meson8b_vid_pll,
-	&meson8b_vid_pll_final_div,
-	&meson8b_vclk_in_sel,
-	&meson8b_vclk_in_en,
-	&meson8b_vclk_en,
-	&meson8b_vclk_div1_gate,
-	&meson8b_vclk_div2_div_gate,
-	&meson8b_vclk_div4_div_gate,
-	&meson8b_vclk_div6_div_gate,
-	&meson8b_vclk_div12_div_gate,
-	&meson8b_vclk2_in_sel,
-	&meson8b_vclk2_clk_in_en,
-	&meson8b_vclk2_clk_en,
-	&meson8b_vclk2_div1_gate,
-	&meson8b_vclk2_div2_div_gate,
-	&meson8b_vclk2_div4_div_gate,
-	&meson8b_vclk2_div6_div_gate,
-	&meson8b_vclk2_div12_div_gate,
-	&meson8b_cts_enct_sel,
-	&meson8b_cts_enct,
-	&meson8b_cts_encp_sel,
-	&meson8b_cts_encp,
-	&meson8b_cts_enci_sel,
-	&meson8b_cts_enci,
-	&meson8b_hdmi_tx_pixel_sel,
-	&meson8b_hdmi_tx_pixel,
-	&meson8b_cts_encl_sel,
-	&meson8b_cts_encl,
-	&meson8b_cts_vdac0_sel,
-	&meson8b_cts_vdac0,
-	&meson8b_hdmi_sys_sel,
-	&meson8b_hdmi_sys_div,
-	&meson8b_hdmi_sys,
-	&meson8b_mali_0_sel,
-	&meson8b_mali_0_div,
-	&meson8b_mali_0,
-	&meson8b_mali_1_sel,
-	&meson8b_mali_1_div,
-	&meson8b_mali_1,
-	&meson8b_mali,
-	&meson8m2_gp_pll_dco,
-	&meson8m2_gp_pll,
-	&meson8b_vpu_0_sel,
-	&meson8m2_vpu_0_sel,
-	&meson8b_vpu_0_div,
-	&meson8b_vpu_0,
-	&meson8b_vpu_1_sel,
-	&meson8m2_vpu_1_sel,
-	&meson8b_vpu_1_div,
-	&meson8b_vpu_1,
-	&meson8b_vpu,
-	&meson8b_vdec_1_sel,
-	&meson8b_vdec_1_1_div,
-	&meson8b_vdec_1_1,
-	&meson8b_vdec_1_2_div,
-	&meson8b_vdec_1_2,
-	&meson8b_vdec_1,
-	&meson8b_vdec_hcodec_sel,
-	&meson8b_vdec_hcodec_div,
-	&meson8b_vdec_hcodec,
-	&meson8b_vdec_2_sel,
-	&meson8b_vdec_2_div,
-	&meson8b_vdec_2,
-	&meson8b_vdec_hevc_sel,
-	&meson8b_vdec_hevc_div,
-	&meson8b_vdec_hevc_en,
-	&meson8b_vdec_hevc,
-	&meson8b_cts_amclk,
-	&meson8b_cts_amclk_sel,
-	&meson8b_cts_amclk_div,
-	&meson8b_cts_mclk_i958_sel,
-	&meson8b_cts_mclk_i958_div,
-	&meson8b_cts_mclk_i958,
-	&meson8b_cts_i958,
-	&meson8b_vid_pll_lvds_en,
-};
-
 static const struct meson8b_clk_reset_line {
 	u32 reg;
 	u8 bit_idx;
@@ -3884,10 +3688,6 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		return;
 	}
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(meson8b_clk_regmaps); i++)
-		meson8b_clk_regmaps[i]->map = map;
-
 	/*
 	 * register all clks and start with the first used ID (which is
 	 * CLKID_PLL_FIXED)
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 4c663dc33572e25cc4727a121ed2a0f5d4efd98f..fd2d4d725f9e2595a865909db3c0c598309ef448 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3567,231 +3567,6 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk_gate.hw,
 };
 
-/* Convenience table to populate regmap in .probe */
-static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
-	&s4_rtc_32k_by_oscin_clkin,
-	&s4_rtc_32k_by_oscin_div,
-	&s4_rtc_32k_by_oscin_sel,
-	&s4_rtc_32k_by_oscin,
-	&s4_rtc_clk,
-	&s4_sysclk_b_sel,
-	&s4_sysclk_b_div,
-	&s4_sysclk_b,
-	&s4_sysclk_a_sel,
-	&s4_sysclk_a_div,
-	&s4_sysclk_a,
-	&s4_sys_clk,
-	&s4_ceca_32k_clkin,
-	&s4_ceca_32k_div,
-	&s4_ceca_32k_sel_pre,
-	&s4_ceca_32k_sel,
-	&s4_ceca_32k_clkout,
-	&s4_cecb_32k_clkin,
-	&s4_cecb_32k_div,
-	&s4_cecb_32k_sel_pre,
-	&s4_cecb_32k_sel,
-	&s4_cecb_32k_clkout,
-	&s4_sc_clk_mux,
-	&s4_sc_clk_div,
-	&s4_sc_clk_gate,
-	&s4_12_24M_clk_gate,
-	&s4_12_24M_clk,
-	&s4_vid_pll_div,
-	&s4_vid_pll_sel,
-	&s4_vid_pll,
-	&s4_vclk_sel,
-	&s4_vclk2_sel,
-	&s4_vclk_input,
-	&s4_vclk2_input,
-	&s4_vclk_div,
-	&s4_vclk2_div,
-	&s4_vclk,
-	&s4_vclk2,
-	&s4_vclk_div1,
-	&s4_vclk_div2_en,
-	&s4_vclk_div4_en,
-	&s4_vclk_div6_en,
-	&s4_vclk_div12_en,
-	&s4_vclk2_div1,
-	&s4_vclk2_div2_en,
-	&s4_vclk2_div4_en,
-	&s4_vclk2_div6_en,
-	&s4_vclk2_div12_en,
-	&s4_cts_enci_sel,
-	&s4_cts_encp_sel,
-	&s4_cts_vdac_sel,
-	&s4_hdmi_tx_sel,
-	&s4_cts_enci,
-	&s4_cts_encp,
-	&s4_cts_vdac,
-	&s4_hdmi_tx,
-	&s4_hdmi_sel,
-	&s4_hdmi_div,
-	&s4_hdmi,
-	&s4_ts_clk_div,
-	&s4_ts_clk_gate,
-	&s4_mali_0_sel,
-	&s4_mali_0_div,
-	&s4_mali_0,
-	&s4_mali_1_sel,
-	&s4_mali_1_div,
-	&s4_mali_1,
-	&s4_mali_mux,
-	&s4_vdec_p0_mux,
-	&s4_vdec_p0_div,
-	&s4_vdec_p0,
-	&s4_vdec_p1_mux,
-	&s4_vdec_p1_div,
-	&s4_vdec_p1,
-	&s4_vdec_mux,
-	&s4_hevcf_p0_mux,
-	&s4_hevcf_p0_div,
-	&s4_hevcf_p0,
-	&s4_hevcf_p1_mux,
-	&s4_hevcf_p1_div,
-	&s4_hevcf_p1,
-	&s4_hevcf_mux,
-	&s4_vpu_0_sel,
-	&s4_vpu_0_div,
-	&s4_vpu_0,
-	&s4_vpu_1_sel,
-	&s4_vpu_1_div,
-	&s4_vpu_1,
-	&s4_vpu,
-	&s4_vpu_clkb_tmp_mux,
-	&s4_vpu_clkb_tmp_div,
-	&s4_vpu_clkb_tmp,
-	&s4_vpu_clkb_div,
-	&s4_vpu_clkb,
-	&s4_vpu_clkc_p0_mux,
-	&s4_vpu_clkc_p0_div,
-	&s4_vpu_clkc_p0,
-	&s4_vpu_clkc_p1_mux,
-	&s4_vpu_clkc_p1_div,
-	&s4_vpu_clkc_p1,
-	&s4_vpu_clkc_mux,
-	&s4_vapb_0_sel,
-	&s4_vapb_0_div,
-	&s4_vapb_0,
-	&s4_vapb_1_sel,
-	&s4_vapb_1_div,
-	&s4_vapb_1,
-	&s4_vapb,
-	&s4_ge2d_gate,
-	&s4_hdcp22_esmclk_mux,
-	&s4_hdcp22_esmclk_div,
-	&s4_hdcp22_esmclk_gate,
-	&s4_hdcp22_skpclk_mux,
-	&s4_hdcp22_skpclk_div,
-	&s4_hdcp22_skpclk_gate,
-	&s4_vdin_meas_mux,
-	&s4_vdin_meas_div,
-	&s4_vdin_meas_gate,
-	&s4_sd_emmc_c_clk0_sel,
-	&s4_sd_emmc_c_clk0_div,
-	&s4_sd_emmc_c_clk0,
-	&s4_sd_emmc_a_clk0_sel,
-	&s4_sd_emmc_a_clk0_div,
-	&s4_sd_emmc_a_clk0,
-	&s4_sd_emmc_b_clk0_sel,
-	&s4_sd_emmc_b_clk0_div,
-	&s4_sd_emmc_b_clk0,
-	&s4_spicc0_mux,
-	&s4_spicc0_div,
-	&s4_spicc0_gate,
-	&s4_pwm_a_mux,
-	&s4_pwm_a_div,
-	&s4_pwm_a_gate,
-	&s4_pwm_b_mux,
-	&s4_pwm_b_div,
-	&s4_pwm_b_gate,
-	&s4_pwm_c_mux,
-	&s4_pwm_c_div,
-	&s4_pwm_c_gate,
-	&s4_pwm_d_mux,
-	&s4_pwm_d_div,
-	&s4_pwm_d_gate,
-	&s4_pwm_e_mux,
-	&s4_pwm_e_div,
-	&s4_pwm_e_gate,
-	&s4_pwm_f_mux,
-	&s4_pwm_f_div,
-	&s4_pwm_f_gate,
-	&s4_pwm_g_mux,
-	&s4_pwm_g_div,
-	&s4_pwm_g_gate,
-	&s4_pwm_h_mux,
-	&s4_pwm_h_div,
-	&s4_pwm_h_gate,
-	&s4_pwm_i_mux,
-	&s4_pwm_i_div,
-	&s4_pwm_i_gate,
-	&s4_pwm_j_mux,
-	&s4_pwm_j_div,
-	&s4_pwm_j_gate,
-	&s4_saradc_mux,
-	&s4_saradc_div,
-	&s4_saradc_gate,
-	&s4_gen_clk_sel,
-	&s4_gen_clk_div,
-	&s4_gen_clk,
-	&s4_ddr,
-	&s4_dos,
-	&s4_ethphy,
-	&s4_mali,
-	&s4_aocpu,
-	&s4_aucpu,
-	&s4_cec,
-	&s4_sdemmca,
-	&s4_sdemmcb,
-	&s4_nand,
-	&s4_smartcard,
-	&s4_acodec,
-	&s4_spifc,
-	&s4_msr_clk,
-	&s4_ir_ctrl,
-	&s4_audio,
-	&s4_eth,
-	&s4_uart_a,
-	&s4_uart_b,
-	&s4_uart_c,
-	&s4_uart_d,
-	&s4_uart_e,
-	&s4_aififo,
-	&s4_ts_ddr,
-	&s4_ts_pll,
-	&s4_g2d,
-	&s4_spicc0,
-	&s4_usb,
-	&s4_i2c_m_a,
-	&s4_i2c_m_b,
-	&s4_i2c_m_c,
-	&s4_i2c_m_d,
-	&s4_i2c_m_e,
-	&s4_hdmitx_apb,
-	&s4_i2c_s_a,
-	&s4_usb1_to_ddr,
-	&s4_hdcp22,
-	&s4_mmc_apb,
-	&s4_rsa,
-	&s4_cpu_debug,
-	&s4_vpu_intr,
-	&s4_demod,
-	&s4_sar_adc,
-	&s4_gic,
-	&s4_pwm_ab,
-	&s4_pwm_cd,
-	&s4_pwm_ef,
-	&s4_pwm_gh,
-	&s4_pwm_ij,
-	&s4_demod_core_clk_mux,
-	&s4_demod_core_clk_div,
-	&s4_demod_core_clk_gate,
-	&s4_adc_extclk_in_mux,
-	&s4_adc_extclk_in_div,
-	&s4_adc_extclk_in_gate,
-};
-
 static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
@@ -3821,10 +3596,6 @@ static int meson_s4_periphs_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "can't init regmap mmio region\n");
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(s4_periphs_clk_regmaps); i++)
-		s4_periphs_clk_regmaps[i]->map = regmap;
-
 	for (i = 0; i < s4_periphs_clks.num; i++) {
 		/* array might be sparse */
 		if (!s4_periphs_clks.hws[i])
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 911a590d206fb32d401e8d71548ca0e14920d29f..3d689d2f003e21658016b84918bf1b7b1954c05a 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -794,33 +794,6 @@ static struct clk_hw *s4_pll_hw_clks[] = {
 	[CLKID_MPLL3]			= &s4_mpll3.hw,
 };
 
-static struct clk_regmap *const s4_pll_clk_regmaps[] = {
-	&s4_fixed_pll_dco,
-	&s4_fixed_pll,
-	&s4_fclk_div2,
-	&s4_fclk_div3,
-	&s4_fclk_div4,
-	&s4_fclk_div5,
-	&s4_fclk_div7,
-	&s4_fclk_div2p5,
-	&s4_gp0_pll_dco,
-	&s4_gp0_pll,
-	&s4_hifi_pll_dco,
-	&s4_hifi_pll,
-	&s4_hdmi_pll_dco,
-	&s4_hdmi_pll_od,
-	&s4_hdmi_pll,
-	&s4_mpll_50m,
-	&s4_mpll0_div,
-	&s4_mpll0,
-	&s4_mpll1_div,
-	&s4_mpll1,
-	&s4_mpll2_div,
-	&s4_mpll2,
-	&s4_mpll3_div,
-	&s4_mpll3,
-};
-
 static const struct reg_sequence s4_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
@@ -859,10 +832,6 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to init registers\n");
 
-	/* Populate regmap for the regmap backed clocks */
-	for (i = 0; i < ARRAY_SIZE(s4_pll_clk_regmaps); i++)
-		s4_pll_clk_regmaps[i]->map = regmap;
-
 	/* Register clocks */
 	for (i = 0; i < s4_pll_clks.num; i++) {
 		/* array might be sparse */

-- 
2.47.2

