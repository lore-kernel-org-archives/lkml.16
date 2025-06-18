Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7CA2853EA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242784; cv=none; b=oqJcrQ7PU8HuvKL+PwUoLyNnf394VBSmpWtw95cjVnTuM+gTY54AxKyAQic//EVdnq+obQBwm1ukWu7tFJPUj3jynUkGwQvk4VRhz1uh3jcyrT24JAlZBtTVwkeQz7/MGeMEJWQLU7aHje4JxKGJAIARWcZNdUNbWGUisgwT8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242784; c=relaxed/simple;
	bh=JBkpxoyT5v1IbA+uLv9HPXauX+GuC5wmK9X1e4m0jJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cL6iY9vZyR4SF59PpeQq6h2B+QG/14zfQ6j3KQypgDLv8FQEPVenyXko+Ln1Uq/MOn1TZfFFiITyVYuniK9iOTIMUXUoQKnQnoUnp1nhmuMUqIeKsV8ZeANOsmyC3bAbGZCJDF4mLhaQgEfVkrpBF+0g1PNl+nEodWq4njMdTBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMg6v3B7xzS5N;
	Wed, 18 Jun 2025 12:32:55 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMg6t5YZpzCTr;
	Wed, 18 Jun 2025 12:32:54 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 18 Jun 2025 12:32:41 +0200
Subject: [PATCH v3 2/5] mfd: rk8xx-core: allow to customize RK806 reset
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-rk8xx-rst-fun-v3-2-081f02d3d348@cherry.de>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
In-Reply-To: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC has a bitfield for configuring the restart/reset behavior
(which I assume Rockchip calls "function") whenever the PMIC is reset
either programmatically (c.f. DEV_RST in the datasheet) or via PWRCTRL
or RESETB pins.

For RK806, the following values are possible for RST_FUN:

0b00 means "restart PMU"
0b01 means "Reset all the power off reset registers, forcing
	the state to switch to ACTIVE mode"
0b10 means "Reset all the power off reset registers, forcing
	the state to switch to ACTIVE mode, and simultaneously
	pull down the RESETB PIN for 5mS before releasing"
0b11 means the same as for 0b10 just above.

This adds the appropriate logic in the driver to parse the new
rockchip,reset-mode DT property to pass this information. It just
happens that the values in the binding match the values to write in the
bitfield so no mapping is necessary.

If it is missing, the register is left untouched and relies either on
the silicon default or on whatever was set earlier in the boot stages
(e.g. the bootloader).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/mfd/rk8xx-core.c  | 15 +++++++++++++++
 include/linux/mfd/rk808.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 71c2b80a4678d627e86cfbec8135f08e262559d3..23ff92f89f3357e3f47c5dd0e9f80cca453f22c0 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -10,6 +10,7 @@
  * Author: Wadim Egorov <w.egorov@phytec.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/rk808.h>
 #include <linux/mfd/core.h>
@@ -699,6 +700,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	const struct mfd_cell *cells;
 	int dual_support = 0;
 	int nr_pre_init_regs;
+	u32 rst_fun = 0;
 	int nr_cells;
 	int ret;
 	int i;
@@ -726,6 +728,19 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 		cells = rk806s;
 		nr_cells = ARRAY_SIZE(rk806s);
 		dual_support = IRQF_SHARED;
+
+		ret = device_property_read_u32(dev, "rockchip,reset-mode", &rst_fun);
+		if (ret) {
+			dev_dbg(dev,
+				"rockchip,reset-mode property missing, not setting RST_FUN\n");
+			break;
+		}
+
+		ret = regmap_update_bits(rk808->regmap, RK806_SYS_CFG3,
+					 RK806_RST_FUN_MSK,
+					 FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
+		if (ret)
+			return dev_err_probe(dev, ret, "RST_FUN write err\n");
 		break;
 	case RK808_ID:
 		rk808->regmap_irq_chip = &rk808_irq_chip;
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 69cbea78b430b562a23d995263369d475daa6287..28170ee08898ca59c76a741a1d42763a42b72380 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -812,6 +812,8 @@ enum rk806_pin_dr_sel {
 #define RK806_INT_POL_H			BIT(1)
 #define RK806_INT_POL_L			0
 
+/* SYS_CFG3 */
+#define RK806_RST_FUN_MSK		GENMASK(7, 6)
 #define RK806_SLAVE_RESTART_FUN_MSK	BIT(1)
 #define RK806_SLAVE_RESTART_FUN_EN	BIT(1)
 #define RK806_SLAVE_RESTART_FUN_OFF	0

-- 
2.49.0

