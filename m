Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FEE21FF2C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716112; cv=none; b=lgvsYxvfJIzRIMl1TDOdgPRnJ1D4pkiFB7n3IKwLJGHHhEDIc7Xv/RHTEqkdElbYq9RptWN2nwecKpHZ81y1Q785buN5/zic54Kip5DmpDBWISS/VhTsC0ZzTzBz7SMG66B1gMoEQEkF5FBiarha8NZF2cnnpTHfPnR/yxjDz1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716112; c=relaxed/simple;
	bh=jZhqw3CFkkpAqCC9nzOWg/77t51D878n8OcC+pjLft4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yx6BupsSQUqXLnmtkh1RVUU8+KuGskaSGyuU5RP5OfJWUyEPcpbvTJbYLhXz5eGpGO4Mmk0YJ8WCKm1yjxp10z7T2e7KnsgES6W5dv4CK0X+6R9hewMr9jmH60L74hYvMgsAHdBPDTvliFNne6ASY7yblEBU/9g2ssoXC4tC6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4pUZCbo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4pUZCbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749716109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrjs5eOHCyu5GrbKeIZJ6mBciwCyDUhu9m4iaDSEfRE=;
	b=Z4pUZCboMikpjQEIGQohNgWIPqq3wJEWGnFEIGwJcbmHKiQ89uEla7TJV/E3ENEgxzyfAz
	N6VTJ5OUrM4XSJiMeQjZ8zW3oiCpyPksIwjwphPPDdhyYA6EwFjL0DNuND5ENzKEppYQY3
	6L+d62qY7VSSR1lGK2j/FRUw1FLRkxQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-Gq0W-kJxMnew4ke5I5BZ3A-1; Thu,
 12 Jun 2025 04:15:02 -0400
X-MC-Unique: Gq0W-kJxMnew4ke5I5BZ3A-1
X-Mimecast-MFC-AGG-ID: Gq0W-kJxMnew4ke5I5BZ3A_1749716099
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 790891956096;
	Thu, 12 Jun 2025 08:14:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5F7F2195609D;
	Thu, 12 Jun 2025 08:14:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
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
Subject: [PATCH v9 9/9] drm/i915/psr: Add intel_psr2_panic_force_full_update
Date: Thu, 12 Jun 2025 10:01:06 +0200
Message-ID: <20250612081344.225200-10-jfalempe@redhat.com>
In-Reply-To: <20250612081344.225200-1-jfalempe@redhat.com>
References: <20250612081344.225200-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When the panic handler is called, configure the psr to send the full
framebuffer to the monitor, otherwise the panic screen is only
partially visible.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v8:
 * Added in v8

 .../gpu/drm/i915/display/intel_atomic_plane.c |  7 +++++++
 drivers/gpu/drm/i915/display/intel_psr.c      | 20 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_psr.h      |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 8c422c6a7186..c9a9f0770205 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -58,6 +58,7 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_fbdev.h"
+#include "intel_psr.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
@@ -1319,6 +1320,7 @@ static unsigned int intel_4tile_get_offset(unsigned int width, unsigned int x, u
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
+	struct intel_crtc_state *crtc_state = to_intel_crtc_state(plane->state->crtc->state);
 	struct intel_plane *iplane = to_intel_plane(plane);
 	struct intel_display *display = to_intel_display(iplane);
 	struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -1328,6 +1330,11 @@ static void intel_panic_flush(struct drm_plane *plane)
 
 	intel_bo_panic_finish(obj);
 
+	if (crtc_state->enable_psr2_sel_fetch) {
+		/* Force a full update for psr2 */
+		intel_psr2_panic_force_full_update(display, crtc_state);
+	}
+
 	/* Flush the cache and don't disable tiling if it's the fbdev framebuffer.*/
 	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
 		struct iosys_map map;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index db7111374293..283ac2618ea5 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2888,6 +2888,26 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	return 0;
 }
 
+void intel_psr2_panic_force_full_update(struct intel_display *display,
+					struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 val = man_trk_ctl_enable_bit_get(display);
+
+	/* SF partial frame enable has to be set even on full update */
+	val |= man_trk_ctl_partial_frame_bit_get(display);
+	val |= man_trk_ctl_continuos_full_frame(display);
+
+	/* Directly write the register */
+	intel_de_write_fw(display, PSR2_MAN_TRK_CTL(display, cpu_transcoder), val);
+
+	if (!crtc_state->enable_psr2_su_region_et)
+		return;
+
+	intel_de_write_fw(display, PIPE_SRCSZ_ERLY_TPT(crtc->pipe), 0);
+}
+
 void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 0cf53184f13f..9b061a22361f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -57,6 +57,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc);
 void intel_psr2_program_trans_man_trk_ctl(struct intel_dsb *dsb,
 					  const struct intel_crtc_state *crtc_state);
+void intel_psr2_panic_force_full_update(struct intel_display *display,
+					struct intel_crtc_state *crtc_state);
 void intel_psr_pause(struct intel_dp *intel_dp);
 void intel_psr_resume(struct intel_dp *intel_dp);
 bool intel_psr_needs_vblank_notification(const struct intel_crtc_state *crtc_state);
-- 
2.49.0

