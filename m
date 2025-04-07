Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BC24E4A8;
	Mon,  7 Apr 2025 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029615; cv=none; b=u/YPJsw9cYZEDKrU/15fa1Oa+0E4PnvXQR95PVH9dg1OQ2vH/9N16XDqzd1cw4n7S05bp4DCuN3M+w+mT8wsipVMpEsHoCIlsWOha1avBuj/PYirtrEFpQN+LTwKwlkA80r23U1xeoMDuVCzVrorvZw9Q4G3DHvJzPz+RlkKVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029615; c=relaxed/simple;
	bh=weOX7YCw5xIedh/25Gtq1Ysk0phP2EJksDYzN4El25E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q67o8qXDgNdcbPKj3Zx67YkQjX9j7LXMVftmnKfvuFZxdy+uCOULxzWiJWoqoJWkEa/tpqXSSqQcJZX4l6kAO+5iNNqUL8iHg18UZzm9bQxKseXrAcQ+uuQrVm7yVrV2VjW/YEDohcwwNT8EH+/BN1HSP+e8yecOzu0RBoYYy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10ef566f8;
	Mon, 7 Apr 2025 20:40:04 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 07 Apr 2025 20:38:50 +0800
Subject: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3 combo
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huangze@whut.edu.cn>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=7846;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=weOX7YCw5xIedh/25Gtq1Ysk0phP2EJksDYzN4El25E=;
 b=ghsS0ZF+2K+EG031CGbRMf8NzibYzCAeHSBL37ef1LlIjQTFov9erDfmES/4HRUbVgbqGTD+3
 vDHCfBzlS6lDJgSVe1/t8IpbqJmB6Dnn6RUKsyKXhwDlAVcDuBiJAyF
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUIaVk8ZTk5IGR1LHx5LT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-HM-Tid: 0a961043d9a303a1kunm10ef566f8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6Vio*PzJOTEwMOBceGjQX
	Tj4aFAlVSlVKTE9PS0lCTUpKT0lNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUJPQkM3Bg++

Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
only USB mode is supported; PCIe support is not included in this change.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/phy/spacemit/Kconfig          |   8 ++
 drivers/phy/spacemit/Makefile         |   1 +
 drivers/phy/spacemit/phy-k1-combphy.c | 229 ++++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index f0c2a33f53cc810e71c6140ae957aa68a2b6ff0c..12749aba756329cf64fb9199055ba484fe05f3ab 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -10,3 +10,11 @@ config PHY_SPACEMIT_K1_USB2
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg driver.
+
+config PHY_SPACEMIT_K1_COMBPHY
+	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
+	depends on OF
+	select GENERIC_PHY
+	default ARCH_SPACEMIT && USB_DWC3_SPACEMIT
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
index 0000000000000000000000000000000000000000..a4b6e77fc2b4eb5d2c45d4e76294083509a3fc9d
--- /dev/null
+++ b/drivers/phy/spacemit/phy-k1-combphy.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Spacemit K1 PCIE/USB3 PHY driver
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
+#define COMBPHY_USB_REG1	0x68
+#define  COMBPHY_USB_REG1_VAL	0x00
+#define COMBPHY_USB_REG2	0x48
+#define  COMBPHY_USB_REG2_VAL	0x603a2276
+#define COMBPHY_USB_REG3	0x08
+#define  COMBPHY_USB_REG3_VAL	0x97c
+#define COMBPHY_USB_REG4	0x18
+#define  COMBPHY_USB_REG4_VAL	0x00
+#define COMBPHY_USB_PLL_REG	0x08
+#define  COMBPHY_USB_PLL_MASK	0x01
+#define  COMBPHY_USB_PLL_VAL	0x01
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
+	int ret = 0;
+
+	ret = read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
+				1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
+				priv->phy_ctrl + offset);
+
+	return ret;
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
+	priv->phy_ctrl = devm_platform_ioremap_resource_byname(pdev, "phy_ctrl");
+	if (IS_ERR(priv->phy_ctrl))
+		return PTR_ERR(priv->phy_ctrl);
+
+	priv->phy_sel = devm_platform_ioremap_resource_byname(pdev, "phy_sel");
+	if (IS_ERR(priv->phy_sel))
+		return PTR_ERR(priv->phy_sel);
+
+	priv->type = PHY_NONE;
+	priv->dev = dev;
+
+	priv->phy_rst = devm_reset_control_get(dev, NULL);
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

