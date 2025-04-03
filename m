Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F72E3386
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690465; cv=pass; b=BDrWbRvcwqeR4xw5N9SqvNY+H9oELLtyb4iuUFEsjYXvunNsRRu1S12WDAsEfRzxkGGexVYTuVer4Cn9ioGovQiTmhKMH6env2tRK/WKj4SmieGO9JvFxqKnthNTEYSzqWOD8bdntqJJxlFl4Sxu6ab7zYdfrhqcGvYAKRyFsUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690465; c=relaxed/simple;
	bh=ZmDPtog8qHxaaMJj3rw/TV2BLW+r2M2AjxkMTRmax3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZfg5ZfTF6PL+VKlUbSTQDk23XiICy/9Yr2xKFjhM7L1cMJlz8i0hS3ChUTxIwBdUuRLhxChiDMTHrDWR0G0yH/wBqnG51Su71rcfAeI3qPU3CRCOLRSORjc+2ozOP4gyoej7GBHWDP6TwTRcRc6p/j2X8T49rruYepSC6TAM00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=hElxKqev; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="hElxKqev"
ARC-Seal: i=1; a=rsa-sha256; t=1743690443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K3Nb25MxH7+0OhMRLOA9J8O+lKajw4+NwyzfBzURx/xSAlKkILvGWBPFklyrDj2FBW492riINvSHw5I8gpeaK1+lS6ZchP5gPRkUD10udY84rk+fxgA606gtbEt28zR+AVLTVj3kJ/W1svCdzeXCgMIhQU+RgqiMYqVQr4pti9g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743690443; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oirO8kcN/r9uSBJ+v9FYpxLcssDHYsJBhsQlC7HHKrc=; 
	b=EK5s6x9g9Dvc7ua2PLaP4NpXKj7AZdaGosdqE3MCurx3GNIBFsirfGKDOAcPDEkKzc24QDFRqJcK8E+NzW0E7lcg/+mvyPyJjx2MvTKVu5YYXth8bdMBmIx/SRYoP2BYjiOgJGafRn/IlcZl6357hC3Q7WV7nHKrI/mKdWx6SaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743690443;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oirO8kcN/r9uSBJ+v9FYpxLcssDHYsJBhsQlC7HHKrc=;
	b=hElxKqevrUCM0CvLsy7NDdP7+0ZbxCIQFqO7uT1VPB+nX9nw5W1mfGzsvsW//TLo
	u0IctGTqk1X2xHGBTeOvoDO/3Y91EzocXrbSgThWkkpgpuMd0/giHK2ERM05Kc8EZ2n
	bl9XFfmRZ3Qeg5PvdpS4PnOdQ4De5jBtVy/RVL5U=
Received: by mx.zohomail.com with SMTPS id 1743690441799662.414689971647;
	Thu, 3 Apr 2025 07:27:21 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1] drm/shmem-helper: Fix unsetting shmem vaddr while vmap refcount > 0
Date: Thu,  3 Apr 2025 17:26:33 +0300
Message-ID: <20250403142633.484660-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

We switched to use refcount_t for vmaps and missed to change the vunmap
code to properly unset the vmap pointer, which is now cleared while vmap's
refcount > 0. Clear the cached vmap pointer only when refcounting drops to
zero to fix the bug.

Fixes: e1fc39a92332 ("drm/shmem-helper: Use refcount_t for vmap_use_count")
Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Closes: https://lore.kernel.org/dri-devel/20250403105053.788b0f6e@collabora.com/T/#m3dca6d81bedc8d6146a56b82694624fbc6fa4c96
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 2d924d547a51..aa43265f4f4f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -415,11 +415,11 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 
 		if (refcount_dec_and_test(&shmem->vmap_use_count)) {
 			vunmap(shmem->vaddr);
+			shmem->vaddr = NULL;
+
 			drm_gem_shmem_unpin_locked(shmem);
 		}
 	}
-
-	shmem->vaddr = NULL;
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_vunmap_locked);
 
-- 
2.49.0

