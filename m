Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B25C215046;
	Mon, 26 May 2025 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269903; cv=none; b=cXNO84mKobaGFVyefpm0rAxMIFeuDIBRnvxEOruG0xArEwiOpsHe0rSut6E1xp3usUODrd/TBIyDX6MEgfR5hEhPuxKZiwG/AIgZVHKoCY9qqTHDPb2cNgP5mYM4yN0St0j2qtXm1H8IK7uytytUQmpxIWyqWqO2RsCGnBhzefo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269903; c=relaxed/simple;
	bh=hO/A14lMsLJDpddYEzwZdSOtnCM4oAVIXnEqaKE4fpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdVTdXGeMH+q6z147VlRS6MdjZMIuhAHLrFp1+KtUtSfoW4rTpHz/wyVOlFu8XFNcVBJy2Wg5EA4DiBj4GNhyPC7SVgfq/uL81wIB9JN5IuMk1KdId1XYti5c+k/dGINkD+gQ9oGIe8QUz0ILrRn+HuiGwgHMfis/NLCNcK1eWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1670631ff;
	Mon, 26 May 2025 22:31:32 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:31:02 +0800
Subject: [PATCH v4 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-k1-usb3-phy-v2-v4-4-eca668fc16a2@whut.edu.cn>
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748269870; l=9624;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=hO/A14lMsLJDpddYEzwZdSOtnCM4oAVIXnEqaKE4fpU=;
 b=b8rkMeg97iPlL1x51tCGSbOIisf8RItTi9NizDkkvE9XlLRQX71NH7fq0bOkUC5Ehdh+UcIUC
 I8j3CGTAAJtCYP0wH/odZsoB27UWmr2485k9B9gadcszR6zzx6lyUtG
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT00eVkxDQ0tOGk8eSkgdTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d01856303a1kunm41fed85011aa0
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxA6HTo6EzE*KgwrTzYVFSNP
	KTAKCixVSlVKTE9DSU1CQ0JDS0JLVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFKSktLSjcG

Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY which
implements PIPE3(125MHz) interface for USB3.0. Currently, only USB mode
is supported; PCIe support is not included in this change.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/phy/spacemit/Kconfig          |   8 +
 drivers/phy/spacemit/Makefile         |   1 +
 drivers/phy/spacemit/phy-k1-combphy.c | 266 ++++++++++++++++++++++++++++++++++
 3 files changed, 275 insertions(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 0136aee2e8a2f5f484da136b26f80130794b992c..ccc6bf9ea49f4988a27f79a4dcd024b18cbd78b0 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -11,3 +11,11 @@ config PHY_SPACEMIT_K1_USB2
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
+
+config PHY_SPACEMIT_K1_COMBPHY
+	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
+	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
index fec0b425a948541b39b814caef0b05e1e002d92f..1fd0c65f2c5cd10ea2f70e43e62c70588d1ffae9 100644
--- a/drivers/phy/spacemit/Makefile
+++ b/drivers/phy/spacemit/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_SPACEMIT_K1_COMBPHY)	+= phy-k1-combphy.o
 obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit/phy-k1-combphy.c
new file mode 100644
index 0000000000000000000000000000000000000000..227b1c743f4d981b3d4555c871ef397c1c8df0b5
--- /dev/null
+++ b/drivers/phy/spacemit/phy-k1-combphy.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K1 PCIE/USB3 PHY driver
+ *
+ * This driver supports the combo PHY found on Spacemit K1 SoC, which integrates
+ * a dual-mode USB3/PCIe PHY shared between the USB3.0 DRD controller and PCIe
+ * PortA. But only one mode can work at any given application scenario.
+ *
+ * PCIe mode is not supported yet and any attempt to use the PHY in PCIe mode
+ * will result in an error.
+ *
+ * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/usb/of.h>
+
+#define COMBPHY_USB_REG1		0x68
+#define  COMBPHY_USB_REG1_VAL		0x00
+#define COMBPHY_USB_REG2		0x48
+#define  COMBPHY_USB_REG2_VAL		0x603a2276
+#define COMBPHY_USB_REG3		0x08
+#define  COMBPHY_USB_REG3_VAL		0x97c
+#define COMBPHY_USB_REG4		0x18
+#define  COMBPHY_USB_REG4_VAL		0x00
+#define  COMBPHY_USB_TERM_SHORT_MASK	0x3000
+#define  COMBPHY_USB_TERM_SHORT_VAL	0x3000
+#define COMBPHY_USB_PLL_REG		0x08
+#define  COMBPHY_USB_PLL_MASK		0x01
+#define  COMBPHY_USB_PLL_VAL		0x01
+#define COMBPHY_USB_LFPS_REG		0x58
+#define  COMBPHY_USB_LFPS_MASK		0x700
+#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
+
+#define COMBPHY_MODE_SEL_MASK	BIT(3)
+#define COMBPHY_MODE_USB	BIT(3)
+#define COMBPHY_WAIT_TIMEOUT	1000
+
+struct spacemit_combphy_priv {
+	struct device *dev;
+	struct phy *phy;
+	struct reset_control *phy_rst;
+	struct regmap *regmap_ctrl;
+	struct regmap *regmap_sel;
+	bool rx_always_on;
+	u8 lfps_threshold;
+	u8 type;
+};
+
+static const struct regmap_config phy_ctrl_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x800,
+};
+
+static const struct regmap_config phy_sel_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x400,
+};
+
+static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
+{
+	struct regmap *map = priv->regmap_sel;
+	int ret = 0;
+
+	switch (priv->type) {
+	case PHY_TYPE_USB3:
+		regmap_update_bits(map, 0, COMBPHY_MODE_SEL_MASK, COMBPHY_MODE_USB);
+		break;
+	default:
+		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
+{
+	struct regmap *map = priv->regmap_ctrl;
+	u32 reg_val;
+	int ret;
+
+	regmap_write(map, COMBPHY_USB_REG1, COMBPHY_USB_REG1_VAL);
+	regmap_write(map, COMBPHY_USB_REG2, COMBPHY_USB_REG2_VAL);
+	regmap_write(map, COMBPHY_USB_REG3, COMBPHY_USB_REG3_VAL);
+	regmap_write(map, COMBPHY_USB_REG4, COMBPHY_USB_REG4_VAL);
+
+	ret = regmap_read_poll_timeout(map, COMBPHY_USB_PLL_REG, reg_val,
+				       (reg_val & COMBPHY_USB_PLL_MASK) == COMBPHY_USB_PLL_VAL,
+				       1000, COMBPHY_WAIT_TIMEOUT * 1000);
+	if (ret) {
+		dev_err(priv->dev, "USB3 PHY init timeout!\n");
+		return ret;
+	}
+
+	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
+	regmap_update_bits(map, COMBPHY_USB_LFPS_REG,
+			   COMBPHY_USB_LFPS_MASK,
+			   priv->lfps_threshold << 8);
+
+	if (priv->rx_always_on)
+		regmap_update_bits(map, COMBPHY_USB_REG4,
+				   COMBPHY_USB_TERM_SHORT_MASK,
+				   COMBPHY_USB_TERM_SHORT_VAL);
+
+	return ret;
+}
+
+static int spacemit_combphy_init(struct phy *phy)
+{
+	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = spacemit_combphy_set_mode(priv);
+	if (ret) {
+		dev_err(priv->dev, "failed to set mode for PHY type %x\n",
+			priv->type);
+		goto out;
+	}
+
+	ret = reset_control_deassert(priv->phy_rst);
+	if (ret) {
+		dev_err(priv->dev, "failed to deassert rst\n");
+		goto err_rst;
+	}
+
+	switch (priv->type) {
+	case PHY_TYPE_USB3:
+		ret = spacemit_combphy_init_usb(priv);
+		break;
+	default:
+		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		goto err_rst;
+
+	return 0;
+
+err_rst:
+	reset_control_assert(priv->phy_rst);
+out:
+	return ret;
+}
+
+static int spacemit_combphy_exit(struct phy *phy)
+{
+	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
+
+	reset_control_assert(priv->phy_rst);
+
+	return 0;
+}
+
+static struct phy *spacemit_combphy_xlate(struct device *dev,
+					  const struct of_phandle_args *args)
+{
+	struct spacemit_combphy_priv *priv = dev_get_drvdata(dev);
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (priv->type != PHY_NONE && priv->type != args->args[0])
+		dev_warn(dev, "PHY type %d is selected to override %d\n",
+			 args->args[0], priv->type);
+
+	priv->type = args->args[0];
+
+	if (args->args_count > 1)
+		dev_dbg(dev, "combo phy idx: %d selected",  args->args[1]);
+
+	return priv->phy;
+}
+
+static const struct phy_ops spacemit_combphy_ops = {
+	.init = spacemit_combphy_init,
+	.exit = spacemit_combphy_exit,
+	.owner = THIS_MODULE,
+};
+
+static int spacemit_combphy_probe(struct platform_device *pdev)
+{
+	struct spacemit_combphy_priv *priv;
+	void __iomem *ctrl_base, *sel_base;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
+	if (IS_ERR(ctrl_base))
+		return PTR_ERR(ctrl_base);
+
+	priv->regmap_ctrl = devm_regmap_init_mmio(dev, ctrl_base, &phy_ctrl_regmap_config);
+	if (IS_ERR(priv->regmap_ctrl))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap_ctrl),
+				     "Failed to init regmap for ctrl\n");
+
+	sel_base = devm_platform_ioremap_resource_byname(pdev, "sel");
+	if (IS_ERR(sel_base))
+		return PTR_ERR(sel_base);
+
+	priv->regmap_sel = devm_regmap_init_mmio(dev, sel_base, &phy_sel_regmap_config);
+	if (IS_ERR(priv->regmap_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap_sel),
+				     "Failed to init regmap for sel\n");
+
+	priv->lfps_threshold = COMBPHY_USB_LFPS_THRES_DEFAULT;
+	device_property_read_u8(&pdev->dev, "spacemit,lfps-threshold", &priv->lfps_threshold);
+
+	priv->rx_always_on = device_property_read_bool(&pdev->dev, "spacemit,rx-always-on");
+	priv->type = PHY_NONE;
+	priv->dev = dev;
+
+	priv->phy_rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->phy_rst))
+		return dev_err_probe(dev, PTR_ERR(priv->phy_rst),
+				     "failed to get phy reset\n");
+
+	priv->phy = devm_phy_create(dev, NULL, &spacemit_combphy_ops);
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create combphy\n");
+
+	dev_set_drvdata(dev, priv);
+	phy_set_drvdata(priv->phy, priv);
+	phy_provider = devm_of_phy_provider_register(dev, spacemit_combphy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id spacemit_combphy_of_match[] = {
+	{ .compatible = "spacemit,k1-combphy", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
+
+static struct platform_driver spacemit_combphy_driver = {
+	.probe	= spacemit_combphy_probe,
+	.driver = {
+		.name = "spacemit-k1-combphy",
+		.of_match_table = spacemit_combphy_of_match,
+	},
+};
+module_platform_driver(spacemit_combphy_driver);
+
+MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0

