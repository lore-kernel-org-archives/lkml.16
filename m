Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BA923C8BE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507701; cv=none; b=SYTbnOi96lWjc7+nwlOcmA4/7JKufm+XjEg4Y4f7+PvppJn0ywkQGyuneyme73pCMNtoveknOO+Emh0hIhTttT11Zl3BknGKRqBzS9QfPFfapxvlwKpbYFknMj+72qfllTzfIqQklWl+Af0SThwkd1oNdPC5FGQw1DJ5HX3aBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507701; c=relaxed/simple;
	bh=ue4CNnv4c/0imbT/7fs2S/8y/JnUgfdHYmeIPCw4uwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RH2CmiG35GH9SiwfOJPiTNkWpXjkteoEiDn8cEnleCtvNs1BueDz0Css9E2ZQ+vFAN/r3m3aHCEkS6Pn0Rv52wRZvp/Dys/8GpOzyClEbIXRMh0Y2n2KkikZE/0lp0kEOMX6fWzpwxUoCsU9GSf47m7PvtmOQLtjJUc+uW0SNSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA970113E;
	Mon,  5 May 2025 22:01:29 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F0973F5A1;
	Mon,  5 May 2025 22:01:32 -0700 (PDT)
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
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 3/3] mm: Optimize mremap() by PTE batching
Date: Tue,  6 May 2025 10:30:56 +0530
Message-Id: <20250506050056.59250-4-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250506050056.59250-1-dev.jain@arm.com>
References: <20250506050056.59250-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use folio_pte_batch() to optimize move_ptes(). Use get_and_clear_full_ptes()
so as to elide TLBIs on each contig block, which was previously done by
ptep_get_and_clear().

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mremap.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 1a08a7c3b92f..3621c07d8eea 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	struct vm_area_struct *vma = pmc->old;
 	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
-	pte_t *old_ptep, *new_ptep, pte;
+	pte_t *old_ptep, *new_ptep, old_pte, pte;
 	pmd_t dummy_pmdval;
 	spinlock_t *old_ptl, *new_ptl;
 	bool force_flush = false;
@@ -185,6 +185,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 	unsigned long old_end = old_addr + extent;
 	unsigned long len = old_end - old_addr;
 	int err = 0;
+	int nr;
 
 	/*
 	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
@@ -237,10 +238,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
 
 	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
 				   new_ptep++, new_addr += PAGE_SIZE) {
-		if (pte_none(ptep_get(old_ptep)))
+		const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+		int max_nr = (old_end - old_addr) >> PAGE_SHIFT;
+
+		nr = 1;
+		old_pte = ptep_get(old_ptep);
+		if (pte_none(old_pte))
 			continue;
 
-		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
 		/*
 		 * If we are remapping a valid PTE, make sure
 		 * to flush TLB before we drop the PTL for the
@@ -252,8 +257,17 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		 * the TLB entry for the old mapping has been
 		 * flushed.
 		 */
-		if (pte_present(pte))
+		if (pte_present(old_pte)) {
+			if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
+				struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
+
+				if (folio && folio_test_large(folio))
+					nr = folio_pte_batch(folio, old_addr, old_ptep,
+					old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
+			}
 			force_flush = true;
+		}
+		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
 		pte = move_pte(pte, old_addr, new_addr);
 		pte = move_soft_dirty_pte(pte);
 
@@ -266,7 +280,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 				else if (is_swap_pte(pte))
 					pte = pte_swp_clear_uffd_wp(pte);
 			}
-			set_pte_at(mm, new_addr, new_ptep, pte);
+			set_ptes(mm, new_addr, new_ptep, pte, nr);
 		}
 	}
 
-- 
2.30.2

