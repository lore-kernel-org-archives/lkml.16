Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF5257429;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753964; cv=none; b=SXBFrFwJsVtWJ1oIoper/x/rIt60T0I+bDDGwbf2wd0u9URrcIyQRmpfyqhJgfT2LJVFK9u8K8XNrC5N5uJiXgs8/Agu0eRsCl7opq6ovkHaWCVUQwB7MlsX8v4QsyYmp41rd5qe4aDdI4xUAs3lnk4QYDHJsKC6jxanxDsO1JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753964; c=relaxed/simple;
	bh=BVmxalFQ+1RPy6SBUBeC9SYYAKWIGqXGuT46WhlJFKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4O9yguE3/79no6BmyoFjO3I0OsCRS8X35Ecrh1yrR+UmXZDdApxCPC1UIzfyRn4r+tbjuMBf2Epn7HzvmkkJPc4LA9HAhGeH/EH7jvE1lzBMAo6EyY5AMPmSGu7KOq3agDvi/CCVMb5XldPHKzx4hE5ZtJY1e7FS9KfmTpQ3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWrbTkss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWrbTkss"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90983C4CEEE;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753963;
	bh=BVmxalFQ+1RPy6SBUBeC9SYYAKWIGqXGuT46WhlJFKg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WWrbTkss41+whbRqBMJbEjZ21A/TM+LiJoMG65JDK8PCWit3uREjR/aSksS+F0zLj
	 Osi5+vX7Y3c73wHpQMkxXtYFlCdp3PAxbxQ0jXVjK8eYGrNvc3+i/ptAvQhVaK22YO
	 UQEKMAYcJqag/yU1PyIdKaMy4NmBJLK3m89AijDjtZy/caFLpRYl3tWTH0GC8DFteU
	 XvChc9c9uXuQUa3w6cN21EMzTlJEbEqO8f+PQfk/A++bQx57hOVQ/g1tUAX3DRVT8q
	 wWjRpSV+p7Stu2gDmvRK2oCf4PHBS1NaSsCtgGonxO3N+hosO7UBdILdLBKB2ZELAY
	 c8hFNcthH5SUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80748C369C4;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 15 Apr 2025 23:52:35 +0200
Subject: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744753962; l=4406;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=UH9wM81/psSJmAH9PoTzOXnAfvXuDX0j1X8GybEfIcs=;
 b=ieKtICAShggkKCQz1Mc2h1LtL8JAugPgVHn+knoMlqP7wMi6HtoHN0/noeAVjK3K3xu0aQXCn
 PsV/shL78C2DCkb7cLxqSJ6J6VRolZ5FBXf4TzylXi42+VGGyPxcy0L
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Hector Martin <marcan@marcan.st>

This driver exposes a SPMI device as an NVMEM device.
It is intended to be used with e.g. PMUs/PMICs that are used to
hold power management configuration, such as used on Apple Silicon
Macs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS                |  1 +
 drivers/nvmem/Kconfig      | 14 +++++++++++
 drivers/nvmem/Makefile     |  2 ++
 drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7b2d0df81b387ba5398957131971588dc7b89dc..63c12f901aed1f3e6de8227d6db34af1bd046fe6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2298,6 +2298,7 @@ F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
+F:	drivers/nvmem/spmi-nvmem.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b933e147154bb40b5d41b5730518d2..9ec907d8aa6ef7df0ea45cc35e92d8239d2705ee 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -310,6 +310,20 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPMI
+	tristate "Generic SPMI NVMEM"
+	default ARCH_APPLE
+	depends on SPMI
+	select REGMAP_SPMI
+	help
+	  Say y here to build a generic driver to expose a SPMI device
+	  as a NVMEM provider. This can be used for PMIC/PMU devices which
+	  are used to store power and RTC-related settings on certain
+	  platforms, such as Apple Silicon Macs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-spmi.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488bf89bfb305750a1cbf4a6731a0a58..b639f4284184db026bb27b11e04d54b8f7ff166f 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -64,6 +64,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SPMI)		+= nvmem_spmi.o
+nvmem_spmi-y				:= spmi-nvmem.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/spmi-nvmem.c b/drivers/nvmem/spmi-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..fff6162cb22dd7ab45883f004f5b63ebae014698
--- /dev/null
+++ b/drivers/nvmem/spmi-nvmem.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Generic SPMI NVMEM driver
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
+static const struct regmap_config spmi_regmap_config = {
+	.reg_bits	= 16,
+	.val_bits	= 8,
+	.max_register	= 0xffff,
+};
+
+static int spmi_nvmem_probe(struct spmi_device *sdev)
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
+	regmap = devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	nvmem_cfg.priv = regmap;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(&sdev->dev, &nvmem_cfg));
+}
+
+static const struct of_device_id spmi_nvmem_id_table[] = {
+	{ .compatible = "spmi-nvmem" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, spmi_nvmem_id_table);
+
+static struct spmi_driver spmi_nvmem_driver = {
+	.probe = spmi_nvmem_probe,
+	.driver = {
+		.name = "spmi-nvmem",
+		.of_match_table	= spmi_nvmem_id_table,
+	},
+};
+
+module_spmi_driver(spmi_nvmem_driver);
+
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_DESCRIPTION("SPMI NVMEM driver");

-- 
2.49.0


