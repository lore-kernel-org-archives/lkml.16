Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C37F26159A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204398; cv=none; b=fKa3OFQ+ycOSBui0QUOO8SFulWUcfiY6Zdw7nbRDOnf+eE5ul9GKcWK6x8f2u4jbVH1iA1ZE32t2cVHpW1HnuLgPuP1BATLS6GBgw7JqwHZF0l2nQ7g+A74GE2XJt6wutgSJ8dEwKp0QmWSXdsHTMe5D3KwYjCI/W6I6DGpPht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204398; c=relaxed/simple;
	bh=pQbgxTHUSndGNceRAo7lyCtBFDwzO+1qKqjpMO19XNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0MVPs1M5XaKdHjDj4nmnl0s6RgdIIftg4OiK7qHgOfqnmqzx7HY7ALKfcvoKaybmhuaaydn1L0VYUN/1yFl+RRz4TgOUT20KatLpJO0JLtE32Xfxd6tcQDYha5FDqkv3hnR/L7iDUp0jgxN8CM6oCCLRmdvoyUCTPT9efZYbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oFDUDqXQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oFDUDqXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204394;
	bh=pQbgxTHUSndGNceRAo7lyCtBFDwzO+1qKqjpMO19XNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFDUDqXQGhUNRTx4Ub8V+URTI2v16LvKKB0f0CoaRT6KxgIucCSSzcoShvKWiOQSJ
	 1WAbypQYkPBjcvXpcuMt7x4wlh8IVNTqG6zDsVkzXy6nzOH6+KBbmJr3amNgX4Bksq
	 Ab/PEnipUeyPLPFI62WHk0uTC4fp74REV7W2t5IeZgsSrijZLus3UQo8VfmUlK2SXG
	 wI+zM57t7CFi09YcbVzgINGWFrswop7vssaqfi+9F1D5S/EZzFv75C6FAAI63kDrBi
	 5hpM42crND+tIiBG11xZO07azJjJ5RlIqW5typCSRLYbSUBhh05sOZnoVSKXfsMWhW
	 hwQ22xxlGfY4A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE23417E09BF;
	Wed,  9 Apr 2025 15:13:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v1 2/5] drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
Date: Wed,  9 Apr 2025 15:13:03 +0200
Message-ID: <20250409131306.108635-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding support for additional color formats,
add local helpers to map media bus format parameters to this
driver's bit_num, channel_swap and color_format.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 46 ++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d735398e97f8..5a66dfe3ad40 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -738,6 +738,43 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static unsigned int mtk_dpi_bus_fmt_bit_num(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_OUT_BIT_NUM_8BITS;
+	}
+}
+
+static unsigned int mtk_dpi_bus_fmt_channel_swap(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	}
+}
+
+static unsigned int mtk_dpi_bus_fmt_color_format(unsigned int out_bus_format)
+{
+	switch (out_bus_format) {
+	default:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+		return MTK_DPI_COLOR_FORMAT_RGB;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MTK_DPI_COLOR_FORMAT_YCBCR_422;
+	}
+}
+
 static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_bridge_state *bridge_state,
 				       struct drm_crtc_state *crtc_state,
@@ -757,13 +794,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
 		bridge_state->output_bus_cfg.format);
 
 	dpi->output_fmt = out_bus_format;
-	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
-	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
+	dpi->bit_num = mtk_dpi_bus_fmt_bit_num(out_bus_format);
+	dpi->channel_swap = mtk_dpi_bus_fmt_channel_swap(out_bus_format);
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
-		dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422;
-	else
-		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
+	dpi->color_format = mtk_dpi_bus_fmt_color_format(out_bus_format);
 
 	return 0;
 }
-- 
2.49.0

