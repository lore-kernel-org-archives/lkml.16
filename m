Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C6248894
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677270; cv=none; b=pq+XlpQ7hVgy6ayPzvPYSg5VkBSJuwS+n1Gyec2dfOgSS/r/Rcchy3sSUY+2FtRIMGsVBOpP4OE27l+rc7t6bSQhZDoBLBYBtJDuZx/G1v8kPwrwbXe6APaKIAWmiZnAQeOkXOPWbqgYX/orb4mAwbB480v1GUHi3a0zsr7tZxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677270; c=relaxed/simple;
	bh=XBrGKMq6MS8DZY0zqz/L52BhJguuw7zgExAG55zEXp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRdtrLvW2vsaAd1rl8NxcWT3VeaPxIJe6t5UeAfXgyw7qCqxVsJbGcMz7j8vcHtee/m33QNjlrUE1C4HpEDudWclBR35ERjAiIjtd/Ag6XMozOMxpDRC1XNrG59r+d4zhUf1rQRp0GQW//svX35MMHxg697SRNdXn/kBVN51azs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JzatnKvV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JzatnKvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677267;
	bh=XBrGKMq6MS8DZY0zqz/L52BhJguuw7zgExAG55zEXp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzatnKvVaaSjwx2dW53q1pzSKu9+T3ikLlZi+2bxyzlRk6z5L2GWCCYZPwvGBWiE0
	 s1dua18cFeI4SuhGJpgi3L/Ark0BFSNkizKp1uNsDazzmW/j3WNO3c+Kj+MYvB8FIi
	 /9G92AbMaw+DepEwM5Y9/1LpBlwg99XZpIBzVP8vdUM+cBZ255H/FnXwUFzZ3Y2p+s
	 TCOeU3A171q0KfPc9Nt2vDq8Of8zH0FSd6w4ngci6AdDIGk3009GdQVScX4J9cM2cj
	 CbNtqsWhbKKtKDZ3azLn09/yxqwT41USudOGGQxEkVmZHWwzQ3OxWRXGGqAVgX+s8n
	 P7RznR+7VxK0Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBA1E17E0FDC;
	Thu,  3 Apr 2025 12:47:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v2 2/5] drm/mediatek: Fix kobject put for component sub-drivers
Date: Thu,  3 Apr 2025 12:47:38 +0200
Message-ID: <20250403104741.71045-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
References: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function mtk_drm_get_all_drm_priv(), this driver is incrementing
the refcount for the sub-drivers of mediatek-drm with a call to
device_find_child() when taking a reference to all of those child
devices.

When the component bind fails multiple times this results in a
refcount_t overflow, as the reference count is never decremented:
fix that by adding a call to put_device() for all of the mmsys
devices in a loop, in error cases of mtk_drm_bind() and in the
mtk_drm_unbind() callback.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://lore.kernel.org/r/20250402083628.20111-3-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8fbccb50c74..6b31df587507 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -676,6 +676,10 @@ static int mtk_drm_bind(struct device *dev)
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->drm = NULL;
 err_put_dev:
+	for (i = 0; i < private->data->mmsys_dev_num; i++) {
+		/* For device_find_child in mtk_drm_get_all_priv() */
+		put_device(private->all_drm_private[i]->dev);
+	}
 	put_device(private->mutex_dev);
 	return ret;
 }
@@ -683,6 +687,7 @@ static int mtk_drm_bind(struct device *dev)
 static void mtk_drm_unbind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
+	int i;
 
 	/* for multi mmsys dev, unregister drm dev in mmsys master */
 	if (private->drm_master) {
@@ -690,6 +695,10 @@ static void mtk_drm_unbind(struct device *dev)
 		mtk_drm_kms_deinit(private->drm);
 		drm_dev_put(private->drm);
 
+		for (i = 0; i < private->data->mmsys_dev_num; i++) {
+			/* For device_find_child in mtk_drm_get_all_priv() */
+			put_device(private->all_drm_private[i]->dev);
+		}
 		put_device(private->mutex_dev);
 	}
 	private->mtk_drm_bound = false;
-- 
2.48.1

