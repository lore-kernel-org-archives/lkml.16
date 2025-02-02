Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE91DB12F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498061; cv=none; b=HYDMtB5n3Yi/qLy6d3hNPNtZEMmweIkZqFacX56zTAKJs/M8hot5JxQINGXMcCa4MsPbEYwHaXIqVG2Yms+tncGENULqVqndAtcTwjOJ0/mPdmMm64WAE9zFGex6HpcMIav+I1ENNYPp4Gh1BR8hfKFkjp679d3Uxj/mqm8EwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498061; c=relaxed/simple;
	bh=yi9kuP8xj+IWgEzU7otZJmiGvJToi8ayWBLm49/BFfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLOkpMrJjyb7Ec+EdJil/+n7Cf+kifeuoTsvJAwSl6vnUDKaYc+LJp7NLtsHw4lVeFdjoMMU+6RbYz/nniyolHCMk1MxfA23TVx6cDQ/mslKBSKI4Xe3Qk1OAvgXbwh4v0fWjRPQH1a5OounZnOw7ajUd0ikl9gxmXGOx/CZPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NUbcZZWT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NUbcZZWT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e384e3481so3085647e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498057; x=1739102857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsARv7wcMY/4sKWAI5XqD/IVXti9mEWhbs9ICskYpok=;
        b=NUbcZZWTFf4qITJ1+wV7U32tGX/JVa+TJaDeECZPLYaM6l1pYLdZYnD3KxNBPkn1MG
         nbeIv/R+vOvbi9FbSnUhgH56ND5We9Yw7msoO5J2DnlzPY1Fz2LK/00co4jkTOxPV6Kv
         XF9nI0Jf+IXSx8MUVLNFV9uSEpkBRls577Byo9ltD3FLKz43pWzifdVfnXYChDmg/Y/n
         fjxtPmtpi8jV3fxaYazTAmFnbdISbMnLdhH/kj9zixwDaDhB6zQ2mmNozPjfdUAbT+Zn
         dNQRDWCQzmgFagmUaq053tCmKV4lI9nV6Wl2F2MvlJwBK1jjq99L/nWFA2xIlbeb3CvL
         x8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498057; x=1739102857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsARv7wcMY/4sKWAI5XqD/IVXti9mEWhbs9ICskYpok=;
        b=BROf4p0xKVvnWVEontMthRKu+Xe6M35mCmlxaeJLkwF2HgOm/oOTctxqXZ5leskisg
         bO55J2HWAq0fTZbF7U9jOXcKyGP6uS0HpBZPc3nLs8Dbhn8cZfBqE/HsHmiA9PZuQdWu
         rLvODjbBEpb7R673N+FR5HA4dz5ADuo0X3IGEzovidSe2WA6pE1irbeFtPVtJI7TaFpm
         Yo8Tk0C0oyEhi42dYbvOJTeW5VKjx+oNfM9i2UG15CLyVvvbGK2zft8DgP9rnLbc9pqj
         u1FFUeiYRQcw6jitNlRRDHOgme01/YXyzfxFAR5WZ6u85WR2q9UpX/q+j2gCOopip0IN
         joiA==
X-Forwarded-Encrypted: i=1; AJvYcCVmaCUDS3m4uydetw+U/Afh5PVZTH+zCgRekFXVe0x0ZCK404sMpXCJKFe4uRDRL6PfhLpdpipjMd8lSjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+RL6/xGq0r6SjkbjvsZUopkAdH+P3wxaeODP1d1SGLh18mP8
	hSvJFWzXy6H1kSYpL14ACKIKkalc3vl8eArChTV0aRSLulMlXyfSk1PQZXVgJTw=
X-Gm-Gg: ASbGnctLd0VlA5kBKuvUR1dwfQuBGfKu0MKq6z6P7jZaaoCSyxgC6/3DdoxThD8U3Wh
	DTv2VU3DnvmtUwDsNuOSPlFFOlr9+bxgKvwKGB5CKZLaVoII8VdsPYS/jtUqOWr8DlWkPYXBKyW
	tlKfax8VAzHIRyaD89tJ5n0LE8fRwe7lHaesydzGidvIu+C6BHZ2k1WrHfyv66O4AB1etAYhroc
	lk5kUdJxVDD4xrtli6PFXBiMjOi0co9gVNgHu/LM8h7HRgRVdsR1KG20BPGVHxowpTqxnkn4nOd
	A6cqQzdzttPpB+Im3fZQ81k=
X-Google-Smtp-Source: AGHT+IEzVX4mBQceR92uq3wNyRMur2BgWMNBH3IzLTIb0LGUgelE7xewaM7tpM1lFFY6Kfcq/Rlr+w==
X-Received: by 2002:ac2:4c26:0:b0:540:353a:df90 with SMTP id 2adb3069b0e04-543e4c3cacfmr5250298e87.43.1738498057287;
        Sun, 02 Feb 2025 04:07:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:16 +0200
Subject: [PATCH v4 09/12] drm/display: hdmi-cec-helper: add bridge-related
 functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-9-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yi9kuP8xj+IWgEzU7otZJmiGvJToi8ayWBLm49/BFfY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wpKlvuZlEwtRG+RVJAXmLqvNbMvM9Ne90W
 6ortRDmatKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1cmUB/4wEMF/P5m4Fjpogau7HjnEZL7eRltDOTGgz9zKMkOuPk7rh1nIMyOPgUOveHg6IK+Wm3N
 zAqAPjDcNFCOf2vG57ZX9gsexEPCAq6VcEEuyjzq9TDFTLUSiMs2/JOzUgUwW7epDG4DdXHT/F+
 I6rSwwgzUXMRQFJ+RabeOzxX8Lq1ibqwekzSmiln1ddyAK3MW+YwCCskIZt31Xcnh1goSy4KaGR
 uCOoczFSmideGJ4uXUS6a3TUgfsAWoGYLZU1UYUQqDQMyyAzqCTMQDMxYp/dKA7iW4IQ6hxdm+p
 8lLhJYH24HLkpnzVHVLeKX2u1gU1HwUHkLR4aQ0UZ3P6xd4C
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Let drm_bridge drivers handle CEC adapters in a generic way. Add a set
of helper functions to be called by DRM bridge drivers to report CEC
message-related events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 38 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  | 15 +++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     |  8 ++++++
 include/drm/drm_bridge.h                      | 11 ++++++++
 4 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index a6ed5f0fc3835b013a83308f5285ea0819c5702c..8cb3bd35febd55211f7088b9f47dfc6a00c06109 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -207,3 +207,41 @@ void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
 	mutex_unlock(&connector->cec.mutex);
 }
 EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
+
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_data)
+		drm_connector_hdmi_cec_transmit_done(bridge->cec_data,
+						     status, arb_lost_cnt,
+						     nack_cnt, low_drive_cnt, error_cnt);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_done);
+
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_data)
+		drm_connector_hdmi_cec_transmit_attempt_done(bridge->cec_data, status);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_attempt_done);
+
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_data)
+		drm_connector_hdmi_cec_received_msg(bridge->cec_data, msg);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_received_msg);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..7ee791aa8f962fb13467464cebb8f53ab06991f0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -206,6 +206,7 @@ static LIST_HEAD(bridge_list);
 void drm_bridge_add(struct drm_bridge *bridge)
 {
 	mutex_init(&bridge->hpd_mutex);
+	mutex_init(&bridge->cec_mutex);
 
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
@@ -248,6 +249,7 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 	mutex_unlock(&bridge_lock);
 
 	mutex_destroy(&bridge->hpd_mutex);
+	mutex_destroy(&bridge->cec_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
@@ -1302,6 +1304,19 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+void drm_bridge_cec_data_set(struct drm_bridge *bridge, void *cec_data)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_HDMI))
+		return;
+
+	mutex_lock(&bridge->cec_mutex);
+
+	bridge->cec_data = cec_data;
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_data_set);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index a9d38835c69a2939ca21a4fc921136a2a022248c..04c0ac482e977423ebbf803fc5856321a6b0a523 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 
+struct drm_bridge;
 struct drm_connector;
 
 struct cec_msg;
@@ -83,4 +84,11 @@ static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connec
 static inline void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector) {}
 #endif
 
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt);
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status);
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 348778f233b06265a6ae577762c6558e69cdb396..df1d72c7e176c75585283684acc2ef2ffb2f8bff 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -939,6 +939,15 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @cec_mutex: Protects the @cec_data field.
+	 */
+	struct mutex cec_mutex;
+	/**
+	 * @cec_data: Private data to be used by the CEC callbacks.
+	 */
+	void *cec_data;
 };
 
 static inline struct drm_bridge *
@@ -1062,6 +1071,8 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
+void drm_bridge_cec_data_set(struct drm_bridge *bridge, void *cec_data);
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);

-- 
2.39.5

