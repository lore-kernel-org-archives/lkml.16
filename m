Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981827A103
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756539; cv=none; b=djjzAaYmiIB8jOqq3NHJUVX1Po5SuxB+aEP7WMIv8nGF7kmK5FWn+yf/V5RBvGeNMqWSJIEel7MMkW2nSkbIm4n215kKcHuucPI3MbIEh+1GElxIQF6qQcGTIDco5JVyoBPzn9bJ+schT5nrepqbu8YrIemhsa1dVnM+5/Q5WiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756539; c=relaxed/simple;
	bh=IhwLABjy7K2FK1xN8dhP4r5qEVkdL7fMIwG/rAddG2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzJD9D1F+JZb1Uk9Xons9aHWik4ErMFl5m2m4LHcSWNfzY/38QmxTLqPLsP8k0A6/hPVMXPVAmmlXZ+BjY2iODo8Tri7ybiSNnCdbtDmHbmNoD8Uhc5emegVm0B38BCRT/CPFGFsYldh0bwB0uBzxJ4gN2O5YR3tZy/daVOkk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z8VIs4N9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z8VIs4N9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ea/fo4FRrRCWYqh2YbEz/G8e+EIC9Lau/iU5r1xv9k0=;
	b=Z8VIs4N9lGoh6u1B2Q2g68nanTfgoBOlgLxDaW0JyH1JdEms5AFZBzavC0nbH6Z4qR4AQ5
	++NMPd5pXdiguY5sQ7bGEFNhFHOtrZXP6Pejb+0hqtO2Ymq2Aj/5cz11ssQsiQjbvnvhzs
	T1jZXbMLPRcQWRCh6px2bVFy/KCW/ME=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-A2K4XQA4M46NjlfI46mJ8g-1; Tue,
 24 Jun 2025 05:15:33 -0400
X-MC-Unique: A2K4XQA4M46NjlfI46mJ8g-1
X-Mimecast-MFC-AGG-ID: A2K4XQA4M46NjlfI46mJ8g_1750756531
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADC8C195608F;
	Tue, 24 Jun 2025 09:15:30 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9233F180045C;
	Tue, 24 Jun 2025 09:15:24 +0000 (UTC)
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
Subject: [PATCH v11 03/11] drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
Date: Tue, 24 Jun 2025 11:01:12 +0200
Message-ID: <20250624091501.257661-4-jfalempe@redhat.com>
In-Reply-To: <20250624091501.257661-1-jfalempe@redhat.com>
References: <20250624091501.257661-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

drm_panic draws in linear framebuffer, so it's easier to re-use the
current framebuffer, and disable tiling in the panic handler, to show
the panic screen.
This assumes that the alignment restriction is always smaller in
linear than in tiled.
It also assumes that the linear framebuffer size is always smaller
than the tiled.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v7:
 * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)

 drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index ac84558006c7..e7e35fd4bdc3 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -905,6 +905,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
 	.format_mod_supported_async = intel_plane_format_mod_supported_async,
 };
 
+static void i9xx_disable_tiling(struct intel_plane *plane)
+{
+	struct intel_display *display = to_intel_display(plane);
+	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
+	u32 dspcntr;
+	u32 reg;
+
+	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
+	dspcntr &= ~DISP_TILED;
+	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);
+
+	if (DISPLAY_VER(display) >= 4) {
+		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
+		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
+
+	} else {
+		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
+		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
+	}
+}
+
 struct intel_plane *
 intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 {
@@ -1047,6 +1068,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 		}
 	}
 
+	plane->disable_tiling = i9xx_disable_tiling;
+
 	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
 
 	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 30c7315fc25e..6cd8eb26f858 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1521,6 +1521,8 @@ struct intel_plane {
 			   bool async_flip);
 	void (*enable_flip_done)(struct intel_plane *plane);
 	void (*disable_flip_done)(struct intel_plane *plane);
+	/* For drm_panic */
+	void (*disable_tiling)(struct intel_plane *plane);
 };
 
 #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
-- 
2.49.0

