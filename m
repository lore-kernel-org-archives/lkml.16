Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8C92F0E5B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470040; cv=none; b=iDSZHjZELXLgt9cphfij641fqvZnL7E3NE2Q4Z1WY0MNWaIjIOEgRwEuBpuhVTH0kgxOpe3tCVosr9mvU5XSYqThwpSR6l1hFhliY6OV4qvEEmJl7ZD/2hwZsQG2NBjou5sYM2TVBll/n3PqLZBo6tp2WKQDY1Hq6KBK26LOMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470040; c=relaxed/simple;
	bh=kfx6yFlpS5ecUvc6HVaqoNSEOKQK8DbV8drFrmeT7L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOxr/peXmTsKt+uzq1+8rKtDQB9VV3RVI2smS1fRcrj9Ngds6rXzba/fteBjtrnGgse6Aw9EOLT31HBiQgXrH8iqUQ88NozS+30DmMvslCF5j3MLe42mZ1xyzFTj4kqZx207WGhJiWgD+z9aYWR4NRY5CDqMk3296P+VJoX8kdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KanQjH4k; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KanQjH4k"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so59111935e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470034; x=1752074834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fcaA1nNnKccMvDoFs1oxBF27s1w1OrWChwmimDnDCI=;
        b=KanQjH4kLLrw/4oiQ3Cw8E8DqOkqWmteNDQrC64rf5obGNj4/IVoTTIxfzewTLmEY1
         /4KsGFMeEIAqF3NebExAdH3K2H5XswIRt76SUoFZKLCDRSjHKdtNH7RPn+TpsRHp/HlO
         kNNlkRP17J2HRar2YzGxojo3Rj3eMUps8VRYqjEMyrL0AZCH1q5/8vSX438zoS/9Y8Ux
         FD6QUuLyKoeqHiK5Pq6ygnE+bvvntgJ7FaJD+mK4A96flffxh3ew+0mHMGo31X8cMTnS
         qRGgFdwbfkF9id22OSh+0Xzd8MaZLm47MvnNtKLb3tjUzH/VZ3PRe+6BMdbC3NhcPoAL
         IQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470034; x=1752074834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fcaA1nNnKccMvDoFs1oxBF27s1w1OrWChwmimDnDCI=;
        b=iMYK1sAw3wZdfPNifQn/BgBRVgQpsxgJiTXAfvwn64MfzEe36r6PcEVwFYAsLcs2ej
         tjiPWxNhXabGO7FCcQ0CM7YcQoyi9+kq5xAFHAAJvIuxsVpr4bRSuvZwjWYheDH4nI4h
         KKrjoUmWXDjqgH2BdNY/tFP4+I4hsQLOxvzot6rPRzpEfMUXa3Z2xQfekgPCqmc3b600
         9PwmcnOOFsBsLfbBupxhJqKFdbD4JZkJpmIA+oBhRrZIv4fdOufKepLvZoCX409IJ4bv
         h64iiflcWE9CSdkxw/HxJgHMmlsI4oaQbBVH6GA4ap4g496dqiDFNiXbTBdfx0oZXy4r
         ybeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtzw/FONahK1eNtD0f5+EKoon+W8MdqAQInp/pOvn+78XqvLUurpENdEdK4m8kii3bzumibCIrX1GyViA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAZtaSJxi8MY9QzvXhdHRCbA5G69q0A6x2v5oymMM3sEbWmFX0
	OGoC0f6FCS/UMFAlZcQhcM+wmoFyk0fYo12ifmkgyM1Mj2ljlsvMbY7JDHMKCKUGstw=
X-Gm-Gg: ASbGnctPsFEIx2nHCYWinjpL/O9fPecTlvJK48gexuUUftiKPsekQfghYHFVd/1awlg
	jrxd3P/qTuSLnDe27ai0KGeESyaRuzMY2phuSAobZfFqmTGVxYkL0MoqGZIgb1oWZ+nAKisXIp/
	2fcLuhK5xtgUfP0OEICj5NgSfBr7PNRfbUHEOdYDrgycmpPMFlYr2yCM78lPKz8TUBQ27SAY+Wd
	PcTXjnv0zwpNfZXoeln7U44B+is26bowmusW407KIpQCamvsfssGxX6iHP8+qHbl3oHkmEJk2w6
	LW3qIWzrNhZ6VrjUlw4sjMgIwxIXAw5Nw6u1k8IKY68dexAzQ7cN7mL3xo72Rh/HfzS3V5grC1J
	iMBWu+TM9QUM=
X-Google-Smtp-Source: AGHT+IFL+sNjiQEiHN/RVbhhRVqzJfBiSIH1Wc+N0V1ds2onX2e2xwD4re7HfdPK3dooK6tZkatRtA==
X-Received: by 2002:a05:600c:8b22:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-454a3726347mr32551995e9.25.1751470033709;
        Wed, 02 Jul 2025 08:27:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:25:59 +0200
Subject: [PATCH 01/26] clk: amlogic: a1-peripherals: naming consistency
 alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-1-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=71075; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kfx6yFlpS5ecUvc6HVaqoNSEOKQK8DbV8drFrmeT7L4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+3yVkDE8nnPJbZ1CAVuocjFxBFNh9wN1dYo
 8lKfGQ+9ZiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPtwAKCRDm/A8cN/La
 hXS0D/425E2rQuD+5SLsnW5K6QxDokm8uZRc5N/4IqWdpVN+OWQZnwH1yIbDn4dsXCcOcoVct7r
 pQdypPylg1hQTTbuzWhFi/51l/BlTX8rFeVtPl+V8W3flA4UjnZI48c51NhCli7TEi6QEi6LWSy
 no2kS8sS+qXfn/jG8p0kNRM2yPRB/l0UlMK+AQHUwx8XvGdHVwznqbC4xgKxX7es1SMXKKH8SNV
 5OfA67xGjlVR8z4k2Oc00D4v7AbUw069XW5zYnXubtUO+eHKJZxhH6+adVono+tbNtnkVU5RLiJ
 eWlKCZurzXdhhvY1Zr1ygDWMUnY3rv95aSZpP2C0b7W9iZQJzu+Ca+jOBeValIXSK2Adw22XDcj
 +97oXWVys6asBvG9IvxmYJxdAl/A+mTN0/K+aMi9X8kCSee4fspl76MflAMla2RoNxXLmKbL86z
 toM7swfqb/sBq7W+LwGSsRFPcoVgeeIORncCbmOAKUfrgofdwVvu2D+pbYcpr3QyvqW4a2CnT3O
 JDEUX8mbmhKEucPkVxXuUVgooy0ZVJlJ0QELNdACLbvq3+Zg+Ac2NTCD5Fe8oayxX2pfrC1QL3u
 aC78za328Z3hNdTlU+Vr7s1B3JHsO4Cs66uR1DVWzWhiviYcf+3vbG4BxmXMpB7NT7+dowYs5w+
 8w+Iib7ikIP1afA==
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
 drivers/clk/meson/a1-peripherals.c | 950 +++++++++++++++++++------------------
 1 file changed, 476 insertions(+), 474 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 1f5d445d44fe7501d9f20380cd2b527109564630..9e352dba54775c22126ee8bf7861ee1d981d6c88 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -46,7 +46,7 @@
 #define PSRAM_CLK_CTRL		0xf4
 #define DMC_CLK_CTRL		0xf8
 
-static struct clk_regmap xtal_in = {
+static struct clk_regmap a1_xtal_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 0,
@@ -61,7 +61,7 @@ static struct clk_regmap xtal_in = {
 	},
 };
 
-static struct clk_regmap fixpll_in = {
+static struct clk_regmap a1_fixpll_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 1,
@@ -76,7 +76,7 @@ static struct clk_regmap fixpll_in = {
 	},
 };
 
-static struct clk_regmap usb_phy_in = {
+static struct clk_regmap a1_usb_phy_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 2,
@@ -91,7 +91,7 @@ static struct clk_regmap usb_phy_in = {
 	},
 };
 
-static struct clk_regmap usb_ctrl_in = {
+static struct clk_regmap a1_usb_ctrl_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 3,
@@ -106,7 +106,7 @@ static struct clk_regmap usb_ctrl_in = {
 	},
 };
 
-static struct clk_regmap hifipll_in = {
+static struct clk_regmap a1_hifipll_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 4,
@@ -121,7 +121,7 @@ static struct clk_regmap hifipll_in = {
 	},
 };
 
-static struct clk_regmap syspll_in = {
+static struct clk_regmap a1_syspll_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 5,
@@ -136,7 +136,7 @@ static struct clk_regmap syspll_in = {
 	},
 };
 
-static struct clk_regmap dds_in = {
+static struct clk_regmap a1_dds_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_OSCIN_CTRL,
 		.bit_idx = 6,
@@ -151,7 +151,7 @@ static struct clk_regmap dds_in = {
 	},
 };
 
-static struct clk_regmap rtc_32k_in = {
+static struct clk_regmap a1_rtc_32k_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = RTC_BY_OSCIN_CTRL0,
 		.bit_idx = 31,
@@ -166,7 +166,7 @@ static struct clk_regmap rtc_32k_in = {
 	},
 };
 
-static const struct meson_clk_dualdiv_param clk_32k_div_table[] = {
+static const struct meson_clk_dualdiv_param a1_32k_div_table[] = {
 	{
 		.dual		= 1,
 		.n1		= 733,
@@ -177,7 +177,7 @@ static const struct meson_clk_dualdiv_param clk_32k_div_table[] = {
 	{}
 };
 
-static struct clk_regmap rtc_32k_div = {
+static struct clk_regmap a1_rtc_32k_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = RTC_BY_OSCIN_CTRL0,
@@ -204,19 +204,19 @@ static struct clk_regmap rtc_32k_div = {
 			.shift   = 28,
 			.width   = 1,
 		},
-		.table = clk_32k_div_table,
+		.table = a1_32k_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "rtc_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&rtc_32k_in.hw
+			&a1_rtc_32k_in.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap rtc_32k_xtal = {
+static struct clk_regmap a1_rtc_32k_xtal = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = RTC_BY_OSCIN_CTRL1,
 		.bit_idx = 24,
@@ -225,13 +225,13 @@ static struct clk_regmap rtc_32k_xtal = {
 		.name = "rtc_32k_xtal",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&rtc_32k_in.hw
+			&a1_rtc_32k_in.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap rtc_32k_sel = {
+static struct clk_regmap a1_rtc_32k_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = RTC_CTRL,
 		.mask = 0x3,
@@ -242,15 +242,15 @@ static struct clk_regmap rtc_32k_sel = {
 		.name = "rtc_32k_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&rtc_32k_xtal.hw,
-			&rtc_32k_div.hw,
+			&a1_rtc_32k_xtal.hw,
+			&a1_rtc_32k_div.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap rtc = {
+static struct clk_regmap a1_rtc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = RTC_BY_OSCIN_CTRL0,
 		.bit_idx = 30,
@@ -259,38 +259,38 @@ static struct clk_regmap rtc = {
 		.name = "rtc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&rtc_32k_sel.hw
+			&a1_rtc_32k_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static u32 mux_table_sys[] = { 0, 1, 2, 3, 7 };
-static const struct clk_parent_data sys_parents[] = {
+static u32 a1_sys_parents_val_table[] = { 0, 1, 2, 3, 7 };
+static const struct clk_parent_data a1_sys_parents[] = {
 	{ .fw_name = "xtal" },
 	{ .fw_name = "fclk_div2" },
 	{ .fw_name = "fclk_div3" },
 	{ .fw_name = "fclk_div5" },
-	{ .hw = &rtc.hw },
+	{ .hw = &a1_rtc.hw },
 };
 
-static struct clk_regmap sys_b_sel = {
+static struct clk_regmap a1_sys_b_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SYS_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 26,
-		.table = mux_table_sys,
+		.table = a1_sys_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_b_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = sys_parents,
-		.num_parents = ARRAY_SIZE(sys_parents),
+		.parent_data = a1_sys_parents,
+		.num_parents = ARRAY_SIZE(a1_sys_parents),
 	},
 };
 
-static struct clk_regmap sys_b_div = {
+static struct clk_regmap a1_sys_b_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = SYS_CLK_CTRL0,
 		.shift = 16,
@@ -300,14 +300,14 @@ static struct clk_regmap sys_b_div = {
 		.name = "sys_b_div",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sys_b_sel.hw
+			&a1_sys_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sys_b = {
+static struct clk_regmap a1_sys_b = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_CLK_CTRL0,
 		.bit_idx = 29,
@@ -316,29 +316,29 @@ static struct clk_regmap sys_b = {
 		.name = "sys_b",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sys_b_div.hw
+			&a1_sys_b_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sys_a_sel = {
+static struct clk_regmap a1_sys_a_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SYS_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 10,
-		.table = mux_table_sys,
+		.table = a1_sys_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_a_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = sys_parents,
-		.num_parents = ARRAY_SIZE(sys_parents),
+		.parent_data = a1_sys_parents,
+		.num_parents = ARRAY_SIZE(a1_sys_parents),
 	},
 };
 
-static struct clk_regmap sys_a_div = {
+static struct clk_regmap a1_sys_a_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = SYS_CLK_CTRL0,
 		.shift = 0,
@@ -348,14 +348,14 @@ static struct clk_regmap sys_a_div = {
 		.name = "sys_a_div",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sys_a_sel.hw
+			&a1_sys_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sys_a = {
+static struct clk_regmap a1_sys_a = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SYS_CLK_CTRL0,
 		.bit_idx = 13,
@@ -364,14 +364,14 @@ static struct clk_regmap sys_a = {
 		.name = "sys_a",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sys_a_div.hw
+			&a1_sys_a_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sys = {
+static struct clk_regmap a1_sys = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SYS_CLK_CTRL0,
 		.mask = 0x1,
@@ -381,8 +381,8 @@ static struct clk_regmap sys = {
 		.name = "sys",
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sys_a.hw,
-			&sys_b.hw,
+			&a1_sys_a.hw,
+			&a1_sys_b.hw,
 		},
 		.num_parents = 2,
 		/*
@@ -398,32 +398,32 @@ static struct clk_regmap sys = {
 	},
 };
 
-static u32 mux_table_dsp_ab[] = { 0, 1, 2, 3, 4, 7 };
-static const struct clk_parent_data dsp_ab_parent_data[] = {
+static u32 a1_dsp_parents_val_table[] = { 0, 1, 2, 3, 4, 7 };
+static const struct clk_parent_data a1_dsp_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .fw_name = "fclk_div2", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
 	{ .fw_name = "hifi_pll", },
-	{ .hw = &rtc.hw },
+	{ .hw = &a1_rtc.hw },
 };
 
-static struct clk_regmap dspa_a_sel = {
+static struct clk_regmap a1_dspa_a_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DSPA_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 10,
-		.table = mux_table_dsp_ab,
+		.table = a1_dsp_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "dspa_a_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = dsp_ab_parent_data,
-		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
+		.parent_data = a1_dsp_parents,
+		.num_parents = ARRAY_SIZE(a1_dsp_parents),
 	},
 };
 
-static struct clk_regmap dspa_a_div = {
+static struct clk_regmap a1_dspa_a_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = DSPA_CLK_CTRL0,
 		.shift = 0,
@@ -433,14 +433,14 @@ static struct clk_regmap dspa_a_div = {
 		.name = "dspa_a_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_a_sel.hw
+			&a1_dspa_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspa_a = {
+static struct clk_regmap a1_dspa_a = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPA_CLK_CTRL0,
 		.bit_idx = 13,
@@ -449,29 +449,29 @@ static struct clk_regmap dspa_a = {
 		.name = "dspa_a",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_a_div.hw
+			&a1_dspa_a_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspa_b_sel = {
+static struct clk_regmap a1_dspa_b_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DSPA_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 26,
-		.table = mux_table_dsp_ab,
+		.table = a1_dsp_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "dspa_b_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = dsp_ab_parent_data,
-		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
+		.parent_data = a1_dsp_parents,
+		.num_parents = ARRAY_SIZE(a1_dsp_parents),
 	},
 };
 
-static struct clk_regmap dspa_b_div = {
+static struct clk_regmap a1_dspa_b_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = DSPA_CLK_CTRL0,
 		.shift = 16,
@@ -481,14 +481,14 @@ static struct clk_regmap dspa_b_div = {
 		.name = "dspa_b_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_b_sel.hw
+			&a1_dspa_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspa_b = {
+static struct clk_regmap a1_dspa_b = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPA_CLK_CTRL0,
 		.bit_idx = 29,
@@ -497,14 +497,14 @@ static struct clk_regmap dspa_b = {
 		.name = "dspa_b",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_b_div.hw
+			&a1_dspa_b_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspa_sel = {
+static struct clk_regmap a1_dspa_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DSPA_CLK_CTRL0,
 		.mask = 0x1,
@@ -514,15 +514,15 @@ static struct clk_regmap dspa_sel = {
 		.name = "dspa_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_a.hw,
-			&dspa_b.hw,
+			&a1_dspa_a.hw,
+			&a1_dspa_b.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspa_en = {
+static struct clk_regmap a1_dspa_en = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPA_CLK_EN,
 		.bit_idx = 1,
@@ -531,14 +531,14 @@ static struct clk_regmap dspa_en = {
 		.name = "dspa_en",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_sel.hw
+			&a1_dspa_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspa_en_nic = {
+static struct clk_regmap a1_dspa_en_nic = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPA_CLK_EN,
 		.bit_idx = 0,
@@ -547,29 +547,29 @@ static struct clk_regmap dspa_en_nic = {
 		.name = "dspa_en_nic",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspa_sel.hw
+			&a1_dspa_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_a_sel = {
+static struct clk_regmap a1_dspb_a_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DSPB_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 10,
-		.table = mux_table_dsp_ab,
+		.table = a1_dsp_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "dspb_a_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = dsp_ab_parent_data,
-		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
+		.parent_data = a1_dsp_parents,
+		.num_parents = ARRAY_SIZE(a1_dsp_parents),
 	},
 };
 
-static struct clk_regmap dspb_a_div = {
+static struct clk_regmap a1_dspb_a_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = DSPB_CLK_CTRL0,
 		.shift = 0,
@@ -579,14 +579,14 @@ static struct clk_regmap dspb_a_div = {
 		.name = "dspb_a_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_a_sel.hw
+			&a1_dspb_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_a = {
+static struct clk_regmap a1_dspb_a = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPB_CLK_CTRL0,
 		.bit_idx = 13,
@@ -595,29 +595,29 @@ static struct clk_regmap dspb_a = {
 		.name = "dspb_a",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_a_div.hw
+			&a1_dspb_a_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_b_sel = {
+static struct clk_regmap a1_dspb_b_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DSPB_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 26,
-		.table = mux_table_dsp_ab,
+		.table = a1_dsp_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "dspb_b_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = dsp_ab_parent_data,
-		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
+		.parent_data = a1_dsp_parents,
+		.num_parents = ARRAY_SIZE(a1_dsp_parents),
 	},
 };
 
-static struct clk_regmap dspb_b_div = {
+static struct clk_regmap a1_dspb_b_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = DSPB_CLK_CTRL0,
 		.shift = 16,
@@ -627,14 +627,14 @@ static struct clk_regmap dspb_b_div = {
 		.name = "dspb_b_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_b_sel.hw
+			&a1_dspb_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_b = {
+static struct clk_regmap a1_dspb_b = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPB_CLK_CTRL0,
 		.bit_idx = 29,
@@ -643,14 +643,14 @@ static struct clk_regmap dspb_b = {
 		.name = "dspb_b",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_b_div.hw
+			&a1_dspb_b_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_sel = {
+static struct clk_regmap a1_dspb_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DSPB_CLK_CTRL0,
 		.mask = 0x1,
@@ -660,15 +660,15 @@ static struct clk_regmap dspb_sel = {
 		.name = "dspb_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_a.hw,
-			&dspb_b.hw,
+			&a1_dspb_a.hw,
+			&a1_dspb_b.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_en = {
+static struct clk_regmap a1_dspb_en = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPB_CLK_EN,
 		.bit_idx = 1,
@@ -677,14 +677,14 @@ static struct clk_regmap dspb_en = {
 		.name = "dspb_en",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_sel.hw
+			&a1_dspb_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dspb_en_nic = {
+static struct clk_regmap a1_dspb_en_nic = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DSPB_CLK_EN,
 		.bit_idx = 0,
@@ -693,14 +693,14 @@ static struct clk_regmap dspb_en_nic = {
 		.name = "dspb_en_nic",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dspb_sel.hw
+			&a1_dspb_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap clk_24m = {
+static struct clk_regmap a1_24m = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLK12_24_CTRL,
 		.bit_idx = 11,
@@ -715,20 +715,20 @@ static struct clk_regmap clk_24m = {
 	},
 };
 
-static struct clk_fixed_factor clk_24m_div2 = {
+static struct clk_fixed_factor a1_24m_div2 = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "24m_div2",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&clk_24m.hw
+			&a1_24m.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap clk_12m = {
+static struct clk_regmap a1_12m = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLK12_24_CTRL,
 		.bit_idx = 10,
@@ -737,13 +737,13 @@ static struct clk_regmap clk_12m = {
 		.name = "12m",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&clk_24m_div2.hw
+			&a1_24m_div2.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap fclk_div2_divn_pre = {
+static struct clk_regmap a1_fclk_div2_divn_pre = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = CLK12_24_CTRL,
 		.shift = 0,
@@ -759,7 +759,7 @@ static struct clk_regmap fclk_div2_divn_pre = {
 	},
 };
 
-static struct clk_regmap fclk_div2_divn = {
+static struct clk_regmap a1_fclk_div2_divn = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLK12_24_CTRL,
 		.bit_idx = 12,
@@ -768,7 +768,7 @@ static struct clk_regmap fclk_div2_divn = {
 		.name = "fclk_div2_divn",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_div2_divn_pre.hw
+			&a1_fclk_div2_divn_pre.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -779,10 +779,10 @@ static struct clk_regmap fclk_div2_divn = {
  * the index 2 is sys_pll_div16, it will be implemented in the CPU clock driver,
  * the index 4 is the clock measurement source, it's not supported yet
  */
-static u32 gen_table[] = { 0, 1, 3, 5, 6, 7, 8 };
-static const struct clk_parent_data gen_parent_data[] = {
+static u32 a1_gen_parents_val_table[] = { 0, 1, 3, 5, 6, 7, 8 };
+static const struct clk_parent_data a1_gen_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .hw = &rtc.hw },
+	{ .hw = &a1_rtc.hw },
 	{ .fw_name = "hifi_pll", },
 	{ .fw_name = "fclk_div2", },
 	{ .fw_name = "fclk_div3", },
@@ -790,18 +790,18 @@ static const struct clk_parent_data gen_parent_data[] = {
 	{ .fw_name = "fclk_div7", },
 };
 
-static struct clk_regmap gen_sel = {
+static struct clk_regmap a1_gen_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = GEN_CLK_CTRL,
 		.mask = 0xf,
 		.shift = 12,
-		.table = gen_table,
+		.table = a1_gen_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gen_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gen_parent_data,
-		.num_parents = ARRAY_SIZE(gen_parent_data),
+		.parent_data = a1_gen_parents,
+		.num_parents = ARRAY_SIZE(a1_gen_parents),
 		/*
 		 * The GEN clock can be connected to an external pad, so it
 		 * may be set up directly from the device tree. Additionally,
@@ -813,7 +813,7 @@ static struct clk_regmap gen_sel = {
 	},
 };
 
-static struct clk_regmap gen_div = {
+static struct clk_regmap a1_gen_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = GEN_CLK_CTRL,
 		.shift = 0,
@@ -823,14 +823,14 @@ static struct clk_regmap gen_div = {
 		.name = "gen_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gen_sel.hw
+			&a1_gen_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap gen = {
+static struct clk_regmap a1_gen = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = GEN_CLK_CTRL,
 		.bit_idx = 11,
@@ -839,14 +839,14 @@ static struct clk_regmap gen = {
 		.name = "gen",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gen_div.hw
+			&a1_gen_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap saradc_sel = {
+static struct clk_regmap a1_saradc_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SAR_ADC_CLK_CTRL,
 		.mask = 0x1,
@@ -857,13 +857,13 @@ static struct clk_regmap saradc_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "xtal", },
-			{ .hw = &sys.hw, },
+			{ .hw = &a1_sys.hw, },
 		},
 		.num_parents = 2,
 	},
 };
 
-static struct clk_regmap saradc_div = {
+static struct clk_regmap a1_saradc_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = SAR_ADC_CLK_CTRL,
 		.shift = 0,
@@ -873,14 +873,14 @@ static struct clk_regmap saradc_div = {
 		.name = "saradc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&saradc_sel.hw
+			&a1_saradc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap saradc = {
+static struct clk_regmap a1_saradc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SAR_ADC_CLK_CTRL,
 		.bit_idx = 8,
@@ -889,20 +889,20 @@ static struct clk_regmap saradc = {
 		.name = "saradc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&saradc_div.hw
+			&a1_saradc_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data pwm_abcd_parents[] = {
+static const struct clk_parent_data a1_pwm_abcd_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .hw = &sys.hw },
-	{ .hw = &rtc.hw },
+	{ .hw = &a1_sys.hw },
+	{ .hw = &a1_rtc.hw },
 };
 
-static struct clk_regmap pwm_a_sel = {
+static struct clk_regmap a1_pwm_a_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PWM_CLK_AB_CTRL,
 		.mask = 0x1,
@@ -911,12 +911,12 @@ static struct clk_regmap pwm_a_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_a_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = pwm_abcd_parents,
-		.num_parents = ARRAY_SIZE(pwm_abcd_parents),
+		.parent_data = a1_pwm_abcd_parents,
+		.num_parents = ARRAY_SIZE(a1_pwm_abcd_parents),
 	},
 };
 
-static struct clk_regmap pwm_a_div = {
+static struct clk_regmap a1_pwm_a_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PWM_CLK_AB_CTRL,
 		.shift = 0,
@@ -926,14 +926,14 @@ static struct clk_regmap pwm_a_div = {
 		.name = "pwm_a_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_a_sel.hw
+			&a1_pwm_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_a = {
+static struct clk_regmap a1_pwm_a = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PWM_CLK_AB_CTRL,
 		.bit_idx = 8,
@@ -942,14 +942,14 @@ static struct clk_regmap pwm_a = {
 		.name = "pwm_a",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_a_div.hw
+			&a1_pwm_a_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_b_sel = {
+static struct clk_regmap a1_pwm_b_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PWM_CLK_AB_CTRL,
 		.mask = 0x1,
@@ -958,12 +958,12 @@ static struct clk_regmap pwm_b_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_b_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = pwm_abcd_parents,
-		.num_parents = ARRAY_SIZE(pwm_abcd_parents),
+		.parent_data = a1_pwm_abcd_parents,
+		.num_parents = ARRAY_SIZE(a1_pwm_abcd_parents),
 	},
 };
 
-static struct clk_regmap pwm_b_div = {
+static struct clk_regmap a1_pwm_b_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PWM_CLK_AB_CTRL,
 		.shift = 16,
@@ -973,14 +973,14 @@ static struct clk_regmap pwm_b_div = {
 		.name = "pwm_b_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_b_sel.hw
+			&a1_pwm_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_b = {
+static struct clk_regmap a1_pwm_b = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PWM_CLK_AB_CTRL,
 		.bit_idx = 24,
@@ -989,14 +989,14 @@ static struct clk_regmap pwm_b = {
 		.name = "pwm_b",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_b_div.hw
+			&a1_pwm_b_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_c_sel = {
+static struct clk_regmap a1_pwm_c_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PWM_CLK_CD_CTRL,
 		.mask = 0x1,
@@ -1005,12 +1005,12 @@ static struct clk_regmap pwm_c_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_c_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = pwm_abcd_parents,
-		.num_parents = ARRAY_SIZE(pwm_abcd_parents),
+		.parent_data = a1_pwm_abcd_parents,
+		.num_parents = ARRAY_SIZE(a1_pwm_abcd_parents),
 	},
 };
 
-static struct clk_regmap pwm_c_div = {
+static struct clk_regmap a1_pwm_c_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PWM_CLK_CD_CTRL,
 		.shift = 0,
@@ -1020,14 +1020,14 @@ static struct clk_regmap pwm_c_div = {
 		.name = "pwm_c_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_c_sel.hw
+			&a1_pwm_c_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_c = {
+static struct clk_regmap a1_pwm_c = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PWM_CLK_CD_CTRL,
 		.bit_idx = 8,
@@ -1036,14 +1036,14 @@ static struct clk_regmap pwm_c = {
 		.name = "pwm_c",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_c_div.hw
+			&a1_pwm_c_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_d_sel = {
+static struct clk_regmap a1_pwm_d_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PWM_CLK_CD_CTRL,
 		.mask = 0x1,
@@ -1052,12 +1052,12 @@ static struct clk_regmap pwm_d_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_d_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = pwm_abcd_parents,
-		.num_parents = ARRAY_SIZE(pwm_abcd_parents),
+		.parent_data = a1_pwm_abcd_parents,
+		.num_parents = ARRAY_SIZE(a1_pwm_abcd_parents),
 	},
 };
 
-static struct clk_regmap pwm_d_div = {
+static struct clk_regmap a1_pwm_d_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PWM_CLK_CD_CTRL,
 		.shift = 16,
@@ -1067,14 +1067,14 @@ static struct clk_regmap pwm_d_div = {
 		.name = "pwm_d_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_d_sel.hw
+			&a1_pwm_d_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_d = {
+static struct clk_regmap a1_pwm_d = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PWM_CLK_CD_CTRL,
 		.bit_idx = 24,
@@ -1083,21 +1083,21 @@ static struct clk_regmap pwm_d = {
 		.name = "pwm_d",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_d_div.hw
+			&a1_pwm_d_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data pwm_ef_parents[] = {
+static const struct clk_parent_data a1_pwm_ef_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .hw = &sys.hw },
+	{ .hw = &a1_sys.hw },
 	{ .fw_name = "fclk_div5", },
-	{ .hw = &rtc.hw },
+	{ .hw = &a1_rtc.hw },
 };
 
-static struct clk_regmap pwm_e_sel = {
+static struct clk_regmap a1_pwm_e_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PWM_CLK_EF_CTRL,
 		.mask = 0x3,
@@ -1106,12 +1106,12 @@ static struct clk_regmap pwm_e_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_e_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = pwm_ef_parents,
-		.num_parents = ARRAY_SIZE(pwm_ef_parents),
+		.parent_data = a1_pwm_ef_parents,
+		.num_parents = ARRAY_SIZE(a1_pwm_ef_parents),
 	},
 };
 
-static struct clk_regmap pwm_e_div = {
+static struct clk_regmap a1_pwm_e_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PWM_CLK_EF_CTRL,
 		.shift = 0,
@@ -1121,14 +1121,14 @@ static struct clk_regmap pwm_e_div = {
 		.name = "pwm_e_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_e_sel.hw
+			&a1_pwm_e_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_e = {
+static struct clk_regmap a1_pwm_e = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PWM_CLK_EF_CTRL,
 		.bit_idx = 8,
@@ -1137,14 +1137,14 @@ static struct clk_regmap pwm_e = {
 		.name = "pwm_e",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_e_div.hw
+			&a1_pwm_e_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_f_sel = {
+static struct clk_regmap a1_pwm_f_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PWM_CLK_EF_CTRL,
 		.mask = 0x3,
@@ -1153,12 +1153,12 @@ static struct clk_regmap pwm_f_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_f_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = pwm_ef_parents,
-		.num_parents = ARRAY_SIZE(pwm_ef_parents),
+		.parent_data = a1_pwm_ef_parents,
+		.num_parents = ARRAY_SIZE(a1_pwm_ef_parents),
 	},
 };
 
-static struct clk_regmap pwm_f_div = {
+static struct clk_regmap a1_pwm_f_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PWM_CLK_EF_CTRL,
 		.shift = 16,
@@ -1168,14 +1168,14 @@ static struct clk_regmap pwm_f_div = {
 		.name = "pwm_f_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_f_sel.hw
+			&a1_pwm_f_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap pwm_f = {
+static struct clk_regmap a1_pwm_f = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PWM_CLK_EF_CTRL,
 		.bit_idx = 24,
@@ -1184,7 +1184,7 @@ static struct clk_regmap pwm_f = {
 		.name = "pwm_f",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&pwm_f_div.hw
+			&a1_pwm_f_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1200,14 +1200,14 @@ static struct clk_regmap pwm_f = {
  *  --------------------|/
  *                 24M
  */
-static const struct clk_parent_data spicc_spifc_parents[] = {
+static const struct clk_parent_data a1_spi_parents[] = {
 	{ .fw_name = "fclk_div2"},
 	{ .fw_name = "fclk_div3"},
 	{ .fw_name = "fclk_div5"},
 	{ .fw_name = "hifi_pll" },
 };
 
-static struct clk_regmap spicc_sel = {
+static struct clk_regmap a1_spicc_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SPICC_CLK_CTRL,
 		.mask = 0x3,
@@ -1216,12 +1216,12 @@ static struct clk_regmap spicc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "spicc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spicc_spifc_parents,
-		.num_parents = ARRAY_SIZE(spicc_spifc_parents),
+		.parent_data = a1_spi_parents,
+		.num_parents = ARRAY_SIZE(a1_spi_parents),
 	},
 };
 
-static struct clk_regmap spicc_div = {
+static struct clk_regmap a1_spicc_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = SPICC_CLK_CTRL,
 		.shift = 0,
@@ -1231,14 +1231,14 @@ static struct clk_regmap spicc_div = {
 		.name = "spicc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spicc_sel.hw
+			&a1_spicc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spicc_sel2 = {
+static struct clk_regmap a1_spicc_sel2 = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SPICC_CLK_CTRL,
 		.mask = 0x1,
@@ -1248,7 +1248,7 @@ static struct clk_regmap spicc_sel2 = {
 		.name = "spicc_sel2",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &spicc_div.hw },
+			{ .hw = &a1_spicc_div.hw },
 			{ .fw_name = "xtal", },
 		},
 		.num_parents = 2,
@@ -1256,7 +1256,7 @@ static struct clk_regmap spicc_sel2 = {
 	},
 };
 
-static struct clk_regmap spicc = {
+static struct clk_regmap a1_spicc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SPICC_CLK_CTRL,
 		.bit_idx = 8,
@@ -1265,14 +1265,14 @@ static struct clk_regmap spicc = {
 		.name = "spicc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spicc_sel2.hw
+			&a1_spicc_sel2.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ts_div = {
+static struct clk_regmap a1_ts_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = TS_CLK_CTRL,
 		.shift = 0,
@@ -1288,7 +1288,7 @@ static struct clk_regmap ts_div = {
 	},
 };
 
-static struct clk_regmap ts = {
+static struct clk_regmap a1_ts = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = TS_CLK_CTRL,
 		.bit_idx = 8,
@@ -1297,14 +1297,14 @@ static struct clk_regmap ts = {
 		.name = "ts",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ts_div.hw
+			&a1_ts_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spifc_sel = {
+static struct clk_regmap a1_spifc_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SPIFC_CLK_CTRL,
 		.mask = 0x3,
@@ -1313,12 +1313,12 @@ static struct clk_regmap spifc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "spifc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spicc_spifc_parents,
-		.num_parents = ARRAY_SIZE(spicc_spifc_parents),
+		.parent_data = a1_spi_parents,
+		.num_parents = ARRAY_SIZE(a1_spi_parents),
 	},
 };
 
-static struct clk_regmap spifc_div = {
+static struct clk_regmap a1_spifc_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = SPIFC_CLK_CTRL,
 		.shift = 0,
@@ -1328,14 +1328,14 @@ static struct clk_regmap spifc_div = {
 		.name = "spifc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spifc_sel.hw
+			&a1_spifc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spifc_sel2 = {
+static struct clk_regmap a1_spifc_sel2 = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SPIFC_CLK_CTRL,
 		.mask = 0x1,
@@ -1345,7 +1345,7 @@ static struct clk_regmap spifc_sel2 = {
 		.name = "spifc_sel2",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &spifc_div.hw },
+			{ .hw = &a1_spifc_div.hw },
 			{ .fw_name = "xtal", },
 		},
 		.num_parents = 2,
@@ -1353,7 +1353,7 @@ static struct clk_regmap spifc_sel2 = {
 	},
 };
 
-static struct clk_regmap spifc = {
+static struct clk_regmap a1_spifc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SPIFC_CLK_CTRL,
 		.bit_idx = 8,
@@ -1362,21 +1362,21 @@ static struct clk_regmap spifc = {
 		.name = "spifc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spifc_sel2.hw
+			&a1_spifc_sel2.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data usb_bus_parents[] = {
+static const struct clk_parent_data a1_usb_bus_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .hw = &sys.hw },
+	{ .hw = &a1_sys.hw },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
 };
 
-static struct clk_regmap usb_bus_sel = {
+static struct clk_regmap a1_usb_bus_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = USB_BUSCLK_CTRL,
 		.mask = 0x3,
@@ -1385,13 +1385,13 @@ static struct clk_regmap usb_bus_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "usb_bus_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = usb_bus_parents,
-		.num_parents = ARRAY_SIZE(usb_bus_parents),
+		.parent_data = a1_usb_bus_parents,
+		.num_parents = ARRAY_SIZE(a1_usb_bus_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap usb_bus_div = {
+static struct clk_regmap a1_usb_bus_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = USB_BUSCLK_CTRL,
 		.shift = 0,
@@ -1401,14 +1401,14 @@ static struct clk_regmap usb_bus_div = {
 		.name = "usb_bus_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&usb_bus_sel.hw
+			&a1_usb_bus_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap usb_bus = {
+static struct clk_regmap a1_usb_bus = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = USB_BUSCLK_CTRL,
 		.bit_idx = 8,
@@ -1417,21 +1417,21 @@ static struct clk_regmap usb_bus = {
 		.name = "usb_bus",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&usb_bus_div.hw
+			&a1_usb_bus_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data sd_emmc_psram_dmc_parents[] = {
+static const struct clk_parent_data a1_sd_emmc_parents[] = {
 	{ .fw_name = "fclk_div2", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
 	{ .fw_name = "hifi_pll", },
 };
 
-static struct clk_regmap sd_emmc_sel = {
+static struct clk_regmap a1_sd_emmc_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SD_EMMC_CLK_CTRL,
 		.mask = 0x3,
@@ -1440,12 +1440,12 @@ static struct clk_regmap sd_emmc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "sd_emmc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = sd_emmc_psram_dmc_parents,
-		.num_parents = ARRAY_SIZE(sd_emmc_psram_dmc_parents),
+		.parent_data = a1_sd_emmc_parents,
+		.num_parents = ARRAY_SIZE(a1_sd_emmc_parents),
 	},
 };
 
-static struct clk_regmap sd_emmc_div = {
+static struct clk_regmap a1_sd_emmc_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = SD_EMMC_CLK_CTRL,
 		.shift = 0,
@@ -1455,14 +1455,14 @@ static struct clk_regmap sd_emmc_div = {
 		.name = "sd_emmc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_sel.hw
+			&a1_sd_emmc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sd_emmc_sel2 = {
+static struct clk_regmap a1_sd_emmc_sel2 = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = SD_EMMC_CLK_CTRL,
 		.mask = 0x1,
@@ -1472,7 +1472,7 @@ static struct clk_regmap sd_emmc_sel2 = {
 		.name = "sd_emmc_sel2",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &sd_emmc_div.hw },
+			{ .hw = &a1_sd_emmc_div.hw },
 			{ .fw_name = "xtal", },
 		},
 		.num_parents = 2,
@@ -1480,7 +1480,7 @@ static struct clk_regmap sd_emmc_sel2 = {
 	},
 };
 
-static struct clk_regmap sd_emmc = {
+static struct clk_regmap a1_sd_emmc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = SD_EMMC_CLK_CTRL,
 		.bit_idx = 8,
@@ -1489,14 +1489,14 @@ static struct clk_regmap sd_emmc = {
 		.name = "sd_emmc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_sel2.hw
+			&a1_sd_emmc_sel2.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap psram_sel = {
+static struct clk_regmap a1_psram_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PSRAM_CLK_CTRL,
 		.mask = 0x3,
@@ -1505,12 +1505,12 @@ static struct clk_regmap psram_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "psram_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = sd_emmc_psram_dmc_parents,
-		.num_parents = ARRAY_SIZE(sd_emmc_psram_dmc_parents),
+		.parent_data = a1_sd_emmc_parents,
+		.num_parents = ARRAY_SIZE(a1_sd_emmc_parents),
 	},
 };
 
-static struct clk_regmap psram_div = {
+static struct clk_regmap a1_psram_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = PSRAM_CLK_CTRL,
 		.shift = 0,
@@ -1520,14 +1520,14 @@ static struct clk_regmap psram_div = {
 		.name = "psram_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&psram_sel.hw
+			&a1_psram_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap psram_sel2 = {
+static struct clk_regmap a1_psram_sel2 = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = PSRAM_CLK_CTRL,
 		.mask = 0x1,
@@ -1537,7 +1537,7 @@ static struct clk_regmap psram_sel2 = {
 		.name = "psram_sel2",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &psram_div.hw },
+			{ .hw = &a1_psram_div.hw },
 			{ .fw_name = "xtal", },
 		},
 		.num_parents = 2,
@@ -1545,7 +1545,7 @@ static struct clk_regmap psram_sel2 = {
 	},
 };
 
-static struct clk_regmap psram = {
+static struct clk_regmap a1_psram = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = PSRAM_CLK_CTRL,
 		.bit_idx = 8,
@@ -1554,14 +1554,14 @@ static struct clk_regmap psram = {
 		.name = "psram",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&psram_sel2.hw
+			&a1_psram_sel2.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dmc_sel = {
+static struct clk_regmap a1_dmc_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DMC_CLK_CTRL,
 		.mask = 0x3,
@@ -1570,12 +1570,12 @@ static struct clk_regmap dmc_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "dmc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = sd_emmc_psram_dmc_parents,
-		.num_parents = ARRAY_SIZE(sd_emmc_psram_dmc_parents),
+		.parent_data = a1_sd_emmc_parents,
+		.num_parents = ARRAY_SIZE(a1_sd_emmc_parents),
 	},
 };
 
-static struct clk_regmap dmc_div = {
+static struct clk_regmap a1_dmc_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = DMC_CLK_CTRL,
 		.shift = 0,
@@ -1585,14 +1585,14 @@ static struct clk_regmap dmc_div = {
 		.name = "dmc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dmc_sel.hw
+			&a1_dmc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dmc_sel2 = {
+static struct clk_regmap a1_dmc_sel2 = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = DMC_CLK_CTRL,
 		.mask = 0x1,
@@ -1602,7 +1602,7 @@ static struct clk_regmap dmc_sel2 = {
 		.name = "dmc_sel2",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &dmc_div.hw },
+			{ .hw = &a1_dmc_div.hw },
 			{ .fw_name = "xtal", },
 		},
 		.num_parents = 2,
@@ -1610,7 +1610,7 @@ static struct clk_regmap dmc_sel2 = {
 	},
 };
 
-static struct clk_regmap dmc = {
+static struct clk_regmap a1_dmc = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = DMC_CLK_CTRL,
 		.bit_idx = 8,
@@ -1619,14 +1619,14 @@ static struct clk_regmap dmc = {
 		.name = "dmc",
 		.ops = &clk_regmap_gate_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dmc_sel2.hw
+			&a1_dmc_sel2.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ceca_32k_in = {
+static struct clk_regmap a1_ceca_32k_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CECA_CLK_CTRL0,
 		.bit_idx = 31,
@@ -1641,7 +1641,7 @@ static struct clk_regmap ceca_32k_in = {
 	},
 };
 
-static struct clk_regmap ceca_32k_div = {
+static struct clk_regmap a1_ceca_32k_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = CECA_CLK_CTRL0,
@@ -1668,19 +1668,19 @@ static struct clk_regmap ceca_32k_div = {
 			.shift   = 28,
 			.width   = 1,
 		},
-		.table = clk_32k_div_table,
+		.table = a1_32k_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "ceca_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ceca_32k_in.hw
+			&a1_ceca_32k_in.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap ceca_32k_sel_pre = {
+static struct clk_regmap a1_ceca_32k_sel_pre = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CECA_CLK_CTRL1,
 		.mask = 0x1,
@@ -1691,15 +1691,15 @@ static struct clk_regmap ceca_32k_sel_pre = {
 		.name = "ceca_32k_sel_pre",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ceca_32k_div.hw,
-			&ceca_32k_in.hw,
+			&a1_ceca_32k_div.hw,
+			&a1_ceca_32k_in.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ceca_32k_sel = {
+static struct clk_regmap a1_ceca_32k_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CECA_CLK_CTRL1,
 		.mask = 0x1,
@@ -1710,14 +1710,14 @@ static struct clk_regmap ceca_32k_sel = {
 		.name = "ceca_32k_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ceca_32k_sel_pre.hw,
-			&rtc.hw,
+			&a1_ceca_32k_sel_pre.hw,
+			&a1_rtc.hw,
 		},
 		.num_parents = 2,
 	},
 };
 
-static struct clk_regmap ceca_32k_out = {
+static struct clk_regmap a1_ceca_32k_out = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CECA_CLK_CTRL0,
 		.bit_idx = 30,
@@ -1726,14 +1726,14 @@ static struct clk_regmap ceca_32k_out = {
 		.name = "ceca_32k_out",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ceca_32k_sel.hw
+			&a1_ceca_32k_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap cecb_32k_in = {
+static struct clk_regmap a1_cecb_32k_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CECB_CLK_CTRL0,
 		.bit_idx = 31,
@@ -1748,7 +1748,7 @@ static struct clk_regmap cecb_32k_in = {
 	},
 };
 
-static struct clk_regmap cecb_32k_div = {
+static struct clk_regmap a1_cecb_32k_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = CECB_CLK_CTRL0,
@@ -1775,19 +1775,19 @@ static struct clk_regmap cecb_32k_div = {
 			.shift   = 28,
 			.width   = 1,
 		},
-		.table = clk_32k_div_table,
+		.table = a1_32k_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cecb_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&cecb_32k_in.hw
+			&a1_cecb_32k_in.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap cecb_32k_sel_pre = {
+static struct clk_regmap a1_cecb_32k_sel_pre = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CECB_CLK_CTRL1,
 		.mask = 0x1,
@@ -1798,15 +1798,15 @@ static struct clk_regmap cecb_32k_sel_pre = {
 		.name = "cecb_32k_sel_pre",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&cecb_32k_div.hw,
-			&cecb_32k_in.hw,
+			&a1_cecb_32k_div.hw,
+			&a1_cecb_32k_in.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap cecb_32k_sel = {
+static struct clk_regmap a1_cecb_32k_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CECB_CLK_CTRL1,
 		.mask = 0x1,
@@ -1817,14 +1817,14 @@ static struct clk_regmap cecb_32k_sel = {
 		.name = "cecb_32k_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&cecb_32k_sel_pre.hw,
-			&rtc.hw,
+			&a1_cecb_32k_sel_pre.hw,
+			&a1_rtc.hw,
 		},
 		.num_parents = 2,
 	},
 };
 
-static struct clk_regmap cecb_32k_out = {
+static struct clk_regmap a1_cecb_32k_out = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CECB_CLK_CTRL0,
 		.bit_idx = 30,
@@ -1833,241 +1833,243 @@ static struct clk_regmap cecb_32k_out = {
 		.name = "cecb_32k_out",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&cecb_32k_sel.hw
+			&a1_cecb_32k_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-#define MESON_GATE(_name, _reg, _bit) \
-	MESON_PCLK(_name, _reg, _bit, &sys.hw)
-
-static MESON_GATE(clktree,	SYS_CLK_EN0,	0);
-static MESON_GATE(reset_ctrl,	SYS_CLK_EN0,	1);
-static MESON_GATE(analog_ctrl,	SYS_CLK_EN0,	2);
-static MESON_GATE(pwr_ctrl,	SYS_CLK_EN0,	3);
-static MESON_GATE(pad_ctrl,	SYS_CLK_EN0,	4);
-static MESON_GATE(sys_ctrl,	SYS_CLK_EN0,	5);
-static MESON_GATE(temp_sensor,	SYS_CLK_EN0,	6);
-static MESON_GATE(am2axi_dev,	SYS_CLK_EN0,	7);
-static MESON_GATE(spicc_b,	SYS_CLK_EN0,	8);
-static MESON_GATE(spicc_a,	SYS_CLK_EN0,	9);
-static MESON_GATE(msr,		SYS_CLK_EN0,	10);
-static MESON_GATE(audio,	SYS_CLK_EN0,	11);
-static MESON_GATE(jtag_ctrl,	SYS_CLK_EN0,	12);
-static MESON_GATE(saradc_en,	SYS_CLK_EN0,	13);
-static MESON_GATE(pwm_ef,	SYS_CLK_EN0,	14);
-static MESON_GATE(pwm_cd,	SYS_CLK_EN0,	15);
-static MESON_GATE(pwm_ab,	SYS_CLK_EN0,	16);
-static MESON_GATE(cec,		SYS_CLK_EN0,	17);
-static MESON_GATE(i2c_s,	SYS_CLK_EN0,	18);
-static MESON_GATE(ir_ctrl,	SYS_CLK_EN0,	19);
-static MESON_GATE(i2c_m_d,	SYS_CLK_EN0,	20);
-static MESON_GATE(i2c_m_c,	SYS_CLK_EN0,	21);
-static MESON_GATE(i2c_m_b,	SYS_CLK_EN0,	22);
-static MESON_GATE(i2c_m_a,	SYS_CLK_EN0,	23);
-static MESON_GATE(acodec,	SYS_CLK_EN0,	24);
-static MESON_GATE(otp,		SYS_CLK_EN0,	25);
-static MESON_GATE(sd_emmc_a,	SYS_CLK_EN0,	26);
-static MESON_GATE(usb_phy,	SYS_CLK_EN0,	27);
-static MESON_GATE(usb_ctrl,	SYS_CLK_EN0,	28);
-static MESON_GATE(sys_dspb,	SYS_CLK_EN0,	29);
-static MESON_GATE(sys_dspa,	SYS_CLK_EN0,	30);
-static MESON_GATE(dma,		SYS_CLK_EN0,	31);
-static MESON_GATE(irq_ctrl,	SYS_CLK_EN1,	0);
-static MESON_GATE(nic,		SYS_CLK_EN1,	1);
-static MESON_GATE(gic,		SYS_CLK_EN1,	2);
-static MESON_GATE(uart_c,	SYS_CLK_EN1,	3);
-static MESON_GATE(uart_b,	SYS_CLK_EN1,	4);
-static MESON_GATE(uart_a,	SYS_CLK_EN1,	5);
-static MESON_GATE(sys_psram,	SYS_CLK_EN1,	6);
-static MESON_GATE(rsa,		SYS_CLK_EN1,	8);
-static MESON_GATE(coresight,	SYS_CLK_EN1,	9);
-static MESON_GATE(am2axi_vad,	AXI_CLK_EN,	0);
-static MESON_GATE(audio_vad,	AXI_CLK_EN,	1);
-static MESON_GATE(axi_dmc,	AXI_CLK_EN,	3);
-static MESON_GATE(axi_psram,	AXI_CLK_EN,	4);
-static MESON_GATE(ramb,		AXI_CLK_EN,	5);
-static MESON_GATE(rama,		AXI_CLK_EN,	6);
-static MESON_GATE(axi_spifc,	AXI_CLK_EN,	7);
-static MESON_GATE(axi_nic,	AXI_CLK_EN,	8);
-static MESON_GATE(axi_dma,	AXI_CLK_EN,	9);
-static MESON_GATE(cpu_ctrl,	AXI_CLK_EN,	10);
-static MESON_GATE(rom,		AXI_CLK_EN,	11);
-static MESON_GATE(prod_i2c,	AXI_CLK_EN,	12);
+#define A1_PCLK(_name, _reg, _bit) \
+	MESON_PCLK(a1_##_name, _reg, _bit, &a1_sys.hw)
+
+static A1_PCLK(clktree,		SYS_CLK_EN0,	0);
+static A1_PCLK(reset_ctrl,	SYS_CLK_EN0,	1);
+static A1_PCLK(analog_ctrl,	SYS_CLK_EN0,	2);
+static A1_PCLK(pwr_ctrl,	SYS_CLK_EN0,	3);
+static A1_PCLK(pad_ctrl,	SYS_CLK_EN0,	4);
+static A1_PCLK(sys_ctrl,	SYS_CLK_EN0,	5);
+static A1_PCLK(temp_sensor,	SYS_CLK_EN0,	6);
+static A1_PCLK(am2axi_dev,	SYS_CLK_EN0,	7);
+static A1_PCLK(spicc_b,		SYS_CLK_EN0,	8);
+static A1_PCLK(spicc_a,		SYS_CLK_EN0,	9);
+static A1_PCLK(msr,		SYS_CLK_EN0,	10);
+static A1_PCLK(audio,		SYS_CLK_EN0,	11);
+static A1_PCLK(jtag_ctrl,	SYS_CLK_EN0,	12);
+static A1_PCLK(saradc_en,	SYS_CLK_EN0,	13);
+static A1_PCLK(pwm_ef,		SYS_CLK_EN0,	14);
+static A1_PCLK(pwm_cd,		SYS_CLK_EN0,	15);
+static A1_PCLK(pwm_ab,		SYS_CLK_EN0,	16);
+static A1_PCLK(cec,		SYS_CLK_EN0,	17);
+static A1_PCLK(i2c_s,		SYS_CLK_EN0,	18);
+static A1_PCLK(ir_ctrl,		SYS_CLK_EN0,	19);
+static A1_PCLK(i2c_m_d,		SYS_CLK_EN0,	20);
+static A1_PCLK(i2c_m_c,		SYS_CLK_EN0,	21);
+static A1_PCLK(i2c_m_b,		SYS_CLK_EN0,	22);
+static A1_PCLK(i2c_m_a,		SYS_CLK_EN0,	23);
+static A1_PCLK(acodec,		SYS_CLK_EN0,	24);
+static A1_PCLK(otp,		SYS_CLK_EN0,	25);
+static A1_PCLK(sd_emmc_a,	SYS_CLK_EN0,	26);
+static A1_PCLK(usb_phy,		SYS_CLK_EN0,	27);
+static A1_PCLK(usb_ctrl,	SYS_CLK_EN0,	28);
+static A1_PCLK(sys_dspb,	SYS_CLK_EN0,	29);
+static A1_PCLK(sys_dspa,	SYS_CLK_EN0,	30);
+static A1_PCLK(dma,		SYS_CLK_EN0,	31);
+
+static A1_PCLK(irq_ctrl,	SYS_CLK_EN1,	0);
+static A1_PCLK(nic,		SYS_CLK_EN1,	1);
+static A1_PCLK(gic,		SYS_CLK_EN1,	2);
+static A1_PCLK(uart_c,		SYS_CLK_EN1,	3);
+static A1_PCLK(uart_b,		SYS_CLK_EN1,	4);
+static A1_PCLK(uart_a,		SYS_CLK_EN1,	5);
+static A1_PCLK(sys_psram,	SYS_CLK_EN1,	6);
+static A1_PCLK(rsa,		SYS_CLK_EN1,	8);
+static A1_PCLK(coresight,	SYS_CLK_EN1,	9);
+
+static A1_PCLK(am2axi_vad,	AXI_CLK_EN,	0);
+static A1_PCLK(audio_vad,	AXI_CLK_EN,	1);
+static A1_PCLK(axi_dmc,		AXI_CLK_EN,	3);
+static A1_PCLK(axi_psram,	AXI_CLK_EN,	4);
+static A1_PCLK(ramb,		AXI_CLK_EN,	5);
+static A1_PCLK(rama,		AXI_CLK_EN,	6);
+static A1_PCLK(axi_spifc,	AXI_CLK_EN,	7);
+static A1_PCLK(axi_nic,		AXI_CLK_EN,	8);
+static A1_PCLK(axi_dma,		AXI_CLK_EN,	9);
+static A1_PCLK(cpu_ctrl,	AXI_CLK_EN,	10);
+static A1_PCLK(rom,		AXI_CLK_EN,	11);
+static A1_PCLK(prod_i2c,	AXI_CLK_EN,	12);
 
 /* Array of all clocks registered by this provider */
-static struct clk_hw *a1_periphs_hw_clks[] = {
-	[CLKID_XTAL_IN]			= &xtal_in.hw,
-	[CLKID_FIXPLL_IN]		= &fixpll_in.hw,
-	[CLKID_USB_PHY_IN]		= &usb_phy_in.hw,
-	[CLKID_USB_CTRL_IN]		= &usb_ctrl_in.hw,
-	[CLKID_HIFIPLL_IN]		= &hifipll_in.hw,
-	[CLKID_SYSPLL_IN]		= &syspll_in.hw,
-	[CLKID_DDS_IN]			= &dds_in.hw,
-	[CLKID_SYS]			= &sys.hw,
-	[CLKID_CLKTREE]			= &clktree.hw,
-	[CLKID_RESET_CTRL]		= &reset_ctrl.hw,
-	[CLKID_ANALOG_CTRL]		= &analog_ctrl.hw,
-	[CLKID_PWR_CTRL]		= &pwr_ctrl.hw,
-	[CLKID_PAD_CTRL]		= &pad_ctrl.hw,
-	[CLKID_SYS_CTRL]		= &sys_ctrl.hw,
-	[CLKID_TEMP_SENSOR]		= &temp_sensor.hw,
-	[CLKID_AM2AXI_DIV]		= &am2axi_dev.hw,
-	[CLKID_SPICC_B]			= &spicc_b.hw,
-	[CLKID_SPICC_A]			= &spicc_a.hw,
-	[CLKID_MSR]			= &msr.hw,
-	[CLKID_AUDIO]			= &audio.hw,
-	[CLKID_JTAG_CTRL]		= &jtag_ctrl.hw,
-	[CLKID_SARADC_EN]		= &saradc_en.hw,
-	[CLKID_PWM_EF]			= &pwm_ef.hw,
-	[CLKID_PWM_CD]			= &pwm_cd.hw,
-	[CLKID_PWM_AB]			= &pwm_ab.hw,
-	[CLKID_CEC]			= &cec.hw,
-	[CLKID_I2C_S]			= &i2c_s.hw,
-	[CLKID_IR_CTRL]			= &ir_ctrl.hw,
-	[CLKID_I2C_M_D]			= &i2c_m_d.hw,
-	[CLKID_I2C_M_C]			= &i2c_m_c.hw,
-	[CLKID_I2C_M_B]			= &i2c_m_b.hw,
-	[CLKID_I2C_M_A]			= &i2c_m_a.hw,
-	[CLKID_ACODEC]			= &acodec.hw,
-	[CLKID_OTP]			= &otp.hw,
-	[CLKID_SD_EMMC_A]		= &sd_emmc_a.hw,
-	[CLKID_USB_PHY]			= &usb_phy.hw,
-	[CLKID_USB_CTRL]		= &usb_ctrl.hw,
-	[CLKID_SYS_DSPB]		= &sys_dspb.hw,
-	[CLKID_SYS_DSPA]		= &sys_dspa.hw,
-	[CLKID_DMA]			= &dma.hw,
-	[CLKID_IRQ_CTRL]		= &irq_ctrl.hw,
-	[CLKID_NIC]			= &nic.hw,
-	[CLKID_GIC]			= &gic.hw,
-	[CLKID_UART_C]			= &uart_c.hw,
-	[CLKID_UART_B]			= &uart_b.hw,
-	[CLKID_UART_A]			= &uart_a.hw,
-	[CLKID_SYS_PSRAM]		= &sys_psram.hw,
-	[CLKID_RSA]			= &rsa.hw,
-	[CLKID_CORESIGHT]		= &coresight.hw,
-	[CLKID_AM2AXI_VAD]		= &am2axi_vad.hw,
-	[CLKID_AUDIO_VAD]		= &audio_vad.hw,
-	[CLKID_AXI_DMC]			= &axi_dmc.hw,
-	[CLKID_AXI_PSRAM]		= &axi_psram.hw,
-	[CLKID_RAMB]			= &ramb.hw,
-	[CLKID_RAMA]			= &rama.hw,
-	[CLKID_AXI_SPIFC]		= &axi_spifc.hw,
-	[CLKID_AXI_NIC]			= &axi_nic.hw,
-	[CLKID_AXI_DMA]			= &axi_dma.hw,
-	[CLKID_CPU_CTRL]		= &cpu_ctrl.hw,
-	[CLKID_ROM]			= &rom.hw,
-	[CLKID_PROC_I2C]		= &prod_i2c.hw,
-	[CLKID_DSPA_SEL]		= &dspa_sel.hw,
-	[CLKID_DSPB_SEL]		= &dspb_sel.hw,
-	[CLKID_DSPA_EN]			= &dspa_en.hw,
-	[CLKID_DSPA_EN_NIC]		= &dspa_en_nic.hw,
-	[CLKID_DSPB_EN]			= &dspb_en.hw,
-	[CLKID_DSPB_EN_NIC]		= &dspb_en_nic.hw,
-	[CLKID_RTC]			= &rtc.hw,
-	[CLKID_CECA_32K]		= &ceca_32k_out.hw,
-	[CLKID_CECB_32K]		= &cecb_32k_out.hw,
-	[CLKID_24M]			= &clk_24m.hw,
-	[CLKID_12M]			= &clk_12m.hw,
-	[CLKID_FCLK_DIV2_DIVN]		= &fclk_div2_divn.hw,
-	[CLKID_GEN]			= &gen.hw,
-	[CLKID_SARADC_SEL]		= &saradc_sel.hw,
-	[CLKID_SARADC]			= &saradc.hw,
-	[CLKID_PWM_A]			= &pwm_a.hw,
-	[CLKID_PWM_B]			= &pwm_b.hw,
-	[CLKID_PWM_C]			= &pwm_c.hw,
-	[CLKID_PWM_D]			= &pwm_d.hw,
-	[CLKID_PWM_E]			= &pwm_e.hw,
-	[CLKID_PWM_F]			= &pwm_f.hw,
-	[CLKID_SPICC]			= &spicc.hw,
-	[CLKID_TS]			= &ts.hw,
-	[CLKID_SPIFC]			= &spifc.hw,
-	[CLKID_USB_BUS]			= &usb_bus.hw,
-	[CLKID_SD_EMMC]			= &sd_emmc.hw,
-	[CLKID_PSRAM]			= &psram.hw,
-	[CLKID_DMC]			= &dmc.hw,
-	[CLKID_SYS_A_SEL]		= &sys_a_sel.hw,
-	[CLKID_SYS_A_DIV]		= &sys_a_div.hw,
-	[CLKID_SYS_A]			= &sys_a.hw,
-	[CLKID_SYS_B_SEL]		= &sys_b_sel.hw,
-	[CLKID_SYS_B_DIV]		= &sys_b_div.hw,
-	[CLKID_SYS_B]			= &sys_b.hw,
-	[CLKID_DSPA_A_SEL]		= &dspa_a_sel.hw,
-	[CLKID_DSPA_A_DIV]		= &dspa_a_div.hw,
-	[CLKID_DSPA_A]			= &dspa_a.hw,
-	[CLKID_DSPA_B_SEL]		= &dspa_b_sel.hw,
-	[CLKID_DSPA_B_DIV]		= &dspa_b_div.hw,
-	[CLKID_DSPA_B]			= &dspa_b.hw,
-	[CLKID_DSPB_A_SEL]		= &dspb_a_sel.hw,
-	[CLKID_DSPB_A_DIV]		= &dspb_a_div.hw,
-	[CLKID_DSPB_A]			= &dspb_a.hw,
-	[CLKID_DSPB_B_SEL]		= &dspb_b_sel.hw,
-	[CLKID_DSPB_B_DIV]		= &dspb_b_div.hw,
-	[CLKID_DSPB_B]			= &dspb_b.hw,
-	[CLKID_RTC_32K_IN]		= &rtc_32k_in.hw,
-	[CLKID_RTC_32K_DIV]		= &rtc_32k_div.hw,
-	[CLKID_RTC_32K_XTAL]		= &rtc_32k_xtal.hw,
-	[CLKID_RTC_32K_SEL]		= &rtc_32k_sel.hw,
-	[CLKID_CECB_32K_IN]		= &cecb_32k_in.hw,
-	[CLKID_CECB_32K_DIV]		= &cecb_32k_div.hw,
-	[CLKID_CECB_32K_SEL_PRE]	= &cecb_32k_sel_pre.hw,
-	[CLKID_CECB_32K_SEL]		= &cecb_32k_sel.hw,
-	[CLKID_CECA_32K_IN]		= &ceca_32k_in.hw,
-	[CLKID_CECA_32K_DIV]		= &ceca_32k_div.hw,
-	[CLKID_CECA_32K_SEL_PRE]	= &ceca_32k_sel_pre.hw,
-	[CLKID_CECA_32K_SEL]		= &ceca_32k_sel.hw,
-	[CLKID_DIV2_PRE]		= &fclk_div2_divn_pre.hw,
-	[CLKID_24M_DIV2]		= &clk_24m_div2.hw,
-	[CLKID_GEN_SEL]			= &gen_sel.hw,
-	[CLKID_GEN_DIV]			= &gen_div.hw,
-	[CLKID_SARADC_DIV]		= &saradc_div.hw,
-	[CLKID_PWM_A_SEL]		= &pwm_a_sel.hw,
-	[CLKID_PWM_A_DIV]		= &pwm_a_div.hw,
-	[CLKID_PWM_B_SEL]		= &pwm_b_sel.hw,
-	[CLKID_PWM_B_DIV]		= &pwm_b_div.hw,
-	[CLKID_PWM_C_SEL]		= &pwm_c_sel.hw,
-	[CLKID_PWM_C_DIV]		= &pwm_c_div.hw,
-	[CLKID_PWM_D_SEL]		= &pwm_d_sel.hw,
-	[CLKID_PWM_D_DIV]		= &pwm_d_div.hw,
-	[CLKID_PWM_E_SEL]		= &pwm_e_sel.hw,
-	[CLKID_PWM_E_DIV]		= &pwm_e_div.hw,
-	[CLKID_PWM_F_SEL]		= &pwm_f_sel.hw,
-	[CLKID_PWM_F_DIV]		= &pwm_f_div.hw,
-	[CLKID_SPICC_SEL]		= &spicc_sel.hw,
-	[CLKID_SPICC_DIV]		= &spicc_div.hw,
-	[CLKID_SPICC_SEL2]		= &spicc_sel2.hw,
-	[CLKID_TS_DIV]			= &ts_div.hw,
-	[CLKID_SPIFC_SEL]		= &spifc_sel.hw,
-	[CLKID_SPIFC_DIV]		= &spifc_div.hw,
-	[CLKID_SPIFC_SEL2]		= &spifc_sel2.hw,
-	[CLKID_USB_BUS_SEL]		= &usb_bus_sel.hw,
-	[CLKID_USB_BUS_DIV]		= &usb_bus_div.hw,
-	[CLKID_SD_EMMC_SEL]		= &sd_emmc_sel.hw,
-	[CLKID_SD_EMMC_DIV]		= &sd_emmc_div.hw,
-	[CLKID_SD_EMMC_SEL2]		= &sd_emmc_sel2.hw,
-	[CLKID_PSRAM_SEL]		= &psram_sel.hw,
-	[CLKID_PSRAM_DIV]		= &psram_div.hw,
-	[CLKID_PSRAM_SEL2]		= &psram_sel2.hw,
-	[CLKID_DMC_SEL]			= &dmc_sel.hw,
-	[CLKID_DMC_DIV]			= &dmc_div.hw,
-	[CLKID_DMC_SEL2]		= &dmc_sel2.hw,
-};
-
-static const struct regmap_config a1_periphs_regmap_cfg = {
+static struct clk_hw *a1_peripherals_hw_clks[] = {
+	[CLKID_XTAL_IN]			= &a1_xtal_in.hw,
+	[CLKID_FIXPLL_IN]		= &a1_fixpll_in.hw,
+	[CLKID_USB_PHY_IN]		= &a1_usb_phy_in.hw,
+	[CLKID_USB_CTRL_IN]		= &a1_usb_ctrl_in.hw,
+	[CLKID_HIFIPLL_IN]		= &a1_hifipll_in.hw,
+	[CLKID_SYSPLL_IN]		= &a1_syspll_in.hw,
+	[CLKID_DDS_IN]			= &a1_dds_in.hw,
+	[CLKID_SYS]			= &a1_sys.hw,
+	[CLKID_CLKTREE]			= &a1_clktree.hw,
+	[CLKID_RESET_CTRL]		= &a1_reset_ctrl.hw,
+	[CLKID_ANALOG_CTRL]		= &a1_analog_ctrl.hw,
+	[CLKID_PWR_CTRL]		= &a1_pwr_ctrl.hw,
+	[CLKID_PAD_CTRL]		= &a1_pad_ctrl.hw,
+	[CLKID_SYS_CTRL]		= &a1_sys_ctrl.hw,
+	[CLKID_TEMP_SENSOR]		= &a1_temp_sensor.hw,
+	[CLKID_AM2AXI_DIV]		= &a1_am2axi_dev.hw,
+	[CLKID_SPICC_B]			= &a1_spicc_b.hw,
+	[CLKID_SPICC_A]			= &a1_spicc_a.hw,
+	[CLKID_MSR]			= &a1_msr.hw,
+	[CLKID_AUDIO]			= &a1_audio.hw,
+	[CLKID_JTAG_CTRL]		= &a1_jtag_ctrl.hw,
+	[CLKID_SARADC_EN]		= &a1_saradc_en.hw,
+	[CLKID_PWM_EF]			= &a1_pwm_ef.hw,
+	[CLKID_PWM_CD]			= &a1_pwm_cd.hw,
+	[CLKID_PWM_AB]			= &a1_pwm_ab.hw,
+	[CLKID_CEC]			= &a1_cec.hw,
+	[CLKID_I2C_S]			= &a1_i2c_s.hw,
+	[CLKID_IR_CTRL]			= &a1_ir_ctrl.hw,
+	[CLKID_I2C_M_D]			= &a1_i2c_m_d.hw,
+	[CLKID_I2C_M_C]			= &a1_i2c_m_c.hw,
+	[CLKID_I2C_M_B]			= &a1_i2c_m_b.hw,
+	[CLKID_I2C_M_A]			= &a1_i2c_m_a.hw,
+	[CLKID_ACODEC]			= &a1_acodec.hw,
+	[CLKID_OTP]			= &a1_otp.hw,
+	[CLKID_SD_EMMC_A]		= &a1_sd_emmc_a.hw,
+	[CLKID_USB_PHY]			= &a1_usb_phy.hw,
+	[CLKID_USB_CTRL]		= &a1_usb_ctrl.hw,
+	[CLKID_SYS_DSPB]		= &a1_sys_dspb.hw,
+	[CLKID_SYS_DSPA]		= &a1_sys_dspa.hw,
+	[CLKID_DMA]			= &a1_dma.hw,
+	[CLKID_IRQ_CTRL]		= &a1_irq_ctrl.hw,
+	[CLKID_NIC]			= &a1_nic.hw,
+	[CLKID_GIC]			= &a1_gic.hw,
+	[CLKID_UART_C]			= &a1_uart_c.hw,
+	[CLKID_UART_B]			= &a1_uart_b.hw,
+	[CLKID_UART_A]			= &a1_uart_a.hw,
+	[CLKID_SYS_PSRAM]		= &a1_sys_psram.hw,
+	[CLKID_RSA]			= &a1_rsa.hw,
+	[CLKID_CORESIGHT]		= &a1_coresight.hw,
+	[CLKID_AM2AXI_VAD]		= &a1_am2axi_vad.hw,
+	[CLKID_AUDIO_VAD]		= &a1_audio_vad.hw,
+	[CLKID_AXI_DMC]			= &a1_axi_dmc.hw,
+	[CLKID_AXI_PSRAM]		= &a1_axi_psram.hw,
+	[CLKID_RAMB]			= &a1_ramb.hw,
+	[CLKID_RAMA]			= &a1_rama.hw,
+	[CLKID_AXI_SPIFC]		= &a1_axi_spifc.hw,
+	[CLKID_AXI_NIC]			= &a1_axi_nic.hw,
+	[CLKID_AXI_DMA]			= &a1_axi_dma.hw,
+	[CLKID_CPU_CTRL]		= &a1_cpu_ctrl.hw,
+	[CLKID_ROM]			= &a1_rom.hw,
+	[CLKID_PROC_I2C]		= &a1_prod_i2c.hw,
+	[CLKID_DSPA_SEL]		= &a1_dspa_sel.hw,
+	[CLKID_DSPB_SEL]		= &a1_dspb_sel.hw,
+	[CLKID_DSPA_EN]			= &a1_dspa_en.hw,
+	[CLKID_DSPA_EN_NIC]		= &a1_dspa_en_nic.hw,
+	[CLKID_DSPB_EN]			= &a1_dspb_en.hw,
+	[CLKID_DSPB_EN_NIC]		= &a1_dspb_en_nic.hw,
+	[CLKID_RTC]			= &a1_rtc.hw,
+	[CLKID_CECA_32K]		= &a1_ceca_32k_out.hw,
+	[CLKID_CECB_32K]		= &a1_cecb_32k_out.hw,
+	[CLKID_24M]			= &a1_24m.hw,
+	[CLKID_12M]			= &a1_12m.hw,
+	[CLKID_FCLK_DIV2_DIVN]		= &a1_fclk_div2_divn.hw,
+	[CLKID_GEN]			= &a1_gen.hw,
+	[CLKID_SARADC_SEL]		= &a1_saradc_sel.hw,
+	[CLKID_SARADC]			= &a1_saradc.hw,
+	[CLKID_PWM_A]			= &a1_pwm_a.hw,
+	[CLKID_PWM_B]			= &a1_pwm_b.hw,
+	[CLKID_PWM_C]			= &a1_pwm_c.hw,
+	[CLKID_PWM_D]			= &a1_pwm_d.hw,
+	[CLKID_PWM_E]			= &a1_pwm_e.hw,
+	[CLKID_PWM_F]			= &a1_pwm_f.hw,
+	[CLKID_SPICC]			= &a1_spicc.hw,
+	[CLKID_TS]			= &a1_ts.hw,
+	[CLKID_SPIFC]			= &a1_spifc.hw,
+	[CLKID_USB_BUS]			= &a1_usb_bus.hw,
+	[CLKID_SD_EMMC]			= &a1_sd_emmc.hw,
+	[CLKID_PSRAM]			= &a1_psram.hw,
+	[CLKID_DMC]			= &a1_dmc.hw,
+	[CLKID_SYS_A_SEL]		= &a1_sys_a_sel.hw,
+	[CLKID_SYS_A_DIV]		= &a1_sys_a_div.hw,
+	[CLKID_SYS_A]			= &a1_sys_a.hw,
+	[CLKID_SYS_B_SEL]		= &a1_sys_b_sel.hw,
+	[CLKID_SYS_B_DIV]		= &a1_sys_b_div.hw,
+	[CLKID_SYS_B]			= &a1_sys_b.hw,
+	[CLKID_DSPA_A_SEL]		= &a1_dspa_a_sel.hw,
+	[CLKID_DSPA_A_DIV]		= &a1_dspa_a_div.hw,
+	[CLKID_DSPA_A]			= &a1_dspa_a.hw,
+	[CLKID_DSPA_B_SEL]		= &a1_dspa_b_sel.hw,
+	[CLKID_DSPA_B_DIV]		= &a1_dspa_b_div.hw,
+	[CLKID_DSPA_B]			= &a1_dspa_b.hw,
+	[CLKID_DSPB_A_SEL]		= &a1_dspb_a_sel.hw,
+	[CLKID_DSPB_A_DIV]		= &a1_dspb_a_div.hw,
+	[CLKID_DSPB_A]			= &a1_dspb_a.hw,
+	[CLKID_DSPB_B_SEL]		= &a1_dspb_b_sel.hw,
+	[CLKID_DSPB_B_DIV]		= &a1_dspb_b_div.hw,
+	[CLKID_DSPB_B]			= &a1_dspb_b.hw,
+	[CLKID_RTC_32K_IN]		= &a1_rtc_32k_in.hw,
+	[CLKID_RTC_32K_DIV]		= &a1_rtc_32k_div.hw,
+	[CLKID_RTC_32K_XTAL]		= &a1_rtc_32k_xtal.hw,
+	[CLKID_RTC_32K_SEL]		= &a1_rtc_32k_sel.hw,
+	[CLKID_CECB_32K_IN]		= &a1_cecb_32k_in.hw,
+	[CLKID_CECB_32K_DIV]		= &a1_cecb_32k_div.hw,
+	[CLKID_CECB_32K_SEL_PRE]	= &a1_cecb_32k_sel_pre.hw,
+	[CLKID_CECB_32K_SEL]		= &a1_cecb_32k_sel.hw,
+	[CLKID_CECA_32K_IN]		= &a1_ceca_32k_in.hw,
+	[CLKID_CECA_32K_DIV]		= &a1_ceca_32k_div.hw,
+	[CLKID_CECA_32K_SEL_PRE]	= &a1_ceca_32k_sel_pre.hw,
+	[CLKID_CECA_32K_SEL]		= &a1_ceca_32k_sel.hw,
+	[CLKID_DIV2_PRE]		= &a1_fclk_div2_divn_pre.hw,
+	[CLKID_24M_DIV2]		= &a1_24m_div2.hw,
+	[CLKID_GEN_SEL]			= &a1_gen_sel.hw,
+	[CLKID_GEN_DIV]			= &a1_gen_div.hw,
+	[CLKID_SARADC_DIV]		= &a1_saradc_div.hw,
+	[CLKID_PWM_A_SEL]		= &a1_pwm_a_sel.hw,
+	[CLKID_PWM_A_DIV]		= &a1_pwm_a_div.hw,
+	[CLKID_PWM_B_SEL]		= &a1_pwm_b_sel.hw,
+	[CLKID_PWM_B_DIV]		= &a1_pwm_b_div.hw,
+	[CLKID_PWM_C_SEL]		= &a1_pwm_c_sel.hw,
+	[CLKID_PWM_C_DIV]		= &a1_pwm_c_div.hw,
+	[CLKID_PWM_D_SEL]		= &a1_pwm_d_sel.hw,
+	[CLKID_PWM_D_DIV]		= &a1_pwm_d_div.hw,
+	[CLKID_PWM_E_SEL]		= &a1_pwm_e_sel.hw,
+	[CLKID_PWM_E_DIV]		= &a1_pwm_e_div.hw,
+	[CLKID_PWM_F_SEL]		= &a1_pwm_f_sel.hw,
+	[CLKID_PWM_F_DIV]		= &a1_pwm_f_div.hw,
+	[CLKID_SPICC_SEL]		= &a1_spicc_sel.hw,
+	[CLKID_SPICC_DIV]		= &a1_spicc_div.hw,
+	[CLKID_SPICC_SEL2]		= &a1_spicc_sel2.hw,
+	[CLKID_TS_DIV]			= &a1_ts_div.hw,
+	[CLKID_SPIFC_SEL]		= &a1_spifc_sel.hw,
+	[CLKID_SPIFC_DIV]		= &a1_spifc_div.hw,
+	[CLKID_SPIFC_SEL2]		= &a1_spifc_sel2.hw,
+	[CLKID_USB_BUS_SEL]		= &a1_usb_bus_sel.hw,
+	[CLKID_USB_BUS_DIV]		= &a1_usb_bus_div.hw,
+	[CLKID_SD_EMMC_SEL]		= &a1_sd_emmc_sel.hw,
+	[CLKID_SD_EMMC_DIV]		= &a1_sd_emmc_div.hw,
+	[CLKID_SD_EMMC_SEL2]		= &a1_sd_emmc_sel2.hw,
+	[CLKID_PSRAM_SEL]		= &a1_psram_sel.hw,
+	[CLKID_PSRAM_DIV]		= &a1_psram_div.hw,
+	[CLKID_PSRAM_SEL2]		= &a1_psram_sel2.hw,
+	[CLKID_DMC_SEL]			= &a1_dmc_sel.hw,
+	[CLKID_DMC_DIV]			= &a1_dmc_div.hw,
+	[CLKID_DMC_SEL2]		= &a1_dmc_sel2.hw,
+};
+
+static const struct regmap_config a1_peripherals_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,
 	.max_register = DMC_CLK_CTRL,
 };
 
-static struct meson_clk_hw_data a1_periphs_clks = {
-	.hws = a1_periphs_hw_clks,
-	.num = ARRAY_SIZE(a1_periphs_hw_clks),
+static struct meson_clk_hw_data a1_peripherals_clks = {
+	.hws = a1_peripherals_hw_clks,
+	.num = ARRAY_SIZE(a1_peripherals_hw_clks),
 };
 
-static int meson_a1_periphs_probe(struct platform_device *pdev)
+static int a1_peripherals_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
@@ -2079,36 +2081,36 @@ static int meson_a1_periphs_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(base),
 				     "can't ioremap resource\n");
 
-	map = devm_regmap_init_mmio(dev, base, &a1_periphs_regmap_cfg);
+	map = devm_regmap_init_mmio(dev, base, &a1_peripherals_regmap_cfg);
 	if (IS_ERR(map))
 		return dev_err_probe(dev, PTR_ERR(map),
 				     "can't init regmap mmio region\n");
 
-	for (clkid = 0; clkid < a1_periphs_clks.num; clkid++) {
-		err = devm_clk_hw_register(dev, a1_periphs_clks.hws[clkid]);
+	for (clkid = 0; clkid < a1_peripherals_clks.num; clkid++) {
+		err = devm_clk_hw_register(dev, a1_peripherals_clks.hws[clkid]);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "clock[%d] registration failed\n",
 					     clkid);
 	}
 
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_periphs_clks);
+	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_peripherals_clks);
 }
 
-static const struct of_device_id a1_periphs_clkc_match_table[] = {
+static const struct of_device_id a1_peripherals_clkc_match_table[] = {
 	{ .compatible = "amlogic,a1-peripherals-clkc", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, a1_periphs_clkc_match_table);
+MODULE_DEVICE_TABLE(of, a1_peripherals_clkc_match_table);
 
-static struct platform_driver a1_periphs_clkc_driver = {
-	.probe = meson_a1_periphs_probe,
+static struct platform_driver a1_peripherals_clkc_driver = {
+	.probe = a1_peripherals_clkc_probe,
 	.driver = {
 		.name = "a1-peripherals-clkc",
-		.of_match_table = a1_periphs_clkc_match_table,
+		.of_match_table = a1_peripherals_clkc_match_table,
 	},
 };
-module_platform_driver(a1_periphs_clkc_driver);
+module_platform_driver(a1_peripherals_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic A1 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");

-- 
2.47.2

