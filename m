Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BDE21129C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253908; cv=none; b=KOvTaMvJE21kdoGcBeFvf5l8pUuawLDkGf8Pprvq7CybZeYIlsSel9GDvgHWmp1+t0v+dVOZK2UBYKnupW0q5hUqpfOriNNJ18VoGzgkrAo67n4g+ABu4qmz5nSQW75uORYbwJ5VFgSp8G2C7Ln+A7p5twBnvPyo2ic9zbGSW1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253908; c=relaxed/simple;
	bh=A1JLvxFatIA12JX4iLx1+W8dR+gpc+S035OSBRGW/3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B38ta2OM4S2ZD4p+xzQA8sGZXumMeDJWIW0eDThDimYj/nTU6a+PbOZ4RzKLQ4O1teDVVmHJVKEcHfBXn/yoqccvInBU2VM3AvwOAwq9ctrQAquFShCR9n8BHfrArbgeXAJjtNUCqpvOBSopEVan5CDGxJQlRyVStGAMR6w1Td0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmQ7ppRt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmQ7ppRt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30c3a038acfso291606a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253906; x=1747858706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gfjVpkL2RQ/juic9uIOxnoJPTEs/0Bw2uxj1hRxT5ew=;
        b=UmQ7ppRtNwJfgv6IsuWRWPL4pZWdFeekeQdcqtWQMUxp3hW+RRh3lrDVpnfdmZpis9
         5EPbwDkBIZLlHk11414S+Sca/UyZRY+Dgw86QAe3vfPf70YPibZBNH1GOD1bLbOWn/9O
         krTIPkIO8HXxt8hNJzeyEblv2Rm4TwSRtBDahMMjL+j4LWXNokygSqQrt4rWT7jDxIWB
         /raDGlfdPmvbYGenAyHaSZ6OTUEYKPu6d6l57KwPoXri5zGzAb4SbEmvptcJjGukR1z/
         pu/sFncY7xw2QgOeiON1XUZHn/jpLf8LRtekAvrv7Hx61xi3PHJq1+s/pGilwGm0aI1l
         Zhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253906; x=1747858706;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfjVpkL2RQ/juic9uIOxnoJPTEs/0Bw2uxj1hRxT5ew=;
        b=GGuztnr87tGSe8rJaANZy7Gz0vGUb9rqbf5V5XsTAShaHT2dkZR3YEr7sda8vVYoQB
         lx5JTGDkWBgQIMYECxXC3Bo1sDWFScQ3HVeCcHM7VKiZ9DqCck08arsGP1OKH4piGesE
         A4/pP/4TCypWEYSC5KirMi73WF7JNMXqQgegb+Gggd3e9EdE2IRUcuXjSar++Zekvs8L
         a/2ZGFsnW4ZgQHy7Ev3oK/kJksfWNvpv7ZVxWnjrGXOP/MaQK6piVtD9iX44zFyK7fZg
         ePqZQXhPiKEZTf72fyvN3uNJdifSVGG8W8I+tz1/iJi3NhNjmIX9d5e/bpgbLbMyIjGt
         oD6A==
X-Forwarded-Encrypted: i=1; AJvYcCVVcWvOJzglk4qjxAXZ+9vXVpOcrSTJ1CnLcClUA5/Rt5TQufPCB1ICuQlYC4Z0cdl3obgr1BN+FA0zGEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvB2VhdckDFhCbA4ScPlLd2s8RZiDbwVLE70X3Ren7JB/P3YK7
	hRMx13gJSROGeOrqp+tHFy8p1nuYXTlxkthayBqU/A0UjratH8Zw
X-Gm-Gg: ASbGncuMKXZko15Nc/1wDiMa/maIQoRNIz1I6emXCnpJWpB80zMNSGMklu0HndZxIsf
	gfzGtX2kP6JV+KqvAYEWiLxtI0eErwdZyqMRpD6AaCkYXS9RlNc0lfsSJ6ArDpY4uy5LKxb2mOk
	84k/KxEi9B4nkwDjrnL560ZGIiAR7nU5CdF7ctDiLZacTJlOyhgRhnPANL6IyF+QgIHmNaNyyiH
	bvvOxr501MXPl5VJezZs9NnwN2Ov3ZDEfyM07WcYlvQPJMgELwC1+KlNzqsZWi5tC9b0vsVvA2s
	OrqBzy9eEmd2hswZvD8COiLj0EODME5hXYQcTOQppFVOb3I7nROJmXZ4o5VpeFtEMsng8/HA
X-Google-Smtp-Source: AGHT+IGWloP0l9qXTwCJCoEzooAjkbJiIzCiq4e3TVRQawW8kaVvenrNRmghiVZv//rXIgvQm18fjg==
X-Received: by 2002:a17:90b:2d4b:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30e2e583ebamr7419029a91.5.1747253905981;
        Wed, 14 May 2025 13:18:25 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:25 -0700 (PDT)
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
Subject: [PATCH 09/28] mm/swap: rename __read_swap_cache_async to __swapin_cache_alloc
Date: Thu, 15 May 2025 04:17:09 +0800
Message-ID: <20250514201729.48420-10-ryncsn@gmail.com>
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

__read_swap_cache_async is widely used to allocate and ensure a folio is
in swapcache, or get the folio if a folio is already there.

It's not async, and it's not doing any read. Rename it to better
present its usage.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap.h       |  2 +-
 mm/swap_state.c | 20 ++++++++++----------
 mm/swapfile.c   |  2 +-
 mm/zswap.c      |  4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index 30cd257aecbb..fec7d6e751ae 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -210,7 +210,7 @@ void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
 struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct vm_area_struct *vma, unsigned long addr,
 		struct swap_iocb **plug);
-struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_flags,
+struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_flags,
 		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
 		bool skip_if_exists);
 struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
diff --git a/mm/swap_state.c b/mm/swap_state.c
index bef9633533ec..fe71706e29d9 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -353,7 +353,7 @@ void swap_update_readahead(struct folio *folio,
 	}
 }
 
-struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
+struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
 		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
 		bool skip_if_exists)
 {
@@ -403,12 +403,12 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 			goto put_and_return;
 
 		/*
-		 * Protect against a recursive call to __read_swap_cache_async()
+		 * Protect against a recursive call to __swapin_cache_alloc()
 		 * on the same entry waiting forever here because SWAP_HAS_CACHE
 		 * is set but the folio is not the swap cache yet. This can
 		 * happen today if mem_cgroup_swapin_charge_folio() below
 		 * triggers reclaim through zswap, which may call
-		 * __read_swap_cache_async() in the writeback path.
+		 * __swapin_cache_alloc() in the writeback path.
 		 */
 		if (skip_if_exists)
 			goto put_and_return;
@@ -417,7 +417,7 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		 * We might race against __swap_cache_del_folio(), and
 		 * stumble across a swap_map entry whose SWAP_HAS_CACHE
 		 * has not yet been cleared.  Or race against another
-		 * __read_swap_cache_async(), which has set SWAP_HAS_CACHE
+		 * __swapin_cache_alloc(), which has set SWAP_HAS_CACHE
 		 * in swap_map, but not yet added its folio to swap cache.
 		 */
 		schedule_timeout_uninterruptible(1);
@@ -464,7 +464,7 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
  * the swap entry is no longer in use.
  *
  * get/put_swap_device() aren't needed to call this function, because
- * __read_swap_cache_async() call them and swap_read_folio() holds the
+ * __swapin_cache_alloc() call them and swap_read_folio() holds the
  * swap cache folio lock.
  */
 struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
@@ -482,7 +482,7 @@ struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		return NULL;
 
 	mpol = get_vma_policy(vma, addr, 0, &ilx);
-	folio = __read_swap_cache_async(entry, gfp_mask, mpol, ilx,
+	folio = __swapin_cache_alloc(entry, gfp_mask, mpol, ilx,
 					&page_allocated, false);
 	mpol_cond_put(mpol);
 
@@ -600,7 +600,7 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 	blk_start_plug(&plug);
 	for (offset = start_offset; offset <= end_offset ; offset++) {
 		/* Ok, do the async read-ahead now */
-		folio = __read_swap_cache_async(
+		folio = __swapin_cache_alloc(
 				swp_entry(swp_type(entry), offset),
 				gfp_mask, mpol, ilx, &page_allocated, false);
 		if (!folio)
@@ -619,7 +619,7 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 	lru_add_drain();	/* Push any new pages onto the LRU now */
 skip:
 	/* The page was likely read above, so no need for plugging here */
-	folio = __read_swap_cache_async(entry, gfp_mask, mpol, ilx,
+	folio = __swapin_cache_alloc(entry, gfp_mask, mpol, ilx,
 					&page_allocated, false);
 	if (unlikely(page_allocated))
 		swap_read_folio(folio, NULL);
@@ -714,7 +714,7 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
 			continue;
 		pte_unmap(pte);
 		pte = NULL;
-		folio = __read_swap_cache_async(entry, gfp_mask, mpol, ilx,
+		folio = __swapin_cache_alloc(entry, gfp_mask, mpol, ilx,
 						&page_allocated, false);
 		if (!folio)
 			continue;
@@ -734,7 +734,7 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
 	lru_add_drain();
 skip:
 	/* The folio was likely read above, so no need for plugging here */
-	folio = __read_swap_cache_async(targ_entry, gfp_mask, mpol, targ_ilx,
+	folio = __swapin_cache_alloc(targ_entry, gfp_mask, mpol, targ_ilx,
 					&page_allocated, false);
 	if (unlikely(page_allocated))
 		swap_read_folio(folio, NULL);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index aaf7d21eaecb..62af67b6f7c2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1390,7 +1390,7 @@ static unsigned char swap_entry_put_locked(struct swap_info_struct *si,
  *   CPU1				CPU2
  *   do_swap_page()
  *     ...				swapoff+swapon
- *     __read_swap_cache_async()
+ *     __swapin_cache_alloc()
  *       swapcache_prepare()
  *         __swap_duplicate()
  *           // check swap_map
diff --git a/mm/zswap.c b/mm/zswap.c
index af954bda0b02..87aebeee11ef 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1084,8 +1084,8 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 		return -EEXIST;
 
 	mpol = get_task_policy(current);
-	folio = __read_swap_cache_async(swpentry, GFP_KERNEL, mpol,
-			NO_INTERLEAVE_INDEX, &folio_was_allocated, true);
+	folio = __swapin_cache_alloc(swpentry, GFP_KERNEL, mpol,
+				NO_INTERLEAVE_INDEX, &folio_was_allocated, true);
 	put_swap_device(si);
 	if (!folio)
 		return -ENOMEM;
-- 
2.49.0

