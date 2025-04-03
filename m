Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C324BD0C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677272; cv=none; b=YfPhRaVcfRbB1pzybm85rfN3EvLjobz+hiI9dneAIPE6hY64SDiZZE5WOe03lp53THLYnrnY0RdM1QVzAGaAFLNIXvpJJrD+L2IqMB9x+QU0r8U8kJ3PpZsTv/gPyVX5hpYVmHYKDpR2UNhpBMZxp8q1KVOPXgZxuD8+1zJOQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677272; c=relaxed/simple;
	bh=hqOJ5Kz8YhGSoWTaIpp84R16eCUbWGlkQG1L8iZgVmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKr/PkRTiXyJekhSQqr4ToBprzqMppkIgO/YdZ+X4nxR9Sn2HeK/+Ouq3AnpL2K9i7i8KZD9ScB+uVM7+kJLSH2SsVFH2nMxk0WBAz1mREYlEFAe02Z3+RxTss/hZDuLywe5Xppia+0sN9Y/lSHqGdkF+QZAEAVNEEe9sEGG/SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DVikaTVm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DVikaTVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677269;
	bh=hqOJ5Kz8YhGSoWTaIpp84R16eCUbWGlkQG1L8iZgVmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVikaTVmFfz6be3Zp7wE4SI3jAj0VVsFoAJ1VGqSCIzUzqcJjFu7nYYkTHAKR8ZTx
	 MMbjxu84+OW5xkY3BOfOwbgtcJ65+ZLuQQIZ/ODcQ9C084/LrD4mQ+hI0Yc6PaU7UI
	 aBW0h8z69CwnOGcRV+ih+Zig6PbPB50EWHLH9rQmQgE7nNQdmbFEHNUHOlrnALnZq+
	 YAQsIx1s4MrDM5asIZHP0qEooji1MlbSaePEac0KiMmeIVV+J0vGQnXu1oaPVNTNg8
	 fle8ClfUigNUC9oWZma4i06DYbPPMj944o+yfOIy26+7HYk6NWCXyyMF9eY/gjNUXK
	 FihT4UK0EoCjw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5826C17E105F;
	Thu,  3 Apr 2025 12:47:48 +0200 (CEST)
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
Subject: [PATCH v2 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
Date: Thu,  3 Apr 2025 12:47:40 +0200
Message-ID: <20250403104741.71045-5-angelogioacchino.delregno@collabora.com>
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

The OVL driver is installing an ISR in the probe function but, if
the component is not bound yet, the interrupt handler may call the
vblank_cb ahead of time (while probing other drivers) or too late
(while removing other drivers), possibly accessing memory that it
should not try to access by reusing stale pointers.

In order to fix this, add a new `irq` member to struct mtk_disp_ovl
and then add the IRQF_NO_AUTOEN flag to the irq while installing the
ISR to manually call enable_irq() and disable_irq() in the bind and
unbind callbacks respectively.

Note that since IRQF_TRIGGER_NONE is effectively 0 and doing nothing
this (fake) flag was dropped.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Link: https://lore.kernel.org/r/20250402083628.20111-5-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index df82cea4bb79..4d42cb3fee15 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -161,6 +161,7 @@ struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
 	struct clk			*clk;
 	void __iomem			*regs;
+	int				irq;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
@@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
 			     void *data)
 {
+	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
+
+	enable_irq(priv->irq);
 	return 0;
 }
 
 static void mtk_disp_ovl_unbind(struct device *dev, struct device *master,
 				void *data)
 {
+	struct mtk_disp_ovl *priv = dev_get_drvdata(dev);
+
+	disable_irq(priv->irq);
 }
 
 static const struct component_ops mtk_disp_ovl_component_ops = {
@@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
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
@@ -635,10 +641,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 	priv->data = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
 
-	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
-			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+	ret = devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler,
+			       IRQF_NO_AUTOEN, dev_name(dev), priv);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
 
 	pm_runtime_enable(dev);
 
-- 
2.48.1

