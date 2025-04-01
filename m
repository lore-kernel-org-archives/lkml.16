Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5111FBE83
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512322; cv=none; b=pEtZ0vprGgr/ghZiDLAzPX0qD+rk/Fvwuh5NG1LPvfkIn+CYb7vxEcnZgfqSt4YoPz43sE0aKtTvjS979tTQmkv55RVsJY4GYztlkskEqJjhhLIvIVUIqfk1t19anBmIBEcIvVbsAZIAiJXd8tlFzIyWPeDiVc4pplzayGMtmL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512322; c=relaxed/simple;
	bh=7ownRNrp8waqDTJNjAMNHZWNVU7/bS7YjQdsU9lba7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehZ5kO+drDI2kY1yLRirEkhyBgiFLD8Ypd1Oi5XfI7myvLHzshqVCbcIGelUgWxKzyfoeMed+psI3pLTvCPWo/PyGeur9ttjSf034Uja+bx9oqTomsB+Uj2rwnlpvaYlwFZj/CR2TaZz6hVeIQ7pSYFm13ScyYA1LWjl5nqlqc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BLq2FijJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BLq2FijJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZBPHk9cZuedRDs9pl9r5KL5+x0frCOEG1GupmWjuGtI=;
	b=BLq2FijJZSJ44hXunFrgWYS0HRf46Xht8o4jVwibP7ZPnVPtLOnCpWBcVkE8rr7+vSCFJ6
	eY3o8XqT6aWPJM1m8d11G8tmrXmar3t/3N+TNUjAD1r+RpSrDy1d+6YMHlcCEPvCuvFNCl
	pn+OCWTYVhq+vwERplG1OIgGgc2ORA4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-7bo5vYdoNfK-elKO9zWT7Q-1; Tue,
 01 Apr 2025 08:58:35 -0400
X-MC-Unique: 7bo5vYdoNfK-elKO9zWT7Q-1
X-Mimecast-MFC-AGG-ID: 7bo5vYdoNfK-elKO9zWT7Q_1743512314
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 936451800258;
	Tue,  1 Apr 2025 12:58:33 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C0A731956094;
	Tue,  1 Apr 2025 12:58:29 +0000 (UTC)
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
Subject: [PATCH v6 0/8] drm/i915: Add drm_panic support
Date: Tue,  1 Apr 2025 14:51:06 +0200
Message-ID: <20250401125818.333033-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

This is a draft of drm_panic support for i915.

I've tested it on the 4 intel laptops I have at my disposal.
 * Haswell with 128MB of eDRAM.
 * Comet Lake  i7-10850H
 * Raptor Lake i7-1370P (with DPT, and Y-tiling).
 * Lunar Lake Ultra 5 228V (with DPT, and 4-tiling, and using the Xe driver.

I tested panic in both fbdev console and gnome desktop.

Best regards,

v2:
 * Add the proper abstractions to build also for Xe.
 * Fix dim checkpatch issues.

v3:
 * Add support for Y-tiled framebuffer when DPT is enabled.

v4:
 * Add support for Xe driver, which shares most of the code.
 * Add support for 4-tiled framebuffer found in newest GPU.

v5:
 * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
 * Use struct intel_display instead of drm_i915_private.
 * Use iosys_map for intel_bo_panic_map().

v6:
 * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
 * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c

Jocelyn Falempe (8):
  drm/i915/fbdev: Add intel_fbdev_get_map()
  drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
  drm/i915/display: Add a disable_tiling() for skl planes
  drm/i915/gem: Add i915_gem_object_panic_map()
  drm/i915/display: Add drm_panic support
  drm/i915/display: Flush the front buffer in panic handler
  drm/i915/display: Add drm_panic support for Y-tiling with DPT
  drm/i915/display: Add drm_panic support for 4-tiling with DPT

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
 .../gpu/drm/i915/display/intel_atomic_plane.c | 169 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bo.c       |   5 +
 drivers/gpu/drm/i915/display/intel_bo.h       |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +-
 .../drm/i915/display/skl_universal_plane.c    |  27 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  29 +++
 drivers/gpu/drm/i915/i915_vma.h               |   5 +
 drivers/gpu/drm/xe/display/intel_bo.c         |  10 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
 15 files changed, 294 insertions(+), 2 deletions(-)


base-commit: 010363c4618920838ca8777fdabd46871d289bf9
-- 
2.49.0

