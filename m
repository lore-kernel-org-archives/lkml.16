Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F72288EA;
	Fri, 23 May 2025 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997236; cv=none; b=lsjRdics8FAZoaRodmlwwa2VIxn+Kbssd6cOY6A+g2/gKxK11xhj8Z5vsiS7glbx0+tPxEV5kUHkMrz/navKwRC7j/85APwOq6UUAEUIaxYsiqaZAxuTsLjUW7o34IUAoCbJIdCf9SD4fnpp7xrxX2J/ppFbw1mVSpxyTuk4hjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997236; c=relaxed/simple;
	bh=yLdR6mHtlRPoNVFrYNKreCLkJDkwlDyjW2OgdjtFUl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8H3r7qxX3ERZ/fi1ruObM2KHZJT81RNTS10YOL31KtEAUk99fmoXnDQFYNkavZVJaTAxQUFIWKyQekPQC3lRZ567ob/NcejiVJrcowH66DXwi9bKOq3ncPS9fs+UTj7nehwvGXejaqVSXGFOWyDAXR6QhElPl56rkD51uIaS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bYxwD8zi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bYxwD8zi"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ED65425C17;
	Fri, 23 May 2025 12:47:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMg94BEd1Z2s; Fri, 23 May 2025 12:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997231; bh=yLdR6mHtlRPoNVFrYNKreCLkJDkwlDyjW2OgdjtFUl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bYxwD8zitxVOMOnC6g89GONDR5pcOSLwQkgfRyJIMTVed29mUC76i4DtgWQb6ldTW
	 Da6J4+ZqvIrGc6Pv8zO1JsAnHwGcV5sHrFA4j7tZpy4Zk+BtvrKqt0bxLrg4v9npC/
	 X4f1qCcruPD586j966aeWNPO1omkAgJqJV2qo8f7TbA9JoxnRa4E7DWPXp1P7vUFeh
	 Wc5NZJqdAmyppE4OzxFMZUyva29ElH/DBWGzd0nagVmZAyi56T8ORNlD1EperSR4DR
	 s8+NIYbqRypTwu3zdO7pmzLN4AB/xS/Xw9abEBPkzwO1qxGx3BgMT/VQFg9zoDQEu1
	 Ipr+c6r6mJ8KQ==
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
Subject: [PATCH 5/8] clk: loongson2: Avoid hardcoding firmware name of the reference clock
Date: Fri, 23 May 2025 10:45:49 +0000
Message-ID: <20250523104552.32742-6-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
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

