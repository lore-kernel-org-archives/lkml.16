Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9B1F4E5F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272162; cv=none; b=MuyPSTkbN4lGfS4Yqp83wOjSWfU9SAbfNz+4Qt7J482GosHH2lcWsdYCB1FB8h9mDaY+7cULRhp3lLyRQMledXfOv94g80lzF1gOEj5ICsOgWpeCg744JCTuf8zyPEbgPVKCWuXkNNW8BH7RFDn/8Y5SiOiceQAj9O/4ccuOKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272162; c=relaxed/simple;
	bh=sC9Zaw3ndAVo+oHrEyc64S6eUMv2Ld/tFQLViNUAGL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJW29kb3CQmyLL1eQKtCRl/0BnP3eVqFuo8xwFcbKdj6dM6L67QQ4FzoiPOYtz991svkE5GNFvxWFOdglAOkxVugShVdAA5BHOMDTNa9NMmDOkQoFV9POmaazkwI4Iot6OFZ9037JH/Zle6s2MleJPKALVCdNVUYZk/vxNAm2II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qw6tihCX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qw6tihCX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso2385137f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272159; x=1739876959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6WlJ6G+D4bbUKndbktll+9YSW21OZOtswUdeB6r15c=;
        b=Qw6tihCXf87Tm1a9UDZJBwTZuscdFkKscpZ1fJ6UdzTHizq4jyDDffsIxcrz9cCLgk
         RXIH2+tN0S+S4O+ivA0gW57/SMnYPrNb6ui8xfcDFIZ5xkR+oKPXRojEdBu+QGy05/YH
         bSb199CLrQZN/2VOvcCn5kCdWDIUbBroWCpPivwIdk5p34fojs+9BqAsmyxZJG6OyAz5
         NlYxzV0K8RGiPe8DsbXp+rcJEgDYd9YiqWrbC2Db287sP8nmF+kqGkD3JTyOOK8oYIre
         qMKFZ8NOgr0IZu1PZPhyP69elTZ2U0Y1gbgXQW073JymFrpGKg5IwthqonsJRvC2X0Tr
         Uk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272159; x=1739876959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6WlJ6G+D4bbUKndbktll+9YSW21OZOtswUdeB6r15c=;
        b=plfK6U/EqAJYwAxH10T/NHFW+RhcmLPZ2V41tpfOAw8BEFd+izpF1Gzcx+2gdh+B2K
         QSb60nf6p2I8ryYj9fGalUGuHeKwtDOCmb8CqKHLjO5ljnmDJRPKrANWibSRH7lVnA1z
         q6bUwMkpPeQ3yErjJeL72+n5vmkwcZ2CNGk+dubDee0XsiweEizl/Lpzex6D/dwSUykZ
         UVSE88KDXf8BfDlGbSAUhPVdqBG9aeRxFld6HkQbE42IrKDGEZqutcW594yG0yxidQRY
         1m82a2nQhTABd/yx/8wCSElzo/fcgnd2U4zatFUsAOC3aoGpZDNJ8KgLLRnVaevi+RRW
         +suQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGgICdowB50AFSSuboDEPpltNunb8w44BBMB3aHYgN6OyqixVel3Z38k0AvaIMBVTMZV29+9G760cvAS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynYuXThlaZpuHORgroz85BH/v6bOzm0fsNrganyZZMso3bgPB1
	H6abVKng6kyO7hzbYZAIAWLoHszT4jRr1Q80oo2W4gLiKXKvpP87N1ivbC2F
X-Gm-Gg: ASbGncvsmJ/VKybLw3jtxVjaP4PtuvfgJzQyL+v8RmtzPRjGC0Ewexn5GbSSw2keL+v
	mjLPm0BKlbYELV9Si1YGftrAfZWvKOC7Cw8DOAsUte+2Bba0A5zDwn6vl9WakVtmBsT40yv1MgV
	IyFSgUA/juwuHTg7c7Y9aa7Vh5GsNkXrIwTYMgQ5D6JkJj8QsOuGDqUC27/sP9dh0dCLy1BS/u5
	I11drlEXTiu4sVjl+2L7p+66NsM7/E9bXjdhHoG2X9XSOcN7JvCplWzos/3EspYbrqfnU+HO7wt
	2aSB6ttxWifcdNNB
X-Google-Smtp-Source: AGHT+IEoxT9zQQpAm3Z/MPqIxGWp+fHukRONORU7zSofoG0svTWCzkqt1BkJE0/BpfPtnxCdMX09dg==
X-Received: by 2002:a05:6000:1448:b0:38a:88bc:aea4 with SMTP id ffacd0b85a97d-38dc9233a6dmr12788413f8f.30.1739272158878;
        Tue, 11 Feb 2025 03:09:18 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:17 -0800 (PST)
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
Subject: [PATCH v2 02/15] drm/vkms: Extract vkms_connector header
Date: Tue, 11 Feb 2025 12:08:59 +0100
Message-ID: <20250211110912.15409-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Up until now, the logic to manage connectors was in vkms_output.c.

Since more options will be added to connectors in the future, extract
the code to its own file.

Refactor, no functional changes.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile         |  3 +-
 drivers/gpu/drm/vkms/vkms_connector.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h | 17 +++++++++
 drivers/gpu/drm/vkms/vkms_output.c    | 41 +++-------------------
 4 files changed, 73 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..6b0615c424f2 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,7 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
new file mode 100644
index 000000000000..fc97f265dea6
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+
+#include "vkms_connector.h"
+
+static const struct drm_connector_funcs vkms_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int vkms_conn_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	/* Use the default modes list from DRM */
+	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
+	.get_modes    = vkms_conn_get_modes,
+};
+
+struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct drm_connector *connector;
+	int ret;
+
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+
+	return connector;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
new file mode 100644
index 000000000000..beb5ebe09155
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONNECTOR_H_
+#define _VKMS_CONNECTOR_H_
+
+#include "vkms_drv.h"
+
+/**
+ * vkms_connector_init() - Initialize a connector
+ * @vkmsdev: VKMS device containing the connector
+ *
+ * Returns:
+ * The connector or an error on failure.
+ */
+struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+
+#endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 22f0d678af3a..b01c3e9289d0 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,32 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_connector.h"
 #include "vkms_drv.h"
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_probe_helper.h>
-
-static const struct drm_connector_funcs vkms_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int vkms_conn_get_modes(struct drm_connector *connector)
-{
-	int count;
-
-	/* Use the default modes list from DRM */
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
-
-	return count;
-}
-
-static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
-	.get_modes    = vkms_conn_get_modes,
-};
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
@@ -73,21 +49,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
-	if (!connector) {
-		DRM_ERROR("Failed to allocate connector\n");
-		return -ENOMEM;
-	}
-
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
-	if (ret) {
+	connector = vkms_connector_init(vkmsdev);
+	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-		return ret;
+		return PTR_ERR(connector);
 	}
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
-
 	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
 	if (!encoder) {
 		DRM_ERROR("Failed to allocate encoder\n");
-- 
2.48.1

