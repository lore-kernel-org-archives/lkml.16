Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A9E2874E9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211552; cv=none; b=mXEZLV2+o0yU1q84XENNscRd71T3NgXDpfTtroJGnETOrCWVCrQ6JtruYyWUfubT0u9jJnYiKsljy11QfFBUURcAd4QfIZc3ivY/hUGaqzetB2MIVf/pgXmmUhWmUnNhUSyt54QsbHwQTkqzun11ZDUzaKxJb3gH9eQi+pqkrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211552; c=relaxed/simple;
	bh=CV4a4KGuH728yQyPWaLKgsNTM75BrIPl2zVZKUa7l2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gyBFkL70Z/tLFUCdqH2Bno5hEMBiiXEvAahygj3I2IbVPjfi/nCwjI78GbhiiL+Jmk22D54DYWiIUTzJEMpcJfonzxzMnMsnP+LmSNxLAcj9GVGVp3vS5u7888kZVaz8Ch4yNXLBJVKJxi2JZxaH8vF5VlFnm8AGazu4ZHBeZIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guLQZWdw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guLQZWdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749211549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/tweG0MISrWmVqbzzxaipvMQBJhW3IG/hseCw+v/QAo=;
	b=guLQZWdwgPTDp1CE68wVCdF3Vaa/sPbBu3e1Wcr9hlY7JADJBBylPMhNYnMKB6/Qam9gRj
	wj5wL6Gfi2VdQTlS/1lxLYAJiyPXrLiF2ZPPOIUQPUauP+JYH1meardf95UI4ZaWKMj/dd
	PkwWNdUhnJSUSE4FaK7N0NKBIImQOHg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-MDInHr2wNf-wmBmIOyt2Kw-1; Fri,
 06 Jun 2025 08:05:43 -0400
X-MC-Unique: MDInHr2wNf-wmBmIOyt2Kw-1
X-Mimecast-MFC-AGG-ID: MDInHr2wNf-wmBmIOyt2Kw_1749211540
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AFC318003FC;
	Fri,  6 Jun 2025 12:05:40 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.33.65])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4CA5618002A5;
	Fri,  6 Jun 2025 12:05:32 +0000 (UTC)
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
Subject: [PATCH v8 0/9] drm/i915: Add drm_panic support
Date: Fri,  6 Jun 2025 13:48:04 +0200
Message-ID: <20250606120519.753928-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

v7:
 * Fix mismatch {} in intel_panic_flush() (Jani Nikula)
 * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
 * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)*

v8:
 * Use kmap_try_from_panic() instead of vmap, to access the framebuffer.
 * Add ttm_bo_kmap_try_from_panic() for the xe driver, that uses ttm.
 * Replace intel_bo_panic_map() with a setup() and finish() function,
   to allow mapping only one page of teh framebuffer at a time.
 * Configure psr to send the full framebuffer update.

Jocelyn Falempe (9):
  drm/i915/fbdev: Add intel_fbdev_get_map()
  drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
  drm/i915/display: Add a disable_tiling() for skl planes
  drm/ttm: Add ttm_bo_kmap_try_from_panic()
  drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
  drm/i915/display: Add drm_panic support
  drm/i915/display: Add drm_panic support for Y-tiling with DPT
  drm/i915/display: Add drm_panic support for 4-tiling with DPT
  drm/i915/psr: Add intel_psr2_panic_force_full_update

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
 .../gpu/drm/i915/display/intel_atomic_plane.c | 169 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bo.c       |  12 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |   4 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  20 +++
 drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
 .../drm/i915/display/skl_universal_plane.c    |  27 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 109 +++++++++++
 drivers/gpu/drm/i915/i915_vma.h               |   5 +
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  27 +++
 drivers/gpu/drm/xe/display/intel_bo.c         |  61 +++++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
 include/drm/ttm/ttm_bo.h                      |   1 +
 19 files changed, 488 insertions(+), 2 deletions(-)


base-commit: 7247efca0dcbc8ac6147db9200ed1549c0662465
-- 
2.49.0

