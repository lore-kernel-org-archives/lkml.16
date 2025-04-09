Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC13DDBC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159797; cv=none; b=bYLLNR/4nSYtUfndqbI6/0PR0l8VWUI8aHNkn4Uo9ZCkczSHqPHb7dPXnm43/pB01rX+7ZRFWTm6u7oIScDvHj2V118EjmrCQGE7i234xPj1690wtkcE2VUFanumwVMD2sDGCyKbf4T2lORJriHF9cR4TRuSxUt3C5M+3ZNjukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159797; c=relaxed/simple;
	bh=/S3vEfgFVzgqjs69ciyPa6bRZy6mzy83edTzygOfpec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqEOxilVQFZgkHw/iTa6ZkgdOYmANZV8ObKsyroTz5hvXeqZ6ViyI5xcc63qUz3m90Z939duW/Lc+ZkPARblMHpdz7wNt2HRGP4GRZFYzMfUAwcYwk9wWgzqOaGweXTbzGus2tuTPXhbD41bpv2uwU43A24dv2Kgy78VODl3kLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNucMMRy; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNucMMRy"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so6025331b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744159795; x=1744764595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7G/nL+E0ra61lI3tdF3zYfv1YB2yV4HL4zwUyVPiH7k=;
        b=nNucMMRyctLldZTr46nO1rM40yTfBQBGpI37q99G5R7+wSJrC0wa5wXhL1Du5A7v92
         eJXUKq/+Fh/2FUTGXJ62WXZE4ZhsmI9tVe+FhRoDIJPVPMT2mcrPaun8UMHwoANmyKTY
         zdxH2yWnD5qagZJuwdAjKLRyi/AkwHAbweYIANbw8iTrI5NANwPSnJ+eMHnpLddauDgR
         +vOTuOUTIuodb/3QVMnfwqZlLvzzpPuaaZsSFV6mBw6u7LSIZP3ndbmtjFRDRPIW/fZE
         ywx8wr1Bcb5bnF07d5TlVHaNCT6jQoy/UwGoQ71ASJYCP0lWsN/nkSOg1D6OWDAKGUNZ
         8lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744159795; x=1744764595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7G/nL+E0ra61lI3tdF3zYfv1YB2yV4HL4zwUyVPiH7k=;
        b=o3VIkkIxRLi85TvTHeF3klo+oJs+ubxra4hZHTlX776xVDwufF6kRHPg5qJ36IhwTE
         hwqBDojO5/8fSpPhNYRtrW3etTu2e1Sth9UeGvuLJ4W4JhdnrAGplv/Bms/QjMUPHwBu
         RkeM9obfvWOpFOleZ+dxUIMSkf31b87BNMM107JCKk/EocTcBhv/JAoLQLKH2G6MfuiB
         wTepREJPOL3TmOevXHmaJaxUVGJnz6HvcWvefXKNnCuJw4lVYwmRIGNmNV22z3wpzJ1y
         TfuECE/7Wj4GYGEXSYDmFpPT5q/lD6bX8kabAVvypQbKVJCQQgFL48sH69wtbUxcRKVF
         kZww==
X-Forwarded-Encrypted: i=1; AJvYcCVJEFtBXpbrXgRpHA2Ei04bgXWQT8oUWAImLOWRsjFRztLho2a7iLKOEZE/7FA0MWHIqFYzT/ykyn3IxG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYEnYGsLqxcXxSJ5w8+Ph1HM4E7HOXVSPycbVgtohOdDr1+sHU
	t8qf0kh8nSELhDv7WOz6W9pOVhQC+COPJ6RlvDVDWuX1CEox6UkX
X-Gm-Gg: ASbGncsF7qjALWkaaoYHfgsaEc0/AKsXETwqFT5mH/cndPrtcCV6uqAPg+BKyJNQlZu
	+z9mR19rLEigr059K/kO2wk1Vtktfn0ckeA8/q4clSPPuHFVWmMe9gnOZvCIsF3zChJprA46tej
	jeUJ93HbDgcwlAQgk0ZJPOjr6JFoSPWQaLcAEtzcSqSUD+5I7DURP0uDDEoVDznpAcqZ+xRRRuY
	I9xfuzUD4oxlvCkaYzZyTrR0qi//lfo342wDKs+8odHlrcykb7qU3d9EyuGow2JDiJ6oJcUApLk
	+ttDXHqhKT3nR4u/NfJPnK3cmMoDBKePVdaxIUF3HNVqQjajoJto22NjBfEOx/cTtM4V8TSf
X-Google-Smtp-Source: AGHT+IGEdIyateeJKK+cEnxnAwcvYJz3jJvpDqxNVsJ+6JMRmcHpvaE/vSgiRnahObph/rC+eZugLQ==
X-Received: by 2002:a05:6a00:80d:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-73bafa2fdaamr566858b3a.0.1744159794573;
        Tue, 08 Apr 2025 17:49:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2ae5fsm9565b3a.20.2025.04.08.17.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 17:49:54 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH] mm/hugetlb: Convert &folio->page to folio_page(folio, 0)
Date: Tue,  8 Apr 2025 17:49:10 -0700
Message-ID: <20250409004937.634713-1-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

Convert the use of &folio->page to folio_page(folio, 0) where struct
filio fits in. This is part of the efforts to move some fields out of
struct page to reduce its size.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 mm/huge_memory.c     | 30 +++++++++++++++++-------------
 mm/hugetlb.c         | 20 +++++++++++---------
 mm/hugetlb_vmemmap.c | 12 ++++++------
 mm/khugepaged.c      | 17 ++++++++++-------
 4 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 28c87e0e036f..4c91fc594b6c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1492,7 +1492,7 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 	ptl = pmd_lock(mm, vmf->pmd);
 	if (pmd_none(*vmf->pmd)) {
 		folio_get(folio);
-		folio_add_file_rmap_pmd(folio, &folio->page, vma);
+		folio_add_file_rmap_pmd(folio, folio_page(folio, 0), vma);
 		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
 	}
 	error = insert_pfn_pmd(vma, addr, vmf->pmd,
@@ -1620,7 +1620,7 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 	 */
 	if (pud_none(*vmf->pud)) {
 		folio_get(folio);
-		folio_add_file_rmap_pud(folio, &folio->page, vma);
+		folio_add_file_rmap_pud(folio, folio_page(folio, 0), vma);
 		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
 	}
 	insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)),
@@ -2262,8 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		}
 
 		spin_unlock(ptl);
-		if (flush_needed)
-			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
+		if (flush_needed) {
+			tlb_remove_page_size(tlb, folio_page(folio, 0),
+					     HPAGE_PMD_SIZE);
+		}
 	}
 	return 1;
 }
@@ -2630,7 +2632,7 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 	}
 	if (src_folio) {
 		if (folio_maybe_dma_pinned(src_folio) ||
-		    !PageAnonExclusive(&src_folio->page)) {
+		    !PageAnonExclusive(folio_page(src_folio, 0))) {
 			err = -EBUSY;
 			goto unlock_ptls;
 		}
@@ -3316,7 +3318,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 	 * the flags from the original folio.
 	 */
 	for (i = new_nr_pages; i < nr_pages; i += new_nr_pages) {
-		struct page *new_head = &folio->page + i;
+		struct page *new_head = folio_page(folio, i);
 
 		/*
 		 * Careful: new_folio is not a "real" folio before we cleared PageTail.
@@ -3403,7 +3405,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 	if (new_order)
 		folio_set_order(folio, new_order);
 	else
-		ClearPageCompound(&folio->page);
+		ClearPageCompound(folio_page(folio, 0));
 }
 
 /*
@@ -3528,7 +3530,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		}
 
 		folio_split_memcg_refs(folio, old_order, split_order);
-		split_page_owner(&folio->page, old_order, split_order);
+		split_page_owner(folio_page(folio, 0), old_order, split_order);
 		pgalloc_tag_split(folio, old_order, split_order);
 
 		__split_folio_to_order(folio, old_order, split_order);
@@ -3640,7 +3642,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		 * requires taking the lru_lock so we do the put_page
 		 * of the tail pages after the split is complete.
 		 */
-		free_page_and_swap_cache(&new_folio->page);
+		free_page_and_swap_cache(folio_page(new_folio, 0));
 	}
 	return ret;
 }
@@ -3971,7 +3973,8 @@ int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
 {
 	struct folio *folio = page_folio(page);
 
-	return __folio_split(folio, new_order, &folio->page, page, list, true);
+	return __folio_split(folio, new_order, folio_page(folio, 0), page,
+			     list, true);
 }
 
 /*
@@ -3999,8 +4002,8 @@ int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
 int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
-	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			false);
+	return __folio_split(folio, new_order, split_at, folio_page(folio, 0),
+			     list, false);
 }
 
 int min_order_for_split(struct folio *folio)
@@ -4024,7 +4027,8 @@ int split_folio_to_list(struct folio *folio, struct list_head *list)
 	if (ret < 0)
 		return ret;
 
-	return split_huge_page_to_list_to_order(&folio->page, list, ret);
+	return split_huge_page_to_list_to_order(folio_page(folio, 0), list,
+						ret);
 }
 
 /*
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 73417bea33f5..efbf5013986e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1306,7 +1306,7 @@ static struct folio *dequeue_hugetlb_folio_node_exact(struct hstate *h,
 		if (folio_test_hwpoison(folio))
 			continue;
 
-		if (is_migrate_isolate_page(&folio->page))
+		if (is_migrate_isolate_page(folio_page(folio, 0)))
 			continue;
 
 		list_move(&folio->lru, &h->hugepage_activelist);
@@ -1840,7 +1840,7 @@ void free_huge_folio(struct folio *folio)
 
 	hugetlb_set_folio_subpool(folio, NULL);
 	if (folio_test_anon(folio))
-		__ClearPageAnonExclusive(&folio->page);
+		__ClearPageAnonExclusive(folio_page(folio, 0));
 	folio->mapping = NULL;
 	restore_reserve = folio_test_hugetlb_restore_reserve(folio);
 	folio_clear_hugetlb_restore_reserve(folio);
@@ -4050,7 +4050,8 @@ static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
 
 		list_del(&folio->lru);
 
-		split_page_owner(&folio->page, huge_page_order(src), huge_page_order(dst));
+		split_page_owner(folio_page(folio, 0), huge_page_order(src),
+				 huge_page_order(dst));
 		pgalloc_tag_split(folio, huge_page_order(src), huge_page_order(dst));
 
 		for (i = 0; i < pages_per_huge_page(src); i += pages_per_huge_page(dst)) {
@@ -6185,9 +6186,9 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 	 * be leaks between processes, for example, with FOLL_GET users.
 	 */
 	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
-		if (!PageAnonExclusive(&old_folio->page)) {
+		if (!PageAnonExclusive(folio_page(old_folio, 0))) {
 			folio_move_anon_rmap(old_folio, vma);
-			SetPageAnonExclusive(&old_folio->page);
+			SetPageAnonExclusive(folio_page(old_folio, 0));
 		}
 		if (likely(!unshare))
 			set_huge_ptep_maybe_writable(vma, vmf->address,
@@ -6197,7 +6198,8 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 		return 0;
 	}
 	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
-		       PageAnonExclusive(&old_folio->page), &old_folio->page);
+		       PageAnonExclusive(folio_page(old_folio, 0)),
+		       folio_page(old_folio, 0));
 
 	/*
 	 * If the process that created a MAP_PRIVATE mapping is about to
@@ -6249,8 +6251,8 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 			hugetlb_vma_unlock_read(vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 
-			unmap_ref_private(mm, vma, &old_folio->page,
-					vmf->address);
+			unmap_ref_private(mm, vma, folio_page(old_folio, 0),
+					  vmf->address);
 
 			mutex_lock(&hugetlb_fault_mutex_table[hash]);
 			hugetlb_vma_lock_read(vma);
@@ -7832,7 +7834,7 @@ void move_hugetlb_state(struct folio *old_folio, struct folio *new_folio, int re
 	struct hstate *h = folio_hstate(old_folio);
 
 	hugetlb_cgroup_migrate(old_folio, new_folio);
-	set_page_owner_migrate_reason(&new_folio->page, reason);
+	set_page_owner_migrate_reason(folio_page(new_folio, 0), reason);
 
 	/*
 	 * transfer temporary state of the new hugetlb folio. This is
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 9a99dfa3c495..97a7a67515cd 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -454,7 +454,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
 	int ret;
-	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
+	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
 	unsigned long vmemmap_reuse;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -566,7 +566,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    unsigned long flags)
 {
 	int ret = 0;
-	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
+	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
 	unsigned long vmemmap_reuse;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -632,7 +632,7 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 
 static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
 {
-	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
+	unsigned long vmemmap_start = (unsigned long)folio_page(folio, 0), vmemmap_end;
 	unsigned long vmemmap_reuse;
 
 	if (!vmemmap_should_optimize_folio(h, folio))
@@ -668,13 +668,13 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			 * Already optimized by pre-HVO, just map the
 			 * mirrored tail page structs RO.
 			 */
-			spfn = (unsigned long)&folio->page;
+			spfn = (unsigned long)folio_page(folio, 0);
 			epfn = spfn + pages_per_huge_page(h);
 			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
 					HUGETLB_VMEMMAP_RESERVE_SIZE);
 			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
-					&folio->page,
-					HUGETLB_VMEMMAP_RESERVE_SIZE);
+						     folio_page(folio, 0),
+						     HUGETLB_VMEMMAP_RESERVE_SIZE);
 			static_branch_inc(&hugetlb_optimize_vmemmap_key);
 			continue;
 		}
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b8838ba8207a..79d18ff5cda5 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -696,14 +696,16 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
-		trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
-						    referenced, writable, result);
+		trace_mm_collapse_huge_page_isolate(folio_page(folio, 0),
+						    none_or_zero, referenced,
+						    writable, result);
 		return result;
 	}
 out:
 	release_pte_pages(pte, _pte, compound_pagelist);
-	trace_mm_collapse_huge_page_isolate(&folio->page, none_or_zero,
-					    referenced, writable, result);
+	trace_mm_collapse_huge_page_isolate(folio_page(folio, 0),
+					    none_or_zero, referenced,
+					    writable, result);
 	return result;
 }
 
@@ -1435,8 +1437,9 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		*mmap_locked = false;
 	}
 out:
-	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
-				     none_or_zero, result, unmapped);
+	trace_mm_khugepaged_scan_pmd(mm, folio_page(folio, 0), writable,
+				     referenced, none_or_zero, result,
+				     unmapped);
 	return result;
 }
 
@@ -1689,7 +1692,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 maybe_install_pmd:
 	/* step 5: install pmd entry */
 	result = install_pmd
-			? set_huge_pmd(vma, haddr, pmd, &folio->page)
+			? set_huge_pmd(vma, haddr, pmd, folio_page(folio, 0))
 			: SCAN_SUCCEED;
 	goto drop_folio;
 abort:
-- 
2.47.2

