Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C227297A4C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253934; cv=none; b=jdgx/WWGZpNJ+EvZpHAeIz6MdCLeh6e7j4510xM3KUJKKWB5kKkKu0+y3O0eLgQLaLd3hbuPsIpWKqtP7zgChmGoYTWE9dLBrMt3QA430C/fLJGg5X3vBqJRiMkGg+gmh1xh2FiqAcW0OvhCBKDw8ZaTE27c9Fb5L/el/9JA2f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253934; c=relaxed/simple;
	bh=3M6XTveBD7Zx7XOmQ18LCWg/UdZJFKCSSNqaEwS2PHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuwsLqDS7vxtY1oyg/3Otc88GqfE3W34lpn9Qu22z98+49FjdWJkBWXXKND5zY1e+KzytRZCm1odRiX16fLENXjcJefthi3R7DL7oz8Yyk1usrw96oiKAups6DJrqvuw3RE96dYs5aJZna7SlQp+Q0zw27fyaSGMHkmu7phhZ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5iFGUyC; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5iFGUyC"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-879d2e419b9so108776a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253932; x=1747858732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Inn5hnMzAYF/hvn9qgsv0iMlGjCtx2951Y0vV9NByg=;
        b=P5iFGUyCBsnWfd6QVBegHwuEaitct3I9aRu88hAxInT2mP4PbO2TcZ8oeFAhJslRi3
         A3UaZUK3w9hQ8XPxqilaQlrLmRW0YDAAYx5lQTBLFm362bf0YsUfLuzNRNLUzj3G/FR4
         AD8Bny81xErn1wHH/N4lK5zMwKevqs3BvuAs8O5yuUy+Hv9Yrvsy8rWOcyuRk5XWIhcs
         tusptUJ2DCGFPIxYGaD1pAAUQ2b1i6j18yq9Dg8uyTOppu1GGQZ3cQm0k0PQsfYtp/AG
         AdXthw3+Q7udQzfdV1wRS5KtKuH0ioyPVEUgX5H2rfBkJLf4jKJWgqq9uVdQvNejIzQv
         /nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253932; x=1747858732;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Inn5hnMzAYF/hvn9qgsv0iMlGjCtx2951Y0vV9NByg=;
        b=gmGJkMw8Lssdwh27VAflyj5FJP2gfPU6KsGwjHSzXwduUyOkNadmLuo3tU5zfRIM8D
         F2PuysjNJ8RdDoslka1dJi7zhA6BGyixTPsZ8e5IZ2DjF3HesUaGF1QP8NJXhugp8k2E
         /NkcAUuVi1HmL1sPphLP2+ssznOGohh8/lIrzwSNnVkX+53elyftgTIvk9mpCxwXeH+k
         GaIu+BnEeRYNvpSxXccVfba8rk8vFb7rxcNbFJR6gJrtOvSwHYPWH3ejDndRaN82Y46H
         W6UzH1dNeiYZ4tict0n0KC/VF41wyBUaPcaZLaXFsGAMMW57hIKWvE3mKOsrA4d20R7F
         BDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1RMX1LTFNIxg9ccDkhjiv1bi2M3DXkawj9cE5gyBCR+/fO5AO64nKaW4jLnhWLKD+Z0Uupb2yumim/ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcdDBIC/gXSboet/QjW6qL+OiweOC7+SXAFY/HnkdknDJ64fLD
	iS7in8C2m6k5B+VWdwyKTXzxD3nESf3ynib+ki+7T0uPzmlnATbC
X-Gm-Gg: ASbGnctUO5f4ZR+MGOEFFSFX8LSynSnxz8UV3bkBsiPJMCCGBPPurGT2T+mWYw1Rzgw
	1HVbSONjgYG8Nms63q7yeOQslW8CLi4LeVW+BtO9KI4fClBPdPBRjYDGRBljTnNK2JuR1Nc1ZOh
	o9WjqmuXR1AO9wRkWrZ/fKmnKF/MraEM3zxjjJVBEUUQyB022dzx/kBZiMFOzG0nqwKKTKt27yC
	lLX0bY49zroKaZ5YBx5GbJ690JugPoqJh4u4zAi42frWOXi4MTyKsmLQyghKty+l5MNivHlGgHj
	hGVdJXsT6jOJ4SF3b0Q/ify2oVr2w9q4hJsmpwpqtnPKyAA9V3YT2lhj3iaskLFPJ0VqCn+q
X-Google-Smtp-Source: AGHT+IECeWsHKXpnFhae71pLlnfK923YZ7Xrln1JPPj4G0ESoJT5CC8nJJ+k9tOkE46IEUgTqyvRzg==
X-Received: by 2002:a17:90b:35d2:b0:2ee:f076:20fb with SMTP id 98e67ed59e1d1-30e2e613263mr8552200a91.17.1747253931813;
        Wed, 14 May 2025 13:18:51 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:51 -0700 (PDT)
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
Subject: [PATCH 14/28] mm/shmem: never bypass the swap cache for SWP_SYNCHRONOUS_IO
Date: Thu, 15 May 2025 04:17:14 +0800
Message-ID: <20250514201729.48420-15-ryncsn@gmail.com>
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

Now the overhead of the swap cache is trivial to none, bypassing the
swap cache is no longer a valid optimization.

So remove the cache bypass swap path for simplification. Many helpers
and functions can be dropped now.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c    | 109 ++++++++++++++++++--------------------------------
 mm/swap.h     |   4 --
 mm/swapfile.c |  35 +++++-----------
 3 files changed, 48 insertions(+), 100 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index da80a8faa39e..e87eff03c08b 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -899,7 +899,9 @@ static int shmem_add_to_page_cache(struct folio *folio,
 				   pgoff_t index, void *expected, gfp_t gfp)
 {
 	XA_STATE_ORDER(xas, &mapping->i_pages, index, folio_order(folio));
-	long nr = folio_nr_pages(folio);
+	unsigned long nr = folio_nr_pages(folio);
+	swp_entry_t iter, swap;
+	void *entry;
 
 	VM_BUG_ON_FOLIO(index != round_down(index, nr), folio);
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
@@ -912,13 +914,19 @@ static int shmem_add_to_page_cache(struct folio *folio,
 	gfp &= GFP_RECLAIM_MASK;
 	folio_throttle_swaprate(folio, gfp);
 
+	if (expected)
+		swap = iter = radix_to_swp_entry(expected);
+
 	do {
 		xas_lock_irq(&xas);
-		if (expected != xas_find_conflict(&xas)) {
-			xas_set_err(&xas, -EEXIST);
-			goto unlock;
+		xas_for_each_conflict(&xas, entry) {
+			if (!expected || entry != swp_to_radix_entry(iter)) {
+				xas_set_err(&xas, -EEXIST);
+				goto unlock;
+			}
+			iter.val += 1 << xas_get_order(&xas);
 		}
-		if (expected && xas_find_conflict(&xas)) {
+		if (expected && iter.val - nr != swap.val) {
 			xas_set_err(&xas, -EEXIST);
 			goto unlock;
 		}
@@ -1973,14 +1981,12 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 	return ERR_PTR(error);
 }
 
-static struct folio *shmem_swap_alloc_folio(struct inode *inode,
+static struct folio *shmem_swapin_folio_order(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
 		swp_entry_t entry, int order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
-	struct folio *new;
-	void *shadow;
-	int nr_pages;
+	struct folio *new, *swapcache;
 
 	/*
 	 * We have arrived here because our zones are constrained, so don't
@@ -1995,41 +2001,19 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 
 	new = shmem_alloc_folio(gfp, order, info, index);
 	if (!new)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
-	nr_pages = folio_nr_pages(new);
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
-					   gfp, entry)) {
+				gfp, entry)) {
 		folio_put(new);
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 	}
 
-	/*
-	 * Prevent parallel swapin from proceeding with the swap cache flag.
-	 *
-	 * Of course there is another possible concurrent scenario as well,
-	 * that is to say, the swap cache flag of a large folio has already
-	 * been set by swapcache_prepare(), while another thread may have
-	 * already split the large swap entry stored in the shmem mapping.
-	 * In this case, shmem_add_to_page_cache() will help identify the
-	 * concurrent swapin and return -EEXIST.
-	 */
-	if (swapcache_prepare(entry, nr_pages)) {
+	swapcache = swapin_entry(entry, new);
+	if (swapcache != new)
 		folio_put(new);
-		return ERR_PTR(-EEXIST);
-	}
 
-	__folio_set_locked(new);
-	__folio_set_swapbacked(new);
-	new->swap = entry;
-
-	memcg1_swapin(entry, nr_pages);
-	shadow = swap_cache_get_shadow(entry);
-	if (shadow)
-		workingset_refault(new, shadow);
-	folio_add_lru(new);
-	swap_read_folio(new, NULL);
-	return new;
+	return swapcache;
 }
 
 /*
@@ -2122,8 +2106,7 @@ static int shmem_replace_folio(struct folio **foliop, gfp_t gfp,
 }
 
 static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
-					 struct folio *folio, swp_entry_t swap,
-					 bool skip_swapcache)
+					 struct folio *folio, swp_entry_t swap)
 {
 	struct address_space *mapping = inode->i_mapping;
 	swp_entry_t swapin_error;
@@ -2139,8 +2122,7 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
 
 	nr_pages = folio_nr_pages(folio);
 	folio_wait_writeback(folio);
-	if (!skip_swapcache)
-		delete_from_swap_cache(folio);
+	delete_from_swap_cache(folio);
 	/*
 	 * Don't treat swapin error folio as alloced. Otherwise inode->i_blocks
 	 * won't be 0 when inode is released and thus trigger WARN_ON(i_blocks)
@@ -2241,7 +2223,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct swap_info_struct *si;
 	struct folio *folio = NULL;
-	bool skip_swapcache = false;
 	swp_entry_t swap;
 	int error, nr_pages, order, split_order;
 
@@ -2283,25 +2264,16 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 				  !zswap_never_enabled()))
 			fallback_order0 = true;
 
-		/* Skip swapcache for synchronous device. */
+		/* Try mTHP swapin for synchronous device. */
 		if (!fallback_order0 && data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
-			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
-			if (!IS_ERR(folio)) {
-				skip_swapcache = true;
+			folio = shmem_swapin_folio_order(inode, vma, index, swap, order, gfp);
+			if (folio)
 				goto alloced;
-			}
-
-			/*
-			 * Fallback to swapin order-0 folio unless the swap entry
-			 * already exists.
-			 */
-			error = PTR_ERR(folio);
-			folio = NULL;
-			if (error == -EEXIST)
-				goto failed;
 		}
 
 		/*
+		 * Fallback to swapin order-0 folio.
+		 *
 		 * Now swap device can only swap in order 0 folio, then we
 		 * should split the large swap entry stored in the pagecache
 		 * if necessary.
@@ -2338,13 +2310,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		split_order = shmem_split_large_entry(inode, index, swap, gfp);
 		if (split_order < 0) {
 			error = split_order;
+			folio_put(folio);
+			folio = NULL;
 			goto failed;
 		}
 	}
 alloced:
 	/* We have to do this with folio locked to prevent races */
 	folio_lock(folio);
-	if (!skip_swapcache && !folio_swap_contains(folio, swap)) {
+	if (!folio_swap_contains(folio, swap)) {
 		error = -EEXIST;
 		goto unlock;
 	}
@@ -2353,12 +2327,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	index = round_down(index, nr_pages);
 	swap = swp_entry(swp_type(swap), round_down(swp_offset(swap), nr_pages));
 
-	if (folio_order(folio) != shmem_check_swap_entry(mapping, index, swap)) {
+	/*
+	 * Swap must go through swap cache layer, only the split may happen
+	 * without locking the swap cache.
+	 */
+	if (folio_order(folio) < shmem_check_swap_entry(mapping, index, swap)) {
 		error = -EEXIST;
 		goto unlock;
 	}
-	if (!skip_swapcache)
-		swap_update_readahead(folio, NULL, 0);
+	swap_update_readahead(folio, NULL, 0);
 	if (!folio_test_uptodate(folio)) {
 		error = -EIO;
 		goto failed;
@@ -2387,12 +2364,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	if (sgp == SGP_WRITE)
 		folio_mark_accessed(folio);
 
-	if (skip_swapcache) {
-		folio->swap.val = 0;
-		swapcache_clear(si, swap, nr_pages);
-	} else {
-		delete_from_swap_cache(folio);
-	}
+	delete_from_swap_cache(folio);
 	folio_mark_dirty(folio);
 	swap_free_nr(swap, nr_pages);
 	put_swap_device(si);
@@ -2403,11 +2375,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	if (shmem_check_swap_entry(mapping, index, swap) < 0)
 		error = -EEXIST;
 	if (error == -EIO)
-		shmem_set_folio_swapin_error(inode, index, folio, swap,
-					     skip_swapcache);
+		shmem_set_folio_swapin_error(inode, index, folio, swap);
 unlock:
-	if (skip_swapcache)
-		swapcache_clear(si, swap, folio_nr_pages(folio));
 	if (folio) {
 		folio_unlock(folio);
 		folio_put(folio);
diff --git a/mm/swap.h b/mm/swap.h
index aab6bf9c3a8a..cad24a3abda8 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -319,10 +319,6 @@ static inline int swap_writepage(struct page *p, struct writeback_control *wbc)
 	return 0;
 }
 
-static inline void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr)
-{
-}
-
 static inline struct folio *swap_cache_get_folio(swp_entry_t entry)
 {
 	return NULL;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 62af67b6f7c2..d3abd2149f8e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1430,22 +1430,6 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 	return NULL;
 }
 
-static void swap_entries_put_cache(struct swap_info_struct *si,
-				   swp_entry_t entry, int nr)
-{
-	unsigned long offset = swp_offset(entry);
-	struct swap_cluster_info *ci;
-
-	ci = swap_lock_cluster(si, offset);
-	if (swap_only_has_cache(si, offset, nr)) {
-		swap_entries_free(si, ci, entry, nr);
-	} else {
-		for (int i = 0; i < nr; i++, entry.val++)
-			swap_entry_put_locked(si, ci, entry, SWAP_HAS_CACHE);
-	}
-	swap_unlock_cluster(ci);
-}
-
 static bool swap_entries_put_map(struct swap_info_struct *si,
 				 swp_entry_t entry, int nr)
 {
@@ -1578,13 +1562,21 @@ void swap_free_nr(swp_entry_t entry, int nr_pages)
 void put_swap_folio(struct folio *folio, swp_entry_t entry)
 {
 	struct swap_info_struct *si;
+	struct swap_cluster_info *ci;
+	unsigned long offset = swp_offset(entry);
 	int size = 1 << swap_entry_order(folio_order(folio));
 
 	si = _swap_info_get(entry);
 	if (!si)
 		return;
 
-	swap_entries_put_cache(si, entry, size);
+	ci = swap_lock_cluster(si, offset);
+	if (swap_only_has_cache(si, offset, size))
+		swap_entries_free(si, ci, entry, size);
+	else
+		for (int i = 0; i < size; i++, entry.val++)
+			swap_entry_put_locked(si, ci, entry, SWAP_HAS_CACHE);
+	swap_unlock_cluster(ci);
 }
 
 int __swap_count(swp_entry_t entry)
@@ -3615,15 +3607,6 @@ int swapcache_prepare(swp_entry_t entry, int nr)
 	return __swap_duplicate(entry, SWAP_HAS_CACHE, nr);
 }
 
-/*
- * Caller should ensure entries belong to the same folio so
- * the entries won't span cross cluster boundary.
- */
-void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr)
-{
-	swap_entries_put_cache(si, entry, nr);
-}
-
 /*
  * add_swap_count_continuation - called when a swap count is duplicated
  * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's
-- 
2.49.0

