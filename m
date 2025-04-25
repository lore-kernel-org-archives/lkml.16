Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3D2459DC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576912; cv=none; b=sChq7dNfA5jJCmzu+jwab7HPPBuXV9M6CzAUmYm84CihBsXUvOt+ajBHydCgEzI3sY15TxYwg1M5bMAxACq7wA6ynkVtWXLoFUf65WTMZl571I/w778Hvj6vd1Th4SGyyluLU8I4hQVoR60uQ+W/acOJqPWnCex5GKuQHXGl7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576912; c=relaxed/simple;
	bh=+GXo2yG0YPbH9s14OUs6YmomUD277TUQ7rp6ziXD+YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXny4eMsn9PdA0Vj6aV+mGTnYB5UD+7enOxRZg+P/NGxi5icf/eQXTDd/PXFewLS3t+DOmXbxwj0TYdbk67TijAk59Q3QqOrnhAOFMsXQDbT4z2gF2laHjn2l/H5gn33GKgGSBNsD1ZjlgdAOnSd+2zjk3h1+VxaIWkyJpFMR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L9wI0kdA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L9wI0kdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576909;
	bh=+GXo2yG0YPbH9s14OUs6YmomUD277TUQ7rp6ziXD+YE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L9wI0kdAJckYGIlI8rDtIfg/9ID7o6OibQuJDAbMVoOXBm+mTDbdyeh74t/fjMDF1
	 BGKorJRk+96NcnJkGK8Z4kkZz5zT1aBXVXyRHSL0y03Uxyn0eE85q8/6X3AZTuRTaC
	 4at5p++/tZDBlDQNgR994jeqQ6ISAh0/jplgQVynQz3/CLHhpLzOqnRMQSEgyGr0IU
	 O2WirTpjpLtGXI7WgtDRakYvRdSP7zeYwJ2trGoVYHKeZ5Jh10fkpSKqU104GXGBE2
	 GHp1njOPgvy3sTjyk00mkClBg+IovXeRk5aa7pE6SJCXqGx96SQSXNWgjqZFrFOIGe
	 5xzcOG2rN84WA==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C41A317E3626;
	Fri, 25 Apr 2025 12:28:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:03 +0300
Subject: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper variant
 to enable CRTC connector
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Provide a wrapper over drm_kunit_helper_enable_crtc_connector() to
automatically handle EDEADLK.

This is going to help improve the error handling in a bunch of test
cases without open coding the restart of the atomic sequence.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 39 +++++++++++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h           |  7 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 5f7257840d8ef0aeabe5f00802f5037ed652ae66..4e1174c50b1f2b6358eb740cd73c6d86e53d0df9 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -332,6 +332,45 @@ int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_enable_crtc_connector);
 
+/**
+ * drm_kunit_helper_try_enable_crtc_connector - (Re)tries to enable a CRTC -> Connector output
+ * @test: The test context object
+ * @drm: The device to alloc the plane for
+ * @crtc: The CRTC to enable
+ * @connector: The Connector to enable
+ * @mode: The display mode to configure the CRTC with
+ * @ctx: Locking context
+ *
+ * This function is a wrapper over @drm_kunit_helper_enable_crtc_connector
+ * to automatically handle EDEADLK and (re)try to enable the route from
+ * @crtc to @connector, with the given @mode.
+ *
+ * Returns:
+ *
+ * A pointer to the new CRTC, or an ERR_PTR() otherwise.
+ */
+int drm_kunit_helper_try_enable_crtc_connector(struct kunit *test,
+					       struct drm_device *drm,
+					       struct drm_crtc *crtc,
+					       struct drm_connector *connector,
+					       const struct drm_display_mode *mode,
+					       struct drm_modeset_acquire_ctx *ctx)
+{
+	int ret;
+
+retry_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, connector,
+						     mode, ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(ctx);
+		if (!ret)
+			goto retry_enable;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_kunit_helper_try_enable_crtc_connector);
+
 static void kunit_action_drm_mode_destroy(void *ptr)
 {
 	struct drm_display_mode *mode = ptr;
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 4948379237e96163dfda0d2f180c0c564e7d110e..bc6cd2fcc3174fb0996d189d9f6f4d32cf013731 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -126,6 +126,13 @@ int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
 					   const struct drm_display_mode *mode,
 					   struct drm_modeset_acquire_ctx *ctx);
 
+int drm_kunit_helper_try_enable_crtc_connector(struct kunit *test,
+					       struct drm_device *drm,
+					       struct drm_crtc *crtc,
+					       struct drm_connector *connector,
+					       const struct drm_display_mode *mode,
+					       struct drm_modeset_acquire_ctx *ctx);
+
 int drm_kunit_add_mode_destroy_action(struct kunit *test,
 				      struct drm_display_mode *mode);
 

-- 
2.49.0

