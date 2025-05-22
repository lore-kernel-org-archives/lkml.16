Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BA26AAB8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902498; cv=none; b=amooJUsbQM+pMYqbflIsORaqxRFvFrog0p/ztnps78It1Mmm+v1rM0D/S2LXr9pgorVQ2H8iBbE/HcJrU2a50nI9FU2WePP6Vtp8eCrdm6nKBkSQF0RWjqrqr+vWxvq5EEo/XmbQdsfiWS6f6vkUDgd1DHpGEiIWim1urbkNHds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902498; c=relaxed/simple;
	bh=oVd9hezeKD9JYZAVRcvRis9wn/HXrxU2i+cl3HLnwy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQg1BEt2gIXVetSHEq0jlZp3R/3t4GGnM6aRY4KS9LWBjJYvu8kQoTmfQZJTRDneWvhcLKb4mI30gz7uspo+Abk7KhNSKANTJUYFGp6pD0Hh0rynlOlydCwxDWrhfUnFl6IyBzH1lBiURNytuDLuS880HxjCkeFKgw5IeN2K/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWEWDjUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWEWDjUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736FDC4CEEF;
	Thu, 22 May 2025 08:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747902496;
	bh=oVd9hezeKD9JYZAVRcvRis9wn/HXrxU2i+cl3HLnwy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UWEWDjUgVvsNwv1iaZoEsyNFeJ5OI03+23IyHcMi76QsHGfCRLS8Qu5Z+vJMUADwg
	 yd4vdTHXD3Z7MVCpBxdB+yAsYM91nrteHEGqthrDg0NscyYLQjOj7q7jWvVlHdYox8
	 TteTSmopgOus7DQbrHANFqTl5uvWKZUShmrFyGXpTaOuDphyg2npXL1SLnZEwgcY4i
	 OgKOro7W+BItzLaSYPUDIqCrevN8GzyHQLabyVCFC8GL8nUVphj4YZRVE+/ukz7fmu
	 fcBZtfekpagqkTnekzhd6igj6mYLcRD0HCO5tpwSCzpaXRVdonKuydAAiA0lttv7i6
	 h55gAqYaVsCJQ==
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
Subject: [PATCH v3 5/5] drm/nouveau: Remove waitque for sched teardown
Date: Thu, 22 May 2025 10:27:43 +0200
Message-ID: <20250522082742.148191-7-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522082742.148191-2-phasta@kernel.org>
References: <20250522082742.148191-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct nouveau_sched contains a waitque needed to prevent
drm_sched_fini() from being called while there are still jobs pending.
Doing so so far would have caused memory leaks.

With the new memleak-free mode of operation switched on in
drm_sched_fini() by providing the callback
nouveau_sched_fence_context_kill() the waitque is not necessary anymore.

Remove the waitque.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 20 +++++++-------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 +++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index de14883ee4c8..1d300b382b32 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -121,11 +121,9 @@ nouveau_job_done(struct nouveau_job *job)
 {
 	struct nouveau_sched *sched = job->sched;
 
-	spin_lock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
 	list_del(&job->entry);
-	spin_unlock(&sched->job.list.lock);
-
-	wake_up(&sched->job.wq);
+	spin_unlock(&sched->job_list.lock);
 }
 
 void
@@ -306,9 +304,9 @@ nouveau_job_submit(struct nouveau_job *job)
 	}
 
 	/* Submit was successful; add the job to the schedulers job list. */
-	spin_lock(&sched->job.list.lock);
-	list_add(&job->entry, &sched->job.list.head);
-	spin_unlock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
+	list_add(&job->entry, &sched->job_list.head);
+	spin_unlock(&sched->job_list.lock);
 
 	drm_sched_job_arm(&job->base);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
@@ -458,9 +456,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		goto fail_sched;
 
 	mutex_init(&sched->mutex);
-	spin_lock_init(&sched->job.list.lock);
-	INIT_LIST_HEAD(&sched->job.list.head);
-	init_waitqueue_head(&sched->job.wq);
+	spin_lock_init(&sched->job_list.lock);
+	INIT_LIST_HEAD(&sched->job_list.head);
 
 	return 0;
 
@@ -503,9 +500,6 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
-	rmb(); /* for list_empty to work without lock */
-	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
-
 	drm_sched_entity_fini(entity);
 	drm_sched_fini(drm_sched);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index e6e2016a3569..339a14563fbb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -105,12 +105,9 @@ struct nouveau_sched {
 	struct nouveau_channel *chan;
 
 	struct {
-		struct {
-			struct list_head head;
-			spinlock_t lock;
-		} list;
-		struct wait_queue_head wq;
-	} job;
+		struct list_head head;
+		spinlock_t lock;
+	} job_list;
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..ddfc46bc1b3e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 	u64 end = addr + range;
 
 again:
-	spin_lock(&sched->job.list.lock);
-	list_for_each_entry(__job, &sched->job.list.head, entry) {
+	spin_lock(&sched->job_list.lock);
+	list_for_each_entry(__job, &sched->job_list.head, entry) {
 		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
 
 		list_for_each_op(op, &bind_job->ops) {
@@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 
 				if (!(end <= op_addr || addr >= op_end)) {
 					nouveau_uvmm_bind_job_get(bind_job);
-					spin_unlock(&sched->job.list.lock);
+					spin_unlock(&sched->job_list.lock);
 					wait_for_completion(&bind_job->complete);
 					nouveau_uvmm_bind_job_put(bind_job);
 					goto again;
@@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 			}
 		}
 	}
-	spin_unlock(&sched->job.list.lock);
+	spin_unlock(&sched->job_list.lock);
 }
 
 static int
-- 
2.49.0

