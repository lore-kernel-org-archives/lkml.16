Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF2298C3D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254002; cv=none; b=tGkWpbCPHZk+XVlziH8qIR2k9tgVfwvyJ1HZZ3+NO6eY9U2HeI5RdnacoB7I4Q4mZBoRPqbRuUqQCD16ebgC4ukzjQTJGQ/E3eUQUDJ4cOMZoYPu7v0cPZNk8+DJX1MMW2M9kCTFf+OPl2Yhb0B5RBR5/TkK1vCeEuwP2ECSDuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254002; c=relaxed/simple;
	bh=/iAkuqe6qK2q918fbavJX2XvXF5tFWON+vIzpotExwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlBf5bhB7PfthZGPLnOvwr9DzExsJLbPnUUI95I0AUK8M3A+bVMr2HtKOh67vo9Coha4azkRfaRe8DkyEK+pC+VI2wAWtBKEVsmbeTzh1k5y5wf7yF6bC+NDb16Fh58d3x6pTcMXOIYcuZe+BOOhuxKgphoXptJo3OTr295IACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnIou9uN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnIou9uN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30c54b40112so214436a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253999; x=1747858799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rm2FnYVpOPKGzgLp2Z3jsVJbvgsdY2D1Iyk7m73KHwY=;
        b=RnIou9uN629S5+IRNC/p/3mhcn5wATUyv7xGukjBK6ejnPKIw4m59rrjwCjuoDVPxc
         S1uVNxenAdrZrOK09mw6EwtjnWSY+0M28WpFuXzHwRSOKYQXGBWKIFOe/NmTTN9CqXCC
         YOus5n9lgpaUcWAqWqHQCY4p8ZNlcCluEwnO4CMALfzE5gYltK060y1/X/d9EwPYJe+p
         ZD1CWwiiMxzmNGzgzE6IMLLp6M1gj3gRd4HJ5N4QDkcELHDVDMpFQluBXlKCkY+LdcHh
         S1jCwBE3/AwB3oRzN3hiX+L8cIHOTyqp0TKyQYNjcxi+7oZBTXXBfIEv3fmgxQ9+OuyX
         0CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253999; x=1747858799;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rm2FnYVpOPKGzgLp2Z3jsVJbvgsdY2D1Iyk7m73KHwY=;
        b=SjNGlov09a2g7acW4UYu3Je3awsL+dlBiYghvyZ+Dtc0fFAZKi9P675G82UpyLPsgl
         AR8iN14dUynVV9P17iq++2K+m/L+YlLeNIgW8xEjGeSDKkOgX0+gA5BabzFVpouf2lVd
         WoZqnIcSV3vq1L/C7eTGRgAQpdfIqqoeeR1zcIjr73zWbHYGtiURVFMlP2WcVkdenVVI
         wuHwqev6ZQMMkOKkYU/UkeoBB68zeySF7OUrC/vb4LXy5yxg3WmaEkeaR7vgU7xLzge1
         CLMN5tgO+22YXfhQl/HtB65O30mvHAxujA8zsORDamtHM8GNE+Pu60AVqa0T7Ig4V7Dd
         v6MA==
X-Forwarded-Encrypted: i=1; AJvYcCX+OpGg/lG4qlA1Rb/7s+FuoCaOhiQptSOlfAK+DlyfeN5Nc3+bLl2XNy5qt7WmbguzZVMLhxfaRe5GgMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpyuiYP+a+gXKaoLNdpp8U79WcJmMzbcWeRQfkjumKcLH7i4k
	dO5+4ObqcfohO/Im4E9RDGA7QXlFbfL3WAMqinFEBtNlxMsz8Nwu
X-Gm-Gg: ASbGncvpz6TUaqJED+3/ycRrWvzUZnapt3g56+2kYMj/jpyCUIzJqRswVeRjoZCiMTj
	Sd29UVc1BknBoYHu3uNp3dsYVvMwl6vv5obN8dIaK1A94OSqI4sMruVb42N+8kJ37Yc8bp+w/5f
	S+Kt9OXXe9DK29n/az0FnuX5wO3yhYRk7EoPbpucG9gckprinz4gAp75rjSUoVUIirl08E9GY+Y
	1BZL6UXURYKpHd0jf82o7F99bn7zlly77k3nL2XHgBohpqERG4KEDmmtliaayzXNoFwrb1qsVgu
	8s0gicSShD7EhTxKKlVnlFiU5CqqVY9jKKwDGxo2yXQXn8/LApKGju81P8LdizDeo/4nge0B
X-Google-Smtp-Source: AGHT+IG6hyBgB74+Dmfk/XZ+O70FUpbVor0T4XknSZBPfSuOBon/HuF6tqOb4siCpivKZcm0wqduRw==
X-Received: by 2002:a17:90b:4f8d:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-30e2e619822mr6963396a91.21.1747253998497;
        Wed, 14 May 2025 13:19:58 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:57 -0700 (PDT)
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
Subject: [PATCH 27/28] mm, swap: use swap table to track swap count
Date: Thu, 15 May 2025 04:17:27 +0800
Message-ID: <20250514201729.48420-28-ryncsn@gmail.com>
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

Now all the data is ready, switch to use swap table only.

Introduce a new set of functions based on swap table for manipulating
swap counts:

- swap_dup_entry_locked
  Increase the swap count of one swap entry. The entry must be allocated
  by folio_alloc_swap.

- swap_dup_entries
  Increase the swap count of a set of swap entries. The entries must be
  allocated by folio_alloc_swap.

- swap_put_entry_locked (already exist but rewritten)
  Decrease the swap count of one swap entry. The entry must be allocated
  by folio_alloc_swap.
  This won't free the entries completely if they are bounded to a folio
  in swap cache, the entries will be freed when swap cache is freed.

- swap_put_entries (already exist but rewritten)
  Decrease the swap count of a set of swap entries. The entries must be
  allocated by folio_alloc_swap.
  This won't free the entries completely if they are bounded to a folio
  in swap cache, the entries will be freed when swap cache is freed.

And use these helper to replace all existing callers. This helps to
simplify the count tracking by a lot, and the swap_map is gone.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |  11 +-
 mm/memory.c          |   2 +-
 mm/swap.h            |   9 +-
 mm/swap_state.c      |  19 +-
 mm/swapfile.c        | 671 +++++++++++++++----------------------------
 5 files changed, 253 insertions(+), 459 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 60b126918399..b9796bb9e7e7 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -264,8 +264,7 @@ struct swap_info_struct {
 	signed short	prio;		/* swap priority of this type */
 	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
-	unsigned int	max;		/* extent of the swap_map */
-	unsigned char *swap_map;	/* vmalloc'ed array of usage counts */
+	unsigned int	max;		/* size of this swap device */
 	unsigned long *zeromap;		/* kvmalloc'ed bitmap to track zero pages */
 	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
 	struct list_head free_clusters; /* free clusters list */
@@ -284,7 +283,7 @@ struct swap_info_struct {
 	struct completion comp;		/* seldom referenced */
 	spinlock_t lock;		/*
 					 * protect map scan related fields like
-					 * swap_map, lowest_bit, highest_bit,
+					 * lowest_bit, highest_bit,
 					 * inuse_pages, cluster_next,
 					 * cluster_nr, lowest_alloc,
 					 * highest_alloc, free/discard cluster
@@ -437,7 +436,6 @@ static inline long get_nr_swap_pages(void)
 
 extern void si_swapinfo(struct sysinfo *);
 void put_swap_folio(struct folio *folio, swp_entry_t entry);
-extern int add_swap_count_continuation(swp_entry_t, gfp_t);
 int swap_type_of(dev_t device, sector_t offset);
 int find_first_swap(dev_t *device);
 extern unsigned int count_swap_pages(int, int);
@@ -502,11 +500,6 @@ static inline void free_swap_cache(struct folio *folio)
 {
 }
 
-static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
-{
-	return 0;
-}
-
 static inline int do_dup_swap_entry(swp_entry_t ent)
 {
 	return 0;
diff --git a/mm/memory.c b/mm/memory.c
index a9a548575e72..a33f860317f5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1207,7 +1207,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 
 	if (ret == -EIO) {
 		VM_WARN_ON_ONCE(!entry.val);
-		if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
+		if (swap_retry_table_alloc(entry, GFP_KERNEL) < 0) {
 			ret = -ENOMEM;
 			goto out;
 		}
diff --git a/mm/swap.h b/mm/swap.h
index 7cbfca39225f..228195e54c9d 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -39,6 +39,7 @@ struct swap_cluster_info {
 	u8 flags;
 	u8 order;
 	swp_te_t *table;
+	unsigned long *extend_table; /* Only used for extended swap count */
 	struct list_head list;
 };
 
@@ -135,6 +136,8 @@ static inline void swap_unlock_cluster_irq(struct swap_cluster_info *ci)
 	spin_unlock_irq(&ci->lock);
 }
 
+extern int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp);
+
 /*
  * All swap entries starts getting allocated by folio_alloc_swap(),
  * and the folio will be added to swap cache.
@@ -198,7 +201,6 @@ extern int __swap_cache_replace_folio(struct swap_cluster_info *ci,
 extern void __swap_cache_override_folio(struct swap_cluster_info *ci,
 					swp_entry_t entry, struct folio *old,
 					struct folio *new);
-extern void __swap_cache_clear_shadow(swp_entry_t entry, int nr_ents);
 
 /*
  * Return the swap device position of the swap entry.
@@ -364,6 +366,11 @@ static inline int swap_writepage(struct page *p, struct writeback_control *wbc)
 	return 0;
 }
 
+static inline int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
+{
+	return -EINVAL;
+}
+
 static inline struct folio *swap_cache_get_folio(swp_entry_t entry)
 {
 	return NULL;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 2b145c0f7773..b08d26e7dda5 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -169,7 +169,7 @@ struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 			existing = swp_te_folio(exist);
 			goto out_failed;
 		}
-		if (!__swap_count(swp_entry(si->type, offset)))
+		if (!swp_te_get_count(exist))
 			goto out_failed;
 		if (shadow && swp_te_is_shadow(exist))
 			*shadow = swp_te_shadow(exist);
@@ -234,7 +234,7 @@ void __swap_cache_del_folio(swp_entry_t entry,
 		exist = __swap_table_get(ci, offset);
 		VM_WARN_ON_ONCE(swp_te_folio(exist) != folio);
 		__swap_table_set_shadow(ci, offset, shadow);
-		if (__swap_count(swp_entry(si->type, offset)))
+		if (swp_te_get_count(exist))
 			folio_swapped = true;
 		else
 			need_free = true;
@@ -250,7 +250,7 @@ void __swap_cache_del_folio(swp_entry_t entry,
 	} else if (need_free) {
 		offset = start;
 		do {
-			if (!__swap_count(swp_entry(si->type, offset)))
+			if (!swp_te_get_count(__swap_table_get(ci, offset)))
 				__swap_free_entries(si, ci, offset, 1);
 		} while (++offset < end);
 	}
@@ -270,19 +270,6 @@ void *swap_cache_get_shadow(swp_entry_t entry)
 	return swp_te_is_shadow(swp_te) ? swp_te_shadow(swp_te) : NULL;
 }
 
-void __swap_cache_clear_shadow(swp_entry_t entry, int nr_ents)
-{
-	struct swap_cluster_info *ci;
-	pgoff_t offset = swp_offset(entry), end;
-
-	ci = swp_offset_cluster(swp_info(entry), offset);
-	end = offset + nr_ents;
-	do {
-		WARN_ON_ONCE(swp_te_is_folio(__swap_table_get(ci, offset)));
-		__swap_table_set_null(ci, offset);
-	} while (++offset < end);
-}
-
 /*
  * Lookup a swap entry in the swap cache. A found folio will be returned
  * unlocked and with its refcount incremented.
diff --git a/mm/swapfile.c b/mm/swapfile.c
index c50cbf6578d3..17b592e938bc 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -52,15 +52,8 @@
 #include "swap_table.h"
 #include "swap.h"
 
-static bool swap_count_continued(struct swap_info_struct *, pgoff_t,
-				 unsigned char);
-static void free_swap_count_continuations(struct swap_info_struct *);
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
-static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr);
-static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
-					   struct swap_cluster_info *ci,
-					   swp_entry_t entry);
 static bool folio_swapcache_freeable(struct folio *folio);
 
 static DEFINE_SPINLOCK(swap_lock);
@@ -172,21 +165,18 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
 /* Reclaim the swap entry if swap is getting full */
 #define TTRS_FULL		0x4
 
-static bool swap_only_has_cache(struct swap_info_struct *si,
-				struct swap_cluster_info *ci,
-				unsigned long offset, int nr_pages)
+static bool swap_only_has_cache(struct swap_cluster_info *ci,
+				unsigned long start, int nr_pages)
 {
-	unsigned char *map = si->swap_map + offset;
-	unsigned char *map_end = map + nr_pages;
+	unsigned long offset = start, end = start + nr_pages;
 	swp_te_t entry;
 
 	do {
 		entry = __swap_table_get(ci, offset);
 		VM_WARN_ON_ONCE(!swp_te_is_folio(entry));
-		if (*map)
+		if (swp_te_get_count(entry))
 			return false;
-		offset++;
-	} while (++map < map_end);
+	} while (++offset < end);
 
 	return true;
 }
@@ -247,7 +237,7 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	 * reference or pending writeback, and can't be allocated to others.
 	 */
 	ci = swap_lock_cluster(si, offset);
-	need_reclaim = swap_only_has_cache(si, ci, offset, nr_pages);
+	need_reclaim = swap_only_has_cache(ci, offset, nr_pages);
 	swap_unlock_cluster(ci);
 	if (!need_reclaim)
 		goto out_unlock;
@@ -434,13 +424,16 @@ static int cluster_table_alloc(struct swap_cluster_info *ci)
 
 static void cluster_table_free(struct swap_cluster_info *ci)
 {
+	swp_te_t swp_te;
 	unsigned int offset;
 
 	if (!ci->table)
 		return;
 
-	for (offset = 0; offset <= SWAPFILE_CLUSTER; offset++)
-		WARN_ON(!swp_te_is_null(__swap_table_get(ci, offset)));
+	for (offset = 0; offset <= SWAPFILE_CLUSTER; offset++) {
+		swp_te = __swap_table_get(ci, offset);
+		WARN_ON_ONCE(!swp_te_is_null(swp_te) && !swp_te_is_bad(swp_te));
+	}
 
 	kfree(ci->table);
 	ci->table = NULL;
@@ -649,13 +642,14 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
 				  struct swap_cluster_info *ci,
 				  unsigned long start, unsigned long end)
 {
-	unsigned char *map = si->swap_map;
 	unsigned long offset = start;
+	swp_te_t entry;
 	int nr_reclaim;
 
 	spin_unlock(&ci->lock);
 	do {
-		if (READ_ONCE(map[offset]))
+		entry = __swap_table_get(ci, offset);
+		if (swp_te_get_count(entry))
 			break;
 		nr_reclaim = __try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
 		if (nr_reclaim > 0)
@@ -668,9 +662,11 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
 	 * Recheck the range no matter reclaim succeeded or not, the slot
 	 * could have been be freed while we are not holding the lock.
 	 */
-	for (offset = start; offset < end; offset++)
-		if (map[offset] || !swp_te_is_null(__swap_table_get(ci, offset)))
+	for (offset = start; offset < end; offset++) {
+		entry = __swap_table_get(ci, offset);
+		if (!swp_te_is_null(entry))
 			return false;
+	}
 
 	return true;
 }
@@ -681,21 +677,27 @@ static bool cluster_scan_range(struct swap_info_struct *si,
 			       bool *need_reclaim)
 {
 	unsigned long offset, end = start + nr_pages;
-	unsigned char *map = si->swap_map;
+	swp_te_t entry;
 
 	if (cluster_is_empty(ci))
 		return true;
 
 	for (offset = start; offset < end; offset++) {
-		if (map[offset])
+		entry = __swap_table_get(ci, offset);
+		if (swp_te_get_count(entry))
 			return false;
-		if (swp_te_is_folio(__swap_table_get(ci, offset))) {
+		if (swp_te_is_folio(entry)) {
 			if (!vm_swap_full())
 				return false;
 			*need_reclaim = true;
+		} else {
+			/*
+			 * Something leaked, should never see anything
+			 * with zero count other than clean cached folio.
+			 */
+			WARN_ON_ONCE(!swp_te_is_null(entry));
 		}
 	}
-
 	return true;
 }
 
@@ -725,8 +727,8 @@ static bool cluster_alloc_range(struct swap_info_struct *si,
 		__swap_cache_add_folio(entry, ci, folio);
 	} else {
 		/* from get_swap_page_of_type */
-		VM_WARN_ON_ONCE(si->swap_map[offset] || swap_cache_check_folio(entry));
-		si->swap_map[offset] = 1;
+		VM_WARN_ON_ONCE(swap_cache_check_folio(entry));
+		__swap_table_set(ci, offset, swp_te_set_count(null_swp_te(), 1));
 	}
 
 	return true;
@@ -795,7 +797,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 	long to_scan = 1;
 	unsigned long offset, end;
 	struct swap_cluster_info *ci;
-	unsigned char *map = si->swap_map;
+	swp_te_t entry;
 	int nr_reclaim;
 
 	if (force)
@@ -807,8 +809,8 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		to_scan--;
 
 		while (offset < end) {
-			if (!map[offset] &&
-			    swp_te_is_folio(__swap_table_get(ci, offset))) {
+			entry = __swap_table_get(ci, offset);
+			if (swp_te_is_folio(entry) && !swp_te_get_count(entry)) {
 				spin_unlock(&ci->lock);
 				nr_reclaim = __try_to_reclaim_swap(si, offset,
 								   TTRS_ANYWAY);
@@ -1089,7 +1091,6 @@ static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
 			si->bdev->bd_disk->fops->swap_slot_free_notify;
 	else
 		swap_slot_free_notify = NULL;
-	__swap_cache_clear_shadow(swp_entry(si->type, offset), nr_entries);
 	while (offset <= end) {
 		arch_swap_invalidate_page(si->type, offset);
 		if (swap_slot_free_notify)
@@ -1196,6 +1197,95 @@ static void swap_alloc_slow(struct folio *folio)
 	spin_unlock(&swap_avail_lock);
 }
 
+static int swap_extend_table_alloc(struct swap_info_struct *si,
+				   struct swap_cluster_info *ci, gfp_t gfp)
+{
+	void *table;
+	table = kzalloc(sizeof(unsigned long) * SWAPFILE_CLUSTER, gfp);
+	if (!table)
+		return -ENOMEM;
+
+	spin_lock(&ci->lock);
+	if (!ci->extend_table)
+		ci->extend_table = table;
+	else
+		kfree(table);
+	spin_unlock(&ci->lock);
+	return 0;
+}
+
+int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
+{
+	int ret;
+	struct swap_info_struct *si;
+	struct swap_cluster_info *ci;
+	unsigned long offset = swp_offset(entry);
+
+	si = get_swap_device(entry);
+	if (!si)
+		return 0;
+
+	ci = swp_offset_cluster(si, offset);
+	ret = swap_extend_table_alloc(si, ci, gfp);
+
+	put_swap_device(si);
+	return ret;
+}
+
+static void swap_extend_table_try_free(struct swap_info_struct *si,
+				       struct swap_cluster_info *ci)
+{
+	unsigned long i;
+	bool can_free = true;
+
+	for (i = 0; i < SWAPFILE_CLUSTER; i++) {
+		if (ci->extend_table[i])
+			can_free = false;
+	}
+
+	if (can_free) {
+		kfree(ci->extend_table);
+		ci->extend_table = NULL;
+	}
+}
+
+static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
+					   struct swap_cluster_info *ci,
+					   unsigned long offset)
+{
+	unsigned long count;
+	swp_te_t entry;
+
+	lockdep_assert_held(&ci->lock);
+
+	entry = __swap_table_get(ci, offset);
+	count = swp_te_get_count(entry);
+
+	VM_WARN_ON_ONCE(!count);
+	VM_WARN_ON_ONCE(count > ENTRY_COUNT_MAX);
+
+	if (count == ENTRY_COUNT_MAX) {
+		count = ci->extend_table[offset % SWAPFILE_CLUSTER];
+		VM_WARN_ON_ONCE(count < ENTRY_COUNT_MAX);
+		count--;
+		if (count == (ENTRY_COUNT_MAX - 1)) {
+			ci->extend_table[offset % SWAPFILE_CLUSTER] = 0;
+			__swap_table_set(ci, offset, swp_te_set_count(entry, count));
+			swap_extend_table_try_free(si, ci);
+		} else {
+			ci->extend_table[offset % SWAPFILE_CLUSTER] = count;
+		}
+	} else {
+		count--;
+		__swap_table_set(ci, offset, swp_te_set_count(entry, count));
+	}
+
+	if (!count && !swp_te_is_folio(__swap_table_get(ci, offset)))
+		__swap_free_entries(si, ci, offset, 1);
+
+	return count;
+}
+
 /*
  * Put the ref count of entries, caller must ensure the entries'
  * swap table count are not zero. This won't free up the swap cache.
@@ -1214,7 +1304,7 @@ static bool swap_put_entries(struct swap_info_struct *si,
 	cluster_end = min(cluster_offset(si, ci) + SWAPFILE_CLUSTER, end);
 	do {
 		swp_te = __swap_table_get(ci, offset);
-		count = si->swap_map[offset];
+		count = swp_te_get_count(swp_te);
 		if (WARN_ON_ONCE(!count)) {
 			goto skip;
 		} else if (swp_te_is_folio(swp_te)) {
@@ -1225,7 +1315,7 @@ static bool swap_put_entries(struct swap_info_struct *si,
 			head = head ? head : offset;
 			continue;
 		}
-		swap_put_entry_locked(si, ci, swp_entry(si->type, offset));
+		swap_put_entry_locked(si, ci, offset);
 skip:
 		if (head) {
 			__swap_free_entries(si, ci, head, offset - head);
@@ -1245,6 +1335,78 @@ static bool swap_put_entries(struct swap_info_struct *si,
 	return has_cache;
 }
 
+static int swap_dup_entry_locked(struct swap_info_struct *si,
+				 struct swap_cluster_info *ci,
+				 unsigned long offset)
+{
+	swp_te_t entry = __swap_table_get(ci, offset);
+	unsigned int count = swp_te_get_count(entry);
+
+	lockdep_assert_held(&ci->lock);
+
+	if (WARN_ON_ONCE(count == ENTRY_COUNT_BAD))
+		return -ENOENT;
+	if (WARN_ON_ONCE(!count && !swp_te_is_folio(entry)))
+		return -ENOENT;
+	if (WARN_ON_ONCE(offset > si->max))
+		return -EINVAL;
+
+	if (likely(count < (ENTRY_COUNT_MAX - 1))) {
+		__swap_table_set_count(ci, offset, count + 1);
+		VM_WARN_ON_ONCE(ci->extend_table && ci->extend_table[offset % SWAPFILE_CLUSTER]);
+	} else if (count == (ENTRY_COUNT_MAX - 1)) {
+		if (ci->extend_table) {
+			VM_WARN_ON_ONCE(ci->extend_table[offset % SWAPFILE_CLUSTER]);
+			ci->extend_table[offset % SWAPFILE_CLUSTER] = ENTRY_COUNT_MAX;
+			__swap_table_set_count(ci, offset, ENTRY_COUNT_MAX);
+		} else {
+			return -ENOMEM;
+		}
+	} else if (count == ENTRY_COUNT_MAX) {
+		++ci->extend_table[offset % SWAPFILE_CLUSTER];
+	} else {
+		/* Never happens unless counting went wrong */
+		WARN_ON_ONCE(1);
+	}
+
+	return 0;
+}
+
+/*
+ * Increase the swap count of each specified entries by one.
+ */
+static bool swap_dup_entries(struct swap_info_struct *si,
+			     unsigned long start, int nr)
+{
+	int err;
+	struct swap_cluster_info *ci;
+	unsigned long offset = start, end = start + nr;
+
+	ci = swap_lock_cluster(si, offset);
+	VM_WARN_ON_ONCE(ci != swp_offset_cluster(si, start + nr - 1));
+restart:
+	do {
+		err = swap_dup_entry_locked(si, ci, offset);
+		if (unlikely(err)) {
+			if (err == -ENOMEM) {
+				swap_unlock_cluster(ci);
+				err = swap_extend_table_alloc(si, ci, GFP_ATOMIC);
+				ci = swap_lock_cluster(si, offset);
+				if (!err)
+					goto restart;
+			}
+			goto failed;
+		}
+	} while (++offset < end);
+	swap_unlock_cluster(ci);
+	return 0;
+failed:
+	while (offset-- > start)
+		swap_put_entry_locked(si, ci, offset);
+	swap_unlock_cluster(ci);
+	return err;
+}
+
 /**
  * folio_alloc_swap - allocate swap space for a folio
  * @folio: folio we want to move to swap
@@ -1302,7 +1464,6 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
  */
 int folio_dup_swap(struct folio *folio, struct page *subpage)
 {
-	int err = 0;
 	swp_entry_t entry = folio->swap;
 	unsigned long nr_pages = folio_nr_pages(folio);
 
@@ -1314,10 +1475,7 @@ int folio_dup_swap(struct folio *folio, struct page *subpage)
 		nr_pages = 1;
 	}
 
-	while (!err && __swap_duplicate(entry, 1, nr_pages) == -ENOMEM)
-		err = add_swap_count_continuation(entry, GFP_ATOMIC);
-
-	return err;
+	return swap_dup_entries(swp_info(entry), swp_offset(entry), nr_pages);
 }
 
 /*
@@ -1364,31 +1522,6 @@ void folio_free_swap_cache(struct folio *folio)
 	folio_ref_sub(folio, folio_nr_pages(folio));
 }
 
-static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
-					   struct swap_cluster_info *ci,
-					   swp_entry_t entry)
-{
-	unsigned long offset = swp_offset(entry);
-	unsigned char count;
-
-	count = si->swap_map[offset];
-	if ((count & ~COUNT_CONTINUED) <= SWAP_MAP_MAX) {
-		if (count == COUNT_CONTINUED) {
-			if (swap_count_continued(si, offset, count))
-				count = SWAP_MAP_MAX | COUNT_CONTINUED;
-			else
-				count = SWAP_MAP_MAX;
-		} else
-			count--;
-	}
-
-	WRITE_ONCE(si->swap_map[offset], count);
-	if (!count && !swp_te_is_folio(__swap_table_get(ci, offset)))
-		__swap_free_entries(si, ci, offset, 1);
-
-	return count;
-}
-
 /*
  * When we get a swap entry, if there aren't some other ways to
  * prevent swapoff, such as the folio in swap cache is locked, RCU
@@ -1457,10 +1590,10 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 
 void __swap_free_entries(struct swap_info_struct *si,
 		       struct swap_cluster_info *ci,
-		       unsigned long offset, unsigned int nr_pages)
+		       unsigned long start, unsigned int nr_pages)
 {
-	swp_entry_t entry = swp_entry(si->type, offset);
-	unsigned long end = offset + nr_pages;
+	swp_entry_t entry = swp_entry(si->type, start);
+	unsigned long offset = start, end = start + nr_pages;
 
 	/* It should never free entries across different clusters */
 	VM_BUG_ON(ci != swp_offset_cluster(si, offset + nr_pages - 1));
@@ -1469,12 +1602,13 @@ void __swap_free_entries(struct swap_info_struct *si,
 
 	ci->count -= nr_pages;
 	do {
-		si->swap_map[offset] = 0;
+		/* It should be either a real shadow or empty shadow */
+		VM_WARN_ON_ONCE(!swp_te_is_shadow(__swap_table_get(ci, offset)));
+		__swap_table_set_null(ci, offset);
 	} while (++offset < end);
 
-	offset = swp_offset(entry);
 	mem_cgroup_uncharge_swap(entry, nr_pages);
-	swap_range_free(si, offset, nr_pages);
+	swap_range_free(si, start, nr_pages);
 
 	if (!ci->count)
 		free_cluster(si, ci);
@@ -1485,9 +1619,10 @@ void __swap_free_entries(struct swap_info_struct *si,
 int __swap_count(swp_entry_t entry)
 {
 	struct swap_info_struct *si = swp_info(entry);
+	struct swap_cluster_info *ci;
 	pgoff_t offset = swp_offset(entry);
-
-	return si->swap_map[offset];
+	ci = swp_offset_cluster(si, offset);
+	return swp_te_get_count(__swap_table_get(ci, offset));
 }
 
 /*
@@ -1499,12 +1634,13 @@ bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
 {
 	pgoff_t offset = swp_offset(entry);
 	struct swap_cluster_info *ci;
-	int count;
+	swp_te_t swp_te;
 
 	ci = swap_lock_cluster(si, offset);
-	count = si->swap_map[offset];
+	swp_te = __swap_table_get(ci, offset);
 	swap_unlock_cluster(ci);
-	return !!count;
+
+	return __swp_te_is_countable(swp_te) && swp_te_get_count(swp_te);
 }
 
 /*
@@ -1513,42 +1649,22 @@ bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
  */
 int swp_swapcount(swp_entry_t entry)
 {
-	int count, tmp_count, n;
 	struct swap_info_struct *si;
 	struct swap_cluster_info *ci;
-	struct page *page;
+	swp_te_t ste;
 	pgoff_t offset;
-	unsigned char *map;
+	int count;
 
 	si = get_swap_device(entry);
 	if (!si)
 		return 0;
 
 	offset = swp_offset(entry);
-
 	ci = swap_lock_cluster(si, offset);
-
-	count = si->swap_map[offset];
-	if (!(count & COUNT_CONTINUED))
-		goto out;
-
-	count &= ~COUNT_CONTINUED;
-	n = SWAP_MAP_MAX + 1;
-
-	page = vmalloc_to_page(si->swap_map + offset);
-	offset &= ~PAGE_MASK;
-	VM_BUG_ON(page_private(page) != SWP_CONTINUED);
-
-	do {
-		page = list_next_entry(page, lru);
-		map = kmap_local_page(page);
-		tmp_count = map[offset];
-		kunmap_local(map);
-
-		count += (tmp_count & ~COUNT_CONTINUED) * n;
-		n *= (SWAP_CONT_MAX + 1);
-	} while (tmp_count & COUNT_CONTINUED);
-out:
+	ste = __swap_table_get(ci, offset);
+	count = swp_te_get_count(ste);
+	if (count == ENTRY_COUNT_MAX)
+		count = ci->extend_table[offset % SWAPFILE_CLUSTER];
 	swap_unlock_cluster(ci);
 	put_swap_device(si);
 	return count;
@@ -1558,7 +1674,6 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 					 swp_entry_t entry, int order)
 {
 	struct swap_cluster_info *ci;
-	unsigned char *map = si->swap_map;
 	unsigned int nr_pages = 1 << order;
 	unsigned long roffset = swp_offset(entry);
 	unsigned long offset = round_down(roffset, nr_pages);
@@ -1567,12 +1682,12 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 
 	ci = swap_lock_cluster(si, offset);
 	if (nr_pages == 1) {
-		if (map[roffset])
+		if (swp_te_get_count(__swap_table_get(ci, roffset)))
 			ret = true;
 		goto unlock_out;
 	}
 	for (i = 0; i < nr_pages; i++) {
-		if (map[offset + i]) {
+		if (swp_te_get_count(__swap_table_get(ci, offset + i))) {
 			ret = true;
 			break;
 		}
@@ -1678,7 +1793,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	/*
 	 * First free all entries in the range.
 	 */
-	any_only_cache = swap_put_entries(swp_info(entry), swp_offset(entry), nr);
+	any_only_cache = swap_put_entries(si, start_offset, nr);
 
 	/*
 	 * Short-circuit the below loop if none of the entries had their
@@ -1693,7 +1808,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	for (offset = start_offset; offset < end_offset; offset += nr) {
 		nr = 1;
 		swp_te = __swap_table_get(swp_offset_cluster(si, offset), offset);
-		if (!READ_ONCE(si->swap_map[offset]) && swp_te_is_folio(swp_te)) {
+		if (swp_te_is_folio(swp_te) && !swp_te_get_count(swp_te)) {
 			/*
 			 * Folios are always naturally aligned in swap so
 			 * advance forward to the next boundary. Zero means no
@@ -1752,7 +1867,7 @@ void free_swap_page_of_entry(swp_entry_t entry)
 	if (!si)
 		return;
 	ci = swap_lock_cluster(si, offset);
-	WARN_ON(swap_put_entry_locked(si, ci, entry));
+	WARN_ON(swap_put_entry_locked(si, ci, offset));
 	/* It might got added to swap cache accidentally by read ahead */
 	__try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
 	swap_unlock_cluster(ci);
@@ -2012,7 +2127,8 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 						&vmf);
 		}
 		if (!folio) {
-			swp_count = READ_ONCE(si->swap_map[offset]);
+			swp_count = swp_te_get_count(__swap_table_get(swp_cluster(entry),
+						     swp_offset(entry)));
 			if (swp_count == 0 || swp_count == SWAP_MAP_BAD)
 				continue;
 			return -ENOMEM;
@@ -2144,7 +2260,7 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
 }
 
 /*
- * Scan swap_map from current position to next entry still in use.
+ * Scan swap table from current position to next entry still in use.
  * Return 0 if there are no inuse entries after prev till end of
  * the map.
  */
@@ -2154,7 +2270,6 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 {
 	unsigned int i;
 	swp_te_t swp_te;
-	unsigned char count;
 
 	/*
 	 * No need for swap_lock here: we're just looking
@@ -2163,11 +2278,8 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	 * allocations from this area (while holding swap_lock).
 	 */
 	for (i = prev + 1; i < si->max; i++) {
-		count = READ_ONCE(si->swap_map[i]);
 		swp_te = __swap_table_get(swp_offset_cluster(si, i), i);
-		if (count == SWAP_MAP_BAD)
-			continue;
-		if (count || swp_te_is_folio(swp_te))
+		if (!swp_te_is_null(swp_te) && !swp_te_is_bad(swp_te))
 			break;
 		if ((i % LATENCY_LIMIT) == 0)
 			cond_resched();
@@ -2572,7 +2684,6 @@ static void flush_percpu_swap_cluster(struct swap_info_struct *si)
 SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
-	unsigned char *swap_map;
 	unsigned long *zeromap;
 	struct file *swap_file, *victim;
 	struct address_space *mapping;
@@ -2668,7 +2779,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	destroy_swap_extents(p);
 	if (p->flags & SWP_CONTINUED)
-		free_swap_count_continuations(p);
 
 	if (!p->bdev || !bdev_nonrot(p->bdev))
 		atomic_dec(&nr_rotate_swap);
@@ -2680,8 +2790,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	swap_file = p->swap_file;
 	p->swap_file = NULL;
-	swap_map = p->swap_map;
-	p->swap_map = NULL;
 	zeromap = p->zeromap;
 	p->zeromap = NULL;
 	free_swap_cluster_info(p->cluster_info, p->max);
@@ -2694,7 +2802,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	mutex_unlock(&swapon_mutex);
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
-	vfree(swap_map);
 	kvfree(zeromap);
 	/* Destroy swap account information */
 	swap_cgroup_swapoff(p->type);
@@ -2754,7 +2861,7 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
 		return SEQ_START_TOKEN;
 
 	for (type = 0; (si = swp_type_get_info(type)); type++) {
-		if (!(si->flags & SWP_USED) || !si->swap_map)
+		if (!(si->flags & SWP_USED))
 			continue;
 		if (!--l)
 			return si;
@@ -2775,7 +2882,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swp_type_get_info(type)); type++) {
-		if (!(si->flags & SWP_USED) || !si->swap_map)
+		if (!(si->flags & SWP_USED))
 			continue;
 		return si;
 	}
@@ -3037,7 +3144,6 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 
 static int setup_swap_map_and_extents(struct swap_info_struct *si,
 					union swap_header *swap_header,
-					unsigned char *swap_map,
 					unsigned long maxpages,
 					sector_t *span)
 {
@@ -3052,13 +3158,14 @@ static int setup_swap_map_and_extents(struct swap_info_struct *si,
 		if (page_nr == 0 || page_nr > swap_header->info.last_page)
 			return -EINVAL;
 		if (page_nr < maxpages) {
-			swap_map[page_nr] = SWAP_MAP_BAD;
+			__swap_table_set(&si->cluster_info[page_nr / SWAPFILE_CLUSTER],
+					 page_nr, bad_swp_te());
 			nr_good_pages--;
 		}
 	}
 
 	if (nr_good_pages) {
-		swap_map[0] = SWAP_MAP_BAD;
+		__swap_table_set(&si->cluster_info[0], 0, bad_swp_te());
 		si->pages = nr_good_pages;
 		nr_extents = setup_swap_extents(si, span);
 		if (nr_extents < 0)
@@ -3162,7 +3269,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	int nr_extents;
 	sector_t span;
 	unsigned long maxpages;
-	unsigned char *swap_map = NULL;
 	unsigned long *zeromap = NULL;
 	struct folio *folio = NULL;
 	struct inode *inode = NULL;
@@ -3241,20 +3347,11 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (error)
 		goto bad_swap_unlock_inode;
 
-	/* OK, set up the swap map and apply the bad block list */
-	swap_map = vzalloc(maxpages);
-	si->swap_map = swap_map;
-	if (!swap_map) {
-		error = -ENOMEM;
-		goto bad_swap_unlock_inode;
-	}
-
 	error = swap_cgroup_swapon(si->type, maxpages);
 	if (error)
 		goto bad_swap_unlock_inode;
 
-	nr_extents = setup_swap_map_and_extents(si, swap_header, swap_map,
-						maxpages, &span);
+	nr_extents = setup_swap_map_and_extents(si, swap_header, maxpages, &span);
 	if (unlikely(nr_extents < 0)) {
 		error = nr_extents;
 		goto bad_swap_unlock_inode;
@@ -3364,8 +3461,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	si->swap_file = NULL;
 	si->flags = 0;
 	spin_unlock(&swap_lock);
-	vfree(si->swap_map);
-	si->swap_map = NULL;
 	free_swap_cluster_info(si->cluster_info, si->max);
 	si->cluster_info = NULL;
 	kvfree(zeromap);
@@ -3400,80 +3495,6 @@ void si_swapinfo(struct sysinfo *val)
 	spin_unlock(&swap_lock);
 }
 
-/*
- * Verify that nr swap entries are valid and increment their swap map counts.
- *
- * Returns error code in following case.
- * - success -> 0
- * - swp_entry is invalid -> EINVAL
- * - swap-cache reference is requested but there is already one. -> EEXIST
- * - swap-cache reference is requested but the entry is not used. -> ENOENT
- * - swap-mapped reference requested but needs continued swap count. -> ENOMEM
- */
-static int swap_dup_entries(struct swap_info_struct *si,
-			    struct swap_cluster_info *ci,
-			    unsigned long offset,
-			    unsigned char usage, int nr)
-{
-	int i;
-	unsigned char count;
-
-	for (i = 0; i < nr; i++) {
-		count = si->swap_map[offset + i];
-
-		/*
-		 * swapin_readahead() doesn't check if a swap entry is valid, so the
-		 * swap entry could be SWAP_MAP_BAD. Check here with lock held.
-		 */
-		if (unlikely(count == SWAP_MAP_BAD))
-			return -ENOENT;
-
-		if (!count && !swp_te_is_folio(__swap_table_get(ci, offset)))
-			return -ENOENT;
-	}
-
-	for (i = 0; i < nr; i++) {
-		count = si->swap_map[offset + i];
-		if ((count & ~COUNT_CONTINUED) < SWAP_MAP_MAX)
-			count += usage;
-		else if (swap_count_continued(si, offset + i, count))
-			count = COUNT_CONTINUED;
-		else {
-			/*
-			 * Don't need to rollback changes, because if
-			 * usage == 1, there must be nr == 1.
-			 */
-			return -ENOMEM;
-		}
-
-		WRITE_ONCE(si->swap_map[offset + i], count);
-	}
-
-	return 0;
-}
-
-static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
-{
-	struct swap_info_struct *si;
-	struct swap_cluster_info *ci;
-	unsigned long offset;
-	int err;
-
-	si = swp_get_info(entry);
-	if (WARN_ON_ONCE(!si)) {
-		pr_err("%s%08lx\n", Bad_file, entry.val);
-		return -EINVAL;
-	}
-
-	offset = swp_offset(entry);
-	VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
-	ci = swap_lock_cluster(si, offset);
-	err = swap_dup_entries(si, ci, offset, usage, nr);
-	swap_unlock_cluster(ci);
-
-	return err;
-}
-
 /**
  * do_dup_swap_entry() - Increase reference count of a swap entry by one.
  *
@@ -3489,233 +3510,19 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
  * to protect the entry from being freed.
  */
 int do_dup_swap_entry(swp_entry_t entry)
-{
-	int err = 0;
-	while (!err && __swap_duplicate(entry, 1, 1) == -ENOMEM)
-		err = add_swap_count_continuation(entry, GFP_ATOMIC);
-	return err;
-}
-
-/*
- * add_swap_count_continuation - called when a swap count is duplicated
- * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's
- * page of the original vmalloc'ed swap_map, to hold the continuation count
- * (for that entry and for its neighbouring PAGE_SIZE swap entries).  Called
- * again when count is duplicated beyond SWAP_MAP_MAX * SWAP_CONT_MAX, etc.
- *
- * These continuation pages are seldom referenced: the common paths all work
- * on the original swap_map, only referring to a continuation page when the
- * low "digit" of a count is incremented or decremented through SWAP_MAP_MAX.
- *
- * add_swap_count_continuation(, GFP_ATOMIC) can be called while holding
- * page table locks; if it fails, add_swap_count_continuation(, GFP_KERNEL)
- * can be called after dropping locks.
- */
-int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
 {
 	struct swap_info_struct *si;
-	struct swap_cluster_info *ci;
-	struct page *head;
-	struct page *page;
-	struct page *list_page;
-	pgoff_t offset;
-	unsigned char count;
-	int ret = 0;
-
-	/*
-	 * When debugging, it's easier to use __GFP_ZERO here; but it's better
-	 * for latency not to zero a page while GFP_ATOMIC and holding locks.
-	 */
-	page = alloc_page(gfp_mask | __GFP_HIGHMEM);
-
-	si = get_swap_device(entry);
-	if (!si) {
-		/*
-		 * An acceptable race has occurred since the failing
-		 * __swap_duplicate(): the swap device may be swapoff
-		 */
-		goto outer;
-	}
-
-	offset = swp_offset(entry);
-
-	ci = swap_lock_cluster(si, offset);
-
-	count = si->swap_map[offset];
-
-	if ((count & ~COUNT_CONTINUED) != SWAP_MAP_MAX) {
-		/*
-		 * The higher the swap count, the more likely it is that tasks
-		 * will race to add swap count continuation: we need to avoid
-		 * over-provisioning.
-		 */
-		goto out;
-	}
-
-	if (!page) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	head = vmalloc_to_page(si->swap_map + offset);
-	offset &= ~PAGE_MASK;
-
-	spin_lock(&si->cont_lock);
-	/*
-	 * Page allocation does not initialize the page's lru field,
-	 * but it does always reset its private field.
-	 */
-	if (!page_private(head)) {
-		BUG_ON(count & COUNT_CONTINUED);
-		INIT_LIST_HEAD(&head->lru);
-		set_page_private(head, SWP_CONTINUED);
-		si->flags |= SWP_CONTINUED;
-	}
-
-	list_for_each_entry(list_page, &head->lru, lru) {
-		unsigned char *map;
-
-		/*
-		 * If the previous map said no continuation, but we've found
-		 * a continuation page, free our allocation and use this one.
-		 */
-		if (!(count & COUNT_CONTINUED))
-			goto out_unlock_cont;
-
-		map = kmap_local_page(list_page) + offset;
-		count = *map;
-		kunmap_local(map);
-
-		/*
-		 * If this continuation count now has some space in it,
-		 * free our allocation and use this one.
-		 */
-		if ((count & ~COUNT_CONTINUED) != SWAP_CONT_MAX)
-			goto out_unlock_cont;
-	}
-
-	list_add_tail(&page->lru, &head->lru);
-	page = NULL;			/* now it's attached, don't free it */
-out_unlock_cont:
-	spin_unlock(&si->cont_lock);
-out:
-	swap_unlock_cluster(ci);
-	put_swap_device(si);
-outer:
-	if (page)
-		__free_page(page);
-	return ret;
-}
-
-/*
- * swap_count_continued - when the original swap_map count is incremented
- * from SWAP_MAP_MAX, check if there is already a continuation page to carry
- * into, carry if so, or else fail until a new continuation page is allocated;
- * when the original swap_map count is decremented from 0 with continuation,
- * borrow from the continuation and report whether it still holds more.
- * Called while __swap_duplicate() or caller of swap_put_entry_locked()
- * holds cluster lock.
- */
-static bool swap_count_continued(struct swap_info_struct *si,
-				 pgoff_t offset, unsigned char count)
-{
-	struct page *head;
-	struct page *page;
-	unsigned char *map;
-	bool ret;
-
-	head = vmalloc_to_page(si->swap_map + offset);
-	if (page_private(head) != SWP_CONTINUED) {
-		BUG_ON(count & COUNT_CONTINUED);
-		return false;		/* need to add count continuation */
-	}
-
-	spin_lock(&si->cont_lock);
-	offset &= ~PAGE_MASK;
-	page = list_next_entry(head, lru);
-	map = kmap_local_page(page) + offset;
-
-	if (count == SWAP_MAP_MAX)	/* initial increment from swap_map */
-		goto init_map;		/* jump over SWAP_CONT_MAX checks */
-
-	if (count == (SWAP_MAP_MAX | COUNT_CONTINUED)) { /* incrementing */
-		/*
-		 * Think of how you add 1 to 999
-		 */
-		while (*map == (SWAP_CONT_MAX | COUNT_CONTINUED)) {
-			kunmap_local(map);
-			page = list_next_entry(page, lru);
-			BUG_ON(page == head);
-			map = kmap_local_page(page) + offset;
-		}
-		if (*map == SWAP_CONT_MAX) {
-			kunmap_local(map);
-			page = list_next_entry(page, lru);
-			if (page == head) {
-				ret = false;	/* add count continuation */
-				goto out;
-			}
-			map = kmap_local_page(page) + offset;
-init_map:		*map = 0;		/* we didn't zero the page */
-		}
-		*map += 1;
-		kunmap_local(map);
-		while ((page = list_prev_entry(page, lru)) != head) {
-			map = kmap_local_page(page) + offset;
-			*map = COUNT_CONTINUED;
-			kunmap_local(map);
-		}
-		ret = true;			/* incremented */
+	int err = 0;
 
-	} else {				/* decrementing */
-		/*
-		 * Think of how you subtract 1 from 1000
-		 */
-		BUG_ON(count != COUNT_CONTINUED);
-		while (*map == COUNT_CONTINUED) {
-			kunmap_local(map);
-			page = list_next_entry(page, lru);
-			BUG_ON(page == head);
-			map = kmap_local_page(page) + offset;
-		}
-		BUG_ON(*map == 0);
-		*map -= 1;
-		if (*map == 0)
-			count = 0;
-		kunmap_local(map);
-		while ((page = list_prev_entry(page, lru)) != head) {
-			map = kmap_local_page(page) + offset;
-			*map = SWAP_CONT_MAX | count;
-			count = COUNT_CONTINUED;
-			kunmap_local(map);
-		}
-		ret = count == COUNT_CONTINUED;
+	si = swp_get_info(entry);
+	if (WARN_ON_ONCE(!si)) {
+		pr_err("%s%08lx\n", Bad_file, entry.val);
+		return -EINVAL;
 	}
-out:
-	spin_unlock(&si->cont_lock);
-	return ret;
-}
 
-/*
- * free_swap_count_continuations - swapoff free all the continuation pages
- * appended to the swap_map, after swap_map is quiesced, before vfree'ing it.
- */
-static void free_swap_count_continuations(struct swap_info_struct *si)
-{
-	pgoff_t offset;
-
-	for (offset = 0; offset < si->max; offset += PAGE_SIZE) {
-		struct page *head;
-		head = vmalloc_to_page(si->swap_map + offset);
-		if (page_private(head)) {
-			struct page *page, *next;
+	err = swap_dup_entries(si, swp_offset(entry), 1);
 
-			list_for_each_entry_safe(page, next, &head->lru, lru) {
-				list_del(&page->lru);
-				__free_page(page);
-			}
-		}
-	}
+	return err;
 }
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
-- 
2.49.0

