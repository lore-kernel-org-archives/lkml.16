Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80731BF33F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748279675; cv=none; b=ht6xBUUo4qpVItTNQWD74nwpinwLkhTKkdqAI5/NAILSb4FcVuaQyMm5Sp1dDP/0wEKbq0WzlMR95xFlM6n5az6OONwqxuPBIdPRQzl6Ry+9H1MKzeHn84q64AN1puwBYyPcCEn64FxWwiES0yAw/unjZdBMMZ3hr8uwcAGzrqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748279675; c=relaxed/simple;
	bh=KXiqGKoZyH6LuBo66fpOiaE/GV/GU0CXrTONxIFeMBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1R/c2vasa4bqbL6nDOhYUDMTZVmb3jixr/TTK4TQZ0J/eZz/WdAhzEscGF5Zd6+LKEDo2Vli/kLPA5Mcp2GYxmlLsNIncF/NkhaWa1in2jDMx9rfT/p+/aCxs7JK2+pP7LW7lbVjPA8sS2yjsEC8Jtdi+nzAn9b2WN7KA4Jhmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b5hwW2rvszbGf;
	Mon, 26 May 2025 19:05:31 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4b5hwV2x1nz4kJ;
	Mon, 26 May 2025 19:05:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 26 May 2025 19:05:16 +0200
Subject: [PATCH 2/4] mfd: rk8xx-core: allow to customize RK806 reset method
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-rk8xx-rst-fun-v1-2-ea894d9474e0@cherry.de>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
In-Reply-To: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
bitfield for configuring the restart/reset behavior (which I assume
Rockchip calls "function") whenever the PMIC is reset (at least by
software; c.f. DEV_RST in the datasheet).

For RK806, the following values are possible for RST_FUN:

0b00 means "restart PMU"
0b01 means "Reset all the power off reset registers, forcing
	the state to switch to ACTIVE mode"
0b10 means "Reset all the power off reset registers, forcing
	the state to switch to ACTIVE mode, and simultaneously
	pull down the RESETB PIN for 5mS before releasing"
0b11 means the same as for 0b10 just above.

This adds the appropriate logic in the driver to parse the new
rockchip,rst-fun DT property to pass this information.

If it is missing, the register is left untouched and relies either on
the silicon default or on whatever was set earlier in the boot stages
(e.g. the bootloader).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/mfd/rk8xx-core.c  | 15 +++++++++++++++
 include/linux/mfd/rk808.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 71c2b80a4678d627e86cfbec8135f08e262559d3..c59cda7709c01d938870795c55bd1ea2b541b006 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -720,12 +720,27 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 		nr_cells = ARRAY_SIZE(rk805s);
 		break;
 	case RK806_ID:
+		u32 rst_fun;
+
 		rk808->regmap_irq_chip = &rk806_irq_chip;
 		pre_init_reg = rk806_pre_init_reg;
 		nr_pre_init_regs = ARRAY_SIZE(rk806_pre_init_reg);
 		cells = rk806s;
 		nr_cells = ARRAY_SIZE(rk806s);
 		dual_support = IRQF_SHARED;
+
+		ret = device_property_read_u32(dev, "rockchip,rst-fun", &rst_fun);
+		if (ret) {
+			dev_dbg(dev,
+				"rockchip,rst-fun property missing, not setting RST_FUN\n");
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

