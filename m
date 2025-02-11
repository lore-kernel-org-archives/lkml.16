Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAA1F8BCB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272164; cv=none; b=YjT8LWXtKN2/HqGmpzVXzBYtB3ucngj2oD7io+GSKHE/8vH5IHribJoPOr89ghEYNwoRkJiO3axwCXZywDr/o/NdUFn8uXEr/ZmaY1yStL4HBIqPToyb9aOtpmw+hXtXPg72bdsj0wjFXVolqCXP7FJhXV4jSZzElVZVrIku+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272164; c=relaxed/simple;
	bh=NqKUzI9Kmgs9z+WBxXu0/bcQz0rhTTeF+BXogLGULSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmncedR01Opsp5R/ViboXBOXGw2ros3Qwxnb5TqQLoieT4vdy0dTM97mXz7elBeNBAdvoA4GzMuQytzr7fYhDjsjbbi8j+6voi8cfKDoofdYHB7IhCbpfARlLWMWu0r4yYDcOEVS5g8LGgVV4MYlbMlB8xXcIy+KITcU15fEsDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4ZiRKW2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4ZiRKW2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so2055574f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272160; x=1739876960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
        b=J4ZiRKW2YBoCGRBfXhO1jO6fMblrCu+p9xfZFSfU2ePUFwoah23joIx5ogqgHgapvO
         YJL84D7Ru+MTlVf9y2rEZ6APwVQ2BiVxStHnJEDIUY2S0sJzRMqgtBRQcvoRYLDTjLHx
         wD5elIc6aIh7VshpIEmnvr/pVVeP2NwokuV5ypNRv6IJGd473Pwm7xb8K19XLqFep4JY
         /hwHH6c75vwyQhTtrrz+ZvpHhDXL+Ejfee7vhwR9u+vqCqOeUAkp+cGUpoa0HEiXyTXe
         8nyTqRgLFPz9Kta0zqWcq22MO75+hcKllGo52gRKbHGJdekUNYTKtB3teM4RUr7IpZEf
         YRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272160; x=1739876960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prbaD9EEGSsUeJKiTeBVWVOJfwbyTxNyFRLpyPWOntc=;
        b=ZkQffJIBTFlERPWWYf9KyopnVCrcTJeyG3Fctqhw1Vk1hajnPYAnnmKnjfMn01z2Q/
         VMmWsssi9BJG/JNtVhdQMzjcpfnhtyjyVgmyqmbIlaIDgnBLo56KfC7LBVCukrYgi8ql
         n6y5jX4DOIb92siGUAHv8RL3TjphdPLjLaS6gyV/zUvc+MNr3nxRghYK1Jm2NrUooAIf
         Kc0jrXwqo48vDafp9MbDaDIP4NQo6z7PLa97cDjJsCDOzdupJNX4pX8g5/LEKays9/QP
         MNuLDtn0QY25/tBv3hjJ6884g+D9QzIg9ip3GaGVyfzBbYKb6eYxgKsuIAzokCaMbTEt
         nLmw==
X-Forwarded-Encrypted: i=1; AJvYcCViGeBWLXi/rMyB3I2UJiKpSq4jnJFGdvi/ZPymjnB//byzr94YJzsRXTzjtk62a9O7BBF/cVPrmO1bgy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8dabhjpKX/YOFGykOqLkVMImaRFkMRFRUZdXFcI3gPZdaOPIT
	H+1fw5k3oIbTnuPcC1J4yVD+zsJeEaSA0Iqf/0s9WGnR9K5wRIVhSuUstMB5
X-Gm-Gg: ASbGncu7Au6APoj+BBnzR0PTGEjp1rP6DcikciLYDny+GGninmSbFGixzBJ/iwPQCEd
	oTvTnkypLMHmzMJ1WBFPYCK4NnuyV2OuuRl2U63kvhgHSJvD3NRB7iGhzQjlIcDsIorI/15lBmD
	NsmpeeB6ri/K5gAXq0S9NOdXCMkTUj3mEtwgAj/7mI7b46plfMIH/p6UKr6l+zIOy1IFFykaC0J
	3PPFtsFMaeTRHRGCDbqjYe/pkcpQdn3U86WmomoVkAxjjp9tBx4AjfcwE9K8qG5r22rGZ3ATBWb
	d8BqmSq0GACQK23Z
X-Google-Smtp-Source: AGHT+IEisoGk6NyTYRg9Nzt3NhsjvTdsTtmM67osH1eZt5tSPgY4xDQE9dG1ITKt+LUP+bKxOTSPXQ==
X-Received: by 2002:a5d:6d04:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-38de401feb4mr3038917f8f.49.1739272160471;
        Tue, 11 Feb 2025 03:09:20 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:19 -0800 (PST)
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
Subject: [PATCH v2 03/15] drm/vkms: Create vkms_connector struct
Date: Tue, 11 Feb 2025 12:09:00 +0100
Message-ID: <20250211110912.15409-4-jose.exposito89@gmail.com>
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

Create a structure wrapping the drm_connector.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c |  8 ++++----
 drivers/gpu/drm/vkms/vkms_connector.h | 11 ++++++++++-
 drivers/gpu/drm/vkms/vkms_output.c    |  4 ++--
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index fc97f265dea6..ab8b52a84151 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -29,22 +29,22 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
-struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	int ret;
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
 	if (!connector)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret)
 		return ERR_PTR(ret);
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
 	return connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index beb5ebe09155..c9149c1b7af0 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -5,6 +5,15 @@
 
 #include "vkms_drv.h"
 
+/**
+ * struct vkms_connector - VKMS custom type wrapping around the DRM connector
+ *
+ * @drm: Base DRM connector
+ */
+struct vkms_connector {
+	struct drm_connector base;
+};
+
 /**
  * vkms_connector_init() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
@@ -12,6 +21,6 @@
  * Returns:
  * The connector or an error on failure.
  */
-struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index b01c3e9289d0..4b5abe159add 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -7,7 +7,7 @@
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector;
+	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -69,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
 
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		return ret;
-- 
2.48.1

