Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898872F19B7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470041; cv=none; b=SWSq+6Cr+KN7iUwo+ClQf+0VztoBQ2j04sILIHw+BC2VjrkQr9bt2V1uOcAQhZxcfGFqXFnX+TaG6mAUFI1HgfU4hZJi8EZ0YdFMhRP6Px7oL32jAcJ2F8upL9XC0owZ8HPk/y0lZj0PkONmINsGPAR7BoeOtrtEn2Nq9sRsYmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470041; c=relaxed/simple;
	bh=1IvHyI1bjjxPKpLk03HL+ct5ZNMHSy2xdey6fod754c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tehzHpotN6IVMicmxU6tYaAqPGHCwH6m/x/7Su8jfBxBzfFIlw7vB/1icJoWo4oi2DiAgYgTWs4ilpZOD0U7xDeA4Agf+R0RJF04599ZO4yXaor7Gnlcwjopjf8PiMl8++RzqdeQTLmQblv5Ay4cOJkp2H1uAWEkeAJOqpkOYYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lTsBNv2K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lTsBNv2K"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3781097f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470036; x=1752074836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQZMgmABiXY7VmBZiQdhyQTUuhtXH4FhWKbouPsWYSI=;
        b=lTsBNv2Kj04icmOpKa2vgPqCrRMgb0a7DJG9ubvMb7loEoYn6D7pN7QTuCRxzr3Ulc
         XR7vK9gVI2CRsdFFFweCpvcBIpxyvAGlSHGaEEqHfEbaOATS3flDE731PwB0zAHtmoS4
         JTDl4S4huX1LPKWTcby3831iIR+ldkPDiIWSRirtH0lp80vjC2p4v5vP9vLPTWilDFJI
         4bbANrDBZtvW8JAHXuHAGL/F4YYVJPBJ9HIINBxyGxVh1mywk+yQIkWTbN6DNqGTr47D
         08SCgfAuQ5xcfGf0Szkr5OkzzWX6YTdayW2FKIpZlW3W8QvRY6AJ7tWNtZ1/ZBfJIi3N
         Ib3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470036; x=1752074836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQZMgmABiXY7VmBZiQdhyQTUuhtXH4FhWKbouPsWYSI=;
        b=NXnaZpkOV6gsYqIi4feqsTB3moXs8IWkDLGzLFPJR00SVqFg9tjunDKfW8URob/oXP
         6A9M51AtVhEye7s6+6uFOtBF+HXZE6HQRbunL/BSsyNb8zeuPZkqbGJgMdHXX8dAdaxN
         rTpsqvSO5zLwnodF2Zyr+Bbnn2qHpIWGhxJPD/vUsCJFoB4sXR/UFef0bh8re+j+g6+X
         3vH4GBRZHtzq37vvSJjcLOXck2uV3CzGCbMelnMKhmkQBURRG92tqNhO2jmnXy547PL5
         8mIYgRn52AGkZcalBMUL9faEPavxSBb0GSG9m6tSQgblfjLCiMdGuCyqYyA/zgP6vJEd
         7Nsg==
X-Forwarded-Encrypted: i=1; AJvYcCWB7QlTfFKQC+pdrY9Cq4eX5mrVL2hh+XJotGmhqpgNhVeFCMPW/nxMxadGtrLoBq+XNfKc1jhnxmz249s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3z8X2aNXKz14zhsLzNWaN0XCgRJh+LUMpE/ZutpPNFKt6WRSN
	g/pWyaqiOwjt25bmO6wgXr5HcPwaYSFtE66+dtpDe0xr0Y5VZFnc5ZDiNsbytNiw3lI=
X-Gm-Gg: ASbGnctrj8ApRY4AZ0BGTegk49rIrZO1kMk8dbzSxCW8V028ueh6w4qLtcCE+im53oP
	Q/JCVC2fH3cXrlrFVNZch8w2B1mDNRR7cWDXcz4Y6wbqcq69LgosCDsjIEwGhLLDjOvae5y/LWl
	CD84tuOu1w6wzRNYz8lmTu+Wg6K2htBYnf1MP5k30Y0t2i8N8bKzArQFJPJxKT8gA0ORR1cIlis
	J2/VmHNv+fTpWhDE2vQrIUTD2f2wO4KUvN1mtt3XSZX095Ep6/dUc/wyWeQjO4uas0/0nEgCjwk
	OuUSPuhkC3uaM/hWfW33ByBSb9N2UU0z6BI2kDQjxqUstL9t1VQOCpc3DKXO0EtuQF7nVS7i687
	c
X-Google-Smtp-Source: AGHT+IHmBv898ajOHi2h8LSM77WdK1B4++cK31ezYUfiNC2/ARIx6oCZm4OwQhPxRJW+W9HyLTjXsQ==
X-Received: by 2002:a05:6000:4024:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b1fec790d7mr2867275f8f.22.1751470035585;
        Wed, 02 Jul 2025 08:27:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:01 +0200
Subject: [PATCH 03/26] clk: amlogic: axg-ao: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-3-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10920; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1IvHyI1bjjxPKpLk03HL+ct5ZNMHSy2xdey6fod754c=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+5KF0rmce/op3Zg9Js+LvwL+6nmECdDWMyE
 lC5z2yigISJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPuQAKCRDm/A8cN/La
 hWRDEACpUEiSnvz3yj+hAPAnLm+8aJNj/17s9/l2eMyIh+RdVuwLUTfPrdK47kGuRVNqoOGXWc8
 C9/PzdTGmzx5rpld6WEyheLWJOhPtds96EPwxO271qieDpOuGyaRBoV+hyIpW5dRzeUgU1f286b
 S4h41fFVAfx+So0MWEZqrYKvaHuApxGf9k6RK/7EB16Z2JnP917e6jLHixOjtA9L9LPszPU7pQN
 /NmEnKZQDUT3rjmptoOyjlWUmvWX2KR9a89PGJb8+oFdGAsjoV6f6O3UXwfin1G6Wgu3rTZl/QY
 RxudlxK0VPgcjQnzOKtmz2sqd+enkV6vn314pVYpjRNo50wDb0pvCyLc2i4nteCSZF0jkQ8uC5R
 vQP5BTIsFQ7z6xbMqh89RQdmZY48Yh98NP8sGF4WxUImV7EJJHsG5CXHLkDTLLzYV5D3OnAtC2g
 mKby3K/mprCeMofak3rx0JSI0nPp/genQyqgIlQ2AlGSTfHA5e0J4aJ683WoZwnZ6iGYTIRj0U8
 o9o20bWm2lWPa8VKKL+4MfGd2c4AUMZJDbSohVnAfKw+SOol9Ttis2dt90CvMyibzvQZBJ4V+F3
 lmJT4z43ceMa5xf1hU3sONxB6zSkPnhb6wWQUHbTcVu0KaxrHCCOlySj7AX9XpDyNQhv1BFADA0
 3LDKyl5e+A69mtw==
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
 drivers/clk/meson/axg-aoclk.c | 116 ++++++++++++++++++++++--------------------
 1 file changed, 61 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index cd5d0b5ebdb237a74129b44410318748e48780d1..a0c58dc8e950a05c340c3427af4f6ff7661fa84e 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -35,7 +35,7 @@
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
 #define AXG_AO_GATE(_name, _bit)					\
-static struct clk_regmap axg_aoclk_##_name = {				\
+static struct clk_regmap axg_ao_##_name = {				\
 	.data = &(struct clk_regmap_gate_data) {			\
 		.offset = (AO_RTI_GEN_CNTL_REG0),			\
 		.bit_idx = (_bit),					\
@@ -59,7 +59,7 @@ AXG_AO_GATE(uart2, 5);
 AXG_AO_GATE(ir_blaster, 6);
 AXG_AO_GATE(saradc, 7);
 
-static struct clk_regmap axg_aoclk_cts_oscin = {
+static struct clk_regmap axg_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.bit_idx = 14,
@@ -74,7 +74,7 @@ static struct clk_regmap axg_aoclk_cts_oscin = {
 	},
 };
 
-static struct clk_regmap axg_aoclk_32k_pre = {
+static struct clk_regmap axg_ao_32k_pre = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTC_ALT_CLK_CNTL0,
 		.bit_idx = 31,
@@ -83,7 +83,7 @@ static struct clk_regmap axg_aoclk_32k_pre = {
 		.name = "axg_ao_32k_pre",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_aoclk_cts_oscin.hw
+			&axg_ao_cts_oscin.hw
 		},
 		.num_parents = 1,
 	},
@@ -99,7 +99,7 @@ static const struct meson_clk_dualdiv_param axg_32k_div_table[] = {
 	}, {}
 };
 
-static struct clk_regmap axg_aoclk_32k_div = {
+static struct clk_regmap axg_ao_32k_div = {
 	.data = &(struct meson_clk_dualdiv_data){
 		.n1 = {
 			.reg_off = AO_RTC_ALT_CLK_CNTL0,
@@ -132,13 +132,13 @@ static struct clk_regmap axg_aoclk_32k_div = {
 		.name = "axg_ao_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_aoclk_32k_pre.hw
+			&axg_ao_32k_pre.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap axg_aoclk_32k_sel = {
+static struct clk_regmap axg_ao_32k_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTC_ALT_CLK_CNTL1,
 		.mask = 0x1,
@@ -149,15 +149,15 @@ static struct clk_regmap axg_aoclk_32k_sel = {
 		.name = "axg_ao_32k_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_aoclk_32k_div.hw,
-			&axg_aoclk_32k_pre.hw,
+			&axg_ao_32k_div.hw,
+			&axg_ao_32k_pre.hw,
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap axg_aoclk_32k = {
+static struct clk_regmap axg_ao_32k = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = AO_RTC_ALT_CLK_CNTL0,
 		.bit_idx = 30,
@@ -166,14 +166,14 @@ static struct clk_regmap axg_aoclk_32k = {
 		.name = "axg_ao_32k",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_aoclk_32k_sel.hw
+			&axg_ao_32k_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap axg_aoclk_cts_rtc_oscin = {
+static struct clk_regmap axg_ao_cts_rtc_oscin = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x1,
@@ -184,7 +184,7 @@ static struct clk_regmap axg_aoclk_cts_rtc_oscin = {
 		.name = "axg_ao_cts_rtc_oscin",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
-			{ .hw = &axg_aoclk_32k.hw },
+			{ .hw = &axg_ao_32k.hw },
 			{ .fw_name = "ext_32k-0", },
 		},
 		.num_parents = 2,
@@ -192,7 +192,7 @@ static struct clk_regmap axg_aoclk_cts_rtc_oscin = {
 	},
 };
 
-static struct clk_regmap axg_aoclk_clk81 = {
+static struct clk_regmap axg_ao_clk81 = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_RTI_PWR_CNTL_REG0,
 		.mask = 0x1,
@@ -200,68 +200,74 @@ static struct clk_regmap axg_aoclk_clk81 = {
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
+		/*
+		 * NOTE: this is one of the infamous clock the pwm driver
+		 * can request directly by its global name. It's wrong but
+		 * there is not much we can do about it until the support
+		 * for the old pwm bindings is dropped
+		 */
 		.name = "axg_ao_clk81",
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "mpeg-clk", },
-			{ .hw = &axg_aoclk_cts_rtc_oscin.hw },
+			{ .hw = &axg_ao_cts_rtc_oscin.hw },
 		},
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap axg_aoclk_saradc_mux = {
+static struct clk_regmap axg_ao_saradc_mux = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = AO_SAR_CLK,
 		.mask = 0x3,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "axg_ao_saradc_mux",
+		.name = "ao_saradc_mux",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = (const struct clk_parent_data []) {
 			{ .fw_name = "xtal", },
-			{ .hw = &axg_aoclk_clk81.hw },
+			{ .hw = &axg_ao_clk81.hw },
 		},
 		.num_parents = 2,
 	},
 };
 
-static struct clk_regmap axg_aoclk_saradc_div = {
+static struct clk_regmap axg_ao_saradc_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = AO_SAR_CLK,
 		.shift = 0,
 		.width = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "axg_ao_saradc_div",
+		.name = "ao_saradc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_aoclk_saradc_mux.hw
+			&axg_ao_saradc_mux.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap axg_aoclk_saradc_gate = {
+static struct clk_regmap axg_ao_saradc_gate = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = AO_SAR_CLK,
 		.bit_idx = 8,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "axg_ao_saradc_gate",
+		.name = "ao_saradc_gate",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&axg_aoclk_saradc_div.hw
+			&axg_ao_saradc_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const unsigned int axg_aoclk_reset[] = {
+static const unsigned int axg_ao_reset[] = {
 	[RESET_AO_REMOTE]	= 16,
 	[RESET_AO_I2C_MASTER]	= 18,
 	[RESET_AO_I2C_SLAVE]	= 19,
@@ -270,53 +276,53 @@ static const unsigned int axg_aoclk_reset[] = {
 	[RESET_AO_IR_BLASTER]	= 23,
 };
 
-static struct clk_hw *axg_aoclk_hw_clks[] = {
-	[CLKID_AO_REMOTE]	= &axg_aoclk_remote.hw,
-	[CLKID_AO_I2C_MASTER]	= &axg_aoclk_i2c_master.hw,
-	[CLKID_AO_I2C_SLAVE]	= &axg_aoclk_i2c_slave.hw,
-	[CLKID_AO_UART1]	= &axg_aoclk_uart1.hw,
-	[CLKID_AO_UART2]	= &axg_aoclk_uart2.hw,
-	[CLKID_AO_IR_BLASTER]	= &axg_aoclk_ir_blaster.hw,
-	[CLKID_AO_SAR_ADC]	= &axg_aoclk_saradc.hw,
-	[CLKID_AO_CLK81]	= &axg_aoclk_clk81.hw,
-	[CLKID_AO_SAR_ADC_SEL]	= &axg_aoclk_saradc_mux.hw,
-	[CLKID_AO_SAR_ADC_DIV]	= &axg_aoclk_saradc_div.hw,
-	[CLKID_AO_SAR_ADC_CLK]	= &axg_aoclk_saradc_gate.hw,
-	[CLKID_AO_CTS_OSCIN]	= &axg_aoclk_cts_oscin.hw,
-	[CLKID_AO_32K_PRE]	= &axg_aoclk_32k_pre.hw,
-	[CLKID_AO_32K_DIV]	= &axg_aoclk_32k_div.hw,
-	[CLKID_AO_32K_SEL]	= &axg_aoclk_32k_sel.hw,
-	[CLKID_AO_32K]		= &axg_aoclk_32k.hw,
-	[CLKID_AO_CTS_RTC_OSCIN] = &axg_aoclk_cts_rtc_oscin.hw,
+static struct clk_hw *axg_ao_hw_clks[] = {
+	[CLKID_AO_REMOTE]	= &axg_ao_remote.hw,
+	[CLKID_AO_I2C_MASTER]	= &axg_ao_i2c_master.hw,
+	[CLKID_AO_I2C_SLAVE]	= &axg_ao_i2c_slave.hw,
+	[CLKID_AO_UART1]	= &axg_ao_uart1.hw,
+	[CLKID_AO_UART2]	= &axg_ao_uart2.hw,
+	[CLKID_AO_IR_BLASTER]	= &axg_ao_ir_blaster.hw,
+	[CLKID_AO_SAR_ADC]	= &axg_ao_saradc.hw,
+	[CLKID_AO_CLK81]	= &axg_ao_clk81.hw,
+	[CLKID_AO_SAR_ADC_SEL]	= &axg_ao_saradc_mux.hw,
+	[CLKID_AO_SAR_ADC_DIV]	= &axg_ao_saradc_div.hw,
+	[CLKID_AO_SAR_ADC_CLK]	= &axg_ao_saradc_gate.hw,
+	[CLKID_AO_CTS_OSCIN]	= &axg_ao_cts_oscin.hw,
+	[CLKID_AO_32K_PRE]	= &axg_ao_32k_pre.hw,
+	[CLKID_AO_32K_DIV]	= &axg_ao_32k_div.hw,
+	[CLKID_AO_32K_SEL]	= &axg_ao_32k_sel.hw,
+	[CLKID_AO_32K]		= &axg_ao_32k.hw,
+	[CLKID_AO_CTS_RTC_OSCIN] = &axg_ao_cts_rtc_oscin.hw,
 };
 
-static const struct meson_aoclk_data axg_aoclkc_data = {
+static const struct meson_aoclk_data axg_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
-	.num_reset	= ARRAY_SIZE(axg_aoclk_reset),
-	.reset		= axg_aoclk_reset,
+	.num_reset	= ARRAY_SIZE(axg_ao_reset),
+	.reset		= axg_ao_reset,
 	.hw_clks	= {
-		.hws	= axg_aoclk_hw_clks,
-		.num	= ARRAY_SIZE(axg_aoclk_hw_clks),
+		.hws	= axg_ao_hw_clks,
+		.num	= ARRAY_SIZE(axg_ao_hw_clks),
 	},
 };
 
-static const struct of_device_id axg_aoclkc_match_table[] = {
+static const struct of_device_id axg_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-axg-aoclkc",
-		.data		= &axg_aoclkc_data,
+		.data		= &axg_ao_clkc_data,
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, axg_aoclkc_match_table);
+MODULE_DEVICE_TABLE(of, axg_ao_clkc_match_table);
 
-static struct platform_driver axg_aoclkc_driver = {
+static struct platform_driver axg_ao_clkc_driver = {
 	.probe		= meson_aoclkc_probe,
 	.driver		= {
-		.name	= "axg-aoclkc",
-		.of_match_table = axg_aoclkc_match_table,
+		.name	= "axg-ao-clkc",
+		.of_match_table = axg_ao_clkc_match_table,
 	},
 };
-module_platform_driver(axg_aoclkc_driver);
+module_platform_driver(axg_ao_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic AXG Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");

-- 
2.47.2

