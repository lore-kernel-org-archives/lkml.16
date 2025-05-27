Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63753267AED;
	Tue, 27 May 2025 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347314; cv=none; b=V6n0tWhDcxBqaZqCgglbhHSlv3GdlsFSj1qFYAN48yvfIBD9sbOpHQgryvlnx+S+wYOqrOn+Zz/ml4ni0/nu1GBvAm/tItu6RFYWQ6S6Y4T57zGpTuVz0tzwGRuEAACQeLe44ztBN/HOGnLfvzImSrTqiZkII7128ZPpycUMFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347314; c=relaxed/simple;
	bh=P4Q+HavbqXTvCJXf77+OZqQC2L1P5jCQyxmRptXcahM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzsjDUfcEFGX161BkZakZwpo+7xUiaqMPCtRfRtIWN7a/RwdWjZny9UaJhpIhIw90Nj7PNqn6/00+1hOJ5gQ600mgfqtvgcVI60fnhBXaxCWV5GyNBUQGAEs+cg5fqh+GdMBn/UZTDN7U7D3qRrputvtb67VYpBHFKoxFee2x+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16930953c;
	Tue, 27 May 2025 20:01:44 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Tue, 27 May 2025 20:01:17 +0800
Subject: [PATCH v5 3/4] phy: spacemit: support K1 USB2.0 PHY controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-b4-k1-usb3-phy-v2-v5-3-2d366b0af999@whut.edu.cn>
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
In-Reply-To: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748347285; l=7192;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=P4Q+HavbqXTvCJXf77+OZqQC2L1P5jCQyxmRptXcahM=;
 b=0aWT98Rg1pr4+55HAWFID2zVSkPexIX382WCd2P2JbZajBq62NwWXU2HuA0cF92ttvqNgZYfz
 o+V+YA0HThBB3LPH/mBbHmLmQWhFRv8+uY2QzzjsYxSiALT4xyc0yTR
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTU4fVkxNHUlLSR4aHUpKQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG
X-HM-Tid: 0a97119eb88203a1kunm8e523759adf97
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kyo6Ogw6PzEzOlY9UT05Px0I
	NxQwCyNVSlVKTE9DSE9MSEtCQ0lPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFDTk5NNwY+

The SpacemiT K1 SoC includes three USB ports:

- One USB2.0 OTG port
- One USB2.0 host-only port
- One USB3.0 port with an integrated USB2.0 DRD interface

Each of these ports is connected to a USB2.0 PHY responsible for USB2
transmission.

This commit adds support for the SpacemiT K1 USB2.0 PHY, which is
compliant with the USB 2.0 specification and supports both 8-bit 60MHz
and 16-bit 30MHz parallel interfaces.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/phy/Kconfig                |   1 +
 drivers/phy/Makefile               |   1 +
 drivers/phy/spacemit/Kconfig       |  13 ++++
 drivers/phy/spacemit/Makefile      |   2 +
 drivers/phy/spacemit/phy-k1-usb2.c | 144 +++++++++++++++++++++++++++++++++++++
 5 files changed, 161 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe998ec5fd50054eed2c90d6ecce6bd5dd8..fca589aa7926eb5bce14e99785cf32cf0395202e 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -114,6 +114,7 @@ source "drivers/phy/renesas/Kconfig"
 source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
 source "drivers/phy/socionext/Kconfig"
+source "drivers/phy/spacemit/Kconfig"
 source "drivers/phy/st/Kconfig"
 source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442acc752820fe0bd638dfe38986a37c2a78..05993ff8a15daf7e2583b5f9b9b37ac584a30609 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -34,6 +34,7 @@ obj-y					+= allwinner/	\
 					   rockchip/	\
 					   samsung/	\
 					   socionext/	\
+					   spacemit/	\
 					   st/		\
 					   starfive/	\
 					   sunplus/	\
diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..0136aee2e8a2f5f484da136b26f80130794b992c
--- /dev/null
+++ b/drivers/phy/spacemit/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for SpacemiT platforms
+#
+config PHY_SPACEMIT_K1_USB2
+	tristate "SpacemiT K1 USB 2.0 PHY support"
+	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
+	depends on COMMON_CLK
+	depends on USB_COMMON
+	select GENERIC_PHY
+	help
+	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
+	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fec0b425a948541b39b814caef0b05e1e002d92f
--- /dev/null
+++ b/drivers/phy/spacemit/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
new file mode 100644
index 0000000000000000000000000000000000000000..ee64af07478ea02b421473e6f73fd37a3a135e7d
--- /dev/null
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K1 USB 2.0 PHY driver
+ *
+ * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/usb/of.h>
+
+#define USB2_PHY_REG01			0x04
+#define  USB2_PHY_REG01_VAL		0x60ef
+#define  USB2_PHY_REG01_PLL_IS_READY	BIT(0)
+#define USB2_PHY_REG04			0x10
+#define  USB2_PHY_REG04_AUTO_CLEAR_DIS	BIT(2)
+#define USB2_PHY_REG0D			0x34
+#define  USB2_PHY_REG0D_VAL		0x1c
+#define USB2_PHY_REG26			0x98
+#define  USB2_PHY_REG26_VAL		0xbec4
+
+#define USB2D_CTRL_RESET_TIME_MS	50
+
+struct spacemit_usb2phy {
+	struct phy	*phy;
+	struct clk	*clk;
+	struct regmap	*regmap_base;
+};
+
+static const struct regmap_config phy_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x200,
+};
+
+static int spacemit_usb2phy_init(struct phy *phy)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+	struct regmap *map = sphy->regmap_base;
+	u32 val;
+	int ret;
+
+	ret = clk_prepare_enable(sphy->clk);
+	if (ret) {
+		dev_err(&phy->dev, "failed to enable clock\n");
+		return ret;
+	}
+
+	/*
+	 * make sure the usb controller is not under reset process before
+	 * any configuration
+	 */
+	usleep_range(150, 200);
+	regmap_write(map, USB2_PHY_REG26, USB2_PHY_REG26_VAL); /* 24M ref clk */
+
+	ret = regmap_read_poll_timeout(map, USB2_PHY_REG01, val,
+				       (val & USB2_PHY_REG01_PLL_IS_READY),
+				       500, USB2D_CTRL_RESET_TIME_MS * 1000);
+	if (ret) {
+		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
+		return ret;
+	}
+
+	/* release usb2 phy internal reset and enable clock gating */
+	regmap_write(map, USB2_PHY_REG01, USB2_PHY_REG01_VAL);
+	regmap_write(map, USB2_PHY_REG0D, USB2_PHY_REG0D_VAL);
+
+	/* auto clear host disc */
+	regmap_update_bits(map, USB2_PHY_REG04, USB2_PHY_REG04_AUTO_CLEAR_DIS,
+			   USB2_PHY_REG04_AUTO_CLEAR_DIS);
+
+	return 0;
+}
+
+static int spacemit_usb2phy_exit(struct phy *phy)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(sphy->clk);
+
+	return 0;
+}
+
+static const struct phy_ops spacemit_usb2phy_ops = {
+	.init = spacemit_usb2phy_init,
+	.exit = spacemit_usb2phy_exit,
+	.owner = THIS_MODULE,
+};
+
+static int spacemit_usb2phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct spacemit_usb2phy *sphy;
+	void __iomem *base;
+
+	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
+	if (!sphy)
+		return -ENOMEM;
+
+	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
+	if (IS_ERR(sphy->clk))
+		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	sphy->regmap_base = devm_regmap_init_mmio(dev, base, &phy_regmap_config);
+	if (IS_ERR(sphy->regmap_base))
+		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base),
+				     "Failed to init regmap\n");
+
+	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
+	if (IS_ERR(sphy->phy))
+		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
+
+	phy_set_drvdata(sphy->phy, sphy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id spacemit_usb2phy_dt_match[] = {
+	{ .compatible = "spacemit,k1-usb2-phy", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
+
+static struct platform_driver spacemit_usb2_phy_driver = {
+	.probe	= spacemit_usb2phy_probe,
+	.driver = {
+		.name   = "spacemit-usb2-phy",
+		.of_match_table = spacemit_usb2phy_dt_match,
+	},
+};
+module_platform_driver(spacemit_usb2_phy_driver);
+
+MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0

