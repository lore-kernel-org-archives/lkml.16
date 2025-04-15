Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8E28DF11;
	Tue, 15 Apr 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713835; cv=none; b=i8WGa3/Gvu4EoLMWwlG834d56sScteEEd0tdXi7eG4bAzV8VHsz5MoelS8w0id+vqWLZ/cTta+7yBapyxtbBSPdfnLT6Cxw6tqz/+oDoqZwrgoiXT3SDAYlTcckQs+zAqFkjNCmwHpB9t4MsIi637eyW9fWg45eMPLr5avUMl54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713835; c=relaxed/simple;
	bh=YD60026WL3k4FmmPWIolDuElEEMITkE45BGSa78biW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqcZ7OdyTM99iBvLU5RpEig2Yx+O9tVfXpYlccEq8G48fi1C1w701jt3weJdZVW38K0nPUFedkvoNv96pmDhEFVepeDbWwLmllwhAP3EDrvJz2q3TBpvR869+FAXdBBXIREBe3+1M3p7V8JE+t3KDtAYXG6fboTlLsNkpOWAwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EQVcrewv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EQVcrewv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713831;
	bh=YD60026WL3k4FmmPWIolDuElEEMITkE45BGSa78biW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQVcrewvmq4SRG9MEK5IrSZFatuu09MTjPzem6QLDRqx7WppZ8Yw2WU9Ud3ePtiNG
	 1/xPY08anGqAGWpsJqFV1d1c8hleBCAGoG14kUTusLlS36pbtyjsL3+Ih9kQk6kz7a
	 VcQTqiG/weBtKsAOz1EOus0XEqSIKiqnAmzD5HX0li2Kgocnug0x60T7cr3uXJOelx
	 kY9Rh/Ha8H4Vc+vPYsjA2ul1BTnEkLuGOU6waE3X/0PdDT5Dwt2zXMc8RMwLW7wrZv
	 E0l42F0iBOzMmqfan3yqje1zzjBpBDWCnq1kx04EjykyS0VJIiOZ6Q0ZSnWZjGzLGm
	 RV0ULpP6nInsg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A91617E35E5;
	Tue, 15 Apr 2025 12:43:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v9 13/23] drm/mediatek: mtk_hdmi: Move CEC device parsing in new function
Date: Tue, 15 Apr 2025 12:43:11 +0200
Message-ID: <20250415104321.51149-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the CEC device parsing logic to a new function called
mtk_hdmi_get_cec_dev(), and move the parsing action to the end
of mtk_hdmi_dt_parse_pdata(), allowing to remove gotos in this
function, reducing code size and improving readability.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 77 ++++++++++++++---------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c05db0cbafcf..01584e7b1aad 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1357,19 +1357,10 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.edid_read = mtk_hdmi_bridge_edid_read,
 };
 
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
+static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *remote, *i2c_np;
 	struct platform_device *cec_pdev;
-	struct regmap *regmap;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+	struct device_node *cec_np;
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
@@ -1384,62 +1375,66 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 		return -EPROBE_DEFER;
 	}
 	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
 
 	/*
 	 * The mediatek,syscon-hdmi property contains a phandle link to the
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
-						      1, &hdmi->sys_offset);
-	if (IS_ERR(regmap)) {
-		ret = dev_err_probe(dev, PTR_ERR(regmap),
-				    "Failed to get system configuration registers\n");
-		goto put_device;
-	}
-	hdmi->sys_regmap = regmap;
+	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+								1, &hdmi->sys_offset);
+	if (IS_ERR(hdmi->sys_regmap))
+		return dev_err_probe(dev, PTR_ERR(hdmi->sys_regmap),
+				     "Failed to get system configuration registers\n");
+
+	hdmi->cec_dev = &cec_pdev->dev;
+	return 0;
+}
+
+static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
+				   struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote, *i2c_np;
+	int ret;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	hdmi->regs = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(hdmi->regs)) {
-		ret = PTR_ERR(hdmi->regs);
-		goto put_device;
-	}
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
 
 	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote) {
-		ret = -EINVAL;
-		goto put_device;
-	}
+	if (!remote)
+		return -EINVAL;
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
 		hdmi->next_bridge = of_drm_find_bridge(remote);
 		if (!hdmi->next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);
-			ret = -EPROBE_DEFER;
-			goto put_device;
+			return -EPROBE_DEFER;
 		}
 	}
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
 	of_node_put(remote);
-	if (!i2c_np) {
-		ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
-		goto put_device;
-	}
+	if (!i2c_np)
+		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
 
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
-	if (!hdmi->ddc_adpt) {
-		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
-		goto put_device;
-	}
+	if (!hdmi->ddc_adpt)
+		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
+
+	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
+	if (ret)
+		return ret;
 
 	return 0;
-put_device:
-	put_device(hdmi->cec_dev);
-	return ret;
 }
 
 /*
-- 
2.49.0

