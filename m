Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063624C07C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677273; cv=none; b=qu9G+uInc9qUbalpTzDKWGUFOTGA3ApP4FXsQE4xixApTmPEx9fNvHmn5a8shuJM4oE3TK4p8LPh2dgLPCIkhfUB+PmNwsAZYnAsjs/VnuAE5bFwwclLZsIw1BdiUDVH2Y89FqaS3QNVDcWZ8lbPkganbqXKjJ+XGR5BC38pwWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677273; c=relaxed/simple;
	bh=x1wtdufQF5A9ff40c172tRf7AZns8UAMMhQfqRaFnN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRx1NNDxv3Ukw/dEWGYYm8WQRDDwi/rIKxpyf3/ZTzErJmIeGBbEOj2aUiCz1eb84g00i+55F5gmcY7jENZYexlglQEVHU1DN6iiNEnuEto//Tqw4VjAHV/qAIhmkO0HYsEtoDvW50OmiRjrSQsrdqbsVZj4XjJBT37MehiNBeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nsp7uBpe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nsp7uBpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677270;
	bh=x1wtdufQF5A9ff40c172tRf7AZns8UAMMhQfqRaFnN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsp7uBpe5gwRIweVut4tJQ7obUSye6hB0kimMKqule2r8ctO9aEO+oMxU/x/nvHIu
	 wZ/tOU0XABIePTkwo/gbBbUrUpxShlk+odCVU6ictUi4juIhyklynbntc4PmIhHKbG
	 l9S2Y8NieIaXz8GDa+NkM9hv8EVrYyi6RDteJhOkbfZA24KhvctJO0Euip+K/JqlZc
	 mH5r8gAeNo+gTO/g/4Oe/kXdjeDpnAn7cFSJP3JBbYCgoGACfKboqZHLXhM9BC9e7/
	 QDFBcOXynMHmQaFZHcg3r8NqpqmXnKhNFI/BOprB5DFcqsZgDEXDoxUiWSDNdLQmp2
	 /6eWTvhLoUmyw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89D8317E0702;
	Thu,  3 Apr 2025 12:47:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v2 5/5] drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind
Date: Thu,  3 Apr 2025 12:47:41 +0200
Message-ID: <20250403104741.71045-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
References: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RDMA driver is installing an ISR in the probe function but, if
the component is not bound yet, the interrupt handler may call the
vblank_cb ahead of time (while probing other drivers) or too late
(while removing other drivers), possibly accessing memory that it
should not try to access by reusing stale pointers.

In order to fix this, like done in the OVL driver, add a new `irq`
member to struct mtk_disp_ovl and then add the IRQF_NO_AUTOEN flag
to the irq while installing the ISR to manually disable and clear
the hwirqs with register writes, and enable_irq() and disable_irq()
in the bind and unbind callbacks respectively.

Also, the call to devm_request_irq() was moved after the platform
data and drvdata assignment, but in this specific case it is just
to make it cosmetically correct, as with this change the ISR will
not execute until the component is bound, hence no dev_get_drvdata
happens before that.

Note that since IRQF_TRIGGER_NONE is effectively 0 and doing nothing
this (fake) flag was dropped.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Link: https://lore.kernel.org/r/20250402083628.20111-6-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index bf47790e4d6b..c1bc1bbad86d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
 struct mtk_disp_rdma {
 	struct clk			*clk;
 	void __iomem			*regs;
+	int				irq;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_rdma_data	*data;
 	void				(*vblank_cb)(void *data);
@@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
 static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
 			      void *data)
 {
-	return 0;
+	struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
+
+	/* Disable and clear pending interrupts */
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
+
+	enable_irq(priv->irq);
 
+	return 0;
 }
 
 static void mtk_disp_rdma_unbind(struct device *dev, struct device *master,
 				 void *data)
 {
+	struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
+
+	disable_irq(priv->irq);
 }
 
 static const struct component_ops mtk_disp_rdma_component_ops = {
@@ -314,16 +325,15 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
 	struct resource *res;
-	int irq;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk))
@@ -347,21 +357,17 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	if (ret && (ret != -EINVAL))
 		return dev_err_probe(dev, ret, "Failed to get rdma fifo size\n");
 
-	/* Disable and clear pending interrupts */
-	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
-	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
-
-	ret = devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
-			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
-
 	priv->data = of_device_get_match_data(dev);
 
 	platform_set_drvdata(pdev, priv);
 
 	pm_runtime_enable(dev);
 
+	ret = devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_handler,
+			       IRQF_NO_AUTOEN, dev_name(dev), priv);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
+
 	ret = component_add(dev, &mtk_disp_rdma_component_ops);
 	if (ret) {
 		pm_runtime_disable(dev);
-- 
2.48.1

