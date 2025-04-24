Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3721FF45
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488567; cv=none; b=tPPEIakGv/UABwodMTju3/rkjttKzTxUBq4NAZs/yoPOuMiLbwDPSc9Waa6yUrGBlO+/cXarhpIKkz6AJPl2KBWrzWUOrTSGcoNsNjR5NP6EOMtXloqSE9ST+Hh/CwkwP5S5V0r5PFRy/ygzDyLXuLWKuvJ0zHeScsyDQGGPgxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488567; c=relaxed/simple;
	bh=riFR0MXBDay78EEbu4sXTWErrIzJCWihr4JqE0kKrtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/Mv7kwFPXFbWSdqtgv4hXsa+GO1f9u2wDLEGskhNOuxIgud+EoVFJ1bHdC4V+/pMjmG2FZRW11tI/9bVKvCgzXC0OZ5t1Shmkl8jn6xAJlXebiuxU96YrFhFqK8i9xcDQUCceSlXxkGvDEv8J2DknQKNltjm2brvyhU3YiEz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFiHTdhr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFiHTdhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29C5C4CEEC;
	Thu, 24 Apr 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488567;
	bh=riFR0MXBDay78EEbu4sXTWErrIzJCWihr4JqE0kKrtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFiHTdhrmgSaHGJOrJQT80r7WMLWqPcvQQ0mwqGv7Ns0y5S4Hnggyr1owPS43ONpo
	 IgyPpOEH7wPLsPMqGXBClKMo/HjXD3sLXPGvQ3cH+jqBC6abqfAI6tSeaADz485uXT
	 GRxk0HGSGfLsvUW4rHvdbHyhIPbTFMx38T6KO5gQ+3l/cOXtoDznly0pQqQeJsb5Qd
	 sbDDWDQxveQ9xCfUdwqNmS+ZwK+msWe7d1FJluh8OVbKPhyojhWiom9+vczmpGkLf2
	 SL68wk2O0FbMi60Hx/5F6pJQiFAopwo1WkPb/7AUGy6VRr6dorJU+pHO8MdGUx2MT+
	 MziqZiVrztqRg==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking too long
Date: Thu, 24 Apr 2025 11:55:32 +0200
Message-ID: <20250424095535.26119-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424095535.26119-2-phasta@kernel.org>
References: <20250424095535.26119-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The waitqueue that ensures that drm_sched_fini() blocks until the
pending_list has become empty could theoretically cause that function to
block for a very long time. That, ultimately, could block userspace
procesess and prevent them from being killable through SIGKILL.

When a driver calls drm_sched_fini(), it is safe to assume that all
still pending jobs are not needed anymore anyways. Thus, they can be
cancelled and thereby it can be ensured that drm_sched_fini() will
return relatively quickly.

Implement a new helper to stop all work items / submission except for
the drm_sched_backend_ops.run_job().

Implement a driver callback, kill_fence_context(), that instructs the
driver to kill the fence context associated with this scheduler, thereby
causing all pending hardware fences to be signalled.

Call those new routines in drm_sched_fini() and ensure backwards
compatibility if the new callback is not implemented.

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 47 +++++++++++++++++---------
 include/drm/gpu_scheduler.h            | 11 ++++++
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ea82e69a72a8..c2ad6c70bfb6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1390,31 +1390,46 @@ drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
 	return empty;
 }
 
+/**
+ * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending jobs
+ * @sched: scheduler instance
+ *
+ * Must only be called if &struct drm_sched_backend_ops.kill_fence_context is
+ * implemented.
+ *
+ * Instructs the driver to kill the fence context associated with this scheduler,
+ * thereby signalling all pending fences. This, in turn, will trigger
+ * &struct drm_sched_backend_ops.free_job to be called for all pending jobs.
+ * The function then blocks until all pending jobs have been freed.
+ */
+static inline void
+drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
+{
+	sched->ops->kill_fence_context(sched);
+	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
+}
+
 /**
  * drm_sched_fini - Destroy a gpu scheduler
  *
  * @sched: scheduler instance
  *
- * Tears down and cleans up the scheduler.
- *
- * Note that this function blocks until all the fences returned by
- * &struct drm_sched_backend_ops.run_job have been signalled.
+ * Tears down and cleans up the scheduler. Might leak memory if
+ * &struct drm_sched_backend_ops.kill_fence_context is not implemented.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	/*
-	 * Jobs that have neither been scheduled or which have timed out are
-	 * gone by now, but jobs that have been submitted through
-	 * backend_ops.run_job() and have not yet terminated are still pending.
-	 *
-	 * Wait for the pending_list to become empty to avoid leaking those jobs.
-	 */
-	drm_sched_submission_and_timeout_stop(sched);
-	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
-	drm_sched_free_stop(sched);
+	if (sched->ops->kill_fence_context) {
+		drm_sched_submission_and_timeout_stop(sched);
+		drm_sched_cancel_jobs_and_wait(sched);
+		drm_sched_free_stop(sched);
+	} else {
+		/* We're in "legacy free-mode" and ignore potential mem leaks */
+		drm_sched_wqueue_stop(sched);
+	}
 
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
@@ -1502,7 +1517,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_wqueue_ready);
 
 /**
- * drm_sched_wqueue_stop - stop scheduler submission
+ * drm_sched_wqueue_stop - stop scheduler submission and freeing
  * @sched: scheduler instance
  *
  * Stops the scheduler from pulling new jobs from entities. It also stops
@@ -1518,7 +1533,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
 /**
- * drm_sched_wqueue_start - start scheduler submission
+ * drm_sched_wqueue_start - start scheduler submission and freeing
  * @sched: scheduler instance
  *
  * Restarts the scheduler after drm_sched_wqueue_stop() has stopped it.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d0b1f416b4d9..8630b4a26f10 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -509,6 +509,17 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @kill_fence_context: kill the fence context belonging to this scheduler
+	 *
+	 * Needed to cleanly tear the scheduler down in drm_sched_fini(). This
+	 * callback will cause all hardware fences to be signalled by the driver,
+	 * which, ultimately, ensures that all jobs get freed before teardown.
+	 *
+	 * This callback is optional, but it is highly recommended to implement it.
+	 */
+	void (*kill_fence_context)(struct drm_gpu_scheduler *sched);
 };
 
 /**
-- 
2.48.1

