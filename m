Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA90E2980CE
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253970; cv=none; b=VKN/jMrObikhUmxc/yuBA/0WLPopsWKSlrf6CZWvtby2muYRo66jkMKF6xan74qN8i3MtjpmQwVlmrqT59+i/Gokkh78kG9zHuBoGb45F0YgidyqDvCDerinuyj3B3E59H7clMMjMKxY7+aS0CN6MCIj/7MlCQtxGeKJLxVYS3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253970; c=relaxed/simple;
	bh=xcGlWmiM/ToFOrzyu0L44H02o/3XkAqe2gA9k+hiuOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPCAC0sVe19P7ZxFoJANOIRGF5o2k/7auEBDNny4Xp7i0nzf+rpP1PROGLHb/o9ELl3Z+gGH0bhDhn7xUk7ZuNSIkC2rm7EMNH+kT11/BGGIRV1WL4ZtBCu8y/grf1pOujaT9PtP2PGzQqhuy9PUqG2NfQMg8YPYtNEk8rEkeCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAL68L9Y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAL68L9Y"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b061a06f127so70305a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253968; x=1747858768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SAUgAKhRtBA+T6vbn3SCUdXrNKCIX35HSqyOu0l+ing=;
        b=NAL68L9YaC+N8fwh0YYD6W5BesGZzHzXEN9RL3LthqZ6Q0p2eAFbPOMJ3fkQNpaWxj
         6QBgRMVdJksx5mFWcMBV1y7fOzvIOxYqncOCjZ+FEs8fTqvO55k9EbMPCnJX9pE2ng1h
         +HtCLpdjr3d5fiuY3q3pRYdP7AGExpLikSjmPIsrMk9TN6KJpOHUcccLM56aeqYPd0Sb
         CLynplYku8V9QWnVkijLAmBdBEcQOCvqAXs/N7aD8AehInywbopWUme65MqBigiATDEJ
         Y3nwupKvBXitzEgJm41NDReuX6sOMYxJ6vazomfZoR8GU8ag5Q9v2XYek6cDIOI4UKj7
         N4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253968; x=1747858768;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAUgAKhRtBA+T6vbn3SCUdXrNKCIX35HSqyOu0l+ing=;
        b=r7q9k4c+zcoru87r/HTOatPzKyvvG3f87a0uislgLUWyGCS61dMkKeWtL6lP8iO0lH
         fNRS9yhqnBnzdiMD4uzsN7WzmM1sTmCga4lQfb7KN+Rt0qkaVbmuYFVUYnuRcHIu9kMF
         3oloH+aLDpVYFHPk8f2Ntw5DX4qwWkFAgrdS5xCQ7KmZMUOeuf6qXYdpQvZ5tQI+flIh
         Z/t5jZ6BzI6lZGSpppaQABCbMZqKJM7h7H/5ZrWJfdlzSWcsVHycv/fLjczkLLll8fQy
         UF148dEpT3F/2vsuhXuh3Z3lHq7nv0btETTcyB1uS3KQyXydTpbn8fGFmbyY33tln++U
         jflA==
X-Forwarded-Encrypted: i=1; AJvYcCV1lhn79Z3wCNnHbTWyyl8Fi0GYmzDlapIA2zZiBOoApK0Lk1D2HvpK3AOqGMLwwK1d5hmBqscCKA1QgAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCz9xuPKxGiOhiZcs5bkreGEtd9m0E8Lk4D7n+rA8wOzmIZps
	jTtwUZPJv/YkIBy5Hqo5kiHz+d1Vu8+iHC/ieRAE+l/t0EgFJANS
X-Gm-Gg: ASbGncsvxbDvwHyDs9PqbsfR4MjmeoYy+x+EOzqcn7kF2jxmEbUA5sQOybs7V2Js1F8
	VsN1WuWDhDUMsjlAtbgCMwC1JNqvJYx9dr4Zlc0VdaIkbdnv/DfXJjiX/eUVrZX/CDvyczdYbaN
	rHvx2L6+M35jxCT1uq94rEm7Wa9+zlN1bFsjfCZe5dYZtmJNCol+CXUevNsBQqcGmg5Ul13NLSI
	prlo88bZsxCr4qgF2g/xakkGtI3/6JSaLjBLa8sUDcFwg2LcgCQv0yi3mgQF1PYUnitxY70JQBU
	KsXJQfOq611w8xylPEjMv718NksUYbgwdbl3faiQ4PYtkW0mV7Tj6zuUXh/UStKpaVtNHSsy
X-Google-Smtp-Source: AGHT+IEtQBiYOo/yRXuzGXXOkEu6LpuMIZhrEF4/ummoZk9ecubjYBuIrdy9u6QyT1pLoiZEuAUNXw==
X-Received: by 2002:a17:902:e810:b0:224:10a2:cae1 with SMTP id d9443c01a7336-23198145208mr59404535ad.37.1747253967808;
        Wed, 14 May 2025 13:19:27 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:27 -0700 (PDT)
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
Subject: [PATCH 21/28] mm, swap: add folio to swap cache directly on allocation
Date: Thu, 15 May 2025 04:17:21 +0800
Message-ID: <20250514201729.48420-22-ryncsn@gmail.com>
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

All swap allocations are folio based now (except for hibernation),
and swap cache is protected by cluster lock too. So insert the folio
directly in to the swap cache upon allocation while holding the cluster
to avoid problems caused by dropping and re-acquiring the lock.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap.h       |   8 ++--
 mm/swap_state.c |  48 +++++++++++++++----
 mm/swapfile.c   | 122 ++++++++++++++++++++----------------------------
 3 files changed, 93 insertions(+), 85 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index 2ae4624a0e48..b042609e6eb2 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -185,7 +185,10 @@ static inline struct address_space *swap_address_space(swp_entry_t entry)
 /* Below helpers requires the caller to pin the swap device. */
 extern struct folio *swap_cache_get_folio(swp_entry_t entry);
 extern struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
-					  void **shadow, bool swapin);
+					  void **shadow);
+extern void __swap_cache_add_folio(swp_entry_t entry,
+				   struct swap_cluster_info *ci,
+				   struct folio *folio);
 extern bool swap_cache_check_folio(swp_entry_t entry);
 extern void *swap_cache_get_shadow(swp_entry_t entry);
 /* Below helpers requires the caller to lock the swap cluster. */
@@ -368,8 +371,7 @@ static inline struct folio *swap_cache_get_folio(swp_entry_t entry)
 	return NULL;
 }
 
-static inline int swap_cache_add_folio(swp_entry_t end, struct folio *folio,
-				       void **shadow, bool swapin)
+static inline int swap_cache_add_folio(swp_entry_t end, struct folio *folio, void **shadow)
 {
 	return -EINVAL;
 }
diff --git a/mm/swap_state.c b/mm/swap_state.c
index ea6a1741db5c..9e7d40215958 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -110,12 +110,39 @@ int __swap_cache_replace_folio(struct swap_cluster_info *ci, swp_entry_t entry,
 	return 0;
 }
 
-/*
- * Return the folio being added on success, or return the existing folio
- * with conflicting index on failure.
- */
+/* For swap allocator's initial allocation of entries to a folio */
+void __swap_cache_add_folio(swp_entry_t entry, struct swap_cluster_info *ci,
+			    struct folio *folio)
+{
+	pgoff_t offset = swp_offset(entry), end;
+	unsigned long nr_pages = folio_nr_pages(folio);
+
+	/*
+	 * Allocator should always allocate aligned entries so folio based
+	 * operations never crossed more than one cluster.
+	 */
+	VM_WARN_ON_ONCE_FOLIO(!IS_ALIGNED(offset, nr_pages), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(folio_test_swapcache(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_uptodate(folio), folio);
+
+	end = offset + nr_pages;
+	do {
+		WARN_ON_ONCE(!swp_te_is_null(__swap_table_get(ci, offset)));
+		__swap_table_set_folio(ci, offset, folio);
+	} while (++offset < end);
+
+	folio_ref_add(folio, nr_pages);
+	folio_set_swapcache(folio);
+	folio->swap = entry;
+
+	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
+	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
+}
+
+/* For swap in or perform IO for an allocated swap entry. */
 struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
-				   void **shadow, bool swapin)
+				   void **shadow)
 {
 	swp_te_t exist;
 	pgoff_t end, start, offset;
@@ -127,9 +154,10 @@ struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 	start = swp_offset(entry);
 	end = start + nr_pages;
 
-	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);
-	VM_BUG_ON_FOLIO(!folio_test_swapbacked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(folio_test_swapcache(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_swapbacked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!IS_ALIGNED(start, nr_pages), folio);
 again:
 	offset = start;
 	existing = NULL;
@@ -141,7 +169,7 @@ struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 			existing = swp_te_folio(exist);
 			goto out_failed;
 		}
-		if (swapin && __swap_cache_set_entry(si, ci, offset))
+		if (__swap_cache_set_entry(si, ci, offset))
 			goto out_failed;
 		if (shadow && swp_te_is_shadow(exist))
 			*shadow = swp_te_shadow(exist);
@@ -381,7 +409,7 @@ static struct folio *__swapin_cache_add_prepare(swp_entry_t entry,
 
 	__folio_set_locked(folio);
 	__folio_set_swapbacked(folio);
-	swapcache = swap_cache_add_folio(entry, folio, &shadow, true);
+	swapcache = swap_cache_add_folio(entry, folio, &shadow);
 	if (swapcache != folio) {
 		folio_unlock(folio);
 		return swapcache;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0f2a499ff2c9..91025ba98653 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -709,18 +709,17 @@ static bool cluster_scan_range(struct swap_info_struct *si,
 	return true;
 }
 
-static bool cluster_alloc_range(struct swap_info_struct *si, struct swap_cluster_info *ci,
-				unsigned int start, unsigned char usage,
-				unsigned int order)
+static bool cluster_alloc_range(struct swap_info_struct *si,
+				struct swap_cluster_info *ci,
+				struct folio *folio,
+				unsigned int offset)
 {
-	unsigned int nr_pages = 1 << order;
-	unsigned long offset, end = start + nr_pages;
-
-	lockdep_assert_held(&ci->lock);
+	unsigned int order = folio ? folio_order(folio) : 0;
+	swp_entry_t entry = swp_entry(si->type, offset);
+	unsigned long nr_pages = 1 << order;
 
 	if (!(si->flags & SWP_WRITEOK))
 		return false;
-
 	/*
 	 * The first allocation in a cluster makes the
 	 * cluster exclusive to this order
@@ -728,28 +727,33 @@ static bool cluster_alloc_range(struct swap_info_struct *si, struct swap_cluster
 	if (cluster_is_empty(ci))
 		ci->order = order;
 
-	for (offset = start; offset < end; offset++) {
-		VM_WARN_ON_ONCE(swap_count(si->swap_map[offset]));
-		VM_WARN_ON_ONCE(!swp_te_is_null(__swap_table_get(ci, offset)));
-		si->swap_map[offset] = usage;
-	}
 	swap_range_alloc(si, nr_pages);
 	ci->count += nr_pages;
 
+	if (folio) {
+		/* from folio_alloc_swap */
+		__swap_cache_add_folio(entry, ci, folio);
+		memset(&si->swap_map[offset], SWAP_HAS_CACHE, nr_pages);
+	} else {
+		/* from get_swap_page_of_type */
+		VM_WARN_ON_ONCE(si->swap_map[offset] || swap_cache_check_folio(entry));
+		si->swap_map[offset] = 1;
+	}
+
 	return true;
 }
 
 /* Try use a new cluster for current CPU and allocate from it. */
 static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 					    struct swap_cluster_info *ci,
-					    unsigned long offset,
-					    unsigned int order,
-					    unsigned char usage)
+					    struct folio *folio,
+					    unsigned long offset)
 {
 	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
 	unsigned long end = min(start + SWAPFILE_CLUSTER, si->max);
-	unsigned int nr_pages = 1 << order;
+	unsigned int order = folio ? folio_order(folio) : 0;
+	unsigned long nr_pages = 1 << order;
 	bool need_reclaim, ret;
 
 	lockdep_assert_held(&ci->lock);
@@ -777,7 +781,7 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 			if (!ret)
 				continue;
 		}
-		if (!cluster_alloc_range(si, ci, offset, usage, order))
+		if (!cluster_alloc_range(si, ci, folio, offset))
 			break;
 		found = offset;
 		offset += nr_pages;
@@ -851,10 +855,11 @@ static void swap_reclaim_work(struct work_struct *work)
  * Try to allocate swap entries with specified order and try set a new
  * cluster for current CPU too.
  */
-static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int order,
-					      unsigned char usage)
+static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
+					      struct folio *folio)
 {
 	struct swap_cluster_info *ci;
+	unsigned int order = folio ? folio_order(folio) : 0;
 	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 
 	/*
@@ -874,8 +879,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 		if (cluster_is_usable(ci, order)) {
 			if (cluster_is_empty(ci))
 				offset = cluster_offset(si, ci);
-			found = alloc_swap_scan_cluster(si, ci, offset,
-							order, usage);
+			found = alloc_swap_scan_cluster(si, ci, folio, offset);
 		} else {
 			swap_unlock_cluster(ci);
 		}
@@ -886,8 +890,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 new_cluster:
 	ci = isolate_lock_cluster(si, &si->free_clusters);
 	if (ci) {
-		found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
-						order, usage);
+		found = alloc_swap_scan_cluster(si, ci, folio, cluster_offset(si, ci));
 		if (found)
 			goto done;
 	}
@@ -898,8 +901,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 
 	if (order < PMD_ORDER) {
 		while ((ci = isolate_lock_cluster(si, &si->nonfull_clusters[order]))) {
-			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
-							order, usage);
+			found = alloc_swap_scan_cluster(si, ci, folio, cluster_offset(si, ci));
 			if (found)
 				goto done;
 		}
@@ -912,8 +914,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 		 */
 		ci = isolate_lock_cluster(si, &si->frag_clusters[order]);
 		if (ci) {
-			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
-					order, usage);
+			found = alloc_swap_scan_cluster(si, ci, folio, cluster_offset(si, ci));
 			if (found)
 				goto done;
 		}
@@ -937,15 +938,13 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 		 * allocation, but reclaim may drop si->lock and race with another user.
 		 */
 		while ((ci = isolate_lock_cluster(si, &si->frag_clusters[o]))) {
-			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
-							0, usage);
+			found = alloc_swap_scan_cluster(si, ci, folio, cluster_offset(si, ci));
 			if (found)
 				goto done;
 		}
 
 		while ((ci = isolate_lock_cluster(si, &si->nonfull_clusters[o]))) {
-			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
-							0, usage);
+			found = alloc_swap_scan_cluster(si, ci, folio, cluster_offset(si, ci));
 			if (found)
 				goto done;
 		}
@@ -1138,12 +1137,12 @@ static bool get_swap_device_info(struct swap_info_struct *si)
  * Fast path try to get swap entries with specified order from current
  * CPU's swap entry pool (a cluster).
  */
-static bool swap_alloc_fast(swp_entry_t *entry,
-			    int order)
+static bool swap_alloc_fast(struct folio *folio)
 {
+	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
 	struct swap_info_struct *si;
-	unsigned int offset, found = SWAP_ENTRY_INVALID;
+	unsigned int offset;
 
 	/*
 	 * Once allocated, swap_info_struct will never be completely freed,
@@ -1158,24 +1157,21 @@ static bool swap_alloc_fast(swp_entry_t *entry,
 	if (cluster_is_usable(ci, order)) {
 		if (cluster_is_empty(ci))
 			offset = cluster_offset(si, ci);
-		found = alloc_swap_scan_cluster(si, ci, offset, order, SWAP_HAS_CACHE);
-		if (found)
-			*entry = swp_entry(si->type, found);
+		alloc_swap_scan_cluster(si, ci, folio, offset);
 	} else {
 		swap_unlock_cluster(ci);
 	}
-
 	put_swap_device(si);
-	return !!found;
+	return folio->swap.val != SWAP_ENTRY_INVALID;
 }
 
 /* Rotate the device and switch to a new cluster */
-static bool swap_alloc_slow(swp_entry_t *entry,
-			    int order)
+static void swap_alloc_slow(struct folio *folio)
 {
 	int node;
 	unsigned long offset;
 	struct swap_info_struct *si, *next;
+	unsigned int order = folio_order(folio);
 
 	node = numa_node_id();
 	spin_lock(&swap_avail_lock);
@@ -1185,14 +1181,12 @@ static bool swap_alloc_slow(swp_entry_t *entry,
 		plist_requeue(&si->avail_lists[node], &swap_avail_heads[node]);
 		spin_unlock(&swap_avail_lock);
 		if (get_swap_device_info(si)) {
-			offset = cluster_alloc_swap_entry(si, order, SWAP_HAS_CACHE);
+			offset = cluster_alloc_swap_entry(si, folio);
 			put_swap_device(si);
-			if (offset) {
-				*entry = swp_entry(si->type, offset);
-				return true;
-			}
+			if (offset)
+				return;
 			if (order)
-				return false;
+				return;
 		}
 
 		spin_lock(&swap_avail_lock);
@@ -1211,7 +1205,6 @@ static bool swap_alloc_slow(swp_entry_t *entry,
 			goto start_over;
 	}
 	spin_unlock(&swap_avail_lock);
-	return false;
 }
 
 /*
@@ -1278,10 +1271,6 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 {
 	unsigned int order = folio_order(folio);
 	unsigned int size = 1 << order;
-	swp_entry_t entry = {};
-
-	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
 
 	if (order) {
 		/*
@@ -1302,32 +1291,21 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	}
 
 	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(&entry, order))
-		swap_alloc_slow(&entry, order);
+	if (!swap_alloc_fast(folio))
+		swap_alloc_slow(folio);
 	local_unlock(&percpu_swap_cluster.lock);
 
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
-	if (mem_cgroup_try_charge_swap(folio, entry))
-		goto out_free;
-
-	if (!entry.val)
+	if (mem_cgroup_try_charge_swap(folio, folio->swap)) {
+		folio_free_swap_cache(folio);
 		return -ENOMEM;
+	}
 
-	if (WARN_ON(swap_cache_add_folio(entry, folio, NULL, false) != folio))
-		goto out_free;
-
-	/*
-	 * Allocator should always allocate aligned entries so folio based
-	 * operations never crossed more than one cluster.
-	 */
-	VM_WARN_ON_ONCE_FOLIO(!IS_ALIGNED(folio->swap.val, size), folio);
+	if (!folio->swap.val)
+		return -ENOMEM;
 
 	atomic_long_sub(size, &nr_swap_pages);
 	return 0;
-
-out_free:
-	put_swap_folio(folio, entry);
-	return -ENOMEM;
 }
 
 /*
@@ -1858,7 +1836,7 @@ swp_entry_t get_swap_page_of_type(int type)
 	/* This is called for allocating swap entry, not cache */
 	if (get_swap_device_info(si)) {
 		if (si->flags & SWP_WRITEOK) {
-			offset = cluster_alloc_swap_entry(si, 0, 1);
+			offset = cluster_alloc_swap_entry(si, NULL);
 			if (offset) {
 				entry = swp_entry(si->type, offset);
 				atomic_long_dec(&nr_swap_pages);
-- 
2.49.0

