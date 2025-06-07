Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E83B280
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 00:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749257201; cv=none; b=GrzPbtltzb7KeqSK7N7iHovPfKxwEbMNZfzWuQ+C1o/zdrZhsKsjy2FMAET3OsC3k4O1NMBLDUIaLEURuDrxf7hWUGxUgMNxWPOmnH3KEdsHXeDCIXIagDMmidLsSG6gsg7LdFbXTTCFN5haale+y3rDg3JDdhxelXjAaicQ/CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749257201; c=relaxed/simple;
	bh=qboArf7sZklWbWSpPf6bYyLSnRqRIT/bRbACHZ1gZjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rj7tcvEPfo1p5t6MhjKr8hUVIo6kKRru0YxDQG6qAdOr55sybG43zYizMfjMksDz7XcG9fsa2o0gibIbbugPgTDUpjJEDa4KpkyQtJ58T4e5McJ+vkxwtohSNN2IHSN8IrtKQCMLBfy7p3TQMCqBJzDdv+30eHSsgjFHJKiu7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQsHGpAI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQsHGpAI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7481600130eso2779746b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749257199; x=1749861999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NTbezXYT2I3Zh4qQvGzv6Nq8w36gHJX4feDoc57xJo=;
        b=iQsHGpAIYom06e54Qyud+JAR/q5G/AJUQI3DD+V6N6GdX5eUlCEm1uAgRoi4Qd6KsJ
         YbI8v1S+cN3Tf64VlgJtHMPdnyDZ38mAmo/G1qOimT2v/CI6I6EpK/nGvMU7FlzWsfvF
         3i8xbZH/c9cnfsY60ma0srixSaxopbuhhxEiSqXPNlVMp5tXWnp0hNr2j15DHrgiGrPI
         mfImuGbextdOLowqBIlj28mWMx1tPQScoKIBSmb8NvD52mRmFB/EkpphFtAtaStTp/vs
         h8tw4ac7EEPPCYm3x+LGXToBYRTQYLzUSMPoAAotk2P4wq3XGWV2NRecRqj9uXorFQgp
         6+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749257199; x=1749861999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NTbezXYT2I3Zh4qQvGzv6Nq8w36gHJX4feDoc57xJo=;
        b=tbReZdVNHw94dDCgsoQr3EN3cC2ixKFiEa16bLRdjHMeo/6ESzcTa2/9lo2v0RqJ7J
         8tzcgNt9F4qwV7gh6HSvUspPJLWrSyBzbhkGU809vIKoh5nk9APtYsTN4esDXM9xZWzG
         kF94JRBNoLN/7ggA5voLoRlNZQN19vaHlMwp91jA1v3ZO/Lj7d8A2BZ8mRxJczR922UM
         4jKxh5ESwdtoJTj+d9rldLWCvE7E/lM09GFFhdHn5jqeF6C/7xpKwA6+Ykx9HC70KPtb
         kwwXxHeW7gVQsQs4ryYjBVIfxdtm6WyxNuqPJR3tP17sPk3Qt7tOHVat5SCAuwaAhtGE
         9eHw==
X-Gm-Message-State: AOJu0Yy4jv9L9ASpKLERsPiYEgn3yNUvE3lntiOziHAaRPp73K+2ijSp
	2ygebV+8FvNAthuvwK/hgFNX3Q0Uyg8NEH1UQmqakqcLoaqzE1RFzOiW
X-Gm-Gg: ASbGncuxGq5KVEqGXoV86ax26snzhhqgYdw8YKM3EXBoNRUj5Qp5reo/wjFwgMEWCZy
	vWV9zYmngCkB4wOY4VblrXuxhi1n7YlIfa5+3IzXg7UfnkYiNj47giUFeklTiFCDUswYNpnyz7b
	NviuGkiy0Y+B1YVzDubWbnA1T4Gxlz2AKK0ZzQBp/jk2RPwbaStDJkzmF1kKcyLR8WeTjr+fs/A
	C2VGEihdTSem2PQ7X5aPpML0a1JqTxeXQd/IVRKgFUAkky1ij7lXjz/9j3xek2Nqx+kSVs0mha0
	VPFKizxiHGlghFwzwWp/6raYmfDhOa4boixF5qqxFQHkjGKnXsSm4vh1jNCygNIEAMoR
X-Google-Smtp-Source: AGHT+IECtxSfDrxpaToFuZZSN8DXxz4LgZkbcCWrmXZT8bOIoJsv1bYfa29JHoMA4rQu3yENpUj6AA==
X-Received: by 2002:a05:6a21:2d4c:b0:215:f519:e2dc with SMTP id adf61e73a8af0-21ee68a460amr7796056637.14.1749257198738;
        Fri, 06 Jun 2025 17:46:38 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c5f73sm1847985b3a.126.2025.06.06.17.46.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Jun 2025 17:46:38 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Date: Sat,  7 Jun 2025 12:46:23 +1200
Message-Id: <20250607004623.8896-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

Certain madvise operations, especially MADV_DONTNEED, occur far more
frequently than other madvise options, particularly in native and Java
heaps for dynamic memory management.

Currently, the mmap_lock is always held during these operations, even when
unnecessary. This causes lock contention and can lead to severe priority
inversion, where low-priority threads—such as Android's HeapTaskDaemon—
hold the lock and block higher-priority threads.

This patch enables the use of per-VMA locks when the advised range lies
entirely within a single VMA, avoiding the need for full VMA traversal. In
practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.

Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
benefits from this per-VMA lock optimization. After extended runtime,
217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
only 1,231 fell back to mmap_lock.

To simplify handling, the implementation falls back to the standard
mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
userfaultfd_remove().

Many thanks to Lorenzo's work[1] on:
"Refactor the madvise() code to retain state about the locking mode
utilised for traversing VMAs.

Then use this mechanism to permit VMA locking to be done later in the
madvise() logic and also to allow altering of the locking mode to permit
falling back to an mmap read lock if required."

One important point, as pointed out by Jann[2], is that
untagged_addr_remote() requires holding mmap_lock. This is because
address tagging on x86 and RISC-V is quite complex.

Until untagged_addr_remote() becomes atomic—which seems unlikely in
the near future—we cannot support per-VMA locks for remote processes.
So for now, only local processes are supported.

Link: https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local/ [1]
Link: https://lore.kernel.org/all/CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com/ [2]
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/madvise.c | 196 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 148 insertions(+), 48 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 56d9ca2557b9..a94e6a7ee387 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -48,38 +48,19 @@ struct madvise_walk_private {
 	bool pageout;
 };
 
+enum madvise_lock_mode {
+	MADVISE_NO_LOCK,
+	MADVISE_MMAP_READ_LOCK,
+	MADVISE_MMAP_WRITE_LOCK,
+	MADVISE_VMA_READ_LOCK,
+};
+
 struct madvise_behavior {
 	int behavior;
 	struct mmu_gather *tlb;
+	enum madvise_lock_mode lock_mode;
 };
 
-/*
- * Any behaviour which results in changes to the vma->vm_flags needs to
- * take mmap_lock for writing. Others, which simply traverse vmas, need
- * to only take it for reading.
- */
-static int madvise_need_mmap_write(int behavior)
-{
-	switch (behavior) {
-	case MADV_REMOVE:
-	case MADV_WILLNEED:
-	case MADV_DONTNEED:
-	case MADV_DONTNEED_LOCKED:
-	case MADV_COLD:
-	case MADV_PAGEOUT:
-	case MADV_FREE:
-	case MADV_POPULATE_READ:
-	case MADV_POPULATE_WRITE:
-	case MADV_COLLAPSE:
-	case MADV_GUARD_INSTALL:
-	case MADV_GUARD_REMOVE:
-		return 0;
-	default:
-		/* be safe, default to 1. list exceptions explicitly */
-		return 1;
-	}
-}
-
 #ifdef CONFIG_ANON_VMA_NAME
 struct anon_vma_name *anon_vma_name_alloc(const char *name)
 {
@@ -1486,6 +1467,44 @@ static bool process_madvise_remote_valid(int behavior)
 	}
 }
 
+/*
+ * Try to acquire a VMA read lock if possible.
+ *
+ * We only support this lock over a single VMA, which the input range must
+ * span either partially or fully.
+ *
+ * This function always returns with an appropriate lock held. If a VMA read
+ * lock could be acquired, we return the locked VMA.
+ *
+ * If a VMA read lock could not be acquired, we return NULL and expect caller to
+ * fallback to mmap lock behaviour.
+ */
+static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior,
+		unsigned long start, unsigned long end)
+{
+	struct vm_area_struct *vma;
+
+	vma = lock_vma_under_rcu(mm, start);
+	if (!vma)
+		goto take_mmap_read_lock;
+	/*
+	 * Must span only a single VMA; uffd and remote processes are
+	 * unsupported.
+	 */
+	if (end > vma->vm_end || current->mm != mm ||
+	    userfaultfd_armed(vma)) {
+		vma_end_read(vma);
+		goto take_mmap_read_lock;
+	}
+	return vma;
+
+take_mmap_read_lock:
+	mmap_read_lock(mm);
+	madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
+	return NULL;
+}
+
 /*
  * Walk the vmas in range [start,end), and call the visit function on each one.
  * The visit function will get start and end parameters that cover the overlap
@@ -1496,7 +1515,8 @@ static bool process_madvise_remote_valid(int behavior)
  */
 static
 int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
-		      unsigned long end, void *arg,
+		      unsigned long end, struct madvise_behavior *madv_behavior,
+		      void *arg,
 		      int (*visit)(struct vm_area_struct *vma,
 				   struct vm_area_struct **prev, unsigned long start,
 				   unsigned long end, void *arg))
@@ -1505,6 +1525,21 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	struct vm_area_struct *prev;
 	unsigned long tmp;
 	int unmapped_error = 0;
+	int error;
+
+	/*
+	 * If VMA read lock is supported, apply madvise to a single VMA
+	 * tentatively, avoiding walking VMAs.
+	 */
+	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
+		vma = try_vma_read_lock(mm, madv_behavior, start, end);
+		if (vma) {
+			error = madvise_vma_behavior(vma, &prev, start, end,
+				madv_behavior);
+			vma_end_read(vma);
+			return error;
+		}
+	}
 
 	/*
 	 * If the interval [start,end) covers some unmapped address
@@ -1516,8 +1551,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 		prev = vma;
 
 	for (;;) {
-		int error;
-
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
@@ -1598,34 +1631,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	if (end == start)
 		return 0;
 
-	return madvise_walk_vmas(mm, start, end, anon_name,
+	return madvise_walk_vmas(mm, start, end, NULL, anon_name,
 				 madvise_vma_anon_name);
 }
 #endif /* CONFIG_ANON_VMA_NAME */
 
-static int madvise_lock(struct mm_struct *mm, int behavior)
+
+/*
+ * Any behaviour which results in changes to the vma->vm_flags needs to
+ * take mmap_lock for writing. Others, which simply traverse vmas, need
+ * to only take it for reading.
+ */
+static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)
 {
+	int behavior = madv_behavior->behavior;
+
 	if (is_memory_failure(behavior))
-		return 0;
+		return MADVISE_NO_LOCK;
 
-	if (madvise_need_mmap_write(behavior)) {
+	switch (behavior) {
+	case MADV_REMOVE:
+	case MADV_WILLNEED:
+	case MADV_COLD:
+	case MADV_PAGEOUT:
+	case MADV_FREE:
+	case MADV_POPULATE_READ:
+	case MADV_POPULATE_WRITE:
+	case MADV_COLLAPSE:
+	case MADV_GUARD_INSTALL:
+	case MADV_GUARD_REMOVE:
+		return MADVISE_MMAP_READ_LOCK;
+	case MADV_DONTNEED:
+	case MADV_DONTNEED_LOCKED:
+		return MADVISE_VMA_READ_LOCK;
+	default:
+		return MADVISE_MMAP_WRITE_LOCK;
+	}
+}
+
+static int madvise_lock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior)
+{
+	enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
+
+	switch (lock_mode) {
+	case MADVISE_NO_LOCK:
+		break;
+	case MADVISE_MMAP_WRITE_LOCK:
 		if (mmap_write_lock_killable(mm))
 			return -EINTR;
-	} else {
+		break;
+	case MADVISE_MMAP_READ_LOCK:
 		mmap_read_lock(mm);
+		break;
+	case MADVISE_VMA_READ_LOCK:
+		/* We will acquire the lock per-VMA in madvise_walk_vmas(). */
+		break;
 	}
+
+	madv_behavior->lock_mode = lock_mode;
 	return 0;
 }
 
-static void madvise_unlock(struct mm_struct *mm, int behavior)
+static void madvise_unlock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior)
 {
-	if (is_memory_failure(behavior))
+	switch (madv_behavior->lock_mode) {
+	case  MADVISE_NO_LOCK:
 		return;
-
-	if (madvise_need_mmap_write(behavior))
+	case MADVISE_MMAP_WRITE_LOCK:
 		mmap_write_unlock(mm);
-	else
+		break;
+	case MADVISE_MMAP_READ_LOCK:
 		mmap_read_unlock(mm);
+		break;
+	case MADVISE_VMA_READ_LOCK:
+		/* We will drop the lock per-VMA in madvise_walk_vmas(). */
+		break;
+	}
+
+	madv_behavior->lock_mode = MADVISE_NO_LOCK;
 }
 
 static bool madvise_batch_tlb_flush(int behavior)
@@ -1710,6 +1795,21 @@ static bool is_madvise_populate(int behavior)
 	}
 }
 
+/*
+ * untagged_addr_remote() assumes mmap_lock is already held. On
+ * architectures like x86 and RISC-V, tagging is tricky because each
+ * mm may have a different tagging mask. However, we might only hold
+ * the per-VMA lock (currently only local processes are supported),
+ * so untagged_addr is used to avoid the mmap_lock assertion for
+ * local processes.
+ */
+static inline unsigned long get_untagged_addr(struct mm_struct *mm,
+		unsigned long start)
+{
+	return current->mm == mm ? untagged_addr(start) :
+				   untagged_addr_remote(mm, start);
+}
+
 static int madvise_do_behavior(struct mm_struct *mm,
 		unsigned long start, size_t len_in,
 		struct madvise_behavior *madv_behavior)
@@ -1721,7 +1821,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 
 	if (is_memory_failure(behavior))
 		return madvise_inject_error(behavior, start, start + len_in);
-	start = untagged_addr_remote(mm, start);
+	start = get_untagged_addr(mm, start);
 	end = start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
@@ -1729,7 +1829,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 		error = madvise_populate(mm, start, end, behavior);
 	else
 		error = madvise_walk_vmas(mm, start, end, madv_behavior,
-					  madvise_vma_behavior);
+				madv_behavior, madvise_vma_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
@@ -1817,13 +1917,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
-	error = madvise_lock(mm, behavior);
+	error = madvise_lock(mm, &madv_behavior);
 	if (error)
 		return error;
 	madvise_init_tlb(&madv_behavior, mm);
 	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	madvise_unlock(mm, &madv_behavior);
 
 	return error;
 }
@@ -1847,7 +1947,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 	total_len = iov_iter_count(iter);
 
-	ret = madvise_lock(mm, behavior);
+	ret = madvise_lock(mm, &madv_behavior);
 	if (ret)
 		return ret;
 	madvise_init_tlb(&madv_behavior, mm);
@@ -1880,8 +1980,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
-			madvise_unlock(mm, behavior);
-			ret = madvise_lock(mm, behavior);
+			madvise_unlock(mm, &madv_behavior);
+			ret = madvise_lock(mm, &madv_behavior);
 			if (ret)
 				goto out;
 			madvise_init_tlb(&madv_behavior, mm);
@@ -1892,7 +1992,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	madvise_unlock(mm, &madv_behavior);
 
 out:
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
-- 
2.39.3 (Apple Git-146)

