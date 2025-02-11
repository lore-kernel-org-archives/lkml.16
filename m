Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED81FBE8F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272169; cv=none; b=IzYdZ8mntYLLoVywdE1XZsIuvP1nzg0WWPAWIbI+Hmd1Tk19tl+N6w/U/R1irGrCMQoFqPzAxDwm97a7AqEYmVu0bETUdbr32whWZvESED8IuwCn2LWdjJfni/jwq/hP2Q/KdJJgfcyjR1HK4C9F4OgYPB2ztMhdXWlj46QfGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272169; c=relaxed/simple;
	bh=zcuKr1ljj0ogXVBUUWrigChcUg403Y86mqSK/R0XoCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0x/ATW124Hi/Q4Pv67a86mX7KIfmRGPI1clmVvzOTounkGEAouP+2DMNray6Mz7hAdSfu603cG1YRIrlA8+aNWV+7qbuyJvuzDHKWRBKVnwjPtZhN04jaCbjfr3uECSNwx5i1QAFaU/hRgSimvCA/zLSv+4wOW8mzZ98c8nxbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8ooTuZS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8ooTuZS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso2635384f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272165; x=1739876965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTakTkNWy+x7X249WP5VsfWpMi4Zx2g8PssxIcRL7RU=;
        b=m8ooTuZSWhDkf3h8JS3plk+fK3F1h4cyeh1dKCF2pxkrdU4rGPSk0qibkYO7sfi6jA
         shnUg6gRPFlKLoVb0ehPWkt9WhzPcx+QcaG+sUD9DA5yrPxDYdbCSHjqN2AzALWAWURJ
         AbJzLFGDYesvnwNUGf0t67jZeFgsCWxg/InXZmlqUKmrtCGZWtjpRs8TTphxqSVEvv6/
         Pq/JQ3ANfNKjHp+/6phleanKE0+TfZ9zigF9zcYV4eQ9nYSdVM7zki0U0owbyI9XNB36
         v39rWuw3g0fb+Ze1Ko6ooDeYMY4CE2dluYkf+Mpkb3L+7kJruwockUaPi1rAcrdtChI9
         pgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272165; x=1739876965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTakTkNWy+x7X249WP5VsfWpMi4Zx2g8PssxIcRL7RU=;
        b=Rg2d3dR+Hv8PoFQnSzbRSOE0nbd7zfcTm9VZ2gaO1VxAET6eMq+Z9xxH48k+R/6G2n
         nqlVwfYhPZiOs39n06xzM9aeV6YEiSUXVx9Uz6Y9WjYHhsp3lWis6NG7p+pQME59Mq+e
         b4vWrbh0p5xQNAH3Uz7WSJxpV1x7MQGgLp0p3tVLKvAuGg7rityjcO8xpWyc/gIT2N6W
         eLg5MQnz0OwiHZT6vJ/Sl168RCqf9L2DWl5D8gCy84OHzmax7OqDQdKyOE8pJ5IpfKnx
         v0daW+9eWJWeQW7wQBVGYSpgQQ+wwkIfetHWGTcCcCKH6gCvzzOIHvAKjE7hJgEfd/Wx
         6k8g==
X-Forwarded-Encrypted: i=1; AJvYcCVtuUU8NkXaPVD+nDanRHRYa7UHYm8wC4QXb1DZDBFHZP2ygydQ92yw8Q1bimWoZDGwmFgScN4Gw7y3DyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwngnRyO8Fm3am7f4eB+EVTxoFcnnFAe0Re5bOSa6pZmRU5xOBY
	U9DHhFtYGC3XkzlUDKNmHr9AmhvgbRnI3J48xr1Y9HA75zdEnPRH
X-Gm-Gg: ASbGncvMvWHEwwTITkwLHaZjFGtOCFRCwi7QKqLdGig74rVuaFapNKu+MJVqInS8tsu
	xLkjsBPeyiddKA70410+9R4chlqluoNWFba67GJphF9//PeOHINGcG6jqevVGoeeNd2NOc/GxAj
	PoHND8y7NHVj/EGKUtif/GdMBKjXrWjg0kW1l+vwFdENoDYINuFs2htv8XtCCyfTClCud/2ocMo
	+Kbrh9qWurmpZDXsJ7lYSyKaQL6ghV3NvEGlXobwNN19JqBoHlcdmOkIIRIup/ITqiFYNrnoRfh
	rQX6Kyv4iTzcCQz9
X-Google-Smtp-Source: AGHT+IHlC7FDVWjBn6Dv8KwLai/qeOgcEPNdtOkXbQRg/3SaHr3uTj6JQsw/jPyUom8IHnBsEk0IeA==
X-Received: by 2002:a05:6000:4011:b0:38d:c73d:e52c with SMTP id ffacd0b85a97d-38de43aa6a7mr2385287f8f.14.1739272165253;
        Tue, 11 Feb 2025 03:09:25 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:24 -0800 (PST)
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
Subject: [PATCH v2 06/15] drm/vkms: Move default_config creation to its own function
Date: Tue, 11 Feb 2025 12:09:03 +0100
Message-ID: <20250211110912.15409-7-jose.exposito89@gmail.com>
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

Extract the initialization of the default configuration to a function.
Refactor, no functional changes.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 38 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 17 +++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 14 +++++++
 drivers/gpu/drm/vkms/vkms_drv.c               |  6 +--
 4 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index a7060504f3dc..d8644a1e3e18 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -6,6 +6,12 @@
 
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
+struct default_config_case {
+	bool enable_cursor;
+	bool enable_writeback;
+	bool enable_overlay;
+};
+
 static void vkms_config_test_empty_config(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -16,8 +22,40 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static struct default_config_case default_config_cases[] = {
+	{ false, false, false },
+	{ true, false, false },
+	{ true, true, false },
+	{ true, false, true },
+	{ false, true, false },
+	{ false, true, true },
+	{ false, false, true },
+	{ true, true, true },
+};
+
+KUNIT_ARRAY_PARAM(default_config, default_config_cases, NULL);
+
+static void vkms_config_test_default_config(struct kunit *test)
+{
+	const struct default_config_case *params = test->param_value;
+	struct vkms_config *config;
+
+	config = vkms_config_default_create(params->enable_cursor,
+					    params->enable_writeback,
+					    params->enable_overlay);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	KUNIT_EXPECT_EQ(test, config->cursor, params->enable_cursor);
+	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
+	KUNIT_EXPECT_EQ(test, config->overlay, params->enable_overlay);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
+	KUNIT_CASE_PARAM(vkms_config_test_default_config,
+			 default_config_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 152b2ecd6aef..30ce4b23553f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -18,6 +18,23 @@ struct vkms_config *vkms_config_create(void)
 	return config;
 }
 
+struct vkms_config *vkms_config_default_create(bool enable_cursor,
+					       bool enable_writeback,
+					       bool enable_overlay)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_create();
+	if (IS_ERR(config))
+		return config;
+
+	config->cursor = enable_cursor;
+	config->writeback = enable_writeback;
+	config->overlay = enable_overlay;
+
+	return config;
+}
+
 void vkms_config_destroy(struct vkms_config *config)
 {
 	kfree(config);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index ced10f56a812..d0868750826a 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -31,6 +31,20 @@ struct vkms_config {
  */
 struct vkms_config *vkms_config_create(void);
 
+/**
+ * vkms_config_default_create() - Create the configuration for the default device
+ * @enable_cursor: Create or not a cursor plane
+ * @enable_writeback: Create or not a writeback connector
+ * @enable_overlay: Create or not overlay planes
+ *
+ * Returns:
+ * The default vkms_config or an error. Call vkms_config_destroy() to free the
+ * returned configuration.
+ */
+struct vkms_config *vkms_config_default_create(bool enable_cursor,
+					       bool enable_writeback,
+					       bool enable_overlay);
+
 /**
  * vkms_config_destroy() - Free a VKMS configuration
  * @config: vkms_config to free
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 37de0658e6ee..582d5825f42b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -211,14 +211,10 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
-
 	ret = vkms_create(config);
 	if (ret) {
 		vkms_config_destroy(config);
-- 
2.48.1

