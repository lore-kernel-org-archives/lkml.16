Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10CF2D77E4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470056; cv=none; b=kBwXFueYJhsubuTaMK7G24sTjFQrMp8SmQeM9m+k6aguc+YtU+mgg32aL6iHkWJKlge5UtWxGgO+d97XGBUYJz4zcjAGbZeaw9W4XB9Te5ogzt3agBFUbaB1ybKBrhVBoDkmaYsvsQ5+G4OjElIOoVBDKp5vwYqkzCp6RLL3QZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470056; c=relaxed/simple;
	bh=0iwTbwU3c4h3tACHgSyfJtBl9bT45xtnT02E/ppaego=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPfIXvnTXY+THqMPBEuJRgwvy1DgBeoQlJteSYd3jnTAkhivgQQJpBz5t+JRqM5bTj3s87K+DErhsW/mGQhI2FKvS96ZRNwZiXO0IyoNsyoW00NoBKPTec7rlc2lwzSZOVEkPL1mn6vcRS7R2lAAbHufpnM7OPRhZgRo5vTlBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dk0hCE5H; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dk0hCE5H"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso3253129f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470047; x=1752074847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zx8nYuRZwjIRaxEJw2Os+ospfzu5Ofx29+KOMu46oY4=;
        b=dk0hCE5H54jX+m1jxK31n057oAtIM9SJnSzIdj+d40NrVCPoHDNtbCKu5GQlvX3/eT
         I2408KKY136qTb/nMWfbbcNr/8g+JQtTmFPNox3BIsvspcaQGjrTh5HVpuPhbNKT9ON9
         j0+ZAYVKssPqlg40EwVwAo0p/WBv7SwbK01LVen7QGPthDeeV0r0cd8tcOvRuUmQNsIM
         4sM0L15qmdNLNgCJT+j7NZL8tAVefr67w3fLHWWKSFFGze/wM9EzxS1D/GtBBw8uEtCv
         HWSomZlmB0lhprPFwBZpvmlws0RNcx2jwtduNKTsbf//1doYZsO6XzO8Evy+rZdSEd25
         qtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470047; x=1752074847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx8nYuRZwjIRaxEJw2Os+ospfzu5Ofx29+KOMu46oY4=;
        b=qKPIMQ1OWrBRbeeqXLqxz9MeDz9K1sVIEOk6U91wHrhj98I1ptNIcBSUpqTohkJeyC
         J8BLnOqUA3WrTbhlTD4g3neTT7pSCOW4nMK5ABwybbbwiUBDa+iU72jUORg8wZ6jR/1y
         jCSkh9IWi1qM4Vn0HMXiJG6y7b2iUfUP2V6rqLdGZYP7n48prh8tjpTkkwrb2oJfsjNU
         47ddOw6JYVfMkDjvyU6bHuSY40P1ipsP6+BOGstLIz45PfPImEn6Z9x3Xg9/9WZDQLfE
         lSNVFRT5uIN2IWi9BkV/kWEKKr8gq2pVxTZemtMLMZtQo+gBS9EKyBVB6bmm4gMhYuWY
         NGLw==
X-Forwarded-Encrypted: i=1; AJvYcCWqFk1+xBnwh10y2mlAi6gQDB56FszXkUlVM/5kud3G7uxoHj4j8dahSRMFRw6EpH7xSSnyfxrhSug/jgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH0qtJh7tdR+0nnzCgblAfMhLMm9jOjWq2oOj/7yUieFkKNsel
	qulROqwKbNWU6hnFuJEggrjByzAeF/2dko3vsYH3KVCxWF0e/ukBicwy8ZScZ7/32L0=
X-Gm-Gg: ASbGncvQQjSdnN2y1qqV0tNwA8EwIiG4F9B5vUMwaFhmjFH6J/VgFzKRAA6hqPHrgMv
	GBhUAOEa45YatLQJ+2pL8mzhEG2oO2jKrvzXsaieE7aqv5JxTJ6vbBsTyiwyYakxZHAN+hVKRxT
	kqBQtrzdSpY1oRwuVR54PiEJPbFMGogl8jDHcp+N/S1hK5mH4hwGnou63oqgmIQ7bNG1x/2CHwQ
	77H5wrZio1dwIgR6mqqlal+G0Uo+Xj+wWPrPpSmFU0hI7xaSyQKlpiEfLYOqL/8I3P1bwhfK/gT
	pWvd4xLfCkaQO1Mb+Ed3wuiMs+WctsWbthVMoe+nSNcAycFNv54Y2y/JaPP0WkfmhUwQi+uwR2h
	f
X-Google-Smtp-Source: AGHT+IElG3YcAIQ7GVlJMaXMi5sM1HmWbtPjt7GjXOFwaBhCAyva0esLyPNPtjoynFv6MQhXRClpxQ==
X-Received: by 2002:a05:6000:25c7:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3b1fdc22221mr2665598f8f.13.1751470046490;
        Wed, 02 Jul 2025 08:27:26 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:10 +0200
Subject: [PATCH 12/26] clk: amlogic: s4-peripherals: naming consistency
 alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-12-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=66675; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0iwTbwU3c4h3tACHgSyfJtBl9bT45xtnT02E/ppaego=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/B8vIOGbFrfQG+ivjtQoP8p4ck00pKLcMRk
 QpsvOqoLmWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPwQAKCRDm/A8cN/La
 haZtD/41kmB6QedC41SG7x8mXbxhgj7aYYUY/P5LwU347Tfbq9k3UXfyx2w/Wa8PF35aONQyciK
 3MpfSapS0/2fhQZJtyKZdfwbOUEG75/6AoTCPP5E755OtOuaaO711xGm/kgAoyo00GXsIrwUfZG
 pMmeNQnGgwuHH2267h57Rd3GEX+FaLjkV1/aV+lYubWaQZrlTcT6gQSYabv4G4RtbS0IfXWPxOu
 fc+buWaZqfyaOOx+k4QbZt5xgxV7gTsYpRYUXGTYcfgtATcrm0yFTty+JRPQSSD0VOOLbFrCpaU
 cs83g8kOqHzUyB7JEsIqDGr7iAkeLxNwY1hk2ezINtZTyYTRIoIdb1PRl2iJjdK4iKF82dp0Uyk
 TamrQ9Y2Uq6I+MoYq5LwzFXO/mzD8yLT+55yoeOVzOHpplWrr1IZm7lnT70JURVjF4v9L6IoUcr
 J7souRSr80Ch/Feym2FpQlnGTD7t8MA9m9PBX+PmD0e9HBdJldJaXe9Ona0wvQfdrFK+bbj25rn
 //+5GZ+GsElY/GbCsVDhtKgU0qX9ySR+V9xjgz3HFxJ1EbXLR6pmlEL3BqqyA2yIxq6IwJgNyY2
 mNkCpupQpwcCjhewC8zhoRYSCgkP/i5frGegatsH5qIgxkWOhJGo4+1Po6dlylHHWQnIz31oxjx
 U0iPUak9lfHO3bg==
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
 drivers/clk/meson/s4-peripherals.c | 746 ++++++++++++++++++-------------------
 1 file changed, 370 insertions(+), 376 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index c9400cf54c84c3dc7c63d0636933951b0cac230c..9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -182,8 +182,8 @@ static struct clk_regmap s4_rtc_clk = {
 };
 
 /* The index 5 is AXI_CLK, which is dedicated to AXI. So skip it. */
-static u32 mux_table_sys_ab_clk_sel[] = { 0, 1, 2, 3, 4, 6, 7 };
-static const struct clk_parent_data sys_ab_clk_parent_data[] = {
+static u32 s4_sysclk_parents_val_table[] = { 0, 1, 2, 3, 4, 6, 7 };
+static const struct clk_parent_data s4_sysclk_parents[] = {
 	{ .fw_name = "xtal" },
 	{ .fw_name = "fclk_div2" },
 	{ .fw_name = "fclk_div3" },
@@ -205,13 +205,13 @@ static struct clk_regmap s4_sysclk_b_sel = {
 		.offset = CLKCTRL_SYS_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 26,
-		.table = mux_table_sys_ab_clk_sel,
+		.table = s4_sysclk_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sysclk_b_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = sys_ab_clk_parent_data,
-		.num_parents = ARRAY_SIZE(sys_ab_clk_parent_data),
+		.parent_data = s4_sysclk_parents,
+		.num_parents = ARRAY_SIZE(s4_sysclk_parents),
 	},
 };
 
@@ -251,13 +251,13 @@ static struct clk_regmap s4_sysclk_a_sel = {
 		.offset = CLKCTRL_SYS_CLK_CTRL0,
 		.mask = 0x7,
 		.shift = 10,
-		.table = mux_table_sys_ab_clk_sel,
+		.table = s4_sysclk_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sysclk_a_sel",
 		.ops = &clk_regmap_mux_ro_ops,
-		.parent_data = sys_ab_clk_parent_data,
-		.num_parents = ARRAY_SIZE(sys_ab_clk_parent_data),
+		.parent_data = s4_sysclk_parents,
+		.num_parents = ARRAY_SIZE(s4_sysclk_parents),
 	},
 };
 
@@ -523,24 +523,24 @@ static struct clk_regmap s4_cecb_32k_clkout = {
 	},
 };
 
-static const struct clk_parent_data s4_sc_parent_data[] = {
+static const struct clk_parent_data s4_sc_clk_parents[] = {
 	{ .fw_name = "fclk_div4" },
 	{ .fw_name = "fclk_div3" },
 	{ .fw_name = "fclk_div5" },
 	{ .fw_name = "xtal", }
 };
 
-static struct clk_regmap s4_sc_clk_mux = {
+static struct clk_regmap s4_sc_clk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_SC_CLK_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "sc_clk_mux",
+		.name = "sc_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_sc_parent_data,
-		.num_parents = ARRAY_SIZE(s4_sc_parent_data),
+		.parent_data = s4_sc_clk_parents,
+		.num_parents = ARRAY_SIZE(s4_sc_clk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -555,20 +555,20 @@ static struct clk_regmap s4_sc_clk_div = {
 		.name = "sc_clk_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_sc_clk_mux.hw
+			&s4_sc_clk_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_sc_clk_gate = {
+static struct clk_regmap s4_sc_clk = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_SC_CLK_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "sc_clk_gate",
+		.name = "sc_clk",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_sc_clk_div.hw
@@ -578,13 +578,13 @@ static struct clk_regmap s4_sc_clk_gate = {
 	},
 };
 
-static struct clk_regmap s4_12_24M_clk_gate = {
+static struct clk_regmap s4_12_24M = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_CLK12_24_CTRL,
 		.bit_idx = 11,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "12_24m_gate",
+		.name = "12_24M",
 		.ops = &clk_regmap_gate_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "xtal", }
@@ -593,32 +593,32 @@ static struct clk_regmap s4_12_24M_clk_gate = {
 	},
 };
 
-static struct clk_fixed_factor s4_12M_clk_div = {
+static struct clk_fixed_factor s4_12M_div = {
 	.mult = 1,
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
-		.name = "12M",
+		.name = "12M_div",
 		.ops = &clk_fixed_factor_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_12_24M_clk_gate.hw
+			&s4_12_24M.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_12_24M_clk = {
+static struct clk_regmap s4_12_24M_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_CLK12_24_CTRL,
 		.mask = 0x1,
 		.shift = 10,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "12_24m",
+		.name = "12_24M_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_12_24M_clk_gate.hw,
-			&s4_12M_clk_div.hw,
+			&s4_12_24M.hw,
+			&s4_12M_div.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
@@ -687,7 +687,7 @@ static struct clk_regmap s4_vid_pll = {
 	},
 };
 
-static const struct clk_parent_data s4_vclk_parent_data[] = {
+static const struct clk_parent_data s4_vclk_parents[] = {
 	{ .hw = &s4_vid_pll.hw },
 	{ .fw_name = "gp0_pll", },
 	{ .fw_name = "hifi_pll", },
@@ -707,8 +707,8 @@ static struct clk_regmap s4_vclk_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vclk_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vclk_parent_data),
+		.parent_data = s4_vclk_parents,
+		.num_parents = ARRAY_SIZE(s4_vclk_parents),
 		.flags = 0,
 	},
 };
@@ -722,8 +722,8 @@ static struct clk_regmap s4_vclk2_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vclk2_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vclk_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vclk_parent_data),
+		.parent_data = s4_vclk_parents,
+		.num_parents = ARRAY_SIZE(s4_vclk_parents),
 		.flags = 0,
 	},
 };
@@ -1071,8 +1071,8 @@ static struct clk_fixed_factor s4_vclk2_div12 = {
 };
 
 /* The 5,6,7 indexes corresponds to no real clock, so there are not used. */
-static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *s4_cts_parent_hws[] = {
+static u32 s4_cts_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *s4_cts_parents[] = {
 	&s4_vclk_div1.hw,
 	&s4_vclk_div2.hw,
 	&s4_vclk_div4.hw,
@@ -1090,13 +1090,13 @@ static struct clk_regmap s4_cts_enci_sel = {
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 28,
-		.table = mux_table_cts_sel,
+		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_enci_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_cts_parent_hws),
+		.parent_hws = s4_cts_parents,
+		.num_parents = ARRAY_SIZE(s4_cts_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1106,13 +1106,13 @@ static struct clk_regmap s4_cts_encp_sel = {
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 20,
-		.table = mux_table_cts_sel,
+		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_encp_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_cts_parent_hws),
+		.parent_hws = s4_cts_parents,
+		.num_parents = ARRAY_SIZE(s4_cts_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1122,20 +1122,20 @@ static struct clk_regmap s4_cts_vdac_sel = {
 		.offset = CLKCTRL_VIID_CLK_DIV,
 		.mask = 0xf,
 		.shift = 28,
-		.table = mux_table_cts_sel,
+		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_vdac_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_cts_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_cts_parent_hws),
+		.parent_hws = s4_cts_parents,
+		.num_parents = ARRAY_SIZE(s4_cts_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* The 5,6,7 indexes corresponds to no real clock, so there are not used. */
-static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-static const struct clk_hw *s4_cts_hdmi_tx_parent_hws[] = {
+static u32 s4_hdmi_tx_parents_val_table[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
+static const struct clk_hw *s4_hdmi_tx_parents[] = {
 	&s4_vclk_div1.hw,
 	&s4_vclk_div2.hw,
 	&s4_vclk_div4.hw,
@@ -1153,13 +1153,13 @@ static struct clk_regmap s4_hdmi_tx_sel = {
 		.offset = CLKCTRL_HDMI_CLK_CTRL,
 		.mask = 0xf,
 		.shift = 16,
-		.table = mux_table_hdmi_tx_sel,
+		.table = s4_hdmi_tx_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_tx_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_cts_hdmi_tx_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_cts_hdmi_tx_parent_hws),
+		.parent_hws = s4_hdmi_tx_parents,
+		.num_parents = ARRAY_SIZE(s4_hdmi_tx_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1229,7 +1229,7 @@ static struct clk_regmap s4_hdmi_tx = {
 };
 
 /* HDMI Clocks */
-static const struct clk_parent_data s4_hdmi_parent_data[] = {
+static const struct clk_parent_data s4_hdmi_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
@@ -1246,8 +1246,8 @@ static struct clk_regmap s4_hdmi_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_hdmi_parent_data,
-		.num_parents = ARRAY_SIZE(s4_hdmi_parent_data),
+		.parent_data = s4_hdmi_parents,
+		.num_parents = ARRAY_SIZE(s4_hdmi_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1298,7 +1298,7 @@ static struct clk_regmap s4_ts_clk_div = {
 	},
 };
 
-static struct clk_regmap s4_ts_clk_gate = {
+static struct clk_regmap s4_ts_clk = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_TS_CLK_CTRL,
 		.bit_idx = 8,
@@ -1320,7 +1320,7 @@ static struct clk_regmap s4_ts_clk_gate = {
  * mux because it does top-to-bottom updates the each clock tree and
  * switches to the "inactive" one when CLK_SET_RATE_GATE is set.
  */
-static const struct clk_parent_data s4_mali_0_1_parent_data[] = {
+static const struct clk_parent_data s4_mali_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .fw_name = "gp0_pll", },
 	{ .fw_name = "hifi_pll", },
@@ -1340,8 +1340,8 @@ static struct clk_regmap s4_mali_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_mali_0_1_parent_data,
-		.num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
+		.parent_data = s4_mali_parents,
+		.num_parents = ARRAY_SIZE(s4_mali_parents),
 		/*
 		 * Don't request the parent to change the rate because
 		 * all GPU frequencies can be derived from the fclk_*
@@ -1394,8 +1394,8 @@ static struct clk_regmap s4_mali_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mali_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_mali_0_1_parent_data,
-		.num_parents = ARRAY_SIZE(s4_mali_0_1_parent_data),
+		.parent_data = s4_mali_parents,
+		.num_parents = ARRAY_SIZE(s4_mali_parents),
 		.flags = 0,
 	},
 };
@@ -1433,28 +1433,26 @@ static struct clk_regmap s4_mali_1 = {
 	},
 };
 
-static const struct clk_hw *s4_mali_parent_hws[] = {
-	&s4_mali_0.hw,
-	&s4_mali_1.hw
-};
-
-static struct clk_regmap s4_mali_mux = {
+static struct clk_regmap s4_mali_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_MALI_CLK_CTRL,
 		.mask = 1,
 		.shift = 31,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "mali",
+		.name = "mali_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_mali_parent_hws,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_mali_0.hw,
+			&s4_mali_1.hw,
+		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* VDEC clocks */
-static const struct clk_parent_data s4_dec_parent_data[] = {
+static const struct clk_parent_data s4_dec_parents[] = {
 	{ .fw_name = "fclk_div2p5", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div4", },
@@ -1465,7 +1463,7 @@ static const struct clk_parent_data s4_dec_parent_data[] = {
 	{ .fw_name = "xtal", }
 };
 
-static struct clk_regmap s4_vdec_p0_mux = {
+static struct clk_regmap s4_vdec_p0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDEC_CLK_CTRL,
 		.mask = 0x7,
@@ -1473,10 +1471,10 @@ static struct clk_regmap s4_vdec_p0_mux = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vdec_p0_mux",
+		.name = "vdec_p0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_dec_parent_data,
-		.num_parents = ARRAY_SIZE(s4_dec_parent_data),
+		.parent_data = s4_dec_parents,
+		.num_parents = ARRAY_SIZE(s4_dec_parents),
 		.flags = 0,
 	},
 };
@@ -1492,7 +1490,7 @@ static struct clk_regmap s4_vdec_p0_div = {
 		.name = "vdec_p0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_vdec_p0_mux.hw
+			&s4_vdec_p0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1515,7 +1513,7 @@ static struct clk_regmap s4_vdec_p0 = {
 	},
 };
 
-static struct clk_regmap s4_vdec_p1_mux = {
+static struct clk_regmap s4_vdec_p1_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDEC3_CLK_CTRL,
 		.mask = 0x7,
@@ -1523,10 +1521,10 @@ static struct clk_regmap s4_vdec_p1_mux = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vdec_p1_mux",
+		.name = "vdec_p1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_dec_parent_data,
-		.num_parents = ARRAY_SIZE(s4_dec_parent_data),
+		.parent_data = s4_dec_parents,
+		.num_parents = ARRAY_SIZE(s4_dec_parents),
 		.flags = 0,
 	},
 };
@@ -1542,7 +1540,7 @@ static struct clk_regmap s4_vdec_p1_div = {
 		.name = "vdec_p1_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_vdec_p1_mux.hw
+			&s4_vdec_p1_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1565,27 +1563,25 @@ static struct clk_regmap s4_vdec_p1 = {
 	},
 };
 
-static const struct clk_hw *s4_vdec_mux_parent_hws[] = {
-	&s4_vdec_p0.hw,
-	&s4_vdec_p1.hw
-};
-
-static struct clk_regmap s4_vdec_mux = {
+static struct clk_regmap s4_vdec_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDEC3_CLK_CTRL,
 		.mask = 0x1,
 		.shift = 15,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vdec_mux",
+		.name = "vdec_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_vdec_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_vdec_mux_parent_hws),
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_vdec_p0.hw,
+			&s4_vdec_p1.hw,
+		},
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_hevcf_p0_mux = {
+static struct clk_regmap s4_hevcf_p0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDEC2_CLK_CTRL,
 		.mask = 0x7,
@@ -1593,10 +1589,10 @@ static struct clk_regmap s4_hevcf_p0_mux = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "hevcf_p0_mux",
+		.name = "hevcf_p0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_dec_parent_data,
-		.num_parents = ARRAY_SIZE(s4_dec_parent_data),
+		.parent_data = s4_dec_parents,
+		.num_parents = ARRAY_SIZE(s4_dec_parents),
 		.flags = 0,
 	},
 };
@@ -1612,7 +1608,7 @@ static struct clk_regmap s4_hevcf_p0_div = {
 		.name = "hevcf_p0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_hevcf_p0_mux.hw
+			&s4_hevcf_p0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1625,7 +1621,7 @@ static struct clk_regmap s4_hevcf_p0 = {
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "hevcf_p0_gate",
+		.name = "hevcf_p0",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_hevcf_p0_div.hw
@@ -1635,7 +1631,7 @@ static struct clk_regmap s4_hevcf_p0 = {
 	},
 };
 
-static struct clk_regmap s4_hevcf_p1_mux = {
+static struct clk_regmap s4_hevcf_p1_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDEC4_CLK_CTRL,
 		.mask = 0x7,
@@ -1643,10 +1639,10 @@ static struct clk_regmap s4_hevcf_p1_mux = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "hevcf_p1_mux",
+		.name = "hevcf_p1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_dec_parent_data,
-		.num_parents = ARRAY_SIZE(s4_dec_parent_data),
+		.parent_data = s4_dec_parents,
+		.num_parents = ARRAY_SIZE(s4_dec_parents),
 		.flags = 0,
 	},
 };
@@ -1662,7 +1658,7 @@ static struct clk_regmap s4_hevcf_p1_div = {
 		.name = "hevcf_p1_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_hevcf_p1_mux.hw
+			&s4_hevcf_p1_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1685,28 +1681,26 @@ static struct clk_regmap s4_hevcf_p1 = {
 	},
 };
 
-static const struct clk_hw *s4_hevcf_mux_parent_hws[] = {
-	&s4_hevcf_p0.hw,
-	&s4_hevcf_p1.hw
-};
-
-static struct clk_regmap s4_hevcf_mux = {
+static struct clk_regmap s4_hevcf_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDEC4_CLK_CTRL,
 		.mask = 0x1,
 		.shift = 15,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "hevcf",
+		.name = "hevcf_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_hevcf_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_hevcf_mux_parent_hws),
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_hevcf_p0.hw,
+			&s4_hevcf_p1.hw,
+		},
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* VPU Clock */
-static const struct clk_parent_data s4_vpu_parent_data[] = {
+static const struct clk_parent_data s4_vpu_parents[] = {
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div5", },
@@ -1726,8 +1720,8 @@ static struct clk_regmap s4_vpu_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vpu_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vpu_parent_data),
+		.parent_data = s4_vpu_parents,
+		.num_parents = ARRAY_SIZE(s4_vpu_parents),
 		.flags = 0,
 	},
 };
@@ -1770,8 +1764,8 @@ static struct clk_regmap s4_vpu_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vpu_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vpu_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vpu_parent_data),
+		.parent_data = s4_vpu_parents,
+		.num_parents = ARRAY_SIZE(s4_vpu_parents),
 		.flags = 0,
 	},
 };
@@ -1823,24 +1817,24 @@ static struct clk_regmap s4_vpu = {
 	},
 };
 
-static const struct clk_parent_data vpu_clkb_tmp_parent_data[] = {
+static const struct clk_parent_data vpu_clkb_tmp_parents[] = {
 	{ .hw = &s4_vpu.hw },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div5", },
 	{ .fw_name = "fclk_div7", }
 };
 
-static struct clk_regmap s4_vpu_clkb_tmp_mux = {
+static struct clk_regmap s4_vpu_clkb_tmp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VPU_CLKB_CTRL,
 		.mask = 0x3,
 		.shift = 20,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vpu_clkb_tmp_mux",
+		.name = "vpu_clkb_tmp_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = vpu_clkb_tmp_parent_data,
-		.num_parents = ARRAY_SIZE(vpu_clkb_tmp_parent_data),
+		.parent_data = vpu_clkb_tmp_parents,
+		.num_parents = ARRAY_SIZE(vpu_clkb_tmp_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -1855,7 +1849,7 @@ static struct clk_regmap s4_vpu_clkb_tmp_div = {
 		.name = "vpu_clkb_tmp_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_vpu_clkb_tmp_mux.hw
+			&s4_vpu_clkb_tmp_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1911,7 +1905,7 @@ static struct clk_regmap s4_vpu_clkb = {
 	},
 };
 
-static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
+static const struct clk_parent_data s4_vpu_clkc_parents[] = {
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
@@ -1922,17 +1916,17 @@ static const struct clk_parent_data s4_vpu_clkc_parent_data[] = {
 	{ .fw_name = "gp0_pll", },
 };
 
-static struct clk_regmap s4_vpu_clkc_p0_mux  = {
+static struct clk_regmap s4_vpu_clkc_p0_sel  = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VPU_CLKC_CTRL,
 		.mask = 0x7,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vpu_clkc_p0_mux",
+		.name = "vpu_clkc_p0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vpu_clkc_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
+		.parent_data = s4_vpu_clkc_parents,
+		.num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
 		.flags = 0,
 	},
 };
@@ -1947,7 +1941,7 @@ static struct clk_regmap s4_vpu_clkc_p0_div = {
 		.name = "vpu_clkc_p0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_vpu_clkc_p0_mux.hw
+			&s4_vpu_clkc_p0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1970,17 +1964,17 @@ static struct clk_regmap s4_vpu_clkc_p0 = {
 	},
 };
 
-static struct clk_regmap s4_vpu_clkc_p1_mux = {
+static struct clk_regmap s4_vpu_clkc_p1_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VPU_CLKC_CTRL,
 		.mask = 0x7,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vpu_clkc_p1_mux",
+		.name = "vpu_clkc_p1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vpu_clkc_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vpu_clkc_parent_data),
+		.parent_data = s4_vpu_clkc_parents,
+		.num_parents = ARRAY_SIZE(s4_vpu_clkc_parents),
 		.flags = 0,
 	},
 };
@@ -1995,7 +1989,7 @@ static struct clk_regmap s4_vpu_clkc_p1_div = {
 		.name = "vpu_clkc_p1_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_vpu_clkc_p1_mux.hw
+			&s4_vpu_clkc_p1_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -2018,28 +2012,26 @@ static struct clk_regmap s4_vpu_clkc_p1 = {
 	},
 };
 
-static const struct clk_hw *s4_vpu_mux_parent_hws[] = {
-	&s4_vpu_clkc_p0.hw,
-	&s4_vpu_clkc_p1.hw
-};
-
-static struct clk_regmap s4_vpu_clkc_mux = {
+static struct clk_regmap s4_vpu_clkc_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VPU_CLKC_CTRL,
 		.mask = 0x1,
 		.shift = 31,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vpu_clkc_mux",
+		.name = "vpu_clkc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = s4_vpu_mux_parent_hws,
-		.num_parents = ARRAY_SIZE(s4_vpu_mux_parent_hws),
+		.parent_hws = (const struct clk_hw *[]) {
+			&s4_vpu_clkc_p0.hw,
+			&s4_vpu_clkc_p1.hw,
+		},
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
 /* VAPB Clock */
-static const struct clk_parent_data s4_vapb_parent_data[] = {
+static const struct clk_parent_data s4_vapb_parents[] = {
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
@@ -2059,8 +2051,8 @@ static struct clk_regmap s4_vapb_0_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vapb_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vapb_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vapb_parent_data),
+		.parent_data = s4_vapb_parents,
+		.num_parents = ARRAY_SIZE(s4_vapb_parents),
 		.flags = 0,
 	},
 };
@@ -2107,8 +2099,8 @@ static struct clk_regmap s4_vapb_1_sel = {
 	.hw.init = &(struct clk_init_data){
 		.name = "vapb_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vapb_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vapb_parent_data),
+		.parent_data = s4_vapb_parents,
+		.num_parents = ARRAY_SIZE(s4_vapb_parents),
 		.flags = 0,
 	},
 };
@@ -2164,13 +2156,13 @@ static struct clk_regmap s4_vapb = {
 	},
 };
 
-static struct clk_regmap s4_ge2d_gate = {
+static struct clk_regmap s4_ge2d = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_VAPBCLK_CTRL,
 		.bit_idx = 30,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d_clk",
+		.name = "ge2d",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &s4_vapb.hw },
 		.num_parents = 1,
@@ -2178,24 +2170,24 @@ static struct clk_regmap s4_ge2d_gate = {
 	},
 };
 
-static const struct clk_parent_data s4_esmclk_parent_data[] = {
+static const struct clk_parent_data s4_hdcp22_esmclk_parents[] = {
 	{ .fw_name = "fclk_div7", },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
 };
 
-static struct clk_regmap s4_hdcp22_esmclk_mux = {
+static struct clk_regmap s4_hdcp22_esmclk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_HDCP22_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "hdcp22_esmclk_mux",
+		.name = "hdcp22_esmclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_esmclk_parent_data,
-		.num_parents = ARRAY_SIZE(s4_esmclk_parent_data),
+		.parent_data = s4_hdcp22_esmclk_parents,
+		.num_parents = ARRAY_SIZE(s4_hdcp22_esmclk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2210,20 +2202,20 @@ static struct clk_regmap s4_hdcp22_esmclk_div = {
 		.name = "hdcp22_esmclk_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_hdcp22_esmclk_mux.hw
+			&s4_hdcp22_esmclk_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_hdcp22_esmclk_gate = {
+static struct clk_regmap s4_hdcp22_esmclk = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_HDCP22_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "hdcp22_esmclk_gate",
+		.name = "hdcp22_esmclk",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_hdcp22_esmclk_div.hw
@@ -2233,24 +2225,24 @@ static struct clk_regmap s4_hdcp22_esmclk_gate = {
 	},
 };
 
-static const struct clk_parent_data s4_skpclk_parent_data[] = {
+static const struct clk_parent_data s4_hdcp22_skpclk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 	{ .fw_name = "fclk_div5", },
 };
 
-static struct clk_regmap s4_hdcp22_skpclk_mux = {
+static struct clk_regmap s4_hdcp22_skpclk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_HDCP22_CTRL,
 		.mask = 0x3,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "hdcp22_skpclk_mux",
+		.name = "hdcp22_skpclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_skpclk_parent_data,
-		.num_parents = ARRAY_SIZE(s4_skpclk_parent_data),
+		.parent_data = s4_hdcp22_skpclk_parents,
+		.num_parents = ARRAY_SIZE(s4_hdcp22_skpclk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2265,20 +2257,20 @@ static struct clk_regmap s4_hdcp22_skpclk_div = {
 		.name = "hdcp22_skpclk_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_hdcp22_skpclk_mux.hw
+			&s4_hdcp22_skpclk_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_hdcp22_skpclk_gate = {
+static struct clk_regmap s4_hdcp22_skpclk = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_HDCP22_CTRL,
 		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "hdcp22_skpclk_gate",
+		.name = "hdcp22_skpclk",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_hdcp22_skpclk_div.hw
@@ -2288,7 +2280,7 @@ static struct clk_regmap s4_hdcp22_skpclk_gate = {
 	},
 };
 
-static const struct clk_parent_data s4_vdin_parent_data[]  = {
+static const struct clk_parent_data s4_vdin_parents[]  = {
 	{ .fw_name = "xtal", },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
@@ -2296,17 +2288,17 @@ static const struct clk_parent_data s4_vdin_parent_data[]  = {
 	{ .hw = &s4_vid_pll.hw }
 };
 
-static struct clk_regmap s4_vdin_meas_mux = {
+static struct clk_regmap s4_vdin_meas_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VDIN_MEAS_CLK_CTRL,
 		.mask = 0x7,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "vdin_meas_mux",
+		.name = "vdin_meas_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_vdin_parent_data,
-		.num_parents = ARRAY_SIZE(s4_vdin_parent_data),
+		.parent_data = s4_vdin_parents,
+		.num_parents = ARRAY_SIZE(s4_vdin_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2321,20 +2313,20 @@ static struct clk_regmap s4_vdin_meas_div = {
 		.name = "vdin_meas_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_vdin_meas_mux.hw
+			&s4_vdin_meas_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_vdin_meas_gate = {
+static struct clk_regmap s4_vdin_meas = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_VDIN_MEAS_CLK_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "vdin_meas_gate",
+		.name = "vdin_meas",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_vdin_meas_div.hw
@@ -2345,7 +2337,7 @@ static struct clk_regmap s4_vdin_meas_gate = {
 };
 
 /* EMMC/NAND clock */
-static const struct clk_parent_data s4_sd_emmc_clk0_parent_data[] = {
+static const struct clk_parent_data s4_sd_emmc_clk0_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .fw_name = "fclk_div2", },
 	{ .fw_name = "fclk_div3", },
@@ -2365,8 +2357,8 @@ static struct clk_regmap s4_sd_emmc_c_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parent_data),
+		.parent_data = s4_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parents),
 		.flags = 0,
 	},
 };
@@ -2413,8 +2405,8 @@ static struct clk_regmap s4_sd_emmc_a_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_a_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parent_data),
+		.parent_data = s4_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parents),
 		.flags = 0,
 	},
 };
@@ -2461,8 +2453,8 @@ static struct clk_regmap s4_sd_emmc_b_clk0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_clk0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_sd_emmc_clk0_parent_data,
-		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parent_data),
+		.parent_data = s4_sd_emmc_clk0_parents,
+		.num_parents = ARRAY_SIZE(s4_sd_emmc_clk0_parents),
 		.flags = 0,
 	},
 };
@@ -2501,7 +2493,7 @@ static struct clk_regmap s4_sd_emmc_b_clk0 = {
 };
 
 /* SPICC Clock */
-static const struct clk_parent_data s4_spicc_parent_data[] = {
+static const struct clk_parent_data s4_spicc_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &s4_sys_clk.hw },
 	{ .fw_name = "fclk_div4", },
@@ -2511,17 +2503,17 @@ static const struct clk_parent_data s4_spicc_parent_data[] = {
 	{ .fw_name = "fclk_div7", },
 };
 
-static struct clk_regmap s4_spicc0_mux = {
+static struct clk_regmap s4_spicc0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_SPICC_CLK_CTRL,
 		.mask = 0x7,
 		.shift = 7,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "spicc0_mux",
+		.name = "spicc0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_spicc_parent_data,
-		.num_parents = ARRAY_SIZE(s4_spicc_parent_data),
+		.parent_data = s4_spicc_parents,
+		.num_parents = ARRAY_SIZE(s4_spicc_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
@@ -2536,20 +2528,20 @@ static struct clk_regmap s4_spicc0_div = {
 		.name = "spicc0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_spicc0_mux.hw
+			&s4_spicc0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_spicc0_gate = {
+static struct clk_regmap s4_spicc0_en = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CLKCTRL_SPICC_CLK_CTRL,
 		.bit_idx = 6,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "spicc0",
+		.name = "spicc0_en",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_spicc0_div.hw
@@ -2560,24 +2552,24 @@ static struct clk_regmap s4_spicc0_gate = {
 };
 
 /* PWM Clock */
-static const struct clk_parent_data s4_pwm_parent_data[] = {
+static const struct clk_parent_data s4_pwm_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &s4_vid_pll.hw },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 };
 
-static struct clk_regmap s4_pwm_a_mux = {
+static struct clk_regmap s4_pwm_a_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_a_mux",
+		.name = "pwm_a_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2592,14 +2584,14 @@ static struct clk_regmap s4_pwm_a_div = {
 		.name = "pwm_a_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_a_mux.hw
+			&s4_pwm_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_a_gate = {
+static struct clk_regmap s4_pwm_a = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
 		.bit_idx = 8,
@@ -2615,17 +2607,17 @@ static struct clk_regmap s4_pwm_a_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_b_mux = {
+static struct clk_regmap s4_pwm_b_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
 		.mask = 0x3,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b_mux",
+		.name = "pwm_b_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2640,20 +2632,20 @@ static struct clk_regmap s4_pwm_b_div = {
 		.name = "pwm_b_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_b_mux.hw
+			&s4_pwm_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_b_gate = {
+static struct clk_regmap s4_pwm_b = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_AB_CTRL,
 		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_b_gate",
+		.name = "pwm_b",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_b_div.hw
@@ -2663,7 +2655,7 @@ static struct clk_regmap s4_pwm_b_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_c_mux = {
+static struct clk_regmap s4_pwm_c_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
 		.mask = 0x3,
@@ -2672,8 +2664,8 @@ static struct clk_regmap s4_pwm_c_mux = {
 	.hw.init = &(struct clk_init_data){
 		.name = "pwm_c_mux",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2688,19 +2680,19 @@ static struct clk_regmap s4_pwm_c_div = {
 		.name = "pwm_c_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_c_mux.hw
+			&s4_pwm_c_sel.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap s4_pwm_c_gate = {
+static struct clk_regmap s4_pwm_c = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_c_gate",
+		.name = "pwm_c",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_c_div.hw
@@ -2710,17 +2702,17 @@ static struct clk_regmap s4_pwm_c_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_d_mux = {
+static struct clk_regmap s4_pwm_d_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
 		.mask = 0x3,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d_mux",
+		.name = "pwm_d_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2735,20 +2727,20 @@ static struct clk_regmap s4_pwm_d_div = {
 		.name = "pwm_d_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_d_mux.hw
+			&s4_pwm_d_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_d_gate = {
+static struct clk_regmap s4_pwm_d = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_CD_CTRL,
 		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_d_gate",
+		.name = "pwm_d",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_d_div.hw
@@ -2758,17 +2750,17 @@ static struct clk_regmap s4_pwm_d_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_e_mux = {
+static struct clk_regmap s4_pwm_e_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e_mux",
+		.name = "pwm_e_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2783,20 +2775,20 @@ static struct clk_regmap s4_pwm_e_div = {
 		.name = "pwm_e_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_e_mux.hw
+			&s4_pwm_e_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_e_gate = {
+static struct clk_regmap s4_pwm_e = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_e_gate",
+		.name = "pwm_e",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_e_div.hw
@@ -2806,17 +2798,17 @@ static struct clk_regmap s4_pwm_e_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_f_mux = {
+static struct clk_regmap s4_pwm_f_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
 		.mask = 0x3,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f_mux",
+		.name = "pwm_f_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2831,20 +2823,20 @@ static struct clk_regmap s4_pwm_f_div = {
 		.name = "pwm_f_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_f_mux.hw
+			&s4_pwm_f_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_f_gate = {
+static struct clk_regmap s4_pwm_f = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_EF_CTRL,
 		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_f_gate",
+		.name = "pwm_f",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_f_div.hw
@@ -2854,17 +2846,17 @@ static struct clk_regmap s4_pwm_f_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_g_mux = {
+static struct clk_regmap s4_pwm_g_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g_mux",
+		.name = "pwm_g_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2879,20 +2871,20 @@ static struct clk_regmap s4_pwm_g_div = {
 		.name = "pwm_g_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_g_mux.hw
+			&s4_pwm_g_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_g_gate = {
+static struct clk_regmap s4_pwm_g = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_g_gate",
+		.name = "pwm_g",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_g_div.hw
@@ -2902,17 +2894,17 @@ static struct clk_regmap s4_pwm_g_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_h_mux = {
+static struct clk_regmap s4_pwm_h_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
 		.mask = 0x3,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h_mux",
+		.name = "pwm_h_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2927,20 +2919,20 @@ static struct clk_regmap s4_pwm_h_div = {
 		.name = "pwm_h_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_h_mux.hw
+			&s4_pwm_h_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_h_gate = {
+static struct clk_regmap s4_pwm_h = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_GH_CTRL,
 		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_h_gate",
+		.name = "pwm_h",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_h_div.hw
@@ -2950,17 +2942,17 @@ static struct clk_regmap s4_pwm_h_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_i_mux = {
+static struct clk_regmap s4_pwm_i_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i_mux",
+		.name = "pwm_i_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -2975,20 +2967,20 @@ static struct clk_regmap s4_pwm_i_div = {
 		.name = "pwm_i_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_i_mux.hw
+			&s4_pwm_i_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_i_gate = {
+static struct clk_regmap s4_pwm_i = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_i_gate",
+		.name = "pwm_i",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_i_div.hw
@@ -2998,17 +2990,17 @@ static struct clk_regmap s4_pwm_i_gate = {
 	},
 };
 
-static struct clk_regmap s4_pwm_j_mux = {
+static struct clk_regmap s4_pwm_j_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
 		.mask = 0x3,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j_mux",
+		.name = "pwm_j_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_pwm_parent_data,
-		.num_parents = ARRAY_SIZE(s4_pwm_parent_data),
+		.parent_data = s4_pwm_parents,
+		.num_parents = ARRAY_SIZE(s4_pwm_parents),
 		.flags = 0,
 	},
 };
@@ -3023,20 +3015,20 @@ static struct clk_regmap s4_pwm_j_div = {
 		.name = "pwm_j_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_pwm_j_mux.hw
+			&s4_pwm_j_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_pwm_j_gate = {
+static struct clk_regmap s4_pwm_j = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_PWM_CLK_IJ_CTRL,
 		.bit_idx = 24,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "pwm_j_gate",
+		.name = "pwm_j",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_pwm_j_div.hw
@@ -3046,14 +3038,14 @@ static struct clk_regmap s4_pwm_j_gate = {
 	},
 };
 
-static struct clk_regmap s4_saradc_mux = {
+static struct clk_regmap s4_saradc_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = CLKCTRL_SAR_CLK_CTRL,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "saradc_mux",
+		.name = "saradc_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "xtal", },
@@ -3074,20 +3066,20 @@ static struct clk_regmap s4_saradc_div = {
 		.name = "saradc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&s4_saradc_mux.hw
+			&s4_saradc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap s4_saradc_gate = {
+static struct clk_regmap s4_saradc = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLKCTRL_SAR_CLK_CTRL,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "saradc_clk",
+		.name = "saradc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&s4_saradc_div.hw
@@ -3102,9 +3094,8 @@ static struct clk_regmap s4_saradc_gate = {
  * corresponding clock sources are not described in the clock tree and internal clock
  * for debug, so they are skipped.
  */
-static u32 s4_gen_clk_mux_table[] = { 0, 4, 5, 7, 19, 21, 22,
-				      23, 24, 25, 26, 27, 28 };
-static const struct clk_parent_data s4_gen_clk_parent_data[] = {
+static u32 s4_gen_clk_parents_val_table[] = { 0, 4, 5, 7, 19, 21, 22, 23, 24, 25, 26, 27, 28 };
+static const struct clk_parent_data s4_gen_clk_parents[] = {
 	{ .fw_name = "xtal", },
 	{ .hw = &s4_vid_pll.hw },
 	{ .fw_name = "gp0_pll", },
@@ -3125,13 +3116,13 @@ static struct clk_regmap s4_gen_clk_sel = {
 		.offset = CLKCTRL_GEN_CLK_CTRL,
 		.mask = 0x1f,
 		.shift = 12,
-		.table = s4_gen_clk_mux_table,
+		.table = s4_gen_clk_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gen_clk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_gen_clk_parent_data,
-		.num_parents = ARRAY_SIZE(s4_gen_clk_parent_data),
+		.parent_data = s4_gen_clk_parents,
+		.num_parents = ARRAY_SIZE(s4_gen_clk_parents),
 		/*
 		 *  Because the GEN clock can be connected to an external pad
 		 *  and may be set up directly from the device tree. Don't
@@ -3174,61 +3165,64 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
-#define MESON_GATE(_name, _reg, _bit) \
+#define S4_PCLK(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
 
-static MESON_GATE(s4_ddr,		CLKCTRL_SYS_CLK_EN0_REG0, 0);
-static MESON_GATE(s4_dos,		CLKCTRL_SYS_CLK_EN0_REG0, 1);
-static MESON_GATE(s4_ethphy,		CLKCTRL_SYS_CLK_EN0_REG0, 4);
-static MESON_GATE(s4_mali,		CLKCTRL_SYS_CLK_EN0_REG0, 6);
-static MESON_GATE(s4_aocpu,		CLKCTRL_SYS_CLK_EN0_REG0, 13);
-static MESON_GATE(s4_aucpu,		CLKCTRL_SYS_CLK_EN0_REG0, 14);
-static MESON_GATE(s4_cec,		CLKCTRL_SYS_CLK_EN0_REG0, 16);
-static MESON_GATE(s4_sdemmca,		CLKCTRL_SYS_CLK_EN0_REG0, 24);
-static MESON_GATE(s4_sdemmcb,		CLKCTRL_SYS_CLK_EN0_REG0, 25);
-static MESON_GATE(s4_nand,		CLKCTRL_SYS_CLK_EN0_REG0, 26);
-static MESON_GATE(s4_smartcard,		CLKCTRL_SYS_CLK_EN0_REG0, 27);
-static MESON_GATE(s4_acodec,		CLKCTRL_SYS_CLK_EN0_REG0, 28);
-static MESON_GATE(s4_spifc,		CLKCTRL_SYS_CLK_EN0_REG0, 29);
-static MESON_GATE(s4_msr_clk,		CLKCTRL_SYS_CLK_EN0_REG0, 30);
-static MESON_GATE(s4_ir_ctrl,		CLKCTRL_SYS_CLK_EN0_REG0, 31);
-static MESON_GATE(s4_audio,		CLKCTRL_SYS_CLK_EN0_REG1, 0);
-static MESON_GATE(s4_eth,		CLKCTRL_SYS_CLK_EN0_REG1, 3);
-static MESON_GATE(s4_uart_a,		CLKCTRL_SYS_CLK_EN0_REG1, 5);
-static MESON_GATE(s4_uart_b,		CLKCTRL_SYS_CLK_EN0_REG1, 6);
-static MESON_GATE(s4_uart_c,		CLKCTRL_SYS_CLK_EN0_REG1, 7);
-static MESON_GATE(s4_uart_d,		CLKCTRL_SYS_CLK_EN0_REG1, 8);
-static MESON_GATE(s4_uart_e,		CLKCTRL_SYS_CLK_EN0_REG1, 9);
-static MESON_GATE(s4_aififo,		CLKCTRL_SYS_CLK_EN0_REG1, 11);
-static MESON_GATE(s4_ts_ddr,		CLKCTRL_SYS_CLK_EN0_REG1, 15);
-static MESON_GATE(s4_ts_pll,		CLKCTRL_SYS_CLK_EN0_REG1, 16);
-static MESON_GATE(s4_g2d,		CLKCTRL_SYS_CLK_EN0_REG1, 20);
-static MESON_GATE(s4_spicc0,		CLKCTRL_SYS_CLK_EN0_REG1, 21);
-static MESON_GATE(s4_usb,		CLKCTRL_SYS_CLK_EN0_REG1, 26);
-static MESON_GATE(s4_i2c_m_a,		CLKCTRL_SYS_CLK_EN0_REG1, 30);
-static MESON_GATE(s4_i2c_m_b,		CLKCTRL_SYS_CLK_EN0_REG1, 31);
-static MESON_GATE(s4_i2c_m_c,		CLKCTRL_SYS_CLK_EN0_REG2, 0);
-static MESON_GATE(s4_i2c_m_d,		CLKCTRL_SYS_CLK_EN0_REG2, 1);
-static MESON_GATE(s4_i2c_m_e,		CLKCTRL_SYS_CLK_EN0_REG2, 2);
-static MESON_GATE(s4_hdmitx_apb,	CLKCTRL_SYS_CLK_EN0_REG2, 4);
-static MESON_GATE(s4_i2c_s_a,		CLKCTRL_SYS_CLK_EN0_REG2, 5);
-static MESON_GATE(s4_usb1_to_ddr,	CLKCTRL_SYS_CLK_EN0_REG2, 8);
-static MESON_GATE(s4_hdcp22,		CLKCTRL_SYS_CLK_EN0_REG2, 10);
-static MESON_GATE(s4_mmc_apb,		CLKCTRL_SYS_CLK_EN0_REG2, 11);
-static MESON_GATE(s4_rsa,		CLKCTRL_SYS_CLK_EN0_REG2, 18);
-static MESON_GATE(s4_cpu_debug,		CLKCTRL_SYS_CLK_EN0_REG2, 19);
-static MESON_GATE(s4_vpu_intr,		CLKCTRL_SYS_CLK_EN0_REG2, 25);
-static MESON_GATE(s4_demod,		CLKCTRL_SYS_CLK_EN0_REG2, 27);
-static MESON_GATE(s4_sar_adc,		CLKCTRL_SYS_CLK_EN0_REG2, 28);
-static MESON_GATE(s4_gic,		CLKCTRL_SYS_CLK_EN0_REG2, 30);
-static MESON_GATE(s4_pwm_ab,		CLKCTRL_SYS_CLK_EN0_REG3, 7);
-static MESON_GATE(s4_pwm_cd,		CLKCTRL_SYS_CLK_EN0_REG3, 8);
-static MESON_GATE(s4_pwm_ef,		CLKCTRL_SYS_CLK_EN0_REG3, 9);
-static MESON_GATE(s4_pwm_gh,		CLKCTRL_SYS_CLK_EN0_REG3, 10);
-static MESON_GATE(s4_pwm_ij,		CLKCTRL_SYS_CLK_EN0_REG3, 11);
+static S4_PCLK(s4_ddr,		CLKCTRL_SYS_CLK_EN0_REG0, 0);
+static S4_PCLK(s4_dos,		CLKCTRL_SYS_CLK_EN0_REG0, 1);
+static S4_PCLK(s4_ethphy,	CLKCTRL_SYS_CLK_EN0_REG0, 4);
+static S4_PCLK(s4_mali,		CLKCTRL_SYS_CLK_EN0_REG0, 6);
+static S4_PCLK(s4_aocpu,	CLKCTRL_SYS_CLK_EN0_REG0, 13);
+static S4_PCLK(s4_aucpu,	CLKCTRL_SYS_CLK_EN0_REG0, 14);
+static S4_PCLK(s4_cec,		CLKCTRL_SYS_CLK_EN0_REG0, 16);
+static S4_PCLK(s4_sdemmca,	CLKCTRL_SYS_CLK_EN0_REG0, 24);
+static S4_PCLK(s4_sdemmcb,	CLKCTRL_SYS_CLK_EN0_REG0, 25);
+static S4_PCLK(s4_nand,		CLKCTRL_SYS_CLK_EN0_REG0, 26);
+static S4_PCLK(s4_smartcard,	CLKCTRL_SYS_CLK_EN0_REG0, 27);
+static S4_PCLK(s4_acodec,	CLKCTRL_SYS_CLK_EN0_REG0, 28);
+static S4_PCLK(s4_spifc,	CLKCTRL_SYS_CLK_EN0_REG0, 29);
+static S4_PCLK(s4_msr_clk,	CLKCTRL_SYS_CLK_EN0_REG0, 30);
+static S4_PCLK(s4_ir_ctrl,	CLKCTRL_SYS_CLK_EN0_REG0, 31);
+
+static S4_PCLK(s4_audio,	CLKCTRL_SYS_CLK_EN0_REG1, 0);
+static S4_PCLK(s4_eth,		CLKCTRL_SYS_CLK_EN0_REG1, 3);
+static S4_PCLK(s4_uart_a,	CLKCTRL_SYS_CLK_EN0_REG1, 5);
+static S4_PCLK(s4_uart_b,	CLKCTRL_SYS_CLK_EN0_REG1, 6);
+static S4_PCLK(s4_uart_c,	CLKCTRL_SYS_CLK_EN0_REG1, 7);
+static S4_PCLK(s4_uart_d,	CLKCTRL_SYS_CLK_EN0_REG1, 8);
+static S4_PCLK(s4_uart_e,	CLKCTRL_SYS_CLK_EN0_REG1, 9);
+static S4_PCLK(s4_aififo,	CLKCTRL_SYS_CLK_EN0_REG1, 11);
+static S4_PCLK(s4_ts_ddr,	CLKCTRL_SYS_CLK_EN0_REG1, 15);
+static S4_PCLK(s4_ts_pll,	CLKCTRL_SYS_CLK_EN0_REG1, 16);
+static S4_PCLK(s4_g2d,		CLKCTRL_SYS_CLK_EN0_REG1, 20);
+static S4_PCLK(s4_spicc0,	CLKCTRL_SYS_CLK_EN0_REG1, 21);
+static S4_PCLK(s4_usb,		CLKCTRL_SYS_CLK_EN0_REG1, 26);
+static S4_PCLK(s4_i2c_m_a,	CLKCTRL_SYS_CLK_EN0_REG1, 30);
+static S4_PCLK(s4_i2c_m_b,	CLKCTRL_SYS_CLK_EN0_REG1, 31);
+
+static S4_PCLK(s4_i2c_m_c,	CLKCTRL_SYS_CLK_EN0_REG2, 0);
+static S4_PCLK(s4_i2c_m_d,	CLKCTRL_SYS_CLK_EN0_REG2, 1);
+static S4_PCLK(s4_i2c_m_e,	CLKCTRL_SYS_CLK_EN0_REG2, 2);
+static S4_PCLK(s4_hdmitx_apb,	CLKCTRL_SYS_CLK_EN0_REG2, 4);
+static S4_PCLK(s4_i2c_s_a,	CLKCTRL_SYS_CLK_EN0_REG2, 5);
+static S4_PCLK(s4_usb1_to_ddr,	CLKCTRL_SYS_CLK_EN0_REG2, 8);
+static S4_PCLK(s4_hdcp22,	CLKCTRL_SYS_CLK_EN0_REG2, 10);
+static S4_PCLK(s4_mmc_apb,	CLKCTRL_SYS_CLK_EN0_REG2, 11);
+static S4_PCLK(s4_rsa,		CLKCTRL_SYS_CLK_EN0_REG2, 18);
+static S4_PCLK(s4_cpu_debug,	CLKCTRL_SYS_CLK_EN0_REG2, 19);
+static S4_PCLK(s4_vpu_intr,	CLKCTRL_SYS_CLK_EN0_REG2, 25);
+static S4_PCLK(s4_demod,	CLKCTRL_SYS_CLK_EN0_REG2, 27);
+static S4_PCLK(s4_sar_adc,	CLKCTRL_SYS_CLK_EN0_REG2, 28);
+static S4_PCLK(s4_gic,		CLKCTRL_SYS_CLK_EN0_REG2, 30);
+
+static S4_PCLK(s4_pwm_ab,	CLKCTRL_SYS_CLK_EN0_REG3, 7);
+static S4_PCLK(s4_pwm_cd,	CLKCTRL_SYS_CLK_EN0_REG3, 8);
+static S4_PCLK(s4_pwm_ef,	CLKCTRL_SYS_CLK_EN0_REG3, 9);
+static S4_PCLK(s4_pwm_gh,	CLKCTRL_SYS_CLK_EN0_REG3, 10);
+static S4_PCLK(s4_pwm_ij,	CLKCTRL_SYS_CLK_EN0_REG3, 11);
 
 /* Array of all clocks provided by this provider */
-static struct clk_hw *s4_periphs_hw_clks[] = {
+static struct clk_hw *s4_peripherals_hw_clks[] = {
 	[CLKID_RTC_32K_CLKIN]		= &s4_rtc_32k_by_oscin_clkin.hw,
 	[CLKID_RTC_32K_DIV]		= &s4_rtc_32k_by_oscin_div.hw,
 	[CLKID_RTC_32K_SEL]		= &s4_rtc_32k_by_oscin_sel.hw,
@@ -3251,12 +3245,12 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_CECB_32K_SEL_PRE]	= &s4_cecb_32k_sel_pre.hw,
 	[CLKID_CECB_32K_SEL]		= &s4_cecb_32k_sel.hw,
 	[CLKID_CECB_32K_CLKOUT]		= &s4_cecb_32k_clkout.hw,
-	[CLKID_SC_CLK_SEL]		= &s4_sc_clk_mux.hw,
+	[CLKID_SC_CLK_SEL]		= &s4_sc_clk_sel.hw,
 	[CLKID_SC_CLK_DIV]		= &s4_sc_clk_div.hw,
-	[CLKID_SC]			= &s4_sc_clk_gate.hw,
-	[CLKID_12_24M]			= &s4_12_24M_clk_gate.hw,
-	[CLKID_12M_CLK_DIV]		= &s4_12M_clk_div.hw,
-	[CLKID_12_24M_CLK_SEL]		= &s4_12_24M_clk.hw,
+	[CLKID_SC]			= &s4_sc_clk.hw,
+	[CLKID_12_24M]			= &s4_12_24M.hw,
+	[CLKID_12M_CLK_DIV]		= &s4_12M_div.hw,
+	[CLKID_12_24M_CLK_SEL]		= &s4_12_24M_sel.hw,
 	[CLKID_VID_PLL_DIV]		= &s4_vid_pll_div.hw,
 	[CLKID_VID_PLL_SEL]		= &s4_vid_pll_sel.hw,
 	[CLKID_VID_PLL]			= &s4_vid_pll.hw,
@@ -3298,28 +3292,28 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_HDMI_DIV]		= &s4_hdmi_div.hw,
 	[CLKID_HDMI]			= &s4_hdmi.hw,
 	[CLKID_TS_CLK_DIV]		= &s4_ts_clk_div.hw,
-	[CLKID_TS]			= &s4_ts_clk_gate.hw,
+	[CLKID_TS]			= &s4_ts_clk.hw,
 	[CLKID_MALI_0_SEL]		= &s4_mali_0_sel.hw,
 	[CLKID_MALI_0_DIV]		= &s4_mali_0_div.hw,
 	[CLKID_MALI_0]			= &s4_mali_0.hw,
 	[CLKID_MALI_1_SEL]		= &s4_mali_1_sel.hw,
 	[CLKID_MALI_1_DIV]		= &s4_mali_1_div.hw,
 	[CLKID_MALI_1]			= &s4_mali_1.hw,
-	[CLKID_MALI_SEL]		= &s4_mali_mux.hw,
-	[CLKID_VDEC_P0_SEL]		= &s4_vdec_p0_mux.hw,
+	[CLKID_MALI_SEL]		= &s4_mali_sel.hw,
+	[CLKID_VDEC_P0_SEL]		= &s4_vdec_p0_sel.hw,
 	[CLKID_VDEC_P0_DIV]		= &s4_vdec_p0_div.hw,
 	[CLKID_VDEC_P0]			= &s4_vdec_p0.hw,
-	[CLKID_VDEC_P1_SEL]		= &s4_vdec_p1_mux.hw,
+	[CLKID_VDEC_P1_SEL]		= &s4_vdec_p1_sel.hw,
 	[CLKID_VDEC_P1_DIV]		= &s4_vdec_p1_div.hw,
 	[CLKID_VDEC_P1]			= &s4_vdec_p1.hw,
-	[CLKID_VDEC_SEL]		= &s4_vdec_mux.hw,
-	[CLKID_HEVCF_P0_SEL]		= &s4_hevcf_p0_mux.hw,
+	[CLKID_VDEC_SEL]		= &s4_vdec_sel.hw,
+	[CLKID_HEVCF_P0_SEL]		= &s4_hevcf_p0_sel.hw,
 	[CLKID_HEVCF_P0_DIV]		= &s4_hevcf_p0_div.hw,
 	[CLKID_HEVCF_P0]		= &s4_hevcf_p0.hw,
-	[CLKID_HEVCF_P1_SEL]		= &s4_hevcf_p1_mux.hw,
+	[CLKID_HEVCF_P1_SEL]		= &s4_hevcf_p1_sel.hw,
 	[CLKID_HEVCF_P1_DIV]		= &s4_hevcf_p1_div.hw,
 	[CLKID_HEVCF_P1]		= &s4_hevcf_p1.hw,
-	[CLKID_HEVCF_SEL]		= &s4_hevcf_mux.hw,
+	[CLKID_HEVCF_SEL]		= &s4_hevcf_sel.hw,
 	[CLKID_VPU_0_SEL]		= &s4_vpu_0_sel.hw,
 	[CLKID_VPU_0_DIV]		= &s4_vpu_0_div.hw,
 	[CLKID_VPU_0]			= &s4_vpu_0.hw,
@@ -3327,18 +3321,18 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_VPU_1_DIV]		= &s4_vpu_1_div.hw,
 	[CLKID_VPU_1]			= &s4_vpu_1.hw,
 	[CLKID_VPU]			= &s4_vpu.hw,
-	[CLKID_VPU_CLKB_TMP_SEL]	= &s4_vpu_clkb_tmp_mux.hw,
+	[CLKID_VPU_CLKB_TMP_SEL]	= &s4_vpu_clkb_tmp_sel.hw,
 	[CLKID_VPU_CLKB_TMP_DIV]	= &s4_vpu_clkb_tmp_div.hw,
 	[CLKID_VPU_CLKB_TMP]		= &s4_vpu_clkb_tmp.hw,
 	[CLKID_VPU_CLKB_DIV]		= &s4_vpu_clkb_div.hw,
 	[CLKID_VPU_CLKB]		= &s4_vpu_clkb.hw,
-	[CLKID_VPU_CLKC_P0_SEL]		= &s4_vpu_clkc_p0_mux.hw,
+	[CLKID_VPU_CLKC_P0_SEL]		= &s4_vpu_clkc_p0_sel.hw,
 	[CLKID_VPU_CLKC_P0_DIV]		= &s4_vpu_clkc_p0_div.hw,
 	[CLKID_VPU_CLKC_P0]		= &s4_vpu_clkc_p0.hw,
-	[CLKID_VPU_CLKC_P1_SEL]		= &s4_vpu_clkc_p1_mux.hw,
+	[CLKID_VPU_CLKC_P1_SEL]		= &s4_vpu_clkc_p1_sel.hw,
 	[CLKID_VPU_CLKC_P1_DIV]		= &s4_vpu_clkc_p1_div.hw,
 	[CLKID_VPU_CLKC_P1]		= &s4_vpu_clkc_p1.hw,
-	[CLKID_VPU_CLKC_SEL]		= &s4_vpu_clkc_mux.hw,
+	[CLKID_VPU_CLKC_SEL]		= &s4_vpu_clkc_sel.hw,
 	[CLKID_VAPB_0_SEL]		= &s4_vapb_0_sel.hw,
 	[CLKID_VAPB_0_DIV]		= &s4_vapb_0_div.hw,
 	[CLKID_VAPB_0]			= &s4_vapb_0.hw,
@@ -3346,10 +3340,10 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_VAPB_1_DIV]		= &s4_vapb_1_div.hw,
 	[CLKID_VAPB_1]			= &s4_vapb_1.hw,
 	[CLKID_VAPB]			= &s4_vapb.hw,
-	[CLKID_GE2D]			= &s4_ge2d_gate.hw,
-	[CLKID_VDIN_MEAS_SEL]		= &s4_vdin_meas_mux.hw,
+	[CLKID_GE2D]			= &s4_ge2d.hw,
+	[CLKID_VDIN_MEAS_SEL]		= &s4_vdin_meas_sel.hw,
 	[CLKID_VDIN_MEAS_DIV]		= &s4_vdin_meas_div.hw,
-	[CLKID_VDIN_MEAS]		= &s4_vdin_meas_gate.hw,
+	[CLKID_VDIN_MEAS]		= &s4_vdin_meas.hw,
 	[CLKID_SD_EMMC_C_CLK_SEL]	= &s4_sd_emmc_c_clk0_sel.hw,
 	[CLKID_SD_EMMC_C_CLK_DIV]	= &s4_sd_emmc_c_clk0_div.hw,
 	[CLKID_SD_EMMC_C]		= &s4_sd_emmc_c_clk0.hw,
@@ -3359,42 +3353,42 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_SD_EMMC_B_CLK_SEL]	= &s4_sd_emmc_b_clk0_sel.hw,
 	[CLKID_SD_EMMC_B_CLK_DIV]	= &s4_sd_emmc_b_clk0_div.hw,
 	[CLKID_SD_EMMC_B]		= &s4_sd_emmc_b_clk0.hw,
-	[CLKID_SPICC0_SEL]		= &s4_spicc0_mux.hw,
+	[CLKID_SPICC0_SEL]		= &s4_spicc0_sel.hw,
 	[CLKID_SPICC0_DIV]		= &s4_spicc0_div.hw,
-	[CLKID_SPICC0_EN]		= &s4_spicc0_gate.hw,
-	[CLKID_PWM_A_SEL]		= &s4_pwm_a_mux.hw,
+	[CLKID_SPICC0_EN]		= &s4_spicc0_en.hw,
+	[CLKID_PWM_A_SEL]		= &s4_pwm_a_sel.hw,
 	[CLKID_PWM_A_DIV]		= &s4_pwm_a_div.hw,
-	[CLKID_PWM_A]			= &s4_pwm_a_gate.hw,
-	[CLKID_PWM_B_SEL]		= &s4_pwm_b_mux.hw,
+	[CLKID_PWM_A]			= &s4_pwm_a.hw,
+	[CLKID_PWM_B_SEL]		= &s4_pwm_b_sel.hw,
 	[CLKID_PWM_B_DIV]		= &s4_pwm_b_div.hw,
-	[CLKID_PWM_B]			= &s4_pwm_b_gate.hw,
-	[CLKID_PWM_C_SEL]		= &s4_pwm_c_mux.hw,
+	[CLKID_PWM_B]			= &s4_pwm_b.hw,
+	[CLKID_PWM_C_SEL]		= &s4_pwm_c_sel.hw,
 	[CLKID_PWM_C_DIV]		= &s4_pwm_c_div.hw,
-	[CLKID_PWM_C]			= &s4_pwm_c_gate.hw,
-	[CLKID_PWM_D_SEL]		= &s4_pwm_d_mux.hw,
+	[CLKID_PWM_C]			= &s4_pwm_c.hw,
+	[CLKID_PWM_D_SEL]		= &s4_pwm_d_sel.hw,
 	[CLKID_PWM_D_DIV]		= &s4_pwm_d_div.hw,
-	[CLKID_PWM_D]			= &s4_pwm_d_gate.hw,
-	[CLKID_PWM_E_SEL]		= &s4_pwm_e_mux.hw,
+	[CLKID_PWM_D]			= &s4_pwm_d.hw,
+	[CLKID_PWM_E_SEL]		= &s4_pwm_e_sel.hw,
 	[CLKID_PWM_E_DIV]		= &s4_pwm_e_div.hw,
-	[CLKID_PWM_E]			= &s4_pwm_e_gate.hw,
-	[CLKID_PWM_F_SEL]		= &s4_pwm_f_mux.hw,
+	[CLKID_PWM_E]			= &s4_pwm_e.hw,
+	[CLKID_PWM_F_SEL]		= &s4_pwm_f_sel.hw,
 	[CLKID_PWM_F_DIV]		= &s4_pwm_f_div.hw,
-	[CLKID_PWM_F]			= &s4_pwm_f_gate.hw,
-	[CLKID_PWM_G_SEL]		= &s4_pwm_g_mux.hw,
+	[CLKID_PWM_F]			= &s4_pwm_f.hw,
+	[CLKID_PWM_G_SEL]		= &s4_pwm_g_sel.hw,
 	[CLKID_PWM_G_DIV]		= &s4_pwm_g_div.hw,
-	[CLKID_PWM_G]			= &s4_pwm_g_gate.hw,
-	[CLKID_PWM_H_SEL]		= &s4_pwm_h_mux.hw,
+	[CLKID_PWM_G]			= &s4_pwm_g.hw,
+	[CLKID_PWM_H_SEL]		= &s4_pwm_h_sel.hw,
 	[CLKID_PWM_H_DIV]		= &s4_pwm_h_div.hw,
-	[CLKID_PWM_H]			= &s4_pwm_h_gate.hw,
-	[CLKID_PWM_I_SEL]		= &s4_pwm_i_mux.hw,
+	[CLKID_PWM_H]			= &s4_pwm_h.hw,
+	[CLKID_PWM_I_SEL]		= &s4_pwm_i_sel.hw,
 	[CLKID_PWM_I_DIV]		= &s4_pwm_i_div.hw,
-	[CLKID_PWM_I]			= &s4_pwm_i_gate.hw,
-	[CLKID_PWM_J_SEL]		= &s4_pwm_j_mux.hw,
+	[CLKID_PWM_I]			= &s4_pwm_i.hw,
+	[CLKID_PWM_J_SEL]		= &s4_pwm_j_sel.hw,
 	[CLKID_PWM_J_DIV]		= &s4_pwm_j_div.hw,
-	[CLKID_PWM_J]			= &s4_pwm_j_gate.hw,
-	[CLKID_SARADC_SEL]		= &s4_saradc_mux.hw,
+	[CLKID_PWM_J]			= &s4_pwm_j.hw,
+	[CLKID_SARADC_SEL]		= &s4_saradc_sel.hw,
 	[CLKID_SARADC_DIV]		= &s4_saradc_div.hw,
-	[CLKID_SARADC]			= &s4_saradc_gate.hw,
+	[CLKID_SARADC]			= &s4_saradc.hw,
 	[CLKID_GEN_SEL]			= &s4_gen_clk_sel.hw,
 	[CLKID_GEN_DIV]			= &s4_gen_clk_div.hw,
 	[CLKID_GEN]			= &s4_gen_clk.hw,
@@ -3447,27 +3441,27 @@ static struct clk_hw *s4_periphs_hw_clks[] = {
 	[CLKID_PWM_EF]			= &s4_pwm_ef.hw,
 	[CLKID_PWM_GH]			= &s4_pwm_gh.hw,
 	[CLKID_PWM_IJ]			= &s4_pwm_ij.hw,
-	[CLKID_HDCP22_ESMCLK_SEL]	= &s4_hdcp22_esmclk_mux.hw,
+	[CLKID_HDCP22_ESMCLK_SEL]	= &s4_hdcp22_esmclk_sel.hw,
 	[CLKID_HDCP22_ESMCLK_DIV]	= &s4_hdcp22_esmclk_div.hw,
-	[CLKID_HDCP22_ESMCLK]		= &s4_hdcp22_esmclk_gate.hw,
-	[CLKID_HDCP22_SKPCLK_SEL]	= &s4_hdcp22_skpclk_mux.hw,
+	[CLKID_HDCP22_ESMCLK]		= &s4_hdcp22_esmclk.hw,
+	[CLKID_HDCP22_SKPCLK_SEL]	= &s4_hdcp22_skpclk_sel.hw,
 	[CLKID_HDCP22_SKPCLK_DIV]	= &s4_hdcp22_skpclk_div.hw,
-	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk_gate.hw,
+	[CLKID_HDCP22_SKPCLK]		= &s4_hdcp22_skpclk.hw,
 };
 
-static const struct regmap_config clkc_regmap_config = {
+static const struct regmap_config s4_peripherals_regmap_cfg = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,
 	.max_register   = CLKCTRL_DEMOD_CLK_CTRL,
 };
 
-static struct meson_clk_hw_data s4_periphs_clks = {
-	.hws = s4_periphs_hw_clks,
-	.num = ARRAY_SIZE(s4_periphs_hw_clks),
+static struct meson_clk_hw_data s4_peripherals_clks = {
+	.hws = s4_peripherals_hw_clks,
+	.num = ARRAY_SIZE(s4_peripherals_hw_clks),
 };
 
-static int meson_s4_periphs_probe(struct platform_device *pdev)
+static int s4_peripherals_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -3479,41 +3473,41 @@ static int meson_s4_periphs_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(base),
 				     "can't ioremap resource\n");
 
-	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, &s4_peripherals_regmap_cfg);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "can't init regmap mmio region\n");
 
-	for (i = 0; i < s4_periphs_clks.num; i++) {
+	for (i = 0; i < s4_peripherals_clks.num; i++) {
 		/* array might be sparse */
-		if (!s4_periphs_clks.hws[i])
+		if (!s4_peripherals_clks.hws[i])
 			continue;
 
-		ret = devm_clk_hw_register(dev, s4_periphs_clks.hws[i]);
+		ret = devm_clk_hw_register(dev, s4_peripherals_clks.hws[i]);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "clock[%d] registration failed\n", i);
 	}
 
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &s4_periphs_clks);
+	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &s4_peripherals_clks);
 }
 
-static const struct of_device_id clkc_match_table[] = {
+static const struct of_device_id s4_peripherals_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,s4-peripherals-clkc",
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, clkc_match_table);
+MODULE_DEVICE_TABLE(of, s4_peripherals_clkc_match_table);
 
-static struct platform_driver s4_driver = {
-	.probe		= meson_s4_periphs_probe,
+static struct platform_driver s4_peripherals_clkc_driver = {
+	.probe		= s4_peripherals_clkc_probe,
 	.driver		= {
-		.name	= "s4-periphs-clkc",
-		.of_match_table = clkc_match_table,
+		.name	= "s4-peripherals-clkc",
+		.of_match_table = s4_peripherals_clkc_match_table,
 	},
 };
-module_platform_driver(s4_driver);
+module_platform_driver(s4_peripherals_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");

-- 
2.47.2

