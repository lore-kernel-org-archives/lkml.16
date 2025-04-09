Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D726159A;
	Wed,  9 Apr 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204444; cv=none; b=ShID6kDXO2W8aGx2+aCy47mCXu8Bd6E5ESBIbpahWxpFJokgFrdnjWR5bZ1SX9I4ep6SghxqNFESuD9QA6i23gOJiVxQOopC4FyNeAETNrVM7Doe2O+fYAqmka8lEwpRCuEKv0NbmRIeS1lbqBuygGkB6vO1JIMXzWyUbIaij1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204444; c=relaxed/simple;
	bh=iEqi4D14t6E8AwloqFFSWOfiLtd7GjARxp7/cOXDtLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWZ/1LDY+s8n6/iI0OnX+oKfmgydC1gvX6EZOibRv/SbCDOYoRRBvqP1NwwO78A6lAxCyQe+ntwqGvl0U2oA1hmOgeWplqXMrVo/uyqX9mRdWY3m5No6lUOEzDt2EY4UWwZk17UQKai23VLY9jFFuFXXbyFoiGGmNVdt5FI4dGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Icpa6Z9g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Icpa6Z9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204440;
	bh=iEqi4D14t6E8AwloqFFSWOfiLtd7GjARxp7/cOXDtLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Icpa6Z9gNzzh+NduNfI7bqo3qeTZzFmxbrTzbEvXQlsd7uZ4Vk790rshPoun1LWW2
	 DBr8PSLo2lpGs6b5c8HBbZh0yWRlqAoANmSehFNyH5aFrex/TAv9iGKZp0t6ixNHXs
	 hhixOUkJ9DZgIEKnNiqQT/9OCdQ8JkAcbZif7xrXh18Ax0FNnEbinCLQUwF2LdR5vu
	 ysJMZ44pI/I0qyGudhHEnuR/gLZoMT6lWvFmThO7g/MOnwuXjct2Q3khnlLa6q1FiH
	 fwEfUFLfWCKUFDLbpUm9diCOy6Wy7qTvZUaWoYJOvApXufgcHiSXNm/p5RIqFGQHgx
	 8DucueJBt7rXg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5012E17E0B2D;
	Wed,  9 Apr 2025 15:13:59 +0200 (CEST)
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
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 23/23] drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
Date: Wed,  9 Apr 2025 15:13:18 +0200
Message-ID: <20250409131318.108690-24-angelogioacchino.delregno@collabora.com>
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
[Angelo: Rebased over HDMIv2/DDCv2 series cleanups]
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 784bc05c9541..00a638a3caf4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -269,12 +269,9 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
+	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+								1, &hdmi->sys_offset);
 	if (IS_ERR(hdmi->sys_regmap))
-		return PTR_ERR(hdmi->sys_regmap);
-
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
-	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to get system configuration registers\n");
 
-- 
2.49.0

