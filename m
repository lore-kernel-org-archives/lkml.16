Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D028E616
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355763; cv=none; b=tesip/2cHHyaP/RKVm8AjgTEMHgnMrgNhGNQgXV6QRCCkXspEc77HZFlSqEY9BPVZ9BD6i8HpaABUKf8BxFcrAb6DBDIifpm6GZH7k5vmv6Ufe9qzrRfSMZJbbGT7rb5aW9YBit2xd4XIH+AXSRn3B7hhIfrILGok6Y7W6XvD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355763; c=relaxed/simple;
	bh=O2EvyAzBJCgLOfpjkyngcKBtBnSduiUNDmv9MQ65KMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bx0nRtvf+2ld6jXihZCI/an7rK5U9E6zodELPdZnfu6menBI99iCScYk88+gEjxvYfoSUzgn74XzIsmVhMRcNWWrbGbH9I/VITtef1zLBZ4JosAWNzXtQQO9n1RxVi0dcCZMt4g1Z4jAHjdMcK+P6rVbF38lvSFSdY0XPCTiIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1/2IhZa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1/2IhZa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234d3261631so7039005ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750355761; x=1750960561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZEwjuK0AylTZIVquFebv6qfh92gO6eHGaxgW/dfiLAE=;
        b=i1/2IhZadsw6xPyT1dTauf/Oyegh+XQMzvV7jZQ4rYwBbaeazzU3gRPZhjM7EPE7a8
         yrPWT3ifFrr8vLzFbwxe+KWj7Tn7cxizeRgRH+HlmbrfURPswK9F5idcSg6r4OF20dL2
         PW3gJP5LL4MOjB+4ZlZ/SOlY6j9+KuWmpPxnOvV4x6lOGr4zgljOmitvGtWHat+bP6lu
         3AWNxN+BaPa3nG4QB4EtNUMl2UsIOecosFvaxwFslCDaxVKGNp0Mor+Y8ti/7nvwNens
         owNLmceJpN+2FgQ0XTbY/8HFUxf2DlYizzWyH8mj+RGkz71wuGD2UWoMy/vPwPSnWNNd
         rLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355761; x=1750960561;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEwjuK0AylTZIVquFebv6qfh92gO6eHGaxgW/dfiLAE=;
        b=c5skDc6dicqJw9pD7KWNRMLRuhiZqJjwHw0x+JzkSx3C8TVUK3QCIy/0XBy1zDXRLG
         /ZZ01XYbIm+90sIakBYxaLbV8P9aqoDHxRFCKMExzgOkefGpQFz0p7BM6BpuHGeqV952
         0EyjMAnBbSNE+vBdyaSYEMHiLodjv0DTbf20v3sU76bcMo8GZ5qzPeElcVbESj01XTMe
         zTNq+Op0yKXgL1zebbzUUkaAVwlP0GuVFKHa4K+YEmhxErxpSdpHEZ5141d0rEKIHjdD
         ezOEPiReq18iq5ZG8aZ+unxkbar1fMIOUWtSRRqnQXcbEZjNqZFNebDoMFnXiKkxo/qd
         OXIg==
X-Forwarded-Encrypted: i=1; AJvYcCXFSs6NAWV0SXDrMpEbwMxvcjzCFbXki/dAWHJeC82dz8JYiUjEzYQKqWjcVQ1GOn1Lz/kjW+z/dhRla4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRgbeiZpMSLkX+3MpeF+A5R6wzwTBZl/TbdzEg+QzZWowGWnZX
	nBOg+lbmxbU8kFEhe/5T4w7rz0CqJADUdxJ9/e44PQcHRS0Afqxf6TzN
X-Gm-Gg: ASbGncu2+RfvTso8+voG/YMsunGuoEh0BjCXczJ9t8hz6l5MYUz69F/+Wmrjl71U+Rp
	HYl7lMxl1zQ5+RHb7bTLoM4bpe6fsYfJGCl4bFnG8Qr8pcFFYCSanNuzd5Kerc2i7MeAcPXXOWv
	3EzArp9Cp9uRHbgsZwpQM7OdVt7HCug3UPFKemoc7Gsj1gz5A4fuQGpi5vagJ0pBWyUtJ47GLnC
	R0Y0wqASqG8MJIzCU6G7EWGzWuYl9jmkpashSjhBBH3iMEGx8OtToBzq9qgyBZUyftmOXvz0MfN
	M4xa9hfEXY9rwpFY9/6OvvHC+OtZQ/1f+jV4sDlSd0kyNTNKR29x+sg2k4+Uv6y+S84mwwsKdly
	lEnQqRqy2ShLdCmnfLw==
X-Google-Smtp-Source: AGHT+IE3cWG2htDcPElbGlnt86OWiMjDrxw9xS9eH9eh+XwRtY+S8BaNpOKQxNLRO9LApOYSIdscwg==
X-Received: by 2002:a17:903:3d8d:b0:22f:c19c:810c with SMTP id d9443c01a7336-2366b19ec24mr235491245ad.51.1750355761011;
        Thu, 19 Jun 2025 10:56:01 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83efa44sm255215ad.77.2025.06.19.10.55.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 10:56:00 -0700 (PDT)
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
Subject: [PATCH v2 4/4] mm/shmem, swap: avoid false positive swap cache lookup
Date: Fri, 20 Jun 2025 01:55:38 +0800
Message-ID: <20250619175538.15799-5-ryncsn@gmail.com>
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

If the shmem read request's index points to the middle of a large swap
entry, shmem swap in does the swap cache lookup use the large swap
entry's starting value (the first sub swap entry of this large entry).
This will lead to false positive lookup result if only the first few
swap entries are cached, but the requested swap entry pointed by index
is uncached.

Currently shmem will do a large entry split then retry the swapin from
beginning, which is a waste of CPU and fragile. Handle this correctly.

Also add some sanity checks to help understand the code and ensure
things won't go wrong.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/shmem.c | 61 ++++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 721f5aa68572..128b92486f2e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1977,12 +1977,12 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 
 static struct folio *shmem_swapin_direct(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
-		swp_entry_t entry, int *order, gfp_t gfp)
+		swp_entry_t index_entry, swp_entry_t swap,
+		int *order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	int nr_pages = 1 << *order;
 	struct folio *new;
-	pgoff_t offset;
 	void *shadow;
 
 	/*
@@ -2003,13 +2003,11 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
 		 */
 		if ((vma && userfaultfd_armed(vma)) ||
 		    !zswap_never_enabled() ||
-		    non_swapcache_batch(entry, nr_pages) != nr_pages) {
-			offset = index - round_down(index, nr_pages);
-			entry = swp_entry(swp_type(entry),
-					  swp_offset(entry) + offset);
+		    non_swapcache_batch(index_entry, nr_pages) != nr_pages) {
 			*order = 0;
 			nr_pages = 1;
 		} else {
+			swap.val = index_entry.val;
 			gfp_t huge_gfp = vma_thp_gfp_mask(vma);
 
 			gfp = limit_gfp_mask(huge_gfp, gfp);
@@ -2021,7 +2019,7 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
 		return ERR_PTR(-ENOMEM);
 
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
-					   gfp, entry)) {
+					   gfp, swap)) {
 		folio_put(new);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -2036,17 +2034,17 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
 	 * In this case, shmem_add_to_page_cache() will help identify the
 	 * concurrent swapin and return -EEXIST.
 	 */
-	if (swapcache_prepare(entry, nr_pages)) {
+	if (swapcache_prepare(swap, nr_pages)) {
 		folio_put(new);
 		return ERR_PTR(-EEXIST);
 	}
 
 	__folio_set_locked(new);
 	__folio_set_swapbacked(new);
-	new->swap = entry;
+	new->swap = swap;
 
-	memcg1_swapin(entry, nr_pages);
-	shadow = get_shadow_from_swap_cache(entry);
+	memcg1_swapin(swap, nr_pages);
+	shadow = get_shadow_from_swap_cache(swap);
 	if (shadow)
 		workingset_refault(new, shadow);
 	folio_add_lru(new);
@@ -2278,20 +2276,21 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	int error, nr_pages, order, swap_order;
+	swp_entry_t swap, index_entry;
 	struct swap_info_struct *si;
 	struct folio *folio = NULL;
 	bool skip_swapcache = false;
-	swp_entry_t swap;
+	pgoff_t offset;
 
 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
-	swap = radix_to_swp_entry(*foliop);
+	index_entry = radix_to_swp_entry(*foliop);
 	*foliop = NULL;
 
-	if (is_poisoned_swp_entry(swap))
+	if (is_poisoned_swp_entry(index_entry))
 		return -EIO;
 
-	si = get_swap_device(swap);
-	order = shmem_confirm_swap(mapping, index, swap);
+	si = get_swap_device(index_entry);
+	order = shmem_confirm_swap(mapping, index, index_entry);
 	if (unlikely(!si)) {
 		if (order < 0)
 			return -EEXIST;
@@ -2303,7 +2302,9 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EEXIST;
 	}
 
-	/* Look it up and read it in.. */
+	/* @index may points to the middle of a large entry, get the real swap value first */
+	offset = index - round_down(index, 1 << order);
+	swap.val = index_entry.val + offset;
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
 		/* Or update major stats only when swapin succeeds?? */
@@ -2315,7 +2316,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		/* Try direct mTHP swapin bypassing swap cache and readahead */
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			swap_order = order;
-			folio = shmem_swapin_direct(inode, vma, index,
+			folio = shmem_swapin_direct(inode, vma, index, index_entry,
 						    swap, &swap_order, gfp);
 			if (!IS_ERR(folio)) {
 				skip_swapcache = true;
@@ -2338,28 +2339,25 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		}
 	}
 alloced:
+	swap_order = folio_order(folio);
+	nr_pages = folio_nr_pages(folio);
+
+	/* The swap-in should cover both @swap and @index */
+	swap.val = round_down(swap.val, nr_pages);
+	VM_WARN_ON_ONCE(swap.val > index_entry.val + offset);
+	VM_WARN_ON_ONCE(swap.val + nr_pages <= index_entry.val + offset);
+
 	/*
 	 * We need to split an existing large entry if swapin brought in a
 	 * smaller folio due to various of reasons.
-	 *
-	 * And worth noting there is a special case: if there is a smaller
-	 * cached folio that covers @swap, but not @index (it only covers
-	 * first few sub entries of the large entry, but @index points to
-	 * later parts), the swap cache lookup will still see this folio,
-	 * And we need to split the large entry here. Later checks will fail,
-	 * as it can't satisfy the swap requirement, and we will retry
-	 * the swapin from beginning.
 	 */
-	swap_order = folio_order(folio);
+	index = round_down(index, nr_pages);
 	if (order > swap_order) {
-		error = shmem_split_swap_entry(inode, index, swap, gfp);
+		error = shmem_split_swap_entry(inode, index, index_entry, gfp);
 		if (error)
 			goto failed_nolock;
 	}
 
-	index = round_down(index, 1 << swap_order);
-	swap.val = round_down(swap.val, 1 << swap_order);
-
 	/* We have to do this with folio locked to prevent races */
 	folio_lock(folio);
 	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
@@ -2372,7 +2370,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		goto failed;
 	}
 	folio_wait_writeback(folio);
-	nr_pages = folio_nr_pages(folio);
 
 	/*
 	 * Some architectures may have to restore extra metadata to the
-- 
2.50.0

