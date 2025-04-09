Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED5263C78
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204400; cv=none; b=ecRXRsY/zdFEjCX68uu/9MwK5pwGKT4/HYAGLRvYXrd4UIYe2PB0gEr75Xqw73l1nRzu7NKGmpO4mkAljcPz0/2yJPqnWNh2Dzjyv6ylGJAvmExkIF21XUnqOW+GtdzULwMP6rueFXeAzS8uJZEVHPPZlx2EDyXR0mFIxDfajIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204400; c=relaxed/simple;
	bh=CG25b6n9nGE5IFWaYyW41HSL8jKv0tYuhZeoxo8nyso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtSWm3umC1dfU0wDVIWFR7o7abkcRKRSW5nBwNHO4n4tIIQjSu0nrzm0ePw15aNjpnmla0tXrBc8GveTEz5SxX9eBZyQaIg8DPGChPDKfbXMV0zB6gCGYFLIOv9Gt3l061kT57pEfOwxIdUc9W6Y966UUdo5y2tRtK1+MSjii3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BQ8IdTx/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BQ8IdTx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204396;
	bh=CG25b6n9nGE5IFWaYyW41HSL8jKv0tYuhZeoxo8nyso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQ8IdTx/bzMVxrkWX9HLnu4rDqwHKJQYA4imHPW5DQjX66I/fl5HCsan8xLQAxCmq
	 kenreOatWfPVLEAJgMRj7GPjUmTtq3mxLrPwLDLb5do2aITAOpix/vwvBpGJRV0kf1
	 72G8CFSbx+sPds2SyO6AIB676JkHBjCpE6oBqHo8/ISb/tzNOnXDWVZZxVGQs12Jn4
	 6vRxS/BCFs4iSCxkQ3DJPembhutsoj1Uj5TMYO40c7JsOVXxj0brYccqj/3l0LL/sI
	 A/w3/tXdBT/8PyIGC47ct/4VzWtZXnqf1My0ge1vqjorFY3Q8nIpsQv7609tWtH9Xv
	 hK/z3EkJOyi8Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C857D17E0F85;
	Wed,  9 Apr 2025 15:13:15 +0200 (CEST)
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
Subject: [PATCH v1 4/5] drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
Date: Wed,  9 Apr 2025 15:13:05 +0200
Message-ID: <20250409131306.108635-5-angelogioacchino.delregno@collabora.com>
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

Allow additional output formats in both DPI and DP_INTF blocks of
the MT8195 and MT8188 SoCs (as the latter is fully compatible with,
hence reuses, the former's platform data for both blocks) by adding:

1. New formats to the `mt8195_output_fmts` array for dp_intf,
   lacking YUV422 12-bits support, and adding RGB888 2X12_LE/BE
   (8-bits), BGR888 (8-bits) RGB101010 1x30 (10-bits), and YUV
   formats, including YUV422 8/10 bits, and YUV444 8/10 bits; and
2. A new `mt8195_dpi_output_fmts` array for DPI only, with all of
   for formats added to dp_intf and with the addition of the
   YUYV12_1X24 (YUV422 12-bits) output format.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a9e8113a1618..9de537a77493 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1093,9 +1093,29 @@ static const u32 mt8183_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
 };
 
+static const u32 mt8195_dpi_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB888_2X12_LE,
+	MEDIA_BUS_FMT_RGB888_2X12_BE,
+	MEDIA_BUS_FMT_RGB101010_1X30,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_YUYV12_1X24,
+	MEDIA_BUS_FMT_BGR888_1X24,
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_YUV10_1X30,
+};
+
 static const u32 mt8195_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB888_2X12_LE,
+	MEDIA_BUS_FMT_RGB888_2X12_BE,
+	MEDIA_BUS_FMT_RGB101010_1X30,
 	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_BGR888_1X24,
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_YUV10_1X30,
 };
 
 static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
@@ -1208,8 +1228,8 @@ static const struct mtk_dpi_conf mt8192_conf = {
 
 static const struct mtk_dpi_conf mt8195_conf = {
 	.max_clock_khz = 594000,
-	.output_fmts = mt8183_output_fmts,
-	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.output_fmts = mt8195_dpi_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8195_dpi_output_fmts),
 	.pixels_per_iter = 1,
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
-- 
2.49.0

