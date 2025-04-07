Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE91C3BE1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034529; cv=none; b=Q0CojdN4mNmfc47FFduudohqG20yZDMIinEqOZLT8yJ65zrDIowTWuXRtjHrfZiWrZaR5R6ptst3Wh/0/gsUQs9a9L1p3CoInuJZidoqhsr92AwjovzwjetkK+Oz5BuNw3ThFw4IFi/1RCaPD3mvtW53yw9K/VB12nBQivGA5pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034529; c=relaxed/simple;
	bh=B2vxhJgkaB1DTF+EfRvc4gjBoqFcl3I2MjR6CXdmHOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9gTUQpJSBWcPwde5za1JoE+vH7xWVOLp+K5rrMoq8ga86bScniwAosYQCHnq7CEOVpHnOASFPPEgJhS8f0VIF69BoPosqMxKmWkqQHsua60TKo2QMAVVG9gcqoPK/4ZfnGSzIyFLMf+1A+1A93TFygvBWl5fZ/3eL0FSqXJZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hsjVPpQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsjVPpQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744034527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1Q+gQlDrMOfjGrlEjwGCJBXtgRU8uY1eeO/aQN+gl+g=;
	b=hsjVPpQ/BNJfxk4tZXVqKXtPjJ5AKikkwGpC/Yyi4w58Woh9+/u5WE09ykmN96GcBOoTKF
	2W93stoq9DGSmhj3DYm8mxUVRIEURk6+GXOvTwXSNkaN0j3ZevsSATwXKUYEXBaJB2IcHr
	PF8Gua1TCX3h0Qc2b4isf/pjbz/Atc4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-QPHcBfKnOV-i9Y4rA6L0rg-1; Mon,
 07 Apr 2025 10:02:02 -0400
X-MC-Unique: QPHcBfKnOV-i9Y4rA6L0rg-1
X-Mimecast-MFC-AGG-ID: QPHcBfKnOV-i9Y4rA6L0rg_1744034520
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C17351955E79;
	Mon,  7 Apr 2025 14:01:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.175])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44192190DB07;
	Mon,  7 Apr 2025 14:01:52 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ryosuke Yasuoka <ryasuoka@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 0/2] drm/panic: Add support to scanout buffer as array of pages
Date: Mon,  7 Apr 2025 15:42:24 +0200
Message-ID: <20250407140138.162383-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Some drivers like virtio-gpu, don't map the scanout buffer in the
kernel. Calling vmap() in a panic handler is not safe, and writing an
atomic_vmap() API is more complex than expected [1].
So instead, pass the array of pages of the scanout buffer to the
panic handler, and map only one page at a time to draw the pixels.
This is obviously slow, but acceptable for a panic handler.
As kmap_local_page() is not safe to call from a panic handler,
introduce a kmap_local_page_try_from_panic() that will avoid unsafe
operations.

[1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/

v2:
 * Add kmap_local_page_try_from_panic() (Simona Vetter)
 * Correctly handle the case if kmap_local_page_try_from_panic()
   returns NULL
 * Check that the current page is not NULL before trying to map it.
 * Add a comment in struct drm_scanout_buffer, that the array of
   pages shouldn't be allocated in the get_scanout_buffer() callback.

v3:
 * Replace DRM_WARN_ONCE with pr_debug_once (Simona Vetter)
 * Add a comment in kmap_local_page_try_from_panic() (Thomas Gleixner)

Jocelyn Falempe (2):
  mm/kmap: Add kmap_local_page_try_from_panic()
  drm/panic: Add support to scanout buffer as array of pages

 drivers/gpu/drm/drm_panic.c      | 142 +++++++++++++++++++++++++++++--
 include/drm/drm_panic.h          |  12 ++-
 include/linux/highmem-internal.h |  13 +++
 3 files changed, 160 insertions(+), 7 deletions(-)


base-commit: fbe43810d563a293e3de301141d33caf1f5d5c5a
-- 
2.49.0

