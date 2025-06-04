Received: from azure-sdnproxy.icoremail.net (l-sdnproxy.icoremail.net [20.188.111.126])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1177479F2;
	Wed,  4 Jun 2025 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.188.111.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027209; cv=none; b=E9RDz+TnVn0ExOZvFrkG5ECRNg3VxkaDV4i59XMveoVyTDSbchIIbQJ8VH3hiEiEQBEM6HiYxd/EUU9bqBBkdADLkt/S7omzjbnQ8/KHZ4QgCLjInCx5G+lSXFenDo4JMI0RVzygfBhFnWbLi/Mztbh+3BUcHSmt/ufQOB845Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027209; c=relaxed/simple;
	bh=0raP6kQ+xdKD/BKhewzzU6dHTKE5TG1RBJh6rBA9LCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZ79XT9D7od1ZORL96NuQaFn1KkAumw93WVcrgYFx4uk1/IuNZXzxNHy2UtbofphZMh+/YpXdPPl3Ca0kJ1RQpAz251Th24r65KAjfUiv3FJ7TtRXtanA903TpBBMD0DF+XQpsAkNRUaUWw5n02m3JrSYQgF2nIAf+/KfudeQ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=20.188.111.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgAnuZJ+CUBo7WKaAA--.10072S2;
	Wed, 04 Jun 2025 16:53:20 +0800 (CST)
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
Subject: [PATCH v2 2/2] reset: eswin: Add eic7700 reset driver
Date: Wed,  4 Jun 2025 16:53:16 +0800
Message-Id: <20250604085316.2211-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250604085124.2098-1-dongxuyang@eswincomputing.com>
References: <20250604085124.2098-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAnuZJ+CUBo7WKaAA--.10072S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFW7Kry5GrW7Gry3CFy8Xwb_yoWfArW5pF
	WrGFW3Jr4UJr4fWw4xJryv9F4ag3Z3KFyUGrZrKw4Iyw13ta4UJF48tFyrtFyDCryDXFy5
	KF12gayruFnxtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHCJQUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add support for reset controller in eic7700 series chips.
Provide functionality for asserting and deasserting resets
on the chip.

Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/reset/Kconfig         |  10 ++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-eic7700.c | 234 ++++++++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)
 create mode 100644 drivers/reset/reset-eic7700.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d85be5899da6..82f829f4c9f0 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -66,6 +66,16 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216.
 
+config RESET_EIC7700
+	bool "Reset controller driver for ESWIN SoCs"
+	depends on ARCH_ESWIN || COMPILE_TEST
+	default ARCH_ESWIN
+	help
+	  This enables the reset controller driver for ESWIN SoCs. This driver is
+	  specific to ESWIN SoCs and should only be enabled if using such hardware.
+	  The driver supports eic7700 series chips and provides functionality for
+	  asserting and deasserting resets on the chip.
+
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
 	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 91e6348e3351..ceafbad0555c 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
diff --git a/drivers/reset/reset-eic7700.c b/drivers/reset/reset-eic7700.c
new file mode 100644
index 000000000000..e651016ea042
--- /dev/null
+++ b/drivers/reset/reset-eic7700.c
@@ -0,0 +1,234 @@
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
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define SYSCRG_CLEAR_BOOT_INFO_OFFSET 0x30C
+#define CLEAR_BOOT_FLAG_BIT BIT(0)
+#define SYSCRG_RESET_OFFSET 0x400
+
+/**
+ * struct eswin_reset_data - reset controller information structure
+ * @rcdev: reset controller entity
+ * @dev: reset controller device pointer
+ * @idr: idr structure for mapping ids to reset control structures
+ * @regmap: reset controller device register map
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
+	if (!control)
+		return -EINVAL;
+
+	if (assert)
+		ret = regmap_clear_bits(data->regmap, SYSCRG_RESET_OFFSET +
+						       control->dev_id * sizeof(u32),
+							   control->reset_bit);
+	else
+		ret = regmap_set_bits(data->regmap, SYSCRG_RESET_OFFSET +
+						     control->dev_id * sizeof(u32),
+						     control->reset_bit);
+
+	return ret;
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
+static int eswin_reset_reset(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	int ret;
+
+	ret = eswin_reset_assert(rcdev, id);
+	if (ret != 0)
+		return ret;
+
+	usleep_range(10, 15);
+	ret = eswin_reset_deassert(rcdev, id);
+	if (ret != 0)
+		return ret;
+
+	return 0;
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
+
+	return 0;
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
+	if (ret)
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
+	{ /* sentinel */ }
+};
+
+static int eswin_reset_probe(struct platform_device *pdev)
+{
+	struct eswin_reset_data *data;
+	struct device *dev = &pdev->dev;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap), "failed to get regmap!\n");
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
+	/* clear boot flag so u84 and scpu could be reseted by software */
+	regmap_set_bits(data->regmap, SYSCRG_CLEAR_BOOT_INFO_OFFSET,
+			CLEAR_BOOT_FLAG_BIT);
+	msleep(50);
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

