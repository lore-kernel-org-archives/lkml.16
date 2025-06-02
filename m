Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6AF22A7EB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873787; cv=none; b=JkuvbKKarfrvd555Hexam6WsEUCb2kBX8kGXmT//kRSIFp64Un6pEvU42CMyLevmnKg/Ny8PabwcwwTof53Fvk57v7/ukLb50UPtADm7zYa49RGiRV47EwIshAKWcqDFjc5ilUvsbfydHq03lY+FPFvKRZ9pknkte90+yv2F7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873787; c=relaxed/simple;
	bh=YXTKmNuaYYh0okZdS0pTryRK1QT43No+ThGZKxBFkN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOxsQbsaKZ7LISo1m+IVrAHh1nT8pAob9IWK07FO25MOY7zMkXjYR1kcRdrVvOWlDzNBKB/8laGSulDxfZHoOYyaHmv6ubaBWUUxwrMyZBLzLdxoVWOyYy5okDjZeoMhliA5RNSwCCPjUmLYzCj6Gwk9wapsMer5NOxMffJPk5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66DAD21906;
	Mon,  2 Jun 2025 14:16:23 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C19DB13AE7;
	Mon,  2 Jun 2025 14:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qDhhLDayPWhqVAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 02 Jun 2025 14:16:22 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault and hugetlb_wp
Date: Mon,  2 Jun 2025 16:16:08 +0200
Message-ID: <20250602141610.173698-2-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602141610.173698-1-osalvador@suse.de>
References: <20250602141610.173698-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:9498, ipnet:::/1, country:IN]
X-Rspamd-Queue-Id: 66DAD21906
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

Recent events surfaced the fact that it is not clear why are we taking
certain locks in the hugetlb faulting path.
More specifically pagecache_folio's lock and folio lock in hugetlb_fault,
and folio lock in hugetlb_no_page.

When digging in the history, I saw that those locks were taken to protect
us against truncation, which back then was not serialized with the
hugetlb_fault_mutex as it is today.

For example, the lock in hugetlb_no_page, looking at the comment above:

 /*
  * Use page lock to guard against racing truncation
  * before we get page_table_lock.
  */
 new_folio = false;
 folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);

which was added by 'commit 4c8872659772 ("[PATCH] hugetlb: demand fault handler")'.
Back when that commit was added (2025), truncate_hugepages looked something like:

 truncate_hugepages
  lock_page(page)
   truncate_huge_page(page) <- it also removed it from the pagecache
  unlock_page(page)

While today we have

 remove_inode_hugepages
  mutex_lock(&hugetlb_fault_mutex_table[hash])
   remove_inode_single_folio
    folio_lock(folio)
     hugetlb_delete_from_page_cache
    folio_unlock
  mutex_unlock(&hugetlb_fault_mutex_table[hash])

And the same happened with the lock for pagecache_folio in hugetlb_fault(),
which was introduced in 'commit 04f2cbe35699 ("hugetlb: guarantee that COW
faults for a process that called mmap(MAP_PRIVATE) on hugetlbfs will succeed")',
when we did not have serialization against truncation yet.

The only worrisome part of dropping the locks that I considered is when
cow_from_owner is true and we cannot allocate another hugetlb page, because then
we drop all the locks, try to unmap the page from the other processes, and then
we re-take the locks again.

        hash = hugetlb_fault_mutex_hash(mapping, idx);
        hugetlb_vma_unlock_read(vma);
        mutex_unlock(&hugetlb_fault_mutex_table[hash]);

        unmap_ref_private(mm, vma, &old_folio->page,
                        vmf->address);

        mutex_lock(&hugetlb_fault_mutex_table[hash]);
        hugetlb_vma_lock_read(vma);
        spin_lock(vmf->ptl);

So, there is a small window where we are not holding the lock.

In this window, someone might have truncated the file (aka pagecache_folio),
and call hugetlb_unreserve_pages().
But I do not think it matters for the following reasons
1) we only retry in case the pte has not changed, which means that old_folio
   still is old_folio.
2) And if the original file got truncated in that window and reserves were
   adjusted, alloc_hugetlb_folio() will catch this under the lock when we
   retry again.

Another concern was brought up by James Houghton, about UFFDIO_CONTINUE
case, and whether we could end up mapping a hugetlb page which has not been
zeroed yet.
But mfill_atomic_hugetlb(), which calls hugetlb_mfill_atomic_pte(), holds the
mutex throughout the operation, so we cannot race with truncation/instantiation
either.

E.g: hugetlbfs_fallocate() will allocate the new hugetlb folio and zero it under
the mutex.

So, there should be no races.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 include/linux/hugetlb.h | 12 +++++
 mm/hugetlb.c            | 98 ++++++++++++++++++-----------------------
 2 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 42f374e828a2..a176724e1204 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -811,6 +811,12 @@ static inline unsigned int blocks_per_huge_page(struct hstate *h)
 	return huge_page_size(h) / 512;
 }
 
+static inline struct folio *filemap_get_hugetlb_folio(struct hstate *h,
+				struct address_space *mapping, pgoff_t idx)
+{
+	return filemap_get_folio(mapping, idx << huge_page_order(h));
+}
+
 static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
 				struct address_space *mapping, pgoff_t idx)
 {
@@ -1088,6 +1094,12 @@ static inline struct hugepage_subpool *hugetlb_folio_subpool(struct folio *folio
 	return NULL;
 }
 
+static inline struct folio *filemap_get_hugetlb_folio(struct hstate *h,
+				struct address_space *mapping, pgoff_t idx)
+{
+	return NULL;
+}
+
 static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
 				struct address_space *mapping, pgoff_t idx)
 {
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8746ed2fec13..f7bef660ef94 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6146,25 +6146,28 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 	i_mmap_unlock_write(mapping);
 }
 
+enum cow_context {
+	HUGETLB_FAULT_CONTEXT,
+	HUGETLB_NO_PAGE_CONTEXT,
+};
+
 /*
- * hugetlb_wp() should be called with page lock of the original hugepage held.
  * Called with hugetlb_fault_mutex_table held and pte_page locked so we
  * cannot race with other handlers or page migration.
  * Keep the pte_same checks anyway to make transition from the mutex easier.
  */
-static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
-		       struct vm_fault *vmf)
+static vm_fault_t hugetlb_wp(struct vm_fault *vmf, enum cow_context context)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
 	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
 	pte_t pte = huge_ptep_get(mm, vmf->address, vmf->pte);
 	struct hstate *h = hstate_vma(vma);
-	struct folio *old_folio;
-	struct folio *new_folio;
 	bool cow_from_owner = 0;
 	vm_fault_t ret = 0;
 	struct mmu_notifier_range range;
+	struct folio *old_folio, *new_folio, *pagecache_folio;
+	struct address_space *mapping = vma->vm_file->f_mapping;
 
 	/*
 	 * Never handle CoW for uffd-wp protected pages.  It should be only
@@ -6198,7 +6201,11 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 	 * we run out of free hugetlb folios: we would have to kill processes
 	 * in scenarios that used to work. As a side effect, there can still
 	 * be leaks between processes, for example, with FOLL_GET users.
+	 *
+	 * We need to take the lock here because the folio might be undergoing a
+	 * migration. e.g: see folio_try_share_anon_rmap_pte.
 	 */
+	folio_lock(old_folio);
 	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
 		if (!PageAnonExclusive(&old_folio->page)) {
 			folio_move_anon_rmap(old_folio, vma);
@@ -6209,22 +6216,44 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 						     vmf->pte);
 
 		delayacct_wpcopy_end();
+		folio_unlock(old_folio);
 		return 0;
 	}
 	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
 		       PageAnonExclusive(&old_folio->page), &old_folio->page);
+	folio_unlock(old_folio);
+
 
+	/*
+	 * We can be called from two different contexts: hugetlb_no_page or
+	 * hugetlb_fault.
+	 * When called from the latter, we try to find the original folio in
+	 * the pagecache and compare it against the current folio we have mapped
+	 * in the pagetables. If it differs, it means that this process already
+	 * CoWed and mapped the folio privately, so we know that a reservation
+	 * was already consumed.
+	 * This will be latter used to determine whether we need to unmap the folio
+	 * from other processes in case we fail to allocate a new folio.
+	 */
+	if (context == HUGETLB_FAULT_CONTEXT) {
+		pagecache_folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
+		if (IS_ERR(pagecache_folio))
+			pagecache_folio = NULL;
+		else
+			folio_put(pagecache_folio);
+	}
 	/*
 	 * If the process that created a MAP_PRIVATE mapping is about to
 	 * perform a COW due to a shared page count, attempt to satisfy
 	 * the allocation without using the existing reserves. The pagecache
-	 * page is used to determine if the reserve at this address was
+	 * folio is used to determine if the reserve at this address was already
 	 * consumed or not. If reserves were used, a partial faulted mapping
 	 * at the time of fork() could consume its reserves on COW instead
 	 * of the full address range.
 	 */
-	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
-			old_folio != pagecache_folio)
+	if (context == HUGETLB_FAULT_CONTEXT &&
+	    is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
+	    old_folio != pagecache_folio)
 		cow_from_owner = true;
 
 	folio_get(old_folio);
@@ -6245,7 +6274,6 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 		 * may get SIGKILLed if it later faults.
 		 */
 		if (cow_from_owner) {
-			struct address_space *mapping = vma->vm_file->f_mapping;
 			pgoff_t idx;
 			u32 hash;
 
@@ -6451,11 +6479,11 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	}
 
 	/*
-	 * Use page lock to guard against racing truncation
-	 * before we get page_table_lock.
+	 * hugetlb_fault_mutex_table guards us against truncation,
+	 * so we do not need to take locks on the folio.
 	 */
 	new_folio = false;
-	folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);
+	folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
 	if (IS_ERR(folio)) {
 		size = i_size_read(mapping->host) >> huge_page_shift(h);
 		if (vmf->pgoff >= size)
@@ -6521,6 +6549,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 		if (vma->vm_flags & VM_MAYSHARE) {
 			int err = hugetlb_add_to_page_cache(folio, mapping,
 							vmf->pgoff);
+			folio_unlock(folio);
 			if (err) {
 				/*
 				 * err can't be -EEXIST which implies someone
@@ -6537,7 +6566,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			}
 			new_pagecache_folio = true;
 		} else {
-			folio_lock(folio);
 			anon_rmap = 1;
 		}
 	} else {
@@ -6603,7 +6631,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	hugetlb_count_add(pages_per_huge_page(h), mm);
 	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
 		/* Optimization, do the COW without a second fault */
-		ret = hugetlb_wp(folio, vmf);
+		ret = hugetlb_wp(vmf, HUGETLB_NO_PAGE_CONTEXT);
 	}
 
 	spin_unlock(vmf->ptl);
@@ -6615,8 +6643,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	 */
 	if (new_folio)
 		folio_set_hugetlb_migratable(folio);
-
-	folio_unlock(folio);
 out:
 	hugetlb_vma_unlock_read(vma);
 
@@ -6636,7 +6662,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	if (new_folio && !new_pagecache_folio)
 		restore_reserve_on_error(h, vma, vmf->address, folio);
 
-	folio_unlock(folio);
 	folio_put(folio);
 	goto out;
 }
@@ -6671,7 +6696,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	vm_fault_t ret;
 	u32 hash;
 	struct folio *folio = NULL;
-	struct folio *pagecache_folio = NULL;
 	struct hstate *h = hstate_vma(vma);
 	struct address_space *mapping;
 	int need_wait_lock = 0;
@@ -6780,11 +6804,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		}
 		/* Just decrements count, does not deallocate */
 		vma_end_reservation(h, vma, vmf.address);
-
-		pagecache_folio = filemap_lock_hugetlb_folio(h, mapping,
-							     vmf.pgoff);
-		if (IS_ERR(pagecache_folio))
-			pagecache_folio = NULL;
 	}
 
 	vmf.ptl = huge_pte_lock(h, mm, vmf.pte);
@@ -6798,10 +6817,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(vmf.orig_pte)) {
 		if (!userfaultfd_wp_async(vma)) {
 			spin_unlock(vmf.ptl);
-			if (pagecache_folio) {
-				folio_unlock(pagecache_folio);
-				folio_put(pagecache_folio);
-			}
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 			return handle_userfault(&vmf, VM_UFFD_WP);
@@ -6813,23 +6828,12 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		/* Fallthrough to CoW */
 	}
 
-	/*
-	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
-	 * pagecache_folio, so here we need take the former one
-	 * when folio != pagecache_folio or !pagecache_folio.
-	 */
 	folio = page_folio(pte_page(vmf.orig_pte));
-	if (folio != pagecache_folio)
-		if (!folio_trylock(folio)) {
-			need_wait_lock = 1;
-			goto out_ptl;
-		}
-
 	folio_get(folio);
 
 	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
 		if (!huge_pte_write(vmf.orig_pte)) {
-			ret = hugetlb_wp(pagecache_folio, &vmf);
+			ret = hugetlb_wp(&vmf, HUGETLB_FAULT_CONTEXT);
 			goto out_put_page;
 		} else if (likely(flags & FAULT_FLAG_WRITE)) {
 			vmf.orig_pte = huge_pte_mkdirty(vmf.orig_pte);
@@ -6840,16 +6844,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 						flags & FAULT_FLAG_WRITE))
 		update_mmu_cache(vma, vmf.address, vmf.pte);
 out_put_page:
-	if (folio != pagecache_folio)
-		folio_unlock(folio);
 	folio_put(folio);
 out_ptl:
 	spin_unlock(vmf.ptl);
-
-	if (pagecache_folio) {
-		folio_unlock(pagecache_folio);
-		folio_put(pagecache_folio);
-	}
 out_mutex:
 	hugetlb_vma_unlock_read(vma);
 
@@ -6861,15 +6858,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		vma_end_read(vma);
 
 	mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-	/*
-	 * Generally it's safe to hold refcount during waiting page lock. But
-	 * here we just wait to defer the next page fault to avoid busy loop and
-	 * the page is not used after unlocked before returning from the current
-	 * page fault. So we are safe from accessing freed page, even if we wait
-	 * here without taking refcount.
-	 */
-	if (need_wait_lock)
-		folio_wait_locked(folio);
 	return ret;
 }
 
-- 
2.49.0

