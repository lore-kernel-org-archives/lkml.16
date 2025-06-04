Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69224503B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025048; cv=none; b=fmshQulxz4z2Trn1tlzbCZwlI6JdYPnvo9TVN4GJxUwqAnbmTKHlux9uPCM3q9kFDKRCPn8NFBc/8r+rauzHeJtFo4vMKw2emx1wbG9DAYO5TRGa9oGSMVKsgb+eYORiXhGqXrgxB3r74dxPLgk0FV6c7cPkzgsZtabc/zBN1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025048; c=relaxed/simple;
	bh=YDCdNCq/TneswErY2hRIPvI7RQchpXi4ApeIkedwm7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TN7o0SwD044YbHow9HH4xx5TpvS7/9wXPptpcdf/lTHyBNhpi3EFMDdK2FMa0dMAIEJhYF/7uNnr7cqQZnUvAuiDGMJRn3zYBMAB8jX8BJUxh1ahO51vHavCWldN2YSMedI1nNCWOtxZZ/h3XZnKcwJyUoQxx7xXdlcXARUqMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB9MnhzI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB9MnhzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8B5C4CEE7;
	Wed,  4 Jun 2025 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749025047;
	bh=YDCdNCq/TneswErY2hRIPvI7RQchpXi4ApeIkedwm7w=;
	h=From:To:Cc:Subject:Date:From;
	b=OB9MnhzI9mDaHg5mLkDiG+ZcoGfgLnHG2NLW0ZRsgjxQjjDid/Ii1eMT3mFQP1rKU
	 3lxmJ0S19b69MqqFS9mNnBf36EOKYDn6WoVGChgvm2DpXP6xZgc4iCYn5VgDxs0sc2
	 ayYnmlGsDD2a/5PLUaHyC3n5rg828d4DRhBcCMUbI/6fSHjM/CIwg578McpdpB8/6t
	 TYcZwCTzhTBMNE050c29nwPKuVadB57eSbxQbJ4z7W3kdE9EDxBrhB/NEmRt/OE6nQ
	 AxEqr/P2ZJJn8IVikpikHEibpjpwSmslUQlCTO/WKAdng5KkFh5BnOnN3kIFIAGpN1
	 lkeZLhw8Ct5yA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Discourage usage of separate workqueues
Date: Wed,  4 Jun 2025 10:16:58 +0200
Message-ID: <20250604081657.124453-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct drm_sched_init_args provides the possibility of letting the
scheduler use user-controlled workqueues, instead of the scheduler
creating its own workqueues. It's currently not documented who would
want to use that.

Not sharing the submit_wq between driver and scheduler has the advantage
of no negative intereference between them being able to occur (e.g.,
MMU notifier callbacks waiting for fences to get signaled). A separate
timeout_wq should rarely be necessary, since using the system_wq could,
in the worst case, delay a timeout.

Discourage the usage of own workqueues in the documentation.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 81dcbfc8c223..11740d745223 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
  *
  * @ops: backend operations provided by the driver
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
- *	       allocated and used.
+ *	       allocated and used. It is recommended to pass NULL unless there
+ *	       is a good reason not to.
  * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
  *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
  * @timeout: timeout value in jiffies for submitted jobs.
- * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
+ * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
+ *		used. It is recommended to pass NULL unless there is a good
+ *		reason not to.
  * @score: score atomic shared with other schedulers. May be NULL.
  * @name: name (typically the driver's name). Used for debugging
  * @dev: associated device. Used for debugging
-- 
2.49.0

