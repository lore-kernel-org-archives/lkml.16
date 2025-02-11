Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0640C25A336;
	Tue, 11 Feb 2025 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273718; cv=none; b=rmHvYGKUdNtyRwd8XQqPLw8AO5DiYgYEFRUTz9g6yyVAyC4iP1qN8rvvPmp/mi81aFDoYNtTOIaxrKDne1rXiDrkQRd1mbGLL95VR344WhDMAa1XWkPesLNdZnY+/uu/sdc4Fiw9vdAKebWooEkRHx6DVco6BFdGKg8SsTpOrUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273718; c=relaxed/simple;
	bh=VizTtaOnccsraUze0Mu6cBWCfq5Puw49oxIYLAO8lLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CT32KAu5ged+EUzOaK3goz1+eGWPKAq/V4Js4S6tQcnrIUTJ8LLh8Yv0D/Ch/YQrRSF2poaUWdI0Zz8CcJJHwTREff9M6E63Ou8In7qvx7i/AKjN6aI1X75KbcxnF98ZXcYNh8EvZjlFXLMTVXIYGRVPqiTr//WUGBSu+JVfhTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AhnEwSsU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AhnEwSsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273715;
	bh=VizTtaOnccsraUze0Mu6cBWCfq5Puw49oxIYLAO8lLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AhnEwSsUWAJtO+Fnev0oyhOEBkDpsr385G7naC5Ih1d+WwTtHZ1wta0xfan/N2klx
	 n/TeTmzME8ddTSDGBba7Y4Erww24wMBlzZiwVrZ7UztesCmiQ3BBPN59DbAEc/NMBi
	 9gCV7TQyqESZU8yV8C+ml7r9m+mpTtwiU2WRAoXC1XfCEWkZzzVMX/kTDVhQ6TpRW+
	 Y7QynRfmlz7Lz7danKjuHYlJ4q/iSuSB2lDA7QSHPUQILI1QXCO2liJbPsS+l1/5DE
	 KdbNplbMU6wRVuRba7CZ6R5Sw49e2GtRhSH2aoyAsgjfE0uoyXw+zwUhOqrGCzokeb
	 VqL9Mzs03xCpA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01CAA17E1548;
	Tue, 11 Feb 2025 12:35:13 +0100 (CET)
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
Subject: [PATCH v6 37/42] drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
Date: Tue, 11 Feb 2025 12:34:04 +0100
Message-ID: <20250211113409.1517534-38-angelogioacchino.delregno@collabora.com>
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

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 5ea45608921c..2c91f65f26fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -411,6 +411,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
 
-- 
2.48.1

