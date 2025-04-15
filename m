Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523FA294A02;
	Tue, 15 Apr 2025 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713830; cv=none; b=VtbwLfeLjn6gQd6AIoIFRCUpMZ1GJ+RE3PfoQTzxX1duou/5bYL3lcMFL6vU0/WBMTbCk7iHAKUbl6ePNZkFse2o/3IRbaiHFEptw5+faGYA9oWO6vwfu1e2cCCquH3uYFcXMd0dbeYiUkqzKPY4+XOUzjNLXJb3f2b3khR5bOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713830; c=relaxed/simple;
	bh=cvpc/8MORNWWHgQBMcaiPbaTmMTg3aTrEh08x8WPRtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoHSM7sWU44FpSwQOv3pLKg+rjsXq38Ed6QcBv8+xx2ZJjT3Oyzzczhj243ApoBRdBlSWIg/akuUrNndWgPSCDSoJutFP3cXhrTl7ku1TvyPLQzp+YFpBMs5bukhkb0rLo8v/dedZHWkCNJxNEPctwErkAeqnrRE6sRRIc7a2xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G0sBrNFQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G0sBrNFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713826;
	bh=cvpc/8MORNWWHgQBMcaiPbaTmMTg3aTrEh08x8WPRtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0sBrNFQGGl6X1hh8KrQ3M0U2kQxfQB4RHBY+F5D7YlkSD0ekhhtIAvf3Or8UZcWX
	 hjT9UAJfPuw1vgLZv+4PZY5JLbCq2v6a420hC2kseiGScvOARdKRyIespjqWCzGCPA
	 cJE/dxgHziMy5y2hWDfOtoH3FPajvDpNveSArqUEwU0WE3yvUeLrQRU3sqLJpOpwdO
	 fKVuI5Nh2i74uC2MYXW12YVDRYnzYlgfDkNKGfKKIuPuqQPS+pdBfs81l6VXEMLi5Y
	 vsLIO3ckPTQrCXs/I/G1W6RlMNlXX3b7XNp9TptoHDQtp7O+bQnRoyKFeesgy2uRHu
	 n3Jzc7KBASoqg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0841917E0B2D;
	Tue, 15 Apr 2025 12:43:44 +0200 (CEST)
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
Subject: [PATCH v9 10/23] drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
Date: Tue, 15 Apr 2025 12:43:08 +0200
Message-ID: <20250415104321.51149-11-angelogioacchino.delregno@collabora.com>
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

In preparation for splitting common bits of this driver, move the
mutex-protected cable plugged callback and codec device setting
to a new function called mtk_hdmi_audio_set_plugged_cb().

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 697508edfa41..60ec16f6827f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1582,17 +1582,22 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	return 0;
 }
 
-static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
-					  hdmi_codec_plugged_cb fn,
+static void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 					  struct device *codec_dev)
 {
-	struct mtk_hdmi *hdmi = data;
-
 	mutex_lock(&hdmi->update_plugged_status_lock);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
 	mutex_unlock(&hdmi->update_plugged_status_lock);
+}
+
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = data;
 
+	mtk_hdmi_audio_set_plugged_cb(hdmi, fn, codec_dev);
 	mtk_hdmi_update_plugged_status(hdmi);
 
 	return 0;
-- 
2.49.0

