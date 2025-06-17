Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E1B2F3DC7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185341; cv=none; b=SVyHX2NVZYEiaBM7n0M52S2i7lMERBFiBkrGb2yXW7ZYd6Po6+1/Rc5ACqlKy+ycyG6x1E/jo9ySv2Y7Macr8rJhGIoo8gYzFf7qZnUshjtqc4n4W+O2TYddDSr9JopovEIcfsEKyNECToufHrDjuiPpAkCfj94DZX1KgoniypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185341; c=relaxed/simple;
	bh=Jjp3Zi4h4hDpzEgLBe2XD8coOE5MVx4J0v1p0F7rJRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJ+LPA7fqBzKFw01a+etlUfGiXc7eJZqJFZuOknkYoHKdbblIW57N/AfDotBLRa1YBY6aJGzOFbdLrQG6aOcifyTEajbiKpvxvyNhe/r+1Tmcm4dGzqsELbOJviMhaWlkmnVmXbh8WeiUv3bC1VKf9K1i8hW8n/WIsLrBoM/Kv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFIUWcHM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFIUWcHM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso6757557a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750185338; x=1750790138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VwmU5QFgBrV4IT7f3BoX3RhTubCWuigzMCMXoFU7oOA=;
        b=AFIUWcHMdwJydA4wsjvWwEnxqnaXQxwxqdGGkHbMJq4qATrHxB6YpvsUCLCoKnrs17
         DY6nHCky4fyuHRJyZwUzA5DrBxGNDi3GZ2jzyxXuKuvAxQqEeuH6ALU37/E3S1GWad6w
         reLKGVdOJCCaYWmaZqu3JauXTXlRQ3x7MU7RjgJVZdnvs3s4l14+vE6HigAy+FApBlSq
         0wRecQJUuYe+ff0v+X6kJ/dbBU4cHQsi9wC7MYCctPElXZ4rc+f6ldzQJB796OWXDaB1
         en54nYHZoZUf+cvS3fcEw1J30w9Am687Qf9RtX2ZZaisaxuOJ2D9N5bj5Jq+cDKTKhG5
         Nv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750185338; x=1750790138;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwmU5QFgBrV4IT7f3BoX3RhTubCWuigzMCMXoFU7oOA=;
        b=mWyyRnk4wNxkVUhq1c9h9KlHv26uL6hjiET64NHHGg/gPm8fqv/1ShZf2lVLXgQ86E
         EQHDkudBCr2flUrThKnQwMW6vjEZQhsyTFLHox1eglVuJvN0GNzHFcgVmdT6Xtbeb1oc
         7lJaKxXbfYOKXMwee9Pu4dCeDoV+YK3SFkapZ+JNZKOsR9hegsja2w2ajLod52BztltL
         PD/LrqjtUo30Uiw4xwhfYNrw4V5Sr/KvzpRb56XjNavKFtLTMR03sbwcSrahU0sFzL0l
         I9PVViWSNTcRUc6hYSBrRx+ClWOofraaEUKqGgTWBVlnZd8U9c5JVeDjDe1nJ7i30hTU
         O0lA==
X-Forwarded-Encrypted: i=1; AJvYcCWA3cWbVfoP3CPh0OaEGJMfSQsL2+4Rz2U+MEZFiDhAuAaW5kN+uClTSuJ7pkv3zL4ZFunrTY+lr48xUwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbM607cijYlugV7F+A1jQCNpnCaV9xBAQOnrBwfUPiJEaYLNM1
	PaPDjJC90YBTAC4kPfKp2S+FHQxLFfSm4Z9ZhPtrPydgCaLcqI46u0pf
X-Gm-Gg: ASbGnctcpDOXy5CL8ypwEv8fIW3QbfUDMbCtvC/KO8Tizc/SbiT+ORk3IrTHXqsvMZn
	x+i07+WVH0trAtIdbtSjwQR0NfsAMmLpMN7di4neSYnJ3ssDi1G2+Lt3GW3RQ50D/Alw8qf6UdO
	rXcBVXXEJUusoY3rL9Fj/uHzgbjbQCrDnfXlTbCibrrLkubCbL9vWPJ3Z1ynuVUFThWirBiBMvL
	7hqm/4OYqQF2+PprPFzeMbYI+9y0GiT96ibW2lXN7rUiBvZ0jz/AyuGxkzv20t9Q0f+8+CXkTd6
	dXN+MKiHmwnIWLlgzEaiHiZoDgDA2/hzCpCsmUkKolVhIioma5Lg7LzXtK/wDDFfJDmeNWDsG4m
	yYNJ8X58=
X-Google-Smtp-Source: AGHT+IG+2p7b+3vUcWPcVCyiKJMHqLk7htZb0HpMOmCbryFbII9jSUjLr5nsIVjixeyzH2l1GmrmdQ==
X-Received: by 2002:a17:90b:1e07:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-313f1e2bfa7mr22198598a91.29.1750185338375;
        Tue, 17 Jun 2025 11:35:38 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.123.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm83753715ad.128.2025.06.17.11.35.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 11:35:37 -0700 (PDT)
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
Subject: [PATCH 3/4] mm/shmem, swap: improve mthp swapin process
Date: Wed, 18 Jun 2025 02:35:02 +0800
Message-ID: <20250617183503.10527-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250617183503.10527-1-ryncsn@gmail.com>
References: <20250617183503.10527-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Tidy up the mTHP swapin workflow. There should be no feature change, but
consolidates the mTHP related check to one place so they are now all
wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
compiler if not needed.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 175 ++++++++++++++++++++++++-----------------------------
 1 file changed, 78 insertions(+), 97 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 0ad49e57f736..46dea2fa1b43 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1975,31 +1975,51 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 	return ERR_PTR(error);
 }
 
-static struct folio *shmem_swap_alloc_folio(struct inode *inode,
+static struct folio *shmem_swapin_direct(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
-		swp_entry_t entry, int order, gfp_t gfp)
+		swp_entry_t entry, int *order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	int nr_pages = 1 << *order;
 	struct folio *new;
+	pgoff_t offset;
 	void *shadow;
-	int nr_pages;
 
 	/*
 	 * We have arrived here because our zones are constrained, so don't
 	 * limit chance of success with further cpuset and node constraints.
 	 */
 	gfp &= ~GFP_CONSTRAINT_MASK;
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && order > 0) {
-		gfp_t huge_gfp = vma_thp_gfp_mask(vma);
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
+		if (WARN_ON_ONCE(*order))
+			return ERR_PTR(-EINVAL);
+	} else if (*order) {
+		/*
+		 * If uffd is active for the vma, we need per-page fault
+		 * fidelity to maintain the uffd semantics, then fallback
+		 * to swapin order-0 folio, as well as for zswap case.
+		 * Any existing sub folio in the swap cache also blocks
+		 * mTHP swapin.
+		 */
+		if ((vma && userfaultfd_armed(vma)) ||
+		    !zswap_never_enabled() ||
+		    non_swapcache_batch(entry, nr_pages) != nr_pages) {
+			offset = index - round_down(index, nr_pages);
+			entry = swp_entry(swp_type(entry),
+					  swp_offset(entry) + offset);
+			*order = 0;
+			nr_pages = 1;
+		} else {
+			gfp_t huge_gfp = vma_thp_gfp_mask(vma);
 
-		gfp = limit_gfp_mask(huge_gfp, gfp);
+			gfp = limit_gfp_mask(huge_gfp, gfp);
+		}
 	}
 
-	new = shmem_alloc_folio(gfp, order, info, index);
+	new = shmem_alloc_folio(gfp, *order, info, index);
 	if (!new)
 		return ERR_PTR(-ENOMEM);
 
-	nr_pages = folio_nr_pages(new);
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
 					   gfp, entry)) {
 		folio_put(new);
@@ -2165,8 +2185,12 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
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
@@ -2226,7 +2250,6 @@ static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
 			cur_order = split_order;
 			split_order = xas_try_split_min_order(split_order);
 		}
-
 unlock:
 		xas_unlock_irq(&xas);
 
@@ -2237,7 +2260,7 @@ static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
 	if (xas_error(&xas))
 		return xas_error(&xas);
 
-	return entry_order;
+	return 0;
 }
 
 /*
@@ -2254,11 +2277,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
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
@@ -2283,110 +2306,66 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
-		int nr_pages = 1 << order;
-		bool fallback_order0 = false;
-
 		/* Or update major stats only when swapin succeeds?? */
 		if (fault_type) {
 			*fault_type |= VM_FAULT_MAJOR;
 			count_vm_event(PGMAJFAULT);
 			count_memcg_event_mm(fault_mm, PGMAJFAULT);
 		}
-
-		/*
-		 * If uffd is active for the vma, we need per-page fault
-		 * fidelity to maintain the uffd semantics, then fallback
-		 * to swapin order-0 folio, as well as for zswap case.
-		 * Any existing sub folio in the swap cache also blocks
-		 * mTHP swapin.
-		 */
-		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
-				  !zswap_never_enabled() ||
-				  non_swapcache_batch(swap, nr_pages) != nr_pages))
-			fallback_order0 = true;
-
-		/* Skip swapcache for synchronous device. */
-		if (!fallback_order0 && data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
-			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
+		/* Try direct mTHP swapin bypassing swap cache and readahead */
+		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
+			swap_order = order;
+			folio = shmem_swapin_direct(inode, vma, index,
+						    swap, &swap_order, gfp);
 			if (!IS_ERR(folio)) {
 				skip_swapcache = true;
 				goto alloced;
 			}
-
-			/*
-			 * Fallback to swapin order-0 folio unless the swap entry
-			 * already exists.
-			 */
+			/* Fallback if order > 0 swapin failed with -ENOMEM */
 			error = PTR_ERR(folio);
 			folio = NULL;
-			if (error == -EEXIST)
+			if (error != -ENOMEM || !swap_order)
 				goto failed;
 		}
-
 		/*
-		 * Now swap device can only swap in order 0 folio, then we
-		 * should split the large swap entry stored in the pagecache
-		 * if necessary.
+		 * Try order 0 swapin using swap cache and readahead, it still
+		 * may return order > 0 folio due to raced swap cache.
 		 */
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
-		/* Here we actually start the io */
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
-		swap.val = round_down(swp_type(swap), folio_order(folio));
 	}
-
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
@@ -2407,8 +2386,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			goto failed;
 	}
 
-	error = shmem_add_to_page_cache(folio, mapping,
-					round_down(index, nr_pages),
+	error = shmem_add_to_page_cache(folio, mapping, index,
 					swp_to_radix_entry(swap), gfp);
 	if (error)
 		goto failed;
@@ -2419,8 +2397,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		folio_mark_accessed(folio);
 
 	if (skip_swapcache) {
+		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
 		folio->swap.val = 0;
-		swapcache_clear(si, swap, nr_pages);
 	} else {
 		delete_from_swap_cache(folio);
 	}
@@ -2436,13 +2414,16 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
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

