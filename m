Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C280286413;
	Fri,  4 Jul 2025 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643700; cv=none; b=cve3pf/oJuXvZ3eN2J+I6S/U9AWfRtwSdcJJnJ76CV4M9Mvnl7ZRGHRXPknld0M9PSYNeZm1C1PQiqgPPIzbrBEpP/n6IRyKPA9ujkGnzG87KafXPPIZkAXFXRWoSvHmc/0Up0TcICOpziGkuJZSmH+Ew/l0R9FGLsr9+B39eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643700; c=relaxed/simple;
	bh=TPsN4jIDaCqGcxQvwW7smz2AHs80b+pwC6XHk4Ve0eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMKAaXHia/mLs9bZjVvg/E0UcmWOnT2kksskGqJ1+SXlu+RPaKFaWUl2OFNpRSmVQKaRZ4opoeHGZlHJ6+bsimSqyd+I+uZ69ct0RoB7ITcgkF0fYBfbi6lOD98+Kh/DMSDY/bCmSnVpPL/xv0UBEVAf4Z2aW3pR27EOvW5bUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 558C51F00036;
	Fri,  4 Jul 2025 15:41:34 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CACBEACA649; Fri,  4 Jul 2025 15:41:29 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 8BD7DACA63A;
	Fri,  4 Jul 2025 15:40:12 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/2] clk: sunxi-ng: v3s: Assign the de and tcon clocks to the video pll
Date: Fri,  4 Jul 2025 17:40:08 +0200
Message-ID: <20250704154008.3463257-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154008.3463257-1-paulk@sys-base.io>
References: <20250704154008.3463257-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears (based on experimentation) that both the de and tcon clocks
need to have the same parent for the two units to work together.

Assign them both to the video pll by manually clearing the parent
selection bits (effectively setting index 0) and marking the clocks
with the CLK_SET_RATE_NO_REPARENT flag, which ensures that they will
never use a different parent.

The video pll is also a possible parent for the camera subsystem,
but it can use the dedicated isp pll if needed so there should be
no negative side-effect due to this change.

Note that ccu_mux_helper_set_parent cannot be used at this stage as
it requires the clock driver to be initialized and this configuration
is best done before the clock driver is available to consumers.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index df345a620d8d..05595ac51b76 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -347,11 +347,13 @@ static SUNXI_CCU_GATE(dram_ohci_clk,	"dram-ohci",	"dram",
 
 static const char * const de_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
-				 0x104, 0, 4, 24, 3, BIT(31), 0);
+				 0x104, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_NO_REPARENT);
 
 static const char * const tcon_parents[] = { "pll-video", "pll-periph0" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
-				 0x118, 0, 4, 24, 3, BIT(31), 0);
+				 0x118, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_NO_REPARENT);
 
 static SUNXI_CCU_GATE(csi_misc_clk,	"csi-misc",	"osc24M",
 		      0x130, BIT(31), 0);
@@ -753,6 +755,21 @@ static int sun8i_v3s_ccu_probe(struct platform_device *pdev)
 	val &= ~GENMASK(19, 16);
 	writel(val, reg + SUN8I_V3S_PLL_AUDIO_REG);
 
+	/*
+	 * Assign the DE and TCON clock to the video PLL. Both clocks need to
+	 * have the same parent for the units to work together.
+	 */
+
+	val = readl(reg + de_clk.common.reg);
+	val &= ~GENMASK(de_clk.mux.shift + de_clk.mux.width - 1,
+			de_clk.mux.shift);
+	writel(val, reg + de_clk.common.reg);
+
+	val = readl(reg + tcon_clk.common.reg);
+	val &= ~GENMASK(tcon_clk.mux.shift + tcon_clk.mux.width - 1,
+			tcon_clk.mux.shift);
+	writel(val, reg + tcon_clk.common.reg);
+
 	return devm_sunxi_ccu_probe(&pdev->dev, reg, desc);
 }
 
-- 
2.49.0

