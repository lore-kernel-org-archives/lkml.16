Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E503A1FBE83
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512336; cv=none; b=uWLH2rr3dgJ0kAvuYkq7GMHN5vkbs2dk37BsnAT1CyFsdKoJPLA6Priv9PiLW2ErwQFRrDoyc24mVf00X+G+ht2hUye5t5lgJ2g4knsDn5yA5WKm15SLqlSyjePR0CfaIcPa+3fdUyPpmQjvcPik4i6MBGUqGsCqRGT1C8euLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512336; c=relaxed/simple;
	bh=p2FAVwUPsOz8nYl+4ZcopZEcxRrGtwUurqOqrmumtc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXL9UCF/U3/dmz2AAcCpBOrOU8XHW88emVWKw3ogqpQWP6fdKZ0e49jVw3imTvJPoYwDmGel+rSkTZG0d4CzWbDIXl5hBJWUISgaj2ufcoh6/ukp3B3AI3tqXrwTwOsOptqw+KL9KuQYQLxsalyWwQeuNohVllWpimjcwso9HRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IIhuYqkG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IIhuYqkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdBA6jsJfsrTLL4WUycFDFRP3fmh5ENTflYTA7f8G4c=;
	b=IIhuYqkGeRaijy72Sgtv5Gu5Eh5wGrHK6TZzvcQ44TeqLblfT+oqJ1oWgU6tXjV4wAI3vr
	CttcOxFocvwy2TX1P/aimpOkUP8wl2Db5EsAzDwpmgWNA88wKe53N1HTaBuUrAPGr96kG4
	QnlvWqaxfFmrZozG9YcVEuFQgzl9uNY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222-zPp512zjMHq5QT4E3xGkMQ-1; Tue,
 01 Apr 2025 08:58:49 -0400
X-MC-Unique: zPp512zjMHq5QT4E3xGkMQ-1
X-Mimecast-MFC-AGG-ID: zPp512zjMHq5QT4E3xGkMQ_1743512323
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B36F180AF50;
	Tue,  1 Apr 2025 12:58:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B6231956094;
	Tue,  1 Apr 2025 12:58:38 +0000 (UTC)
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
Subject: [PATCH v6 2/8] drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
Date: Tue,  1 Apr 2025 14:51:08 +0200
Message-ID: <20250401125818.333033-3-jfalempe@redhat.com>
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
 drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 5e8344fdfc28..9c93d5ac7129 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -908,6 +908,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
 	.format_mod_supported = i8xx_plane_format_mod_supported,
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
@@ -1050,6 +1071,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 		}
 	}
 
+	plane->disable_tiling = i9xx_disable_tiling;
+
 	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
 
 	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 367b53a9eae2..62d0785c9edf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1512,6 +1512,8 @@ struct intel_plane {
 			   bool async_flip);
 	void (*enable_flip_done)(struct intel_plane *plane);
 	void (*disable_flip_done)(struct intel_plane *plane);
+	/* For drm_panic */
+	void (*disable_tiling)(struct intel_plane *plane);
 };
 
 #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
-- 
2.49.0

