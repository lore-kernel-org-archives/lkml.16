Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA62EF9AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556699; cv=none; b=YBsWdmkEN9gNGy+NTo09LGriXBX39ivHvqkTNR4FjDK5FvK/1GNu5o9vxHI0ubQqXZ6maZuzBejSRtz8DKBOrpGqpq0Ixp0tO3KRPNlLvq9zH8kokXy2HqsuzRVdjoOcvTGjyOuGs2dNic92EEQtMCs8BR0rI2j4AAdvRMStK4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556699; c=relaxed/simple;
	bh=bcsuCxlMPkFdjXyM4HQKS9+BP4K/TbMpCMV07lxI5R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBmmQCb5tO5qoXzbyMise66c496HBIIAxAUgjIASteKCNz1chKttmOt+Kns3nZMwEnO6neHhu6Ab9WpiOT2Q3GF7TX3HrC7Ap8YEjLSZc4UOszZs3y5AP+RoIgsMjsP6X1XHiyp++E5dwPDeBDttEjqTSYXRqoDjmb4PluhJ2jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gMJ+S6Ae; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gMJ+S6Ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751556695;
	bh=bcsuCxlMPkFdjXyM4HQKS9+BP4K/TbMpCMV07lxI5R8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMJ+S6Ae6eQ4DXr4ZTsl2fdBxKmQla3YcVHhyIN4PcaJHCX1YRtgYonBbQ0Chgz0x
	 MtFxDvqxs1B/tWZqsqw/2bCxZZ04LbX1QZc3H3+Sf2Zug9CswmSY0NT2FWpPYq3hcE
	 H58jythr3TDsM3/sHdzj+eqrAmszSFo89Sylm0kZP/ZxvmbM9VpfaXUdTraz4s3udz
	 MzzTKcuWVWCq+Ak2pShUgth5QDQUO60n2BTmjEmqyVkQAm36rGwnOVkXNeL8bsQDZI
	 vHaRGLZEMnYCxKfoNe2zE/mRXkaWrLla1rUXj9+g2kaLSrn16T1HWkMKGHIK2Z/OSc
	 VE+F1Uky6ySEA==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nanokatze)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5057717E0676;
	Thu,  3 Jul 2025 17:31:34 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
	Caterina Shablia <caterina.shablia@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] drm/gpuvm: Add a flags field to drm_gpuvm_map_req/drm_gpuva_op_map
Date: Thu,  3 Jul 2025 15:28:58 +0000
Message-ID: <20250703152908.16702-7-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703152908.16702-2-caterina.shablia@collabora.com>
References: <20250703152908.16702-2-caterina.shablia@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Asahi Lina <lina@asahilina.net>

drm_gpuva objects have a flags field. Currently, this can be managed by
drivers out-of-band, without any special handling in drm_gpuvm.

To be able to introduce flags that do affect the logic in the drm_gpuvm
core, we need to plumb it through the map calls. This will allow the
core to check the flags on map and alter the merge/split logic depending
on the requested flags and the flags of the existing drm_gpuva ranges
that are being split.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++++
 include/drm/drm_gpuvm.h     | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 2df04dfcb6ef..a24b6159a0d4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2063,6 +2063,7 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	op.map.va.range = req->va.range;
 	op.map.gem.obj = req->gem.obj;
 	op.map.gem.offset = req->gem.offset;
+	op.map.flags = req->flags;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2175,6 +2176,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = range - req->va.range,
 					.gem.obj = obj,
 					.gem.offset = offset + req->va.range,
+					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2193,6 +2195,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				.va.range = ls_range,
 				.gem.obj = obj,
 				.gem.offset = offset,
+				.flags = va->flags,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
@@ -2219,6 +2222,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.gem.obj = obj,
 					.gem.offset = offset + ls_range +
 						      req->va.range,
+					.flags = va->flags,
 				};
 
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
@@ -2247,6 +2251,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = end - req_end,
 					.gem.obj = obj,
 					.gem.offset = offset + req_end - addr,
+					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2291,6 +2296,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			prev.va.range = req_addr - addr;
 			prev.gem.obj = obj;
 			prev.gem.offset = offset;
+			prev.flags = va->flags;
 
 			prev_split = true;
 		}
@@ -2300,6 +2306,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			next.va.range = end - req_end;
 			next.gem.obj = obj;
 			next.gem.offset = offset + (req_end - addr);
+			next.flags = va->flags;
 
 			next_split = true;
 		}
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index a6e6c33fc10b..f77a89e791f1 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -847,6 +847,11 @@ struct drm_gpuva_op_map {
 		 */
 		struct drm_gem_object *obj;
 	} gem;
+
+	/**
+	 * @flags: requested flags for the &drm_gpuva for this mapping
+	 */
+	enum drm_gpuva_flags flags;
 };
 
 /**
@@ -1074,6 +1079,9 @@ struct drm_gpuvm_map_req {
 		/** @offset: offset in the GEM */
 		u64 offset;
 	} gem;
+
+	/** @flags: combination of DRM_GPUVA_ flags describing the mapping properties. */
+	enum drm_gpuva_flags flags;
 };
 
 struct drm_gpuva_ops *
@@ -1097,6 +1105,7 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
+	va->flags = op->flags;
 	va->va.addr = op->va.addr;
 	va->va.range = op->va.range;
 	va->gem.obj = op->gem.obj;
-- 
2.47.2

