Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8D2CA6
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749333729; cv=none; b=hPuWfszEYx2cmEZaCLXHeOryZhfzgYXBuJhZhm/LpyRv6WV5jmazOg2auNpl1JIUOuzRiyxXvmztaJm2m9ozDTkmsGrnouzRVq+TbEXZoKS1uv+D/dpFW4rqxy9Y99jsdTOIbRDhiP2T9vB6CyoaKfBPHhVADeIPzkMkMehrvIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749333729; c=relaxed/simple;
	bh=ZOecyM9Z3DL8s6M2H8YpAyfJt26VuhcBnXUBvB4ld4E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nOEZ5pRc6v7zsHW+Ihm9gBWH9haMpW7+PGNWXcGlLfk6cjkSicc13DnJk+WO6H8X4xggZao4JAFaf3OayhJvPsB0+1Wmn4Zm0q7JEuJnKG1vxRimaMg4MfBrUzDhxWnXMMEXmMmeatVSPihO+oLc06SzhsMpo/zeRb48QPqGpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYxTuT8L; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYxTuT8L"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2739126b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 15:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749333726; x=1749938526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9T2hh4LXe9mzTbq9SoRU54PmUX07cPYHS8buY92NpiA=;
        b=SYxTuT8LQRUPDrRaKL4Rl3l0WU42P7KsFXzrTtjIK2broH2zqerOTWHNehIyXKkZRo
         K5/PSApsQz7/T+7Klcp9NWYUiendmAatTuV9QzHWIU854VmL2U+v88UaGS4lG1PD/00p
         s4uzEP+Jx8MocsKJTxOcxbfrNDI6lXJoVOCIhBzwQnqC8MWf9hy8uUhLezypa39LVPdP
         MTmIqB+NzIcgSRrhrZjcsEiv4NER/ZvsSA7YDGw09EAkNAMOGhU0fiEX3/hhx4lPhKqe
         Z7lS/f7w087ijKmh//7cWWSDwhxllEcCB1sZkqnzJHx1VA78cAZX7rVKUMytxXu0RpST
         vsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749333726; x=1749938526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T2hh4LXe9mzTbq9SoRU54PmUX07cPYHS8buY92NpiA=;
        b=gfUW5ijLWpFk36sJ3VhGB1++ZexUKgEtcFyQKw6i8zmpiFXJepwedNtW7iv+LbvTE8
         Xs97328Qr8bXtnWfgjFG6nOg2aQJ9JVQn4aNUci7T6ayAjVhcFVfdJvk2iQ4JyMqRuiZ
         2xDSoodGH1S4VU5Ob5xNHo9VL8V/4KDqMnafQc5fuziS52QSJZTboN0/hLSOKi6MvEsT
         GzW1Q0tzSbTpPVYWgia3I7KMOk11cuKZFpNGGz5bw5IzYVedlQc8a5U+y+kPkP5vIOhS
         84wdRzWuQUS2Y4lNDt60XWTs3860EjV6myz4redpc7ltitCK+PiTIKWBmaPf3NkcUbk4
         hajA==
X-Gm-Message-State: AOJu0YxY2zMv1+tdCpiiXmZQgA7a287EX4LJ5/B7WqBxPANhdTTgk8fT
	k2EKcTvYkjUP+YZiJ49rsVgMJ3shsVu/QusJxduOPpPx2akVG6SpBEwa
X-Gm-Gg: ASbGncvPozcfZn2uh8xL3KFHeQC+oZCpWzJTOLhIog1O37hbhFT3MjUudtwguutmJZs
	McsjjlGWoVjaQjhvruI3QbrIID/AgccVxShculRSWJYtBDcrVeD9jgHPuhiX5B03FU7Hs1Sb/Wj
	hIbAb0xmIAa+Nzqkr46wEd0pGb++q230m3hQkge/bApWzzobIm55lDTXhnfICBZ1oMq9Pcthcms
	+VWb1RERrrVcKy419UsieP43+8J7sVCXuw0ISCQweVmRb9GwSLlM49gXlJth6xt6cwsFYtd7nWA
	6Ja0rkvj4TgnvzKRWGC4lHr46HRSaU7upIhMbXrRCsOaLAkWy1JGuEHunTYb4XY=
X-Google-Smtp-Source: AGHT+IFUzvuj2HHkXu+av+nYCrNdVfg2JBeIYJtIt3WbE7P0guHHqSuc8AEf9+s+Jx1CCciM9A4HsA==
X-Received: by 2002:a05:6a00:848:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-74827e74aacmr11067010b3a.7.1749333726461;
        Sat, 07 Jun 2025 15:02:06 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b09dsm3173179b3a.43.2025.06.07.15.02.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Jun 2025 15:02:05 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
Date: Sun,  8 Jun 2025 10:01:50 +1200
Message-Id: <20250607220150.2980-1-21cnbao@gmail.com>
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 -v4:
 * collect Lorenzo's RB;
 * use visit() for per-vma path

 mm/madvise.c | 195 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 147 insertions(+), 48 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 56d9ca2557b9..8382614b71d1 100644
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
@@ -1505,6 +1525,20 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
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
+			error = visit(vma, &prev, start, end, arg);
+			vma_end_read(vma);
+			return error;
+		}
+	}
 
 	/*
 	 * If the interval [start,end) covers some unmapped address
@@ -1516,8 +1550,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 		prev = vma;
 
 	for (;;) {
-		int error;
-
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
@@ -1598,34 +1630,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
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
@@ -1710,6 +1794,21 @@ static bool is_madvise_populate(int behavior)
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
@@ -1721,7 +1820,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 
 	if (is_memory_failure(behavior))
 		return madvise_inject_error(behavior, start, start + len_in);
-	start = untagged_addr_remote(mm, start);
+	start = get_untagged_addr(mm, start);
 	end = start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
@@ -1729,7 +1828,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
 		error = madvise_populate(mm, start, end, behavior);
 	else
 		error = madvise_walk_vmas(mm, start, end, madv_behavior,
-					  madvise_vma_behavior);
+				madv_behavior, madvise_vma_behavior);
 	blk_finish_plug(&plug);
 	return error;
 }
@@ -1817,13 +1916,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 
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
@@ -1847,7 +1946,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 	total_len = iov_iter_count(iter);
 
-	ret = madvise_lock(mm, behavior);
+	ret = madvise_lock(mm, &madv_behavior);
 	if (ret)
 		return ret;
 	madvise_init_tlb(&madv_behavior, mm);
@@ -1880,8 +1979,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
-			madvise_unlock(mm, behavior);
-			ret = madvise_lock(mm, behavior);
+			madvise_unlock(mm, &madv_behavior);
+			ret = madvise_lock(mm, &madv_behavior);
 			if (ret)
 				goto out;
 			madvise_init_tlb(&madv_behavior, mm);
@@ -1892,7 +1991,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	madvise_unlock(mm, &madv_behavior);
 
 out:
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
-- 
2.39.3 (Apple Git-146)

