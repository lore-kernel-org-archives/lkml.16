Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C8020A5F3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005389; cv=none; b=kOYPuleBAEwmgG1Uvw8W/Qkc6KQsYdiP+s0SGd9UXnxhyKN/J0/J70Zj2LxN/VOqIpQjXAg/+mXFOOjzdVp1EEpJBYPwKxoaUw+WXnOdIOtv/zmKdTdvtZIkB0cOBbpMx2VodSK4JLaOu+ldufqRTgoXEB0sZI5B1XzOvLx7nGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005389; c=relaxed/simple;
	bh=Fqet+RpEj0rCT062rkXG4OgvuguU2O3BW4D1tbqMX90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFLcCrJwNdFlBVOntRVQcobs4LC/RjFL4mniILcqDuvh4qIcaO0Z9NKj19vs8wxzcdlEVC5rOvVOKsr3M+NCgWHgUNo7MD6cCWAYlBxEsdYB5E5sdU+bkC5YRTH0ZnnFbUY6ZAnN66yfl4fiB9s37hV/pjONu0MAZa+rWiuRlHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoXZZ7K8; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoXZZ7K8"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2281834b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005388; x=1751610188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nL0w5kzVkX1kWqwcuxi9i82Fs+bCrE4ZYjkCcwdAB2I=;
        b=MoXZZ7K8rdXpYjAqOGTOFTBvbPlAnrHmbZ85S/3833KIxSmfmvPHsxQQ5xoamZKlFQ
         PSiUI+dnUsFc+GW2oTuT2/bK7jYUScvbexWZYDj8UWMiCIBwH/nz++iEPQhO1DFKEOSE
         JseQpVTcwtAKCQeFjNWLiAl8fXSIgsjOYzU6L4NY8+YZGDhX2ZRmUghBkqwnqp9884Mc
         QvsR5VkleILJuaAGozCrTe00x9PMLOL3tq+DkJPcguUKn3Zg1xi8Yq4EmsHdb5CsXUdm
         Q/FEzC31Fj9ZPr0B147c1SlwmoQZtz8Cy8OttOW/w0pJUFVUFskM0AmneamsHGc/L9Vu
         BPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005388; x=1751610188;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nL0w5kzVkX1kWqwcuxi9i82Fs+bCrE4ZYjkCcwdAB2I=;
        b=k9sWJYnaMqgHK6axPZp8kL7yVf40sN/Lnn1dyA7Vx2XLBFG3yoUFsu6iSEMxVfKVPH
         hOTNmxWFdLLswkTwfibrMe4LXT0da7M/+k7tvgzX6vEGKFcNBHWXpqSoyb1eib3K9n81
         kxIA8KzXfWh+j6wBWqdPmRsyxyexkbxO92qPax1K70Fz9D4iizQZpJjSFMt9sKOhp8np
         JBRQqJJeE93EthYPOUBaTNePtPQqxySjvJ/ftZlhrfHfGBN1iWFos1afLugYQcYHXcYm
         br/zeBtaITCq7h6dbUxbtrewghTKUR/x5khCEBandV88VoXCpceEUG8RPBJy9rwKwihP
         zVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCQoNNzdFBKEu8107UfC4j/Ooldz6c6K+DubDrmHz+tdspVEn2VtX/KXdBKSxj/AqbggrI13DP76YLJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zBYM3MUIyjsoHa9Qkfvdzmz5ae9eilIJheDmo7zd+2cXzstr
	rDzkwubxfTbj/hGdYmBsuNunKqF9gAbSU88fpXEuP7YEGjARFu24LmBeR5rfcwmlEJ8=
X-Gm-Gg: ASbGnctpH07yRhKESmo63/86rgCQAgTfTp9K22BIaBvdc+jlyseZF890wbxEq4MMB4m
	fR1gGmQJyTqk4gn0UeRY6ek/0gf4ADtPGCI/FwjkXrQYHeiFF2htN3v0BwPgYLlzNRD6q8eI5W9
	lUykh+SfxDWpbeoQ9AugH1umf8hew0KJcuYpIG8GLA0q7eeHL1FEaMjdvnzhdHOf7FZHvZUAy6P
	jYfK73TEpVv8Yi+V17Ltm4qO6JsRYM+ZlEnrEGi5qN+WOxNUug42TaqNod4MYI49qWd7ZLJoe3C
	X+k1JVReRutiD95LYlMYa7Nr8GPzL+UuQzmcdn9v2uP9vUez5R4cprMQ4ifHm0f66dtXIVLPHAa
	sDyXem60t+GY=
X-Google-Smtp-Source: AGHT+IHB6BJrzXE0fbYKz+3Hy49o+JIqzEHntdXhY43+JBAbIZmgdJw3vrmu91ru2+wBU4vePpDHUA==
X-Received: by 2002:a05:6a00:14cd:b0:748:e38d:fed4 with SMTP id d2e1a72fcca58-74af6ef30e0mr2742498b3a.6.1751005387610;
        Thu, 26 Jun 2025 23:23:07 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.23.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:23:06 -0700 (PDT)
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
Subject: [PATCH v3 7/7] mm/shmem, swap: avoid false positive swap cache lookup
Date: Fri, 27 Jun 2025 14:20:20 +0800
Message-ID: <20250627062020.534-8-ryncsn@gmail.com>
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

If the shmem read request's index points to the middle of a large swap
entry, shmem swap in does the swap cache lookup use the large swap entry's
starting value (the first sub swap entry of this large entry).  This will
lead to false positive lookup result if only the first few swap entries
are cached, but the requested swap entry pointed by index is uncached.

Currently shmem will do a large entry split then retry the swapin from
beginning, which is a waste of CPU and fragile.  Handle this correctly.

Also add some sanity checks to help understand the code and ensure things
won't go wrong.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 60 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index ea9a105ded5d..9341c51c3d10 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1977,14 +1977,19 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 
 static struct folio *shmem_swapin_direct(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
-		swp_entry_t entry, int order, gfp_t gfp)
+		swp_entry_t index_entry, swp_entry_t swap,
+		int order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
-	int nr_pages = 1 << order;
 	struct folio *new;
-	pgoff_t offset;
+	swp_entry_t entry;
 	gfp_t swap_gfp;
 	void *shadow;
+	int nr_pages;
+
+	/* Prefer aligned THP swapin */
+	entry.val = index_entry.val;
+	nr_pages = 1 << order;
 
 	/*
 	 * We have arrived here because our zones are constrained, so don't
@@ -2011,6 +2016,7 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
 			swap_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
 		}
 	}
+
 retry:
 	new = shmem_alloc_folio(swap_gfp, order, info, index);
 	if (!new) {
@@ -2056,11 +2062,10 @@ static struct folio *shmem_swapin_direct(struct inode *inode,
 	if (!order)
 		return new;
 	/* High order swapin failed, fallback to order 0 and retry */
-	order = 0;
-	nr_pages = 1;
+	entry.val = swap.val;
 	swap_gfp = gfp;
-	offset = index - round_down(index, nr_pages);
-	entry = swp_entry(swp_type(entry), swp_offset(entry) + offset);
+	nr_pages = 1;
+	order = 0;
 	goto retry;
 }
 
@@ -2288,20 +2293,21 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
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
@@ -2313,13 +2319,15 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EEXIST;
 	}
 
-	/* Look it up and read it in.. */
+	/* @index may points to the middle of a large entry, get the real swap value first */
+	offset = index - round_down(index, 1 << order);
+	swap.val = index_entry.val + offset;
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			/* Direct mTHP swapin without swap cache or readahead */
 			folio = shmem_swapin_direct(inode, vma, index,
-						    swap, order, gfp);
+						    index_entry, swap, order, gfp);
 			if (IS_ERR(folio)) {
 				error = PTR_ERR(folio);
 				folio = NULL;
@@ -2341,28 +2349,25 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			count_memcg_event_mm(fault_mm, PGMAJFAULT);
 		}
 	}
+
+	swap_order = folio_order(folio);
+	nr_pages = folio_nr_pages(folio);
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
@@ -2375,7 +2380,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		goto failed;
 	}
 	folio_wait_writeback(folio);
-	nr_pages = folio_nr_pages(folio);
 
 	/*
 	 * Some architectures may have to restore extra metadata to the
-- 
2.50.0

