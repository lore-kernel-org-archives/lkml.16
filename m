Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E41E521;
	Thu,  6 Feb 2025 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845113; cv=none; b=NcwInr/Uj299mIjRLD3+JYAakagHvyVOYmLVe3yGKBMnRlrFaoPDxXDrFsaQtoAb5e093/fMAv3a80+rrVWNyCXrsaQF4ocUVXQRnxXRpVCtOFRc9LhCaWAv8skAjwQ4k5YXXjgeybb7qrjTBuARc/MniIkD23AM4u/HVgITkb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845113; c=relaxed/simple;
	bh=rkNudyxzLV0xT4nobg+YhI6/F/UFCIGHp/foaKx+8f8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PANH+7k/awmUfFeyYqVd3dkJEXU/whW9iFiTZkWmHlRPChflMGrjwotposyuFKdPHq30fxeb8Hkm6cmVvoQOfpw7aNSAcHGeEIUdU5BOLavUL0MQjQiIAQaTHoQoa5zhInJIKXADlrIE8IA/Ue/eYfp/lLB6NRfE/sKsz2coN5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JWnn65dE; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JWnn65dE"
X-UUID: 34b6fe5ce48411efbd192953cf12861f-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xXO6q6GOoTrA9SLSZ2Klye5KCyvkfg/5Z7SdBYoT9MA=;
	b=JWnn65dElcnSxJfGiPbWluIOmnvXsLCE+ET5/GTKp1Tm+wwIiKfEmGnl32PIcG6pOn/+xdMGP78ebSH2hHZ+9NEyI76/jqI/q8lLPyD5XkhEyV2r7yw3t9nsZysrFgPu/e9s2JwCnC27jQ8jfw0PbCuyQJENfJxM3VyVR8ygNks=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:efada789-3382-461e-add4-b33783935b9c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:60aa074,CLOUDID:d3a2243e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 34b6fe5ce48411efbd192953cf12861f-20250206
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1154953471; Thu, 06 Feb 2025 20:16:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Feb 2025 20:16:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Feb 2025 20:16:32 +0800
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
Date: Thu, 6 Feb 2025 20:16:08 +0800
Message-ID: <20250206121629.12186-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206121629.12186-1-crystal.guo@mediatek.com>
References: <20250206121629.12186-1-crystal.guo@mediatek.com>
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
 drivers/memory/Makefile                |   2 +-
 drivers/memory/mediatek/Kconfig        |   6 +-
 drivers/memory/mediatek/mtk-dramc.c    | 415 +++++++++----------------
 include/linux/soc/mediatek/mtk-dramc.h |  41 ---
 4 files changed, 147 insertions(+), 317 deletions(-)
 delete mode 100644 include/linux/soc/mediatek/mtk-dramc.h

diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index cf1091449d2e..c0facf529803 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
-obj-$(CONFIG_HAVE_MTK_MC)	+= mediatek/
+obj-$(CONFIG_MEDIATEK_MC)	+= mediatek/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
index 00764cdb157e..3f238e0d9647 100644
--- a/drivers/memory/mediatek/Kconfig
+++ b/drivers/memory/mediatek/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config HAVE_MTK_MC
+config MEDIATEK_MC
 	bool "MediaTek Memory Controller support"
 	help
 	  This option allows to enable MediaTek memory controller drivers,
@@ -7,11 +7,11 @@ config HAVE_MTK_MC
 	  Select Y here if you need support for MediaTek memory controller.
 	  If you don't need, select N.
 
-if HAVE_MTK_MC
+if MEDIATEK_MC
 
 config MTK_DRAMC
 	tristate "MediaTek DRAMC driver"
-	depends on HAVE_MTK_MC
+	default y
 	help
 	  This option selects the MediaTek DRAMC driver, which provides
 	  an interface for reporting the current data rate of DRAM.
diff --git a/drivers/memory/mediatek/mtk-dramc.c b/drivers/memory/mediatek/mtk-dramc.c
index 9c2c8e187a4a..d452483a98ce 100644
--- a/drivers/memory/mediatek/mtk-dramc.c
+++ b/drivers/memory/mediatek/mtk-dramc.c
@@ -1,260 +1,133 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2024 MediaTek Inc.
+ * Copyright (c) 2025 MediaTek Inc.
  */
-
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/printk.h>
-#include <linux/io.h>
-#include <linux/soc/mediatek/mtk-dramc.h>
-
-static struct platform_device *dramc_pdev;
-static struct platform_driver dramc_drv;
 
-static int fmeter_init(struct platform_device *pdev,
-		       struct fmeter_dev_t *fmeter_dev_ptr, unsigned int fmeter_version)
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
 {
-	struct device_node *dramc_node = pdev->dev.of_node;
-	int ret;
+	unsigned int val = readl(base + offset);
+	unsigned int shift = __ffs(mask);
 
-	ret = of_property_read_u32(dramc_node,
-				   "crystal-freq", &(fmeter_dev_ptr->crystal_freq));
-	ret |= of_property_read_u32(dramc_node,
-				    "shu-of", &(fmeter_dev_ptr->shu_of));
-	ret |= of_property_read_u32_array(dramc_node,
-					  "shu-lv", (unsigned int *)&(fmeter_dev_ptr->shu_lv), 3);
-	ret |= of_property_read_u32_array(dramc_node,
-					  "pll-id", (unsigned int *)&(fmeter_dev_ptr->pll_id), 3);
-	ret |= of_property_read_u32_array(dramc_node,
-					  "sdmpcw", (unsigned int *)(fmeter_dev_ptr->sdmpcw), 6);
-	ret |= of_property_read_u32_array(dramc_node,
-					  "posdiv", (unsigned int *)(fmeter_dev_ptr->posdiv), 6);
-	ret |= of_property_read_u32_array(dramc_node,
-					  "fbksel", (unsigned int *)(fmeter_dev_ptr->fbksel), 6);
-	ret |= of_property_read_u32_array(dramc_node,
-					  "dqsopen", (unsigned int *)(fmeter_dev_ptr->dqsopen), 6);
-	if (fmeter_version == 1) {
-		fmeter_dev_ptr->version = 1;
-		ret |= of_property_read_u32_array(dramc_node,
-			"async-ca", (unsigned int *)(fmeter_dev_ptr->async_ca), 6);
-		ret |= of_property_read_u32_array(dramc_node,
-			"dq-ser-mode", (unsigned int *)(fmeter_dev_ptr->dq_ser_mode), 6);
-	}
-	return ret;
+	return (val & mask) >> shift;
 }
 
-static ssize_t dram_data_rate_show(struct device_driver *driver, char *buf)
-{
-	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %d\n",
-		mtk_dramc_get_data_rate());
-}
+struct mtk_dramc_pdata {
+	unsigned int fmeter_version;
+};
 
-static DRIVER_ATTR_RO(dram_data_rate);
+struct mtk_dramc_dev_t {
+	void __iomem *anaphy_base;
+	void __iomem *ddrphy_base;
+	const struct mtk_dramc_pdata *pdata;
+};
 
-static int dramc_probe(struct platform_device *pdev)
+static int mtk_dramc_probe(struct platform_device *pdev)
 {
-	struct device_node *dramc_node = pdev->dev.of_node;
-	struct dramc_dev_t *dramc_dev_ptr;
-	unsigned int fmeter_version;
-	struct resource *res;
-	unsigned int i, size;
+	struct mtk_dramc_dev_t *dramc;
+	const struct mtk_dramc_pdata *pdata;
 	int ret;
 
-	pr_info("%s: module probe.\n", __func__);
-	dramc_pdev = pdev;
-	dramc_dev_ptr = devm_kmalloc(&pdev->dev,
-				     sizeof(struct dramc_dev_t), GFP_KERNEL);
+	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc_dev_t), GFP_KERNEL);
+	if (!dramc)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
 
-	if (!dramc_dev_ptr)
-		return -ENOMEM;
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No platform data available\n");
 
-	ret = of_property_read_u32(dramc_node,
-				   "support-ch-cnt", &dramc_dev_ptr->support_ch_cnt);
-	if (ret) {
-		pr_info("%s: get support_ch_cnt fail\n", __func__);
-		return -EINVAL;
-	}
+	dramc->pdata = pdata;
 
-	dramc_dev_ptr->sleep_base = of_iomap(dramc_node,
-					     dramc_dev_ptr->support_ch_cnt * 4);
-	if (IS_ERR(dramc_dev_ptr->sleep_base)) {
-		pr_info("%s: unable to map sleep base\n", __func__);
-		return -EINVAL;
-	}
-
-	size = sizeof(phys_addr_t) * dramc_dev_ptr->support_ch_cnt;
-	dramc_dev_ptr->dramc_chn_base_ao = devm_kmalloc(&pdev->dev,
-							size, GFP_KERNEL);
-	if (!(dramc_dev_ptr->dramc_chn_base_ao))
-		return -ENOMEM;
-	dramc_dev_ptr->dramc_chn_base_nao = devm_kmalloc(&pdev->dev,
-							 size, GFP_KERNEL);
-	if (!(dramc_dev_ptr->dramc_chn_base_nao))
-		return -ENOMEM;
-	dramc_dev_ptr->ddrphy_chn_base_ao = devm_kmalloc(&pdev->dev,
-							 size, GFP_KERNEL);
-	if (!(dramc_dev_ptr->ddrphy_chn_base_ao))
-		return -ENOMEM;
-	dramc_dev_ptr->ddrphy_chn_base_nao = devm_kmalloc(&pdev->dev,
-							  size, GFP_KERNEL);
-	if (!(dramc_dev_ptr->ddrphy_chn_base_nao))
-		return -ENOMEM;
-
-	for (i = 0; i < dramc_dev_ptr->support_ch_cnt; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		dramc_dev_ptr->dramc_chn_base_ao[i] =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(dramc_dev_ptr->dramc_chn_base_ao[i])) {
-			pr_info("%s: unable to map ch%d DRAMC AO base\n",
-				__func__, i);
-			return -EINVAL;
-		}
-
-		res = platform_get_resource(pdev, IORESOURCE_MEM,
-					    i + dramc_dev_ptr->support_ch_cnt);
-		dramc_dev_ptr->dramc_chn_base_nao[i] =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(dramc_dev_ptr->dramc_chn_base_nao[i])) {
-			pr_info("%s: unable to map ch%d DRAMC NAO base\n",
-				__func__, i);
-			return -EINVAL;
-		}
-
-		res = platform_get_resource(pdev, IORESOURCE_MEM,
-					    i + dramc_dev_ptr->support_ch_cnt * 2);
-		dramc_dev_ptr->ddrphy_chn_base_ao[i] =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(dramc_dev_ptr->ddrphy_chn_base_ao[i])) {
-			pr_info("%s: unable to map ch%d DDRPHY AO base\n",
-				__func__, i);
-			return -EINVAL;
-		}
-
-		res = platform_get_resource(pdev, IORESOURCE_MEM,
-					    i + dramc_dev_ptr->support_ch_cnt * 3);
-		dramc_dev_ptr->ddrphy_chn_base_nao[i] =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(dramc_dev_ptr->ddrphy_chn_base_nao[i])) {
-			pr_info("%s: unable to map ch%d DDRPHY NAO base\n",
-				__func__, i);
-			return -EINVAL;
-		}
+	dramc->anaphy_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dramc->anaphy_base)) {
+		ret = PTR_ERR(dramc->anaphy_base);
+		return dev_err_probe(&pdev->dev, ret, "Unable to map DDRPHY NAO base\n");
 	}
 
-	ret = of_property_read_u32(dramc_node, "fmeter-version", &fmeter_version);
-	if (ret) {
-		pr_info("%s: get fmeter_version fail\n", __func__);
-		return -EINVAL;
-	}
-	pr_info("%s: fmeter_version(%d)\n", __func__, fmeter_version);
-
-	if (fmeter_version == 1) {
-		dramc_dev_ptr->fmeter_dev_ptr = devm_kmalloc(&pdev->dev,
-							     sizeof(struct fmeter_dev_t),
-							     GFP_KERNEL);
-		if (!(dramc_dev_ptr->fmeter_dev_ptr)) {
-			pr_info("%s: memory  alloc fail\n", __func__);
-			return -ENOMEM;
-		}
-		ret = fmeter_init(pdev, dramc_dev_ptr->fmeter_dev_ptr, fmeter_version);
-		if (ret) {
-			pr_info("%s: fmeter_init fail\n", __func__);
-			return -EINVAL;
-		}
-	} else {
-		dramc_dev_ptr->fmeter_dev_ptr = NULL;
+	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dramc->ddrphy_base)) {
+		ret = PTR_ERR(dramc->ddrphy_base);
+		return dev_err_probe(&pdev->dev, ret, "Unable to map DDRPHY AO base\n");
 	}
-	ret = driver_create_file(pdev->dev.driver, &driver_attr_dram_data_rate);
-	if (ret) {
-		pr_info("%s: fail to create dram_data_rate sysfs\n", __func__);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, dramc_dev_ptr);
-	pr_info("%s: DRAM data rate = %d\n", __func__,
-		mtk_dramc_get_data_rate());
 
-	return ret;
+	platform_set_drvdata(pdev, dramc);
+	return 0;
 }
 
-static unsigned int fmeter_v1(struct dramc_dev_t *dramc_dev_ptr)
+static unsigned int mtk_fmeter_v1(struct mtk_dramc_dev_t *dramc)
 {
-	struct fmeter_dev_t *fmeter_dev_ptr =
-		(struct fmeter_dev_t *)dramc_dev_ptr->fmeter_dev_ptr;
-	unsigned int shu_lv_val;
-	unsigned int pll_id_val;
-	unsigned int sdmpcw_val;
-	unsigned int posdiv_val;
-	unsigned int ckdiv4_val;
-	unsigned int offset;
-	unsigned int vco_freq;
-	unsigned int fbksel;
-	unsigned int dqsopen;
-	unsigned int async_ca;
-	unsigned int dq_ser_mode;
-
-	shu_lv_val = (readl(dramc_dev_ptr->ddrphy_chn_base_ao[0] +
-		fmeter_dev_ptr->shu_lv.offset) &
-		fmeter_dev_ptr->shu_lv.mask) >>
-		fmeter_dev_ptr->shu_lv.shift;
-
-	pll_id_val = (readl(dramc_dev_ptr->ddrphy_chn_base_ao[0] +
-		fmeter_dev_ptr->pll_id.offset) &
-		fmeter_dev_ptr->pll_id.mask) >>
-		fmeter_dev_ptr->pll_id.shift;
-
-	offset = fmeter_dev_ptr->sdmpcw[pll_id_val].offset +
-		fmeter_dev_ptr->shu_of * shu_lv_val;
-	sdmpcw_val = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
-		fmeter_dev_ptr->sdmpcw[pll_id_val].mask) >>
-		fmeter_dev_ptr->sdmpcw[pll_id_val].shift;
-
-	offset = fmeter_dev_ptr->posdiv[pll_id_val].offset +
-		fmeter_dev_ptr->shu_of * shu_lv_val;
-	posdiv_val = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
-		fmeter_dev_ptr->posdiv[pll_id_val].mask) >>
-		fmeter_dev_ptr->posdiv[pll_id_val].shift;
-
-	offset = fmeter_dev_ptr->fbksel[pll_id_val].offset +
-		fmeter_dev_ptr->shu_of * shu_lv_val;
-	fbksel = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
-		fmeter_dev_ptr->fbksel[pll_id_val].mask) >>
-		fmeter_dev_ptr->fbksel[pll_id_val].shift;
-
-	offset = fmeter_dev_ptr->dqsopen[pll_id_val].offset +
-		fmeter_dev_ptr->shu_of * shu_lv_val;
-	dqsopen = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
-		fmeter_dev_ptr->dqsopen[pll_id_val].mask) >>
-		fmeter_dev_ptr->dqsopen[pll_id_val].shift;
-
-	offset = fmeter_dev_ptr->async_ca[pll_id_val].offset +
-		fmeter_dev_ptr->shu_of * shu_lv_val;
-	async_ca = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
-		fmeter_dev_ptr->async_ca[pll_id_val].mask) >>
-		fmeter_dev_ptr->async_ca[pll_id_val].shift;
-
-	offset = fmeter_dev_ptr->dq_ser_mode[pll_id_val].offset +
-		fmeter_dev_ptr->shu_of * shu_lv_val;
-	dq_ser_mode = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
-		fmeter_dev_ptr->dq_ser_mode[pll_id_val].mask) >>
-		fmeter_dev_ptr->dq_ser_mode[pll_id_val].shift;
-	ckdiv4_val = (dq_ser_mode == 1); // 1: DIV4, 2: DIV8, 3: DIV16
-
-	posdiv_val &= ~(0x4);
-
-	vco_freq = ((fmeter_dev_ptr->crystal_freq) *
-		(sdmpcw_val >> 7)) >> posdiv_val >> 1 >> ckdiv4_val
-		<< fbksel;
-
-	if ((dqsopen == 1) && (async_ca == 1))
-		vco_freq >>= 1;
-
-	return vco_freq;
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
 }
 
 /*
@@ -262,64 +135,62 @@ static unsigned int fmeter_v1(struct dramc_dev_t *dramc_dev_ptr)
  *
  * Returns DRAM data rate (MB/s)
  */
-unsigned int mtk_dramc_get_data_rate(void)
+static unsigned int mtk_dramc_get_data_rate(struct device *dev)
 {
-	struct dramc_dev_t *dramc_dev_ptr;
-	struct fmeter_dev_t *fmeter_dev_ptr;
+	struct mtk_dramc_dev_t *dramc_dev = dev_get_drvdata(dev);
 
-	if (!dramc_pdev)
-		return 0;
-
-	dramc_dev_ptr =
-		(struct dramc_dev_t *)platform_get_drvdata(dramc_pdev);
+	if (!dramc_dev) {
+		dev_err(dev, "DRAMC device data not found\n");
+		return -EINVAL;
+	}
 
-	fmeter_dev_ptr = (struct fmeter_dev_t *)dramc_dev_ptr->fmeter_dev_ptr;
-	if (!fmeter_dev_ptr)
-		return 0;
+	if (dramc_dev->pdata) {
+		if (dramc_dev->pdata->fmeter_version == 1)
+			return mtk_fmeter_v1(dramc_dev);
 
-	if (fmeter_dev_ptr->version == 1)
-		return fmeter_v1(dramc_dev_ptr);
-	return 0;
+		dev_err(dev, "Unsupported fmeter version\n");
+		return -EINVAL;
+	}
+	dev_err(dev, "DRAMC platform data not found\n");
+	return -EINVAL;
 }
-EXPORT_SYMBOL(mtk_dramc_get_data_rate);
 
-static int dramc_remove(struct platform_device *pdev)
+static ssize_t dram_data_rate_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
-	dramc_pdev = NULL;
-
-	return 0;
+	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %u\n",
+			mtk_dramc_get_data_rate(dev));
 }
 
-static const struct of_device_id dramc_of_ids[] = {
-	{.compatible = "mediatek,common-dramc",},
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
 	{}
 };
+MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
 
-static struct platform_driver dramc_drv = {
-	.probe = dramc_probe,
-	.remove = dramc_remove,
+static struct platform_driver mtk_dramc_driver = {
+	.probe = mtk_dramc_probe,
 	.driver = {
-		.name = "dramc_drv",
-		.owner = THIS_MODULE,
-		.of_match_table = dramc_of_ids,
+		.name = "mtk_dramc_drv",
+		.of_match_table = mtk_dramc_of_ids,
+		.dev_groups = mtk_dramc_groups,
 	},
 };
 
-static int __init dramc_drv_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&dramc_drv);
-	if (ret) {
-		pr_info("%s: init fail, ret 0x%x\n", __func__, ret);
-		return ret;
-	}
-
-	return ret;
-}
-
-module_init(dramc_drv_init);
+module_platform_driver(mtk_dramc_driver);
 
-MODULE_AUTHOR("Mediatek Corporation");
-MODULE_DESCRIPTION("MediaTek DRAMC Driver");
+MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/mediatek/mtk-dramc.h b/include/linux/soc/mediatek/mtk-dramc.h
deleted file mode 100644
index 95e7dbfe7d0e..000000000000
--- a/include/linux/soc/mediatek/mtk-dramc.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2019 MediaTek Inc.
- */
-
-#ifndef __MTK_DRAMC_H__
-#define __MTK_DRAMC_H__
-
-struct reg_ctrl_t {
-	unsigned int offset;
-	unsigned int mask;
-	unsigned int shift;
-};
-
-struct fmeter_dev_t {
-	unsigned int version;
-	unsigned int crystal_freq;
-	unsigned int shu_of;
-	struct reg_ctrl_t shu_lv;
-	struct reg_ctrl_t pll_id;
-	struct reg_ctrl_t sdmpcw[2];
-	struct reg_ctrl_t posdiv[2];
-	struct reg_ctrl_t fbksel[2];
-	struct reg_ctrl_t dqsopen[2];
-	struct reg_ctrl_t async_ca[2];
-	struct reg_ctrl_t dq_ser_mode[2];
-};
-
-struct dramc_dev_t {
-	unsigned int support_ch_cnt;
-	void __iomem **dramc_chn_base_ao;
-	void __iomem **dramc_chn_base_nao;
-	void __iomem **ddrphy_chn_base_ao;
-	void __iomem **ddrphy_chn_base_nao;
-	void __iomem *sleep_base;
-	void *fmeter_dev_ptr;
-};
-
-unsigned int mtk_dramc_get_data_rate(void);
-
-#endif /* __MTK_DRAMC_H__ */
-- 
2.18.0

