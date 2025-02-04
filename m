Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11A20CCE1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673865; cv=none; b=hm+emLtO/oDnORTOLo7c/FvuZ6hnb3WRs/M7fO6IdBqpmXuvbfeBP2tlkwkVdasCmlsHetWB2UgTTWvRe2na2Ru88ty4J0EFt1iv3gs1DoRFlaRh8B6wCRRIvqASEufX+VwnM6y0fs/ATwNTh+nCUnppPfuvCTDnlUKBLUn3JFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673865; c=relaxed/simple;
	bh=H3DrQqWNLJegFu3EIWC7xtF68ndxXtxjRLRYiWpbrjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9rI2/j7UEcvkT/hq9c+qIc2HNLdmkSXahCKDkoVknGoJDsWjZaK9btg1qo0PsS+tBklytmBX+ahMlxS2IRrbMlVYaK023jYibMlfRsmW/DXMMo7fE+J/R4F4ZUyxcMM17wx+5C+/o3uuUfSfGGzkU2X1pt4cT6tDCUkzST67CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 2/8] drm/xe/gt: Unify xe_hw_fence_irq_finish() calls.
Date: Tue,  4 Feb 2025 13:49:03 +0100
Message-ID: <20250204124909.158315-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204124909.158315-1-dev@lankhorst.se>
References: <20250204124909.158315-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those calls should be from xe_gt_init, not the diverse amount of places
they are called.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 01a4a852b8f43..943bab94119fa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -408,13 +408,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref) {
-		err = -ETIMEDOUT;
-		goto err_hw_fence_irq;
-	}
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -455,9 +453,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_force_wake:
 	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-err_hw_fence_irq:
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -465,7 +460,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 static int all_fw_domain_init(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
-	int err, i;
+	int err;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
@@ -543,8 +538,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 err_force_wake:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	return err;
 }
@@ -596,35 +589,39 @@ int xe_gt_init(struct xe_gt *gt)
 
 	err = xe_gt_pagefault_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	xe_mocs_init_early(gt);
 
 	err = xe_gt_sysfs_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	err = gt_fw_domain_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	err = xe_gt_idle_init(&gt->gtidle);
 	if (err)
-		return err;
+		goto err;
 
 	err = xe_gt_freq_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = all_fw_domain_init(gt);
 	if (err)
-		return err;
+		goto err;
 
 	xe_gt_record_user_engines(gt);
 
 	return 0;
+err:
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
+		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+	return err;
 }
 
 /**
-- 
2.47.1

