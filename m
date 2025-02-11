Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA62144C5;
	Tue, 11 Feb 2025 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273674; cv=none; b=DIaw3Y+5pmv+Rl+vIKA4nU3ZaC6GBjeeU/sJJPvZA26wDJuWIN6DZ0JvVzjl398bR9e0kL65M2GeQL8tUAvdHpEvMLr4BBrBjHjAOHVqKfF52zgJIbUa/u9O4wCMjiMxNi5E49WBRCKsZI1u3zrUUjDI5XoD/lJjn3/ifZlLEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273674; c=relaxed/simple;
	bh=mNGHdB9wdNquPPNVmVlfm/qkiqXvSV3ngefhRX5Hv1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8N+NqHBMYESXT1gFP8XNhR7hHi2DauFjmqNpXA8LaGXPGyMps6A5MZjZ6DD/uWWxsO2b4R8XKwYkTTWUGl4k0iR8ItWLxZpJSVwbv+KuuWVCR7foNqV/8nl9Vx8Q6OeD5CoX/8NEuO+n6QBefNovYbpkFb8kfXEVVGiC4zwjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jgW3SJlf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jgW3SJlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273670;
	bh=mNGHdB9wdNquPPNVmVlfm/qkiqXvSV3ngefhRX5Hv1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgW3SJlfZ9vUs/UnmlE1a/0pbF81XCxnyheWmJ6MPU0NQFnY6Y9jD9wOQOyLpJBdo
	 2d8ehRiF1uc+PkxRz/krtsUjl1LWcUyveYWkR1q8qufjAWMRxYowqUGvD85an/Rp5P
	 QEEDId0Zzfl3zejKws/h2ONv2hUuvf/bkmUM2S4e38ACT3hY5qxNb8SAQl5IM6cuLm
	 Koa3Z5lSm8zFGd8OGniJPzwXleFklctd/nzY0Zu3QcB4SwAVlpTmu3rwXgy4wWb9YQ
	 9UQVwWnLVWWdyZBdq+GJSTlfcUBZH11wkVZxKQGNKWf73GLbtHhMVktEF6/Y0pvema
	 G5lqxLtaMAC/A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A015217E154E;
	Tue, 11 Feb 2025 12:34:29 +0100 (CET)
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
Subject: [PATCH v6 07/42] drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
Date: Tue, 11 Feb 2025 12:33:34 +0100
Message-ID: <20250211113409.1517534-8-angelogioacchino.delregno@collabora.com>
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

On some SoCs, like MT8195 and MT8188, the DPI instance that is
reserved to the HDMI Transmitter uses a different clock topology.

In this case, the DPI is clocked by the HDMI IP, and this outputs
its clock to the MM input of dpi_pixel_clk, which is essential to
enable register access to the DPI IP.

Add a `clocked_by_hdmi` member to struct mtk_dpi_conf, and check
it to avoid enabling the DPI clocks in the mediatek-drm internal
.start() callback (and avoid disabing in the .stop() component
callback): this will make sure that the clock configuration
sequence is respected during display pipeline setup by following
the bridge ops between DPI and HDMI, where the HDMI driver is
expected to enable the clocks in the bridge's pre_enable(), and
DPI in the enable() cb.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index ad07005ad56e..6493c7e2fae4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -146,6 +146,8 @@ struct mtk_dpi_factor {
  * @input_2p_en_bit: Enable bit of two pixel per round feature
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
+ * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
+ *		     for DPI registers access.
  */
 struct mtk_dpi_conf {
 	const struct mtk_dpi_factor *dpi_factor;
@@ -167,6 +169,7 @@ struct mtk_dpi_conf {
 	u32 input_2p_en_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
+	bool clocked_by_hdmi;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -587,7 +590,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	struct videomode vm = { 0 };
 
 	drm_display_mode_to_videomode(mode, &vm);
-	mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
+
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
 
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
@@ -922,14 +927,16 @@ void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_on(dpi);
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_power_on(dpi);
 }
 
 void mtk_dpi_stop(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_off(dpi);
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_power_off(dpi);
 }
 
 unsigned int mtk_dpi_encoder_index(struct device *dev)
-- 
2.48.1

