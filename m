Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30221480E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272177; cv=none; b=uqdKUjwIM5U6Ame8fwoCZts79E7sXdNwH8L+ZxWEuJX11jmMZXkpJXs+sKCfoth3tcq/E53oRx8qLZvcW2LPbYrtLYLppPo7uyUPsbN97Zpp+RnyXbQwBHOhlav9+4L733U3qFMn3ItICio1ktDt4G58GfTYQPQiBv27xVY1rI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272177; c=relaxed/simple;
	bh=PVEPm1kY/idMTDrE0VEvdUMBe89RNDz0ttex8bvxbys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1/IdGGeL9VZFWKkMt2EOKIfq8QE5DjKP167x14M9B7zj9g7AOBoiWBta0hT3npP6p8yKIAtys2KT3jiWlos+Ys91Hjf91OyqAdz8nshPHFE071mT9jcj1JUUXrBHxZI2oyNKV1BM0TTaQ+zTOu0TNq3qXAbLSnE67HWyzL+rsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCZs64Hn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCZs64Hn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439473da55aso11899065e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272174; x=1739876974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRXCP6F4bBplXevntCwP41QU632J1UrvDIWVEgZMPA0=;
        b=nCZs64Hnns0oElFmu5dC+CTqNoxzBQSoSZ9h9Qq/abNH2J7QbIYhAHgPmZ9ZmnZb/E
         GYLhH++lSW/buIb4d9J6m+pJwf0Jw8lTuxbx/wnGLb8RGp6WFxidWTSputreR/4/KT8g
         ygLlP9awSGMARULVa2TwlmZ2Rv/4f2Olegv8dn2NuQKYiI09U7hMCGCJ1Fm4MIwvNV7r
         aMu34G3D14GdtoIkCYgNc+ivoEqQVlOTIMyTJaCOQLm0O0D8jzUZxHGHULoih08TAjSW
         Pm/813U2y3eai01NDbreFXTz/PRp4+lCxEZgH58fPWuFUhCRKDMt4CC5Ggo0tiXraee+
         gjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272174; x=1739876974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRXCP6F4bBplXevntCwP41QU632J1UrvDIWVEgZMPA0=;
        b=AW4jr4FLYeM1w5d2VT2o6O85uVk/ma7rINM9JeOzid7dVL/vWgApfHFkUBp7yFgxoB
         KyXaHOeglB03XzjKGpc6mrOcMJCScKuyjaIWQIUhfkn6LE5Mjt9Ob227YJJPBS7ipIGT
         LGW4CkOrXv0Xjju0HSXVCeizIdf76kUv1b4KzItmaNX01pT12AxX8MnGVYcwrzQzpg6g
         9pvtQDiTUizmKzCFcpmQcjblIg1n/3CWzCqUty0arS6RGmPInS4jfQPnOWI1hkUO/VeW
         enKLpHTaAqMN3UWGbyOvBu+eQNfHMquJ4n6mzRX7GTd//0WS/EvAdtiJOfw+Jbl7hqoK
         vrsA==
X-Forwarded-Encrypted: i=1; AJvYcCWLbl2gHTIz/VfHupG9v3lF3p9FizUW183KMixVESFGvu1fuGHY8mx3qew/YReqaEPl4xZn7UKw7cCppQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKVfLjBKp5LMs/LHG663lWLeBOV8qgYqhYVCCFHp2Ta2sHLd3
	hr1gGwpZXKrLOPN24zdyO/ZDEjuqiYBVB2RBU3U5A365iwdJ1DLfr8DE+siS
X-Gm-Gg: ASbGncvE6ddpnUM6mm4NQA5goulAq0GxeQaBWNOO9EUT+9xjGZ+KrSMHtr5nEBCaCzB
	YRdBQ2+X06Y2MNkFBxB026hNyHR0v7xXsaRoBPdQLBC7yPp07rTjH7aM/Sqm3Vx3dEMwQqTKU40
	+RFqM7n2wepKGsSJ2GFGr56hF7D2jfXnuhMkAqsANklxpNiLBIavwSHkpKnSCWUu76S3xnh1Ltv
	zX+i2JRBI1R5E5ZlO2HC86N8edYnrmT+gscc7DaVL1mP+u3P8BfpFSt6w8NKRQWi+EeQE67Cl98
	5+7BU8m5vxwCx6J9
X-Google-Smtp-Source: AGHT+IHaEHjzly/enWLmlI6mFAusxfeBe2nWWZ8jB4NpsboW241fvKEcbn9nV3lJGEXBPuSeAXgNhA==
X-Received: by 2002:a05:600c:a45:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-439249913a5mr152047525e9.15.1739272173514;
        Tue, 11 Feb 2025 03:09:33 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:32 -0800 (PST)
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
Subject: [PATCH v2 12/15] drm/vkms: Allow to configure multiple encoders
Date: Tue, 11 Feb 2025 12:09:09 +0100
Message-ID: <20250211110912.15409-13-jose.exposito89@gmail.com>
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

Add a list of encoders to vkms_config and helper functions to add and
remove as many encoders as wanted.

For backwards compatibility, add one encoder to the default
configuration.

A future patch will allow to attach encoders and CRTCs, but for the
moment there are no changes in the way the output is configured.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |  1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 73 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 51 +++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 44 +++++++++++
 4 files changed, 169 insertions(+)

diff --git a/.clang-format b/.clang-format
index 6f944fa39841..c355a2f58eed 100644
--- a/.clang-format
+++ b/.clang-format
@@ -691,6 +691,7 @@ ForEachMacros:
   - 'v4l2_m2m_for_each_src_buf_safe'
   - 'virtio_device_for_each_vq'
   - 'vkms_config_for_each_crtc'
+  - 'vkms_config_for_each_encoder'
   - 'vkms_config_for_each_plane'
   - 'vkms_config_plane_for_each_possible_crtc'
   - 'while_for_each_ftrace_op'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 505eebb07a52..0bb76a1e6c79 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -26,6 +26,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -99,6 +100,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
 	}
 
+	/* Encoders */
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -184,6 +188,50 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_get_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	int n_encoders = 0;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	vkms_config_for_each_encoder(config, encoder_cfg)
+		n_encoders++;
+	KUNIT_ASSERT_EQ(test, n_encoders, 0);
+
+	encoder_cfg1 = vkms_config_create_encoder(config);
+	vkms_config_for_each_encoder(config, encoder_cfg) {
+		n_encoders++;
+		if (encoder_cfg != encoder_cfg1)
+			KUNIT_FAIL(test, "Unexpected encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 1);
+	n_encoders = 0;
+
+	encoder_cfg2 = vkms_config_create_encoder(config);
+	vkms_config_for_each_encoder(config, encoder_cfg) {
+		n_encoders++;
+		if (encoder_cfg != encoder_cfg1 && encoder_cfg != encoder_cfg2)
+			KUNIT_FAIL(test, "Unexpected encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 2);
+	n_encoders = 0;
+
+	vkms_config_destroy_encoder(config, encoder_cfg2);
+	vkms_config_for_each_encoder(config, encoder_cfg) {
+		n_encoders++;
+		if (encoder_cfg != encoder_cfg1)
+			KUNIT_FAIL(test, "Unexpected encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 1);
+	n_encoders = 0;
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_invalid_plane_number(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -319,6 +367,29 @@ static void vkms_config_test_invalid_crtc_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_invalid_encoder_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No encoders */
+	encoder_cfg = list_first_entry(&config->encoders, typeof(*encoder_cfg), link);
+	vkms_config_destroy_encoder(config, encoder_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many encoders */
+	for (n = 0; n <= 32; n++)
+		vkms_config_create_encoder(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -450,10 +521,12 @@ static struct kunit_case vkms_config_test_cases[] = {
 			 default_config_gen_params),
 	KUNIT_CASE(vkms_config_test_get_planes),
 	KUNIT_CASE(vkms_config_test_get_crtcs),
+	KUNIT_CASE(vkms_config_test_get_encoders),
 	KUNIT_CASE(vkms_config_test_invalid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
+	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	{}
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index d96f9e5f9b72..0cf6105fe743 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -23,6 +23,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 
 	INIT_LIST_HEAD(&config->planes);
 	INIT_LIST_HEAD(&config->crtcs);
+	INIT_LIST_HEAD(&config->encoders);
 
 	return config;
 }
@@ -34,6 +35,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
@@ -78,6 +80,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 			goto err_alloc;
 	}
 
+	encoder_cfg = vkms_config_create_encoder(config);
+	if (IS_ERR(encoder_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -89,6 +95,7 @@ void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
+	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
@@ -96,6 +103,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, link)
 		vkms_config_destroy_crtc(config, crtc_cfg);
 
+	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
+		vkms_config_destroy_encoder(config, encoder_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -188,6 +198,20 @@ static bool valid_crtc_number(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_encoder_number(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	size_t n_encoders;
+
+	n_encoders = list_count_nodes(&config->encoders);
+	if (n_encoders <= 0 || n_encoders >= 32) {
+		drm_info(dev, "The number of encoders must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -198,6 +222,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 	if (!valid_crtc_number(config))
 		return false;
 
+	if (!valid_encoder_number(config))
+		return false;
+
 	if (!valid_plane_possible_crtcs(config))
 		return false;
 
@@ -217,6 +244,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	const char *dev_name;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
@@ -233,6 +261,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   vkms_config_crtc_get_writeback(crtc_cfg));
 	}
 
+	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
+		seq_puts(m, "encoder\n");
+
 	return 0;
 }
 
@@ -366,3 +397,23 @@ struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config
 {
 	return vkms_config_crtc_get_plane(config, crtc_cfg, DRM_PLANE_TYPE_CURSOR);
 }
+
+struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *config)
+{
+	struct vkms_config_encoder *encoder_cfg;
+
+	encoder_cfg = kzalloc(sizeof(*encoder_cfg), GFP_KERNEL);
+	if (!encoder_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	list_add_tail(&encoder_cfg->link, &config->encoders);
+
+	return encoder_cfg;
+}
+
+void vkms_config_destroy_encoder(struct vkms_config *config,
+				 struct vkms_config_encoder *encoder_cfg)
+{
+	list_del(&encoder_cfg->link);
+	kfree(encoder_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 0fe0ded1d8e4..2ba80c4c9ce5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -15,12 +15,14 @@
  * @dev_name: Name of the device
  * @planes: List of planes configured for the device
  * @crtcs: List of CRTCs configured for the device
+ * @encoders: List of encoders configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
 	struct list_head planes;
 	struct list_head crtcs;
+	struct list_head encoders;
 	struct vkms_device *dev;
 };
 
@@ -65,6 +67,22 @@ struct vkms_config_crtc {
 	struct vkms_output *crtc;
 };
 
+/**
+ * struct vkms_config_encoder
+ *
+ * @link: Link to the others encoders in vkms_config
+ * @encoder: Internal usage. This pointer should never be considered as valid.
+ *           It can be used to store a temporary reference to a VKMS encoder
+ *           during device creation. This pointer is not managed by the
+ *           configuration and must be managed by other means.
+ */
+struct vkms_config_encoder {
+	struct list_head link;
+
+	/* Internal usage */
+	struct drm_encoder *encoder;
+};
+
 /**
  * vkms_config_for_each_plane - Iterate over the vkms_config planes
  * @config: &struct vkms_config pointer
@@ -81,6 +99,14 @@ struct vkms_config_crtc {
 #define vkms_config_for_each_crtc(config, crtc_cfg) \
 	list_for_each_entry((crtc_cfg), &(config)->crtcs, link)
 
+/**
+ * vkms_config_for_each_encoder - Iterate over the vkms_config encoders
+ * @config: &struct vkms_config pointer
+ * @encoder_cfg: &struct vkms_config_encoder pointer used as cursor
+ */
+#define vkms_config_for_each_encoder(config, encoder_cfg) \
+	list_for_each_entry((encoder_cfg), &(config)->encoders, link)
+
 /**
  * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
  * possible CRTCs
@@ -282,4 +308,22 @@ struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_confi
 struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config *config,
 							struct vkms_config_crtc *crtc_cfg);
 
+/**
+ * vkms_config_create_encoder() - Add a new encoder configuration
+ * @config: Configuration to add the encoder to
+ *
+ * Returns:
+ * The new encoder configuration or an error. Call vkms_config_destroy_encoder()
+ * to free the returned encoder configuration.
+ */
+struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_encoder() - Remove and free a encoder configuration
+ * @config: Configuration to remove the encoder from
+ * @encoder_cfg: Encoder configuration to destroy
+ */
+void vkms_config_destroy_encoder(struct vkms_config *config,
+				 struct vkms_config_encoder *encoder_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
-- 
2.48.1

