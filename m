Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A6D2973AB;
	Tue, 15 Apr 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713845; cv=none; b=tWo7GcKM6lbRgkrBiEfq1iZo0brAeG0ZF/CSplaDsV8DJC4Tvg3yHMRcJnxrJHB9LKUhk4um0C5iHs4gRx9pOdOmJaOkUDtlg9ui6y28IjEc02Pikedqglx9rMwY6aNdqjKcj9hsbH+yC4/vZg3QGSD79vET7Q7Qaktn7UchK0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713845; c=relaxed/simple;
	bh=8CXhnVhAqWS6/pf17Y/rM/TIapCQbF7Zcz/oLbd8osI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmGsb7fNPDqtqIgysS+zdlgTi2BzlC/SKnfdEnyq3z+Gq2dn2xaV2GQoK2tm+vSJ2QQQ0opGXNB45y/9QAswbZcSee/7TOXmnvQl3ulcyclSSoyQBwiYpFVDLZb2Qv5aQ7gDLZ2IBMTcBbKk5sc3ZQd+4d2QI/rVHScB87PmtWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nHjnZ9ys; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nHjnZ9ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713842;
	bh=8CXhnVhAqWS6/pf17Y/rM/TIapCQbF7Zcz/oLbd8osI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHjnZ9ys7UUUZuvZ5qshHRWiwP/t0JO1GqId7JRSD98U7O95Db0r4/N0qZlFA3oLQ
	 XnBrsesKlKJeh1lgFtjb/yuWHDNc+M4Og4SJPQmDlx1qYQ92+BP9rnke5LkxswYRlN
	 wunhXvqLfiexFoP0Ptf9Az+YleQ5MXqE7EpHeHjgcCMlpblhOJYDnfluUzbm7JGw3S
	 B1YML+y0SfTHlgMyCItMARk5WNS5IkIrVyhAdSY7BTrc8x8yzrE5b78GjP57bP8uEB
	 nug096sSg9fnOr9SIv/6Be6qt/lw2r3GhQbtdeAVexVnI4W7IsDdM8U18uXxemiBO7
	 a7NmUdbkWkXbA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 786C017E363D;
	Tue, 15 Apr 2025 12:44:00 +0200 (CEST)
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
Subject: [PATCH v9 19/23] drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
Date: Tue, 15 Apr 2025 12:43:17 +0200
Message-ID: <20250415104321.51149-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index a949a1566578..93003a39708e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -407,6 +407,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
 
-- 
2.49.0

