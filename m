Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C8296D14
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253955; cv=none; b=NF9EbIPCYo/vxcE/gLgf/oUAV4J1rNyEb3qytjNKMVgYI0odo6XcuRCWtSzHs7tOm13iqRokJu2toY/f2qMRREsfYVlmBWUcCRi8g8mmBxLmEnQEOap9zIrEweKokSb/sZ4jmdaYugy+4qg087MAe46sB4vpQ7GNgdR7e8Rq7Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253955; c=relaxed/simple;
	bh=5o9tgBb7tgPFgAoAzu8I/e35Zyoh1N7OdGgS/IOxsbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4lSJZhEGfUkUe/oyvgxD0rp7XQpB6wPMQJUE9YeE2lc8i8UvVHqoUc2pC3pgI4ElW2j4+CpplG9aUtOYEMpyahXBM6BdKesxqZ7AM601GsKo9rKnpoxT/mzIGPK0A2kpaZZYDrjmyoK+euSUUVpjjXo+3TBX9J7Os1k9Agjz+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0X3i77J; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0X3i77J"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30820167b47so259573a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253952; x=1747858752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UvmaxbsPM6qyK/MiHoJQD413Xxi7HR6Fgym3PRJ3v+c=;
        b=T0X3i77JGLBfy0oIFaiAj1un7EKJ8tiRzYeGp4wMrpxayrV+xBAYdIp46SgdDm+3hv
         8py5f+ipybE9tU4vCrj1KG1x6lW96rTNdKac4gWGX218J3UTQ/ROcmhcDlYIIAjGwN+7
         e5VHPuj3vK+O0ov091Q5lCm13pSxUnnZKDv54x+5iLWlkLrDLaHpIqhZDHO6YksUhKgW
         hUGZXogn+C7ylGiFRwveuIaKtlL96/v0Zz8s3xjNLTJdNuSwx8gLkOck/RNPBHlvsPrZ
         6EoBu0npZBdii5MmAtgE7Va8UwVIaSSHFxWEzShfyWZthbQXmzT03KR3K/FQAHaquoe6
         NvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253952; x=1747858752;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvmaxbsPM6qyK/MiHoJQD413Xxi7HR6Fgym3PRJ3v+c=;
        b=tdzkOqKaz7mhJyQmocWqTmuCdqgNCsqaVHFr45ctK048Nq/7i4phvGijyJuuaXDlrg
         PCf7Y/3jguPnU2Ufp+43ZFJ8MSuuVZQ6LRz/lfYY4la/2Hdq1TMky+rwOWtv6efSwEr8
         3+rhxdmSKdR3zzNINChamcjPYKaRXJsyWW9x91oIUmGQahFFEgxTWxzbfBepXjoHkc2Y
         tDtgdgZ1cETPXQpyE9hem85+QLTELWKwDO/wNgwTP4TpCmTQXWh1Wn9GhF+9oTt99FLd
         OX+144zgkl7YQdHCf75GpKpy0B4LTgbC/PC8PHzgDXJXPBVgDDmspo1WltxFufTeHWd9
         kwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLvlwiV8dIxewRgzReAUevPXYv6tYNMoltfq3SQyhSYDICDciYwMNy9M8stqi2c0xUiqZNnIt+z5Zx1C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJRdVgVrwZGxPUNzbopDFmZUIHgfQTgkrtHJbq4APfflIPJl5
	o5gn8YoV4IIGxd05TZOx07dOudNcZi6tWy9gdfYWk+W3BiekyR61
X-Gm-Gg: ASbGncvefDW/Vgh0H6K/WD4cnuuOSQIJSzQOvfoKWD/eCVCFmjl7AK74WVaGVFSZaLu
	J5dMncHePZQeB4ZP1YQX+3A4p2NpQ21hOGDk5Rng4aY6Pyjt0h9Z2NOT+6w15OMm6jWY1ofXqt6
	HrCKuY3M8RC14pnhhRz9FK6gqLNjr+Dsg2DtgaUP0yV1Zd1WtLs7T/QsCEn8cIrzYgqKBfXl32x
	jZL1LeNjQe7aH8ZRMjN51VXYj0tBb+z0Hr9aa0VcXobEv95UqKtc9h+gL++tPP2j5jrwrCDf7/b
	0TwGJa7h6GNGk8mjbij7bKlAfWHS8IHZwqsGZCF0Ma//rxE68NO5Fl7uLPPjIYYPPEBSsXKx
X-Google-Smtp-Source: AGHT+IGo6fZOY9gD9/a6oJ7A/qen0iR8c9NVCuv0m4jHSlVjCl2c3TmOEpL+9XDYNMKoEDGonGxBrg==
X-Received: by 2002:a17:90b:50c4:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e4db6c453mr1350875a91.13.1747253952529;
        Wed, 14 May 2025 13:19:12 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:11 -0700 (PDT)
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
Subject: [PATCH 18/28] mm, swap: rename and introduce folio_free_swap_cache
Date: Thu, 15 May 2025 04:17:18 +0800
Message-ID: <20250514201729.48420-19-ryncsn@gmail.com>
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

We now have folio_alloc_swap, folio_dup_swap, folio_put_swap, and
folio_free_swap (which is actually try to free). Also rename
delete_from_swap_cache to folio_free_swap_cache, because swap cache will
always be the last reference of a folio bounded entry now. Freeing the
swap cache will also attempt to free the swap entries.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory-failure.c |  2 +-
 mm/memory.c         |  2 +-
 mm/shmem.c          |  4 ++--
 mm/swap.h           | 14 +++++++++-----
 mm/swap_state.c     | 12 ------------
 mm/swapfile.c       | 23 +++++++++++++++++++++--
 mm/zswap.c          |  2 +-
 7 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index b91a33fb6c69..ba96aaf96e83 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1185,7 +1185,7 @@ static int me_swapcache_clean(struct page_state *ps, struct page *p)
 	struct folio *folio = page_folio(p);
 	int ret;
 
-	delete_from_swap_cache(folio);
+	folio_free_swap_cache(folio);
 
 	ret = delete_from_lru_cache(folio) ? MF_FAILED : MF_RECOVERED;
 	folio_unlock(folio);
diff --git a/mm/memory.c b/mm/memory.c
index c000e39b3eb2..a70624a55aa2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4727,7 +4727,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		 */
 		if (!folio_test_anon(folio)) {
 			WARN_ON_ONCE(folio_test_dirty(folio));
-			delete_from_swap_cache(folio);
+			folio_free_swap_cache(folio);
 			goto out_nomap;
 		}
 	}
diff --git a/mm/shmem.c b/mm/shmem.c
index 0d23c1c12204..c7475629365c 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2123,7 +2123,7 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
 	nr_pages = folio_nr_pages(folio);
 	folio_wait_writeback(folio);
 	folio_put_swap(folio, NULL);
-	delete_from_swap_cache(folio);
+	folio_free_swap_cache(folio);
 	/*
 	 * Don't treat swapin error folio as alloced. Otherwise inode->i_blocks
 	 * won't be 0 when inode is released and thus trigger WARN_ON(i_blocks)
@@ -2365,7 +2365,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		folio_mark_accessed(folio);
 
 	folio_put_swap(folio, NULL);
-	delete_from_swap_cache(folio);
+	folio_free_swap_cache(folio);
 	folio_mark_dirty(folio);
 	put_swap_device(si);
 
diff --git a/mm/swap.h b/mm/swap.h
index 4c4a71081895..467996dafbae 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -151,10 +151,15 @@ extern void __swap_cache_put_entries(struct swap_info_struct *si,
  *
  * Swap in maps a folio in swap cache and decrease the swap table entry
  * count with folio_put_swap.
+ *
+ * Swap uses lazy free, so a folio may stay in swap cache for a long time
+ * and pin the swap entry. folio_free_swap_cache and folio_free_swap can
+ * be used to reclaim the swap cache.
  */
 int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask);
 int folio_dup_swap(struct folio *folio, struct page *subpage);
 void folio_put_swap(struct folio *folio, struct page *subpage);
+void folio_free_swap_cache(struct folio *folio);
 
 /* linux/mm/page_io.c */
 int sio_pool_init(void);
@@ -226,7 +231,6 @@ static inline bool folio_swap_contains(struct folio *folio, swp_entry_t entry)
 }
 
 void show_swap_cache_info(void);
-void delete_from_swap_cache(struct folio *folio);
 void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
 struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct vm_area_struct *vma, unsigned long addr,
@@ -300,6 +304,10 @@ static inline void folio_put_swap(struct folio *folio, struct page *page)
 {
 }
 
+static inline void folio_free_swap_cache(struct folio *folio)
+{
+}
+
 static inline void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
 {
 }
@@ -387,10 +395,6 @@ static inline void *swap_cache_get_shadow(swp_entry_t end)
 	return NULL;
 }
 
-static inline void delete_from_swap_cache(struct folio *folio)
-{
-}
-
 static inline unsigned int folio_swap_flags(struct folio *folio)
 {
 	return 0;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 715aff5aca57..c8bb16835612 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -216,18 +216,6 @@ void __swap_cache_del_folio(swp_entry_t entry,
 	__swap_cache_put_entries(si, ci, entry, nr_pages);
 }
 
-void delete_from_swap_cache(struct folio *folio)
-{
-	struct swap_cluster_info *ci;
-	swp_entry_t entry = folio->swap;
-
-	ci = swap_lock_cluster(swp_info(entry), swp_offset(entry));
-	__swap_cache_del_folio(entry, folio, NULL);
-	swap_unlock_cluster(ci);
-
-	folio_ref_sub(folio, folio_nr_pages(folio));
-}
-
 /*
  * Caller must hold a reference on the swap device, and check if the
  * returned folio is still valid after locking it (e.g. folio_swap_contains).
diff --git a/mm/swapfile.c b/mm/swapfile.c
index daf7810bcb28..0a8b36ecbf08 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -273,7 +273,7 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	if (!need_reclaim)
 		goto out_unlock;
 
-	delete_from_swap_cache(folio);
+	folio_free_swap_cache(folio);
 	folio_set_dirty(folio);
 	ret = nr_pages;
 out_unlock:
@@ -1354,6 +1354,25 @@ void folio_put_swap(struct folio *folio, struct page *subpage)
 	swap_entries_put_map(swp_info(entry), entry, nr_pages);
 }
 
+/*
+ * folio_free_swap_cache() - Remove the folio from swap cache, and free
+ * all entires with zero count.
+ *
+ * NOTE: if the folio is dirty and any of its swap entries' count is not
+ * zero, freeing the swap cache without write back may cause data loss.
+ */
+void folio_free_swap_cache(struct folio *folio)
+{
+	struct swap_cluster_info *ci;
+	swp_entry_t entry = folio->swap;
+
+	ci = swap_lock_cluster(swp_info(entry), swp_offset(entry));
+	__swap_cache_del_folio(entry, folio, NULL);
+	swap_unlock_cluster(ci);
+
+	folio_ref_sub(folio, folio_nr_pages(folio));
+}
+
 static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
 {
 	struct swap_info_struct *si;
@@ -1787,7 +1806,7 @@ bool folio_free_swap(struct folio *folio)
 	if (folio_swapped(folio))
 		return false;
 
-	delete_from_swap_cache(folio);
+	folio_free_swap_cache(folio);
 	folio_set_dirty(folio);
 	return true;
 }
diff --git a/mm/zswap.c b/mm/zswap.c
index 65c1aff5c4a4..6bac50bc2bf5 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1141,7 +1141,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 
 out:
 	if (ret && ret != -EEXIST) {
-		delete_from_swap_cache(folio);
+		folio_free_swap_cache(folio);
 		folio_unlock(folio);
 	}
 	folio_put(folio);
-- 
2.49.0

