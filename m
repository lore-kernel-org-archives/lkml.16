Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433DE17BB6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191364; cv=pass; b=t2eH+Bwo0EbpsABn2QTZzCRlvF50tbtOQkHkMqPRkqa8TBmLdvf/CTVx5KRnbv1pNGcEE4L1sR8C2GFow4rGyTJINv+OTjG/r+CbBIXUeiUDjgyTzGQec0vbgjZdykchoU9WhHN63L9a7EPa/Ml24gKBWhVsUaRqNo93/YhNp5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191364; c=relaxed/simple;
	bh=BaJytQ25bD+G6QpYYu0w9bTeW36fIZjQNJbYMTJJP8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VP4bsYrjypHb1t5Wqkb5hhQYFmz2sNwN56tbVWYr9ZRFSVl1t9+mdNFonsPzol5TnQOCxDSpJAnQ77IBn2gOq0Ba0DKti8m3Zqaeg84LavmEpp6bau5bXp2gX7fcj4tSa2oVYF3QuGQVq32rJT74n7/35PM9Ubzni+Fj/goQejA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=DRD99SkC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DRD99SkC"
ARC-Seal: i=1; a=rsa-sha256; t=1739191341; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ed4tuey33/bHRe/KBN8oPPx1u0N6hi1NUxkqykgAGqCIB0Sa2dDXMdE7XHvqL5BCmrvzkym5Ajt1rq7kfILelMWOA61WxkrkzImwi3JWqZGQQlaE8ria60vv7rtQXQTsjnnWsRkCymkaBIFMV9ROo2gYKw7ny1gHIamrXTOUGCI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739191341; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GEa6/ehI6Kki5Q1uEXHHqiSFoK4yFTn9yLrttoslzJs=; 
	b=UlRfEPhbPsFhpJnvaJ49PrsxMPi+jXLiLJbWOj6pkJ7R03axqPG3gJsqVqUmsQuHeUyk2DrsJ7DyXBJM2IDH6KHi0rrZLHCb4MioxEzjI+7ygDW45dIR5YkTxmmWvuCPYWlcxExga7tp5Ef0NQ9Ic+yB4U60h8n9PJfI37xdR9c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739191341;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GEa6/ehI6Kki5Q1uEXHHqiSFoK4yFTn9yLrttoslzJs=;
	b=DRD99SkCj+Oke16R4yS2hjBSxTDFwAFLsDVeQe4fIhC6Dskkvc6HXAFD7L6r2UB6
	XEuF2z3Rx0Z9bT/WSKBlkrEhtRH9HEQyAX2Os/vd/r2YHhO5Qyc2IGiof+duoGIC0uq
	U4aOF7D1UUmlNWILj9gZF/AOl+gIqDlD/OSUYCRk=
Received: by mx.zohomail.com with SMTPS id 173919134001291.87719860971902;
	Mon, 10 Feb 2025 04:42:20 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Mihail Atanassov <mihail.atanassov@arm.com>
Cc: kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panthor: Avoid sleep locking in the internal BO size path
Date: Mon, 10 Feb 2025 12:42:00 +0000
Message-ID: <20250210124203.124191-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210124203.124191-1-adrian.larumbe@collabora.com>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A previous commit dealt with a similar situation, whereby upon enabling
some mutex debug features, a warning about sleep muteces being used in a
/proc file read atomic context was being triggered.

Because in this case replacing the heap mutex with a spinlock isn't
feasible, the fdinfo handler no longer traverses the list of heaps for
every single VM associated with an open DRM file. Instad, when a new heap
chunk is allocated, its size is accumulated into a VM-wide tally, which
also makes the atomic context code path somewhat faster.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: 3e2c8c718567 ("drm/panthor: Expose size of driver internal BO's over fdinfo")
---
 drivers/gpu/drm/panthor/panthor_heap.c | 38 ++++++++------------------
 drivers/gpu/drm/panthor/panthor_heap.h |  2 --
 drivers/gpu/drm/panthor/panthor_mmu.c  | 18 +++++++-----
 drivers/gpu/drm/panthor/panthor_mmu.h  |  1 +
 4 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index db0285ce5812..686f209f5b09 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -127,6 +127,8 @@ static void panthor_free_heap_chunk(struct panthor_vm *vm,
 	heap->chunk_count--;
 	mutex_unlock(&heap->lock);
 
+	panthor_vm_heaps_accumulate(vm, -heap->chunk_size);
+
 	panthor_kernel_bo_destroy(chunk->bo);
 	kfree(chunk);
 }
@@ -180,6 +182,8 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	heap->chunk_count++;
 	mutex_unlock(&heap->lock);
 
+	panthor_vm_heaps_accumulate(vm, heap->chunk_size);
+
 	return 0;
 
 err_destroy_bo:
@@ -389,6 +393,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 			removed = chunk;
 			list_del(&chunk->node);
 			heap->chunk_count--;
+			panthor_vm_heaps_accumulate(chunk->bo->vm, -heap->chunk_size);
 			break;
 		}
 	}
@@ -560,6 +565,8 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
 	if (ret)
 		goto err_destroy_pool;
 
+	panthor_vm_heaps_accumulate(vm, pool->gpu_contexts->obj->size);
+
 	return pool;
 
 err_destroy_pool:
@@ -594,8 +601,11 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 	xa_for_each(&pool->xa, i, heap)
 		drm_WARN_ON(&pool->ptdev->base, panthor_heap_destroy_locked(pool, i));
 
-	if (!IS_ERR_OR_NULL(pool->gpu_contexts))
+	if (!IS_ERR_OR_NULL(pool->gpu_contexts)) {
+		panthor_vm_heaps_accumulate(pool->gpu_contexts->vm,
+					    -pool->gpu_contexts->obj->size);
 		panthor_kernel_bo_destroy(pool->gpu_contexts);
+	}
 
 	/* Reflects the fact the pool has been destroyed. */
 	pool->vm = NULL;
@@ -603,29 +613,3 @@ void panthor_heap_pool_destroy(struct panthor_heap_pool *pool)
 
 	panthor_heap_pool_put(pool);
 }
-
-/**
- * panthor_heap_pool_size() - Calculate size of all chunks across all heaps in a pool
- * @pool: Pool whose total chunk size to calculate.
- *
- * This function adds the size of all heap chunks across all heaps in the
- * argument pool. It also adds the size of the gpu contexts kernel bo.
- * It is meant to be used by fdinfo for displaying the size of internal
- * driver BO's that aren't exposed to userspace through a GEM handle.
- *
- */
-size_t panthor_heap_pool_size(struct panthor_heap_pool *pool)
-{
-	struct panthor_heap *heap;
-	unsigned long i;
-	size_t size = 0;
-
-	down_read(&pool->lock);
-	xa_for_each(&pool->xa, i, heap)
-		size += heap->chunk_size * heap->chunk_count;
-	up_read(&pool->lock);
-
-	size += pool->gpu_contexts->obj->size;
-
-	return size;
-}
diff --git a/drivers/gpu/drm/panthor/panthor_heap.h b/drivers/gpu/drm/panthor/panthor_heap.h
index e3358d4e8edb..25a5f2bba445 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.h
+++ b/drivers/gpu/drm/panthor/panthor_heap.h
@@ -27,8 +27,6 @@ struct panthor_heap_pool *
 panthor_heap_pool_get(struct panthor_heap_pool *pool);
 void panthor_heap_pool_put(struct panthor_heap_pool *pool);
 
-size_t panthor_heap_pool_size(struct panthor_heap_pool *pool);
-
 int panthor_heap_grow(struct panthor_heap_pool *pool,
 		      u64 heap_gpu_va,
 		      u32 renderpasses_in_flight,
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 0a4e352b5505..aaad1a560805 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -345,6 +345,10 @@ struct panthor_vm {
 
 		/** @heaps.lock: Lock used to protect access to @pool. */
 		struct mutex lock;
+
+		/** @heaps.size: Size of all chunks across all heaps in the pool. */
+		ssize_t size;
+
 	} heaps;
 
 	/** @node: Used to insert the VM in the panthor_mmu::vm::list. */
@@ -1539,6 +1543,7 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
 	mutex_lock(&vm->heaps.lock);
 	panthor_heap_pool_destroy(vm->heaps.pool);
 	vm->heaps.pool = NULL;
+	vm->heaps.size = 0;
 	mutex_unlock(&vm->heaps.lock);
 
 	drm_WARN_ON(&vm->ptdev->base,
@@ -1963,13 +1968,7 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
 
 	xa_lock(&pfile->vms->xa);
 	xa_for_each(&pfile->vms->xa, i, vm) {
-		size_t size = 0;
-
-		mutex_lock(&vm->heaps.lock);
-		if (vm->heaps.pool)
-			size = panthor_heap_pool_size(vm->heaps.pool);
-		mutex_unlock(&vm->heaps.lock);
-
+		size_t size = vm->heaps.size;
 		stats->resident += size;
 		if (vm->as.id >= 0)
 			stats->active += size;
@@ -1977,6 +1976,11 @@ void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats
 	xa_unlock(&pfile->vms->xa);
 }
 
+void panthor_vm_heaps_accumulate(struct panthor_vm *vm, ssize_t acc)
+{
+	vm->heaps.size += acc;
+}
+
 static u64 mair_to_memattr(u64 mair, bool coherent)
 {
 	u64 memattr = 0;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index fc274637114e..b6686896f8ef 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -39,6 +39,7 @@ struct panthor_heap_pool *
 panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
 
 void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats);
+void panthor_vm_heaps_accumulate(struct panthor_vm *vm, ssize_t acc);
 
 struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
 void panthor_vm_put(struct panthor_vm *vm);
-- 
2.47.1

