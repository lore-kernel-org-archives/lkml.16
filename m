Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD399F510
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488582; cv=none; b=FZTl4EmNhzXhsRo9AZu4L6E4EkTSiGEFVXYMawYIXgbcjxOv46Us50t0iKXKQiT6Vom1nRG7JyOFLw2rFrML6c0J3TPSiT2puaSsVohmKYdSHRx5fUS0QkYi+AG443MmiHj5QQsg4zynXWqlGXfL1cDnNF/lh3iYgbX00if1B4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488582; c=relaxed/simple;
	bh=uDucjiIXIOMk0SOi1/h4I9CU9DMx2BoeK9EwYcIl2RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cv/WnQKbGiW1bUwDgo/Mwp7v/pCftVrEZurgXBu79e2Z1Jp4bWpHiYmFE/cmdgNz2te64AvbJJtnasD+JuX+iROHvgPOX4LZ3gW7N9AkVK4CYHVnPVb4u5h4EYU8YZJcLxMzNIC7B9nREcwelQRkRuJDQ9lC6WE4jWNqKrXnYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DN2jpb84; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DN2jpb84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064FEC4CEE3;
	Thu, 24 Apr 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488582;
	bh=uDucjiIXIOMk0SOi1/h4I9CU9DMx2BoeK9EwYcIl2RM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DN2jpb848NX1mc1DlP4cENi4/aCFYjMEzfMDn1yADdNEPdNZzIl0ydEC44VOiWyt3
	 UprMnYdrorHMepPujLGTXPkhYBIebs8nqrZ1hQ5rzd1H2iFQyFn3+57vVCYScj3tDF
	 FsgpPKWd449+d4YAmDZOZNkJ//6C+OtXZL/ILWxk6DbSh4BBywxLWD6NyehM+Ou6X7
	 f9R0/bfaY/DRvdVsIJX1NSl3q4XscsN1OCsVew8bTL3Q51+wxDOzPaUCM6jM26bxCT
	 5Aa35NnVmwb1tXE4Di/viPPHiPIOAbRxDjJFV5YCNySdhrJvMJtcm33VqB4sB1IVZB
	 0l6N+Dgf5LDCA==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
Date: Thu, 24 Apr 2025 11:55:36 +0200
Message-ID: <20250424095535.26119-8-phasta@kernel.org>
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

The unit tests so far took care manually of avoiding memory leaks that
might have occurred when calling drm_sched_fini().

The scheduler now takes care by itself of avoiding memory leaks if the
driver provides the callback drm_sched_backend_ops.kill_fence_context().

Implement that callback for the unit tests. Remove the manual cleanup
code.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7..a72d26ca8262 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -228,10 +228,30 @@ static void mock_sched_free_job(struct drm_sched_job *sched_job)
 	/* Mock job itself is freed by the kunit framework. */
 }
 
+static void mock_sched_fence_context_kill(struct drm_gpu_scheduler *gpu_sched)
+{
+	struct drm_mock_scheduler *sched = drm_sched_to_mock_sched(gpu_sched);
+	struct drm_mock_sched_job *job;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched->lock, flags);
+	list_for_each_entry(job, &sched->job_list, link) {
+		spin_lock(&job->lock);
+		if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
+			dma_fence_set_error(&job->hw_fence, -ECANCELED);
+			dma_fence_signal_locked(&job->hw_fence);
+		}
+		complete(&job->done);
+		spin_unlock(&job->lock);
+	}
+	spin_unlock_irqrestore(&sched->lock, flags);
+}
+
 static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
 	.run_job = mock_sched_run_job,
 	.timedout_job = mock_sched_timedout_job,
-	.free_job = mock_sched_free_job
+	.free_job = mock_sched_free_job,
+	.kill_fence_context = mock_sched_fence_context_kill,
 };
 
 /**
@@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 		drm_mock_sched_job_complete(job);
 	spin_unlock_irqrestore(&sched->lock, flags);
 
-	/*
-	 * Free completed jobs and jobs not yet processed by the DRM scheduler
-	 * free worker.
-	 */
-	spin_lock_irqsave(&sched->lock, flags);
-	list_for_each_entry_safe(job, next, &sched->done_list, link)
-		list_move_tail(&job->link, &list);
-	spin_unlock_irqrestore(&sched->lock, flags);
-
-	list_for_each_entry_safe(job, next, &list, link)
-		mock_sched_free_job(&job->base);
-
 	drm_sched_fini(&sched->base);
 }
 
-- 
2.48.1

