Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620FE21ABDA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996200; cv=none; b=S769NKvlU4EGfIkM0oR9ndbdMNI5rBrwqfWSxLUmnmSO8Cf7qDdvXkx6EqQkrrsMostba2afb8EigK7uzgbCRCMdKw5UH0GhCeBiqSYLTDBEPZtpgNeLCk7SsRKaG/8kATBVxe9mXLKA4l12vVwNW+5Q/8BDJpgM88bT0EkAChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996200; c=relaxed/simple;
	bh=XLpPdqycz3uc3rZaBxp8Jop/LZge5umKgM6hyqZYdP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZwVUKLqJHkAu0Q2wFvDOiv+DTL/SL0M4/ZXz2UdaEfHMK6d9p6+SmTQmecwleq/b+0hpzoHVYDajGWirx/OJ+UpQReKrp7oiEJOklOl00hbTmrod0L/+j1vY5rpeCRrEAbeCY9K3QJ/ujTgtgLNaivhLRWwotFx2YwjDvlXlWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0wCdKw+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0wCdKw+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7399838db7fso2101931b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744996199; x=1745600999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR9npWIv+rGQU+FX1QXLAADj2LmGc+OKrQyDb0uOm+4=;
        b=T0wCdKw+BThzIVzvPYJjrTfukgYNcbfV7aB6Lf+opVJ4VXVwqK84SSCCzDg3GJNZ/x
         8qDjpGVbJm7/CFL9BUROuOMyElYvOE+G13v3n/IWTmx2CKdhFW9imINNcBMXwYt/PAa2
         gPmqS397URm46xTVuJ1O3Sr3c4CNV6pYzpzXPhGmyjMqkVI152gJljrVvmkqyLKHS9Ao
         ZCtSH4YKFt/S6wmqYN7kwziv3Wu6G4X4sZriMt+IUBp+/xV8OfLygCmMkSK7Wr7hSCO1
         QdC3+ZMgp9JIFEM3tlK8p4xOLG7NwwCa3MDpsAMc0ohWrpGCJdZcpEs7bK5DWwEdnUb0
         FH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996199; x=1745600999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR9npWIv+rGQU+FX1QXLAADj2LmGc+OKrQyDb0uOm+4=;
        b=AjShg3wlDNODC+FZUl//II0+W4B64lmIgfd5LfNkXR48INt0y1b1kFvi1Hy1XxpS06
         DSywvaNXyhgHxp4PrXLcGFUcwF5RbiZNBHBan8xbDfpDMrZgTe6VR3Eop5FVfERv6hLM
         VuC9NR3FDN4wrCQMSo8thlJsusuzUbfD9EaW9Xt0sHYQHDeWYKbIPrXJEnjZ9P/dKtoH
         RzNaMuk1qArbILFZG+3Q59lSsXQKCI5+iPshehJxsaBjRmhMi18b1IyRUTYF9+G5hkxE
         G/U4TYAli4NLeY7ENGkrRcIawm60oxIzGAR/Z7GramByqLuWn8YwXYHGrQ1ZsQS8fsum
         9f7A==
X-Forwarded-Encrypted: i=1; AJvYcCXbZRsTWPCccyFWRdH59rYrxfAM/GnNB/lMSIb4rK/CC1WprGx/lKhuKxZXzmthXzM9gnP4JGhjT1XzyOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZoDtuyBmQMAlSeMRgSBVCXs9QS4ZsjYa+CDkGuG4vKDs8+tef
	B0YemRvw4l63h4CKHHHQk1W2h4RDC4B5xbp425IlbActvRid1QCr
X-Gm-Gg: ASbGncud0ZwL12nbykaydllTred3iI79/Q582kbCCDEBnfZASP8oIMVH+RW3NAeBcXc
	UHcPgNvh5omKxa2eLw4VO1yOcU1BkTy+QvWwYqGsEC2iXF2j+3zfx/4xgpHwzOmMw2PTEPFnuPt
	7UKzpoYb/7AXBggd/t1OehzduLi56LOY7oWqSBh5DsU2P5sVsLyOboX2rd5lsYVnsHD/7zuBjfU
	DrT7ObMsWB6O1EanuPhreV6lFdIJ59qZbmws/vyfYB/uD8OzEGav2P+F9ieLOusgZBVadGPrcBC
	NFJEKDRjlkk0HcuCiJa4GrsWbkdApo6v43yk9RyCxNvOwNKkJWA5evwYYA==
X-Google-Smtp-Source: AGHT+IFFtgchhKrrSgY8IwY+zNPrux+4lRWwT2ZJzGrWP0TbUDOOYlZ/d83wzJ8XRSE77fYFs+SJJQ==
X-Received: by 2002:a05:6a00:a904:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-73dc1653f45mr4296795b3a.0.1744996198648;
        Fri, 18 Apr 2025 10:09:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:5e33:e006:dcd5:852d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59176sm1834069b3a.113.2025.04.18.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:09:58 -0700 (PDT)
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
Subject: [PATCH v2 4/4] mm/hugetlb: Convert use of struct page to folio in __unmap_hugepage_range()
Date: Fri, 18 Apr 2025 09:57:42 -0700
Message-ID: <20250418170834.248318-5-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250418170834.248318-2-nifan.cxl@gmail.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

In __unmap_hugepage_range(), the "page" pointer always points to the
first page of a huge page, which guarantees there is a folio associating
with it.  Convert the "page" pointer to use folio.

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
This is a new patch added to the series based on the discussion here:
https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m2b9cc1743e1907e52658815b297b9d249474f387
---
 mm/hugetlb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7d280ab23784..8177a3fe47d7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5840,7 +5840,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
-	struct page *page;
+	struct folio *folio;
 	struct hstate *h = hstate_vma(vma);
 	unsigned long sz = huge_page_size(h);
 	bool adjust_reservation = false;
@@ -5904,14 +5904,14 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			continue;
 		}
 
-		page = pte_page(pte);
+		folio = page_folio(pte_page(pte));
 		/*
 		 * If a reference page is supplied, it is because a specific
 		 * page is being unmapped, not a range. Ensure the page we
 		 * are about to unmap is the actual page of interest.
 		 */
 		if (ref_folio) {
-			if (page != folio_page(ref_folio, 0)) {
+			if (folio != ref_folio) {
 				spin_unlock(ptl);
 				continue;
 			}
@@ -5926,7 +5926,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		pte = huge_ptep_get_and_clear(mm, address, ptep, sz);
 		tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
 		if (huge_pte_dirty(pte))
-			set_page_dirty(page);
+			folio_mark_dirty(folio);
 		/* Leave a uffd-wp pte marker if needed */
 		if (huge_pte_uffd_wp(pte) &&
 		    !(zap_flags & ZAP_FLAG_DROP_MARKER))
@@ -5934,7 +5934,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 					make_pte_marker(PTE_MARKER_UFFD_WP),
 					sz);
 		hugetlb_count_sub(pages_per_huge_page(h), mm);
-		hugetlb_remove_rmap(page_folio(page));
+		hugetlb_remove_rmap(folio);
 
 		/*
 		 * Restore the reservation for anonymous page, otherwise the
@@ -5943,8 +5943,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 * reservation bit.
 		 */
 		if (!h->surplus_huge_pages && __vma_private_lock(vma) &&
-		    folio_test_anon(page_folio(page))) {
-			folio_set_hugetlb_restore_reserve(page_folio(page));
+		    folio_test_anon(folio)) {
+			folio_set_hugetlb_restore_reserve(folio);
 			/* Reservation to be adjusted after the spin lock */
 			adjust_reservation = true;
 		}
@@ -5968,12 +5968,12 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				 * count will not be incremented by free_huge_folio.
 				 * Act as if we consumed the reservation.
 				 */
-				folio_clear_hugetlb_restore_reserve(page_folio(page));
+				folio_clear_hugetlb_restore_reserve(folio);
 			else if (rc)
 				vma_add_reservation(h, vma, address);
 		}
 
-		tlb_remove_page_size(tlb, page, huge_page_size(h));
+		tlb_remove_page_size(tlb, folio_page(folio, 0), huge_page_size(h));
 		/*
 		 * Bail out after unmapping reference page if supplied
 		 */
-- 
2.47.2

