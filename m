Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA7D23D294
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577601; cv=none; b=CGUUcze8yJutQs0ZEbbP6qUuDuULCwYBcDy0SMexH/OySl1nFqxXlwzpYYb8RyzfJGpyahcrrrDSQbGhUe7DYv75+YrDR22iYY72ERlGgYMyXq8/SFVHzqWFapoAR7wYxCykR9h+N8w4ABGwaKAnWrbUl8HFj17GQ7ZHOlKFcuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577601; c=relaxed/simple;
	bh=qFiYilPkyQ+3tfisV3B6mD/ZbU0Ol9CgXjXC7PeNZSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0jrBaUyRFnGxaZ1IBv4EGbGkXg64gOuU3IWS0vf1w+sfB78wiPnCMHJeHFrNaSN28gDCB8kR30Ht9VgCQ0D2/9ebwFVixfKrWLgXRAEaxsVFSCcgwoBqT5/5Vp/NjT/aMfnboAa3ReruKqZqg3kaXPwcPAPrS87FiPwD6Zr0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jghbsS5Y; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jghbsS5Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Qv5uxvOXAGEzzIDNTYEGbekXRGyhhi4X4rV4Rtk6ZvY=; b=jghbsS5YSHe8w3LBrqGZUa9pzp
	MOYMpizHzLXjFvmjhQZ6oSg0Qx4tIOqknxI9s+KpUSUw/UN7qfWa2659QlI0d7pc8Q8IgqoFGDBew
	wIEJT+qqmadiV0iY/2GmP+dPJ0E+mN42rjdUE1Fz0qcBAlCvrqYA+ZEF+HwMIF9ZIQZ7Scnwe4tf8
	XgWF/NKUshdj+uctNPhg8pJr0EmhoQV79evuxiU/rbJyCHOKuOH0ioAexDfSlJHpzl/XpBzTscROj
	RwhmhR0w9MCkIftqBi+uTo8Q702DSFkgVXaE/4FNrEaiVbeHTl+B6AClaBKyBiVe4ItgH/czc8BPE
	q0uQKcKw==;
Received: from 114-44-196-209.dynamic-ip.hinet.net ([114.44.196.209] helo=gavin-HP-Z840-Workstation..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u8GT4-008HIu-8c; Fri, 25 Apr 2025 12:39:38 +0200
From: Gavin Guo <gavinguo@igalia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: gshan@redhat.com,
	david@redhat.com,
	willy@infradead.org,
	ziy@nvidia.com,
	linmiaohe@huawei.com,
	hughd@google.com,
	revest@google.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm/huge_memory: Adjust try_to_migrate_one() and split_huge_pmd_locked()
Date: Fri, 25 Apr 2025 18:38:58 +0800
Message-ID: <20250425103859.825879-2-gavinguo@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425103859.825879-1-gavinguo@igalia.com>
References: <20250425103859.825879-1-gavinguo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The split_huge_pmd_locked function currently performs redundant checks
for migration entries and folio validation that are already handled by
the page_vma_mapped_walk mechanism in try_to_migrate_one.

Specifically, page_vma_mapped_walk already ensures that:
- The folio is properly mapped in the given VMA area
- pmd_trans_huge, pmd_devmap, and migration entry validation are
performed

To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
handling to the while loop checking and removing these duplicate checks
from split_huge_pmd_locked.

Suggested-by: David Hildenbrand <david@redhat.com>
Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com/
Signed-off-by: Gavin Guo <gavinguo@igalia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 21 ++-------------------
 mm/rmap.c        | 18 +++++++++---------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 47d76d03ce30..485a0ba011af 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3075,27 +3075,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze, struct folio *folio)
 {
-	bool pmd_migration = is_pmd_migration_entry(*pmd);
-
-	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
-	VM_BUG_ON(freeze && !folio);
-
-	/*
-	 * When the caller requests to set up a migration entry, we
-	 * require a folio to check the PMD against. Otherwise, there
-	 * is a risk of replacing the wrong folio.
-	 */
-	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) || pmd_migration) {
-		/*
-		 * Do not apply pmd_folio() to a migration entry; and folio lock
-		 * guarantees that it must be of the wrong folio anyway.
-		 */
-		if (folio && (pmd_migration || folio != pmd_folio(*pmd)))
-			return;
+	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
+	    is_pmd_migration_entry(*pmd))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
-	}
 }
 
 void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..b53a4dcaeaae 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2291,13 +2291,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	if (flags & TTU_SYNC)
 		pvmw.flags = PVMW_SYNC;
 
-	/*
-	 * unmap_page() in mm/huge_memory.c is the only user of migration with
-	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
-	 */
-	if (flags & TTU_SPLIT_HUGE_PMD)
-		split_huge_pmd_address(vma, address, true, folio);
-
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
 	 * For hugetlb, it could be much worse if we need to do pud
@@ -2323,9 +2316,16 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	mmu_notifier_invalidate_range_start(&range);
 
 	while (page_vma_mapped_walk(&pvmw)) {
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
+			if (flags & TTU_SPLIT_HUGE_PMD) {
+				split_huge_pmd_locked(vma, pvmw.address,
+						      pvmw.pmd, true, NULL);
+				ret = false;
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 			subpage = folio_page(folio,
 				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
@@ -2337,8 +2337,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 			continue;
-		}
 #endif
+		}
 
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
-- 
2.43.0

