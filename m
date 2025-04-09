Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1E267F77;
	Wed,  9 Apr 2025 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204423; cv=none; b=Rl6yr2wej/OCVN+w/Y1wfAKYAuepnIx9onkJ8kjAYwOQGFRFxOiiI6AYmvNDt9G33ZjeRmGeCHDNQkLu/syHwkKXDZuetw9tKvFc+Sz/Rkba+VrAqSvto8lcjzn2VrHtx7+SH5f6CNHw1qsyVfW6zAnDHexSStRLowInO8uMuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204423; c=relaxed/simple;
	bh=Xg8Mrh93hVpnshqWGlalQS1gKXn1urntq4DyXCYDtf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GddvFsOptxuHsB0pPa3OrhEtHZ9Cgf73BWsuF6a1lsOVLXE1ckx4b6Ek81YcczBv+v9hg3bV9wh0mwIKEk5Q40fENDk6fIS06ip5wIYp9WvIShopXoX8rhI6GuJUJ2ld/YNqLfyOeqCr7ffkALl8+BtEF0bVmHSaAR+ueFYWdxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AfTQsKNH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AfTQsKNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204420;
	bh=Xg8Mrh93hVpnshqWGlalQS1gKXn1urntq4DyXCYDtf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfTQsKNH8f5nLEpcvi8qM3NgRmium0V2MO/q0uJbSg29lr8kC1FD7yrpumTtiWVNh
	 AJKaVJlLhIZo4voVnZxXw9TcF4wPksOGqaC3tz4byzuSMOMQ6WSFKOiNVrwW6l2efG
	 WFcWgaJ96JMPGzZHv48pqyzsjt/tXFMCb0+xFzvhS9P1+FPjBhq42WLasp+mcfmFPm
	 UDHBfEhr3MKh+DHCTLFUXvWd5rjhVynHoJg2Ywpws2RJtlWH2ScNTI8AygnJPsvaBG
	 tFvwDF3N1nLRLeo6d0biMvr9jqoWJlXqZzjvYhRT7tfyYBC44JxAaMcbRMd2JrCxgF
	 14VWLG71qUYUA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDA9D17E0702;
	Wed,  9 Apr 2025 15:13:38 +0200 (CEST)
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
Subject: [PATCH v8 11/23] drm/mediatek: mtk_hdmi: Use dev_err_probe() in mtk_hdmi_dt_parse_pdata()
Date: Wed,  9 Apr 2025 15:13:06 +0200
Message-ID: <20250409131318.108690-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change error prints to use dev_err_probe() instead of dev_err()
where possible in function mtk_hdmi_dt_parse_pdata(), used only
during device probe.
While at it, also beautify some prints.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 31 ++++++++++-------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index e7acf392b8f4..66f0bdcbf091 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1362,25 +1362,19 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
+	struct device_node *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (!cec_np)
+		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
@@ -1403,9 +1397,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	if (IS_ERR(regmap))
 		ret = PTR_ERR(regmap);
 	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+		dev_err_probe(dev, ret,
+			      "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
@@ -1433,20 +1426,16 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
+	of_node_put(remote);
 	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
-		of_node_put(remote);
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
 		goto put_device;
 	}
-	of_node_put(remote);
 
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 		goto put_device;
 	}
 
-- 
2.49.0

