Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7B296703
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253877; cv=none; b=FQyCpFpbIb90SmZFvDhzcoyjJBpZv5LspQ2UK3ZRqqESGTBMWZR/qJPM/zzHIHgCirg6onFVKe985seM01s05kIKLbQ5aHnBtwPDyABIlThrrmkZEBiShqVai9pJsxFyNt0KwIVVtWelVanqfz/Pt7IsSpCzkd+JVt+LzttE+Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253877; c=relaxed/simple;
	bh=RIwzx0v7BKbmrkqYcUdZmxIKlLUWZ+Rnis/bsxUgb+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9Y4zjn6Qgk34Kn4ho1/2mmPPyEOUhy3uX9pnmEsfF+FePIcOs/11uWNFL0CSPU/zdj510WIc2IRMN/xnoVgW/2zAUnwG07dI45NTWjWuQpyPe8qpwwrnoTQnMNG5q/1Z1WjHWMsHqtZ2/qp+m1+gRYu56aEzILBY0ImIGPfeL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icuyERDs; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icuyERDs"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so101235a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253874; x=1747858674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2z1TlsbEqX0sItW8zsPfNuaZk6YPjORmjX5QgGuC680=;
        b=icuyERDsqRd/FqZkxzLBwoBZtg7XGEwvQ+3rIcyi+vOo/E6+Lqzx+uU8mn27ZT5TU9
         h2j11fBT9DnAVDnZi0NejE0zhPCpwKN3VBuv9ZjrtkSo8kANjJvmBdEKfBWxubjxrcqQ
         1ue0/r8I+zFSggJImhXL+1WwBHMh5oUl4AugoJ23AtG0hGshT5WZTrGoVFlhh8v08Ps/
         gh5oAx/qhy+LDzFsLg/wl8K+QKzflxhbcEv+liF8kQpe/PXOY3eAcDNaIIkj0T3OqUJG
         xHfag3Kx5/tMCakj/mSoBC/uaNfd+nUk/ps2Yui2dl1LpvSrgyGbrTDn0A30lAzarOhC
         bj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253874; x=1747858674;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2z1TlsbEqX0sItW8zsPfNuaZk6YPjORmjX5QgGuC680=;
        b=MPb34ZUG4gMKbZ0gxAhW3AU/1hk80ftG0LQxdp2jOKVpVOD3YNyEAaG1do3+ggM//C
         AfDCWUYIcWopf5SqPwsJUncTTDpq9nfMV0wr+KCmHydlpl+SZ2LnK53f8DWOS1YWlLq/
         xYiVYrw66/fkCY5OSvWxtpLPXRS7Iqfb/a1+2PxODMyRsM/kox6NTMg6DyXGb8YcuRpy
         BPqABbxRbbyhHhYQxl4gndOYtWZARZN/1ZD48DUE6nza3wZCCiY2+5FFSwyOVprau3LQ
         nXF0LSSWVthRJ+r7jdNK22471zof18MbgRXARmxDwLCvaauiQcGjvco4iKGVKCBZu1mM
         8NCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTvxVn0MRnzrBGEarDGFdPgNHdyzNHv5V/1Lea9C2Oj9G9OifQ3VOeF1ipfGuMYrcq0gJHVXN2uRuOjbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9H04W6Gyxsg+R1QqzhItOg4QXIroDXTPTpH+aFLfiGVjpzJ4
	mXPrPZXZHPyhkPOOA7X7zf08lZVppeL66znb5v0CEivGPXUB1HXTqZUBBbxmR0c=
X-Gm-Gg: ASbGncuwQ7mHYxXrMi8gcdajIqQbwQ2mKUoupqaa41cpGSGApWWVeiEZu0oKxdsetaB
	PNVAFKbyNDKvGuYtWgigSEpk3Y2K6ldtyvdVb56tdNzu6d85Vex9xBplae0enPKwV3JQEA9R1bh
	87pTgf7RuTb4XBATfoMZrBeka4YjOEraTk+siBt3p73LVmMnBzHy2xRZIXpFM85tKTBuse8kBYs
	lk62wYT+cGnxCKbf16NlhDC09X56Cq5cBwEPqlkdTNmPMsHKyeq550yjZhx0WH3Xd9kJy2qdegy
	cnDZU927KzNjAtG6AsM4LupqY7S4CamUnCu/7FlAwkwPgnVw0Bx1+5CRIGxWwg8PQnn4aWRg
X-Google-Smtp-Source: AGHT+IFY6uiI2xptl3mpQDnMC5ZiwlzDn0u7+jZfbafhM4MOLlbJdrQIJg4fJbsOQyWnC8PPZjjyiA==
X-Received: by 2002:a17:90b:2686:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-30e2e62c352mr7084586a91.25.1747253874465;
        Wed, 14 May 2025 13:17:54 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.17.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:17:53 -0700 (PDT)
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
Subject: [PATCH 03/28] mm/shmem, swap: remove SWAP_MAP_SHMEM
Date: Thu, 15 May 2025 04:17:03 +0800
Message-ID: <20250514201729.48420-4-ryncsn@gmail.com>
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

From: Nhat Pham <nphamcs@gmail.com>

The SWAP_MAP_SHMEM state was introduced in the commit aaa468653b4a
("swap_info: note SWAP_MAP_SHMEM"), to quickly determine if a swap entry
belongs to shmem during swapoff.

However, swapoff has since been rewritten in the commit b56a2d8af914
("mm: rid swapoff of quadratic complexity"). Now having swap count ==
SWAP_MAP_SHMEM value is basically the same as having swap count == 1,
and swap_shmem_alloc() behaves analogously to swap_duplicate(). The only
difference of note is that swap_shmem_alloc() does not check for
-ENOMEM returned from __swap_duplicate(), but it is OK because shmem
never re-duplicates any swap entry it owns. This will stil be safe if we
use (batched) swap_duplicate() instead.

This commit adds swap_duplicate_nr(), the batched variant of
swap_duplicate(), and removes the SWAP_MAP_SHMEM state and the
associated swap_shmem_alloc() helper to simplify the state machine (both
mentally and in terms of actual code). We will also have an extra
state/special value that can be repurposed (for swap entries that never
gets re-duplicated).

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h | 15 +++++++--------
 mm/shmem.c           |  2 +-
 mm/swapfile.c        | 42 +++++++++++++++++-------------------------
 3 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 817e427a47d2..0e52ac4e817d 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -230,7 +230,6 @@ enum {
 /* Special value in first swap_map */
 #define SWAP_MAP_MAX	0x3e	/* Max count */
 #define SWAP_MAP_BAD	0x3f	/* Note page is bad */
-#define SWAP_MAP_SHMEM	0xbf	/* Owned by shmem/tmpfs */
 
 /* Special value in each swap_map continuation */
 #define SWAP_CONT_MAX	0x7f	/* Max count */
@@ -477,8 +476,7 @@ bool folio_free_swap(struct folio *folio);
 void put_swap_folio(struct folio *folio, swp_entry_t entry);
 extern swp_entry_t get_swap_page_of_type(int);
 extern int add_swap_count_continuation(swp_entry_t, gfp_t);
-extern void swap_shmem_alloc(swp_entry_t, int);
-extern int swap_duplicate(swp_entry_t);
+extern int swap_duplicate_nr(swp_entry_t entry, int nr);
 extern int swapcache_prepare(swp_entry_t entry, int nr);
 extern void swap_free_nr(swp_entry_t entry, int nr_pages);
 extern void free_swap_and_cache_nr(swp_entry_t entry, int nr);
@@ -541,11 +539,7 @@ static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
 	return 0;
 }
 
-static inline void swap_shmem_alloc(swp_entry_t swp, int nr)
-{
-}
-
-static inline int swap_duplicate(swp_entry_t swp)
+static inline int swap_duplicate_nr(swp_entry_t swp, int nr_pages)
 {
 	return 0;
 }
@@ -596,6 +590,11 @@ static inline int add_swap_extent(struct swap_info_struct *sis,
 }
 #endif /* CONFIG_SWAP */
 
+static inline int swap_duplicate(swp_entry_t entry)
+{
+	return swap_duplicate_nr(entry, 1);
+}
+
 static inline void free_swap_and_cache(swp_entry_t entry)
 {
 	free_swap_and_cache_nr(entry, 1);
diff --git a/mm/shmem.c b/mm/shmem.c
index 99327c30507c..972bd0eca439 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1641,7 +1641,7 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 
 	if (!folio_alloc_swap(folio, __GFP_HIGH | __GFP_NOMEMALLOC | __GFP_NOWARN)) {
 		shmem_recalc_inode(inode, 0, nr_pages);
-		swap_shmem_alloc(folio->swap, nr_pages);
+		swap_duplicate_nr(folio->swap, nr_pages);
 		shmem_delete_from_page_cache(folio, swp_to_radix_entry(folio->swap));
 
 		mutex_unlock(&shmem_swaplist_mutex);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 34188714479f..6b115149b845 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -192,7 +192,7 @@ static bool swap_is_last_map(struct swap_info_struct *si,
 	unsigned char *map_end = map + nr_pages;
 	unsigned char count = *map;
 
-	if (swap_count(count) != 1 && swap_count(count) != SWAP_MAP_SHMEM)
+	if (swap_count(count) != 1)
 		return false;
 
 	while (++map < map_end) {
@@ -1359,12 +1359,6 @@ static unsigned char swap_entry_put_locked(struct swap_info_struct *si,
 	if (usage == SWAP_HAS_CACHE) {
 		VM_BUG_ON(!has_cache);
 		has_cache = 0;
-	} else if (count == SWAP_MAP_SHMEM) {
-		/*
-		 * Or we could insist on shmem.c using a special
-		 * swap_shmem_free() and free_shmem_swap_and_cache()...
-		 */
-		count = 0;
 	} else if ((count & ~COUNT_CONTINUED) <= SWAP_MAP_MAX) {
 		if (count == COUNT_CONTINUED) {
 			if (swap_count_continued(si, offset, count))
@@ -1478,7 +1472,7 @@ static bool swap_entries_put_map(struct swap_info_struct *si,
 	if (nr <= 1)
 		goto fallback;
 	count = swap_count(data_race(si->swap_map[offset]));
-	if (count != 1 && count != SWAP_MAP_SHMEM)
+	if (count != 1)
 		goto fallback;
 
 	ci = lock_cluster(si, offset);
@@ -1533,12 +1527,10 @@ static bool swap_entries_put_map_nr(struct swap_info_struct *si,
 
 /*
  * Check if it's the last ref of swap entry in the freeing path.
- * Qualified vlaue includes 1, SWAP_HAS_CACHE or SWAP_MAP_SHMEM.
  */
 static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
 {
-	return (count == SWAP_HAS_CACHE) || (count == 1) ||
-	       (count == SWAP_MAP_SHMEM);
+	return (count == SWAP_HAS_CACHE) || (count == 1);
 }
 
 /*
@@ -3536,7 +3528,6 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 
 	offset = swp_offset(entry);
 	VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
-	VM_WARN_ON(usage == 1 && nr > 1);
 	ci = lock_cluster(si, offset);
 
 	err = 0;
@@ -3596,27 +3587,28 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 	return err;
 }
 
-/*
- * Help swapoff by noting that swap entry belongs to shmem/tmpfs
- * (in which case its reference count is never incremented).
- */
-void swap_shmem_alloc(swp_entry_t entry, int nr)
-{
-	__swap_duplicate(entry, SWAP_MAP_SHMEM, nr);
-}
-
-/*
- * Increase reference count of swap entry by 1.
+/**
+ * swap_duplicate_nr() - Increase reference count of nr contiguous swap entries
+ *                       by 1.
+ *
+ * @entry: first swap entry from which we want to increase the refcount.
+ * @nr: Number of entries in range.
+ *
  * Returns 0 for success, or -ENOMEM if a swap_count_continuation is required
  * but could not be atomically allocated.  Returns 0, just as if it succeeded,
  * if __swap_duplicate() fails for another reason (-EINVAL or -ENOENT), which
  * might occur if a page table entry has got corrupted.
+ *
+ * Note that we are currently not handling the case where nr > 1 and we need to
+ * add swap count continuation. This is OK, because no such user exists - shmem
+ * is the only user that can pass nr > 1, and it never re-duplicates any swap
+ * entry it owns.
  */
-int swap_duplicate(swp_entry_t entry)
+int swap_duplicate_nr(swp_entry_t entry, int nr)
 {
 	int err = 0;
 
-	while (!err && __swap_duplicate(entry, 1, 1) == -ENOMEM)
+	while (!err && __swap_duplicate(entry, 1, nr) == -ENOMEM)
 		err = add_swap_count_continuation(entry, GFP_ATOMIC);
 	return err;
 }
-- 
2.49.0

