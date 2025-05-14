Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA0295506
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253892; cv=none; b=ZUnAwdyuetTETo3voOkidRlmnidmSrRRWtU/EQOp97+H5N/oZDlPpX/66KK2ZdckqAErAxVhHflJk3CCMIqnhxRu/N8SHoIZsDn5YNWSR3LlDxXqjueHaFDytbdJV+jfk+XJPw7eZ6DD9ByNPBOL9VptmsNfP461dHIDkWAG5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253892; c=relaxed/simple;
	bh=3yQkNcXjkz1jzwntuz2Qq0+3YuUoTiEh+qqqGYbrlfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGa0CjAiUJYo84Y4EFmMjrJAFX0flJrYGwprmc87rPw5PMqO4gUd0YAzbhv3Ahm8MVn2no2nZuVdCpPWdrQcYgTKoBxVE1mR/N0CkogmkCOw0M9smIzu6ZXKfQzR6kGp/bwR7cXI+lw6xSdalm2HryC5HL2MrdiSxzorWAKf9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z91hEPdZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z91hEPdZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30c5478017dso228171a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253890; x=1747858690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HjqKQ8it9iGHD3aHKIBxL1LNjs/39+IF0Jhy4BnyUEI=;
        b=Z91hEPdZ1LkeB7KOELd9huwOpbpDCrju07x+G/zhQcb9wXL6/7pKuqk30kF9YWUkDM
         dC9smqhHPkJ9/XYRYRaebaafVTotxOCa5YAJPUxPMlGI6Xo2wlJ6r/LWsJv6EYek9EBu
         r0C3+cs205Sm2xtHgFsOjRdxY/9GQYQDwZHFEeRb8ujpGbkDWLR2EBVBmrzGMKN9nFWi
         PqRjyFtmv3JQkJSqH/DAksfdQkxf1RWCARWj/QVHlTKIQZU/UK0qgfcppYJFCsI78muf
         Af1waz+TCwXH1qe+8DPAH13eNXxgk2qXSdMlJmX996vcRofFAoZOOG2h/LMRHa7TwUR3
         MVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253890; x=1747858690;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjqKQ8it9iGHD3aHKIBxL1LNjs/39+IF0Jhy4BnyUEI=;
        b=TgpIaBT23tgDXUHeq2aevxcrA2//LHOd5LnYB96rxMCfq9Mdixt1DTgMpg0mcL22U8
         g8cwmMmhjn2tnjDyfk4JPVA6S01daKautZUi6NqUNJNwm8Yt0YqQ8Ji+7mkw4VS5/FWX
         Q1kyKWplawiJ+TnEG4UrxhyOeSR2duSONteraKkNDaR/slG4GnEIAVYxUboYw8lM7Nzc
         4LX5zVNECkAM9CZDqZ0qUhY8/jnumTCQi5lHPKvdtDM5JhUVGHc7oaYqy1s3q7KO3mtN
         Unt3YEjfG2KfKxy9CX5hlS4LQUOHxVYYVeLFUFUl8P02V5x3uLXrzQhsGqSCazfkZd0d
         VYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPeh0WZVrwm5mvYBGJlt7HhraNUeqAKEvamyxzY2Eyp1wVnhyrn3qRIfffnmNxtU7kYipk+8wpwStseog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIVyXaUGc3MGmag1OkEdghq/9n3v9VSWfRCj1aN2REbdk+WMg
	ZlMHsUsImEw6sS9SpvYWvUwH2HCqP7GvCRTtecl6uZaDOtfaDcKb
X-Gm-Gg: ASbGnct2ls/gIY6onjWRpRSZc6uxhA9awzqshdUlRiSBpYii7tnVJDRC3C1y2lSOTZE
	2sVvQh414ZXJEldvtxCFi+n9jAxOzlWVb9n61Kjj6fjrV8mlsCgEehW5jgU15kZwIrKFf+3VRK6
	CuM5TcBrHaVCBD2GLHGfut4ApKwgkKcgQpXS50fGGIG0mHeO3EfJeE+lY1+MU34ilaIpKdCt2t4
	bq0UNgUYDHnDleUkPYhj0OF7qJbIBAsP/V1E75MLgimBm2GL4zNMFms7j31ocy/MXvU0e9wELMN
	Tw1cKwL5OJCa+299R3HYGIkZi9FqriTaxJCFoGeQ7mxo9OV3qBhNd+zJelG6dq6yozFhfYIL
X-Google-Smtp-Source: AGHT+IEjHBZfNhTCl7nwF4yGmmc/haZ4cQB9qw7yr4hB8AbNnLUFfiKegNDPcRN5aWHt+BvCEAe97w==
X-Received: by 2002:a17:90b:5187:b0:309:fffd:c15a with SMTP id 98e67ed59e1d1-30e2e5bc09cmr8435026a91.13.1747253890067;
        Wed, 14 May 2025 13:18:10 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:09 -0700 (PDT)
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
Subject: [PATCH 06/28] mm, swap: rearrange swap cluster definition and helpers
Date: Thu, 15 May 2025 04:17:06 +0800
Message-ID: <20250514201729.48420-7-ryncsn@gmail.com>
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

No feature change, move all cluster related definition and helpers to
mm/swap.h, also tidy up and add a "swap_" prefix for all cluster
lock/unlock helpers, so they can be better used outside of swap files.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |  34 ---------------
 mm/swap.h            |  62 ++++++++++++++++++++++++++
 mm/swapfile.c        | 102 +++++++++++++------------------------------
 3 files changed, 92 insertions(+), 106 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0e52ac4e817d..1e7d9d55c39a 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -234,40 +234,6 @@ enum {
 /* Special value in each swap_map continuation */
 #define SWAP_CONT_MAX	0x7f	/* Max count */
 
-/*
- * We use this to track usage of a cluster. A cluster is a block of swap disk
- * space with SWAPFILE_CLUSTER pages long and naturally aligns in disk. All
- * free clusters are organized into a list. We fetch an entry from the list to
- * get a free cluster.
- *
- * The flags field determines if a cluster is free. This is
- * protected by cluster lock.
- */
-struct swap_cluster_info {
-	spinlock_t lock;	/*
-				 * Protect swap_cluster_info fields
-				 * other than list, and swap_info_struct->swap_map
-				 * elements corresponding to the swap cluster.
-				 */
-	u16 count;
-	u8 flags;
-	u8 order;
-	struct list_head list;
-};
-
-/* All on-list cluster must have a non-zero flag. */
-enum swap_cluster_flags {
-	CLUSTER_FLAG_NONE = 0, /* For temporary off-list cluster */
-	CLUSTER_FLAG_FREE,
-	CLUSTER_FLAG_NONFULL,
-	CLUSTER_FLAG_FRAG,
-	/* Clusters with flags above are allocatable */
-	CLUSTER_FLAG_USABLE = CLUSTER_FLAG_FRAG,
-	CLUSTER_FLAG_FULL,
-	CLUSTER_FLAG_DISCARD,
-	CLUSTER_FLAG_MAX,
-};
-
 /*
  * The first page in the swap file is the swap header, which is always marked
  * bad to prevent it from being allocated as an entry. This also prevents the
diff --git a/mm/swap.h b/mm/swap.h
index 34af06bf6fa4..38d37d241f1c 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -5,10 +5,72 @@
 struct mempolicy;
 extern int page_cluster;
 
+#ifdef CONFIG_THP_SWAP
+#define SWAPFILE_CLUSTER	HPAGE_PMD_NR
+#define swap_entry_order(order)	(order)
+#else
+#define SWAPFILE_CLUSTER	256
+#define swap_entry_order(order)	0
+#endif
+
+/*
+ * We use this to track usage of a cluster. A cluster is a block of swap disk
+ * space with SWAPFILE_CLUSTER pages long and naturally aligns in disk. All
+ * free clusters are organized into a list. We fetch an entry from the list to
+ * get a free cluster.
+ *
+ * The flags field determines if a cluster is free. This is
+ * protected by cluster lock.
+ */
+struct swap_cluster_info {
+	spinlock_t lock;	/*
+				 * Protect swap_cluster_info fields
+				 * other than list, and swap_info_struct->swap_map
+				 * elements corresponding to the swap cluster.
+				 */
+	u16 count;
+	u8 flags;
+	u8 order;
+	struct list_head list;
+};
+
+/* All on-list cluster must have a non-zero flag. */
+enum swap_cluster_flags {
+	CLUSTER_FLAG_NONE = 0, /* For temporary off-list cluster */
+	CLUSTER_FLAG_FREE,
+	CLUSTER_FLAG_NONFULL,
+	CLUSTER_FLAG_FRAG,
+	/* Clusters with flags above are allocatable */
+	CLUSTER_FLAG_USABLE = CLUSTER_FLAG_FRAG,
+	CLUSTER_FLAG_FULL,
+	CLUSTER_FLAG_DISCARD,
+	CLUSTER_FLAG_MAX,
+};
+
 #ifdef CONFIG_SWAP
 #include <linux/swapops.h> /* for swp_offset */
 #include <linux/blk_types.h> /* for bio_end_io_t */
 
+static inline struct swap_cluster_info *swp_offset_cluster(
+		struct swap_info_struct *si, pgoff_t offset)
+{
+	return &si->cluster_info[offset / SWAPFILE_CLUSTER];
+}
+
+static inline struct swap_cluster_info *swap_lock_cluster(
+		struct swap_info_struct *si,
+		unsigned long offset)
+{
+	struct swap_cluster_info *ci = swp_offset_cluster(si, offset);
+	spin_lock(&ci->lock);
+	return ci;
+}
+
+static inline void swap_unlock_cluster(struct swap_cluster_info *ci)
+{
+	spin_unlock(&ci->lock);
+}
+
 /* linux/mm/page_io.c */
 int sio_pool_init(void);
 struct swap_iocb;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index aa031fd27847..ba3fd99eb5fa 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -58,9 +58,6 @@ static void swap_entries_free(struct swap_info_struct *si,
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
 static bool folio_swapcache_freeable(struct folio *folio);
-static struct swap_cluster_info *lock_cluster(struct swap_info_struct *si,
-					      unsigned long offset);
-static inline void unlock_cluster(struct swap_cluster_info *ci);
 
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
@@ -259,9 +256,9 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	 * swap_map is HAS_CACHE only, which means the slots have no page table
 	 * reference or pending writeback, and can't be allocated to others.
 	 */
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 	need_reclaim = swap_only_has_cache(si, offset, nr_pages);
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	if (!need_reclaim)
 		goto out_unlock;
 
@@ -386,21 +383,6 @@ static void discard_swap_cluster(struct swap_info_struct *si,
 	}
 }
 
-#ifdef CONFIG_THP_SWAP
-#define SWAPFILE_CLUSTER	HPAGE_PMD_NR
-
-#define swap_entry_order(order)	(order)
-#else
-#define SWAPFILE_CLUSTER	256
-
-/*
- * Define swap_entry_order() as constant to let compiler to optimize
- * out some code if !CONFIG_THP_SWAP
- */
-#define swap_entry_order(order)	0
-#endif
-#define LATENCY_LIMIT		256
-
 static inline bool cluster_is_empty(struct swap_cluster_info *info)
 {
 	return info->count == 0;
@@ -426,34 +408,12 @@ static inline unsigned int cluster_index(struct swap_info_struct *si,
 	return ci - si->cluster_info;
 }
 
-static inline struct swap_cluster_info *offset_to_cluster(struct swap_info_struct *si,
-							  unsigned long offset)
-{
-	return &si->cluster_info[offset / SWAPFILE_CLUSTER];
-}
-
 static inline unsigned int cluster_offset(struct swap_info_struct *si,
 					  struct swap_cluster_info *ci)
 {
 	return cluster_index(si, ci) * SWAPFILE_CLUSTER;
 }
 
-static inline struct swap_cluster_info *lock_cluster(struct swap_info_struct *si,
-						     unsigned long offset)
-{
-	struct swap_cluster_info *ci;
-
-	ci = offset_to_cluster(si, offset);
-	spin_lock(&ci->lock);
-
-	return ci;
-}
-
-static inline void unlock_cluster(struct swap_cluster_info *ci)
-{
-	spin_unlock(&ci->lock);
-}
-
 static void move_cluster(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci, struct list_head *list,
 			 enum swap_cluster_flags new_flags)
@@ -809,7 +769,7 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	}
 out:
 	relocate_cluster(si, ci);
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	if (si->flags & SWP_SOLIDSTATE) {
 		this_cpu_write(percpu_swap_cluster.offset[order], next);
 		this_cpu_write(percpu_swap_cluster.si[order], si);
@@ -853,7 +813,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		if (ci->flags == CLUSTER_FLAG_NONE)
 			relocate_cluster(si, ci);
 
-		unlock_cluster(ci);
+		swap_unlock_cluster(ci);
 		if (to_scan <= 0)
 			break;
 	}
@@ -889,10 +849,8 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 		/* Serialize HDD SWAP allocation for each device. */
 		spin_lock(&si->global_cluster_lock);
 		offset = si->global_cluster->next[order];
-		if (offset == SWAP_ENTRY_INVALID)
-			goto new_cluster;
 
-		ci = lock_cluster(si, offset);
+		ci = swap_lock_cluster(si, offset);
 		/* Cluster could have been used by another order */
 		if (cluster_is_usable(ci, order)) {
 			if (cluster_is_empty(ci))
@@ -900,7 +858,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 			found = alloc_swap_scan_cluster(si, ci, offset,
 							order, usage);
 		} else {
-			unlock_cluster(ci);
+			swap_unlock_cluster(ci);
 		}
 		if (found)
 			goto done;
@@ -1178,7 +1136,7 @@ static bool swap_alloc_fast(swp_entry_t *entry,
 	if (!si || !offset || !get_swap_device_info(si))
 		return false;
 
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 	if (cluster_is_usable(ci, order)) {
 		if (cluster_is_empty(ci))
 			offset = cluster_offset(si, ci);
@@ -1186,7 +1144,7 @@ static bool swap_alloc_fast(swp_entry_t *entry,
 		if (found)
 			*entry = swp_entry(si->type, found);
 	} else {
-		unlock_cluster(ci);
+		swap_unlock_cluster(ci);
 	}
 
 	put_swap_device(si);
@@ -1449,14 +1407,14 @@ static void swap_entries_put_cache(struct swap_info_struct *si,
 	unsigned long offset = swp_offset(entry);
 	struct swap_cluster_info *ci;
 
-	ci = lock_cluster(si, offset);
-	if (swap_only_has_cache(si, offset, nr))
+	ci = swap_lock_cluster(si, offset);
+	if (swap_only_has_cache(si, offset, nr)) {
 		swap_entries_free(si, ci, entry, nr);
-	else {
+	} else {
 		for (int i = 0; i < nr; i++, entry.val++)
 			swap_entry_put_locked(si, ci, entry, SWAP_HAS_CACHE);
 	}
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 }
 
 static bool swap_entries_put_map(struct swap_info_struct *si,
@@ -1474,7 +1432,7 @@ static bool swap_entries_put_map(struct swap_info_struct *si,
 	if (count != 1)
 		goto fallback;
 
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 	if (!swap_is_last_map(si, offset, nr, &has_cache)) {
 		goto locked_fallback;
 	}
@@ -1483,21 +1441,20 @@ static bool swap_entries_put_map(struct swap_info_struct *si,
 	else
 		for (i = 0; i < nr; i++)
 			WRITE_ONCE(si->swap_map[offset + i], SWAP_HAS_CACHE);
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 
 	return has_cache;
 
 fallback:
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 locked_fallback:
 	for (i = 0; i < nr; i++, entry.val++) {
 		count = swap_entry_put_locked(si, ci, entry, 1);
 		if (count == SWAP_HAS_CACHE)
 			has_cache = true;
 	}
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	return has_cache;
-
 }
 
 /*
@@ -1545,7 +1502,7 @@ static void swap_entries_free(struct swap_info_struct *si,
 	unsigned char *map_end = map + nr_pages;
 
 	/* It should never free entries across different clusters */
-	VM_BUG_ON(ci != offset_to_cluster(si, offset + nr_pages - 1));
+	VM_BUG_ON(ci != swp_offset_cluster(si, offset + nr_pages - 1));
 	VM_BUG_ON(cluster_is_empty(ci));
 	VM_BUG_ON(ci->count < nr_pages);
 
@@ -1620,9 +1577,9 @@ bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
 	struct swap_cluster_info *ci;
 	int count;
 
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 	count = swap_count(si->swap_map[offset]);
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	return !!count;
 }
 
@@ -1645,7 +1602,7 @@ int swp_swapcount(swp_entry_t entry)
 
 	offset = swp_offset(entry);
 
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 
 	count = swap_count(si->swap_map[offset]);
 	if (!(count & COUNT_CONTINUED))
@@ -1668,7 +1625,7 @@ int swp_swapcount(swp_entry_t entry)
 		n *= (SWAP_CONT_MAX + 1);
 	} while (tmp_count & COUNT_CONTINUED);
 out:
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	return count;
 }
 
@@ -1683,7 +1640,7 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 	int i;
 	bool ret = false;
 
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 	if (nr_pages == 1) {
 		if (swap_count(map[roffset]))
 			ret = true;
@@ -1696,7 +1653,7 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 		}
 	}
 unlock_out:
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	return ret;
 }
 
@@ -2246,6 +2203,7 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
  * Return 0 if there are no inuse entries after prev till end of
  * the map.
  */
+#define LATENCY_LIMIT 256
 static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 					unsigned int prev)
 {
@@ -2629,8 +2587,8 @@ static void wait_for_allocation(struct swap_info_struct *si)
 	BUG_ON(si->flags & SWP_WRITEOK);
 
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
-		ci = lock_cluster(si, offset);
-		unlock_cluster(ci);
+		ci = swap_lock_cluster(si, offset);
+		swap_unlock_cluster(ci);
 	}
 }
 
@@ -3533,7 +3491,7 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 
 	offset = swp_offset(entry);
 	VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 
 	err = 0;
 	for (i = 0; i < nr; i++) {
@@ -3588,7 +3546,7 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 	}
 
 unlock_out:
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	return err;
 }
 
@@ -3688,7 +3646,7 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
 
 	offset = swp_offset(entry);
 
-	ci = lock_cluster(si, offset);
+	ci = swap_lock_cluster(si, offset);
 
 	count = swap_count(si->swap_map[offset]);
 
@@ -3748,7 +3706,7 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
 out_unlock_cont:
 	spin_unlock(&si->cont_lock);
 out:
-	unlock_cluster(ci);
+	swap_unlock_cluster(ci);
 	put_swap_device(si);
 outer:
 	if (page)
-- 
2.49.0

