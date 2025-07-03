Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A286E2BE7A8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576023; cv=none; b=gBGJ7vJJw+CU2xw36lyd0OSK+nIAEMo6VDaOqeYI/DGGIbllDeaKHVYK8GVg6rMz9a4A4g98i52Wko+F1Yi009FnBccN7ZjhB3JrpJjcvlRMrY7icL47uuRARO9ni9pd+fp0xRC2M9Kwe03klQZmmNhUFUvcekpr80057VTc89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576023; c=relaxed/simple;
	bh=tFEfKWU89/mON7YzWM3EMlN8oEIpH8lGXHI+RwQ0Q3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8GbhrOKYrZAXR7EhPx/ZWYV6oDUe0M9HLgaCREuH30Pe+x/M/v5aPmchHMsGV3vuIEM70vWs98pAVOATvGuwAsg56hNwpAnCGPqHoQDigYAkGoeFTGy4AOn8gTXjOwMAzPtwshiiVapURfRDO98dtFZyBjB5Atkg1dDwv77Bnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fzd2QFXh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fzd2QFXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751576019;
	bh=tFEfKWU89/mON7YzWM3EMlN8oEIpH8lGXHI+RwQ0Q3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzd2QFXhRlH7v2l+sgWCVFrVH8lxts1QlAtA/LpMypDi4qBBtwK+hhSX4m0nAZphZ
	 n/pRd7DnqOlqIACIur5Lq2oiRJ3BdLTx8lFVIfAnu0gLtMj6oJ0R3q3uORoG8osod2
	 k3GuHrAEUH7g/3S5KAyHlllPufWhy0M7PDkaQ0IcUIGY/UYjjDeo9QDarv3aDsy+l6
	 oZnEa7wuDKZd2ylYTYaLg+eH03uhTYM6ia/JHSStzfx9UJgDDroCzHaz8nDvyBP07N
	 yswFX6CTWDQ8OtuVa7RMqt1py+etjg7hq6xBEF3mdiw16At+GrSV/GIHEihbOvhCqj
	 hsSq3jDQNbPVQ==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nanokatze)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F6A917E0EB8;
	Thu,  3 Jul 2025 22:53:38 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Frank Binns" <frank.binns@imgtec.com>,
	"Matt Coster" <matt.coster@imgtec.com>,
	"Karol Herbst" <kherbst@redhat.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Boris Brezillon" <boris.brezillon@collabora.com>,
	"Steven Price" <steven.price@arm.com>,
	"Liviu Dudau" <liviu.dudau@arm.com>,
	"Lucas De Marchi" <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Asahi Lina <lina@asahilina.net>,
	Caterina Shablia <caterina.shablia@collabora.com>
Subject: [PATCH v3 2/7] drm/gpuvm: Kill drm_gpuva_init()
Date: Thu,  3 Jul 2025 20:52:54 +0000
Message-ID: <20250703205308.19419-3-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703205308.19419-1-caterina.shablia@collabora.com>
References: <20250703205308.19419-1-caterina.shablia@collabora.com>
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

