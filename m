Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D3296D06
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253950; cv=none; b=jl1GxkR1w5hYU5spkYk+5vuxOOMi5KGMqALG/NnZCbbtEkkNS9lhqpaXYyM/JfF/E7Xb0edrTrD49C2YG2nE9L9CvfHP86C78jecvlUQGM8zTHtBgEQBXafw5TFJYVmoe1UvqanHBhl5PzAmbGXS1f3PrISJGbUhRRQks20hlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253950; c=relaxed/simple;
	bh=1mj50u1/SoUfHVI+aEzddJ6xuv2rfW4QMp1ZNIV9TCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGF2ChT3Q39Dp6AAXJ4QIrKW4LT66irzx7sINyI4TrFxsL6Bw03/8lCWkAk1wjrFuqa5m36TMZg5LdHQlCmvFuO6DgOTnUUU1ilHGEyz29qEdCNlMUbwd7X5kMimrtMEDPM5yxZCasfQItFft28aR5zuumPgDNOt8J2KxtmxTNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAwTgvwD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAwTgvwD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30572effb26so269350a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253947; x=1747858747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LJQr0LI1cPuDnoXNE6bhHcr8pvqvljf0e+roqwCU7fw=;
        b=GAwTgvwDgNrXus8ekr83Bcgjamdt6ZUjWnZn4U7EBXaMEnLV3fa+W0wJKU/c40IIu9
         7gtycITBbmRscE/x9DAfr+BfJCm86MSP9JGZwwGoOCG8mkYiUIy+2tQttmj4wJ4v9dgP
         YJdFx9kDB/Z9xvi/HgFL8r9b6jJF1P+lgDg8hVzCjEN1ju2b/+hgOgKEHgNS4oprsXVa
         RR3fVUZpe1gjV86u/a4F29XpH8T7u39o0NxUBzTr1PDV/w9AB6qWCCCjAQSgn0iW1f97
         cTpBma5hFtuYkcRDFH1Mb3a+Forj+0ub8+3jXYnbJMU233l6IiD1cjFlrG7CP+fgKy8G
         zoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253947; x=1747858747;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJQr0LI1cPuDnoXNE6bhHcr8pvqvljf0e+roqwCU7fw=;
        b=aSfS+4BYWLde1sKRRk72xYpbewT8LhYa6TyKhJI0sOSBRh5My9VhZ+tqTxgcJfS1Tk
         eUlyBce8l3FMCO5qMbhYM9Y6WMUEYkYLQgJAQ4F0saD7VCadmEbdbqKtHhtiOQPbDW3w
         lAzdZIV51Bsfzu5rPMrhEl2m4LFcnSxs+WgYuIwm+yM5xFzjj/DkyX4ryVoTbLKkv4Az
         swsL4WTw6CWIonqzo+uMMgR5is2Ym8QPulEnIGnc+Za2TiMqUy/qZRL4ImOxgM2TPF3P
         YikKyxllx2kEg7S48UFgVusfQo55B+rFEWRfG1evdb1M0hj2Ahn0pHmtAnT/KVKMvnMc
         Znog==
X-Forwarded-Encrypted: i=1; AJvYcCVd7A9jZ0jaBe81lXACcyoSEtMFSa1IlovlEw+w8hwFMV5UHdeQtaLmR/jkyr2aXCbGY10QaImeq5Q4t34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKwlgup5F9h1Ja+gi852zfj0J7tFSfntDq7mFSuH5VZAAls06
	1pTxG2vlb3kBF5wHAgGe9GkcW70AL6Frpnt2xKYIrK+uMfqL8WFM
X-Gm-Gg: ASbGncvajYtNe7T0iAQcDkBOT4OrlKObz2rrK5bkVlRbmbUZLh8jfDVOgZFKgCkRmpr
	wOW25fo46t6nIyITszpmBr4VVBS9fTTSeJfREoGR5XTVcKDn3xMven08PjrnrcAor37F78TLw2h
	zV/eZo+r7NZi7TXngTXC2zMe9KvsbZQsx1j1JkdBzHefjsOvRvlMu+qvW5j3yB3vVNXkKdLFO0c
	aHU9hTbt6gS//W0Ha1r7oxnXaTWABkcGZW46lDOEQaHyy0pllejzBvx6yK0p9hrmnVfslvW+w33
	7mtarwY4jSvbUGQN8ajHwUaC2hiAw5DbvwsrH3FZRd4NPrC/fEEoS4zDJOAjGoUDus7NVbvY
X-Google-Smtp-Source: AGHT+IGxtg6nmycc4I3pJQ+k9yvF4DLhWCXmq98Vgbfazkr2q9/vhDPtfaDzXXhafF6NPOhCBYpyBg==
X-Received: by 2002:a17:90b:3902:b0:30e:ee6:671a with SMTP id 98e67ed59e1d1-30e2e5fe611mr7495225a91.10.1747253947414;
        Wed, 14 May 2025 13:19:07 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:06 -0700 (PDT)
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
Subject: [PATCH 17/28] mm, swap: sanitize swap entry management workflow
Date: Thu, 15 May 2025 04:17:17 +0800
Message-ID: <20250514201729.48420-18-ryncsn@gmail.com>
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

The current swap entry allocation / freeing workflow has never had a
clear definition. Which makes it hard to debug or add new optimizations.

This commit introduces a proper definition of how swap entries would
be allocated and freed. Now, most operations are folio-based, so they will
Never exceed one swap cluster, and we now have a cleaner border between
swap and the rest of mm, making it much easier to follow and debug,
especially with sanity checks. Also making more optimization possible
later:

Swap entry should be allocated and free, either with a folio bound,
or from the page table / mapping directly.

When swap entries are bound with a folio (folio in the swap cache and
locked), these entries could be considered `stable`, won't be freed
completely and the swap device can't be swapped offed too.

(Hibernation subsystem is a bit different, see below)

For swap operations from the mm (folio/page table) side:

- folio_alloc_swap() - Allocation (swapout)
  This allocates one or a set of continuous swap entries for one folio
  and bind the folio with it by adding it to the swap cache.
  Context: The folio must be locked.

- folio_dup_swap() - On folio unmap (swapout)
  This increases the ref count of swap entries allocated to a folio.
  Context: The folio must be locked and in the swap cache.

- folio_put_swap() - On folio map (swap in)
  This decreases the ref count of swap entries allocated to a folio.
  Context: The folio must be locked and in the swap cache.

  NOTE: this won't remove the folio from the swap cache, as the swap
  cache is lazy freed. The allocator can reclaim clean swap caches, and
  reduces IO or allocator overhead. The lazy freeing of the swap cache
  could be further optimized later. (see folio_free_swap below *)

- do_put_swap_entries() - On page table zapping / shmem truncate
  This decreases the ref count of swap entries as the page table gets
  zapped, or mapping gets truncated.
  Context: The caller must ensure the entries won't be freed completely
  during the period, which is currently done by holding the page table
  lock (zapping) or mapping cmpxchg (shmem) to prevent swap in or
  concurrent free.

- do_dup_swap_entry() - On page table copy (fork)
  This increases the ref count of the swap entry as the page table gets
  copied.
  Context: The caller must ensure the entry won't be freed during
  The period, which is currently done by holding the page table lock
  to prevent a swap-in or concurrent free.

* There is already a folio_free_swap(), it's a bit special as it will
  try to free the swap entries pinned by a folio only if all entries'
  count have dropped to zero. So it can be called after folio_put_swap()
  have dropped all swap ref counts. It can be better optimized and maybe
  merged into folio_put_swap() later.

For hibernation, two special helpers are here:

- get_swap_page_of_type() - Allocate one entry from one device.
- free_swap_page_of_entry() - Free one entry allocated by above helper.

All hibernation entries are exclusive to the hibernation subsystem and
should not interact with ordinary swap routines.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 arch/s390/mm/pgtable.c |   2 +-
 include/linux/swap.h   |  57 ++++++++---------
 kernel/power/swap.c    |   8 ++-
 mm/madvise.c           |   2 +-
 mm/memory.c            |  20 +++---
 mm/rmap.c              |   7 ++-
 mm/shmem.c             |   8 +--
 mm/swap.h              |  29 +++++++++
 mm/swapfile.c          | 135 +++++++++++++++++++++++++++++------------
 9 files changed, 176 insertions(+), 92 deletions(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 9901934284ec..c402552bc8f3 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -715,7 +715,7 @@ static void ptep_zap_swap_entry(struct mm_struct *mm, swp_entry_t entry)
 
 		dec_mm_counter(mm, mm_counter(folio));
 	}
-	free_swap_and_cache(entry);
+	do_put_swap_entries(entry, 1);
 }
 
 void ptep_zap_unused(struct mm_struct *mm, unsigned long addr,
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 2da769cdc663..adac6d51da05 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -437,14 +437,8 @@ static inline long get_nr_swap_pages(void)
 }
 
 extern void si_swapinfo(struct sysinfo *);
-int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask);
-bool folio_free_swap(struct folio *folio);
 void put_swap_folio(struct folio *folio, swp_entry_t entry);
-extern swp_entry_t get_swap_page_of_type(int);
 extern int add_swap_count_continuation(swp_entry_t, gfp_t);
-extern int swap_duplicate_nr(swp_entry_t entry, int nr);
-extern void swap_free_nr(swp_entry_t entry, int nr_pages);
-extern void free_swap_and_cache_nr(swp_entry_t entry, int nr);
 int swap_type_of(dev_t device, sector_t offset);
 int find_first_swap(dev_t *device);
 extern unsigned int count_swap_pages(int, int);
@@ -456,6 +450,28 @@ struct backing_dev_info;
 extern struct swap_info_struct *get_swap_device(swp_entry_t entry);
 sector_t swap_folio_sector(struct folio *folio);
 
+/*
+ * For manipulating allocated swap table entries from page table or
+ * mapping (shmem) directly. Caller must ensure the entries won't be
+ * freed during the period.
+ *
+ * All entries must be allocated by folio_alloc_swap(), see
+ * mm/swap.h for more comments on it.
+ */
+extern int do_dup_swap_entry(swp_entry_t entry);
+extern void do_put_swap_entries(swp_entry_t entry, int nr);
+
+/*
+ * folio_free_swap is a bit special, it's a best effort try to
+ * free the swap entries pinned by a folio, and it need to be
+ * here to be called by other components
+ */
+bool folio_free_swap(struct folio *folio);
+
+/* Allocate / free (hibernation) exclusive entries */
+extern swp_entry_t get_swap_page_of_type(int);
+extern void free_swap_page_of_entry(swp_entry_t entry);
+
 static inline void put_swap_device(struct swap_info_struct *si)
 {
 	percpu_ref_put(&si->users);
@@ -483,10 +499,6 @@ static inline void put_swap_device(struct swap_info_struct *si)
 #define free_pages_and_swap_cache(pages, nr) \
 	release_pages((pages), (nr));
 
-static inline void free_swap_and_cache_nr(swp_entry_t entry, int nr)
-{
-}
-
 static inline void free_swap_cache(struct folio *folio)
 {
 }
@@ -496,12 +508,12 @@ static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
 	return 0;
 }
 
-static inline int swap_duplicate_nr(swp_entry_t swp, int nr_pages)
+static inline int do_dup_swap_entry(swp_entry_t ent)
 {
 	return 0;
 }
 
-static inline void swap_free_nr(swp_entry_t entry, int nr_pages)
+static inline void do_put_swap_entries(swp_entry_t ent, int nr)
 {
 }
 
@@ -524,11 +536,6 @@ static inline int swp_swapcount(swp_entry_t entry)
 	return 0;
 }
 
-static inline int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask)
-{
-	return -EINVAL;
-}
-
 static inline bool folio_free_swap(struct folio *folio)
 {
 	return false;
@@ -541,22 +548,6 @@ static inline int add_swap_extent(struct swap_info_struct *sis,
 	return -EINVAL;
 }
 #endif /* CONFIG_SWAP */
-
-static inline int swap_duplicate(swp_entry_t entry)
-{
-	return swap_duplicate_nr(entry, 1);
-}
-
-static inline void free_swap_and_cache(swp_entry_t entry)
-{
-	free_swap_and_cache_nr(entry, 1);
-}
-
-static inline void swap_free(swp_entry_t entry)
-{
-	swap_free_nr(entry, 1);
-}
-
 #ifdef CONFIG_MEMCG
 static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 {
diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 80ff5f933a62..f94c4ea350cf 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -182,7 +182,7 @@ sector_t alloc_swapdev_block(int swap)
 	offset = swp_offset(get_swap_page_of_type(swap));
 	if (offset) {
 		if (swsusp_extents_insert(offset))
-			swap_free(swp_entry(swap, offset));
+			free_swap_page_of_entry(swp_entry(swap, offset));
 		else
 			return swapdev_block(swap, offset);
 	}
@@ -197,6 +197,7 @@ sector_t alloc_swapdev_block(int swap)
 
 void free_all_swap_pages(int swap)
 {
+	unsigned long offset;
 	struct rb_node *node;
 
 	while ((node = swsusp_extents.rb_node)) {
@@ -204,8 +205,9 @@ void free_all_swap_pages(int swap)
 
 		ext = rb_entry(node, struct swsusp_extent, node);
 		rb_erase(node, &swsusp_extents);
-		swap_free_nr(swp_entry(swap, ext->start),
-			     ext->end - ext->start + 1);
+
+		for (offset = ext->start; offset < ext->end; offset++)
+			free_swap_page_of_entry(swp_entry(swap, offset));
 
 		kfree(ext);
 	}
diff --git a/mm/madvise.c b/mm/madvise.c
index 8433ac9b27e0..36c62353d184 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -697,7 +697,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 				max_nr = (end - addr) / PAGE_SIZE;
 				nr = swap_pte_batch(pte, max_nr, ptent);
 				nr_swap -= nr;
-				free_swap_and_cache_nr(entry, nr);
+				do_put_swap_entries(entry, nr);
 				clear_not_present_full_ptes(mm, addr, pte, nr, tlb->fullmm);
 			} else if (is_hwpoison_entry(entry) ||
 				   is_poisoned_swp_entry(entry)) {
diff --git a/mm/memory.c b/mm/memory.c
index 0b41d15c6d7a..c000e39b3eb2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -804,7 +804,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	swp_entry_t entry = pte_to_swp_entry(orig_pte);
 
 	if (likely(!non_swap_entry(entry))) {
-		if (swap_duplicate(entry) < 0)
+		if (do_dup_swap_entry(entry) < 0)
 			return -EIO;
 
 		/* make sure dst_mm is on swapoff's mmlist. */
@@ -1625,7 +1625,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
 
 		nr = swap_pte_batch(pte, max_nr, ptent);
 		rss[MM_SWAPENTS] -= nr;
-		free_swap_and_cache_nr(entry, nr);
+		do_put_swap_entries(entry, nr);
 	} else if (is_migration_entry(entry)) {
 		struct folio *folio = pfn_swap_entry_folio(entry);
 
@@ -4783,7 +4783,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	/*
 	 * Some architectures may have to restore extra metadata to the page
 	 * when reading from swap. This metadata may be indexed by swap entry
-	 * so this must be called before swap_free().
+	 * so this must be called before folio_put_swap().
 	 */
 	arch_swap_restore(folio_swap(entry, folio), folio);
 
@@ -4821,13 +4821,17 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (unlikely(folio != swapcache && swapcache)) {
 		folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
 		folio_add_lru_vma(folio, vma);
+		folio_put_swap(swapcache, NULL);
 	} else if (!folio_test_anon(folio)) {
 		VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != nr_pages, folio);
 		VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
 		folio_add_new_anon_rmap(folio, vma, address, rmap_flags);
+		folio_put_swap(folio, NULL);
 	} else {
+		VM_WARN_ON_ONCE(nr_pages != 1 && nr_pages != folio_nr_pages(folio));
 		folio_add_anon_rmap_ptes(folio, page, nr_pages, vma, address,
-					rmap_flags);
+					 rmap_flags);
+		folio_put_swap(folio, nr_pages == folio_nr_pages(folio) ? NULL : page);
 	}
 
 	VM_BUG_ON(!folio_test_anon(folio) ||
@@ -4837,11 +4841,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			pte, pte, nr_pages);
 
 	/*
-	 * Remove the swap entry and conditionally try to free up the
-	 * swapcache then unlock the folio. Do this after the PTEs are
-	 * set, so raced faults will see updated PTEs.
+	 * Conditionally try to free up the swapcache and unlock the folio
+	 * after the PTEs are set, so raced faults will see updated PTEs.
 	 */
-	swap_free_nr(entry, nr_pages);
 	if (should_try_to_free_swap(folio, vma, vmf->flags))
 		folio_free_swap(folio);
 	folio_unlock(folio);
@@ -4851,7 +4853,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		 * Hold the lock to avoid the swap entry to be reused
 		 * until we take the PT lock for the pte_same() check
 		 * (to avoid false positives from pte_same). For
-		 * further safety release the lock after the swap_free
+		 * further safety release the lock after the folio_put_swap
 		 * so that the swap count won't change under a
 		 * parallel locked swapcache.
 		 */
diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..d2195ebb4c35 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -83,6 +83,7 @@
 #include <trace/events/migrate.h>
 
 #include "internal.h"
+#include "swap.h"
 
 static struct kmem_cache *anon_vma_cachep;
 static struct kmem_cache *anon_vma_chain_cachep;
@@ -2141,7 +2142,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				goto discard;
 			}
 
-			if (swap_duplicate(entry) < 0) {
+			if (folio_dup_swap(folio, subpage) < 0) {
 				set_pte_at(mm, address, pvmw.pte, pteval);
 				goto walk_abort;
 			}
@@ -2152,7 +2153,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 * so we'll not check/care.
 			 */
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-				swap_free(entry);
+				folio_put_swap(folio, subpage);
 				set_pte_at(mm, address, pvmw.pte, pteval);
 				goto walk_abort;
 			}
@@ -2160,7 +2161,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			/* See folio_try_share_anon_rmap(): clear PTE first. */
 			if (anon_exclusive &&
 			    folio_try_share_anon_rmap_pte(folio, subpage)) {
-				swap_free(entry);
+				folio_put_swap(folio, subpage);
 				set_pte_at(mm, address, pvmw.pte, pteval);
 				goto walk_abort;
 			}
diff --git a/mm/shmem.c b/mm/shmem.c
index e87eff03c08b..0d23c1c12204 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -981,7 +981,7 @@ static long shmem_free_swap(struct address_space *mapping,
 	old = xa_cmpxchg_irq(&mapping->i_pages, index, radswap, NULL, 0);
 	if (old != radswap)
 		return 0;
-	free_swap_and_cache_nr(radix_to_swp_entry(radswap), 1 << order);
+	do_put_swap_entries(radix_to_swp_entry(radswap), 1 << order);
 
 	return 1 << order;
 }
@@ -1663,8 +1663,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 		list_add(&info->swaplist, &shmem_swaplist);
 
 	if (!folio_alloc_swap(folio, __GFP_HIGH | __GFP_NOMEMALLOC | __GFP_NOWARN)) {
+		folio_dup_swap(folio, NULL);
 		shmem_recalc_inode(inode, 0, nr_pages);
-		swap_duplicate_nr(folio->swap, nr_pages);
 		shmem_delete_from_page_cache(folio, swp_to_radix_entry(folio->swap));
 
 		mutex_unlock(&shmem_swaplist_mutex);
@@ -2122,6 +2122,7 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
 
 	nr_pages = folio_nr_pages(folio);
 	folio_wait_writeback(folio);
+	folio_put_swap(folio, NULL);
 	delete_from_swap_cache(folio);
 	/*
 	 * Don't treat swapin error folio as alloced. Otherwise inode->i_blocks
@@ -2129,7 +2130,6 @@ static void shmem_set_folio_swapin_error(struct inode *inode, pgoff_t index,
 	 * in shmem_evict_inode().
 	 */
 	shmem_recalc_inode(inode, -nr_pages, -nr_pages);
-	swap_free_nr(swap, nr_pages);
 }
 
 static int shmem_split_large_entry(struct inode *inode, pgoff_t index,
@@ -2364,9 +2364,9 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	if (sgp == SGP_WRITE)
 		folio_mark_accessed(folio);
 
+	folio_put_swap(folio, NULL);
 	delete_from_swap_cache(folio);
 	folio_mark_dirty(folio);
-	swap_free_nr(swap, nr_pages);
 	put_swap_device(si);
 
 	*foliop = folio;
diff --git a/mm/swap.h b/mm/swap.h
index 2abfb40fc7ec..4c4a71081895 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -142,6 +142,20 @@ extern void __swap_cache_put_entries(struct swap_info_struct *si,
 				     struct swap_cluster_info *ci,
 				     swp_entry_t entry, unsigned int size);
 
+/*
+ * All swap entries starts getting allocated by folio_alloc_swap(),
+ * and the folio will be added to swap cache.
+ *
+ * Swap out (pageout) unmaps a folio and increased the swap table entry
+ * count with folio_dup_swap.
+ *
+ * Swap in maps a folio in swap cache and decrease the swap table entry
+ * count with folio_put_swap.
+ */
+int folio_alloc_swap(struct folio *folio, gfp_t gfp_mask);
+int folio_dup_swap(struct folio *folio, struct page *subpage);
+void folio_put_swap(struct folio *folio, struct page *subpage);
+
 /* linux/mm/page_io.c */
 int sio_pool_init(void);
 struct swap_iocb;
@@ -272,9 +286,24 @@ static inline struct swap_info_struct *swp_info(swp_entry_t entry)
 	return NULL;
 }
 
+static inline int folio_alloc_swap(struct folio *folio, gfp_t gfp)
+{
+	return -EINVAL;
+}
+
+static inline int folio_dup_swap(struct folio *folio, struct page *page)
+{
+	return -EINVAL;
+}
+
+static inline void folio_put_swap(struct folio *folio, struct page *page)
+{
+}
+
 static inline void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
 {
 }
+
 static inline void swap_write_unplug(struct swap_iocb *sio)
 {
 }
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 8909d1655432..daf7810bcb28 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/align.h>
 
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
@@ -58,6 +59,9 @@ static void swap_entries_free(struct swap_info_struct *si,
 			      swp_entry_t entry, unsigned int nr_pages);
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
+static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr);
+static bool swap_entries_put_map(struct swap_info_struct *si,
+				 swp_entry_t entry, int nr);
 static bool folio_swapcache_freeable(struct folio *folio);
 
 static DEFINE_SPINLOCK(swap_lock);
@@ -1236,7 +1240,6 @@ static bool swap_alloc_slow(swp_entry_t *entry,
 /**
  * folio_alloc_swap - allocate swap space for a folio
  * @folio: folio we want to move to swap
- * @gfp: gfp mask for shadow nodes
  *
  * Allocate swap space for the folio and add the folio to the
  * swap cache.
@@ -1286,6 +1289,12 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	if (WARN_ON(swap_cache_add_folio(entry, folio, NULL, false) != folio))
 		goto out_free;
 
+	/*
+	 * Allocator should always allocate aligned entries so folio based
+	 * operations never crossed more than one cluster.
+	 */
+	VM_WARN_ON_ONCE_FOLIO(!IS_ALIGNED(folio->swap.val, size), folio);
+
 	atomic_long_sub(size, &nr_swap_pages);
 	return 0;
 
@@ -1294,6 +1303,57 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	return -ENOMEM;
 }
 
+/*
+ * folio_dup_swap() - Increase ref count of swap entries allocated to a folio.
+ *
+ * @folio: the folio with swap entries allocated.
+ * @subpage: if not NULL, only increase the ref count of this subpage.
+ */
+int folio_dup_swap(struct folio *folio, struct page *subpage)
+{
+	int err = 0;
+	swp_entry_t entry = folio->swap;
+	unsigned long nr_pages = folio_nr_pages(folio);
+
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio), folio);
+
+	if (subpage) {
+		entry.val += folio_page_idx(folio, subpage);
+		nr_pages = 1;
+	}
+
+	while (!err && __swap_duplicate(entry, 1, nr_pages) == -ENOMEM)
+		err = add_swap_count_continuation(entry, GFP_ATOMIC);
+
+	return err;
+}
+
+/*
+ * folio_put_swap() - Decrease ref count of swap entries allocated to a folio.
+ *
+ * @folio: the folio with swap entries allocated.
+ * @subpage: if not NULL, only decrease the ref count of this subpage.
+ *
+ * This won't remove the folio from swap cache, so the swap entry may
+ * still be pinned by the swap cache.
+ */
+void folio_put_swap(struct folio *folio, struct page *subpage)
+{
+	swp_entry_t entry = folio->swap;
+	unsigned long nr_pages = folio_nr_pages(folio);
+
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio), folio);
+
+	if (subpage) {
+		entry.val += folio_page_idx(folio, subpage);
+		nr_pages = 1;
+	}
+
+	swap_entries_put_map(swp_info(entry), entry, nr_pages);
+}
+
 static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
 {
 	struct swap_info_struct *si;
@@ -1538,24 +1598,6 @@ static void swap_entries_free(struct swap_info_struct *si,
  * Caller has made sure that the swap device corresponding to entry
  * is still around or has not been recycled.
  */
-void swap_free_nr(swp_entry_t entry, int nr_pages)
-{
-	int nr;
-	struct swap_info_struct *sis;
-	unsigned long offset = swp_offset(entry);
-
-	sis = _swap_info_get(entry);
-	if (!sis)
-		return;
-
-	while (nr_pages) {
-		nr = min_t(int, nr_pages, SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
-		swap_entries_put_map(sis, swp_entry(sis->type, offset), nr);
-		offset += nr;
-		nr_pages -= nr;
-	}
-}
-
 void __swap_cache_put_entries(struct swap_info_struct *si,
 			      struct swap_cluster_info *ci,
 			      swp_entry_t entry, unsigned int size)
@@ -1751,16 +1793,21 @@ bool folio_free_swap(struct folio *folio)
 }
 
 /**
- * free_swap_and_cache_nr() - Release reference on range of swap entries and
- *                            reclaim their cache if no more references remain.
+ * do_put_swap_entries() - Release reference on range of swap entries and
+ *                      reclaim their cache if no more references remain.
  * @entry: First entry of range.
  * @nr: Number of entries in range.
  *
  * For each swap entry in the contiguous range, release a reference. If any swap
  * entries become free, try to reclaim their underlying folios, if present. The
  * offset range is defined by [entry.offset, entry.offset + nr).
+ *
+ * Context: Called when page table or mapping get released direct without swap
+ * in, caller must ensure the entries won't get completely freed during this
+ * period. For page table releasing, this is protected by page table lock.
+ * For shmem, this is protected by the cmpxchg of the mapping value.
  */
-void free_swap_and_cache_nr(swp_entry_t entry, int nr)
+void do_put_swap_entries(swp_entry_t entry, int nr)
 {
 	const unsigned long start_offset = swp_offset(entry);
 	const unsigned long end_offset = start_offset + nr;
@@ -1769,10 +1816,9 @@ void free_swap_and_cache_nr(swp_entry_t entry, int nr)
 	unsigned long offset;
 
 	si = get_swap_device(entry);
-	if (!si)
+	if (WARN_ON_ONCE(!si))
 		return;
-
-	if (WARN_ON(end_offset > si->max))
+	if (WARN_ON_ONCE(end_offset > si->max))
 		goto out;
 
 	/*
@@ -1816,7 +1862,6 @@ void free_swap_and_cache_nr(swp_entry_t entry, int nr)
 }
 
 #ifdef CONFIG_HIBERNATION
-
 swp_entry_t get_swap_page_of_type(int type)
 {
 	struct swap_info_struct *si = swp_type_get_info(type);
@@ -1841,6 +1886,24 @@ swp_entry_t get_swap_page_of_type(int type)
 	return entry;
 }
 
+/*
+ * Free entries allocated by get_swap_page_of_type, these entries are
+ * exclusive for hibernation.
+ */
+void free_swap_page_of_entry(swp_entry_t entry)
+{
+	struct swap_info_struct *si = swp_info(entry);
+	pgoff_t offset = swp_offset(entry);
+	struct swap_cluster_info *ci;
+	if (!si)
+		return;
+	ci = swap_lock_cluster(si, offset);
+	WARN_ON(swap_count(swap_entry_put_locked(si, ci, entry, 1)));
+	/* It might got added to swap cache accidentally by read ahead */
+	__try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
+	swap_unlock_cluster(ci);
+}
+
 /*
  * Find the swap type that corresponds to given device (if any).
  *
@@ -1995,7 +2058,7 @@ static int unuse_pte(struct vm_area_struct *vma, pmd_t *pmd,
 	/*
 	 * Some architectures may have to restore extra metadata to the page
 	 * when reading from swap. This metadata may be indexed by swap entry
-	 * so this must be called before swap_free().
+	 * so this must be called before folio_put_swap().
 	 */
 	arch_swap_restore(folio_swap(entry, folio), folio);
 
@@ -2036,7 +2099,7 @@ static int unuse_pte(struct vm_area_struct *vma, pmd_t *pmd,
 		new_pte = pte_mkuffd_wp(new_pte);
 setpte:
 	set_pte_at(vma->vm_mm, addr, pte, new_pte);
-	swap_free(entry);
+	folio_put_swap(folio, page);
 out:
 	if (pte)
 		pte_unmap_unlock(pte, ptl);
@@ -3579,27 +3642,23 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 }
 
 /**
- * swap_duplicate_nr() - Increase reference count of nr contiguous swap entries
- *                       by 1.
+ * do_dup_swap_entry() - Increase reference count of a swap entry by one.
  *
  * @entry: first swap entry from which we want to increase the refcount.
- * @nr: Number of entries in range.
  *
  * Returns 0 for success, or -ENOMEM if a swap_count_continuation is required
  * but could not be atomically allocated.  Returns 0, just as if it succeeded,
  * if __swap_duplicate() fails for another reason (-EINVAL or -ENOENT), which
  * might occur if a page table entry has got corrupted.
  *
- * Note that we are currently not handling the case where nr > 1 and we need to
- * add swap count continuation. This is OK, because no such user exists - shmem
- * is the only user that can pass nr > 1, and it never re-duplicates any swap
- * entry it owns.
+ * Context: The caller must ensure the entry won't be completely freed during
+ * the period. Currently this is only used by forking, the page table is locked
+ * to protect the entry from being freed.
  */
-int swap_duplicate_nr(swp_entry_t entry, int nr)
+int do_dup_swap_entry(swp_entry_t entry)
 {
 	int err = 0;
-
-	while (!err && __swap_duplicate(entry, 1, nr) == -ENOMEM)
+	while (!err && __swap_duplicate(entry, 1, 1) == -ENOMEM)
 		err = add_swap_count_continuation(entry, GFP_ATOMIC);
 	return err;
 }
-- 
2.49.0

