Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F32163A9;
	Tue, 11 Feb 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273675; cv=none; b=NqShiclNedHyhbolRQUjGIAezxpC5olPJ+sBMWxfgLqHwrmamLN4SIlNLbWg2o2s1BlTZd51SDRfJu6esXDt1JqJU6TDeDMX5QpdOd0KStChucBKuXIf0/oHmoVU+Cq25ozM7MpydkzUMsubv+LmsaGNb6Rd+1tfVDenerFiLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273675; c=relaxed/simple;
	bh=J0oNWkSjU3esAvk60NT4VzP6xVGBmMzphYZ9wznRnJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vk440qk2+S6nw8Lz7rqV/fmWBSQF76H/Ep5xFGx0A/R6JsCQxARc29lMZTaebA47sw/b3wiSJP9/+9s7wQuFojy+u1MyiSxkLOM7L5H8bflK68MaK7OeKGHyOhIBjX4abDsomvHhaUlL5VGcApQ+4I5ZZc0kkrSXDMa1Y98IrAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=plYKCo3L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="plYKCo3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273672;
	bh=J0oNWkSjU3esAvk60NT4VzP6xVGBmMzphYZ9wznRnJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plYKCo3LNHyD62AMZjQgeeyvMS5aDOpslIFygPXtA2Gg4W9zxPG9CsIskKNuaANI8
	 y+aYuLtLxyI+Fu7UNuxwf/7jMk570IcPqcl6OFRDEIjD169HNCo7o9ID8DoR48mwJb
	 JdQctxk++UlE4y/odMjT3Np34BJ4Uv6XlIUXsQ0JWWzaMMW6h4YNQDqUuPnEr7vBbZ
	 yOAeyILFfsu4TDb9ShwXebfeauRz19r3QuId8mDOuqWEW1hdqtiyq0hLlsaR3gaHdV
	 AWfI/17PTC2bmBlmewvR8IAogo/cjZZx/D7Xbu9ugfaS6DAxs/F+NHMAlAckYA/mUl
	 hjf3TESGx493w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F48F17E1551;
	Tue, 11 Feb 2025 12:34:31 +0100 (CET)
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
Subject: [PATCH v6 08/42] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
Date: Tue, 11 Feb 2025 12:33:35 +0100
Message-ID: <20250211113409.1517534-9-angelogioacchino.delregno@collabora.com>
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

On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
(afifo) supports outputting either one or two pixels per round
regardless of the input being 1T1P or 1T2P.

Add a `output_1pixel` member to struct mtk_dpi_conf which, if
set, will enable outputting one pixel per clock.

In case the input is two pixel per clock (1T2P), the AFIFO HW
will automatically (and internally) convert it to 1T1P.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6493c7e2fae4..5c15c8935916 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -148,6 +148,8 @@ struct mtk_dpi_factor {
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
  *		     for DPI registers access.
+ * @output_1pixel: Enable outputting one pixel per round; if the input is two pixel per
+ *                 round, the DPI hardware will internally transform it to 1T1P.
  */
 struct mtk_dpi_conf {
 	const struct mtk_dpi_factor *dpi_factor;
@@ -170,6 +172,7 @@ struct mtk_dpi_conf {
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
 	bool clocked_by_hdmi;
+	bool output_1pixel;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -655,7 +658,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	if (dpi->conf->support_direct_pin) {
 		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 		mtk_dpi_config_2n_h_fre(dpi);
-		mtk_dpi_dual_edge(dpi);
+
+		/* DPI can connect to either an external bridge or the internal HDMI encoder */
+		if (dpi->conf->output_1pixel)
+			mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
+		else
+			mtk_dpi_dual_edge(dpi);
+
 		mtk_dpi_config_disable_edge(dpi);
 	}
 	if (dpi->conf->input_2p_en_bit && dpi->conf->input_2pixel) {
-- 
2.48.1

