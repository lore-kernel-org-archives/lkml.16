Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E724DCF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499487; cv=pass; b=OMQZpdPAJP0CgIYeMDW05ewGJBMAe8D4NLspc0mHApC/eWp9jUxpA+PJBYB8ky/g5rvY4mc4PHLeHgqcZSb/4WjVXNDSqmCo8NYxw3YiRFWyVV9PvaeqnUGwckt6i5OxEX1X7iOb2dbVvBMjVkFX+V4OHBI5vmfl60sNBITtblg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499487; c=relaxed/simple;
	bh=tFEfKWU89/mON7YzWM3EMlN8oEIpH8lGXHI+RwQ0Q3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIxw5Q4Y3Qm953GDnIdKsk5sRN0dPcIvHpeq1JUkRRHPLATEVyV57RdydOR8CiBA12+2tudFQwcGIbB84hVFcxex+w1saDdzvNsYKhQ9ugNewdp51qcpt2iBd24+Htd76hx+fl3AKayFcDZdrugmyXkYP/cjGD7bSGTlxkdiT3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b=kAMl6Osk; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="kAMl6Osk"
ARC-Seal: i=1; a=rsa-sha256; t=1751499467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HFqgAMXNOgWpa1hKJ0HCmKlNEdCOZdC7m7Kl9ZdFRRIWR/I1ubkMf7uig3dXawOq8A/IALa4mZ4J4AVoQrhkrVbS7vXwoMMNC7rIKneyrhNML3wugHQD0yoaqEjUEJhQCXbfo5kGFqrjxUREZTjnhs0m3is9/3E37vbn/qCeLdA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751499467; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FUvgtE41glFvTH2scrm4EpwUw9kg8Nm0tZHMNDvhaCc=; 
	b=j2+n+1WDfYHZdB0xNk8RBUzYmrBe4R0PJ5UTAt5/RXePIHcjERzSqrAhdi5jcPR3VhxfYmWZ74fdNoYadxRWv8qcNAxOjUAV75d7VzkKXp7O0JJKd2BU8CJmHzFeDZLqE13GLhRrFNeYOsk8RFBPELLA3dSxLFOudeKZrQX2jZc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
	dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751499466;
	s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FUvgtE41glFvTH2scrm4EpwUw9kg8Nm0tZHMNDvhaCc=;
	b=kAMl6OskCVgLij5QEPpqxyuR4rP6ygXJKQAtnJxxmGMIQDw9Kr8rN6klObovYkeN
	+8ScCFB5AjUGhI7SDrOmAvkc9kKuRhXWFQ/b8NPdZ3OKkEZt6ZPUuoYoys6b++fYDrh
	O1QbR1pQ0QfTTfeZivGLpm1bGW+hwZ6r29aujfI4=
Received: by mx.zohomail.com with SMTPS id 1751499465342857.980489350829;
	Wed, 2 Jul 2025 16:37:45 -0700 (PDT)
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
Date: Wed,  2 Jul 2025 23:36:04 +0000
Message-ID: <20250702233621.12990-3-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250702233621.12990-1-caterina.shablia@collabora.com>
References: <20250702233621.12990-1-caterina.shablia@collabora.com>
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

