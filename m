Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDF2951DF;
	Tue, 15 Apr 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713836; cv=none; b=NorD0VcUhUuHQfYwEV8Jmy9B+t+uPaz8dOwT1uqWEiPQkcTTZNHh8Xnqd4wTzQ3ljjgo52W9HauIwS1NjC7hWACykYVmJo2SH3y68+yMaXMYMEPt5tZpjRqJOrJmGNQ8byGum7oLUOAOdnEUrF3HZyhQbxIIIZwgNfrPildO+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713836; c=relaxed/simple;
	bh=Pg07ZQ5O1zZruJB7CU8fb7Z/JkcoxQzI/w2C2S5S4bY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZhDqUEbWtYieJDLfKdZHxzOmgJo70Vuzv8eLIzboyozabUgKY9wQ+JVdiN3/8EwyRQLnZnBRexSPTS+e4FLuuPkH9E/PeVvkgNpu2NxHZhmVXOYctrc9IYOL+SNgBC9NSVAegh0ahusr2MbaBUSOBwrbsne3UPIjMVcYZDl1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mmNU0FJS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mmNU0FJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713833;
	bh=Pg07ZQ5O1zZruJB7CU8fb7Z/JkcoxQzI/w2C2S5S4bY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmNU0FJSReqPM8dcPMU5RkFJpOYqbM8cxbYA32Oc7qPeK0tf+0hdWjX/sLC6bq323
	 Z7u2W3ZzyZNicUTFrj0v7mDdYUNiyaGGfSMTth3oqk2IFBrMx2mNXQq1BkJFJ2FURS
	 q5qZjZzOwWFUKMluU3l0QRinaiSPLxNPu0xSiQ4q5w63COJT0gPnwbIMvh4F8UiFsS
	 3Eo4SlV6bTLwsbW+uLCf6hCEYxyVWopnQ97HyLi24/Zo3bsXxWjJ5mP9jA6KYs00ec
	 ngey1NgEmM3XfgX49kf1eIpxIhvU5qBEu6k3TQ6xaHtq+DMktktx4ADf5nwBlXPDC0
	 6gFk6u5QZExBA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC3C217E35EB;
	Tue, 15 Apr 2025 12:43:51 +0200 (CEST)
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
Subject: [PATCH v9 14/23] drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_driver()
Date: Tue, 15 Apr 2025 12:43:12 +0200
Message-ID: <20250415104321.51149-15-angelogioacchino.delregno@collabora.com>
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

In preparation for moving the common bits of this driver, merge the
contents of mtk_hdmi_output_init in mtk_hdmi_register_audio_driver
function to aggregate all of the initial audio setup together in
the same function and to make it clear that all of the setup that
is performed in mtk_hdmi_output_init is specifically related only
to audio and not video.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 01584e7b1aad..b4fbd2e60089 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1025,20 +1025,6 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
-{
-	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
-
-	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
-	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
-	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
-	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
-
-	return 0;
-}
-
 static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
 {
 	mtk_hdmi_hw_send_aud_packet(hdmi, true);
@@ -1611,6 +1597,7 @@ static void mtk_hdmi_unregister_audio_driver(void *data)
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
@@ -1620,6 +1607,13 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	};
 	int ret;
 
+	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
+	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
+	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+
 	hdmi->audio_pdev = platform_device_register_data(dev,
 							 HDMI_CODEC_DRV_NAME,
 							 PLATFORM_DEVID_AUTO,
@@ -1661,11 +1655,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
-	ret = mtk_hdmi_output_init(hdmi);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize hdmi output\n");
-
 	ret = mtk_hdmi_register_audio_driver(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
-- 
2.49.0

