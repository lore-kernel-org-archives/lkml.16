Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0599295517
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253962; cv=none; b=aEOt7FyFSgtQe0HsQLRifx3+FyspOU4qcjqd3R8HKrBuUiDDiq0FOMgRzZ56Jq/ckENkAKW4FuoH7DeIbNCIGtUkPWzCYVNs7HADaBHLP8ig8lnRWUlxtrjoA3doVCNBioUE6bP0+HJv2Lk0IWEqlftvv7Oz7I/rmmeyGvl9i9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253962; c=relaxed/simple;
	bh=WdWt4A0YJrT1Tcalm9W/H9d39FkncU99IND9gUn+XGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Swd7Y2AWUpi2NIPXWjG/zRfCpam3stpxNESrvsP1joexSwZqkYFnH5btwR1msE8PUPmoOsU597nYTZylqiUhQmZ2dP1vESM3d6M2Zz04RrcptQj4jbwXCrtp6IzWtdWOaDp+c6LzOsLpnjVfHK49rS/rpWvJOvHzicXWe02mDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RexuRH2W; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RexuRH2W"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30a8c929220so274153a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253958; x=1747858758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oh+cjst6h3YSQmb37WUTUKQ712nx+NXtd16QdB6aMW4=;
        b=RexuRH2WxAitZ1kU9IZ0c60ZUFNjkG4DVn0G/kxua0Sq5mzEhpYkkVugn0zZE1lIlw
         IhvS8j/LQgViUqhrz/BGJLLn7AXiuY50ihYrRGz3cuamdflQuCHpyWpDOfj0A62OQfnu
         pBb5UnZvT7DQWHwkzzY1bplUNRrxI9xqt4P1wnJaFirUvSoA6Kf/d0WI2vKy6sMFAoEU
         MbqARRmAR9Uhxbz6kIEjjW/jI1fb8dvYPpHKqaldrbxOvr5aAVjvl5v+jwPg6syHSY5G
         8xw5gdM5bk88Rn1SdnSlvkjg8As4Bt0++EVbiVE5809hrzMmQiVHA9FBhoO/zcj25qZ6
         iWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253958; x=1747858758;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oh+cjst6h3YSQmb37WUTUKQ712nx+NXtd16QdB6aMW4=;
        b=oWE12msL3y3XRyg8WAyMra4r000cc+gyBRfZFHpmsAsl8s4SVRx8ElMCM5HdfUNksd
         HM2glJa1g4vwO/1NPoV5A2P4eCqDvJq5v5r50sEfJuvcMwDPy9jZJ38UhPJvZ++700Ct
         m19xM7kngiwEJWtdQgIkICIm2Uuan9VJm6RPO8/6yal6vZYlxdhFM8MszZ4GJESmm7Yh
         4wP2ZsIX0StV/JFS0q16WEEDFDgQGJANj6yj14vKN5I011Imq05Fy5kEnFlOePl1+X95
         D+ZCF1dhtf05sFrlG5abMEZ11dGuGrf8zMrkWniUkP2TqytlMQN/BxsR4m5Nn82emVxq
         ++eg==
X-Forwarded-Encrypted: i=1; AJvYcCUU0RBxN8e6wCZz2cDDvTTlWS66CODVHLMtO9vKnxuHVB1TfAnpG6wUVWCnSO8QHVR/XCo0rc0DtfiogQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySer6Xk9SQzvAncZtKcX/jM21rpQQgGl9JlOWMqkzDyxV7hT/o
	tPW/e7mGlmryic4V68+F4+DkrAq6eKF1oky4BkqanPksKH3329Jo
X-Gm-Gg: ASbGncu5w+NivCz99A1GboQMNh5k84qHIZ+VCtX0T38ZMUk/Nt/uoHyuB1sSzUSA08T
	lSlgN0sD8xmJ0fYkiLqfm7SQ/9R9qFBWeDK4cGtKHIEDZPphgRaAjdYpxuls62lQybmk8mjOfHl
	vKp1szgdFBE15XnVN9zoz2rswmjst96fgsp1Lxy4oEV7cgy/7rqd1a+SNbqTMYTJdLIkB2PcS8D
	0orgDWJ96k1ZAqQIOjPEaBnTQD97Y69jtb+/DEFbl8acr3Dby6nHdp2LJLj00N7ouQU6/rG8Dep
	heZkkf9UnGsBI/H5C/lN4rfXu/Furww64ub378ixqcrlHxAZCOcnYt7ok2Dj8KM4tsULENnYc54
	QI6U5S8Y=
X-Google-Smtp-Source: AGHT+IG8KbXNPdNHSbG8nQm2c4WK5MYgaQbyZetU6IldJXHiONdTsQTcA6uQ/sbpCJkhfw0l0re02g==
X-Received: by 2002:a17:90a:d886:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-30e2e59a1c1mr7975238a91.2.1747253957653;
        Wed, 14 May 2025 13:19:17 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:17 -0700 (PDT)
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
Subject: [PATCH 19/28] mm, swap: clean up and improve swap entries batch freeing
Date: Thu, 15 May 2025 04:17:19 +0800
Message-ID: <20250514201729.48420-20-ryncsn@gmail.com>
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

Introduce a helper to free up all the continuous entries that has only
one last swap entry count left and has no cache.

Compared to the current design, which scans the whole region first, then
frees it only if the whole region is filled with the same count, this
new helper avoids the two-pass scan, and will batch-free more entries
when fragmented, also more robust with sanity checks. And check the swap
table directly for the cache status instead of looking at swap_map here.

Also rename related functions to better present their usage.

This simplifies the code and prepares for follow up commits to clean
up the freeing of swap entries even more.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 165 ++++++++++++++++++++------------------------------
 1 file changed, 67 insertions(+), 98 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0a8b36ecbf08..ef233466725e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -54,14 +54,16 @@
 static bool swap_count_continued(struct swap_info_struct *, pgoff_t,
 				 unsigned char);
 static void free_swap_count_continuations(struct swap_info_struct *);
-static void swap_entries_free(struct swap_info_struct *si,
+static void swap_free_entries(struct swap_info_struct *si,
 			      struct swap_cluster_info *ci,
-			      swp_entry_t entry, unsigned int nr_pages);
+			      unsigned long start, unsigned int nr_pages);
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
 static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr);
-static bool swap_entries_put_map(struct swap_info_struct *si,
-				 swp_entry_t entry, int nr);
+static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
+					   struct swap_cluster_info *ci,
+					   swp_entry_t entry,
+					   unsigned char usage);
 static bool folio_swapcache_freeable(struct folio *folio);
 
 static DEFINE_SPINLOCK(swap_lock);
@@ -193,25 +195,6 @@ static bool swap_only_has_cache(struct swap_info_struct *si,
 	return true;
 }
 
-static bool swap_is_last_map(struct swap_info_struct *si,
-		unsigned long offset, int nr_pages, bool *has_cache)
-{
-	unsigned char *map = si->swap_map + offset;
-	unsigned char *map_end = map + nr_pages;
-	unsigned char count = *map;
-
-	if (swap_count(count) != 1)
-		return false;
-
-	while (++map < map_end) {
-		if (*map != count)
-			return false;
-	}
-
-	*has_cache = !!(count & SWAP_HAS_CACHE);
-	return true;
-}
-
 /*
  * returns number of pages in the folio that backs the swap entry. If positive,
  * the folio was reclaimed. If negative, the folio was not reclaimed. If 0, no
@@ -1237,6 +1220,56 @@ static bool swap_alloc_slow(swp_entry_t *entry,
 	return false;
 }
 
+/*
+ * Put the ref count of entries, caller must ensure the entries'
+ * swap table count are not zero. This won't free up the swap cache.
+ */
+static bool swap_put_entries(struct swap_info_struct *si,
+			     unsigned long start, int nr)
+{
+	unsigned long offset = start, end = start + nr, cluster_end;
+	unsigned long head = SWAP_ENTRY_INVALID;
+	struct swap_cluster_info *ci;
+	bool has_cache = false;
+	unsigned int count;
+	swp_te_t swp_te;
+next_cluster:
+	ci = swap_lock_cluster(si, offset);
+	cluster_end = min(cluster_offset(si, ci) + SWAPFILE_CLUSTER, end);
+	do {
+		swp_te = __swap_table_get(ci, offset);
+		count = si->swap_map[offset];
+		if (WARN_ON_ONCE(!swap_count(count))) {
+			goto skip;
+		} else if (swp_te_is_folio(swp_te)) {
+			VM_WARN_ON_ONCE(!(count & SWAP_HAS_CACHE));
+			/* Let the swap cache (folio) handle the final free */
+			has_cache = true;
+		} else if (count == 1) {
+			/* Free up continues last ref entries in batch */
+			head = head ? head : offset;
+			continue;
+		}
+		swap_put_entry_locked(si, ci, swp_entry(si->type, offset), 1);
+skip:
+		if (head) {
+			swap_free_entries(si, ci, head, offset - head);
+			head = SWAP_ENTRY_INVALID;
+		}
+	} while (++offset < cluster_end);
+
+	if (head) {
+		swap_free_entries(si, ci, head, offset - head);
+		head = SWAP_ENTRY_INVALID;
+	}
+
+	swap_unlock_cluster(ci);
+	if (unlikely(cluster_end < end))
+		goto next_cluster;
+
+	return has_cache;
+}
+
 /**
  * folio_alloc_swap - allocate swap space for a folio
  * @folio: folio we want to move to swap
@@ -1351,7 +1384,7 @@ void folio_put_swap(struct folio *folio, struct page *subpage)
 		nr_pages = 1;
 	}
 
-	swap_entries_put_map(swp_info(entry), entry, nr_pages);
+	swap_put_entries(swp_info(entry), swp_offset(entry), nr_pages);
 }
 
 /*
@@ -1407,7 +1440,7 @@ static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
 	return NULL;
 }
 
-static unsigned char swap_entry_put_locked(struct swap_info_struct *si,
+static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
 					   struct swap_cluster_info *ci,
 					   swp_entry_t entry,
 					   unsigned char usage)
@@ -1438,7 +1471,7 @@ static unsigned char swap_entry_put_locked(struct swap_info_struct *si,
 	if (usage)
 		WRITE_ONCE(si->swap_map[offset], usage);
 	else
-		swap_entries_free(si, ci, entry, 1);
+		swap_free_entries(si, ci, offset, 1);
 
 	return usage;
 }
@@ -1509,70 +1542,6 @@ struct swap_info_struct *get_swap_device(swp_entry_t entry)
 	return NULL;
 }
 
-static bool swap_entries_put_map(struct swap_info_struct *si,
-				 swp_entry_t entry, int nr)
-{
-	unsigned long offset = swp_offset(entry);
-	struct swap_cluster_info *ci;
-	bool has_cache = false;
-	unsigned char count;
-	int i;
-
-	if (nr <= 1)
-		goto fallback;
-	count = swap_count(data_race(si->swap_map[offset]));
-	if (count != 1)
-		goto fallback;
-
-	ci = swap_lock_cluster(si, offset);
-	if (!swap_is_last_map(si, offset, nr, &has_cache)) {
-		goto locked_fallback;
-	}
-	if (!has_cache)
-		swap_entries_free(si, ci, entry, nr);
-	else
-		for (i = 0; i < nr; i++)
-			WRITE_ONCE(si->swap_map[offset + i], SWAP_HAS_CACHE);
-	swap_unlock_cluster(ci);
-
-	return has_cache;
-
-fallback:
-	ci = swap_lock_cluster(si, offset);
-locked_fallback:
-	for (i = 0; i < nr; i++, entry.val++) {
-		count = swap_entry_put_locked(si, ci, entry, 1);
-		if (count == SWAP_HAS_CACHE)
-			has_cache = true;
-	}
-	swap_unlock_cluster(ci);
-	return has_cache;
-}
-
-/*
- * Only functions with "_nr" suffix are able to free entries spanning
- * cross multi clusters, so ensure the range is within a single cluster
- * when freeing entries with functions without "_nr" suffix.
- */
-static bool swap_entries_put_map_nr(struct swap_info_struct *si,
-				    swp_entry_t entry, int nr)
-{
-	int cluster_nr, cluster_rest;
-	unsigned long offset = swp_offset(entry);
-	bool has_cache = false;
-
-	cluster_rest = SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER;
-	while (nr) {
-		cluster_nr = min(nr, cluster_rest);
-		has_cache |= swap_entries_put_map(si, entry, cluster_nr);
-		cluster_rest = SWAPFILE_CLUSTER;
-		nr -= cluster_nr;
-		entry.val += cluster_nr;
-	}
-
-	return has_cache;
-}
-
 /*
  * Check if it's the last ref of swap entry in the freeing path.
  */
@@ -1585,11 +1554,11 @@ static inline bool __maybe_unused swap_is_last_ref(unsigned char count)
  * Drop the last ref of swap entries, caller have to ensure all entries
  * belong to the same cgroup and cluster.
  */
-static void swap_entries_free(struct swap_info_struct *si,
+static void swap_free_entries(struct swap_info_struct *si,
 			      struct swap_cluster_info *ci,
-			      swp_entry_t entry, unsigned int nr_pages)
+			      unsigned long offset, unsigned int nr_pages)
 {
-	unsigned long offset = swp_offset(entry);
+	swp_entry_t entry = swp_entry(si->type, offset);
 	unsigned char *map = si->swap_map + offset;
 	unsigned char *map_end = map + nr_pages;
 
@@ -1622,10 +1591,10 @@ void __swap_cache_put_entries(struct swap_info_struct *si,
 			      swp_entry_t entry, unsigned int size)
 {
 	if (swap_only_has_cache(si, swp_offset(entry), size))
-		swap_entries_free(si, ci, entry, size);
+		swap_free_entries(si, ci, swp_offset(entry), size);
 	else
 		for (int i = 0; i < size; i++, entry.val++)
-			swap_entry_put_locked(si, ci, entry, SWAP_HAS_CACHE);
+			swap_put_entry_locked(si, ci, entry, SWAP_HAS_CACHE);
 }
 
 /*
@@ -1843,7 +1812,7 @@ void do_put_swap_entries(swp_entry_t entry, int nr)
 	/*
 	 * First free all entries in the range.
 	 */
-	any_only_cache = swap_entries_put_map_nr(si, entry, nr);
+	any_only_cache = swap_put_entries(swp_info(entry), swp_offset(entry), nr);
 
 	/*
 	 * Short-circuit the below loop if none of the entries had their
@@ -1917,7 +1886,7 @@ void free_swap_page_of_entry(swp_entry_t entry)
 	if (!si)
 		return;
 	ci = swap_lock_cluster(si, offset);
-	WARN_ON(swap_count(swap_entry_put_locked(si, ci, entry, 1)));
+	WARN_ON(swap_count(swap_put_entry_locked(si, ci, entry, 1)));
 	/* It might got added to swap cache accidentally by read ahead */
 	__try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
 	swap_unlock_cluster(ci);
@@ -3805,7 +3774,7 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
  * into, carry if so, or else fail until a new continuation page is allocated;
  * when the original swap_map count is decremented from 0 with continuation,
  * borrow from the continuation and report whether it still holds more.
- * Called while __swap_duplicate() or caller of swap_entry_put_locked()
+ * Called while __swap_duplicate() or caller of swap_put_entry_locked()
  * holds cluster lock.
  */
 static bool swap_count_continued(struct swap_info_struct *si,
-- 
2.49.0

