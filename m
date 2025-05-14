Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411D296D3D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253913; cv=none; b=Tic9ylykbziZoWhoGkxWnyHGkFKTRYkQ7nukpaUZVNis3DE6+uo/xnpDqlXyjlbi/3lNqcV7ep2u7xdIAuGXSwLrKUrSmo1y2t476Mqs2XRf3mDJPe1ONmw18R6W9nLKDJYg+wCyuZxSd/MMZdcr5HxubrToEwogaaAygXcIsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253913; c=relaxed/simple;
	bh=3lEXhNdCuWGvbTCHC3Hh7clhOLnsTDQtKjve9gOEzaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUh5WVcethm9uHJgPRRATcPVI7BY6LQmvfsh6MtN0Meb0ra4v4Gkd8D3Y0cCZwAFFU08U7pu8Rvg5E5MlNJDEg5pKkKuPllQ+ooI3bheTgUPbMVUw1ZF1G5g+0jQmVJm0Zix7qqAxBfTvYn75KuiSpX41iC7p5gYXdL5gDaBNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYSdiDlx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYSdiDlx"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30c47918d84so263570a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253911; x=1747858711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M1R/mpbhR+GPNqZSC0ObHBH2ENS4V9i/XDChvLFkyhc=;
        b=UYSdiDlxn6lu0Pa+M3tzi8z7znqQiwwk3yNbarN+7T2XcnGRDa6rbE4VTR3S/5pMN9
         Gy30GxEBMstsOn5ICSWZaLnxxldR/DsARy5pPcoN/OH8cQbCuLvf2Wm0OZAjQ+UDvE5v
         F/PFMjIgPkHNEs/QrCYUIGuEUBFhnuu0ybHLXtY1GcC0I/EeubZb4UqH1KZ1KkfTGZyi
         FR3ZPabP/nvQWwTRQavjA+rv1kexyGxkTiTFMWDlluFO0FucUEZ4YEt3yJSaRwqeCZbj
         3FFrlFpCAyRMdkRfSEOD2F9BakBVoVsGPi+nTqcMIyvug9pbAq0m2lonLaKkInDYtMnk
         yowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253911; x=1747858711;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1R/mpbhR+GPNqZSC0ObHBH2ENS4V9i/XDChvLFkyhc=;
        b=BcUecyJkRESaM+3WLtb96kDwA5F6p+TUGHlzflgelcRgKOkmU5Vv+FiXNFa1S8cO8v
         oJQPg+Ad6CdV8sMDKveO0MjEvnMDMTdmwfVaJgdyXuiA8hbbj2HbKPJ7PXu++zvNNLfi
         vZqbB5aKHoTZswtpuVTnEPKSN6g1/mOpECUxQd+rx6cLwi9AszOb3P7YPnHA/xOvpYsM
         rHo1ZP8BBa/Nf3H39LY+BtxwtwSdawQUt/eIHwZ4f7XUjcC+bkACi31jAsXT2BeePg1R
         TS2NLxOZe51zS5AUnQZRwtLNkmZ7eCCe+U3FyE2q59XNvnkcQ2Wfa4Vh9l1pg3gwU4A5
         No/g==
X-Forwarded-Encrypted: i=1; AJvYcCVIKcdvTt4MKIgwQlLLA04uvEp6q4ilUpNM/xPwcjQe/2z8Rrhs4VDUSvdtuqtiS6dcheSYj+B0uEZZcSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6gC4Q0Xf9wbQEzDwx96fs9+L+F/oTnfZmSctHTOZBM9tQ6zt
	57rStQL76SCDUZmJDVZPK6UA2pNQKghd5Ks3MrRCZozizU9oyJfV
X-Gm-Gg: ASbGncuBYdQR30ql3v2Drfrr9FEK0xzEPBmdzBU1XOdVGDGhroRZvN4s/gldyYVy8j+
	AhRSnyvwaBBa2/1DYE1EPlcX2tw5H4C6noqKvPParax5BvfMZBPzjifDR2O7gTRTMscr6Mr4m8N
	c1+LGT7eWsYXYyuqDelp/6UyVXl2Z7Btf8/8F8Xgq/26sr8T89yDFmbkBv3a6N6XLc+1h97Z5Yr
	bShjZm6ipypiW4jK5Z+5Ipqdcg0U/FVAPxJ6K6MwAlCAxVHqxC4T9X1BJQZDxDIB5ZCYF9g4q19
	Ys66yKV4JqsSR3XvelQKQ2S440tdpFn647lAqvk/tg4BOQJClpd6qfTaFWlQWAw6gEIC+4XX
X-Google-Smtp-Source: AGHT+IGnlSHbxyA5V3K7uMRaI4uuFU1zzPZsYG8BiPN7S4hJcbAGXBFga/6TlUDA8ebrQlzWWbc3Gw==
X-Received: by 2002:a17:90b:5866:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-30e2e59bbf0mr6421498a91.3.1747253911031;
        Wed, 14 May 2025 13:18:31 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:30 -0700 (PDT)
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
Subject: [PATCH 10/28] mm, swap: add a swap helper for bypassing only read ahead
Date: Thu, 15 May 2025 04:17:10 +0800
Message-ID: <20250514201729.48420-11-ryncsn@gmail.com>
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

The swap cache now has a very low overhead, bypassing it is not helpful
anymore. To prepare for unifying the swap in path, introduce a new
helper that only bypasses read ahead and does not bypass the swap cache.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap.h       |   6 ++
 mm/swap_state.c | 158 ++++++++++++++++++++++++++++++------------------
 2 files changed, 105 insertions(+), 59 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index fec7d6e751ae..aab6bf9c3a8a 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -217,6 +217,7 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
 		struct mempolicy *mpol, pgoff_t ilx);
 struct folio *swapin_readahead(swp_entry_t entry, gfp_t flag,
 		struct vm_fault *vmf);
+struct folio *swapin_entry(swp_entry_t entry, struct folio *folio);
 void swap_update_readahead(struct folio *folio, struct vm_area_struct *vma,
 			   unsigned long addr);
 
@@ -303,6 +304,11 @@ static inline struct folio *swapin_readahead(swp_entry_t swp, gfp_t gfp_mask,
 	return NULL;
 }
 
+static inline struct folio *swapin_entry(swp_entry_t ent, struct folio *folio)
+{
+	return NULL;
+}
+
 static inline void swap_update_readahead(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr)
 {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index fe71706e29d9..d68687295f52 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -353,54 +353,26 @@ void swap_update_readahead(struct folio *folio,
 	}
 }
 
-struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
-		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
-		bool skip_if_exists)
+static struct folio *__swapin_cache_add_prepare(swp_entry_t entry,
+						struct folio *folio,
+						bool skip_if_exists)
 {
-	struct swap_info_struct *si = swp_info(entry);
-	struct folio *folio;
-	struct folio *new_folio = NULL;
-	struct folio *result = NULL;
+	int nr_pages = folio_nr_pages(folio);
+	struct folio *exist;
 	void *shadow = NULL;
+	int err;
 
-	*new_page_allocated = false;
 	for (;;) {
-		int err;
-
 		/*
-		 * Check the swap cache first, if a cached folio is found,
-		 * return it unlocked. The caller will lock and check it.
+		 * Caller should have checked swap cache and swap count
+		 * already, try prepare the swap map directly, it will still
+		 * fail with -ENOENT or -EEXIST if the entry is gone or raced.
 		 */
-		folio = swap_cache_get_folio(entry);
-		if (folio)
-			goto got_folio;
-
-		/*
-		 * Just skip read ahead for unused swap slot.
-		 */
-		if (!swap_entry_swapped(si, entry))
-			goto put_and_return;
-
-		/*
-		 * Get a new folio to read into from swap.  Allocate it now if
-		 * new_folio not exist, before marking swap_map SWAP_HAS_CACHE,
-		 * when -EEXIST will cause any racers to loop around until we
-		 * add it to cache.
-		 */
-		if (!new_folio) {
-			new_folio = folio_alloc_mpol(gfp_mask, 0, mpol, ilx, numa_node_id());
-			if (!new_folio)
-				goto put_and_return;
-		}
-
-		/*
-		 * Swap entry may have been freed since our caller observed it.
-		 */
-		err = swapcache_prepare(entry, 1);
+		err = swapcache_prepare(entry, nr_pages);
 		if (!err)
 			break;
 		else if (err != -EEXIST)
-			goto put_and_return;
+			return NULL;
 
 		/*
 		 * Protect against a recursive call to __swapin_cache_alloc()
@@ -411,7 +383,11 @@ struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
 		 * __swapin_cache_alloc() in the writeback path.
 		 */
 		if (skip_if_exists)
-			goto put_and_return;
+			return NULL;
+
+		exist = swap_cache_get_folio(entry);
+		if (exist)
+			return exist;
 
 		/*
 		 * We might race against __swap_cache_del_folio(), and
@@ -426,35 +402,99 @@ struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
 	/*
 	 * The swap entry is ours to swap in. Prepare the new folio.
 	 */
-	__folio_set_locked(new_folio);
-	__folio_set_swapbacked(new_folio);
+	__folio_set_locked(folio);
+	__folio_set_swapbacked(folio);
 
-	if (mem_cgroup_swapin_charge_folio(new_folio, NULL, gfp_mask, entry))
-		goto fail_unlock;
-
-	if (swap_cache_add_folio(entry, new_folio, &shadow))
+	if (swap_cache_add_folio(entry, folio, &shadow))
 		goto fail_unlock;
 
 	memcg1_swapin(entry, 1);
 
 	if (shadow)
-		workingset_refault(new_folio, shadow);
+		workingset_refault(folio, shadow);
 
 	/* Caller will initiate read into locked new_folio */
-	folio_add_lru(new_folio);
-	*new_page_allocated = true;
-	folio = new_folio;
-got_folio:
-	result = folio;
-	goto put_and_return;
+	folio_add_lru(folio);
+	return folio;
 
 fail_unlock:
-	put_swap_folio(new_folio, entry);
-	folio_unlock(new_folio);
-put_and_return:
-	if (!(*new_page_allocated) && new_folio)
-		folio_put(new_folio);
-	return result;
+	put_swap_folio(folio, entry);
+	folio_unlock(folio);
+	return NULL;
+}
+
+struct folio *__swapin_cache_alloc(swp_entry_t entry, gfp_t gfp_mask,
+		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
+		bool skip_if_exists)
+{
+	struct swap_info_struct *si = swp_info(entry);
+	struct folio *swapcache = NULL, *folio = NULL;
+
+	/*
+	 * Check the swap cache first, if a cached folio is found,
+	 * return it unlocked. The caller will lock and check it.
+	 */
+	swapcache = swap_cache_get_folio(entry);
+	if (swapcache)
+		goto out;
+
+	/*
+	 * Just skip read ahead for unused swap slot.
+	 */
+	if (!swap_entry_swapped(si, entry))
+		goto out;
+
+	/*
+	 * Get a new folio to read into from swap.  Allocate it now if
+	 * new_folio not exist, before marking swap_map SWAP_HAS_CACHE,
+	 * when -EEXIST will cause any racers to loop around until we
+	 * add it to cache.
+	 */
+	folio = folio_alloc_mpol(gfp_mask, 0, mpol, ilx, numa_node_id());
+	if (!folio)
+		goto out;
+
+	if (mem_cgroup_swapin_charge_folio(folio, NULL, gfp_mask, entry))
+		goto out;
+
+	swapcache = __swapin_cache_add_prepare(entry, folio, skip_if_exists);
+out:
+	if (swapcache && swapcache == folio) {
+		*new_page_allocated = true;
+	} else {
+		if (folio)
+			folio_put(folio);
+		*new_page_allocated = false;
+	}
+
+	return swapcache;
+}
+
+/**
+ * swapin_entry - swap-in one or multiple entries skipping readahead
+ *
+ * @entry: swap entry to swap in
+ * @folio: pre allocated folio
+ *
+ * Reads @entry into @folio. @folio will be added to swap cache first, if
+ * this raced with another users, only one user will successfully add its
+ * folio into swap cache, and that folio will be returned for all readers.
+ *
+ * If @folio is a large folio, the entry will be rounded down to match
+ * the folio start and the whole folio will be read in.
+ */
+struct folio *swapin_entry(swp_entry_t entry, struct folio *folio)
+{
+	struct folio *swapcache;
+	pgoff_t offset = swp_offset(entry);
+	unsigned long nr_pages = folio_nr_pages(folio);
+	VM_WARN_ON_ONCE(nr_pages > SWAPFILE_CLUSTER);
+
+	entry = swp_entry(swp_type(entry), ALIGN_DOWN(offset, nr_pages));
+	swapcache = __swapin_cache_add_prepare(entry, folio, false);
+	if (swapcache == folio)
+		swap_read_folio(folio, NULL);
+	return swapcache;
 }
 
 /*
-- 
2.49.0

