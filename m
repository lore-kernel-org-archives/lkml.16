Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E41F0992
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601891; cv=none; b=cKfaQi++IjlmWzHoPjg+qbvXE0q5n2Au/9HSxwPCFM4GXLU3ruKLW8G5cZTFAgG2V/FuCG9GXmwjpjMyOs1u+7U/gwFbNzUtYxYTvJSQDCG+IjDZ0Y4vvLnaZ3qm+ezauQoapkHTkguhQ5hBi+0E7DrXqPDN4oX1V2xu7E8FG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601891; c=relaxed/simple;
	bh=TWLus+4KlVrrOSWF5OOQ4tTrcLYf2lNVsXL0U9O9pZg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ROzsbewJFA8Tnfa/EHSVRbPdOvtrDTR2w9v/E0uvDdP5ypZ8OngjA2SC7r8C/a68IojqbwPdeKibM8NbG2TOvleufw/TC3fG35ZS/4QkbMD54luA63xCWgqSBl+iMqaXkK7oJCobpQxKw2pRau1bbehkJQHK3i1e1bQXvXhqJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9gOfj4m; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9gOfj4m"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so1890059a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748601889; x=1749206689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnmyWWnkHhL5mEaYJ42mO1WBC828RJ92PmrmoVql9C4=;
        b=Z9gOfj4mMRLeqneeHV5Y4tjvWXqz69PQm9fTk0f6+PVay7u1fh64oTHvtwV11i7WaP
         uzTQywJeLfoCaPDm44NwpGrFZoF6N8DBXYcYVsve4mjpZ8YaNvvTpDzVSVMuf4MOv4Fw
         KRLRpQJBiU/OL+GstZfZMEegMp8ftx1O+FuV3ELaYAE8HUyvSwemWBvEcjoEiMTBUQ/r
         6wfya+6GvQRwR97IJjWdMmN22zpRXnTx4LhHY7gIibDN7xqvuIhfyRVz7fee6n9lWYQx
         fcogW3t63mPsES2xLHCsJcJnMl8P3BvWxYZrOh6xIG18liyQKLSN7b5lm+HP+6mDYOqW
         sVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748601889; x=1749206689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnmyWWnkHhL5mEaYJ42mO1WBC828RJ92PmrmoVql9C4=;
        b=Ah98uxSR77dRGmrK5s62QEjRwGs5RAneNtYm0KFl2J3yrqdOpQ/TrT8u7h+pkeqDlY
         0Lknuj+2tR0sZrBDWGBbGIo6bfwAUT+jA1rV846EpoDMh9tu13TE+tsc/KrelWQoQHcO
         UoZPupN4hUT91+exciR1uz9aevZZVwXx16u/NndZoWTMIgb2HdrtId/YXRZwReAAFFhw
         4EBt4/U6aWINVJs38Yb+IUM5bcjM9rJp4T7RaeVZsG0a9F+3R4uG1WfuwEchbHjosL45
         klRjYOHwd6pB5Df1t+5OLShzY8a59CsbtarmVx4QfA52K6DhCPOiT9adNQ7QFolXK6Rr
         05Rg==
X-Gm-Message-State: AOJu0Yzgc9o7kh1/mV1uCAsyHKYxf0BnHklb6jhdHuapdOrSgFbr4wfo
	bXaQ0cGQqZZLbdlclJCt1eB2y4/qT2pG6vLCdf4P31LyUVN4xdGuhc3A
X-Gm-Gg: ASbGnctKK0+0xf29hlfWk4ybeDaHgf3rB25xjKeIxESE4q92YEIAH3xUxLDKO6M5Su6
	CS+QB84Noa/uxmKsvbvinnNL6uwoS4o+Joi3AoLFtWBnLH1QGNAQ4CLMO1SkoDquacleUNKtmGn
	o4tyk8T1k54ZQznwPVbZQUBvJVdR8HIFRwREJpHqJbvZt1s34zME+KVpMOw1lr9aqVtMMHMLLeF
	5q12L67Jyo+uXlZZFkqUZnkBP6VRZinyPc0W64f3DEaTnl9Wwr3URtH3kCARjYBmQezJNg1iyCE
	efUbstHhq3OvkhjEkvkjDoiJwxswZpE3SIflqUXd5omfs1jWoGni5WE8lOHXN8buqJ22O9jYjpc
	5aliTNxYldafHnR8=
X-Google-Smtp-Source: AGHT+IHeNd74QiY5s8umG+LXY6p1qQEn4uJ7HgGVIgmQHCms1DbpS7bfrva0vne3RuKXbvcISBeFxQ==
X-Received: by 2002:a05:6a21:3990:b0:216:60bc:2ca9 with SMTP id adf61e73a8af0-21ad989d387mr5428702637.40.1748601888893;
        Fri, 30 May 2025 03:44:48 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb35702sm1124107a12.33.2025.05.30.03.44.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 03:44:48 -0700 (PDT)
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
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Date: Fri, 30 May 2025 22:44:39 +1200
Message-Id: <20250530104439.64841-1-21cnbao@gmail.com>
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

Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 -v2:
 * try to hide the per-vma lock in madvise_lock, per Lorenzo;
 * ideally, for vector_madvise(), we are able to make the
   decision of lock types for each iteration; for this moment,
   we still use the global lock.
 -v1:
 https://lore.kernel.org/linux-mm/20250527044145.13153-1-21cnbao@gmail.com/

 mm/madvise.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 9 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 8433ac9b27e0..d408ffa404b3 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -51,6 +51,7 @@ struct madvise_walk_private {
 struct madvise_behavior {
 	int behavior;
 	struct mmu_gather *tlb;
+	struct vm_area_struct *vma;
 };
 
 /*
@@ -1553,6 +1554,21 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 	return unmapped_error;
 }
 
+/*
+ * Call the visit function on the single vma with the per_vma lock
+ */
+static inline
+int madvise_single_locked_vma(struct vm_area_struct *vma,
+		unsigned long start, unsigned long end, void *arg,
+		int (*visit)(struct vm_area_struct *vma,
+				   struct vm_area_struct **prev, unsigned long start,
+				   unsigned long end, void *arg))
+{
+	struct vm_area_struct *prev;
+
+	return visit(vma, &prev, start, end, arg);
+}
+
 #ifdef CONFIG_ANON_VMA_NAME
 static int madvise_vma_anon_name(struct vm_area_struct *vma,
 				 struct vm_area_struct **prev,
@@ -1603,7 +1619,7 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 }
 #endif /* CONFIG_ANON_VMA_NAME */
 
-static int madvise_lock(struct mm_struct *mm, int behavior)
+static int __madvise_lock(struct mm_struct *mm, int behavior)
 {
 	if (is_memory_failure(behavior))
 		return 0;
@@ -1617,7 +1633,7 @@ static int madvise_lock(struct mm_struct *mm, int behavior)
 	return 0;
 }
 
-static void madvise_unlock(struct mm_struct *mm, int behavior)
+static void __madvise_unlock(struct mm_struct *mm, int behavior)
 {
 	if (is_memory_failure(behavior))
 		return;
@@ -1628,6 +1644,46 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
 		mmap_read_unlock(mm);
 }
 
+static int madvise_lock(struct mm_struct *mm, unsigned long start,
+		unsigned long len, struct madvise_behavior *madv_behavior)
+{
+	int behavior = madv_behavior->behavior;
+
+	/*
+	 * MADV_DONTNEED is commonly used with userspace heaps and most often
+	 * affects a single VMA. In these cases, we can use per-VMA locks to
+	 * reduce contention on the mmap_lock.
+	 */
+	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED) {
+		struct vm_area_struct *vma;
+		unsigned long end;
+
+		start = untagged_addr(start);
+		end = start + len;
+		vma = lock_vma_under_rcu(mm, start);
+		if (!vma)
+			goto out;
+		if (end > vma->vm_end || userfaultfd_armed(vma)) {
+			vma_end_read(vma);
+			goto out;
+		}
+		madv_behavior->vma = vma;
+		return 0;
+	}
+
+out:
+	return __madvise_lock(mm, behavior);
+}
+
+static void madvise_unlock(struct mm_struct *mm,
+		struct madvise_behavior *madv_behavior)
+{
+	if (madv_behavior->vma)
+		vma_end_read(madv_behavior->vma);
+	else
+		__madvise_unlock(mm, madv_behavior->behavior);
+}
+
 static bool madvise_batch_tlb_flush(int behavior)
 {
 	switch (behavior) {
@@ -1714,19 +1770,24 @@ static int madvise_do_behavior(struct mm_struct *mm,
 		unsigned long start, size_t len_in,
 		struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
 	int behavior = madv_behavior->behavior;
+
 	struct blk_plug plug;
 	unsigned long end;
 	int error;
 
 	if (is_memory_failure(behavior))
 		return madvise_inject_error(behavior, start, start + len_in);
-	start = untagged_addr_remote(mm, start);
+	start = untagged_addr(start);
 	end = start + PAGE_ALIGN(len_in);
 
 	blk_start_plug(&plug);
 	if (is_madvise_populate(behavior))
 		error = madvise_populate(mm, start, end, behavior);
+	else if (vma)
+		error = madvise_single_locked_vma(vma, start, end,
+				madv_behavior, madvise_vma_behavior);
 	else
 		error = madvise_walk_vmas(mm, start, end, madv_behavior,
 					  madvise_vma_behavior);
@@ -1817,13 +1878,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 
 	if (madvise_should_skip(start, len_in, behavior, &error))
 		return error;
-	error = madvise_lock(mm, behavior);
+	error = madvise_lock(mm, start, len_in, &madv_behavior);
 	if (error)
 		return error;
 	madvise_init_tlb(&madv_behavior, mm);
 	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	madvise_unlock(mm, &madv_behavior);
 
 	return error;
 }
@@ -1847,7 +1908,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 	total_len = iov_iter_count(iter);
 
-	ret = madvise_lock(mm, behavior);
+	ret = __madvise_lock(mm, behavior);
 	if (ret)
 		return ret;
 	madvise_init_tlb(&madv_behavior, mm);
@@ -1880,8 +1941,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
-			madvise_unlock(mm, behavior);
-			madvise_lock(mm, behavior);
+			__madvise_unlock(mm, behavior);
+			__madvise_lock(mm, behavior);
 			madvise_init_tlb(&madv_behavior, mm);
 			continue;
 		}
@@ -1890,7 +1951,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
 	madvise_finish_tlb(&madv_behavior);
-	madvise_unlock(mm, behavior);
+	__madvise_unlock(mm, behavior);
 
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
 
-- 
2.39.3 (Apple Git-146)

