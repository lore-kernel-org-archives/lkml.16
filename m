Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF2277008
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185346; cv=none; b=LlSHJ0HbQYk6c8V1R62qhXqvGIm4Fn911GGeYB6XGJiQrdPnZApDLr659k4jGUFTFW6B5ZrVnJurscgfgM4NwQpDwBjJlHvDNSHhROFLoV4JPTwHD1xNhZJ2u8lX28SIoztIObcaoQ6edSDMAZXUZOM+zCalolYnzguXVmC2BrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185346; c=relaxed/simple;
	bh=OHD/ehd26V8PT/8jsOVnuBdDkf4MMCpUPuPkhl2nfHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwBAE6BtAKZ7z4wM3bsOjR+4H15b39tV8Mgtl6qv/Khvl20131FMRtFGs0tkLh59qzMT0q4I5fmQsL5L26nlr3xKDLa4dGMqojtnNevwL48UurAqVwGwOnwTpBWnVfK4vP/DiTEHvLDOHIFVPhba9hIsrCi78r4oqk0OzqHvN1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwtZ4dmM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwtZ4dmM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313a001d781so5439272a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750185344; x=1750790144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgTulNr4jx8hCL9cMcrSknGVCL7uEZpC1WW1KTxxd18=;
        b=NwtZ4dmMtnpCetv3mJR+inDdRKCGpcAiVKrybRQuPzx1/IFYdvLMfTmWYXR7oRzxXI
         olwZ/Q2cGfMx8WfGrlRWUvgGwQDbkMO0c7I/fhNtSiuUC+fY5aAQ2ApbWwIiTKBphXhJ
         4QukJa2QfV6PdzL+89eEujrfLxCgyl1FyVBc1cp7kD5RH8v++feh/WKiTwRWB8IJTLP0
         +Zwr1YohTwwmdNtVkW4b32IdhbijRXaivAOi4VsjAvROFniVn0B+Ald9l4xRhm1QVuG0
         Xp3IAIIOxck+AwOmRsW6l6aFPPW4NGp50IpIz2iXvqBku5tfe6b/THgEUsEcmGLUbjRA
         /smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750185344; x=1750790144;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgTulNr4jx8hCL9cMcrSknGVCL7uEZpC1WW1KTxxd18=;
        b=LOqJYNJSI37Le9dzDIKUMzcM203iJuMT3wVxNP1xs3l+RV1MdkPmUkoRmJG9co5B21
         Qvfu+4FySqoLRNku1MNKZR+gvniaFK9Sn8d+cj5H1FVpDQJ40AxGCSuYDJPRTZiHz037
         0oLvEKKKo3mmn5HWgCLvPIGiF1eoTuP0pxpRTYflsXdDnN+XSOa06Ac5625nlPLPtpWw
         oWkcuG5awk9bMkAB5rxRbpB7/6Mtseng8dven/SbQU/eIOEoxW2p20IlutqlIDSZsQWl
         WFQomb0nqp4Z/COoC4QHtLK/LYNgjjeavnJYVQIP/tVzPpwmjhMjc4NCG0xZXRS9DlfB
         wj+w==
X-Forwarded-Encrypted: i=1; AJvYcCV7O3lJ8UtJTTnhTqfTN1VamlEkvORBP34h1FbLTIVFkOK+pqEOjwgogDhqvZRd6BadSr7t/ktAdYiYWxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRn+wJAxst1RXjfDKY1p5H0nRcwW7y0Y29MFi1meLcTMdFh81v
	h8Sogqx3hVm4rafUUKVUQLVWhvCy564k9AndpjNnxtyPoH1H7p+Bq2iB
X-Gm-Gg: ASbGnctcw1fvAGV5Np/oEsvsayz5FPL5Q57oomeCZ2KWs2cw7RKozgYtMWqRs85dX9o
	IGwU8JrgXu8JFiZcBRhWPcxJj/djXZvMa0Oe0iaguM3UsieZQli+OH5ZvKgP4v9LC6k1vC+Ml+m
	9K2kNMTTkOZhCB/iCEDguXg10d5AK5aeKZELJMwFM/lnugRPEZm9FLk4zyJG1HOxZsvogab3WS9
	YGdghg0fbkPSQoSU+0t7LuaKwG01+oy+NgxnGKDZIyVlz0Huciu3gVKFBFHP1fZSwkR2XJdUjvi
	abFA2JwNs0hrJijj+PqRIxgqiEjCga8gSe5m33uZdy/7YtL9EEcThKkPUN+OL3rnI4jEL1jzETZ
	QSWMTiMU=
X-Google-Smtp-Source: AGHT+IFpvL4LkuVFY2mtE2Qq5xqwAAinBHrY520uObdv06QZLbd46hL0BA94TNP5rdY3aaT6byR1Ww==
X-Received: by 2002:a17:90b:2688:b0:313:2e69:8002 with SMTP id 98e67ed59e1d1-313f1daa7a9mr22767858a91.20.1750185343766;
        Tue, 17 Jun 2025 11:35:43 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.123.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm83753715ad.128.2025.06.17.11.35.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 11:35:43 -0700 (PDT)
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
Subject: [PATCH 4/4] mm/shmem, swap: avoid false positive swap cache lookup
Date: Wed, 18 Jun 2025 02:35:03 +0800
Message-ID: <20250617183503.10527-5-ryncsn@gmail.com>
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
---
 mm/shmem.c | 61 ++++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 46dea2fa1b43..0bc30dafad90 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1977,12 +1977,12 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 
 static struct folio *shmem_swapin_direct(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
-		swp_entry_t entry, int *order, gfp_t gfp)
+		swp_entry_t swap_entry, swp_entry_t swap,
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
+		    non_swapcache_batch(swap_entry, nr_pages) != nr_pages) {
 			*order = 0;
 			nr_pages = 1;
 		} else {
+			swap.val = swap_entry.val;
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
+	swp_entry_t swap, swap_entry;
 	struct swap_info_struct *si;
 	struct folio *folio = NULL;
 	bool skip_swapcache = false;
-	swp_entry_t swap;
+	pgoff_t offset;
 
 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
-	swap = radix_to_swp_entry(*foliop);
+	swap_entry = radix_to_swp_entry(*foliop);
 	*foliop = NULL;
 
-	if (is_poisoned_swp_entry(swap))
+	if (is_poisoned_swp_entry(swap_entry))
 		return -EIO;
 
-	si = get_swap_device(swap);
-	order = shmem_swap_check_entry(mapping, index, swap);
+	si = get_swap_device(swap_entry);
+	order = shmem_swap_check_entry(mapping, index, swap_entry);
 	if (unlikely(!si)) {
 		if (order < 0)
 			return -EEXIST;
@@ -2303,7 +2302,9 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EEXIST;
 	}
 
-	/* Look it up and read it in.. */
+	/* @index may points to the middle of a large entry, get the real swap value first */
+	offset = index - round_down(index, 1 << order);
+	swap.val = swap_entry.val + offset;
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
 		/* Or update major stats only when swapin succeeds?? */
@@ -2315,7 +2316,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		/* Try direct mTHP swapin bypassing swap cache and readahead */
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			swap_order = order;
-			folio = shmem_swapin_direct(inode, vma, index,
+			folio = shmem_swapin_direct(inode, vma, index, swap_entry,
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
+	VM_WARN_ON_ONCE(swap.val > swap_entry.val + offset);
+	VM_WARN_ON_ONCE(swap.val + nr_pages <= swap_entry.val + offset);
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
+		error = shmem_split_swap_entry(inode, index, swap_entry, gfp);
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

