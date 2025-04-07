Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24AA2505CE;
	Mon,  7 Apr 2025 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029624; cv=none; b=n5T5+3+EJ/wy3/lMkfwfC1tD71V4e42EfoWpAFXITUheDm2Xa8umVg5lAkmcvagu6Z2mTL47uC9Bq0ZBiuQbLtDjIu9cm/Wc2N00VB1mQAT7qmpFyJLzMZ6AhB0QJN4Sdh3aB7I/OTBHTbPKyjWReXrFNGN6HJDaFPlCv2TmreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029624; c=relaxed/simple;
	bh=Fd/9MKedec8AShJy/y3d+yVIscBZfEuehyAXjlgnTKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sms2ToXkOBJyVKecCC0mNoQRbS/sxkC7xYRTpcguH+nwjBshZ6+EnXxc62TcGmzju3Ssb10bp6i0qzW2L3lYKWOtGhtrssSFHnNZbdAeUK0I8bQcfXTX7r2YfcEWwBpILBnrmR2+Cf4XB5+6JvI7ImbNABi5vY905zroNHUNb2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10f021904;
	Mon, 7 Apr 2025 20:40:12 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 07 Apr 2025 20:38:51 +0800
Subject: [PATCH 6/7] usb: dwc3: add spacemit dwc3 glue layer driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-6-bf0bcc41c9ba@whut.edu.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=5058;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Fd/9MKedec8AShJy/y3d+yVIscBZfEuehyAXjlgnTKA=;
 b=0oUjkiZkghcan3Psxy1PQme5aj6x1I1dcVUwNTyPXUaLSXxVPZ0e6STZc1N2XerGnhy5DyYpF
 CIkNmhVHWDHAM5Gc+FVLzCdtgoY3vrDb2i6BxTZdIXmyjD/kZoCS4ZX
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE8eVkkZQk9OHxhOHRoYGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a961043f94e03a1kunm10f021904
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6AQw4LjICA0woEhYrGjoT
	Qw9PCQJVSlVKTE9PS0lCTUpCSkJDVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU1NQk03Bg++

Add SpacemiT glue logic to support dwc3 HC on K1 SoC. The driver manages
clock, reset and interrupt resource.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/usb/dwc3/Kconfig         |   7 +++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/dwc3-spacemit.c | 127 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b50b253d7e5a51674806e6ec442a2a..3c30680fa4f83565fc03c6800e867c6ced0fe101 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -189,4 +189,11 @@ config USB_DWC3_RTK
 	  or dual-role mode.
 	  Say 'Y' or 'M' if you have such device.
 
+config USB_DWC3_SPACEMIT
+	tristate "Spacemit Platforms"
+	default USB_DWC3
+	help
+	  Support SPACEMIT platforms with DesignWare Core USB3 IP.
+	  Say 'Y' or 'M' here if you have one such device
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 124eda2522d9c1f4caab222ec9770d0deaf655fc..61a87765c0c591e0a53c33b5a6544db056166f96 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
+obj-$(CONFIG_USB_DWC3_SPACEMIT)		+= dwc3-spacemit.o
diff --git a/drivers/usb/dwc3/dwc3-spacemit.c b/drivers/usb/dwc3/dwc3-spacemit.c
new file mode 100644
index 0000000000000000000000000000000000000000..4574ad3b34a200ffe999c7da61b74c2ef33c0483
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-spacemit.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * dwc3-spacemit.c - Spacemit DWC3 Specific Glue layer
+ *
+ * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ *
+ * Author: Wilson <long.wan@spacemit.com>
+ * Contributor: Ze Huang <huangze@whut.edu.cn>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+struct dwc3_spacemit {
+	struct device		*dev;
+	struct clk		*clk;
+	struct reset_control	*reset;
+};
+
+static int dwc3_spacemit_init(struct dwc3_spacemit *data)
+{
+	struct device *dev = data->dev;
+	int ret = 0;
+
+	data->reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(data->reset))
+		return dev_err_probe(dev, PTR_ERR(data->reset), "failed to get reset\n");
+
+	ret = reset_control_assert(data->reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	usleep_range(10, 20);
+
+	ret = reset_control_deassert(data->reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset\n");
+
+	return 0;
+}
+
+static int dwc3_spacemit_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct dwc3_spacemit *spacemit;
+	int ret;
+
+	spacemit = devm_kzalloc(dev, sizeof(*spacemit), GFP_KERNEL);
+	if (!spacemit)
+		return -ENOMEM;
+
+	spacemit->dev = dev;
+
+	platform_set_drvdata(pdev, spacemit);
+
+	spacemit->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(spacemit->clk))
+		return dev_err_probe(dev, PTR_ERR(spacemit->clk), "Failed to get clock\n");
+
+	ret = dwc3_spacemit_init(spacemit);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init SpacemiT USB3 glue\n");
+
+	ret = of_platform_populate(node, NULL, NULL, dev);
+	if (ret)
+		dev_err_probe(dev, ret, "failed to add dwc3 core\n");
+
+	return 0;
+}
+
+static void dwc3_spacemit_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+}
+
+static const struct of_device_id spacemit_dwc3_match[] = {
+	{ .compatible = "spacemit,k1-dwc3", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_dwc3_match);
+
+#ifdef CONFIG_PM_SLEEP
+static int dwc3_spacemit_suspend(struct device *dev)
+{
+	struct dwc3_spacemit *spacemit = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(spacemit->clk);
+
+	return 0;
+}
+
+static int dwc3_spacemit_resume(struct device *dev)
+{
+	struct dwc3_spacemit *spacemit = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(spacemit->clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops dwc3_spacemit_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_spacemit_suspend, dwc3_spacemit_resume)
+};
+#endif /* CONFIG_PM_SLEEP */
+
+static struct platform_driver dwc3_spacemit_driver = {
+	.probe		= dwc3_spacemit_probe,
+	.remove		= dwc3_spacemit_remove,
+	.driver		= {
+		.name	= "spacemit-dwc3",
+		.of_match_table = spacemit_dwc3_match,
+#ifdef CONFIG_PM_SLEEP
+		.pm	= &dwc3_spacemit_dev_pm_ops,
+#endif /* CONFIG_PM_SLEEP */
+	},
+};
+module_platform_driver(dwc3_spacemit_driver);
+
+MODULE_AUTHOR("Wilson <long.wan@spacemit.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 Spacemit Glue Layer");

-- 
2.49.0

