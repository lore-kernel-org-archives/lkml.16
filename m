Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43712745E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736863; cv=none; b=NcPfjao1vKoUy2sy6EYKtenqxY8HuTG2bf+ns90xn+ZdktOE7mWLgxO6fccyBHwGniR1Vozk7IJVfNjZwNOqVnoOWsfCSEdoV1Dmu3gnhgd1+YjAH9ofWNDeMDluJhv33tlYjMBT7bQZksQNTrh8gyhvzWvkgBuFSn/ZTw1wbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736863; c=relaxed/simple;
	bh=opR+T7JR3ovyURRWyA/SsgRkfkYCiRq01dqj07y9JLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lha/SCIYvxw2g9r8qcknW8k0CHQSXJDzaj30SvR2GWOhQIJo3rTYfc8Oze9wSISPmY7HL2SZwjVxQW4nAVtDXMs+YE3fpQ2LYmE3gm3I05E8q2W4QGbsivpadMJr0pwjF+H+GGc2iy9RAFAt2lGLX1ozeMLW7c6lzkuo/2lkMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YCvwN9Ta; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GyJnhKgx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GnnYbCmL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFfAWKzQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YCvwN9Ta";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GyJnhKgx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GnnYbCmL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFfAWKzQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F2C011F896;
	Thu, 12 Jun 2025 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mM+EQfgav4JTijrrYwNxVJ5cWA0TaVl02vteWT3IIUQ=;
	b=YCvwN9TaVk4vujIq5Qpo3F8w3XAG7wrMLGbnaSHRzEzPrNyKTpkHDIeSrTHu74egToOWmz
	EUUfaGgip+z6g+5SRfEaSK9YGOPAXVRigtGEd4CHBIX6MtpQBZts1OGW6evQ+MyNxV2DbV
	ugiZvBAElYLsZeLBB/s8LTwol0eo5Nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mM+EQfgav4JTijrrYwNxVJ5cWA0TaVl02vteWT3IIUQ=;
	b=GyJnhKgxqg/7ZFDHz1Zcqd2VDR9jXIGCP67w5NYgNpLEymxF3hYBqR31H3ITgVsg/Nq3O0
	zUUMk4nVDbjrjfCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749736858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mM+EQfgav4JTijrrYwNxVJ5cWA0TaVl02vteWT3IIUQ=;
	b=GnnYbCmLzcoayfexXGZTm+30Md3rwnQ9vGDWwynt70RZQ1IJXX7NbcJ9lOUtcaYSt9l7PN
	IjpweHNfdIwWgVcMUDsgL+zh+9DGFQF3Go07HswLaw+Oo65EnLIL0Ok3VfUr45fbt7MLu8
	6HWrJQqfmWCpO/v+jVYkl1jKabAekVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749736858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mM+EQfgav4JTijrrYwNxVJ5cWA0TaVl02vteWT3IIUQ=;
	b=TFfAWKzQDawGA4ApzwhOmA5dGIat+RHSBMMJ49zY1z47OvAsVerJX4idHb8kMDuvVXfbj4
	nsuw3gfHhX0OykBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7406F132D8;
	Thu, 12 Jun 2025 14:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DSqoGZrdSmiUFAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 12 Jun 2025 14:00:58 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH] mm,memory: Define struct vm_fault directly in handle_mm_fault
Date: Thu, 12 Jun 2025 16:00:48 +0200
Message-ID: <20250612140048.378136-1-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

handle_mm_fault calls hugetlb_fault and __handle_mm_fault, and then these
two define their own struct vm_fault.
We can do better and define it directly one layer above, in handle_mm_fault.
The only thing is that we need to take care of hugetlb 'oddities' about the
mask and pgoff.
gfp_mask is not a problem because hugetlb does not use it directly in its code.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
Hi,

I'm sending this an RFC for two reasons.
The most important one is that I didn't do any sort of prolifing (I'll
do it if this carries on), so I'm not sure if there's a performance
regression with this applied.

Second reason is, well, hugetlb-oddities in handle_mm_fault(), uhmf..
Maybe there's a better way to do it more transparently.
I thought about (ab)using vma_kernel_pagesize() directly for the alignment,
, so we wouldn't have the !is_vm_hugetlb_page, but vma_kernel_pagesize checks
vma->vm_ops && vma->vm_ops->pagesize, before bailing out for PAGE_SIZE, so
pretty sure that will slow things down? Maybe we could add an unlikely there to
favour !hugetlb vmas.

On the good side, well, we just declare vm_fault struct in one place.

So, is this worth the hastle?
---
 include/linux/hugetlb.h |  7 +---
 mm/hugetlb.c            | 92 +++++++++++++++++------------------------
 mm/memory.c             | 81 +++++++++++++++++++-----------------
 3 files changed, 83 insertions(+), 97 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 42f374e828a2..eb32a850c99a 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -139,8 +139,7 @@ void hugetlb_report_meminfo(struct seq_file *);
 int hugetlb_report_node_meminfo(char *buf, int len, int nid);
 void hugetlb_show_meminfo_node(int nid);
 unsigned long hugetlb_total_pages(void);
-vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
-			unsigned long address, unsigned int flags);
+vm_fault_t hugetlb_fault(struct vm_fault *vmf);
 #ifdef CONFIG_USERFAULTFD
 int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 			     struct vm_area_struct *dst_vma,
@@ -463,9 +462,7 @@ static inline void __unmap_hugepage_range(struct mmu_gather *tlb,
 	BUG();
 }
 
-static inline vm_fault_t hugetlb_fault(struct mm_struct *mm,
-			struct vm_area_struct *vma, unsigned long address,
-			unsigned int flags)
+static inline vm_fault_t hugetlb_fault(struct vm_fault *vmf)
 {
 	BUG();
 	return 0;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d6b0f2b68beb..d9b639a899a2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6424,8 +6424,7 @@ static bool hugetlb_pte_stable(struct hstate *h, struct mm_struct *mm, unsigned
 	return same;
 }
 
-static vm_fault_t hugetlb_no_page(struct address_space *mapping,
-			struct vm_fault *vmf)
+static vm_fault_t hugetlb_no_page(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -6436,6 +6435,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	struct folio *folio;
 	pte_t new_pte;
 	bool new_folio, new_pagecache_folio = false;
+	struct address_space *mapping = vma->vm_file->f_mapping;
 	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
 
 	/*
@@ -6669,56 +6669,42 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx)
 }
 #endif
 
-vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
-			unsigned long address, unsigned int flags)
+vm_fault_t hugetlb_fault(struct vm_fault *vmf)
 {
 	vm_fault_t ret;
 	u32 hash;
 	struct folio *folio;
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long flags = vmf->flags;
+	struct mm_struct *mm = vma->vm_mm;
 	struct hstate *h = hstate_vma(vma);
-	struct address_space *mapping;
-	struct vm_fault vmf = {
-		.vma = vma,
-		.address = address & huge_page_mask(h),
-		.real_address = address,
-		.flags = flags,
-		.pgoff = vma_hugecache_offset(h, vma,
-				address & huge_page_mask(h)),
-		/* TODO: Track hugetlb faults using vm_fault */
-
-		/*
-		 * Some fields may not be initialized, be careful as it may
-		 * be hard to debug if called functions make assumptions
-		 */
-	};
 
 	/*
 	 * Serialize hugepage allocation and instantiation, so that we don't
 	 * get spurious allocation failures if two CPUs race to instantiate
 	 * the same page in the page cache.
 	 */
-	mapping = vma->vm_file->f_mapping;
-	hash = hugetlb_fault_mutex_hash(mapping, vmf.pgoff);
+	hash = hugetlb_fault_mutex_hash(vma->vm_file->f_mapping, vmf->pgoff);
 	mutex_lock(&hugetlb_fault_mutex_table[hash]);
 
 	/*
 	 * Acquire vma lock before calling huge_pte_alloc and hold
-	 * until finished with vmf.pte.  This prevents huge_pmd_unshare from
-	 * being called elsewhere and making the vmf.pte no longer valid.
+	 * until finished with vmf->pte.  This prevents huge_pmd_unshare from
+	 * being called elsewhere and making the vmf->pte no longer valid.
 	 */
 	hugetlb_vma_lock_read(vma);
-	vmf.pte = huge_pte_alloc(mm, vma, vmf.address, huge_page_size(h));
-	if (!vmf.pte) {
+	vmf->pte = huge_pte_alloc(mm, vma, vmf->address, huge_page_size(h));
+	if (!vmf->pte) {
 		hugetlb_vma_unlock_read(vma);
 		mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 		return VM_FAULT_OOM;
 	}
 
-	vmf.orig_pte = huge_ptep_get(mm, vmf.address, vmf.pte);
-	if (huge_pte_none_mostly(vmf.orig_pte)) {
-		if (is_pte_marker(vmf.orig_pte)) {
+	vmf->orig_pte = huge_ptep_get(mm, vmf->address, vmf->pte);
+	if (huge_pte_none_mostly(vmf->orig_pte)) {
+		if (is_pte_marker(vmf->orig_pte)) {
 			pte_marker marker =
-				pte_marker_get(pte_to_swp_entry(vmf.orig_pte));
+				pte_marker_get(pte_to_swp_entry(vmf->orig_pte));
 
 			if (marker & PTE_MARKER_POISONED) {
 				ret = VM_FAULT_HWPOISON_LARGE |
@@ -6737,14 +6723,14 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		 * hugetlb_no_page will drop vma lock and hugetlb fault
 		 * mutex internally, which make us return immediately.
 		 */
-		return hugetlb_no_page(mapping, &vmf);
+		return hugetlb_no_page(vmf);
 	}
 
 	ret = 0;
 
 	/* Not present, either a migration or a hwpoisoned entry */
-	if (!pte_present(vmf.orig_pte)) {
-		if (is_hugetlb_entry_migration(vmf.orig_pte)) {
+	if (!pte_present(vmf->orig_pte)) {
+		if (is_hugetlb_entry_migration(vmf->orig_pte)) {
 			/*
 			 * Release the hugetlb fault lock now, but retain
 			 * the vma lock, because it is needed to guard the
@@ -6753,9 +6739,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 			 * be released there.
 			 */
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-			migration_entry_wait_huge(vma, vmf.address, vmf.pte);
+			migration_entry_wait_huge(vma, vmf->address, vmf->pte);
 			return 0;
-		} else if (is_hugetlb_entry_hwpoisoned(vmf.orig_pte))
+		} else if (is_hugetlb_entry_hwpoisoned(vmf->orig_pte))
 			ret = VM_FAULT_HWPOISON_LARGE |
 			    VM_FAULT_SET_HINDEX(hstate_index(h));
 		goto out_mutex;
@@ -6768,33 +6754,33 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * spinlock.
 	 */
 	if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
-	    !(vma->vm_flags & VM_MAYSHARE) && !huge_pte_write(vmf.orig_pte)) {
-		if (vma_needs_reservation(h, vma, vmf.address) < 0) {
+	    !(vma->vm_flags & VM_MAYSHARE) && !huge_pte_write(vmf->orig_pte)) {
+		if (vma_needs_reservation(h, vma, vmf->address) < 0) {
 			ret = VM_FAULT_OOM;
 			goto out_mutex;
 		}
 		/* Just decrements count, does not deallocate */
-		vma_end_reservation(h, vma, vmf.address);
+		vma_end_reservation(h, vma, vmf->address);
 	}
 
-	vmf.ptl = huge_pte_lock(h, mm, vmf.pte);
+	vmf->ptl = huge_pte_lock(h, mm, vmf->pte);
 
 	/* Check for a racing update before calling hugetlb_wp() */
-	if (unlikely(!pte_same(vmf.orig_pte, huge_ptep_get(mm, vmf.address, vmf.pte))))
+	if (unlikely(!pte_same(vmf->orig_pte, huge_ptep_get(mm, vmf->address, vmf->pte))))
 		goto out_ptl;
 
 	/* Handle userfault-wp first, before trying to lock more pages */
-	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(mm, vmf.address, vmf.pte)) &&
-	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(vmf.orig_pte)) {
+	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(mm, vmf->address, vmf->pte)) &&
+	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(vmf->orig_pte)) {
 		if (!userfaultfd_wp_async(vma)) {
-			spin_unlock(vmf.ptl);
+			spin_unlock(vmf->ptl);
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-			return handle_userfault(&vmf, VM_UFFD_WP);
+			return handle_userfault(vmf, VM_UFFD_WP);
 		}
 
-		vmf.orig_pte = huge_pte_clear_uffd_wp(vmf.orig_pte);
-		set_huge_pte_at(mm, vmf.address, vmf.pte, vmf.orig_pte,
+		vmf->orig_pte = huge_pte_clear_uffd_wp(vmf->orig_pte);
+		set_huge_pte_at(mm, vmf->address, vmf->pte, vmf->orig_pte,
 				huge_page_size(hstate_vma(vma)));
 		/* Fallthrough to CoW */
 	}
@@ -6812,27 +6798,27 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * Representing this difference would be tricky with the current code,
 	 * so just hold the lock for the duration of hugetlb_wp().
 	 */
-	folio = page_folio(pte_page(vmf.orig_pte));
+	folio = page_folio(pte_page(vmf->orig_pte));
 	folio_lock(folio);
 	folio_get(folio);
 
 	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
-		if (!huge_pte_write(vmf.orig_pte)) {
-			ret = hugetlb_wp(&vmf);
+		if (!huge_pte_write(vmf->orig_pte)) {
+			ret = hugetlb_wp(vmf);
 			goto out_put_page;
 		} else if (likely(flags & FAULT_FLAG_WRITE)) {
-			vmf.orig_pte = huge_pte_mkdirty(vmf.orig_pte);
+			vmf->orig_pte = huge_pte_mkdirty(vmf->orig_pte);
 		}
 	}
-	vmf.orig_pte = pte_mkyoung(vmf.orig_pte);
-	if (huge_ptep_set_access_flags(vma, vmf.address, vmf.pte, vmf.orig_pte,
+	vmf->orig_pte = pte_mkyoung(vmf->orig_pte);
+	if (huge_ptep_set_access_flags(vma, vmf->address, vmf->pte, vmf->orig_pte,
 						flags & FAULT_FLAG_WRITE))
-		update_mmu_cache(vma, vmf.address, vmf.pte);
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 out_put_page:
 	folio_unlock(folio);
 	folio_put(folio);
 out_ptl:
-	spin_unlock(vmf.ptl);
+	spin_unlock(vmf->ptl);
 out_mutex:
 	hugetlb_vma_unlock_read(vma);
 
diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..1f3d756230a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6136,19 +6136,12 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
  * the result, the mmap_lock is not held on exit.  See filemap_fault()
  * and __folio_lock_or_retry().
  */
-static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
-		unsigned long address, unsigned int flags)
+static vm_fault_t __handle_mm_fault(struct vm_fault *vmf)
 {
-	struct vm_fault vmf = {
-		.vma = vma,
-		.address = address & PAGE_MASK,
-		.real_address = address,
-		.flags = flags,
-		.pgoff = linear_page_index(vma, address),
-		.gfp_mask = __get_fault_gfp_mask(vma),
-	};
+	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long vm_flags = vma->vm_flags;
+	unsigned long address = vmf->address;
 	pgd_t *pgd;
 	p4d_t *p4d;
 	vm_fault_t ret;
@@ -6158,18 +6151,18 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 	if (!p4d)
 		return VM_FAULT_OOM;
 
-	vmf.pud = pud_alloc(mm, p4d, address);
-	if (!vmf.pud)
+	vmf->pud = pud_alloc(mm, p4d, address);
+	if (!vmf->pud)
 		return VM_FAULT_OOM;
 retry_pud:
-	if (pud_none(*vmf.pud) &&
+	if (pud_none(*vmf->pud) &&
 	    thp_vma_allowable_order(vma, vm_flags,
 				TVA_IN_PF | TVA_ENFORCE_SYSFS, PUD_ORDER)) {
-		ret = create_huge_pud(&vmf);
+		ret = create_huge_pud(vmf);
 		if (!(ret & VM_FAULT_FALLBACK))
 			return ret;
 	} else {
-		pud_t orig_pud = *vmf.pud;
+		pud_t orig_pud = *vmf->pud;
 
 		barrier();
 		if (pud_trans_huge(orig_pud) || pud_devmap(orig_pud)) {
@@ -6178,58 +6171,58 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 			 * TODO once we support anonymous PUDs: NUMA case and
 			 * FAULT_FLAG_UNSHARE handling.
 			 */
-			if ((flags & FAULT_FLAG_WRITE) && !pud_write(orig_pud)) {
-				ret = wp_huge_pud(&vmf, orig_pud);
+			if ((vmf->flags & FAULT_FLAG_WRITE) && !pud_write(orig_pud)) {
+				ret = wp_huge_pud(vmf, orig_pud);
 				if (!(ret & VM_FAULT_FALLBACK))
 					return ret;
 			} else {
-				huge_pud_set_accessed(&vmf, orig_pud);
+				huge_pud_set_accessed(vmf, orig_pud);
 				return 0;
 			}
 		}
 	}
 
-	vmf.pmd = pmd_alloc(mm, vmf.pud, address);
-	if (!vmf.pmd)
+	vmf->pmd = pmd_alloc(mm, vmf->pud, address);
+	if (!vmf->pmd)
 		return VM_FAULT_OOM;
 
 	/* Huge pud page fault raced with pmd_alloc? */
-	if (pud_trans_unstable(vmf.pud))
+	if (pud_trans_unstable(vmf->pud))
 		goto retry_pud;
 
-	if (pmd_none(*vmf.pmd) &&
+	if (pmd_none(*vmf->pmd) &&
 	    thp_vma_allowable_order(vma, vm_flags,
 				TVA_IN_PF | TVA_ENFORCE_SYSFS, PMD_ORDER)) {
-		ret = create_huge_pmd(&vmf);
+		ret = create_huge_pmd(vmf);
 		if (!(ret & VM_FAULT_FALLBACK))
 			return ret;
 	} else {
-		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
+		vmf->orig_pmd = pmdp_get_lockless(vmf->pmd);
 
-		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
+		if (unlikely(is_swap_pmd(vmf->orig_pmd))) {
 			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
-			if (is_pmd_migration_entry(vmf.orig_pmd))
-				pmd_migration_entry_wait(mm, vmf.pmd);
+					  !is_pmd_migration_entry(vmf->orig_pmd));
+			if (is_pmd_migration_entry(vmf->orig_pmd))
+				pmd_migration_entry_wait(mm, vmf->pmd);
 			return 0;
 		}
-		if (pmd_trans_huge(vmf.orig_pmd) || pmd_devmap(vmf.orig_pmd)) {
-			if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
-				return do_huge_pmd_numa_page(&vmf);
+		if (pmd_trans_huge(vmf->orig_pmd) || pmd_devmap(vmf->orig_pmd)) {
+			if (pmd_protnone(vmf->orig_pmd) && vma_is_accessible(vma))
+				return do_huge_pmd_numa_page(vmf);
 
-			if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
-			    !pmd_write(vmf.orig_pmd)) {
-				ret = wp_huge_pmd(&vmf);
+			if ((vmf->flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
+			    !pmd_write(vmf->orig_pmd)) {
+				ret = wp_huge_pmd(vmf);
 				if (!(ret & VM_FAULT_FALLBACK))
 					return ret;
 			} else {
-				huge_pmd_set_accessed(&vmf);
+				huge_pmd_set_accessed(vmf);
 				return 0;
 			}
 		}
 	}
 
-	return handle_pte_fault(&vmf);
+	return handle_pte_fault(vmf);
 }
 
 /**
@@ -6366,11 +6359,21 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
 vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 			   unsigned int flags, struct pt_regs *regs)
 {
+	pgoff_t idx = linear_page_index(vma, address);
+	struct vm_fault vmf = {
+		.vma = vma,
+		.address = !is_vm_hugetlb_page(vma) ? address & PAGE_MASK
+			: address & huge_page_mask(hstate_vma(vma)),
+		.real_address = address,
+		.flags = flags,
+		.pgoff = !is_vm_hugetlb_page(vma) ? idx
+			: idx >> huge_page_order(hstate_vma(vma)),
+		.gfp_mask = __get_fault_gfp_mask(vma),
+	};
 	/* If the fault handler drops the mmap_lock, vma may be freed */
 	struct mm_struct *mm = vma->vm_mm;
 	vm_fault_t ret;
 	bool is_droppable;
-
 	__set_current_state(TASK_RUNNING);
 
 	ret = sanitize_fault_flags(vma, &flags);
@@ -6396,9 +6399,9 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 	lru_gen_enter_fault(vma);
 
 	if (unlikely(is_vm_hugetlb_page(vma)))
-		ret = hugetlb_fault(vma->vm_mm, vma, address, flags);
+		ret = hugetlb_fault(&vmf);
 	else
-		ret = __handle_mm_fault(vma, address, flags);
+		ret = __handle_mm_fault(&vmf);
 
 	/*
 	 * Warning: It is no longer safe to dereference vma-> after this point,
-- 
2.49.0

