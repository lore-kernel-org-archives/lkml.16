Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417DC2C6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512352; cv=none; b=Fm9Hw6pixOvnMImvWbtwQqa38wHxYQOWyk/1OjN3ttAJkf9OpndYmPCcH8Ey81UNsqT4ZifEKzQByQkw6A2VksDshKyW9/vGASHW3/O7SwxdiGHuhkSnMbt7Z0ibDh+o/wwoNXpQWrL+kbVj141kEHEdK20UYcOMp8pImXIpIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512352; c=relaxed/simple;
	bh=G7K88v/Ukq0QK7fXwZmGYBVg8HiiFFo9uWgLwAMSOPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgk0CXPVt6lDyH52KS682IYil2er7FKFJERO7hiCAIkwheNsTXFiVyAj2uJ7K6bQvy47k7EmFl5qj4NV1CblCB+ldP5DnCIV/dbQ41Vt4wpSEWmTjgXVXOe+do1baEMX55zvow9yGmbR4Pj66y2brFMpYdYwPwlQTvr1rm/lM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QMk/YLQH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QMk/YLQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJt1hJADaASXpoNz9Tj4QMkqEmjuTvocdG32Mm+j/bU=;
	b=QMk/YLQHjjYXa+jPfeYmrAb8n+wIIuKbTNRU9zja7aeFvFZUCuE9rSAamoebo6VzpGbTe2
	/vKOUkvWYWrl7+VjGq9+0gU6ZTVTf0DxpozRppelveR5G2KaImTBJEX5hRMm41OlY8qDN1
	EL5eWe+OuOSIgSMo9g6qM3PSOXo7iXk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-RH5WGiMTPNyCglMqdT544g-1; Tue,
 01 Apr 2025 08:59:04 -0400
X-MC-Unique: RH5WGiMTPNyCglMqdT544g-1
X-Mimecast-MFC-AGG-ID: RH5WGiMTPNyCglMqdT544g_1743512342
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E227180AF57;
	Tue,  1 Apr 2025 12:59:02 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C0081956094;
	Tue,  1 Apr 2025 12:58:57 +0000 (UTC)
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
Subject: [PATCH v6 6/8] drm/i915/display: Flush the front buffer in panic handler
Date: Tue,  1 Apr 2025 14:51:12 +0200
Message-ID: <20250401125818.333033-7-jfalempe@redhat.com>
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

On Lunar Lake, if the panic occurs when fbcon is active, the panic
screen is only partially visible on the screen. Adding this
intel_frontbuffer_flush() call solves the issue.
It's probably not safe to do that in the panic handler, but that's
still better than nothing.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index eebf20fafaeb..5dc880b963fd 100644
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
@@ -1273,7 +1274,13 @@ static void intel_panic_flush(struct drm_plane *plane)
 
 	/* Don't disable tiling if it's the fbdev framebuffer.*/
 	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
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

