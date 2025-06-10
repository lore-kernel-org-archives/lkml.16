Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB5811712
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527464; cv=none; b=Mg+KwUdYPDPp+oEPLokYDt93iQgN2aJgJwQ/yltSKLQ4h8MDh9fM3PtfSDnk+A65mWCzIzSyDCBKTj1Q6RW74feYgiSALRotoWqORJRBbCKPv+ns9+pSnFvv7LNKjxMbZtiEHAng5Zq3VQs+rfiD2mqaVKdyImoCCOaI5VdZBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527464; c=relaxed/simple;
	bh=/M5qnazF1rOsciFb4BaLzrUm3AHPuSaxuv5NrLuO7Jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DPj2D8HYVNHXeLXsWYxMR1aAjGe0zm4AF9Bt34v2I4Z962+Xkk3xY71Uh4I8ttSy6YXfJES4XCmk56LCLhOkVCDl4w1qNvkRIx8fdtLWvvFCZD8JT/zxw3GdbObL7f5MBFZdS8CZMrPASdZp1UUHrNCR0CvKHPrfd1MEu53/69U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCB1416A3;
	Mon,  9 Jun 2025 20:50:42 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E0B33F59E;
	Mon,  9 Jun 2025 20:50:54 -0700 (PDT)
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
Subject: [PATCH v4 1/2] mm: Call pointers to ptes as ptep
Date: Tue, 10 Jun 2025 09:20:42 +0530
Message-Id: <20250610035043.75448-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250610035043.75448-1-dev.jain@arm.com>
References: <20250610035043.75448-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid confusion between pte_t* and pte_t data types by suffixing pointer
type variables with p. No functional change.

Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mremap.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 60f6b8d0d5f0..180b12225368 100644
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
@@ -235,14 +236,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 
-	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
-				   new_pte++, new_addr += PAGE_SIZE) {
-		VM_WARN_ON_ONCE(!pte_none(*new_pte));
+	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
+				   new_ptep++, new_addr += PAGE_SIZE) {
+		VM_WARN_ON_ONCE(!pte_none(*new_ptep));
 
-		if (pte_none(ptep_get(old_pte)))
+		if (pte_none(ptep_get(old_ptep)))
 			continue;
 
-		pte = ptep_get_and_clear(mm, old_addr, old_pte);
+		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
 		/*
 		 * If we are remapping a valid PTE, make sure
 		 * to flush TLB before we drop the PTL for the
@@ -260,7 +261,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		pte = move_soft_dirty_pte(pte);
 
 		if (need_clear_uffd_wp && pte_marker_uffd_wp(pte))
-			pte_clear(mm, new_addr, new_pte);
+			pte_clear(mm, new_addr, new_ptep);
 		else {
 			if (need_clear_uffd_wp) {
 				if (pte_present(pte))
@@ -268,7 +269,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 				else if (is_swap_pte(pte))
 					pte = pte_swp_clear_uffd_wp(pte);
 			}
-			set_pte_at(mm, new_addr, new_pte, pte);
+			set_pte_at(mm, new_addr, new_ptep, pte);
 		}
 	}
 
@@ -277,8 +278,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
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

