Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FD30E820
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470053; cv=none; b=LyzXx8FVfq5e3AxlyvA7N9fjRePm3AyDGjOnl2KmOVdj9fplF4zUZIu9VOz3Cw4voUtDkvT1d7ybZ50MBY0IGt+wDm3cuFnHjXPxHOA09q+gyrdbVI/PhdkKKAdKBVVc5+rP0m+CwGzYNcUZo21lNCbcxw1WzKMVFCTMcQUJApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470053; c=relaxed/simple;
	bh=Y0Vh8yhisCVzvwgb2JlHiaml11LpkOp0BxQ/myF3PT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqPWKa3tKDd56n+DmLsyztdkJNg4ghG6aXFeoqdUHkXB1esLImMaj2DRtYcrhMKc36LgXJPtI/pDWFcP81NA+VWqAgnwlQZBv7VwXa6DzlptdAVFqdf0kCjPOXVQFmpKIDy9dBd0zw+u65zuEA5PUfWWCjhPeYzxh57b513SCo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aaljJcy9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aaljJcy9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso15653425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470045; x=1752074845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjtuk+6/ukBTOIJtN1YWN2IujD8g9sXUqF09Oi41PpY=;
        b=aaljJcy9PeF1KSotvjoTg16fnOzIcg0aMrbCL7coKPYsgOeDCbFprl04RKcyvKIhtj
         JUPPwW/TNiqE7OwC8iaffaplCrnRyxkOPk8VVrFUVovaw5iB52mmqaB51l6Tk+HQHvgM
         LEWokX7h7rUs5ZP0pXCKDnHIn+5/S9CwgXXJp6W4sLII3Kjx5E6cLud8gxyBNtOfv1DR
         +5H4CXQtMbmDPHb60Rs1dZjyAUlhTgWRic6Laay7JAbb6HKNXUAwD4cEcRUF4VBcOd4z
         H1QV6GGMcg0GJnz4F0rIz/cETyedpHRX2GX3sT+96ruTCgB/0O7l50NZ2OoJcR7gXnM6
         h2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470045; x=1752074845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjtuk+6/ukBTOIJtN1YWN2IujD8g9sXUqF09Oi41PpY=;
        b=p9/Tq6XbCXgnZW6fuOIfzMdSVqdt/yoIJjpdd9zakJFKx5564kA4tEmLVp/D4Pj7Hp
         /fH4Ke3tF+bKcUeMktAP8N0oxw5VQ+DE7K10P5h89apiA6XGiu8OGZlGec2FiwugW0dy
         yRkR0mWVmZK3H/oLInuIar2yMq9uygOBNN1atess781K2mYrKqkJkbXDyR+sQQmE5v8j
         5sr1wV1uv+B7yM4p9l9BTW6IQ6cl66IunN3KOUq1sFoHEJyvFkjB5oh4JCFdze8XJwWJ
         FqHyLZKTFD8SS56JesY5B+gUmHuhKhITy2wKqs+7SbR5/PXaA/4IeqRdRENf5w16h1nf
         T7ng==
X-Forwarded-Encrypted: i=1; AJvYcCVn4WZIeNEGvI6wt+40CDuY5aWbyz63Vb98F/mlWW86ktbNh3S/GBTKLunahSaXoyTXM9u1JhBqDGpIWBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3Mbd6f3UUwugqFsOFM9fONlFSMzp/ZQsVcEFxSzPGXByyPge
	lzUYOQlA8OJPCJ59bGHPfmnY0kn768+CM6elvJuVhicy4Hx/DqWk9a2A7vbO4jk5aHk=
X-Gm-Gg: ASbGncvv/XyqwJlut2HHImImB59Lde3TgfQBOyblABEtYFLw6T+qFWwDRByvpkdrP4E
	5kby28NC88LAaXm4A3UGxG6bGfaQhsueiS+EXAne4voHSiizl0M3XnfD6cSsHTVolNY3knMfo8v
	3WjzrXs9AdF/yXEMKDMlVew5Uz1fXNJB8+QKJund/Li/H5s/0SmjCXcGZEBKJd31v8/8qlqg9Nk
	6fPdK9xs/whpz3E3uZPZQAU34zTRfXP/az5xnl08ROp4DLoeM3hE89WrAIdu1m6JbcQNBob177E
	oQnu9MBQEPDzdOh4aMQO8XEJCAY5dFh9dQaB/3u+DT7axVNA13aHhhekBkm/IOVah1xVlC1KVAe
	fmB4G8uVFOps=
X-Google-Smtp-Source: AGHT+IGRMTWc9HAIVlzpJSb8MiLOdNrQm1S36jEvZK3H9TEbr4TDLM0JtJzkX8qheNpFVdaC4mKpHw==
X-Received: by 2002:a05:6000:1aca:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3b2019b7e75mr2661567f8f.34.1751470044722;
        Wed, 02 Jul 2025 08:27:24 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:09 +0200
Subject: [PATCH 11/26] clk: amlogic: meson8b: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-11-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=58930; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Y0Vh8yhisCVzvwgb2JlHiaml11LpkOp0BxQ/myF3PT8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/AvfqjEcsFc6c16mxhTkoUOA5RxF7/LV+fB
 g3p+9qikm2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPwAAKCRDm/A8cN/La
 hTJUEACtSB4bPbGcc3uz+NHA3ghQdMbLrNmjDI63IgygJEMapBOSupthz5bPBDupzSuejS2rsyJ
 NkMVyF779GZyrMDpzRZW/61fmTpWRg4n1aUJzEcIUB0voNi+6F3eHOhFL4KNTLxdBbM71zngmT5
 Oiv51Cyasvha+mFQlDhI2ReDZOwenigyTI+IYaXWSLqwat9WSsRndf4TRBlu9x6dxFxYO/CEWI2
 UgJB0IpoX72UTq5JznRZWoZzOqsKdn9tDXiWpzQgUm9p86B+bkmJ46NxlTMMgULg0zJKBjwGMqU
 /6SlxKdGL8HuX6noX4NtB3bhXWl0ek59+u2ZWy6mq6/3PdJiPivjWh8n4HRCNhAc4c4BCOSAifq
 ow2lzHwvGBzPkicxZTFQ7/wi7zEmHllZcEy/BzlID7RS4nME3dGAfQfUNU/w3x0MdTjhcwHe4ET
 khBmoHjkZaX+CKx6bQ5xCgSY248UsQ4D1iUo7F37HsLiFNvn8NImgJursAqDaZ33i1c/ctnmVR2
 QTN62svlDA7lpHCOkkiluoh7k2XwaurCDFyrodGF+410lMbnjMONT/A85wNZvbDvYZ/DOH6P8Bd
 n3nmkwwbKOhfsX0+CikPiHpv7Hd2CcveBmeSmAQc+G++x/baqdE7FifsmViRKpy4jUBTjH1upM0
 Ht1eq7wc25oXBqQ==
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
 drivers/clk/meson/meson8b.c | 720 +++++++++++++++++++++-----------------------
 1 file changed, 340 insertions(+), 380 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 2065383266145b76f86e7f945cbf552a24ae881e..446e57d45d8deeab9516a923ddddcba7fa274203 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -214,7 +214,7 @@ static const struct reg_sequence meson8b_hdmi_pll_init_regs[] = {
 	{ .reg = HHI_VID2_PLL_CNTL2,	.def = 0x0430a800 },
 };
 
-static const struct pll_params_table hdmi_pll_params_table[] = {
+static const struct pll_params_table meson8b_hdmi_pll_params_table[] = {
 	PLL_PARAMS(40, 1),
 	PLL_PARAMS(42, 1),
 	PLL_PARAMS(44, 1),
@@ -267,7 +267,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
 			.shift   = 29,
 			.width   = 1,
 		},
-		.table = hdmi_pll_params_table,
+		.table = meson8b_hdmi_pll_params_table,
 		.init_regs = meson8b_hdmi_pll_init_regs,
 		.init_count = ARRAY_SIZE(meson8b_hdmi_pll_init_regs),
 	},
@@ -670,16 +670,17 @@ static struct clk_regmap meson8b_mpll2 = {
 	},
 };
 
-static u32 mux_table_clk81[]	= { 6, 5, 7 };
-static struct clk_regmap meson8b_mpeg_clk_sel = {
+/* clk81 is often referred as "mpeg_clk" */
+static u32 meson8b_clk81_parents_val_table[] = { 6, 5, 7 };
+static struct clk_regmap meson8b_clk81_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.mask = 0x7,
 		.shift = 12,
-		.table = mux_table_clk81,
+		.table = meson8b_clk81_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_sel",
+		.name = "clk81_sel",
 		.ops = &clk_regmap_mux_ro_ops,
 		/*
 		 * FIXME bits 14:12 selects from 8 possible parents:
@@ -695,17 +696,17 @@ static struct clk_regmap meson8b_mpeg_clk_sel = {
 	},
 };
 
-static struct clk_regmap meson8b_mpeg_clk_div = {
+static struct clk_regmap meson8b_clk81_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_MPEG_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mpeg_clk_div",
+		.name = "clk81_div",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_mpeg_clk_sel.hw
+			&meson8b_clk81_sel.hw
 		},
 		.num_parents = 1,
 	},
@@ -720,7 +721,7 @@ static struct clk_regmap meson8b_clk81 = {
 		.name = "clk81",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_mpeg_clk_div.hw
+			&meson8b_clk81_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_IS_CRITICAL,
@@ -774,7 +775,7 @@ static struct clk_fixed_factor meson8b_cpu_in_div3 = {
 	},
 };
 
-static const struct clk_div_table cpu_scale_table[] = {
+static const struct clk_div_table meson8b_cpu_scale_div_table[] = {
 	{ .val = 1, .div = 4 },
 	{ .val = 2, .div = 6 },
 	{ .val = 3, .div = 8 },
@@ -791,7 +792,7 @@ static struct clk_regmap meson8b_cpu_scale_div = {
 		.offset =  HHI_SYS_CPU_CLK_CNTL1,
 		.shift = 20,
 		.width = 10,
-		.table = cpu_scale_table,
+		.table = meson8b_cpu_scale_div_table,
 		.flags = CLK_DIVIDER_ALLOW_ZERO,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -805,13 +806,13 @@ static struct clk_regmap meson8b_cpu_scale_div = {
 	},
 };
 
-static u32 mux_table_cpu_scale_out_sel[] = { 0, 1, 3 };
+static u32 meson8b_cpu_scale_out_parents_val_table[] = { 0, 1, 3 };
 static struct clk_regmap meson8b_cpu_scale_out_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x3,
 		.shift = 2,
-		.table = mux_table_cpu_scale_out_sel,
+		.table = meson8b_cpu_scale_out_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_scale_out_sel",
@@ -893,13 +894,13 @@ static struct clk_regmap meson8b_nand_clk_div = {
 	},
 };
 
-static struct clk_regmap meson8b_nand_clk_gate = {
+static struct clk_regmap meson8b_nand_clk = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_NAND_CLK_CNTL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "nand_clk_gate",
+		.name = "nand_clk",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_nand_clk_div.hw
@@ -1000,160 +1001,137 @@ static struct clk_fixed_factor meson8b_cpu_clk_div8 = {
 	},
 };
 
-static u32 mux_table_apb[] = { 1, 2, 3, 4, 5, 6, 7 };
-static struct clk_regmap meson8b_apb_clk_sel = {
+static u32 meson8b_cpu_if_parents_val_table[] = { 1, 2, 3, 4, 5, 6, 7 };
+static const struct clk_hw *meson8b_cpu_if_parents[] = {
+	&meson8b_cpu_clk_div2.hw,
+	&meson8b_cpu_clk_div3.hw,
+	&meson8b_cpu_clk_div4.hw,
+	&meson8b_cpu_clk_div5.hw,
+	&meson8b_cpu_clk_div6.hw,
+	&meson8b_cpu_clk_div7.hw,
+	&meson8b_cpu_clk_div8.hw,
+};
+
+static struct clk_regmap meson8b_apb_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.mask = 0x7,
 		.shift = 3,
-		.table = mux_table_apb,
+		.table = meson8b_cpu_if_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "apb_clk_sel",
+		.name = "apb_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_cpu_clk_div2.hw,
-			&meson8b_cpu_clk_div3.hw,
-			&meson8b_cpu_clk_div4.hw,
-			&meson8b_cpu_clk_div5.hw,
-			&meson8b_cpu_clk_div6.hw,
-			&meson8b_cpu_clk_div7.hw,
-			&meson8b_cpu_clk_div8.hw,
-		},
-		.num_parents = 7,
+		.parent_hws = meson8b_cpu_if_parents,
+		.num_parents = ARRAY_SIZE(meson8b_cpu_if_parents),
 	},
 };
 
-static struct clk_regmap meson8b_apb_clk_gate = {
+static struct clk_regmap meson8b_apb = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.bit_idx = 16,
 		.flags = CLK_GATE_SET_TO_DISABLE,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "apb_clk_dis",
+		.name = "apb",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_apb_clk_sel.hw
+			&meson8b_apb_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap meson8b_periph_clk_sel = {
+static struct clk_regmap meson8b_periph_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.mask = 0x7,
 		.shift = 6,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "periph_clk_sel",
+		.name = "periph_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_cpu_clk_div2.hw,
-			&meson8b_cpu_clk_div3.hw,
-			&meson8b_cpu_clk_div4.hw,
-			&meson8b_cpu_clk_div5.hw,
-			&meson8b_cpu_clk_div6.hw,
-			&meson8b_cpu_clk_div7.hw,
-			&meson8b_cpu_clk_div8.hw,
-		},
-		.num_parents = 7,
+		.parent_hws = meson8b_cpu_if_parents,
+		.num_parents = ARRAY_SIZE(meson8b_cpu_if_parents),
 	},
 };
 
-static struct clk_regmap meson8b_periph_clk_gate = {
+static struct clk_regmap meson8b_periph = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.bit_idx = 17,
 		.flags = CLK_GATE_SET_TO_DISABLE,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "periph_clk_dis",
+		.name = "periph",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_periph_clk_sel.hw
+			&meson8b_periph_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static u32 mux_table_axi[] = { 1, 2, 3, 4, 5, 6, 7 };
-static struct clk_regmap meson8b_axi_clk_sel = {
+static struct clk_regmap meson8b_axi_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.mask = 0x7,
 		.shift = 9,
-		.table = mux_table_axi,
+		.table = meson8b_cpu_if_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "axi_clk_sel",
+		.name = "axi_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_cpu_clk_div2.hw,
-			&meson8b_cpu_clk_div3.hw,
-			&meson8b_cpu_clk_div4.hw,
-			&meson8b_cpu_clk_div5.hw,
-			&meson8b_cpu_clk_div6.hw,
-			&meson8b_cpu_clk_div7.hw,
-			&meson8b_cpu_clk_div8.hw,
-		},
-		.num_parents = 7,
+		.parent_hws = meson8b_cpu_if_parents,
+		.num_parents = ARRAY_SIZE(meson8b_cpu_if_parents),
 	},
 };
 
-static struct clk_regmap meson8b_axi_clk_gate = {
+static struct clk_regmap meson8b_axi = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.bit_idx = 18,
 		.flags = CLK_GATE_SET_TO_DISABLE,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "axi_clk_dis",
+		.name = "axi",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_axi_clk_sel.hw
+			&meson8b_axi_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap meson8b_l2_dram_clk_sel = {
+static struct clk_regmap meson8b_l2_dram_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.mask = 0x7,
 		.shift = 12,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "l2_dram_clk_sel",
+		.name = "l2_dram_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_cpu_clk_div2.hw,
-			&meson8b_cpu_clk_div3.hw,
-			&meson8b_cpu_clk_div4.hw,
-			&meson8b_cpu_clk_div5.hw,
-			&meson8b_cpu_clk_div6.hw,
-			&meson8b_cpu_clk_div7.hw,
-			&meson8b_cpu_clk_div8.hw,
-		},
-		.num_parents = 7,
+		.parent_hws = meson8b_cpu_if_parents,
+		.num_parents = ARRAY_SIZE(meson8b_cpu_if_parents),
 	},
 };
 
-static struct clk_regmap meson8b_l2_dram_clk_gate = {
+static struct clk_regmap meson8b_l2_dram = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.bit_idx = 19,
 		.flags = CLK_GATE_SET_TO_DISABLE,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "l2_dram_clk_dis",
+		.name = "l2_dram",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_l2_dram_clk_sel.hw
+			&meson8b_l2_dram_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1286,7 +1264,7 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
 	},
 };
 
-static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
+static const struct clk_hw *meson8b_vclk_parents[] = {
 	&meson8b_vid_pll_final_div.hw,
 	&meson8b_fclk_div4.hw,
 	&meson8b_fclk_div3.hw,
@@ -1305,8 +1283,8 @@ static struct clk_regmap meson8b_vclk_in_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_in_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
+		.parent_hws = meson8b_vclk_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_parents),
 		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
@@ -1343,13 +1321,13 @@ static struct clk_regmap meson8b_vclk_en = {
 	},
 };
 
-static struct clk_regmap meson8b_vclk_div1_gate = {
+static struct clk_regmap meson8b_vclk_div1 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 0,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div1_en",
+		.name = "vclk_div1",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_en.hw
@@ -1363,7 +1341,7 @@ static struct clk_fixed_factor meson8b_vclk_div2_div = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div2",
+		.name = "vclk_div2_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_en.hw
@@ -1373,13 +1351,13 @@ static struct clk_fixed_factor meson8b_vclk_div2_div = {
 	}
 };
 
-static struct clk_regmap meson8b_vclk_div2_div_gate = {
+static struct clk_regmap meson8b_vclk_div2 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 1,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div2_en",
+		.name = "vclk_div2",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div2_div.hw
@@ -1393,7 +1371,7 @@ static struct clk_fixed_factor meson8b_vclk_div4_div = {
 	.mult = 1,
 	.div = 4,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div4",
+		.name = "vclk_div4_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_en.hw
@@ -1403,13 +1381,13 @@ static struct clk_fixed_factor meson8b_vclk_div4_div = {
 	}
 };
 
-static struct clk_regmap meson8b_vclk_div4_div_gate = {
+static struct clk_regmap meson8b_vclk_div4 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 2,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div4_en",
+		.name = "vclk_div4",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div4_div.hw
@@ -1423,7 +1401,7 @@ static struct clk_fixed_factor meson8b_vclk_div6_div = {
 	.mult = 1,
 	.div = 6,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div6",
+		.name = "vclk_div6_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_en.hw
@@ -1433,13 +1411,13 @@ static struct clk_fixed_factor meson8b_vclk_div6_div = {
 	}
 };
 
-static struct clk_regmap meson8b_vclk_div6_div_gate = {
+static struct clk_regmap meson8b_vclk_div6 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 3,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div6_en",
+		.name = "vclk_div6",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div6_div.hw
@@ -1453,7 +1431,7 @@ static struct clk_fixed_factor meson8b_vclk_div12_div = {
 	.mult = 1,
 	.div = 12,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div12",
+		.name = "vclk_div12_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_en.hw
@@ -1463,13 +1441,13 @@ static struct clk_fixed_factor meson8b_vclk_div12_div = {
 	}
 };
 
-static struct clk_regmap meson8b_vclk_div12_div_gate = {
+static struct clk_regmap meson8b_vclk_div12 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
 		.bit_idx = 4,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk_div12_en",
+		.name = "vclk_div12",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk_div12_div.hw
@@ -1488,13 +1466,13 @@ static struct clk_regmap meson8b_vclk2_in_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_in_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
+		.parent_hws = meson8b_vclk_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_parents),
 		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-static struct clk_regmap meson8b_vclk2_clk_in_en = {
+static struct clk_regmap meson8b_vclk2_in_en = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 16,
@@ -1510,7 +1488,7 @@ static struct clk_regmap meson8b_vclk2_clk_in_en = {
 	},
 };
 
-static struct clk_regmap meson8b_vclk2_clk_en = {
+static struct clk_regmap meson8b_vclk2_en = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 19,
@@ -1519,23 +1497,23 @@ static struct clk_regmap meson8b_vclk2_clk_en = {
 		.name = "vclk2_en",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_in_en.hw
+			&meson8b_vclk2_in_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap meson8b_vclk2_div1_gate = {
+static struct clk_regmap meson8b_vclk2_div1 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 0,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div1_en",
+		.name = "vclk2_div1",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_en.hw
+			&meson8b_vclk2_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1546,23 +1524,23 @@ static struct clk_fixed_factor meson8b_vclk2_div2_div = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div2",
+		.name = "vclk2_div2_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_en.hw
+			&meson8b_vclk2_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
 };
 
-static struct clk_regmap meson8b_vclk2_div2_div_gate = {
+static struct clk_regmap meson8b_vclk2_div2 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 1,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div2_en",
+		.name = "vclk2_div2",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div2_div.hw
@@ -1576,23 +1554,23 @@ static struct clk_fixed_factor meson8b_vclk2_div4_div = {
 	.mult = 1,
 	.div = 4,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div4",
+		.name = "vclk2_div4_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_en.hw
+			&meson8b_vclk2_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
 };
 
-static struct clk_regmap meson8b_vclk2_div4_div_gate = {
+static struct clk_regmap meson8b_vclk2_div4 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 2,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div4_en",
+		.name = "vclk2_div4",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div4_div.hw
@@ -1606,23 +1584,23 @@ static struct clk_fixed_factor meson8b_vclk2_div6_div = {
 	.mult = 1,
 	.div = 6,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div6",
+		.name = "vclk2_div6_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_en.hw
+			&meson8b_vclk2_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
 };
 
-static struct clk_regmap meson8b_vclk2_div6_div_gate = {
+static struct clk_regmap meson8b_vclk2_div6 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 3,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div6_en",
+		.name = "vclk2_div6",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div6_div.hw
@@ -1636,23 +1614,23 @@ static struct clk_fixed_factor meson8b_vclk2_div12_div = {
 	.mult = 1,
 	.div = 12,
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div12",
+		.name = "vclk2_div12_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&meson8b_vclk2_clk_en.hw
+			&meson8b_vclk2_en.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	}
 };
 
-static struct clk_regmap meson8b_vclk2_div12_div_gate = {
+static struct clk_regmap meson8b_vclk2_div12 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_DIV,
 		.bit_idx = 4,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vclk2_div12_en",
+		.name = "vclk2_div12",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&meson8b_vclk2_div12_div.hw
@@ -1662,12 +1640,12 @@ static struct clk_regmap meson8b_vclk2_div12_div_gate = {
 	},
 };
 
-static const struct clk_hw *meson8b_vclk_enc_mux_parent_hws[] = {
-	&meson8b_vclk_div1_gate.hw,
-	&meson8b_vclk_div2_div_gate.hw,
-	&meson8b_vclk_div4_div_gate.hw,
-	&meson8b_vclk_div6_div_gate.hw,
-	&meson8b_vclk_div12_div_gate.hw,
+static const struct clk_hw *meson8b_vclk_enc_parents[] = {
+	&meson8b_vclk_div1.hw,
+	&meson8b_vclk_div2.hw,
+	&meson8b_vclk_div4.hw,
+	&meson8b_vclk_div6.hw,
+	&meson8b_vclk_div12.hw,
 };
 
 static struct clk_regmap meson8b_cts_enct_sel = {
@@ -1679,8 +1657,8 @@ static struct clk_regmap meson8b_cts_enct_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enct_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
+		.parent_hws = meson8b_vclk_enc_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1710,8 +1688,8 @@ static struct clk_regmap meson8b_cts_encp_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
+		.parent_hws = meson8b_vclk_enc_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1741,8 +1719,8 @@ static struct clk_regmap meson8b_cts_enci_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
+		.parent_hws = meson8b_vclk_enc_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1772,8 +1750,8 @@ static struct clk_regmap meson8b_hdmi_tx_pixel_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_pixel_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk_enc_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_mux_parent_hws),
+		.parent_hws = meson8b_vclk_enc_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1794,14 +1772,6 @@ static struct clk_regmap meson8b_hdmi_tx_pixel = {
 	},
 };
 
-static const struct clk_hw *meson8b_vclk2_enc_mux_parent_hws[] = {
-	&meson8b_vclk2_div1_gate.hw,
-	&meson8b_vclk2_div2_div_gate.hw,
-	&meson8b_vclk2_div4_div_gate.hw,
-	&meson8b_vclk2_div6_div_gate.hw,
-	&meson8b_vclk2_div12_div_gate.hw,
-};
-
 static struct clk_regmap meson8b_cts_encl_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -1811,8 +1781,8 @@ static struct clk_regmap meson8b_cts_encl_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encl_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk2_enc_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parent_hws),
+		.parent_hws = meson8b_vclk_enc_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1842,8 +1812,8 @@ static struct clk_regmap meson8b_cts_vdac0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vclk2_enc_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vclk2_enc_mux_parent_hws),
+		.parent_hws = meson8b_vclk_enc_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vclk_enc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1926,7 +1896,8 @@ static struct clk_regmap meson8b_hdmi_sys = {
  * CLK_SET_RATE_GATE is set.
  * Meson8 only has mali_0 and no glitch-free mux.
  */
-static const struct clk_parent_data meson8b_mali_0_1_parent_data[] = {
+static u32 meson8b_mali_parents_val_table[] = { 0, 2, 3, 4, 5, 6, 7 };
+static const struct clk_parent_data meson8b_mali_parents[] = {
 	{ .fw_name = "xtal", .name = "xtal", .index = -1, },
 	{ .hw = &meson8b_mpll2.hw, },
 	{ .hw = &meson8b_mpll1.hw, },
@@ -1936,20 +1907,18 @@ static const struct clk_parent_data meson8b_mali_0_1_parent_data[] = {
 	{ .hw = &meson8b_fclk_div5.hw, },
 };
 
-static u32 meson8b_mali_0_1_mux_table[] = { 0, 2, 3, 4, 5, 6, 7 };
-
 static struct clk_regmap meson8b_mali_0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_MALI_CLK_CNTL,
 		.mask = 0x7,
 		.shift = 9,
-		.table = meson8b_mali_0_1_mux_table,
+		.table = meson8b_mali_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = meson8b_mali_0_1_parent_data,
-		.num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_data),
+		.parent_data = meson8b_mali_parents,
+		.num_parents = ARRAY_SIZE(meson8b_mali_parents),
 		/*
 		 * Don't propagate rate changes up because the only changeable
 		 * parents are mpll1 and mpll2 but we need those for audio and
@@ -1998,13 +1967,13 @@ static struct clk_regmap meson8b_mali_1_sel = {
 		.offset = HHI_MALI_CLK_CNTL,
 		.mask = 0x7,
 		.shift = 25,
-		.table = meson8b_mali_0_1_mux_table,
+		.table = meson8b_mali_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = meson8b_mali_0_1_parent_data,
-		.num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_data),
+		.parent_data = meson8b_mali_parents,
+		.num_parents = ARRAY_SIZE(meson8b_mali_parents),
 		/*
 		 * Don't propagate rate changes up because the only changeable
 		 * parents are mpll1 and mpll2 but we need those for audio and
@@ -2139,20 +2108,13 @@ static struct clk_regmap meson8m2_gp_pll = {
 	},
 };
 
-static const struct clk_hw *meson8b_vpu_0_1_parent_hws[] = {
+static const struct clk_hw *meson8b_vpu_parents[] = {
 	&meson8b_fclk_div4.hw,
 	&meson8b_fclk_div3.hw,
 	&meson8b_fclk_div5.hw,
 	&meson8b_fclk_div7.hw,
 };
 
-static const struct clk_hw *mmeson8m2_vpu_0_1_parent_hws[] = {
-	&meson8b_fclk_div4.hw,
-	&meson8b_fclk_div3.hw,
-	&meson8b_fclk_div5.hw,
-	&meson8m2_gp_pll.hw,
-};
-
 static struct clk_regmap meson8b_vpu_0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
@@ -2162,12 +2124,19 @@ static struct clk_regmap meson8b_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vpu_0_1_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_hws),
+		.parent_hws = meson8b_vpu_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vpu_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
+static const struct clk_hw *mmeson8m2_vpu_parents[] = {
+	&meson8b_fclk_div4.hw,
+	&meson8b_fclk_div3.hw,
+	&meson8b_fclk_div5.hw,
+	&meson8m2_gp_pll.hw,
+};
+
 static struct clk_regmap meson8m2_vpu_0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
@@ -2177,8 +2146,8 @@ static struct clk_regmap meson8m2_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = mmeson8m2_vpu_0_1_parent_hws,
-		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_hws),
+		.parent_hws = mmeson8m2_vpu_parents,
+		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2233,8 +2202,8 @@ static struct clk_regmap meson8b_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vpu_0_1_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vpu_0_1_parent_hws),
+		.parent_hws = meson8b_vpu_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vpu_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2248,8 +2217,8 @@ static struct clk_regmap meson8m2_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = mmeson8m2_vpu_0_1_parent_hws,
-		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_0_1_parent_hws),
+		.parent_hws = mmeson8m2_vpu_parents,
+		.num_parents = ARRAY_SIZE(mmeson8m2_vpu_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2321,7 +2290,7 @@ static struct clk_regmap meson8b_vpu = {
 	},
 };
 
-static const struct clk_hw *meson8b_vdec_parent_hws[] = {
+static const struct clk_hw *meson8b_vdec_parents[] = {
 	&meson8b_fclk_div4.hw,
 	&meson8b_fclk_div3.hw,
 	&meson8b_fclk_div5.hw,
@@ -2340,8 +2309,8 @@ static struct clk_regmap meson8b_vdec_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
+		.parent_hws = meson8b_vdec_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2443,8 +2412,8 @@ static struct clk_regmap meson8b_vdec_hcodec_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hcodec_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
+		.parent_hws = meson8b_vdec_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2493,8 +2462,8 @@ static struct clk_regmap meson8b_vdec_2_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_2_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
+		.parent_hws = meson8b_vdec_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2543,8 +2512,8 @@ static struct clk_regmap meson8b_vdec_hevc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_vdec_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_hws),
+		.parent_hws = meson8b_vdec_parents,
+		.num_parents = ARRAY_SIZE(meson8b_vdec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2603,27 +2572,26 @@ static struct clk_regmap meson8b_vdec_hevc = {
 };
 
 /* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const struct clk_hw *meson8b_cts_amclk_parent_hws[] = {
+static u32 meson8b_cts_mclk_parents_val_table[] = { 1, 2, 3 };
+static const struct clk_hw *meson8b_cts_mclk_parents[] = {
 	&meson8b_mpll0.hw,
 	&meson8b_mpll1.hw,
 	&meson8b_mpll2.hw
 };
 
-static u32 meson8b_cts_amclk_mux_table[] = { 1, 2, 3 };
-
 static struct clk_regmap meson8b_cts_amclk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 9,
-		.table = meson8b_cts_amclk_mux_table,
+		.table = meson8b_cts_mclk_parents_val_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_cts_amclk_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_hws),
+		.parent_hws = meson8b_cts_mclk_parents,
+		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_parents),
 	},
 };
 
@@ -2661,28 +2629,19 @@ static struct clk_regmap meson8b_cts_amclk = {
 	},
 };
 
-/* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const struct clk_hw *meson8b_cts_mclk_i958_parent_hws[] = {
-	&meson8b_mpll0.hw,
-	&meson8b_mpll1.hw,
-	&meson8b_mpll2.hw
-};
-
-static u32 meson8b_cts_mclk_i958_mux_table[] = { 1, 2, 3 };
-
 static struct clk_regmap meson8b_cts_mclk_i958_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL2,
 		.mask = 0x3,
 		.shift = 25,
-		.table = meson8b_cts_mclk_i958_mux_table,
+		.table = meson8b_cts_mclk_parents_val_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_cts_mclk_i958_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_hws),
+		.parent_hws = meson8b_cts_mclk_parents,
+		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_parents),
 	},
 };
 
@@ -2742,113 +2701,114 @@ static struct clk_regmap meson8b_cts_i958 = {
 	},
 };
 
-#define MESON_GATE(_name, _reg, _bit) \
+#define MESON8B_PCLK(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &meson8b_clk81.hw)
 
 /* Everything Else (EE) domain gates */
 
-static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
-static MESON_GATE(meson8b_dos, HHI_GCLK_MPEG0, 1);
-static MESON_GATE(meson8b_isa, HHI_GCLK_MPEG0, 5);
-static MESON_GATE(meson8b_pl301, HHI_GCLK_MPEG0, 6);
-static MESON_GATE(meson8b_periphs, HHI_GCLK_MPEG0, 7);
-static MESON_GATE(meson8b_spicc, HHI_GCLK_MPEG0, 8);
-static MESON_GATE(meson8b_i2c, HHI_GCLK_MPEG0, 9);
-static MESON_GATE(meson8b_sar_adc, HHI_GCLK_MPEG0, 10);
-static MESON_GATE(meson8b_smart_card, HHI_GCLK_MPEG0, 11);
-static MESON_GATE(meson8b_rng0, HHI_GCLK_MPEG0, 12);
-static MESON_GATE(meson8b_uart0, HHI_GCLK_MPEG0, 13);
-static MESON_GATE(meson8b_sdhc, HHI_GCLK_MPEG0, 14);
-static MESON_GATE(meson8b_stream, HHI_GCLK_MPEG0, 15);
-static MESON_GATE(meson8b_async_fifo, HHI_GCLK_MPEG0, 16);
-static MESON_GATE(meson8b_sdio, HHI_GCLK_MPEG0, 17);
-static MESON_GATE(meson8b_abuf, HHI_GCLK_MPEG0, 18);
-static MESON_GATE(meson8b_hiu_iface, HHI_GCLK_MPEG0, 19);
-static MESON_GATE(meson8b_assist_misc, HHI_GCLK_MPEG0, 23);
-static MESON_GATE(meson8b_spi, HHI_GCLK_MPEG0, 30);
-
-static MESON_GATE(meson8b_i2s_spdif, HHI_GCLK_MPEG1, 2);
-static MESON_GATE(meson8b_eth, HHI_GCLK_MPEG1, 3);
-static MESON_GATE(meson8b_demux, HHI_GCLK_MPEG1, 4);
-static MESON_GATE(meson8b_blkmv, HHI_GCLK_MPEG1, 14);
-static MESON_GATE(meson8b_aiu, HHI_GCLK_MPEG1, 15);
-static MESON_GATE(meson8b_uart1, HHI_GCLK_MPEG1, 16);
-static MESON_GATE(meson8b_g2d, HHI_GCLK_MPEG1, 20);
-static MESON_GATE(meson8b_usb0, HHI_GCLK_MPEG1, 21);
-static MESON_GATE(meson8b_usb1, HHI_GCLK_MPEG1, 22);
-static MESON_GATE(meson8b_reset, HHI_GCLK_MPEG1, 23);
-static MESON_GATE(meson8b_nand, HHI_GCLK_MPEG1, 24);
-static MESON_GATE(meson8b_dos_parser, HHI_GCLK_MPEG1, 25);
-static MESON_GATE(meson8b_usb, HHI_GCLK_MPEG1, 26);
-static MESON_GATE(meson8b_vdin1, HHI_GCLK_MPEG1, 28);
-static MESON_GATE(meson8b_ahb_arb0, HHI_GCLK_MPEG1, 29);
-static MESON_GATE(meson8b_efuse, HHI_GCLK_MPEG1, 30);
-static MESON_GATE(meson8b_boot_rom, HHI_GCLK_MPEG1, 31);
-
-static MESON_GATE(meson8b_ahb_data_bus, HHI_GCLK_MPEG2, 1);
-static MESON_GATE(meson8b_ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
-static MESON_GATE(meson8b_hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
-static MESON_GATE(meson8b_hdmi_pclk, HHI_GCLK_MPEG2, 4);
-static MESON_GATE(meson8b_usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
-static MESON_GATE(meson8b_usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
-static MESON_GATE(meson8b_mmc_pclk, HHI_GCLK_MPEG2, 11);
-static MESON_GATE(meson8b_dvin, HHI_GCLK_MPEG2, 12);
-static MESON_GATE(meson8b_uart2, HHI_GCLK_MPEG2, 15);
-static MESON_GATE(meson8b_sana, HHI_GCLK_MPEG2, 22);
-static MESON_GATE(meson8b_vpu_intr, HHI_GCLK_MPEG2, 25);
-static MESON_GATE(meson8b_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
-static MESON_GATE(meson8b_clk81_a9, HHI_GCLK_MPEG2, 29);
-
-static MESON_GATE(meson8b_vclk2_venci0, HHI_GCLK_OTHER, 1);
-static MESON_GATE(meson8b_vclk2_venci1, HHI_GCLK_OTHER, 2);
-static MESON_GATE(meson8b_vclk2_vencp0, HHI_GCLK_OTHER, 3);
-static MESON_GATE(meson8b_vclk2_vencp1, HHI_GCLK_OTHER, 4);
-static MESON_GATE(meson8b_gclk_venci_int, HHI_GCLK_OTHER, 8);
-static MESON_GATE(meson8b_gclk_vencp_int, HHI_GCLK_OTHER, 9);
-static MESON_GATE(meson8b_dac_clk, HHI_GCLK_OTHER, 10);
-static MESON_GATE(meson8b_aoclk_gate, HHI_GCLK_OTHER, 14);
-static MESON_GATE(meson8b_iec958_gate, HHI_GCLK_OTHER, 16);
-static MESON_GATE(meson8b_enc480p, HHI_GCLK_OTHER, 20);
-static MESON_GATE(meson8b_rng1, HHI_GCLK_OTHER, 21);
-static MESON_GATE(meson8b_gclk_vencl_int, HHI_GCLK_OTHER, 22);
-static MESON_GATE(meson8b_vclk2_venclmcc, HHI_GCLK_OTHER, 24);
-static MESON_GATE(meson8b_vclk2_vencl, HHI_GCLK_OTHER, 25);
-static MESON_GATE(meson8b_vclk2_other, HHI_GCLK_OTHER, 26);
-static MESON_GATE(meson8b_edp, HHI_GCLK_OTHER, 31);
+static MESON8B_PCLK(meson8b_ddr,		HHI_GCLK_MPEG0, 0);
+static MESON8B_PCLK(meson8b_dos,		HHI_GCLK_MPEG0, 1);
+static MESON8B_PCLK(meson8b_isa,		HHI_GCLK_MPEG0, 5);
+static MESON8B_PCLK(meson8b_pl301,		HHI_GCLK_MPEG0, 6);
+static MESON8B_PCLK(meson8b_periphs,		HHI_GCLK_MPEG0, 7);
+static MESON8B_PCLK(meson8b_spicc,		HHI_GCLK_MPEG0, 8);
+static MESON8B_PCLK(meson8b_i2c,		HHI_GCLK_MPEG0, 9);
+static MESON8B_PCLK(meson8b_sar_adc,		HHI_GCLK_MPEG0, 10);
+static MESON8B_PCLK(meson8b_smart_card,		HHI_GCLK_MPEG0, 11);
+static MESON8B_PCLK(meson8b_rng0,		HHI_GCLK_MPEG0, 12);
+static MESON8B_PCLK(meson8b_uart0,		HHI_GCLK_MPEG0, 13);
+static MESON8B_PCLK(meson8b_sdhc,		HHI_GCLK_MPEG0, 14);
+static MESON8B_PCLK(meson8b_stream,		HHI_GCLK_MPEG0, 15);
+static MESON8B_PCLK(meson8b_async_fifo,		HHI_GCLK_MPEG0, 16);
+static MESON8B_PCLK(meson8b_sdio,		HHI_GCLK_MPEG0, 17);
+static MESON8B_PCLK(meson8b_abuf,		HHI_GCLK_MPEG0, 18);
+static MESON8B_PCLK(meson8b_hiu_iface,		HHI_GCLK_MPEG0, 19);
+static MESON8B_PCLK(meson8b_assist_misc,	HHI_GCLK_MPEG0, 23);
+static MESON8B_PCLK(meson8b_spi,		HHI_GCLK_MPEG0, 30);
+
+static MESON8B_PCLK(meson8b_i2s_spdif,		HHI_GCLK_MPEG1, 2);
+static MESON8B_PCLK(meson8b_eth,		HHI_GCLK_MPEG1, 3);
+static MESON8B_PCLK(meson8b_demux,		HHI_GCLK_MPEG1, 4);
+static MESON8B_PCLK(meson8b_blkmv,		HHI_GCLK_MPEG1, 14);
+static MESON8B_PCLK(meson8b_aiu,		HHI_GCLK_MPEG1, 15);
+static MESON8B_PCLK(meson8b_uart1,		HHI_GCLK_MPEG1, 16);
+static MESON8B_PCLK(meson8b_g2d,		HHI_GCLK_MPEG1, 20);
+static MESON8B_PCLK(meson8b_usb0,		HHI_GCLK_MPEG1, 21);
+static MESON8B_PCLK(meson8b_usb1,		HHI_GCLK_MPEG1, 22);
+static MESON8B_PCLK(meson8b_reset,		HHI_GCLK_MPEG1, 23);
+static MESON8B_PCLK(meson8b_nand,		HHI_GCLK_MPEG1, 24);
+static MESON8B_PCLK(meson8b_dos_parser,		HHI_GCLK_MPEG1, 25);
+static MESON8B_PCLK(meson8b_usb,		HHI_GCLK_MPEG1, 26);
+static MESON8B_PCLK(meson8b_vdin1,		HHI_GCLK_MPEG1, 28);
+static MESON8B_PCLK(meson8b_ahb_arb0,		HHI_GCLK_MPEG1, 29);
+static MESON8B_PCLK(meson8b_efuse,		HHI_GCLK_MPEG1, 30);
+static MESON8B_PCLK(meson8b_boot_rom,		HHI_GCLK_MPEG1, 31);
+
+static MESON8B_PCLK(meson8b_ahb_data_bus,	HHI_GCLK_MPEG2, 1);
+static MESON8B_PCLK(meson8b_ahb_ctrl_bus,	HHI_GCLK_MPEG2, 2);
+static MESON8B_PCLK(meson8b_hdmi_intr_sync,	HHI_GCLK_MPEG2, 3);
+static MESON8B_PCLK(meson8b_hdmi_pclk,		HHI_GCLK_MPEG2, 4);
+static MESON8B_PCLK(meson8b_usb1_ddr_bridge,	HHI_GCLK_MPEG2, 8);
+static MESON8B_PCLK(meson8b_usb0_ddr_bridge,	HHI_GCLK_MPEG2, 9);
+static MESON8B_PCLK(meson8b_mmc_pclk,		HHI_GCLK_MPEG2, 11);
+static MESON8B_PCLK(meson8b_dvin,		HHI_GCLK_MPEG2, 12);
+static MESON8B_PCLK(meson8b_uart2,		HHI_GCLK_MPEG2, 15);
+static MESON8B_PCLK(meson8b_sana,		HHI_GCLK_MPEG2, 22);
+static MESON8B_PCLK(meson8b_vpu_intr,		HHI_GCLK_MPEG2, 25);
+static MESON8B_PCLK(meson8b_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
+static MESON8B_PCLK(meson8b_clk81_a9,		HHI_GCLK_MPEG2, 29);
+
+static MESON8B_PCLK(meson8b_vclk2_venci0,	HHI_GCLK_OTHER, 1);
+static MESON8B_PCLK(meson8b_vclk2_venci1,	HHI_GCLK_OTHER, 2);
+static MESON8B_PCLK(meson8b_vclk2_vencp0,	HHI_GCLK_OTHER, 3);
+static MESON8B_PCLK(meson8b_vclk2_vencp1,	HHI_GCLK_OTHER, 4);
+static MESON8B_PCLK(meson8b_gclk_venci_int,	HHI_GCLK_OTHER, 8);
+static MESON8B_PCLK(meson8b_gclk_vencp_int,	HHI_GCLK_OTHER, 9);
+static MESON8B_PCLK(meson8b_dac_clk,		HHI_GCLK_OTHER, 10);
+static MESON8B_PCLK(meson8b_aoclk_gate,		HHI_GCLK_OTHER, 14);
+static MESON8B_PCLK(meson8b_iec958_gate,	HHI_GCLK_OTHER, 16);
+static MESON8B_PCLK(meson8b_enc480p,		HHI_GCLK_OTHER, 20);
+static MESON8B_PCLK(meson8b_rng1,		HHI_GCLK_OTHER, 21);
+static MESON8B_PCLK(meson8b_gclk_vencl_int,	HHI_GCLK_OTHER, 22);
+static MESON8B_PCLK(meson8b_vclk2_venclmcc,	HHI_GCLK_OTHER, 24);
+static MESON8B_PCLK(meson8b_vclk2_vencl,	HHI_GCLK_OTHER, 25);
+static MESON8B_PCLK(meson8b_vclk2_other,	HHI_GCLK_OTHER, 26);
+static MESON8B_PCLK(meson8b_edp,		HHI_GCLK_OTHER, 31);
 
 /* AIU gates */
-#define MESON_AIU_GLUE_GATE(_name, _reg, _bit) \
+static MESON_PCLK(meson8b_aiu_glue,		HHI_GCLK_MPEG1, 6, &meson8b_aiu.hw);
+
+#define MESON_AIU_PCLK(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &meson8b_aiu_glue.hw)
 
-static MESON_PCLK(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6, &meson8b_aiu.hw);
-static MESON_AIU_GLUE_GATE(meson8b_iec958, HHI_GCLK_MPEG1, 7);
-static MESON_AIU_GLUE_GATE(meson8b_i2s_out, HHI_GCLK_MPEG1, 8);
-static MESON_AIU_GLUE_GATE(meson8b_amclk, HHI_GCLK_MPEG1, 9);
-static MESON_AIU_GLUE_GATE(meson8b_aififo2, HHI_GCLK_MPEG1, 10);
-static MESON_AIU_GLUE_GATE(meson8b_mixer, HHI_GCLK_MPEG1, 11);
-static MESON_AIU_GLUE_GATE(meson8b_mixer_iface, HHI_GCLK_MPEG1, 12);
-static MESON_AIU_GLUE_GATE(meson8b_adc, HHI_GCLK_MPEG1, 13);
+static MESON_AIU_PCLK(meson8b_iec958,		HHI_GCLK_MPEG1, 7);
+static MESON_AIU_PCLK(meson8b_i2s_out,		HHI_GCLK_MPEG1, 8);
+static MESON_AIU_PCLK(meson8b_amclk,		HHI_GCLK_MPEG1, 9);
+static MESON_AIU_PCLK(meson8b_aififo2,		HHI_GCLK_MPEG1, 10);
+static MESON_AIU_PCLK(meson8b_mixer,		HHI_GCLK_MPEG1, 11);
+static MESON_AIU_PCLK(meson8b_mixer_iface,	HHI_GCLK_MPEG1, 12);
+static MESON_AIU_PCLK(meson8b_adc,		HHI_GCLK_MPEG1, 13);
 
 /* Always On (AO) domain gates */
 
-static MESON_GATE(meson8b_ao_media_cpu, HHI_GCLK_AO, 0);
-static MESON_GATE(meson8b_ao_ahb_sram, HHI_GCLK_AO, 1);
-static MESON_GATE(meson8b_ao_ahb_bus, HHI_GCLK_AO, 2);
-static MESON_GATE(meson8b_ao_iface, HHI_GCLK_AO, 3);
+static MESON8B_PCLK(meson8b_ao_media_cpu,	HHI_GCLK_AO, 0);
+static MESON8B_PCLK(meson8b_ao_ahb_sram,	HHI_GCLK_AO, 1);
+static MESON8B_PCLK(meson8b_ao_ahb_bus,		HHI_GCLK_AO, 2);
+static MESON8B_PCLK(meson8b_ao_iface,		HHI_GCLK_AO, 3);
 
 static struct clk_hw *meson8_hw_clks[] = {
-	[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
-	[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
-	[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
-	[CLKID_FCLK_DIV2] = &meson8b_fclk_div2.hw,
-	[CLKID_FCLK_DIV3] = &meson8b_fclk_div3.hw,
-	[CLKID_FCLK_DIV4] = &meson8b_fclk_div4.hw,
-	[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
-	[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
-	[CLKID_CPUCLK] = &meson8b_cpu_clk.hw,
-	[CLKID_MPEG_SEL] = &meson8b_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV] = &meson8b_mpeg_clk_div.hw,
-	[CLKID_CLK81] = &meson8b_clk81.hw,
+	[CLKID_PLL_FIXED]	    = &meson8b_fixed_pll.hw,
+	[CLKID_PLL_VID]		    = &meson8b_vid_pll.hw,
+	[CLKID_PLL_SYS]		    = &meson8b_sys_pll.hw,
+	[CLKID_FCLK_DIV2]	    = &meson8b_fclk_div2.hw,
+	[CLKID_FCLK_DIV3]	    = &meson8b_fclk_div3.hw,
+	[CLKID_FCLK_DIV4]	    = &meson8b_fclk_div4.hw,
+	[CLKID_FCLK_DIV5]	    = &meson8b_fclk_div5.hw,
+	[CLKID_FCLK_DIV7]	    = &meson8b_fclk_div7.hw,
+	[CLKID_CPUCLK]		    = &meson8b_cpu_clk.hw,
+	[CLKID_MPEG_SEL]	    = &meson8b_clk81_sel.hw,
+	[CLKID_MPEG_DIV]	    = &meson8b_clk81_div.hw,
+	[CLKID_CLK81]		    = &meson8b_clk81.hw,
 	[CLKID_DDR]		    = &meson8b_ddr.hw,
 	[CLKID_DOS]		    = &meson8b_dos.hw,
 	[CLKID_ISA]		    = &meson8b_isa.hw,
@@ -2945,7 +2905,7 @@ static struct clk_hw *meson8_hw_clks[] = {
 	[CLKID_FCLK_DIV7_DIV]	    = &meson8b_fclk_div7_div.hw,
 	[CLKID_NAND_SEL]	    = &meson8b_nand_clk_sel.hw,
 	[CLKID_NAND_DIV]	    = &meson8b_nand_clk_div.hw,
-	[CLKID_NAND_CLK]	    = &meson8b_nand_clk_gate.hw,
+	[CLKID_NAND_CLK]	    = &meson8b_nand_clk.hw,
 	[CLKID_PLL_FIXED_DCO]	    = &meson8b_fixed_pll_dco.hw,
 	[CLKID_HDMI_PLL_DCO]	    = &meson8b_hdmi_pll_dco.hw,
 	[CLKID_PLL_SYS_DCO]	    = &meson8b_sys_pll_dco.hw,
@@ -2956,14 +2916,14 @@ static struct clk_hw *meson8_hw_clks[] = {
 	[CLKID_CPU_CLK_DIV6]	    = &meson8b_cpu_clk_div6.hw,
 	[CLKID_CPU_CLK_DIV7]	    = &meson8b_cpu_clk_div7.hw,
 	[CLKID_CPU_CLK_DIV8]	    = &meson8b_cpu_clk_div8.hw,
-	[CLKID_APB_SEL]		    = &meson8b_apb_clk_sel.hw,
-	[CLKID_APB]		    = &meson8b_apb_clk_gate.hw,
-	[CLKID_PERIPH_SEL]	    = &meson8b_periph_clk_sel.hw,
-	[CLKID_PERIPH]		    = &meson8b_periph_clk_gate.hw,
-	[CLKID_AXI_SEL]		    = &meson8b_axi_clk_sel.hw,
-	[CLKID_AXI]		    = &meson8b_axi_clk_gate.hw,
-	[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_clk_sel.hw,
-	[CLKID_L2_DRAM]		    = &meson8b_l2_dram_clk_gate.hw,
+	[CLKID_APB_SEL]		    = &meson8b_apb_sel.hw,
+	[CLKID_APB]		    = &meson8b_apb.hw,
+	[CLKID_PERIPH_SEL]	    = &meson8b_periph_sel.hw,
+	[CLKID_PERIPH]		    = &meson8b_periph.hw,
+	[CLKID_AXI_SEL]		    = &meson8b_axi_sel.hw,
+	[CLKID_AXI]		    = &meson8b_axi.hw,
+	[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_sel.hw,
+	[CLKID_L2_DRAM]		    = &meson8b_l2_dram.hw,
 	[CLKID_HDMI_PLL_LVDS_OUT]   = &meson8b_hdmi_pll_lvds_out.hw,
 	[CLKID_HDMI_PLL_HDMI_OUT]   = &meson8b_hdmi_pll_hdmi_out.hw,
 	[CLKID_VID_PLL_IN_SEL]	    = &meson8b_vid_pll_in_sel.hw,
@@ -2974,27 +2934,27 @@ static struct clk_hw *meson8_hw_clks[] = {
 	[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
 	[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
 	[CLKID_VCLK_EN]		    = &meson8b_vclk_en.hw,
-	[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
+	[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1.hw,
 	[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
-	[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
+	[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2.hw,
 	[CLKID_VCLK_DIV4_DIV]	    = &meson8b_vclk_div4_div.hw,
-	[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4_div_gate.hw,
+	[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4.hw,
 	[CLKID_VCLK_DIV6_DIV]	    = &meson8b_vclk_div6_div.hw,
-	[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6_div_gate.hw,
+	[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6.hw,
 	[CLKID_VCLK_DIV12_DIV]	    = &meson8b_vclk_div12_div.hw,
-	[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
+	[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12.hw,
 	[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
-	[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
-	[CLKID_VCLK2_EN]	    = &meson8b_vclk2_clk_en.hw,
-	[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
+	[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_in_en.hw,
+	[CLKID_VCLK2_EN]	    = &meson8b_vclk2_en.hw,
+	[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1.hw,
 	[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
-	[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
+	[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2.hw,
 	[CLKID_VCLK2_DIV4_DIV]	    = &meson8b_vclk2_div4_div.hw,
-	[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4_div_gate.hw,
+	[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4.hw,
 	[CLKID_VCLK2_DIV6_DIV]	    = &meson8b_vclk2_div6_div.hw,
-	[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6_div_gate.hw,
+	[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6.hw,
 	[CLKID_VCLK2_DIV12_DIV]	    = &meson8b_vclk2_div12_div.hw,
-	[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12_div_gate.hw,
+	[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12.hw,
 	[CLKID_CTS_ENCT_SEL]	    = &meson8b_cts_enct_sel.hw,
 	[CLKID_CTS_ENCT]	    = &meson8b_cts_enct.hw,
 	[CLKID_CTS_ENCP_SEL]	    = &meson8b_cts_encp_sel.hw,
@@ -3041,18 +3001,18 @@ static struct clk_hw *meson8_hw_clks[] = {
 };
 
 static struct clk_hw *meson8b_hw_clks[] = {
-	[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
-	[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
-	[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
-	[CLKID_FCLK_DIV2] = &meson8b_fclk_div2.hw,
-	[CLKID_FCLK_DIV3] = &meson8b_fclk_div3.hw,
-	[CLKID_FCLK_DIV4] = &meson8b_fclk_div4.hw,
-	[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
-	[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
-	[CLKID_CPUCLK] = &meson8b_cpu_clk.hw,
-	[CLKID_MPEG_SEL] = &meson8b_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV] = &meson8b_mpeg_clk_div.hw,
-	[CLKID_CLK81] = &meson8b_clk81.hw,
+	[CLKID_PLL_FIXED]	    = &meson8b_fixed_pll.hw,
+	[CLKID_PLL_VID]		    = &meson8b_vid_pll.hw,
+	[CLKID_PLL_SYS]		    = &meson8b_sys_pll.hw,
+	[CLKID_FCLK_DIV2]	    = &meson8b_fclk_div2.hw,
+	[CLKID_FCLK_DIV3]	    = &meson8b_fclk_div3.hw,
+	[CLKID_FCLK_DIV4]	    = &meson8b_fclk_div4.hw,
+	[CLKID_FCLK_DIV5]	    = &meson8b_fclk_div5.hw,
+	[CLKID_FCLK_DIV7]	    = &meson8b_fclk_div7.hw,
+	[CLKID_CPUCLK]		    = &meson8b_cpu_clk.hw,
+	[CLKID_MPEG_SEL]	    = &meson8b_clk81_sel.hw,
+	[CLKID_MPEG_DIV]	    = &meson8b_clk81_div.hw,
+	[CLKID_CLK81]		    = &meson8b_clk81.hw,
 	[CLKID_DDR]		    = &meson8b_ddr.hw,
 	[CLKID_DOS]		    = &meson8b_dos.hw,
 	[CLKID_ISA]		    = &meson8b_isa.hw,
@@ -3149,7 +3109,7 @@ static struct clk_hw *meson8b_hw_clks[] = {
 	[CLKID_FCLK_DIV7_DIV]	    = &meson8b_fclk_div7_div.hw,
 	[CLKID_NAND_SEL]	    = &meson8b_nand_clk_sel.hw,
 	[CLKID_NAND_DIV]	    = &meson8b_nand_clk_div.hw,
-	[CLKID_NAND_CLK]	    = &meson8b_nand_clk_gate.hw,
+	[CLKID_NAND_CLK]	    = &meson8b_nand_clk.hw,
 	[CLKID_PLL_FIXED_DCO]	    = &meson8b_fixed_pll_dco.hw,
 	[CLKID_HDMI_PLL_DCO]	    = &meson8b_hdmi_pll_dco.hw,
 	[CLKID_PLL_SYS_DCO]	    = &meson8b_sys_pll_dco.hw,
@@ -3160,14 +3120,14 @@ static struct clk_hw *meson8b_hw_clks[] = {
 	[CLKID_CPU_CLK_DIV6]	    = &meson8b_cpu_clk_div6.hw,
 	[CLKID_CPU_CLK_DIV7]	    = &meson8b_cpu_clk_div7.hw,
 	[CLKID_CPU_CLK_DIV8]	    = &meson8b_cpu_clk_div8.hw,
-	[CLKID_APB_SEL]		    = &meson8b_apb_clk_sel.hw,
-	[CLKID_APB]		    = &meson8b_apb_clk_gate.hw,
-	[CLKID_PERIPH_SEL]	    = &meson8b_periph_clk_sel.hw,
-	[CLKID_PERIPH]		    = &meson8b_periph_clk_gate.hw,
-	[CLKID_AXI_SEL]		    = &meson8b_axi_clk_sel.hw,
-	[CLKID_AXI]		    = &meson8b_axi_clk_gate.hw,
-	[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_clk_sel.hw,
-	[CLKID_L2_DRAM]		    = &meson8b_l2_dram_clk_gate.hw,
+	[CLKID_APB_SEL]		    = &meson8b_apb_sel.hw,
+	[CLKID_APB]		    = &meson8b_apb.hw,
+	[CLKID_PERIPH_SEL]	    = &meson8b_periph_sel.hw,
+	[CLKID_PERIPH]		    = &meson8b_periph.hw,
+	[CLKID_AXI_SEL]		    = &meson8b_axi_sel.hw,
+	[CLKID_AXI]		    = &meson8b_axi.hw,
+	[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_sel.hw,
+	[CLKID_L2_DRAM]		    = &meson8b_l2_dram.hw,
 	[CLKID_HDMI_PLL_LVDS_OUT]   = &meson8b_hdmi_pll_lvds_out.hw,
 	[CLKID_HDMI_PLL_HDMI_OUT]   = &meson8b_hdmi_pll_hdmi_out.hw,
 	[CLKID_VID_PLL_IN_SEL]	    = &meson8b_vid_pll_in_sel.hw,
@@ -3178,27 +3138,27 @@ static struct clk_hw *meson8b_hw_clks[] = {
 	[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
 	[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
 	[CLKID_VCLK_EN]		    = &meson8b_vclk_en.hw,
-	[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
+	[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1.hw,
 	[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
-	[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
+	[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2.hw,
 	[CLKID_VCLK_DIV4_DIV]	    = &meson8b_vclk_div4_div.hw,
-	[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4_div_gate.hw,
+	[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4.hw,
 	[CLKID_VCLK_DIV6_DIV]	    = &meson8b_vclk_div6_div.hw,
-	[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6_div_gate.hw,
+	[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6.hw,
 	[CLKID_VCLK_DIV12_DIV]	    = &meson8b_vclk_div12_div.hw,
-	[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
+	[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12.hw,
 	[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
-	[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
-	[CLKID_VCLK2_EN]	    = &meson8b_vclk2_clk_en.hw,
-	[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
+	[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_in_en.hw,
+	[CLKID_VCLK2_EN]	    = &meson8b_vclk2_en.hw,
+	[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1.hw,
 	[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
-	[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
+	[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2.hw,
 	[CLKID_VCLK2_DIV4_DIV]	    = &meson8b_vclk2_div4_div.hw,
-	[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4_div_gate.hw,
+	[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4.hw,
 	[CLKID_VCLK2_DIV6_DIV]	    = &meson8b_vclk2_div6_div.hw,
-	[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6_div_gate.hw,
+	[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6.hw,
 	[CLKID_VCLK2_DIV12_DIV]	    = &meson8b_vclk2_div12_div.hw,
-	[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12_div_gate.hw,
+	[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12.hw,
 	[CLKID_CTS_ENCT_SEL]	    = &meson8b_cts_enct_sel.hw,
 	[CLKID_CTS_ENCT]	    = &meson8b_cts_enct.hw,
 	[CLKID_CTS_ENCP_SEL]	    = &meson8b_cts_encp_sel.hw,
@@ -3256,18 +3216,18 @@ static struct clk_hw *meson8b_hw_clks[] = {
 };
 
 static struct clk_hw *meson8m2_hw_clks[] = {
-	[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
-	[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
-	[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
-	[CLKID_FCLK_DIV2] = &meson8b_fclk_div2.hw,
-	[CLKID_FCLK_DIV3] = &meson8b_fclk_div3.hw,
-	[CLKID_FCLK_DIV4] = &meson8b_fclk_div4.hw,
-	[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
-	[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
-	[CLKID_CPUCLK] = &meson8b_cpu_clk.hw,
-	[CLKID_MPEG_SEL] = &meson8b_mpeg_clk_sel.hw,
-	[CLKID_MPEG_DIV] = &meson8b_mpeg_clk_div.hw,
-	[CLKID_CLK81] = &meson8b_clk81.hw,
+	[CLKID_PLL_FIXED]	    = &meson8b_fixed_pll.hw,
+	[CLKID_PLL_VID]		    = &meson8b_vid_pll.hw,
+	[CLKID_PLL_SYS]		    = &meson8b_sys_pll.hw,
+	[CLKID_FCLK_DIV2]	    = &meson8b_fclk_div2.hw,
+	[CLKID_FCLK_DIV3]	    = &meson8b_fclk_div3.hw,
+	[CLKID_FCLK_DIV4]	    = &meson8b_fclk_div4.hw,
+	[CLKID_FCLK_DIV5]	    = &meson8b_fclk_div5.hw,
+	[CLKID_FCLK_DIV7]	    = &meson8b_fclk_div7.hw,
+	[CLKID_CPUCLK]		    = &meson8b_cpu_clk.hw,
+	[CLKID_MPEG_SEL]	    = &meson8b_clk81_sel.hw,
+	[CLKID_MPEG_DIV]	    = &meson8b_clk81_div.hw,
+	[CLKID_CLK81]		    = &meson8b_clk81.hw,
 	[CLKID_DDR]		    = &meson8b_ddr.hw,
 	[CLKID_DOS]		    = &meson8b_dos.hw,
 	[CLKID_ISA]		    = &meson8b_isa.hw,
@@ -3364,7 +3324,7 @@ static struct clk_hw *meson8m2_hw_clks[] = {
 	[CLKID_FCLK_DIV7_DIV]	    = &meson8b_fclk_div7_div.hw,
 	[CLKID_NAND_SEL]	    = &meson8b_nand_clk_sel.hw,
 	[CLKID_NAND_DIV]	    = &meson8b_nand_clk_div.hw,
-	[CLKID_NAND_CLK]	    = &meson8b_nand_clk_gate.hw,
+	[CLKID_NAND_CLK]	    = &meson8b_nand_clk.hw,
 	[CLKID_PLL_FIXED_DCO]	    = &meson8b_fixed_pll_dco.hw,
 	[CLKID_HDMI_PLL_DCO]	    = &meson8b_hdmi_pll_dco.hw,
 	[CLKID_PLL_SYS_DCO]	    = &meson8b_sys_pll_dco.hw,
@@ -3375,14 +3335,14 @@ static struct clk_hw *meson8m2_hw_clks[] = {
 	[CLKID_CPU_CLK_DIV6]	    = &meson8b_cpu_clk_div6.hw,
 	[CLKID_CPU_CLK_DIV7]	    = &meson8b_cpu_clk_div7.hw,
 	[CLKID_CPU_CLK_DIV8]	    = &meson8b_cpu_clk_div8.hw,
-	[CLKID_APB_SEL]		    = &meson8b_apb_clk_sel.hw,
-	[CLKID_APB]		    = &meson8b_apb_clk_gate.hw,
-	[CLKID_PERIPH_SEL]	    = &meson8b_periph_clk_sel.hw,
-	[CLKID_PERIPH]		    = &meson8b_periph_clk_gate.hw,
-	[CLKID_AXI_SEL]		    = &meson8b_axi_clk_sel.hw,
-	[CLKID_AXI]		    = &meson8b_axi_clk_gate.hw,
-	[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_clk_sel.hw,
-	[CLKID_L2_DRAM]		    = &meson8b_l2_dram_clk_gate.hw,
+	[CLKID_APB_SEL]		    = &meson8b_apb_sel.hw,
+	[CLKID_APB]		    = &meson8b_apb.hw,
+	[CLKID_PERIPH_SEL]	    = &meson8b_periph_sel.hw,
+	[CLKID_PERIPH]		    = &meson8b_periph.hw,
+	[CLKID_AXI_SEL]		    = &meson8b_axi_sel.hw,
+	[CLKID_AXI]		    = &meson8b_axi.hw,
+	[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_sel.hw,
+	[CLKID_L2_DRAM]		    = &meson8b_l2_dram.hw,
 	[CLKID_HDMI_PLL_LVDS_OUT]   = &meson8b_hdmi_pll_lvds_out.hw,
 	[CLKID_HDMI_PLL_HDMI_OUT]   = &meson8b_hdmi_pll_hdmi_out.hw,
 	[CLKID_VID_PLL_IN_SEL]	    = &meson8b_vid_pll_in_sel.hw,
@@ -3393,27 +3353,27 @@ static struct clk_hw *meson8m2_hw_clks[] = {
 	[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
 	[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
 	[CLKID_VCLK_EN]		    = &meson8b_vclk_en.hw,
-	[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
+	[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1.hw,
 	[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
-	[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
+	[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2.hw,
 	[CLKID_VCLK_DIV4_DIV]	    = &meson8b_vclk_div4_div.hw,
-	[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4_div_gate.hw,
+	[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4.hw,
 	[CLKID_VCLK_DIV6_DIV]	    = &meson8b_vclk_div6_div.hw,
-	[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6_div_gate.hw,
+	[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6.hw,
 	[CLKID_VCLK_DIV12_DIV]	    = &meson8b_vclk_div12_div.hw,
-	[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
+	[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12.hw,
 	[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
-	[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
-	[CLKID_VCLK2_EN]	    = &meson8b_vclk2_clk_en.hw,
-	[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
+	[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_in_en.hw,
+	[CLKID_VCLK2_EN]	    = &meson8b_vclk2_en.hw,
+	[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1.hw,
 	[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
-	[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
+	[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2.hw,
 	[CLKID_VCLK2_DIV4_DIV]	    = &meson8b_vclk2_div4_div.hw,
-	[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4_div_gate.hw,
+	[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4.hw,
 	[CLKID_VCLK2_DIV6_DIV]	    = &meson8b_vclk2_div6_div.hw,
-	[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6_div_gate.hw,
+	[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6.hw,
 	[CLKID_VCLK2_DIV12_DIV]	    = &meson8b_vclk2_div12_div.hw,
-	[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12_div_gate.hw,
+	[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12.hw,
 	[CLKID_CTS_ENCT_SEL]	    = &meson8b_cts_enct_sel.hw,
 	[CLKID_CTS_ENCT]	    = &meson8b_cts_enct.hw,
 	[CLKID_CTS_ENCP_SEL]	    = &meson8b_cts_encp_sel.hw,

-- 
2.47.2

