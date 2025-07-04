Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA52D8392
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653099; cv=none; b=MsjdPCBwpg7KoN5TgLmJFAp2eDa/jHIzYiYKFDqRWLojpnSht/BtVH652uOEcPcBHrAomDKmBjmYi/tYH94XrEyuul82Rra5RmH3/U2rAZs2upfix9WEm+HUUAIp1x49ivuBmPAilZcxGxAw5PCSvh2npkXAb5QpXy3/3Wxbvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653099; c=relaxed/simple;
	bh=4Yo5ckMvYfWc4FLiy5iUpaApQaM7L/dvKx+H6a911wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OC/r/uf1DCenSQoKnZ0uOxfvlIPE4V7/ipaBr+0wwu3Yzwc1+BlkB4MNUgSywKrCDE/tQE4BQ217K4pOQ1k//bphOcVwfXlOdPcXcVnwhXfQDInWA8Q7rIv0EmZ6ecWRcAC7C7x4RH00gT4qBDOg5Xnxr9zep3YTDD3N5UqaiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnBGK2yP; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnBGK2yP"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d094ef02e5so308065485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653097; x=1752257897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XZoMdOAYvbZ00cTZOCHcf1+vcwk6yO09XTz7UlT/lic=;
        b=XnBGK2yPb192ffxHzhYaBVpG24tvjIA90xuAWCqQH/vDBCicCgOGok1u/o1yviNjos
         rzFqSNzR4lT82qBayaICrW2eOwWhWYaIfaztn2jEZR4q5K3vFKWIvsWVETCl10Aad1uY
         beFKIUhGZwQm1ye2Yuc9gv4MFeB+RLNnet+zkRWRQCRwrglb6q4q4brOLpBccL4L0/F1
         QTaih+CizEYcB6EMfIOkDQQYIImjqeJykZ+4zS/uisXr0SawD2bY3gVjv2/ezq98o8t3
         uTw/vk/wsnydVBTpBtqM91UVUfEz+0fenZiXXGy5ZVo18Qjj8bwmRsExeYOmm/rn4muA
         vq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653097; x=1752257897;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZoMdOAYvbZ00cTZOCHcf1+vcwk6yO09XTz7UlT/lic=;
        b=CLmTDYSEhrQx7WV+OeJOyVhMI1kCSvkZc+D70oQHFbNF/MJxMbcNtHoCOMJZRKwnob
         bMZT+xg28/qdL9WRtgxa4D1+J1mYuT/xwhcOTMio9xqCSKvPXCw08MaPbnsELLgBWmtL
         cfdyXYh9Y4V6u7zJYrcJFgkeI36K2vpn+sVG8LE4ttVYicely22zxYLnp305K3mBS3cq
         pYYp53tz+VeWFFVKIbjsQBYQW/qCQR8ZZQI55Hd3g38suG5PGZE3Issp2636dhn3x5Ue
         x06fDAASCxfxm/iUjw9WIWQkzEk7w14TQ4QjiIHcs6sLfs8k/CCym2wAjoZ/fOqsrFha
         xNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcOZXOXmeo8P29VaKex2n7IwhWtBwDMGsd2g3CYdYxNKahxUfcrpa+EmLF4z+2fCHEpBACjAn0fkKhLEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKYWO3kIbZqxKe48NkKWmtxfC/6sSDamVgHqIER3ZIQ7BIK+QA
	/047ht9dVfnju+vJ9U2Vk54/zom++zFl+F4UkaKdPkJAQyuXuZgxqz3K
X-Gm-Gg: ASbGncso5/XaoyHEff2hKuTGtfSpMrMaoMU1iqihm2ZWQp2OOmlrVbuE88j8tGBgRWc
	Lz/Flxb67k9V7RZIRsFvwSUz2kdXYi/78mSqhCXrNNIVGtn1XgBUQIOdtxJla/ixJp5g8zC17dP
	MlN5rsfRMuNZCG1QxiOkYZS0M7UajVbSEq10huuv7dZoofg3GGdzHLRWnM75bRQhfqJrvKSh7qH
	cyu5V9iQWKMmz9pXWuM5Xh8r5FvXMMIPZcIA8R19MP0yCMIgph44hVlYXOH+QWO3ajVOn1QLNpu
	xMIY1QboQhtkX6mZybXMfd1husse+r6hfJitB66z8QNV5k8U6B0LvxhUto8GXqPBPFw=
X-Google-Smtp-Source: AGHT+IHZ2nb6ar//pNiW7UrB4lVG4pdlvO/xT2T5TEyaxDBNRUFLNVCBYd9MeBTl7yyXqu9f+E/xqw==
X-Received: by 2002:a05:620a:2982:b0:7d4:67f1:df8d with SMTP id af79cd13be357-7d5dcd2e0dcmr605505985a.21.1751653096350;
        Fri, 04 Jul 2025 11:18:16 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:15 -0700 (PDT)
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
Subject: [PATCH v4 4/9] mm/shmem, swap: tidy up swap entry splitting
Date: Sat,  5 Jul 2025 02:17:43 +0800
Message-ID: <20250704181748.63181-5-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704181748.63181-1-ryncsn@gmail.com>
References: <20250704181748.63181-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Instead of keeping different paths of splitting the entry before the
swap in start, move the entry splitting after the swapin has put
the folio in swap cache (or set the SWAP_HAS_CACHE bit). This way
we only need one place and one unified way to split the large entry.
Whenever swapin brought in a folio smaller than the shmem swap entry,
split the entry and recalculate the entry and index for verification.

This removes duplicated codes and function calls, reduces LOC,
and the split is less racy as it's guarded by swap cache now. So it
will have a lower chance of repeated faults due to raced split.
The compiler is also able to optimize the coder further:

bloat-o-meter results with GCC 14:

With DEBUG_SECTION_MISMATCH (-fno-inline-functions-called-once):
./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-82 (-82)
Function                                     old     new   delta
shmem_swapin_folio                          2361    2279     -82
Total: Before=33151, After=33069, chg -0.25%

With !DEBUG_SECTION_MISMATCH:
./scripts/bloat-o-meter mm/shmem.o.old mm/shmem.o
add/remove: 0/1 grow/shrink: 1/0 up/down: 949/-750 (199)
Function                                     old     new   delta
shmem_swapin_folio                          2878    3827    +949
shmem_split_large_entry.isra                 750       -    -750
Total: Before=33086, After=33285, chg +0.60%

Since shmem_split_large_entry is only called in one place now. The
compiler will either generate more compact code, or inlined it for
better performance.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 53 +++++++++++++++++++++--------------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index e43becfa04b3..217264315842 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2266,14 +2266,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct address_space *mapping = inode->i_mapping;
 	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	swp_entry_t swap, index_entry;
 	struct swap_info_struct *si;
 	struct folio *folio = NULL;
 	bool skip_swapcache = false;
-	swp_entry_t swap;
 	int error, nr_pages, order, split_order;
+	pgoff_t offset;
 
 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
-	swap = radix_to_swp_entry(*foliop);
+	swap = index_entry = radix_to_swp_entry(*foliop);
 	*foliop = NULL;
 
 	if (is_poisoned_swp_entry(swap))
@@ -2321,46 +2322,35 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		}
 
 		/*
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
+		 * Now swap device can only swap in order 0 folio, it is
 		 * necessary to recalculate the new swap entry based on
-		 * the old order alignment.
+		 * the offset, as the swapin index might be unalgined.
 		 */
-		if (split_order > 0) {
-			pgoff_t offset = index - round_down(index, 1 << split_order);
-
+		if (order) {
+			offset = index - round_down(index, 1 << order);
 			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
 		}
 
-		/* Here we actually start the io */
 		folio = shmem_swapin_cluster(swap, gfp, info, index);
 		if (!folio) {
 			error = -ENOMEM;
 			goto failed;
 		}
-	} else if (order > folio_order(folio)) {
+	}
+alloced:
+	if (order > folio_order(folio)) {
 		/*
-		 * Swap readahead may swap in order 0 folios into swapcache
+		 * Swapin may get smaller folios due to various reasons:
+		 * It may fallback to order 0 due to memory pressure or race,
+		 * swap readahead may swap in order 0 folios into swapcache
 		 * asynchronously, while the shmem mapping can still stores
 		 * large swap entries. In such cases, we should split the
 		 * large swap entry to prevent possible data corruption.
 		 */
-		split_order = shmem_split_large_entry(inode, index, swap, gfp);
+		split_order = shmem_split_large_entry(inode, index, index_entry, gfp);
 		if (split_order < 0) {
-			folio_put(folio);
-			folio = NULL;
 			error = split_order;
-			goto failed;
+			goto failed_nolock;
 		}
 
 		/*
@@ -2369,15 +2359,13 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		 * the old order alignment.
 		 */
 		if (split_order > 0) {
-			pgoff_t offset = index - round_down(index, 1 << split_order);
-
+			offset = index - round_down(index, 1 << split_order);
 			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
 		}
 	} else if (order < folio_order(folio)) {
 		swap.val = round_down(swap.val, 1 << folio_order(folio));
 	}
 
-alloced:
 	/* We have to do this with folio locked to prevent races */
 	folio_lock(folio);
 	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
@@ -2434,12 +2422,13 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		shmem_set_folio_swapin_error(inode, index, folio, swap,
 					     skip_swapcache);
 unlock:
-	if (skip_swapcache)
-		swapcache_clear(si, swap, folio_nr_pages(folio));
-	if (folio) {
+	if (folio)
 		folio_unlock(folio);
+failed_nolock:
+	if (skip_swapcache)
+		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
+	if (folio)
 		folio_put(folio);
-	}
 	put_swap_device(si);
 	return error;
 }
-- 
2.50.0

