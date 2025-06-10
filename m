Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A4428DEF4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555863; cv=none; b=mnWtwj6nPeBWx20Mg7/cl2Udws42hI6SzN4do8AR6F2xilEfTHqmBz/MUCXGH4Xk0ZGKgcBDWziGS7G+KDhzcb7vKaRiwiGSTuKoG72zSoDDrVioQ59oLzQSuETMW17TQSqkAy7K6u+PEXI9RXlNfF2STQJ/+weyXNGjhW02Sbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555863; c=relaxed/simple;
	bh=6uWTW+f/RLn6MwoctOvrgGqhPUwFQXonS4G7T1sVQcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uC7BJEosrBTHFQ1RpCeRiIgxbLn9futeEFUl7HDpL+zibtLk8tHWIvoKJIkDrUbvscwAgnYuxULYXJuPVtkt/ztDD2gzszSYl6qHAH3mvkHaDV64gXT2NzHRUosl72HrAT51JYVjmGrU2amToVRAU8zjWCnd6R8vvDtW/wZ1aho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84F0169C;
	Tue, 10 Jun 2025 04:44:01 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 781653F59E;
	Tue, 10 Jun 2025 04:44:15 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	yang@os.amperecomputing.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
Date: Tue, 10 Jun 2025 17:14:00 +0530
Message-Id: <20250610114401.7097-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250610114401.7097-1-dev.jain@arm.com>
References: <20250610114401.7097-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64 currently changes permissions on vmalloc objects locklessly, via
apply_to_page_range. Patch 2 moves away from this to use the pagewalk API,
since a limitation of the former is to deny changing permissions for block
mappings. However, the API currently enforces the init_mm.mmap_lock to be
held. To avoid the unnecessary bottleneck of the mmap_lock for our usecase,
this patch extends this generic API to be used locklessly, so as to retain
the existing behaviour for changing permissions. Apart from this reason,
it is noted at [1] that KFENCE can manipulate kernel pgtable entries during
softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
This being a non-sleepable context, we cannot take the init_mm mmap lock.

Since such extension can potentially be dangerous for other callers
consuming the pagewalk API, explicitly disallow lockless traversal for
userspace pagetables by returning EINVAL. Add comments to highlight the
conditions under which we can use the API locklessly - no underlying VMA,
and the user having exclusive control over the range, thus guaranteeing no
concurrent access.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pagewalk.h |  7 +++++++
 mm/pagewalk.c            | 23 ++++++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 8ac2f6d6d2a3..5efd6541239b 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -14,6 +14,13 @@ enum page_walk_lock {
 	PGWALK_WRLOCK = 1,
 	/* vma is expected to be already write-locked during the walk */
 	PGWALK_WRLOCK_VERIFY = 2,
+	/*
+	 * Walk without any lock. Use of this is only meant for the
+	 * case where there is no underlying VMA, and the user has
+	 * exclusive control over the range, guaranteeing no concurrent
+	 * access. For example, changing permissions of vmalloc objects.
+	 */
+	PGWALK_NOLOCK = 3,
 };
 
 /**
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index ff5299eca687..d55d933f84ec 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -417,13 +417,17 @@ static int __walk_page_range(unsigned long start, unsigned long end,
 	return err;
 }
 
-static inline void process_mm_walk_lock(struct mm_struct *mm,
+static inline bool process_mm_walk_lock(struct mm_struct *mm,
 					enum page_walk_lock walk_lock)
 {
+	if (walk_lock == PGWALK_NOLOCK)
+		return 1;
+
 	if (walk_lock == PGWALK_RDLOCK)
 		mmap_assert_locked(mm);
 	else
 		mmap_assert_write_locked(mm);
+	return 0;
 }
 
 static inline void process_vma_walk_lock(struct vm_area_struct *vma,
@@ -440,6 +444,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
 	case PGWALK_RDLOCK:
 		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
 		break;
+	case PGWALK_NOLOCK:
+		break;
 	}
 #endif
 }
@@ -470,7 +476,8 @@ int walk_page_range_mm(struct mm_struct *mm, unsigned long start,
 	if (!walk.mm)
 		return -EINVAL;
 
-	process_mm_walk_lock(walk.mm, ops->walk_lock);
+	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
+		return -EINVAL;
 
 	vma = find_vma(walk.mm, start);
 	do {
@@ -626,8 +633,12 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
 	 * to prevent the intermediate kernel pages tables belonging to the
 	 * specified address range from being freed. The caller should take
 	 * other actions to prevent this race.
+	 *
+	 * If the caller can guarantee that it has exclusive access to the
+	 * specified address range, only then it can use PGWALK_NOLOCK.
 	 */
-	mmap_assert_locked(mm);
+	if (ops->walk_lock != PGWALK_NOLOCK)
+		mmap_assert_locked(mm);
 
 	return walk_pgd_range(start, end, &walk);
 }
@@ -699,7 +710,8 @@ int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
 	if (!check_ops_valid(ops))
 		return -EINVAL;
 
-	process_mm_walk_lock(walk.mm, ops->walk_lock);
+	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
+		return -EINVAL;
 	process_vma_walk_lock(vma, ops->walk_lock);
 	return __walk_page_range(start, end, &walk);
 }
@@ -719,7 +731,8 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
 	if (!check_ops_valid(ops))
 		return -EINVAL;
 
-	process_mm_walk_lock(walk.mm, ops->walk_lock);
+	if (process_mm_walk_lock(walk.mm, ops->walk_lock))
+		return -EINVAL;
 	process_vma_walk_lock(vma, ops->walk_lock);
 	return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
 }
-- 
2.30.2

