Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD2A28C2C5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294548; cv=none; b=Plm8pTuxkBLf+EU6JmBH8he9RYXEAgwMoxMiroM6icnYADkoomWM9e6HzP9JU5AHBOH99ErNFK+f+dRqw8vst+OVO6zts5guuOI5nLwQKMGNAkPXfZhP9mHAaU35Qd3b070FS3cVn4vA2z8q0kxKG1xBPdWJkNrytC0fkM4cJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294548; c=relaxed/simple;
	bh=y0hbNfyG/rjNC/73E1ZP7TsUSimgrLut4xPmXwJh6EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrEkxmOpZA8FML92KQi5CqSQR+gtAZ2ALOMaaXUy6o3Mbx6ZvFn9j1cRps8CwDkzQsXK0rdXSoRRpciRpQ/BQoJqGKM2SeD2mgOhW219VKXcW/pwqe16CHys7zsyck6swPcSh+P6lsMkjm8luIHp2KJUqTamLIG79Fop1AYAZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v3SEP+35; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wm0ha8iP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v3SEP+35; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wm0ha8iP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v3SEP+35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wm0ha8iP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v3SEP+35";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wm0ha8iP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0AE7F21165;
	Mon, 30 Jun 2025 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoXI4BTUSdoTvkbJ+U0NIhJSkczrCgYuAhLAQMuINis=;
	b=v3SEP+358BahKnozexSGibwj68IhIV2tIfokbAz+C8xgncbLdXspeeFLgNgDBAwnhW5WO7
	JrdqfzkBGIhOdG5XoGtX3xHnEf3dtKCeGbRyBhCPt/CSCW1RhcaUmGBF2a43pSifFlpBNQ
	mrqt2HUY3NfLFbDmrUhANagDcP2vWYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoXI4BTUSdoTvkbJ+U0NIhJSkczrCgYuAhLAQMuINis=;
	b=Wm0ha8iPgYdYJ5vR9bd0ymE5Y3bcRM9hA8z/Pd57NiLoSVoPv9OOvPbRyHV5KIploWMbuK
	3Pob6s7jbgUuLOCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v3SEP+35;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wm0ha8iP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751294537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoXI4BTUSdoTvkbJ+U0NIhJSkczrCgYuAhLAQMuINis=;
	b=v3SEP+358BahKnozexSGibwj68IhIV2tIfokbAz+C8xgncbLdXspeeFLgNgDBAwnhW5WO7
	JrdqfzkBGIhOdG5XoGtX3xHnEf3dtKCeGbRyBhCPt/CSCW1RhcaUmGBF2a43pSifFlpBNQ
	mrqt2HUY3NfLFbDmrUhANagDcP2vWYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751294537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoXI4BTUSdoTvkbJ+U0NIhJSkczrCgYuAhLAQMuINis=;
	b=Wm0ha8iPgYdYJ5vR9bd0ymE5Y3bcRM9hA8z/Pd57NiLoSVoPv9OOvPbRyHV5KIploWMbuK
	3Pob6s7jbgUuLOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89F2213A24;
	Mon, 30 Jun 2025 14:42:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4DjrHkiiYmjqdAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 30 Jun 2025 14:42:16 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 1/5] mm,hugetlb: change mechanism to detect a COW on private mapping
Date: Mon, 30 Jun 2025 16:42:08 +0200
Message-ID: <20250630144212.156938-2-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630144212.156938-1-osalvador@suse.de>
References: <20250630144212.156938-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0AE7F21165
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.01

hugetlb_wp() checks whether the process is trying to COW on a private
mapping in order to know whether the reservation for that address was
already consumed. If it was consumed and we are the ownner of the mapping,
the folio will have to be unmapped from the other processes.

Currently, that check is done by looking up the folio in the pagecache and
compare it to the folio which is mapped in our pagetables.  If it differs,
it means we already mapped it privately before, consuming a reservation on
the way.  All we are interested in is whether the mapped folio is anonymous,
so we can simplify and check for that instead.

Link: https://lkml.kernel.org/r/20250627102904.107202-1-osalvador@suse.de
Link: https://lkml.kernel.org/r/20250627102904.107202-2-osalvador@suse.de
Link: https://lore.kernel.org/lkml/20250513093448.592150-1-gavinguo@igalia.com/ [1]
Fixes: 40549ba8f8e0 ("hugetlb: use new vma_lock for pmd sharing synchronization")
Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reported-by: Gavin Guo <gavinguo@igalia.com>
Closes: https://lore.kernel.org/lkml/20250513093448.592150-1-gavinguo@igalia.com/
Suggested-by: Peter Xu <peterx@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Cc: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 mm/hugetlb.c | 88 ++++++++++++++++++++--------------------------------
 1 file changed, 34 insertions(+), 54 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index fa7faf38c99e..14274a02dd14 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6149,8 +6149,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
  * cannot race with other handlers or page migration.
  * Keep the pte_same checks anyway to make transition from the mutex easier.
  */
-static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
-		       struct vm_fault *vmf)
+static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -6212,16 +6211,17 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 		       PageAnonExclusive(&old_folio->page), &old_folio->page);
 
 	/*
-	 * If the process that created a MAP_PRIVATE mapping is about to
-	 * perform a COW due to a shared page count, attempt to satisfy
-	 * the allocation without using the existing reserves. The pagecache
-	 * page is used to determine if the reserve at this address was
-	 * consumed or not. If reserves were used, a partial faulted mapping
-	 * at the time of fork() could consume its reserves on COW instead
-	 * of the full address range.
+	 * If the process that created a MAP_PRIVATE mapping is about to perform
+	 * a COW due to a shared page count, attempt to satisfy the allocation
+	 * without using the existing reserves.
+	 * In order to determine where this is a COW on a MAP_PRIVATE mapping it
+	 * is enough to check whether the old_folio is anonymous. This means that
+	 * the reserve for this address was consumed. If reserves were used, a
+	 * partial faulted mapping at the fime of fork() could consume its reserves
+	 * on COW instead of the full address range.
 	 */
 	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
-			old_folio != pagecache_folio)
+	    folio_test_anon(old_folio))
 		cow_from_owner = true;
 
 	folio_get(old_folio);
@@ -6600,7 +6600,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	hugetlb_count_add(pages_per_huge_page(h), mm);
 	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
 		/* Optimization, do the COW without a second fault */
-		ret = hugetlb_wp(folio, vmf);
+		ret = hugetlb_wp(vmf);
 	}
 
 	spin_unlock(vmf->ptl);
@@ -6668,10 +6668,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	vm_fault_t ret;
 	u32 hash;
 	struct folio *folio = NULL;
-	struct folio *pagecache_folio = NULL;
 	struct hstate *h = hstate_vma(vma);
 	struct address_space *mapping;
-	int need_wait_lock = 0;
+	bool need_wait_lock = false;
 	struct vm_fault vmf = {
 		.vma = vma,
 		.address = address & huge_page_mask(h),
@@ -6766,8 +6765,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * If we are going to COW/unshare the mapping later, we examine the
 	 * pending reservations for this page now. This will ensure that any
 	 * allocations necessary to record that reservation occur outside the
-	 * spinlock. Also lookup the pagecache page now as it is used to
-	 * determine if a reservation has been consumed.
+	 * spinlock.
 	 */
 	if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
 	    !(vma->vm_flags & VM_MAYSHARE) && !huge_pte_write(vmf.orig_pte)) {
@@ -6777,11 +6775,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
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
@@ -6795,10 +6788,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
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
@@ -6810,24 +6799,19 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		/* Fallthrough to CoW */
 	}
 
-	/*
-	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
-	 * pagecache_folio, so here we need take the former one
-	 * when folio != pagecache_folio or !pagecache_folio.
-	 */
-	folio = page_folio(pte_page(vmf.orig_pte));
-	if (folio != pagecache_folio)
-		if (!folio_trylock(folio)) {
-			need_wait_lock = 1;
-			goto out_ptl;
-		}
-
-	folio_get(folio);
-
 	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
 		if (!huge_pte_write(vmf.orig_pte)) {
-			ret = hugetlb_wp(pagecache_folio, &vmf);
-			goto out_put_page;
+			/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
+			folio = page_folio(pte_page(vmf.orig_pte));
+			if (!folio_trylock(folio)) {
+				need_wait_lock = true;
+				goto out_ptl;
+			}
+			folio_get(folio);
+			ret = hugetlb_wp(&vmf);
+			folio_unlock(folio);
+			folio_put(folio);
+			goto out_ptl;
 		} else if (likely(flags & FAULT_FLAG_WRITE)) {
 			vmf.orig_pte = huge_pte_mkdirty(vmf.orig_pte);
 		}
@@ -6836,17 +6820,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (huge_ptep_set_access_flags(vma, vmf.address, vmf.pte, vmf.orig_pte,
 						flags & FAULT_FLAG_WRITE))
 		update_mmu_cache(vma, vmf.address, vmf.pte);
-out_put_page:
-	if (folio != pagecache_folio)
-		folio_unlock(folio);
-	folio_put(folio);
 out_ptl:
 	spin_unlock(vmf.ptl);
-
-	if (pagecache_folio) {
-		folio_unlock(pagecache_folio);
-		folio_put(pagecache_folio);
-	}
 out_mutex:
 	hugetlb_vma_unlock_read(vma);
 
@@ -6859,11 +6834,16 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 	/*
-	 * Generally it's safe to hold refcount during waiting page lock. But
-	 * here we just wait to defer the next page fault to avoid busy loop and
-	 * the page is not used after unlocked before returning from the current
-	 * page fault. So we are safe from accessing freed page, even if we wait
-	 * here without taking refcount.
+	 * hugetlb_wp drops all the locks, but the folio lock, before trying to
+	 * unmap the folio from other processes. During that window, if another
+	 * process mapping that folio faults in, it will take the mutex and then
+	 * it will wait on folio_lock, causing an ABBA deadlock.
+	 * Use trylock instead and bail out if we fail.
+	 *
+	 * Ideally, we should hold a refcount on the folio we wait for, but we do
+	 * not want to use the folio after it becomes unlocked, but rather just
+	 * wait for it to become unlocked, so hopefully next fault successes on
+	 * the trylock.
 	 */
 	if (need_wait_lock)
 		folio_wait_locked(folio);
-- 
2.50.0

