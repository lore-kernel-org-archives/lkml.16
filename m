Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0914A2D94A2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470055; cv=none; b=bxxtHbjrpPp8Rmu08yQwq9gqNHha7yN70wskTHLS/Ga4AFnPBF+aov2rxEThRlvv3DUEpjhgLuzJwk3Mcy21GGl0XylxAZvLus0pjagLzFHzqJDy/H1iaC5/cO/bQqSHnbTds2FFD9YJW/YimyuYSAvutbCzvKEM6ty689464LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470055; c=relaxed/simple;
	bh=ZNrs19WXbXf3c8BcGFBvvWk7485+N0i0pb3qke0AdCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gu4BBKjj1+VZP/0WuUJOSmpQWwu34KktNXvR+Qm0GgEfLFpxHCbRtwUV7wwvBpvrc/6PbTEgXobCyqR4oPi/1gMYuaGPJ/ouGOC1U+cTMp2xDUC5rEN6DlrqQgYDaUj0yQkz91naZ6xW5/mY5zXFsUEoGM2l5rtPVawYxyk198M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=znOW7ofQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="znOW7ofQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a51481a598so2673384f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470050; x=1752074850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIzTaynUnodwii+be4z9ccfRn5hxHLnj1WR8qQ5jqUg=;
        b=znOW7ofQpoabMdHtobiVT9zXr8s507TCFeWngz3LApQ+VIRke014N4rOwJBoesZSp+
         pUPyt2MysN80QXARYuCPTIOt76m9SZ3vXNJRjW+vvIPZ9yQQWQCu3s9/Ubin15Fog1PT
         eFfEL6OlHjZEoBJq1jKDYIxNTgE7KJYR61RHbl9aaSpLqkIUwDgtuMWgqtycFlnmuUhf
         BsYz7RIxWD68HnlCaRTns68Tzd7DnTwAmuN0TV0iLYHrHs+UclRufI9M/ecXWQ4wgc7H
         Gc6gg3XjI/wMg6epuHVXkL3qpdXix/vYdkwYKvSsUXiip73LjR8KyZFyh9DKg2lVkIgp
         /QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470050; x=1752074850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIzTaynUnodwii+be4z9ccfRn5hxHLnj1WR8qQ5jqUg=;
        b=kvGUW5c4HW5VQoIvK5t6y1Lxl2P96Wi9tgFGIRCS+TeHMxICVmpg3urFTblHRZHcBP
         EKJFkSZJVHmJdTzAWI/YtAHDD1EqPPuoJahO2OGI8YrJat6aT/yq+fdx0D58wLdRPTox
         zg7l10+wByr7Glk/o/j5s7Q9L3fRbQWrJzvDo5Bnyr8wi0blJ/bzAsdRDyR9n5mtuUAi
         jnLTG7lbqzFS/1+82ktjkRWNGFPLquc0Ha9risB5dFYeNxkav9XZgNHIEwW3SLNLggAq
         eaeKv0INUjdB8m6assdzOtfyZv1gveJ0G5cqk3hTHEBaW8PP3zHCQlN+XRcYNGaTvhtB
         EAXg==
X-Forwarded-Encrypted: i=1; AJvYcCWTS88DGwlR7jKedbN4amLJb7Xoqd+dL7bGNj1taKtXcaAJ2H4NhQ4HJXpTLhsM1+Mwq9xGQakH2XivTk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCvERiRpKd10skPlsbLjJZQQPhlbBaAcKLBNKjp5Mxaa8X1m2
	vI3MFXQ/oqL9hUD8rcbE9ZAi0r//CUhFvjPqnoyeHRSaBvxu03EHWOpTDAYNC91Y0Po=
X-Gm-Gg: ASbGnctYDpR7I+uXRgnxsKuoB64HgfaXkjTzqN6UJTFAGEm6cfLjXdMPUOuFQfM1FF+
	ppy7egNNI7g6UXpKjpxkUl+snCCgAIZ/DmeytttJAGCAdGYhi1Ccv19wngbghX4lUBmwTFI7zIg
	YqfE6WmD5hzNqlKLpDpm3Bus3m6ngcCcaX+9OTeR22q3QmVZHIPSJqBLhI+xtvCPx8sxhucEmM8
	X/u8spQDfKUSrs8yl2wijvMG2aTCsZVTuKRkvqf/yzRUjNIQT5HxSlTM9QMJNXXXzhnkMOzY5EH
	ZrQp98XqUAPR3aPoW+9HQ+V/msgKeGJ1VErJB5zDmEVhWIy1a5VgHLc9q4acYuqXYyjRWgmg0FF
	w
X-Google-Smtp-Source: AGHT+IETEiGm3zFOOgtdRLN+7QC4k4+28PEvFEfcFcVpqekr/FapI6qrJoqscH+sAz/rFycKlggxuw==
X-Received: by 2002:a05:6000:42c8:b0:3a5:8a68:b81b with SMTP id ffacd0b85a97d-3b20110d6eemr1991784f8f.44.1751470050024;
        Wed, 02 Jul 2025 08:27:30 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:14 +0200
Subject: [PATCH 16/26] clk: amlogic: add probe helper for mmio based
 controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-16-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZNrs19WXbXf3c8BcGFBvvWk7485+N0i0pb3qke0AdCY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/F0jD3XQaHm0ZVzgbudKf7GhQakFUk9ZREZ
 5+1cgLPWdWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPxQAKCRDm/A8cN/La
 hbskD/9n3QwiKqzIuzwoX+mGeWr9i/7T99ISAljw5mLqk+sbhjj0PBiKsw1v9hrxu9U8Kh+CEPI
 B+aT6v3yqH2/a+LDzyx+To3+3btNqMtZ3WsrM1R6jVk3E4KMrCgnIJ+t7QCxQ+mhwETim28ENqr
 WJgtQl1TK1sNpWjULaGf4DP5GgLQ5Hi3Axx9LFOzwexGDYjUYIhiBGzpqv8/DmjeRA1kwzgaD+b
 rj/AxWOjJxGtPgSoOI4utu11ObaVXLUwr9nx+Euey11fGoJ4JXZzD1McmS0iwwfotbhYsnIIsSV
 Oziu+GGNBzC01E8vgvorN/20PLUbZCu/wTSMgeplnNvBx2224Jg5sfhrYDA/6sZUYINhAYsShHA
 lndkR8ZDv45SIQsuJz6R9S8inujqCzOEoJmORsojjiqJOaMvbitvjs7LbFqj29fE9R44phlCBTr
 ogWr7KsSHJ+vpEtPL2BvR/PH0xxM2MX0utTfpyvkqqp/Ugj6X9QiuHUNDOcqdPqOVbwem+8rwCD
 lgo13neGmTaR+DDF4Oszz132sCTSH1PzpR50Bf7+BQTOXWpa07b9sbIudV3sQwH56/SzGKQpmpE
 loZ8zoZLDVQ+6hyg+nsByhPJbbHlGnGNJFV6NcpG1tImAHISToLyhq9GOM4QGOm/Sar56/uP0Is
 KsnYM0es4dlW+qQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a 2nd probe function helper for mmio based controllers, which
are getting the memory region from a resource instead of a syscon.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.c | 65 ++++++++++++++++++++++++++++--------
 drivers/clk/meson/meson-clkc-utils.h |  1 +
 2 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 49f562d0f203b9a7d15b5119100216564c10cb21..272b2dd8c95e73e6c021cbf8852dd64733fa00e0 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -26,12 +26,9 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 }
 EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
 
-int meson_clkc_syscon_probe(struct platform_device *pdev)
+static int meson_clkc_init(struct device *dev, struct regmap *map)
 {
 	const struct meson_clkc_data *data;
-	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	struct regmap *map;
 	struct clk_hw *hw;
 	int ret, i;
 
@@ -39,15 +36,6 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 	if (!data)
 		return -EINVAL;
 
-	np = of_get_parent(dev->of_node);
-	map = syscon_node_to_regmap(np);
-	of_node_put(np);
-	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get parent syscon regmap\n");
-		return PTR_ERR(map);
-	}
-
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
@@ -68,8 +56,59 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
+
+int meson_clkc_syscon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct regmap *map;
+
+	np = of_get_parent(dev->of_node);
+	map = syscon_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to get parent syscon regmap\n");
+		return PTR_ERR(map);
+	}
+
+	return meson_clkc_init(dev, map);
+}
 EXPORT_SYMBOL_NS_GPL(meson_clkc_syscon_probe, "CLK_MESON");
 
+static const struct regmap_config base_clkc_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+};
+
+int meson_clkc_mmio_probe(struct platform_device *pdev)
+{
+	const struct meson_clkc_data *data;
+	struct device *dev = &pdev->dev;
+	struct regmap_config regmap_cfg;
+	struct resource *res;
+	void __iomem *base;
+	struct regmap *map;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	memcpy(&regmap_cfg, &base_clkc_regmap_cfg, sizeof(regmap_cfg));
+	regmap_cfg.max_register = resource_size(res) - 4;
+
+	map = devm_regmap_init_mmio(dev, base, &regmap_cfg);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return meson_clkc_init(dev, map);
+}
+EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");
+
 MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 26cd47544302b28ca1a342e178956559a84b152a..b45f85f630d7190fb6509b088f05f17ca91fa1c8 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -25,5 +25,6 @@ struct meson_clkc_data {
 };
 
 int meson_clkc_syscon_probe(struct platform_device *pdev);
+int meson_clkc_mmio_probe(struct platform_device *pdev);
 
 #endif

-- 
2.47.2

