Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74168307AD6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470054; cv=none; b=sFl3oKBKKkH8vtVShlHiQCzLl0B5g0steFwVDkh9kiAa/mQOB4C9vMwCsAC/9YCQRiguKkzbOazJGA/W4Grn21v/VFXNV9g2XTbrFCQZQB/r4xVqowyxG0JFu5gXvL5iz/IDYEGSkDaEAVehYs4dAzHCg/rZiPLF4fMaXNQs91E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470054; c=relaxed/simple;
	bh=kv8meSRaLr9lhTGiH53B2dK/AMkby//3A4ZQP1IOVp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1ZPvcfkgJ3+nkYFz6xsOUcSFOP3crHOu9HiB7ZtModdTTfxGtWuDiw56tXRR9mb1hJvfkcq81MMujWPUKrL4VW6XwBBf1zmqdJwKZtCSqwgt/YLOai+lCe+cMFK5nSNvd+tYQzDMDkMMjg9GilNAlYKV4YzZM3Br9UCoC1H9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hnMi274N; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hnMi274N"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d6ade159so32809225e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470042; x=1752074842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTi56k8hIpik0/d4oalat8fYo6vqoxEpZ4hh2QZyXCQ=;
        b=hnMi274ND59cSqNIhySGNZzQOIYXOyRWcAZKEviu8VHWmLMCY2pE8KXtuenM+5BH6D
         uFwXUr7AZ1FQW11TAbQmFj39oXQ3rXvn24AhlbOfNbCm2XpjAdIkUJ0d9xxnJqPnNkCW
         2LbLUtX8wJSr1HOr+3NQQSga0qDJM/hiYwuVm5XqOrU1AmGeGKzEChw2K5gZEyPnmg2/
         VpRwGXh2TwUIhT4FKZK4eeJDgyKn2F0rMeeY62eZ5O4idTSgC3SJzFVVH1engISIrrY8
         rfWF/qcQtMNN4N9qdl6AJzZzQk3mxIaJYQ6LzQnTIAKIisk+5DLfqmCvqvefxzZPGZ3C
         J8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470042; x=1752074842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTi56k8hIpik0/d4oalat8fYo6vqoxEpZ4hh2QZyXCQ=;
        b=bDeQIBISCbcMnIsSc14zOIIeQoH8+wtK1F7kc/hHmB4jQLhHQ4MNpjgRF5lqukSsZF
         N4Y9qhioH62saODcZFpQLrQcGZisuiARDBHX9tSNOY37dKoRxxiQpr4ljODNvTfF7wk+
         BPrTBjFLl3KE8XKUvEgsV1AH86kZPl1b0ThzNW9cMOVwU7SzXGjNVZj55BGeWTZaaxIw
         3xDaX5f3PDy+J/+oAMSZEIX9XuY2Lzpucap0fBDH+gbNNfcwpTtgiIe/VXs5Q0F88f0n
         1hdLd0KAv2w8UX/A3NpgUxURVpKGnOxDNZdSTVAQ8cs52S4mI+nldgYnOW2UhFuxni/M
         JTKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUvMNbasDscXHOsALyoWSksto2j/edL9OBRgzcVVHVGFRTSw/qvYGWk3ozeGuzvpb69VR6BGFKRU1P2PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzmSQYAfhaAGBXNmccd4/qdE0Pl5LUQ0FG/c0BRMPJwD8Lrqk3
	ZUek7ysBiX4jtY12bxT25JBhsy6xQqAKb8AtUVwy6OMzf9WoDtFGCOxVqsdygOEti5g=
X-Gm-Gg: ASbGncv204TB97sbIaxPqWsu0/QD2T8Q/xes8NSCesX8pt2UHQnG50vaRemrLrsFAe8
	OjAIczszpMfttE7eR5qknqFgmcU+jtzmZvWDlD0QoUfoQKJRqfiN5/msEUMujt327LY+mD9BL2o
	ArV54UmDyLqL6FluIPovHi+dm/AJUtAOSntQo3fCvF6S1KCh4hK3im/frEXfr24+/8oR1MC0blR
	06zC/hn7hP+z3aRqDHx8YmkDZVbwuNNRIC+DNxHPGHuVpaleEIig/dIO0h/+HQkP/q7noxb+Ibp
	tw0E7GgI3x10pY+NtX02rqWCZtKCeSwfFL3Gsvp9F0pDD07gIfcAFyP8AqVE+L2sEX3dCkGGE2b
	oPrg2jYFAsTI=
X-Google-Smtp-Source: AGHT+IEtkeLhuEZPsijrRidj9RjdwS4Z19UyGpyNQBhc+P50gA5MJM24NkAnOVHhq3IegQp8PHqMkg==
X-Received: by 2002:a05:600c:a07:b0:44a:775d:b5e8 with SMTP id 5b1f17b1804b1-454a36dc3bfmr29296205e9.1.1751470041123;
        Wed, 02 Jul 2025 08:27:21 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:06 +0200
Subject: [PATCH 08/26] clk: amlogic: g12a: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-8-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=134147;
 i=jbrunet@baylibre.com; h=from:subject:message-id;
 bh=kv8meSRaLr9lhTGiH53B2dK/AMkby//3A4ZQP1IOVp0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU++NRE04X/ZHkP13GrQ4QkIH4ObNO6C+f/xd
 lpxMNTSCBqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPvgAKCRDm/A8cN/La
 hdjfD/4wuOp9yRsGgizISIS2syEDS4Gn9LDsbldpWD30YJabBVy922K1DUm7KKz6WeD8Yyc6wJC
 4Hkc4v5CVFGQRX4F0P0nEBQGMGx7d7wHCIcKYr0BzKnpdUdyndOgDFSSE4KnjojlTDv3fGhb6nS
 3iBaMntvB6IERcgXFT2Jb2E4Z9j6jjFL6V2DBE5+k9ouwkr09Xm1LTeHUi19ZP27Vlh5EvPaTGY
 /8W7CIbZmpJzJoVrrUJ77mKBHgydom3R5hoVexdB/V5mWyyQLzZlNZx13prF0sEKGyFRx3QsXIP
 at/C4FbVQbVMdgFaiBQ9T/sfoAlgGWbzG53gKS9sHU+efQ27Y9QTigRZgHXDsai17oj5QhZMsrN
 qNXcqJyNhrHBScA/07gzRBfikc5aNSMhVTt1gUabeRsQs4rDJX+n1z1rLfJ6kKx1HD0hHzmYEkm
 RmWUE5vl6p/62rMNvCeQXVq7vHAWoyTnxfWnIhPvGq7e5t6SfCxxKCcVM3anaNCOWOI1BgbbnqL
 ARvq5tCtOyfIeQLFH67vd4b38hwo8E8gk5oaauw0F+AAPrI1WSMIYCrHvZbRMlVwVKGdO/imN/B
 bOLHIKUL1lqze1YadNigOtojCv4dGXbAMDYqMYM/s4flaszN0S8AUasJGJc0faP9DYsw0kvsAQG
 6UBs3HCGosG/93Q==
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
 drivers/clk/meson/g12a.c | 3240 +++++++++++++++++++++++-----------------------
 1 file changed, 1608 insertions(+), 1632 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 1b30f1bcca5535cabbfeca16338f6d9f7e79198d..9de0531821a8f0297273189b44a81024d8bf9093 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -386,1935 +386,1912 @@ static struct clk_fixed_factor g12b_sys1_pll_div16 = {
 	},
 };
 
-static struct clk_fixed_factor g12a_fclk_div2_div = {
-	.mult = 1,
-	.div = 2,
-	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div2_div",
-		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
-		.num_parents = 1,
-	},
+static const struct pll_mult_range g12a_gp0_pll_mult_range = {
+	.min = 125,
+	.max = 255,
 };
 
-static struct clk_regmap g12a_fclk_div2 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div2",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fclk_div2_div.hw
-		},
-		.num_parents = 1,
-		/*
-		 * Similar to fclk_div3, it seems that this clock is used by
-		 * the resident firmware and is required by the platform to
-		 * operate correctly.
-		 * Until the following condition are met, we need this clock to
-		 * be marked as critical:
-		 * a) Mark the clock used by a firmware resource, if possible
-		 * b) CCF has a clock hand-off mechanism to make the sure the
-		 *    clock stays on until the proper driver comes along
-		 */
-		.flags = CLK_IS_CRITICAL,
-	},
+/*
+ * Internal gp0 pll emulation configuration parameters
+ */
+static const struct reg_sequence g12a_gp0_pll_init_regs[] = {
+	{ .reg = HHI_GP0_PLL_CNTL1,	.def = 0x00000000 },
+	{ .reg = HHI_GP0_PLL_CNTL2,	.def = 0x00000000 },
+	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x48681c00 },
+	{ .reg = HHI_GP0_PLL_CNTL4,	.def = 0x33771290 },
+	{ .reg = HHI_GP0_PLL_CNTL5,	.def = 0x39272000 },
+	{ .reg = HHI_GP0_PLL_CNTL6,	.def = 0x56540000 },
 };
 
-static struct clk_fixed_factor g12a_fclk_div3_div = {
-	.mult = 1,
-	.div = 3,
+static struct clk_regmap g12a_gp0_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_GP0_PLL_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HHI_GP0_PLL_CNTL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = HHI_GP0_PLL_CNTL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = HHI_GP0_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HHI_GP0_PLL_CNTL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_GP0_PLL_CNTL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &g12a_gp0_pll_mult_range,
+		.init_regs = g12a_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(g12a_gp0_pll_init_regs),
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div3_div",
-		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.name = "gp0_pll_dco",
+		.ops = &meson_clk_pll_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_fclk_div3 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 20,
+static struct clk_regmap g12a_gp0_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_GP0_PLL_CNTL0,
+		.shift = 16,
+		.width = 3,
+		.flags = (CLK_DIVIDER_POWER_OF_TWO |
+			  CLK_DIVIDER_ROUND_CLOSEST),
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div3",
-		.ops = &clk_regmap_gate_ops,
+		.name = "gp0_pll",
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fclk_div3_div.hw
+			&g12a_gp0_pll_dco.hw
 		},
 		.num_parents = 1,
-		/*
-		 * This clock is used by the resident firmware and is required
-		 * by the platform to operate correctly.
-		 * Until the following condition are met, we need this clock to
-		 * be marked as critical:
-		 * a) Mark the clock used by a firmware resource, if possible
-		 * b) CCF has a clock hand-off mechanism to make the sure the
-		 *    clock stays on until the proper driver comes along
-		 */
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "premux0" */
-static struct clk_regmap g12a_cpu_clk_premux0 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x3,
-		.shift = 0,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_regmap sm1_gp1_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_GP1_PLL_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HHI_GP1_PLL_CNTL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = HHI_GP1_PLL_CNTL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = HHI_GP1_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HHI_GP1_PLL_CNTL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_GP1_PLL_CNTL0,
+			.shift   = 29,
+			.width   = 1,
+		},
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_fclk_div2.hw },
-			{ .hw = &g12a_fclk_div3.hw },
+		.name = "gp1_pll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
 		},
-		.num_parents = 3,
-		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+		/* This clock feeds the DSU, avoid disabling it */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-/* Datasheet names this field as "premux1" */
-static struct clk_regmap g12a_cpu_clk_premux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x3,
+static struct clk_regmap sm1_gp1_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_GP1_PLL_CNTL0,
 		.shift = 16,
+		.width = 3,
+		.flags = (CLK_DIVIDER_POWER_OF_TWO |
+			  CLK_DIVIDER_ROUND_CLOSEST),
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn1_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_fclk_div2.hw },
-			{ .hw = &g12a_fclk_div3.hw },
+		.name = "gp1_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_gp1_pll_dco.hw
 		},
-		.num_parents = 3,
-		/* This sub-tree is used a parking clock */
-		.flags = CLK_SET_RATE_NO_REPARENT
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "mux0_divn_tcnt" */
-static struct clk_regmap g12a_cpu_clk_mux0_div = {
-	.data = &(struct meson_clk_cpu_dyndiv_data){
-		.div = {
-			.reg_off = HHI_SYS_CPU_CLK_CNTL0,
-			.shift = 4,
-			.width = 6,
+/*
+ * Internal hifi pll emulation configuration parameters
+ */
+static const struct reg_sequence g12a_hifi_pll_init_regs[] = {
+	{ .reg = HHI_HIFI_PLL_CNTL1,	.def = 0x00000000 },
+	{ .reg = HHI_HIFI_PLL_CNTL2,	.def = 0x00000000 },
+	{ .reg = HHI_HIFI_PLL_CNTL3,	.def = 0x6a285c00 },
+	{ .reg = HHI_HIFI_PLL_CNTL4,	.def = 0x65771290 },
+	{ .reg = HHI_HIFI_PLL_CNTL5,	.def = 0x39272000 },
+	{ .reg = HHI_HIFI_PLL_CNTL6,	.def = 0x56540000 },
+};
+
+static struct clk_regmap g12a_hifi_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_HIFI_PLL_CNTL0,
+			.shift   = 28,
+			.width   = 1,
 		},
-		.dyn = {
-			.reg_off = HHI_SYS_CPU_CLK_CNTL0,
-			.shift = 26,
-			.width = 1,
+		.m = {
+			.reg_off = HHI_HIFI_PLL_CNTL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = HHI_HIFI_PLL_CNTL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = HHI_HIFI_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HHI_HIFI_PLL_CNTL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_HIFI_PLL_CNTL0,
+			.shift   = 29,
+			.width   = 1,
 		},
+		.range = &g12a_gp0_pll_mult_range,
+		.init_regs = g12a_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(g12a_hifi_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn0_div",
-		.ops = &meson_clk_cpu_dyndiv_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_premux0.hw
+		.name = "hifi_pll_dco",
+		.ops = &meson_clk_pll_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "postmux0" */
-static struct clk_regmap g12a_cpu_clk_postmux0 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x1,
-		.shift = 2,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_regmap g12a_hifi_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_HIFI_PLL_CNTL0,
+		.shift = 16,
+		.width = 2,
+		.flags = (CLK_DIVIDER_POWER_OF_TWO |
+			  CLK_DIVIDER_ROUND_CLOSEST),
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn0",
-		.ops = &clk_regmap_mux_ops,
+		.name = "hifi_pll",
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_premux0.hw,
-			&g12a_cpu_clk_mux0_div.hw,
+			&g12a_hifi_pll_dco.hw
 		},
-		.num_parents = 2,
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "Mux1_divn_tcnt" */
-static struct clk_regmap g12a_cpu_clk_mux1_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.shift = 20,
-		.width = 6,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn1_div",
-		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_premux1.hw
-		},
-		.num_parents = 1,
-	},
+/*
+ * The Meson G12A PCIE PLL is fined tuned to deliver a very precise
+ * 100MHz reference clock for the PCIe Analog PHY, and thus requires
+ * a strict register sequence to enable the PLL.
+ */
+static const struct reg_sequence g12a_pcie_pll_init_regs[] = {
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x20090496 },
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x30090496 },
+	{ .reg = HHI_PCIE_PLL_CNTL1,	.def = 0x00000000 },
+	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001100 },
+	{ .reg = HHI_PCIE_PLL_CNTL3,	.def = 0x10058e00 },
+	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x000100c0 },
+	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000048 },
+	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000068, .delay_us = 20 },
+	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x008100c0, .delay_us = 10 },
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x34090496 },
+	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x14090496, .delay_us = 10 },
+	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001000 },
 };
 
-/* Datasheet names this field as "postmux1" */
-static struct clk_regmap g12a_cpu_clk_postmux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x1,
-		.shift = 18,
+/* Keep a single entry table for recalc/round_rate() ops */
+static const struct pll_params_table g12a_pcie_pll_table[] = {
+	PLL_PARAMS(150, 1),
+	{0, 0},
+};
+
+static struct clk_regmap g12a_pcie_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = HHI_PCIE_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 12,
+		},
+		.l = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_PCIE_PLL_CNTL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.table = g12a_pcie_pll_table,
+		.init_regs = g12a_pcie_pll_init_regs,
+		.init_count = ARRAY_SIZE(g12a_pcie_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn1",
-		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_premux1.hw,
-			&g12a_cpu_clk_mux1_div.hw,
+		.name = "pcie_pll_dco",
+		.ops = &meson_clk_pcie_pll_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
 		},
-		.num_parents = 2,
-		/* This sub-tree is used a parking clock */
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "Final_dyn_mux_sel" */
-static struct clk_regmap g12a_cpu_clk_dyn = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x1,
-		.shift = 10,
-		.flags = CLK_MUX_ROUND_CLOSEST,
-	},
+static struct clk_fixed_factor g12a_pcie_pll_dco_div2 = {
+	.mult = 1,
+	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_dyn",
-		.ops = &clk_regmap_mux_ops,
+		.name = "pcie_pll_dco_div2",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_postmux0.hw,
-			&g12a_cpu_clk_postmux1.hw,
+			&g12a_pcie_pll_dco.hw
 		},
-		.num_parents = 2,
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "Final_mux_sel" */
-static struct clk_regmap g12a_cpu_clk = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x1,
-		.shift = 11,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_regmap g12a_pcie_pll_od = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_PCIE_PLL_CNTL0,
+		.shift = 16,
+		.width = 5,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST |
+			 CLK_DIVIDER_ONE_BASED |
+			 CLK_DIVIDER_ALLOW_ZERO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk",
-		.ops = &clk_regmap_mux_ops,
+		.name = "pcie_pll_od",
+		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_dyn.hw,
-			&g12a_sys_pll.hw,
+			&g12a_pcie_pll_dco_div2.hw
 		},
-		.num_parents = 2,
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "Final_mux_sel" */
-static struct clk_regmap g12b_cpu_clk = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL0,
-		.mask = 0x1,
-		.shift = 11,
-		.flags = CLK_MUX_ROUND_CLOSEST,
-	},
+static struct clk_fixed_factor g12a_pcie_pll = {
+	.mult = 1,
+	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk",
-		.ops = &clk_regmap_mux_ops,
+		.name = "pcie_pll_pll",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_dyn.hw,
-			&g12b_sys1_pll.hw
+			&g12a_pcie_pll_od.hw
 		},
-		.num_parents = 2,
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "premux0" */
-static struct clk_regmap g12b_cpub_clk_premux0 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
-		.mask = 0x3,
-		.shift = 0,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_regmap g12a_hdmi_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_HDMI_PLL_CNTL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HHI_HDMI_PLL_CNTL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = HHI_HDMI_PLL_CNTL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = HHI_HDMI_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 16,
+		},
+		.l = {
+			.reg_off = HHI_HDMI_PLL_CNTL0,
+			.shift   = 30,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_HDMI_PLL_CNTL0,
+			.shift   = 29,
+			.width   = 1,
+		},
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_fclk_div2.hw },
-			{ .hw = &g12a_fclk_div3.hw },
+		.name = "hdmi_pll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
 		},
-		.num_parents = 3,
-		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+		/*
+		 * Display directly handle hdmi pll registers ATM, we need
+		 * NOCACHE to keep our view of the clock as accurate as possible
+		 */
+		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
-/* Datasheet names this field as "mux0_divn_tcnt" */
-static struct clk_regmap g12b_cpub_clk_mux0_div = {
-	.data = &(struct meson_clk_cpu_dyndiv_data){
-		.div = {
-			.reg_off = HHI_SYS_CPUB_CLK_CNTL,
-			.shift = 4,
-			.width = 6,
-		},
-		.dyn = {
-			.reg_off = HHI_SYS_CPUB_CLK_CNTL,
-			.shift = 26,
-			.width = 1,
-		},
+static struct clk_regmap g12a_hdmi_pll_od = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_HDMI_PLL_CNTL0,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn0_div",
-		.ops = &meson_clk_cpu_dyndiv_ops,
+		.name = "hdmi_pll_od",
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_premux0.hw
+			&g12a_hdmi_pll_dco.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "postmux0" */
-static struct clk_regmap g12b_cpub_clk_postmux0 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
-		.mask = 0x1,
-		.shift = 2,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_regmap g12a_hdmi_pll_od2 = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_HDMI_PLL_CNTL0,
+		.shift = 18,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn0",
-		.ops = &clk_regmap_mux_ops,
+		.name = "hdmi_pll_od2",
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_premux0.hw,
-			&g12b_cpub_clk_mux0_div.hw
-		},
-		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-/* Datasheet names this field as "premux1" */
-static struct clk_regmap g12b_cpub_clk_premux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
-		.mask = 0x3,
-		.shift = 16,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn1_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_fclk_div2.hw },
-			{ .hw = &g12a_fclk_div3.hw },
+			&g12a_hdmi_pll_od.hw
 		},
-		.num_parents = 3,
-		/* This sub-tree is used a parking clock */
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "Mux1_divn_tcnt" */
-static struct clk_regmap g12b_cpub_clk_mux1_div = {
+static struct clk_regmap g12a_hdmi_pll = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.offset = HHI_HDMI_PLL_CNTL0,
 		.shift = 20,
-		.width = 6,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn1_div",
+		.name = "hdmi_pll",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_premux1.hw
+			&g12a_hdmi_pll_od2.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "postmux1" */
-static struct clk_regmap g12b_cpub_clk_postmux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
-		.mask = 0x1,
-		.shift = 18,
-	},
+static struct clk_fixed_factor g12a_fclk_div2_div = {
+	.mult = 1,
+	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn1",
-		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_premux1.hw,
-			&g12b_cpub_clk_mux1_div.hw
-		},
-		.num_parents = 2,
-		/* This sub-tree is used a parking clock */
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.name = "fclk_div2_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "Final_dyn_mux_sel" */
-static struct clk_regmap g12b_cpub_clk_dyn = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
-		.mask = 0x1,
-		.shift = 10,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_regmap g12a_fclk_div2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_dyn",
-		.ops = &clk_regmap_mux_ops,
+		.name = "fclk_div2",
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_postmux0.hw,
-			&g12b_cpub_clk_postmux1.hw
+			&g12a_fclk_div2_div.hw
 		},
-		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+		/*
+		 * Similar to fclk_div3, it seems that this clock is used by
+		 * the resident firmware and is required by the platform to
+		 * operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-/* Datasheet names this field as "Final_mux_sel" */
-static struct clk_regmap g12b_cpub_clk = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL,
-		.mask = 0x1,
-		.shift = 11,
-		.flags = CLK_MUX_ROUND_CLOSEST,
+static struct clk_fixed_factor g12a_fclk_div3_div = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_fclk_div3 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 20,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk",
-		.ops = &clk_regmap_mux_ops,
+		.name = "fclk_div3",
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_dyn.hw,
-			&g12a_sys_pll.hw
+			&g12a_fclk_div3_div.hw
 		},
-		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-static struct clk_regmap sm1_gp1_pll;
 
-/* Datasheet names this field as "premux0" */
-static struct clk_regmap sm1_dsu_clk_premux0 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
-		.mask = 0x3,
-		.shift = 0,
-	},
+static struct clk_fixed_factor g12a_fclk_div4_div = {
+	.mult = 1,
+	.div = 4,
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn0_sel",
-		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_fclk_div2.hw },
-			{ .hw = &g12a_fclk_div3.hw },
-			{ .hw = &sm1_gp1_pll.hw },
-		},
-		.num_parents = 4,
+		.name = "fclk_div4_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "premux1" */
-static struct clk_regmap sm1_dsu_clk_premux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
-		.mask = 0x3,
-		.shift = 16,
+static struct clk_regmap g12a_fclk_div4 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 21,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn1_sel",
-		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_fclk_div2.hw },
-			{ .hw = &g12a_fclk_div3.hw },
-			{ .hw = &sm1_gp1_pll.hw },
+		.name = "fclk_div4",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_fclk_div4_div.hw
 		},
-		.num_parents = 4,
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "Mux0_divn_tcnt" */
-static struct clk_regmap sm1_dsu_clk_mux0_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
-		.shift = 4,
-		.width = 6,
-	},
+static struct clk_fixed_factor g12a_fclk_div5_div = {
+	.mult = 1,
+	.div = 5,
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn0_div",
-		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_dsu_clk_premux0.hw
-		},
+		.name = "fclk_div5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
 		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "postmux0" */
-static struct clk_regmap sm1_dsu_clk_postmux0 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
-		.mask = 0x1,
-		.shift = 2,
+static struct clk_regmap g12a_fclk_div5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 22,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn0",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "fclk_div5",
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_dsu_clk_premux0.hw,
-			&sm1_dsu_clk_mux0_div.hw,
+			&g12a_fclk_div5_div.hw
 		},
-		.num_parents = 2,
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "Mux1_divn_tcnt" */
-static struct clk_regmap sm1_dsu_clk_mux1_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
-		.shift = 20,
-		.width = 6,
+static struct clk_fixed_factor g12a_fclk_div7_div = {
+	.mult = 1,
+	.div = 7,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div7_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_fclk_div7 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 23,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn1_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.name = "fclk_div7",
+		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_dsu_clk_premux1.hw
+			&g12a_fclk_div7_div.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "postmux1" */
-static struct clk_regmap sm1_dsu_clk_postmux1 = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
-		.mask = 0x1,
-		.shift = 18,
-	},
+static struct clk_fixed_factor g12a_fclk_div2p5_div = {
+	.mult = 1,
+	.div = 5,
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn1",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "fclk_div2p5_div",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_dsu_clk_premux1.hw,
-			&sm1_dsu_clk_mux1_div.hw,
+			&g12a_fixed_pll_dco.hw
 		},
-		.num_parents = 2,
+		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "Final_dyn_mux_sel" */
-static struct clk_regmap sm1_dsu_clk_dyn = {
+static struct clk_regmap g12a_fclk_div2p5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_FIX_PLL_CNTL1,
+		.bit_idx = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2p5",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_fclk_div2p5_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor g12a_mpll_50m_div = {
+	.mult = 1,
+	.div = 80,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll_50m_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_fixed_pll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_mpll_50m = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.offset = HHI_FIX_PLL_CNTL3,
 		.mask = 0x1,
-		.shift = 10,
+		.shift = 5,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_dyn",
+		.name = "mpll_50m",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_dsu_clk_postmux0.hw,
-			&sm1_dsu_clk_postmux1.hw,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_mpll_50m_div.hw },
 		},
 		.num_parents = 2,
 	},
 };
 
-/* Datasheet names this field as "Final_mux_sel" */
-static struct clk_regmap sm1_dsu_final_clk = {
+static struct clk_fixed_factor g12a_mpll_prediv = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpll_prediv",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_fixed_pll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/* Datasheet names this field as "premux0" */
+static struct clk_regmap g12a_cpu_clk_dyn0_sel = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
+		.mask = 0x3,
+		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk_dyn0_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* Datasheet names this field as "mux0_divn_tcnt" */
+static struct clk_regmap g12a_cpu_clk_dyn0_div = {
+	.data = &(struct meson_clk_cpu_dyndiv_data){
+		.div = {
+			.reg_off = HHI_SYS_CPU_CLK_CNTL0,
+			.shift = 4,
+			.width = 6,
+		},
+		.dyn = {
+			.reg_off = HHI_SYS_CPU_CLK_CNTL0,
+			.shift = 26,
+			.width = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk_dyn0_div",
+		.ops = &meson_clk_cpu_dyndiv_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk_dyn0_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* Datasheet names this field as "postmux0" */
+static struct clk_regmap g12a_cpu_clk_dyn0 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
-		.shift = 11,
+		.shift = 2,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk_final",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "cpu_clk_dyn0",
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_dsu_clk_dyn.hw,
-			&g12a_sys_pll.hw,
+			&g12a_cpu_clk_dyn0_sel.hw,
+			&g12a_cpu_clk_dyn0_div.hw,
 		},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 0 */
-static struct clk_regmap sm1_cpu1_clk = {
+/* Datasheet names this field as "premux1" */
+static struct clk_regmap g12a_cpu_clk_dyn1_sel = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL6,
-		.mask = 0x1,
-		.shift = 24,
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
+		.mask = 0x3,
+		.shift = 16,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu1_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "cpu_clk_dyn1_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+		},
+		.num_parents = 3,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT
+	},
+};
+
+/* Datasheet names this field as "Mux1_divn_tcnt" */
+static struct clk_regmap g12a_cpu_clk_dyn1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
+		.shift = 20,
+		.width = 6,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk_dyn1_div",
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk.hw,
-			/* This CPU also have a dedicated clock tree */
+			&g12a_cpu_clk_dyn1_sel.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 1 */
-static struct clk_regmap sm1_cpu2_clk = {
+/* Datasheet names this field as "postmux1" */
+static struct clk_regmap g12a_cpu_clk_dyn1 = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
-		.shift = 25,
+		.shift = 18,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu2_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "cpu_clk_dyn1",
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk.hw,
-			/* This CPU also have a dedicated clock tree */
+			&g12a_cpu_clk_dyn1_sel.hw,
+			&g12a_cpu_clk_dyn1_div.hw,
 		},
-		.num_parents = 1,
+		.num_parents = 2,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 2 */
-static struct clk_regmap sm1_cpu3_clk = {
+/* Datasheet names this field as "Final_dyn_mux_sel" */
+static struct clk_regmap g12a_cpu_clk_dyn = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
-		.shift = 26,
+		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu3_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "cpu_clk_dyn",
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk.hw,
-			/* This CPU also have a dedicated clock tree */
+			&g12a_cpu_clk_dyn0.hw,
+			&g12a_cpu_clk_dyn1.hw,
 		},
-		.num_parents = 1,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 4 */
-static struct clk_regmap sm1_dsu_clk = {
+/* Datasheet names this field as "Final_mux_sel" */
+static struct clk_regmap g12a_cpu_clk = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
-		.shift = 27,
+		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "dsu_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.name = "cpu_clk",
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk.hw,
-			&sm1_dsu_final_clk.hw,
+			&g12a_cpu_clk_dyn.hw,
+			&g12a_sys_pll.hw,
 		},
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static int g12a_cpu_clk_mux_notifier_cb(struct notifier_block *nb,
-					unsigned long event, void *data)
-{
-	if (event == POST_RATE_CHANGE || event == PRE_RATE_CHANGE) {
-		/* Wait for clock propagation before/after changing the mux */
-		udelay(100);
-		return NOTIFY_OK;
-	}
-
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block g12a_cpu_clk_mux_nb = {
-	.notifier_call = g12a_cpu_clk_mux_notifier_cb,
+/* Datasheet names this field as "Final_mux_sel" */
+static struct clk_regmap g12b_cpu_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL0,
+		.mask = 0x1,
+		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk_dyn.hw,
+			&g12b_sys1_pll.hw
+		},
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+	},
 };
 
-struct g12a_cpu_clk_postmux_nb_data {
-	struct notifier_block nb;
-	struct clk_hw *xtal;
-	struct clk_hw *cpu_clk_dyn;
-	struct clk_hw *cpu_clk_postmux0;
-	struct clk_hw *cpu_clk_postmux1;
-	struct clk_hw *cpu_clk_premux1;
+/* Datasheet names this field as "premux0" */
+static struct clk_regmap g12b_cpub_clk_dyn0_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cpub_clk_dyn0_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
 };
 
-static int g12a_cpu_clk_postmux_notifier_cb(struct notifier_block *nb,
-					    unsigned long event, void *data)
-{
-	struct g12a_cpu_clk_postmux_nb_data *nb_data =
-		container_of(nb, struct g12a_cpu_clk_postmux_nb_data, nb);
-
-	switch (event) {
-	case PRE_RATE_CHANGE:
-		/*
-		 * This notifier means cpu_clk_postmux0 clock will be changed
-		 * to feed cpu_clk, this is the current path :
-		 * cpu_clk
-		 *    \- cpu_clk_dyn
-		 *          \- cpu_clk_postmux0
-		 *                \- cpu_clk_muxX_div
-		 *                      \- cpu_clk_premux0
-		 *				\- fclk_div3 or fclk_div2
-		 *		OR
-		 *                \- cpu_clk_premux0
-		 *			\- fclk_div3 or fclk_div2
-		 */
-
-		/* Setup cpu_clk_premux1 to xtal */
-		clk_hw_set_parent(nb_data->cpu_clk_premux1,
-				  nb_data->xtal);
-
-		/* Setup cpu_clk_postmux1 to bypass divider */
-		clk_hw_set_parent(nb_data->cpu_clk_postmux1,
-				  nb_data->cpu_clk_premux1);
-
-		/* Switch to parking clk on cpu_clk_postmux1 */
-		clk_hw_set_parent(nb_data->cpu_clk_dyn,
-				  nb_data->cpu_clk_postmux1);
-
-		/*
-		 * Now, cpu_clk is 24MHz in the current path :
-		 * cpu_clk
-		 *    \- cpu_clk_dyn
-		 *          \- cpu_clk_postmux1
-		 *                \- cpu_clk_premux1
-		 *                      \- xtal
-		 */
-
-		udelay(100);
-
-		return NOTIFY_OK;
-
-	case POST_RATE_CHANGE:
-		/*
-		 * The cpu_clk_postmux0 has ben updated, now switch back
-		 * cpu_clk_dyn to cpu_clk_postmux0 and take the changes
-		 * in account.
-		 */
-
-		/* Configure cpu_clk_dyn back to cpu_clk_postmux0 */
-		clk_hw_set_parent(nb_data->cpu_clk_dyn,
-				  nb_data->cpu_clk_postmux0);
-
-		/*
-		 * new path :
-		 * cpu_clk
-		 *    \- cpu_clk_dyn
-		 *          \- cpu_clk_postmux0
-		 *                \- cpu_clk_muxX_div
-		 *                      \- cpu_clk_premux0
-		 *				\- fclk_div3 or fclk_div2
-		 *		OR
-		 *                \- cpu_clk_premux0
-		 *			\- fclk_div3 or fclk_div2
-		 */
-
-		udelay(100);
-
-		return NOTIFY_OK;
-
-	default:
-		return NOTIFY_DONE;
-	}
-}
-
-static struct g12a_cpu_clk_postmux_nb_data g12a_cpu_clk_postmux0_nb_data = {
-	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
-	.cpu_clk_postmux0 = &g12a_cpu_clk_postmux0.hw,
-	.cpu_clk_postmux1 = &g12a_cpu_clk_postmux1.hw,
-	.cpu_clk_premux1 = &g12a_cpu_clk_premux1.hw,
-	.nb.notifier_call = g12a_cpu_clk_postmux_notifier_cb,
-};
-
-static struct g12a_cpu_clk_postmux_nb_data g12b_cpub_clk_postmux0_nb_data = {
-	.cpu_clk_dyn = &g12b_cpub_clk_dyn.hw,
-	.cpu_clk_postmux0 = &g12b_cpub_clk_postmux0.hw,
-	.cpu_clk_postmux1 = &g12b_cpub_clk_postmux1.hw,
-	.cpu_clk_premux1 = &g12b_cpub_clk_premux1.hw,
-	.nb.notifier_call = g12a_cpu_clk_postmux_notifier_cb,
-};
-
-struct g12a_sys_pll_nb_data {
-	struct notifier_block nb;
-	struct clk_hw *sys_pll;
-	struct clk_hw *cpu_clk;
-	struct clk_hw *cpu_clk_dyn;
-};
-
-static int g12a_sys_pll_notifier_cb(struct notifier_block *nb,
-				    unsigned long event, void *data)
-{
-	struct g12a_sys_pll_nb_data *nb_data =
-		container_of(nb, struct g12a_sys_pll_nb_data, nb);
-
-	switch (event) {
-	case PRE_RATE_CHANGE:
-		/*
-		 * This notifier means sys_pll clock will be changed
-		 * to feed cpu_clk, this the current path :
-		 * cpu_clk
-		 *    \- sys_pll
-		 *          \- sys_pll_dco
-		 */
-
-		/* Configure cpu_clk to use cpu_clk_dyn */
-		clk_hw_set_parent(nb_data->cpu_clk,
-				  nb_data->cpu_clk_dyn);
-
-		/*
-		 * Now, cpu_clk uses the dyn path
-		 * cpu_clk
-		 *    \- cpu_clk_dyn
-		 *          \- cpu_clk_dynX
-		 *                \- cpu_clk_dynX_sel
-		 *		     \- cpu_clk_dynX_div
-		 *                      \- xtal/fclk_div2/fclk_div3
-		 *                   \- xtal/fclk_div2/fclk_div3
-		 */
-
-		udelay(100);
-
-		return NOTIFY_OK;
-
-	case POST_RATE_CHANGE:
-		/*
-		 * The sys_pll has ben updated, now switch back cpu_clk to
-		 * sys_pll
-		 */
-
-		/* Configure cpu_clk to use sys_pll */
-		clk_hw_set_parent(nb_data->cpu_clk,
-				  nb_data->sys_pll);
-
-		udelay(100);
-
-		/* new path :
-		 * cpu_clk
-		 *    \- sys_pll
-		 *          \- sys_pll_dco
-		 */
-
-		return NOTIFY_OK;
-
-	default:
-		return NOTIFY_DONE;
-	}
-}
-
-static struct g12a_sys_pll_nb_data g12a_sys_pll_nb_data = {
-	.sys_pll = &g12a_sys_pll.hw,
-	.cpu_clk = &g12a_cpu_clk.hw,
-	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
-	.nb.notifier_call = g12a_sys_pll_notifier_cb,
-};
-
-/* G12B first CPU cluster uses sys1_pll */
-static struct g12a_sys_pll_nb_data g12b_cpu_clk_sys1_pll_nb_data = {
-	.sys_pll = &g12b_sys1_pll.hw,
-	.cpu_clk = &g12b_cpu_clk.hw,
-	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
-	.nb.notifier_call = g12a_sys_pll_notifier_cb,
-};
-
-/* G12B second CPU cluster uses sys_pll */
-static struct g12a_sys_pll_nb_data g12b_cpub_clk_sys_pll_nb_data = {
-	.sys_pll = &g12a_sys_pll.hw,
-	.cpu_clk = &g12b_cpub_clk.hw,
-	.cpu_clk_dyn = &g12b_cpub_clk_dyn.hw,
-	.nb.notifier_call = g12a_sys_pll_notifier_cb,
-};
-
-static struct clk_regmap g12a_cpu_clk_div16_en = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.bit_idx = 1,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpu_clk_div16_en",
-		.ops = &clk_regmap_gate_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			/*
-			 * Note:
-			 * G12A and G12B have different cpu clocks (with
-			 * different struct clk_hw). We fallback to the global
-			 * naming string mechanism so this clock picks
-			 * up the appropriate one. Same goes for the other
-			 * clock using cpu cluster A clock output and present
-			 * on both G12 variant.
-			 */
-			.name = "cpu_clk",
-			.index = -1,
+/* Datasheet names this field as "mux0_divn_tcnt" */
+static struct clk_regmap g12b_cpub_clk_dyn0_div = {
+	.data = &(struct meson_clk_cpu_dyndiv_data){
+		.div = {
+			.reg_off = HHI_SYS_CPUB_CLK_CNTL,
+			.shift = 4,
+			.width = 6,
+		},
+		.dyn = {
+			.reg_off = HHI_SYS_CPUB_CLK_CNTL,
+			.shift = 26,
+			.width = 1,
 		},
-		.num_parents = 1,
-		/*
-		 * This clock is used to debug the cpu_clk range
-		 * Linux should not change it at runtime
-		 */
-	},
-};
-
-static struct clk_regmap g12b_cpub_clk_div16_en = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.bit_idx = 1,
 	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpub_clk_div16_en",
-		.ops = &clk_regmap_gate_ro_ops,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpub_clk_dyn0_div",
+		.ops = &meson_clk_cpu_dyndiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+			&g12b_cpub_clk_dyn0_sel.hw
 		},
 		.num_parents = 1,
-		/*
-		 * This clock is used to debug the cpu_clk range
-		 * Linux should not change it at runtime
-		 */
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_fixed_factor g12a_cpu_clk_div16 = {
-	.mult = 1,
-	.div = 16,
+/* Datasheet names this field as "postmux0" */
+static struct clk_regmap g12b_cpub_clk_dyn0 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.mask = 0x1,
+		.shift = 2,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_div16",
-		.ops = &clk_fixed_factor_ops,
+		.name = "cpub_clk_dyn0",
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_div16_en.hw
+			&g12b_cpub_clk_dyn0_sel.hw,
+			&g12b_cpub_clk_dyn0_div.hw
 		},
-		.num_parents = 1,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div16 = {
-	.mult = 1,
-	.div = 16,
+/* Datasheet names this field as "premux1" */
+static struct clk_regmap g12b_cpub_clk_dyn1_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.mask = 0x3,
+		.shift = 16,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div16",
-		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_div16_en.hw
+		.name = "cpub_clk_dyn1_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
 		},
-		.num_parents = 1,
+		.num_parents = 3,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_apb_div = {
+/* Datasheet names this field as "Mux1_divn_tcnt" */
+static struct clk_regmap g12b_cpub_clk_dyn1_div = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.shift = 3,
-		.width = 3,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.shift = 20,
+		.width = 6,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_apb_div",
+		.name = "cpub_clk_dyn1_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.name = "cpu_clk",
-			.index = -1,
-		},
-		.num_parents = 1,
-	},
-};
-
-static struct clk_regmap g12a_cpu_clk_apb = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.bit_idx = 1,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpu_clk_apb",
-		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_apb_div.hw
+			&g12b_cpub_clk_dyn1_sel.hw
 		},
 		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_atb_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.shift = 6,
-		.width = 3,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+/* Datasheet names this field as "postmux1" */
+static struct clk_regmap g12b_cpub_clk_dyn1 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.mask = 0x1,
+		.shift = 18,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_atb_div",
-		.ops = &clk_regmap_divider_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.name = "cpu_clk",
-			.index = -1,
+		.name = "cpub_clk_dyn1",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_cpub_clk_dyn1_sel.hw,
+			&g12b_cpub_clk_dyn1_div.hw
 		},
-		.num_parents = 1,
+		.num_parents = 2,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_atb = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.bit_idx = 17,
+/* Datasheet names this field as "Final_dyn_mux_sel" */
+static struct clk_regmap g12b_cpub_clk_dyn = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.mask = 0x1,
+		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpu_clk_atb",
-		.ops = &clk_regmap_gate_ro_ops,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpub_clk_dyn",
+		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_atb_div.hw
+			&g12b_cpub_clk_dyn0.hw,
+			&g12b_cpub_clk_dyn1.hw
 		},
-		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_axi_div = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.shift = 9,
-		.width = 3,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+/* Datasheet names this field as "Final_mux_sel" */
+static struct clk_regmap g12b_cpub_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL,
+		.mask = 0x1,
+		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_axi_div",
-		.ops = &clk_regmap_divider_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.name = "cpu_clk",
-			.index = -1,
+		.name = "cpub_clk",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_cpub_clk_dyn.hw,
+			&g12a_sys_pll.hw
 		},
-		.num_parents = 1,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_axi = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.bit_idx = 18,
+/* Datasheet names this field as "premux0" */
+static struct clk_regmap sm1_dsu_clk_dyn0_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x3,
+		.shift = 0,
 	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpu_clk_axi",
-		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_axi_div.hw
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn0_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+			{ .hw = &sm1_gp1_pll.hw },
 		},
-		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
+		.num_parents = 4,
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_trace_div = {
+/* Datasheet names this field as "Mux0_divn_tcnt" */
+static struct clk_regmap sm1_dsu_clk_dyn0_div = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.shift = 20,
-		.width = 3,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.shift = 4,
+		.width = 6,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpu_clk_trace_div",
+		.name = "dsu_clk_dyn0_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.name = "cpu_clk",
-			.index = -1,
+		.parent_hws = (const struct clk_hw *[]) {
+			&sm1_dsu_clk_dyn0_sel.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_cpu_clk_trace = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPU_CLK_CNTL1,
-		.bit_idx = 23,
+/* Datasheet names this field as "postmux0" */
+static struct clk_regmap sm1_dsu_clk_dyn0 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 2,
 	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpu_clk_trace",
-		.ops = &clk_regmap_gate_ro_ops,
+	.hw.init = &(struct clk_init_data){
+		.name = "dsu_clk_dyn0",
+		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk_trace_div.hw
+			&sm1_dsu_clk_dyn0_sel.hw,
+			&sm1_dsu_clk_dyn0_div.hw,
 		},
-		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
+		.num_parents = 2,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div2 = {
-	.mult = 1,
-	.div = 2,
+/* Datasheet names this field as "premux1" */
+static struct clk_regmap sm1_dsu_clk_dyn1_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x3,
+		.shift = 16,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div2",
-		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+		.name = "dsu_clk_dyn1_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_data = (const struct clk_parent_data []) {
+			{ .fw_name = "xtal", },
+			{ .hw = &g12a_fclk_div2.hw },
+			{ .hw = &g12a_fclk_div3.hw },
+			{ .hw = &sm1_gp1_pll.hw },
 		},
-		.num_parents = 1,
+		.num_parents = 4,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div3 = {
-	.mult = 1,
-	.div = 3,
+/* Datasheet names this field as "Mux1_divn_tcnt" */
+static struct clk_regmap sm1_dsu_clk_dyn1_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.shift = 20,
+		.width = 6,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div3",
-		.ops = &clk_fixed_factor_ops,
+		.name = "dsu_clk_dyn1_div",
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+			&sm1_dsu_clk_dyn1_sel.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div4 = {
-	.mult = 1,
-	.div = 4,
+/* Datasheet names this field as "postmux1" */
+static struct clk_regmap sm1_dsu_clk_dyn1 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 18,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div4",
-		.ops = &clk_fixed_factor_ops,
+		.name = "dsu_clk_dyn1",
+		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+			&sm1_dsu_clk_dyn1_sel.hw,
+			&sm1_dsu_clk_dyn1_div.hw,
 		},
-		.num_parents = 1,
+		.num_parents = 2,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div5 = {
-	.mult = 1,
-	.div = 5,
+/* Datasheet names this field as "Final_dyn_mux_sel" */
+static struct clk_regmap sm1_dsu_clk_dyn = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 10,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div5",
-		.ops = &clk_fixed_factor_ops,
+		.name = "dsu_clk_dyn",
+		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+			&sm1_dsu_clk_dyn0.hw,
+			&sm1_dsu_clk_dyn1.hw,
 		},
-		.num_parents = 1,
+		.num_parents = 2,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div6 = {
-	.mult = 1,
-	.div = 6,
+/* Datasheet names this field as "Final_mux_sel" */
+static struct clk_regmap sm1_dsu_final_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL5,
+		.mask = 0x1,
+		.shift = 11,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div6",
-		.ops = &clk_fixed_factor_ops,
+		.name = "dsu_clk_final",
+		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+			&sm1_dsu_clk_dyn.hw,
+			&g12a_sys_pll.hw,
 		},
-		.num_parents = 1,
+		.num_parents = 2,
 	},
 };
 
-static struct clk_fixed_factor g12b_cpub_clk_div7 = {
-	.mult = 1,
-	.div = 7,
-	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div7",
-		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
-		},
-		.num_parents = 1,
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 0 */
+static struct clk_regmap sm1_cpu1_clk = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 24,
 	},
-};
-
-static struct clk_fixed_factor g12b_cpub_clk_div8 = {
-	.mult = 1,
-	.div = 8,
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_div8",
-		.ops = &clk_fixed_factor_ops,
+		.name = "cpu1_clk",
+		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk.hw
+			&g12a_cpu_clk.hw,
+			/* This CPU also have a dedicated clock tree */
 		},
 		.num_parents = 1,
 	},
 };
 
-static u32 mux_table_cpub[] = { 1, 2, 3, 4, 5, 6, 7 };
-static struct clk_regmap g12b_cpub_clk_apb_sel = {
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 1 */
+static struct clk_regmap sm1_cpu2_clk = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.mask = 7,
-		.shift = 3,
-		.table = mux_table_cpub,
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_apb_sel",
+		.name = "cpu2_clk",
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_div2.hw,
-			&g12b_cpub_clk_div3.hw,
-			&g12b_cpub_clk_div4.hw,
-			&g12b_cpub_clk_div5.hw,
-			&g12b_cpub_clk_div6.hw,
-			&g12b_cpub_clk_div7.hw,
-			&g12b_cpub_clk_div8.hw
-		},
-		.num_parents = 7,
-	},
-};
-
-static struct clk_regmap g12b_cpub_clk_apb = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.bit_idx = 16,
-		.flags = CLK_GATE_SET_TO_DISABLE,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpub_clk_apb",
-		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_apb_sel.hw
+			&g12a_cpu_clk.hw,
+			/* This CPU also have a dedicated clock tree */
 		},
 		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
 	},
 };
 
-static struct clk_regmap g12b_cpub_clk_atb_sel = {
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 2 */
+static struct clk_regmap sm1_cpu3_clk = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.mask = 7,
-		.shift = 6,
-		.table = mux_table_cpub,
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 26,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_atb_sel",
+		.name = "cpu3_clk",
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_div2.hw,
-			&g12b_cpub_clk_div3.hw,
-			&g12b_cpub_clk_div4.hw,
-			&g12b_cpub_clk_div5.hw,
-			&g12b_cpub_clk_div6.hw,
-			&g12b_cpub_clk_div7.hw,
-			&g12b_cpub_clk_div8.hw
-		},
-		.num_parents = 7,
-	},
-};
-
-static struct clk_regmap g12b_cpub_clk_atb = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.bit_idx = 17,
-		.flags = CLK_GATE_SET_TO_DISABLE,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpub_clk_atb",
-		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_atb_sel.hw
+			&g12a_cpu_clk.hw,
+			/* This CPU also have a dedicated clock tree */
 		},
 		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
 	},
 };
 
-static struct clk_regmap g12b_cpub_clk_axi_sel = {
+/* Datasheet names this field as "Cpu_clk_sync_mux_sel" bit 4 */
+static struct clk_regmap sm1_dsu_clk = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.mask = 7,
-		.shift = 9,
-		.table = mux_table_cpub,
+		.offset = HHI_SYS_CPU_CLK_CNTL6,
+		.mask = 0x1,
+		.shift = 27,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_axi_sel",
+		.name = "dsu_clk",
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_div2.hw,
-			&g12b_cpub_clk_div3.hw,
-			&g12b_cpub_clk_div4.hw,
-			&g12b_cpub_clk_div5.hw,
-			&g12b_cpub_clk_div6.hw,
-			&g12b_cpub_clk_div7.hw,
-			&g12b_cpub_clk_div8.hw
+			&g12a_cpu_clk.hw,
+			&sm1_dsu_final_clk.hw,
 		},
-		.num_parents = 7,
+		.num_parents = 2,
 	},
 };
 
-static struct clk_regmap g12b_cpub_clk_axi = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.bit_idx = 18,
-		.flags = CLK_GATE_SET_TO_DISABLE,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpub_clk_axi",
-		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_axi_sel.hw
-		},
-		.num_parents = 1,
-		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
-		 */
-	},
+static int g12a_cpu_clk_mux_notifier_cb(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	if (event == POST_RATE_CHANGE || event == PRE_RATE_CHANGE) {
+		/* Wait for clock propagation before/after changing the mux */
+		udelay(100);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block g12a_cpu_clk_mux_nb = {
+	.notifier_call = g12a_cpu_clk_mux_notifier_cb,
 };
 
-static struct clk_regmap g12b_cpub_clk_trace_sel = {
-	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.mask = 7,
-		.shift = 20,
-		.table = mux_table_cpub,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "cpub_clk_trace_sel",
-		.ops = &clk_regmap_mux_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_div2.hw,
-			&g12b_cpub_clk_div3.hw,
-			&g12b_cpub_clk_div4.hw,
-			&g12b_cpub_clk_div5.hw,
-			&g12b_cpub_clk_div6.hw,
-			&g12b_cpub_clk_div7.hw,
-			&g12b_cpub_clk_div8.hw
-		},
-		.num_parents = 7,
-	},
+struct g12a_cpu_clk_dyn_nb_data {
+	struct notifier_block nb;
+	struct clk_hw *xtal;
+	struct clk_hw *cpu_clk_dyn;
+	struct clk_hw *cpu_clk_postmux0;
+	struct clk_hw *cpu_clk_postmux1;
+	struct clk_hw *cpu_clk_premux1;
 };
 
-static struct clk_regmap g12b_cpub_clk_trace = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_SYS_CPUB_CLK_CNTL1,
-		.bit_idx = 23,
-		.flags = CLK_GATE_SET_TO_DISABLE,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "cpub_clk_trace",
-		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12b_cpub_clk_trace_sel.hw
-		},
-		.num_parents = 1,
+static int g12a_cpu_clk_dyn_notifier_cb(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	struct g12a_cpu_clk_dyn_nb_data *nb_data =
+		container_of(nb, struct g12a_cpu_clk_dyn_nb_data, nb);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
 		/*
-		 * This clock is set by the ROM monitor code,
-		 * Linux should not change it at runtime
+		 * This notifier means cpu_clk_dyn0 clock will be changed
+		 * to feed cpu_clk, this is the current path :
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_dyn0
+		 *                \- cpu_clk_dyn0_div
+		 *                      \- cpu_clk_dyn0_sel
+		 *				\- fclk_div3 or fclk_div2
+		 *		OR
+		 *                \- cpu_clk_dyn0_sel
+		 *			\- fclk_div3 or fclk_div2
 		 */
-	},
-};
 
-static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 125,
-	.max = 255,
-};
+		/* Setup cpu_clk_dyn1_sel to xtal */
+		clk_hw_set_parent(nb_data->cpu_clk_premux1,
+				  nb_data->xtal);
 
-/*
- * Internal gp0 pll emulation configuration parameters
- */
-static const struct reg_sequence g12a_gp0_init_regs[] = {
-	{ .reg = HHI_GP0_PLL_CNTL1,	.def = 0x00000000 },
-	{ .reg = HHI_GP0_PLL_CNTL2,	.def = 0x00000000 },
-	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x48681c00 },
-	{ .reg = HHI_GP0_PLL_CNTL4,	.def = 0x33771290 },
-	{ .reg = HHI_GP0_PLL_CNTL5,	.def = 0x39272000 },
-	{ .reg = HHI_GP0_PLL_CNTL6,	.def = 0x56540000 },
+		/* Setup cpu_clk_dyn1 to bypass divider */
+		clk_hw_set_parent(nb_data->cpu_clk_postmux1,
+				  nb_data->cpu_clk_premux1);
+
+		/* Switch to parking clk on cpu_clk_postmux1 */
+		clk_hw_set_parent(nb_data->cpu_clk_dyn,
+				  nb_data->cpu_clk_postmux1);
+
+		/*
+		 * Now, cpu_clk is 24MHz in the current path :
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_dyn1
+		 *                \- cpu_clk_dyn1_sel
+		 *                      \- xtal
+		 */
+
+		udelay(100);
+
+		return NOTIFY_OK;
+
+	case POST_RATE_CHANGE:
+		/*
+		 * The cpu_clk_dyn0 has ben updated, now switch back
+		 * cpu_clk_dyn to cpu_clk_dyn0 and take the changes
+		 * in account.
+		 */
+
+		/* Configure cpu_clk_dyn back to cpu_clk_postmux0 */
+		clk_hw_set_parent(nb_data->cpu_clk_dyn,
+				  nb_data->cpu_clk_postmux0);
+
+		/*
+		 * new path :
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_dyn0
+		 *                \- cpu_clk_dyn0_div
+		 *                      \- cpu_clk_dyn0_sel
+		 *				\- fclk_div3 or fclk_div2
+		 *		OR
+		 *                \- cpu_clk_dyn0_sel
+		 *			\- fclk_div3 or fclk_div2
+		 */
+
+		udelay(100);
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct g12a_cpu_clk_dyn_nb_data g12a_cpu_clk_dyn0_nb_data = {
+	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
+	.cpu_clk_postmux0 = &g12a_cpu_clk_dyn0.hw,
+	.cpu_clk_postmux1 = &g12a_cpu_clk_dyn1.hw,
+	.cpu_clk_premux1 = &g12a_cpu_clk_dyn1_sel.hw,
+	.nb.notifier_call = g12a_cpu_clk_dyn_notifier_cb,
 };
 
-static struct clk_regmap g12a_gp0_pll_dco = {
-	.data = &(struct meson_clk_pll_data){
-		.en = {
-			.reg_off = HHI_GP0_PLL_CNTL0,
-			.shift   = 28,
-			.width   = 1,
-		},
-		.m = {
-			.reg_off = HHI_GP0_PLL_CNTL0,
-			.shift   = 0,
-			.width   = 8,
-		},
-		.n = {
-			.reg_off = HHI_GP0_PLL_CNTL0,
-			.shift   = 10,
-			.width   = 5,
-		},
-		.frac = {
-			.reg_off = HHI_GP0_PLL_CNTL1,
-			.shift   = 0,
-			.width   = 17,
-		},
-		.l = {
-			.reg_off = HHI_GP0_PLL_CNTL0,
-			.shift   = 31,
-			.width   = 1,
-		},
-		.rst = {
-			.reg_off = HHI_GP0_PLL_CNTL0,
-			.shift   = 29,
-			.width   = 1,
-		},
-		.range = &g12a_gp0_pll_mult_range,
-		.init_regs = g12a_gp0_init_regs,
-		.init_count = ARRAY_SIZE(g12a_gp0_init_regs),
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "gp0_pll_dco",
-		.ops = &meson_clk_pll_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xtal",
-		},
-		.num_parents = 1,
-	},
+static struct g12a_cpu_clk_dyn_nb_data g12b_cpub_clk_dyn0_nb_data = {
+	.cpu_clk_dyn = &g12b_cpub_clk_dyn.hw,
+	.cpu_clk_postmux0 = &g12b_cpub_clk_dyn0.hw,
+	.cpu_clk_postmux1 = &g12b_cpub_clk_dyn1.hw,
+	.cpu_clk_premux1 = &g12b_cpub_clk_dyn1_sel.hw,
+	.nb.notifier_call = g12a_cpu_clk_dyn_notifier_cb,
 };
 
-static struct clk_regmap g12a_gp0_pll = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_GP0_PLL_CNTL0,
-		.shift = 16,
-		.width = 3,
-		.flags = (CLK_DIVIDER_POWER_OF_TWO |
-			  CLK_DIVIDER_ROUND_CLOSEST),
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "gp0_pll",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_gp0_pll_dco.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
+struct g12a_sys_pll_nb_data {
+	struct notifier_block nb;
+	struct clk_hw *sys_pll;
+	struct clk_hw *cpu_clk;
+	struct clk_hw *cpu_clk_dyn;
 };
 
-static struct clk_regmap sm1_gp1_pll_dco = {
-	.data = &(struct meson_clk_pll_data){
-		.en = {
-			.reg_off = HHI_GP1_PLL_CNTL0,
-			.shift   = 28,
-			.width   = 1,
-		},
-		.m = {
-			.reg_off = HHI_GP1_PLL_CNTL0,
-			.shift   = 0,
-			.width   = 8,
-		},
-		.n = {
-			.reg_off = HHI_GP1_PLL_CNTL0,
-			.shift   = 10,
-			.width   = 5,
-		},
-		.frac = {
-			.reg_off = HHI_GP1_PLL_CNTL1,
-			.shift   = 0,
-			.width   = 17,
-		},
-		.l = {
-			.reg_off = HHI_GP1_PLL_CNTL0,
-			.shift   = 31,
-			.width   = 1,
-		},
-		.rst = {
-			.reg_off = HHI_GP1_PLL_CNTL0,
-			.shift   = 29,
-			.width   = 1,
-		},
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "gp1_pll_dco",
-		.ops = &meson_clk_pll_ro_ops,
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xtal",
-		},
-		.num_parents = 1,
-		/* This clock feeds the DSU, avoid disabling it */
-		.flags = CLK_IS_CRITICAL,
-	},
+static int g12a_sys_pll_notifier_cb(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct g12a_sys_pll_nb_data *nb_data =
+		container_of(nb, struct g12a_sys_pll_nb_data, nb);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		/*
+		 * This notifier means sys_pll clock will be changed
+		 * to feed cpu_clk, this the current path :
+		 * cpu_clk
+		 *    \- sys_pll
+		 *          \- sys_pll_dco
+		 */
+
+		/* Configure cpu_clk to use cpu_clk_dyn */
+		clk_hw_set_parent(nb_data->cpu_clk,
+				  nb_data->cpu_clk_dyn);
+
+		/*
+		 * Now, cpu_clk uses the dyn path
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_dynX
+		 *                \- cpu_clk_dynX_sel
+		 *		     \- cpu_clk_dynX_div
+		 *                      \- xtal/fclk_div2/fclk_div3
+		 *                   \- xtal/fclk_div2/fclk_div3
+		 */
+
+		udelay(100);
+
+		return NOTIFY_OK;
+
+	case POST_RATE_CHANGE:
+		/*
+		 * The sys_pll has ben updated, now switch back cpu_clk to
+		 * sys_pll
+		 */
+
+		/* Configure cpu_clk to use sys_pll */
+		clk_hw_set_parent(nb_data->cpu_clk,
+				  nb_data->sys_pll);
+
+		udelay(100);
+
+		/* new path :
+		 * cpu_clk
+		 *    \- sys_pll
+		 *          \- sys_pll_dco
+		 */
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct g12a_sys_pll_nb_data g12a_sys_pll_nb_data = {
+	.sys_pll = &g12a_sys_pll.hw,
+	.cpu_clk = &g12a_cpu_clk.hw,
+	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
+	.nb.notifier_call = g12a_sys_pll_notifier_cb,
 };
 
-static struct clk_regmap sm1_gp1_pll = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_GP1_PLL_CNTL0,
-		.shift = 16,
-		.width = 3,
-		.flags = (CLK_DIVIDER_POWER_OF_TWO |
-			  CLK_DIVIDER_ROUND_CLOSEST),
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "gp1_pll",
-		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&sm1_gp1_pll_dco.hw
-		},
-		.num_parents = 1,
-	},
+/* G12B first CPU cluster uses sys1_pll */
+static struct g12a_sys_pll_nb_data g12b_cpu_clk_sys1_pll_nb_data = {
+	.sys_pll = &g12b_sys1_pll.hw,
+	.cpu_clk = &g12b_cpu_clk.hw,
+	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
+	.nb.notifier_call = g12a_sys_pll_notifier_cb,
 };
 
-/*
- * Internal hifi pll emulation configuration parameters
- */
-static const struct reg_sequence g12a_hifi_init_regs[] = {
-	{ .reg = HHI_HIFI_PLL_CNTL1,	.def = 0x00000000 },
-	{ .reg = HHI_HIFI_PLL_CNTL2,	.def = 0x00000000 },
-	{ .reg = HHI_HIFI_PLL_CNTL3,	.def = 0x6a285c00 },
-	{ .reg = HHI_HIFI_PLL_CNTL4,	.def = 0x65771290 },
-	{ .reg = HHI_HIFI_PLL_CNTL5,	.def = 0x39272000 },
-	{ .reg = HHI_HIFI_PLL_CNTL6,	.def = 0x56540000 },
+/* G12B second CPU cluster uses sys_pll */
+static struct g12a_sys_pll_nb_data g12b_cpub_clk_sys_pll_nb_data = {
+	.sys_pll = &g12a_sys_pll.hw,
+	.cpu_clk = &g12b_cpub_clk.hw,
+	.cpu_clk_dyn = &g12b_cpub_clk_dyn.hw,
+	.nb.notifier_call = g12a_sys_pll_notifier_cb,
 };
 
-static struct clk_regmap g12a_hifi_pll_dco = {
-	.data = &(struct meson_clk_pll_data){
-		.en = {
-			.reg_off = HHI_HIFI_PLL_CNTL0,
-			.shift   = 28,
-			.width   = 1,
-		},
-		.m = {
-			.reg_off = HHI_HIFI_PLL_CNTL0,
-			.shift   = 0,
-			.width   = 8,
-		},
-		.n = {
-			.reg_off = HHI_HIFI_PLL_CNTL0,
-			.shift   = 10,
-			.width   = 5,
-		},
-		.frac = {
-			.reg_off = HHI_HIFI_PLL_CNTL1,
-			.shift   = 0,
-			.width   = 17,
-		},
-		.l = {
-			.reg_off = HHI_HIFI_PLL_CNTL0,
-			.shift   = 31,
-			.width   = 1,
-		},
-		.rst = {
-			.reg_off = HHI_HIFI_PLL_CNTL0,
-			.shift   = 29,
-			.width   = 1,
-		},
-		.range = &g12a_gp0_pll_mult_range,
-		.init_regs = g12a_hifi_init_regs,
-		.init_count = ARRAY_SIZE(g12a_hifi_init_regs),
-		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+static struct clk_regmap g12a_cpu_clk_div16_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.bit_idx = 1,
 	},
-	.hw.init = &(struct clk_init_data){
-		.name = "hifi_pll_dco",
-		.ops = &meson_clk_pll_ops,
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpu_clk_div16_en",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xtal",
+			/*
+			 * Note:
+			 * G12A and G12B have different cpu clocks (with
+			 * different struct clk_hw). We fallback to the global
+			 * naming string mechanism so this clock picks
+			 * up the appropriate one. Same goes for the other
+			 * clock using cpu cluster A clock output and present
+			 * on both G12 variant.
+			 */
+			.name = "cpu_clk",
+			.index = -1,
 		},
 		.num_parents = 1,
+		/*
+		 * This clock is used to debug the cpu_clk range
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_regmap g12a_hifi_pll = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HIFI_PLL_CNTL0,
-		.shift = 16,
-		.width = 2,
-		.flags = (CLK_DIVIDER_POWER_OF_TWO |
-			  CLK_DIVIDER_ROUND_CLOSEST),
+static struct clk_regmap g12b_cpub_clk_div16_en = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.bit_idx = 1,
 	},
-	.hw.init = &(struct clk_init_data){
-		.name = "hifi_pll",
-		.ops = &clk_regmap_divider_ops,
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpub_clk_div16_en",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_hifi_pll_dco.hw
+			&g12b_cpub_clk.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		/*
+		 * This clock is used to debug the cpu_clk range
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-/*
- * The Meson G12A PCIE PLL is fined tuned to deliver a very precise
- * 100MHz reference clock for the PCIe Analog PHY, and thus requires
- * a strict register sequence to enable the PLL.
- */
-static const struct reg_sequence g12a_pcie_pll_init_regs[] = {
-	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x20090496 },
-	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x30090496 },
-	{ .reg = HHI_PCIE_PLL_CNTL1,	.def = 0x00000000 },
-	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001100 },
-	{ .reg = HHI_PCIE_PLL_CNTL3,	.def = 0x10058e00 },
-	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x000100c0 },
-	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000048 },
-	{ .reg = HHI_PCIE_PLL_CNTL5,	.def = 0x68000068, .delay_us = 20 },
-	{ .reg = HHI_PCIE_PLL_CNTL4,	.def = 0x008100c0, .delay_us = 10 },
-	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x34090496 },
-	{ .reg = HHI_PCIE_PLL_CNTL0,	.def = 0x14090496, .delay_us = 10 },
-	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0x00001000 },
+static struct clk_fixed_factor g12a_cpu_clk_div16 = {
+	.mult = 1,
+	.div = 16,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk_div16",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk_div16_en.hw
+		},
+		.num_parents = 1,
+	},
 };
 
-/* Keep a single entry table for recalc/round_rate() ops */
-static const struct pll_params_table g12a_pcie_pll_table[] = {
-	PLL_PARAMS(150, 1),
-	{0, 0},
+static struct clk_fixed_factor g12b_cpub_clk_div16 = {
+	.mult = 1,
+	.div = 16,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpub_clk_div16",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_cpub_clk_div16_en.hw
+		},
+		.num_parents = 1,
+	},
 };
 
-static struct clk_regmap g12a_pcie_pll_dco = {
-	.data = &(struct meson_clk_pll_data){
-		.en = {
-			.reg_off = HHI_PCIE_PLL_CNTL0,
-			.shift   = 28,
-			.width   = 1,
-		},
-		.m = {
-			.reg_off = HHI_PCIE_PLL_CNTL0,
-			.shift   = 0,
-			.width   = 8,
-		},
-		.n = {
-			.reg_off = HHI_PCIE_PLL_CNTL0,
-			.shift   = 10,
-			.width   = 5,
-		},
-		.frac = {
-			.reg_off = HHI_PCIE_PLL_CNTL1,
-			.shift   = 0,
-			.width   = 12,
-		},
-		.l = {
-			.reg_off = HHI_PCIE_PLL_CNTL0,
-			.shift   = 31,
-			.width   = 1,
-		},
-		.rst = {
-			.reg_off = HHI_PCIE_PLL_CNTL0,
-			.shift   = 29,
-			.width   = 1,
-		},
-		.table = g12a_pcie_pll_table,
-		.init_regs = g12a_pcie_pll_init_regs,
-		.init_count = ARRAY_SIZE(g12a_pcie_pll_init_regs),
+static struct clk_regmap g12a_cpu_clk_apb_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.shift = 3,
+		.width = 3,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pcie_pll_dco",
-		.ops = &meson_clk_pcie_pll_ops,
+		.name = "cpu_clk_apb_div",
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xtal",
+			.name = "cpu_clk",
+			.index = -1,
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor g12a_pcie_pll_dco_div2 = {
-	.mult = 1,
-	.div = 2,
-	.hw.init = &(struct clk_init_data){
-		.name = "pcie_pll_dco_div2",
-		.ops = &clk_fixed_factor_ops,
+static struct clk_regmap g12a_cpu_clk_apb = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.bit_idx = 1,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpu_clk_apb",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_pcie_pll_dco.hw
+			&g12a_cpu_clk_apb_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_regmap g12a_pcie_pll_od = {
+static struct clk_regmap g12a_cpu_clk_atb_div = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_PCIE_PLL_CNTL0,
-		.shift = 16,
-		.width = 5,
-		.flags = CLK_DIVIDER_ROUND_CLOSEST |
-			 CLK_DIVIDER_ONE_BASED |
-			 CLK_DIVIDER_ALLOW_ZERO,
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.shift = 6,
+		.width = 3,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pcie_pll_od",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_pcie_pll_dco_div2.hw
+		.name = "cpu_clk_atb_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_fixed_factor g12a_pcie_pll = {
-	.mult = 1,
-	.div = 2,
-	.hw.init = &(struct clk_init_data){
-		.name = "pcie_pll_pll",
-		.ops = &clk_fixed_factor_ops,
+static struct clk_regmap g12a_cpu_clk_atb = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.bit_idx = 17,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpu_clk_atb",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_pcie_pll_od.hw
+			&g12a_cpu_clk_atb_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_regmap g12a_hdmi_pll_dco = {
-	.data = &(struct meson_clk_pll_data){
-		.en = {
-			.reg_off = HHI_HDMI_PLL_CNTL0,
-			.shift   = 28,
-			.width   = 1,
-		},
-		.m = {
-			.reg_off = HHI_HDMI_PLL_CNTL0,
-			.shift   = 0,
-			.width   = 8,
-		},
-		.n = {
-			.reg_off = HHI_HDMI_PLL_CNTL0,
-			.shift   = 10,
-			.width   = 5,
-		},
-		.frac = {
-			.reg_off = HHI_HDMI_PLL_CNTL1,
-			.shift   = 0,
-			.width   = 16,
-		},
-		.l = {
-			.reg_off = HHI_HDMI_PLL_CNTL0,
-			.shift   = 30,
-			.width   = 1,
-		},
-		.rst = {
-			.reg_off = HHI_HDMI_PLL_CNTL0,
-			.shift   = 29,
-			.width   = 1,
-		},
+static struct clk_regmap g12a_cpu_clk_axi_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.shift = 9,
+		.width = 3,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "hdmi_pll_dco",
-		.ops = &meson_clk_pll_ro_ops,
+		.name = "cpu_clk_axi_div",
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xtal",
+			.name = "cpu_clk",
+			.index = -1,
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_cpu_clk_axi = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.bit_idx = 18,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpu_clk_axi",
+		.ops = &clk_regmap_gate_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cpu_clk_axi_div.hw
 		},
 		.num_parents = 1,
 		/*
-		 * Display directly handle hdmi pll registers ATM, we need
-		 * NOCACHE to keep our view of the clock as accurate as possible
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
 		 */
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
-static struct clk_regmap g12a_hdmi_pll_od = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL0,
-		.shift = 16,
-		.width = 2,
+static struct clk_regmap g12a_cpu_clk_trace_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.shift = 20,
+		.width = 3,
 		.flags = CLK_DIVIDER_POWER_OF_TWO,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "hdmi_pll_od",
+		.name = "cpu_clk_trace_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_hdmi_pll_dco.hw
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
 		},
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap g12a_hdmi_pll_od2 = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL0,
-		.shift = 18,
-		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+static struct clk_regmap g12a_cpu_clk_trace = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPU_CLK_CNTL1,
+		.bit_idx = 23,
 	},
-	.hw.init = &(struct clk_init_data){
-		.name = "hdmi_pll_od2",
-		.ops = &clk_regmap_divider_ro_ops,
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpu_clk_trace",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_hdmi_pll_od.hw
+			&g12a_cpu_clk_trace_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_regmap g12a_hdmi_pll = {
-	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL0,
-		.shift = 20,
-		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
-	},
+static struct clk_fixed_factor g12b_cpub_clk_div2 = {
+	.mult = 1,
+	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "hdmi_pll",
-		.ops = &clk_regmap_divider_ro_ops,
+		.name = "cpub_clk_div2",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_hdmi_pll_od2.hw
+			&g12b_cpub_clk.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_fixed_factor g12a_fclk_div4_div = {
+static struct clk_fixed_factor g12b_cpub_clk_div3 = {
 	.mult = 1,
-	.div = 4,
+	.div = 3,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div4_div",
+		.name = "cpub_clk_div3",
 		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_cpub_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_fclk_div4 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 21,
-	},
+static struct clk_fixed_factor g12b_cpub_clk_div4 = {
+	.mult = 1,
+	.div = 4,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div4",
-		.ops = &clk_regmap_gate_ops,
+		.name = "cpub_clk_div4",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fclk_div4_div.hw
+			&g12b_cpub_clk.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor g12a_fclk_div5_div = {
+static struct clk_fixed_factor g12b_cpub_clk_div5 = {
 	.mult = 1,
 	.div = 5,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div5_div",
+		.name = "cpub_clk_div5",
 		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_cpub_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_fclk_div5 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 22,
-	},
+static struct clk_fixed_factor g12b_cpub_clk_div6 = {
+	.mult = 1,
+	.div = 6,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div5",
-		.ops = &clk_regmap_gate_ops,
+		.name = "cpub_clk_div6",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fclk_div5_div.hw
+			&g12b_cpub_clk.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor g12a_fclk_div7_div = {
+static struct clk_fixed_factor g12b_cpub_clk_div7 = {
 	.mult = 1,
 	.div = 7,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div7_div",
+		.name = "cpub_clk_div7",
 		.ops = &clk_fixed_factor_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12b_cpub_clk.hw
+		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap g12a_fclk_div7 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 23,
-	},
+static struct clk_fixed_factor g12b_cpub_clk_div8 = {
+	.mult = 1,
+	.div = 8,
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div7",
-		.ops = &clk_regmap_gate_ops,
+		.name = "cpub_clk_div8",
+		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fclk_div7_div.hw
+			&g12b_cpub_clk.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_fixed_factor g12a_fclk_div2p5_div = {
-	.mult = 1,
-	.div = 5,
+static u32 g12b_cpub_clk_if_parents_val_table[] = { 1, 2, 3, 4, 5, 6, 7 };
+static const struct clk_hw *g12b_cpub_clk_if_parents[] = {
+	&g12b_cpub_clk_div2.hw,
+	&g12b_cpub_clk_div3.hw,
+	&g12b_cpub_clk_div4.hw,
+	&g12b_cpub_clk_div5.hw,
+	&g12b_cpub_clk_div6.hw,
+	&g12b_cpub_clk_div7.hw,
+	&g12b_cpub_clk_div8.hw,
+};
+
+static struct clk_regmap g12b_cpub_clk_apb_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.mask = 7,
+		.shift = 3,
+		.table = g12b_cpub_clk_if_parents_val_table,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div2p5_div",
-		.ops = &clk_fixed_factor_ops,
+		.name = "cpub_clk_apb_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = g12b_cpub_clk_if_parents,
+		.num_parents = ARRAY_SIZE(g12b_cpub_clk_if_parents),
+	},
+};
+
+static struct clk_regmap g12b_cpub_clk_apb = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.bit_idx = 16,
+		.flags = CLK_GATE_SET_TO_DISABLE,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpub_clk_apb",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fixed_pll_dco.hw
+			&g12b_cpub_clk_apb_sel.hw
 		},
 		.num_parents = 1,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_regmap g12a_fclk_div2p5 = {
-	.data = &(struct clk_regmap_gate_data){
-		.offset = HHI_FIX_PLL_CNTL1,
-		.bit_idx = 25,
+static struct clk_regmap g12b_cpub_clk_atb_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.mask = 7,
+		.shift = 6,
+		.table = g12b_cpub_clk_if_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "fclk_div2p5",
-		.ops = &clk_regmap_gate_ops,
+		.name = "cpub_clk_atb_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = g12b_cpub_clk_if_parents,
+		.num_parents = ARRAY_SIZE(g12b_cpub_clk_if_parents),
+	},
+};
+
+static struct clk_regmap g12b_cpub_clk_atb = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.bit_idx = 17,
+		.flags = CLK_GATE_SET_TO_DISABLE,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpub_clk_atb",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fclk_div2p5_div.hw
+			&g12b_cpub_clk_atb_sel.hw
 		},
 		.num_parents = 1,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_fixed_factor g12a_mpll_50m_div = {
-	.mult = 1,
-	.div = 80,
+static struct clk_regmap g12b_cpub_clk_axi_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.mask = 7,
+		.shift = 9,
+		.table = g12b_cpub_clk_if_parents_val_table,
+	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpll_50m_div",
-		.ops = &clk_fixed_factor_ops,
+		.name = "cpub_clk_axi_sel",
+		.ops = &clk_regmap_mux_ro_ops,
+		.parent_hws = g12b_cpub_clk_if_parents,
+		.num_parents = ARRAY_SIZE(g12b_cpub_clk_if_parents),
+	},
+};
+
+static struct clk_regmap g12b_cpub_clk_axi = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.bit_idx = 18,
+		.flags = CLK_GATE_SET_TO_DISABLE,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpub_clk_axi",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fixed_pll_dco.hw
+			&g12b_cpub_clk_axi_sel.hw
 		},
 		.num_parents = 1,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
-static struct clk_regmap g12a_mpll_50m = {
+static struct clk_regmap g12b_cpub_clk_trace_sel = {
 	.data = &(struct clk_regmap_mux_data){
-		.offset = HHI_FIX_PLL_CNTL3,
-		.mask = 0x1,
-		.shift = 5,
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.mask = 7,
+		.shift = 20,
+		.table = g12b_cpub_clk_if_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpll_50m",
+		.name = "cpub_clk_trace_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .hw = &g12a_mpll_50m_div.hw },
-		},
-		.num_parents = 2,
+		.parent_hws = g12b_cpub_clk_if_parents,
+		.num_parents = ARRAY_SIZE(g12b_cpub_clk_if_parents),
 	},
 };
 
-static struct clk_fixed_factor g12a_mpll_prediv = {
-	.mult = 1,
-	.div = 2,
-	.hw.init = &(struct clk_init_data){
-		.name = "mpll_prediv",
-		.ops = &clk_fixed_factor_ops,
+static struct clk_regmap g12b_cpub_clk_trace = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_SYS_CPUB_CLK_CNTL1,
+		.bit_idx = 23,
+		.flags = CLK_GATE_SET_TO_DISABLE,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cpub_clk_trace",
+		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_fixed_pll_dco.hw
+			&g12b_cpub_clk_trace_sel.hw
 		},
 		.num_parents = 1,
+		/*
+		 * This clock is set by the ROM monitor code,
+		 * Linux should not change it at runtime
+		 */
 	},
 };
 
@@ -2530,8 +2507,9 @@ static struct clk_regmap g12a_mpll3 = {
 	},
 };
 
-static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
-static const struct clk_parent_data clk81_parent_data[] = {
+/* clk81 is often referred as "mpeg_clk" */
+static u32 g12a_clk81_parents_val_table[] = { 0, 2, 3, 4, 5, 6, 7 };
+static const struct clk_parent_data g12a_clk81_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_fclk_div7.hw },
 	{ .hw = &g12a_mpll1.hw },
@@ -2541,32 +2519,32 @@ static const struct clk_parent_data clk81_parent_data[] = {
 	{ .hw = &g12a_fclk_div5.hw },
 };
 
-static struct clk_regmap g12a_mpeg_clk_sel = {
+static struct clk_regmap g12a_clk81_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.mask = 0x7,
 		.shift = 12,
-		.table = mux_table_clk81,
+		.table = g12a_clk81_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_sel",
+		.name = "clk81_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = clk81_parent_data,
-		.num_parents = ARRAY_SIZE(clk81_parent_data),
+		.parent_data = g12a_clk81_parents,
+		.num_parents = ARRAY_SIZE(g12a_clk81_parents),
 	},
 };
 
-static struct clk_regmap g12a_mpeg_clk_div = {
+static struct clk_regmap g12a_clk81_div = {
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
-			&g12a_mpeg_clk_sel.hw
+			&g12a_clk81_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -2582,14 +2560,14 @@ static struct clk_regmap g12a_clk81 = {
 		.name = "clk81",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_mpeg_clk_div.hw
+			&g12a_clk81_div.hw
 		},
 		.num_parents = 1,
 		.flags = (CLK_SET_RATE_PARENT | CLK_IS_CRITICAL),
 	},
 };
 
-static const struct clk_parent_data g12a_sd_emmc_clk0_parent_data[] = {
+static const struct clk_parent_data g12a_sd_emmc_clk0_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div3.hw },
@@ -2613,8 +2591,8 @@ static struct clk_regmap g12a_sd_emmc_a_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_a_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12a_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(g12a_sd_emmc_clk0_parent_data),
+		.parent_data = g12a_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(g12a_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2662,8 +2640,8 @@ static struct clk_regmap g12a_sd_emmc_b_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12a_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(g12a_sd_emmc_clk0_parent_data),
+		.parent_data = g12a_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(g12a_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2711,8 +2689,8 @@ static struct clk_regmap g12a_sd_emmc_c_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12a_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(g12a_sd_emmc_clk0_parent_data),
+		.parent_data = g12a_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(g12a_sd_emmc_clk0_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2774,7 +2752,7 @@ static struct clk_regmap g12a_vid_pll_div = {
 	},
 };
 
-static const struct clk_hw *g12a_vid_pll_parent_hws[] = {
+static const struct clk_hw *g12a_vid_pll_parents[] = {
 	&g12a_vid_pll_div.hw,
 	&g12a_hdmi_pll.hw,
 };
@@ -2792,8 +2770,8 @@ static struct clk_regmap g12a_vid_pll_sel = {
 		 * bit 18 selects from 2 possible parents:
 		 * vid_pll_div or hdmi_pll
 		 */
-		.parent_hws = g12a_vid_pll_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vid_pll_parent_hws),
+		.parent_hws = g12a_vid_pll_parents,
+		.num_parents = ARRAY_SIZE(g12a_vid_pll_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -2816,7 +2794,7 @@ static struct clk_regmap g12a_vid_pll = {
 
 /* VPU Clock */
 
-static const struct clk_hw *g12a_vpu_parent_hws[] = {
+static const struct clk_hw *g12a_vpu_parents[] = {
 	&g12a_fclk_div3.hw,
 	&g12a_fclk_div4.hw,
 	&g12a_fclk_div5.hw,
@@ -2836,8 +2814,8 @@ static struct clk_regmap g12a_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vpu_parent_hws),
+		.parent_hws = g12a_vpu_parents,
+		.num_parents = ARRAY_SIZE(g12a_vpu_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -2880,8 +2858,8 @@ static struct clk_regmap g12a_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vpu_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vpu_parent_hws),
+		.parent_hws = g12a_vpu_parents,
+		.num_parents = ARRAY_SIZE(g12a_vpu_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -2939,7 +2917,7 @@ static struct clk_regmap g12a_vpu = {
 
 /* VDEC clocks */
 
-static const struct clk_hw *g12a_vdec_parent_hws[] = {
+static const struct clk_hw *g12a_vdec_parents[] = {
 	&g12a_fclk_div2p5.hw,
 	&g12a_fclk_div3.hw,
 	&g12a_fclk_div4.hw,
@@ -2959,8 +2937,8 @@ static struct clk_regmap g12a_vdec_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vdec_parent_hws),
+		.parent_hws = g12a_vdec_parents,
+		.num_parents = ARRAY_SIZE(g12a_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -3009,8 +2987,8 @@ static struct clk_regmap g12a_vdec_hevcf_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevcf_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vdec_parent_hws),
+		.parent_hws = g12a_vdec_parents,
+		.num_parents = ARRAY_SIZE(g12a_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -3059,8 +3037,8 @@ static struct clk_regmap g12a_vdec_hevc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vdec_parent_hws),
+		.parent_hws = g12a_vdec_parents,
+		.num_parents = ARRAY_SIZE(g12a_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -3101,7 +3079,7 @@ static struct clk_regmap g12a_vdec_hevc = {
 
 /* VAPB Clock */
 
-static const struct clk_hw *g12a_vapb_parent_hws[] = {
+static const struct clk_hw *g12a_vapb_parents[] = {
 	&g12a_fclk_div4.hw,
 	&g12a_fclk_div3.hw,
 	&g12a_fclk_div5.hw,
@@ -3121,8 +3099,8 @@ static struct clk_regmap g12a_vapb_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vapb_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vapb_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vapb_parent_hws),
+		.parent_hws = g12a_vapb_parents,
+		.num_parents = ARRAY_SIZE(g12a_vapb_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -3169,8 +3147,8 @@ static struct clk_regmap g12a_vapb_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vapb_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vapb_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vapb_parent_hws),
+		.parent_hws = g12a_vapb_parents,
+		.num_parents = ARRAY_SIZE(g12a_vapb_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -3244,7 +3222,7 @@ static struct clk_regmap g12a_vapb = {
 	},
 };
 
-static const struct clk_hw *g12a_vclk_parent_hws[] = {
+static const struct clk_hw *g12a_vclk_parents[] = {
 	&g12a_vid_pll.hw,
 	&g12a_gp0_pll.hw,
 	&g12a_hifi_pll.hw,
@@ -3264,8 +3242,8 @@ static struct clk_regmap g12a_vclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vclk_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
+		.parent_hws = g12a_vclk_parents,
+		.num_parents = ARRAY_SIZE(g12a_vclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -3279,8 +3257,8 @@ static struct clk_regmap g12a_vclk2_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_vclk_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
+		.parent_hws = g12a_vclk_parents,
+		.num_parents = ARRAY_SIZE(g12a_vclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -3643,8 +3621,8 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
 	},
 };
 
-static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *g12a_cts_parent_hws[] = {
+static u32 g12a_cts_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *g12a_cts_parents[] = {
 	&g12a_vclk_div1.hw,
 	&g12a_vclk_div2.hw,
 	&g12a_vclk_div4.hw,
@@ -3662,13 +3640,13 @@ static struct clk_regmap g12a_cts_enci_sel = {
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 28,
-		.table = mux_table_cts_sel,
+		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.parent_hws = g12a_cts_parents,
+		.num_parents = ARRAY_SIZE(g12a_cts_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -3678,13 +3656,13 @@ static struct clk_regmap g12a_cts_encp_sel = {
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 20,
-		.table = mux_table_cts_sel,
+		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.parent_hws = g12a_cts_parents,
+		.num_parents = ARRAY_SIZE(g12a_cts_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -3694,13 +3672,13 @@ static struct clk_regmap g12a_cts_encl_sel = {
 		.offset = HHI_VIID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 12,
-		.table = mux_table_cts_sel,
+		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.parent_hws = g12a_cts_parents,
+		.num_parents = ARRAY_SIZE(g12a_cts_parents),
 		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -3710,20 +3688,20 @@ static struct clk_regmap g12a_cts_vdac_sel = {
 		.offset = HHI_VIID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 28,
-		.table = mux_table_cts_sel,
+		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.parent_hws = g12a_cts_parents,
+		.num_parents = ARRAY_SIZE(g12a_cts_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
 
 /* TOFIX: add support for cts_tcon */
-static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *g12a_cts_hdmi_tx_parent_hws[] = {
+static u32 g12a_hdmi_tx_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *g12a_hdmi_tx_parents[] = {
 	&g12a_vclk_div1.hw,
 	&g12a_vclk_div2.hw,
 	&g12a_vclk_div4.hw,
@@ -3741,13 +3719,13 @@ static struct clk_regmap g12a_hdmi_tx_sel = {
 		.offset = HHI_HDMI_CLK_CNTL,
 		.mask = 0xf,
 		.shift = 16,
-		.table = mux_table_hdmi_tx_sel,
+		.table = g12a_hdmi_tx_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_cts_hdmi_tx_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_cts_hdmi_tx_parent_hws),
+		.parent_hws = g12a_hdmi_tx_parents,
+		.num_parents = ARRAY_SIZE(g12a_hdmi_tx_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -3834,7 +3812,7 @@ static struct clk_regmap g12a_hdmi_tx = {
 
 /* MIPI DSI Host Clocks */
 
-static const struct clk_hw *g12a_mipi_dsi_pxclk_parent_hws[] = {
+static const struct clk_hw *g12a_mipi_dsi_pxclk_parents[] = {
 	&g12a_vid_pll.hw,
 	&g12a_gp0_pll.hw,
 	&g12a_hifi_pll.hw,
@@ -3855,8 +3833,8 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mipi_dsi_pxclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
-		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
+		.parent_hws = g12a_mipi_dsi_pxclk_parents,
+		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 	},
 };
@@ -3907,7 +3885,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk = {
 
 /* MIPI ISP Clocks */
 
-static const struct clk_parent_data g12b_mipi_isp_parent_data[] = {
+static const struct clk_parent_data g12b_mipi_isp_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_gp0_pll.hw },
 	{ .hw = &g12a_hifi_pll.hw },
@@ -3927,8 +3905,8 @@ static struct clk_regmap g12b_mipi_isp_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mipi_isp_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12b_mipi_isp_parent_data,
-		.num_parents = ARRAY_SIZE(g12b_mipi_isp_parent_data),
+		.parent_data = g12b_mipi_isp_parents,
+		.num_parents = ARRAY_SIZE(g12b_mipi_isp_parents),
 	},
 };
 
@@ -3967,7 +3945,7 @@ static struct clk_regmap g12b_mipi_isp = {
 
 /* HDMI Clocks */
 
-static const struct clk_parent_data g12a_hdmi_parent_data[] = {
+static const struct clk_parent_data g12a_hdmi_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
@@ -3984,8 +3962,8 @@ static struct clk_regmap g12a_hdmi_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12a_hdmi_parent_data,
-		.num_parents = ARRAY_SIZE(g12a_hdmi_parent_data),
+		.parent_data = g12a_hdmi_parents,
+		.num_parents = ARRAY_SIZE(g12a_hdmi_parents),
 		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -4025,7 +4003,7 @@ static struct clk_regmap g12a_hdmi = {
  * mux because it does top-to-bottom updates the each clock tree and
  * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
  */
-static const struct clk_parent_data g12a_mali_0_1_parent_data[] = {
+static const struct clk_parent_data g12a_mali_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_gp0_pll.hw },
 	{ .hw = &g12a_hifi_pll.hw },
@@ -4045,8 +4023,8 @@ static struct clk_regmap g12a_mali_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12a_mali_0_1_parent_data,
-		.num_parents = 8,
+		.parent_data = g12a_mali_parents,
+		.num_parents = ARRAY_SIZE(g12a_mali_parents),
 		/*
 		 * Don't request the parent to change the rate because
 		 * all GPU frequencies can be derived from the fclk_*
@@ -4099,8 +4077,8 @@ static struct clk_regmap g12a_mali_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = g12a_mali_0_1_parent_data,
-		.num_parents = 8,
+		.parent_data = g12a_mali_parents,
+		.num_parents = ARRAY_SIZE(g12a_mali_parents),
 		/*
 		 * Don't request the parent to change the rate because
 		 * all GPU frequencies can be derived from the fclk_*
@@ -4144,11 +4122,6 @@ static struct clk_regmap g12a_mali_1 = {
 	},
 };
 
-static const struct clk_hw *g12a_mali_parent_hws[] = {
-	&g12a_mali_0.hw,
-	&g12a_mali_1.hw,
-};
-
 static struct clk_regmap g12a_mali = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MALI_CLK_CNTL,
@@ -4158,7 +4131,10 @@ static struct clk_regmap g12a_mali = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = g12a_mali_parent_hws,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_mali_0.hw,
+			&g12a_mali_1.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -4197,7 +4173,7 @@ static struct clk_regmap g12a_ts = {
 
 /* SPICC SCLK source clock */
 
-static const struct clk_parent_data spicc_sclk_parent_data[] = {
+static const struct clk_parent_data g12a_spicc_sclk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
@@ -4216,8 +4192,8 @@ static struct clk_regmap g12a_spicc0_sclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "spicc0_sclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spicc_sclk_parent_data,
-		.num_parents = ARRAY_SIZE(spicc_sclk_parent_data),
+		.parent_data = g12a_spicc_sclk_parents,
+		.num_parents = ARRAY_SIZE(g12a_spicc_sclk_parents),
 	},
 };
 
@@ -4263,8 +4239,8 @@ static struct clk_regmap g12a_spicc1_sclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "spicc1_sclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spicc_sclk_parent_data,
-		.num_parents = ARRAY_SIZE(spicc_sclk_parent_data),
+		.parent_data = g12a_spicc_sclk_parents,
+		.num_parents = ARRAY_SIZE(g12a_spicc_sclk_parents),
 	},
 };
 
@@ -4303,7 +4279,7 @@ static struct clk_regmap g12a_spicc1_sclk = {
 
 /* Neural Network Accelerator source clock */
 
-static const struct clk_parent_data nna_clk_parent_data[] = {
+static const struct clk_parent_data sm1_nna_clk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &g12a_gp0_pll.hw, },
 	{ .hw = &g12a_hifi_pll.hw, },
@@ -4323,8 +4299,8 @@ static struct clk_regmap sm1_nna_axi_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "nna_axi_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = nna_clk_parent_data,
-		.num_parents = ARRAY_SIZE(nna_clk_parent_data),
+		.parent_data = sm1_nna_clk_parents,
+		.num_parents = ARRAY_SIZE(sm1_nna_clk_parents),
 	},
 };
 
@@ -4370,8 +4346,8 @@ static struct clk_regmap sm1_nna_core_clk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "nna_core_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = nna_clk_parent_data,
-		.num_parents = ARRAY_SIZE(nna_clk_parent_data),
+		.parent_data = sm1_nna_clk_parents,
+		.num_parents = ARRAY_SIZE(sm1_nna_clk_parents),
 	},
 };
 
@@ -4408,89 +4384,89 @@ static struct clk_regmap sm1_nna_core_clk = {
 	},
 };
 
-#define MESON_GATE(_name, _reg, _bit) \
+#define G12A_PCLK(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &g12a_clk81.hw)
 
-#define MESON_GATE_RO(_name, _reg, _bit) \
+#define G12A_PCLK_RO(_name, _reg, _bit) \
 	MESON_PCLK_RO(_name, _reg, _bit, &g12a_clk81.hw)
 
 /* Everything Else (EE) domain gates */
-static MESON_GATE(g12a_ddr,			HHI_GCLK_MPEG0,	0);
-static MESON_GATE(g12a_dos,			HHI_GCLK_MPEG0,	1);
-static MESON_GATE(g12a_audio_locker,		HHI_GCLK_MPEG0,	2);
-static MESON_GATE(g12a_mipi_dsi_host,		HHI_GCLK_MPEG0,	3);
-static MESON_GATE(g12a_eth_phy,			HHI_GCLK_MPEG0,	4);
-static MESON_GATE(g12a_isa,			HHI_GCLK_MPEG0,	5);
-static MESON_GATE(g12a_pl301,			HHI_GCLK_MPEG0,	6);
-static MESON_GATE(g12a_periphs,			HHI_GCLK_MPEG0,	7);
-static MESON_GATE(g12a_spicc_0,			HHI_GCLK_MPEG0,	8);
-static MESON_GATE(g12a_i2c,			HHI_GCLK_MPEG0,	9);
-static MESON_GATE(g12a_sana,			HHI_GCLK_MPEG0,	10);
-static MESON_GATE(g12a_sd,			HHI_GCLK_MPEG0,	11);
-static MESON_GATE(g12a_rng0,			HHI_GCLK_MPEG0,	12);
-static MESON_GATE(g12a_uart0,			HHI_GCLK_MPEG0,	13);
-static MESON_GATE(g12a_spicc_1,			HHI_GCLK_MPEG0,	14);
-static MESON_GATE(g12a_hiu_reg,			HHI_GCLK_MPEG0,	19);
-static MESON_GATE(g12a_mipi_dsi_phy,		HHI_GCLK_MPEG0,	20);
-static MESON_GATE(g12a_assist_misc,		HHI_GCLK_MPEG0,	23);
-static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	24);
-static MESON_GATE(g12a_emmc_b,			HHI_GCLK_MPEG0,	25);
-static MESON_GATE(g12a_emmc_c,			HHI_GCLK_MPEG0,	26);
-static MESON_GATE(g12a_audio_codec,		HHI_GCLK_MPEG0,	28);
-
-static MESON_GATE(g12a_audio,			HHI_GCLK_MPEG1,	0);
-static MESON_GATE(g12a_eth_core,		HHI_GCLK_MPEG1,	3);
-static MESON_GATE(g12a_demux,			HHI_GCLK_MPEG1,	4);
-static MESON_GATE(g12a_audio_ififo,		HHI_GCLK_MPEG1,	11);
-static MESON_GATE(g12a_adc,			HHI_GCLK_MPEG1,	13);
-static MESON_GATE(g12a_uart1,			HHI_GCLK_MPEG1,	16);
-static MESON_GATE(g12a_g2d,			HHI_GCLK_MPEG1,	20);
-static MESON_GATE(g12a_reset,			HHI_GCLK_MPEG1,	23);
-static MESON_GATE(g12a_pcie_comb,		HHI_GCLK_MPEG1,	24);
-static MESON_GATE(g12a_parser,			HHI_GCLK_MPEG1,	25);
-static MESON_GATE(g12a_usb_general,		HHI_GCLK_MPEG1,	26);
-static MESON_GATE(g12a_pcie_phy,		HHI_GCLK_MPEG1,	27);
-static MESON_GATE(g12a_ahb_arb0,		HHI_GCLK_MPEG1,	29);
-
-static MESON_GATE(g12a_ahb_data_bus,		HHI_GCLK_MPEG2,	1);
-static MESON_GATE(g12a_ahb_ctrl_bus,		HHI_GCLK_MPEG2,	2);
-static MESON_GATE(g12a_htx_hdcp22,		HHI_GCLK_MPEG2,	3);
-static MESON_GATE(g12a_htx_pclk,		HHI_GCLK_MPEG2,	4);
-static MESON_GATE(g12a_bt656,			HHI_GCLK_MPEG2,	6);
-static MESON_GATE(g12a_usb1_to_ddr,		HHI_GCLK_MPEG2,	8);
-static MESON_GATE(g12b_mipi_isp_gate,		HHI_GCLK_MPEG2,	17);
-static MESON_GATE(g12a_mmc_pclk,		HHI_GCLK_MPEG2,	11);
-static MESON_GATE(g12a_uart2,			HHI_GCLK_MPEG2,	15);
-static MESON_GATE(g12a_vpu_intr,		HHI_GCLK_MPEG2,	25);
-static MESON_GATE(g12b_csi_phy1,		HHI_GCLK_MPEG2,	28);
-static MESON_GATE(g12b_csi_phy0,		HHI_GCLK_MPEG2,	29);
-static MESON_GATE(g12a_gic,			HHI_GCLK_MPEG2,	30);
-
-static MESON_GATE(g12a_vclk2_venci0,		HHI_GCLK_OTHER,	1);
-static MESON_GATE(g12a_vclk2_venci1,		HHI_GCLK_OTHER,	2);
-static MESON_GATE(g12a_vclk2_vencp0,		HHI_GCLK_OTHER,	3);
-static MESON_GATE(g12a_vclk2_vencp1,		HHI_GCLK_OTHER,	4);
-static MESON_GATE(g12a_vclk2_venct0,		HHI_GCLK_OTHER,	5);
-static MESON_GATE(g12a_vclk2_venct1,		HHI_GCLK_OTHER,	6);
-static MESON_GATE(g12a_vclk2_other,		HHI_GCLK_OTHER,	7);
-static MESON_GATE(g12a_vclk2_enci,		HHI_GCLK_OTHER,	8);
-static MESON_GATE(g12a_vclk2_encp,		HHI_GCLK_OTHER,	9);
-static MESON_GATE(g12a_dac_clk,			HHI_GCLK_OTHER,	10);
-static MESON_GATE(g12a_aoclk_gate,		HHI_GCLK_OTHER,	14);
-static MESON_GATE(g12a_iec958_gate,		HHI_GCLK_OTHER,	16);
-static MESON_GATE(g12a_enc480p,			HHI_GCLK_OTHER,	20);
-static MESON_GATE(g12a_rng1,			HHI_GCLK_OTHER,	21);
-static MESON_GATE(g12a_vclk2_enct,		HHI_GCLK_OTHER,	22);
-static MESON_GATE(g12a_vclk2_encl,		HHI_GCLK_OTHER,	23);
-static MESON_GATE(g12a_vclk2_venclmmc,		HHI_GCLK_OTHER,	24);
-static MESON_GATE(g12a_vclk2_vencl,		HHI_GCLK_OTHER,	25);
-static MESON_GATE(g12a_vclk2_other1,		HHI_GCLK_OTHER,	26);
-
-static MESON_GATE_RO(g12a_dma,			HHI_GCLK_OTHER2, 0);
-static MESON_GATE_RO(g12a_efuse,		HHI_GCLK_OTHER2, 1);
-static MESON_GATE_RO(g12a_rom_boot,		HHI_GCLK_OTHER2, 2);
-static MESON_GATE_RO(g12a_reset_sec,		HHI_GCLK_OTHER2, 3);
-static MESON_GATE_RO(g12a_sec_ahb_apb3,		HHI_GCLK_OTHER2, 4);
+static G12A_PCLK(g12a_ddr,			HHI_GCLK_MPEG0,	0);
+static G12A_PCLK(g12a_dos,			HHI_GCLK_MPEG0,	1);
+static G12A_PCLK(g12a_audio_locker,		HHI_GCLK_MPEG0,	2);
+static G12A_PCLK(g12a_mipi_dsi_host,		HHI_GCLK_MPEG0,	3);
+static G12A_PCLK(g12a_eth_phy,			HHI_GCLK_MPEG0,	4);
+static G12A_PCLK(g12a_isa,			HHI_GCLK_MPEG0,	5);
+static G12A_PCLK(g12a_pl301,			HHI_GCLK_MPEG0,	6);
+static G12A_PCLK(g12a_periphs,			HHI_GCLK_MPEG0,	7);
+static G12A_PCLK(g12a_spicc_0,			HHI_GCLK_MPEG0,	8);
+static G12A_PCLK(g12a_i2c,			HHI_GCLK_MPEG0,	9);
+static G12A_PCLK(g12a_sana,			HHI_GCLK_MPEG0,	10);
+static G12A_PCLK(g12a_sd,			HHI_GCLK_MPEG0,	11);
+static G12A_PCLK(g12a_rng0,			HHI_GCLK_MPEG0,	12);
+static G12A_PCLK(g12a_uart0,			HHI_GCLK_MPEG0,	13);
+static G12A_PCLK(g12a_spicc_1,			HHI_GCLK_MPEG0,	14);
+static G12A_PCLK(g12a_hiu_reg,			HHI_GCLK_MPEG0,	19);
+static G12A_PCLK(g12a_mipi_dsi_phy,		HHI_GCLK_MPEG0,	20);
+static G12A_PCLK(g12a_assist_misc,		HHI_GCLK_MPEG0,	23);
+static G12A_PCLK(g12a_emmc_a,			HHI_GCLK_MPEG0,	24);
+static G12A_PCLK(g12a_emmc_b,			HHI_GCLK_MPEG0,	25);
+static G12A_PCLK(g12a_emmc_c,			HHI_GCLK_MPEG0,	26);
+static G12A_PCLK(g12a_audio_codec,		HHI_GCLK_MPEG0,	28);
+
+static G12A_PCLK(g12a_audio,			HHI_GCLK_MPEG1,	0);
+static G12A_PCLK(g12a_eth_core,			HHI_GCLK_MPEG1,	3);
+static G12A_PCLK(g12a_demux,			HHI_GCLK_MPEG1,	4);
+static G12A_PCLK(g12a_audio_ififo,		HHI_GCLK_MPEG1,	11);
+static G12A_PCLK(g12a_adc,			HHI_GCLK_MPEG1,	13);
+static G12A_PCLK(g12a_uart1,			HHI_GCLK_MPEG1,	16);
+static G12A_PCLK(g12a_g2d,			HHI_GCLK_MPEG1,	20);
+static G12A_PCLK(g12a_reset,			HHI_GCLK_MPEG1,	23);
+static G12A_PCLK(g12a_pcie_comb,		HHI_GCLK_MPEG1,	24);
+static G12A_PCLK(g12a_parser,			HHI_GCLK_MPEG1,	25);
+static G12A_PCLK(g12a_usb_general,		HHI_GCLK_MPEG1,	26);
+static G12A_PCLK(g12a_pcie_phy,			HHI_GCLK_MPEG1,	27);
+static G12A_PCLK(g12a_ahb_arb0,			HHI_GCLK_MPEG1,	29);
+
+static G12A_PCLK(g12a_ahb_data_bus,		HHI_GCLK_MPEG2,	1);
+static G12A_PCLK(g12a_ahb_ctrl_bus,		HHI_GCLK_MPEG2,	2);
+static G12A_PCLK(g12a_htx_hdcp22,		HHI_GCLK_MPEG2,	3);
+static G12A_PCLK(g12a_htx_pclk,			HHI_GCLK_MPEG2,	4);
+static G12A_PCLK(g12a_bt656,			HHI_GCLK_MPEG2,	6);
+static G12A_PCLK(g12a_usb1_to_ddr,		HHI_GCLK_MPEG2,	8);
+static G12A_PCLK(g12b_mipi_isp_gate,		HHI_GCLK_MPEG2,	17);
+static G12A_PCLK(g12a_mmc_pclk,			HHI_GCLK_MPEG2,	11);
+static G12A_PCLK(g12a_uart2,			HHI_GCLK_MPEG2,	15);
+static G12A_PCLK(g12a_vpu_intr,			HHI_GCLK_MPEG2,	25);
+static G12A_PCLK(g12b_csi_phy1,			HHI_GCLK_MPEG2,	28);
+static G12A_PCLK(g12b_csi_phy0,			HHI_GCLK_MPEG2,	29);
+static G12A_PCLK(g12a_gic,			HHI_GCLK_MPEG2,	30);
+
+static G12A_PCLK(g12a_vclk2_venci0,		HHI_GCLK_OTHER,	1);
+static G12A_PCLK(g12a_vclk2_venci1,		HHI_GCLK_OTHER,	2);
+static G12A_PCLK(g12a_vclk2_vencp0,		HHI_GCLK_OTHER,	3);
+static G12A_PCLK(g12a_vclk2_vencp1,		HHI_GCLK_OTHER,	4);
+static G12A_PCLK(g12a_vclk2_venct0,		HHI_GCLK_OTHER,	5);
+static G12A_PCLK(g12a_vclk2_venct1,		HHI_GCLK_OTHER,	6);
+static G12A_PCLK(g12a_vclk2_other,		HHI_GCLK_OTHER,	7);
+static G12A_PCLK(g12a_vclk2_enci,		HHI_GCLK_OTHER,	8);
+static G12A_PCLK(g12a_vclk2_encp,		HHI_GCLK_OTHER,	9);
+static G12A_PCLK(g12a_dac_clk,			HHI_GCLK_OTHER,	10);
+static G12A_PCLK(g12a_aoclk_gate,		HHI_GCLK_OTHER,	14);
+static G12A_PCLK(g12a_iec958_gate,		HHI_GCLK_OTHER,	16);
+static G12A_PCLK(g12a_enc480p,			HHI_GCLK_OTHER,	20);
+static G12A_PCLK(g12a_rng1,			HHI_GCLK_OTHER,	21);
+static G12A_PCLK(g12a_vclk2_enct,		HHI_GCLK_OTHER,	22);
+static G12A_PCLK(g12a_vclk2_encl,		HHI_GCLK_OTHER,	23);
+static G12A_PCLK(g12a_vclk2_venclmmc,		HHI_GCLK_OTHER,	24);
+static G12A_PCLK(g12a_vclk2_vencl,		HHI_GCLK_OTHER,	25);
+static G12A_PCLK(g12a_vclk2_other1,		HHI_GCLK_OTHER,	26);
+
+static G12A_PCLK_RO(g12a_dma,			HHI_GCLK_OTHER2, 0);
+static G12A_PCLK_RO(g12a_efuse,			HHI_GCLK_OTHER2, 1);
+static G12A_PCLK_RO(g12a_rom_boot,		HHI_GCLK_OTHER2, 2);
+static G12A_PCLK_RO(g12a_reset_sec,		HHI_GCLK_OTHER2, 3);
+static G12A_PCLK_RO(g12a_sec_ahb_apb3,		HHI_GCLK_OTHER2, 4);
 
 /* Array of all clocks provided by this provider */
 static struct clk_hw *g12a_hw_clks[] = {
@@ -4503,8 +4479,8 @@ static struct clk_hw *g12a_hw_clks[] = {
 	[CLKID_FCLK_DIV7]		= &g12a_fclk_div7.hw,
 	[CLKID_FCLK_DIV2P5]		= &g12a_fclk_div2p5.hw,
 	[CLKID_GP0_PLL]			= &g12a_gp0_pll.hw,
-	[CLKID_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
+	[CLKID_MPEG_SEL]		= &g12a_clk81_sel.hw,
+	[CLKID_MPEG_DIV]		= &g12a_clk81_div.hw,
 	[CLKID_CLK81]			= &g12a_clk81.hw,
 	[CLKID_MPLL0]			= &g12a_mpll0.hw,
 	[CLKID_MPLL1]			= &g12a_mpll1.hw,
@@ -4676,12 +4652,12 @@ static struct clk_hw *g12a_hw_clks[] = {
 	[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
 	[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
 	[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
-	[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
-	[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
-	[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_postmux0.hw,
-	[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
-	[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
-	[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_postmux1.hw,
+	[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_dyn0_sel.hw,
+	[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_dyn0_div.hw,
+	[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_dyn0.hw,
+	[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_dyn1_sel.hw,
+	[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_dyn1_div.hw,
+	[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_dyn1.hw,
 	[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
 	[CLKID_CPU_CLK]			= &g12a_cpu_clk.hw,
 	[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
@@ -4730,8 +4706,8 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_FCLK_DIV7]		= &g12a_fclk_div7.hw,
 	[CLKID_FCLK_DIV2P5]		= &g12a_fclk_div2p5.hw,
 	[CLKID_GP0_PLL]			= &g12a_gp0_pll.hw,
-	[CLKID_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
+	[CLKID_MPEG_SEL]		= &g12a_clk81_sel.hw,
+	[CLKID_MPEG_DIV]		= &g12a_clk81_div.hw,
 	[CLKID_CLK81]			= &g12a_clk81.hw,
 	[CLKID_MPLL0]			= &g12a_mpll0.hw,
 	[CLKID_MPLL1]			= &g12a_mpll1.hw,
@@ -4903,12 +4879,12 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
 	[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
 	[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
-	[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
-	[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
-	[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_postmux0.hw,
-	[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
-	[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
-	[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_postmux1.hw,
+	[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_dyn0_sel.hw,
+	[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_dyn0_div.hw,
+	[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_dyn0.hw,
+	[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_dyn1_sel.hw,
+	[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_dyn1_div.hw,
+	[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_dyn1.hw,
 	[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
 	[CLKID_CPU_CLK]			= &g12b_cpu_clk.hw,
 	[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
@@ -4940,12 +4916,12 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_SYS1_PLL]		= &g12b_sys1_pll.hw,
 	[CLKID_SYS1_PLL_DIV16_EN]	= &g12b_sys1_pll_div16_en.hw,
 	[CLKID_SYS1_PLL_DIV16]		= &g12b_sys1_pll_div16.hw,
-	[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_premux0.hw,
-	[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_mux0_div.hw,
-	[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_postmux0.hw,
-	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_premux1.hw,
-	[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_mux1_div.hw,
-	[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_postmux1.hw,
+	[CLKID_CPUB_CLK_DYN0_SEL]	= &g12b_cpub_clk_dyn0_sel.hw,
+	[CLKID_CPUB_CLK_DYN0_DIV]	= &g12b_cpub_clk_dyn0_div.hw,
+	[CLKID_CPUB_CLK_DYN0]		= &g12b_cpub_clk_dyn0.hw,
+	[CLKID_CPUB_CLK_DYN1_SEL]	= &g12b_cpub_clk_dyn1.hw,
+	[CLKID_CPUB_CLK_DYN1_DIV]	= &g12b_cpub_clk_dyn1_div.hw,
+	[CLKID_CPUB_CLK_DYN1]		= &g12b_cpub_clk_dyn1.hw,
 	[CLKID_CPUB_CLK_DYN]		= &g12b_cpub_clk_dyn.hw,
 	[CLKID_CPUB_CLK]		= &g12b_cpub_clk.hw,
 	[CLKID_CPUB_CLK_DIV16_EN]	= &g12b_cpub_clk_div16_en.hw,
@@ -4998,8 +4974,8 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_FCLK_DIV7]		= &g12a_fclk_div7.hw,
 	[CLKID_FCLK_DIV2P5]		= &g12a_fclk_div2p5.hw,
 	[CLKID_GP0_PLL]			= &g12a_gp0_pll.hw,
-	[CLKID_MPEG_SEL]		= &g12a_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV]		= &g12a_mpeg_clk_div.hw,
+	[CLKID_MPEG_SEL]		= &g12a_clk81_sel.hw,
+	[CLKID_MPEG_DIV]		= &g12a_clk81_div.hw,
 	[CLKID_CLK81]			= &g12a_clk81.hw,
 	[CLKID_MPLL0]			= &g12a_mpll0.hw,
 	[CLKID_MPLL1]			= &g12a_mpll1.hw,
@@ -5171,12 +5147,12 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
 	[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
 	[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
-	[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
-	[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_mux0_div.hw,
-	[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_postmux0.hw,
-	[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_premux1.hw,
-	[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_mux1_div.hw,
-	[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_postmux1.hw,
+	[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_dyn0_sel.hw,
+	[CLKID_CPU_CLK_DYN0_DIV]	= &g12a_cpu_clk_dyn0_div.hw,
+	[CLKID_CPU_CLK_DYN0]		= &g12a_cpu_clk_dyn0.hw,
+	[CLKID_CPU_CLK_DYN1_SEL]	= &g12a_cpu_clk_dyn1_sel.hw,
+	[CLKID_CPU_CLK_DYN1_DIV]	= &g12a_cpu_clk_dyn1_div.hw,
+	[CLKID_CPU_CLK_DYN1]		= &g12a_cpu_clk_dyn1.hw,
 	[CLKID_CPU_CLK_DYN]		= &g12a_cpu_clk_dyn.hw,
 	[CLKID_CPU_CLK]			= &g12a_cpu_clk.hw,
 	[CLKID_CPU_CLK_DIV16_EN]	= &g12a_cpu_clk_div16_en.hw,
@@ -5206,12 +5182,12 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_TS]			= &g12a_ts.hw,
 	[CLKID_GP1_PLL_DCO]		= &sm1_gp1_pll_dco.hw,
 	[CLKID_GP1_PLL]			= &sm1_gp1_pll.hw,
-	[CLKID_DSU_CLK_DYN0_SEL]	= &sm1_dsu_clk_premux0.hw,
-	[CLKID_DSU_CLK_DYN0_DIV]	= &sm1_dsu_clk_premux1.hw,
-	[CLKID_DSU_CLK_DYN0]		= &sm1_dsu_clk_mux0_div.hw,
-	[CLKID_DSU_CLK_DYN1_SEL]	= &sm1_dsu_clk_postmux0.hw,
-	[CLKID_DSU_CLK_DYN1_DIV]	= &sm1_dsu_clk_mux1_div.hw,
-	[CLKID_DSU_CLK_DYN1]		= &sm1_dsu_clk_postmux1.hw,
+	[CLKID_DSU_CLK_DYN0_SEL]	= &sm1_dsu_clk_dyn0_sel.hw,
+	[CLKID_DSU_CLK_DYN0_DIV]	= &sm1_dsu_clk_dyn0_div.hw,
+	[CLKID_DSU_CLK_DYN0]		= &sm1_dsu_clk_dyn0.hw,
+	[CLKID_DSU_CLK_DYN1_SEL]	= &sm1_dsu_clk_dyn1_sel.hw,
+	[CLKID_DSU_CLK_DYN1_DIV]	= &sm1_dsu_clk_dyn1_div.hw,
+	[CLKID_DSU_CLK_DYN1]		= &sm1_dsu_clk_dyn1.hw,
 	[CLKID_DSU_CLK_DYN]		= &sm1_dsu_clk_dyn.hw,
 	[CLKID_DSU_CLK_FINAL]		= &sm1_dsu_final_clk.hw,
 	[CLKID_DSU_CLK]			= &sm1_dsu_clk.hw,
@@ -5241,8 +5217,7 @@ static const struct reg_sequence g12a_init_regs[] = {
 
 #define DVFS_CON_ID "dvfs"
 
-static int meson_g12a_dvfs_setup_common(struct device *dev,
-					struct clk_hw **hws)
+static int g12a_dvfs_setup_common(struct device *dev, struct clk_hw **hws)
 {
 	struct clk *notifier_clk;
 	struct clk_hw *xtal;
@@ -5251,13 +5226,13 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
 	xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);
 
 	/* Setup clock notifier for cpu_clk_postmux0 */
-	g12a_cpu_clk_postmux0_nb_data.xtal = xtal;
-	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_postmux0.hw,
+	g12a_cpu_clk_dyn0_nb_data.xtal = xtal;
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_dyn0.hw,
 					   DVFS_CON_ID);
 	ret = devm_clk_notifier_register(dev, notifier_clk,
-					 &g12a_cpu_clk_postmux0_nb_data.nb);
+					 &g12a_cpu_clk_dyn0_nb_data.nb);
 	if (ret) {
-		dev_err(dev, "failed to register the cpu_clk_postmux0 notifier\n");
+		dev_err(dev, "failed to register the cpu_clk_dyn0 notifier\n");
 		return ret;
 	}
 
@@ -5274,7 +5249,7 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
 	return 0;
 }
 
-static int meson_g12b_dvfs_setup(struct platform_device *pdev)
+static int g12b_dvfs_setup(struct platform_device *pdev)
 {
 	struct clk_hw **hws = g12b_hw_clks;
 	struct device *dev = &pdev->dev;
@@ -5282,7 +5257,7 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	struct clk_hw *xtal;
 	int ret;
 
-	ret = meson_g12a_dvfs_setup_common(dev, hws);
+	ret = g12a_dvfs_setup_common(dev, hws);
 	if (ret)
 		return ret;
 
@@ -5311,18 +5286,19 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	/* Add notifiers for the second CPU cluster */
 
 	/* Setup clock notifier for cpub_clk_postmux0 */
-	g12b_cpub_clk_postmux0_nb_data.xtal = xtal;
-	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_postmux0.hw,
+	g12b_cpub_clk_dyn0_nb_data.xtal = xtal;
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_dyn0.hw,
 					   DVFS_CON_ID);
 	ret = devm_clk_notifier_register(dev, notifier_clk,
-					 &g12b_cpub_clk_postmux0_nb_data.nb);
+					 &g12b_cpub_clk_dyn0_nb_data.nb);
 	if (ret) {
-		dev_err(dev, "failed to register the cpub_clk_postmux0 notifier\n");
+		dev_err(dev, "failed to register the cpub_clk_dyn0 notifier\n");
 		return ret;
 	}
 
 	/* Setup clock notifier for cpub_clk_dyn mux */
-	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_dyn.hw, "dvfs");
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_dyn.hw,
+					   DVFS_CON_ID);
 	ret = devm_clk_notifier_register(dev, notifier_clk,
 					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
@@ -5351,14 +5327,14 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	return 0;
 }
 
-static int meson_g12a_dvfs_setup(struct platform_device *pdev)
+static int g12a_dvfs_setup(struct platform_device *pdev)
 {
 	struct clk_hw **hws = g12a_hw_clks;
 	struct device *dev = &pdev->dev;
 	struct clk *notifier_clk;
 	int ret;
 
-	ret = meson_g12a_dvfs_setup_common(dev, hws);
+	ret = g12a_dvfs_setup_common(dev, hws);
 	if (ret)
 		return ret;
 
@@ -5383,15 +5359,15 @@ static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 	return 0;
 }
 
-struct meson_g12a_data {
+struct g12a_clkc_data {
 	const struct meson_eeclkc_data eeclkc_data;
 	int (*dvfs_setup)(struct platform_device *pdev);
 };
 
-static int meson_g12a_probe(struct platform_device *pdev)
+static int g12a_clkc_probe(struct platform_device *pdev)
 {
 	const struct meson_eeclkc_data *eeclkc_data;
-	const struct meson_g12a_data *g12a_data;
+	const struct g12a_clkc_data *g12a_data;
 	int ret;
 
 	eeclkc_data = of_device_get_match_data(&pdev->dev);
@@ -5402,7 +5378,7 @@ static int meson_g12a_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	g12a_data = container_of(eeclkc_data, struct meson_g12a_data,
+	g12a_data = container_of(eeclkc_data, struct g12a_clkc_data,
 				 eeclkc_data);
 
 	if (g12a_data->dvfs_setup)
@@ -5411,7 +5387,7 @@ static int meson_g12a_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct meson_g12a_data g12a_clkc_data = {
+static const struct g12a_clkc_data g12a_clkc_data = {
 	.eeclkc_data = {
 		.hw_clks = {
 			.hws = g12a_hw_clks,
@@ -5420,30 +5396,30 @@ static const struct meson_g12a_data g12a_clkc_data = {
 		.init_regs = g12a_init_regs,
 		.init_count = ARRAY_SIZE(g12a_init_regs),
 	},
-	.dvfs_setup = meson_g12a_dvfs_setup,
+	.dvfs_setup = g12a_dvfs_setup,
 };
 
-static const struct meson_g12a_data g12b_clkc_data = {
+static const struct g12a_clkc_data g12b_clkc_data = {
 	.eeclkc_data = {
 		.hw_clks = {
 			.hws = g12b_hw_clks,
 			.num = ARRAY_SIZE(g12b_hw_clks),
 		},
 	},
-	.dvfs_setup = meson_g12b_dvfs_setup,
+	.dvfs_setup = g12b_dvfs_setup,
 };
 
-static const struct meson_g12a_data sm1_clkc_data = {
+static const struct g12a_clkc_data sm1_clkc_data = {
 	.eeclkc_data = {
 		.hw_clks = {
 			.hws = sm1_hw_clks,
 			.num = ARRAY_SIZE(sm1_hw_clks),
 		},
 	},
-	.dvfs_setup = meson_g12a_dvfs_setup,
+	.dvfs_setup = g12a_dvfs_setup,
 };
 
-static const struct of_device_id clkc_match_table[] = {
+static const struct of_device_id g12a_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,g12a-clkc",
 		.data = &g12a_clkc_data.eeclkc_data
@@ -5458,16 +5434,16 @@ static const struct of_device_id clkc_match_table[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, clkc_match_table);
+MODULE_DEVICE_TABLE(of, g12a_clkc_match_table);
 
-static struct platform_driver g12a_driver = {
-	.probe		= meson_g12a_probe,
+static struct platform_driver g12a_clkc_driver = {
+	.probe		= g12a_clkc_probe,
 	.driver		= {
 		.name	= "g12a-clkc",
-		.of_match_table = clkc_match_table,
+		.of_match_table = g12a_clkc_match_table,
 	},
 };
-module_platform_driver(g12a_driver);
+module_platform_driver(g12a_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic G12/SM1 Main Clock Controller driver");
 MODULE_LICENSE("GPL");

-- 
2.47.2

