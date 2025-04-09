Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E862676FE;
	Wed,  9 Apr 2025 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204417; cv=none; b=T3bpzbBkK4LNGyu0YJctELeqG5JoLMMx+M9cefaSklgACNs61iUFVp4woFVBdRB23Ex3ZSHorMUNPhcZCjdoF/3PXuIpcjh+lxfhe3yx97UPWGaSZbOtZkDt+awE97ZcOXgJScPIAjjJ8NTyyG+X74uOD8MSpAmlBteB2tI3Gs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204417; c=relaxed/simple;
	bh=9NpPxWWGyAUD2TssDUyW8MljteCI2ab810JCD1PfJ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLRd1tk7hqI0rrdjhH+TI/jrzIOe9Dk8EgcZeh8P2mA3OasL4ywHtPiKw2MxAD0e5yDjSkl9MwA2IH+n9bdNecawGWFgCaxc3vlDRw7Sv3C2VLrJXkwfwJFXTmUNPdHxK5rPNzrh8nFfjF0OTQwO4Z57GHMLhIjonQ76450eDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iN8PPwfB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iN8PPwfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744204413;
	bh=9NpPxWWGyAUD2TssDUyW8MljteCI2ab810JCD1PfJ4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iN8PPwfBebxXIg/zYI8sbL9S4bDXwWR10HWXIMtZXZyBgYfVcgV/OLe08jZ+3IIg1
	 VqhxJ/CbsET0dzFL0nw+0XQy56hkufuWAfdsk84DUkpgjW5npviAwYLKC1FGjiR++5
	 dlQpq9nM2vRrGZeVpG+7Fy1EL4NqPNgwht2ejyEPgWSRFcsJgz5VLdnbyN3MGoLxF3
	 Uu8UeYjuGPNvbxn4/Gtf+hHRIMWHMpE8ykZGyhdy4qGsFrMlxMfF/hcdePSBnmlOJ1
	 857soJ3zF1JGUKNNnKXUoEj2d7jkK7gQtVHfWwYekGKRwZORDpXeLhOLef5gHhkmBH
	 UOkpKFlBNKfaw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1FA117E14E7;
	Wed,  9 Apr 2025 15:13:31 +0200 (CEST)
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
Subject: [PATCH v8 07/23] drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param()
Date: Wed,  9 Apr 2025 15:13:02 +0200
Message-ID: <20250409131318.108690-8-angelogioacchino.delregno@collabora.com>
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

As a cleanup, and in preparation for splitting common bits of this
driver, disgregate the code in function mtk_hdmi_audio_set_param()
to the beginning and end of function mtk_hdmi_audio_hw_params().

In a later commit, the hw_params callback function will also be
disgregated so that the code will get two functions: one that
performs the generic hdmi_audio_param copy, and one that performs
IP specific setup, both of which will be called in the callback,
allowing all of the non IP version specific code to get moved in
a common file.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 190334aa7624..a707d101b33c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1045,20 +1045,6 @@ static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
 	hdmi->audio_enable = false;
 }
 
-static int mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
-				    struct hdmi_audio_param *param)
-{
-	if (!hdmi->audio_enable) {
-		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
-		return -EINVAL;
-	}
-	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
-		param->aud_codec, param->aud_input_type,
-		param->aud_input_chan_type, param->codec_params.sample_rate);
-	memcpy(&hdmi->aud_param, param, sizeof(*param));
-	return mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
-}
-
 static int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
 					    struct drm_display_mode *mode)
 {
@@ -1476,6 +1462,11 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 	struct hdmi_audio_param hdmi_params;
 	unsigned int chan = params->cea.channels;
 
+	if (!hdmi->audio_enable) {
+		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
+		return -EINVAL;
+	}
+
 	dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		params->sample_rate, params->sample_width, chan);
 
@@ -1536,8 +1527,13 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 
 	memcpy(&hdmi_params.codec_params, params,
 	       sizeof(hdmi_params.codec_params));
+	memcpy(&hdmi->aud_param, &hdmi_params, sizeof(hdmi_params));
+
+	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
+		hdmi_params.aud_codec, hdmi_params.aud_input_type,
+		hdmi_params.aud_input_chan_type, hdmi_params.codec_params.sample_rate);
 
-	mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
+	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
 
 	return 0;
 }
-- 
2.49.0

