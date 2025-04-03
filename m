Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00638206F05;
	Thu,  3 Apr 2025 06:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663051; cv=none; b=kioUvL6AGUfwmDmWqsqPXLaaLz9T6xcCfJoWYsDGad1iNy7PR9o1eLugJRYtTPg/3HvAUwwkh8ZowaBDAF7lktCD7E8x8Fyhp7LURrRQVmI4cG2kZ7F+K7uuw5UOanI89Od/h/jx13Y5Kr1PDA2Vxl3DkboNmUJ7IQXqxQ6bwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663051; c=relaxed/simple;
	bh=8hWKitp77IDck8hoCKIBJO+3gKob/Lpbkk2OG4er9Ao=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfIxtA1KnWW4FJs6qEYBQp0bL8kGSB8ONAx3hkbXbkRNA5/7L6xq9A1rjyBEkJMcDcy+HoOEDFZL4K99qRIqNVc9rBLdrvmgjOjezbfGtvJ5aRqP8+ESA6H0JF7fvpHAWM53MGXnyqJIGJrAgHgywTkJr0hys8lkip7wncfIkmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IW7yjui6; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IW7yjui6"
X-UUID: f27977ea105711f08eb9c36241bbb6fb-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6gJRfFUgDxR3NJcSHCZBqNa83odaYPcFqinYa0FxqG0=;
	b=IW7yjui6l8QqvY8icZFhUroJ2atkcg4vnKQmTHmNLD90ZSysJg9JISQjfbKZTgUSeS4bGmjx/FhMKVymRiO5D7m1SVDuyiBvIM2OymViDLfO4W0WOferYKPhkCA+hFGGeqJjp/3acTcNpljFf8UMjKwI3ixRDkolcXhNnLJkONs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:cb43f136-9bb6-4d0c-88eb-b1cc71423e4a,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:89162d8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f27977ea105711f08eb9c36241bbb6fb-20250403
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1900332356; Thu, 03 Apr 2025 14:50:36 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 14:50:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 14:50:34 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 2/2] memory/mediatek: Add an interface to get current DDR data rate
Date: Thu, 3 Apr 2025 14:48:48 +0800
Message-ID: <20250403065030.22761-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250403065030.22761-1-crystal.guo@mediatek.com>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/memory/Kconfig              |   1 +
 drivers/memory/Makefile             |   1 +
 drivers/memory/mediatek/Kconfig     |  20 +++
 drivers/memory/mediatek/Makefile    |   2 +
 drivers/memory/mediatek/mtk-dramc.c | 223 ++++++++++++++++++++++++++++
 5 files changed, 247 insertions(+)
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c82d8d8a16ea..b1698549ff81 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -227,5 +227,6 @@ config STM32_FMC2_EBI
 
 source "drivers/memory/samsung/Kconfig"
 source "drivers/memory/tegra/Kconfig"
+source "drivers/memory/mediatek/Kconfig"
 
 endif
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index d2e6ca9abbe0..c0facf529803 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
+obj-$(CONFIG_MEDIATEK_MC)	+= mediatek/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
new file mode 100644
index 000000000000..eadc11ec0f1c
--- /dev/null
+++ b/drivers/memory/mediatek/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MEDIATEK_MC
+	bool "MediaTek Memory Controller support"
+	default y
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  This option allows to enable MediaTek memory controller drivers,
+	  which may include controllers for DRAM or others.
+
+if MEDIATEK_MC
+
+config MTK_DRAMC
+	tristate "MediaTek DRAMC driver"
+	default y
+	help
+	  This driver is for the DRAM Controller found in MediaTek SoCs
+	  and provides a sysfs interface for reporting the current DRAM
+	  data rate.
+
+endif
diff --git a/drivers/memory/mediatek/Makefile b/drivers/memory/mediatek/Makefile
new file mode 100644
index 000000000000..a1395fc55b41
--- /dev/null
+++ b/drivers/memory/mediatek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MTK_DRAMC)		+= mtk-dramc.o
diff --git a/drivers/memory/mediatek/mtk-dramc.c b/drivers/memory/mediatek/mtk-dramc.c
new file mode 100644
index 000000000000..d54c8e00d4ee
--- /dev/null
+++ b/drivers/memory/mediatek/mtk-dramc.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+
+struct mtk_dramc_pdata {
+	u8 fmeter_version;
+	u8 ref_freq_mhz;
+	const u16 *regs;
+	const u32 *masks;
+	u32 posdiv_purify;
+	u8 prediv;
+	u16 shuffle_offset;
+};
+
+struct mtk_dramc {
+	void __iomem *anaphy_base;
+	void __iomem *ddrphy_base;
+	const struct mtk_dramc_pdata *pdata;
+};
+
+enum mtk_dramc_reg_index {
+	DRAMC_DPHY_DVFS_STA,
+	DRAMC_APHY_SHU_PHYPLL2,
+	DRAMC_APHY_SHU_CLRPLL2,
+	DRAMC_APHY_SHU_PHYPLL3,
+	DRAMC_APHY_SHU_CLRPLL3,
+	DRAMC_APHY_SHU_PHYPLL4,
+	DRAMC_APHY_ARPI0,
+	DRAMC_APHY_CA_ARDLL1,
+	DRAMC_APHY_B0_TX0,
+};
+
+enum mtk_dramc_mask_index {
+	DRAMC_DPHY_DVFS_SHU_LV,
+	DRAMC_DPHY_DVFS_PLL_SEL,
+	DRAMC_APHY_PLL2_SDMPCW,
+	DRAMC_APHY_PLL3_POSDIV,
+	DRAMC_APHY_PLL4_FBKSEL,
+	DRAMC_APHY_ARPI0_SOPEN,
+	DRAMC_APHY_ARDLL1_CK_EN,
+	DRAMC_APHY_B0_TX0_SER_MODE,
+};
+
+static const u16 mtk_dramc_regs_mt8196[] = {
+	[DRAMC_DPHY_DVFS_STA] = 0xe98,
+	[DRAMC_APHY_SHU_PHYPLL2] = 0x908,
+	[DRAMC_APHY_SHU_CLRPLL2] = 0x928,
+	[DRAMC_APHY_SHU_PHYPLL3] = 0x90c,
+	[DRAMC_APHY_SHU_CLRPLL3] = 0x92c,
+	[DRAMC_APHY_SHU_PHYPLL4] = 0x910,
+	[DRAMC_APHY_ARPI0] = 0x0d94,
+	[DRAMC_APHY_CA_ARDLL1] = 0x0d08,
+	[DRAMC_APHY_B0_TX0] = 0x0dc4,
+};
+
+static const u32 mtk_dramc_masks_mt8196[] = {
+	[DRAMC_DPHY_DVFS_SHU_LV] = GENMASK(15, 14),
+	[DRAMC_DPHY_DVFS_PLL_SEL] = GENMASK(25, 25),
+	[DRAMC_APHY_PLL2_SDMPCW] = GENMASK(18, 3),
+	[DRAMC_APHY_PLL3_POSDIV] = GENMASK(13, 11),
+	[DRAMC_APHY_PLL4_FBKSEL] = GENMASK(6, 6),
+	[DRAMC_APHY_ARPI0_SOPEN] = GENMASK(26, 26),
+	[DRAMC_APHY_ARDLL1_CK_EN] = GENMASK(0, 0),
+	[DRAMC_APHY_B0_TX0_SER_MODE] = GENMASK(4, 3),
+};
+
+static unsigned int read_reg_field(void __iomem *base, unsigned int offset, unsigned int mask)
+{
+	unsigned int val = readl(base + offset);
+	unsigned int shift = __ffs(mask);
+
+	return (val & mask) >> shift;
+}
+
+static int mtk_dramc_probe(struct platform_device *pdev)
+{
+	struct mtk_dramc *dramc;
+	const struct mtk_dramc_pdata *pdata;
+
+	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc), GFP_KERNEL);
+	if (!dramc)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
+
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No platform data available\n");
+
+	dramc->pdata = pdata;
+
+	dramc->anaphy_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dramc->anaphy_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->anaphy_base),
+				     "Unable to map ANAPHY base\n");
+
+	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dramc->ddrphy_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->ddrphy_base),
+				     "Unable to map DDRPHY base\n");
+
+	platform_set_drvdata(pdev, dramc);
+	return 0;
+}
+
+static unsigned int mtk_fmeter_v1(struct mtk_dramc *dramc)
+{
+	const struct mtk_dramc_pdata *pdata = dramc->pdata;
+	unsigned int shu_level, pll_sel, offset;
+	unsigned int sdmpcw, posdiv, clkdiv, fbksel, sopen, async_ca, ser_mode;
+	unsigned int prediv_freq, posdiv_freq, vco_freq;
+	unsigned int final_rate;
+
+	shu_level = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
+				   pdata->masks[DRAMC_DPHY_DVFS_SHU_LV]);
+	pll_sel = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
+				 pdata->masks[DRAMC_DPHY_DVFS_PLL_SEL]);
+	offset = pdata->shuffle_offset * shu_level;
+
+	sdmpcw = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ?
+				pdata->regs[DRAMC_APHY_SHU_PHYPLL2] :
+				pdata->regs[DRAMC_APHY_SHU_CLRPLL2]) + offset,
+				pdata->masks[DRAMC_APHY_PLL2_SDMPCW]);
+	posdiv = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ?
+				pdata->regs[DRAMC_APHY_SHU_PHYPLL3] :
+				pdata->regs[DRAMC_APHY_SHU_CLRPLL3]) + offset,
+				pdata->masks[DRAMC_APHY_PLL3_POSDIV]);
+	fbksel = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_SHU_PHYPLL4] + offset,
+				pdata->masks[DRAMC_APHY_PLL4_FBKSEL]);
+	sopen = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_ARPI0] + offset,
+			       pdata->masks[DRAMC_APHY_ARPI0_SOPEN]);
+	async_ca = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_CA_ARDLL1] + offset,
+				  pdata->masks[DRAMC_APHY_ARDLL1_CK_EN]);
+	ser_mode = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_B0_TX0] + offset,
+				  pdata->masks[DRAMC_APHY_B0_TX0_SER_MODE]);
+
+	clkdiv = (ser_mode == 1) ? 1 : 0;
+	posdiv &= ~(pdata->posdiv_purify);
+
+	prediv_freq = pdata->ref_freq_mhz * (sdmpcw >> pdata->prediv);
+	posdiv_freq = (prediv_freq >> posdiv) >> 1;
+	vco_freq = posdiv_freq << fbksel;
+	final_rate = vco_freq >> clkdiv;
+
+	if (sopen == 1 && async_ca == 1)
+		final_rate >>= 1;
+
+	return final_rate;
+}
+
+/**
+ * mtk_dramc_get_data_rate - Calculate the current DRAM data rate
+ * @dev: Device pointer
+ *
+ * Return: DRAM Data Rate in Mbps or negative number for error
+ */
+static unsigned int mtk_dramc_get_data_rate(struct device *dev)
+{
+	struct mtk_dramc *dramc = dev_get_drvdata(dev);
+
+	if (dramc->pdata->fmeter_version == 1)
+		return mtk_fmeter_v1(dramc);
+
+	dev_err(dev, "Frequency meter version %u not supported\n", dramc->pdata->fmeter_version);
+	return -EINVAL;
+}
+
+static ssize_t dram_data_rate_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %u\n",
+			mtk_dramc_get_data_rate(dev));
+}
+
+static DEVICE_ATTR_RO(dram_data_rate);
+
+static struct attribute *mtk_dramc_attrs[] = {
+	&dev_attr_dram_data_rate.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mtk_dramc);
+
+static const struct mtk_dramc_pdata dramc_pdata_mt8196 = {
+	.fmeter_version = 1,
+	.ref_freq_mhz = 26,
+	.regs = mtk_dramc_regs_mt8196,
+	.masks = mtk_dramc_masks_mt8196,
+	.posdiv_purify = BIT(2),
+	.prediv = 7,
+	.shuffle_offset = 0x700,
+};
+
+static const struct of_device_id mtk_dramc_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-dramc", .data = &dramc_pdata_mt8196 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
+
+static struct platform_driver mtk_dramc_driver = {
+	.probe = mtk_dramc_probe,
+	.driver = {
+		.name = "mtk-dramc",
+		.of_match_table = mtk_dramc_of_ids,
+		.dev_groups = mtk_dramc_groups,
+	},
+};
+module_platform_driver(mtk_dramc_driver);
+
+MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0

