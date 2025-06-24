Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2F927AC59
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756580; cv=none; b=eBYcfxIZ78FD75jwKva24stXZAAO6Coo9FMSshy+9+mSowpLGp9tw5S6ufH/zkYxaINAsmS1lqjoE/MawUEqY7ayrhfp359lFAnfYEyRWJFMbjWwG3fQEGfyusJmgSZ0Tfw8A8+LDpkFbLSBxVNml4PZDdUMw4JCyT9tBHzeGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756580; c=relaxed/simple;
	bh=2DkAb5iQI0mKB0PHSkhcYvIB1WVBEXgSxxLWCgCC4jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dhxx65hw5zdwoI0JeISJZ+bffUU0W1ZaWvbW8BOiKQvXF9sMVBAeYqsdr4/9yekUt9iV7/52lVt51efYi/UBLo8Z4ZaENnsjKov21FExt49fdA4OooHzGUNEn1Hm1V1nqOi6Pbx0i6GQvomRV+9f5j+3NhN7g6n7WErdEz2TGxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OBvpmtVA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OBvpmtVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCj908OQeVYc0aYMTw9SSvbNaeLnTgILebOyrY/KF70=;
	b=OBvpmtVAAy2np3xLP0Ihz6amvyV9DoPaA5S7X6+w/tprGEhLVil8GnQO3MR24YLI0h8oSJ
	bpx/UzGIkJ87jYmeOVG0eZ2JlMrJ7P08sDbSBhqBMKU5P4xUz7fKIpMth5ejfJJ8tQ6uGM
	XpTwDWK74FTQbgG6l/72eDKjgxeswsY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-ko5bRJz3Nru7-2nOFK3rog-1; Tue,
 24 Jun 2025 05:16:10 -0400
X-MC-Unique: ko5bRJz3Nru7-2nOFK3rog-1
X-Mimecast-MFC-AGG-ID: ko5bRJz3Nru7-2nOFK3rog_1750756567
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE1F3195609D;
	Tue, 24 Jun 2025 09:16:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF0FE18046C5;
	Tue, 24 Jun 2025 09:16:01 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v11 09/11] drm/i915/display: Add drm_panic support for Y-tiling with DPT
Date: Tue, 24 Jun 2025 11:01:18 +0200
Message-ID: <20250624091501.257661-10-jfalempe@redhat.com>
In-Reply-To: <20250624091501.257661-1-jfalempe@redhat.com>
References: <20250624091501.257661-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Alder Lake and later, it's not possible to disable tiling when DPT
is enabled.
So this commit implements Y-Tiling support, to still be able to draw
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v8:
 * Pass the tiling function to intel_bo_panic_setup()

v10:
 * Use the struct intel_framebuffer to store the tiling function


 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_plane.c    | 64 ++++++++++++++++++-
 .../drm/i915/display/skl_universal_plane.c    | 15 +++--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 16 ++++-
 drivers/gpu/drm/xe/display/intel_bo.c         |  5 +-
 5 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6cd8eb26f858..a67ca33ac57a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -146,6 +146,8 @@ struct intel_framebuffer {
 
 	unsigned int min_alignment;
 	unsigned int vtd_guard;
+
+	unsigned int (*panic_tiling)(unsigned int x, unsigned int y, unsigned int width);
 };
 
 enum intel_hotplug_state {
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 5b889335c4b4..5bdfe1cbbb7b 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1272,6 +1272,32 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 	intel_plane_unpin_fb(old_plane_state);
 }
 
+/* Handle Y-tiling, only if DPT is enabled (otherwise disabling tiling is easier)
+ * All DPT hardware have 128-bytes width tiling, so Y-tile dimension is 32x32
+ * pixels for 32bits pixels.
+ */
+#define YTILE_WIDTH	32
+#define YTILE_HEIGHT	32
+#define YTILE_SIZE (YTILE_WIDTH * YTILE_HEIGHT * 4)
+
+static unsigned int intel_ytile_get_offset(unsigned int width, unsigned int x, unsigned int y)
+{
+	u32 offset;
+	unsigned int swizzle;
+	unsigned int width_in_blocks = DIV_ROUND_UP(width, 32);
+
+	/* Block offset */
+	offset = ((y / YTILE_HEIGHT) * width_in_blocks + (x / YTILE_WIDTH)) * YTILE_SIZE;
+
+	x = x % YTILE_WIDTH;
+	y = y % YTILE_HEIGHT;
+
+	/* bit order inside a block is x4 x3 x2 y4 y3 y2 y1 y0 x1 x0 */
+	swizzle = (x & 3) | ((y & 0x1f) << 2) | ((x & 0x1c) << 5);
+	offset += swizzle * 4;
+	return offset;
+}
+
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
@@ -1295,6 +1321,35 @@ static void intel_panic_flush(struct drm_plane *plane)
 		iplane->disable_tiling(iplane);
 }
 
+static unsigned int (*intel_get_tiling_func(u64 fb_modifier))(unsigned int width,
+							      unsigned int x,
+							      unsigned int y)
+{
+	switch (fb_modifier) {
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+		return intel_ytile_get_offset;
+	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+	case I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_Yf_TILED:
+	case I915_FORMAT_MOD_Yf_TILED_CCS:
+	default:
+	/* Not supported yet */
+		return NULL;
+	}
+}
+
 static int intel_get_scanout_buffer(struct drm_plane *plane,
 				    struct drm_scanout_buffer *sb)
 {
@@ -1320,8 +1375,13 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
 	} else {
 		int ret;
 		/* Can't disable tiling if DPT is in use */
-		if (intel_fb_uses_dpt(fb))
-			return -EOPNOTSUPP;
+		if (intel_fb_uses_dpt(fb)) {
+			if (fb->format->cpp[0] != 4)
+				return -EOPNOTSUPP;
+			intel_fb->panic_tiling = intel_get_tiling_func(fb->modifier);
+			if (!intel_fb->panic_tiling)
+				return -EOPNOTSUPP;
+		}
 		sb->private = intel_fb;
 		ret = intel_bo_panic_setup(sb);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index cbd0521a201c..e20972ddfa09 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2795,15 +2795,22 @@ static void skl_disable_tiling(struct intel_plane *plane)
 {
 	struct intel_plane_state *state = to_intel_plane_state(plane->base.state);
 	struct intel_display *display = to_intel_display(plane);
-	u32 stride = state->view.color_plane[0].scanout_stride / 64;
+	const struct drm_framebuffer *fb = state->hw.fb;
 	u32 plane_ctl;
 
 	plane_ctl = intel_de_read(display, PLANE_CTL(plane->pipe, plane->id));
-	plane_ctl &= ~PLANE_CTL_TILED_MASK;
 
-	intel_de_write_fw(display, PLANE_STRIDE(plane->pipe, plane->id),
-			  PLANE_STRIDE_(stride));
+	if (intel_fb_uses_dpt(fb)) {
+		/* if DPT is enabled, keep tiling, but disable compression */
+		plane_ctl &= ~PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
+	} else {
+		/* if DPT is not supported, disable tiling, and update stride */
+		u32 stride = state->view.color_plane[0].scanout_stride / 64;
 
+		plane_ctl &= ~PLANE_CTL_TILED_MASK;
+		intel_de_write_fw(display, PLANE_STRIDE(plane->pipe, plane->id),
+				  PLANE_STRIDE_(stride));
+	}
 	intel_de_write_fw(display, PLANE_CTL(plane->pipe, plane->id), plane_ctl);
 
 	intel_de_write_fw(display, PLANE_SURF(plane->pipe, plane->id),
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 91c7549e6ff2..c16a57160b26 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -400,6 +400,15 @@ static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj
 	return pages;
 }
 
+static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
+						unsigned int y, u32 color)
+{
+	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
+	unsigned int offset = fb->panic_tiling(sb->width, x, y);
+
+	iosys_map_wr(&sb->map[0], offset, u32, color);
+}
+
 /*
  * The scanout buffer pages are not mapped, so for each pixel,
  * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
@@ -413,7 +422,10 @@ static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb,
 	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
 	struct i915_panic_data *panic = to_i915_panic_data(fb);
 
-	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+	if (fb->panic_tiling)
+		offset = fb->panic_tiling(sb->width, x, y);
+	else
+		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
 
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
@@ -459,6 +471,8 @@ int i915_gem_object_panic_setup(struct drm_scanout_buffer *sb)
 		else
 			iosys_map_set_vaddr(&sb->map[0], ptr);
 
+		if (fb->panic_tiling)
+			sb->set_pixel = i915_gem_object_panic_map_set_pixel;
 		return 0;
 	}
 	if (i915_gem_object_has_struct_page(obj)) {
diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index bbb504f8e242..910632f57c3d 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -104,7 +104,10 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	unsigned int new_page;
 	unsigned int offset;
 
-	offset = y * sb->pitch[0] + x * sb->format->cpp[0];
+	if (fb->panic_tiling)
+		offset = fb->panic_tiling(sb->width, x, y);
+	else
+		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
 
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
-- 
2.49.0

