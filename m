Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9996F2900BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793507; cv=none; b=dzJdBGCmVqCVZvd91NZXtFs9sJ/HB1IRDTzx6Y7juDvjJDQk5XFzMUzciM0z4har4V3PR+OPRLjKSnc/jQ+TK5CfyY6Dsl32NXdBmPV48YMRxke77IrI813MiZvWUMBC+NEnwFXegURuyiIqvNF50DvQRs9dMdnQM/FNXzaksvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793507; c=relaxed/simple;
	bh=RMw7g4/SU9cO0pK7UMO3xQvgqzcugLhcbfNZwcAQsyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHZ7VIrca1AJrjE0pCzF61/68PXeP3coLeFlLglt7WobhPZcPNGoJNm3OvZkULVeofloKBuNRB8dWaqdNJuMjMnmyr9cVpam6MjGNUx6W2V5v28QcTcZ71lVPfadd9chkDdZEt3DKz2x/FzDaWj+x4baM5QL2kPWk5naaLi5fnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejE+Bw2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejE+Bw2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5132CC4CEF0;
	Fri,  9 May 2025 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746793506;
	bh=RMw7g4/SU9cO0pK7UMO3xQvgqzcugLhcbfNZwcAQsyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ejE+Bw2g7kYUOibE/82DsluAfFH4MF4zSofN9+xNe25lLkNo6Y9zpiGMcvlgcBUYf
	 s2pRz+NbDVlDIVPZfF8s4kiEZeaRYMXkSOFCfZf3jGpmGkJeicXhHQIvrQPfWRZnAV
	 JnvcCD4CcvE3+ET3ZvtD7NawCo4OgP5jqncOFwY7M2GBZV8HYIRQJqCQL+DyTKir50
	 hxoo3bgKVpE3OWV4WiGQY1zu0aL21wK1thKIwY+T5pftMSJ4A2hjV2nUhcrVZKTc/J
	 tHu2OZ6twjfWVJP3dsnkEFx5W21zsZzBJTxxSzRJyYA1pdfLuTo3D6wFaWdxdSuUEV
	 yU5zOzGMGdoTQ==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Neal Gompa <neal@gompa.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 3/3] nvmem: Add apple-spmi-nvmem driver
Date: Fri,  9 May 2025 13:24:52 +0100
Message-ID: <20250509122452.11827-4-srini@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509122452.11827-1-srini@kernel.org>
References: <20250509122452.11827-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hector Martin <marcan@marcan.st>

Add a driver for a series of SPMI-attached PMICs present on Apple devices

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 MAINTAINERS                      |  1 +
 drivers/nvmem/Kconfig            | 13 +++++++
 drivers/nvmem/Makefile           |  2 ++
 drivers/nvmem/apple-spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 drivers/nvmem/apple-spmi-nvmem.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9936fa9fe87c..65abe712170d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
+F:	drivers/nvmem/apple-spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b9..ae4afbd8293c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -40,6 +40,19 @@ config NVMEM_APPLE_EFUSES
 	  This driver can also be built as a module. If so, the module will
 	  be called nvmem-apple-efuses.
 
+config NVMEM_APPLE_SPMI
+	tristate "Apple SPMI NVMEM"
+	depends on ARCH_APPLE || COMPILE_TEST
+	depends on SPMI
+	select REGMAP_SPMI
+	help
+	  Say y here to build a driver to expose NVMEM cells for a set of power
+	  and RTC-related settings on a SPMI-attached PMIC present on Apple
+	  devices, such as Apple Silicon Macs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called apple-nvmem-spmi.
+
 config NVMEM_BCM_OCOTP
 	tristate "Broadcom On-Chip OTP Controller support"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488b..89a3c252c2c8 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -12,6 +12,8 @@ obj-y				+= layouts/
 # Devices
 obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
+obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
+apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/apple-spmi-nvmem.c b/drivers/nvmem/apple-spmi-nvmem.c
new file mode 100644
index 000000000000..88614005d5ce
--- /dev/null
+++ b/drivers/nvmem/apple-spmi-nvmem.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SPMI NVMEM driver
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/spmi.h>
+#include <linux/regmap.h>
+
+static const struct regmap_config apple_spmi_regmap_config = {
+	.reg_bits	= 16,
+	.val_bits	= 8,
+	.max_register	= 0xffff,
+};
+
+static int apple_spmi_nvmem_probe(struct spmi_device *sdev)
+{
+	struct regmap *regmap;
+	struct nvmem_config nvmem_cfg = {
+		.dev = &sdev->dev,
+		.name = "spmi_nvmem",
+		.id = NVMEM_DEVID_AUTO,
+		.word_size = 1,
+		.stride = 1,
+		.size = 0xffff,
+		.reg_read = (void *)regmap_bulk_read,
+		.reg_write = (void *)regmap_bulk_write,
+	};
+
+	regmap = devm_regmap_init_spmi_ext(sdev, &apple_spmi_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	nvmem_cfg.priv = regmap;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(&sdev->dev, &nvmem_cfg));
+}
+
+static const struct of_device_id apple_spmi_nvmem_id_table[] = {
+	{ .compatible = "apple,spmi-nvmem" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, apple_spmi_nvmem_id_table);
+
+static struct spmi_driver apple_spmi_nvmem_driver = {
+	.probe = apple_spmi_nvmem_probe,
+	.driver = {
+		.name = "apple-spmi-nvmem",
+		.of_match_table	= apple_spmi_nvmem_id_table,
+	},
+};
+
+module_spmi_driver(apple_spmi_nvmem_driver);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_DESCRIPTION("Apple SPMI NVMEM driver");
-- 
2.43.0

