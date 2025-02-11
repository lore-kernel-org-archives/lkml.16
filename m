Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952871FCFF2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272173; cv=none; b=H0UWO8yR43J0O33U+3DL3MNa6XBrSvoTlDOZoYM3NIANpTEofUv2TQbrnziqd6iFYzaLn8JHwSG4zgsBb1/pmyTlDFSsd/c0GGjqT4qJroDsQcwK/rtlQ1I3aDClzBgdvAFKqWPJIs+gr8wL95QrYACyVllFAWM/3su4UqOtzUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272173; c=relaxed/simple;
	bh=jQiqimLgyL3YXSrLRLX/jOpP0x47NTsxc3XafwDHLTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJupfS0ZbMZN9akQ5hITsfVZe1nWjERVJTI0oPL3q2xk3vTgq0ZCSeYArtik24ry4VXUInxJdkm86eKi6hls0vR+3ZhXE7OdsCgzWLkEFGEi76/HbJSE8KVJhXTocipHQuSCR31AKhoipZqupe3s0Qup9eOYUBy/haRF2tgr0Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDbwiJRe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDbwiJRe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc962f1b9so2388419f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272169; x=1739876969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2kmfXhT9BzoK/pB6AuaP8lD3p6L3Xv05Wido6gdYTs=;
        b=IDbwiJRebXY1umnbLSwXgb/5et6OOvlZClaPc+xP5cYmtk3CtfyOvDOsep03uMb+d7
         wW59rpz6pgTWzjUwbgAcUF/EbzVDOS3knmk9EwSYT42qwHD4ThCxHwNyfLA2zJ0f6Prg
         QGXEUcJ9Ap6tT4uccy3RHVrCRbRBbbtGyht1WEKGmLJnt+dqeRzAvM0w9NXmxdHmBT6H
         WFtpNJknSC8qaFsbqaMmYU+uvBXQtzeLr9XC2aX1RiXO78wVmy1FwR0lDb8kKlUAUeeI
         eZQnJ2X9RoDjHsSaXxa23iCZExc6TyipIrAUys9elVm1ib2lIr7hAM2uh3TnVRfMFNiz
         lcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272169; x=1739876969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2kmfXhT9BzoK/pB6AuaP8lD3p6L3Xv05Wido6gdYTs=;
        b=wxm3MgIniTFOrUh14tP3FFIMva8tCdSc4D5+vTh3nEkDM24iB6faMC5PGYhHOJNlhL
         2e1MeuxCASKEAOhMslzI5tYXK0lVNh1ZrEgNEYo7LX4HELV3inBz3eoa2bUWfYZGrgfO
         HpoV2DWzhp25f7VPpMF4zOQh/ZUQC5DgFdyMASXZMUMzDYpx+9ZEDCzDxXQVvUMm3elT
         c6GnLLotoa90gomsQTFzoWUZpmUL7ZDHm+Ngxv/c9lCSHWSWmDV4JIL28Rao7aBjZpSP
         3RJiF5OTiF8v6npgrPPwLDuy63fAJQyGOHj4Be6XTWfgEB+1ri0r/cTRMkymTvXaEj4f
         yNNg==
X-Forwarded-Encrypted: i=1; AJvYcCX+9kqbmyqFMDPq1c2M9OW1a91eA7ftpZ66IVMbHir8aLt24/REcdNtqAHqJcD6RSBYvdds2pArJ4uNx2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYkLG0PLi6lWCvqAbXFlxs/N8nOLZzeexlmScC1pTVCuNTBBG
	W47imFQCh3jb+zyowtXfhLzsvgpIzyph3swQx9mGAeSnWFwPxMfs
X-Gm-Gg: ASbGnctV2JOtTlDAI+Fxt9krWiR4PUzCoqOczZjvm6D8xh5e23Cm9nTofMBoIEZqshO
	5+9ODjkNEZn0GomgfazmM6a9TpUWFWGw70IHlY4DwmCFwv1UztqXjGI5JC3mSHNDfj/+A4SUhde
	rWiUzo3GhSlHsgSrS76axwLyKw78L0UMSvSsbPBTgo1VU9iG7aj93kaHhc3FfuYCS7+vZ3Mo+Sn
	CITnLuk1sh0MFyetreWTrvQf8xoEAF773Ap50GBSEqS232shWE2bYJhIjEjh8C5go+yGLyfJHHP
	Ha1v13OkNigHTyYe
X-Google-Smtp-Source: AGHT+IEzl7v9Ctoqur7uCVRnL8fUQKBIvhoP1P3h6FkEuOOmER8stFwB4z2yi1f8X0XCRNCSRLIZzQ==
X-Received: by 2002:a05:6000:156f:b0:38d:d9e7:54a8 with SMTP id ffacd0b85a97d-38dd9e756f9mr7286984f8f.19.1739272168677;
        Tue, 11 Feb 2025 03:09:28 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:28 -0800 (PST)
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
Subject: [PATCH v2 09/15] drm/vkms: Allow to configure multiple planes
Date: Tue, 11 Feb 2025 12:09:06 +0100
Message-ID: <20250211110912.15409-10-jose.exposito89@gmail.com>
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

Add a list of planes to vkms_config and create as many planes as
configured during output initialization.

For backwards compatibility, add one primary plane and, if configured,
one cursor plane and NUM_OVERLAY_PLANES planes to the default
configuration.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 140 +++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 124 +++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            |  73 ++++++++-
 drivers/gpu/drm/vkms/vkms_output.c            |  42 ++----
 5 files changed, 344 insertions(+), 36 deletions(-)

diff --git a/.clang-format b/.clang-format
index fe1aa1a30d40..c585d2a5b395 100644
--- a/.clang-format
+++ b/.clang-format
@@ -690,6 +690,7 @@ ForEachMacros:
   - 'v4l2_m2m_for_each_src_buf'
   - 'v4l2_m2m_for_each_src_buf_safe'
   - 'virtio_device_for_each_vq'
+  - 'vkms_config_for_each_plane'
   - 'while_for_each_ftrace_op'
   - 'xa_for_each'
   - 'xa_for_each_marked'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 6e07139d261c..38ec456d9610 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -24,6 +24,10 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	dev_name = NULL;
 	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
 
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
 	vkms_config_destroy(config);
 }
 
@@ -44,16 +48,145 @@ static void vkms_config_test_default_config(struct kunit *test)
 {
 	const struct default_config_case *params = test->param_value;
 	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	int n_primaries = 0;
+	int n_cursors = 0;
+	int n_overlays = 0;
 
 	config = vkms_config_default_create(params->enable_cursor,
 					    params->enable_writeback,
 					    params->enable_overlay);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
-	KUNIT_EXPECT_EQ(test, config->cursor, params->enable_cursor);
 	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
-	KUNIT_EXPECT_EQ(test, config->overlay, params->enable_overlay);
 
+	/* Planes */
+	list_for_each_entry(plane_cfg, &config->planes, link) {
+		switch (vkms_config_plane_get_type(plane_cfg)) {
+		case DRM_PLANE_TYPE_PRIMARY:
+			n_primaries++;
+			break;
+		case DRM_PLANE_TYPE_CURSOR:
+			n_cursors++;
+			break;
+		case DRM_PLANE_TYPE_OVERLAY:
+			n_overlays++;
+			break;
+		default:
+			KUNIT_FAIL_AND_ABORT(test, "Unknown plane type");
+		}
+	}
+	KUNIT_EXPECT_EQ(test, n_primaries, 1);
+	KUNIT_EXPECT_EQ(test, n_cursors, params->enable_cursor ? 1 : 0);
+	KUNIT_EXPECT_EQ(test, n_overlays, params->enable_overlay ? 8 : 0);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_get_planes(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
+	int n_planes = 0;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	vkms_config_for_each_plane(config, plane_cfg)
+		n_planes++;
+	KUNIT_ASSERT_EQ(test, n_planes, 0);
+
+	plane_cfg1 = vkms_config_create_plane(config);
+	vkms_config_for_each_plane(config, plane_cfg) {
+		n_planes++;
+		if (plane_cfg != plane_cfg1)
+			KUNIT_FAIL(test, "Unexpected plane");
+	}
+	KUNIT_ASSERT_EQ(test, n_planes, 1);
+	n_planes = 0;
+
+	plane_cfg2 = vkms_config_create_plane(config);
+	vkms_config_for_each_plane(config, plane_cfg) {
+		n_planes++;
+		if (plane_cfg != plane_cfg1 && plane_cfg != plane_cfg2)
+			KUNIT_FAIL(test, "Unexpected plane");
+	}
+	KUNIT_ASSERT_EQ(test, n_planes, 2);
+	n_planes = 0;
+
+	vkms_config_destroy_plane(plane_cfg1);
+	vkms_config_for_each_plane(config, plane_cfg) {
+		n_planes++;
+		if (plane_cfg != plane_cfg2)
+			KUNIT_FAIL(test, "Unexpected plane");
+	}
+	KUNIT_ASSERT_EQ(test, n_planes, 1);
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_invalid_plane_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No planes */
+	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
+	vkms_config_destroy_plane(plane_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many planes */
+	for (n = 0; n <= 32; n++)
+		vkms_config_create_plane(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
+static void vkms_config_test_valid_plane_type(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
+	vkms_config_destroy_plane(plane_cfg);
+
+	/* Invalid: No primary plane */
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Multiple primary planes */
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: One primary plane */
+	vkms_config_destroy_plane(plane_cfg);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Multiple cursor planes */
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: One primary and one cursor plane */
+	vkms_config_destroy_plane(plane_cfg);
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -63,6 +196,9 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
 			 default_config_gen_params),
+	KUNIT_CASE(vkms_config_test_get_planes),
+	KUNIT_CASE(vkms_config_test_invalid_plane_number),
+	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 67f71d29596e..8feacfc155be 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -21,6 +21,8 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	INIT_LIST_HEAD(&config->planes);
+
 	return config;
 }
 
@@ -29,26 +31,114 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_overlay)
 {
 	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
-	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
+
+	plane_cfg = vkms_config_create_plane(config);
+	if (IS_ERR(plane_cfg))
+		goto err_alloc;
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+
+	if (enable_overlay) {
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			plane_cfg = vkms_config_create_plane(config);
+			if (IS_ERR(plane_cfg))
+				goto err_alloc;
+			vkms_config_plane_set_type(plane_cfg,
+						   DRM_PLANE_TYPE_OVERLAY);
+		}
+	}
+
+	if (enable_cursor) {
+		plane_cfg = vkms_config_create_plane(config);
+		if (IS_ERR(plane_cfg))
+			goto err_alloc;
+		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+	}
 
 	return config;
+
+err_alloc:
+	vkms_config_destroy(config);
+	return ERR_PTR(-ENOMEM);
 }
 
 void vkms_config_destroy(struct vkms_config *config)
 {
+	struct vkms_config_plane *plane_cfg, *plane_tmp;
+
+	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
+		vkms_config_destroy_plane(plane_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
 
+static bool valid_plane_number(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	size_t n_planes;
+
+	n_planes = list_count_nodes(&config->planes);
+	if (n_planes <= 0 || n_planes >= 32) {
+		drm_info(dev, "The number of planes must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool valid_plane_type(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	struct vkms_config_plane *plane_cfg;
+	bool has_primary_plane = false;
+	bool has_cursor_plane = false;
+
+	vkms_config_for_each_plane(config, plane_cfg) {
+		enum drm_plane_type type;
+
+		type = vkms_config_plane_get_type(plane_cfg);
+
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			if (has_primary_plane) {
+				drm_info(dev, "Multiple primary planes\n");
+				return false;
+			}
+
+			has_primary_plane = true;
+		} else if (type == DRM_PLANE_TYPE_CURSOR) {
+			if (has_cursor_plane) {
+				drm_info(dev, "Multiple cursor planes\n");
+				return false;
+			}
+
+			has_cursor_plane = true;
+		}
+	}
+
+	if (!has_primary_plane) {
+		drm_info(dev, "Primary plane not found\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
+	if (!valid_plane_number(config))
+		return false;
+
+	if (!valid_plane_type(config))
+		return false;
+
 	return true;
 }
 
@@ -58,12 +148,17 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	const char *dev_name;
+	struct vkms_config_plane *plane_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+
+	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
+		seq_puts(m, "plane:\n");
+		seq_printf(m, "\ttype=%d\n",
+			   vkms_config_plane_get_type(plane_cfg));
+	}
 
 	return 0;
 }
@@ -77,3 +172,24 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
 	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 }
+
+struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
+{
+	struct vkms_config_plane *plane_cfg;
+
+	plane_cfg = kzalloc(sizeof(*plane_cfg), GFP_KERNEL);
+	if (!plane_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+
+	list_add_tail(&plane_cfg->link, &config->planes);
+
+	return plane_cfg;
+}
+
+void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
+{
+	list_del(&plane_cfg->link);
+	kfree(plane_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 0376dceaf6be..1c7ffc27f2a8 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -3,6 +3,7 @@
 #ifndef _VKMS_CONFIG_H_
 #define _VKMS_CONFIG_H_
 
+#include <linux/list.h>
 #include <linux/types.h>
 
 #include "vkms_drv.h"
@@ -12,18 +13,44 @@
  *
  * @dev_name: Name of the device
  * @writeback: If true, a writeback buffer can be attached to the CRTC
- * @cursor: If true, a cursor plane is created in the VKMS device
- * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @planes: List of planes configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
 	bool writeback;
-	bool cursor;
-	bool overlay;
+	struct list_head planes;
 	struct vkms_device *dev;
 };
 
+/**
+ * struct vkms_config_plane
+ *
+ * @link: Link to the others planes in vkms_config
+ * @type: Type of the plane. The creator of configuration needs to ensures that
+ *        at least one primary plane is present.
+ * @plane: Internal usage. This pointer should never be considered as valid.
+ *         It can be used to store a temporary reference to a VKMS plane during
+ *         device creation. This pointer is not managed by the configuration and
+ *         must be managed by other means.
+ */
+struct vkms_config_plane {
+	struct list_head link;
+
+	enum drm_plane_type type;
+
+	/* Internal usage */
+	struct vkms_plane *plane;
+};
+
+/**
+ * vkms_config_for_each_plane - Iterate over the vkms_config planes
+ * @config: &struct vkms_config pointer
+ * @plane_cfg: &struct vkms_config_plane pointer used as cursor
+ */
+#define vkms_config_for_each_plane(config, plane_cfg) \
+	list_for_each_entry((plane_cfg), &(config)->planes, link)
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -84,4 +111,42 @@ bool vkms_config_is_valid(struct vkms_config *config);
  */
 void vkms_config_register_debugfs(struct vkms_device *vkms_device);
 
+/**
+ * vkms_config_create_plane() - Add a new plane configuration
+ * @config: Configuration to add the plane to
+ *
+ * Returns:
+ * The new plane configuration or an error. Call vkms_config_destroy_plane() to
+ * free the returned plane configuration.
+ */
+struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_plane() - Remove and free a plane configuration
+ * @plane_cfg: Plane configuration to destroy
+ */
+void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg);
+
+/**
+ * vkms_config_plane_type() - Return the plane type
+ * @plane_cfg: Plane to get the type from
+ */
+static inline enum drm_plane_type
+vkms_config_plane_get_type(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->type;
+}
+
+/**
+ * vkms_config_plane_set_type() - Set the plane type
+ * @plane_cfg: Plane to set the type to
+ * @type: New plane type
+ */
+static inline void
+vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
+			   enum drm_plane_type type)
+{
+	plane_cfg->type = type;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 414cc933af41..08ea691db299 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -11,28 +11,29 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct vkms_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_output *output;
-	struct vkms_plane *primary, *overlay, *cursor = NULL;
+	struct vkms_plane *primary = NULL, *cursor = NULL;
+	struct vkms_config_plane *plane_cfg;
 	int ret;
 	int writeback;
-	unsigned int n;
 
 	if (!vkms_config_is_valid(vkmsdev->config))
 		return -EINVAL;
 
-	/*
-	 * Initialize used plane. One primary plane is required to perform the composition.
-	 *
-	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
-	 * composition.
-	 */
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(primary))
-		return PTR_ERR(primary);
+	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
+		enum drm_plane_type type;
 
-	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor))
-			return PTR_ERR(cursor);
+		type = vkms_config_plane_get_type(plane_cfg);
+
+		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
+		if (IS_ERR(plane_cfg->plane)) {
+			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
+			return PTR_ERR(plane_cfg->plane);
+		}
+
+		if (type == DRM_PLANE_TYPE_PRIMARY)
+			primary = plane_cfg->plane;
+		else if (type == DRM_PLANE_TYPE_CURSOR)
+			cursor = plane_cfg->plane;
 	}
 
 	output = vkms_crtc_init(dev, &primary->base,
@@ -42,17 +43,6 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		return PTR_ERR(output);
 	}
 
-	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay)) {
-				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
-				return PTR_ERR(overlay);
-			}
-			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
-		}
-	}
-
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-- 
2.48.1

