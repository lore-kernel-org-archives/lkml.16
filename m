Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7A42101BD;
	Mon, 26 May 2025 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270455; cv=none; b=t9dhsyUXvjg0PfzKGxBrkYw/Gk7wbOYEoWWxsgeUv0x/w2pvGY4RINK5vKaQD2lD6z/N2ETnr30O4X6DoOq3odr0KQLYQot9gb/PYcA/MrYoyFPzty2pBHHeNwsiCMrJuk609mLK+HzEejxqR1tQ6XlpJZ2Z9t45p4R4TYevfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270455; c=relaxed/simple;
	bh=Z5+l2LS4FLiuHcGP6xncYtlXScMGvhd7SS6ZusY5OmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2puORKoDEC9yhY9G+T+VbZVGOgRRjdp/IaRm7NUMBYgFm+iFrtgB1z53DG3uOQ7pVHKfl93GeAk9IWKJdPhziuRBVJm4sEThSfSv9JTm7BuAdkY/hngUa20+mYVDjjmzAqQ+mLmw0M0QBYf5ZEdWmPUaK2e9Onil8pAnulI+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a338;
	Mon, 26 May 2025 22:40:43 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:40:19 +0800
Subject: [PATCH v4 3/4] usb: dwc3: add generic driver to support flattened
 DT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=6956;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Z5+l2LS4FLiuHcGP6xncYtlXScMGvhd7SS6ZusY5OmI=;
 b=8HN+deS9nwPP6UlNOEjqQZgejc+uNCtsoQU9+B/TWhqMOZSF4hhXe5IqzxA89JzLxFBcZKuQv
 KkjWqwuCfs6BJb2x1fPghnU9aWZkTK4SdNBSXK7ebxdyPRBw0Rw5D8M
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0lIVk5DSE1IHh1NSU9IS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d09ec2803a1kunm5f56ec4c12ea5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mk06PRw*LDE2TQxNMDQuFDEq
	LxkKFCpVSlVKTE9DSUxLT05LSkJNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFDT0NPNwY+

To support flattened dwc3 dt model and drop the glue layer, introduce the
`dwc3-generic` driver. This enables direct binding of the DWC3 core driver
and offers an alternative to the existing glue driver `dwc3-of-simple`.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/usb/dwc3/Kconfig             |   9 ++
 drivers/usb/dwc3/Makefile            |   1 +
 drivers/usb/dwc3/dwc3-generic-plat.c | 189 +++++++++++++++++++++++++++++++++++
 3 files changed, 199 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b50b253d7e5a51674806e6ec442a2a..082627f39c9726ee4e0c5f966c5bc454f5541c9a 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
 	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_GENERIC_PLAT
+       tristate "DWC3 Generic Platform Driver"
+       depends on OF && COMMON_CLK
+       default USB_DWC3
+       help
+         Support USB3 functionality in simple SoC integrations.
+         Currently supports SpacemiT DWC USB3 IP.
+         Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_ST
 	tristate "STMicroelectronics Platforms"
 	depends on (ARCH_STI || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
+obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ff4626d324c40ecb52e115832c803fed7d38354
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * dwc3-generic-plat.c - DesignWare USB3 generic platform driver
+ *
+ * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
+ *
+ * Inspired by dwc3-qcom.c and dwc3-of-simple.c
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include "glue.h"
+
+struct dwc3_generic {
+	struct device		*dev;
+	struct dwc3		dwc;
+	struct clk_bulk_data	*clks;
+	int			num_clocks;
+	struct reset_control	*resets;
+};
+
+static int dwc3_generic_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data probe_data = {};
+	struct device *dev = &pdev->dev;
+	struct dwc3_generic *dwc3;
+	struct resource *res;
+	int ret;
+
+	dwc3 = devm_kzalloc(dev, sizeof(*dwc3), GFP_KERNEL);
+	if (!dwc3)
+		return -ENOMEM;
+
+	dwc3->dev = dev;
+
+	platform_set_drvdata(pdev, dwc3);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc3->resets = of_reset_control_array_get_optional_exclusive(dev->of_node);
+	if (IS_ERR(dwc3->resets))
+		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get reset\n");
+
+	ret = reset_control_assert(dwc3->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	usleep_range(10, 1000);
+
+	ret = reset_control_deassert(dwc3->resets);
+	if (ret) {
+		dev_err(dev, "failed to deassert reset\n");
+		goto reset_assert;
+	}
+
+	ret = clk_bulk_get_all(dwc3->dev, &dwc3->clks);
+	if (ret < 0) {
+		dev_err(dev, "failed to get clocks\n");
+		goto reset_assert;
+	}
+
+	dwc3->num_clocks = ret;
+
+	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		goto reset_assert;
+	}
+
+	dwc3->dwc.dev = dev;
+	probe_data.dwc = &dwc3->dwc;
+	probe_data.res = res;
+	probe_data.ignore_clocks_and_resets = true;
+	ret = dwc3_core_probe(&probe_data);
+	if (ret)  {
+		dev_err(dev, "failed to register DWC3 Core\n");
+		goto clk_disable;
+	}
+
+	return 0;
+
+clk_disable:
+	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
+	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
+
+reset_assert:
+	reset_control_assert(dwc3->resets);
+
+	return ret;
+}
+
+static void dwc3_generic_remove(struct platform_device *pdev)
+{
+	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
+
+	dwc3_core_remove(&dwc3->dwc);
+
+	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
+	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
+
+	reset_control_assert(dwc3->resets);
+}
+
+static int __maybe_unused dwc3_generic_suspend(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dwc3_pm_suspend(&dwc3->dwc);
+	if (ret)
+		return ret;
+
+	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_generic_resume(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
+	if (ret)
+		return ret;
+
+	ret = dwc3_pm_resume(&dwc3->dwc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_generic_runtime_suspend(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+
+	return dwc3_runtime_suspend(&dwc3->dwc);
+}
+
+static int __maybe_unused dwc3_generic_runtime_resume(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+
+	return dwc3_runtime_resume(&dwc3->dwc);
+}
+
+static int __maybe_unused dwc3_generic_runtime_idle(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+
+	return dwc3_runtime_idle(&dwc3->dwc);
+}
+
+static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
+	SET_RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
+			   dwc3_generic_runtime_idle)
+};
+
+static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "spacemit,k1-dwc3", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
+
+static struct platform_driver dwc3_generic_driver = {
+	.probe		= dwc3_generic_probe,
+	.remove		= dwc3_generic_remove,
+	.driver		= {
+		.name	= "dwc3-generic-plat",
+		.of_match_table = dwc3_generic_of_match,
+#ifdef CONFIG_PM_SLEEP
+		.pm	= &dwc3_generic_dev_pm_ops,
+#endif /* CONFIG_PM_SLEEP */
+	},
+};
+module_platform_driver(dwc3_generic_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");

-- 
2.49.0

