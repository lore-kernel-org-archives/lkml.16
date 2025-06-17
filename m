Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467482EE287;
	Tue, 17 Jun 2025 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177570; cv=none; b=swdGnaIuTtDJuLKp31GK7UCEo2HgWw2Da88sB7S/9YORgAIXpcI1eTm1zdZgI3JjZfAJuRQ4RJ80ZLCYDLVSh3xLDXS4NsfSM81ubRJngFZB+9U2GoNtPqaNKSSBCWibpeO6JclFcBnQuXwfKN2HAce2913hwOZDSiVAKECxZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177570; c=relaxed/simple;
	bh=yLdR6mHtlRPoNVFrYNKreCLkJDkwlDyjW2OgdjtFUl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdTvhIfHg1nVKl6PJrvr1ecKpfzY2lCJE51pKc0Cu8wvzludPyX6EY5v0+I1lxOinder2v572uexXCnvQvd9KjY4y3G3j9l3GJ+e7YTBqVjCiVQM7VFvZp7CLOArDhzbyycnWFBlzVb3cKzbo1drg01JlX9hN+8i4r9duCwJBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=d9d4km66; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="d9d4km66"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 059FE25CF4;
	Tue, 17 Jun 2025 18:26:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTuHbFsScbuO; Tue, 17 Jun 2025 18:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177565; bh=yLdR6mHtlRPoNVFrYNKreCLkJDkwlDyjW2OgdjtFUl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d9d4km66jUCy0m2MsRGR7IloQFTD4qraGHLC8/h7D/wadR/GGu9em9PsKPvQO/84n
	 hDajqPqGQ3AznBACjPQ/bvlKb0vcToA0hMRStK/TtyFVUX9WtjJPEy2CnyM3kqpCjh
	 rs+mvRqWzu7NQq68kQWe9nsUytNe1Q3rMJwiwDE/FFyQRnm2d8s8WrokY/n9AYrMWw
	 gxKQ79x0uAQOvIpB2BHjKLUz6Ah7gesVlpsf6L2TWxYh54HJzCYf8UujQ3vnTopbG6
	 LL+bRLI6k4ZvUv6U3lCYG+7QJnEiQU76gkXoS51kSBsbZZ3TJf0FEoFvGZVmT8Vc3j
	 4wo7Smn4Vf6GQ==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 5/8] clk: loongson2: Avoid hardcoding firmware name of the reference clock
Date: Tue, 17 Jun 2025 16:24:23 +0000
Message-ID: <20250617162426.12629-6-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
References: <20250617162426.12629-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Loongson 2K0300 requires a reference clock with a frequency different
from previous SoCs (120MHz v.s. 100MHz), thus hardcoding the firmware
name of the reference clock as ref_100m isn't a good idea.

This patch retrives the clock name of the reference clock dynamically
during probe, avoiding the hardcoded pdata structure and preparing for
support of future SoCs.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 7a916c7d2718..52a9f1c2794a 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -13,10 +13,6 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <dt-bindings/clock/loongson,ls2k-clk.h>
 
-static const struct clk_parent_data pdata[] = {
-	{ .fw_name = "ref_100m", },
-};
-
 enum loongson2_clk_type {
 	CLK_TYPE_PLL,
 	CLK_TYPE_SCALE,
@@ -275,7 +271,8 @@ static const struct clk_ops loongson2_freqscale_recalc_ops = {
 	.recalc_rate = loongson2_freqscale_recalc_rate,
 };
 
-static struct clk_hw *loongson2_clk_register(struct loongson2_clk_provider *clp,
+static struct clk_hw *loongson2_clk_register(const char *parent,
+					     struct loongson2_clk_provider *clp,
 					     const struct loongson2_clk_board_info *cld,
 					     const struct clk_ops *ops)
 {
@@ -292,11 +289,7 @@ static struct clk_hw *loongson2_clk_register(struct loongson2_clk_provider *clp,
 	init.ops   = ops;
 	init.flags = 0;
 	init.num_parents = 1;
-
-	if (!cld->parent_name)
-		init.parent_data = pdata;
-	else
-		init.parent_names = &cld->parent_name;
+	init.parent_names = &parent;
 
 	clk->reg	= clp->base + cld->reg_offset;
 	clk->div_shift	= cld->div_shift;
@@ -321,11 +314,17 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct loongson2_clk_provider *clp;
 	const struct loongson2_clk_board_info *p, *data;
+	const char *refclk_name, *parent_name;
 
 	data = device_get_match_data(dev);
 	if (!data)
 		return -EINVAL;
 
+	refclk_name = of_clk_get_parent_name(dev->of_node, 0);
+	if (IS_ERR(refclk_name))
+		return dev_err_probe(dev, PTR_ERR(refclk_name),
+				     "failed to get refclk name\n");
+
 	for (p = data; p->name; p++)
 		clks_num = max(clks_num, p->id + 1);
 
@@ -347,18 +346,20 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < clks_num; i++) {
 		p = &data[i];
+		parent_name = p->parent_name ? p->parent_name : refclk_name;
+
 		switch (p->type) {
 		case CLK_TYPE_PLL:
-			hw = loongson2_clk_register(clp, p,
+			hw = loongson2_clk_register(parent_name, clp, p,
 						    &loongson2_pll_recalc_ops);
 			break;
 		case CLK_TYPE_SCALE:
-			hw = loongson2_clk_register(clp, p,
+			hw = loongson2_clk_register(parent_name, clp, p,
 						    &loongson2_freqscale_recalc_ops);
 			break;
 		case CLK_TYPE_DIVIDER:
 			hw = devm_clk_hw_register_divider(dev, p->name,
-							  p->parent_name, 0,
+							  parent_name, 0,
 							  clp->base + p->reg_offset,
 							  p->div_shift, p->div_width,
 							  CLK_DIVIDER_ONE_BASED |
@@ -366,15 +367,15 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 							  &clp->clk_lock);
 			break;
 		case CLK_TYPE_GATE:
-			hw = devm_clk_hw_register_gate(dev, p->name, p->parent_name,
+			hw = devm_clk_hw_register_gate(dev, p->name, parent_name,
 						       p->flags,
 						       clp->base + p->reg_offset,
 						       p->bit_idx, 0,
 						       &clp->clk_lock);
 			break;
 		case CLK_TYPE_FIXED:
-			hw = devm_clk_hw_register_fixed_rate_parent_data(dev, p->name, pdata,
-									 0, p->fixed_rate);
+			hw = devm_clk_hw_register_fixed_rate(dev, p->name, parent_name,
+							     0, p->fixed_rate);
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "Invalid clk type\n");
-- 
2.49.0

