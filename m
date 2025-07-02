Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F702D7817
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470055; cv=none; b=OpyBVJanRPTeP8Qy+M9yt7IRSbEDtvEqyIb81B/091poAimlpXryGaYJ/vsT5CRbjHezefCdij3nrriE7aQS349Ek/iWyI3aMxlqxzaZ9S3VAHlbFVYuWKGftO3SPSQUslUzTFq6bw1fc+LzQZ5pY2qyN4N55sHECt/WsXjwx0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470055; c=relaxed/simple;
	bh=pDD38k0SIxrSHiG/SWcjxn+yqzh3OgAiTIc+fdsRAf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFu0IvUuefyAGJLKMP3bImIkk9yGCdF7PbJ7UwKt2TqxBEj3BB1uNa8wJqvCsTI4bTjiSOO1yy8aCnoAcAiyzpRNRrfJCMT/bk/jJrLYKP09y+J8y+Sz/XWRqqdhn2nVgSFEk2uG/8HZtYnlE3ukCJF79bBLRJFrFRSxuGuVhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xcg+V/gG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xcg+V/gG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d3f72391so48612805e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470049; x=1752074849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUNhaEN8gzwDkf+1nNZTJLoKinJ1pGlF7GtwCVhKJLE=;
        b=Xcg+V/gG4Xm4UTJGAJxDGRJ4ffjn7v3GwTdms4V5tQnxqeFxTemFBTltbZXA5CXqlV
         59/vnh7AAhbZlOZnkl/9sdxLrAw7Ro7N4nypALXUdfkxDCLq+vKQE6mqpk/wV+H31yPb
         4RexDxLEEFh7TLWhVKsHP+VJ243n0UG7bp5xdOtBNq3tFagFjVmbZiaYxRRQ83xnvcCA
         KAj3+sQgv0phTzJog9oYrhnmlwa2jxTl3GI1n1kfkvMu1KUjhjiZ+zJEYRdjpyXczn8T
         hWrdfENv7UYTHHFoISq7lvCfaJQ51WnmnEIUMRs/Jp7geaGQv+abGX9JALDzE3mVo88c
         1slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470049; x=1752074849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUNhaEN8gzwDkf+1nNZTJLoKinJ1pGlF7GtwCVhKJLE=;
        b=tApVq7g81bNVwLKLKgKsoHgMfTqQrJRi3n+2c3gS4nw4J6kpgUgkuuCcOe/rgtJLhY
         mwj7mS2RPTxpEu/SoVS7UcgDqTDQPtgptColHNg0xR8suDNym4p27r/atoN7gzTxhr+i
         NWo4oTvOYUUTMaRyKvEKt+xAZ3/dbfwsB4Aa5eCCbnef/X6OEop0JTuE/Evftg5U6oca
         LZCvdTcP+3yHWpdTLpAT1Q7bTGKtqVJ3UJBldzrcxqE3bF1KNMB+r6CO1ZGFxPbGVTzn
         3omr5V/UM0yIw43zQURqr0EFWj6pE9/FCa0lYxB76O9HfWa7rOb1dhxxLZKJn8XNysmi
         KOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIqWAyods4dejL6x+bNx5aP1RR3p05eqm+gW0A1q+tjN10CEKKogL4bn73jzuhth8KDQniixx4I7v6XrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0vVdm27ILJS3O0eE+m4geuhsBDm4SEYE8lS4UMJZp6vyLEWL
	Z2zwFpQj546C+WH08/EIATC9Lw3Zl60RCsUWoZgcRHUTO5qyykfTRZi2oTJBZ167HGM=
X-Gm-Gg: ASbGncvnKsXNT5X9X/Tck5Hl0Jj4dR/y1UOBx5ZSqsI7TLhhamtSI+CK2ZEnbOX/YIl
	HJTiVZYWla0VzbfUGHNMdohrXYHCOTPrmBHN5Lp0v4NV5InH5JWWcLKj7ijNwYHZET+/WHlV7e8
	Rb3nFnLEXgt9gQ7D/iddWrCu70aqZhbGBsuxf3S+bhDoXJmVd0uVdm4g5wykjjFIUgPEX6cIRnL
	NVHSwLeaffgkhGTPb7zVGFJmS+SzpoHw6RJT6kdO0veHmr54Qn9WSdVbxZFUZyzR0wJrwWYN97F
	Qhstlr6/HYYBAxC+Or9qcNAkOElky2a2scO8VDqcXMc08+t4SktUvwD124H9eVXDtgwYXA4ihhO
	s
X-Google-Smtp-Source: AGHT+IF5sq3L5rbtucbJzAATx3BzQioRLaZZqwtzwDYJYPBfxUgrQVqfp37cllquwb8S+2PlibE59w==
X-Received: by 2002:a05:600c:840f:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-454a9ca9fe5mr623515e9.28.1751470049058;
        Wed, 02 Jul 2025 08:27:29 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:13 +0200
Subject: [PATCH 15/26] clk: amlogic: drop meson-clkcee
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-15-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14449; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pDD38k0SIxrSHiG/SWcjxn+yqzh3OgAiTIc+fdsRAf4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/EIoCTJpyZwX6o6uh8j8f3tw/5Hji6gO2mW
 qz2zRxtE3+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPxAAKCRDm/A8cN/La
 heAPD/9ILZWvS/2NA5AtwkX1v0mhNe75Qhho2KElCMyT2hwtHEyEaLz0WZkib/9kDxJzJbzdEph
 MB4uQ9mXSwXeL03+xSXvLNqOUfsc9B3OUrinKTP9JRRdRyLX8QRH2yyR5dsWX3RWOhuoceDPJmq
 xUOuXXp6kiRBMusEs4ItltSPnaaXWPyMEt6AV1uWqJSfvGUTcAE21RA0DcTkYl1n5EBEN6rDPHw
 zgDwKJ39jh6myL6TOLuUM/IMB3RIoWZqawQvMl7kJ7zcdIydNqekuUPLRVs0+kVs9+VmknIkx0f
 VrV9MWxVDYtT01PmA6c1nwhB1Ztc7H2URCWWxVAMxIIKO2HzB66kshGFU1oXG55bRJO/SBvvwfh
 L0RcAP+rnB0QGZDAKz/TDwip0s+fKUeIIvaX5NwKujb7V5fTpS0mEHwCDFNX/irjoPNWItl149H
 Km/erAZNY5WTYU1ipMIUS3bj8xg5ivl+LJ28N4MOjWOChOEAOS7z1kDlbBEJHH+j1xEfoGayrp8
 1U9GNQcvmDOS2O9RCu+y6kuv4p3/KGrxddYZ0X8gR5m9QTNli5d5YduZq58jm0KpT2M8gOalo53
 H0wk11UMr6s0YXdoR+hVJVtzqbg8/LJOBJTTKpocP/sBenSy5N/wCeJKt3tyo+RqTeIpq2zgEkv
 IO98yX/19eDyefA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

What is being done by the Amlogic clock controller registration helper for
EE controllers could benefit other controllers. As such, having a specific
module for this makes little sense.

Move the helper function to clkc-utils and rename it to describe what it
does, registering syscon based controller, instead of what it serves.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig            | 13 +++-----
 drivers/clk/meson/Makefile           |  1 -
 drivers/clk/meson/axg.c              |  6 ++--
 drivers/clk/meson/g12a.c             | 28 ++++++++---------
 drivers/clk/meson/gxbb.c             |  8 ++---
 drivers/clk/meson/meson-clkc-utils.c | 50 +++++++++++++++++++++++++++++-
 drivers/clk/meson/meson-clkc-utils.h | 10 ++++++
 drivers/clk/meson/meson-eeclk.c      | 60 ------------------------------------
 drivers/clk/meson/meson-eeclk.h      | 24 ---------------
 9 files changed, 85 insertions(+), 115 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 7197d23543b8bb8a9020cde316170b50bc359a6c..71481607a6d55d14898f9ecca68f004ccc6f6231 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -36,6 +36,8 @@ config COMMON_CLK_MESON_VCLK
 	select COMMON_CLK_MESON_REGMAP
 
 config COMMON_CLK_MESON_CLKC_UTILS
+	select REGMAP
+	select MFD_SYSCON
 	tristate
 
 config COMMON_CLK_MESON_AO_CLKC
@@ -44,11 +46,6 @@ config COMMON_CLK_MESON_AO_CLKC
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select RESET_CONTROLLER
 
-config COMMON_CLK_MESON_EE_CLKC
-	tristate
-	select COMMON_CLK_MESON_REGMAP
-	select COMMON_CLK_MESON_CLKC_UTILS
-
 config COMMON_CLK_MESON_CPU_DYNDIV
 	tristate
 	select COMMON_CLK_MESON_REGMAP
@@ -73,12 +70,12 @@ config COMMON_CLK_GXBB
 	depends on ARM64
 	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_AO_CLKC
-	select COMMON_CLK_MESON_EE_CLKC
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on AmLogic S905 devices, aka gxbb.
@@ -89,11 +86,11 @@ config COMMON_CLK_AXG
 	depends on ARM64
 	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_AO_CLKC
-	select COMMON_CLK_MESON_EE_CLKC
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on AmLogic A113D devices, aka axg.
@@ -167,11 +164,11 @@ config COMMON_CLK_G12A
 	depends on ARM64
 	default ARCH_MESON
 	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
 	select COMMON_CLK_MESON_AO_CLKC
-	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
 	select COMMON_CLK_MESON_VCLK
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index bc56a47931c1d27db7dde72b73d9842c93e74f62..c6998e752c683ec9d1736a6811b1cfd71559b289 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -5,7 +5,6 @@ obj-$(CONFIG_COMMON_CLK_MESON_CLKC_UTILS) += meson-clkc-utils.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
 obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
-obj-$(CONFIG_COMMON_CLK_MESON_EE_CLKC) += meson-eeclk.o
 obj-$(CONFIG_COMMON_CLK_MESON_MPLL) += clk-mpll.o
 obj-$(CONFIG_COMMON_CLK_MESON_PHASE) += clk-phase.o
 obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 3839dfe9c7c540c2aec731be84e4e6520264c525..675f051ea5241b0f51e54a238470e4fe947e5ba5 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -18,7 +18,7 @@
 #include "clk-regmap.h"
 #include "clk-pll.h"
 #include "clk-mpll.h"
-#include "meson-eeclk.h"
+#include "meson-clkc-utils.h"
 
 #include <dt-bindings/clock/axg-clkc.h>
 
@@ -2110,7 +2110,7 @@ static struct clk_hw *axg_hw_clks[] = {
 	[CLKID_VDIN_MEAS]		= &axg_vdin_meas.hw,
 };
 
-static const struct meson_eeclkc_data axg_clkc_data = {
+static const struct meson_clkc_data axg_clkc_data = {
 	.hw_clks = {
 		.hws = axg_hw_clks,
 		.num = ARRAY_SIZE(axg_hw_clks),
@@ -2124,7 +2124,7 @@ static const struct of_device_id axg_clkc_match_table[] = {
 MODULE_DEVICE_TABLE(of, axg_clkc_match_table);
 
 static struct platform_driver axg_clkc_driver = {
-	.probe		= meson_eeclkc_probe,
+	.probe		= meson_clkc_syscon_probe,
 	.driver		= {
 		.name	= "axg-clkc",
 		.of_match_table = axg_clkc_match_table,
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 9de0531821a8f0297273189b44a81024d8bf9093..cdaaa165a0ff1f3b4d5250a96428c54cc3e37381 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -23,7 +23,7 @@
 #include "clk-cpu-dyndiv.h"
 #include "vid-pll-div.h"
 #include "vclk.h"
-#include "meson-eeclk.h"
+#include "meson-clkc-utils.h"
 
 #include <dt-bindings/clock/g12a-clkc.h>
 
@@ -5360,26 +5360,26 @@ static int g12a_dvfs_setup(struct platform_device *pdev)
 }
 
 struct g12a_clkc_data {
-	const struct meson_eeclkc_data eeclkc_data;
+	const struct meson_clkc_data clkc_data;
 	int (*dvfs_setup)(struct platform_device *pdev);
 };
 
 static int g12a_clkc_probe(struct platform_device *pdev)
 {
-	const struct meson_eeclkc_data *eeclkc_data;
+	const struct meson_clkc_data *clkc_data;
 	const struct g12a_clkc_data *g12a_data;
 	int ret;
 
-	eeclkc_data = of_device_get_match_data(&pdev->dev);
-	if (!eeclkc_data)
+	clkc_data = of_device_get_match_data(&pdev->dev);
+	if (!clkc_data)
 		return -EINVAL;
 
-	ret = meson_eeclkc_probe(pdev);
+	ret = meson_clkc_syscon_probe(pdev);
 	if (ret)
 		return ret;
 
-	g12a_data = container_of(eeclkc_data, struct g12a_clkc_data,
-				 eeclkc_data);
+	g12a_data = container_of(clkc_data, struct g12a_clkc_data,
+				 clkc_data);
 
 	if (g12a_data->dvfs_setup)
 		return g12a_data->dvfs_setup(pdev);
@@ -5388,7 +5388,7 @@ static int g12a_clkc_probe(struct platform_device *pdev)
 }
 
 static const struct g12a_clkc_data g12a_clkc_data = {
-	.eeclkc_data = {
+	.clkc_data = {
 		.hw_clks = {
 			.hws = g12a_hw_clks,
 			.num = ARRAY_SIZE(g12a_hw_clks),
@@ -5400,7 +5400,7 @@ static const struct g12a_clkc_data g12a_clkc_data = {
 };
 
 static const struct g12a_clkc_data g12b_clkc_data = {
-	.eeclkc_data = {
+	.clkc_data = {
 		.hw_clks = {
 			.hws = g12b_hw_clks,
 			.num = ARRAY_SIZE(g12b_hw_clks),
@@ -5410,7 +5410,7 @@ static const struct g12a_clkc_data g12b_clkc_data = {
 };
 
 static const struct g12a_clkc_data sm1_clkc_data = {
-	.eeclkc_data = {
+	.clkc_data = {
 		.hw_clks = {
 			.hws = sm1_hw_clks,
 			.num = ARRAY_SIZE(sm1_hw_clks),
@@ -5422,15 +5422,15 @@ static const struct g12a_clkc_data sm1_clkc_data = {
 static const struct of_device_id g12a_clkc_match_table[] = {
 	{
 		.compatible = "amlogic,g12a-clkc",
-		.data = &g12a_clkc_data.eeclkc_data
+		.data = &g12a_clkc_data.clkc_data
 	},
 	{
 		.compatible = "amlogic,g12b-clkc",
-		.data = &g12b_clkc_data.eeclkc_data
+		.data = &g12b_clkc_data.clkc_data
 	},
 	{
 		.compatible = "amlogic,sm1-clkc",
-		.data = &sm1_clkc_data.eeclkc_data
+		.data = &sm1_clkc_data.clkc_data
 	},
 	{}
 };
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f969e3cf9566de5dff615d59360729d963507b36..a57cdf884ae900f8651b2cd84c5019270e684026 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -13,7 +13,7 @@
 #include "clk-regmap.h"
 #include "clk-pll.h"
 #include "clk-mpll.h"
-#include "meson-eeclk.h"
+#include "meson-clkc-utils.h"
 #include "vid-pll-div.h"
 
 #include <dt-bindings/clock/gxbb-clkc.h>
@@ -3234,14 +3234,14 @@ static struct clk_hw *gxl_hw_clks[] = {
 	[CLKID_ACODEC]		    = &gxl_acodec.hw,
 };
 
-static const struct meson_eeclkc_data gxbb_clkc_data = {
+static const struct meson_clkc_data gxbb_clkc_data = {
 	.hw_clks = {
 		.hws = gxbb_hw_clks,
 		.num = ARRAY_SIZE(gxbb_hw_clks),
 	},
 };
 
-static const struct meson_eeclkc_data gxl_clkc_data = {
+static const struct meson_clkc_data gxl_clkc_data = {
 	.hw_clks = {
 		.hws = gxl_hw_clks,
 		.num = ARRAY_SIZE(gxl_hw_clks),
@@ -3256,7 +3256,7 @@ static const struct of_device_id gxbb_clkc_match_table[] = {
 MODULE_DEVICE_TABLE(of, gxbb_clkc_match_table);
 
 static struct platform_driver gxbb_clkc_driver = {
-	.probe		= meson_eeclkc_probe,
+	.probe		= meson_clkc_syscon_probe,
 	.driver		= {
 		.name	= "gxbb-clkc",
 		.of_match_table = gxbb_clkc_match_table,
diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 6937d1482719bda00da127381025a165907e5db6..49f562d0f203b9a7d15b5119100216564c10cb21 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -3,9 +3,13 @@
  * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
  */
 
-#include <linux/of_device.h>
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
 #include "meson-clkc-utils.h"
 
 struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
@@ -22,6 +26,50 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 }
 EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
 
+int meson_clkc_syscon_probe(struct platform_device *pdev)
+{
+	const struct meson_clkc_data *data;
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct regmap *map;
+	struct clk_hw *hw;
+	int ret, i;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	np = of_get_parent(dev->of_node);
+	map = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(map)) {
+		dev_err(dev,
+			"failed to get parent syscon regmap\n");
+		return PTR_ERR(map);
+	}
+
+	if (data->init_count)
+		regmap_multi_reg_write(map, data->init_regs, data->init_count);
+
+	for (i = 0; i < data->hw_clks.num; i++) {
+		hw = data->hw_clks.hws[i];
+
+		/* array might be sparse */
+		if (!hw)
+			continue;
+
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret) {
+			dev_err(dev, "registering %s clock failed\n",
+				hw->init->name);
+			return ret;
+		}
+	}
+
+	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
+}
+EXPORT_SYMBOL_NS_GPL(meson_clkc_syscon_probe, "CLK_MESON");
+
 MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index fe6f407289496c5c4821b7c9e5a6b6e8a45068b2..26cd47544302b28ca1a342e178956559a84b152a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -9,6 +9,8 @@
 #include <linux/of_device.h>
 #include <linux/clk-provider.h>
 
+struct platform_device;
+
 struct meson_clk_hw_data {
 	struct clk_hw	**hws;
 	unsigned int	num;
@@ -16,4 +18,12 @@ struct meson_clk_hw_data {
 
 struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data);
 
+struct meson_clkc_data {
+	const struct reg_sequence	*init_regs;
+	unsigned int			init_count;
+	struct meson_clk_hw_data	hw_clks;
+};
+
+int meson_clkc_syscon_probe(struct platform_device *pdev);
+
 #endif
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
deleted file mode 100644
index 6236bf970d79e85b1e739c713c03f35a00c291b9..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/meson-eeclk.c
+++ /dev/null
@@ -1,60 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2019 BayLibre, SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/mfd/syscon.h>
-#include <linux/regmap.h>
-#include <linux/module.h>
-
-#include "clk-regmap.h"
-#include "meson-eeclk.h"
-
-int meson_eeclkc_probe(struct platform_device *pdev)
-{
-	const struct meson_eeclkc_data *data;
-	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	struct regmap *map;
-	int ret, i;
-
-	data = of_device_get_match_data(dev);
-	if (!data)
-		return -EINVAL;
-
-	/* Get the hhi system controller node */
-	np = of_get_parent(dev->of_node);
-	map = syscon_node_to_regmap(np);
-	of_node_put(np);
-	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get HHI regmap\n");
-		return PTR_ERR(map);
-	}
-
-	if (data->init_count)
-		regmap_multi_reg_write(map, data->init_regs, data->init_count);
-
-	for (i = 0; i < data->hw_clks.num; i++) {
-		/* array might be sparse */
-		if (!data->hw_clks.hws[i])
-			continue;
-
-		ret = devm_clk_hw_register(dev, data->hw_clks.hws[i]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
-}
-EXPORT_SYMBOL_NS_GPL(meson_eeclkc_probe, "CLK_MESON");
-
-MODULE_DESCRIPTION("Amlogic Main Clock Controller Helpers");
-MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
deleted file mode 100644
index 6a81d67b46b2270315e24eb58042de8c09b37763..0000000000000000000000000000000000000000
--- a/drivers/clk/meson/meson-eeclk.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2019 BayLibre, SAS.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- */
-
-#ifndef __MESON_CLKC_H
-#define __MESON_CLKC_H
-
-#include <linux/clk-provider.h>
-#include "clk-regmap.h"
-#include "meson-clkc-utils.h"
-
-struct platform_device;
-
-struct meson_eeclkc_data {
-	const struct reg_sequence	*init_regs;
-	unsigned int			init_count;
-	struct meson_clk_hw_data	hw_clks;
-};
-
-int meson_eeclkc_probe(struct platform_device *pdev);
-
-#endif /* __MESON_CLKC_H */

-- 
2.47.2

