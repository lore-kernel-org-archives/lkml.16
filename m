Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32542586F7;
	Tue, 11 Feb 2025 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273712; cv=none; b=FBE5fG4KSLQZcr3/9dDehCaNxK+zSwO4TwVgDdjtyYAZx+NXoFZIjEPohxaS7OkK+7ca1Y8Go/1nUGMIfseNw4/Derd0F2b3XWuY7zpfCTno7JYeBkljjSRn+Fth8nA7dGoX+WMd5QdWgRUx50efew14TWBwOQJPxpohquZFaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273712; c=relaxed/simple;
	bh=u5+ZwcIjehHnqUyEOZ+FYsBNbFTsieKGtO4nn5PfgcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOqiB1fdRkgOJxQ+koNhN9DWDZtFBH6KtZ0R81l7/Y6qnouncqekv+O+CwetboulgTx9+Os0rnq6IrRg9eMIjYPKLPXW32cmA0OF7G6w9u8llmPQa9pz/v2mPaeVMJebKADcJAZ9e59M4KyvWVDQMis1gErsek7BwkW3DlunJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XawYh13G; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XawYh13G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273709;
	bh=u5+ZwcIjehHnqUyEOZ+FYsBNbFTsieKGtO4nn5PfgcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XawYh13G3xxxdz1MJ29aAF4aoIylgvfOyTeIxOZjzk8MHRuAUcE54NjT4Ps+y+7BN
	 36q/u0R4sBNkjYMFxOro7Lrrhog3BNVir9ZKKa0567zaKpLlDnDANLV9X0sPx6aX6y
	 3zXuM/bhF88EoTRIWMviiB7cbMrFah4W3VbPKmcv0tkk48+GEXfm/N51f0kqM57sI3
	 pHL8VYbh19h/pHiELL1PeuE31qonBrU9CtXHxM/oBDNThhwDjkKybPstxWBKsccirt
	 0VpKx8ZH0uUbR8sF8A5OxCEqleqn+vUIr8fRM+iVhzhGTSABDbOFu4WF6Hy1WLgGKq
	 ULgJOo1rGb2bA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F32E17E1249;
	Tue, 11 Feb 2025 12:35:08 +0100 (CET)
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
Subject: [PATCH v6 33/42] drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
Date: Tue, 11 Feb 2025 12:34:00 +0100
Message-ID: <20250211113409.1517534-34-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for splitting common bits of this driver and for
introducing a new version of the MediaTek HDMI Encoder IP, improve
the flexibility	of function mtk_hdmi_get_all_clk() by adding a
pointer to the clock names array and size of it to its parameters.

Also change the array of struct clock pointers in the mtk_hdmi
structure to be dynamically allocated, and allocate it in probe.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8f31363c5522..d3bfae2f1842 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -159,7 +159,7 @@ struct mtk_hdmi {
 	struct phy *phy;
 	struct device *cec_dev;
 	struct i2c_adapter *ddc_adpt;
-	struct clk *clk[MTK_HDMI_CLK_COUNT];
+	struct clk **clk;
 	struct drm_display_mode mode;
 	bool dvi_mode;
 	struct regmap *sys_regmap;
@@ -1072,17 +1072,18 @@ static const char * const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] = {
 	[MTK_HDMI_CLK_AUD_SPDIF] = "spdif",
 };
 
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
-				struct device_node *np)
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+				const char * const *clock_names, size_t num_clocks)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np,
-						  mtk_hdmi_clk_names[i]);
+	for (i = 0; i < num_clocks; i++) {
+		hdmi->clk[i] = of_clk_get_by_name(np, clock_names[i]);
+
 		if (IS_ERR(hdmi->clk[i]))
 			return PTR_ERR(hdmi->clk[i]);
 	}
+
 	return 0;
 }
 
@@ -1382,15 +1383,15 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	return 0;
 }
 
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
+static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
+				   const char * const *clk_names, size_t num_clocks)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote, *i2c_np;
 	int ret;
 
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
+	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
@@ -1639,6 +1640,7 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi;
 	struct device *dev = &pdev->dev;
+	const int num_clocks = MTK_HDMI_CLK_COUNT;
 	int ret;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
@@ -1648,7 +1650,11 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	hdmi->dev = dev;
 	hdmi->conf = of_device_get_match_data(dev);
 
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
+	hdmi->clk = devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
+	if (!hdmi->clk)
+		return -ENOMEM;
+
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, num_clocks);
 	if (ret)
 		return ret;
 
-- 
2.48.1

