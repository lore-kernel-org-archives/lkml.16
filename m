Received: from azure-sdnproxy.icoremail.net (l-sdnproxy.icoremail.net [20.188.111.126])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36180219FC;
	Wed, 14 May 2025 00:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.188.111.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747182758; cv=none; b=Vw9tX1pMbwsiCUDHTBblXqRwxjp5zciojaG8Z5ARodG8eLuSZ/AkR6qCiRww/29eR3W9/8LmY9BelIaZ6vN0iqDzkioA4oWEdXte67GjVew4giwsQnqva+BPV4Ktv3pcJDchYD/6D57XSzNOBioPWTft+ROZI/R9xmwA7UyWAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747182758; c=relaxed/simple;
	bh=q9YZi9u6urfuQxOi7qxIdE44D4Yw5m8A7ZQ110VxraU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yi7YmJp/gJiu7Nvq82qJbebM48GcXuKtDOvsJHvCnIQNF1SMwRNAg6mCr6F2nuzStzHXq8k2kvIaUO66dapHnlXXMmL2pn72D1qRplqhowE0NCCE13/wHS7egRY8AO9JINaiyQJx1RMCJFyghEAnFJPNIDglSEXWNMWV+QU0nVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=20.188.111.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgC32xGL5CNohat4AA--.52630S2;
	Wed, 14 May 2025 08:32:13 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH 2/2] reset: eswin: Add eic7700 reset driver
Date: Wed, 14 May 2025 08:32:09 +0800
Message-Id: <20250514003209.531-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250514002945.415-1-dongxuyang@eswincomputing.com>
References: <20250514002945.415-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgC32xGL5CNohat4AA--.52630S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtrykXr43XrWxZF4kWrWDXFb_yoWfAw4xpF
	WrGFW3Jr4UJr4fWw4xJrWvvF4ag3WfKFy8GrZrtw4Ikw13tayUJF48tFyrtF97CryDXFy5
	tF12gayruFnrtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQJ57UUUUU==
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add support for reset controller in eic7700 series chips.
Provide functionality for asserting and deasserting resets
on the chip.

Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/reset/Kconfig         |   9 ++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-eic7700.c | 249 ++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)
 create mode 100644 drivers/reset/reset-eic7700.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 99f6f9784e68..d6eef5358e13 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -350,6 +350,15 @@ config RESET_ZYNQMP
 	help
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
+config RESET_EIC7700
+	bool "Reset controller driver for Eswin SoCs"
+	default ARCH_ESWIN
+	help
+	  This enables the reset controller driver for Eswin SoCs. This driver is
+	  specific to Eswin SoCs and should only be enabled if using such hardware.
+	  The driver supports eic7700 series chips and provides functionality for
+	  asserting and deasserting resets on the chip.
+
 source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 31f9904d13f9..2210c4e55834 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -44,3 +44,4 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
+obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
diff --git a/drivers/reset/reset-eic7700.c b/drivers/reset/reset-eic7700.c
new file mode 100644
index 000000000000..079647280cbc
--- /dev/null
+++ b/drivers/reset/reset-eic7700.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2024, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * ESWIN Reset Driver
+ *
+ * Authors:
+ *	Yifeng Huang <huangyifeng@eswincomputing.com>
+ *	Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define SYSCRG_CLEAR_BOOT_INFO_OFFSET (0x30C)
+#define CLEAR_BOOT_FLAG_BIT BIT_ULL(0)
+
+#define SYSCRG_RESET_OFFSET (0x400)
+
+/**
+ * struct eswin_reset_data - reset controller information structure
+ * @rcdev: reset controller entity
+ * @dev: reset controller device pointer
+ * @idr: idr structure for mapping ids to reset control structures
+ */
+struct eswin_reset_data {
+	struct reset_controller_dev rcdev;
+	struct device *dev;
+	struct idr idr;
+	struct regmap *regmap;
+};
+
+/**
+ * struct eswin_reset_control - reset control structure
+ * @dev_id: SoC-specific device identifier
+ * @reset_bit: reset mask to use for toggling reset
+ */
+struct eswin_reset_control {
+	u32 dev_id;
+	u32 reset_bit;
+};
+
+#define to_eswin_reset_data(p) container_of((p), struct eswin_reset_data, rcdev)
+
+/**
+ * eswin_reset_set() - program a device's reset
+ * @rcdev: reset controller entity
+ * @id: ID of the reset to toggle
+ * @assert: boolean flag to indicate assert or deassert
+ *
+ * This is a common internal function used to assert or deassert a device's
+ * reset by clear and set the reset bit. The device's reset is asserted if the
+ * @assert argument is true, or deasserted if @assert argument is false.
+ *
+ * Return: 0 for successful request, else a corresponding error value
+ */
+static int eswin_reset_set(struct reset_controller_dev *rcdev, unsigned long id,
+			   bool assert)
+{
+	struct eswin_reset_data *data = to_eswin_reset_data(rcdev);
+	struct eswin_reset_control *control;
+	int ret;
+
+	control = idr_find(&data->idr, id);
+
+	dev_dbg(rcdev->dev, "dev_id 0x%x reset_bit 0x%x assert 0x%x\r\n",
+		control->dev_id, control->reset_bit, assert);
+
+	if (!control)
+		return -EINVAL;
+
+	if (assert) {
+		ret = regmap_clear_bits(data->regmap,
+					SYSCRG_RESET_OFFSET +
+						control->dev_id * sizeof(u32),
+					control->reset_bit);
+	} else {
+		ret = regmap_set_bits(data->regmap,
+				      SYSCRG_RESET_OFFSET +
+					      control->dev_id * sizeof(u32),
+				      control->reset_bit);
+	}
+
+	return ret;
+}
+
+static int eswin_reset_reset(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	int ret;
+
+	ret = eswin_reset_set(rcdev, id, true);
+	if (ret != 0)
+		return ret;
+
+	usleep_range(10, 15);
+	ret = eswin_reset_set(rcdev, id, false);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
+static int eswin_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	return eswin_reset_set(rcdev, id, true);
+}
+
+static int eswin_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	return eswin_reset_set(rcdev, id, false);
+}
+
+static const struct reset_control_ops eswin_reset_ops = {
+	.reset = eswin_reset_reset,
+	.assert = eswin_reset_assert,
+	.deassert = eswin_reset_deassert,
+};
+
+static int eswin_reset_of_xlate_lookup_id(int id, void *p, void *data)
+{
+	struct of_phandle_args *reset_spec = (struct of_phandle_args *)data;
+	struct eswin_reset_control *slot_control =
+		(struct eswin_reset_control *)p;
+
+	if (reset_spec->args[0] == slot_control->dev_id &&
+	    reset_spec->args[1] == slot_control->reset_bit)
+		return id;
+	else
+		return 0;
+}
+
+/**
+ * eswin_reset_of_xlate() - translate a set of OF arguments to a reset ID
+ * @rcdev: reset controller entity
+ * @reset_spec: OF reset argument specifier
+ *
+ * This function performs the translation of the reset argument specifier
+ * values defined in a reset consumer device node. The function allocates a
+ * reset control structure for that device reset, and will be used by the
+ * driver for performing any reset functions on that reset. An idr structure
+ * is allocated and used to map to the reset control structure. This idr
+ * is used by the driver to do reset lookups.
+ *
+ * Return: 0 for successful request, else a corresponding error value
+ */
+static int eswin_reset_of_xlate(struct reset_controller_dev *rcdev,
+				const struct of_phandle_args *reset_spec)
+{
+	struct eswin_reset_data *data = to_eswin_reset_data(rcdev);
+	struct eswin_reset_control *control;
+	int ret;
+
+	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
+		return -EINVAL;
+
+	ret = idr_for_each(&data->idr, eswin_reset_of_xlate_lookup_id,
+			   (void *)reset_spec);
+	if (ret != 0)
+		return ret;
+
+	control = devm_kzalloc(data->dev, sizeof(*control), GFP_KERNEL);
+	if (!control)
+		return -ENOMEM;
+
+	control->dev_id = reset_spec->args[0];
+	control->reset_bit = reset_spec->args[1];
+
+	return idr_alloc(&data->idr, control, 0, 0, GFP_KERNEL);
+}
+
+static const struct of_device_id eswin_reset_dt_ids[] = {
+	{
+		.compatible = "eswin,eic7700-reset",
+	},
+	{ /* sentinel */ },
+};
+
+static int eswin_reset_probe(struct platform_device *pdev)
+{
+	struct eswin_reset_data *data;
+	struct device *parent;
+
+	parent = pdev->dev.parent;
+	if (!parent) {
+		dev_err(&pdev->dev, "no parent\n");
+		return -ENODEV;
+	}
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR(data->regmap)) {
+		dev_err(&pdev->dev, "failed to get parent regmap\n");
+		return PTR_ERR(data->regmap);
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &eswin_reset_ops;
+	data->rcdev.of_node = pdev->dev.of_node;
+	data->rcdev.of_reset_n_cells = 2;
+	data->rcdev.of_xlate = eswin_reset_of_xlate;
+	data->rcdev.dev = &pdev->dev;
+	data->dev = &pdev->dev;
+	idr_init(&data->idr);
+
+	/*clear boot flag so u84 and scpu could be reseted by software*/
+	regmap_set_bits(data->regmap, SYSCRG_CLEAR_BOOT_INFO_OFFSET,
+			CLEAR_BOOT_FLAG_BIT);
+	msleep(50);
+	platform_set_drvdata(pdev, data);
+
+	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+}
+
+static void eswin_reset_remove(struct platform_device *pdev)
+{
+	struct eswin_reset_data *data = platform_get_drvdata(pdev);
+
+	idr_destroy(&data->idr);
+}
+
+static struct platform_driver eswin_reset_driver = {
+	.probe	= eswin_reset_probe,
+	.remove = eswin_reset_remove,
+	.driver = {
+		.name		= "eswin-reset",
+		.of_match_table	= eswin_reset_dt_ids,
+	},
+};
+
+static int __init eswin_reset_init(void)
+{
+	return platform_driver_register(&eswin_reset_driver);
+}
+arch_initcall(eswin_reset_init);
-- 
2.17.1

