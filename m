Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE45D28507C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239665; cv=none; b=N/UQF4QXPtA27PnTWtXt39h78wp2I1nNder/xSDXLfboacARYBcRi6+hFoTUfhsR9rwPy7jKxIOBYsZu97tvZBgBisxHbOh72SiH99CtS1f68tLspkhvfINZzR3rt1P2Xd+wUbJZM7OfiBUbQn0EL3dhTRQLznPsk+oKIcUJZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239665; c=relaxed/simple;
	bh=X1nCQQi2UwHoqJ1Zvsp4+BbjYMuFZxRe2l7dWtMD6EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJGVimlszt6sqnDHM8U6B0dsfoGkknLDKrqOE1DoaW6W6DMbBj3fXgRUihjoGBfQfo7vV/CGc4xfxr8VAysgDPBUdmAqWBl7U7gB2W5OIh9k9wNgbElnMgXf+fYO4xCu4aZE7UNqQdNtFuSU0GJFyfdXfChVt6hPXyBAYB8qpY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8RWf51c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8RWf51c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750239662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2G/WDy9bB1QSLglCuvKxQ4f+zFdEEMRkX/HAp5ek/w=;
	b=W8RWf51cDBrB/qx7c/KBfJkPmhTllBvLKnNTxoPMKXr2xdpPd9xyKKHjcN6LAcnherLsqi
	gwmzW73+I+T8nsnFO9M1vMdlFbe7BC2wOd0pfY4/olBTsJxgcsCVgx4tde6sD0rTtmWa83
	+81Jt9n9ZA5PSYKTaeAHfz3iSmzeUeo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-F-DficMhNAOndFYvn3TuEA-1; Wed,
 18 Jun 2025 05:40:57 -0400
X-MC-Unique: F-DficMhNAOndFYvn3TuEA-1
X-Mimecast-MFC-AGG-ID: F-DficMhNAOndFYvn3TuEA_1750239654
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A28851809C88;
	Wed, 18 Jun 2025 09:40:54 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.137])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1370519560A3;
	Wed, 18 Jun 2025 09:40:48 +0000 (UTC)
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
Subject: [PATCH v10 04/10] drm/i915/display: Add a disable_tiling() for skl planes
Date: Wed, 18 Jun 2025 11:31:22 +0200
Message-ID: <20250618094011.238154-5-jfalempe@redhat.com>
In-Reply-To: <20250618094011.238154-1-jfalempe@redhat.com>
References: <20250618094011.238154-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

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

 .../drm/i915/display/skl_universal_plane.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 2aa64482d44b..ef09ef7b101f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2792,6 +2792,25 @@ static u8 tgl_plane_caps(struct intel_display *display,
 	return caps;
 }
 
+static void skl_disable_tiling(struct intel_plane *plane)
+{
+	struct intel_plane_state *state = to_intel_plane_state(plane->base.state);
+	struct intel_display *display = to_intel_display(plane);
+	u32 stride = state->view.color_plane[0].scanout_stride / 64;
+	u32 plane_ctl;
+
+	plane_ctl = intel_de_read(display, PLANE_CTL(plane->pipe, plane->id));
+	plane_ctl &= ~PLANE_CTL_TILED_MASK;
+
+	intel_de_write_fw(display, PLANE_STRIDE(plane->pipe, plane->id),
+			  PLANE_STRIDE_(stride));
+
+	intel_de_write_fw(display, PLANE_CTL(plane->pipe, plane->id), plane_ctl);
+
+	intel_de_write_fw(display, PLANE_SURF(plane->pipe, plane->id),
+			  skl_plane_surf(state, 0));
+}
+
 struct intel_plane *
 skl_universal_plane_create(struct intel_display *display,
 			   enum pipe pipe, enum plane_id plane_id)
@@ -2838,6 +2857,7 @@ skl_universal_plane_create(struct intel_display *display,
 		plane->max_height = skl_plane_max_height;
 		plane->min_cdclk = skl_plane_min_cdclk;
 	}
+	plane->disable_tiling = skl_disable_tiling;
 
 	if (DISPLAY_VER(display) >= 13)
 		plane->max_stride = adl_plane_max_stride;
-- 
2.49.0

