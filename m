Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26654202F70
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005378; cv=none; b=EP6h716AdQAA++ST3U73otNqNH2LO1Z9ebYnpjliZOY14XSjNy6lCI2ho/JCfV6xelXFzRXRNcje2zpERyz55XN3LJVeiC9ei7eDFGIt4hjwpVCaKsfIFVU2RTTJK4FQLk2wYte88k7Q4cXOFL2B1Irklml7no1yK7MCikAmmVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005378; c=relaxed/simple;
	bh=9nbIUFmU9Tta0ZnvfqhyYfx+UP28cIN/vEjcQZB46ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pz2CLPv7zT+FjxXTcxopOvVa6apt08DJhd1H11wOLmq4yHOAbq/WrrVc5d7Yj3jZVvDcxQ7JisGCsnw9yL6vUnE1g9z+l9R3SNuTt4fqOyqSHNgiw7QdwGxeGdXP+z7uZdRu8hweN9vDvzsp3S+TmEve6sTqEXKSjEgFeJvyRw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl9xPfge; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl9xPfge"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74931666cbcso1700050b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005376; x=1751610176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=36NUzmy7cI1mrCn85qnONqa0stObJhxRD+bOILE9V6E=;
        b=Nl9xPfgetU/Ea0VBAWgAyG+G4ntOPvM7AzPIefodBjGaTEqrCBLdCnfiJpvLkZRZyt
         aihdLNaQt5jznguGXkBSjOr+xEugwGXDmnDiJJS2fuIdUcdYiyI3eSdL+LFSGpICRjWH
         cU2FNFuXEfkWP97Fu2I6HuB8jvTRcycueTIppZaXwUFH4RrtaQM8pm9dvH8HT2lCARj6
         KKhPE2UsRQfmXdlWzbco64cnmkl/92Qev1GCbvGQfSzgjTsrwIVvBw+9sUWoHp34ex7n
         AO9JhmjpFrNAevs9rmv8kCjdCGYUA54CN5CDFrAyB6c2O7KwQ3xDQy3ZTEYLWbCPuTef
         ievQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005376; x=1751610176;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36NUzmy7cI1mrCn85qnONqa0stObJhxRD+bOILE9V6E=;
        b=UZlAtuWvCrTZknGx5gc+HCdADzlqRqpsmohHqGPvkkHqmJ0Zk8HRThd//EOH/dQXK5
         3cW1MeMwbcIoUQviHwwjo/t+eQRfAQg8zcRejALpMDA9uBi0hNcMWRixlBgMrlLeOr2N
         OnO4ayIpzPogf2Q9tgHNLcq8JfDNNpu+5RD5pteBFCI4pCzJ+/FrZlnWIJod7QLfWa/l
         Jhf5RLYpNTnYFTTSOi6/RI4LZF6/M6QYdZYmLuZX1d1y/RwbdRDmzWTzWV/D+52XLnSi
         OzvrMFddkIPQpRzI8vy9/UEWP+YzYD+0ZQVXbwIDaDaSUmlUts5Upt1P5hcqvd2Rp9sO
         WNSA==
X-Forwarded-Encrypted: i=1; AJvYcCUKdnsS2y8uFC/e1yELwel3Rwc00oPEqghpvaohPTQrpE++ax3cQXpWAa+dWSK36jBeMa8cl/7XQjvmF84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Khqkg23shYpxWZU0eTOLDayVdk7d907WNlIWa8/PGv6AJ3++
	TuWESzLGhAS7nnE8Uoas6Le2QKHU9IcfyS0fXSpWG774As3CX8Bph8tB
X-Gm-Gg: ASbGnctAo2rxaroC6vnqC1YOUOHHbilF5RWN1w0cRWH0GUvxxgVn1Cr1veEro6KDHg9
	gagxpgD+9kCF+hE7sfSGtPcctIyZpP5WxIbdEB4+88ynqIgIjaUxJpE32Z6EarAJJYwBfB+rQYb
	zHtwo9GaaAaHQrW0/B+9xqJBZqAvmGgx/NruFyBkSWascRhSpEEvnN7HaXKXBsl6nGhz+OCPCYD
	mR9vjrH9cFlbLg7niyChoS1dqJYIkIQK4SLCWf7JBT5/Ym6hcugPQcolMhANAQsgAv1Hq8yLB64
	Grmit9TAfmkHHCH/XX6Up6exmSETdIwX3ahofuKRNztAk4TotwV43JqWxcUYXpnxgOuAjRiwLih
	Y
X-Google-Smtp-Source: AGHT+IHGmm3EE0oN1bu4Rse5K8kjBmPx7EfFiguYLGrRvqrW0keBD5PfxxWPsRTGL/+Upm5cemHgNQ==
X-Received: by 2002:a05:6a00:2411:b0:746:26fe:8cdf with SMTP id d2e1a72fcca58-74af6e84939mr2996548b3a.7.1751005376305;
        Thu, 26 Jun 2025 23:22:56 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.22.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:22:55 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 4/7] mm/shmem, swap: clean up swap entry splitting
Date: Fri, 27 Jun 2025 14:20:17 +0800
Message-ID: <20250627062020.534-5-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627062020.534-1-ryncsn@gmail.com>
References: <20250627062020.534-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Instead of keeping different paths of splitting the entry and
recalculating the swap entry and index, do it in one place.

Whenever swapin brought in a folio smaller than the entry, split the
entry. And always recalculate the entry and index, in case it might
read in a folio that's larger than the entry order. This removes
duplicated code and function calls, and makes the code more robust.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 103 +++++++++++++++++++++--------------------------------
 1 file changed, 41 insertions(+), 62 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index f85a985167c5..5be9c905396e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2178,8 +2178,12 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
 	swap_free_nr(swap, nr_pages);
 }
 
-static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
-				   swp_entry_t swap, gfp_t gfp)
+/*
+ * Split an existing large swap entry. @index should point to one sub mapping
+ * slot within the entry @swap, this sub slot will be split into order 0.
+ */
+static int shmem_split_swap_entry(struct inode *inode, pgoff_t index,
+				  swp_entry_t swap, gfp_t gfp)
 {
 	struct address_space *mapping = inode->i_mapping;
 	XA_STATE_ORDER(xas, &mapping->i_pages, index, 0);
@@ -2250,7 +2254,7 @@ static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
 	if (xas_error(&xas))
 		return xas_error(&xas);
 
-	return entry_order;
+	return 0;
 }
 
 /*
@@ -2267,11 +2271,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct address_space *mapping = inode->i_mapping;
 	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	int error, nr_pages, order, swap_order;
 	struct swap_info_struct *si;
 	struct folio *folio = NULL;
 	bool skip_swapcache = false;
 	swp_entry_t swap;
-	int error, nr_pages, order, split_order;
 
 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
 	swap = radix_to_swp_entry(*foliop);
@@ -2321,70 +2325,43 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 				goto failed;
 		}
 
-		/*
-		 * Now swap device can only swap in order 0 folio, then we
-		 * should split the large swap entry stored in the pagecache
-		 * if necessary.
-		 */
-		split_order = shmem_split_large_entry(inode, index, swap, gfp);
-		if (split_order < 0) {
-			error = split_order;
-			goto failed;
-		}
-
-		/*
-		 * If the large swap entry has already been split, it is
-		 * necessary to recalculate the new swap entry based on
-		 * the old order alignment.
-		 */
-		if (split_order > 0) {
-			pgoff_t offset = index - round_down(index, 1 << split_order);
-
-			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
-		}
-
 		/* Here we actually start the io */
 		folio = shmem_swapin_cluster(swap, gfp, info, index);
 		if (!folio) {
 			error = -ENOMEM;
 			goto failed;
 		}
-	} else if (order > folio_order(folio)) {
-		/*
-		 * Swap readahead may swap in order 0 folios into swapcache
-		 * asynchronously, while the shmem mapping can still stores
-		 * large swap entries. In such cases, we should split the
-		 * large swap entry to prevent possible data corruption.
-		 */
-		split_order = shmem_split_large_entry(inode, index, swap, gfp);
-		if (split_order < 0) {
-			folio_put(folio);
-			folio = NULL;
-			error = split_order;
-			goto failed;
-		}
-
-		/*
-		 * If the large swap entry has already been split, it is
-		 * necessary to recalculate the new swap entry based on
-		 * the old order alignment.
-		 */
-		if (split_order > 0) {
-			pgoff_t offset = index - round_down(index, 1 << split_order);
-
-			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
-		}
-	} else if (order < folio_order(folio)) {
-		swap.val = round_down(swap.val, 1 << folio_order(folio));
 	}
 
 alloced:
+	/*
+	 * We need to split an existing large entry if swapin brought in a
+	 * smaller folio due to various of reasons.
+	 *
+	 * And worth noting there is a special case: if there is a smaller
+	 * cached folio that covers @swap, but not @index (it only covers
+	 * first few sub entries of the large entry, but @index points to
+	 * later parts), the swap cache lookup will still see this folio,
+	 * And we need to split the large entry here. Later checks will fail,
+	 * as it can't satisfy the swap requirement, and we will retry
+	 * the swapin from beginning.
+	 */
+	swap_order = folio_order(folio);
+	if (order > swap_order) {
+		error = shmem_split_swap_entry(inode, index, swap, gfp);
+		if (error)
+			goto failed_nolock;
+	}
+
+	index = round_down(index, 1 << swap_order);
+	swap.val = round_down(swap.val, 1 << swap_order);
+
 	/* We have to do this with folio locked to prevent races */
 	folio_lock(folio);
 	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
 	    folio->swap.val != swap.val) {
 		error = -EEXIST;
-		goto unlock;
+		goto failed_unlock;
 	}
 	if (!folio_test_uptodate(folio)) {
 		error = -EIO;
@@ -2405,8 +2382,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			goto failed;
 	}
 
-	error = shmem_add_to_page_cache(folio, mapping,
-					round_down(index, nr_pages),
+	error = shmem_add_to_page_cache(folio, mapping, index,
 					swp_to_radix_entry(swap), gfp);
 	if (error)
 		goto failed;
@@ -2417,8 +2393,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		folio_mark_accessed(folio);
 
 	if (skip_swapcache) {
+		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
 		folio->swap.val = 0;
-		swapcache_clear(si, swap, nr_pages);
 	} else {
 		delete_from_swap_cache(folio);
 	}
@@ -2434,13 +2410,16 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	if (error == -EIO)
 		shmem_set_folio_swapin_error(inode, index, folio, swap,
 					     skip_swapcache);
-unlock:
-	if (skip_swapcache)
-		swapcache_clear(si, swap, folio_nr_pages(folio));
-	if (folio) {
+failed_unlock:
+	if (folio)
 		folio_unlock(folio);
-		folio_put(folio);
+failed_nolock:
+	if (skip_swapcache) {
+		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
+		folio->swap.val = 0;
 	}
+	if (folio)
+		folio_put(folio);
 	put_swap_device(si);
 	return error;
 }
-- 
2.50.0

