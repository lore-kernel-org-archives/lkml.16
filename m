Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063220F074
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673332; cv=none; b=BMqmJO2Q5oLD+zPFSM4lsiswKWfLGSzjZx9Q63+BUM7nIPhPjkfSlFFT1sy97wSCRE1Ww7MoXTXc7AnN87KIhFY6AMnojUSUsra36BgLLEUkhU9c3kfx8aZtN9v+FIg+98LWzUDJRTx2JFC8InSwRisY2sd3PMvB/RDBOA1NxlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673332; c=relaxed/simple;
	bh=4xL/mGmEdKri6EjjlhjH5p2ebNEKbItXamDkQYFeJe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuL+yEvbbv1j3/p0Pv0yQobvBa57Gj8Mmz79DmD6P6ValrtME1IspaykFCoUwMgUFWf6BxQXDBUdIbkusXxKwRfGqwSIn9iTYnAhDq5bP0xuV2D/JxbZORcO9cWmWoJLgZRLp6Fph4tomQFZMAYVD7inzAbeVnQEkjaRAPwiabY=
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
Subject: [PATCH 5/8] drm/xe/coredump: Use guard helpers for xe_force_wake.
Date: Tue,  4 Feb 2025 13:49:06 +0100
Message-ID: <20250204124909.158315-6-dev@lankhorst.se>
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

---
 drivers/gpu/drm/xe/xe_devcoredump.c | 36 ++++++++++++++---------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 39fe485d20858..afe229fba8a9c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -233,7 +233,6 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
 	struct xe_device *xe = coredump_to_xe(coredump);
-	unsigned int fw_ref;
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
@@ -247,12 +246,13 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_pm_runtime_get(xe);
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+	scoped_guard(xe_force_wake, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
+		if (!xe_force_wake_scope_has_domain(XE_FORCEWAKE_ALL))
+			xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+
+		xe_vm_snapshot_capture_delayed(ss->vm);
+		xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	}
 
 	xe_pm_runtime_put(xe);
 
@@ -277,7 +277,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
 
-	unsigned int fw_ref;
 	bool cookie;
 	int i;
 
@@ -305,20 +304,19 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	}
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
-
-	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
-	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
-	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
-	if (job)
-		ss->job = xe_sched_job_snapshot_capture(job);
-	ss->vm = xe_vm_snapshot_capture(q->vm);
-
-	xe_engine_snapshot_capture_for_queue(q);
+	scoped_guard(xe_force_wake, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
+		ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+		ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
+		ss->ge = xe_guc_exec_queue_snapshot_capture(q);
+		if (job)
+			ss->job = xe_sched_job_snapshot_capture(job);
+		ss->vm = xe_vm_snapshot_capture(q->vm);
+
+		xe_engine_snapshot_capture_for_queue(q);
+	}
 
 	queue_work(system_unbound_wq, &ss->work);
 
-	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
 }
 
-- 
2.47.1

