Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21552673A5;
	Wed,  9 Apr 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204414; cv=none; b=nuV0lTblAd5farIxIzsbNOd2GYtZavNeits1PSzfxbH8195hPpaHrkpovGQ7fgIKjOCxoBWxCLWsXIEIyirH25UFMSohL8EnWiR8gQecAhVAykJ53dw+94z+r1YVNhuI8FUfFGAR1YLstzQSOW6Zrsv4m67FkBGHTCPPNykwqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204414; c=relaxed/simple;
	bh=L9ZMR5HhwJbXBdo4xiDIZY7yjLaW5vjCR/j+VKvAVbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVzX0KfGWyvaDgPKkjFu74Et1Ko0pbXLNV4jThJcX8+EAyNaLTaksXpuSgyCqKzy4ut0ogz8V+Md3S9ODW/sd6BljD8RHToXFkrRAU3OdU+gHEdDCnXwzeqK3MTmDbx6tWPaW823jznGKz7z/n3bAR2flak0c4b3eDmfML070vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UogS9Hn9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UogS9Hn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204409;
	bh=L9ZMR5HhwJbXBdo4xiDIZY7yjLaW5vjCR/j+VKvAVbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UogS9Hn9IxkFOPAvAgEK2RXDC2Wid9H721KlmBAZ0RYX+7/q2D9mrdIgnSa6O4ZFc
	 xuSf11h37ebXXI1jNqygVJjZVeVCFU9yC7Hytfg2hqsCXQrk38q9YLJVUmtanEVHlJ
	 VtdAbUY3qpXeRgxQcKcXqmVWclO5P6dGCs6+PKvKTHImiPnq1JFsJkbe0+mz260EIm
	 p/TSnmWnymGNSHGCewUa6A6KSA0BQe6/QahqypgrJQTedYmQxh1uqb3mnz9QQkAvgj
	 PsW4W7fvwNlbujVlUqQlzC0p5MdDuw7DhoURHvn2QCfi0DWKVtZn03mNG3AI39R9ih
	 ZdRyXAMzFIkNQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6125917E0F85;
	Wed,  9 Apr 2025 15:13:28 +0200 (CEST)
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
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v8 05/23] drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
Date: Wed,  9 Apr 2025 15:13:00 +0200
Message-ID: <20250409131318.108690-6-angelogioacchino.delregno@collabora.com>
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

Now that all of the mtk_hdmi subdrivers are a platform driver on
their own it is possible to remove the custom init/exit functions
in this driver and just use the module_platform_driver() macro.

While at it, also compress struct of_device_id entries and remove
stray commas in mtk_hdmi_driver assignments.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5b869e8a3903..30eea57be991 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1788,25 +1788,7 @@ static struct platform_driver mtk_hdmi_driver = {
 		.pm = &mtk_hdmi_pm_ops,
 	},
 };
-
-static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_driver,
-};
-
-static int __init mtk_hdmitx_init(void)
-{
-	return platform_register_drivers(mtk_hdmi_drivers,
-					 ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-static void __exit mtk_hdmitx_exit(void)
-{
-	platform_unregister_drivers(mtk_hdmi_drivers,
-				    ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-module_init(mtk_hdmitx_init);
-module_exit(mtk_hdmitx_exit);
+module_platform_driver(mtk_hdmi_driver);
 
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
-- 
2.49.0

