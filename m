Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D12356C5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583001; cv=none; b=sgmi+sZQZt4c0BGPCjxROpd+woE3S5uWJeCpliHxb2ZRFdAIn9iR6bzkK4qBlqP/VxU16wOQMcm80xOPfAAyY/xgjF1Fj8xxnmkRMtfF6+/fwPihspnaOsH+bQ/AX3zE7djXHIPizL30uUVAQdZkDDKIE6PDGT/XgXFYJKKbseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583001; c=relaxed/simple;
	bh=517dgkQqDqOu7+fW8r6UKGqvXBz5QZHHTdbH5SjV88w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndAiyHQxm8tlzuJWQojcbrKcOpS4EUyizXOA17GoPRHKpqmGIdNJkg3nYTRDhFPnQk7BZeyNHi7fjtPVtvML33Niz1Za62OfNlThBrn99CR+Ft4Ov/fZP728fregYBAQtXP1WVuAYnpVmIPwG0LNY4nW9rIb4nnScHf0Od+ryHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B7RrbOGk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B7RrbOGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743582998;
	bh=517dgkQqDqOu7+fW8r6UKGqvXBz5QZHHTdbH5SjV88w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B7RrbOGkSiM1d8ioreYcpagcaWvsoP/5rQX9ITW79aijKXvn+52UyxaEa4TywV0Dv
	 EsXKc+QwQolW2RNQEu7hBbam31TB/1KADHl3Y9rs+YGIK20lHXh4MeZXfAkhvHhPBt
	 zPkOlzM52dULSrtjWLsIa+VgaOq0Z96E3Qq8BW+wNoxewtYstfeipEchIh7KyYLR8P
	 fOd81XTTQXTtuj3ZkQGMAkU/t33xj0eJkqnFeiRXl0uboJrBudNR4QF93y8w9v7lx+
	 cqBZQk0D6Q+Tg2lEs+o79EdmYS5ayOHoejw7v5mYfGjfcliHv8hwkpj4VC6bjI3MEH
	 T3HwkWl4zm9bA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9261517E02BE;
	Wed,  2 Apr 2025 10:36:37 +0200 (CEST)
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
Subject: [PATCH v1 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
Date: Wed,  2 Apr 2025 10:36:26 +0200
Message-ID: <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling component_bind_all(), if a component that is included
in the list fails, all of those that have been successfully bound
will be unbound, but this driver has two components lists for two
actual devices, as in, each mmsys instance has its own components
list.

In case mmsys0 (or actually vdosys0) is able to bind all of its
components, but the secondary one fails, all of the components of
the first are kept bound, while the ones of mmsys1/vdosys1 are
correctly cleaned up.

This is not right because, in case of a failure, the components
are re-bound for all of the mmsys/vdosys instances without caring
about the ones that were previously left in a bound state.

Fix that by calling component_unbind_all() on all of the previous
component masters that succeeded binding all subdevices when any
of the other masters errors out.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6b31df587507..2d6562b29755 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	for (i = 0; i < private->data->mmsys_dev_num; i++) {
 		drm->dev_private = private->all_drm_private[i];
 		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
-		if (ret)
+		if (ret) {
+			while (--i >= 0)
+				component_unbind_all(private->all_drm_private[i]->dev, drm);
 			return ret;
+		}
 	}
 
 	/*
-- 
2.48.1

