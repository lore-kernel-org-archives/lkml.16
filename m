Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB563297A74
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253944; cv=none; b=Wk3W95wqmUB+vWq43JSOxV07f1wQCPYjx+xU5F+mUXMrDCMXd/cykPrUImORXbImipWmcA52A2hjXHv+YvOC0OxiWejRLXRPNV6R19Yqo9J5VuwEJCnB18N/Zk4S6DRS+a/HlW0d2i0DfSxqdXGZZUoVGQuhd622mbkT7Zl7fXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253944; c=relaxed/simple;
	bh=AtQE+Q6ABnCGGr59PioZRG7vYLok0GYIJhAzFdK/CAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGoZzGWFLcbM5rjJfzXIp5/FwvOn5knGvN4DwgNdqWEFnvYFV/uKlAlndTOkgNXve369PEbhqo3C/kpms8vRnrlLGriBQhDSXlpOC+zACzCuS5eOFNYo6Ja7o/Iifwigpo4x3/Hua3Nz5EbPVrLbHwFv2P7mKoY6dJaJ/K/wVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GprDpqRH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GprDpqRH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-309fac646adso1360583a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253942; x=1747858742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yPxKspeyIbXcqPmZsr7yPlIZZh8yX3NikoOT3EDPjRU=;
        b=GprDpqRHIe9AWs1b0r06n5T9ks+PeunXvE6B4mBNVPYHIbLUMrBeF9WKtaqvI4kYia
         h9EHoEL18OSD5FtXgwVaNmCamYtPNCkfYHu7XFW1RntsdTQ0DY/00ry9+1WpdwVbqFcY
         eLZyZdG+j+DjQx7oBG1Rps2XP1BXMktrYOZrqj1FjUgOv3qOrmpPrNsjQU4qMLZT5dXT
         Vm/1A5HjCNRdaFyH8jkpn6vzhJj2drLtT3kl//bebn3XcjhZBYZ13IUO2bbn1YsxC9G5
         ZAR60xLtBsDZ2KJRjWCgVrqKtidbudadMS9xLBbo0zNrpPSqaZDOvtaODFNakFwgP3my
         DlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253942; x=1747858742;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPxKspeyIbXcqPmZsr7yPlIZZh8yX3NikoOT3EDPjRU=;
        b=S/fif8AG3FWSKSyhM+zdqKqevXX0qNmT5Wm3MwGd1r46LLL2R/4RnfzeXKd8GQ/aWe
         JA4JmKKRROe38rzPBg19oFdIsLn+6XVHW2pTG8yvECCz2BakhM+EQJr7zT5ZhZOaAsXX
         aNV2M5Oaom4Opjt/WqJ+sVdE5PJInTRjSkuepmLZ2H13uoOvVgMLwHpitGbN62fn/t+F
         H9sWbs09v4Uunt9ZS2cspXO1Ns5fDcrU/cz9GNehHgFpEMEdj94EIMrqYYHOtMC9fiJZ
         Kr2mxy3QaZ6+PCRrHQKeRaYQgWPdZKZfyHUr/ilDX41USgp63qPc04xkNAFKvgKyRcr8
         CeSA==
X-Forwarded-Encrypted: i=1; AJvYcCXU+rNig2amcCO/T/3CPfXOh4XGOAdKErUFo1Zyy5sLsuRutDQ1MIKRoJ5sEr1t2zFCn/t91aHDdF4snFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfw7aGHjMXCzN+iFRxh9ik4gbtzh3MQivNdNnCo9XIbfq0q1iA
	5h+JJehyGRzyuTT/bmuocIqlHLVJWNNgg2OS67ril085AxBnvUWs
X-Gm-Gg: ASbGncsnSMxOIr3J18vt7Ob101AOiny0SLuzIblya7BWCgVBC+b8TqJWlJ7BfUE5qVc
	2j9GNF1VzIOlwB4fl+fpVk5u4CJIdlAkhe5RzqO4VpnlrjG1giL2LEpD41tdkU9YkI02MuHMRMV
	D2Ejm07SSS1GGR3IrMonkXMZT7ojknF5gfszWDlgPMkK4axxlVcQnmoLSiwpVCueG82QMqaIdhu
	7xOC/gO/XMjYMICmCFUa+Np85jpruiUY0+79OWFoOEokDnNHiaeJPwz0pOlVHg4kHKybvB/z84P
	0e8ygS8SKoPVQBKl2QZ4ZX8r4ixFdwH3JC6ly7Wh18hHq0vxIdOBxZvgpKn2dyaI0ei7hSoM
X-Google-Smtp-Source: AGHT+IGlsS7EiQuD1lqvAI4nUedLTUECfXjcLteppFWk5c8t0jtnSFPhkcC+A+nouEQXDHMbs+AluA==
X-Received: by 2002:a17:90b:3d88:b0:306:b593:455e with SMTP id 98e67ed59e1d1-30e4dacf5e3mr1459149a91.1.1747253942200;
        Wed, 14 May 2025 13:19:02 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:01 -0700 (PDT)
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
Subject: [PATCH 16/28] mm, swap: use swap cache as the swap in synchronize layer
Date: Thu, 15 May 2025 04:17:16 +0800
Message-ID: <20250514201729.48420-17-ryncsn@gmail.com>
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

Current swap synchronization is mostly based on the swap_map's
SWAP_HAS_CACHE bit. Whoever sets the bit first does the actual work to
swap in a folio.

This has been causing many issues as it's just a poor implementation
of a bit lock based on a busy loop. The busy loop is relaxed with a
schedule_timeout_uninterruptible(1), which is ugly and causes more
long tailing or other performance issues. Beside, the abuse of
SWAP_HAS_CACHE has been causing trouble for maintenance.

We have just removed all swap in paths bypassing the swap cache,
so now we can just resolve the swap synchronization with the swap cache
layer directly (similar to page cache). Whoever adds a folio into the
swap cache first takes care of the real IO. Raced threads will see the
newly inserted folio from others, they can simply wait on the folio lock.

This way, the race swap in is synchronized with a proper lock.
This both simplifies the logic and should improve the performance, and
eliminated issues like the workaround in commit 01626a1823024
("mm: avoid unconditional one-tick sleep when swapcache_prepare fails"),
or the "skip_if_exists" from commit a65b0e7607ccb ("zswap: make shrinking
memcg-aware").

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |   6 ---
 mm/swap.h            |  17 ++++--
 mm/swap_state.c      | 120 +++++++++++++++++--------------------------
 mm/swapfile.c        |  32 ++++++------
 mm/vmscan.c          |   1 -
 mm/zswap.c           |   2 +-
 6 files changed, 76 insertions(+), 102 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 58230f3e15e6..2da769cdc663 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -443,7 +443,6 @@ void put_swap_folio(struct folio *folio, swp_entry_t entry);
 extern swp_entry_t get_swap_page_of_type(int);
 extern int add_swap_count_continuation(swp_entry_t, gfp_t);
 extern int swap_duplicate_nr(swp_entry_t entry, int nr);
-extern int swapcache_prepare(swp_entry_t entry, int nr);
 extern void swap_free_nr(swp_entry_t entry, int nr_pages);
 extern void free_swap_and_cache_nr(swp_entry_t entry, int nr);
 int swap_type_of(dev_t device, sector_t offset);
@@ -502,11 +501,6 @@ static inline int swap_duplicate_nr(swp_entry_t swp, int nr_pages)
 	return 0;
 }
 
-static inline int swapcache_prepare(swp_entry_t swp, int nr)
-{
-	return 0;
-}
-
 static inline void swap_free_nr(swp_entry_t entry, int nr_pages)
 {
 }
diff --git a/mm/swap.h b/mm/swap.h
index cad24a3abda8..2abfb40fc7ec 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -135,6 +135,13 @@ static inline void swap_unlock_cluster_irq(struct swap_cluster_info *ci)
 	spin_unlock_irq(&ci->lock);
 }
 
+extern int __swap_cache_set_entry(struct swap_info_struct *si,
+				  struct swap_cluster_info *ci,
+				  unsigned long offset);
+extern void __swap_cache_put_entries(struct swap_info_struct *si,
+				     struct swap_cluster_info *ci,
+				     swp_entry_t entry, unsigned int size);
+
 /* linux/mm/page_io.c */
 int sio_pool_init(void);
 struct swap_iocb;
@@ -158,8 +165,8 @@ static inline struct address_space *swap_address_space(swp_entry_t entry)
 
 /* Below helpers requires the caller to pin the swap device. */
 extern struct folio *swap_cache_get_folio(swp_entry_t entry);
-extern int swap_cache_add_folio(swp_entry_t entry,
-				struct folio *folio, void **shadow);
+extern struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
+					  void **shadow, bool swapin);
 extern void *swap_cache_get_shadow(swp_entry_t entry);
 /* Below helpers requires the caller to lock the swap cluster. */
 extern void __swap_cache_del_folio(swp_entry_t entry,
@@ -211,8 +218,7 @@ struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct vm_area_struct *vma, unsigned long addr,
 		struct swap_iocb **plug);
 struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_flags,
-		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
-		bool skip_if_exists);
+		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated);
 struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
 		struct mempolicy *mpol, pgoff_t ilx);
 struct folio *swapin_readahead(swp_entry_t entry, gfp_t flag,
@@ -324,7 +330,8 @@ static inline struct folio *swap_cache_get_folio(swp_entry_t entry)
 	return NULL;
 }
 
-static inline int swap_cache_add_folio(swp_entry_t end, struct folio *folio, void **shadow)
+static inline int swap_cache_add_folio(swp_entry_t end, struct folio *folio,
+				       void **shadow, bool swapin)
 {
 	return -EINVAL;
 }
diff --git a/mm/swap_state.c b/mm/swap_state.c
index d68687295f52..715aff5aca57 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -110,12 +110,18 @@ int __swap_cache_replace_folio(struct swap_cluster_info *ci, swp_entry_t entry,
 	return 0;
 }
 
-int swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
-			 void **shadow)
+/*
+ * Return the folio being added on success, or return the existing folio
+ * with conflicting index on failure.
+ */
+struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
+				   void **shadow, bool swapin)
 {
 	swp_te_t exist;
 	pgoff_t end, start, offset;
+	struct swap_info_struct *si;
 	struct swap_cluster_info *ci;
+	struct folio *existing = NULL;
 	unsigned long nr_pages = folio_nr_pages(folio);
 
 	start = swp_offset(entry);
@@ -124,12 +130,18 @@ int swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_swapbacked(folio), folio);
-
+again:
 	offset = start;
-	ci = swap_lock_cluster(swp_info(entry), offset);
+	existing = NULL;
+	si = swp_info(entry);
+	ci = swap_lock_cluster(si, offset);
 	do {
 		exist = __swap_table_get(ci, offset);
-		if (unlikely(swp_te_is_folio(exist)))
+		if (unlikely(swp_te_is_folio(exist))) {
+			existing = swp_te_folio(exist);
+			goto out_failed;
+		}
+		if (swapin && __swap_cache_set_entry(si, ci, offset))
 			goto out_failed;
 		if (shadow && swp_te_is_shadow(exist))
 			*shadow = swp_te_shadow(exist);
@@ -144,18 +156,27 @@ int swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
 	node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
 	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
 
-	return 0;
+	return folio;
 
 out_failed:
 	/*
-	 * We may lose shadow due to raced swapin, which should be
-	 * fine, caller better keep the previous returned shadow.
+	 * We may lose shadow here due to raced swapin, which is rare and OK,
+	 * caller better keep the previous returned shadow.
 	 */
-	while (offset-- > start)
+	while (offset-- > start) {
 		__swap_table_set_shadow(ci, offset, NULL);
+		__swap_cache_put_entries(si, ci, swp_entry(si->type, offset), 1);
+	}
 	swap_unlock_cluster(ci);
 
-	return -EEXIST;
+	/*
+	 * Need to grab the conflicting folio before return. If it's
+	 * already gone, just try insert again.
+	 */
+	if (existing && !folio_try_get(existing))
+		goto again;
+
+	return existing;
 }
 
 /*
@@ -192,6 +213,7 @@ void __swap_cache_del_folio(swp_entry_t entry,
 	folio_clear_swapcache(folio);
 	node_stat_mod_folio(folio, NR_FILE_PAGES, -nr_pages);
 	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr_pages);
+	__swap_cache_put_entries(si, ci, entry, nr_pages);
 }
 
 void delete_from_swap_cache(struct folio *folio)
@@ -203,7 +225,6 @@ void delete_from_swap_cache(struct folio *folio)
 	__swap_cache_del_folio(entry, folio, NULL);
 	swap_unlock_cluster(ci);
 
-	put_swap_folio(folio, entry);
 	folio_ref_sub(folio, folio_nr_pages(folio));
 }
 
@@ -354,59 +375,18 @@ void swap_update_readahead(struct folio *folio,
 }
 
 static struct folio *__swapin_cache_add_prepare(swp_entry_t entry,
-						struct folio *folio,
-						bool skip_if_exists)
+						struct folio *folio)
 {
-	int nr_pages = folio_nr_pages(folio);
-	struct folio *exist;
 	void *shadow = NULL;
-	int err;
+	struct folio *swapcache = NULL;
 
-	for (;;) {
-		/*
-		 * Caller should have checked swap cache and swap count
-		 * already, try prepare the swap map directly, it will still
-		 * fail with -ENOENT or -EEXIST if the entry is gone or raced.
-		 */
-		err = swapcache_prepare(entry, nr_pages);
-		if (!err)
-			break;
-		else if (err != -EEXIST)
-			return NULL;
-
-		/*
-		 * Protect against a recursive call to __swapin_cache_alloc()
-		 * on the same entry waiting forever here because SWAP_HAS_CACHE
-		 * is set but the folio is not the swap cache yet. This can
-		 * happen today if mem_cgroup_swapin_charge_folio() below
-		 * triggers reclaim through zswap, which may call
-		 * __swapin_cache_alloc() in the writeback path.
-		 */
-		if (skip_if_exists)
-			return NULL;
-
-		exist = swap_cache_get_folio(entry);
-		if (exist)
-			return exist;
-
-		/*
-		 * We might race against __swap_cache_del_folio(), and
-		 * stumble across a swap_map entry whose SWAP_HAS_CACHE
-		 * has not yet been cleared.  Or race against another
-		 * __swapin_cache_alloc(), which has set SWAP_HAS_CACHE
-		 * in swap_map, but not yet added its folio to swap cache.
-		 */
-		schedule_timeout_uninterruptible(1);
-	}
-
-	/*
-	 * The swap entry is ours to swap in. Prepare the new folio.
-	 */
 	__folio_set_locked(folio);
 	__folio_set_swapbacked(folio);
-
-	if (swap_cache_add_folio(entry, folio, &shadow))
-		goto fail_unlock;
+	swapcache = swap_cache_add_folio(entry, folio, &shadow, true);
+	if (swapcache != folio) {
+		folio_unlock(folio);
+		return swapcache;
+	}
 
 	memcg1_swapin(entry, 1);
 
@@ -416,16 +396,10 @@ static struct folio *__swapin_cache_add_prepare(swp_entry_t entry,
 	/* Caller will initiate read into locked new_folio */
 	folio_add_lru(folio);
 	return folio;
-
-fail_unlock:
-	put_swap_folio(folio, entry);
-	folio_unlock(folio);
-	return NULL;
 }
 
 struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
-		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
-		bool skip_if_exists)
+		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated)
 {
 	struct swap_info_struct *si = swp_info(entry);
 	struct folio *swapcache = NULL, *folio = NULL;
@@ -457,7 +431,7 @@ struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
 	if (mem_cgroup_swapin_charge_folio(folio, NULL, gfp_mask, entry))
 		goto out;
 
-	swapcache = __swapin_cache_add_prepare(entry, folio, skip_if_exists);
+	swapcache = __swapin_cache_add_prepare(entry, folio);
 out:
 	if (swapcache && swapcache == folio) {
 		*new_page_allocated = true;
@@ -491,7 +465,7 @@ struct folio *swapin_entry(swp_entry_t entry, struct folio *folio)
 	VM_WARN_ON_ONCE(nr_pages > SWAPFILE_CLUSTER);
 
 	entry = swp_entry(swp_type(entry), ALIGN_DOWN(offset, nr_pages));
-	swapcache = __swapin_cache_add_prepare(entry, folio, false);
+	swapcache = __swapin_cache_add_prepare(entry, folio);
 	if (swapcache == folio)
 		swap_read_folio(folio, NULL);
 	return swapcache;
@@ -523,7 +497,7 @@ struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 
 	mpol = get_vma_policy(vma, addr, 0, &ilx);
 	folio = __swapin_cache_alloc(entry, gfp_mask, mpol, ilx,
-					&page_allocated, false);
+				     &page_allocated);
 	mpol_cond_put(mpol);
 
 	if (page_allocated)
@@ -642,7 +616,7 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 		/* Ok, do the async read-ahead now */
 		folio = __swapin_cache_alloc(
 				swp_entry(swp_type(entry), offset),
-				gfp_mask, mpol, ilx, &page_allocated, false);
+				gfp_mask, mpol, ilx, &page_allocated);
 		if (!folio)
 			continue;
 		if (page_allocated) {
@@ -660,7 +634,7 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
 skip:
 	/* The page was likely read above, so no need for plugging here */
 	folio = __swapin_cache_alloc(entry, gfp_mask, mpol, ilx,
-					&page_allocated, false);
+				     &page_allocated);
 	if (unlikely(page_allocated))
 		swap_read_folio(folio, NULL);
 	return folio;
@@ -755,7 +729,7 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
 		pte_unmap(pte);
 		pte = NULL;
 		folio = __swapin_cache_alloc(entry, gfp_mask, mpol, ilx,
-						&page_allocated, false);
+					     &page_allocated);
 		if (!folio)
 			continue;
 		if (page_allocated) {
@@ -775,7 +749,7 @@ static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gfp_mask,
 skip:
 	/* The folio was likely read above, so no need for plugging here */
 	folio = __swapin_cache_alloc(targ_entry, gfp_mask, mpol, targ_ilx,
-					&page_allocated, false);
+				     &page_allocated);
 	if (unlikely(page_allocated))
 		swap_read_folio(folio, NULL);
 	return folio;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index d01dc0646db9..8909d1655432 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1283,7 +1283,7 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	if (!entry.val)
 		return -ENOMEM;
 
-	if (swap_cache_add_folio(entry, folio, NULL))
+	if (WARN_ON(swap_cache_add_folio(entry, folio, NULL, false) != folio))
 		goto out_free;
 
 	atomic_long_sub(size, &nr_swap_pages);
@@ -1556,6 +1556,17 @@ void swap_free_nr(swp_entry_t entry, int nr_pages)
 	}
 }
 
+void __swap_cache_put_entries(struct swap_info_struct *si,
+			      struct swap_cluster_info *ci,
+			      swp_entry_t entry, unsigned int size)
+{
+	if (swap_only_has_cache(si, swp_offset(entry), size))
+		swap_entries_free(si, ci, entry, size);
+	else
+		for (int i = 0; i < size; i++, entry.val++)
+			swap_entry_put_locked(si, ci, entry, SWAP_HAS_CACHE);
+}
+
 /*
  * Called after dropping swapcache to decrease refcnt to swap entries.
  */
@@ -1571,11 +1582,7 @@ void put_swap_folio(struct folio *folio, swp_entry_t entry)
 		return;
 
 	ci = swap_lock_cluster(si, offset);
-	if (swap_only_has_cache(si, offset, size))
-		swap_entries_free(si, ci, entry, size);
-	else
-		for (int i = 0; i < size; i++, entry.val++)
-			swap_entry_put_locked(si, ci, entry, SWAP_HAS_CACHE);
+	__swap_cache_put_entries(si, ci, entry, size);
 	swap_unlock_cluster(ci);
 }
 
@@ -3597,17 +3604,10 @@ int swap_duplicate_nr(swp_entry_t entry, int nr)
 	return err;
 }
 
-/*
- * @entry: first swap entry from which we allocate nr swap cache.
- *
- * Called when allocating swap cache for existing swap entries,
- * This can return error codes. Returns 0 at success.
- * -EEXIST means there is a swap cache.
- * Note: return code is different from swap_duplicate().
- */
-int swapcache_prepare(swp_entry_t entry, int nr)
+int __swap_cache_set_entry(struct swap_info_struct *si,
+			   struct swap_cluster_info *ci, unsigned long offset)
 {
-	return __swap_duplicate(entry, SWAP_HAS_CACHE, nr);
+	return swap_dup_entries(si, ci, offset, SWAP_HAS_CACHE, 1);
 }
 
 /*
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7b5f41b4147b..8b5498cae0d5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -798,7 +798,6 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 		__swap_cache_del_folio(swap, folio, shadow);
 		memcg1_swapout(folio, swap);
 		swap_unlock_cluster_irq(ci);
-		put_swap_folio(folio, swap);
 	} else {
 		void (*free_folio)(struct folio *);
 
diff --git a/mm/zswap.c b/mm/zswap.c
index 87aebeee11ef..65c1aff5c4a4 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1085,7 +1085,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 
 	mpol = get_task_policy(current);
 	folio = __swapin_cache_alloc(swpentry, GFP_KERNEL, mpol,
-				NO_INTERLEAVE_INDEX, &folio_was_allocated, true);
+				     NO_INTERLEAVE_INDEX, &folio_was_allocated);
 	put_swap_device(si);
 	if (!folio)
 		return -ENOMEM;
-- 
2.49.0

