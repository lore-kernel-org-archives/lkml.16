Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63DB3093D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470046; cv=none; b=bzr5RT7sUqz4ULxPR0szCqgdgeRWgxOColY/2GNfd9XLZWy4VO3Eqh1yAZ2J0rEcG1yUo3bv5/n0+c/4CL0c1pZw51AlbXoShMDutPuUVN9tXOh/qixo1SY33JzKkmlMrVgsyhTDWZAHXt6lxpNR5mhZ/+JOVLHxfi/06U6ao7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470046; c=relaxed/simple;
	bh=zCYXCSSXQjziG+h/5aIsAP+nLV6vpqnZUuUAtdeaR3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pojZNZPohDHZX+LggATu5wqQrd56u11w6qjjHgIguiXcAGGNYXjNtJ7U9k6RlcH/qgyp+47HNkFn6FSvcbEWd6ShMtnvykDfz+371wS8PbZkg7qpBzB3EjSbiP+1TwWTkO4t/MnDw9yVoEctDTWR3jX/uAFUkD8KddwfO+rOxkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gepeF/ex; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gepeF/ex"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4537deebb01so24559715e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470042; x=1752074842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fisGvFGB+kwIUBUdy6DpXFOBqB2cdLUDKwBqvO118qA=;
        b=gepeF/ex5HoIMJ0tk9jA4Nw78qO/LK18hpk+XE5Dn1chT+77s6StMd7WDhwO15wT3c
         UiTk1ESxiL5GwsHWUPTRYafH85zSpP4L2iz9xM/aWzpyMLprH+2/adJvmSpoCKCro3Ml
         U/DXSqsDi/Ogl1PVnet/pyGPulS7FF+5TiMVEkMr/Moc0kkyqyQ2a4SMaGCOmZ1DjvWM
         apvUxkYecFDADGDrs1z9K0A5xibAjMuYRHHdBi3OJJTj3VDP5TxiQuaQQ35Ebzno1ee0
         6D4Px/9GME9uRU3fr8RTTmBZVh7xsvgOGngsxwRqEQactdRMjqEA7VHz7hA8U/02g2I+
         N3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470042; x=1752074842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fisGvFGB+kwIUBUdy6DpXFOBqB2cdLUDKwBqvO118qA=;
        b=rX3Urz/O9wUYDXLIx/BwuRJnTBv/k1sLd6inz82Pm5fUBMx26pBt9uW8Y7V81SY74D
         bCfQGbxNfnw1d6gGEkZQwKVm6c9okV8lrVXx7bAMK1nTlEbe8HvVNoZgEcCZy2rdDDoo
         kA+/os/MXKPJUCGU1yQ/4E3hA/qxrw05w1nKbgxZmTKvtQ4Er9sPK1sPfUgZT3T5UDCG
         +JcKYEHJw9wBjh5S9u7H03hecZ/LBgPA8KtXhPKJLQIs4M0U40qeJdfFt7jAbu7dLcB7
         AAdFMt0+FHo5VCYXghaZfAWQvId0JbTS1EoPReLiKStxORcb6AanC9R4BnPnbWoU+s4c
         QOCg==
X-Forwarded-Encrypted: i=1; AJvYcCW+mkhwlif4PafcWsewm6JpG5BgoBGZhA/hpJKzSFb7fCQO89o5eZcrt+TjeIvueccMzlzLDB7cXYsFtXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztKJn/XrZllDxB3gInC3gDJ92XhOy8/FWQgiFabCEmTJ4cTLNT
	HlBefJg8qVxgXWbBC2Doxx90hLjQJJAfiloy2XQr1haDNlexwTe4V3CwMWyV+i4yjp0=
X-Gm-Gg: ASbGncu/5RaAETjM60aj8EHQsgeyIKQ2QXG2/AzrbDT7BdgnfgOR0jQwMxo/vkI645W
	yWKi5QKTvaxQeP6qit8FYfnvVFxAaD3lhxkIEf6euPjaGLnFPqMG0EfPFWL9pPQU3NLHnc/Q6FW
	AjV5vNCsANPdRYoDx4sugyIrIywYfYNcB/r5EeWi0EtpUYYN1er3eWe2GAFWh8TVUrObGaYyK/Y
	kZNpAChafuG4hvSqfwT5bPiEwMqwksMzFnl3l1XCpvhh50v0MVGmsHXB9D1Xx1Q6pa3g/NOZreE
	Dz33B5QyfRx3d/P81lsIX9zbuy4tsnqVbH2iO1uAVrm9dk3/YZi9ljZse2XOWlGGg6PMgSmQb+O
	w
X-Google-Smtp-Source: AGHT+IHgPzmWpN3sH85Kx2ppbbdiVxRXvpH8q+EhlE6Ouqancx23tJJcb2F6GeQGw/RJdx1KmYwb0w==
X-Received: by 2002:a05:600c:45d2:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454a36e662cmr37324135e9.13.1751470042220;
        Wed, 02 Jul 2025 08:27:22 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:07 +0200
Subject: [PATCH 09/26] clk: amlogic: gxbb-ao: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-9-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9775; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zCYXCSSXQjziG+h/5aIsAP+nLV6vpqnZUuUAtdeaR3M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU++XefazoyZ/Qm0mWo5gHhVpfZQgxU3CWjPs
 sOcC3TCm+qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPvgAKCRDm/A8cN/La
 hUV4D/9SH6Ryl59OqhIOhiV3bYl47W+94El4y+cQsB9GojDP1aT53b7aI+mOfHFcm/Erjnp2PIw
 RfviCT+FB6dbxSXlVkGT23zNLtlepabH3z6vkCgREZ1qk2y3oy5SYEgiN2DugFEf72iOPKXoN3n
 6aLcW4/UBmV4oQ7SJ8hcL4PQtpAY+OEnJLu5etoxKe2apmu7qi+VIQNxv09zsu3nbhJzHiIV8CD
 S4HtxpZ73+IYH1zysDPEz7wqeTqGPwvJzobmeQIOUn1RHLCkALRE3ZwPNlLNYLq4t2sFr928Wvq
 c+LUbo4aR+RzYICrGBOpgeWMvSbOb9BhP3ydNQRIlsP79WZmk9mMJ0aZdii4tXQAsf6yGGZm1N6
 VDIJo366RECi19bjMb+5TrQNwAyOYl0LoAIdQnVNL4Ga5+wCG6QYP16ZcQxBBYMWGrbEoQvZ3YI
 CiNFWwGs1L5Ux55XMTIE3S4+ilVFBcXafU6ejcfCjSJNn9h+e1CEvpjaSEcIJ7QRhFmyF9I6KiF
 TR03KcEIYe2+ec5rPrgRMP3cft3ofaQ+8Tx3duP3HP1oWRbxB1nslYk0c5Ozo8x8WupsPARsyir
 27Gf9jhGPLY2IzQe9PXCSK1lgvvsfHbm1Z5tbz2aYWVrxOyi9YXo1picAvc04urU+qrrWR7iWYW
 +ZtbGkFjmKEPteQ==
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
 drivers/clk/meson/gxbb-aoclk.c | 104 ++++++++++++++++++++---------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index f075fbd450f34bac9b2f9f969930337d3831a893..11b11fa7791eb1903938c0d3ee46121a23b94a46 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -23,14 +23,14 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define GXBB_AO_GATE(_name, _bit)					\
-static struct clk_regmap _name##_ao = {					\
+#define GXBB_AO_PCLK(_name, _bit)					\
+static struct clk_regmap gxbb_ao_##_name = {				\
 	.data = &(struct clk_regmap_gate_data) {			\
 		.offset = AO_RTI_GEN_CNTL_REG0,				\
 		.bit_idx = (_bit),					\
 	},								\
 	.hw.init = &(struct clk_init_data) {				\
-		.name = #_name "_ao",					\
+		.name = "gxbb_ao_" #_name,				\
 		.ops = &clk_regmap_gate_ops,				\
 		.parent_data = &(const struct clk_parent_data) {	\
 			.fw_name = "mpeg-clk",				\
@@ -40,14 +40,14 @@ static struct clk_regmap _name##_ao = {					\
 	},								\
 }
 
-GXBB_AO_GATE(remote, 0);
-GXBB_AO_GATE(i2c_master, 1);
-GXBB_AO_GATE(i2c_slave, 2);
-GXBB_AO_GATE(uart1, 3);
-GXBB_AO_GATE(uart2, 5);
-GXBB_AO_GATE(ir_blaster, 6);
+GXBB_AO_PCLK(remote,		0);
+GXBB_AO_PCLK(i2c_master,	1);
+GXBB_AO_PCLK(i2c_slave,		2);
+GXBB_AO_PCLK(uart1,		3);
+GXBB_AO_PCLK(uart2,		5);
+GXBB_AO_PCLK(ir_blaster,	6);
 
-static struct clk_regmap ao_cts_oscin = {
+static struct clk_regmap gxbb_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.bit_idx = 6,
@@ -62,7 +62,7 @@ static struct clk_regmap ao_cts_oscin = {
 	},
 };
 
-static struct clk_regmap ao_32k_pre = {
+static struct clk_regmap gxbb_ao_32k_pre = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTC_ALT_CLK_CNTL0,
 		.bit_idx = 31,
@@ -70,7 +70,7 @@ static struct clk_regmap ao_32k_pre = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k_pre",
 		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) { &ao_cts_oscin.hw },
+		.parent_hws = (const struct clk_hw *[]) { &gxbb_ao_cts_oscin.hw },
 		.num_parents = 1,
 	},
 };
@@ -85,7 +85,7 @@ static const struct meson_clk_dualdiv_param gxbb_32k_div_table[] = {
 	}, {}
 };
 
-static struct clk_regmap ao_32k_div = {
+static struct clk_regmap gxbb_ao_32k_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = AO_RTC_ALT_CLK_CNTL0,
@@ -117,12 +117,12 @@ static struct clk_regmap ao_32k_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
-		.parent_hws = (const struct clk_hw *[]) { &ao_32k_pre.hw },
+		.parent_hws = (const struct clk_hw *[]) { &gxbb_ao_32k_pre.hw },
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap ao_32k_sel = {
+static struct clk_regmap gxbb_ao_32k_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTC_ALT_CLK_CNTL1,
 		.mask = 0x1,
@@ -133,15 +133,15 @@ static struct clk_regmap ao_32k_sel = {
 		.name = "ao_32k_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ao_32k_div.hw,
-			&ao_32k_pre.hw
+			&gxbb_ao_32k_div.hw,
+			&gxbb_ao_32k_pre.hw
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ao_32k = {
+static struct clk_regmap gxbb_ao_32k = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTC_ALT_CLK_CNTL0,
 		.bit_idx = 30,
@@ -149,13 +149,13 @@ static struct clk_regmap ao_32k = {
 	.hw.init = &(struct clk_init_data){
 		.name = "ao_32k",
 		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) { &ao_32k_sel.hw },
+		.parent_hws = (const struct clk_hw *[]) { &gxbb_ao_32k_sel.hw },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ao_cts_rtc_oscin = {
+static struct clk_regmap gxbb_ao_cts_rtc_oscin = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x7,
@@ -170,14 +170,14 @@ static struct clk_regmap ao_cts_rtc_oscin = {
 			{ .fw_name = "ext-32k-0", },
 			{ .fw_name = "ext-32k-1", },
 			{ .fw_name = "ext-32k-2", },
-			{ .hw = &ao_32k.hw },
+			{ .hw = &gxbb_ao_32k.hw },
 		},
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ao_clk81 = {
+static struct clk_regmap gxbb_ao_clk81 = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x1,
@@ -189,14 +189,14 @@ static struct clk_regmap ao_clk81 = {
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "mpeg-clk", },
-			{ .hw = &ao_cts_rtc_oscin.hw },
+			{ .hw = &gxbb_ao_cts_rtc_oscin.hw },
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ao_cts_cec = {
+static struct clk_regmap gxbb_ao_cts_cec = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_CRT_CLK_CNTL1,
 		.mask = 0x1,
@@ -221,14 +221,14 @@ static struct clk_regmap ao_cts_cec = {
 		 */
 		.parent_data = (const struct clk_parent_data []) {
 			{ .name = "fixme", .index = -1, },
-			{ .hw = &ao_cts_rtc_oscin.hw },
+			{ .hw = &gxbb_ao_cts_rtc_oscin.hw },
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const unsigned int gxbb_aoclk_reset[] = {
+static const unsigned int gxbb_ao_reset[] = {
 	[RESET_AO_REMOTE] = 16,
 	[RESET_AO_I2C_MASTER] = 18,
 	[RESET_AO_I2C_SLAVE] = 19,
@@ -237,50 +237,50 @@ static const unsigned int gxbb_aoclk_reset[] = {
 	[RESET_AO_IR_BLASTER] = 23,
 };
 
-static struct clk_hw *gxbb_aoclk_hw_clks[] = {
-		[CLKID_AO_REMOTE] = &remote_ao.hw,
-		[CLKID_AO_I2C_MASTER] = &i2c_master_ao.hw,
-		[CLKID_AO_I2C_SLAVE] = &i2c_slave_ao.hw,
-		[CLKID_AO_UART1] = &uart1_ao.hw,
-		[CLKID_AO_UART2] = &uart2_ao.hw,
-		[CLKID_AO_IR_BLASTER] = &ir_blaster_ao.hw,
-		[CLKID_AO_CEC_32K] = &ao_cts_cec.hw,
-		[CLKID_AO_CTS_OSCIN] = &ao_cts_oscin.hw,
-		[CLKID_AO_32K_PRE] = &ao_32k_pre.hw,
-		[CLKID_AO_32K_DIV] = &ao_32k_div.hw,
-		[CLKID_AO_32K_SEL] = &ao_32k_sel.hw,
-		[CLKID_AO_32K] = &ao_32k.hw,
-		[CLKID_AO_CTS_RTC_OSCIN] = &ao_cts_rtc_oscin.hw,
-		[CLKID_AO_CLK81] = &ao_clk81.hw,
+static struct clk_hw *gxbb_ao_hw_clks[] = {
+		[CLKID_AO_REMOTE]	= &gxbb_ao_remote.hw,
+		[CLKID_AO_I2C_MASTER]	= &gxbb_ao_i2c_master.hw,
+		[CLKID_AO_I2C_SLAVE]	= &gxbb_ao_i2c_slave.hw,
+		[CLKID_AO_UART1]	= &gxbb_ao_uart1.hw,
+		[CLKID_AO_UART2]	= &gxbb_ao_uart2.hw,
+		[CLKID_AO_IR_BLASTER]	= &gxbb_ao_ir_blaster.hw,
+		[CLKID_AO_CEC_32K]	= &gxbb_ao_cts_cec.hw,
+		[CLKID_AO_CTS_OSCIN]	= &gxbb_ao_cts_oscin.hw,
+		[CLKID_AO_32K_PRE]	= &gxbb_ao_32k_pre.hw,
+		[CLKID_AO_32K_DIV]	= &gxbb_ao_32k_div.hw,
+		[CLKID_AO_32K_SEL]	= &gxbb_ao_32k_sel.hw,
+		[CLKID_AO_32K]		= &gxbb_ao_32k.hw,
+		[CLKID_AO_CTS_RTC_OSCIN] = &gxbb_ao_cts_rtc_oscin.hw,
+		[CLKID_AO_CLK81]	= &gxbb_ao_clk81.hw,
 };
 
-static const struct meson_aoclk_data gxbb_aoclkc_data = {
+static const struct meson_aoclk_data gxbb_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
-	.num_reset	= ARRAY_SIZE(gxbb_aoclk_reset),
-	.reset		= gxbb_aoclk_reset,
+	.num_reset	= ARRAY_SIZE(gxbb_ao_reset),
+	.reset		= gxbb_ao_reset,
 	.hw_clks	= {
-		.hws	= gxbb_aoclk_hw_clks,
-		.num	= ARRAY_SIZE(gxbb_aoclk_hw_clks),
+		.hws	= gxbb_ao_hw_clks,
+		.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
 	},
 };
 
-static const struct of_device_id gxbb_aoclkc_match_table[] = {
+static const struct of_device_id gxbb_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-gx-aoclkc",
-		.data		= &gxbb_aoclkc_data,
+		.data		= &gxbb_ao_clkc_data,
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, gxbb_aoclkc_match_table);
+MODULE_DEVICE_TABLE(of, gxbb_ao_clkc_match_table);
 
-static struct platform_driver gxbb_aoclkc_driver = {
+static struct platform_driver gxbb_ao_clkc_driver = {
 	.probe		= meson_aoclkc_probe,
 	.driver		= {
 		.name	= "gxbb-aoclkc",
-		.of_match_table = gxbb_aoclkc_match_table,
+		.of_match_table = gxbb_ao_clkc_match_table,
 	},
 };
-module_platform_driver(gxbb_aoclkc_driver);
+module_platform_driver(gxbb_ao_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic GXBB Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");

-- 
2.47.2

