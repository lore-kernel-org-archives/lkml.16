Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA721C9F9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279341; cv=none; b=mPpIbNhqBy6YctN8heRKxO0Qx1Ogbfvym4ZsonXvtQRkHPHsC6SDGg+7yS5RY+8J/kczgJAVlxQbT3F8f1Cx8FBE7b2MxevfJz5J/oWhRwrCznuGUCNkuLtXDKswq1U85DPEgJFdvdrurjix3Hh/jzGOkv1r22PIDXd/UZmFUq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279341; c=relaxed/simple;
	bh=vRSop1esSI6ViSFxoz+SiFvJXRkVP03/6Jr3Bmz4YpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Okwj6L/jWfwVtPkNtIj+3Oow+RpEPKq4krPg96r5DHMK8D/PpbLos5FpIdJsxfz9NqggqqKyTcLZHparF4m3k5GaIsLUeFKE2IXyZO91AmLhlB4PYPemgiUk9fhfGEmcv1hhmucLji4/lhrGDU0nSGmhfTxBrHVjfZHcUQTwcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=phghBS4W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="phghBS4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750279337;
	bh=vRSop1esSI6ViSFxoz+SiFvJXRkVP03/6Jr3Bmz4YpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=phghBS4Wc2i9/G9cl1tOOTJc1saDZEGCLOVhag1lO+rHhmBWBYQ4skci8wALmaHko
	 hp/GlDrZP5Nrz1yII9Uv/TtVV3NgJ+sdtek2El7e33kFuU40OjuKySCHkvRf+kHq16
	 ut5pzIQPCq++wxjEU1V2d6vLaOcs+DbSf3UEblgIa6/wzfJvddouJrDsVrkDy1LK5f
	 afHsXreKfS2L0Re0FNtjh7ih88Lyhgm10wZnWyK9ybbEHDcgzI7qN4zx7zPieH5WWU
	 W+gU9l0r7diMIr0brdrq3i4fZ/MWNSYOdnEQmjMaTqc8aYaygOGR75bxHL2DCrmcGk
	 tAXJNzkRICVUQ==
Received: from localhost.localdomain (unknown [89.186.158.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gerddie)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CABF17E156A;
	Wed, 18 Jun 2025 22:42:17 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 4/6] drm/etnaviv: Identify GPU already when binding
Date: Wed, 18 Jun 2025 22:43:32 +0200
Message-ID: <20250618204400.21808-5-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required to know whether to be able to avoid allocating
the flop reset data if non of the available GPUs actually need
it.

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..dc8a7ff3e797 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -829,14 +829,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto fail;
 	}
 
-	etnaviv_hw_identify(gpu);
-
-	if (gpu->identity.model == 0) {
-		dev_err(gpu->dev, "Unknown GPU model\n");
-		ret = -ENXIO;
-		goto fail;
-	}
-
 	if (gpu->identity.nn_core_count > 0)
 		dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
                                    "for which the UAPI is still experimental\n");
@@ -1808,6 +1800,13 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	INIT_WORK(&gpu->sync_point_work, sync_point_worker);
 	init_waitqueue_head(&gpu->fence_event);
 
+	etnaviv_hw_identify(gpu);
+
+	if (gpu->identity.model == 0) {
+		dev_err(gpu->dev, "Unknown GPU model\n");
+		ret = -ENXIO;
+		goto out_sched;
+	}
 	priv->gpu[priv->num_gpus++] = gpu;
 
 	return 0;
-- 
2.49.0

