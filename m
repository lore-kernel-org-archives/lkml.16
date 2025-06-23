Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479A24DD1F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696673; cv=none; b=FynGOsVkWVmw6BkKh+EqpMgn032zGY1Vo4d0XESdqSULK++tV673HEQ+qzOL1FcxSxoze99vhwQcOMYUoGMI4p04GZ/KhMCzigSZhVQZd/fyPl06PidJ6Fojb+rcX4C+YQbT5QI36JIWWICFIn0ncl0U7219pZTqAZ0nI24wDMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696673; c=relaxed/simple;
	bh=lY/+jeINkrBTULMr0fgrgjWAsXe5te4CfoeDV9q3UOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjokpU98/QOsxrGxDcyKBBiHqtyqrAhcDFncevCZFZYRuOcCDRcrneKxJJPU8eiaopf09jRwMCxqNXo9Cj7ALz4aMA9PUm7vTW3XYQYSuhD+f6CxZOeo/h9E+J6+m3nIJ32qRcvJHb5Hpv94vOUrZ4vP5xYpcfEKof7TWlFbCH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=r1cmcTCO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="r1cmcTCO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d54214adso29297975e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696669; x=1751301469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=;
        b=r1cmcTCOB6AEEGhqMwfO2w5TpR628PAgyCfMLLOM7EP5L8Wu1IMMDF3S01ava7DV2B
         4sOZ79CDbO0rWMXNjpLms5dD2DOPQ0tgxcx9uWRDMoomLokSSJT7HuueM/x+F/zxV58L
         ExZZZh+8wMPpA4Ymd6WEauyzoJvYx3AP8PdwdzW2iyOwD4+7/Stfxk1TqlHfvE4ErDvu
         J4xp/H1WQ/4qf6zELmKqRsPsSReCTGvG2E5EdCgi8bvf1zaGUjYUq48s617WCxOSkeJd
         4JbrorKbbwYingksy2j7DHlLiBYmifmkVjwEs/x2k4XzdgrDY8kLsDUUnWPRYulz9Aig
         H7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696669; x=1751301469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=;
        b=fMv5VEHAUNH/gnjITogw5PvapROXDUV/aLqoEtH7QCrEst3oAS+JJWDFK5YdOLriQV
         mBQcv19TAlruHFMgjg/xb5LkDkKhdYVAoYS8IGoVhiwXoU/1hfoET57wNBGhzSwx5gEt
         uh1vSzLh9Y+iR4ps+hJJfRUOYys9c2liOi4ULLSJ7eWCW90PdEcxoi70t30MgVUa8hgc
         8cGVUZ1eR30Xrk2UP+9W3yxDX/J8vKkZl0Fry8p3ssvKY3zVmJ0uUQgJJbn6iGGbYU0m
         ECX1/3zC4/CdJNmJrkBgIrY3riWlosPHBTHPVMydtISljFwOc9OTLv+Mwf/xSgzrwXh0
         Z+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMVHGTgZqrFHANasqIHfZ3Oobo01XLJBEh4jHKhENp2DQUMUNcCxbu8V2YgsduLfeAR8oPzGNzICFUT8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwssW/zGtmS2p2HnSDImD8TYar2PYo7r+l0vI8KJG3T1UiI4CfY
	I8VkI/lK0N/JYTRY8gNy7cvcO+MQZLTAVqIqQSJxsrfnFH9fBbA8MUO0UJNcnEYfbVc=
X-Gm-Gg: ASbGnctur8skUbBSahTR0A0Cr/dNPGuJKbC7gv/EG5X+85DdQ3e2nUGrNbncLc71qCx
	JzbwmTdFkgP+AOasylArnSTzenLtz0YkoccjLHvvvjBqzpZCG9zxJX1hfBEvYnMujxx8YvbjTNW
	FB+mk6HG0Cu1nRszfee4R+U36H0lRlWvLKh+mfYgP69bkAhqsdX9/UEbay4s061ecHoWRfDSzuQ
	JVjHFLjIILVjN81mzlN31YfGKKRmx2XY0JipxUpwAHjTEDGxnzMyjyXBnNpMEbQxRnwYla6GP1y
	6X+TqdlqmxSHeRSjviQK4x3KSmaNXgGh0Y5nP8un+U8wzHc5T5wDLw6NxVIVdlGgHmywEltCVrB
	l
X-Google-Smtp-Source: AGHT+IFi/UBk2HwAnllzHqb7XPWGf9QFYR4a94bir3bwedo9/Llza5DcgNihEeICX6IArc5TRzULPA==
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr12059049f8f.13.1750696668742;
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 18:37:39 +0200
Subject: [PATCH v4 3/3] clk: amlogic: s4: remove unused data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-3-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lY/+jeINkrBTULMr0fgrgjWAsXe5te4CfoeDV9q3UOI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLYO0zm2Ij1fDff8rSEVAszTwR1HrjavXeaU
 0Uem7bF9VeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC2AAKCRDm/A8cN/La
 hc/CD/4m/uWRim24OFAgeUrpZSDUlhz+owSrV5ms30HqiIr49Tu/MkLik1fNxtOZoP7F3o7Vd9w
 I1ljZ786kW8PqUn9WvzghDsgbY2H1rmf7myPVPgO5cMxtzP8JXFozngMvwPnlm7xoZ1+6P0Bkdc
 PN47s/Ji69FMhx2JWbZVT/+0qfmpBKAlGn5Sbh2OOKCtkMazBWQRAU3jfjqLGpVpiQbwqVd8jPV
 gNF3JSxbQwnX8ghEC1HWQI4h/sq3w0UeLo68K3qGcJTLE3MSQARLwLdmn9VYdQqkKiGzGDrPRn+
 J3xBs9BrRzWyanNumrpOXqPnZADZHYudv5rkwY4gvuFWpMyO9KlcLiOvihX7nmgDrruDdaK7hkR
 bbQ1br1vNnTrPZK4A62Jkxj/z8v7A3KjL89I7RuBdBlVTZi1UfM511q5UtYXSPQMvYW/VNJWqUK
 MiueAteGQhWVE7a2BSwOKqlhQoH55D5JXdSS/xmcdYkTAj/g5Z455Z9oY00R4VzDcCxyeoiwEEM
 uJHCFa6zgqTUKmuka6A3+RdRpVg7HHo+qG6u1n/AYvNT6eAFgqyPxWbG3RbuRV72dJcNpca+mJ1
 4iNSzWhQuYvDOhufnvDkni/Yn/JiALR2mA9mC75E8Fu6x/LCJyq3tFDOwfQsOD6kH/RQUTM2bos
 H0LyBCHLEn47Unw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Following the removal of the clk_regmap clock table from the s4-peripherals
clock controller driver, it appears some clocks are unused, which means
these are not exported or even registered.

In all likelihood, these clocks have not been tested. Remove the unused
clocks for now. These can added back later when they have been properly
tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index fd2d4d725f9e2595a865909db3c0c598309ef448..c9400cf54c84c3dc7c63d0636933951b0cac230c 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3174,118 +3174,6 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
-static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
-	{ .fw_name = "xtal", },
-	{ .fw_name = "fclk_div4", },
-	{ .fw_name = "fclk_div3", },
-	{ .fw_name = "fclk_div5", },
-	{ .fw_name = "fclk_div7", },
-	{ .fw_name = "mpll2", },
-	{ .fw_name = "gp0_pll", },
-	{ .fw_name = "hifi_pll", },
-};
-
-static struct clk_regmap s4_adc_extclk_in_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_adc_extclk_in_parent_data,
-		.num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .fw_name = "fclk_div7", },
-			{ .fw_name = "fclk_div4", },
-			{ .hw = &s4_adc_extclk_in_gate.hw }
-		},
-		.num_parents = 4,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
 

-- 
2.47.2

