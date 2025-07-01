Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A1275B04;
	Tue,  1 Jul 2025 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382724; cv=none; b=W+vSQ9U4f0J5jGLkBgPY2upPKizO2axhJoLQ+9McpbyvneK5iFXJ174ZMUNAbWIXPYOgOogrTJEPw0kqI5daYdNIsSAEapgBu4ImP12+/OTYkoDLWAD0pUwxYh1KzoFQ1+i6N7Wxd3aQs4psHcbow7aZNDITU7WD/UMUkx3dAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382724; c=relaxed/simple;
	bh=+AmOCC/8aNSxpshIwQPDNND0Xf2673OGfbVKFrx6sXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRW/agafLor5LvEhqcU90oGtBrcH+Ti5/SOVJ/z/aygvTGVnmnze5Mck/liKMP7rlnbA58lVQOH36amgfyMh57RTEmLCi8r2NfyeMIv0DadobRN1Enebprgg51pwK0Q7Ux0xhgmqVBawXfFP17p/nLetGQMqnNpY41AcoQV4Ajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mehbIFaG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mehbIFaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751382719;
	bh=+AmOCC/8aNSxpshIwQPDNND0Xf2673OGfbVKFrx6sXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mehbIFaGPSplUxenfkKzZKIYXaUpF5a8ByVKZF0b8Vju+YThPxm8Y53S/Svtn2ue9
	 w4C21dbkOSWtoPCgt3MtWVv4dM0/ReZGtBarNzIUxkkTeceSB1wnWw+6cFJke1O4jI
	 FkdxyvmogAbExTGJjjz7VkJuzHwzvObzav/7ZNbWuw46gj8ZCiWPijilw5R45AtAL1
	 VO7Wvo0MuQx5ZSwR1pw/RfLXizts9eGeBhAXMUIrd22jLiXYqz41kGx1yp5Pja4hl0
	 6jxx4gTzl+OdzjSt+cdcMhGsMAFl2TX70/Li7VLzXOyWLytRExS8e3smmBJiSGYyfz
	 iZaYOcwwTfEwA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A167B17E088B;
	Tue,  1 Jul 2025 17:11:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	m.wilczynski@samsung.com,
	nm@ti.com,
	khilman@baylibre.com,
	kabel@kernel.org,
	quic_hyiwei@quicinc.com,
	pjp@fedoraproject.org,
	tudor.ambarus@linaro.org,
	drew@pdp7.com,
	u.kleine-koenig@baylibre.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	laura.nao@collabora.com,
	kernel@collabora.com
Subject: [RFC PATCH 3/3] firmware: mediatek: Add MediaTek Hardware Voter MCU driver
Date: Tue,  1 Jul 2025 17:11:49 +0200
Message-ID: <20250701151149.136365-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for the MediaTek Hardware Voter (HWV) MCU, a SoC
internal fixed-function MCU used to collect votes from both
the AP and from the various other remote processors present
in the SoC, guaranteeing synchronization of the HW resource
requests between all components of the SoCs and hence avoiding,
for example, unclocked and/or unpowered access to the hardware.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/firmware/mediatek/Kconfig             |   9 +
 drivers/firmware/mediatek/Makefile            |   1 +
 .../firmware/mediatek/mtk-hardware-voter.c    | 430 ++++++++++++++++++
 .../firmware/mediatek/mtk-hardware-voter.h    |  34 ++
 4 files changed, 474 insertions(+)
 create mode 100644 drivers/firmware/mediatek/mtk-hardware-voter.c
 create mode 100644 include/linux/firmware/mediatek/mtk-hardware-voter.h

diff --git a/drivers/firmware/mediatek/Kconfig b/drivers/firmware/mediatek/Kconfig
index f6f16e71fbda..b1b2d8a82358 100644
--- a/drivers/firmware/mediatek/Kconfig
+++ b/drivers/firmware/mediatek/Kconfig
@@ -11,4 +11,13 @@ config MTK_ADSP_IPC
 	  ADSP exists on some mtk processors.
 	  Client might use shared memory to exchange information with ADSP.
 
+config MTK_HARDWARE_VOTER
+	tristate "MediaTek Hardware Resources Voter"
+	depends on MTK_ADSP_MBOX
+	help
+	  Say yes here to add support for the MediaTek Hardware Voter (HWV),
+	  an interface to the HWV MCU which is used to synchronize requests
+	  for hardware resources between host AP (Linux) and the firmwares
+	  that are running on various integrated remote processors.
+
 endmenu
diff --git a/drivers/firmware/mediatek/Makefile b/drivers/firmware/mediatek/Makefile
index 3c0d9d67d646..06de6f4dc0a3 100644
--- a/drivers/firmware/mediatek/Makefile
+++ b/drivers/firmware/mediatek/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_MTK_ADSP_IPC)		+= mtk-adsp-ipc.o
+obj-$(CONFIG_MTK_HARDWARE_VOTER)	+= mtk-hardware-voter.o
diff --git a/drivers/firmware/mediatek/mtk-hardware-voter.c b/drivers/firmware/mediatek/mtk-hardware-voter.c
new file mode 100644
index 000000000000..5e12beb44a4c
--- /dev/null
+++ b/drivers/firmware/mediatek/mtk-hardware-voter.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek Hardware Voter (HWV) MCU communication driver
+ *
+ * Copyright (C) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/firmware/mediatek/mtk-hardware-voter.h>
+
+#define MTK_HWV_REGISTER_WIDTH_BITS	32
+
+#define MTK_HWV_MTCMOS_POLL_DELAY_US	3
+#define MTK_HWV_MTCMOS_DONE_TIMEOUT_US	(10 * USEC_PER_MSEC)
+#define MTK_HWV_MTCMOS_VOTE_TIMEOUT_US	(3 * USEC_PER_MSEC)
+#define MTK_HWV_CLK_DONE_TIMEOUT_US	30
+
+/**
+ * struct mtk_hardware_voter_pmdomain_regs - Hardware Voter power domain data
+ * @set:        Offset of the HWV SET register
+ * @clear:      Offset of the HWV CLEAR register
+ * @done:       Offset of the HWV DONE register
+ * @enable:     Offset of the HWV ENABLE register
+ * @set_sta:    Offset of the HWV SET STATUS register
+ * @clr_sta:    Offset of the HWV CLEAR STATUS register
+ */
+struct mtk_hardware_voter_pmdomain_regs {
+	u16 set;
+	u16 clear;
+	u16 enable;
+	u16 done;
+	u16 set_sta;
+	u16 clr_sta;
+};
+
+/**
+ * struct mtk_hardware_voter_pmdomain_info - Internal HWV pmdomain info structure
+ * @regmap:            Handle to regmap
+ * @regs:              Set of registers for specific Power Domain HWV instance
+ * @index:             Index of the Power Domain relative to this set of registers
+ *
+ * This structure is used only for driver-internal parameters passing.
+ */
+struct mtk_hardware_voter_pmdomain_info {
+	struct regmap *regmap;
+	const struct mtk_hardware_voter_pmdomain_regs *regs;
+	unsigned int index;
+};
+
+/**
+ * struct mtk_hardware_voter_hw_funcs - HWV Version specific callbacks
+ * @clk_enable:        Callback to execute programming sequence to vote for clock
+ * @pmdomain_enable:   Callback to execute programming sequence to vote for pmdomain
+ */
+struct mtk_hardware_voter_hw_funcs {
+	int (*clk_enable)(struct mtk_hardware_voter *hwv,
+			  const struct mtk_hardware_voter_clk_regs *clk_regs,
+			  unsigned int index, bool enable);
+	int (*pmdomain_enable)(struct device *dev,
+			       struct mtk_hardware_voter_pmdomain_info *hwvpd,
+			       unsigned int index, bool enable);
+};
+
+/**
+ * struct mtk_hardware_voter_pdata - SoC-specific platform data
+ * @funcs:             HWV Version-specific register programming sequence functions
+ * @pmdomain_regs:     HWV Version-specific Power Domain register (offset) sets
+ * @num_pmdomain_regs: Number of Power Domain register sets in this HWV
+ */
+struct mtk_hardware_voter_pdata {
+	const struct mtk_hardware_voter_hw_funcs *funcs;
+	const struct mtk_hardware_voter_pmdomain_regs *pmdomain_regs;
+	unsigned int num_pmdomain_regs;
+};
+
+/**
+ * struct mtk_hardware_voter_priv - Driver private structure
+ * @regmap:            Handle to regmap
+ * @pdata:             SoC-specific platform data
+ */
+struct mtk_hardware_voter_priv {
+	struct regmap *regmap;
+	const struct mtk_hardware_voter_pdata *pdata;
+};
+
+static const struct of_device_id mtk_hardware_voter_match[];
+
+/**
+ * mtk_hardware_voter_get_handle() - Get the MediaTek HWV handle for a device
+ * @dev: Pointer to the device that wants to get a HWV handle
+ *
+ * Return:
+ * Pointer to the mtk_hardware_voter handle for success; or
+ * -EPROBE_DEFER pointer error if the HWV instance is not ready
+ * -ENODEV pointer error if the device pointer is missing
+ * -ENOENT pointer error if the HWV device was not found
+ * -EINVAL pointer error for other errors
+ */
+struct mtk_hardware_voter *mtk_hardware_voter_get_handle(struct device *dev)
+{
+	const struct of_device_id *match_id;
+	struct mtk_hardware_voter *hwv;
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	if (!dev || !dev->parent)
+		return ERR_PTR(-ENODEV);
+
+	np = dev->parent->of_node;
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	match_id = of_match_node(mtk_hardware_voter_match, np);
+	if (!match_id)
+		return ERR_PTR(-ENOENT);
+
+	hwv = dev_get_drvdata(&pdev->dev);
+	if (!hwv) {
+		hwv = ERR_PTR(-EPROBE_DEFER);
+		put_device(&pdev->dev);
+		goto end;
+	}
+
+end:
+	of_node_put(np);
+	return hwv;
+}
+
+/**
+ * mtk_hardware_voter_get_by_phandle() - Get the MediaTek HWV handle using DT phandle
+ * @dev: Pointer to the device that wants to get a HWV handle
+ *
+ * The struct device passed to this function must have an associated
+ * devicetree node; this node must have the "mediatek,hardware-voter"
+ * property with a phandle to the Hardware Voter or, if multiple voters
+ * are present, a phandle to the desired Hardware Voter instance.
+ * Return:
+ * Pointer to the mtk_hardware_voter handle for success; or
+ * -EPROBE_DEFER pointer error if the HWV instance is not ready
+ * -ENODEV pointer error if the device pointer is missing
+ * -ENOENT pointer error if the HWV device was not found
+ * -EINVAL pointer error for other errors
+ */
+struct mtk_hardware_voter *mtk_hardware_voter_get_by_phandle(struct device *dev)
+{
+	struct mtk_hardware_voter *hwv;
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "mediatek,hardware-voter", 0);
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		hwv = ERR_PTR(-ENODEV);
+		goto end;
+	}
+
+	hwv = platform_get_drvdata(pdev);
+	if (!hwv) {
+		hwv = ERR_PTR(-EPROBE_DEFER);
+		put_device(&pdev->dev);
+		goto end;
+	}
+
+end:
+	of_node_put(np);
+	return hwv;
+}
+
+/**
+ * mtk_hardware_voter_pmdomain_enable() - Vote power domain enable/disable
+ * @hwv:    Handle to the Hardware Voter instance
+ * @index:  Index of the power domain in the Hardware Voter
+ * @enable: Vote to enable or disable a power domain
+ *
+ * The programming sequence varies with Hardware Voter MCU versions;
+ * this function is responsible for executing a callback to send the
+ * HW Voter version specific register programming sequence to vote for
+ * enabling or disabling a power domain.
+ */
+int mtk_hardware_voter_pmdomain_enable(struct mtk_hardware_voter *hwv,
+				       unsigned int index, bool enable)
+{
+	struct mtk_hardware_voter_pmdomain_info hwv_pmdomain_info;
+	const struct mtk_hardware_voter_pdata *pdata = hwv->priv->pdata;
+	const struct mtk_hardware_voter_pmdomain_regs *regs = pdata->pmdomain_regs;
+	unsigned int register_set_num = index % MTK_HWV_REGISTER_WIDTH_BITS;
+	unsigned int register_set_idx = index / MTK_HWV_REGISTER_WIDTH_BITS;
+
+	if (register_set_num > pdata->num_pmdomain_regs)
+		return -ENXIO;
+
+	if (register_set_idx > (MTK_HWV_REGISTER_WIDTH_BITS - 1))
+		return -EINVAL;
+
+	hwv_pmdomain_info.regmap = hwv->priv->regmap;
+	hwv_pmdomain_info.index = register_set_idx;
+	hwv_pmdomain_info.regs = &regs[register_set_num];
+
+	return pdata->funcs->pmdomain_enable(hwv->dev, &hwv_pmdomain_info, index, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_hardware_voter_pmdomain_enable);
+
+/**
+ * mtk_hardware_voter_clk_enable() - Vote clock gating or ungating
+ * @hwv:    Handle to the Hardware Voter instance
+ * @regs:   Registers for the specific clock domain's Hardware Voter
+ * @index:  Index of the power domain in the Hardware Voter
+ * @enable: Vote to enable or disable a power domain
+ *
+ * The programming sequence varies with Hardware Voter MCU versions;
+ * this function is responsible for executing a callback to send the
+ * HW Voter version specific register programming sequence to vote for
+ * gating or ungating a clock.
+ */
+int mtk_hardware_voter_clk_enable(struct mtk_hardware_voter *hwv,
+				  const struct mtk_hardware_voter_clk_regs *regs,
+				  unsigned int index, bool enable)
+{
+	const struct mtk_hardware_voter_pdata *pdata = hwv->priv->pdata;
+
+	return pdata->funcs->clk_enable(hwv, regs, index, enable);
+}
+EXPORT_SYMBOL_GPL(mtk_hardware_voter_clk_enable);
+
+static bool mtk_hardware_voter_v1_pmdomain_is_disable_done(
+		struct mtk_hardware_voter_pmdomain_info *hwvpd)
+{
+	u32 regs[2] = { hwvpd->regs->done, hwvpd->regs->clr_sta };
+	u32 val[2];
+	u32 mask = BIT(hwvpd->index);
+
+	regmap_multi_reg_read(hwvpd->regmap, regs, val, 2);
+
+	/* Disable is done when the bit is set in DONE, cleared in CLR_STA */
+	return (val[0] & mask) && !(val[1] & mask);
+}
+
+static bool mtk_hardware_voter_v1_pmdomain_is_enable_done(
+		struct mtk_hardware_voter_pmdomain_info *hwvpd)
+{
+	u32 regs[3] = { hwvpd->regs->done, hwvpd->regs->enable, hwvpd->regs->set_sta };
+	u32 val[3];
+	u32 mask = BIT(hwvpd->index);
+
+	regmap_multi_reg_read(hwvpd->regmap, regs, val, 3);
+
+	/* Enable is done when the bit is set in DONE and EN, cleared in SET_STA */
+	return (val[0] & mask) && (val[1] & mask) && !(val[2] & mask);
+}
+
+static int mtk_hardware_voter_v1_pmdomain_enable(struct device *dev,
+						 struct mtk_hardware_voter_pmdomain_info *hwvpd,
+						 unsigned int index, bool enable)
+{
+	const struct mtk_hardware_voter_pmdomain_regs *regs = hwvpd->regs;
+	struct regmap *regmap = hwvpd->regmap;
+	u32 val;
+	int ret;
+
+	/* Make sure the HW Voter is idle and able to accept commands */
+	ret = regmap_read_poll_timeout_atomic(regmap, regs->done, val,
+					      val & BIT(index),
+					      MTK_HWV_MTCMOS_POLL_DELAY_US,
+					      MTK_HWV_MTCMOS_DONE_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Failed to power on: HW Voter busy.\n");
+		return ret;
+	}
+
+	/*
+	 * Instructing the HWV to power on/off the MTCMOS (power domains):
+	 * For power on, the same bit will be cleared from the SET register
+	 * by the hardware immediately after setting it;
+	 * For power off, the bit will be kept set in the CLEAR register
+	 */
+	regmap_write(regmap, enable ? regs->set : regs->clear, BIT(index));
+
+	if (enable) {
+		/*
+		 * Wait until the HWV sets the bit again, signalling that its
+		 * internal state machine was started and it now processing
+		 * the vote command.
+		 */
+		ret = regmap_read_poll_timeout_atomic(regmap, regs->set,
+						      val, val & BIT(index),
+						      0, MTK_HWV_MTCMOS_VOTE_TIMEOUT_US);
+		if (ret) {
+			dev_err(dev, "Failed to power on: HW Voter not starting.\n");
+			return ret;
+		}
+
+		/* Wait for ACK, signalling that the MTCMOS was enabled */
+		ret = readx_poll_timeout_atomic(mtk_hardware_voter_v1_pmdomain_is_enable_done,
+						hwvpd, val, val,
+						MTK_HWV_MTCMOS_POLL_DELAY_US,
+						MTK_HWV_MTCMOS_DONE_TIMEOUT_US);
+		if (ret) {
+			dev_err(dev, "Failed to power on: HW Voter ACK timeout.\n");
+			return ret;
+		}
+	} else {
+		/*
+		 * Wait until the HWV clears the bit, signalling that its
+		 * internal state machine was started and it now processing
+		 * the clear command.
+		 */
+		ret = regmap_read_poll_timeout_atomic(regmap, regs->clear,
+						      val, !(val & BIT(index)),
+						      0, MTK_HWV_MTCMOS_VOTE_TIMEOUT_US);
+		if (ret) {
+			dev_err(dev, "Failed to power off: HW Voter not starting.\n");
+			return ret;
+		}
+
+		/* Poweroff needs 100us for the HW to stabilize */
+		udelay(100);
+
+		/* Wait for ACK, signalling that the MTCMOS was disabled */
+		ret = readx_poll_timeout_atomic(mtk_hardware_voter_v1_pmdomain_is_disable_done,
+						hwvpd, val, val,
+						MTK_HWV_MTCMOS_POLL_DELAY_US,
+						MTK_HWV_MTCMOS_DONE_TIMEOUT_US);
+		if (ret) {
+			dev_err(dev, "Failed to power on: HW Voter ACK timeout.\n");
+			return ret;
+		}
+	};
+
+	return 0;
+}
+
+static int mtk_hardware_voter_v1_clk_enable(struct mtk_hardware_voter *hwv,
+					    const struct mtk_hardware_voter_clk_regs *regs,
+					    unsigned int index, bool enable)
+{
+	struct regmap *regmap = hwv->priv->regmap;
+	u32 val;
+	int ret;
+
+	ret = regmap_write(regmap, enable ? regs->set : regs->clear, BIT(index));
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout_atomic(regmap, regs->status, val,
+					       val & BIT(index),
+					       0, MTK_HWV_CLK_DONE_TIMEOUT_US);
+}
+
+static const struct regmap_config mtk_hardware_voter_regmap_config = {
+	.reg_bits = MTK_HWV_REGISTER_WIDTH_BITS,
+	.val_bits = MTK_HWV_REGISTER_WIDTH_BITS,
+	.reg_stride = 4,
+	.max_register = 0x3000,
+};
+
+static int mtk_hardware_voter_probe(struct platform_device *pdev)
+{
+	struct mtk_hardware_voter_priv *priv;
+	struct mtk_hardware_voter *hwv;
+	struct regmap *regmap;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+				       &mtk_hardware_voter_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Cannot initialize regmap.\n");
+
+	hwv = devm_kzalloc(&pdev->dev, sizeof(*hwv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	hwv->dev = &pdev->dev;
+	hwv->priv = priv;
+
+	priv->pdata = of_device_get_match_data(&pdev->dev);
+	priv->regmap = regmap;
+	platform_set_drvdata(pdev, &hwv);
+
+	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+}
+
+static const struct mtk_hardware_voter_hw_funcs mtk_hwv_v1_funcs = {
+	.clk_enable = mtk_hardware_voter_v1_clk_enable,
+	.pmdomain_enable = mtk_hardware_voter_v1_pmdomain_enable,
+};
+
+static const struct mtk_hardware_voter_pmdomain_regs mtk_hwv_v1_pmdomain_regs[] = {
+	/* SET    CLR     EN     DONE   SETSTA  CLRSTA */
+	{ 0x218, 0x21c, 0x1410, 0x141c, 0x146c, 0x1470 },
+	{ 0x220, 0x224, 0x1420, 0x142c, 0x1474, 0x1478 }
+};
+
+static const struct mtk_hardware_voter_pdata mt6991_hwv_pdata = {
+	.funcs = &mtk_hwv_v1_funcs,
+	.pmdomain_regs = mtk_hwv_v1_pmdomain_regs,
+	.num_pmdomain_regs = ARRAY_SIZE(mtk_hwv_v1_pmdomain_regs),
+};
+
+static const struct of_device_id mtk_hardware_voter_match[] = {
+	{ .compatible = "mediatek,mt6991-hardware-voter", .data = &mt6991_hwv_pdata },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_hardware_voter_driver = {
+	.driver = {
+		.name = "mtk-hardware-voter",
+		.of_match_table = mtk_hardware_voter_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = mtk_hardware_voter_probe,
+};
+builtin_platform_driver(mtk_hardware_voter_driver);
diff --git a/include/linux/firmware/mediatek/mtk-hardware-voter.h b/include/linux/firmware/mediatek/mtk-hardware-voter.h
new file mode 100644
index 000000000000..585a12db393c
--- /dev/null
+++ b/include/linux/firmware/mediatek/mtk-hardware-voter.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef MTK_HARDWARE_VOTER_H
+#define MTK_HARDWARE_VOTER_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct mtk_hardware_voter_clk_regs {
+	u16 set;
+	u16 clear;
+	u16 status;
+};
+
+struct mtk_hardware_voter_priv;
+
+struct mtk_hardware_voter {
+	struct device *dev;
+	struct mtk_hardware_voter_priv *priv;
+};
+
+struct mtk_hardware_voter *mtk_hardware_voter_get_handle(struct device *dev);
+struct mtk_hardware_voter *mtk_hardware_voter_get_by_phandle(struct device *dev);
+int mtk_hardware_voter_clk_enable(struct mtk_hardware_voter *hwv,
+				  const struct mtk_hardware_voter_clk_regs *clk_regs,
+				  unsigned int index, bool enable);
+int mtk_hardware_voter_pmdomain_enable(struct mtk_hardware_voter *hwv,
+				       unsigned int index, bool enable);
+
+#endif /* MTK_HARDWARE_VOTER_H */
-- 
2.49.0

