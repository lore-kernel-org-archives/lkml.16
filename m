Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A61297120
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253924; cv=none; b=qkeJaYLd+Lepi0k3WOxd9Xg0Lebb4XE3pXE9bwid3Vp07stsG+BqEDLRh5iy2gBFmhBY9LfYXbVhaXK0RXyDUodzX0KOSqlH1zqPVXUkHYHk+I170d7I0lCoXVedBWhbObK69YcZw2dgBd+wHs3Mwu+BiBo8oPloHqb4+q7Qodw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253924; c=relaxed/simple;
	bh=mp1LxQP81YyhX2madMjp+w9ybBsdPInayYc7LRb9GO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSAPg4N3F88I3YPp7V5pghIopQWi2p8NQq40pQFKJfmMQP8XrvwmJepjJ4+CgjMXoYqQd9FNf82XaRpNgWzxjEZCs693UznScDfPALcvjWF2ZjadqlEayUMbnXNlj5UO+suJ9C5RqsFxItTPn7flVBfuX6Tzj+OaeJBYUc+HIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGo7tQfq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGo7tQfq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30a8cfa713fso234075a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253921; x=1747858721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aiUQ9PqOfEtp93nyVYgzpjg1vss1BLVfY/NVAKlO77E=;
        b=VGo7tQfq15hlPy/UeuxQ7W3HKzKvBGBwv0ywoczwWUrZOGI9GOkgPS5ujifN6TMZn5
         k18FcZl0hC+m1iNr8xmy+/ITdl6D4TNjs8AwKqrr0euIPnPln3Zn3yrZvSYEaGYfDvfO
         ulaukr3vuMv5dPZ2ozC8z0K0Usa01CMlLUxbRDK6Iv9hneAxmNbWN9jBZljlLOzOeUVt
         CQsin31x040U/uhz0Z5wWeKv0texSr8+7M1JzSFywSm03L9Wy/CtDKvxnn+//c1706Co
         1XxCRurz/6oojdYxdKLbpS0re2Mui6YI/Ord02NVJ4Dfsa7S2p2SkwqRWyLm6UuxTuct
         oYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253921; x=1747858721;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aiUQ9PqOfEtp93nyVYgzpjg1vss1BLVfY/NVAKlO77E=;
        b=daIdUPMJkBq31VuEJxiugS1ogGmCMkcvARDTWXyIXZNrVC4qNeIO3ARS4Pi30tdU6L
         v7OYaEkpCdBuUQvAN1mul2uWGAu+gbbRnJ0E+2v08vumLEIPp9QU9ZebCHHzhxHdUuEc
         D6pw+FhMS4DBgPXUtax7VNu65tGEcIZWX1QX4lbQaF+9Zhkol22xum+wpnPX9QeHUdc4
         /ielh50Rw7HnL5hCDH5baoQ15PSrRqslqYf+m4FyoSj5gxyqNUF29vZse/0YAu7f+l4D
         KSYpUM4BB08wQffwl89bjtTse76PQSM1/RBvJTrBwF7CrEERy7gAwoo2JJBCMALiy6cJ
         hLFA==
X-Forwarded-Encrypted: i=1; AJvYcCVpCF2oIDQjTmK0WNb2bp1jP8GwqYrvUp5ZUsbd76iJsiDlpMcGiGXgPVZ2U26eknmTb7PaYGcidUuSfGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOg3J2mjgqmAlQS77fcaClQEDrYZNPQGWO4qta3jgOwUdxVwNy
	3iVGJS/QFDHpyGHB49MfdXhLCAMgwe1BTUIW21i/l0fvaAqB2Xzm
X-Gm-Gg: ASbGnctad5vr8uTZ/cbekSsg8Q7GwLIpEfHfTGOu5l2Zp44ue48UwgnEWpxNyql07sC
	6BPy4QURzDv47W6WCjVm1Ody1WdA338MXae5b+Wi8FFbhXHVRvoYtBCwuRDktJLi6lPis5ExMqd
	zjBlvqEPMUH6HT8TjqoZmXplCDmAnpe/CzSthDLX88KgoLWvu7KJpI64MGBy9PM7Gu+9UfOP41s
	5rD2IQ3sMfxfFWRgB6+7JuElD30tAopvckY8aWZk3DgKl463OQqSrcZDkGnSw5ccGrjtOJIIctP
	VDlpYdrmsWvvCNk9nx4O+3pV/R/fnGiL+B+1Tg8MadRkekmaj+S3UltvaIYqkGbPuuEPxjSE
X-Google-Smtp-Source: AGHT+IGvH9jLMKR0M1op815hSr4ZkZA5KXjzJ3aSP8fvHNJ42h/Yem6xI+4PpRaquMBrZbGOn97BxA==
X-Received: by 2002:a17:90a:e7c6:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-30e2e65e722mr7436493a91.25.1747253921261;
        Wed, 14 May 2025 13:18:41 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:40 -0700 (PDT)
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
Subject: [PATCH 12/28] mm, swap: never bypass the swap cache for SWP_SYNCHRONOUS_IO
Date: Thu, 15 May 2025 04:17:12 +0800
Message-ID: <20250514201729.48420-13-ryncsn@gmail.com>
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

Now the overhead of the swap cache is trivial to none, bypassing the
swap cache is no longer a valid optimization.

This commit is more than code simplification, it changes the swap in
behaviour in multiple ways:

We used to rely on `SWP_SYNCHRONOUS_IO && __swap_count(entry) == 1` as
The indicator to bypass the swap cache and read ahead, in many workload
bypassing read ahead is the more helpful part for SWP_SYNCHRONOUS_IO
devices as they have extreme low latency the read ahead isn't helpful.

The `SWP_SYNCHRONOUS_IO && __swap_count(entry) == 1` is not a good
indicator in the first place: obviously, read ahead has nothing to do with
swap count, that's more of a workaround due to the limitation of current
implementation that read ahead bypassing is strictly coupled with swap
cache bypassing. Swap count > 1 can't bypass the swap cache because that
will result in redundant IO or wasted CPU time.

So the first change with this commit is that read ahead is now always
disabled for SWP_SYNCHRONOUS_IO devices, this is a good thing as these
devices have extreme low latency, and queued IO do not affect them
(ZRAM, RAMDISK), so read ahead isn't helpful.

The second thing here is that this enabled mTHP swap in for all faults on
SWP_SYNCHRONOUS_IO devices. Previously, the mTHP swap is also coupled with
swap cache bypassing. But again clearly, it doesn't make much sense that
mTHP's ref count affects its swap in behavior.

And to catch potential issues with mTHP swap in, especially with page
exclusiveness, more debug sanity checks and comments are added. But the
code is still simpler with reduced LOC.

For a real mTHP workload, this may cause more serious thrashing, this isn't
a problem with this commit but a generic mTHP issue. For a 4K workload,
this commit boosts the performance:

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory.c | 267 +++++++++++++++++++++++-----------------------------
 1 file changed, 116 insertions(+), 151 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 1b6e192de6ec..0b41d15c6d7a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -87,6 +87,7 @@
 #include <asm/tlbflush.h>
 
 #include "pgalloc-track.h"
+#include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
 
@@ -4477,7 +4478,33 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static DECLARE_WAIT_QUEUE_HEAD(swapcache_wq);
+/* Check if a folio should be exclusive, with sanity tests */
+static bool check_swap_exclusive(struct folio *folio, swp_entry_t entry,
+				 pte_t *ptep, unsigned int fault_nr)
+{
+	pgoff_t offset = swp_offset(entry);
+	struct page *page = folio_file_page(folio, offset);
+
+	if (!pte_swp_exclusive(ptep_get(ptep)))
+		return false;
+
+	/* For exclusive swapin, it must not be mapped */
+	if (fault_nr == 1)
+		VM_WARN_ON_ONCE_PAGE(atomic_read(&page->_mapcount) != -1, page);
+	else
+		VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
+	/*
+	 * Check if swap count is consistent with exclusiveness. The folio
+	 * and PTL lock keeps the swap count stable.
+	 */
+	if (IS_ENABLED(CONFIG_VM_DEBUG)) {
+		for (int i = 0; i < fault_nr; i++) {
+			VM_WARN_ON_FOLIO(__swap_count(entry) != 1, folio);
+			entry.val++;
+		}
+	}
+	return true;
+}
 
 /*
  * We enter with non-exclusive mmap_lock (to exclude vma changes,
@@ -4490,17 +4517,14 @@ static DECLARE_WAIT_QUEUE_HEAD(swapcache_wq);
 vm_fault_t do_swap_page(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct folio *swapcache, *folio = NULL;
-	DECLARE_WAITQUEUE(wait, current);
+	struct folio *swapcache = NULL, *folio;
 	struct page *page;
 	struct swap_info_struct *si = NULL;
 	rmap_t rmap_flags = RMAP_NONE;
-	bool need_clear_cache = false;
 	bool exclusive = false;
 	swp_entry_t entry;
 	pte_t pte;
 	vm_fault_t ret = 0;
-	void *shadow = NULL;
 	int nr_pages;
 	unsigned long page_idx;
 	unsigned long address;
@@ -4571,56 +4595,18 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	folio = swap_cache_get_folio(entry);
 	swapcache = folio;
 	if (!folio) {
-		if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
-		    __swap_count(entry) == 1) {
-			/* skip swapcache */
+		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			folio = alloc_swap_folio(vmf);
 			if (folio) {
-				__folio_set_locked(folio);
-				__folio_set_swapbacked(folio);
-
-				nr_pages = folio_nr_pages(folio);
-				if (folio_test_large(folio))
-					entry.val = ALIGN_DOWN(entry.val, nr_pages);
-				/*
-				 * Prevent parallel swapin from proceeding with
-				 * the cache flag. Otherwise, another thread
-				 * may finish swapin first, free the entry, and
-				 * swapout reusing the same entry. It's
-				 * undetectable as pte_same() returns true due
-				 * to entry reuse.
-				 */
-				if (swapcache_prepare(entry, nr_pages)) {
-					/*
-					 * Relax a bit to prevent rapid
-					 * repeated page faults.
-					 */
-					add_wait_queue(&swapcache_wq, &wait);
-					schedule_timeout_uninterruptible(1);
-					remove_wait_queue(&swapcache_wq, &wait);
-					goto out_page;
-				}
-				need_clear_cache = true;
-
-				memcg1_swapin(entry, nr_pages);
-
-				shadow = swap_cache_get_shadow(entry);
-				if (shadow)
-					workingset_refault(folio, shadow);
-
-				folio_add_lru(folio);
-
-				/* To provide entry to swap_read_folio() */
-				folio->swap = entry;
-				swap_read_folio(folio, NULL);
-				folio->private = NULL;
+				swapcache = swapin_entry(entry, folio);
+				if (swapcache != folio)
+					folio_put(folio);
 			}
 		} else {
-			folio = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
-						vmf);
-			swapcache = folio;
+			swapcache = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE, vmf);
 		}
 
+		folio = swapcache;
 		if (!folio) {
 			/*
 			 * Back out if somebody else faulted in this pte
@@ -4644,57 +4630,56 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (ret & VM_FAULT_RETRY)
 		goto out_release;
 
+	/*
+	 * Make sure folio_free_swap() or swapoff did not release the
+	 * swapcache from under us.  The page pin, and pte_same test
+	 * below, are not enough to exclude that.  Even if it is still
+	 * swapcache, we need to check that the page's swap has not
+	 * changed.
+	 */
+	if (!folio_swap_contains(folio, entry))
+		goto out_page;
 	page = folio_file_page(folio, swp_offset(entry));
-	if (swapcache) {
-		/*
-		 * Make sure folio_free_swap() or swapoff did not release the
-		 * swapcache from under us.  The page pin, and pte_same test
-		 * below, are not enough to exclude that.  Even if it is still
-		 * swapcache, we need to check that the page's swap has not
-		 * changed.
-		 */
-		if (!folio_swap_contains(folio, entry))
-			goto out_page;
 
-		if (PageHWPoison(page)) {
-			/*
-			 * hwpoisoned dirty swapcache pages are kept for killing
-			 * owner processes (which may be unknown at hwpoison time)
-			 */
-			ret = VM_FAULT_HWPOISON;
-			goto out_page;
-		}
-
-		swap_update_readahead(folio, vma, vmf->address);
+	/*
+	 * hwpoisoned dirty swapcache pages are kept for killing
+	 * owner processes (which may be unknown at hwpoison time)
+	 */
+	if (PageHWPoison(page)) {
+		ret = VM_FAULT_HWPOISON;
+		goto out_page;
+	}
 
-		/*
-		 * KSM sometimes has to copy on read faults, for example, if
-		 * page->index of !PageKSM() pages would be nonlinear inside the
-		 * anon VMA -- PageKSM() is lost on actual swapout.
-		 */
-		folio = ksm_might_need_to_copy(folio, vma, vmf->address);
-		if (unlikely(!folio)) {
-			ret = VM_FAULT_OOM;
-			folio = swapcache;
-			goto out_page;
-		} else if (unlikely(folio == ERR_PTR(-EHWPOISON))) {
-			ret = VM_FAULT_HWPOISON;
-			folio = swapcache;
-			goto out_page;
-		} else if (folio != swapcache)
-			page = folio_page(folio, 0);
+	swap_update_readahead(folio, vma, vmf->address);
 
-		/*
-		 * If we want to map a page that's in the swapcache writable, we
-		 * have to detect via the refcount if we're really the exclusive
-		 * owner. Try removing the extra reference from the local LRU
-		 * caches if required.
-		 */
-		if ((vmf->flags & FAULT_FLAG_WRITE) && folio == swapcache &&
-		    !folio_test_ksm(folio) && !folio_test_lru(folio))
-			lru_add_drain();
+	/*
+	 * KSM sometimes has to copy on read faults, for example, if
+	 * page->index of !PageKSM() pages would be nonlinear inside the
+	 * anon VMA -- PageKSM() is lost on actual swapout.
+	 */
+	folio = ksm_might_need_to_copy(folio, vma, vmf->address);
+	if (unlikely(!folio)) {
+		ret = VM_FAULT_OOM;
+		folio = swapcache;
+		goto out_page;
+	} else if (unlikely(folio == ERR_PTR(-EHWPOISON))) {
+		ret = VM_FAULT_HWPOISON;
+		folio = swapcache;
+		goto out_page;
+	} else if (folio != swapcache) {
+		page = folio_file_page(folio, swp_offset(entry));
 	}
 
+	/*
+	 * If we want to map a page that's in the swapcache writable, we
+	 * have to detect via the refcount if we're really the exclusive
+	 * owner. Try removing the extra reference from the local LRU
+	 * caches if required.
+	 */
+	if ((vmf->flags & FAULT_FLAG_WRITE) && folio == swapcache &&
+	    !folio_test_ksm(folio) && !folio_test_lru(folio))
+		lru_add_drain();
+
 	folio_throttle_swaprate(folio, GFP_KERNEL);
 
 	/*
@@ -4710,44 +4695,41 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		goto out_nomap;
 	}
 
-	/* allocated large folios for SWP_SYNCHRONOUS_IO */
-	if (folio_test_large(folio) && !folio_test_swapcache(folio)) {
-		unsigned long nr = folio_nr_pages(folio);
-		unsigned long folio_start = ALIGN_DOWN(vmf->address, nr * PAGE_SIZE);
-		unsigned long idx = (vmf->address - folio_start) / PAGE_SIZE;
-		pte_t *folio_ptep = vmf->pte - idx;
-		pte_t folio_pte = ptep_get(folio_ptep);
-
-		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
-		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
-			goto out_nomap;
-
-		page_idx = idx;
-		address = folio_start;
-		ptep = folio_ptep;
-		goto check_folio;
-	}
-
 	nr_pages = 1;
 	page_idx = 0;
 	address = vmf->address;
 	ptep = vmf->pte;
 
-	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
+	if (folio_test_large(folio)) {
 		unsigned long nr = folio_nr_pages(folio);
 		unsigned long idx = folio_page_idx(folio, page);
-		unsigned long folio_address = address - idx * PAGE_SIZE;
+		unsigned long folio_address = vmf->address - idx * PAGE_SIZE;
 		pte_t *folio_ptep = vmf->pte - idx;
 
-		if (!can_swapin_thp(vmf, folio_ptep, folio_address, nr))
+		if (can_swapin_thp(vmf, folio_ptep, folio_address, nr)) {
+			page_idx = idx;
+			address = folio_address;
+			ptep = folio_ptep;
+			nr_pages = nr;
+			entry = folio->swap;
+			page = &folio->page;
 			goto check_folio;
-
-		page_idx = idx;
-		address = folio_address;
-		ptep = folio_ptep;
-		nr_pages = nr;
-		entry = folio->swap;
-		page = &folio->page;
+		}
+		/*
+		 * If it's a fresh large folio in the swap cache but the
+		 * page table supporting it is gone, drop it and fallback
+		 * to order 0 swap in again.
+		 *
+		 * The folio must be clean, nothing should have touched
+		 * it, shmem removes the folio from swap cache upon
+		 * swapin, and anon flag won't be gone once set.
+		 * TODO: We might want to split or partially map it.
+		 */
+		if (!folio_test_anon(folio)) {
+			WARN_ON_ONCE(folio_test_dirty(folio));
+			delete_from_swap_cache(folio);
+			goto out_nomap;
+		}
 	}
 
 check_folio:
@@ -4767,7 +4749,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	 * the swap entry concurrently) for certainly exclusive pages.
 	 */
 	if (!folio_test_ksm(folio)) {
-		exclusive = pte_swp_exclusive(vmf->orig_pte);
+		exclusive = check_swap_exclusive(folio, entry, ptep, nr_pages);
 		if (folio != swapcache) {
 			/*
 			 * We have a fresh page that is not exposed to the
@@ -4805,15 +4787,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	 */
 	arch_swap_restore(folio_swap(entry, folio), folio);
 
-	/*
-	 * Remove the swap entry and conditionally try to free up the swapcache.
-	 * We're already holding a reference on the page but haven't mapped it
-	 * yet.
-	 */
-	swap_free_nr(entry, nr_pages);
-	if (should_try_to_free_swap(folio, vma, vmf->flags))
-		folio_free_swap(folio);
-
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, nr_pages);
 	add_mm_counter(vma->vm_mm, MM_SWAPENTS, -nr_pages);
 	pte = mk_pte(page, vma->vm_page_prot);
@@ -4849,14 +4822,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
 		folio_add_lru_vma(folio, vma);
 	} else if (!folio_test_anon(folio)) {
-		/*
-		 * We currently only expect small !anon folios which are either
-		 * fully exclusive or fully shared, or new allocated large
-		 * folios which are fully exclusive. If we ever get large
-		 * folios within swapcache here, we have to be careful.
-		 */
-		VM_WARN_ON_ONCE(folio_test_large(folio) && folio_test_swapcache(folio));
-		VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+		VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != nr_pages, folio);
+		VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
 		folio_add_new_anon_rmap(folio, vma, address, rmap_flags);
 	} else {
 		folio_add_anon_rmap_ptes(folio, page, nr_pages, vma, address,
@@ -4869,7 +4836,16 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	arch_do_swap_page_nr(vma->vm_mm, vma, address,
 			pte, pte, nr_pages);
 
+	/*
+	 * Remove the swap entry and conditionally try to free up the
+	 * swapcache then unlock the folio. Do this after the PTEs are
+	 * set, so raced faults will see updated PTEs.
+	 */
+	swap_free_nr(entry, nr_pages);
+	if (should_try_to_free_swap(folio, vma, vmf->flags))
+		folio_free_swap(folio);
 	folio_unlock(folio);
+
 	if (folio != swapcache && swapcache) {
 		/*
 		 * Hold the lock to avoid the swap entry to be reused
@@ -4896,12 +4872,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (vmf->pte)
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
 out:
-	/* Clear the swap cache pin for direct swapin after PTL unlock */
-	if (need_clear_cache) {
-		swapcache_clear(si, entry, nr_pages);
-		if (waitqueue_active(&swapcache_wq))
-			wake_up(&swapcache_wq);
-	}
 	if (si)
 		put_swap_device(si);
 	return ret;
@@ -4916,11 +4886,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		folio_unlock(swapcache);
 		folio_put(swapcache);
 	}
-	if (need_clear_cache) {
-		swapcache_clear(si, entry, nr_pages);
-		if (waitqueue_active(&swapcache_wq))
-			wake_up(&swapcache_wq);
-	}
 	if (si)
 		put_swap_device(si);
 	return ret;
-- 
2.49.0

