Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02918132A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556691; cv=none; b=jcBb1IGbrkXYpn0ERvpU5/zuFvlE4h/CELW4oT6ZRfI88Fb0KOvqkMISQVLBTq3MJ5kuFXNr/dnZkH2dONkoohTjMX9beyOEnKK0ydafvxfvahTVCQzoQJW3zar0bEk95QBJTJhhbgXqy2SI5RNsmCywP6wvQ7Drl7iRkTjeGN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556691; c=relaxed/simple;
	bh=tFEfKWU89/mON7YzWM3EMlN8oEIpH8lGXHI+RwQ0Q3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTBrHg5AOM8omOyvP6Kbg4xsvMLQ/hFcD75NaWCHCn167JqjCMf3k49r4RgpnZOF/X8iOpuSAjwG/j8Pp9oXJw2DeYo9x3BYZSALH47OwsgfImCx162yCzYakatvs21yEG/oLasJnfGmrLWy7H9YLIMj9RvaUcSDopMlCyzuicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YkSYxq22; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YkSYxq22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751556687;
	bh=tFEfKWU89/mON7YzWM3EMlN8oEIpH8lGXHI+RwQ0Q3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YkSYxq22yop9kQ0OlhFUQ9KatdIA2RQyHrCVQrhknPlaAyzH1AoHsyhNRhgbDixwi
	 uEWcNRnMOvAmjuhW1oRvfyQ+mOaVJQlgm82zFEkA3XksW4NvI58axO84k8CRYtD5Ej
	 vtMzbUUM4KccjGp3mFS4O3WXr1UxDPUS7vCygez06LyggRrDBYUr0jeQglbeWBojd8
	 JpyIxfyOLCQ6/Ac3vdTLHMziGnm6OejIQTGGnjcb/kiQFv74HIQzO+thrBz98401y2
	 BJ+VCZ+ir4DvvQY+W3YsHxAAq+geXPvIqgKv60hR2mmepmcky4E3a46c4Bq+sjbKKd
	 mDO4CzNLG9RTQ==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nanokatze)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BB1517E0676;
	Thu,  3 Jul 2025 17:31:27 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
	Caterina Shablia <caterina.shablia@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] drm/gpuvm: Kill drm_gpuva_init()
Date: Thu,  3 Jul 2025 15:28:55 +0000
Message-ID: <20250703152908.16702-4-caterina.shablia@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

drm_gpuva_init() only has one internal user, and given we are about to
add new optional fields, it only add maintenance burden for no real
benefit, so let's kill the thing now.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 include/drm/drm_gpuvm.h | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..6fdf2aff3e90 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
-{
-	va->va.addr = addr;
-	va->va.range = range;
-	va->gem.obj = obj;
-	va->gem.offset = offset;
-}
-
 /**
  * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
  * invalidated
@@ -1079,8 +1070,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
-	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+	va->va.addr = op->va.addr;
+	va->va.range = op->va.range;
+	va->gem.obj = op->gem.obj;
+	va->gem.offset = op->gem.offset;
 }
 
 /**
-- 
2.47.2

