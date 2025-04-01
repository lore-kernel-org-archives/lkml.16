Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A630203719
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512337; cv=none; b=kTzaPibaoqmK/n9rUKLfVKps/6IGtFcxc+o7SQjBJfCybtfLIqldSAztYNkpEWdKLyJby+ZhzTqY7yNsCF/gf1MUMB5VvPNJzWilNgKrrbpaE/3A3V8JWbPe6pdir0AvrIdIYzRYFD2s5xsG5pNEmaQFRog24kGT2rdzOPpHj1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512337; c=relaxed/simple;
	bh=dBs4owfbZOLT49HeLWBMumNZMaB/enY5f7NBNOCMt2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCtHYzvCPJ2ZPzuDq5MgKdp6qGP4ESDhBijM/f9AfccKeNTOzuJWgtvQrKylEqa2AyTxmRw0N+XvsXrYOdpDEWnOdvm+3Wt8GQe6DOJcDc4g9hM6TLDdtib/3c3fQUEvrX7OggpDbCNl7iplCAqCrVB1A/V+ySwni4DYP3FZST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehDtpnq2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehDtpnq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsf5mF6lbnqqM1ES1AArIF+WsV/mjamIarjqut5ruTA=;
	b=ehDtpnq21uF4SoxB4ggJvyq079Q0Vw6ymGV2SS+r4dqO5nlxvypg92W2oM9egqBhlxlECg
	qhotAnc8rYkaw4k/1xBv35DpVLcSGBHRdMvkYmpDlSAvnm9ael1eDo7lAmL7wSE/42Uk2t
	PJoOwwkLbVDRa/0NymgFH0LyCEJfSHY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-90-esD6WKM0M3-bb9i6xDkUMg-1; Tue,
 01 Apr 2025 08:58:50 -0400
X-MC-Unique: esD6WKM0M3-bb9i6xDkUMg-1
X-Mimecast-MFC-AGG-ID: esD6WKM0M3-bb9i6xDkUMg_1743512329
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D79D81809CA3;
	Tue,  1 Apr 2025 12:58:48 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 426ED1956094;
	Tue,  1 Apr 2025 12:58:43 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v6 3/8] drm/i915/display: Add a disable_tiling() for skl planes
Date: Tue,  1 Apr 2025 14:51:09 +0200
Message-ID: <20250401125818.333033-4-jfalempe@redhat.com>
In-Reply-To: <20250401125818.333033-1-jfalempe@redhat.com>
References: <20250401125818.333033-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

drm_panic draws in linear framebuffer, so it's easier to re-use the
current framebuffer, and disable tiling in the panic handler, to show
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 8739195aba69..64a1e8e7122d 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2790,6 +2790,25 @@ static u8 tgl_plane_caps(struct intel_display *display,
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
@@ -2836,6 +2855,7 @@ skl_universal_plane_create(struct intel_display *display,
 		plane->max_height = skl_plane_max_height;
 		plane->min_cdclk = skl_plane_min_cdclk;
 	}
+	plane->disable_tiling = skl_disable_tiling;
 
 	if (DISPLAY_VER(display) >= 13)
 		plane->max_stride = adl_plane_max_stride;
-- 
2.49.0

