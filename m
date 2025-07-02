Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501882F1981
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470041; cv=none; b=S906OGAH0j3OQPIvneBYRNCbFukAsE6xX/WhvbIvG60mIMpNXcLw57JLQdE4RtU4ezn6yLQm3igN0MAifnHWg96Bgh2u3YZIgaFyksvPMakSmwWXncpCU/j9xYvcXxI2bULWdhaonqRPEBeQ8EWTIs9GDhJXudwnIpwipggj40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470041; c=relaxed/simple;
	bh=+4gGpwwdJPehcb6MY13hu1DwqBKwA3N9+XdMqerXYvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MqqzFlAE9jKXZBeNd9WXa/68IWonG9uxHrLqR2JiLHwCurvzH1DO8sMa1VLCVoPZzGAvlT8+PC26qFznluCGXme0TbMHu+skJiLyjqvkzOniiovI1a9xVHlu7SQdln56MpkmGg/GPxpu4LXO4iyFarnmNpHgCToE7Qs6RNyAPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aaOKxVTO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aaOKxVTO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so59112375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470037; x=1752074837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRAbaCLoGVu2ASuLMQiTW/6N/TITyvlFHl14jkb9has=;
        b=aaOKxVTO3GYOfrsSK2L9jAS/ryHJ9CtdsxJZX26YR2ZAoFcjhsTQDpLyh7+ByvtygG
         pFTzmsnImg+/IyHdo4xtBTH0ATJqUDFzLwv0ZopkOKhTD3H10y8peuIpViqbP8n4K7XC
         +8Dh5Qx/hqS8JibRFpWf4ieeMNzpgthZBSmIzxBxNKLSgT/LRO2ljoRQT67nxK7zbMg4
         IhC4zcHAYplUeuBusKPE7BJlv9w5rDH2AxE2drftFU8EHiovNigdHPYxWo9tjPmd+bcz
         /IqWQ+1KBtvU0iKlH8ql5NHjcswFMpvp1SxVu1NW6Py1dEVZSHY7vZ/pV3IWPLfaIMTV
         //SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470037; x=1752074837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRAbaCLoGVu2ASuLMQiTW/6N/TITyvlFHl14jkb9has=;
        b=uUvK7IqpxVxDwQYt5zewsImraVQ/Uy0/bpwWZekMe8SNT4o0jgrCQa6QpGvC+ahU8S
         Jof0uKgl9u+4P4uOPleY0Gs1yn0JnEpyGPeH9Uzdc43GEkqtgTacUIK6i56E9a/DpzK0
         hm3X8NH0Z5FpAIVEOB8sFs1KwrJEVs9UawmM0EQVKidynXnXCwUuKY+lWbsIAFuDQO2u
         JlfDQeYBE7A0txjI99rrOo+aARdys922T067D+xPej9UveEbcOx6Pjg4wTzUONvauXNm
         Wml33mTUX1lBBI7AVr7wTNI4412QV25M0c+fSPcPkbI4+9hljwkbEhHXbMxiH1o/g753
         1yrw==
X-Forwarded-Encrypted: i=1; AJvYcCUO4CHerDSyRW4jsc29o08cyNRmidTiv3ASd0oBUCuyI28jsjvkEWfrg4TwAvyuT52MwHAmJNAuciRWdTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSut6eTw9HcsrC1hqFFRxIAyBoCvpKBy5hx8rY5sRwfi2qA+1R
	5HGaX5uoVu9NDvl0gSBZJ9PEhAECSiYeZ72HW1MbQeOzgesaPNJy9dajnNMrqiynpfw=
X-Gm-Gg: ASbGnct2MeiOX1C/lH8YyhLhPc2VmHojNXI7IatO5YYJ3pmqkITuSjOmd1iP8pKOsb8
	BlUvqfXkgiVOXjZcsCQlfG7UkkpKjN1TMFhDYRwwbjZ/+2ghxAOBmRwk/N1T8d9PQJ5g97lhTou
	xsWeIvnGOHGNHmmyUsXZboOGPMCIXM+soAkdX5xjA3CI3ztg3eKfLTn2gx11nRSIvIhxx8IHgtI
	+zWGQwCqiwbJ5D40IURz7LaRKjQrl2XBBjRRDyZ/gyWHbJWjCmGoi8j6cIPMUltggexa7DDHCXV
	deJEjuMTk3hn/tSXbPXlawFaiEeQ/26WVZZkuFdh9Q0gQHNGU86ekd1nTBHQ+BMHuAFI3Qw6B0d
	x
X-Google-Smtp-Source: AGHT+IFtr+iytP943ULqJ7xO9pqvB8+ljmBrJUotef7DLaTSuQnoba28iCZNoONgvONxIjr/J5r2cg==
X-Received: by 2002:a05:600c:1909:b0:451:833f:483c with SMTP id 5b1f17b1804b1-454a3c0740dmr31999235e9.7.1751470036553;
        Wed, 02 Jul 2025 08:27:16 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:02 +0200
Subject: [PATCH 04/26] clk: amlogic: axg: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-4-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18767; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=+4gGpwwdJPehcb6MY13hu1DwqBKwA3N9+XdMqerXYvU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+6My9j6TY7uXUuHYwKinzQR7w826glhnTqz
 zSAmoK/LciJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPugAKCRDm/A8cN/La
 hWa8EACzjT2GIhu+j5rCzttchKJatX4I1bPXSJgnrmfABMihiFeTcYASdPg9h3SksvCUPbkrALV
 wb2sVyfDGBQg8ZT2zreAcAuNmtHKPd9AqIEGScfOkkoKSkvjuVh0zz2aDjP23NjZFun0wWKHPJH
 wq6qRcirDQ0ljtAFB8kFQidK5cFscHver0aOcLjiWyocgIjQdF3cNGm7h6+jVD7tnJWIGfuw+8l
 br2bs1gexL0jpYyfHnM1OgBK93i9QEaeQzZnaUo+Prze08JUVWAI20v8Vlho7aUxWQu/cS3QSSb
 kji8frMjAO98wqW5ToBVrb2htG1Bk5BIjwYefL+K+qE01sbnrOT5ZdsD8+o7EAJRY64lGSaPYcw
 R6jzWGv4xL5/YZ9Cus2GlBg+2jVKEBU8Gn4/Mil2UZPcFp6JmJ1bAHk8/LfReEqYJLUF+IlD78L
 kGc7BjJVk73DZF3fWy2rB/D4iTdLv9kcmQvH8xRH0fTF8o3CpjmjA5e15eLbMZdh6sH6uOjQ5fF
 tPqYJ93k7WF7+uUKInpUgXLMGpKnSCt4jFWVw7d4ya86hasQD1hbz+Cj1b8KuMGgJbqAVBgIv04
 ToxNqNGPTTfeEdzi6ilPRN4hYYS9E1FYXodLzgKn9iCRAUk9zDcnChjc3VyH8vstXftNLbugQaE
 iGD9ihGLx/OJ9gA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Amlogic clock controller drivers are all doing the same thing, more or
less. Yet, over the years, tiny (and often pointless) differences have
emerged.

This makes reviews more difficult, allows some errors to slip through and
make it more difficult to exploit SoC commonalities, leading to code
duplication.

This change enforce, wherever possible, a consistent and predictable scheme
when it comes to code organisation and naming, The scheme chosen is what
was used the most already, to try and minimise the size of the ugly
resulting diff. Here are some of the rules applied:
- Aligning clock names, variable names and IDs.
  - ID cannot change (used in DT)
  - Variable names w/ SoC name prefixes
  - Clock names w/o SoC name prefixes, except pclks for historic reasons
- Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
- Parent table systematically named with the same name as the clock and
  a '_parents' suffix
- Group various tables next to the related clock
- etc ...

Doing so removes what would otherwise show up as unrelated diff in
following changes. It will allow to introduce common definitions for
peripheral clocks, probe helpers, composite clocks, etc ... making further
review and maintenance easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 215 ++++++++++++++++++++++++------------------------
 1 file changed, 107 insertions(+), 108 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 564655d4d18828d37f2383b348b686a9e0aa9adf..3839dfe9c7c540c2aec731be84e4e6520264c525 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -333,7 +333,7 @@ static struct clk_regmap axg_gp0_pll = {
 	},
 };
 
-static const struct reg_sequence axg_hifi_init_regs[] = {
+static const struct reg_sequence axg_hifi_pll_init_regs[] = {
 	{ .reg = HHI_HIFI_PLL_CNTL1,	.def = 0xc084b000 },
 	{ .reg = HHI_HIFI_PLL_CNTL2,	.def = 0xb75020be },
 	{ .reg = HHI_HIFI_PLL_CNTL3,	.def = 0x0a6a3a88 },
@@ -374,8 +374,8 @@ static struct clk_regmap axg_hifi_pll_dco = {
 			.width   = 1,
 		},
 		.table = axg_gp0_pll_params_table,
-		.init_regs = axg_hifi_init_regs,
-		.init_count = ARRAY_SIZE(axg_hifi_init_regs),
+		.init_regs = axg_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(axg_hifi_pll_init_regs),
 		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -780,7 +780,7 @@ static const struct pll_params_table axg_pcie_pll_params_table[] = {
 	{ /* sentinel */ },
 };
 
-static const struct reg_sequence axg_pcie_init_regs[] = {
+static const struct reg_sequence axg_pcie_pll_init_regs[] = {
 	{ .reg = HHI_PCIE_PLL_CNTL1,	.def = 0x0084a2aa },
 	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0xb75020be },
 	{ .reg = HHI_PCIE_PLL_CNTL3,	.def = 0x0a47488e },
@@ -823,8 +823,8 @@ static struct clk_regmap axg_pcie_pll_dco = {
 			.width   = 1,
 		},
 		.table = axg_pcie_pll_params_table,
-		.init_regs = axg_pcie_init_regs,
-		.init_count = ARRAY_SIZE(axg_pcie_init_regs),
+		.init_regs = axg_pcie_pll_init_regs,
+		.init_count = ARRAY_SIZE(axg_pcie_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_pll_dco",
@@ -935,8 +935,9 @@ static struct clk_regmap axg_pcie_cml_en1 = {
 	},
 };
 
-static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
-static const struct clk_parent_data clk81_parent_data[] = {
+/* clk81 is often referred as "mpeg_clk" */
+static u32 clk81_parents_val_table[] = { 0, 2, 3, 4, 5, 6, 7 };
+static const struct clk_parent_data clk81_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &axg_fclk_div7.hw },
 	{ .hw = &axg_mpll1.hw },
@@ -946,32 +947,32 @@ static const struct clk_parent_data clk81_parent_data[] = {
 	{ .hw = &axg_fclk_div5.hw },
 };
 
-static struct clk_regmap axg_mpeg_clk_sel = {
+static struct clk_regmap axg_clk81_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.mask = 0x7,
 		.shift = 12,
-		.table = mux_table_clk81,
+		.table = clk81_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_sel",
+		.name = "clk81_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = clk81_parent_data,
-		.num_parents = ARRAY_SIZE(clk81_parent_data),
+		.parent_data = clk81_parents,
+		.num_parents = ARRAY_SIZE(clk81_parents),
 	},
 };
 
-static struct clk_regmap axg_mpeg_clk_div = {
+static struct clk_regmap axg_clk81_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_div",
+		.name = "clk81_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_mpeg_clk_sel.hw
+			&axg_clk81_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -987,14 +988,14 @@ static struct clk_regmap axg_clk81 = {
 		.name = "clk81",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_mpeg_clk_div.hw
+			&axg_clk81_div.hw
 		},
 		.num_parents = 1,
 		.flags = (CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
 	},
 };
 
-static const struct clk_parent_data axg_sd_emmc_clk0_parent_data[] = {
+static const struct clk_parent_data axg_sd_emmc_clk0_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &axg_fclk_div2.hw },
 	{ .hw = &axg_fclk_div3.hw },
@@ -1018,8 +1019,8 @@ static struct clk_regmap axg_sd_emmc_b_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = axg_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parent_data),
+		.parent_data = axg_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1068,8 +1069,8 @@ static struct clk_regmap axg_sd_emmc_c_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = axg_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parent_data),
+		.parent_data = axg_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(axg_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1110,7 +1111,7 @@ static struct clk_regmap axg_sd_emmc_c_clk0 = {
 
 /* VPU Clock */
 
-static const struct clk_hw *axg_vpu_parent_hws[] = {
+static const struct clk_hw *axg_vpu_parents[] = {
 	&axg_fclk_div4.hw,
 	&axg_fclk_div3.hw,
 	&axg_fclk_div5.hw,
@@ -1126,8 +1127,8 @@ static struct clk_regmap axg_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_vpu_parent_hws),
+		.parent_hws = axg_vpu_parents,
+		.num_parents = ARRAY_SIZE(axg_vpu_parents),
 		/* We need a specific parent for VPU clock source, let it be set in DT */
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
@@ -1175,8 +1176,8 @@ static struct clk_regmap axg_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_vpu_parent_hws),
+		.parent_hws = axg_vpu_parents,
+		.num_parents = ARRAY_SIZE(axg_vpu_parents),
 		/* We need a specific parent for VPU clock source, let it be set in DT */
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
@@ -1244,8 +1245,8 @@ static struct clk_regmap axg_vapb_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vapb_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_vpu_parent_hws),
+		.parent_hws = axg_vpu_parents,
+		.num_parents = ARRAY_SIZE(axg_vpu_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1292,8 +1293,8 @@ static struct clk_regmap axg_vapb_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vapb_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_vpu_parent_hws),
+		.parent_hws = axg_vpu_parents,
+		.num_parents = ARRAY_SIZE(axg_vpu_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1365,7 +1366,7 @@ static struct clk_regmap axg_vapb = {
 
 /* Video Clocks */
 
-static const struct clk_hw *axg_vclk_parent_hws[] = {
+static const struct clk_hw *axg_vclk_parents[] = {
 	&axg_gp0_pll.hw,
 	&axg_fclk_div4.hw,
 	&axg_fclk_div3.hw,
@@ -1384,8 +1385,8 @@ static struct clk_regmap axg_vclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_vclk_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_vclk_parent_hws),
+		.parent_hws = axg_vclk_parents,
+		.num_parents = ARRAY_SIZE(axg_vclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -1399,8 +1400,8 @@ static struct clk_regmap axg_vclk2_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_vclk_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_vclk_parent_hws),
+		.parent_hws = axg_vclk_parents,
+		.num_parents = ARRAY_SIZE(axg_vclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -1739,8 +1740,8 @@ static struct clk_fixed_factor axg_vclk2_div12 = {
 	},
 };
 
-static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *axg_cts_parent_hws[] = {
+static u32 axg_cts_encl_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *axg_cts_encl_parents[] = {
 	&axg_vclk_div1.hw,
 	&axg_vclk_div2.hw,
 	&axg_vclk_div4.hw,
@@ -1758,13 +1759,13 @@ static struct clk_regmap axg_cts_encl_sel = {
 		.offset = HHI_VIID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 12,
-		.table = mux_table_cts_sel,
+		.table = axg_cts_encl_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = axg_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(axg_cts_parent_hws),
+		.parent_hws = axg_cts_encl_parents,
+		.num_parents = ARRAY_SIZE(axg_cts_encl_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -1787,8 +1788,8 @@ static struct clk_regmap axg_cts_encl = {
 
 /* MIPI DSI Host Clock */
 
-static u32 mux_table_axg_vdin_meas[]    = { 0, 1, 2, 3, 6, 7 };
-static const struct clk_parent_data axg_vdin_meas_parent_data[] = {
+static u32 axg_vdin_meas_parents_val_table[] = { 0, 1, 2, 3, 6, 7 };
+static const struct clk_parent_data axg_vdin_meas_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &axg_fclk_div4.hw },
 	{ .hw = &axg_fclk_div3.hw },
@@ -1803,13 +1804,13 @@ static struct clk_regmap axg_vdin_meas_sel = {
 		.mask = 0x7,
 		.shift = 21,
 		.flags = CLK_MUX_ROUND_CLOSEST,
-		.table = mux_table_axg_vdin_meas,
+		.table = axg_vdin_meas_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdin_meas_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = axg_vdin_meas_parent_data,
-		.num_parents = ARRAY_SIZE(axg_vdin_meas_parent_data),
+		.parent_data = axg_vdin_meas_parents,
+		.num_parents = ARRAY_SIZE(axg_vdin_meas_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1845,9 +1846,8 @@ static struct clk_regmap axg_vdin_meas = {
 	},
 };
 
-static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
-				    9, 10, 11, 13, 14, };
-static const struct clk_parent_data gen_clk_parent_data[] = {
+static u32 gen_clk_parents_val_table[] = { 0, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, };
+static const struct clk_parent_data gen_clk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &axg_hifi_pll.hw },
 	{ .hw = &axg_mpll0.hw },
@@ -1866,7 +1866,7 @@ static struct clk_regmap axg_gen_clk_sel = {
 		.offset = HHI_GEN_CLK_CNTL,
 		.mask = 0xf,
 		.shift = 12,
-		.table = mux_table_gen_clk,
+		.table = gen_clk_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gen_clk_sel",
@@ -1877,8 +1877,8 @@ static struct clk_regmap axg_gen_clk_sel = {
 		 * hifi_pll, mpll0, mpll1, mpll2, mpll3, fdiv4,
 		 * fdiv3, fdiv5, [cts_msr_clk], fdiv7, gp0_pll
 		 */
-		.parent_data = gen_clk_parent_data,
-		.num_parents = ARRAY_SIZE(gen_clk_parent_data),
+		.parent_data = gen_clk_parents,
+		.num_parents = ARRAY_SIZE(gen_clk_parents),
 	},
 };
 
@@ -1915,59 +1915,59 @@ static struct clk_regmap axg_gen_clk = {
 	},
 };
 
-#define MESON_GATE(_name, _reg, _bit) \
-	MESON_PCLK(_name, _reg, _bit, &axg_clk81.hw)
+#define AXG_PCLK(_name, _reg, _bit) \
+	MESON_PCLK(axg_##_name, _reg, _bit, &axg_clk81.hw)
 
 /* Everything Else (EE) domain gates */
-static MESON_GATE(axg_ddr, HHI_GCLK_MPEG0, 0);
-static MESON_GATE(axg_audio_locker, HHI_GCLK_MPEG0, 2);
-static MESON_GATE(axg_mipi_dsi_host, HHI_GCLK_MPEG0, 3);
-static MESON_GATE(axg_isa, HHI_GCLK_MPEG0, 5);
-static MESON_GATE(axg_pl301, HHI_GCLK_MPEG0, 6);
-static MESON_GATE(axg_periphs, HHI_GCLK_MPEG0, 7);
-static MESON_GATE(axg_spicc_0, HHI_GCLK_MPEG0, 8);
-static MESON_GATE(axg_i2c, HHI_GCLK_MPEG0, 9);
-static MESON_GATE(axg_rng0, HHI_GCLK_MPEG0, 12);
-static MESON_GATE(axg_uart0, HHI_GCLK_MPEG0, 13);
-static MESON_GATE(axg_mipi_dsi_phy, HHI_GCLK_MPEG0, 14);
-static MESON_GATE(axg_spicc_1, HHI_GCLK_MPEG0, 15);
-static MESON_GATE(axg_pcie_a, HHI_GCLK_MPEG0, 16);
-static MESON_GATE(axg_pcie_b, HHI_GCLK_MPEG0, 17);
-static MESON_GATE(axg_hiu_reg, HHI_GCLK_MPEG0, 19);
-static MESON_GATE(axg_assist_misc, HHI_GCLK_MPEG0, 23);
-static MESON_GATE(axg_emmc_b, HHI_GCLK_MPEG0, 25);
-static MESON_GATE(axg_emmc_c, HHI_GCLK_MPEG0, 26);
-static MESON_GATE(axg_dma, HHI_GCLK_MPEG0, 27);
-static MESON_GATE(axg_spi, HHI_GCLK_MPEG0, 30);
-
-static MESON_GATE(axg_audio, HHI_GCLK_MPEG1, 0);
-static MESON_GATE(axg_eth_core, HHI_GCLK_MPEG1, 3);
-static MESON_GATE(axg_uart1, HHI_GCLK_MPEG1, 16);
-static MESON_GATE(axg_g2d, HHI_GCLK_MPEG1, 20);
-static MESON_GATE(axg_usb0, HHI_GCLK_MPEG1, 21);
-static MESON_GATE(axg_usb1, HHI_GCLK_MPEG1, 22);
-static MESON_GATE(axg_reset, HHI_GCLK_MPEG1, 23);
-static MESON_GATE(axg_usb_general, HHI_GCLK_MPEG1, 26);
-static MESON_GATE(axg_ahb_arb0, HHI_GCLK_MPEG1, 29);
-static MESON_GATE(axg_efuse, HHI_GCLK_MPEG1, 30);
-static MESON_GATE(axg_boot_rom, HHI_GCLK_MPEG1, 31);
-
-static MESON_GATE(axg_ahb_data_bus, HHI_GCLK_MPEG2, 1);
-static MESON_GATE(axg_ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
-static MESON_GATE(axg_usb1_to_ddr, HHI_GCLK_MPEG2, 8);
-static MESON_GATE(axg_usb0_to_ddr, HHI_GCLK_MPEG2, 9);
-static MESON_GATE(axg_mmc_pclk, HHI_GCLK_MPEG2, 11);
-static MESON_GATE(axg_vpu_intr, HHI_GCLK_MPEG2, 25);
-static MESON_GATE(axg_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
-static MESON_GATE(axg_gic, HHI_GCLK_MPEG2, 30);
+static AXG_PCLK(ddr,			HHI_GCLK_MPEG0,  0);
+static AXG_PCLK(audio_locker,		HHI_GCLK_MPEG0,  2);
+static AXG_PCLK(mipi_dsi_host,		HHI_GCLK_MPEG0,  3);
+static AXG_PCLK(isa,			HHI_GCLK_MPEG0,  5);
+static AXG_PCLK(pl301,			HHI_GCLK_MPEG0,  6);
+static AXG_PCLK(periphs,		HHI_GCLK_MPEG0,  7);
+static AXG_PCLK(spicc_0,		HHI_GCLK_MPEG0,  8);
+static AXG_PCLK(i2c,			HHI_GCLK_MPEG0,  9);
+static AXG_PCLK(rng0,			HHI_GCLK_MPEG0, 12);
+static AXG_PCLK(uart0,			HHI_GCLK_MPEG0, 13);
+static AXG_PCLK(mipi_dsi_phy,		HHI_GCLK_MPEG0, 14);
+static AXG_PCLK(spicc_1,		HHI_GCLK_MPEG0, 15);
+static AXG_PCLK(pcie_a,			HHI_GCLK_MPEG0, 16);
+static AXG_PCLK(pcie_b,			HHI_GCLK_MPEG0, 17);
+static AXG_PCLK(hiu_reg,		HHI_GCLK_MPEG0, 19);
+static AXG_PCLK(assist_misc,		HHI_GCLK_MPEG0, 23);
+static AXG_PCLK(emmc_b,			HHI_GCLK_MPEG0, 25);
+static AXG_PCLK(emmc_c,			HHI_GCLK_MPEG0, 26);
+static AXG_PCLK(dma,			HHI_GCLK_MPEG0, 27);
+static AXG_PCLK(spi,			HHI_GCLK_MPEG0, 30);
+
+static AXG_PCLK(audio,			HHI_GCLK_MPEG1,  0);
+static AXG_PCLK(eth_core,		HHI_GCLK_MPEG1,  3);
+static AXG_PCLK(uart1,			HHI_GCLK_MPEG1, 16);
+static AXG_PCLK(g2d,			HHI_GCLK_MPEG1, 20);
+static AXG_PCLK(usb0,			HHI_GCLK_MPEG1, 21);
+static AXG_PCLK(usb1,			HHI_GCLK_MPEG1, 22);
+static AXG_PCLK(reset,			HHI_GCLK_MPEG1, 23);
+static AXG_PCLK(usb_general,		HHI_GCLK_MPEG1, 26);
+static AXG_PCLK(ahb_arb0,		HHI_GCLK_MPEG1, 29);
+static AXG_PCLK(efuse,			HHI_GCLK_MPEG1, 30);
+static AXG_PCLK(boot_rom,		HHI_GCLK_MPEG1, 31);
+
+static AXG_PCLK(ahb_data_bus,		HHI_GCLK_MPEG2,  1);
+static AXG_PCLK(ahb_ctrl_bus,		HHI_GCLK_MPEG2,  2);
+static AXG_PCLK(usb1_to_ddr,		HHI_GCLK_MPEG2,  8);
+static AXG_PCLK(usb0_to_ddr,		HHI_GCLK_MPEG2,  9);
+static AXG_PCLK(mmc_pclk,		HHI_GCLK_MPEG2, 11);
+static AXG_PCLK(vpu_intr,		HHI_GCLK_MPEG2, 25);
+static AXG_PCLK(sec_ahb_ahb3_bridge,	HHI_GCLK_MPEG2, 26);
+static AXG_PCLK(gic,			HHI_GCLK_MPEG2, 30);
 
 /* Always On (AO) domain gates */
 
-static MESON_GATE(axg_ao_media_cpu, HHI_GCLK_AO, 0);
-static MESON_GATE(axg_ao_ahb_sram, HHI_GCLK_AO, 1);
-static MESON_GATE(axg_ao_ahb_bus, HHI_GCLK_AO, 2);
-static MESON_GATE(axg_ao_iface, HHI_GCLK_AO, 3);
-static MESON_GATE(axg_ao_i2c, HHI_GCLK_AO, 4);
+static AXG_PCLK(ao_media_cpu,		HHI_GCLK_AO, 0);
+static AXG_PCLK(ao_ahb_sram,		HHI_GCLK_AO, 1);
+static AXG_PCLK(ao_ahb_bus,		HHI_GCLK_AO, 2);
+static AXG_PCLK(ao_iface,		HHI_GCLK_AO, 3);
+static AXG_PCLK(ao_i2c,			HHI_GCLK_AO, 4);
 
 /* Array of all clocks provided by this provider */
 
@@ -1980,8 +1980,8 @@ static struct clk_hw *axg_hw_clks[] = {
 	[CLKID_FCLK_DIV5]		= &axg_fclk_div5.hw,
 	[CLKID_FCLK_DIV7]		= &axg_fclk_div7.hw,
 	[CLKID_GP0_PLL]			= &axg_gp0_pll.hw,
-	[CLKID_MPEG_SEL]		= &axg_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV]		= &axg_mpeg_clk_div.hw,
+	[CLKID_MPEG_SEL]		= &axg_clk81_sel.hw,
+	[CLKID_MPEG_DIV]		= &axg_clk81_div.hw,
 	[CLKID_CLK81]			= &axg_clk81.hw,
 	[CLKID_MPLL0]			= &axg_mpll0.hw,
 	[CLKID_MPLL1]			= &axg_mpll1.hw,
@@ -2117,21 +2117,20 @@ static const struct meson_eeclkc_data axg_clkc_data = {
 	},
 };
 
-
-static const struct of_device_id clkc_match_table[] = {
+static const struct of_device_id axg_clkc_match_table[] = {
 	{ .compatible = "amlogic,axg-clkc", .data = &axg_clkc_data },
 	{}
 };
-MODULE_DEVICE_TABLE(of, clkc_match_table);
+MODULE_DEVICE_TABLE(of, axg_clkc_match_table);
 
-static struct platform_driver axg_driver = {
+static struct platform_driver axg_clkc_driver = {
 	.probe		= meson_eeclkc_probe,
 	.driver		= {
 		.name	= "axg-clkc",
-		.of_match_table = clkc_match_table,
+		.of_match_table = axg_clkc_match_table,
 	},
 };
-module_platform_driver(axg_driver);
+module_platform_driver(axg_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic AXG Main Clock Controller driver");
 MODULE_LICENSE("GPL");

-- 
2.47.2

