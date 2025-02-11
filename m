Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47524C693;
	Tue, 11 Feb 2025 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273687; cv=none; b=PRdqZo5wdE9lNyASlbq1KDh/RXrUdVQarJCiIIP0M5I7zKrHtE+SViB4Zp0sOOJVv0H0pB3DzUpqZRVllaAaZqN5SxXyGB0HDn8RamGqNIawy52eoIYH2Hg8OqoL1jjgUPaSDtEbfD7agMel5HjMBj+x4tP3xT8G/y1h3OJpBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273687; c=relaxed/simple;
	bh=PgCumXzpRYCmYRS9BSgMRjn2dRA7HFSMZCRGm74VzQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPrdD9lJsR7QDr3XvC1kEdq3vo0CGRzki8OGnWbrcvquX1IzuxGctb369Ycj6rbwbklBU2TCi9TWZha8CzsMV1mo5Qh3E9wl6n2qwnktTd9ptN68AIgsoEYGS9NEWGTqb6ITSZTX73XVFJAGRU+L1NydT//D64dbezGlLm7YpBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aK1MV7aO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aK1MV7aO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273684;
	bh=PgCumXzpRYCmYRS9BSgMRjn2dRA7HFSMZCRGm74VzQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aK1MV7aOoF03xQkncDljQBFgeJ5buBXC4wtpPxq35W1IQvC4Xc7Am7hkmSFRjRB/w
	 SuHCA1GMVIccmll9+u3PMraW34yYEX3a/sXjBUK5WKhJBZz7nRSL8D7N7xMb+W2Lh0
	 Drjo/D24ZctfJKwcHKEBv07Du3H4TN1u7TQE+4nhdHKgR6hVHU4NZ/MFJcLGO0w87r
	 +mwi7gvGLMGlYkCTNaTmJ25Ygj0KpLl1geTQJV7OtximCYFJ4JV1OcfK8FQVM4tkyL
	 Llxv3v+EwHhIP39YGQRP19fDdH624Jt8BWujKGW/hVnhnOg8S0+Znx2qvPZA5e3mNo
	 mvFsqFhH1iKsQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 03DBF17E1249;
	Tue, 11 Feb 2025 12:34:42 +0100 (CET)
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
Subject: [PATCH v6 16/42] drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
Date: Tue, 11 Feb 2025 12:33:43 +0100
Message-ID: <20250211113409.1517534-17-angelogioacchino.delregno@collabora.com>
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

The probe function of this driver may fail after registering the
audio platform device: in that case, the state is not getting
cleaned up, leaving this device registered.

Adding up to the mix, should the probe function of this driver
return a probe deferral for N times, we're registering up to N
audio platform devices and, again, never freeing them up.

To fix this, add a pointer to the audio platform device in the
mtk_hdmi structure, and add a devm action to unregister it upon
driver removal or probe failure.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a5471abf16dd..a9cdeede499f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -172,6 +172,7 @@ struct mtk_hdmi {
 	unsigned int sys_offset;
 	void __iomem *regs;
 	enum hdmi_colorspace csp;
+	struct platform_device *audio_pdev;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
 	bool powered;
@@ -1661,6 +1662,11 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
 };
 
+static void mtk_hdmi_unregister_audio_driver(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
@@ -1671,13 +1677,20 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 		.data = hdmi,
 		.no_capture_mute = 1,
 	};
-	struct platform_device *pdev;
+	int ret;
 
-	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					     PLATFORM_DEVID_AUTO, &codec_data,
-					     sizeof(codec_data));
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	hdmi->audio_pdev = platform_device_register_data(dev,
+							 HDMI_CODEC_DRV_NAME,
+							 PLATFORM_DEVID_AUTO,
+							 &codec_data,
+							 sizeof(codec_data));
+	if (IS_ERR(hdmi->audio_pdev))
+		return PTR_ERR(hdmi->audio_pdev);
+
+	ret = devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_driver,
+				       hdmi->audio_pdev);
+	if (ret)
+		return ret;
 
 	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
-- 
2.48.1

