Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF301442E8;
	Fri,  7 Feb 2025 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892695; cv=none; b=Hc2Vqch4NgNBqJj0YnP36vgRZjyMjHFw+wmd2ZwA4zhwhmGuAiO2JxKxRgsf9xQ9c3fYAsTAYLGVRhVDPeyVL9GQC0Ek+Ji8dcOeqAyPwp7+K8RwjORhs3RWqnklVoKVNSZu+3q0DrItBkEUuse6w1r+YI97pIXpa7gL9s+trfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892695; c=relaxed/simple;
	bh=O4sHxhcO15PAPCihAs8/kH5SnW1MXT4s7gluuVq6hzY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aj0QgCXTQFhG1ieFqNUnsqi0nAN2e3pcFEd4+fG/pTJyKiO6hzOUvPhpF5RRmFWJqo52DvWqprwjHVi1svwSRSfVAA2szLyBiv3qm82qCKulouQ2PnwGy+X81hzXZ+Z67puwAYrtLHTrFmrCZxdVdrMcIJxtO9QhiaZDa3+xhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZkvWfVAh; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZkvWfVAh"
X-UUID: 1b72e76ee4f511efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=svOZaxnlaASohhDS3XSmTFkaoFSdzYryto7BxNGEFFo=;
	b=ZkvWfVAhgZnZzjgTJXw6ePXoIuTEgRIXeWkWQWF5AtuU60HJ+eCuOQxaXBFcGiEuiXEHBp3Lloz3cJZzAUIDSIumIRZPhvd4uDLfDxGsB4NHz8ZLJRy5bCHg4Wy7I+GHBk/DzLWyYVO5A14F4cVh7LD3RtvycT9rYw8Ul5Ju0DY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f2833729-75d8-4d9a-9c55-e5a2b9439e04,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:278d45ff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1b72e76ee4f511efbd192953cf12861f-20250207
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 400064743; Fri, 07 Feb 2025 09:44:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 09:44:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 09:44:43 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, kernel test robot
	<lkp@intel.com>
Subject: [v2,1/2] memory/mediatek: Add an interface to get current DDR data rate
Date: Fri, 7 Feb 2025 09:42:47 +0800
Message-ID: <20250207014437.17920-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250207014437.17920-1-crystal.guo@mediatek.com>
References: <20250207014437.17920-1-crystal.guo@mediatek.com>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412210955.FvO0Pee3-lkp@intel.
com/
Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/memory/Kconfig              |   1 +
 drivers/memory/Makefile             |   1 +
 drivers/memory/mediatek/Kconfig     |  21 +++
 drivers/memory/mediatek/Makefile    |   2 +
 drivers/memory/mediatek/mtk-dramc.c | 196 ++++++++++++++++++++++++++++
 5 files changed, 221 insertions(+)
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
index 000000000000..3f238e0d9647
--- /dev/null
+++ b/drivers/memory/mediatek/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MEDIATEK_MC
+	bool "MediaTek Memory Controller support"
+	help
+	  This option allows to enable MediaTek memory controller drivers,
+	  which may include controllers for DRAM or others.
+	  Select Y here if you need support for MediaTek memory controller.
+	  If you don't need, select N.
+
+if MEDIATEK_MC
+
+config MTK_DRAMC
+	tristate "MediaTek DRAMC driver"
+	default y
+	help
+	  This option selects the MediaTek DRAMC driver, which provides
+	  an interface for reporting the current data rate of DRAM.
+	  Select Y here if you need support for the MediaTek DRAMC driver.
+	  If you don't need, select N.
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
index 000000000000..d452483a98ce
--- /dev/null
+++ b/drivers/memory/mediatek/mtk-dramc.c
@@ -0,0 +1,196 @@
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
+#define POSDIV_PURIFY	BIT(2)
+#define PREDIV		7
+#define REF_FREQUENCY	26
+#define SHUFFLE_OFFSET	0x700
+
+/*--------------------------------------------------------------------------*/
+/* Register Offset                                                          */
+/*--------------------------------------------------------------------------*/
+#define DPHY_DVFS_STA		0x0e98
+#define APHY_PHYPLL2		0x0908
+#define APHY_CLRPLL2		0x0928
+#define APHY_PHYPLL3		0x090c
+#define APHY_CLRPLL3		0x092c
+#define APHY_PHYPLL4		0x0910
+#define APHY_ARPI0		0x0d94
+#define APHY_CA_ARDLL1		0x0d08
+#define APHY_B0_TX0		0x0dc4
+
+/*--------------------------------------------------------------------------*/
+/* Register Mask                                                            */
+/*--------------------------------------------------------------------------*/
+#define DPHY_DVFS_SHU_LV	GENMASK(15, 14)
+#define DPHY_DVFS_PLL_SEL	GENMASK(25, 25)
+#define APHY_PLL2_SDMPCW	GENMASK(18, 3)
+#define APHY_PLL3_POSDIV	GENMASK(13, 11)
+#define APHY_PLL4_FBKSEL	GENMASK(6, 6)
+#define APHY_ARPI0_SOPEN	GENMASK(26, 26)
+#define APHY_ARDLL1_CK_EN	GENMASK(0, 0)
+#define APHY_B0_TX0_SER_MODE	GENMASK(4, 3)
+
+static unsigned int read_reg_field(void __iomem *base, unsigned int offset, unsigned int mask)
+{
+	unsigned int val = readl(base + offset);
+	unsigned int shift = __ffs(mask);
+
+	return (val & mask) >> shift;
+}
+
+struct mtk_dramc_pdata {
+	unsigned int fmeter_version;
+};
+
+struct mtk_dramc_dev_t {
+	void __iomem *anaphy_base;
+	void __iomem *ddrphy_base;
+	const struct mtk_dramc_pdata *pdata;
+};
+
+static int mtk_dramc_probe(struct platform_device *pdev)
+{
+	struct mtk_dramc_dev_t *dramc;
+	const struct mtk_dramc_pdata *pdata;
+	int ret;
+
+	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc_dev_t), GFP_KERNEL);
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
+	if (IS_ERR(dramc->anaphy_base)) {
+		ret = PTR_ERR(dramc->anaphy_base);
+		return dev_err_probe(&pdev->dev, ret, "Unable to map DDRPHY NAO base\n");
+	}
+
+	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dramc->ddrphy_base)) {
+		ret = PTR_ERR(dramc->ddrphy_base);
+		return dev_err_probe(&pdev->dev, ret, "Unable to map DDRPHY AO base\n");
+	}
+
+	platform_set_drvdata(pdev, dramc);
+	return 0;
+}
+
+static unsigned int mtk_fmeter_v1(struct mtk_dramc_dev_t *dramc)
+{
+	unsigned int shu_level, pll_sel, offset;
+	unsigned int sdmpcw, posdiv, ckdiv4, fbksel, sopen, async_ca, ser_mode;
+	unsigned int perdiv_freq, posdiv_freq, vco_freq;
+	unsigned int final_rate;
+
+	shu_level = read_reg_field(dramc->ddrphy_base, DPHY_DVFS_STA, DPHY_DVFS_SHU_LV);
+	pll_sel = read_reg_field(dramc->ddrphy_base, DPHY_DVFS_STA, DPHY_DVFS_PLL_SEL);
+	offset = SHUFFLE_OFFSET * shu_level;
+
+	sdmpcw = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ? APHY_PHYPLL2 : APHY_CLRPLL2) + offset,
+				APHY_PLL2_SDMPCW);
+	posdiv = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ? APHY_PHYPLL3 : APHY_CLRPLL3) + offset,
+				APHY_PLL3_POSDIV);
+	fbksel = read_reg_field(dramc->anaphy_base, APHY_PHYPLL4 + offset, APHY_PLL4_FBKSEL);
+	sopen = read_reg_field(dramc->anaphy_base, APHY_ARPI0 + offset, APHY_ARPI0_SOPEN);
+	async_ca = read_reg_field(dramc->anaphy_base, APHY_CA_ARDLL1 + offset, APHY_ARDLL1_CK_EN);
+	ser_mode = read_reg_field(dramc->anaphy_base, APHY_B0_TX0 + offset, APHY_B0_TX0_SER_MODE);
+
+	ckdiv4 = (ser_mode == 1) ? 1 : 0;
+	posdiv &= ~(POSDIV_PURIFY);
+
+	perdiv_freq = REF_FREQUENCY * (sdmpcw >> PREDIV);
+	posdiv_freq = (perdiv_freq >> posdiv) >> 1;
+	vco_freq = posdiv_freq << fbksel;
+	final_rate = vco_freq >> ckdiv4;
+
+	if (sopen == 1 && async_ca == 1)
+		final_rate >>= 1;
+
+	return final_rate;
+}
+
+/*
+ * mtk_dramc_get_data_rate - calculate DRAM data rate
+ *
+ * Returns DRAM data rate (MB/s)
+ */
+static unsigned int mtk_dramc_get_data_rate(struct device *dev)
+{
+	struct mtk_dramc_dev_t *dramc_dev = dev_get_drvdata(dev);
+
+	if (!dramc_dev) {
+		dev_err(dev, "DRAMC device data not found\n");
+		return -EINVAL;
+	}
+
+	if (dramc_dev->pdata) {
+		if (dramc_dev->pdata->fmeter_version == 1)
+			return mtk_fmeter_v1(dramc_dev);
+
+		dev_err(dev, "Unsupported fmeter version\n");
+		return -EINVAL;
+	}
+	dev_err(dev, "DRAMC platform data not found\n");
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
+	.fmeter_version = 1
+};
+
+static const struct of_device_id mtk_dramc_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-dramc", .data = &dramc_pdata_mt8196 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
+
+static struct platform_driver mtk_dramc_driver = {
+	.probe = mtk_dramc_probe,
+	.driver = {
+		.name = "mtk_dramc_drv",
+		.of_match_table = mtk_dramc_of_ids,
+		.dev_groups = mtk_dramc_groups,
+	},
+};
+
+module_platform_driver(mtk_dramc_driver);
+
+MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0

