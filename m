Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0741C5D7B;
	Fri, 23 May 2025 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997289; cv=none; b=DIIRYVH1BUTUeim8ok1RhMBfYRq4Z0C6nhnPEv38utGy6L7nRNGj6InLUHTGm6dkujQuj55PzClmQurhdv7XlFXFqNJXcupYIPHCPgSTPwfyLAu8HtN6AW3ubpLhvbmg4aXczlfER1FMgIDz0/wjwA7XTqyhLi8VGA3AkcNHXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997289; c=relaxed/simple;
	bh=gcYtgfygnQQQpxyGja4Ww0pSmxn9UnF2hNVedw7xXtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGxisiO+IcfzonbrnJDPLEvvqBYriwyG9RNe/3OT8R46LrV0KKJCYcFykZ9T+QWXCbhkvE7TJLngaZlr+iSR3g9Xn8fDDK9XBwPzyk4fHE1oXhu00BPHYMA0Hx8xWeVUc0vXveb+mG2E/BEkBudDHi8I4i40UD5YYecUGmAkN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QV4uzwEk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QV4uzwEk"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E59AE25F0B;
	Fri, 23 May 2025 12:48:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H16zQKtTlpA6; Fri, 23 May 2025 12:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997286; bh=gcYtgfygnQQQpxyGja4Ww0pSmxn9UnF2hNVedw7xXtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QV4uzwEkguPQFW/rEjH/hp8hz6wUIWv3Qj3RjOcytpYvgugTIUv+dnitlbl5B/nPz
	 bdVa6AYBxMPh1pw7bt82Z0esgi7DUWQH8NVH9UllgRysLG5Hb8T3Mz2cG8t6DVYh7o
	 mOonJYvWKofw00hLkouLUhhFqKafE5Y/91165feaJdX9NZY3rmsBJPhN3MiTe4jglC
	 2yBgK9ZFejgj3/U75/iG3pA0cBESTEJFefRbrPZAkl73ATHZiwt8vKZlJqISY3VgTi
	 KtRwZL4o4/G6M0tvpN3PzqYtzBTourzZ/evbfcoZuxedv5uh5sFfuoJ51eqyh02+V4
	 FZH4egyMoiKOQ==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 6/8] clk: loongson2: Add clock definitions for Loongson 2K0300 SoC
Date: Fri, 23 May 2025 10:45:50 +0000
Message-ID: <20250523104552.32742-7-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock controller of Loongson 2K0300 consists of three PLLs, requires
an 120MHz external reference clock to function, and generates clocks in
various frequencies for SoC peripherals.

Clock definitions for previous SoC generations could be reused for most
clock hardwares. There're two gates marked as critical, clk_node_gate
and clk_boot_gate, which supply the CPU cores and the system
configuration bus. Disabling them leads to a SoC hang.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 52a9f1c2794a..1d210a7683ea 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <dt-bindings/clock/loongson,ls2k-clk.h>
+#include <dt-bindings/clock/loongson,ls2k0300-clk.h>
 
 enum loongson2_clk_type {
 	CLK_TYPE_PLL,
@@ -137,6 +138,52 @@ struct loongson2_clk_board_info {
 		.fixed_rate	= _rate,			\
 	}
 
+static const struct loongson2_clk_board_info ls2k0300_clks[] = {
+	/* Reference Clock */
+	CLK_PLL(LS2K0300_PLL_NODE, "pll_node",   0x00, 15, 9, 8, 7),
+	CLK_PLL(LS2K0300_PLL_DDR,  "pll_ddr",    0x08, 15, 9, 8, 7),
+	CLK_PLL(LS2K0300_PLL_PIX,  "pll_pix",    0x10, 15, 9, 8, 7),
+	CLK_FIXED(LS2K0300_CLK_STABLE, "clk_stable", NULL, 100000000),
+	CLK_FIXED(LS2K0300_CLK_THSENS, "clk_thsens", NULL, 10000000),
+	/* Node PLL */
+	CLK_DIV(LS2K0300_CLK_NODE_DIV, "clk_node_div", "pll_node", 0x00, 24, 7),
+	CLK_DIV(LS2K0300_CLK_GMAC_DIV, "clk_gmac_div", "pll_node", 0x04, 0, 7),
+	CLK_DIV(LS2K0300_CLK_I2S_DIV,  "clk_i2s_div",  "pll_node", 0x04, 8, 7),
+	CLK_GATE(LS2K0300_CLK_NODE_PLL_GATE,   "clk_node_pll_gate", "clk_node_div", 0x00, 0),
+	CLK_GATE(LS2K0300_CLK_GMAC_GATE,       "clk_gmac_gate",	    "clk_gmac_div", 0x00, 1),
+	CLK_GATE(LS2K0300_CLK_I2S_GATE,        "clk_i2s_gate",	    "clk_i2s_div", 0x00, 2),
+	CLK_GATE_FLAGS(LS2K0300_CLK_NODE_GATE, "clk_node_gate",	    "clk_node_scale",
+		       0x24, 0, CLK_IS_CRITICAL),
+	CLK_SCALE_MODE(LS2K0300_CLK_NODE_SCALE,    "clk_node_scale",    "clk_node_pll_gate",
+		       0x20, 0, 3, 3),
+	/* DDR PLL */
+	CLK_DIV(LS2K0300_CLK_DDR_DIV, "clk_ddr_div", "pll_ddr", 0x08, 24, 7),
+	CLK_DIV(LS2K0300_CLK_NET_DIV, "clk_net_div", "pll_ddr", 0x0c, 0, 7),
+	CLK_DIV(LS2K0300_CLK_DEV_DIV, "clk_dev_div", "pll_ddr", 0x0c, 8, 7),
+	CLK_GATE(LS2K0300_CLK_NET_GATE,		"clk_net_gate", "clk_net_div", 0x08, 1),
+	CLK_GATE(LS2K0300_CLK_DEV_GATE,		"clk_dev_gate",	"clk_dev_div", 0x08, 2),
+	CLK_GATE_FLAGS(LS2K0300_CLK_DDR_GATE,	"clk_ddr_gate",	"clk_ddr_div",
+		       0x08, 0, CLK_IS_CRITICAL),
+	/* PIX PLL */
+	CLK_DIV(LS2K0300_CLK_PIX_DIV,	 "clk_pix_div",	   "pll_pix", 0x10, 24, 7),
+	CLK_DIV(LS2K0300_CLK_GMACBP_DIV, "clk_gmacbp_div", "pll_pix", 0x14, 0, 7),
+	CLK_GATE(LS2K0300_CLK_PIX_PLL_GATE, "clk_pix_pll_gate",	"clk_pix_div", 0x10, 0),
+	CLK_GATE(LS2K0300_CLK_PIX_GATE,	    "clk_pix_gate",	"clk_pix_scale", 0x24, 6),
+	CLK_GATE(LS2K0300_CLK_GMACBP_GATE,  "clk_gmacbp_gate",	"clk_gmacbp_div", 0x10, 1),
+	CLK_SCALE_MODE(LS2K0300_CLK_PIX_SCALE,	"clk_pix_scale",	"clk_pix_pll_gate",
+		       0x20, 4, 3, 7),
+	/* clk_dev_gate */
+	CLK_DIV(LS2K0300_CLK_SDIO_SCALE, "clk_sdio_scale", "clk_dev_gate", 0x20, 24, 4),
+	CLK_GATE(LS2K0300_CLK_USB_GATE,	 "clk_usb_gate",	"clk_usb_scale", 0x24, 2),
+	CLK_GATE(LS2K0300_CLK_SDIO_GATE, "clk_sdio_gate",	"clk_sdio_scale", 0x24, 4),
+	CLK_GATE(LS2K0300_CLK_APB_GATE,  "clk_apb_gate",	"clk_apb_scale", 0x24, 3),
+	CLK_GATE_FLAGS(LS2K0300_CLK_BOOT_GATE, "clk_boot_gate",	"clk_boot_scale",
+		       0x24, 1, CLK_IS_CRITICAL),
+	CLK_SCALE_MODE(LS2K0300_CLK_USB_SCALE,  "clk_usb_scale",  "clk_dev_gate", 0x20, 12, 3, 15),
+	CLK_SCALE_MODE(LS2K0300_CLK_APB_SCALE,  "clk_apb_scale",  "clk_dev_gate", 0x20, 16, 3, 19),
+	CLK_SCALE_MODE(LS2K0300_CLK_BOOT_SCALE, "clk_boot_scale", "clk_dev_gate", 0x20, 8, 3, 11),
+};
+
 static const struct loongson2_clk_board_info ls2k0500_clks[] = {
 	CLK_PLL(LOONGSON2_NODE_PLL,   "pll_node", 0,    16, 8, 8, 6),
 	CLK_PLL(LOONGSON2_DDR_PLL,    "pll_ddr",  0x8,  16, 8, 8, 6),
@@ -393,6 +440,7 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson2_clk_match_table[] = {
+	{ .compatible = "loongson,ls2k0300-clk", .data = &ls2k0300_clks },
 	{ .compatible = "loongson,ls2k0500-clk", .data = &ls2k0500_clks },
 	{ .compatible = "loongson,ls2k-clk", .data = &ls2k1000_clks },
 	{ .compatible = "loongson,ls2k2000-clk", .data = &ls2k2000_clks },
-- 
2.49.0

