Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0D296142
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253887; cv=none; b=rj1HSn4BhIursZVShsfXyZrdTkK7UpgZN0sdF5HaKgKTyWrXoZp3okO5VLtSMRAG+vB3Xf8LFvkCHpg6gkwV9LpZ8AxicU5IQSqEYUtvos7l9q5a32+YLzLsJi2y61l5ezvaN6NrxFXl2TTQ/I15vFxuu9Dy8mBDp7luiR9lqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253887; c=relaxed/simple;
	bh=eDc6ykfNMTUKHC31Bky3Lr0gStl/XgXQt017BQ/1j9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUSeYPDxXfASQ5V99Q7d58VgphGVALy/HfqodOkitqvHN6UjKAG5hI3ymfVTuES8pk31yVdSnSHTxLCgcXaYReXtSvtPRm27phxf45CCgaH5oPS3lJNja4OAWJ9OMfD0Q6NJ4b1d43+223xWfqwoRuPuN9uRiNFPsFbHMEIKNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JETfHp78; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JETfHp78"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30ac24ede15so359513a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253885; x=1747858685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ixabOMMX0yk4n2W1E0UWyzlwsR6Q+qdPVypU0hJK/w8=;
        b=JETfHp78PDuUlEmYJdoFLegJo8A7/ckVYGM2R/WZm5fWI9J2hcGZ+mwQF/hoKZWfH2
         orOLSdcHqREycz0klunVTEovgfdFOSFGEmZ3toS2O1EYu9S4b6LmHXhv/nXYYinmoQCU
         93N6YAq+GU1ta08EMUghD69BXiNPYLNvXuJXUW0HvRkS+3FwoZZ1/dYoQUklVTlHz8M1
         57RkwXP3uSPLzWtJvYZ49DkFwLtbquVFrylIkf2kmm9VHGsqRN5THLvW3MevT7GsV/8G
         cVddDRuq6dDy5X9Cmy0eR1qoiBWlcEHHHDSWI5AQvDWxQohMkDPaBkfjkU+L92Fo1Dj7
         grWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253885; x=1747858685;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixabOMMX0yk4n2W1E0UWyzlwsR6Q+qdPVypU0hJK/w8=;
        b=D5jEvkRFQGJnMG8wRyd5QuQWX7PHPdsBtPa/lM3d95wCHeEQwqPEFV5dJXLe+YCslm
         qsyZFWrctYolnBS+1Yw9m4lMTb/L5HPx10dHHw/De92azBrnfONrw26IF9E6O4wqrAcU
         y+9BPQh6mfuwdB4fi5PnoNnQtUsV8Cn7aYrLgAmn2++gSbIKkbbnWsNsoNpmtFrKgJTU
         G2eYjVkD8il3LONc6eWGJ6z40DjBa5rw5Lm/JJo1LOQEiLF9SQPD1ZB2lRqagmTP5wq+
         dnv6T/TT+PmgGYrHwuk6PvWgXkJrf91Si+i5DBXtJsH8yom+kCUE56QiNNPV+CGt/LiD
         lxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVurpnruDJhfLPYmZiUMwcZ2elpMER6uUpyk8Z6N5tgdRMABCAdu9yRGFjnGuQqbK+7wu40BPk2eAGjLTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDj5T65u+nldsVzS90gQ/ECMsn2uya1hAHPM/yilmKDA3LmsNB
	qhSHSAA/wCgsARMIO+Q9q+aI6lh/2KXCKkAcAndPu+OZd0mQEeHWV8kvZ8aBv0k=
X-Gm-Gg: ASbGncufj4/Op5lJwdOnQF31VUWj1/p4ewqDH2ysfsRo94F6ayWPmdctaMK1nWaqMtR
	Zme14kbV/WqrGIgBU4+VZRVg194pEuP98Aw4M6NLtVx7g+prfNYguq6dvcwEa7Oj50ZLVci2BDl
	salBnq1pVaAh0MPEDvbi14La/ZdLixmbmn/ArCoaJ/oW3I2e1qPXu7cXlF9/9FynNnNYzcfRVdq
	ZQt2pqCDswCB2+uHiOSYNG5/219gGulmw37b5JlhLt1wnf1yFbox2sotogyiEK8rxpB/4b6QjwB
	JXmpAGdKW4i8vLxFnRikxMcQ3YWBmDYZjO2XMdIysJJa6EBgsI0rEUM+dUW/woh671MQHw4J
X-Google-Smtp-Source: AGHT+IGr5HzTLj0l5+TDyHxQfpYlvAcUzlwgK0aNpxveYTHvqgUePc1PWoBsve7OsVOdjaUr/KReqA==
X-Received: by 2002:a17:90a:ec8d:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-30e2e5d1a30mr6983977a91.21.1747253884833;
        Wed, 14 May 2025 13:18:04 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:04 -0700 (PDT)
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
Subject: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
Date: Thu, 15 May 2025 04:17:05 +0800
Message-ID: <20250514201729.48420-6-ryncsn@gmail.com>
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

Swap cache lookup is lock less, the returned folio could be invalidated
any time before locking it. So the caller always have to lock and check
the folio before use.

Introduce a helper for swap cache folio checking, document this convention,
and avoid touching the folio until the folio has been verified.

And update all current users using this convention.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory.c      | 31 ++++++++++++++-----------------
 mm/shmem.c       |  4 ++--
 mm/swap.h        | 21 +++++++++++++++++++++
 mm/swap_state.c  |  8 ++++++--
 mm/swapfile.c    | 10 ++++++++--
 mm/userfaultfd.c |  4 ++++
 6 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 18b5a77a0a4b..254be0e88801 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4568,12 +4568,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		goto out;
 
 	folio = swap_cache_get_folio(entry);
-	if (folio) {
-		swap_update_readahead(folio, vma, vmf->address);
-		page = folio_file_page(folio, swp_offset(entry));
-	}
 	swapcache = folio;
-
 	if (!folio) {
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
 		    __swap_count(entry) == 1) {
@@ -4642,20 +4637,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		ret = VM_FAULT_MAJOR;
 		count_vm_event(PGMAJFAULT);
 		count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
-		page = folio_file_page(folio, swp_offset(entry));
-	} else if (PageHWPoison(page)) {
-		/*
-		 * hwpoisoned dirty swapcache pages are kept for killing
-		 * owner processes (which may be unknown at hwpoison time)
-		 */
-		ret = VM_FAULT_HWPOISON;
-		goto out_release;
 	}
 
 	ret |= folio_lock_or_retry(folio, vmf);
 	if (ret & VM_FAULT_RETRY)
 		goto out_release;
 
+	page = folio_file_page(folio, swp_offset(entry));
 	if (swapcache) {
 		/*
 		 * Make sure folio_free_swap() or swapoff did not release the
@@ -4664,10 +4652,20 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		 * swapcache, we need to check that the page's swap has not
 		 * changed.
 		 */
-		if (unlikely(!folio_test_swapcache(folio) ||
-			     page_swap_entry(page).val != entry.val))
+		if (!folio_swap_contains(folio, entry))
 			goto out_page;
 
+		if (PageHWPoison(page)) {
+			/*
+			 * hwpoisoned dirty swapcache pages are kept for killing
+			 * owner processes (which may be unknown at hwpoison time)
+			 */
+			ret = VM_FAULT_HWPOISON;
+			goto out_page;
+		}
+
+		swap_update_readahead(folio, vma, vmf->address);
+
 		/*
 		 * KSM sometimes has to copy on read faults, for example, if
 		 * page->index of !PageKSM() pages would be nonlinear inside the
@@ -4682,8 +4680,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			ret = VM_FAULT_HWPOISON;
 			folio = swapcache;
 			goto out_page;
-		}
-		if (folio != swapcache)
+		} else if (folio != swapcache)
 			page = folio_page(folio, 0);
 
 		/*
diff --git a/mm/shmem.c b/mm/shmem.c
index 01f29cb31c7a..43d9e3bf16f4 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2260,8 +2260,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap);
-	if (folio)
-		swap_update_readahead(folio, NULL, 0);
 	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
 		bool fallback_order0 = false;
@@ -2362,6 +2360,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		error = -EEXIST;
 		goto unlock;
 	}
+	if (!skip_swapcache)
+		swap_update_readahead(folio, NULL, 0);
 	if (!folio_test_uptodate(folio)) {
 		error = -EIO;
 		goto failed;
diff --git a/mm/swap.h b/mm/swap.h
index e83109ad1456..34af06bf6fa4 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -50,6 +50,22 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
 	return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
 }
 
+/*
+ * Check if a folio still contains a swap entry, must be called after a
+ * swap cache lookup as the folio might have been invalidated while
+ * it's unlocked.
+ */
+static inline bool folio_swap_contains(struct folio *folio, swp_entry_t entry)
+{
+	pgoff_t index = swp_offset(entry);
+	VM_WARN_ON_ONCE(!folio_test_locked(folio));
+	if (unlikely(!folio_test_swapcache(folio)))
+		return false;
+	if (unlikely(swp_type(entry) != swp_type(folio->swap)))
+		return false;
+	return (index - swp_offset(folio->swap)) < folio_nr_pages(folio);
+}
+
 void show_swap_cache_info(void);
 void *get_shadow_from_swap_cache(swp_entry_t entry);
 int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
@@ -123,6 +139,11 @@ static inline pgoff_t swap_cache_index(swp_entry_t entry)
 	return 0;
 }
 
+static inline bool folio_swap_contains(struct folio *folio, swp_entry_t entry)
+{
+	return false;
+}
+
 static inline void show_swap_cache_info(void)
 {
 }
diff --git a/mm/swap_state.c b/mm/swap_state.c
index bca201100138..07c41676486a 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -170,7 +170,8 @@ void __delete_from_swap_cache(struct folio *folio,
  * Lookup a swap entry in the swap cache. A found folio will be returned
  * unlocked and with its refcount incremented.
  *
- * Caller must hold a reference on the swap device.
+ * Caller must hold a reference of the swap device, and check if the
+ * returned folio is still valid after locking it (e.g. folio_swap_contains).
  */
 struct folio *swap_cache_get_folio(swp_entry_t entry)
 {
@@ -339,7 +340,10 @@ struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 	for (;;) {
 		int err;
 
-		/* Check the swap cache in case the folio is already there */
+		/*
+		 * Check the swap cache first, if a cached folio is found,
+		 * return it unlocked. The caller will lock and check it.
+		 */
 		folio = swap_cache_get_folio(entry);
 		if (folio)
 			goto got_folio;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 29e918102355..aa031fd27847 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -240,12 +240,12 @@ static int __try_to_reclaim_swap(struct swap_info_struct *si,
 	 * Offset could point to the middle of a large folio, or folio
 	 * may no longer point to the expected offset before it's locked.
 	 */
-	entry = folio->swap;
-	if (offset < swp_offset(entry) || offset >= swp_offset(entry) + nr_pages) {
+	if (!folio_swap_contains(folio, entry)) {
 		folio_unlock(folio);
 		folio_put(folio);
 		goto again;
 	}
+	entry = folio->swap;
 	offset = swp_offset(entry);
 
 	need_reclaim = ((flags & TTRS_ANYWAY) ||
@@ -2117,6 +2117,12 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 		}
 
 		folio_lock(folio);
+		if (!folio_swap_contains(folio, entry)) {
+			folio_unlock(folio);
+			folio_put(folio);
+			continue;
+		}
+
 		folio_wait_writeback(folio);
 		ret = unuse_pte(vma, pmd, addr, entry, folio);
 		if (ret < 0) {
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index e5a0db7f3331..5b4f01aecf35 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 				goto retry;
 			}
 		}
+		if (!folio_swap_contains(src_folio, entry)) {
+			err = -EBUSY;
+			goto out;
+		}
 		err = move_swap_pte(mm, dst_vma, dst_addr, src_addr, dst_pte, src_pte,
 				orig_dst_pte, orig_src_pte, dst_pmd, dst_pmdval,
 				dst_ptl, src_ptl, src_folio);
-- 
2.49.0

