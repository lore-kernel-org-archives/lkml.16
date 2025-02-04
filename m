Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57A218ACC
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675318; cv=none; b=pGkvL6TQTDtvvz5PxyUYr9hXceQKXLlxzLW7m6nL+XCEF9CS4Y9kqXxJ3PUE8iItoQ6yLTrR+VoYM4tzpyMjzomYuucEp5ABsfIphxmBy4wDoUrpq+ZPwmUM+NEKLFEyft4jhumic0D6JM36OBDt5C49hFpIx6Pzu19b0z0q/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675318; c=relaxed/simple;
	bh=g/FLQZ2IZsKfe3SQKPlerlwe4H9WG7oN+26lrg21qmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtUQEx4tJezcvIB2120b3nB9mfCnQWgmu5OG0gYiQceT6vEOZ+KtTQ0uMYgxsjN3oP9P853v6RhdhOD6JW/Byq0JVBoCshewujkYjLZgvGyWKidUJFT1EW7qHoV9LJYq5momRuSGmwiWS8cOe6IXm2Lnx6l+RNs8rf5NYDFBx2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 8/8] drm/xe/gt: Convert to xe_force_wake guard helpers
Date: Tue,  4 Feb 2025 14:22:37 +0100
Message-ID: <20250204132238.162608-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c | 216 +++++++++++++------------------------
 1 file changed, 74 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 943bab94119fa..c71041087a735 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -98,29 +98,24 @@ void xe_gt_sanitize(struct xe_gt *gt)
 
 static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	u32 reg;
 
 	if (!XE_WA(gt, 16023588340))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return;
+	scoped_guard(xe_force_wake_get, gt_to_fw(gt), XE_FW_GT) {
+		if (!xe_gt_is_media_type(gt)) {
+			reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
+			reg |= CG_DIS_CNTLBUS;
+			xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
+		}
 
-	if (!xe_gt_is_media_type(gt)) {
-		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
-		reg |= CG_DIS_CNTLBUS;
-		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
+		xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
 	}
-
-	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	u32 reg;
 
 	if (!XE_WA(gt, 16023588340))
@@ -129,15 +124,11 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	if (xe_gt_is_media_type(gt))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return;
-
-	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
-	reg &= ~CG_DIS_CNTLBUS;
-	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	scoped_guard(xe_force_wake_get, gt_to_fw(gt), XE_FW_GT) {
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
+		reg &= ~CG_DIS_CNTLBUS;
+		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
+	}
 }
 
 /**
@@ -407,17 +398,12 @@ static void dump_pat_on_error(struct xe_gt *gt)
 
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
-			goto err_force_wake;
+			goto err_pat;
 		if (IS_SRIOV_PF(gt_to_xe(gt)))
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
@@ -430,63 +416,53 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_hw_engines_init_early(gt);
 	if (err)
-		goto err_force_wake;
+		goto err_pat;
 
 	err = xe_hw_engine_class_sysfs_init(gt);
 	if (err)
-		goto err_force_wake;
+		goto err_pat;
 
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	err = xe_gt_ccs_mode_sysfs_init(gt);
 	if (err)
-		goto err_force_wake;
+		goto err_pat;
 
 	/*
 	 * Stash hardware-reported version.  Since this register does not exist
 	 * on pre-MTL platforms, reading it there will (correctly) return 0.
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 
-err_force_wake:
+err_pat:
 	dump_pat_on_error(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return err;
 }
 
 static int all_fw_domain_init(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_force_wake;
-	}
-
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
 	err = xe_gt_clock_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	xe_mocs_init(gt);
 	err = xe_execlist_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	err = xe_hw_engines_init(gt);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	err = xe_uc_init_post_hwconfig(&gt->uc);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	if (!xe_gt_is_media_type(gt)) {
 		/*
@@ -497,10 +473,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
 								IS_DGFX(xe) ? SZ_1M : SZ_512K, 16);
-			if (IS_ERR(gt->usm.bb_pool)) {
-				err = PTR_ERR(gt->usm.bb_pool);
-				goto err_force_wake;
-			}
+			if (IS_ERR(gt->usm.bb_pool))
+				return PTR_ERR(gt->usm.bb_pool);
 		}
 	}
 
@@ -508,15 +482,13 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		struct xe_tile *tile = gt_to_tile(gt);
 
 		tile->migrate = xe_migrate_init(tile);
-		if (IS_ERR(tile->migrate)) {
-			err = PTR_ERR(tile->migrate);
-			goto err_force_wake;
-		}
+		if (IS_ERR(tile->migrate))
+			return PTR_ERR(tile->migrate);
 	}
 
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
-		goto err_force_wake;
+		return err;
 
 	/* Configure default CCS mode of 1 engine with all resources */
 	if (xe_gt_ccs_mode_enabled(gt)) {
@@ -532,14 +504,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		xe_gt_sriov_pf_init_hw(gt);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return 0;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return err;
 }
 
 /*
@@ -548,31 +513,25 @@ static int all_fw_domain_init(struct xe_gt *gt)
  */
 int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
-	xe_gt_mcr_init_early(gt);
-	xe_pat_init(gt);
-
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto out_fw;
+	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, gt_to_fw(gt), XE_FW_GT) {
+		xe_gt_mcr_init_early(gt);
+		xe_pat_init(gt);
 
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto out_fw;
+		err = xe_uc_init(&gt->uc);
+		if (err)
+			return err;
 
-	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
-	xe_gt_enable_host_l2_vram(gt);
+		err = xe_uc_init_hwconfig(&gt->uc);
+		if (err)
+			return err;
 
-out_fw:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	return err;
+		xe_gt_topology_init(gt);
+		xe_gt_mcr_init(gt);
+		xe_gt_enable_host_l2_vram(gt);
+	}
+	return 0;
 }
 
 int xe_gt_init(struct xe_gt *gt)
@@ -597,7 +556,8 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		goto err;
 
-	err = gt_fw_domain_init(gt);
+	scoped_cond_guard(xe_force_wake_get, err = -ETIMEDOUT, gt_to_fw(gt), XE_FW_GT)
+		err = gt_fw_domain_init(gt);
 	if (err)
 		goto err;
 
@@ -611,7 +571,8 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
-	err = all_fw_domain_init(gt);
+	scoped_cond_guard(xe_force_wake_get, err = -ETIMEDOUT, gt_to_fw(gt), XE_FORCEWAKE_ALL)
+		err = all_fw_domain_init(gt);
 	if (err)
 		goto err;
 
@@ -767,7 +728,6 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static int gt_reset(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
 	int err;
 
 	if (xe_device_wedged(gt_to_xe(gt)))
@@ -788,29 +748,24 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
-		goto err_out;
-	}
-
-	xe_uc_gucrc_disable(&gt->uc);
-	xe_uc_stop_prepare(&gt->uc);
-	xe_gt_pagefault_reset(gt);
+	scoped_cond_guard(xe_force_wake_get, err = -ETIMEDOUT; goto err_out, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
+		xe_uc_gucrc_disable(&gt->uc);
+		xe_uc_stop_prepare(&gt->uc);
+		xe_gt_pagefault_reset(gt);
 
-	xe_uc_stop(&gt->uc);
+		xe_uc_stop(&gt->uc);
 
-	xe_gt_tlb_invalidation_reset(gt);
+		xe_gt_tlb_invalidation_reset(gt);
 
-	err = do_gt_reset(gt);
-	if (err)
-		goto err_out;
+		err = do_gt_reset(gt);
+		if (err)
+			goto err_out;
 
-	err = do_gt_restart(gt);
-	if (err)
-		goto err_out;
+		err = do_gt_restart(gt);
+		if (err)
+			goto err_out;
+	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
@@ -818,7 +773,6 @@ static int gt_reset(struct xe_gt *gt)
 	return 0;
 
 err_out:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
@@ -850,44 +804,32 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	guard(xe_force_wake)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	xe_uc_stop_prepare(&gt->uc);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-	int err;
+	int err = -ETIMEDOUT;
 
 	xe_gt_dbg(gt, "suspending\n");
 	xe_gt_sanitize(gt);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_msg;
-
-	err = xe_uc_suspend(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	xe_gt_idle_disable_pg(gt);
+	scoped_cond_guard(xe_force_wake_get, goto err_msg, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
+		err = xe_uc_suspend(&gt->uc);
+		if (err)
+			goto err_msg;
 
-	xe_gt_disable_host_l2_vram(gt);
+		xe_gt_idle_disable_pg(gt);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_gt_disable_host_l2_vram(gt);
+	}
 	xe_gt_dbg(gt, "suspended\n");
 
 	return 0;
 
 err_msg:
-	err = -ETIMEDOUT;
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -895,11 +837,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 void xe_gt_shutdown(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	guard(xe_force_wake)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	do_gt_reset(gt);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -924,29 +863,22 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-	int err;
+	int err = -ETIMEDOUT;
 
 	xe_gt_dbg(gt, "resuming\n");
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_msg;
-
-	err = do_gt_restart(gt);
-	if (err)
-		goto err_force_wake;
+	scoped_cond_guard(xe_force_wake_get, goto err_msg, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
+		err = do_gt_restart(gt);
+		if (err)
+			goto err_msg;
 
-	xe_gt_idle_enable_pg(gt);
+		xe_gt_idle_enable_pg(gt);
+	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
 	return 0;
 
 err_msg:
-	err = -ETIMEDOUT;
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.47.1

