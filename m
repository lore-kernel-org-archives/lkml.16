Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F023A58E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630453; cv=none; b=jvbhnE91H0A/K4e42Tc6+WKkcAfbTAKnb09i0KzVjW/viJo2izVNmUsLuJ1xb6khLiNa0ILDLu0rcqk84L6S0EshofPaNJIlRCYjhNwu2S//V0JinTU5EQeFS13XZa2PJYV41jDThBKSgua0jG3b0gyR8fG77mjZzn0BldB6jP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630453; c=relaxed/simple;
	bh=su1yYo+d3aL4MP7MFtVZnoayOFX9zNGZfH0IWJywWbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=svTf9o9DjCAUazAUJFWwO3Pxk6QTWCl6xyoJZTsJvzYIHRTiwGtyj8B0iyVTdQGCHSSvxBgkyQD9tY5iilGngZB6ywzVbmE14UV/4Iwl9uJLtOlqSsRA31N7h1wtO+A5YWEiBJpw8Iiq3nBsC8KFvB1wLMzWz9kMmrD1hCUI3eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GYQZWvnM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GYQZWvnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751629981;
	bh=su1yYo+d3aL4MP7MFtVZnoayOFX9zNGZfH0IWJywWbk=;
	h=From:Date:Subject:To:Cc:From;
	b=GYQZWvnM5P23pCFUP4/3R64qkKvJtymb7wnz4xILvO77a2ASb3JjdYLVjtYz0MC1s
	 2DdpxNG1143I+fNixeItbGyVe+0zizAcjuimPaCB9kCJT91FveIaetanV4oTRdmYw+
	 ekqaoMNUObuYR8VBK5EQLsk/Bbp6n6P3g4XHdrcW2CM/uAM455e0Kq0hfG0VPRXs9P
	 lkfwAYYf+vB+6zVklDlVKveo4fBZwCpRO8nFE44g5iHtYXdppFdAPWZo0ZlARl713o
	 Kg9ucBKeUBhGfkIQapgGUyoozamhvMRGdLFOHLbYw9+g1lx5u8xm6CVjXMQAddFXvu
	 ChXJfoTU4Jvgg==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7B8B117E090E;
	Fri,  4 Jul 2025 13:53:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 14:52:54 +0300
Subject: [PATCH] drm/bridge: adv7511: Fix
 DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJXAZ2gC/x2MQQqAIBBFryKzbkBNsbpKtCidajYlChFEd29o+
 f7jvwcqFaYKg3qg0MWVz0PANAriPh8bISdhsNp6HbTDOV3BG4NL4ST2zBVXvrGLbW+is45sB3L
 OhWT+w+P0vh81L1MnaAAAAA==
X-Change-ID: 20250704-adv7511-bridge-ops-fix-8c391c424e28
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

When driver is built with either CONFIG_DRM_I2C_ADV7511_AUDIO or
CONFIG_DRM_I2C_ADV7511_CEC disabled, drm_bridge_connector_init() is
expected to fail with -EINVAL.  That is because all required audio (or
CEC) related callbacks in adv7511_bridge_funcs ended up being NULL.

Set DRM_BRIDGE_OP_HDMI_AUDIO and DRM_BRIDGE_OP_HDMI_CEC_ADAPTER bridge
ops only when the aforementioned kernel config options have been
enabled.

Fixes: ae01d3183d27 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9df18a8f2e37ee53e5793700955404c34a1e01aa..f59d19b4b81a81de9604da13cd00ba9280972205 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1262,9 +1262,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID |
-		DRM_BRIDGE_OP_HDMI |
-		DRM_BRIDGE_OP_HDMI_AUDIO |
-		DRM_BRIDGE_OP_HDMI_CEC_ADAPTER;
+		DRM_BRIDGE_OP_HDMI;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
@@ -1272,6 +1270,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 	adv7511->bridge.product = adv7511->info->name;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
+	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;
 	adv7511->bridge.hdmi_audio_dev = dev;
 	adv7511->bridge.hdmi_audio_max_i2s_playback_channels = 2;
 	adv7511->bridge.hdmi_audio_i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE |
@@ -1284,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 #endif
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
+	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_ADAPTER;
 	adv7511->bridge.hdmi_cec_dev = dev;
 	adv7511->bridge.hdmi_cec_adapter_name = dev_name(dev);
 	adv7511->bridge.hdmi_cec_available_las = ADV7511_MAX_ADDRS;

---
base-commit: 86c947b363f003153768d879ee15f8358cbf29c5
change-id: 20250704-adv7511-bridge-ops-fix-8c391c424e28

