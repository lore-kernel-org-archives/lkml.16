Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74F2973D2;
	Tue, 15 Apr 2025 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713847; cv=none; b=l1RMIrFz0DWbwm/vPF+HLi3mG+cH1nA2mrttQEpQwX/xEhCR5uAVABkZn/k9pi8sGIBED2sVYoALy2CdNHMeC3MI21ks8xVtTZ8bWt2zjarp3C9KfAUjMFMSZJtbTcpBFHVNXLW7DudTp0c5L6HEWC6RsKIz8GDMOCRfLumfCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713847; c=relaxed/simple;
	bh=/Ysfme4bhURYgPvgEn2XsQA7zWDU59MfSw1pYgrGJXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAM63YJk2TdhVz8hzVUWci3flXT4l9r0RTwIllDdTH8w581Ru+hwiHkoTo+G29z8W5LAy1GtI3hJv8y7BUFKhJ5/5a6hbVsLJqwan3+OGvgM3npFkPeYhoEPk7ABd3QFMGvrgzYn21xZzDmyeUkv2RUji5KkWR/dZ3VLejqdhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lppZmGp5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lppZmGp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744713843;
	bh=/Ysfme4bhURYgPvgEn2XsQA7zWDU59MfSw1pYgrGJXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lppZmGp5omx1dfkI1fWUCeX+ROZjpaEGbNy7mfRuBc/+a2dXQiWWBDdR9e+eTUMgn
	 OkvAJnqgNz4RExfTasasoQNZY41pyZhh/nHVFvLy2UlAM+yyPbHBl4dBQ8CJ+NMLjL
	 WqFuMZuB3T9+QIZgtCkmtpGk2eImseETzwswnYMaU4DeEeA1l/wqRz8AT0yHqf9GE2
	 3r1Dq3QK0x2srzFwZpZ1VxLY1wv53Rj32XoKyF9B5gcWdtSh6LOs/4TR9oSxPAV+W8
	 iEHfBc16umipS69N+O16wU2TeAbE7pOZ1oRkas0cqSe6K6cva+UyZMX7KNBccXlHRB
	 rsTMhB1Oongpg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3354717E153D;
	Tue, 15 Apr 2025 12:44:02 +0200 (CEST)
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
Subject: [PATCH v9 20/23] drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
Date: Tue, 15 Apr 2025 12:43:18 +0200
Message-ID: <20250415104321.51149-21-angelogioacchino.delregno@collabora.com>
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

In preparation for adding the HDMI TX v2 driver, and to allow
a future modernization of the HDMI v1 one, perform changes
that enable the usage of the HDMI Helpers provided by DRM.

Check if the HDMI driver provides the function pointers to
hdmi_{clear,write}_infoframe used by the HDMI Helper API and,
if present, add DRM_BRIDGE_OP_HDMI to the drm_bridge ops,
enabling the drm API to register the bridge as HDMI and to use
the HDMI Helper functions.

If the hdmi_{write,clear}_infoframe pointers are not assigned,
vendor and product strings and HDMI helpers will not be used,
hence this commit brings no functional changes to drivers that
have not been refactored to use the new helpers.

This also means that, in the current state, there is effectively
no functional change to mtk_hdmi and its other components.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 93003a39708e..b6043d99be7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -406,6 +406,11 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
+
+	if (ver_conf->bridge_funcs->hdmi_write_infoframe &&
+	    ver_conf->bridge_funcs->hdmi_clear_infoframe)
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI;
+
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
-- 
2.49.0

