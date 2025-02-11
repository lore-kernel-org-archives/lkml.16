Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3FB253B60;
	Tue, 11 Feb 2025 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273706; cv=none; b=SRjNSKsYVdu3ZRY2uq70a8Tv4xnyCbvfi8XiGNmpK0aI8vbJftVF/amzI51OPSEndgr0lNXNZvWtGtC89y9O6FoJT9xGzUyMqYMoY4X7qiFUYzlId2iaf8cgXLBGUOucT0HrcsbU+MTlgLV2E+K37MdwUAHvvZWtUKBc8FWGs3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273706; c=relaxed/simple;
	bh=Om4Hj4BENHRg9UFrG8GsN8067RkNmrkpL/QVToLLAEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpaIF6FVYS+/yEPWkNzRpKeH9ZW+fNrzriuuDvCU5SjgVjU1Eiubuapx9TV435DIUe/dEN2lm2eGBz/VrXxLSMazmarTWGbNSOzYWtkgY1zcHH74WyZoKset9mZmzBCAOlQTjscVi5LV4hIewDwJEXbdE/BbG0XinUZQKQiLPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PxzlF5qV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PxzlF5qV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273703;
	bh=Om4Hj4BENHRg9UFrG8GsN8067RkNmrkpL/QVToLLAEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxzlF5qVO0KvUDA9KSA06cdAr4Z/jsaOgh80B8wqfaphJL5KsxsOAqhkfiwThsqEb
	 a+yYoF24O/a/KNKQoKIbTNc5E7Jiw7nKK2XK0F09nEi+2gR3VM5PG0qFQrxve1+Qku
	 PyA5GDPAEqGv6KckL5kGnEZrXJXUr6CPUljCROBCFR0/NsLSKOSwm7Hcxf1X8dN+rv
	 REH+qrKMmCQPgudfWsZCvsAU0csA91hPDas/WHMmv+k7GWjUn6LSSQOlyu3bG7AuDb
	 fqdCU/+5m4satVhg3DIX4YmihcSqiyIEgca7TQUukJdqv7o3wNrqli34WufvFzps+b
	 TNi8FbXoEXWLA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33DD817E155F;
	Tue, 11 Feb 2025 12:35:02 +0100 (CET)
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
Subject: [PATCH v6 29/42] drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
Date: Tue, 11 Feb 2025 12:33:56 +0100
Message-ID: <20250211113409.1517534-30-angelogioacchino.delregno@collabora.com>
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

Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
and indicate that the mtk_hdmi_{remove,suspend} functions may be
unused (as they are, in case PM support is not built-in).

While at it, to improve readability, also compress the
SIMPLE_DEV_PM_OPS declaration as it even fits in less
than 80 columns.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index e391cdacd9ee..ae5023298ff4 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
 	mtk_hdmi_clk_disable_audio(hdmi);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mtk_hdmi_suspend(struct device *dev)
+static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
@@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
 	return 0;
 }
 
-static int mtk_hdmi_resume(struct device *dev)
+static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	int ret = 0;
@@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
-- 
2.48.1

