Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08115E8B;
	Sat,  7 Jun 2025 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304328; cv=none; b=i9SmJ3Mk0IcOUtn2x29lx7NjIyBmSmv9w54XKVWuCQy2ahIK+PC2BCBR7rSYNnwdgTUejOpaHBx4EJcRNDSc7hPgYyHq4P3Zb7EfCplxwaICuYg1isWnzjWIZWoSVuMaSeTf2QZzhuLxkIS6JUNAbpaAJ6AHqHht2YilVjgZWB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304328; c=relaxed/simple;
	bh=9zSazWezvyHshE0sEu5aQkyy5OabfF5jzCtXfOLRKO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dq2yIlEMmTXepwmOOFcxL7F2/Y/LD1wWKyG+SPWKjP1xePq91SrenRXBR5nIksSBzhtUnzVBKTt2v6oXYoi7BpcSqlHma33Yydp197WflhySPbBDwt6okUKvMr+mnBIu9TeKheCzmwaa3BdHGdQM3CU7IU3J345xwhIsc/BTpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeqQ8Dbh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeqQ8Dbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572F7C4CEE4;
	Sat,  7 Jun 2025 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304327;
	bh=9zSazWezvyHshE0sEu5aQkyy5OabfF5jzCtXfOLRKO4=;
	h=From:To:Cc:Subject:Date:From;
	b=DeqQ8Dbh8aETNHEVlm1+aC3sbVBlmPuB+tlCEUfzmn7hnbp4lwQ0qlz1Me9kqJKJS
	 JXVEuHqU20jWN5lyfpmkdFlvlxQl52a6kdxQOMVoJ48y+oiqITNP8m3Tbd9d1JZZrm
	 sDGltNTz9lqMUZdXi7HmYI8jLwOvuKRLjvU9NmH/MAPJDl7ccTVRqivI4YSrdVs07m
	 Ab7iWNLWVFn2h8zZmRdcl7qDV9BO/GByjn9GWd+yMtSj9qFqxA+2GljoYF/mIAllTh
	 eCVvzPBuzoZrM8/D/1SDeGarVd3zNUengRasMOqk54dIkIZgVJSSvc/Iz1S2avpnVs
	 0+juCQ6rjh36A==
Received: by wens.tw (Postfix, from userid 1000)
	id BA7335FD0C; Sat,  7 Jun 2025 21:52:04 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] pinctrl: sunxi: dt: Consider pin base when calculating bank number from pin
Date: Sat,  7 Jun 2025 21:52:03 +0800
Message-Id: <20250607135203.2085226-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

In prepare_function_table() when the pinctrl function table IRQ entries
are generated, the pin bank is calculated from the absolute pin number;
however the IRQ bank mux array is indexed from the first pin bank of the
controller. For R_PIO controllers, this means the absolute pin bank is
way off from the relative pin bank used for array indexing.

Correct this by taking into account the pin base of the controller.

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 1833078f6877..4e34b0cd3b73 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -143,7 +143,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
  */
 static int prepare_function_table(struct device *dev, struct device_node *pnode,
 				  struct sunxi_desc_pin *pins, int npins,
-				  const u8 *irq_bank_muxes)
+				  unsigned pin_base, const u8 *irq_bank_muxes)
 {
 	struct device_node *node;
 	struct property *prop;
@@ -166,7 +166,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 */
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
-		int bank = pin->pin.number / PINS_PER_BANK;
+		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
 
 		if (irq_bank_muxes[bank]) {
 			pin->variant++;
@@ -211,7 +211,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	last_bank = 0;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
-		int bank = pin->pin.number / PINS_PER_BANK;
+		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
 		int lastfunc = pin->variant + 1;
 		int irq_mux = irq_bank_muxes[bank];
 
@@ -353,7 +353,7 @@ int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
 		return PTR_ERR(pins);
 
 	ret = prepare_function_table(&pdev->dev, pnode, pins, desc->npins,
-				     irq_bank_muxes);
+				     desc->pin_base, irq_bank_muxes);
 	if (ret)
 		return ret;
 
-- 
2.39.5

