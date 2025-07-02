Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8682F199D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470040; cv=none; b=gV3su6P3F8/gMVshAl9aFMSE6rwpVznNjoxFyub7HWTNTG1TnpRykkm9K2Ngbjobpq1wq/JtFlFsHL5xszLalb1BWjIoRi0oginBN0GB80nCd7vEzzvT/xWLPlyy2mUX6oTO5Ply5iP5qzAjiH8mEZ36eAcyD8VjpFuY0X/eNDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470040; c=relaxed/simple;
	bh=V/ioS7Ec7Cg3YTVk3xhhI9osc4/59GAF44moXsR7xyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcAy00YRK4EieHEyb1IzSfpTy6JOyNA87qcZ2Hm9/n8/7ftox9mek1xtQ+sCOdiBAk7y9uV0TLWa25wDkTmxI0D644YcyJahD2i9cwiQ9mN8Xuc+DH3o/6ntsvZRlJo6nzu7KVdmfnlGLyvbPY5pC3YHa3NP9v81kEm+svo6Mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=J6i9LKqQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="J6i9LKqQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ce671a08so30706635e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470035; x=1752074835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXRvwlWjT/EyQOfphmccZKzVxuD7M62GOWYIY7jzqaI=;
        b=J6i9LKqQhdvLYNr8J8NtDxHYBoDQpKXO76HyWjQxeYfYZvj9dgqqZkiEBgSXmt7YAM
         Vu+9DgzsXNmU9kArIbNv5BNy8rKC9YOSA6k1vL/5BdpgwbUYft78wkljXf6GKljVdYFV
         QFqHvpWkaLxqiMcKjjjHVB648kqTWzowojcFWaOwMEm/PHwhqQdLznmEK2trRG7MAnMT
         ggWjcaY65evKgRuBjOSjDA3IVz5pUAcxbvcaa7an1Lcr1fKIyEOax1azrkCW2DdcPvcI
         31fRraTVLNznT9YwAYuLp2/ofME7KgVkI7j7OMvrbg5L0x4LwMNTZcf1xIFdOdYIrwhp
         Vc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470035; x=1752074835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXRvwlWjT/EyQOfphmccZKzVxuD7M62GOWYIY7jzqaI=;
        b=C11OdxmsCQ2Pn6vxA7G95MiZZcLVjGDoNhE76zWWCceFAGzfna+SayxjVuMD+jLSQc
         U0dR8cMV35gz+0uATkiSd7PWkVKASEU1Q59hiKN6N6ef8QDWCz2iPfpIbGRFJtXe1M0z
         k5l77D8hwljkJOBmde68rCjq52RahnF8v83b9e4En6t1fpOFbbh/8/814wuf0p6KY5zd
         kT7B6rqPI5/E410MCOw/sPrO4Pd61qPva4TTnJ91NJHPfztdDzLzJQQ8eDPn2XNzNBg0
         0PgzyLyo2eyDMExJUINSMaQdtYR4Sa3zZlSXTQw8Xv0d8LXZpCfhd19CxoYUaw09OyJs
         V5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwRPj5hIWyK4blRz3uLfk9X1TZA3njAcNdhoIxHGeqLgUghaU9PhRQf7QAcMjTXSjqEfMO+xRrcFBcDL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3UBR9GMBG5djBeb7YfY28ueoB0j5pEzsnzm9/F+PYRYcUrH+l
	BGOtF0ILDw7Djx4OLn1oeTw+t45KRpyrN9YK158QuJTRPwPr5HYUaoJr4D6Guk4gjFg=
X-Gm-Gg: ASbGncs0d7Ory/tNXfaYVaYla5CW9HMkxDP8eUJwd7SBd4mYdA7WcifppIOFhthRlGE
	Mdk3gTjmGAg1A2r3HNaIkDseIV++x99Y2wTN5vAJyB/AJ+ssU+TOu2VNSiUybmnNV+Yy+fOEWjv
	0s4+3mPXz4TN6JQNTeTwN6HvXDJ7o7xx4giTmJ/JCfRX/xGkk8timC1fGorqIJhSohGMYo1KhsJ
	PgBRAxiNoNJoPLrcDAdb1fhh3BaDRjEB+Li/j2G53YuTbkebfly+Eg1AvmfH7OzwRXOweiqAFFL
	Sk8M9WLxSa7XC949d6P60gpixBJkZzo8hjVAJkZI5vuNSc9VkGVE0T1OXZLAupXUN5x/nZkWoxM
	hPW4/XKZa42s=
X-Google-Smtp-Source: AGHT+IG13relPt+fMaFDnlo9fAhiV1HPr4nnHmg8XsHo+YKVo10+/irbdtgHzgJWZrReIhNPCk7xUQ==
X-Received: by 2002:a05:600c:37c7:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-454a36ec3fdmr40711705e9.15.1751470034729;
        Wed, 02 Jul 2025 08:27:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:00 +0200
Subject: [PATCH 02/26] clk: amlogic: a1-pll: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-2-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8963; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=V/ioS7Ec7Cg3YTVk3xhhI9osc4/59GAF44moXsR7xyM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+4k+xXNM/NC4iV1vrZpHpGmopZVtnCb0tqt
 pisbMy7xBCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPuAAKCRDm/A8cN/La
 hReOD/9CXpTsL9ZauAqvRLJMuDtAb+fuwpo2MD5qs8MkAxpcg2Ds9oT4vwOAf/FAldy6pb2zCLa
 96K60+tTKuf1IHl/uxgWN8LvCyZhGNy3ugUdBieO4XedTpZaPdkrOBPYDK/yC4OtsRRgEGqAW35
 QaYhhbnrKijVjawLt//EQhf88wiqhIa8aKNzMWLj0lB4QvqhTmk5ChCIpAPberW7JEsbcuQO+9p
 3wP+BYdevSl7ktgH0MfVsI6xLC4bdKOM+Eca6jVNHDyM6JBEBtYbqgmQ8wgq9ayDn5ox3ccIoeW
 0C436LxcG30mHCkZhH8d5w+0rffTk29vEIKVCt+f6FcnerM0O8RHk4eZRIANi0wy/yumPZ3m+z1
 qPxNMW2y0KnFqGlmEO3sV4HsdpfywEtgyIZIwsWfSfXSxy9iRb223HjB6raqYxkq9hz2JxMCfZv
 E4yFS9oVGEb1MmzHxDy7BBEKzjRBnqfT8eQPqgqFOM5kZS0CGmU+R3j6mnSqvj7VBZk1kMuOpXS
 7pNvkEAM4e10YhJxdmi4JYILyEHsiTErdX0miMuhE0JapF9vMZBM3wl+GP6Mghb6BdMy+IiDvvr
 reQ9Djqg7/dMSRD9Th6Bc8w8NFG/BDEupYXzGdlH6pFPqksom4Zuzyb7hEA5UL68raZuQMV33rL
 tbXMo/Co4+z1QVA==
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
 drivers/clk/meson/a1-pll.c | 76 +++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index dabd4fad1f57bdfa1d755298cd07a48d345e56a9..79ef4cbe955326ecedceb68cda7f59bb8882b165 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -26,7 +26,7 @@
 
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 
-static struct clk_regmap fixed_pll_dco = {
+static struct clk_regmap a1_fixed_pll_dco = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
 			.reg_off = ANACTRL_FIXPLL_CTRL0,
@@ -69,7 +69,7 @@ static struct clk_regmap fixed_pll_dco = {
 	},
 };
 
-static struct clk_regmap fixed_pll = {
+static struct clk_regmap a1_fixed_pll = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 20,
@@ -78,18 +78,18 @@ static struct clk_regmap fixed_pll = {
 		.name = "fixed_pll",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll_dco.hw
+			&a1_fixed_pll_dco.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static const struct pll_mult_range hifi_pll_mult_range = {
+static const struct pll_mult_range a1_hifi_pll_range = {
 	.min = 32,
 	.max = 64,
 };
 
-static const struct reg_sequence hifi_init_regs[] = {
+static const struct reg_sequence a1_hifi_pll_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL1, .def = 0x01800000 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00001100 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x100a1100 },
@@ -97,7 +97,7 @@ static const struct reg_sequence hifi_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL0, .def = 0x01f18000 },
 };
 
-static struct clk_regmap hifi_pll = {
+static struct clk_regmap a1_hifi_pll = {
 	.data = &(struct meson_clk_pll_data){
 		.en = {
 			.reg_off = ANACTRL_HIFIPLL_CTRL0,
@@ -134,9 +134,9 @@ static struct clk_regmap hifi_pll = {
 			.shift   = 6,
 			.width   = 1,
 		},
-		.range = &hifi_pll_mult_range,
-		.init_regs = hifi_init_regs,
-		.init_count = ARRAY_SIZE(hifi_init_regs),
+		.range = &a1_hifi_pll_range,
+		.init_regs = a1_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(a1_hifi_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hifi_pll",
@@ -148,20 +148,20 @@ static struct clk_regmap hifi_pll = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div2_div = {
+static struct clk_fixed_factor a1_fclk_div2_div = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div2 = {
+static struct clk_regmap a1_fclk_div2 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 21,
@@ -170,7 +170,7 @@ static struct clk_regmap fclk_div2 = {
 		.name = "fclk_div2",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div2_div.hw
+			&a1_fclk_div2_div.hw
 		},
 		.num_parents = 1,
 		/*
@@ -186,20 +186,20 @@ static struct clk_regmap fclk_div2 = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div3_div = {
+static struct clk_fixed_factor a1_fclk_div3_div = {
 	.mult = 1,
 	.div = 3,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div3_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div3 = {
+static struct clk_regmap a1_fclk_div3 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 22,
@@ -208,7 +208,7 @@ static struct clk_regmap fclk_div3 = {
 		.name = "fclk_div3",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div3_div.hw
+			&a1_fclk_div3_div.hw
 		},
 		.num_parents = 1,
 		/*
@@ -219,20 +219,20 @@ static struct clk_regmap fclk_div3 = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div5_div = {
+static struct clk_fixed_factor a1_fclk_div5_div = {
 	.mult = 1,
 	.div = 5,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div5_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div5 = {
+static struct clk_regmap a1_fclk_div5 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 23,
@@ -241,7 +241,7 @@ static struct clk_regmap fclk_div5 = {
 		.name = "fclk_div5",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div5_div.hw
+			&a1_fclk_div5_div.hw
 		},
 		.num_parents = 1,
 		/*
@@ -252,20 +252,20 @@ static struct clk_regmap fclk_div5 = {
 	},
 };
 
-static struct clk_fixed_factor fclk_div7_div = {
+static struct clk_fixed_factor a1_fclk_div7_div = {
 	.mult = 1,
 	.div = 7,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div7_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fixed_pll.hw
+			&a1_fixed_pll.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div7 = {
+static struct clk_regmap a1_fclk_div7 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = ANACTRL_FIXPLL_CTRL0,
 		.bit_idx = 24,
@@ -274,7 +274,7 @@ static struct clk_regmap fclk_div7 = {
 		.name = "fclk_div7",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div7_div.hw
+			&a1_fclk_div7_div.hw
 		},
 		.num_parents = 1,
 	},
@@ -282,17 +282,17 @@ static struct clk_regmap fclk_div7 = {
 
 /* Array of all clocks registered by this provider */
 static struct clk_hw *a1_pll_hw_clks[] = {
-	[CLKID_FIXED_PLL_DCO]	= &fixed_pll_dco.hw,
-	[CLKID_FIXED_PLL]	= &fixed_pll.hw,
-	[CLKID_FCLK_DIV2_DIV]	= &fclk_div2_div.hw,
-	[CLKID_FCLK_DIV3_DIV]	= &fclk_div3_div.hw,
-	[CLKID_FCLK_DIV5_DIV]	= &fclk_div5_div.hw,
-	[CLKID_FCLK_DIV7_DIV]	= &fclk_div7_div.hw,
-	[CLKID_FCLK_DIV2]	= &fclk_div2.hw,
-	[CLKID_FCLK_DIV3]	= &fclk_div3.hw,
-	[CLKID_FCLK_DIV5]	= &fclk_div5.hw,
-	[CLKID_FCLK_DIV7]	= &fclk_div7.hw,
-	[CLKID_HIFI_PLL]	= &hifi_pll.hw,
+	[CLKID_FIXED_PLL_DCO]	= &a1_fixed_pll_dco.hw,
+	[CLKID_FIXED_PLL]	= &a1_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]	= &a1_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV3_DIV]	= &a1_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV5_DIV]	= &a1_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV7_DIV]	= &a1_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV2]	= &a1_fclk_div2.hw,
+	[CLKID_FCLK_DIV3]	= &a1_fclk_div3.hw,
+	[CLKID_FCLK_DIV5]	= &a1_fclk_div5.hw,
+	[CLKID_FCLK_DIV7]	= &a1_fclk_div7.hw,
+	[CLKID_HIFI_PLL]	= &a1_hifi_pll.hw,
 };
 
 static const struct regmap_config a1_pll_regmap_cfg = {
@@ -307,7 +307,7 @@ static struct meson_clk_hw_data a1_pll_clks = {
 	.num = ARRAY_SIZE(a1_pll_hw_clks),
 };
 
-static int meson_a1_pll_probe(struct platform_device *pdev)
+static int a1_pll_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
@@ -344,7 +344,7 @@ static const struct of_device_id a1_pll_clkc_match_table[] = {
 MODULE_DEVICE_TABLE(of, a1_pll_clkc_match_table);
 
 static struct platform_driver a1_pll_clkc_driver = {
-	.probe = meson_a1_pll_probe,
+	.probe = a1_pll_clkc_probe,
 	.driver = {
 		.name = "a1-pll-clkc",
 		.of_match_table = a1_pll_clkc_match_table,

-- 
2.47.2

