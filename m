Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619BC4A1A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749860304; cv=none; b=qzHnc4NhVKKf4mXCknLHp5XovF/iCdS+Cax+dHK58+hqW5uV3iIVTj53/Vv8J5PcYklR2eKiOmFdyhIufpHGIcON+aV7QNGDG/JFHr8LkmjAwA/Ks+yAzmjQC/IyyWr4r/naLx/KiRFL/6zZwyLHt7hfYk8TPNomeWN+UGjQ4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749860304; c=relaxed/simple;
	bh=wSXennWnn5RNeVhyj/45VEJ7IkDydwVCqJqgbeEJt2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsfeSC6ab8iJ8bx41vSp31tCXwOYMCdiSmWl2dxWB3gxC5B/nXO0xhxEgfpQRMU/jemEnsCuJr84PRwy+OiAAjBkerqHF9sRCuwLCbh1FCSg9S4kvcjn/TmuZtlkP8LTEiOfRWQ7gK6sdj+Tjq6RhDVxxb5YJmHP668J8j7FOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=mKGnXOQ6; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="mKGnXOQ6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ZbopYs+/yUemZ8UzC8beVQZQZyrudFnFzd7s9Dx/xlw=; b=mKGnXOQ60ZF/of28
	MdY1YQCypls2C4nYtndVcYZVCgMoL/Z7fTKgukVby77Axwgx+L5xbQpaFUIyLvCDU7ZbSf9SfPDv0
	2tYhCQeXJp51Um4z3ejeIB/qHvtl3x5FbPMFvEJPI3rmk/CRAh+07TiR5gmK0eRFIlV3M6MfNP85n
	aupWARNdk1weNBUethVBDTmDdNmxeWjNzJXEIQNqm/hCS9np2uFumeNX/2695Ez6dNG/CGsoGbXKa
	n2YjnQ4F6s2bIpb7UfDVBQRgFHIrtGUoDKG7bBBXfhisSWDfb2h+UZLOrrGwUB4hL+b9N49hTtx+H
	eHoOsS7fafaZuJBnKw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQEb3-009aPa-1L;
	Sat, 14 Jun 2025 00:18:09 +0000
From: linux@treblig.org
To: zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/vmwgfx: Remove unused vmw_kms_sou_do_bo_dirty
Date: Sat, 14 Jun 2025 01:18:07 +0100
Message-ID: <20250614001807.605200-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of vmw_kms_sou_do_bo_dirty() was removed in 2018 by
commit 2f5544ff0300 ("drm/vmwgfx: Use atomic helper function for dirty fb
IOCTL")

Remove it, and its helpers.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |   8 --
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 112 ---------------------------
 2 files changed, 120 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 511e29cdb987..9d8576a0acb5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -457,14 +457,6 @@ int vmw_kms_sou_do_surface_dirty(struct vmw_private *dev_priv,
 				 unsigned num_clips, int inc,
 				 struct vmw_fence_obj **out_fence,
 				 struct drm_crtc *crtc);
-int vmw_kms_sou_do_bo_dirty(struct vmw_private *dev_priv,
-			    struct vmw_framebuffer *framebuffer,
-			    struct drm_clip_rect *clips,
-			    struct drm_vmw_rect *vclips,
-			    unsigned int num_clips, int increment,
-			    bool interruptible,
-			    struct vmw_fence_obj **out_fence,
-			    struct drm_crtc *crtc);
 int vmw_kms_sou_readback(struct vmw_private *dev_priv,
 			 struct drm_file *file_priv,
 			 struct vmw_framebuffer *vfb,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 5f5f5a94301f..f758f00dc6ea 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -1145,118 +1145,6 @@ int vmw_kms_sou_do_surface_dirty(struct vmw_private *dev_priv,
 	return ret;
 }
 
-/**
- * vmw_sou_bo_fifo_commit - Callback to submit a set of readback clips.
- *
- * @dirty: The closure structure.
- *
- * Commits a previously built command buffer of readback clips.
- */
-static void vmw_sou_bo_fifo_commit(struct vmw_kms_dirty *dirty)
-{
-	if (!dirty->num_hits) {
-		vmw_cmd_commit(dirty->dev_priv, 0);
-		return;
-	}
-
-	vmw_cmd_commit(dirty->dev_priv,
-			sizeof(struct vmw_kms_sou_bo_blit) *
-			dirty->num_hits);
-}
-
-/**
- * vmw_sou_bo_clip - Callback to encode a readback cliprect.
- *
- * @dirty: The closure structure
- *
- * Encodes a BLIT_GMRFB_TO_SCREEN cliprect.
- */
-static void vmw_sou_bo_clip(struct vmw_kms_dirty *dirty)
-{
-	struct vmw_kms_sou_bo_blit *blit = dirty->cmd;
-
-	blit += dirty->num_hits;
-	blit->header = SVGA_CMD_BLIT_GMRFB_TO_SCREEN;
-	blit->body.destScreenId = dirty->unit->unit;
-	blit->body.srcOrigin.x = dirty->fb_x;
-	blit->body.srcOrigin.y = dirty->fb_y;
-	blit->body.destRect.left = dirty->unit_x1;
-	blit->body.destRect.top = dirty->unit_y1;
-	blit->body.destRect.right = dirty->unit_x2;
-	blit->body.destRect.bottom = dirty->unit_y2;
-	dirty->num_hits++;
-}
-
-/**
- * vmw_kms_sou_do_bo_dirty - Dirty part of a buffer-object backed framebuffer
- *
- * @dev_priv: Pointer to the device private structure.
- * @framebuffer: Pointer to the buffer-object backed framebuffer.
- * @clips: Array of clip rects.
- * @vclips: Alternate array of clip rects. Either @clips or @vclips must
- * be NULL.
- * @num_clips: Number of clip rects in @clips.
- * @increment: Increment to use when looping over @clips.
- * @interruptible: Whether to perform waits interruptible if possible.
- * @out_fence: If non-NULL, will return a ref-counted pointer to a
- * struct vmw_fence_obj. The returned fence pointer may be NULL in which
- * case the device has already synchronized.
- * @crtc: If crtc is passed, perform bo dirty on that crtc only.
- *
- * Returns 0 on success, negative error code on failure. -ERESTARTSYS if
- * interrupted.
- */
-int vmw_kms_sou_do_bo_dirty(struct vmw_private *dev_priv,
-				struct vmw_framebuffer *framebuffer,
-				struct drm_clip_rect *clips,
-				struct drm_vmw_rect *vclips,
-				unsigned num_clips, int increment,
-				bool interruptible,
-				struct vmw_fence_obj **out_fence,
-				struct drm_crtc *crtc)
-{
-	struct vmw_bo *buf =
-		container_of(framebuffer, struct vmw_framebuffer_bo,
-			     base)->buffer;
-	struct vmw_kms_dirty dirty;
-	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
-	int ret;
-
-	vmw_bo_placement_set(buf, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
-			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
-	ret = vmw_validation_add_bo(&val_ctx, buf);
-	if (ret)
-		return ret;
-
-	ret = vmw_validation_prepare(&val_ctx, NULL, interruptible);
-	if (ret)
-		goto out_unref;
-
-	ret = do_bo_define_gmrfb(dev_priv, framebuffer);
-	if (unlikely(ret != 0))
-		goto out_revert;
-
-	dirty.crtc = crtc;
-	dirty.fifo_commit = vmw_sou_bo_fifo_commit;
-	dirty.clip = vmw_sou_bo_clip;
-	dirty.fifo_reserve_size = sizeof(struct vmw_kms_sou_bo_blit) *
-		num_clips;
-	ret = vmw_kms_helper_dirty(dev_priv, framebuffer, clips, vclips,
-				   0, 0, num_clips, increment, &dirty);
-	vmw_kms_helper_validation_finish(dev_priv, NULL, &val_ctx, out_fence,
-					 NULL);
-
-	return ret;
-
-out_revert:
-	vmw_validation_revert(&val_ctx);
-out_unref:
-	vmw_validation_unref_lists(&val_ctx);
-
-	return ret;
-}
-
-
 /**
  * vmw_sou_readback_fifo_commit - Callback to submit a set of readback clips.
  *
-- 
2.49.0

