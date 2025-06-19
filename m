Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDD28D843
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355759; cv=none; b=VgWVB9w35WqDHsdpM3YyXQzQx6AxhuVP2C2cSYXOYSQowhQ403ycQL1hZ/PbfpRt74T2HgSulyXbpcImnNLRfMtGZo7LjdXGS9O1WtCPFZRaLS9kdAXTBe5kw61QTbTJeR7J3/P4g1e0RZIKl0CWNOda5h2M7XHoyBDVfHG0MfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355759; c=relaxed/simple;
	bh=RLC5KqOsMpW2CqeXilUABrHIj3rrk1RbF0EEjm4sXx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYIkd13u0xc7SL559uNa8bK7GzwvbfXnJNdEerZFF8YutIKOe0bEqsUntyM9B47O86Qf4MiiAkGVUzCzdjeDoDicor1fxMFLXeX9xGhIR8qzVL4tSSmnkhUkNEM2nEkJRcgqxM8s8To3y3OU9ocSFvSioS1ogCcms4xScJgGKm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbNfs0ZD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbNfs0ZD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2352400344aso10355715ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750355757; x=1750960557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b0J5rIzwckRCud+/m8yBCOqHh4RXMbBP/Pgn0V8wAaM=;
        b=BbNfs0ZDDzIm8LnFXz81CV7HPgykf09EJ84Ys7SYcJaWWS/NPI9jyIhCsajF9jBZNt
         NsMB+sNXZX19NZYTeDQA8JPq8c0aNkOrKtAHcCGJaduzrVK09+HCRlzWAEBW1NtVZbTB
         izMft+HTJAj9YD+vKn+zGwWys04Jjv76D+K+qF2rpAmQzLY7k+w1uBC3ZhsuEayxT0d1
         hB8bS5ws3Bzxee6N+RQDnDj9RksPo9uLraJi66hoa4OeQXj22AUh+InCDhFofMS36uaF
         qC7Elm5dPWcxLRQwm7diaE0ENxz/mbXFdKN9U7s+XhOa5Iq4hHLOpql+kgsNWC4HBlqx
         XzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355757; x=1750960557;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0J5rIzwckRCud+/m8yBCOqHh4RXMbBP/Pgn0V8wAaM=;
        b=c2kQtHphDg0yAyOrzX4LY0sPztxlm8YzQpNb/nPHPL+/+LnaNW+ZtMXPnKDcnDWoZm
         gj8tpzYe+6F6O23tW+FUcaeBtGzREh+6n+EeYE4/3cFFaaXZp+aPdoZmMUJDHGAhUGUO
         xuKY7Eh9xhZsUbCOXStlmC6xFgNpuTE0ZNfiPrSUckL2IGby2s/n49LMm637l/tQalkq
         9OayNBcGbtt2Qbd7bbd+egt0ZUOasa9PmGB0xiFxP05XorvlJFbGBKLfht9fa76juD09
         wec8a7duXRR4TSZsxWygN7wIUnLRJJHtzvHHgAKsOSK2y/f9DA6LnSGEaT6zRlxXB5yN
         c+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWOJpRkmRWzFlNkl3f1vaTjzIn6tn74HKL1Mfh/utj+J7nuX2cybGVxyMc6lVLm03wWcwU+NODwcvqhxE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+vvhYBWjluzLIEW+luVHmbIW/EI0usL3dN2Q5IV71WBX1QjYG
	vfrAGVBp/ZxveePMwyEsB/yusm8o9/5PBnJQEmsNo4qRLsBDDlHpCBrv
X-Gm-Gg: ASbGncsMo1T9iAOG29tFoAS+VOPIJOj5JGZ6YCwXrtjrVqReyCedhjlMjdge1uKrpSK
	DYLkG2Unc+kzYUo2ORiuKqXoE8USl7PPCJ37KKg7FqlVp0EUg71DVlSSVyH6LMBwcNRjnXXT1IM
	KtXpXnpuN5XHyz0jM9W1FGrwPAymz5a9tvZATE5T6xPKwuPDa/ScfGuugfGI+2VaqpgLnmBQGQo
	Dmpyl6X9ii+PfRZYSY8J/Qzxcj+xw+VDJmos8QUHTyFoDzqETPafEeqiZrp+iLFTLzm7tz7TUTA
	it8B9PaNEpsGel+eMfNCzUOSh2+/twRxXhYNXp/QSVLNPAbg6Qxq9LgamM8+hCyGp4Qw7miv3Sn
	49ydnp8J11S9KtMGwVw==
X-Google-Smtp-Source: AGHT+IFjL5lSBKqSLv1e4AfpQIYPMDh9hgjRu/MF7siVCMwu5I/gaWVJSunXz3+4fKOuSsbg2ckBuQ==
X-Received: by 2002:a17:902:f68e:b0:234:cf24:3be8 with SMTP id d9443c01a7336-2366b12f541mr369757775ad.28.1750355757240;
        Thu, 19 Jun 2025 10:55:57 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83efa44sm255215ad.77.2025.06.19.10.55.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 10:55:56 -0700 (PDT)
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
Subject: [PATCH v2 3/4] mm/shmem, swap: improve mthp swapin process
Date: Fri, 20 Jun 2025 01:55:37 +0800
Message-ID: <20250619175538.15799-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619175538.15799-1-ryncsn@gmail.com>
References: <20250619175538.15799-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Tidy up the mTHP swapin code, reduce duplicated codes and slightly
tweak the workflow.

For SWP_SYNCHRONOUS_IO devices, we should skip the readahead and swap
cache even if the swapin falls back to order 0. Readahead is not helpful
for such devices.

Also consolidates the mTHP related check to one place so they are now
all wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
compiler if not needed.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/shmem.c | 175 ++++++++++++++++++++++++-----------------------------
 1 file changed, 78 insertions(+), 97 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index ce44d1da08cd..721f5aa68572 100644
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

