Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797C2973AF;
	Tue, 15 Apr 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713843; cv=none; b=UExkbcsXHLak2fO6IvTykM6UZD5x0O6lV9WesNNBix0gJH5Fnf0056v6ZP0NQtkXLHrMDSmpdjG0Gprmdhex01NC17HrbFNqCb7whIRFP07o9sOFFk6xZvgjqpvCURcij/7Sqw0cQAbpSm+DQ3P+/eZ7nPHrdhodMnkIQ9NYAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713843; c=relaxed/simple;
	bh=js/ISdbQ7H0gYijlsNQ0F4fFJ5kdRJcV4M7jhJR2c1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLL6EIk6+9glsVXR+L3EB0k6ug5/emtjeoV809N7wYr52rz7+XI2e3hg5DHTAYUGQheoVnF98Qmigypx27WeyrmXJ/J9w4HmdqqQK2srhuDXuYWapIdFeVyLlgsYiIWySUh5VdXFys7xJ2NPKdxoD8/WyttcVbVSmF/jXSSW3Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jP0u4XZd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jP0u4XZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713840;
	bh=js/ISdbQ7H0gYijlsNQ0F4fFJ5kdRJcV4M7jhJR2c1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jP0u4XZdm337i/zujFZxFrAW5Z+ByDIeROgvn6AKcvsSmZmmAICET3SatFg+OXg2z
	 OFN8yQT6b2lr95ugOI9KN6hoKfQm57a6DskBJ12h29nuM4lvp1wIO7nbRgAqJJgSXV
	 pG5lwqdc8ZIfQzG9XZkyrLq1Z2jzV6di/lFQIxdg7WaYiskWAPi0RTbesdcbKndvlm
	 jZg6ipyw3/GH2pYNGMfmTOBnAkcBfOeNVrvJJcPjdQj/bBaix1Q5tsJj9MUNUkCM3V
	 T2TreHePOY8HJHfedx1Lp2x8a1GF5zKSG11waCzcE2SEzp200OKTKw5ieLRHpxuFmR
	 pu2qWT/MCf+Cw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCEB317E3624;
	Tue, 15 Apr 2025 12:43:58 +0200 (CEST)
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
Subject: [PATCH v9 18/23] drm/mediatek: mtk_hdmi_common: Make CEC support optional
Date: Tue, 15 Apr 2025 12:43:16 +0200
Message-ID: <20250415104321.51149-19-angelogioacchino.delregno@collabora.com>
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

In preparation for adding a new driver for HDMIv2, for which CEC
is not strictly required, change the of_get_compatible_child()
failure error to -ENOTSUPP to be able to differentiate between
error conditions in mtk_hdmi_dt_parse_pdata().

In that case, if -ENOTSUPP is returned, this driver will print
an informative message saying that CEC support is unavailable,
as the devicetree node for that was not found, but after that,
function mtk_hdmi_dt_parse_pdata() will not return error to
the caller.

This will not change functionality of the mtk_hdmi (v1) driver
as that is still checking whether CEC is present and, if not,
will fail probing with an error saying that CEC is required
by HDMIv1.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 316234cd6c13..a949a1566578 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np)
-		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
+		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
-			cec_np);
+		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
 		of_node_put(cec_np);
 		return -EPROBE_DEFER;
 	}
@@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 
 	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
-	if (ret)
+	if (ret == -ENOTSUPP)
+		dev_info(dev, "CEC support unavailable: node not found\n");
+	else if (ret)
 		return ret;
 
 	return 0;
-- 
2.49.0

