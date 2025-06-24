Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F027CB04
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756583; cv=none; b=sTx58ED4z4PBaaeem+xrwQ8vH/MyJmT8Mpu22KrpnlFujZRTh/47gOJjUrwobW+fI13NMoRy+v2ocx93OnUPYtDxtf94Z6vIiVcL26zGMZG9i/VeENh9xQYtP1C13/qGrvLSLhAWIXI6Nsy5X5mXUempULKhBaGPHqeDrsYhnEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756583; c=relaxed/simple;
	bh=sZAWXvRlGC3zujNzJ8htS8G6hlQh+Fj6BxKYPfAf/os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CovsmjEfVLztSKgDmYXK3IB0qaJdvLBQwuvS/xcTaVa9IpYQjFtF2j2d6jzg03W+3lefQOJmu9xdozxoygYH/rrOBBRvFpn2sQTryEuwLZL/uP4MlFx1XrR7n4OqH8w66h2tmPPJWDiQPgPqT1zThamAAcH4De9RGwpkBMHX8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifr8MI+w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifr8MI+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJ5quWODccSvAR+x4SOGh9SOfZRs08Z1pP6/UHZT6LE=;
	b=ifr8MI+wSbtj25vIuLsGpDAd39OX4N54+oGw3PnuRSYxxNkagth7FLGgCIalW2xAoLLxq4
	ND8bVZC1xTcwZUtYjvIIIkolYnffKwMgQi6vdDFcGaVj23A19TA86BBz8N3fr6WCBztaCa
	n5nBF5V2QQ2b1XM/B6HtcrmBZn0r7gM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-P1rLDTpBNviDclOxL1-esQ-1; Tue,
 24 Jun 2025 05:16:16 -0400
X-MC-Unique: P1rLDTpBNviDclOxL1-esQ-1
X-Mimecast-MFC-AGG-ID: P1rLDTpBNviDclOxL1-esQ_1750756574
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9DCD1956094;
	Tue, 24 Jun 2025 09:16:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 471EE18002B8;
	Tue, 24 Jun 2025 09:16:08 +0000 (UTC)
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
Subject: [PATCH v11 10/11] drm/i915/display: Add drm_panic support for 4-tiling with DPT
Date: Tue, 24 Jun 2025 11:01:19 +0200
Message-ID: <20250624091501.257661-11-jfalempe@redhat.com>
In-Reply-To: <20250624091501.257661-1-jfalempe@redhat.com>
References: <20250624091501.257661-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Alder Lake and later, it's not possible to disable tiling when DPT
is enabled.
So this commit implements 4-Tiling support, to still be able to draw
the panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 5bdfe1cbbb7b..f6b6704f77a1 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1298,6 +1298,25 @@ static unsigned int intel_ytile_get_offset(unsigned int width, unsigned int x, u
 	return offset;
 }
 
+static unsigned int intel_4tile_get_offset(unsigned int width, unsigned int x, unsigned int y)
+{
+	u32 offset;
+	unsigned int swizzle;
+	unsigned int width_in_blocks = DIV_ROUND_UP(width, 32);
+
+	/* Block offset */
+	offset = ((y / YTILE_HEIGHT) * width_in_blocks + (x / YTILE_WIDTH)) * YTILE_SIZE;
+
+	x = x % YTILE_WIDTH;
+	y = y % YTILE_HEIGHT;
+
+	/* bit order inside a block is y4 y3 x4 y2 x3 x2 y1 y0 x1 x0 */
+	swizzle = (x & 3) | ((y & 3) << 2) | ((x & 0xc) << 2) | (y & 4) << 4 |
+		  ((x & 0x10) << 3) | ((y & 0x18) << 5);
+	offset += swizzle * 4;
+	return offset;
+}
+
 static void intel_panic_flush(struct drm_plane *plane)
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
@@ -1341,6 +1360,7 @@ static unsigned int (*intel_get_tiling_func(u64 fb_modifier))(unsigned int width
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
 	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+		return intel_4tile_get_offset;
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
-- 
2.49.0

