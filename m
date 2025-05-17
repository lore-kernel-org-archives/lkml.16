Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABD2063D2;
	Sat, 17 May 2025 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747491973; cv=none; b=JBumKmiJiuMfzZemms7bQ+WWJnoqkxf2gZmBVC/s+DC9njk7Hgdj1OhCyf90IkhDun+HSJHqqeW/Uc7w9HTvaIOh2K7cskiCUmsilYIVGCndiy95TLo+mSqr3ztZUHV3tYGkGwQ/2h+OCntwbQKZxp7pIMSIIQdRzzfkdFyoJM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747491973; c=relaxed/simple;
	bh=Vin80n2rcHBp6FAin/JZOaVsf0TeLi7SxUI4Jrzzs28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIMghagHJvaKRYuAgmnebChia/vWXCFZei2U83CnYcZkNHISZ3la1O8kRcItCce8UUnPfMpG3KxLT1LuSjGzqK9bYDWge9rllSF5XdkBHKGQvxCvAHcpX56hcRHUZxlgD+RklUxivOP8DmoeSLo8BZzrwuxJpk5a4JkzxD4t9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1562e81f1;
	Sat, 17 May 2025 22:26:01 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Sat, 17 May 2025 22:25:17 +0800
Subject: [PATCH v3 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-b4-k1-usb3-phy-v2-v3-4-e0655613a163@whut.edu.cn>
References: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
In-Reply-To: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747491939; l=8764;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Vin80n2rcHBp6FAin/JZOaVsf0TeLi7SxUI4Jrzzs28=;
 b=s8tTFnh13jXvTjat/XwfZc+3DNTbyRuTQG10Z3jyEhId7P/zzGY4JKZHwP75Q1ESOF+i2S9Y8
 8J4PhG3A5OSDlQUcw9xNQj4uzhQ4OcGoiPXWkp/B0KF1m20HlIUFdqS
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTU9KVkpKGExIQh8YQ0NJQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1kG
X-HM-Tid: 0a96dea33b8603a1kunm1562e81f1
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06CAw4ITErOiohTywcETkM
	TE9PFE9VSlVKTE9MT0JKQk1NT0hOVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFKS0pPSjcG

Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY which
implements PIPE3(125MHz) interface for USB3.0. Currently, only USB mode
is supported; PCIe support is not included in this change.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/phy/spacemit/Kconfig          |   8 ++
 drivers/phy/spacemit/Makefile         |   1 +
 drivers/phy/spacemit/phy-k1-combphy.c | 248 ++++++++++++++++++++++++++++++++++
 3 files changed, 257 insertions(+)

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
index 0000000000000000000000000000000000000000..1f2ee3351e2bb5adf04e4e2fcfdb03cd75f70847
--- /dev/null
+++ b/drivers/phy/spacemit/phy-k1-combphy.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K1 PCIE/USB3 PHY driver
+ *
+ * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
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
+#define COMBPHY_MODE_SEL	BIT(3)
+#define COMBPHY_WAIT_TIMEOUT	1000
+
+struct spacemit_combphy_priv {
+	struct device *dev;
+	struct phy *phy;
+	struct reset_control *phy_rst;
+	void __iomem *phy_ctrl;
+	void __iomem *phy_sel;
+	bool rx_always_on;
+	u8 lfps_threshold;
+	u8 type;
+};
+
+static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl(reg + offset);
+	tmp = (tmp & ~(mask)) | val;
+	writel(tmp, reg + offset);
+}
+
+static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
+				       u32 offset, u32 mask, u32 val)
+{
+	u32 reg_val;
+
+	return read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
+				 1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
+				 priv->phy_ctrl + offset);
+}
+
+static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
+{
+	int ret = 0;
+
+	switch (priv->type) {
+	case PHY_TYPE_USB3:
+		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
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
+	void __iomem *base = priv->phy_ctrl;
+	int ret;
+
+	writel(COMBPHY_USB_REG1_VAL, base + COMBPHY_USB_REG1);
+	writel(COMBPHY_USB_REG2_VAL, base + COMBPHY_USB_REG2);
+	writel(COMBPHY_USB_REG3_VAL, base + COMBPHY_USB_REG3);
+	writel(COMBPHY_USB_REG4_VAL, base + COMBPHY_USB_REG4);
+
+	ret = spacemit_combphy_wait_ready(priv, COMBPHY_USB_PLL_REG,
+					  COMBPHY_USB_PLL_MASK,
+					  COMBPHY_USB_PLL_VAL);
+
+	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
+	spacemit_reg_update(base, COMBPHY_USB_LFPS_REG,
+			    COMBPHY_USB_LFPS_MASK,
+			    (priv->lfps_threshold << 8));
+
+	if (priv->rx_always_on)
+		spacemit_reg_update(base, COMBPHY_USB_REG4,
+				    COMBPHY_USB_TERM_SHORT_MASK,
+				    COMBPHY_USB_TERM_SHORT_VAL);
+
+	if (ret)
+		dev_err(priv->dev, "USB3 PHY init timeout!\n");
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
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->phy_ctrl = devm_platform_ioremap_resource_byname(pdev, "ctrl");
+	if (IS_ERR(priv->phy_ctrl))
+		return PTR_ERR(priv->phy_ctrl);
+
+	priv->phy_sel = devm_platform_ioremap_resource_byname(pdev, "sel");
+	if (IS_ERR(priv->phy_sel))
+		return PTR_ERR(priv->phy_sel);
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

