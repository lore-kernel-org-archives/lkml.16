Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFA51F4C84
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677269; cv=none; b=uSDiZtalYaoD+I7RxwNzX+qRbwaEpPAKQf4fEb2YL6LMsWrJ7AC0KA0guUxLg+FJWH3ZgOJhMTlZcQQ9NeEGdpHSpc0HEerm1RlM4Sry0J0+vtpqlNr0zOsE9HtvKpFboAtK6xmfPkh1eVdbAHOZX7FBXQPIjnlcJjooUMejI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677269; c=relaxed/simple;
	bh=cdgfmZWt92kl0WT1E+bmMblp1Gwma1GMRb4hLbf+qZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGZuCClTNyJeAxSPwbVKLuhkZLUFPYRzCg5UJEhT26EAAmR/LSjRQYPXhmBoXF24rfFCCkwAOCuennfytpcNSVFccDMATOsFrii9HcLQPCqDcjG7v0y2AqevTVshRIG+WyQ5VtQC619CHetWfTZkDyasDfSdpgpcG93ibLfhkFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FMNfxomS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FMNfxomS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677265;
	bh=cdgfmZWt92kl0WT1E+bmMblp1Gwma1GMRb4hLbf+qZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FMNfxomSjJQHWBxfx0+elkxR1CNA/+rKzicDqXNq90eXvvjj4CCwqQipyeoAsKcjb
	 fhkQEuLrKWrLhdkh8sEK22esehbTAHbmYgIWmuKAoXp2Zzic7BzvKQth86kvVeIs2n
	 TE58FQOHQtOaLtZA1Gk/rYAIX71fswWbq6msvoh+g9fXydADnudS8kBr8RM/nbVUpD
	 MapphVL208KOwRbpJiJEeQtQPN3DJyFRh+mRJVPSLBvDraAw8/2ZBbAcr/GOVGxLGJ
	 /h1K9jmno5GxNGp+lS/PEB7hQhUBU60lhv0FbvqETzMfCDm0x1HEHG7nC7UBBZZ63M
	 qGQuI4AeWCkbg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8F8217E0FCC;
	Thu,  3 Apr 2025 12:47:44 +0200 (CEST)
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
Subject: [PATCH v2 1/5] drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
Date: Thu,  3 Apr 2025 12:47:37 +0200
Message-ID: <20250403104741.71045-2-angelogioacchino.delregno@collabora.com>
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

This driver is taking a kobject for mtk_mutex only once per mmsys
device for each drm-mediatek driver instance, differently from the
behavior with other components, but it is decrementing the kobj's
refcount in a loop and once per mmsys: this is not right and will
result in a refcount_t underflow warning when mediatek-drm returns
multiple probe deferrals in one boot (or when manually bound and
unbound).

Besides that, the refcount for mutex_dev was not decremented for
error cases in mtk_drm_bind(), causing another refcount_t warning
but this time for overflow, when the failure happens not during
driver bind but during component bind.

In order to fix one of the reasons why this is happening, remove
the put_device(xx->mutex_dev) loop from the mtk_drm_kms_init()'s
put_mutex_dev label (and drop the label) and add a single call to
correctly free the single incremented refcount of mutex_dev to
the mtk_drm_unbind() function to fix the refcount_t underflow.

Moreover, add the same call to the error cases in mtk_drm_bind()
to fix the refcount_t overflow.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://lore.kernel.org/r/20250402083628.20111-2-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e09578756de0..a8fbccb50c74 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -464,7 +464,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		goto put_mutex_dev;
+		return ret;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -483,7 +483,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		drm->dev_private = private->all_drm_private[i];
 		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
 		if (ret)
-			goto put_mutex_dev;
+			return ret;
 	}
 
 	/*
@@ -576,9 +576,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 err_component_unbind:
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		component_unbind_all(private->all_drm_private[i]->dev, drm);
-put_mutex_dev:
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		put_device(private->all_drm_private[i]->mutex_dev);
 
 	return ret;
 }
@@ -649,8 +646,10 @@ static int mtk_drm_bind(struct device *dev)
 		return 0;
 
 	drm = drm_dev_alloc(&mtk_drm_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	if (IS_ERR(drm)) {
+		ret = PTR_ERR(drm);
+		goto err_put_dev;
+	}
 
 	private->drm_master = true;
 	drm->dev_private = private;
@@ -676,6 +675,8 @@ static int mtk_drm_bind(struct device *dev)
 	drm_dev_put(drm);
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->drm = NULL;
+err_put_dev:
+	put_device(private->mutex_dev);
 	return ret;
 }
 
@@ -688,6 +689,8 @@ static void mtk_drm_unbind(struct device *dev)
 		drm_dev_unregister(private->drm);
 		mtk_drm_kms_deinit(private->drm);
 		drm_dev_put(private->drm);
+
+		put_device(private->mutex_dev);
 	}
 	private->mtk_drm_bound = false;
 	private->drm_master = false;
-- 
2.48.1

