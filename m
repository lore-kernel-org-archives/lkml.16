Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C923C8B3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574669; cv=none; b=gZc0JqNsJTEKSuTMWTvlFteKaFNFONZRb2372kLkOjkyq8n9T5ynVBkByz8wOFywMDx1BUCnrQ7YJl6Z/VyNbsLeHNg/zfkRJ1m6ATVTpOT4bpUF/UKnupd89ygcbp8c7EYJOsjZTlxAzlv4SMz9QWfGm/aDwLetzj2FgrJ47A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574669; c=relaxed/simple;
	bh=R+3dXGcqdWoPB3PGVDS4SNaq4pKHeC8krWozmapyagA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2tUPRN1yUpFPKlxAPObelQL2P7CZnFp2EKayCVNnN5WolxRmjBIW3SUQXLY5ZDJeY5PLaG4C//uLShjYhtPrz7wjmDThBYTe2BXwMfXIoNE3U4UPKgJ1CIll1aG7R0uiiZjgqpRssuoFMUn/4K4Pwo6y8jidlQkSJdM3S0IRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P6uqWP6M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P6uqWP6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745574667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrTtdbTmzvnOy8pX766xRKvGV170LBDM/dlFUCWRyQE=;
	b=P6uqWP6MDFBPIpYotoqg3019PF3CkIgrKbxT9GpxC3wYYSQMvwVBCgSg0N1Sqw0E8eAigF
	E7ldqZe9ZpBwjF3glXWtSv99KS+hr1q2sOr3faqitDbC2RR5GsHFmBk4eaylElV7l8jMXj
	PaPHwujUFD5bLWhTgSKPReFWG7UYSZ8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-zGTNvaNNMXKjluUE1G_nTg-1; Fri,
 25 Apr 2025 05:51:02 -0400
X-MC-Unique: zGTNvaNNMXKjluUE1G_nTg-1
X-Mimecast-MFC-AGG-ID: zGTNvaNNMXKjluUE1G_nTg_1745574660
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A91D1956095;
	Fri, 25 Apr 2025 09:51:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.172])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3BD75195608F;
	Fri, 25 Apr 2025 09:50:47 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v7 6/8] drm/i915/display: Flush the front buffer in panic handler
Date: Fri, 25 Apr 2025 11:37:52 +0200
Message-ID: <20250425094949.473060-7-jfalempe@redhat.com>
In-Reply-To: <20250425094949.473060-1-jfalempe@redhat.com>
References: <20250425094949.473060-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Lunar Lake, if the panic occurs when fbcon is active, the panic
screen is only partially visible on the screen. Adding this
intel_frontbuffer_flush() call solves the issue.
It's probably not safe to do that in the panic handler, but that's
still better than nothing.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index c863249ab980..505719f53411 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -59,6 +59,7 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_fbdev.h"
+#include "intel_frontbuffer.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
@@ -1272,8 +1273,14 @@ static void intel_panic_flush(struct drm_plane *plane)
 	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
 
 	/* Don't disable tiling if it's the fbdev framebuffer.*/
-	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev))
+	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
+		struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
+		struct drm_gem_object *obj = intel_fb_bo(fb);
+
+		intel_bo_flush_if_display(obj);
+		intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
 		return;
+	}
 
 	if (fb->modifier && iplane->disable_tiling)
 		iplane->disable_tiling(iplane);
-- 
2.49.0

