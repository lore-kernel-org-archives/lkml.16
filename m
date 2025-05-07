Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30FC29209C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626095; cv=none; b=YIzja+i5DuzqXUcmZUb1UPp1ddsEBhM8dYBhAd9/IedA/tqkh0PtOVV00sakUiLSq5fPxVIzuolhfE2+/Io9PH/7O2ZYGdt3cGqJdGiRiHNZii0yEV5qj2I/ae6Hyp/1yX9bz2iA8HTMQYth1skhS5upFw7XPOhS7QJo1E6VKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626095; c=relaxed/simple;
	bh=b2/RL4icLuE0e/p0RrOM3IUHzaPxTnxQXDuCCI+r1zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOH8gfyT/vBPwUTAuIUs8vZMxeyeqFP2/Uo6zKKjFMzuk17ThqHn0CRpBX4hG0fQsEkRI9qn9iKG+aT2KV3M05//uuoMiw1cmtT2O34Y9ynTKP+MTrTkt852BC7mkE4mX1vSwQ4enfQZCHm5dgL3Qbx6tpNI+EH7G5vlg5n8VqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWsMsJMa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWsMsJMa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7295025e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626092; x=1747230892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xrHu3hpS4UuzMjlqKc3OEphPbKbzYJqXFWO9xgTq7I=;
        b=PWsMsJMazh68vw/QE/eWg7I+Hvq9SBXAp4ofdBGf0HySVTvd0UjlvSNgg/I3f/Xtnv
         cRkWTJmEnGLee0drCh3WD8A1hRcwjXg954FUpe8ghA6YdGRg2I6Jp/pVciwraQbITC8t
         0qc/O/hbyfKv6xuwwVTlkPx7vg+ZerLJPk4vWS3AGr50IPVpzcNfEQ30ggha1Sw/rCrn
         /PxXUsCpc6Ngp3Cyamv2UJcE0YtcnksSBVmzGhO+yzoCOQME3F/ZK2mTHx9xQ2HXHrxW
         ScjlLGvMY9Nb0eMtEuP/HJOZcmVINyB48HlstDFFtwndHKNpG4yPrDQxhcRwohiTIpzV
         OZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626092; x=1747230892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xrHu3hpS4UuzMjlqKc3OEphPbKbzYJqXFWO9xgTq7I=;
        b=kTeOixOOL9CSoeZSpMfY6WNfRHvcGjdS4fvWimdsfccCsEgqmzFoLLCHYPSdgdKwT7
         gtpo8T3iV3ff8gMJ7E80RPpvjVz6kVfFBxi+R3uYwhu+75fr8ffiLQfwnur99+hV8Ckp
         tUm+ziW1pQf9/IZOK/ctEGwnhDoUiSpB0LG6xxgUCgnSRO+HvGyPtwD64g2REEnpxSX9
         AQbDLSS2OntBEjqJDEWXs8TTHFDGwrXt+rAPTvtJS3oCZBIVgUsbnXEeX2dxKx7hi36X
         YD0YSyOr7DsRrYfZq6kU11DVYdIlN9RZwwM/NcBddX5OezAkG5hsqHBe0aMCUVwhqZTE
         9Zcw==
X-Forwarded-Encrypted: i=1; AJvYcCXflFsx2NArJDm2Q9wrWcTD7q/QfVNUReL6hUUfHaiKAVldCX2tP6tysyLFJLJaja0voG8sVJKdl8QTuLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qOQHLRhickZ/rM7wUnB1tW8H1o8D/hEvRuLFwrrOY6v9oiYD
	s8wZIlYZP8N+WzZPaSQ9V3IOPOLuSh2FSFh58p6WhJ//JXYOPqmJ
X-Gm-Gg: ASbGncuhmWuF4WNMUobUTcaUtWab+vvUVWgTsOVxMC9BgFEo4MT3zqCno7D/i7I15hY
	Z6p35c2mQ04XoTPU2vzCk6Of4nLjyKjnnkp4Z+xx7EzM2z+EUQTnFMpHvMmjgjAMmPhir0OYAh3
	nYoI4i+zb+8xXpCz7IprfVmWR4nNBYiLYVKZy/kL9NLIG7TMPab1qU0e8Hp3ljkNq2hLjmfJanB
	cCVgD7cIzWzHnGgaBh+CsTDImm1AjpU512AIv5U8O8kB75dOaYBPLtOmCyyVr4yA0YYRvJGpqYL
	o3mn47CRiyP0o0oaQxjlnhDRlvvyI4yu0VeemfXDbw==
X-Google-Smtp-Source: AGHT+IHvaaPDLegx/YYsCReSQEQL0sraRn5ZCzEidmLJnwbZc+IHhvSSWvwVeWCyM383lzv1Bk0sKA==
X-Received: by 2002:a05:600c:64c8:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-441d44a9cb1mr37201965e9.14.1746626091950;
        Wed, 07 May 2025 06:54:51 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:51 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 14/16] drm/vkms: Allow to configure connector status
Date: Wed,  7 May 2025 15:54:29 +0200
Message-ID: <20250507135431.53907-15-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow to store the connector status in vkms_config_connector and add a
getter and a setter functions as well a KUnit test.

This change only adds the configuration, the connector status is not
used yet.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 24 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            |  8 ++++--
 drivers/gpu/drm/vkms/vkms_config.h            | 26 +++++++++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index ff4566cf9925..3574a829a6ed 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -916,6 +916,29 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_connector_status(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg;
+	enum drm_connector_status status;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	connector_cfg = vkms_config_create_connector(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg);
+
+	status = vkms_config_connector_get_status(connector_cfg);
+	KUNIT_EXPECT_EQ(test, status, connector_status_connected);
+
+	vkms_config_connector_set_status(connector_cfg,
+					 connector_status_disconnected);
+	status = vkms_config_connector_get_status(connector_cfg);
+	KUNIT_EXPECT_EQ(test, status, connector_status_disconnected);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -937,6 +960,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
+	KUNIT_CASE(vkms_config_test_connector_status),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a1df5659b0fb..f8394a063ecf 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -361,8 +361,11 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
 		seq_puts(m, "encoder\n");
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
-		seq_puts(m, "connector\n");
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		seq_puts(m, "connector:\n");
+		seq_printf(m, "\tstatus=%d\n",
+			   vkms_config_connector_get_status(connector_cfg));
+	}
 
 	return 0;
 }
@@ -588,6 +591,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 		return ERR_PTR(-ENOMEM);
 
 	connector_cfg->config = config;
+	connector_cfg->status = connector_status_connected;
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 0118e3f99706..e202b5a84ddd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -7,6 +7,8 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 
+#include <drm/drm_connector.h>
+
 #include "vkms_drv.h"
 
 /**
@@ -99,6 +101,7 @@ struct vkms_config_encoder {
  *
  * @link: Link to the others connector in vkms_config
  * @config: The vkms_config this connector belongs to
+ * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
@@ -109,6 +112,7 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	enum drm_connector_status status;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -434,4 +438,26 @@ int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connect
 void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
 					  struct vkms_config_encoder *encoder_cfg);
 
+/**
+ * vkms_config_connector_get_status() - Return the status of the connector
+ * @connector_cfg: Connector to get the status from
+ */
+static inline enum drm_connector_status
+vkms_config_connector_get_status(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->status;
+}
+
+/**
+ * vkms_config_crtc_set_writeback() - If a writeback connector will be created
+ * @crtc_cfg: Target CRTC
+ * @writeback: Enable or disable the writeback connector
+ */
+static inline void
+vkms_config_connector_set_status(struct vkms_config_connector *connector_cfg,
+				 enum drm_connector_status status)
+{
+	connector_cfg->status = status;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
-- 
2.49.0

