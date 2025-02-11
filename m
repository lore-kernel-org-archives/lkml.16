Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBA5250C15;
	Tue, 11 Feb 2025 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273694; cv=none; b=bGSkSGYbVM+t8OXwOy5quPaiK1Yo2jRzQuMpzTE/b3afOEgvTYgAj1q0sYyBGL+rXIGCokAjwmDg2Pn3/N2ff0pwiEjFLzebFwkZrAEcdaf12tLOHBV6+o5jt+HIws3uF9sQwoUexUIJAo2EIIL234Yw2HwwtnsoM9cgFIQH054=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273694; c=relaxed/simple;
	bh=g92hoKbnap/0FmO7XVjMUHm0KVjQTyu/zTyphF/xKbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d48iZRxpZiC/oALIAZc6EmhBC6sEhlbLcZPIqteenz3+rv3+z+V6EVM0zO9zRtF3grgCoWFwU1fJOjtB+qKN8qVgi+9CKOwD6DE6j8Hle8CFOMyBBF0AYplk4KD/985nVWWQAMnttzCXZ3xN+cE6VIY2nn0v5wzXcvcRxaJ+sUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c1rAhHZR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c1rAhHZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273691;
	bh=g92hoKbnap/0FmO7XVjMUHm0KVjQTyu/zTyphF/xKbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1rAhHZRLbdVGPz0KIRfL6/vthyJu9sad1z9gak+7q3SnaW3VAkWBK0EYcA5Cf+2m
	 epBMNW7VglJZk/eV9zDkBtsDa8ecPQVTa+H5A83Y5h5kmJ9Wcy4O4gew8AuhQVSQ8G
	 3vwwq8fb1Qq/+Gl5HEwV2qMnZtRxa1kbOEnlBv7p5PY2tN+0R1rQkyVPR43kCmsU+r
	 +jcDGXAmKK40iiFgwBpq+fd7OaNvTkcyU5gP3XDEhbbyBk1CVKYesDjjBEPat1rXor
	 rigjDj0PdNgmkcfzq/pFAaHwfmkYfXL9a79Ikh03vhORls5NT8c9aQN/cGdLKeysxA
	 +q3pvq9G18VOg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B6EC17E154C;
	Tue, 11 Feb 2025 12:34:50 +0100 (CET)
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
Subject: [PATCH v6 21/42] drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
Date: Tue, 11 Feb 2025 12:33:48 +0100
Message-ID: <20250211113409.1517534-22-angelogioacchino.delregno@collabora.com>
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

In preparation for splitting common bits of this driver, move the
mutex-protected cable plugged callback and codec device setting
to a new function called mtk_hdmi_audio_set_plugged_cb().

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5a3e0f4e553d..b5245ac15801 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1597,17 +1597,22 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
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
2.48.1

