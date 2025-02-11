Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBE1FECA7;
	Tue, 11 Feb 2025 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273726; cv=none; b=pNINqyOkx7OlkD/02eKMLuczZBxKcFkzC2JKGO3rDu6UJC0NSIZrcwy39mM7ABSpXT0iJ31G2MMbkLtHNoIIXY/lJvNeVnv6v+EXP/GybX8cY6Sd14rNeYaXpgJMV42A7VlhOPT8Y7PqLChaJp0BaAV6ssXktuyLATJQ55zfPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273726; c=relaxed/simple;
	bh=xBlxWG96j/ussT7IHnmYGqG0ZUkOUgPdCbXo3xCR/uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdlW/ku4aEQEqNVexoy1di93n1xA/oOekoFdpzfI4oRbRrBXe/CZmct2bp/NWtxMKyodA0CoSyHdvDRPg9RhqXGdmhaAccteIQ8vzlihUNC0Vm5UhZ1TxIPuXI2jtY/5ZDcRBoIyf7l/VyBk5AA1AQv9NeZLSvhgRLphIDGdRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RJZCmoVL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RJZCmoVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273722;
	bh=xBlxWG96j/ussT7IHnmYGqG0ZUkOUgPdCbXo3xCR/uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJZCmoVLQfR2/hA/oMkM7wl4MTMPU4kOIJfY516xQFI9uyPvWUulOTZP5BRqpI/7s
	 9j8s/iwDYPb9ZVhmhJLRjQ9upmzpp0ZFxbLGoqmDE8d5kHEXoxCPNos4GGxkak6ov3
	 O2XbmNfvh2BN4ztvTWzNFrll314L2OlJ6xiCOcb4NQJGMXSRgY2UTnpynfjcvuJ5LB
	 6eisX59lln6iJhtiEoBeAYLgzS2KE+gute2bW/xHqOOOfHyPilBXULulH7NsNo0KGv
	 LGxlaEFAX1m5p6P1qHsXYDjqf3aC+p2X7DMxCV9hPt43jI0/ijHzGsuf80BkEBJ4+p
	 diUhaXyP9kXFA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DD0317E154C;
	Tue, 11 Feb 2025 12:35:21 +0100 (CET)
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
Subject: [PATCH v6 42/42] drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
Date: Tue, 11 Feb 2025 12:34:09 +0100
Message-ID: <20250211113409.1517534-43-angelogioacchino.delregno@collabora.com>
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
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 750bcb45c33d..c9bf7085328c 100644
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
2.48.1

