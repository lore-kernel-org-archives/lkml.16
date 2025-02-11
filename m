Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912D215177
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272179; cv=none; b=UCplEBLn64KCH4DbdPrzY1w9gKZ3LYOMpP5F8f+nhSxLl8DO+GX+gMwf/PUMkUBrFOfppGfENOxS810ch9Tw30uEdTpW5OJO+aorOUXaB4DAMDP1c2FIjnly+bA3DbAlMnUNsc7iyqKg2trdZApEOTvjfcr9KlsiwqNOK8OfDjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272179; c=relaxed/simple;
	bh=oeo4bG+/eJ7XtJBvRaAecKqlmOofWXLDt07i5UsHrCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSXjUU7u7BBx+x0AHU8KktfFb9vnAowltYRVrx1qaXUEuAQrWrDkAeMkzG8aRP2tJ/z1eEzVuLZXEmLU8+0JI1qbz5l+2a7ufF8MDQaOwhjvA5HzBHgoxb8+ZcR4eIeRynGl9qh1S0yn7zEsleTavJrpG2G5DrKsQ5rWltRmqEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc+v9fR4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc+v9fR4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so14992745e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272175; x=1739876975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBb49MDgu+iAkUP/6QQB0E1tqf2rFoHfPXGl3p4Zkas=;
        b=kc+v9fR4fiUiC0uJz7BW4eGcHq2dEyr5LeuNv2tSbLIT4OcYoTepP7B5OecL2uL30w
         FCXIHY4v/rhMaDKyPj0QF4Y7weDI9jhs3lxd90xhN0Sf945Yjz6zG7gF8vOhoizXsVEN
         cbBLRUa+RBH30ejdz+YhD7XS9SwxkPF2J0VoPxgUKsyRsVIDN1BELoYLCQGIvyNEGOf5
         5TM212U6oLTitBDg0FWTwqVsDmDbCEHjb+NkHf/LBuU9Gd1n0vu8d8jw7l316FoUdL1D
         iV4Ezsy5i6dUWgUZRUAOVEa3NVwXCNUSHUrygXjQBBX4B38ndG8a2dd4WDI+ji/QBAyG
         bZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272175; x=1739876975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBb49MDgu+iAkUP/6QQB0E1tqf2rFoHfPXGl3p4Zkas=;
        b=oE7gjao5x2h5nsfFQOFBQPB74jcfXr6mItMYOPlY/hbd3/OMuvu9EzDrt+AULXK/t0
         oONXFOUpcLa/wq1B1R4VZXQ1FZFxnHljT8RclLlDgQkGHMOyanV1rg+FjfSaWSH05RRv
         ibILDVHWe2OVdgYcgdmGEc7lhTxicDijzehfQsIItSvY5mmgrsdkOeXEXQksEm6Ww1tq
         g/0prrsK1CKRiQIyQVae5xXW5y8z6HEpH9Lt7B0jnL61tFJqNtI6+aQyHhcw2det6bQc
         Jou03p/3hzi31h1n1hfS0wt/gjDLpqOBEISrjiEMU9LvT2OQQXwPcmTcDilqKDJIqe2p
         9Y5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYPxc4oyEMDvpPSBUbPzgXQETxxckagaAQLIXoEIBClOCvZIkrCdh1YzJv/dW6wJmVtjDgzQnmnqMAt6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx74CULZPckekuhHgoKNgnx3oCB9ExLUP6OvLcHCX6wWvsSiT+S
	Nl7mwp03N3P68HJOr4Yt9tJYRwPljBLNimtPz0gT+KMGqDyKeENc
X-Gm-Gg: ASbGncuRldePQYF1NOsKY3Sewu3+HaUQqgwOhm+maLGUMTmGmNbblYnvyz3PtW4nrnE
	17xmk1MtvIZTE7W8//giN8s2CP0v6OzO78eBjvKxpi1SSFPmsE/oVY/cRDMIibDzxT5f86HijkT
	JpXrfqzDaVpaptNou0W71ZPOLqM2DqOq6knoZceA1yDRuon5+oy12i0pe1a0E2z9s3cjzlQxMPT
	SMhFwmYg3jsOg3wZVwDSLymCiOtMinC7r7uGjaakMe6BoYygt7gFt7egXdSprvHD04JKCLnGpgh
	PcgdiSuwsJNbLWyS
X-Google-Smtp-Source: AGHT+IHQk/Fn1ZUrMEagdpMTyL2U3IoU4CkvypqpCJ0kXIm/qhhmQ+g6UNzGxOSySShebpsPgP1VuQ==
X-Received: by 2002:a5d:64a6:0:b0:38d:ddf2:aff5 with SMTP id ffacd0b85a97d-38dddf2b2dbmr7971886f8f.3.1739272175222;
        Tue, 11 Feb 2025 03:09:35 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:34 -0800 (PST)
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
Subject: [PATCH v2 13/15] drm/vkms: Allow to attach encoders and CRTCs
Date: Tue, 11 Feb 2025 12:09:10 +0100
Message-ID: <20250211110912.15409-14-jose.exposito89@gmail.com>
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

Add a list of possible CRTCs to the encoder configuration and helpers to
attach and detach them.

Now that the default configuration has its encoder and CRTC correctly
attached, configure the output following the configuration.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 115 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            |  77 ++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            |  29 +++++
 drivers/gpu/drm/vkms/vkms_output.c            |  49 +++++---
 5 files changed, 251 insertions(+), 20 deletions(-)

diff --git a/.clang-format b/.clang-format
index c355a2f58eed..5d21c0e4edbd 100644
--- a/.clang-format
+++ b/.clang-format
@@ -693,6 +693,7 @@ ForEachMacros:
   - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_encoder'
   - 'vkms_config_for_each_plane'
+  - 'vkms_config_encoder_for_each_possible_crtc'
   - 'vkms_config_plane_for_each_possible_crtc'
   - 'while_for_each_ftrace_op'
   - 'xa_for_each'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 0bb76a1e6c79..7458d175acb6 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -260,6 +260,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int err;
 
 	config = vkms_config_default_create(false, false, false);
@@ -313,6 +314,9 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 
 	/* Invalid: Second CRTC without primary plane */
 	crtc_cfg = vkms_config_create_crtc(config);
+	encoder_cfg = vkms_config_create_encoder(config);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg);
+	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: Second CRTC with a primary plane */
@@ -390,6 +394,51 @@ static void vkms_config_test_invalid_encoder_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_encoder *encoder_cfg;
+	int err;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	crtc_cfg1 = list_first_entry(&config->crtcs, typeof(*crtc_cfg1), link);
+
+	/* Invalid: Encoder without a possible CRTC */
+	encoder_cfg = vkms_config_create_encoder(config);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: Second CRTC with shared encoder */
+	crtc_cfg2 = vkms_config_create_crtc(config);
+
+	plane_cfg = vkms_config_create_plane(config);
+	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Second CRTC without encoders */
+	vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg2);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid: First CRTC with 2 possible encoder */
+	vkms_config_destroy_plane(plane_cfg);
+	vkms_config_destroy_crtc(config, crtc_cfg2);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -515,6 +564,70 @@ static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	int n_crtcs = 0;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	encoder_cfg1 = vkms_config_create_encoder(config);
+	encoder_cfg2 = vkms_config_create_encoder(config);
+	crtc_cfg1 = vkms_config_create_crtc(config);
+	crtc_cfg2 = vkms_config_create_crtc(config);
+
+	/* No possible CRTCs */
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	/* Encoder 1 attached to CRTC 1 and 2 */
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg1 && possible_crtc != crtc_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 2);
+	n_crtcs = 0;
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc)
+		KUNIT_FAIL(test, "Unexpected possible CRTC");
+
+	/* Encoder 1 attached to CRTC 1 and encoder 2 to CRTC 2 */
+	vkms_config_encoder_detach_crtc(encoder_cfg1, crtc_cfg2);
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg1)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
+	n_crtcs = 0;
+
+	err = vkms_config_encoder_attach_crtc(encoder_cfg2, crtc_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc) {
+		n_crtcs++;
+		if (possible_crtc != crtc_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible CRTC");
+	}
+	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -527,8 +640,10 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
+	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 0cf6105fe743..f727c0009489 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -84,6 +84,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(encoder_cfg))
 		goto err_alloc;
 
+	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -212,6 +215,42 @@ static bool valid_encoder_number(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_encoder_possible_crtcs(struct vkms_config *config)
+{
+	struct drm_device *dev = &config->dev->drm;
+	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
+
+	vkms_config_for_each_encoder(config, encoder_cfg) {
+		if (xa_empty(&encoder_cfg->possible_crtcs)) {
+			drm_info(dev, "All encoders must have at least one possible CRTC\n");
+			return false;
+		}
+	}
+
+	vkms_config_for_each_crtc(config, crtc_cfg) {
+		bool crtc_has_encoder = false;
+
+		vkms_config_for_each_encoder(config, encoder_cfg) {
+			struct vkms_config_crtc *possible_crtc;
+			unsigned long idx = 0;
+
+			vkms_config_encoder_for_each_possible_crtc(encoder_cfg,
+								   idx, possible_crtc) {
+				if (possible_crtc == crtc_cfg)
+					crtc_has_encoder = true;
+			}
+		}
+
+		if (!crtc_has_encoder) {
+			drm_info(dev, "All CRTCs must have at least one possible encoder\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -233,6 +272,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 			return false;
 	}
 
+	if (!valid_encoder_possible_crtcs(config))
+		return false;
+
 	return true;
 }
 
@@ -347,10 +389,14 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
 			      struct vkms_config_crtc *crtc_cfg)
 {
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 
 	vkms_config_for_each_plane(config, plane_cfg)
 		vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
 
+	vkms_config_for_each_encoder(config, encoder_cfg)
+		vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg);
+
 	list_del(&crtc_cfg->link);
 	kfree(crtc_cfg);
 }
@@ -406,6 +452,8 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
 	if (!encoder_cfg)
 		return ERR_PTR(-ENOMEM);
 
+	xa_init_flags(&encoder_cfg->possible_crtcs, XA_FLAGS_ALLOC);
+
 	list_add_tail(&encoder_cfg->link, &config->encoders);
 
 	return encoder_cfg;
@@ -414,6 +462,35 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg)
 {
+	xa_destroy(&encoder_cfg->possible_crtcs);
 	list_del(&encoder_cfg->link);
 	kfree(encoder_cfg);
 }
+
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
+						 struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+	u32 crtc_idx = 0;
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			return -EINVAL;
+	}
+
+	return xa_alloc(&encoder_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
+			xa_limit_32b, GFP_KERNEL);
+}
+
+void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
+				     struct vkms_config_crtc *crtc_cfg)
+{
+	struct vkms_config_crtc *possible_crtc;
+	unsigned long idx = 0;
+
+	vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
+		if (possible_crtc == crtc_cfg)
+			xa_erase(&encoder_cfg->possible_crtcs, idx);
+	}
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 2ba80c4c9ce5..28c24afebe1e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -71,6 +71,7 @@ struct vkms_config_crtc {
  * struct vkms_config_encoder
  *
  * @link: Link to the others encoders in vkms_config
+ * @possible_crtcs: Array of CRTCs that can be used with this encoder
  * @encoder: Internal usage. This pointer should never be considered as valid.
  *           It can be used to store a temporary reference to a VKMS encoder
  *           during device creation. This pointer is not managed by the
@@ -79,6 +80,8 @@ struct vkms_config_crtc {
 struct vkms_config_encoder {
 	struct list_head link;
 
+	struct xarray possible_crtcs;
+
 	/* Internal usage */
 	struct drm_encoder *encoder;
 };
@@ -117,6 +120,16 @@ struct vkms_config_encoder {
 #define vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) \
 	xa_for_each(&(plane_cfg)->possible_crtcs, idx, (possible_crtc))
 
+/**
+ * vkms_config_encoder_for_each_possible_crtc - Iterate over the
+ * vkms_config_encoder possible CRTCs
+ * @encoder_cfg: &struct vkms_config_encoder pointer
+ * @idx: Index of the cursor
+ * @possible_crtc: &struct vkms_config_crtc pointer used as cursor
+ */
+#define vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) \
+	xa_for_each(&(encoder_cfg)->possible_crtcs, idx, (possible_crtc))
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -326,4 +339,20 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg);
 
+/**
+ * vkms_config_encoder_attach_crtc - Attach a encoder to a CRTC
+ * @encoder_cfg: Encoder to attach
+ * @crtc_cfg: CRTC to attach @encoder_cfg to
+ */
+int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
+						 struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_encoder_detach_crtc - Detach a encoder from a CRTC
+ * @encoder_cfg: Encoder to detach
+ * @crtc_cfg: CRTC to detach @encoder_cfg from
+ */
+void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
+				     struct vkms_config_crtc *crtc_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index f63bc8e3014b..8920d6b5d105 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -9,9 +9,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
-	struct drm_encoder *encoder;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int ret;
 	int writeback;
 
@@ -61,32 +61,41 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
+	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
+		struct vkms_config_crtc *possible_crtc;
+		unsigned long idx = 0;
+
+		encoder_cfg->encoder = drmm_kzalloc(dev, sizeof(*encoder_cfg->encoder), GFP_KERNEL);
+		if (!encoder_cfg->encoder) {
+			DRM_ERROR("Failed to allocate encoder\n");
+			return -ENOMEM;
+		}
+		ret = drmm_encoder_init(dev, encoder_cfg->encoder, NULL,
+					DRM_MODE_ENCODER_VIRTUAL, NULL);
+		if (ret) {
+			DRM_ERROR("Failed to init encoder\n");
+			return ret;
+		}
+
+		vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
+			encoder_cfg->encoder->possible_crtcs |=
+				drm_crtc_mask(&possible_crtc->crtc->crtc);
+		}
+	}
+
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
 		return PTR_ERR(connector);
 	}
 
-	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
-	if (!encoder) {
-		DRM_ERROR("Failed to allocate encoder\n");
-		return -ENOMEM;
-	}
-	ret = drmm_encoder_init(dev, encoder, NULL,
-				DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init encoder\n");
-		return ret;
-	}
-
-	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg)
-		encoder->possible_crtcs = drm_crtc_mask(&crtc_cfg->crtc->crtc);
-
 	/* Attach the encoder and the connector */
-	ret = drm_connector_attach_encoder(&connector->base, encoder);
-	if (ret) {
-		DRM_ERROR("Failed to attach connector to encoder\n");
-		return ret;
+	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
+		ret = drm_connector_attach_encoder(&connector->base, encoder_cfg->encoder);
+		if (ret) {
+			DRM_ERROR("Failed to attach connector to encoder\n");
+			return ret;
+		}
 	}
 
 	drm_mode_config_reset(dev);
-- 
2.48.1

