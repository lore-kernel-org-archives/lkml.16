Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9B269CF1;
	Wed,  9 Apr 2025 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204435; cv=none; b=pjfsxx9DXYEiGOUvSWDR4yFQCaJVnfkNSXlUTm9inpAaLKcOnC6E+2jlkJ6FFQyoa6sbr70aQCoCuCc/cZLZBgmiP5PHiHeESgLnL+dIYDMAj1pP9rvL9qa3+Q0GkXwJpyUiEKehH+2+zepptb8pF2q4UFj89SiLoZNILAqoGLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204435; c=relaxed/simple;
	bh=SlDROGe6exFigpwAfSIEv4Jg5WPYMv1AVZFCsehToL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbTRb9fmdpMwOxPrcyhAnqG6VYXjNy+UdNjkc5WLRk1x2APE6WzDfQxCgScCejRRSWHRjsUS2k33IVDCfeJqprgBqDt0KNZpb/LCUppF2guq5DlPQvV2VO2aiBiZLTE+eQaZpaFeLGfK5Z8i3zypFpn2tbuqNhw2Ne4cayrpjVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bo8K55/u; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bo8K55/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204432;
	bh=SlDROGe6exFigpwAfSIEv4Jg5WPYMv1AVZFCsehToL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bo8K55/uoI3Iotk1ncyxvBUEmTvgFTfyGz11LEXD8BnIQSbc3LCfFKETh1ub2iUfS
	 2ZERwjhNU27Q0egoZUA8MluijtO7JZMVhJbuXwybqOM/NcppapZ7Td+Pz1rZnyp2ww
	 E/oLs7k2KmbTmlaFvIdlcVUbQhAWJOEFbOYdxB8zBQX/ho1bXDqh9QiLs7dF0IkOHn
	 a/HeWPjAA9GVFPFdv4ByAk2LfXigI6POkUmCFITahdxNT1ZX7JwOyyBRrXLwyCzfYF
	 o2gyJgINfoh7VsYxYcG6+dNXWwBFRSoD4HjbGZkX3SBMfqcSTnvXL9VyrbaGOS5NET
	 5YpXa0HoOZb5A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAB8D17E10F7;
	Wed,  9 Apr 2025 15:13:50 +0200 (CEST)
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
Subject: [PATCH v8 18/23] drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
Date: Wed,  9 Apr 2025 15:13:13 +0200
Message-ID: <20250409131318.108690-19-angelogioacchino.delregno@collabora.com>
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

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
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
2.49.0

