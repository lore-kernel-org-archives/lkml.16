Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8829824C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253977; cv=none; b=F+Ada04dnTJW+xd7vAbjNb2y5k6QR24/toQjE7YjZ0inJYgpl6VPuTOHjrsatS63qZ/asHr8S/jtH7szef/ViGzYeUcl2VOf2j4EYHZd81N1N4BG1c/ScN3PXwiXj+ZoV/tixWcuMoRIpDCh91vUleUsLwbgfnFOPGSexMB7vuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253977; c=relaxed/simple;
	bh=7lIrbZDdvxgkZcePB5/RxSCFc5c9xbttmY4itGFxkPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaGh/ca36iXwDMokQIVj6oCUgjyr13mmu4N3kntMVRNP8jhAbTmPYwxz3gdZXezrPgSnGIpYNZNJdr9FG9QWfSeDvveLIxbBdyIRQsAFiA78E1cDJHp73bO7ZXtxTGY6I+Lh0+B+YNy7wgALXshQJ4HIH/iLROeYVXUU/fHrrD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9yUB7SL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9yUB7SL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so88225a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253973; x=1747858773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nGH3UgLLu6HJsYhxZ+8K9wzkU3sDrM85ReEhs5D3H1M=;
        b=m9yUB7SLpHkKuKN70aAwGf6QfE1vu6haBtxuCrh30HFseJrfRDKGHZMNKKvjofyhIY
         WTBUyKLMuXUKm3EKGxCLwWGccXY91XxSerPNN4DdyRtPDEar3gx4qk/FNSuHwyLZLvqC
         HZ3mDfWcDA1+PQ+J27eMpjCRmZIEo2ftKYJD9mwHzuF/WcAKxrMDKNeIrDhE6+/2HPUt
         kWJdmn3Kci/lXaY+77nr+e2o0xg1aBH4Nx2skWlQ2uF2GlykpqcfUi9CslvOsHzdRtv5
         n+vgFSMqcYUZO0xVhoKVVVWzYRU3LAXRjo+RicLFzZqXpDJ4lpVgXZleA2WeimwhQvMg
         ArCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253973; x=1747858773;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nGH3UgLLu6HJsYhxZ+8K9wzkU3sDrM85ReEhs5D3H1M=;
        b=v1b2Gl8k6pBYqdy5l9SgXVCDwrfd1VMrq+l0rJ8Fk+d3DnzewXWoZeswof8+7r8+m2
         5TyLIP6BcOzukTA8G/pevfKmqi0VWcoH+bFExNbUb6rpZaAtJRM5youI8EnbqkjD4d3Y
         z9CR7s/ZvaP/p4qHqNL2siSAwWm9tB+GpVnO3/GV3jsSFW4rr6xt6aFrMaSO7mlIyzpF
         CKfdCjKYERC14m93HpLwMw2tzct9Ayw5kMTsjMXFAavI2aeSgZm/URNTTbi1Cg7KL5J6
         NFbrhoO4tcE8eGWO9+Z0burhtDmhLP4lzvDx/zgsvHZkEQth4c2snBtC32IPef7ZI8H2
         Bz/w==
X-Forwarded-Encrypted: i=1; AJvYcCVOZfGb/fCjScZ/JVsQ9jgNQh03D64W9vCUab9ojvtHZSIsBjDc/VP4ttp+x/xCay2fXCtTsg5g4scm1fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7usKW8m9V5W/4gufPLGtFX0c1M8tT84+KhXSTpfupIACVzJJQ
	6gdvb4ZsGu6i8/WuR10plMyGpJxz+1pgfNHLKuCqIDxvfiWSryq7
X-Gm-Gg: ASbGncvpAieoQ0HJRdN2pGbulZ3lZ5n8p/z+duhicbK0KuRTzaqewsNiuiXTkcx7NGE
	fGVENrGlnxYaE7TBqsK6VHD+6/+P6w2mg+Do8oj6gxG2eDDdZO771CMSn9WMDgGeCpA2d2nrhcE
	yRT3I+0DJyc/9jWjqLxHNl2E4oEsBIr8FmOU/xBB4mpnj9c18oY81wxhUi6fj9ZZPV5/7iXHu08
	WYHrNFMFKWkzd8XyAvwz/AX1UI5OdBaZ5VcPKEiz8i+Zk0x3VJr+7KhpmkBTYvFpKTQ+lZL5DHR
	1KG+cPgnAsAiVdzrcjI7ibQrGqLpjlb2ZlghEixxc4sksTcsMSQmcCCDw1xe7uG+zh2papsr
X-Google-Smtp-Source: AGHT+IGIr5kjapt3vNEP2J6YEtdEOm1TjKVHXnnCXSQPWLHPrNcTbCn4wsagC4rstsHPb8bIs0U4iQ==
X-Received: by 2002:a17:90b:3b43:b0:2f6:d266:f462 with SMTP id 98e67ed59e1d1-30e2e68a300mr6853815a91.35.1747253973067;
        Wed, 14 May 2025 13:19:33 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:32 -0700 (PDT)
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
Subject: [PATCH 22/28] mm, swap: drop the SWAP_HAS_CACHE flag
Date: Thu, 15 May 2025 04:17:22 +0800
Message-ID: <20250514201729.48420-23-ryncsn@gmail.com>
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

Now swap cache is managed with swap table, users will check if an entry
is cached by looking at the swap table type directly. SWAP_HAS_CACHE is
only used to pin a entry temporarily so it won't be used by anyone else.

Previous commits have converted all places checking SWAP_HAS_CACHE to check
the swap table directly, now the only place still sets SWAP_HAS_CACHE is
on folio freeing.

Freeing a cached entry will set its swap map to SWAP_HAS_CACHE first,
keep the entry pinned with SWAP_HAS_CACHE, then free it.

Now as the swap has become the mandatory layer and managed by swap table,
and all users are checking the swap table directly, this can be much
simplified: when removing a folio from swap cache, free all it's entry
that have zero count directly instead of doing a temporarily pin.

After above change, SWAP_HAS_CACHE no longer have any users, remove all
related logic and helpers.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |   1 -
 mm/swap.h            |  12 ++-
 mm/swap_state.c      |  22 ++++--
 mm/swapfile.c        | 184 +++++++++++--------------------------------
 4 files changed, 67 insertions(+), 152 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index adac6d51da05..60b126918399 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -224,7 +224,6 @@ enum {
 #define COMPACT_CLUSTER_MAX SWAP_CLUSTER_MAX
 
 /* Bit flag in swap_map */
-#define SWAP_HAS_CACHE	0x40	/* Flag page is cached, in first swap_map */
 #define COUNT_CONTINUED	0x80	/* Flag swap_map continuation for full count */
 
 /* Special value in first swap_map */
diff --git a/mm/swap.h b/mm/swap.h
index b042609e6eb2..7cbfca39225f 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -135,13 +135,6 @@ static inline void swap_unlock_cluster_irq(struct swap_cluster_info *ci)
 	spin_unlock_irq(&ci->lock);
 }
 
-extern int __swap_cache_set_entry(struct swap_info_struct *si,
-				  struct swap_cluster_info *ci,
-				  unsigned long offset);
-extern void __swap_cache_put_entries(struct swap_info_struct *si,
-				     struct swap_cluster_info *ci,
-				     swp_entry_t entry, unsigned int size);
-
 /*
  * All swap entries starts getting allocated by folio_alloc_swap(),
  * and the folio will be added to swap cache.
@@ -161,6 +154,11 @@ int folio_dup_swap(struct folio *folio, struct page *subpage);
 void folio_put_swap(struct folio *folio, struct page *subpage);
 void folio_free_swap_cache(struct folio *folio);
 
+/* For internal use */
+extern void __swap_free_entries(struct swap_info_struct *si,
+			      struct swap_cluster_info *ci,
+			      unsigned long offset, unsigned int nr_pages);
+
 /* linux/mm/page_io.c */
 int sio_pool_init(void);
 struct swap_iocb;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 9e7d40215958..2b145c0f7773 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -169,7 +169,7 @@ struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 			existing = swp_te_folio(exist);
 			goto out_failed;
 		}
-		if (__swap_cache_set_entry(si, ci, offset))
+		if (!__swap_count(swp_entry(si->type, offset)))
 			goto out_failed;
 		if (shadow && swp_te_is_shadow(exist))
 			*shadow = swp_te_shadow(exist);
@@ -191,10 +191,8 @@ struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 	 * We may lose shadow here due to raced swapin, which is rare and OK,
 	 * caller better keep the previous returned shadow.
 	 */
-	while (offset-- > start) {
+	while (offset-- > start)
 		__swap_table_set_shadow(ci, offset, NULL);
-		__swap_cache_put_entries(si, ci, swp_entry(si->type, offset), 1);
-	}
 	swap_unlock_cluster(ci);
 
 	/*
@@ -219,6 +217,7 @@ void __swap_cache_del_folio(swp_entry_t entry,
 	pgoff_t offset, start, end;
 	struct swap_info_struct *si;
 	struct swap_cluster_info *ci;
+	bool folio_swapped = false, need_free = false;
 	unsigned long nr_pages = folio_nr_pages(folio);
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
@@ -235,13 +234,26 @@ void __swap_cache_del_folio(swp_entry_t entry,
 		exist = __swap_table_get(ci, offset);
 		VM_WARN_ON_ONCE(swp_te_folio(exist) != folio);
 		__swap_table_set_shadow(ci, offset, shadow);
+		if (__swap_count(swp_entry(si->type, offset)))
+			folio_swapped = true;
+		else
+			need_free = true;
 	} while (++offset < end);
 
 	folio->swap.val = 0;
 	folio_clear_swapcache(folio);
 	node_stat_mod_folio(folio, NR_FILE_PAGES, -nr_pages);
 	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr_pages);
-	__swap_cache_put_entries(si, ci, entry, nr_pages);
+
+	if (!folio_swapped) {
+		__swap_free_entries(si, ci, start, nr_pages);
+	} else if (need_free) {
+		offset = start;
+		do {
+			if (!__swap_count(swp_entry(si->type, offset)))
+				__swap_free_entries(si, ci, offset, 1);
+		} while (++offset < end);
+	}
 }
 
 /*
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 91025ba98653..c2154f19c21b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -49,21 +49,18 @@
 #include <linux/swap_cgroup.h>
 #include "swap_table.h"
 #include "internal.h"
+#include "swap_table.h"
 #include "swap.h"
 
 static bool swap_count_continued(struct swap_info_struct *, pgoff_t,
 				 unsigned char);
 static void free_swap_count_continuations(struct swap_info_struct *);
-static void swap_free_entries(struct swap_info_struct *si,
-			      struct swap_cluster_info *ci,
-			      unsigned long start, unsigned int nr_pages);
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
 static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr);
 static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
 					   struct swap_cluster_info *ci,
-					   swp_entry_t entry,
-					   unsigned char usage);
+					   swp_entry_t entry);
 static bool folio_swapcache_freeable(struct folio *folio);
 
 static DEFINE_SPINLOCK(swap_lock);
@@ -145,11 +142,6 @@ static struct swap_info_struct *swp_get_info(swp_entry_t entry)
 	return swp_type_get_info(swp_type(entry));
 }
 
-static inline unsigned char swap_count(unsigned char ent)
-{
-	return ent & ~SWAP_HAS_CACHE;	/* may include COUNT_CONTINUED flag */
-}
-
 /*
  * Use the second highest bit of inuse_pages counter as the indicator
  * if one swap device is on the available plist, so the atomic can
@@ -190,7 +182,7 @@ static bool swap_only_has_cache(struct swap_info_struct *si,
 
 	do {
 		entry = __swap_table_get(ci, offset);
-		VM_BUG_ON(!(*map & SWAP_HAS_CACHE));
+		VM_WARN_ON_ONCE(!swp_te_is_folio(entry));
 		if (*map)
 			return false;
 		offset++;
@@ -600,7 +592,6 @@ static void partial_free_cluster(struct swap_info_struct *si,
 {
 	VM_BUG_ON(!ci->count);
 	VM_BUG_ON(ci->count == SWAPFILE_CLUSTER);
-
 	lockdep_assert_held(&ci->lock);
 
 	if (ci->flags != CLUSTER_FLAG_NONFULL)
@@ -664,7 +655,7 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
 
 	spin_unlock(&ci->lock);
 	do {
-		if (swap_count(READ_ONCE(map[offset])))
+		if (READ_ONCE(map[offset]))
 			break;
 		nr_reclaim = __try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
 		if (nr_reclaim > 0)
@@ -696,10 +687,9 @@ static bool cluster_scan_range(struct swap_info_struct *si,
 		return true;
 
 	for (offset = start; offset < end; offset++) {
-		if (swap_count(map[offset]))
+		if (map[offset])
 			return false;
 		if (swp_te_is_folio(__swap_table_get(ci, offset))) {
-			VM_WARN_ON_ONCE(!(map[offset] & SWAP_HAS_CACHE));
 			if (!vm_swap_full())
 				return false;
 			*need_reclaim = true;
@@ -733,7 +723,6 @@ static bool cluster_alloc_range(struct swap_info_struct *si,
 	if (folio) {
 		/* from folio_alloc_swap */
 		__swap_cache_add_folio(entry, ci, folio);
-		memset(&si->swap_map[offset], SWAP_HAS_CACHE, nr_pages);
 	} else {
 		/* from get_swap_page_of_type */
 		VM_WARN_ON_ONCE(si->swap_map[offset] || swap_cache_check_folio(entry));
@@ -818,7 +807,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		to_scan--;
 
 		while (offset < end) {
-			if (!swap_count(map[offset]) &&
+			if (!map[offset] &&
 			    swp_te_is_folio(__swap_table_get(ci, offset))) {
 				spin_unlock(&ci->lock);
 				nr_reclaim = __try_to_reclaim_swap(si, offset,
@@ -910,7 +899,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 		 * Scan only one fragment cluster is good enough. Order 0
 		 * allocation will surely success, and mTHP allocation failure
 		 * is not critical, and scanning one cluster still keeps the
-		 * list rotated and scanned (for reclaiming HAS_CACHE).
+		 * list rotated and scanned (for reclaiming swap cachec).
 		 */
 		ci = isolate_lock_cluster(si, &si->frag_clusters[order]);
 		if (ci) {
@@ -1226,10 +1215,9 @@ static bool swap_put_entries(struct swap_info_struct *si,
 	do {
 		swp_te = __swap_table_get(ci, offset);
 		count = si->swap_map[offset];
-		if (WARN_ON_ONCE(!swap_count(count))) {
+		if (WARN_ON_ONCE(!count)) {
 			goto skip;
 		} else if (swp_te_is_folio(swp_te)) {
-			VM_WARN_ON_ONCE(!(count & SWAP_HAS_CACHE));
 			/* Let the swap cache (folio) handle the final free */
 			has_cache = true;
 		} else if (count == 1) {
@@ -1237,16 +1225,16 @@ static bool swap_put_entries(struct swap_info_struct *si,
 			head = head ? head : offset;
 			continue;
 		}
-		swap_put_entry_locked(si, ci, swp_entry(si->type, offset), 1);
+		swap_put_entry_locked(si, ci, swp_entry(si->type, offset));
 skip:
 		if (head) {
-			swap_free_entries(si, ci, head, offset - head);
+			__swap_free_entries(si, ci, head, offset - head);
 			head = SWAP_ENTRY_INVALID;
 		}
 	} while (++offset < cluster_end);
 
 	if (head) {
-		swap_free_entries(si, ci, head, offset - head);
+		__swap_free_entries(si, ci, head, offset - head);
 		head = SWAP_ENTRY_INVALID;
 	}
 
@@ -1296,12 +1284,10 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	local_unlock(&percpu_swap_cluster.lock);
 
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
-	if (mem_cgroup_try_charge_swap(folio, folio->swap)) {
+	if (mem_cgroup_try_charge_swap(folio, folio->swap))
 		folio_free_swap_cache(folio);
-		return -ENOMEM;
-	}
 
-	if (!folio->swap.val)
+	if (unlikely(!folio->swap.val))
 		return -ENOMEM;
 
 	atomic_long_sub(size, &nr_swap_pages);
@@ -1393,13 +1379,8 @@ static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
 	offset = swp_offset(entry);
 	if (offset >= si->max)
 		goto bad_offset;
-	if (data_race(!si->swap_map[swp_offset(entry)]))
-		goto bad_free;
 	return si;
 
-bad_free:
-	pr_err("%s: %s%08lx\n", __func__, Unused_offset, entry.val);
-	goto out;
 bad_offset:
 	pr_err("%s: %s%08lx\n", __func__, Bad_offset, entry.val);
 	goto out;
@@ -1414,22 +1395,13 @@ static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
 
 static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
 					   struct swap_cluster_info *ci,
-					   swp_entry_t entry,
-					   unsigned char usage)
+					   swp_entry_t entry)
 {
 	unsigned long offset = swp_offset(entry);
 	unsigned char count;
-	unsigned char has_cache;
 
 	count = si->swap_map[offset];
-
-	has_cache = count & SWAP_HAS_CACHE;
-	count &= ~SWAP_HAS_CACHE;
-
-	if (usage == SWAP_HAS_CACHE) {
-		VM_BUG_ON(!has_cache);
-		has_cache = 0;
-	} else if ((count & ~COUNT_CONTINUED) <= SWAP_MAP_MAX) {
+	if ((count & ~COUNT_CONTINUED) <= SWAP_MAP_MAX) {
 		if (count == COUNT_CONTINUED) {
 			if (swap_count_continued(si, offset, count))
 				count = SWAP_MAP_MAX | COUNT_CONTINUED;
@@ -1439,13 +1411,11 @@ static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
 			count--;
 	}
 
-	usage = count | has_cache;
-	if (usage)
-		WRITE_ONCE(si->swap_map[offset], usage);
-	else
-		swap_free_entries(si, ci, offset, 1);
+	WRITE_ONCE(si->swap_map[offset], count);
+	if (!count && !swp_te_is_folio(__swap_table_get(ci, offset)))
+		__swap_free_entries(si, ci, offset, 1);
 
-	return usage;
+	return count;
 }
 
 /*
@@ -1514,25 +1484,12 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 	return NULL;
 }
 
-/*
- * Check if it's the last ref of swap entry in the freeing path.
- */
-static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
-{
-	return (count == SWAP_HAS_CACHE) || (count == 1);
-}
-
-/*
- * Drop the last ref of swap entries, caller have to ensure all entries
- * belong to the same cgroup and cluster.
- */
-static void swap_free_entries(struct swap_info_struct *si,
-			      struct swap_cluster_info *ci,
-			      unsigned long offset, unsigned int nr_pages)
+void __swap_free_entries(struct swap_info_struct *si,
+		       struct swap_cluster_info *ci,
+		       unsigned long offset, unsigned int nr_pages)
 {
 	swp_entry_t entry = swp_entry(si->type, offset);
-	unsigned char *map = si->swap_map + offset;
-	unsigned char *map_end = map + nr_pages;
+	unsigned long end = offset + nr_pages;
 
 	/* It should never free entries across different clusters */
 	VM_BUG_ON(ci != swp_offset_cluster(si, offset + nr_pages - 1));
@@ -1541,10 +1498,10 @@ static void swap_free_entries(struct swap_info_struct *si,
 
 	ci->count -= nr_pages;
 	do {
-		VM_BUG_ON(!swap_is_last_ref(*map));
-		*map = 0;
-	} while (++map < map_end);
+		si->swap_map[offset] = 0;
+	} while (++offset < end);
 
+	offset = swp_offset(entry);
 	mem_cgroup_uncharge_swap(entry, nr_pages);
 	swap_range_free(si, offset, nr_pages);
 
@@ -1554,46 +1511,12 @@ static void swap_free_entries(struct swap_info_struct *si,
 		partial_free_cluster(si, ci);
 }
 
-/*
- * Caller has made sure that the swap device corresponding to entry
- * is still around or has not been recycled.
- */
-void __swap_cache_put_entries(struct swap_info_struct *si,
-			      struct swap_cluster_info *ci,
-			      swp_entry_t entry, unsigned int size)
-{
-	if (swap_only_has_cache(si, ci, swp_offset(entry), size))
-		swap_free_entries(si, ci, swp_offset(entry), size);
-	else
-		for (int i = 0; i < size; i++, entry.val++)
-			swap_put_entry_locked(si, ci, entry, SWAP_HAS_CACHE);
-}
-
-/*
- * Called after dropping swapcache to decrease refcnt to swap entries.
- */
-void put_swap_folio(struct folio *folio, swp_entry_t entry)
-{
-	struct swap_info_struct *si;
-	struct swap_cluster_info *ci;
-	unsigned long offset = swp_offset(entry);
-	int size = 1 << swap_entry_order(folio_order(folio));
-
-	si = _swap_info_get(entry);
-	if (!si)
-		return;
-
-	ci = swap_lock_cluster(si, offset);
-	__swap_cache_put_entries(si, ci, entry, size);
-	swap_unlock_cluster(ci);
-}
-
 int __swap_count(swp_entry_t entry)
 {
 	struct swap_info_struct *si = swp_info(entry);
 	pgoff_t offset = swp_offset(entry);
 
-	return swap_count(si->swap_map[offset]);
+	return si->swap_map[offset];
 }
 
 /*
@@ -1608,7 +1531,7 @@ bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
 	int count;
 
 	ci = swap_lock_cluster(si, offset);
-	count = swap_count(si->swap_map[offset]);
+	count = si->swap_map[offset];
 	swap_unlock_cluster(ci);
 	return !!count;
 }
@@ -1634,7 +1557,7 @@ int swp_swapcount(swp_entry_t entry)
 
 	ci = swap_lock_cluster(si, offset);
 
-	count = swap_count(si->swap_map[offset]);
+	count = si->swap_map[offset];
 	if (!(count & COUNT_CONTINUED))
 		goto out;
 
@@ -1672,12 +1595,12 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 
 	ci = swap_lock_cluster(si, offset);
 	if (nr_pages == 1) {
-		if (swap_count(map[roffset]))
+		if (map[roffset])
 			ret = true;
 		goto unlock_out;
 	}
 	for (i = 0; i < nr_pages; i++) {
-		if (swap_count(map[offset + i])) {
+		if (map[offset + i]) {
 			ret = true;
 			break;
 		}
@@ -1777,6 +1700,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	swp_te_t swp_te;
 
 	si = get_swap_device(entry);
+
 	if (WARN_ON_ONCE(!si))
 		return;
 	if (WARN_ON_ONCE(end_offset > si->max))
@@ -1800,7 +1724,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	for (offset = start_offset; offset < end_offset; offset += nr) {
 		nr = 1;
 		swp_te = __swap_table_get(swp_offset_cluster(si, offset), offset);
-		if (!swap_count(si->swap_map[offset]) && swp_te_is_folio(swp_te)) {
+		if (!READ_ONCE(si->swap_map[offset]) && swp_te_is_folio(swp_te)) {
 			/*
 			 * Folios are always naturally aligned in swap so
 			 * advance forward to the next boundary. Zero means no
@@ -1818,7 +1742,6 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 			nr = ALIGN(offset + 1, nr) - offset;
 		}
 	}
-
 out:
 	put_swap_device(si);
 }
@@ -1860,7 +1783,7 @@ void free_swap_page_of_entry(swp_entry_t entry)
 	if (!si)
 		return;
 	ci = swap_lock_cluster(si, offset);
-	WARN_ON(swap_count(swap_put_entry_locked(si, ci, entry, 1)));
+	WARN_ON(swap_put_entry_locked(si, ci, entry));
 	/* It might got added to swap cache accidentally by read ahead */
 	__try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
 	swap_unlock_cluster(ci);
@@ -2261,6 +2184,7 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 					unsigned int prev)
 {
 	unsigned int i;
+	swp_te_t swp_te;
 	unsigned char count;
 
 	/*
@@ -2271,7 +2195,10 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	 */
 	for (i = prev + 1; i < si->max; i++) {
 		count = READ_ONCE(si->swap_map[i]);
-		if (count && swap_count(count) != SWAP_MAP_BAD)
+		swp_te = __swap_table_get(swp_offset_cluster(si, i), i);
+		if (count == SWAP_MAP_BAD)
+			continue;
+		if (count || swp_te_is_folio(swp_te))
 			break;
 		if ((i % LATENCY_LIMIT) == 0)
 			cond_resched();
@@ -3530,7 +3457,7 @@ static int swap_dup_entries(struct swap_info_struct *si,
 			    unsigned char usage, int nr)
 {
 	int i;
-	unsigned char count, has_cache;
+	unsigned char count;
 
 	for (i = 0; i < nr; i++) {
 		count = si->swap_map[offset + i];
@@ -3539,31 +3466,16 @@ static int swap_dup_entries(struct swap_info_struct *si,
 		 * swapin_readahead() doesn't check if a swap entry is valid, so the
 		 * swap entry could be SWAP_MAP_BAD. Check here with lock held.
 		 */
-		if (unlikely(swap_count(count) == SWAP_MAP_BAD)) {
+		if (unlikely(count == SWAP_MAP_BAD))
 			return -ENOENT;
-		}
-
-		has_cache = count & SWAP_HAS_CACHE;
-		count &= ~SWAP_HAS_CACHE;
 
-		if (!count && !has_cache) {
+		if (!count && !swp_te_is_folio(__swap_table_get(ci, offset)))
 			return -ENOENT;
-		} else if (usage == SWAP_HAS_CACHE) {
-			if (has_cache)
-				return -EEXIST;
-		} else if ((count & ~COUNT_CONTINUED) > SWAP_MAP_MAX) {
-			return -EINVAL;
-		}
 	}
 
 	for (i = 0; i < nr; i++) {
 		count = si->swap_map[offset + i];
-		has_cache = count & SWAP_HAS_CACHE;
-		count &= ~SWAP_HAS_CACHE;
-
-		if (usage == SWAP_HAS_CACHE)
-			has_cache = SWAP_HAS_CACHE;
-		else if ((count & ~COUNT_CONTINUED) < SWAP_MAP_MAX)
+		if ((count & ~COUNT_CONTINUED) < SWAP_MAP_MAX)
 			count += usage;
 		else if (swap_count_continued(si, offset + i, count))
 			count = COUNT_CONTINUED;
@@ -3575,7 +3487,7 @@ static int swap_dup_entries(struct swap_info_struct *si,
 			return -ENOMEM;
 		}
 
-		WRITE_ONCE(si->swap_map[offset + i], count | has_cache);
+		WRITE_ONCE(si->swap_map[offset + i], count);
 	}
 
 	return 0;
@@ -3625,12 +3537,6 @@ int do_dup_swap_entry(swp_entry_t entry)
 	return err;
 }
 
-int __swap_cache_set_entry(struct swap_info_struct *si,
-			   struct swap_cluster_info *ci, unsigned long offset)
-{
-	return swap_dup_entries(si, ci, offset, SWAP_HAS_CACHE, 1);
-}
-
 /*
  * add_swap_count_continuation - called when a swap count is duplicated
  * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's
@@ -3676,7 +3582,7 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
 
 	ci = swap_lock_cluster(si, offset);
 
-	count = swap_count(si->swap_map[offset]);
+	count = si->swap_map[offset];
 
 	if ((count & ~COUNT_CONTINUED) != SWAP_MAP_MAX) {
 		/*
-- 
2.49.0

