Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D50296D06
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253965; cv=none; b=mDya4cTdQKw1hzF9k6OFMYoWLviqq//mq9wLjA0pInGhZZvk8gGigft+HRhnuytLG+Csbi64/b/HNwxCIp7wquHFk7TqMvscXdGKPJRYQ9LBqwcx9N3+zF2S9kDh9eYMBuUkl2sYAAI1WUWomrloKml/evXFF5UMs2tuSA5Mu/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253965; c=relaxed/simple;
	bh=bXfWTRJJD6sNkGUG7ZolZt4t9x/cTB4/pJ7ZPYzc6zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVXWkeTiJPLr6jJM64stT4xlPD+oytpAwjONYDKl49FtAFn0/T2mHfTzoEN04KurpvNmnnOiOo+howhNNtwJD8QzMRWeGHSq2RdtMHjaDkgIaPPPAGeNSXBX3E06ApPq/wncGcnIO8YJ/rWfNqKU8d8PX6nHgti7IqDNdXkkcxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhY2zBUg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhY2zBUg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22fb7659866so2621935ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253963; x=1747858763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U6/LBzNJhK4HceOviaxc72HOh4cg2x2/Kq6Ym/AXTkQ=;
        b=PhY2zBUgFy6KjUXEP6CBkHCw+QWH5byaDhDyQ7uS1JbfbCZzWUwVCFFAytRX4DRERt
         lsrRmmgqJqVkkIdJh9oHa1qYQzBOZO0CVq4qDUrH89YCuKBce+cNQjg4yFyOegKL3q2w
         Txj9evI7/HTbWDdVydgo3GW/0v0vcgub6JI7gRF8ar9CfCF+J89SU2Q+opJrbakVW50w
         0kWwo5LH7myh+qug4eypBjhi2FnzjHNyOimXxIOFoyBbfy/izoy+5YfcJ727Wx+yNcCd
         LYcSrO0DG0dzWy7JgA3mLxLTsFS9xyblRFQ3a28xloc7ex1XewaFVpNGnmQqGyVlRvtr
         XJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253963; x=1747858763;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6/LBzNJhK4HceOviaxc72HOh4cg2x2/Kq6Ym/AXTkQ=;
        b=lSE52WcgSwpOJqv1nKuC4HXSOrsvc9XkSTQsUWX5NkNfZpx1XPNlJUpaUwwBJRKHP+
         eG6ySsKvCuUACFFkAEy/CtAUjOsO9323fntu5LI4CpeAMZyA5kht85dpMQcOrCD7ZSmS
         SqmHO7SCRx1YjdMWViEiKBvXE6T1f9k6WWBCz9QqmLAkZ9YYN7XD1omAPOD0cPdumwXN
         E/t7O7bLJ6y5oXizgaKHUyUI51eEjNca0VW8zp9hjt8jp1SQ3MNV9ElPPdnPTmpDqIhm
         Nq7gU7ppA8lR5HUrUvFSsydcixTb17Wcy4ctmBmvN0IxMh0ZefN2M+rVlWe+copAUZyk
         zkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8T6XtiXI8In1SxgNWJttjKjohbHyyJmpDbNpexUEGPavsbkwnKYShIXMyTZEBn3pSAZnMzV1xOsXZ8sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8V6uFHmq2kz9MBU7XudHUb32HQBHT4XcbcvpEmz0y3B/WpWAn
	U5PnuqohFVJXyacbxhjnGzCTOEFPfNIjOpPrr7qr1htKIeYTSflR
X-Gm-Gg: ASbGncvMf5suJC27BbL/F3QqQDWIqwwI7bX1C6QTucF0w335asLlT7O4Am2AM4tNpvt
	x9wEzmNoprqK9GaSZTInPN3mNDsOhC/pI+ADkkFkfeuxwMjNIekk4dEDiNPPbDX5Z2jMMjTmo5l
	E6BTlkhLwX/fiYD42nF0qogQYcbGXQ5Br9PeGVtctqnluOnADksJzB67RJqybv1YRq7RC0sReLr
	DaH2qzwzoHlLy0GXAhPNWFDqlGF17OJpqD7u5v7FtrNrg2H4jyCCe445UGNM4NitV5ryPCkaIsT
	EnIWVbSV1brDuvCYbh74tjj1qYOCejvs4MFonAOxI37BT0SYEsSHcrL+r2z4H59I8Fvbz8l/
X-Google-Smtp-Source: AGHT+IHvGAMCZkZwK4H8isk1bhKb1bdu4eze+K7mEWhoe7zQ+58m30m6pR2U/7/k/fiq4uVPb9rS6A==
X-Received: by 2002:a17:902:ce84:b0:22e:5d9b:2ec3 with SMTP id d9443c01a7336-2319815cb5fmr62870755ad.30.1747253962748;
        Wed, 14 May 2025 13:19:22 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:22 -0700 (PDT)
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
Subject: [PATCH 20/28] mm, swap: check swap table directly for checking cache
Date: Thu, 15 May 2025 04:17:20 +0800
Message-ID: <20250514201729.48420-21-ryncsn@gmail.com>
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

Instead of looking at the swap map, check swap table directly to tell if
a swap entry has cache. Prepare for remove SWAP_HAS_CACHE.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory.c     | 12 +++++------
 mm/swap.h       |  6 ++++++
 mm/swap_state.c | 11 ++++++++++
 mm/swapfile.c   | 54 +++++++++++++++++++++++--------------------------
 4 files changed, 48 insertions(+), 35 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index a70624a55aa2..a9a548575e72 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4314,15 +4314,15 @@ static struct folio *__alloc_swap_folio(struct vm_fault *vmf)
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
+static inline int non_swapcache_batch(swp_entry_t entry, unsigned int max_nr)
 {
-	struct swap_info_struct *si = swp_info(entry);
-	pgoff_t offset = swp_offset(entry);
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < max_nr; i++) {
-		if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
-			return i;
+		/* Page table lock pins the swap entries / swap device */
+		if (swap_cache_check_folio(entry))
+			break;
+		entry.val++;
 	}
 
 	return i;
diff --git a/mm/swap.h b/mm/swap.h
index 467996dafbae..2ae4624a0e48 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -186,6 +186,7 @@ static inline struct address_space *swap_address_space(swp_entry_t entry)
 extern struct folio *swap_cache_get_folio(swp_entry_t entry);
 extern struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 					  void **shadow, bool swapin);
+extern bool swap_cache_check_folio(swp_entry_t entry);
 extern void *swap_cache_get_shadow(swp_entry_t entry);
 /* Below helpers requires the caller to lock the swap cluster. */
 extern void __swap_cache_del_folio(swp_entry_t entry,
@@ -395,6 +396,11 @@ static inline void *swap_cache_get_shadow(swp_entry_t end)
 	return NULL;
 }
 
+static inline bool swap_cache_check_folio(swp_entry_t entry)
+{
+	return false;
+}
+
 static inline unsigned int folio_swap_flags(struct folio *folio)
 {
 	return 0;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index c8bb16835612..ea6a1741db5c 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -266,6 +266,17 @@ struct folio *swap_cache_get_folio(swp_entry_t entry)
 	return folio;
 }
 
+/*
+ * Check if a swap entry has folio cached, may return false positive.
+ * Caller must hold a reference of the swap device or pin it in other ways.
+ */
+bool swap_cache_check_folio(swp_entry_t entry)
+{
+	swp_te_t swp_te;
+	swp_te = __swap_table_get(swp_cluster(entry), swp_offset(entry));
+	return swp_te_is_folio(swp_te);
+}
+
 /*
  * If we are the only user, then try to free up the swap cache.
  *
diff --git a/mm/swapfile.c b/mm/swapfile.c
index ef233466725e..0f2a499ff2c9 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -181,15 +181,19 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
 #define TTRS_FULL		0x4
 
 static bool swap_only_has_cache(struct swap_info_struct *si,
-			      unsigned long offset, int nr_pages)
+				struct swap_cluster_info *ci,
+				unsigned long offset, int nr_pages)
 {
 	unsigned char *map = si->swap_map + offset;
 	unsigned char *map_end = map + nr_pages;
+	swp_te_t entry;
 
 	do {
+		entry = __swap_table_get(ci, offset);
 		VM_BUG_ON(!(*map & SWAP_HAS_CACHE));
-		if (*map != SWAP_HAS_CACHE)
+		if (*map)
 			return false;
+		offset++;
 	} while (++map < map_end);
 
 	return true;
@@ -247,11 +251,11 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 
 	/*
 	 * It's safe to delete the folio from swap cache only if the folio's
-	 * swap_map is HAS_CACHE only, which means the slots have no page table
+	 * entry is swap cache only, which means the slots have no page table
 	 * reference or pending writeback, and can't be allocated to others.
 	 */
 	ci = swap_lock_cluster(si, offset);
-	need_reclaim = swap_only_has_cache(si, offset, nr_pages);
+	need_reclaim = swap_only_has_cache(si, ci, offset, nr_pages);
 	swap_unlock_cluster(ci);
 	if (!need_reclaim)
 		goto out_unlock;
@@ -660,29 +664,21 @@ static bool cluster_reclaim_range(struct swap_info_struct *si,
 
 	spin_unlock(&ci->lock);
 	do {
-		switch (READ_ONCE(map[offset])) {
-		case 0:
-			offset++;
+		if (swap_count(READ_ONCE(map[offset])))
 			break;
-		case SWAP_HAS_CACHE:
-			nr_reclaim = __try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
-			if (nr_reclaim > 0)
-				offset += nr_reclaim;
-			else
-				goto out;
+		nr_reclaim = __try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
+		if (nr_reclaim > 0)
+			offset += nr_reclaim;
+		else if (nr_reclaim < 1)
 			break;
-		default:
-			goto out;
-		}
-	} while (offset < end);
-out:
+	} while (++offset < end);
 	spin_lock(&ci->lock);
 	/*
 	 * Recheck the range no matter reclaim succeeded or not, the slot
 	 * could have been be freed while we are not holding the lock.
 	 */
 	for (offset = start; offset < end; offset++)
-		if (READ_ONCE(map[offset]))
+		if (map[offset] || !swp_te_is_null(__swap_table_get(ci, offset)))
 			return false;
 
 	return true;
@@ -700,16 +696,13 @@ static bool cluster_scan_range(struct swap_info_struct *si,
 		return true;
 
 	for (offset = start; offset < end; offset++) {
-		switch (READ_ONCE(map[offset])) {
-		case 0:
-			continue;
-		case SWAP_HAS_CACHE:
+		if (swap_count(map[offset]))
+			return false;
+		if (swp_te_is_folio(__swap_table_get(ci, offset))) {
+			VM_WARN_ON_ONCE(!(map[offset] & SWAP_HAS_CACHE));
 			if (!vm_swap_full())
 				return false;
 			*need_reclaim = true;
-			continue;
-		default:
-			return false;
 		}
 	}
 
@@ -821,7 +814,8 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		to_scan--;
 
 		while (offset < end) {
-			if (READ_ONCE(map[offset]) == SWAP_HAS_CACHE) {
+			if (!swap_count(map[offset]) &&
+			    swp_te_is_folio(__swap_table_get(ci, offset))) {
 				spin_unlock(&ci->lock);
 				nr_reclaim = __try_to_reclaim_swap(si, offset,
 								   TTRS_ANYWAY);
@@ -1590,7 +1584,7 @@ void __swap_cache_put_entries(struct swap_info_struct *si,
 			      struct swap_cluster_info *ci,
 			      swp_entry_t entry, unsigned int size)
 {
-	if (swap_only_has_cache(si, swp_offset(entry), size))
+	if (swap_only_has_cache(si, ci, swp_offset(entry), size))
 		swap_free_entries(si, ci, swp_offset(entry), size);
 	else
 		for (int i = 0; i < size; i++, entry.val++)
@@ -1802,6 +1796,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	struct swap_info_struct *si;
 	bool any_only_cache = false;
 	unsigned long offset;
+	swp_te_t swp_te;
 
 	si = get_swap_device(entry);
 	if (WARN_ON_ONCE(!si))
@@ -1826,7 +1821,8 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	 */
 	for (offset = start_offset; offset < end_offset; offset += nr) {
 		nr = 1;
-		if (READ_ONCE(si->swap_map[offset]) == SWAP_HAS_CACHE) {
+		swp_te = __swap_table_get(swp_offset_cluster(si, offset), offset);
+		if (!swap_count(si->swap_map[offset]) && swp_te_is_folio(swp_te)) {
 			/*
 			 * Folios are always naturally aligned in swap so
 			 * advance forward to the next boundary. Zero means no
-- 
2.49.0

