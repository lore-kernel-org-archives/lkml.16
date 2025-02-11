Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650F244E96;
	Tue, 11 Feb 2025 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273683; cv=none; b=sX21W/AlXoo+Jk7Ybrzj4ZAgIwr0CgTuuYhuKupIZNPav2//arjCDVhPXWJFXOhOQjN/rSSVF/hxdqYfjaxBi6zDLdcnQW1DLVDWjimwlDEXhweVbdDv05kRkye2xVjw/zSs3Fev2+otQuL8fn7PGbQj/Zi2sysgEs8FhCaK6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273683; c=relaxed/simple;
	bh=HBYmAw2jziCb/T2nltq5tAlSQkAv41ioKPmP8s8M8w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCwmwwbnked/WRXwhKLc6wfpjhYnEjyqCMKSXgR1ext5W38VDvk/XfkcePMlAcKz8n15acNMY0yNclLHTL0lGOyPvndJzNJFcz5kXdI8fesRd7nhV2K9VwcEwTsbmM6fpJdmJKP/Gb414H/kFfI2MF0Ts31NDGdx8MqjlMnyx0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oIDi1UGy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oIDi1UGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273679;
	bh=HBYmAw2jziCb/T2nltq5tAlSQkAv41ioKPmP8s8M8w8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oIDi1UGyLXfpEuzbv+hBMuAhBSkG2GryOfqrI7/JJeDTw1wLMeUJWUAlcwPdEzka3
	 gBr9pC8qHjF14ahtN9knVY3ZlhK5l5h1fArkUhOx95S+2gDSDYuN6KJu9DtWHo774o
	 gbh+dt9GW0+DtfYlWO9Xn3FFUZd/k2BTUcdVTztCVW04wAmXoZKzbndEUWci6XGZ1L
	 hFNPvmc/UdjPc0eoIndtb6kmqn2Vgv8916Q9AmxurG7Uj9V3OQC3JfAyewjZDjggF2
	 AKjONKm6jGHMa6YmFTFpItVu/VAmY2fVB4QCp8DZ/GYiR5paELpOI9HuNvGUiDXeM3
	 +zjFiASMRu/fg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 763DA17E0EB8;
	Tue, 11 Feb 2025 12:34:38 +0100 (CET)
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
	jason-jh.lin@mediatek.com,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v6 13/42] drm/mediatek: mtk_cec: Switch to register as module_platform_driver
Date: Tue, 11 Feb 2025 12:33:40 +0100
Message-ID: <20250211113409.1517534-14-angelogioacchino.delregno@collabora.com>
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

In preparation for adding a driver for the new HDMIv2 IP, and
before splitting out the common bits from the HDMI driver, change
the mtk_cec driver from being registered from the mtk_hdmi driver
itself to be a module_platform_driver of its own.

Besides being a cleanup, this also allows build flexibility by
allowing to compile the CECv1 driver only when needed (for example,
this is not needed nor used in HDMIv2 configurations).

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/Makefile   | 4 ++--
 drivers/gpu/drm/mediatek/mtk_cec.c  | 7 ++++++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.h | 1 -
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 32a2ed6c0cfe..bdd3a062f797 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,10 +21,10 @@ mediatek-drm-y := mtk_crtc.o \
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
-mediatek-drm-hdmi-objs := mtk_cec.o \
-			  mtk_hdmi.o \
+mediatek-drm-hdmi-objs := mtk_hdmi.o \
 			  mtk_hdmi_ddc.o
 
+obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b42c0d87eba3..c7be530ca041 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 
 #include "mtk_cec.h"
-#include "mtk_hdmi.h"
 #include "mtk_drm_drv.h"
 
 #define TR_CONFIG		0x00
@@ -102,6 +101,7 @@ void mtk_cec_set_hpd_event(struct device *dev,
 	cec->hpd_event = hpd_event;
 	spin_unlock_irqrestore(&cec->lock, flags);
 }
+EXPORT_SYMBOL_NS_GPL(mtk_cec_set_hpd_event, "DRM_MTK_HDMI_V1");
 
 bool mtk_cec_hpd_high(struct device *dev)
 {
@@ -112,6 +112,7 @@ bool mtk_cec_hpd_high(struct device *dev)
 
 	return (status & (HDMI_PORD | HDMI_HTPLG)) == (HDMI_PORD | HDMI_HTPLG);
 }
+EXPORT_SYMBOL_NS_GPL(mtk_cec_hpd_high, "DRM_MTK_HDMI_V1");
 
 static void mtk_cec_htplg_irq_init(struct mtk_cec *cec)
 {
@@ -247,3 +248,7 @@ struct platform_driver mtk_cec_driver = {
 		.of_match_table = mtk_cec_of_ids,
 	},
 };
+module_platform_driver(mtk_cec_driver);
+
+MODULE_DESCRIPTION("MediaTek HDMI CEC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ca82bc829cb9..da725182f0db 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1805,7 +1805,6 @@ static struct platform_driver mtk_hdmi_driver = {
 
 static struct platform_driver * const mtk_hdmi_drivers[] = {
 	&mtk_hdmi_ddc_driver,
-	&mtk_cec_driver,
 	&mtk_hdmi_driver,
 };
 
@@ -1827,3 +1826,4 @@ module_exit(mtk_hdmitx_exit);
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("DRM_MTK_HDMI_V1");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
index 472bf141c92b..e40bc4651995 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
@@ -8,7 +8,6 @@
 
 struct platform_driver;
 
-extern struct platform_driver mtk_cec_driver;
 extern struct platform_driver mtk_hdmi_ddc_driver;
 
 #endif /* _MTK_HDMI_CTRL_H */
-- 
2.48.1

