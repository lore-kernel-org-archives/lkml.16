Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902B2E40E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130925; cv=none; b=p++8o7fv1R4tXvJBXq6J5jZ/EV1A8I1+7X33Q+U3DllAOToN3J+g5g2/JoYl2T3gHDKXqjwI4oGPP0G97vmSzwFzfcH5ggGl4HMHuZ74BPqLelZ5le5FgViZzvvO1ZExqnDdDfqtPVYQdbE7y7mcaT7uTvV/PUfefqAX+aWFwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130925; c=relaxed/simple;
	bh=lt6o7mkDjM58FakjB+UBC9SumylOoEOwLruolzNrPzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rse52SC8og/uSeXcuwZOnl8ocSxKTxbNxl5+VFg6lUvAW+Cer4VCYgTxO/cNHu5LOeHUv+et7lswiOImCKdsasLHsk8OXZ2UDe0d7iSifDZBpItKI8P6MU5KpubdKBf3hwMViD81JNqWNh/yAqKb3JetB1vm5kGbdv6M6aBGLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzHfgeCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzHfgeCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30082C4CEE7;
	Thu,  5 Jun 2025 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749130925;
	bh=lt6o7mkDjM58FakjB+UBC9SumylOoEOwLruolzNrPzE=;
	h=From:To:Cc:Subject:Date:From;
	b=hzHfgeCLqN+g0oj6cJl31C3OqcR4vPnASnvER5Kbck2E+a5FgRGxwBBJJxaEzv/hF
	 vhsBd+j1Dma5w3z1GHEKh1Rl49TZA3UZ5iW4Sf7RmohSbdRCndMaBNGVf3PHlHX1WB
	 T/Bk4mNa45jsssvfuyHbth/pQPtc9+cKhPyvd+n24W1UPjW3MDe0eAT+skraxp/rq5
	 uv54ttx2OLN/v4i1kHXtnwU40VOjYUxUUrd8b3Mhyus0tOa+u3d5wmKpcIOnaGKADg
	 v2+PIQX8RphAGD8fMBWlofClWH0RKbrqQG1YQwm2EATDMQ3kRu3E1WckSAbqV0oXgl
	 INRvMejdHdD/g==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched/tests: Make timedout_job callback a better role model
Date: Thu,  5 Jun 2025 15:41:55 +0200
Message-ID: <20250605134154.191764-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the drm_mock_scheduler does not have real users in userspace, nor
does it have real hardware or firmware rings, it's not necessary to
signal timedout fences nor free jobs - from a functional standpoint.

The unit tests, however, serve as a reference implementation and a first
example for new scheduler users. Therefore, they should approximate the
canonical usage as much as possible.

Make sure timed out hardware fences get signaled with the appropriate
error code.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 7f947ab9d322..49d067fecd67 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -200,12 +200,36 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
 	return &job->hw_fence;
 }
 
+/*
+ * Normally, drivers would take appropriate measures in this callback, such as
+ * killing the entity the faulty job is associated with, resetting the hardware
+ * and / or resubmitting non-faulty jobs.
+ *
+ * For the mock scheduler, there are no hardware rings to be resetted nor jobs
+ * to be resubmitted. Thus, this function merely ensures that
+ *   a) timedout fences get signaled properly and removed from the pending list
+ *   b) the mock scheduler framework gets informed about the timeout via a flag
+ *   c) The drm_sched_job, not longer needed, gets freed
+ */
 static enum drm_gpu_sched_stat
 mock_sched_timedout_job(struct drm_sched_job *sched_job)
 {
+	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(sched_job->sched);
 	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
+	unsigned long flags;
 
-	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
+	spin_lock_irqsave(&sched->lock, flags);
+	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+		list_del(&job->link);
+		job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
+		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
+		dma_fence_signal_locked(&job->hw_fence);
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	dma_fence_put(&job->hw_fence);
+	drm_sched_job_cleanup(sched_job);
+	/* Mock job itself is freed by the kunit framework. */
 
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
-- 
2.49.0

