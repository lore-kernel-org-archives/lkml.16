Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5E2FF496
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470067; cv=none; b=FBT/zGLAfJZyzEzUrwYukAdW6JanqCcs2HQX/e1b3OwSbhNlyY5GShvSrJOkPnoblUkhsn02Ra3ssbzl8MlFmvsao0roGNMlx35xOk+q0R+aDdUQQCJAjKXpJjFXWq+7kV3bVnoqWO/u2jLRS2UjrW/MXcFsuilxdN61oDUKjNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470067; c=relaxed/simple;
	bh=oMhB8maRb78sF4mjHx5qWYGLyHJU9ct+QO7dnYctS5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZONQaYiM4q2SwIcRHy/rYYQMixFKZYXcCV/xoGIF/+QOBwwg3onnyJgYviqqLXH/VC212ZCNm05wtEZLCZqG029ZSb8hcuyx0fUlyRsgzrhUC4BODYphbWtkxCK4JNqOtbExYUBL0U2NUWSyJa7jT/1k8V24kE5Sg54Jg2xberw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZTqSE4Rv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZTqSE4Rv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45348bff79fso46106155e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470060; x=1752074860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQFZoS5MMKXJSXUbK/J/7Z1uuGqQoo8nUd36l8w3/e0=;
        b=ZTqSE4Rvm+IbA3phX3NOYJnmeV54J9shlO/22JWXJM6eRxD3kan9So725lRlC12oAJ
         l3Q1EEhMxrsrC57YRBdDfR1Mx7vC+a5yq6r/OuytKQOGngJOVFBmeZEioj8QQPShRSZ1
         LJtjUlt42iYAVgYNymGj896/kQu0F7TrFvu15KHQ7CaMouN6e699auL/E5f9Kw6yEgYW
         o8J+7HiDIHPpaOTgzQDWclNiiICBztTNxCxF+ku2MWE0bUfim0YDhYhlofFsketqffuc
         Ha4FCClodTAtoQFQlRT9mhavZ6sJ+amHQ0ozxjBd0XWks3Y+ew/UFhkFFsOfHZ0bTlgw
         i0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470060; x=1752074860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQFZoS5MMKXJSXUbK/J/7Z1uuGqQoo8nUd36l8w3/e0=;
        b=kZBB1YwNF1uqXeXNo7gd9VcV/OMv0qQ7VyPMV9/STUxdO4GNsgaw9Yd8vzSDmFbdHv
         KRQzE1VuX2ygFDW/SXEQ69rzZoi10UR4rsrnkdn77AYBmhfRg0Ef32I6xxEVYueo+vyw
         1QBXg77btbIJ7Veq+XWAo+rc9jVlpdaC/YiOlltNmZF9sEXkJ+vieHkG89+UXvBelREL
         57H6tXogXKm0gqeg6GkLw16L5au5J1Abaizh7ivPV+LLwBnY7EFMoRjY4Cxad2xlO7jM
         rcR+Xkz1ymjSrh9LjBY1lA14uAqv8ZC8pR/5cMsKy4SK6qmMKGyX+T5BaetqY1WInwSV
         l5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWD66MIJWL6ZaqyhkW3bDP7/Vgs6wOHvuY+XTl+oqfDQ8z7K0YT6ntqCDeiMv/X6f0Qx/OQFFuoRYGLV64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG9qJSqIZHmArYeDmtHzU5+g+UAUg6ZqlXzt1SlL0LBoJf7IqJ
	yQdsoWbPiCJIDEMYyq3CycXahgt7v8ntFzV3T6R645nev+ayI1UeBKfqJxereoFSWxw=
X-Gm-Gg: ASbGncsBn6bvPvDbEFIOnhLgYHwkzD6Rap+7FALEFkpwWr4bCfDsfDz5anHfuR8eytL
	Vnx9ITZBxXt2k5qPr3xKNx89OzbCPICJLSIWxZzH8wDQPJTMidjYz0X/tfTGYJsDzDD1orkZWu2
	RKPfIfH7zkm9LEDVx9W/NLMckqzh1lXTkunEthRAkcZ4JlJSG5DAti6vCu0Yk9ca97VHZ0G1EnN
	o5QZdV74dP28xxGgGNxUMYWfuCYbhUVsKycD+mvaW/RK4gG01AqnFI5znBsyh8HVST4948mjQC8
	XLoBdZga7oVcbiOByDtvQlVt4ydf6013OMeQYfwsGAAhppsrn6cK33eBINp325oXx+InooTZJ1X
	E
X-Google-Smtp-Source: AGHT+IEefPyhcV5v94WdeD1M9Qv+ZewT9+JPrmKW6pS3aF7gjw/YBmQz6T/L2EaKN/A+oB9nrF2ZJQ==
X-Received: by 2002:a05:600c:628c:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-454a3705a43mr37460755e9.18.1751470059780;
        Wed, 02 Jul 2025 08:27:39 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:24 +0200
Subject: [PATCH 26/26] clk: amlogic: c3-peripherals: use helper for basic
 composite clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=32275; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=oMhB8maRb78sF4mjHx5qWYGLyHJU9ct+QO7dnYctS5I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/Ol4iC1k1Svj97bbA6Hw5c+JpGuM/l8bmKj
 PMrHvTBAVyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPzgAKCRDm/A8cN/La
 hQQbD/9cdMoMLpQgv8FLfM7vZ5lEcfui+m+1FpxVWIlQxFaOWJ4DWOB9IOYqUJ6GDCUsgCzLNy7
 SMF3Mo17J5F5k4QmPwaSMzsIRu0ww46hdZJ2YAy55JbZaWL/DAPNF7Oxhz22dbzkxZdIrhBy3Tr
 EoyL+s09lgVEw8/du3gxm0kwZTSz3QS8u+YwwttPhq3Clq+99fwDDW3Q+Olp8GqyAtO7s5HZyRO
 lzcivqTSR6uTpFn9F0hjl2wiA6oSRTZrOcyeAgrMFXybkrsYvAFYG38Y57yblKYQ1GW7unMiUza
 3d4AzQ8IP9E86rR9/Ft122OTrKoC5qEXBcNovC/ZYFe+vzW9dyWE4PC30ker4WwlqIXFZpC+KXW
 06dDbGiSTH8ii4gFzo+E1j4NmQyMbaaBVbIJwYBV5sPFNTIqSRabO6PVbYBXGyWmJpv9rsvYo8p
 gy/zn7ydcoTiNJVCBZ+6KChR1YxZ84e4l9QxGKy+PFHAOMY5Umx/sfPM7SRSn11pIUf4fex8dP5
 wrkn3GWNNFJLwVYCdypdUzc2u62WaPM5QZKA6Y1JEJS7ylnZwlHQ/OrfTTB2FamjQcTb0Wqr4ch
 EerGnyhDyobCAH0s/ysFWf0I7O/vgR1IXhnb6NkfzD5LLPnDRNffKdkvbD837RMD0te0fTd6cWk
 hG3sJjHOqLxVqZg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Use the composite clock helpers to define simple composite clocks of
the c3-peripherals clock controller.

This reduces the verbosity of the controller code on these very simple
parts, making maintenance simpler.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/c3-peripherals.c | 1029 +++---------------------------------
 1 file changed, 63 insertions(+), 966 deletions(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index fd35f9b7994720d069c5f72142d6064790d40b60..b158756cfee4dd4bad5c0c9576da02d2cb8ee515 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -467,52 +467,9 @@ static const struct clk_parent_data c3_saradc_parents[] = {
 	{ .fw_name = "sysclk" }
 };
 
-static struct clk_regmap c3_saradc_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SAR_CLK_CTRL0,
-		.mask = 0x1,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "saradc_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_saradc_parents,
-		.num_parents = ARRAY_SIZE(c3_saradc_parents),
-	},
-};
-
-static struct clk_regmap c3_saradc_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SAR_CLK_CTRL0,
-		.shift = 0,
-		.width = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "saradc_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_saradc_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_saradc = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SAR_CLK_CTRL0,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "saradc",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_saradc_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x1, c3_saradc_parents);
+static C3_COMP_DIV(saradc, SAR_CLK_CTRL0, 0, 8);
+static C3_COMP_GATE(saradc, SAR_CLK_CTRL0, 8);
 
 static const struct clk_parent_data c3_pwm_parents[] = {
 	{ .fw_name = "oscin" },
@@ -588,99 +545,13 @@ static const struct clk_parent_data c3_spicc_parents[] = {
 	{ .fw_name = "gp1" }
 };
 
-static struct clk_regmap c3_spicc_a_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SPICC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_a_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_spicc_parents,
-		.num_parents = ARRAY_SIZE(c3_spicc_parents),
-	},
-};
-
-static struct clk_regmap c3_spicc_a_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SPICC_CLK_CTRL,
-		.shift = 0,
-		.width = 6,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_a_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_a_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_spicc_a = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SPICC_CLK_CTRL,
-		.bit_idx = 6,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_a",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_a_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_spicc_b_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SPICC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 23,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_b_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_spicc_parents,
-		.num_parents = ARRAY_SIZE(c3_spicc_parents),
-	},
-};
-
-static struct clk_regmap c3_spicc_b_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SPICC_CLK_CTRL,
-		.shift = 16,
-		.width = 6,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_b_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_b_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(spicc_a, SPICC_CLK_CTRL, 7, 0x7, c3_spicc_parents);
+static C3_COMP_DIV(spicc_a, SPICC_CLK_CTRL, 0, 6);
+static C3_COMP_GATE(spicc_a, SPICC_CLK_CTRL,  6);
 
-static struct clk_regmap c3_spicc_b = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SPICC_CLK_CTRL,
-		.bit_idx = 22,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spicc_b",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spicc_b_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(spicc_b, SPICC_CLK_CTRL, 23, 0x7, c3_spicc_parents);
+static C3_COMP_DIV(spicc_b, SPICC_CLK_CTRL, 16, 6);
+static C3_COMP_GATE(spicc_b, SPICC_CLK_CTRL, 22);
 
 static const struct clk_parent_data c3_spifc_parents[] = {
 	{ .fw_name = "gp0" },
@@ -693,52 +564,9 @@ static const struct clk_parent_data c3_spifc_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_spifc_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SPIFC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spifc_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_spifc_parents,
-		.num_parents = ARRAY_SIZE(c3_spifc_parents),
-	},
-};
-
-static struct clk_regmap c3_spifc_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SPIFC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spifc_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spifc_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_spifc = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SPIFC_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "spifc",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_spifc_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(spifc, SPIFC_CLK_CTRL, 9, 0x7, c3_spifc_parents);
+static C3_COMP_DIV(spifc, SPIFC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(spifc, SPIFC_CLK_CTRL,  8);
 
 static const struct clk_parent_data c3_sd_emmc_parents[] = {
 	{ .fw_name = "oscin" },
@@ -751,146 +579,17 @@ static const struct clk_parent_data c3_sd_emmc_parents[] = {
 	{ .fw_name = "gp0" }
 };
 
-static struct clk_regmap c3_sd_emmc_a_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_a_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_sd_emmc_parents,
-		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_a_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_a_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_a_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_a = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.bit_idx = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_a",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_a_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_b_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_b_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_sd_emmc_parents,
-		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_b_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_b_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_b_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_b = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = SD_EMMC_CLK_CTRL,
-		.bit_idx = 23,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_b",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_b_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_sd_emmc_c_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = NAND_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_c_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_sd_emmc_parents,
-		.num_parents = ARRAY_SIZE(c3_sd_emmc_parents),
-	},
-};
+static C3_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, c3_sd_emmc_parents);
+static C3_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL,  7);
 
-static struct clk_regmap c3_sd_emmc_c_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = NAND_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_c_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_c_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(sd_emmc_b, SD_EMMC_CLK_CTRL, 25, 0x7, c3_sd_emmc_parents);
+static C3_COMP_DIV(sd_emmc_b, SD_EMMC_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(sd_emmc_b, SD_EMMC_CLK_CTRL, 23);
 
-static struct clk_regmap c3_sd_emmc_c = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = NAND_CLK_CTRL,
-		.bit_idx = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "sd_emmc_c",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_sd_emmc_c_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, c3_sd_emmc_parents);
+static C3_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7);
 
 static struct clk_regmap c3_ts_div = {
 	.data = &(struct clk_regmap_div_data) {
@@ -996,52 +695,9 @@ static const struct clk_parent_data c3_mipi_dsi_meas_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_mipi_dsi_meas_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VDIN_MEAS_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 21,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "mipi_dsi_meas_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_mipi_dsi_meas_parents,
-		.num_parents = ARRAY_SIZE(c3_mipi_dsi_meas_parents),
-	},
-};
-
-static struct clk_regmap c3_mipi_dsi_meas_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VDIN_MEAS_CLK_CTRL,
-		.shift = 12,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "mipi_dsi_meas_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_mipi_dsi_meas_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_mipi_dsi_meas = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VDIN_MEAS_CLK_CTRL,
-		.bit_idx = 20,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "mipi_dsi_meas",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_mipi_dsi_meas_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(mipi_dsi_meas, VDIN_MEAS_CLK_CTRL, 21, 0x7, c3_mipi_dsi_meas_parents);
+static C3_COMP_DIV(mipi_dsi_meas, VDIN_MEAS_CLK_CTRL, 12, 7);
+static C3_COMP_GATE(mipi_dsi_meas, VDIN_MEAS_CLK_CTRL, 20);
 
 static const struct clk_parent_data c3_dsi_phy_parents[] = {
 	{ .fw_name = "gp1" },
@@ -1054,52 +710,9 @@ static const struct clk_parent_data c3_dsi_phy_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_dsi_phy_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = MIPIDSI_PHY_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 12,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dsi_phy_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_dsi_phy_parents,
-		.num_parents = ARRAY_SIZE(c3_dsi_phy_parents),
-	},
-};
-
-static struct clk_regmap c3_dsi_phy_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = MIPIDSI_PHY_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dsi_phy_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dsi_phy_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_dsi_phy = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = MIPIDSI_PHY_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dsi_phy",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dsi_phy_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(dsi_phy, MIPIDSI_PHY_CLK_CTRL, 12, 0x7, c3_dsi_phy_parents);
+static C3_COMP_DIV(dsi_phy, MIPIDSI_PHY_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(dsi_phy, MIPIDSI_PHY_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_vout_mclk_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1112,52 +725,9 @@ static const struct clk_parent_data c3_vout_mclk_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_vout_mclk_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_mclk_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vout_mclk_parents,
-		.num_parents = ARRAY_SIZE(c3_vout_mclk_parents),
-	},
-};
-
-static struct clk_regmap c3_vout_mclk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_mclk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_mclk_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vout_mclk = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_mclk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_mclk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vout_mclk, VOUTENC_CLK_CTRL, 9, 0x7, c3_vout_mclk_parents);
+static C3_COMP_DIV(vout_mclk, VOUTENC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(vout_mclk, VOUTENC_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_vout_enc_parents[] = {
 	{ .fw_name = "gp1" },
@@ -1170,52 +740,9 @@ static const struct clk_parent_data c3_vout_enc_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_vout_enc_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_enc_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vout_enc_parents,
-		.num_parents = ARRAY_SIZE(c3_vout_enc_parents),
-	},
-};
-
-static struct clk_regmap c3_vout_enc_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_enc_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_enc_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vout_enc = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VOUTENC_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vout_enc",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vout_enc_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vout_enc, VOUTENC_CLK_CTRL, 25, 0x7, c3_vout_enc_parents);
+static C3_COMP_DIV(vout_enc, VOUTENC_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(vout_enc, VOUTENC_CLK_CTRL, 24);
 
 static const struct clk_parent_data c3_hcodec_pre_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1228,99 +755,13 @@ static const struct clk_parent_data c3_hcodec_pre_parents[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap c3_hcodec_0_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VDEC_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_hcodec_pre_parents,
-		.num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
-	},
-};
+static C3_COMP_SEL(hcodec_0,  VDEC_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
+static C3_COMP_DIV(hcodec_0,  VDEC_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(hcodec_0,  VDEC_CLK_CTRL, 8);
 
-static struct clk_regmap c3_hcodec_0_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VDEC_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_0_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_0_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_hcodec_0 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VDEC_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_0",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_0_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_hcodec_1_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VDEC3_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_1_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_hcodec_pre_parents,
-		.num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
-	},
-};
-
-static struct clk_regmap c3_hcodec_1_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VDEC3_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_1_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_1_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_hcodec_1 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VDEC3_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "hcodec_1",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_hcodec_1_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(hcodec_1, VDEC3_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
+static C3_COMP_DIV(hcodec_1, VDEC3_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(hcodec_1, VDEC3_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_hcodec_parents[] = {
 	{ .hw = &c3_hcodec_0.hw },
@@ -1353,99 +794,13 @@ static const struct clk_parent_data c3_vc9000e_parents[] = {
 	{ .fw_name = "gp0" }
 };
 
-static struct clk_regmap c3_vc9000e_aclk_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_aclk_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vc9000e_parents,
-		.num_parents = ARRAY_SIZE(c3_vc9000e_parents),
-	},
-};
-
-static struct clk_regmap c3_vc9000e_aclk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_aclk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_aclk_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vc9000e_aclk = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_aclk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_aclk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vc9000e_core_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_core_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vc9000e_parents,
-		.num_parents = ARRAY_SIZE(c3_vc9000e_parents),
-	},
-};
-
-static struct clk_regmap c3_vc9000e_core_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_core_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_core_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vc9000e_aclk, VC9000E_CLK_CTRL, 9, 0x7, c3_vc9000e_parents);
+static C3_COMP_DIV(vc9000e_aclk, VC9000E_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(vc9000e_aclk, VC9000E_CLK_CTRL, 8);
 
-static struct clk_regmap c3_vc9000e_core = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VC9000E_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vc9000e_core",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vc9000e_core_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vc9000e_core, VC9000E_CLK_CTRL, 25, 0x7, c3_vc9000e_parents);
+static C3_COMP_DIV(vc9000e_core, VC9000E_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(vc9000e_core, VC9000E_CLK_CTRL, 24);
 
 static const struct clk_parent_data c3_csi_phy_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1458,52 +813,9 @@ static const struct clk_parent_data c3_csi_phy_parents[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap c3_csi_phy0_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = ISP0_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "csi_phy0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_csi_phy_parents,
-		.num_parents = ARRAY_SIZE(c3_csi_phy_parents),
-	},
-};
-
-static struct clk_regmap c3_csi_phy0_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = ISP0_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "csi_phy0_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_csi_phy0_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_csi_phy0 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = ISP0_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "csi_phy0",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_csi_phy0_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(csi_phy0, ISP0_CLK_CTRL, 25, 0x7, c3_csi_phy_parents);
+static C3_COMP_DIV(csi_phy0, ISP0_CLK_CTRL, 16, 7);
+static C3_COMP_GATE(csi_phy0, ISP0_CLK_CTRL, 24);
 
 static const struct clk_parent_data c3_dewarpa_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1516,52 +828,9 @@ static const struct clk_parent_data c3_dewarpa_parents[] = {
 	{ .fw_name = "fdiv7" }
 };
 
-static struct clk_regmap c3_dewarpa_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = DEWARPA_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dewarpa_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_dewarpa_parents,
-		.num_parents = ARRAY_SIZE(c3_dewarpa_parents),
-	},
-};
-
-static struct clk_regmap c3_dewarpa_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = DEWARPA_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dewarpa_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dewarpa_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_dewarpa = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = DEWARPA_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "dewarpa",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_dewarpa_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(dewarpa, DEWARPA_CLK_CTRL, 9, 0x7, c3_dewarpa_parents);
+static C3_COMP_DIV(dewarpa, DEWARPA_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(dewarpa, DEWARPA_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_isp_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1574,52 +843,9 @@ static const struct clk_parent_data c3_isp_parents[] = {
 	{ .fw_name = "oscin" }
 };
 
-static struct clk_regmap c3_isp0_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = ISP0_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "isp0_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_isp_parents,
-		.num_parents = ARRAY_SIZE(c3_isp_parents),
-	},
-};
-
-static struct clk_regmap c3_isp0_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = ISP0_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "isp0_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_isp0_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_isp0 = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = ISP0_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "isp0",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_isp0_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(isp0, ISP0_CLK_CTRL, 9, 0x7, c3_isp_parents);
+static C3_COMP_DIV(isp0, ISP0_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(isp0, ISP0_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_nna_core_parents[] = {
 	{ .fw_name = "oscin" },
@@ -1632,52 +858,9 @@ static const struct clk_parent_data c3_nna_core_parents[] = {
 	{ .fw_name = "hifi" }
 };
 
-static struct clk_regmap c3_nna_core_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = NNA_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "nna_core_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_nna_core_parents,
-		.num_parents = ARRAY_SIZE(c3_nna_core_parents),
-	},
-};
-
-static struct clk_regmap c3_nna_core_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = NNA_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "nna_core_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_nna_core_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_nna_core = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = NNA_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "nna_core",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_nna_core_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(nna_core, NNA_CLK_CTRL, 9, 0x7, c3_nna_core_parents);
+static C3_COMP_DIV(nna_core, NNA_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(nna_core, NNA_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_ge2d_parents[] = {
 	{ .fw_name = "oscin" },
@@ -1690,52 +873,9 @@ static const struct clk_parent_data c3_ge2d_parents[] = {
 	{ .hw = &c3_rtc_clk.hw }
 };
 
-static struct clk_regmap c3_ge2d_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = GE2D_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_ge2d_parents,
-		.num_parents = ARRAY_SIZE(c3_ge2d_parents),
-	},
-};
-
-static struct clk_regmap c3_ge2d_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = GE2D_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_ge2d_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_ge2d = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = GE2D_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "ge2d",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_ge2d_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(ge2d, GE2D_CLK_CTRL, 9, 0x7, c3_ge2d_parents);
+static C3_COMP_DIV(ge2d, GE2D_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(ge2d, GE2D_CLK_CTRL, 8);
 
 static const struct clk_parent_data c3_vapb_parents[] = {
 	{ .fw_name = "fdiv2p5" },
@@ -1748,52 +888,9 @@ static const struct clk_parent_data c3_vapb_parents[] = {
 	{ .fw_name = "oscin" },
 };
 
-static struct clk_regmap c3_vapb_sel = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = VAPB_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vapb_sel",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = c3_vapb_parents,
-		.num_parents = ARRAY_SIZE(c3_vapb_parents),
-	},
-};
-
-static struct clk_regmap c3_vapb_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = VAPB_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vapb_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vapb_sel.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap c3_vapb = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = VAPB_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data) {
-		.name = "vapb",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&c3_vapb_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
+static C3_COMP_SEL(vapb, VAPB_CLK_CTRL, 9, 0x7, c3_vapb_parents);
+static C3_COMP_DIV(vapb, VAPB_CLK_CTRL, 0, 7);
+static C3_COMP_GATE(vapb, VAPB_CLK_CTRL, 8);
 
 static struct clk_hw *c3_peripherals_hw_clks[] = {
 	[CLKID_RTC_XTAL_CLKIN]		= &c3_rtc_xtal_clkin.hw,

-- 
2.47.2

