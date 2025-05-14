Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9285329670E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253882; cv=none; b=O2TyPAdnV7bFkUKbe2A3qPbDS6ZO7sNlHSJssa2FxKM6++Ts6obmLfQQVOrqWAZvC7XuQ7tHEwYie39PY+HIJcqlhn8z1zGpsd/h83UHFaN0YCpQu6U618NPJ4QZgVSb9ssHcFBml+FBBotjBbWkQBS0COm0PDww40bHLk+fA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253882; c=relaxed/simple;
	bh=1m3Flukzu2OtP5nQk1Q6uEPAKv2N1F31sXW3Ux+679w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peXCK4hcKlStsF0PPe1+lj2esxyshzh6jprthLoMMxDeKGvJJhTBdQWfsYSfIy3IVZaB6i8ij1Vbzkw8SND0KRTG+E4+5wkuCh5xck9g2fY0URIJb/LaBONUHLnRVdqOsl2ScAbnHuM1OerKL+ali4X8fhvwf9hzi/mqpnUSCeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/w6m42R; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/w6m42R"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-879d2e419b9so108179a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253880; x=1747858680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=25Q1Yv+hNokOpjmRGAttX4k51kirjUUTLaen48KpN1o=;
        b=j/w6m42RaSBdU7MEdBMEgNSketR6Rz/3aEa/XjTNkO3dU3i/Cm8M+PTe928+xPYjDL
         18dk5aM2C04TycAZOa5ZkjRFBo54qWIV9SxIZbb/jzJHyWGCOFrZyFefBKL0eKq8Qa6j
         Ai6soR/buItwP08+E+Qh2RAs/mGMB6uzLoBZz3F7dasByd5dcqB3TZbXUnC1Cns0nBCp
         fVau551jkj+DX1YLra3VqfdKzgaN1c4Wyv3ZVGWg7ySxAOcswbQpRHxi+rx5m4Vlw30e
         WcU9Bei2JWV88cxnSm/1TsOWP1rcAMJGM07JTBWbZOuuMhiTGixKrsR5hTDp/owNslCt
         y/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253880; x=1747858680;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25Q1Yv+hNokOpjmRGAttX4k51kirjUUTLaen48KpN1o=;
        b=Na8oZKdzU9HJFJY5hOjMu1nnebUClXnl3Vk5PRnYLPd+rb/x8viWSlob/3oHW0OQ4h
         DL+G2DBdDHGtMLkaFD9V2yJTVRdKAEkHqyj4kyyVCOejjP7PM0THO2mD2h3F6/iZg95y
         QmjHVlz038X2Y4WNQDRTGkKmL9dViOWn2CSUjW8FnU9vKY3Tk3kVSTthRmzbipiFG/qU
         3QtAsWVozmhObnILeCmzOFRr18WQZBqK2EqhlrrIXYcGNu0tZM03fD6I5f2ceN9sL55Q
         xN3SvumBOQrjvrmWinUsPjLyv3hQ0t+FgVoOgD417XDKTpJm8z4Rrjrk8+dVrsQ7mJ/l
         e+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV1xfGqckKIehKmlDzmDRTqq8aT+nO+bHeYOo1cyHXBohPM/kcTMyl9c0SNWX+OSXQzPbs1bY3Y9sJGJBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9yJIzAdsGQ8QJyjfqsmiWLHSGsQigdIpyvfAZ7crf4HA3QUn
	E19fLkj0QV2zFy/NtS6bkk7XqrwP0iah9gpfCj5sJSrbZr3lo2pp
X-Gm-Gg: ASbGncvzRlWlkb34Va3UGvkPKY3r0Hp1iqQRj/H1t9Uctdk5lgD44W/EM0WmcDgC6LR
	R4nTJW2NIQrirkqFTLMGDRUkxOfqW1SWPJnrmAxdEUVVyzi3rqAFqUuh4pjmJsafSDv3fLUqY37
	zl20vpPuerWy6epJ6o0DosDkNwvbK4kKNNnQAFhki9eo7ak0dMPQF9dzSTUuHH0XSYoYTyNZbcB
	HESyzaHHwyn9JB3b7hLijH0lHp/LlL59mcTY1OLhMuxeLoLEVgu5b65w72QqgFf0B8gRaeJpbgI
	PgTQttn2OKXqvmRrWIEhICF8baNK1DDSPS/R2yQM0rhcH40yAZtpKDPHUrWneb/6g0Lqd05B
X-Google-Smtp-Source: AGHT+IE/0wyVciK07HRw23F6e9hEUoD/YPsV+T8KsMomKY5CTMO95aEtaQ6T4x/aeOcWWCBZwLOuFA==
X-Received: by 2002:a17:90b:35d2:b0:2ee:f076:20fb with SMTP id 98e67ed59e1d1-30e2e613263mr8548053a91.17.1747253879695;
        Wed, 14 May 2025 13:17:59 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.17.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:17:59 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 04/28] mm, swap: split readahead update out of swap cache lookup
Date: Thu, 15 May 2025 04:17:04 +0800
Message-ID: <20250514201729.48420-5-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514201729.48420-1-ryncsn@gmail.com>
References: <20250514201729.48420-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Decouple readahead update with swap cache lookup. No feature change.

After this, swap_cache_get_folio is the only entry for getting folios
from the swap cache. There are only two callers of it want to update
readahead statistic.

There are only three special cases for accessing swap cache space now:
huge memory splitting, migration and shmem replacing, they directly
modify the Xarray. Following commit will wrap their accesses to the
swap cache with special helpers too.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory.c      |  6 ++-
 mm/mincore.c     |  3 +-
 mm/shmem.c       |  5 ++-
 mm/swap.h        | 13 +++++--
 mm/swap_state.c  | 99 +++++++++++++++++++++++-------------------------
 mm/swapfile.c    | 11 +++---
 mm/userfaultfd.c |  5 +--
 7 files changed, 72 insertions(+), 70 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 5cb48f262ab0..18b5a77a0a4b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4567,9 +4567,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (unlikely(!si))
 		goto out;
 
-	folio = swap_cache_get_folio(entry, vma, vmf->address);
-	if (folio)
+	folio = swap_cache_get_folio(entry);
+	if (folio) {
+		swap_update_readahead(folio, vma, vmf->address);
 		page = folio_file_page(folio, swp_offset(entry));
+	}
 	swapcache = folio;
 
 	if (!folio) {
diff --git a/mm/mincore.c b/mm/mincore.c
index 7ee88113d44c..a57a9ee9e93d 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -62,8 +62,7 @@ static unsigned char mincore_swap(swp_entry_t entry)
 	/* Prevent swap device to being swapoff under us */
 	si = get_swap_device(entry);
 	if (si) {
-		folio = filemap_get_folio(swap_address_space(entry),
-					  swap_cache_index(entry));
+		folio = swap_cache_get_folio(entry);
 		put_swap_device(si);
 	}
 	if (folio) {
diff --git a/mm/shmem.c b/mm/shmem.c
index 972bd0eca439..01f29cb31c7a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2259,7 +2259,9 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	}
 
 	/* Look it up and read it in.. */
-	folio = swap_cache_get_folio(swap, NULL, 0);
+	folio = swap_cache_get_folio(swap);
+	if (folio)
+		swap_update_readahead(folio, NULL, 0);
 	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
 		bool fallback_order0 = false;
@@ -2350,7 +2352,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
 		}
 	}
-
 alloced:
 	/* We have to do this with folio locked to prevent races */
 	folio_lock(folio);
diff --git a/mm/swap.h b/mm/swap.h
index 4f85195ab83d..e83109ad1456 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -60,8 +60,7 @@ void delete_from_swap_cache(struct folio *folio);
 void clear_shadow_from_swap_cache(int type, unsigned long begin,
 				  unsigned long end);
 void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
-struct folio *swap_cache_get_folio(swp_entry_t entry,
-		struct vm_area_struct *vma, unsigned long addr);
+struct folio *swap_cache_get_folio(swp_entry_t entry);
 struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct vm_area_struct *vma, unsigned long addr,
 		struct swap_iocb **plug);
@@ -72,6 +71,8 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
 		struct mempolicy *mpol, pgoff_t ilx);
 struct folio *swapin_readahead(swp_entry_t entry, gfp_t flag,
 		struct vm_fault *vmf);
+void swap_update_readahead(struct folio *folio, struct vm_area_struct *vma,
+			   unsigned long addr);
 
 static inline unsigned int folio_swap_flags(struct folio *folio)
 {
@@ -138,6 +139,11 @@ static inline struct folio *swapin_readahead(swp_entry_t swp, gfp_t gfp_mask,
 	return NULL;
 }
 
+static inline void swap_update_readahead(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long addr)
+{
+}
+
 static inline int swap_writepage(struct page *p, struct writeback_control *wbc)
 {
 	return 0;
@@ -147,8 +153,7 @@ static inline void swapcache_clear(struct swap_info_struct *si, swp_entry_t entr
 {
 }
 
-static inline struct folio *swap_cache_get_folio(swp_entry_t entry,
-		struct vm_area_struct *vma, unsigned long addr)
+static inline struct folio *swap_cache_get_folio(swp_entry_t entry)
 {
 	return NULL;
 }
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 4117ea4e7afc..bca201100138 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -166,6 +166,21 @@ void __delete_from_swap_cache(struct folio *folio,
 	__lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr);
 }
 
+/*
+ * Lookup a swap entry in the swap cache. A found folio will be returned
+ * unlocked and with its refcount incremented.
+ *
+ * Caller must hold a reference on the swap device.
+ */
+struct folio *swap_cache_get_folio(swp_entry_t entry)
+{
+	struct folio *folio = filemap_get_folio(swap_address_space(entry),
+						swap_cache_index(entry));
+	if (!IS_ERR(folio))
+		return folio;
+	return NULL;
+}
+
 /*
  * This must be called only on folios that have
  * been verified to be in the swap cache and locked.
@@ -274,54 +289,40 @@ static inline bool swap_use_vma_readahead(void)
 }
 
 /*
- * Lookup a swap entry in the swap cache. A found folio will be returned
- * unlocked and with its refcount incremented - we rely on the kernel
- * lock getting page table operations atomic even if we drop the folio
- * lock before returning.
- *
- * Caller must lock the swap device or hold a reference to keep it valid.
+ * Update the readahead statistics of a vma or globally.
  */
-struct folio *swap_cache_get_folio(swp_entry_t entry,
-		struct vm_area_struct *vma, unsigned long addr)
+void swap_update_readahead(struct folio *folio,
+			   struct vm_area_struct *vma,
+			   unsigned long addr)
 {
-	struct folio *folio;
-
-	folio = filemap_get_folio(swap_address_space(entry), swap_cache_index(entry));
-	if (!IS_ERR(folio)) {
-		bool vma_ra = swap_use_vma_readahead();
-		bool readahead;
+	bool readahead, vma_ra = swap_use_vma_readahead();
 
-		/*
-		 * At the moment, we don't support PG_readahead for anon THP
-		 * so let's bail out rather than confusing the readahead stat.
-		 */
-		if (unlikely(folio_test_large(folio)))
-			return folio;
-
-		readahead = folio_test_clear_readahead(folio);
-		if (vma && vma_ra) {
-			unsigned long ra_val;
-			int win, hits;
-
-			ra_val = GET_SWAP_RA_VAL(vma);
-			win = SWAP_RA_WIN(ra_val);
-			hits = SWAP_RA_HITS(ra_val);
-			if (readahead)
-				hits = min_t(int, hits + 1, SWAP_RA_HITS_MAX);
-			atomic_long_set(&vma->swap_readahead_info,
-					SWAP_RA_VAL(addr, win, hits));
-		}
-
-		if (readahead) {
-			count_vm_event(SWAP_RA_HIT);
-			if (!vma || !vma_ra)
-				atomic_inc(&swapin_readahead_hits);
-		}
-	} else {
-		folio = NULL;
+	/*
+	 * At the moment, we don't support PG_readahead for anon THP
+	 * so let's bail out rather than confusing the readahead stat.
+	 */
+	if (unlikely(folio_test_large(folio)))
+		return;
+
+	readahead = folio_test_clear_readahead(folio);
+	if (vma && vma_ra) {
+		unsigned long ra_val;
+		int win, hits;
+
+		ra_val = GET_SWAP_RA_VAL(vma);
+		win = SWAP_RA_WIN(ra_val);
+		hits = SWAP_RA_HITS(ra_val);
+		if (readahead)
+			hits = min_t(int, hits + 1, SWAP_RA_HITS_MAX);
+		atomic_long_set(&vma->swap_readahead_info,
+				SWAP_RA_VAL(addr, win, hits));
 	}
 
-	return folio;
+	if (readahead) {
+		count_vm_event(SWAP_RA_HIT);
+		if (!vma || !vma_ra)
+			atomic_inc(&swapin_readahead_hits);
+	}
 }
 
 struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
@@ -337,14 +338,10 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 	*new_page_allocated = false;
 	for (;;) {
 		int err;
-		/*
-		 * First check the swap cache.  Since this is normally
-		 * called after swap_cache_get_folio() failed, re-calling
-		 * that would confuse statistics.
-		 */
-		folio = filemap_get_folio(swap_address_space(entry),
-					  swap_cache_index(entry));
-		if (!IS_ERR(folio))
+
+		/* Check the swap cache in case the folio is already there */
+		folio = swap_cache_get_folio(entry);
+		if (folio)
 			goto got_folio;
 
 		/*
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6b115149b845..29e918102355 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -213,15 +213,14 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 				 unsigned long offset, unsigned long flags)
 {
 	swp_entry_t entry = swp_entry(si->type, offset);
-	struct address_space *address_space = swap_address_space(entry);
 	struct swap_cluster_info *ci;
 	struct folio *folio;
 	int ret, nr_pages;
 	bool need_reclaim;
 
 again:
-	folio = filemap_get_folio(address_space, swap_cache_index(entry));
-	if (IS_ERR(folio))
+	folio = swap_cache_get_folio(entry);
+	if (!folio)
 		return 0;
 
 	nr_pages = folio_nr_pages(folio);
@@ -2098,7 +2097,7 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 		pte_unmap(pte);
 		pte = NULL;
 
-		folio = swap_cache_get_folio(entry, vma, addr);
+		folio = swap_cache_get_folio(entry);
 		if (!folio) {
 			struct vm_fault vmf = {
 				.vma = vma,
@@ -2324,8 +2323,8 @@ static int try_to_unuse(unsigned int type)
 	       (i = find_next_to_unuse(si, i)) != 0) {
 
 		entry = swp_entry(type, i);
-		folio = filemap_get_folio(swap_address_space(entry), swap_cache_index(entry));
-		if (IS_ERR(folio))
+		folio = swap_cache_get_folio(entry);
+		if (!folio)
 			continue;
 
 		/*
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bc473ad21202..e5a0db7f3331 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1389,9 +1389,8 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 		 * separately to allow proper handling.
 		 */
 		if (!src_folio)
-			folio = filemap_get_folio(swap_address_space(entry),
-					swap_cache_index(entry));
-		if (!IS_ERR_OR_NULL(folio)) {
+			folio = swap_cache_get_folio(entry);
+		if (folio) {
 			if (folio_test_large(folio)) {
 				err = -EBUSY;
 				folio_put(folio);
-- 
2.49.0

