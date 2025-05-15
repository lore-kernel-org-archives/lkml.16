Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47006299940;
	Thu, 15 May 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301724; cv=none; b=WojEeDzJVLzyDauIu2A5aDFL3/lOjHPFWU85/ia84fSDj9h1w/G2Is8oQ2pXHMOPfsSQI3tNqCphbfFuxH1MMvtqcTSRw6VYdP7LMXC9GWhFwll4xFIUhEysFWeSlXvHJQPUJ8tr3B0Wj2PNpL1DzndPaTXYZOv7gEechTpRzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301724; c=relaxed/simple;
	bh=M1RYeCLWNWQiZRsiV+HYdsbs/WqcFYelCwjZLOqy8BE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihzOO8eSLNronKvUx+tAFIfi/GOVNUq3MxjyH/VVSHT47A2vfyBiSkZeDgfYvwGQjJWdZW82MR8n3XKyjnUrc6WmaVjWPcj8ya/+tp8sOFDNxg3ZNvBZDUXEjdklA5XK4ej+e614k13kCRNg0VpJT5QUF7UIFr9rLKXXAsBdRKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hdxTT5eF; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hdxTT5eF"
X-UUID: e5f9ce3c316f11f0813e4fe1310efc19-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=02/kcO+MMhM7XJgHj91D/a9UFhsQBAGvRfsYmvCesR4=;
	b=hdxTT5eFq8jr7x00u7U30ZWxHyyQNagnJbNfEH0cnIeMxVKS6tjzstIL7MFuz1wgeHX5OmSmritFRKPpoUQx14OrKnZNUDfcT4ul0PZ6zo8CP/rLum2GgmncpGx0S1p1lTsIVkPZct5GePdtjt7UniUSuYerolEBpaqFytxbvMg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9bad826e-5e3d-485a-b3c4-e6dc779786d7,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:9097c297-7410-4084-8094-24619d975b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e5f9ce3c316f11f0813e4fe1310efc19-20250515
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 534271876; Thu, 15 May 2025 17:35:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:10 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Date: Thu, 15 May 2025 17:34:26 +0800
Message-ID: <20250515093454.1729720-15-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nancy Lin <nancy.lin@mediatek.com>

OUTPROC handles the post-stage of pixel processing in
the overlapping procedure.OUTPROC manages pixels for
gamma correction and ensures that pixel values are
within the correct range.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h     |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 240 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h |  22 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 8 files changed, 281 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a7b9ebe27f68..9546bc6b7b2e 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -10,6 +10,7 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
+		  mtk_disp_outproc.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_drv.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index e65c6df987f2..cc780744f060 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -447,6 +447,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DSI] = "dsi",
 	[MTK_OVL_BLENDER] = "blender",
 	[MTK_OVL_EXDMA] = "exdma",
+	[MTK_OVL_OUTPROC] = "outproc",
 };
 
 struct mtk_ddp_comp_match {
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 075ba5683f93..b33d3289b8b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -45,6 +45,7 @@ enum mtk_ddp_comp_type {
 	MTK_DSI,
 	MTK_OVL_BLENDER,
 	MTK_OVL_EXDMA,
+	MTK_OVL_OUTPROC,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 39e3af1e2b16..3c519a662074 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -64,6 +64,20 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt);
 
+void mtk_disp_outproc_start(struct device *dev);
+void mtk_disp_outproc_stop(struct device *dev);
+int mtk_disp_outproc_clk_enable(struct device *dev);
+void mtk_disp_outproc_clk_disable(struct device *dev);
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data);
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev);
+void mtk_disp_outproc_enable_vblank(struct device *dev);
+void mtk_disp_outproc_disable_vblank(struct device *dev);
+
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 unsigned int mtk_dpi_encoder_index(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_outproc.c b/drivers/gpu/drm/mediatek/mtk_disp_outproc.c
new file mode 100644
index 000000000000..bc0b2388e9d6
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_outproc.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
+#include "mtk_disp_outproc.h"
+#include "mtk_drm_drv.h"
+
+#define DISP_REG_OVL_OUTPROC_INTEN				0x004
+#define OVL_OUTPROC_FME_CPL_INTEN					BIT(1)
+#define DISP_REG_OVL_OUTPROC_INTSTA				0x008
+#define DISP_REG_OVL_OUTPROC_DATAPATH_CON			0x010
+#define OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP				BIT(26)
+
+#define DISP_REG_OVL_OUTPROC_EN					0x020
+#define OVL_OUTPROC_OVL_EN						BIT(0)
+#define DISP_REG_OVL_OUTPROC_RST				0x024
+#define OVL_OUTPROC_RST							BIT(0)
+#define DISP_REG_OVL_OUTPROC_SHADOW_CTRL			0x028
+#define OVL_OUTPROC_BYPASS_SHADOW					BIT(2)
+#define DISP_REG_OVL_OUTPROC_ROI_SIZE				0x030
+
+struct mtk_disp_outproc {
+	void __iomem		*regs;
+	struct clk		*clk;
+	void			(*vblank_cb)(void *data);
+	void			*vblank_cb_data;
+	int			irq;
+	struct cmdq_client_reg	cmdq_reg;
+};
+
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+}
+
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+}
+
+void mtk_disp_outproc_enable_vblank(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(OVL_OUTPROC_FME_CPL_INTEN, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
+}
+
+void mtk_disp_outproc_disable_vblank(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
+}
+
+static irqreturn_t mtk_disp_outproc_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_disp_outproc *priv = dev_id;
+	u32 val;
+
+	val = readl(priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+	if (!val)
+		return IRQ_NONE;
+
+	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+
+	if (priv->vblank_cb)
+		priv->vblank_cb(priv->vblank_cb_data);
+
+	return IRQ_HANDLED;
+}
+
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+	u32 tmp;
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	writel((h << 16) | w, priv->regs + DISP_REG_OVL_OUTPROC_ROI_SIZE);
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_DATAPATH_CON);
+	tmp = (tmp & ~OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP) |
+		  (OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP & OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP);
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_DATAPATH_CON);
+}
+
+void mtk_disp_outproc_start(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+	unsigned int tmp;
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
+	tmp = tmp | OVL_OUTPROC_BYPASS_SHADOW;
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
+
+	writel(0, priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_EN);
+	tmp = (tmp & ~OVL_OUTPROC_OVL_EN) | (OVL_OUTPROC_OVL_EN & OVL_OUTPROC_OVL_EN);
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_EN);
+}
+
+void mtk_disp_outproc_stop(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(0, priv->regs + DISP_REG_OVL_OUTPROC_EN);
+	writel(OVL_OUTPROC_RST, priv->regs + DISP_REG_OVL_OUTPROC_RST);
+	writel(0, priv->regs + DISP_REG_OVL_OUTPROC_RST);
+}
+
+int mtk_disp_outproc_clk_enable(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(priv->clk);
+}
+
+void mtk_disp_outproc_clk_disable(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+}
+
+static int mtk_disp_outproc_bind(struct device *dev, struct device *master,
+				 void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_outproc_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_disp_outproc_component_ops = {
+	.bind	= mtk_disp_outproc_bind,
+	.unbind = mtk_disp_outproc_unbind,
+};
+
+static int mtk_disp_outproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_outproc *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap outproc\n");
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get outproc clk\n");
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg\n");
+#endif
+
+	if (of_property_read_u32_index(dev->of_node, "interrupts", 0, &ret)) {
+		dev_dbg(dev, "interrupts not defined\n");
+	} else {
+		priv->irq = platform_get_irq(pdev, 0);
+		if (priv->irq < 0)
+			priv->irq = 0;
+
+		if (priv->irq) {
+			ret = devm_request_irq(dev, priv->irq, mtk_disp_outproc_irq_handler,
+					       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+			if (ret < 0) {
+				dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+				return ret;
+			}
+		}
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_outproc_component_ops);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add component\n");
+
+	return ret;
+}
+
+static void mtk_disp_outproc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_outproc_component_ops);
+}
+
+static const struct of_device_id mtk_disp_outproc_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-outproc"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_outproc_driver_dt_match);
+
+struct platform_driver mtk_disp_outproc_driver = {
+	.probe		= mtk_disp_outproc_probe,
+	.remove		= mtk_disp_outproc_remove,
+	.driver		= {
+		.name	= "mediatek-disp-outproc",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_outproc_driver_dt_match,
+	},
+};
+
+MODULE_AUTHOR("Nancy Lin <nancy.lin@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek Output processing Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_outproc.h b/drivers/gpu/drm/mediatek/mtk_disp_outproc.h
new file mode 100644
index 000000000000..abb101979521
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_outproc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OUTPROC_H__
+#define __MTK_DISP_OUTPROC_H__
+
+void mtk_disp_outproc_start(struct device *dev);
+void mtk_disp_outproc_stop(struct device *dev);
+int mtk_disp_outproc_clk_enable(struct device *dev);
+void mtk_disp_outproc_clk_disable(struct device *dev);
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data);
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev);
+void mtk_disp_outproc_enable_vblank(struct device *dev);
+void mtk_disp_outproc_disable_vblank(struct device *dev);
+#endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7a14f45d5f97..f7b9c7a982a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1280,6 +1280,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_exdma_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
+	&mtk_disp_outproc_driver,
 	&mtk_disp_ovl_adaptor_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 89178de1478f..c4717c37b0f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -76,6 +76,7 @@ extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_exdma_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_merge_driver;
+extern struct platform_driver mtk_disp_outproc_driver;
 extern struct platform_driver mtk_disp_ovl_adaptor_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
-- 
2.45.2

