Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6A2D77F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470053; cv=none; b=HgTYb9GudnQDB7LWXcYmujliOwMUVdiVT81tDq/YDIndoCG8PRIp2YVqcthQn7sLDuXkpOLdVkvVfzWn4H+MjRwkTb48RKMXJMOyQyZ7LwCADcwwjPhw6xm2Es+7yr3GdiHcGNR63AHmlel/eAczdrphaohRjjaCni+86gmIcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470053; c=relaxed/simple;
	bh=dC9fR8dCdw4MCQUXs1TojL+gHHZbG5T/NoHzphabgSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gly5EEZ3eyC0Y+B80QqI5wnzFWBvdkBznPyNaMp7D2GFLuTD1qdx9uhmZQ30+K+3xYAzkkxVXPX+LGn5/cDqA34WE8tFK1hnj9RnI8EY78MXrACsZEYFcxLh/BwFauz9qeeJ3J1OFqKISNUo7XDVH7mESX/ZhajmRrKgr7lJBJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z6T6IjhA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z6T6IjhA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d7b50815so35111315e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470047; x=1752074847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gK5w/SU70bgPzrjySAkWpDaffQt0ydN/UE80qwpHaY=;
        b=Z6T6IjhAygYnvGvTmt0Oxe1knKvB6t9+KLdmblYmlzSM3/a2WIF/jxTjKcQCf/GG65
         s999KZu7qr5QnvLqeuQou3Fso35YEXUM7CY9bzop9nHSYko0iCtkovUYvolU1pmKejgv
         uAYBtHofNpWrE0+HlqMvHzfsr7svLSrmkE3V9YhLMXdcHYJ61SJALX2fwB05O1m6Ck2i
         Aa9kvnhNrRYzM86vD5Qtmi01dyJ64WZDCHOxv62/oADgKzl7kC9/PQJCalDAecCk5CcQ
         mVyWU1ud3rJTueRuYifCi8yDRfvNpIkG6Oq4lcjy8Oq/jg+NNnjlumP/tG1LdOFJ5csV
         qgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470047; x=1752074847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gK5w/SU70bgPzrjySAkWpDaffQt0ydN/UE80qwpHaY=;
        b=m4TV0YTXnb3maFA+y3yCp7s6UTGXhE9fGIjpWZf0WeOTzWAwOv5g0mU5iIb8phAMSY
         EwAP7ZrG9KEqZpVxM6Mn80RwbKrvqlR229lp6Hi3UmBkBxEXEbaeYMQoCCrQJ2GgZYqO
         SxTOBzzTw5ni1a//RqdsaQaRBO3t6fc5EDny2rDID4u9uDtQGxlOR+XBCWAuEyHTmjuq
         7gt5i8DJ4ueAHnbd5YPakK0whmJQNGet/hoxvaOB63FKyyin82NYm+94+PvQPc0+ER+9
         DnVn8SYQXbjAfOvhYP8Kibch811W/eon0L67JTdUVKtO4wX52xf1Tpe66MjHuWaJTQEM
         yQCg==
X-Forwarded-Encrypted: i=1; AJvYcCV8L/guMyNXayaOGVnvZwWOVMuMGtYbRGuOzw41W/Tkw2q354haB+ciawlQeVI3G+TTbDbKD6aKKktv/Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOfiGWp1apFyBRWONprYDeo5/a9d9Akgv/PU5YJbVU2x2XlbL
	n8nzrF+XUYJuRjtv0jc3FgVhSqLhRGeXHRT5NE0+6SfnnB0BrQFkRo/Y91Cc+leUXE8=
X-Gm-Gg: ASbGncsSis8kA8nwk2ayc64fSJt0FtsQlJD4PvWSkAaDLE9z2OVsX3DROS9RSwuJyPh
	QvOXqmdTo0PlXG48CML/96aDGouVoIP066dpjI2sq6lwBD3QpGhif+h1Fd6W7NwLLv/9wubZtPw
	PA5u5HhaUaVr8i7sT24khR4szM7Ui15S7Yo6Ty+noTpXGl2lC53TjXgoWXIrwK63MLwlcPJ30Ls
	Os/1Kak6FBpvehA4o2fmkaAhT9DJ2LhUfupwW5UuMu83XIeT7/j52tv9V9+FaSySYA8Ts1Y5moe
	WBeqjp4cEcu02kfrhsff8k8tBPBBqX4cFEvNxrrNo123YFJmAz+Gmxy1PoGtNhnsyseHvHrWB2o
	0
X-Google-Smtp-Source: AGHT+IFL/9/lkIgAqJj7Ak4tUb6JNbD+DaFRi6G1+U3dIDUNhCg8o+8TqiTvUJvN9NilK2wzt8ulmw==
X-Received: by 2002:a05:600c:3488:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-454a9c70d55mr1120225e9.11.1751470047490;
        Wed, 02 Jul 2025 08:27:27 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:11 +0200
Subject: [PATCH 13/26] clk: amlogic: s4-pll: naming consistency alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-13-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5678; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dC9fR8dCdw4MCQUXs1TojL+gHHZbG5T/NoHzphabgSQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/Cb4CPYZbTpqqMqeEnIIzKTx98YsF4CpOXs
 g22PqNoH+qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPwgAKCRDm/A8cN/La
 hbj3D/9AlTWRQKxJvRMqH0OwhcZmalTSE/pG2jXaJzmTrcfcgpDcCzFzXAxcZuDxcyUcN6g9ttK
 6bwS1tayEcEjBu/LXNB03lvhsWpqQoPWhDDhzTteUghXJ9yHuRF+9ZwWkHn+IM89yvK6YN7BqsY
 kGusxRPWqn2zCm46iXxQGOAfD5dX8kfjZ8DoDgubSsQNzxIy5z3yH/3W+uDJWigcyPr9qRhG167
 JzC4heYPQAKRfNKmBUIidV+ZBWtXkWPAG/+J03isGCff0MrDpl0C7ADP4gTmbcBEJsqEsN/mgrL
 qigVFg4POSi7VUbqP3x3XtKbGqu441Y7s4ZNz1QxrStvwkKlywplK2bYlj/siFgODuD8uqoaZIW
 FMo+S6wD95tNtE0Ctlvefq4iFQcLC3UM+KrEhyWuzTYJj2Gh5975BlJf2dQZqwCz9eYBldWc1XU
 3vtKQ4ZXLxK+4Kfdsn/gFDzqoysdpSElhbpiC0OPgxTnx9ZmC/MMV7i13vfVFZiJKEuv/26x0Sc
 U/rxZbo6DqStQSxWXQ23/xcAjbyt3ek7ugPVE3iYizo6X1nUK6XD5P4TGkOKifIpo5napvHp7dl
 JxZLEVlonS2j27OeI5/I1wWDVW7jDzo0EaK2sA1vSPfzQpCFHDCE+B1/F9rDozcGbBEOJxLD2gQ
 HUlXyDIhr1HhK+g==
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
 drivers/clk/meson/s4-pll.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 3d689d2f003e21658016b84918bf1b7b1954c05a..6a266bcafd6257937c1de50cbc5606dcc6f8207b 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -281,7 +281,7 @@ static const struct pll_mult_range s4_gp0_pll_mult_range = {
 /*
  * Internal gp0 pll emulation configuration parameters
  */
-static const struct reg_sequence s4_gp0_init_regs[] = {
+static const struct reg_sequence s4_gp0_pll_init_regs[] = {
 	{ .reg = ANACTRL_GP0PLL_CTRL1,	.def = 0x00000000 },
 	{ .reg = ANACTRL_GP0PLL_CTRL2,	.def = 0x00000000 },
 	{ .reg = ANACTRL_GP0PLL_CTRL3,	.def = 0x48681c00 },
@@ -318,8 +318,8 @@ static struct clk_regmap s4_gp0_pll_dco = {
 			.width   = 1,
 		},
 		.range = &s4_gp0_pll_mult_range,
-		.init_regs = s4_gp0_init_regs,
-		.init_count = ARRAY_SIZE(s4_gp0_init_regs),
+		.init_regs = s4_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s4_gp0_pll_init_regs),
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "gp0_pll_dco",
@@ -353,7 +353,7 @@ static struct clk_regmap s4_gp0_pll = {
 /*
  * Internal hifi pll emulation configuration parameters
  */
-static const struct reg_sequence s4_hifi_init_regs[] = {
+static const struct reg_sequence s4_hifi_pll_init_regs[] = {
 	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x00000000 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
 	{ .reg = ANACTRL_HIFIPLL_CTRL4,	.def = 0x65771290 },
@@ -394,8 +394,8 @@ static struct clk_regmap s4_hifi_pll_dco = {
 			.width   = 1,
 		},
 		.range = &s4_gp0_pll_mult_range,
-		.init_regs = s4_hifi_init_regs,
-		.init_count = ARRAY_SIZE(s4_hifi_init_regs),
+		.init_regs = s4_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s4_hifi_pll_init_regs),
 		.frac_max = 100000,
 		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
 	},
@@ -794,11 +794,11 @@ static struct clk_hw *s4_pll_hw_clks[] = {
 	[CLKID_MPLL3]			= &s4_mpll3.hw,
 };
 
-static const struct reg_sequence s4_init_regs[] = {
+static const struct reg_sequence s4_pll_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
 
-static const struct regmap_config clkc_regmap_config = {
+static const struct regmap_config s4_pll_clkc_regmap_cfg = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,
@@ -810,7 +810,7 @@ static struct meson_clk_hw_data s4_pll_clks = {
 	.num = ARRAY_SIZE(s4_pll_hw_clks),
 };
 
-static int meson_s4_pll_probe(struct platform_device *pdev)
+static int s4_pll_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
@@ -822,12 +822,12 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(base),
 				     "can't ioremap resource\n");
 
-	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
+	regmap = devm_regmap_init_mmio(dev, base, &s4_pll_clkc_regmap_cfg);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "can't init regmap mmio region\n");
 
-	ret = regmap_multi_reg_write(regmap, s4_init_regs, ARRAY_SIZE(s4_init_regs));
+	ret = regmap_multi_reg_write(regmap, s4_pll_init_regs, ARRAY_SIZE(s4_pll_init_regs));
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to init registers\n");
@@ -848,22 +848,22 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
 					   &s4_pll_clks);
 }
 
-static const struct of_device_id clkc_match_table[] = {
+static const struct of_device_id s4_pll_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,s4-pll-clkc",
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, clkc_match_table);
+MODULE_DEVICE_TABLE(of, s4_pll_clkc_match_table);
 
-static struct platform_driver s4_driver = {
-	.probe		= meson_s4_pll_probe,
+static struct platform_driver s4_pll_clkc_driver = {
+	.probe		= s4_pll_clkc_probe,
 	.driver		= {
 		.name	= "s4-pll-clkc",
-		.of_match_table = clkc_match_table,
+		.of_match_table = s4_pll_clkc_match_table,
 	},
 };
-module_platform_driver(s4_driver);
+module_platform_driver(s4_pll_clkc_driver);
 
 MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");

-- 
2.47.2

