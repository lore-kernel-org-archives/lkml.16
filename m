Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429252F532B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470047; cv=none; b=AESguI9CgC4x4gFH7sbe5BvRdVbT1nds3ycbOomnJtecwFn+0w0L11S99s2Yy+N46netQzUwbumtQA2PMwujvaI9MmOFqu2K2Li9vSnf7epfRhQ4GNnIZnlF/teYyTxlwY2t+uQJYkUgTdaLJPBA4L+4klhn1mbDsrNuj3WaOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470047; c=relaxed/simple;
	bh=kuvirlSRtdo9jJtj8l4BQzsRcrHn4NbaTejl+bwO/QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cskib2VhBSyWPu27BPDJt6SALcskmX+pQrqvZ2kidDMD4fs9DW8I9EMciectR9B5mLFTnBiDPj0p97Ew9qXTMqGqBm4zQqoAtspBVivQ8nltkQOoPzcO3QDxQw0ulQ0MhmxdEkVhcEr+cfI5Hsk4Raz4iDP8pFK2P1yO2wBVsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JgOLbpUa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JgOLbpUa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so6327202f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470038; x=1752074838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsdsBjRDhALUiCmDGkvSrN4zCO9ZMhAWX8YKSnPAJdk=;
        b=JgOLbpUaRlPEA2kHZ3IGLgL6JmG4/Wz6nXyiQxkFxnDzpXfUO7CkclvvhIGeK78v+P
         HvoW/KezNB6uOY49DHVYRzKIad92wjNVbwuHdb4uSpKKX8qISwQPDwPvkOBmgfK7sqZy
         Bq6mFn59OuQBBANc7rmuQ2o/WnQXkR4vt2qwmtJdZxFiXo6dnWADMlNytsiYnw46CvlU
         0ZwCTCETrBJsTIKfQ2AXpp8wLMBg7RhsuZ6GeyLxuEy50uZwqn3sozzDAwQqn26k7DRI
         ItyoO/WsyqT7n1ZKWk/qerd0Fq1Bs6aZ0NUK6JKtEOAQlGGrgxSWyOAfg8t2Bm8kk3rx
         6m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470038; x=1752074838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsdsBjRDhALUiCmDGkvSrN4zCO9ZMhAWX8YKSnPAJdk=;
        b=wsQg27ky0nIYSSWLWDlp12DDzNYsg2Wtn1Mo1TP2i66ZAleT6vNabNUBplHfYqQdfU
         ksBl6Z8wpoNqCMdL3MUUsJjgLrPKFAqni39kMXjT5WJpup/xWHhAWG7ArJUeaAPWRhNw
         nMWJigeifuapTCwCi7/+ovyij2K9VS+jYGEymCBPnYumJIq0aGzbxXBT8a4xJ3FZfT9v
         9uoRnZNZGJGh+A4xqb2bsoV77CLFbMxGB3XzMWViOzr7ch2V98RqJ1eM+G4TnZ3HDBb1
         kOxXvmpllM02/IJXfrRmjwO9+Ywxy5khKi58WiN+3GxJyjpBq/x7M01+M/ctqwx9DWlt
         j0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUfPvUa8dhGcAhU6OLkNa6c9eKkWCj6MsHFasapHsXQg3jmP8NB7FUHB0pGI4QpiANiwtxzaaY2IuJrSho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy97yZVc7J/dYXC1BDKtF4JPb5E6XxXswC9fEK45JohuoRkbtVx
	M9n5OYiWybK9MbUKOCS9HAs4q+17KhXJDz0i5QbY5a05DWZuOt/m13s8UGykM5k7ZAg=
X-Gm-Gg: ASbGncuqGSyV9crqsKm++3O6bE+9d8RqDFxMTW90gtVLwm6rXPMf1pDSfobxCd2CqHu
	HDs/jKwbgEKaGuVVOKR5OQkSoADGSCSV05y4v6IwfxcvpeucMHoI4z5EgnQtV4xc40cMC3UN7ku
	3975MLzFp8fgQlOimLFmxsSmOz9rTL486R93i9oan3pY6HzCfDLic1vpPOuJHwsOAeyrJhehXea
	IadmIOWTKK4Jr9qIYD//2uLsrvuHtm8xgG4Wx08k3PvFNTDZSYmGLVgG2zSoh8RYnhelX/z7tLm
	w4iR3ZwKz45V0+ONf2iweeZ6k3zwsH6S1WHTavGq7sTekdIB+mSykSVku4A5oG8hrj3W5NVO/pp
	t
X-Google-Smtp-Source: AGHT+IECh+Y6mrUIUSayESiXHt89Zeschu9MwErdt4xiaJ8WUV1r8855SzN36YCkiPhlZJT0t8Zt5Q==
X-Received: by 2002:a5d:588c:0:b0:3a6:ec1b:5742 with SMTP id ffacd0b85a97d-3b1fe5c0764mr2895279f8f.22.1751470037816;
        Wed, 02 Jul 2025 08:27:17 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:03 +0200
Subject: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=89624; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kuvirlSRtdo9jJtj8l4BQzsRcrHn4NbaTejl+bwO/QM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+7Ho893wnWZvbHnijwevcCLu9J59CSFZMYh
 IzqOyZyeNOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPuwAKCRDm/A8cN/La
 hYxMEACNT7yQzJIQlrdJIE+vA7oKrsJ6SlWjhp3/tE+CyThyNE9LLMCxnIgR0E6PUmwE1dUSKXf
 KTM/fyg0h8W/2vHqmsm8Dko0JOTB4f5iaXOGPC52Jq5zj9br+8x/UJmCNO3iJAMe62bBbDKNbTx
 5oUljqzWDZDikSKFzgAwXXJ5EKERwwBXaEkZKur8l85qabZLzE/6PSrH9aeyA939UlURrlBHPNW
 a5AmBKNlXDlAYMn2d6QSMtjYeXjVzRmRIGXjQrM2+19D0b6t0aamNnXt1wYOXqQV8mtEzu34z7+
 sPmmT2i9vx9NjwRkEniOZbOY148AvBkAFN4zIdZK6HDY6gF0Rwj8AtMQOyasPUBW6ogNlg2d39B
 vN6YNcEk0CmyQsriDhUEygLhgki4zUDgamH0EkZnMT2Uxw9zG+RmNqyPswv6S5au9N6AoJx62g+
 N8+xwg5ANNUUtdUDM/h8AGmGysoQjlJBixpyoNKtHYWIdoqpvKBJQe3S0jj69+llokHHpv57d2l
 wekkHlah/CTPI9c0+guaEETcNCvW8n17XZ6i4b+VcrMcJvx3eVqHoQpcsw7HjJelTU83xAeHT89
 XivFd2Zk8e4LLvLmL/E1A/5IqVIkS0W2PcLwadrG3GsjhnDld477y/ZhjVyvX0K+aw00rgl1S1E
 UMhhCghs9SJjufQ==
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
 drivers/clk/meson/c3-peripherals.c | 1261 ++++++++++++++++++------------------
 1 file changed, 630 insertions(+), 631 deletions(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index a25e7d5dc6691d2d4a852e3d3da2b36f251cc141..a09cb1435ab108b2dcc209c6557bcd1988c4ba1a 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -48,7 +48,7 @@
 #define SPIFC_CLK_CTRL				0x1a0
 #define NNA_CLK_CTRL				0x220
 
-static struct clk_regmap rtc_xtal_clkin = {
+static struct clk_regmap c3_rtc_xtal_clkin = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = RTC_BY_OSCIN_CTRL0,
 		.bit_idx = 31,
@@ -63,12 +63,12 @@ static struct clk_regmap rtc_xtal_clkin = {
 	},
 };
 
-static const struct meson_clk_dualdiv_param rtc_32k_div_table[] = {
+static const struct meson_clk_dualdiv_param c3_rtc_32k_div_table[] = {
 	{ 733, 732, 8, 11, 1 },
 	{ /* sentinel */ }
 };
 
-static struct clk_regmap rtc_32k_div = {
+static struct clk_regmap c3_rtc_32k_div = {
 	.data = &(struct meson_clk_dualdiv_data) {
 		.n1 = {
 			.reg_off = RTC_BY_OSCIN_CTRL0,
@@ -95,39 +95,39 @@ static struct clk_regmap rtc_32k_div = {
 			.shift   = 28,
 			.width   = 1,
 		},
-		.table = rtc_32k_div_table,
+		.table = c3_rtc_32k_div_table,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "rtc_32k_div",
 		.ops = &meson_clk_dualdiv_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&rtc_xtal_clkin.hw
+			&c3_rtc_xtal_clkin.hw
 		},
 		.num_parents = 1,
 	},
 };
 
-static const struct clk_parent_data rtc_32k_mux_parent_data[] = {
-	{ .hw = &rtc_32k_div.hw },
-	{ .hw = &rtc_xtal_clkin.hw }
+static const struct clk_parent_data c3_rtc_32k_parents[] = {
+	{ .hw = &c3_rtc_32k_div.hw },
+	{ .hw = &c3_rtc_xtal_clkin.hw }
 };
 
-static struct clk_regmap rtc_32k_mux = {
+static struct clk_regmap c3_rtc_32k_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = RTC_BY_OSCIN_CTRL1,
 		.mask = 0x1,
 		.shift = 24,
 	},
 	.hw.init = &(struct clk_init_data) {
-		.name = "rtc_32k_mux",
+		.name = "rtc_32k_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = rtc_32k_mux_parent_data,
-		.num_parents = ARRAY_SIZE(rtc_32k_mux_parent_data),
+		.parent_data = c3_rtc_32k_parents,
+		.num_parents = ARRAY_SIZE(c3_rtc_32k_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap rtc_32k = {
+static struct clk_regmap c3_rtc_32k = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = RTC_BY_OSCIN_CTRL0,
 		.bit_idx = 30,
@@ -136,20 +136,20 @@ static struct clk_regmap rtc_32k = {
 		.name = "rtc_32k",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&rtc_32k_mux.hw
+			&c3_rtc_32k_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data rtc_clk_mux_parent_data[] = {
+static const struct clk_parent_data c3_rtc_clk_parents[] = {
 	{ .fw_name = "oscin" },
-	{ .hw = &rtc_32k.hw },
+	{ .hw = &c3_rtc_32k.hw },
 	{ .fw_name = "pad_osc" }
 };
 
-static struct clk_regmap rtc_clk = {
+static struct clk_regmap c3_rtc_clk = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = RTC_CTRL,
 		.mask = 0x3,
@@ -158,62 +158,62 @@ static struct clk_regmap rtc_clk = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "rtc_clk",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = rtc_clk_mux_parent_data,
-		.num_parents = ARRAY_SIZE(rtc_clk_mux_parent_data),
+		.parent_data = c3_rtc_clk_parents,
+		.num_parents = ARRAY_SIZE(c3_rtc_clk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)		\
-struct clk_regmap _name = {						\
+#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)		\
+struct clk_regmap c3_##_name = {					\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
 		.bit_idx = (_bit),					\
 	},								\
 	.hw.init = &(struct clk_init_data) {				\
-		.name = #_name,						\
+		.name = "c3_" #_name,					\
 		.ops = _ops,						\
 		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = #_fw_name,				\
+			.fw_name = (_fw_name),				\
 		},							\
 		.num_parents = 1,					\
 		.flags = (_flags),					\
 	},								\
 }
 
-#define C3_SYS_GATE(_name, _reg, _bit, _flags)				\
-	C3_CLK_GATE(_name, _reg, _bit, sysclk,				\
-		    &clk_regmap_gate_ops, _flags)
+#define C3_SYS_PCLK(_name, _reg, _bit, _flags)				\
+	C3_PCLK(_name, _reg, _bit, "sysclk",				\
+		&clk_regmap_gate_ops, _flags)
 
-#define C3_SYS_GATE_RO(_name, _reg, _bit)				\
-	C3_CLK_GATE(_name, _reg, _bit, sysclk,				\
-		    &clk_regmap_gate_ro_ops, 0)
+#define C3_SYS_PCLK_RO(_name, _reg, _bit)				\
+	C3_PCLK(_name, _reg, _bit, "sysclk",				\
+		&clk_regmap_gate_ro_ops, 0)
 
-static C3_SYS_GATE(sys_reset_ctrl,	SYS_CLK_EN0_REG0, 1, 0);
-static C3_SYS_GATE(sys_pwr_ctrl,	SYS_CLK_EN0_REG0, 3, 0);
-static C3_SYS_GATE(sys_pad_ctrl,	SYS_CLK_EN0_REG0, 4, 0);
-static C3_SYS_GATE(sys_ctrl,		SYS_CLK_EN0_REG0, 5, 0);
-static C3_SYS_GATE(sys_ts_pll,		SYS_CLK_EN0_REG0, 6, 0);
+static C3_SYS_PCLK(sys_reset_ctrl,	SYS_CLK_EN0_REG0, 1, 0);
+static C3_SYS_PCLK(sys_pwr_ctrl,	SYS_CLK_EN0_REG0, 3, 0);
+static C3_SYS_PCLK(sys_pad_ctrl,	SYS_CLK_EN0_REG0, 4, 0);
+static C3_SYS_PCLK(sys_ctrl,		SYS_CLK_EN0_REG0, 5, 0);
+static C3_SYS_PCLK(sys_ts_pll,		SYS_CLK_EN0_REG0, 6, 0);
 
 /*
  * NOTE: sys_dev_arb provides the clock to the ETH and SPICC arbiters that
  * access the AXI bus.
  */
-static C3_SYS_GATE(sys_dev_arb,		SYS_CLK_EN0_REG0, 7, 0);
+static C3_SYS_PCLK(sys_dev_arb,		SYS_CLK_EN0_REG0, 7, 0);
 
 /*
  * FIXME: sys_mmc_pclk provides the clock for the DDR PHY, DDR will only be
  * initialized in bl2, and this clock should not be touched in linux.
  */
-static C3_SYS_GATE_RO(sys_mmc_pclk,	SYS_CLK_EN0_REG0, 8);
+static C3_SYS_PCLK_RO(sys_mmc_pclk,	SYS_CLK_EN0_REG0, 8);
 
 /*
  * NOTE: sys_cpu_ctrl provides the clock for CPU controller. After clock is
  * disabled, cpu_clk and other key CPU-related configurations cannot take effect.
  */
-static C3_SYS_GATE(sys_cpu_ctrl,	SYS_CLK_EN0_REG0, 11, CLK_IS_CRITICAL);
-static C3_SYS_GATE(sys_jtag_ctrl,	SYS_CLK_EN0_REG0, 12, 0);
-static C3_SYS_GATE(sys_ir_ctrl,		SYS_CLK_EN0_REG0, 13, 0);
+static C3_SYS_PCLK(sys_cpu_ctrl,	SYS_CLK_EN0_REG0, 11, CLK_IS_CRITICAL);
+static C3_SYS_PCLK(sys_jtag_ctrl,	SYS_CLK_EN0_REG0, 12, 0);
+static C3_SYS_PCLK(sys_ir_ctrl,		SYS_CLK_EN0_REG0, 13, 0);
 
 /*
  * NOTE: sys_irq_ctrl provides the clock for IRQ controller. The IRQ controller
@@ -221,18 +221,18 @@ static C3_SYS_GATE(sys_ir_ctrl,		SYS_CLK_EN0_REG0, 13, 0);
  * AOCPU. If the clock is disabled, interrupt-related functions will occurs an
  * exception.
  */
-static C3_SYS_GATE(sys_irq_ctrl,	SYS_CLK_EN0_REG0, 14, CLK_IS_CRITICAL);
-static C3_SYS_GATE(sys_msr_clk,		SYS_CLK_EN0_REG0, 15, 0);
-static C3_SYS_GATE(sys_rom,		SYS_CLK_EN0_REG0, 16, 0);
-static C3_SYS_GATE(sys_uart_f,		SYS_CLK_EN0_REG0, 17, 0);
-static C3_SYS_GATE(sys_cpu_apb,		SYS_CLK_EN0_REG0, 18, 0);
-static C3_SYS_GATE(sys_rsa,		SYS_CLK_EN0_REG0, 19, 0);
-static C3_SYS_GATE(sys_sar_adc,		SYS_CLK_EN0_REG0, 20, 0);
-static C3_SYS_GATE(sys_startup,		SYS_CLK_EN0_REG0, 21, 0);
-static C3_SYS_GATE(sys_secure,		SYS_CLK_EN0_REG0, 22, 0);
-static C3_SYS_GATE(sys_spifc,		SYS_CLK_EN0_REG0, 23, 0);
-static C3_SYS_GATE(sys_nna,		SYS_CLK_EN0_REG0, 25, 0);
-static C3_SYS_GATE(sys_eth_mac,		SYS_CLK_EN0_REG0, 26, 0);
+static C3_SYS_PCLK(sys_irq_ctrl,	SYS_CLK_EN0_REG0, 14, CLK_IS_CRITICAL);
+static C3_SYS_PCLK(sys_msr_clk,		SYS_CLK_EN0_REG0, 15, 0);
+static C3_SYS_PCLK(sys_rom,		SYS_CLK_EN0_REG0, 16, 0);
+static C3_SYS_PCLK(sys_uart_f,		SYS_CLK_EN0_REG0, 17, 0);
+static C3_SYS_PCLK(sys_cpu_apb,		SYS_CLK_EN0_REG0, 18, 0);
+static C3_SYS_PCLK(sys_rsa,		SYS_CLK_EN0_REG0, 19, 0);
+static C3_SYS_PCLK(sys_sar_adc,		SYS_CLK_EN0_REG0, 20, 0);
+static C3_SYS_PCLK(sys_startup,		SYS_CLK_EN0_REG0, 21, 0);
+static C3_SYS_PCLK(sys_secure,		SYS_CLK_EN0_REG0, 22, 0);
+static C3_SYS_PCLK(sys_spifc,		SYS_CLK_EN0_REG0, 23, 0);
+static C3_SYS_PCLK(sys_nna,		SYS_CLK_EN0_REG0, 25, 0);
+static C3_SYS_PCLK(sys_eth_mac,		SYS_CLK_EN0_REG0, 26, 0);
 
 /*
  * FIXME: sys_gic provides the clock for GIC(Generic Interrupt Controller).
@@ -240,8 +240,8 @@ static C3_SYS_GATE(sys_eth_mac,		SYS_CLK_EN0_REG0, 26, 0);
  * used by our GIC is the public driver in kernel, and there is no management
  * clock in the driver.
  */
-static C3_SYS_GATE(sys_gic,		SYS_CLK_EN0_REG0, 27, CLK_IS_CRITICAL);
-static C3_SYS_GATE(sys_rama,		SYS_CLK_EN0_REG0, 28, 0);
+static C3_SYS_PCLK(sys_gic,		SYS_CLK_EN0_REG0, 27, CLK_IS_CRITICAL);
+static C3_SYS_PCLK(sys_rama,		SYS_CLK_EN0_REG0, 28, 0);
 
 /*
  * NOTE: sys_big_nic provides the clock to the control bus of the NIC(Network
@@ -249,84 +249,84 @@ static C3_SYS_GATE(sys_rama,		SYS_CLK_EN0_REG0, 28, 0);
  * SPIFC, CAPU, JTAG, EMMC, SDIO, sec_top, USB, Audio, ETH, SPICC) in the
  * system. After clock is disabled, The NIC cannot work.
  */
-static C3_SYS_GATE(sys_big_nic,		SYS_CLK_EN0_REG0, 29, CLK_IS_CRITICAL);
-static C3_SYS_GATE(sys_ramb,		SYS_CLK_EN0_REG0, 30, 0);
-static C3_SYS_GATE(sys_audio_pclk,	SYS_CLK_EN0_REG0, 31, 0);
-static C3_SYS_GATE(sys_pwm_kl,		SYS_CLK_EN0_REG1, 0, 0);
-static C3_SYS_GATE(sys_pwm_ij,		SYS_CLK_EN0_REG1, 1, 0);
-static C3_SYS_GATE(sys_usb,		SYS_CLK_EN0_REG1, 2, 0);
-static C3_SYS_GATE(sys_sd_emmc_a,	SYS_CLK_EN0_REG1, 3, 0);
-static C3_SYS_GATE(sys_sd_emmc_c,	SYS_CLK_EN0_REG1, 4, 0);
-static C3_SYS_GATE(sys_pwm_ab,		SYS_CLK_EN0_REG1, 5, 0);
-static C3_SYS_GATE(sys_pwm_cd,		SYS_CLK_EN0_REG1, 6, 0);
-static C3_SYS_GATE(sys_pwm_ef,		SYS_CLK_EN0_REG1, 7, 0);
-static C3_SYS_GATE(sys_pwm_gh,		SYS_CLK_EN0_REG1, 8, 0);
-static C3_SYS_GATE(sys_spicc_1,		SYS_CLK_EN0_REG1, 9, 0);
-static C3_SYS_GATE(sys_spicc_0,		SYS_CLK_EN0_REG1, 10, 0);
-static C3_SYS_GATE(sys_uart_a,		SYS_CLK_EN0_REG1, 11, 0);
-static C3_SYS_GATE(sys_uart_b,		SYS_CLK_EN0_REG1, 12, 0);
-static C3_SYS_GATE(sys_uart_c,		SYS_CLK_EN0_REG1, 13, 0);
-static C3_SYS_GATE(sys_uart_d,		SYS_CLK_EN0_REG1, 14, 0);
-static C3_SYS_GATE(sys_uart_e,		SYS_CLK_EN0_REG1, 15, 0);
-static C3_SYS_GATE(sys_i2c_m_a,		SYS_CLK_EN0_REG1, 16, 0);
-static C3_SYS_GATE(sys_i2c_m_b,		SYS_CLK_EN0_REG1, 17, 0);
-static C3_SYS_GATE(sys_i2c_m_c,		SYS_CLK_EN0_REG1, 18, 0);
-static C3_SYS_GATE(sys_i2c_m_d,		SYS_CLK_EN0_REG1, 19, 0);
-static C3_SYS_GATE(sys_i2c_s_a,		SYS_CLK_EN0_REG1, 20, 0);
-static C3_SYS_GATE(sys_rtc,		SYS_CLK_EN0_REG1, 21, 0);
-static C3_SYS_GATE(sys_ge2d,		SYS_CLK_EN0_REG1, 22, 0);
-static C3_SYS_GATE(sys_isp,		SYS_CLK_EN0_REG1, 23, 0);
-static C3_SYS_GATE(sys_gpv_isp_nic,	SYS_CLK_EN0_REG1, 24, 0);
-static C3_SYS_GATE(sys_gpv_cve_nic,	SYS_CLK_EN0_REG1, 25, 0);
-static C3_SYS_GATE(sys_mipi_dsi_host,	SYS_CLK_EN0_REG1, 26, 0);
-static C3_SYS_GATE(sys_mipi_dsi_phy,	SYS_CLK_EN0_REG1, 27, 0);
-static C3_SYS_GATE(sys_eth_phy,		SYS_CLK_EN0_REG1, 28, 0);
-static C3_SYS_GATE(sys_acodec,		SYS_CLK_EN0_REG1, 29, 0);
-static C3_SYS_GATE(sys_dwap,		SYS_CLK_EN0_REG1, 30, 0);
-static C3_SYS_GATE(sys_dos,		SYS_CLK_EN0_REG1, 31, 0);
-static C3_SYS_GATE(sys_cve,		SYS_CLK_EN0_REG2, 0, 0);
-static C3_SYS_GATE(sys_vout,		SYS_CLK_EN0_REG2, 1, 0);
-static C3_SYS_GATE(sys_vc9000e,		SYS_CLK_EN0_REG2, 2, 0);
-static C3_SYS_GATE(sys_pwm_mn,		SYS_CLK_EN0_REG2, 3, 0);
-static C3_SYS_GATE(sys_sd_emmc_b,	SYS_CLK_EN0_REG2, 4, 0);
-
-#define C3_AXI_GATE(_name, _reg, _bit, _flags)				\
-	C3_CLK_GATE(_name, _reg, _bit, axiclk,				\
-		    &clk_regmap_gate_ops, _flags)
+static C3_SYS_PCLK(sys_big_nic,		SYS_CLK_EN0_REG0, 29, CLK_IS_CRITICAL);
+static C3_SYS_PCLK(sys_ramb,		SYS_CLK_EN0_REG0, 30, 0);
+static C3_SYS_PCLK(sys_audio_pclk,	SYS_CLK_EN0_REG0, 31, 0);
+static C3_SYS_PCLK(sys_pwm_kl,		SYS_CLK_EN0_REG1, 0, 0);
+static C3_SYS_PCLK(sys_pwm_ij,		SYS_CLK_EN0_REG1, 1, 0);
+static C3_SYS_PCLK(sys_usb,		SYS_CLK_EN0_REG1, 2, 0);
+static C3_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG1, 3, 0);
+static C3_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG1, 4, 0);
+static C3_SYS_PCLK(sys_pwm_ab,		SYS_CLK_EN0_REG1, 5, 0);
+static C3_SYS_PCLK(sys_pwm_cd,		SYS_CLK_EN0_REG1, 6, 0);
+static C3_SYS_PCLK(sys_pwm_ef,		SYS_CLK_EN0_REG1, 7, 0);
+static C3_SYS_PCLK(sys_pwm_gh,		SYS_CLK_EN0_REG1, 8, 0);
+static C3_SYS_PCLK(sys_spicc_1,		SYS_CLK_EN0_REG1, 9, 0);
+static C3_SYS_PCLK(sys_spicc_0,		SYS_CLK_EN0_REG1, 10, 0);
+static C3_SYS_PCLK(sys_uart_a,		SYS_CLK_EN0_REG1, 11, 0);
+static C3_SYS_PCLK(sys_uart_b,		SYS_CLK_EN0_REG1, 12, 0);
+static C3_SYS_PCLK(sys_uart_c,		SYS_CLK_EN0_REG1, 13, 0);
+static C3_SYS_PCLK(sys_uart_d,		SYS_CLK_EN0_REG1, 14, 0);
+static C3_SYS_PCLK(sys_uart_e,		SYS_CLK_EN0_REG1, 15, 0);
+static C3_SYS_PCLK(sys_i2c_m_a,		SYS_CLK_EN0_REG1, 16, 0);
+static C3_SYS_PCLK(sys_i2c_m_b,		SYS_CLK_EN0_REG1, 17, 0);
+static C3_SYS_PCLK(sys_i2c_m_c,		SYS_CLK_EN0_REG1, 18, 0);
+static C3_SYS_PCLK(sys_i2c_m_d,		SYS_CLK_EN0_REG1, 19, 0);
+static C3_SYS_PCLK(sys_i2c_s_a,		SYS_CLK_EN0_REG1, 20, 0);
+static C3_SYS_PCLK(sys_rtc,		SYS_CLK_EN0_REG1, 21, 0);
+static C3_SYS_PCLK(sys_ge2d,		SYS_CLK_EN0_REG1, 22, 0);
+static C3_SYS_PCLK(sys_isp,		SYS_CLK_EN0_REG1, 23, 0);
+static C3_SYS_PCLK(sys_gpv_isp_nic,	SYS_CLK_EN0_REG1, 24, 0);
+static C3_SYS_PCLK(sys_gpv_cve_nic,	SYS_CLK_EN0_REG1, 25, 0);
+static C3_SYS_PCLK(sys_mipi_dsi_host,	SYS_CLK_EN0_REG1, 26, 0);
+static C3_SYS_PCLK(sys_mipi_dsi_phy,	SYS_CLK_EN0_REG1, 27, 0);
+static C3_SYS_PCLK(sys_eth_phy,		SYS_CLK_EN0_REG1, 28, 0);
+static C3_SYS_PCLK(sys_acodec,		SYS_CLK_EN0_REG1, 29, 0);
+static C3_SYS_PCLK(sys_dwap,		SYS_CLK_EN0_REG1, 30, 0);
+static C3_SYS_PCLK(sys_dos,		SYS_CLK_EN0_REG1, 31, 0);
+static C3_SYS_PCLK(sys_cve,		SYS_CLK_EN0_REG2, 0, 0);
+static C3_SYS_PCLK(sys_vout,		SYS_CLK_EN0_REG2, 1, 0);
+static C3_SYS_PCLK(sys_vc9000e,		SYS_CLK_EN0_REG2, 2, 0);
+static C3_SYS_PCLK(sys_pwm_mn,		SYS_CLK_EN0_REG2, 3, 0);
+static C3_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG2, 4, 0);
+
+#define C3_AXI_PCLK(_name, _reg, _bit, _flags)				\
+	C3_PCLK(_name, _reg, _bit, "axiclk",				\
+		&clk_regmap_gate_ops, _flags)
 
 /*
  * NOTE: axi_sys_nic provides the clock to the AXI bus of the system NIC. After
  * clock is disabled, The NIC cannot work.
  */
-static C3_AXI_GATE(axi_sys_nic,		AXI_CLK_EN0, 2, CLK_IS_CRITICAL);
-static C3_AXI_GATE(axi_isp_nic,		AXI_CLK_EN0, 3, 0);
-static C3_AXI_GATE(axi_cve_nic,		AXI_CLK_EN0, 4, 0);
-static C3_AXI_GATE(axi_ramb,		AXI_CLK_EN0, 5, 0);
-static C3_AXI_GATE(axi_rama,		AXI_CLK_EN0, 6, 0);
+static C3_AXI_PCLK(axi_sys_nic,		AXI_CLK_EN0, 2, CLK_IS_CRITICAL);
+static C3_AXI_PCLK(axi_isp_nic,		AXI_CLK_EN0, 3, 0);
+static C3_AXI_PCLK(axi_cve_nic,		AXI_CLK_EN0, 4, 0);
+static C3_AXI_PCLK(axi_ramb,		AXI_CLK_EN0, 5, 0);
+static C3_AXI_PCLK(axi_rama,		AXI_CLK_EN0, 6, 0);
 
 /*
  * NOTE: axi_cpu_dmc provides the clock to the AXI bus where the CPU accesses
  * the DDR. After clock is disabled, The CPU will not have access to the DDR.
  */
-static C3_AXI_GATE(axi_cpu_dmc,		AXI_CLK_EN0, 7, CLK_IS_CRITICAL);
-static C3_AXI_GATE(axi_nic,		AXI_CLK_EN0, 8, 0);
-static C3_AXI_GATE(axi_dma,		AXI_CLK_EN0, 9, 0);
+static C3_AXI_PCLK(axi_cpu_dmc,		AXI_CLK_EN0, 7, CLK_IS_CRITICAL);
+static C3_AXI_PCLK(axi_nic,		AXI_CLK_EN0, 8, 0);
+static C3_AXI_PCLK(axi_dma,		AXI_CLK_EN0, 9, 0);
 
 /*
  * NOTE: axi_mux_nic provides the clock to the NIC's AXI bus for NN(Neural
  * Network) and other devices(CPU, EMMC, SDIO, sec_top, USB, Audio, ETH, SPICC)
  * to access RAM space.
  */
-static C3_AXI_GATE(axi_mux_nic,		AXI_CLK_EN0, 10, 0);
-static C3_AXI_GATE(axi_cve,		AXI_CLK_EN0, 12, 0);
+static C3_AXI_PCLK(axi_mux_nic,		AXI_CLK_EN0, 10, 0);
+static C3_AXI_PCLK(axi_cve,		AXI_CLK_EN0, 12, 0);
 
 /*
  * NOTE: axi_dev1_dmc provides the clock for the peripherals(EMMC, SDIO,
  * sec_top, USB, Audio, ETH, SPICC) to access the AXI bus of the DDR.
  */
-static C3_AXI_GATE(axi_dev1_dmc,	AXI_CLK_EN0, 13, 0);
-static C3_AXI_GATE(axi_dev0_dmc,	AXI_CLK_EN0, 14, 0);
-static C3_AXI_GATE(axi_dsp_dmc,		AXI_CLK_EN0, 15, 0);
+static C3_AXI_PCLK(axi_dev1_dmc,	AXI_CLK_EN0, 13, 0);
+static C3_AXI_PCLK(axi_dev0_dmc,	AXI_CLK_EN0, 14, 0);
+static C3_AXI_PCLK(axi_dsp_dmc,		AXI_CLK_EN0, 15, 0);
 
 /*
  * clk_12_24m model
@@ -335,7 +335,7 @@ static C3_AXI_GATE(axi_dsp_dmc,		AXI_CLK_EN0, 15, 0);
  * xtal---->| gate |---->| div |------------>| pad |
  *          |------|     |-----|             |-----|
  */
-static struct clk_regmap clk_12_24m_in = {
+static struct clk_regmap c3_clk_12_24m_in = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLK12_24_CTRL,
 		.bit_idx = 11,
@@ -350,7 +350,7 @@ static struct clk_regmap clk_12_24m_in = {
 	},
 };
 
-static struct clk_regmap clk_12_24m = {
+static struct clk_regmap c3_clk_12_24m = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = CLK12_24_CTRL,
 		.shift = 10,
@@ -360,14 +360,14 @@ static struct clk_regmap clk_12_24m = {
 		.name = "clk_12_24m",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&clk_12_24m_in.hw
+			&c3_clk_12_24m_in.hw
 		},
 		.num_parents = 1,
 	},
 };
 
 /* Fix me: set value 0 will div by 2 like value 1 */
-static struct clk_regmap fclk_25m_div = {
+static struct clk_regmap c3_fclk_25m_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = CLK12_24_CTRL,
 		.shift = 0,
@@ -383,7 +383,7 @@ static struct clk_regmap fclk_25m_div = {
 	},
 };
 
-static struct clk_regmap fclk_25m = {
+static struct clk_regmap c3_fclk_25m = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = CLK12_24_CTRL,
 		.bit_idx = 12,
@@ -392,7 +392,7 @@ static struct clk_regmap fclk_25m = {
 		.name = "fclk_25m",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&fclk_25m_div.hw
+			&c3_fclk_25m_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -404,11 +404,10 @@ static struct clk_regmap fclk_25m = {
  * is manged by clock measures module. Their hardware are out of clock tree.
  * Channel 4 8 9 10 11 13 14 15 16 18 are not connected.
  */
-static u32 gen_parent_table[] = { 0, 1, 2, 5, 6, 7, 17, 19, 20, 21, 22, 23, 24};
-
-static const struct clk_parent_data gen_parent_data[] = {
+static u32 c3_gen_parents_val_table[] = { 0, 1, 2, 5, 6, 7, 17, 19, 20, 21, 22, 23, 24};
+static const struct clk_parent_data c3_gen_parents[] = {
 	{ .fw_name = "oscin" },
-	{ .hw = &rtc_clk.hw },
+	{ .hw = &c3_rtc_clk.hw },
 	{ .fw_name = "sysplldiv16" },
 	{ .fw_name = "gp0" },
 	{ .fw_name = "gp1" },
@@ -422,22 +421,22 @@ static const struct clk_parent_data gen_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap gen_sel = {
+static struct clk_regmap c3_gen_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = GEN_CLK_CTRL,
 		.mask = 0x1f,
 		.shift = 12,
-		.table = gen_parent_table,
+		.table = c3_gen_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "gen_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = gen_parent_data,
-		.num_parents = ARRAY_SIZE(gen_parent_data),
+		.parent_data = c3_gen_parents,
+		.num_parents = ARRAY_SIZE(c3_gen_parents),
 	},
 };
 
-static struct clk_regmap gen_div = {
+static struct clk_regmap c3_gen_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = GEN_CLK_CTRL,
 		.shift = 0,
@@ -447,14 +446,14 @@ static struct clk_regmap gen_div = {
 		.name = "gen_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gen_sel.hw
+			&c3_gen_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap gen = {
+static struct clk_regmap c3_gen = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = GEN_CLK_CTRL,
 		.bit_idx = 11,
@@ -463,19 +462,19 @@ static struct clk_regmap gen = {
 		.name = "gen",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&gen_div.hw
+			&c3_gen_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data saradc_parent_data[] = {
+static const struct clk_parent_data c3_saradc_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "sysclk" }
 };
 
-static struct clk_regmap saradc_sel = {
+static struct clk_regmap c3_saradc_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = SAR_CLK_CTRL0,
 		.mask = 0x1,
@@ -484,12 +483,12 @@ static struct clk_regmap saradc_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "saradc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = saradc_parent_data,
-		.num_parents = ARRAY_SIZE(saradc_parent_data),
+		.parent_data = c3_saradc_parents,
+		.num_parents = ARRAY_SIZE(c3_saradc_parents),
 	},
 };
 
-static struct clk_regmap saradc_div = {
+static struct clk_regmap c3_saradc_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = SAR_CLK_CTRL0,
 		.shift = 0,
@@ -499,14 +498,14 @@ static struct clk_regmap saradc_div = {
 		.name = "saradc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&saradc_sel.hw
+			&c3_saradc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap saradc = {
+static struct clk_regmap c3_saradc = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = SAR_CLK_CTRL0,
 		.bit_idx = 8,
@@ -515,21 +514,21 @@ static struct clk_regmap saradc = {
 		.name = "saradc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&saradc_div.hw
+			&c3_saradc_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data pwm_parent_data[] = {
+static const struct clk_parent_data c3_pwm_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "gp1" },
 	{ .fw_name = "fdiv4" },
 	{ .fw_name = "fdiv3" }
 };
 
-#define AML_PWM_CLK_MUX(_name, _reg, _shift) {			\
+#define C3_PWM_CLK_MUX(_name, _reg, _shift) {			\
 	.data = &(struct clk_regmap_mux_data) {			\
 		.offset = _reg,					\
 		.mask = 0x3,					\
@@ -538,12 +537,12 @@ static const struct clk_parent_data pwm_parent_data[] = {
 	.hw.init = &(struct clk_init_data) {			\
 		.name = #_name "_sel",				\
 		.ops = &clk_regmap_mux_ops,			\
-		.parent_data = pwm_parent_data,			\
-		.num_parents = ARRAY_SIZE(pwm_parent_data),	\
+		.parent_data = c3_pwm_parents,			\
+		.num_parents = ARRAY_SIZE(c3_pwm_parents),	\
 	},							\
 }
 
-#define AML_PWM_CLK_DIV(_name, _reg, _shift) {			\
+#define C3_PWM_CLK_DIV(_name, _reg, _shift) {			\
 	.data = &(struct clk_regmap_div_data) {			\
 		.offset = _reg,					\
 		.shift = _shift,				\
@@ -558,7 +557,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
 	},							\
 }
 
-#define AML_PWM_CLK_GATE(_name, _reg, _bit) {			\
+#define C3_PWM_CLK_GATE(_name, _reg, _bit) {			\
 	.data = &(struct clk_regmap_gate_data) {		\
 		.offset = _reg,					\
 		.bit_idx = _bit,				\
@@ -572,105 +571,105 @@ static const struct clk_parent_data pwm_parent_data[] = {
 	},							\
 }
 
-static struct clk_regmap pwm_a_sel =
-	AML_PWM_CLK_MUX(pwm_a, PWM_CLK_AB_CTRL, 9);
-static struct clk_regmap pwm_a_div =
-	AML_PWM_CLK_DIV(pwm_a, PWM_CLK_AB_CTRL, 0);
-static struct clk_regmap pwm_a =
-	AML_PWM_CLK_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
-
-static struct clk_regmap pwm_b_sel =
-	AML_PWM_CLK_MUX(pwm_b, PWM_CLK_AB_CTRL, 25);
-static struct clk_regmap pwm_b_div =
-	AML_PWM_CLK_DIV(pwm_b, PWM_CLK_AB_CTRL, 16);
-static struct clk_regmap pwm_b =
-	AML_PWM_CLK_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
-
-static struct clk_regmap pwm_c_sel =
-	AML_PWM_CLK_MUX(pwm_c, PWM_CLK_CD_CTRL, 9);
-static struct clk_regmap pwm_c_div =
-	AML_PWM_CLK_DIV(pwm_c, PWM_CLK_CD_CTRL, 0);
-static struct clk_regmap pwm_c =
-	AML_PWM_CLK_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
-
-static struct clk_regmap pwm_d_sel =
-	AML_PWM_CLK_MUX(pwm_d, PWM_CLK_CD_CTRL, 25);
-static struct clk_regmap pwm_d_div =
-	AML_PWM_CLK_DIV(pwm_d, PWM_CLK_CD_CTRL, 16);
-static struct clk_regmap pwm_d =
-	AML_PWM_CLK_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
-
-static struct clk_regmap pwm_e_sel =
-	AML_PWM_CLK_MUX(pwm_e, PWM_CLK_EF_CTRL, 9);
-static struct clk_regmap pwm_e_div =
-	AML_PWM_CLK_DIV(pwm_e, PWM_CLK_EF_CTRL, 0);
-static struct clk_regmap pwm_e =
-	AML_PWM_CLK_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
-
-static struct clk_regmap pwm_f_sel =
-	AML_PWM_CLK_MUX(pwm_f, PWM_CLK_EF_CTRL, 25);
-static struct clk_regmap pwm_f_div =
-	AML_PWM_CLK_DIV(pwm_f, PWM_CLK_EF_CTRL, 16);
-static struct clk_regmap pwm_f =
-	AML_PWM_CLK_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
-
-static struct clk_regmap pwm_g_sel =
-	AML_PWM_CLK_MUX(pwm_g, PWM_CLK_GH_CTRL, 9);
-static struct clk_regmap pwm_g_div =
-	AML_PWM_CLK_DIV(pwm_g, PWM_CLK_GH_CTRL, 0);
-static struct clk_regmap pwm_g =
-	AML_PWM_CLK_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
-
-static struct clk_regmap pwm_h_sel =
-	AML_PWM_CLK_MUX(pwm_h, PWM_CLK_GH_CTRL, 25);
-static struct clk_regmap pwm_h_div =
-	AML_PWM_CLK_DIV(pwm_h, PWM_CLK_GH_CTRL, 16);
-static struct clk_regmap pwm_h =
-	AML_PWM_CLK_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
-
-static struct clk_regmap pwm_i_sel =
-	AML_PWM_CLK_MUX(pwm_i, PWM_CLK_IJ_CTRL, 9);
-static struct clk_regmap pwm_i_div =
-	AML_PWM_CLK_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0);
-static struct clk_regmap pwm_i =
-	AML_PWM_CLK_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
-
-static struct clk_regmap pwm_j_sel =
-	AML_PWM_CLK_MUX(pwm_j, PWM_CLK_IJ_CTRL, 25);
-static struct clk_regmap pwm_j_div =
-	AML_PWM_CLK_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16);
-static struct clk_regmap pwm_j =
-	AML_PWM_CLK_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
-
-static struct clk_regmap pwm_k_sel =
-	AML_PWM_CLK_MUX(pwm_k, PWM_CLK_KL_CTRL, 9);
-static struct clk_regmap pwm_k_div =
-	AML_PWM_CLK_DIV(pwm_k, PWM_CLK_KL_CTRL, 0);
-static struct clk_regmap pwm_k =
-	AML_PWM_CLK_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
-
-static struct clk_regmap pwm_l_sel =
-	AML_PWM_CLK_MUX(pwm_l, PWM_CLK_KL_CTRL, 25);
-static struct clk_regmap pwm_l_div =
-	AML_PWM_CLK_DIV(pwm_l, PWM_CLK_KL_CTRL, 16);
-static struct clk_regmap pwm_l =
-	AML_PWM_CLK_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
-
-static struct clk_regmap pwm_m_sel =
-	AML_PWM_CLK_MUX(pwm_m, PWM_CLK_MN_CTRL, 9);
-static struct clk_regmap pwm_m_div =
-	AML_PWM_CLK_DIV(pwm_m, PWM_CLK_MN_CTRL, 0);
-static struct clk_regmap pwm_m =
-	AML_PWM_CLK_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
-
-static struct clk_regmap pwm_n_sel =
-	AML_PWM_CLK_MUX(pwm_n, PWM_CLK_MN_CTRL, 25);
-static struct clk_regmap pwm_n_div =
-	AML_PWM_CLK_DIV(pwm_n, PWM_CLK_MN_CTRL, 16);
-static struct clk_regmap pwm_n =
-	AML_PWM_CLK_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
-
-static const struct clk_parent_data spicc_parent_data[] = {
+static struct clk_regmap c3_pwm_a_sel =
+	C3_PWM_CLK_MUX(pwm_a, PWM_CLK_AB_CTRL, 9);
+static struct clk_regmap c3_pwm_a_div =
+	C3_PWM_CLK_DIV(pwm_a, PWM_CLK_AB_CTRL, 0);
+static struct clk_regmap c3_pwm_a =
+	C3_PWM_CLK_GATE(pwm_a, PWM_CLK_AB_CTRL, 8);
+
+static struct clk_regmap c3_pwm_b_sel =
+	C3_PWM_CLK_MUX(pwm_b, PWM_CLK_AB_CTRL, 25);
+static struct clk_regmap c3_pwm_b_div =
+	C3_PWM_CLK_DIV(pwm_b, PWM_CLK_AB_CTRL, 16);
+static struct clk_regmap c3_pwm_b =
+	C3_PWM_CLK_GATE(pwm_b, PWM_CLK_AB_CTRL, 24);
+
+static struct clk_regmap c3_pwm_c_sel =
+	C3_PWM_CLK_MUX(pwm_c, PWM_CLK_CD_CTRL, 9);
+static struct clk_regmap c3_pwm_c_div =
+	C3_PWM_CLK_DIV(pwm_c, PWM_CLK_CD_CTRL, 0);
+static struct clk_regmap c3_pwm_c =
+	C3_PWM_CLK_GATE(pwm_c, PWM_CLK_CD_CTRL, 8);
+
+static struct clk_regmap c3_pwm_d_sel =
+	C3_PWM_CLK_MUX(pwm_d, PWM_CLK_CD_CTRL, 25);
+static struct clk_regmap c3_pwm_d_div =
+	C3_PWM_CLK_DIV(pwm_d, PWM_CLK_CD_CTRL, 16);
+static struct clk_regmap c3_pwm_d =
+	C3_PWM_CLK_GATE(pwm_d, PWM_CLK_CD_CTRL, 24);
+
+static struct clk_regmap c3_pwm_e_sel =
+	C3_PWM_CLK_MUX(pwm_e, PWM_CLK_EF_CTRL, 9);
+static struct clk_regmap c3_pwm_e_div =
+	C3_PWM_CLK_DIV(pwm_e, PWM_CLK_EF_CTRL, 0);
+static struct clk_regmap c3_pwm_e =
+	C3_PWM_CLK_GATE(pwm_e, PWM_CLK_EF_CTRL, 8);
+
+static struct clk_regmap c3_pwm_f_sel =
+	C3_PWM_CLK_MUX(pwm_f, PWM_CLK_EF_CTRL, 25);
+static struct clk_regmap c3_pwm_f_div =
+	C3_PWM_CLK_DIV(pwm_f, PWM_CLK_EF_CTRL, 16);
+static struct clk_regmap c3_pwm_f =
+	C3_PWM_CLK_GATE(pwm_f, PWM_CLK_EF_CTRL, 24);
+
+static struct clk_regmap c3_pwm_g_sel =
+	C3_PWM_CLK_MUX(pwm_g, PWM_CLK_GH_CTRL, 9);
+static struct clk_regmap c3_pwm_g_div =
+	C3_PWM_CLK_DIV(pwm_g, PWM_CLK_GH_CTRL, 0);
+static struct clk_regmap c3_pwm_g =
+	C3_PWM_CLK_GATE(pwm_g, PWM_CLK_GH_CTRL, 8);
+
+static struct clk_regmap c3_pwm_h_sel =
+	C3_PWM_CLK_MUX(pwm_h, PWM_CLK_GH_CTRL, 25);
+static struct clk_regmap c3_pwm_h_div =
+	C3_PWM_CLK_DIV(pwm_h, PWM_CLK_GH_CTRL, 16);
+static struct clk_regmap c3_pwm_h =
+	C3_PWM_CLK_GATE(pwm_h, PWM_CLK_GH_CTRL, 24);
+
+static struct clk_regmap c3_pwm_i_sel =
+	C3_PWM_CLK_MUX(pwm_i, PWM_CLK_IJ_CTRL, 9);
+static struct clk_regmap c3_pwm_i_div =
+	C3_PWM_CLK_DIV(pwm_i, PWM_CLK_IJ_CTRL, 0);
+static struct clk_regmap c3_pwm_i =
+	C3_PWM_CLK_GATE(pwm_i, PWM_CLK_IJ_CTRL, 8);
+
+static struct clk_regmap c3_pwm_j_sel =
+	C3_PWM_CLK_MUX(pwm_j, PWM_CLK_IJ_CTRL, 25);
+static struct clk_regmap c3_pwm_j_div =
+	C3_PWM_CLK_DIV(pwm_j, PWM_CLK_IJ_CTRL, 16);
+static struct clk_regmap c3_pwm_j =
+	C3_PWM_CLK_GATE(pwm_j, PWM_CLK_IJ_CTRL, 24);
+
+static struct clk_regmap c3_pwm_k_sel =
+	C3_PWM_CLK_MUX(pwm_k, PWM_CLK_KL_CTRL, 9);
+static struct clk_regmap c3_pwm_k_div =
+	C3_PWM_CLK_DIV(pwm_k, PWM_CLK_KL_CTRL, 0);
+static struct clk_regmap c3_pwm_k =
+	C3_PWM_CLK_GATE(pwm_k, PWM_CLK_KL_CTRL, 8);
+
+static struct clk_regmap c3_pwm_l_sel =
+	C3_PWM_CLK_MUX(pwm_l, PWM_CLK_KL_CTRL, 25);
+static struct clk_regmap c3_pwm_l_div =
+	C3_PWM_CLK_DIV(pwm_l, PWM_CLK_KL_CTRL, 16);
+static struct clk_regmap c3_pwm_l =
+	C3_PWM_CLK_GATE(pwm_l, PWM_CLK_KL_CTRL, 24);
+
+static struct clk_regmap c3_pwm_m_sel =
+	C3_PWM_CLK_MUX(pwm_m, PWM_CLK_MN_CTRL, 9);
+static struct clk_regmap c3_pwm_m_div =
+	C3_PWM_CLK_DIV(pwm_m, PWM_CLK_MN_CTRL, 0);
+static struct clk_regmap c3_pwm_m =
+	C3_PWM_CLK_GATE(pwm_m, PWM_CLK_MN_CTRL, 8);
+
+static struct clk_regmap c3_pwm_n_sel =
+	C3_PWM_CLK_MUX(pwm_n, PWM_CLK_MN_CTRL, 25);
+static struct clk_regmap c3_pwm_n_div =
+	C3_PWM_CLK_DIV(pwm_n, PWM_CLK_MN_CTRL, 16);
+static struct clk_regmap c3_pwm_n =
+	C3_PWM_CLK_GATE(pwm_n, PWM_CLK_MN_CTRL, 24);
+
+static const struct clk_parent_data c3_spicc_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "sysclk" },
 	{ .fw_name = "fdiv4" },
@@ -681,7 +680,7 @@ static const struct clk_parent_data spicc_parent_data[] = {
 	{ .fw_name = "gp1" }
 };
 
-static struct clk_regmap spicc_a_sel = {
+static struct clk_regmap c3_spicc_a_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = SPICC_CLK_CTRL,
 		.mask = 0x7,
@@ -690,12 +689,12 @@ static struct clk_regmap spicc_a_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "spicc_a_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spicc_parent_data,
-		.num_parents = ARRAY_SIZE(spicc_parent_data),
+		.parent_data = c3_spicc_parents,
+		.num_parents = ARRAY_SIZE(c3_spicc_parents),
 	},
 };
 
-static struct clk_regmap spicc_a_div = {
+static struct clk_regmap c3_spicc_a_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = SPICC_CLK_CTRL,
 		.shift = 0,
@@ -705,14 +704,14 @@ static struct clk_regmap spicc_a_div = {
 		.name = "spicc_a_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spicc_a_sel.hw
+			&c3_spicc_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spicc_a = {
+static struct clk_regmap c3_spicc_a = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = SPICC_CLK_CTRL,
 		.bit_idx = 6,
@@ -721,14 +720,14 @@ static struct clk_regmap spicc_a = {
 		.name = "spicc_a",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spicc_a_div.hw
+			&c3_spicc_a_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spicc_b_sel = {
+static struct clk_regmap c3_spicc_b_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = SPICC_CLK_CTRL,
 		.mask = 0x7,
@@ -737,12 +736,12 @@ static struct clk_regmap spicc_b_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "spicc_b_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spicc_parent_data,
-		.num_parents = ARRAY_SIZE(spicc_parent_data),
+		.parent_data = c3_spicc_parents,
+		.num_parents = ARRAY_SIZE(c3_spicc_parents),
 	},
 };
 
-static struct clk_regmap spicc_b_div = {
+static struct clk_regmap c3_spicc_b_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = SPICC_CLK_CTRL,
 		.shift = 16,
@@ -752,14 +751,14 @@ static struct clk_regmap spicc_b_div = {
 		.name = "spicc_b_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spicc_b_sel.hw
+			&c3_spicc_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spicc_b = {
+static struct clk_regmap c3_spicc_b = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = SPICC_CLK_CTRL,
 		.bit_idx = 22,
@@ -768,14 +767,14 @@ static struct clk_regmap spicc_b = {
 		.name = "spicc_b",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spicc_b_div.hw
+			&c3_spicc_b_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data spifc_parent_data[] = {
+static const struct clk_parent_data c3_spifc_parents[] = {
 	{ .fw_name = "gp0" },
 	{ .fw_name = "fdiv2" },
 	{ .fw_name = "fdiv3" },
@@ -786,7 +785,7 @@ static const struct clk_parent_data spifc_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap spifc_sel = {
+static struct clk_regmap c3_spifc_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = SPIFC_CLK_CTRL,
 		.mask = 0x7,
@@ -795,12 +794,12 @@ static struct clk_regmap spifc_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "spifc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = spifc_parent_data,
-		.num_parents = ARRAY_SIZE(spifc_parent_data),
+		.parent_data = c3_spifc_parents,
+		.num_parents = ARRAY_SIZE(c3_spifc_parents),
 	},
 };
 
-static struct clk_regmap spifc_div = {
+static struct clk_regmap c3_spifc_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = SPIFC_CLK_CTRL,
 		.shift = 0,
@@ -810,14 +809,14 @@ static struct clk_regmap spifc_div = {
 		.name = "spifc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spifc_sel.hw
+			&c3_spifc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap spifc = {
+static struct clk_regmap c3_spifc = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = SPIFC_CLK_CTRL,
 		.bit_idx = 8,
@@ -826,14 +825,14 @@ static struct clk_regmap spifc = {
 		.name = "spifc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&spifc_div.hw
+			&c3_spifc_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data emmc_parent_data[] = {
+static const struct clk_parent_data c3_sd_emmc_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "fdiv2" },
 	{ .fw_name = "fdiv3" },
@@ -844,7 +843,7 @@ static const struct clk_parent_data emmc_parent_data[] = {
 	{ .fw_name = "gp0" }
 };
 
-static struct clk_regmap sd_emmc_a_sel = {
+static struct clk_regmap c3_sd_emmc_a_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = SD_EMMC_CLK_CTRL,
 		.mask = 0x7,
@@ -853,12 +852,12 @@ static struct clk_regmap sd_emmc_a_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_a_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = emmc_parent_data,
-		.num_parents = ARRAY_SIZE(emmc_parent_data),
+		.parent_data = c3_sd_emmc_parents,
+		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
 	},
 };
 
-static struct clk_regmap sd_emmc_a_div = {
+static struct clk_regmap c3_sd_emmc_a_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = SD_EMMC_CLK_CTRL,
 		.shift = 0,
@@ -868,14 +867,14 @@ static struct clk_regmap sd_emmc_a_div = {
 		.name = "sd_emmc_a_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_a_sel.hw
+			&c3_sd_emmc_a_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sd_emmc_a = {
+static struct clk_regmap c3_sd_emmc_a = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = SD_EMMC_CLK_CTRL,
 		.bit_idx = 7,
@@ -884,14 +883,14 @@ static struct clk_regmap sd_emmc_a = {
 		.name = "sd_emmc_a",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_a_div.hw
+			&c3_sd_emmc_a_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sd_emmc_b_sel = {
+static struct clk_regmap c3_sd_emmc_b_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = SD_EMMC_CLK_CTRL,
 		.mask = 0x7,
@@ -900,12 +899,12 @@ static struct clk_regmap sd_emmc_b_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_b_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = emmc_parent_data,
-		.num_parents = ARRAY_SIZE(emmc_parent_data),
+		.parent_data = c3_sd_emmc_parents,
+		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
 	},
 };
 
-static struct clk_regmap sd_emmc_b_div = {
+static struct clk_regmap c3_sd_emmc_b_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = SD_EMMC_CLK_CTRL,
 		.shift = 16,
@@ -915,14 +914,14 @@ static struct clk_regmap sd_emmc_b_div = {
 		.name = "sd_emmc_b_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_b_sel.hw
+			&c3_sd_emmc_b_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sd_emmc_b = {
+static struct clk_regmap c3_sd_emmc_b = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = SD_EMMC_CLK_CTRL,
 		.bit_idx = 23,
@@ -931,14 +930,14 @@ static struct clk_regmap sd_emmc_b = {
 		.name = "sd_emmc_b",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_b_div.hw
+			&c3_sd_emmc_b_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sd_emmc_c_sel = {
+static struct clk_regmap c3_sd_emmc_c_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = NAND_CLK_CTRL,
 		.mask = 0x7,
@@ -947,12 +946,12 @@ static struct clk_regmap sd_emmc_c_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "sd_emmc_c_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = emmc_parent_data,
-		.num_parents = ARRAY_SIZE(emmc_parent_data),
+		.parent_data = c3_sd_emmc_parents,
+		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
 	},
 };
 
-static struct clk_regmap sd_emmc_c_div = {
+static struct clk_regmap c3_sd_emmc_c_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = NAND_CLK_CTRL,
 		.shift = 0,
@@ -962,14 +961,14 @@ static struct clk_regmap sd_emmc_c_div = {
 		.name = "sd_emmc_c_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_c_sel.hw
+			&c3_sd_emmc_c_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap sd_emmc_c = {
+static struct clk_regmap c3_sd_emmc_c = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = NAND_CLK_CTRL,
 		.bit_idx = 7,
@@ -978,14 +977,14 @@ static struct clk_regmap sd_emmc_c = {
 		.name = "sd_emmc_c",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&sd_emmc_c_div.hw
+			&c3_sd_emmc_c_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ts_div = {
+static struct clk_regmap c3_ts_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = TS_CLK_CTRL,
 		.shift = 0,
@@ -1001,7 +1000,7 @@ static struct clk_regmap ts_div = {
 	},
 };
 
-static struct clk_regmap ts = {
+static struct clk_regmap c3_ts = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = TS_CLK_CTRL,
 		.bit_idx = 8,
@@ -1010,29 +1009,29 @@ static struct clk_regmap ts = {
 		.name = "ts",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ts_div.hw
+			&c3_ts_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data eth_parent = {
+static const struct clk_parent_data c3_eth_parents = {
 	.fw_name = "fdiv2",
 };
 
-static struct clk_fixed_factor eth_125m_div = {
+static struct clk_fixed_factor c3_eth_125m_div = {
 	.mult = 1,
 	.div = 8,
 	.hw.init = &(struct clk_init_data) {
 		.name = "eth_125m_div",
 		.ops = &clk_fixed_factor_ops,
-		.parent_data = &eth_parent,
+		.parent_data = &c3_eth_parents,
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap eth_125m = {
+static struct clk_regmap c3_eth_125m = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ETH_CLK_CTRL,
 		.bit_idx = 7,
@@ -1041,14 +1040,14 @@ static struct clk_regmap eth_125m = {
 		.name = "eth_125m",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&eth_125m_div.hw
+			&c3_eth_125m_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap eth_rmii_div = {
+static struct clk_regmap c3_eth_rmii_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ETH_CLK_CTRL,
 		.shift = 0,
@@ -1057,12 +1056,12 @@ static struct clk_regmap eth_rmii_div = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "eth_rmii_div",
 		.ops = &clk_regmap_divider_ops,
-		.parent_data = &eth_parent,
+		.parent_data = &c3_eth_parents,
 		.num_parents = 1,
 	},
 };
 
-static struct clk_regmap eth_rmii = {
+static struct clk_regmap c3_eth_rmii = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ETH_CLK_CTRL,
 		.bit_idx = 8,
@@ -1071,14 +1070,14 @@ static struct clk_regmap eth_rmii = {
 		.name = "eth_rmii",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&eth_rmii_div.hw
+			&c3_eth_rmii_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data mipi_dsi_meas_parent_data[] = {
+static const struct clk_parent_data c3_mipi_dsi_meas_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "fdiv4" },
 	{ .fw_name = "fdiv3" },
@@ -1089,7 +1088,7 @@ static const struct clk_parent_data mipi_dsi_meas_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap mipi_dsi_meas_sel = {
+static struct clk_regmap c3_mipi_dsi_meas_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VDIN_MEAS_CLK_CTRL,
 		.mask = 0x7,
@@ -1098,12 +1097,12 @@ static struct clk_regmap mipi_dsi_meas_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "mipi_dsi_meas_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = mipi_dsi_meas_parent_data,
-		.num_parents = ARRAY_SIZE(mipi_dsi_meas_parent_data),
+		.parent_data = c3_mipi_dsi_meas_parents,
+		.num_parents = ARRAY_SIZE(c3_mipi_dsi_meas_parents),
 	},
 };
 
-static struct clk_regmap mipi_dsi_meas_div = {
+static struct clk_regmap c3_mipi_dsi_meas_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VDIN_MEAS_CLK_CTRL,
 		.shift = 12,
@@ -1113,14 +1112,14 @@ static struct clk_regmap mipi_dsi_meas_div = {
 		.name = "mipi_dsi_meas_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mipi_dsi_meas_sel.hw
+			&c3_mipi_dsi_meas_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap mipi_dsi_meas = {
+static struct clk_regmap c3_mipi_dsi_meas = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VDIN_MEAS_CLK_CTRL,
 		.bit_idx = 20,
@@ -1129,14 +1128,14 @@ static struct clk_regmap mipi_dsi_meas = {
 		.name = "mipi_dsi_meas",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&mipi_dsi_meas_div.hw
+			&c3_mipi_dsi_meas_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data dsi_phy_parent_data[] = {
+static const struct clk_parent_data c3_dsi_phy_parents[] = {
 	{ .fw_name = "gp1" },
 	{ .fw_name = "gp0" },
 	{ .fw_name = "hifi" },
@@ -1147,7 +1146,7 @@ static const struct clk_parent_data dsi_phy_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap dsi_phy_sel = {
+static struct clk_regmap c3_dsi_phy_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = MIPIDSI_PHY_CLK_CTRL,
 		.mask = 0x7,
@@ -1156,12 +1155,12 @@ static struct clk_regmap dsi_phy_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "dsi_phy_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = dsi_phy_parent_data,
-		.num_parents = ARRAY_SIZE(dsi_phy_parent_data),
+		.parent_data = c3_dsi_phy_parents,
+		.num_parents = ARRAY_SIZE(c3_dsi_phy_parents),
 	},
 };
 
-static struct clk_regmap dsi_phy_div = {
+static struct clk_regmap c3_dsi_phy_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = MIPIDSI_PHY_CLK_CTRL,
 		.shift = 0,
@@ -1171,14 +1170,14 @@ static struct clk_regmap dsi_phy_div = {
 		.name = "dsi_phy_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dsi_phy_sel.hw
+			&c3_dsi_phy_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dsi_phy = {
+static struct clk_regmap c3_dsi_phy = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = MIPIDSI_PHY_CLK_CTRL,
 		.bit_idx = 8,
@@ -1187,14 +1186,14 @@ static struct clk_regmap dsi_phy = {
 		.name = "dsi_phy",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dsi_phy_div.hw
+			&c3_dsi_phy_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data vout_mclk_parent_data[] = {
+static const struct clk_parent_data c3_vout_mclk_parents[] = {
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1205,7 +1204,7 @@ static const struct clk_parent_data vout_mclk_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap vout_mclk_sel = {
+static struct clk_regmap c3_vout_mclk_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VOUTENC_CLK_CTRL,
 		.mask = 0x7,
@@ -1214,12 +1213,12 @@ static struct clk_regmap vout_mclk_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vout_mclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = vout_mclk_parent_data,
-		.num_parents = ARRAY_SIZE(vout_mclk_parent_data),
+		.parent_data = c3_vout_mclk_parents,
+		.num_parents = ARRAY_SIZE(c3_vout_mclk_parents),
 	},
 };
 
-static struct clk_regmap vout_mclk_div = {
+static struct clk_regmap c3_vout_mclk_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VOUTENC_CLK_CTRL,
 		.shift = 0,
@@ -1229,14 +1228,14 @@ static struct clk_regmap vout_mclk_div = {
 		.name = "vout_mclk_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vout_mclk_sel.hw
+			&c3_vout_mclk_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap vout_mclk = {
+static struct clk_regmap c3_vout_mclk = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VOUTENC_CLK_CTRL,
 		.bit_idx = 8,
@@ -1245,14 +1244,14 @@ static struct clk_regmap vout_mclk = {
 		.name = "vout_mclk",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vout_mclk_div.hw
+			&c3_vout_mclk_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data vout_enc_parent_data[] = {
+static const struct clk_parent_data c3_vout_enc_parents[] = {
 	{ .fw_name = "gp1" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1263,7 +1262,7 @@ static const struct clk_parent_data vout_enc_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap vout_enc_sel = {
+static struct clk_regmap c3_vout_enc_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VOUTENC_CLK_CTRL,
 		.mask = 0x7,
@@ -1272,12 +1271,12 @@ static struct clk_regmap vout_enc_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vout_enc_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = vout_enc_parent_data,
-		.num_parents = ARRAY_SIZE(vout_enc_parent_data),
+		.parent_data = c3_vout_enc_parents,
+		.num_parents = ARRAY_SIZE(c3_vout_enc_parents),
 	},
 };
 
-static struct clk_regmap vout_enc_div = {
+static struct clk_regmap c3_vout_enc_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VOUTENC_CLK_CTRL,
 		.shift = 16,
@@ -1287,14 +1286,14 @@ static struct clk_regmap vout_enc_div = {
 		.name = "vout_enc_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vout_enc_sel.hw
+			&c3_vout_enc_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap vout_enc = {
+static struct clk_regmap c3_vout_enc = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VOUTENC_CLK_CTRL,
 		.bit_idx = 24,
@@ -1303,14 +1302,14 @@ static struct clk_regmap vout_enc = {
 		.name = "vout_enc",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vout_enc_div.hw
+			&c3_vout_enc_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data hcodec_pre_parent_data[] = {
+static const struct clk_parent_data c3_hcodec_pre_parents[] = {
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1321,7 +1320,7 @@ static const struct clk_parent_data hcodec_pre_parent_data[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap hcodec_0_sel = {
+static struct clk_regmap c3_hcodec_0_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VDEC_CLK_CTRL,
 		.mask = 0x7,
@@ -1330,12 +1329,12 @@ static struct clk_regmap hcodec_0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "hcodec_0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = hcodec_pre_parent_data,
-		.num_parents = ARRAY_SIZE(hcodec_pre_parent_data),
+		.parent_data = c3_hcodec_pre_parents,
+		.num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
 	},
 };
 
-static struct clk_regmap hcodec_0_div = {
+static struct clk_regmap c3_hcodec_0_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VDEC_CLK_CTRL,
 		.shift = 0,
@@ -1345,14 +1344,14 @@ static struct clk_regmap hcodec_0_div = {
 		.name = "hcodec_0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&hcodec_0_sel.hw
+			&c3_hcodec_0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap hcodec_0 = {
+static struct clk_regmap c3_hcodec_0 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VDEC_CLK_CTRL,
 		.bit_idx = 8,
@@ -1361,14 +1360,14 @@ static struct clk_regmap hcodec_0 = {
 		.name = "hcodec_0",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&hcodec_0_div.hw
+			&c3_hcodec_0_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap hcodec_1_sel = {
+static struct clk_regmap c3_hcodec_1_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VDEC3_CLK_CTRL,
 		.mask = 0x7,
@@ -1377,12 +1376,12 @@ static struct clk_regmap hcodec_1_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "hcodec_1_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = hcodec_pre_parent_data,
-		.num_parents = ARRAY_SIZE(hcodec_pre_parent_data),
+		.parent_data = c3_hcodec_pre_parents,
+		.num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
 	},
 };
 
-static struct clk_regmap hcodec_1_div = {
+static struct clk_regmap c3_hcodec_1_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VDEC3_CLK_CTRL,
 		.shift = 0,
@@ -1392,14 +1391,14 @@ static struct clk_regmap hcodec_1_div = {
 		.name = "hcodec_1_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&hcodec_1_sel.hw
+			&c3_hcodec_1_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap hcodec_1 = {
+static struct clk_regmap c3_hcodec_1 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VDEC3_CLK_CTRL,
 		.bit_idx = 8,
@@ -1408,19 +1407,19 @@ static struct clk_regmap hcodec_1 = {
 		.name = "hcodec_1",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&hcodec_1_div.hw
+			&c3_hcodec_1_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data hcodec_parent_data[] = {
-	{ .hw = &hcodec_0.hw },
-	{ .hw = &hcodec_1.hw }
+static const struct clk_parent_data c3_hcodec_parents[] = {
+	{ .hw = &c3_hcodec_0.hw },
+	{ .hw = &c3_hcodec_1.hw }
 };
 
-static struct clk_regmap hcodec = {
+static struct clk_regmap c3_hcodec = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VDEC3_CLK_CTRL,
 		.mask = 0x1,
@@ -1429,13 +1428,13 @@ static struct clk_regmap hcodec = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "hcodec",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = hcodec_parent_data,
-		.num_parents = ARRAY_SIZE(hcodec_parent_data),
+		.parent_data = c3_hcodec_parents,
+		.num_parents = ARRAY_SIZE(c3_hcodec_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data vc9000e_parent_data[] = {
+static const struct clk_parent_data c3_vc9000e_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "fdiv4" },
 	{ .fw_name = "fdiv3" },
@@ -1446,7 +1445,7 @@ static const struct clk_parent_data vc9000e_parent_data[] = {
 	{ .fw_name = "gp0" }
 };
 
-static struct clk_regmap vc9000e_aclk_sel = {
+static struct clk_regmap c3_vc9000e_aclk_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VC9000E_CLK_CTRL,
 		.mask = 0x7,
@@ -1455,12 +1454,12 @@ static struct clk_regmap vc9000e_aclk_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vc9000e_aclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = vc9000e_parent_data,
-		.num_parents = ARRAY_SIZE(vc9000e_parent_data),
+		.parent_data = c3_vc9000e_parents,
+		.num_parents = ARRAY_SIZE(c3_vc9000e_parents),
 	},
 };
 
-static struct clk_regmap vc9000e_aclk_div = {
+static struct clk_regmap c3_vc9000e_aclk_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VC9000E_CLK_CTRL,
 		.shift = 0,
@@ -1470,14 +1469,14 @@ static struct clk_regmap vc9000e_aclk_div = {
 		.name = "vc9000e_aclk_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vc9000e_aclk_sel.hw
+			&c3_vc9000e_aclk_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap vc9000e_aclk = {
+static struct clk_regmap c3_vc9000e_aclk = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VC9000E_CLK_CTRL,
 		.bit_idx = 8,
@@ -1486,14 +1485,14 @@ static struct clk_regmap vc9000e_aclk = {
 		.name = "vc9000e_aclk",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vc9000e_aclk_div.hw
+			&c3_vc9000e_aclk_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap vc9000e_core_sel = {
+static struct clk_regmap c3_vc9000e_core_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VC9000E_CLK_CTRL,
 		.mask = 0x7,
@@ -1502,12 +1501,12 @@ static struct clk_regmap vc9000e_core_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vc9000e_core_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = vc9000e_parent_data,
-		.num_parents = ARRAY_SIZE(vc9000e_parent_data),
+		.parent_data = c3_vc9000e_parents,
+		.num_parents = ARRAY_SIZE(c3_vc9000e_parents),
 	},
 };
 
-static struct clk_regmap vc9000e_core_div = {
+static struct clk_regmap c3_vc9000e_core_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VC9000E_CLK_CTRL,
 		.shift = 16,
@@ -1517,14 +1516,14 @@ static struct clk_regmap vc9000e_core_div = {
 		.name = "vc9000e_core_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vc9000e_core_sel.hw
+			&c3_vc9000e_core_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap vc9000e_core = {
+static struct clk_regmap c3_vc9000e_core = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VC9000E_CLK_CTRL,
 		.bit_idx = 24,
@@ -1533,14 +1532,14 @@ static struct clk_regmap vc9000e_core = {
 		.name = "vc9000e_core",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vc9000e_core_div.hw
+			&c3_vc9000e_core_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data csi_phy_parent_data[] = {
+static const struct clk_parent_data c3_csi_phy_parents[] = {
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1551,7 +1550,7 @@ static const struct clk_parent_data csi_phy_parent_data[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap csi_phy0_sel = {
+static struct clk_regmap c3_csi_phy0_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = ISP0_CLK_CTRL,
 		.mask = 0x7,
@@ -1560,12 +1559,12 @@ static struct clk_regmap csi_phy0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "csi_phy0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = csi_phy_parent_data,
-		.num_parents = ARRAY_SIZE(csi_phy_parent_data),
+		.parent_data = c3_csi_phy_parents,
+		.num_parents = ARRAY_SIZE(c3_csi_phy_parents),
 	},
 };
 
-static struct clk_regmap csi_phy0_div = {
+static struct clk_regmap c3_csi_phy0_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ISP0_CLK_CTRL,
 		.shift = 16,
@@ -1575,14 +1574,14 @@ static struct clk_regmap csi_phy0_div = {
 		.name = "csi_phy0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&csi_phy0_sel.hw
+			&c3_csi_phy0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap csi_phy0 = {
+static struct clk_regmap c3_csi_phy0 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ISP0_CLK_CTRL,
 		.bit_idx = 24,
@@ -1591,14 +1590,14 @@ static struct clk_regmap csi_phy0 = {
 		.name = "csi_phy0",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&csi_phy0_div.hw
+			&c3_csi_phy0_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data dewarpa_parent_data[] = {
+static const struct clk_parent_data c3_dewarpa_parents[] = {
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1609,7 +1608,7 @@ static const struct clk_parent_data dewarpa_parent_data[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap dewarpa_sel = {
+static struct clk_regmap c3_dewarpa_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = DEWARPA_CLK_CTRL,
 		.mask = 0x7,
@@ -1618,12 +1617,12 @@ static struct clk_regmap dewarpa_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "dewarpa_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = dewarpa_parent_data,
-		.num_parents = ARRAY_SIZE(dewarpa_parent_data),
+		.parent_data = c3_dewarpa_parents,
+		.num_parents = ARRAY_SIZE(c3_dewarpa_parents),
 	},
 };
 
-static struct clk_regmap dewarpa_div = {
+static struct clk_regmap c3_dewarpa_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = DEWARPA_CLK_CTRL,
 		.shift = 0,
@@ -1633,14 +1632,14 @@ static struct clk_regmap dewarpa_div = {
 		.name = "dewarpa_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dewarpa_sel.hw
+			&c3_dewarpa_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap dewarpa = {
+static struct clk_regmap c3_dewarpa = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = DEWARPA_CLK_CTRL,
 		.bit_idx = 8,
@@ -1649,14 +1648,14 @@ static struct clk_regmap dewarpa = {
 		.name = "dewarpa",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&dewarpa_div.hw
+			&c3_dewarpa_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data isp_parent_data[] = {
+static const struct clk_parent_data c3_isp_parents[] = {
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1667,7 +1666,7 @@ static const struct clk_parent_data isp_parent_data[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap isp0_sel = {
+static struct clk_regmap c3_isp0_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = ISP0_CLK_CTRL,
 		.mask = 0x7,
@@ -1676,12 +1675,12 @@ static struct clk_regmap isp0_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "isp0_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = isp_parent_data,
-		.num_parents = ARRAY_SIZE(isp_parent_data),
+		.parent_data = c3_isp_parents,
+		.num_parents = ARRAY_SIZE(c3_isp_parents),
 	},
 };
 
-static struct clk_regmap isp0_div = {
+static struct clk_regmap c3_isp0_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = ISP0_CLK_CTRL,
 		.shift = 0,
@@ -1691,14 +1690,14 @@ static struct clk_regmap isp0_div = {
 		.name = "isp0_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&isp0_sel.hw
+			&c3_isp0_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap isp0 = {
+static struct clk_regmap c3_isp0 = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = ISP0_CLK_CTRL,
 		.bit_idx = 8,
@@ -1707,14 +1706,14 @@ static struct clk_regmap isp0 = {
 		.name = "isp0",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&isp0_div.hw
+			&c3_isp0_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data nna_core_parent_data[] = {
+static const struct clk_parent_data c3_nna_core_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv4" },
@@ -1725,7 +1724,7 @@ static const struct clk_parent_data nna_core_parent_data[] = {
 	{ .fw_name = "hifi" }
 };
 
-static struct clk_regmap nna_core_sel = {
+static struct clk_regmap c3_nna_core_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = NNA_CLK_CTRL,
 		.mask = 0x7,
@@ -1734,12 +1733,12 @@ static struct clk_regmap nna_core_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "nna_core_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = nna_core_parent_data,
-		.num_parents = ARRAY_SIZE(nna_core_parent_data),
+		.parent_data = c3_nna_core_parents,
+		.num_parents = ARRAY_SIZE(c3_nna_core_parents),
 	},
 };
 
-static struct clk_regmap nna_core_div = {
+static struct clk_regmap c3_nna_core_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = NNA_CLK_CTRL,
 		.shift = 0,
@@ -1749,14 +1748,14 @@ static struct clk_regmap nna_core_div = {
 		.name = "nna_core_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&nna_core_sel.hw
+			&c3_nna_core_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap nna_core = {
+static struct clk_regmap c3_nna_core = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = NNA_CLK_CTRL,
 		.bit_idx = 8,
@@ -1765,14 +1764,14 @@ static struct clk_regmap nna_core = {
 		.name = "nna_core",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&nna_core_div.hw
+			&c3_nna_core_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data ge2d_parent_data[] = {
+static const struct clk_parent_data c3_ge2d_parents[] = {
 	{ .fw_name = "oscin" },
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
@@ -1780,10 +1779,10 @@ static const struct clk_parent_data ge2d_parent_data[] = {
 	{ .fw_name = "hifi" },
 	{ .fw_name = "fdiv5" },
 	{ .fw_name = "gp0" },
-	{ .hw = &rtc_clk.hw }
+	{ .hw = &c3_rtc_clk.hw }
 };
 
-static struct clk_regmap ge2d_sel = {
+static struct clk_regmap c3_ge2d_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = GE2D_CLK_CTRL,
 		.mask = 0x7,
@@ -1792,12 +1791,12 @@ static struct clk_regmap ge2d_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "ge2d_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = ge2d_parent_data,
-		.num_parents = ARRAY_SIZE(ge2d_parent_data),
+		.parent_data = c3_ge2d_parents,
+		.num_parents = ARRAY_SIZE(c3_ge2d_parents),
 	},
 };
 
-static struct clk_regmap ge2d_div = {
+static struct clk_regmap c3_ge2d_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = GE2D_CLK_CTRL,
 		.shift = 0,
@@ -1807,14 +1806,14 @@ static struct clk_regmap ge2d_div = {
 		.name = "ge2d_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ge2d_sel.hw
+			&c3_ge2d_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap ge2d = {
+static struct clk_regmap c3_ge2d = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = GE2D_CLK_CTRL,
 		.bit_idx = 8,
@@ -1823,14 +1822,14 @@ static struct clk_regmap ge2d = {
 		.name = "ge2d",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&ge2d_div.hw
+			&c3_ge2d_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static const struct clk_parent_data vapb_parent_data[] = {
+static const struct clk_parent_data c3_vapb_parents[] = {
 	{ .fw_name = "fdiv2p5" },
 	{ .fw_name = "fdiv3" },
 	{ .fw_name = "fdiv4" },
@@ -1841,7 +1840,7 @@ static const struct clk_parent_data vapb_parent_data[] = {
 	{ .fw_name = "oscin" },
 };
 
-static struct clk_regmap vapb_sel = {
+static struct clk_regmap c3_vapb_sel = {
 	.data = &(struct clk_regmap_mux_data) {
 		.offset = VAPB_CLK_CTRL,
 		.mask = 0x7,
@@ -1850,12 +1849,12 @@ static struct clk_regmap vapb_sel = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "vapb_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_data = vapb_parent_data,
-		.num_parents = ARRAY_SIZE(vapb_parent_data),
+		.parent_data = c3_vapb_parents,
+		.num_parents = ARRAY_SIZE(c3_vapb_parents),
 	},
 };
 
-static struct clk_regmap vapb_div = {
+static struct clk_regmap c3_vapb_div = {
 	.data = &(struct clk_regmap_div_data) {
 		.offset = VAPB_CLK_CTRL,
 		.shift = 0,
@@ -1865,14 +1864,14 @@ static struct clk_regmap vapb_div = {
 		.name = "vapb_div",
 		.ops = &clk_regmap_divider_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vapb_sel.hw
+			&c3_vapb_sel.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_regmap vapb = {
+static struct clk_regmap c3_vapb = {
 	.data = &(struct clk_regmap_gate_data) {
 		.offset = VAPB_CLK_CTRL,
 		.bit_idx = 8,
@@ -1881,230 +1880,230 @@ static struct clk_regmap vapb = {
 		.name = "vapb",
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) {
-			&vapb_div.hw
+			&c3_vapb_div.hw
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-static struct clk_hw *c3_periphs_hw_clks[] = {
-	[CLKID_RTC_XTAL_CLKIN]		= &rtc_xtal_clkin.hw,
-	[CLKID_RTC_32K_DIV]		= &rtc_32k_div.hw,
-	[CLKID_RTC_32K_MUX]		= &rtc_32k_mux.hw,
-	[CLKID_RTC_32K]			= &rtc_32k.hw,
-	[CLKID_RTC_CLK]			= &rtc_clk.hw,
-	[CLKID_SYS_RESET_CTRL]		= &sys_reset_ctrl.hw,
-	[CLKID_SYS_PWR_CTRL]		= &sys_pwr_ctrl.hw,
-	[CLKID_SYS_PAD_CTRL]		= &sys_pad_ctrl.hw,
-	[CLKID_SYS_CTRL]		= &sys_ctrl.hw,
-	[CLKID_SYS_TS_PLL]		= &sys_ts_pll.hw,
-	[CLKID_SYS_DEV_ARB]		= &sys_dev_arb.hw,
-	[CLKID_SYS_MMC_PCLK]		= &sys_mmc_pclk.hw,
-	[CLKID_SYS_CPU_CTRL]		= &sys_cpu_ctrl.hw,
-	[CLKID_SYS_JTAG_CTRL]		= &sys_jtag_ctrl.hw,
-	[CLKID_SYS_IR_CTRL]		= &sys_ir_ctrl.hw,
-	[CLKID_SYS_IRQ_CTRL]		= &sys_irq_ctrl.hw,
-	[CLKID_SYS_MSR_CLK]		= &sys_msr_clk.hw,
-	[CLKID_SYS_ROM]			= &sys_rom.hw,
-	[CLKID_SYS_UART_F]		= &sys_uart_f.hw,
-	[CLKID_SYS_CPU_ARB]		= &sys_cpu_apb.hw,
-	[CLKID_SYS_RSA]			= &sys_rsa.hw,
-	[CLKID_SYS_SAR_ADC]		= &sys_sar_adc.hw,
-	[CLKID_SYS_STARTUP]		= &sys_startup.hw,
-	[CLKID_SYS_SECURE]		= &sys_secure.hw,
-	[CLKID_SYS_SPIFC]		= &sys_spifc.hw,
-	[CLKID_SYS_NNA]			= &sys_nna.hw,
-	[CLKID_SYS_ETH_MAC]		= &sys_eth_mac.hw,
-	[CLKID_SYS_GIC]			= &sys_gic.hw,
-	[CLKID_SYS_RAMA]		= &sys_rama.hw,
-	[CLKID_SYS_BIG_NIC]		= &sys_big_nic.hw,
-	[CLKID_SYS_RAMB]		= &sys_ramb.hw,
-	[CLKID_SYS_AUDIO_PCLK]		= &sys_audio_pclk.hw,
-	[CLKID_SYS_PWM_KL]		= &sys_pwm_kl.hw,
-	[CLKID_SYS_PWM_IJ]		= &sys_pwm_ij.hw,
-	[CLKID_SYS_USB]			= &sys_usb.hw,
-	[CLKID_SYS_SD_EMMC_A]		= &sys_sd_emmc_a.hw,
-	[CLKID_SYS_SD_EMMC_C]		= &sys_sd_emmc_c.hw,
-	[CLKID_SYS_PWM_AB]		= &sys_pwm_ab.hw,
-	[CLKID_SYS_PWM_CD]		= &sys_pwm_cd.hw,
-	[CLKID_SYS_PWM_EF]		= &sys_pwm_ef.hw,
-	[CLKID_SYS_PWM_GH]		= &sys_pwm_gh.hw,
-	[CLKID_SYS_SPICC_1]		= &sys_spicc_1.hw,
-	[CLKID_SYS_SPICC_0]		= &sys_spicc_0.hw,
-	[CLKID_SYS_UART_A]		= &sys_uart_a.hw,
-	[CLKID_SYS_UART_B]		= &sys_uart_b.hw,
-	[CLKID_SYS_UART_C]		= &sys_uart_c.hw,
-	[CLKID_SYS_UART_D]		= &sys_uart_d.hw,
-	[CLKID_SYS_UART_E]		= &sys_uart_e.hw,
-	[CLKID_SYS_I2C_M_A]		= &sys_i2c_m_a.hw,
-	[CLKID_SYS_I2C_M_B]		= &sys_i2c_m_b.hw,
-	[CLKID_SYS_I2C_M_C]		= &sys_i2c_m_c.hw,
-	[CLKID_SYS_I2C_M_D]		= &sys_i2c_m_d.hw,
-	[CLKID_SYS_I2S_S_A]		= &sys_i2c_s_a.hw,
-	[CLKID_SYS_RTC]			= &sys_rtc.hw,
-	[CLKID_SYS_GE2D]		= &sys_ge2d.hw,
-	[CLKID_SYS_ISP]			= &sys_isp.hw,
-	[CLKID_SYS_GPV_ISP_NIC]		= &sys_gpv_isp_nic.hw,
-	[CLKID_SYS_GPV_CVE_NIC]		= &sys_gpv_cve_nic.hw,
-	[CLKID_SYS_MIPI_DSI_HOST]	= &sys_mipi_dsi_host.hw,
-	[CLKID_SYS_MIPI_DSI_PHY]	= &sys_mipi_dsi_phy.hw,
-	[CLKID_SYS_ETH_PHY]		= &sys_eth_phy.hw,
-	[CLKID_SYS_ACODEC]		= &sys_acodec.hw,
-	[CLKID_SYS_DWAP]		= &sys_dwap.hw,
-	[CLKID_SYS_DOS]			= &sys_dos.hw,
-	[CLKID_SYS_CVE]			= &sys_cve.hw,
-	[CLKID_SYS_VOUT]		= &sys_vout.hw,
-	[CLKID_SYS_VC9000E]		= &sys_vc9000e.hw,
-	[CLKID_SYS_PWM_MN]		= &sys_pwm_mn.hw,
-	[CLKID_SYS_SD_EMMC_B]		= &sys_sd_emmc_b.hw,
-	[CLKID_AXI_SYS_NIC]		= &axi_sys_nic.hw,
-	[CLKID_AXI_ISP_NIC]		= &axi_isp_nic.hw,
-	[CLKID_AXI_CVE_NIC]		= &axi_cve_nic.hw,
-	[CLKID_AXI_RAMB]		= &axi_ramb.hw,
-	[CLKID_AXI_RAMA]		= &axi_rama.hw,
-	[CLKID_AXI_CPU_DMC]		= &axi_cpu_dmc.hw,
-	[CLKID_AXI_NIC]			= &axi_nic.hw,
-	[CLKID_AXI_DMA]			= &axi_dma.hw,
-	[CLKID_AXI_MUX_NIC]		= &axi_mux_nic.hw,
-	[CLKID_AXI_CVE]			= &axi_cve.hw,
-	[CLKID_AXI_DEV1_DMC]		= &axi_dev1_dmc.hw,
-	[CLKID_AXI_DEV0_DMC]		= &axi_dev0_dmc.hw,
-	[CLKID_AXI_DSP_DMC]		= &axi_dsp_dmc.hw,
-	[CLKID_12_24M_IN]		= &clk_12_24m_in.hw,
-	[CLKID_12M_24M]			= &clk_12_24m.hw,
-	[CLKID_FCLK_25M_DIV]		= &fclk_25m_div.hw,
-	[CLKID_FCLK_25M]		= &fclk_25m.hw,
-	[CLKID_GEN_SEL]			= &gen_sel.hw,
-	[CLKID_GEN_DIV]			= &gen_div.hw,
-	[CLKID_GEN]			= &gen.hw,
-	[CLKID_SARADC_SEL]		= &saradc_sel.hw,
-	[CLKID_SARADC_DIV]		= &saradc_div.hw,
-	[CLKID_SARADC]			= &saradc.hw,
-	[CLKID_PWM_A_SEL]		= &pwm_a_sel.hw,
-	[CLKID_PWM_A_DIV]		= &pwm_a_div.hw,
-	[CLKID_PWM_A]			= &pwm_a.hw,
-	[CLKID_PWM_B_SEL]		= &pwm_b_sel.hw,
-	[CLKID_PWM_B_DIV]		= &pwm_b_div.hw,
-	[CLKID_PWM_B]			= &pwm_b.hw,
-	[CLKID_PWM_C_SEL]		= &pwm_c_sel.hw,
-	[CLKID_PWM_C_DIV]		= &pwm_c_div.hw,
-	[CLKID_PWM_C]			= &pwm_c.hw,
-	[CLKID_PWM_D_SEL]		= &pwm_d_sel.hw,
-	[CLKID_PWM_D_DIV]		= &pwm_d_div.hw,
-	[CLKID_PWM_D]			= &pwm_d.hw,
-	[CLKID_PWM_E_SEL]		= &pwm_e_sel.hw,
-	[CLKID_PWM_E_DIV]		= &pwm_e_div.hw,
-	[CLKID_PWM_E]			= &pwm_e.hw,
-	[CLKID_PWM_F_SEL]		= &pwm_f_sel.hw,
-	[CLKID_PWM_F_DIV]		= &pwm_f_div.hw,
-	[CLKID_PWM_F]			= &pwm_f.hw,
-	[CLKID_PWM_G_SEL]		= &pwm_g_sel.hw,
-	[CLKID_PWM_G_DIV]		= &pwm_g_div.hw,
-	[CLKID_PWM_G]			= &pwm_g.hw,
-	[CLKID_PWM_H_SEL]		= &pwm_h_sel.hw,
-	[CLKID_PWM_H_DIV]		= &pwm_h_div.hw,
-	[CLKID_PWM_H]			= &pwm_h.hw,
-	[CLKID_PWM_I_SEL]		= &pwm_i_sel.hw,
-	[CLKID_PWM_I_DIV]		= &pwm_i_div.hw,
-	[CLKID_PWM_I]			= &pwm_i.hw,
-	[CLKID_PWM_J_SEL]		= &pwm_j_sel.hw,
-	[CLKID_PWM_J_DIV]		= &pwm_j_div.hw,
-	[CLKID_PWM_J]			= &pwm_j.hw,
-	[CLKID_PWM_K_SEL]		= &pwm_k_sel.hw,
-	[CLKID_PWM_K_DIV]		= &pwm_k_div.hw,
-	[CLKID_PWM_K]			= &pwm_k.hw,
-	[CLKID_PWM_L_SEL]		= &pwm_l_sel.hw,
-	[CLKID_PWM_L_DIV]		= &pwm_l_div.hw,
-	[CLKID_PWM_L]			= &pwm_l.hw,
-	[CLKID_PWM_M_SEL]		= &pwm_m_sel.hw,
-	[CLKID_PWM_M_DIV]		= &pwm_m_div.hw,
-	[CLKID_PWM_M]			= &pwm_m.hw,
-	[CLKID_PWM_N_SEL]		= &pwm_n_sel.hw,
-	[CLKID_PWM_N_DIV]		= &pwm_n_div.hw,
-	[CLKID_PWM_N]			= &pwm_n.hw,
-	[CLKID_SPICC_A_SEL]		= &spicc_a_sel.hw,
-	[CLKID_SPICC_A_DIV]		= &spicc_a_div.hw,
-	[CLKID_SPICC_A]			= &spicc_a.hw,
-	[CLKID_SPICC_B_SEL]		= &spicc_b_sel.hw,
-	[CLKID_SPICC_B_DIV]		= &spicc_b_div.hw,
-	[CLKID_SPICC_B]			= &spicc_b.hw,
-	[CLKID_SPIFC_SEL]		= &spifc_sel.hw,
-	[CLKID_SPIFC_DIV]		= &spifc_div.hw,
-	[CLKID_SPIFC]			= &spifc.hw,
-	[CLKID_SD_EMMC_A_SEL]		= &sd_emmc_a_sel.hw,
-	[CLKID_SD_EMMC_A_DIV]		= &sd_emmc_a_div.hw,
-	[CLKID_SD_EMMC_A]		= &sd_emmc_a.hw,
-	[CLKID_SD_EMMC_B_SEL]		= &sd_emmc_b_sel.hw,
-	[CLKID_SD_EMMC_B_DIV]		= &sd_emmc_b_div.hw,
-	[CLKID_SD_EMMC_B]		= &sd_emmc_b.hw,
-	[CLKID_SD_EMMC_C_SEL]		= &sd_emmc_c_sel.hw,
-	[CLKID_SD_EMMC_C_DIV]		= &sd_emmc_c_div.hw,
-	[CLKID_SD_EMMC_C]		= &sd_emmc_c.hw,
-	[CLKID_TS_DIV]			= &ts_div.hw,
-	[CLKID_TS]			= &ts.hw,
-	[CLKID_ETH_125M_DIV]		= &eth_125m_div.hw,
-	[CLKID_ETH_125M]		= &eth_125m.hw,
-	[CLKID_ETH_RMII_DIV]		= &eth_rmii_div.hw,
-	[CLKID_ETH_RMII]		= &eth_rmii.hw,
-	[CLKID_MIPI_DSI_MEAS_SEL]	= &mipi_dsi_meas_sel.hw,
-	[CLKID_MIPI_DSI_MEAS_DIV]	= &mipi_dsi_meas_div.hw,
-	[CLKID_MIPI_DSI_MEAS]		= &mipi_dsi_meas.hw,
-	[CLKID_DSI_PHY_SEL]		= &dsi_phy_sel.hw,
-	[CLKID_DSI_PHY_DIV]		= &dsi_phy_div.hw,
-	[CLKID_DSI_PHY]			= &dsi_phy.hw,
-	[CLKID_VOUT_MCLK_SEL]		= &vout_mclk_sel.hw,
-	[CLKID_VOUT_MCLK_DIV]		= &vout_mclk_div.hw,
-	[CLKID_VOUT_MCLK]		= &vout_mclk.hw,
-	[CLKID_VOUT_ENC_SEL]		= &vout_enc_sel.hw,
-	[CLKID_VOUT_ENC_DIV]		= &vout_enc_div.hw,
-	[CLKID_VOUT_ENC]		= &vout_enc.hw,
-	[CLKID_HCODEC_0_SEL]		= &hcodec_0_sel.hw,
-	[CLKID_HCODEC_0_DIV]		= &hcodec_0_div.hw,
-	[CLKID_HCODEC_0]		= &hcodec_0.hw,
-	[CLKID_HCODEC_1_SEL]		= &hcodec_1_sel.hw,
-	[CLKID_HCODEC_1_DIV]		= &hcodec_1_div.hw,
-	[CLKID_HCODEC_1]		= &hcodec_1.hw,
-	[CLKID_HCODEC]			= &hcodec.hw,
-	[CLKID_VC9000E_ACLK_SEL]	= &vc9000e_aclk_sel.hw,
-	[CLKID_VC9000E_ACLK_DIV]	= &vc9000e_aclk_div.hw,
-	[CLKID_VC9000E_ACLK]		= &vc9000e_aclk.hw,
-	[CLKID_VC9000E_CORE_SEL]	= &vc9000e_core_sel.hw,
-	[CLKID_VC9000E_CORE_DIV]	= &vc9000e_core_div.hw,
-	[CLKID_VC9000E_CORE]		= &vc9000e_core.hw,
-	[CLKID_CSI_PHY0_SEL]		= &csi_phy0_sel.hw,
-	[CLKID_CSI_PHY0_DIV]		= &csi_phy0_div.hw,
-	[CLKID_CSI_PHY0]		= &csi_phy0.hw,
-	[CLKID_DEWARPA_SEL]		= &dewarpa_sel.hw,
-	[CLKID_DEWARPA_DIV]		= &dewarpa_div.hw,
-	[CLKID_DEWARPA]			= &dewarpa.hw,
-	[CLKID_ISP0_SEL]		= &isp0_sel.hw,
-	[CLKID_ISP0_DIV]		= &isp0_div.hw,
-	[CLKID_ISP0]			= &isp0.hw,
-	[CLKID_NNA_CORE_SEL]		= &nna_core_sel.hw,
-	[CLKID_NNA_CORE_DIV]		= &nna_core_div.hw,
-	[CLKID_NNA_CORE]		= &nna_core.hw,
-	[CLKID_GE2D_SEL]		= &ge2d_sel.hw,
-	[CLKID_GE2D_DIV]		= &ge2d_div.hw,
-	[CLKID_GE2D]			= &ge2d.hw,
-	[CLKID_VAPB_SEL]		= &vapb_sel.hw,
-	[CLKID_VAPB_DIV]		= &vapb_div.hw,
-	[CLKID_VAPB]			= &vapb.hw,
-};
-
-static const struct regmap_config clkc_regmap_config = {
+static struct clk_hw *c3_peripherals_hw_clks[] = {
+	[CLKID_RTC_XTAL_CLKIN]		= &c3_rtc_xtal_clkin.hw,
+	[CLKID_RTC_32K_DIV]		= &c3_rtc_32k_div.hw,
+	[CLKID_RTC_32K_MUX]		= &c3_rtc_32k_sel.hw,
+	[CLKID_RTC_32K]			= &c3_rtc_32k.hw,
+	[CLKID_RTC_CLK]			= &c3_rtc_clk.hw,
+	[CLKID_SYS_RESET_CTRL]		= &c3_sys_reset_ctrl.hw,
+	[CLKID_SYS_PWR_CTRL]		= &c3_sys_pwr_ctrl.hw,
+	[CLKID_SYS_PAD_CTRL]		= &c3_sys_pad_ctrl.hw,
+	[CLKID_SYS_CTRL]		= &c3_sys_ctrl.hw,
+	[CLKID_SYS_TS_PLL]		= &c3_sys_ts_pll.hw,
+	[CLKID_SYS_DEV_ARB]		= &c3_sys_dev_arb.hw,
+	[CLKID_SYS_MMC_PCLK]		= &c3_sys_mmc_pclk.hw,
+	[CLKID_SYS_CPU_CTRL]		= &c3_sys_cpu_ctrl.hw,
+	[CLKID_SYS_JTAG_CTRL]		= &c3_sys_jtag_ctrl.hw,
+	[CLKID_SYS_IR_CTRL]		= &c3_sys_ir_ctrl.hw,
+	[CLKID_SYS_IRQ_CTRL]		= &c3_sys_irq_ctrl.hw,
+	[CLKID_SYS_MSR_CLK]		= &c3_sys_msr_clk.hw,
+	[CLKID_SYS_ROM]			= &c3_sys_rom.hw,
+	[CLKID_SYS_UART_F]		= &c3_sys_uart_f.hw,
+	[CLKID_SYS_CPU_ARB]		= &c3_sys_cpu_apb.hw,
+	[CLKID_SYS_RSA]			= &c3_sys_rsa.hw,
+	[CLKID_SYS_SAR_ADC]		= &c3_sys_sar_adc.hw,
+	[CLKID_SYS_STARTUP]		= &c3_sys_startup.hw,
+	[CLKID_SYS_SECURE]		= &c3_sys_secure.hw,
+	[CLKID_SYS_SPIFC]		= &c3_sys_spifc.hw,
+	[CLKID_SYS_NNA]			= &c3_sys_nna.hw,
+	[CLKID_SYS_ETH_MAC]		= &c3_sys_eth_mac.hw,
+	[CLKID_SYS_GIC]			= &c3_sys_gic.hw,
+	[CLKID_SYS_RAMA]		= &c3_sys_rama.hw,
+	[CLKID_SYS_BIG_NIC]		= &c3_sys_big_nic.hw,
+	[CLKID_SYS_RAMB]		= &c3_sys_ramb.hw,
+	[CLKID_SYS_AUDIO_PCLK]		= &c3_sys_audio_pclk.hw,
+	[CLKID_SYS_PWM_KL]		= &c3_sys_pwm_kl.hw,
+	[CLKID_SYS_PWM_IJ]		= &c3_sys_pwm_ij.hw,
+	[CLKID_SYS_USB]			= &c3_sys_usb.hw,
+	[CLKID_SYS_SD_EMMC_A]		= &c3_sys_sd_emmc_a.hw,
+	[CLKID_SYS_SD_EMMC_C]		= &c3_sys_sd_emmc_c.hw,
+	[CLKID_SYS_PWM_AB]		= &c3_sys_pwm_ab.hw,
+	[CLKID_SYS_PWM_CD]		= &c3_sys_pwm_cd.hw,
+	[CLKID_SYS_PWM_EF]		= &c3_sys_pwm_ef.hw,
+	[CLKID_SYS_PWM_GH]		= &c3_sys_pwm_gh.hw,
+	[CLKID_SYS_SPICC_1]		= &c3_sys_spicc_1.hw,
+	[CLKID_SYS_SPICC_0]		= &c3_sys_spicc_0.hw,
+	[CLKID_SYS_UART_A]		= &c3_sys_uart_a.hw,
+	[CLKID_SYS_UART_B]		= &c3_sys_uart_b.hw,
+	[CLKID_SYS_UART_C]		= &c3_sys_uart_c.hw,
+	[CLKID_SYS_UART_D]		= &c3_sys_uart_d.hw,
+	[CLKID_SYS_UART_E]		= &c3_sys_uart_e.hw,
+	[CLKID_SYS_I2C_M_A]		= &c3_sys_i2c_m_a.hw,
+	[CLKID_SYS_I2C_M_B]		= &c3_sys_i2c_m_b.hw,
+	[CLKID_SYS_I2C_M_C]		= &c3_sys_i2c_m_c.hw,
+	[CLKID_SYS_I2C_M_D]		= &c3_sys_i2c_m_d.hw,
+	[CLKID_SYS_I2S_S_A]		= &c3_sys_i2c_s_a.hw,
+	[CLKID_SYS_RTC]			= &c3_sys_rtc.hw,
+	[CLKID_SYS_GE2D]		= &c3_sys_ge2d.hw,
+	[CLKID_SYS_ISP]			= &c3_sys_isp.hw,
+	[CLKID_SYS_GPV_ISP_NIC]		= &c3_sys_gpv_isp_nic.hw,
+	[CLKID_SYS_GPV_CVE_NIC]		= &c3_sys_gpv_cve_nic.hw,
+	[CLKID_SYS_MIPI_DSI_HOST]	= &c3_sys_mipi_dsi_host.hw,
+	[CLKID_SYS_MIPI_DSI_PHY]	= &c3_sys_mipi_dsi_phy.hw,
+	[CLKID_SYS_ETH_PHY]		= &c3_sys_eth_phy.hw,
+	[CLKID_SYS_ACODEC]		= &c3_sys_acodec.hw,
+	[CLKID_SYS_DWAP]		= &c3_sys_dwap.hw,
+	[CLKID_SYS_DOS]			= &c3_sys_dos.hw,
+	[CLKID_SYS_CVE]			= &c3_sys_cve.hw,
+	[CLKID_SYS_VOUT]		= &c3_sys_vout.hw,
+	[CLKID_SYS_VC9000E]		= &c3_sys_vc9000e.hw,
+	[CLKID_SYS_PWM_MN]		= &c3_sys_pwm_mn.hw,
+	[CLKID_SYS_SD_EMMC_B]		= &c3_sys_sd_emmc_b.hw,
+	[CLKID_AXI_SYS_NIC]		= &c3_axi_sys_nic.hw,
+	[CLKID_AXI_ISP_NIC]		= &c3_axi_isp_nic.hw,
+	[CLKID_AXI_CVE_NIC]		= &c3_axi_cve_nic.hw,
+	[CLKID_AXI_RAMB]		= &c3_axi_ramb.hw,
+	[CLKID_AXI_RAMA]		= &c3_axi_rama.hw,
+	[CLKID_AXI_CPU_DMC]		= &c3_axi_cpu_dmc.hw,
+	[CLKID_AXI_NIC]			= &c3_axi_nic.hw,
+	[CLKID_AXI_DMA]			= &c3_axi_dma.hw,
+	[CLKID_AXI_MUX_NIC]		= &c3_axi_mux_nic.hw,
+	[CLKID_AXI_CVE]			= &c3_axi_cve.hw,
+	[CLKID_AXI_DEV1_DMC]		= &c3_axi_dev1_dmc.hw,
+	[CLKID_AXI_DEV0_DMC]		= &c3_axi_dev0_dmc.hw,
+	[CLKID_AXI_DSP_DMC]		= &c3_axi_dsp_dmc.hw,
+	[CLKID_12_24M_IN]		= &c3_clk_12_24m_in.hw,
+	[CLKID_12M_24M]			= &c3_clk_12_24m.hw,
+	[CLKID_FCLK_25M_DIV]		= &c3_fclk_25m_div.hw,
+	[CLKID_FCLK_25M]		= &c3_fclk_25m.hw,
+	[CLKID_GEN_SEL]			= &c3_gen_sel.hw,
+	[CLKID_GEN_DIV]			= &c3_gen_div.hw,
+	[CLKID_GEN]			= &c3_gen.hw,
+	[CLKID_SARADC_SEL]		= &c3_saradc_sel.hw,
+	[CLKID_SARADC_DIV]		= &c3_saradc_div.hw,
+	[CLKID_SARADC]			= &c3_saradc.hw,
+	[CLKID_PWM_A_SEL]		= &c3_pwm_a_sel.hw,
+	[CLKID_PWM_A_DIV]		= &c3_pwm_a_div.hw,
+	[CLKID_PWM_A]			= &c3_pwm_a.hw,
+	[CLKID_PWM_B_SEL]		= &c3_pwm_b_sel.hw,
+	[CLKID_PWM_B_DIV]		= &c3_pwm_b_div.hw,
+	[CLKID_PWM_B]			= &c3_pwm_b.hw,
+	[CLKID_PWM_C_SEL]		= &c3_pwm_c_sel.hw,
+	[CLKID_PWM_C_DIV]		= &c3_pwm_c_div.hw,
+	[CLKID_PWM_C]			= &c3_pwm_c.hw,
+	[CLKID_PWM_D_SEL]		= &c3_pwm_d_sel.hw,
+	[CLKID_PWM_D_DIV]		= &c3_pwm_d_div.hw,
+	[CLKID_PWM_D]			= &c3_pwm_d.hw,
+	[CLKID_PWM_E_SEL]		= &c3_pwm_e_sel.hw,
+	[CLKID_PWM_E_DIV]		= &c3_pwm_e_div.hw,
+	[CLKID_PWM_E]			= &c3_pwm_e.hw,
+	[CLKID_PWM_F_SEL]		= &c3_pwm_f_sel.hw,
+	[CLKID_PWM_F_DIV]		= &c3_pwm_f_div.hw,
+	[CLKID_PWM_F]			= &c3_pwm_f.hw,
+	[CLKID_PWM_G_SEL]		= &c3_pwm_g_sel.hw,
+	[CLKID_PWM_G_DIV]		= &c3_pwm_g_div.hw,
+	[CLKID_PWM_G]			= &c3_pwm_g.hw,
+	[CLKID_PWM_H_SEL]		= &c3_pwm_h_sel.hw,
+	[CLKID_PWM_H_DIV]		= &c3_pwm_h_div.hw,
+	[CLKID_PWM_H]			= &c3_pwm_h.hw,
+	[CLKID_PWM_I_SEL]		= &c3_pwm_i_sel.hw,
+	[CLKID_PWM_I_DIV]		= &c3_pwm_i_div.hw,
+	[CLKID_PWM_I]			= &c3_pwm_i.hw,
+	[CLKID_PWM_J_SEL]		= &c3_pwm_j_sel.hw,
+	[CLKID_PWM_J_DIV]		= &c3_pwm_j_div.hw,
+	[CLKID_PWM_J]			= &c3_pwm_j.hw,
+	[CLKID_PWM_K_SEL]		= &c3_pwm_k_sel.hw,
+	[CLKID_PWM_K_DIV]		= &c3_pwm_k_div.hw,
+	[CLKID_PWM_K]			= &c3_pwm_k.hw,
+	[CLKID_PWM_L_SEL]		= &c3_pwm_l_sel.hw,
+	[CLKID_PWM_L_DIV]		= &c3_pwm_l_div.hw,
+	[CLKID_PWM_L]			= &c3_pwm_l.hw,
+	[CLKID_PWM_M_SEL]		= &c3_pwm_m_sel.hw,
+	[CLKID_PWM_M_DIV]		= &c3_pwm_m_div.hw,
+	[CLKID_PWM_M]			= &c3_pwm_m.hw,
+	[CLKID_PWM_N_SEL]		= &c3_pwm_n_sel.hw,
+	[CLKID_PWM_N_DIV]		= &c3_pwm_n_div.hw,
+	[CLKID_PWM_N]			= &c3_pwm_n.hw,
+	[CLKID_SPICC_A_SEL]		= &c3_spicc_a_sel.hw,
+	[CLKID_SPICC_A_DIV]		= &c3_spicc_a_div.hw,
+	[CLKID_SPICC_A]			= &c3_spicc_a.hw,
+	[CLKID_SPICC_B_SEL]		= &c3_spicc_b_sel.hw,
+	[CLKID_SPICC_B_DIV]		= &c3_spicc_b_div.hw,
+	[CLKID_SPICC_B]			= &c3_spicc_b.hw,
+	[CLKID_SPIFC_SEL]		= &c3_spifc_sel.hw,
+	[CLKID_SPIFC_DIV]		= &c3_spifc_div.hw,
+	[CLKID_SPIFC]			= &c3_spifc.hw,
+	[CLKID_SD_EMMC_A_SEL]		= &c3_sd_emmc_a_sel.hw,
+	[CLKID_SD_EMMC_A_DIV]		= &c3_sd_emmc_a_div.hw,
+	[CLKID_SD_EMMC_A]		= &c3_sd_emmc_a.hw,
+	[CLKID_SD_EMMC_B_SEL]		= &c3_sd_emmc_b_sel.hw,
+	[CLKID_SD_EMMC_B_DIV]		= &c3_sd_emmc_b_div.hw,
+	[CLKID_SD_EMMC_B]		= &c3_sd_emmc_b.hw,
+	[CLKID_SD_EMMC_C_SEL]		= &c3_sd_emmc_c_sel.hw,
+	[CLKID_SD_EMMC_C_DIV]		= &c3_sd_emmc_c_div.hw,
+	[CLKID_SD_EMMC_C]		= &c3_sd_emmc_c.hw,
+	[CLKID_TS_DIV]			= &c3_ts_div.hw,
+	[CLKID_TS]			= &c3_ts.hw,
+	[CLKID_ETH_125M_DIV]		= &c3_eth_125m_div.hw,
+	[CLKID_ETH_125M]		= &c3_eth_125m.hw,
+	[CLKID_ETH_RMII_DIV]		= &c3_eth_rmii_div.hw,
+	[CLKID_ETH_RMII]		= &c3_eth_rmii.hw,
+	[CLKID_MIPI_DSI_MEAS_SEL]	= &c3_mipi_dsi_meas_sel.hw,
+	[CLKID_MIPI_DSI_MEAS_DIV]	= &c3_mipi_dsi_meas_div.hw,
+	[CLKID_MIPI_DSI_MEAS]		= &c3_mipi_dsi_meas.hw,
+	[CLKID_DSI_PHY_SEL]		= &c3_dsi_phy_sel.hw,
+	[CLKID_DSI_PHY_DIV]		= &c3_dsi_phy_div.hw,
+	[CLKID_DSI_PHY]			= &c3_dsi_phy.hw,
+	[CLKID_VOUT_MCLK_SEL]		= &c3_vout_mclk_sel.hw,
+	[CLKID_VOUT_MCLK_DIV]		= &c3_vout_mclk_div.hw,
+	[CLKID_VOUT_MCLK]		= &c3_vout_mclk.hw,
+	[CLKID_VOUT_ENC_SEL]		= &c3_vout_enc_sel.hw,
+	[CLKID_VOUT_ENC_DIV]		= &c3_vout_enc_div.hw,
+	[CLKID_VOUT_ENC]		= &c3_vout_enc.hw,
+	[CLKID_HCODEC_0_SEL]		= &c3_hcodec_0_sel.hw,
+	[CLKID_HCODEC_0_DIV]		= &c3_hcodec_0_div.hw,
+	[CLKID_HCODEC_0]		= &c3_hcodec_0.hw,
+	[CLKID_HCODEC_1_SEL]		= &c3_hcodec_1_sel.hw,
+	[CLKID_HCODEC_1_DIV]		= &c3_hcodec_1_div.hw,
+	[CLKID_HCODEC_1]		= &c3_hcodec_1.hw,
+	[CLKID_HCODEC]			= &c3_hcodec.hw,
+	[CLKID_VC9000E_ACLK_SEL]	= &c3_vc9000e_aclk_sel.hw,
+	[CLKID_VC9000E_ACLK_DIV]	= &c3_vc9000e_aclk_div.hw,
+	[CLKID_VC9000E_ACLK]		= &c3_vc9000e_aclk.hw,
+	[CLKID_VC9000E_CORE_SEL]	= &c3_vc9000e_core_sel.hw,
+	[CLKID_VC9000E_CORE_DIV]	= &c3_vc9000e_core_div.hw,
+	[CLKID_VC9000E_CORE]		= &c3_vc9000e_core.hw,
+	[CLKID_CSI_PHY0_SEL]		= &c3_csi_phy0_sel.hw,
+	[CLKID_CSI_PHY0_DIV]		= &c3_csi_phy0_div.hw,
+	[CLKID_CSI_PHY0]		= &c3_csi_phy0.hw,
+	[CLKID_DEWARPA_SEL]		= &c3_dewarpa_sel.hw,
+	[CLKID_DEWARPA_DIV]		= &c3_dewarpa_div.hw,
+	[CLKID_DEWARPA]			= &c3_dewarpa.hw,
+	[CLKID_ISP0_SEL]		= &c3_isp0_sel.hw,
+	[CLKID_ISP0_DIV]		= &c3_isp0_div.hw,
+	[CLKID_ISP0]			= &c3_isp0.hw,
+	[CLKID_NNA_CORE_SEL]		= &c3_nna_core_sel.hw,
+	[CLKID_NNA_CORE_DIV]		= &c3_nna_core_div.hw,
+	[CLKID_NNA_CORE]		= &c3_nna_core.hw,
+	[CLKID_GE2D_SEL]		= &c3_ge2d_sel.hw,
+	[CLKID_GE2D_DIV]		= &c3_ge2d_div.hw,
+	[CLKID_GE2D]			= &c3_ge2d.hw,
+	[CLKID_VAPB_SEL]		= &c3_vapb_sel.hw,
+	[CLKID_VAPB_DIV]		= &c3_vapb_div.hw,
+	[CLKID_VAPB]			= &c3_vapb.hw,
+};
+
+static const struct regmap_config c3_peripherals_regmap_cfg = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,
 	.max_register   = NNA_CLK_CTRL,
 };
 
-static struct meson_clk_hw_data c3_periphs_clks = {
-	.hws = c3_periphs_hw_clks,
-	.num = ARRAY_SIZE(c3_periphs_hw_clks),
+static struct meson_clk_hw_data c3_peripherals_clks = {
+	.hws = c3_peripherals_hw_clks,
+	.num = ARRAY_SIZE(c3_peripherals_hw_clks),
 };
 
-static int c3_peripherals_probe(struct platform_device *pdev)
+static int c3_peripherals_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -2115,16 +2114,16 @@ static int c3_peripherals_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, &c3_peripherals_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	for (clkid = 0; clkid < c3_periphs_clks.num; clkid++) {
+	for (clkid = 0; clkid < c3_peripherals_clks.num; clkid++) {
 		/* array might be sparse */
-		if (!c3_periphs_clks.hws[clkid])
+		if (!c3_peripherals_clks.hws[clkid])
 			continue;
 
-		ret = devm_clk_hw_register(dev, c3_periphs_clks.hws[clkid]);
+		ret = devm_clk_hw_register(dev, c3_peripherals_clks.hws[clkid]);
 		if (ret) {
 			dev_err(dev, "Clock registration failed\n");
 			return ret;
@@ -2132,7 +2131,7 @@ static int c3_peripherals_probe(struct platform_device *pdev)
 	}
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
-					   &c3_periphs_clks);
+					   &c3_peripherals_clks);
 }
 
 static const struct of_device_id c3_peripherals_clkc_match_table[] = {
@@ -2144,14 +2143,14 @@ static const struct of_device_id c3_peripherals_clkc_match_table[] = {
 
 MODULE_DEVICE_TABLE(of, c3_peripherals_clkc_match_table);
 
-static struct platform_driver c3_peripherals_driver = {
-	.probe		= c3_peripherals_probe,
+static struct platform_driver c3_peripherals_clkc_driver = {
+	.probe		= c3_peripherals_clkc_probe,
 	.driver		= {
 		.name	= "c3-peripherals-clkc",
 		.of_match_table = c3_peripherals_clkc_match_table,
 	},
 };
-module_platform_driver(c3_peripherals_driver);
+module_platform_driver(c3_peripherals_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic C3 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");

-- 
2.47.2

