Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5E17BB6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191372; cv=pass; b=DY1ySk6O208dvUqJR8nKddHQrFrOla/CI+TeSXQ+q0varAWXuZo9aVyZdAdknodxY/blVFA1wAwzLEKV0fJ1ceX4kvEKjxAhUUP939m5GUftdCidI5SrGYXxdhLLAYTf4CBrsqapvxMTbO3BoE0h4qjsGxynBKvwoYplxMdRuSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191372; c=relaxed/simple;
	bh=CszofFvdDhCnLlEUUIUExSSvk5iBMbeWzjquN8A0IfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D5FJnZmbn/c87tcrev+C25/OrxgSoQFnRY4yJ5Dej3VbUk06+6X40BES68AMdB+BrhuNtAqYbf4cEj/SVxW0pB8dGdhfH9MD3igpOz8mFdz+enDejjbJtozjfxEy+wMTAO7SNbd+6Ynb9P0ic9NqrJ3+kuAw+eQZeS5/pwFCf9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ct/bFj+E; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ct/bFj+E"
ARC-Seal: i=1; a=rsa-sha256; t=1739191341; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JOHYl2wnY8YOmNPIwyF3HL6wRiLmx6xcDWtT9oxNu6ht4c4nbbeoPr7cDQZxmglNDPuNXngjWQyb8RpE8Jccx8APnPnyQzHwpadHlHADUXjzb5rFiXP74/RLSlAp/GnWFSl4uMA9EAiO9tbvv7HzECN47bgsEOWY9hPiX9Kn9Ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739191341; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EEk9G+Ux1ply8jWO7j616jY5pUhVWV7F4NM9VKJqnxw=; 
	b=hCajw5erq3RA8BBGeCdb33XT+q7rHwUh/ymKhH7smwrUQms2kNvqgTUoQ+9YqB4bgFEny3iEwDudC91RCUJuiQvRX5MtXqp97jYqqZ+MUVDdvwAdUZwa5hYhBWS4To3A2/HFOEkcvdliy4plAVu+Y+M+CYqmGlBtNcBk+fA9dKM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739191341;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EEk9G+Ux1ply8jWO7j616jY5pUhVWV7F4NM9VKJqnxw=;
	b=ct/bFj+EAJNSN7udS/JNb4eb/UTPMFLyxe+l1nRsE/R+Lt2MHQeN8CPBzT9+lSRZ
	uTJ18DC0BQUQBXZHuVvJLXUBAp+P07wZzVnanhRurD8cGHot7hz0Cgde6lb8Y+8L2ca
	OVJUrHf7IJ6ODPcUMIV0RMIGEed7ZGIN+W/HPoVk=
Received: by mx.zohomail.com with SMTPS id 173919133701111.912604503558896;
	Mon, 10 Feb 2025 04:42:17 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in fdinfo path
Date: Mon, 10 Feb 2025 12:41:59 +0000
Message-ID: <20250210124203.124191-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Panthor's fdinfo handler is routed through the /proc file system, which
executes in an atomic context. That means we cannot use mutexes because
they might sleep.

This bug was uncovered by enabling some of the kernel's mutex-debugging
features:

CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_MUTEXES=y

Replace Panthor's group fdinfo data mutex with a guarded spinlock.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
---
 drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0b93bf83a9b2..7a267d1efeb6 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -9,6 +9,7 @@
 #include <drm/panthor_drm.h>
 
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -631,10 +632,10 @@ struct panthor_group {
 		struct panthor_gpu_usage data;
 
 		/**
-		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
-		 * and job post-completion processing function
+		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's fdinfo
+		 * callback and job post-completion processing function
 		 */
-		struct mutex lock;
+		spinlock_t lock;
 
 		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by the group. */
 		size_t kbo_sizes;
@@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *work)
 						   release_work);
 	u32 i;
 
-	mutex_destroy(&group->fdinfo.lock);
-
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
@@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_job *job)
 	struct panthor_job_profiling_data *slots = queue->profiling.slots->kmap;
 	struct panthor_job_profiling_data *data = &slots[job->profiling.slot];
 
-	mutex_lock(&group->fdinfo.lock);
-	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
-		fdinfo->cycles += data->cycles.after - data->cycles.before;
-	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
-		fdinfo->time += data->time.after - data->time.before;
-	mutex_unlock(&group->fdinfo.lock);
+	scoped_guard(spinlock, &group->fdinfo.lock) {
+		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
+			fdinfo->cycles += data->cycles.after - data->cycles.before;
+		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
+			fdinfo->time += data->time.after - data->time.before;
+	}
 }
 
 void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
@@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
 
 	xa_lock(&gpool->xa);
 	xa_for_each(&gpool->xa, i, group) {
-		mutex_lock(&group->fdinfo.lock);
+		guard(spinlock)(&group->fdinfo.lock);
 		pfile->stats.cycles += group->fdinfo.data.cycles;
 		pfile->stats.time += group->fdinfo.data.time;
 		group->fdinfo.data.cycles = 0;
 		group->fdinfo.data.time = 0;
-		mutex_unlock(&group->fdinfo.lock);
 	}
 	xa_unlock(&gpool->xa);
 }
@@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	mutex_unlock(&sched->reset.lock);
 
 	add_group_kbo_sizes(group->ptdev, group);
-	mutex_init(&group->fdinfo.lock);
+	spin_lock_init(&group->fdinfo.lock);
 
 	return gid;
 

base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5
-- 
2.47.1

