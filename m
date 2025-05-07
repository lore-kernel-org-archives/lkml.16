Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E006B171A1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597805; cv=none; b=o/OMfK+SXwtf8ro9u/jyJClFv74FB0M2FFr8MJ9djJfKKXOCk9cmuo+TYzzb0QHqkxb/w95ge4dNxzN8Z54x8r57QefBWztKt5qdYdcJBX+TNULxhQHWhS+jbqfgtvP0I6EamfSXd2HlnayBt7JIq9b1tHDTN2c1VQcO1tvG8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597805; c=relaxed/simple;
	bh=1rzIk3HDc69ZVvM2Yq0wR/w7H2IoP9h3wfbPJyiAL58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMIJcA9XO6fKmy61ry0GWOAR29inY2l6qFufGTq/NGQLvLM9aio5IDLtLas90MBKyTXIei9WS3Om/OIKsu7pZMfzfvk3k3sE3iQQqf24LPS8B23UqwesSFU2IGy6Io+Kg/FIGqQ0E3vVEVltTy0hDozGJP+1Sqr7TjNbu03Z0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26684339;
	Tue,  6 May 2025 23:03:10 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.43.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7EAA3F5A1;
	Tue,  6 May 2025 23:03:12 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	mingo@kernel.org,
	libang.li@antgroup.com,
	maobibo@loongson.cn,
	zhengqi.arch@bytedance.com,
	baohua@kernel.org,
	anshuman.khandual@arm.com,
	willy@infradead.org,
	ioworker0@gmail.com,
	yang@os.amperecomputing.com,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	hughd@google.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 1/2] mm: Call pointers to ptes as ptep
Date: Wed,  7 May 2025 11:32:55 +0530
Message-Id: <20250507060256.78278-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250507060256.78278-1-dev.jain@arm.com>
References: <20250507060256.78278-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid confusion between pte_t* and pte_t data types by suffixing pointer
type variables with p. No functional change.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mremap.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 7db9da609c84..0163e02e5aa8 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -176,7 +176,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	struct vm_area_struct *vma = pmc->old;
 	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
-	pte_t *old_pte, *new_pte, pte;
+	pte_t *old_ptep, *new_ptep;
+	pte_t pte;
 	pmd_t dummy_pmdval;
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
@@ -211,8 +212,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	 * We don't have to worry about the ordering of src and dst
 	 * pte locks because exclusive mmap_lock prevents deadlock.
 	 */
-	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
-	if (!old_pte) {
+	old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
+	if (!old_ptep) {
 		err = -EAGAIN;
 		goto out;
 	}
@@ -223,10 +224,10 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	 * mmap_lock, so this new_pte page is stable, so there is no need to get
 	 * pmdval and do pmd_same() check.
 	 */
-	new_pte = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
+	new_ptep = pte_offset_map_rw_nolock(mm, new_pmd, new_addr, &dummy_pmdval,
 					   &new_ptl);
-	if (!new_pte) {
-		pte_unmap_unlock(old_pte, old_ptl);
+	if (!new_ptep) {
+		pte_unmap_unlock(old_ptep, old_ptl);
 		err = -EAGAIN;
 		goto out;
 	}
@@ -235,12 +236,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 
-	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
-				   new_pte++, new_addr += PAGE_SIZE) {
-		if (pte_none(ptep_get(old_pte)))
+	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
+				   new_ptep++, new_addr += PAGE_SIZE) {
+		if (pte_none(ptep_get(old_ptep)))
 			continue;
 
-		pte = ptep_get_and_clear(mm, old_addr, old_pte);
+		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
 		/*
 		 * If we are remapping a valid PTE, make sure
 		 * to flush TLB before we drop the PTL for the
@@ -258,7 +259,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		pte = move_soft_dirty_pte(pte);
 
 		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
-			pte_clear(mm, new_addr, new_pte);
+			pte_clear(mm, new_addr, new_ptep);
 		else {
 			if (need_clear_uffd_wp) {
 				if (pte_present(pte))
@@ -266,7 +267,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 				else if (is_swap_pte(pte))
 					pte = pte_swp_clear_uffd_wp(pte);
 			}
-			set_pte_at(mm, new_addr, new_pte, pte);
+			set_pte_at(mm, new_addr, new_ptep, pte);
 		}
 	}
 
@@ -275,8 +276,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		flush_tlb_range(vma, old_end - len, old_end);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
-	pte_unmap(new_pte - 1);
-	pte_unmap_unlock(old_pte - 1, old_ptl);
+	pte_unmap(new_ptep - 1);
+	pte_unmap_unlock(old_ptep - 1, old_ptl);
 out:
 	if (pmc->need_rmap_locks)
 		drop_rmap_locks(vma);
-- 
2.30.2

