Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12192290082
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860709; cv=none; b=fvin3QTH6q+yy73Autig8QMf00cL9ft+NOJF+Yg1bM8UuzWe9kt6avI7MkjZL0r5Jljmo86n8iYVGGyD83clAdT+nZ6PxaAGMxLVm4H4c7x3WbqMSkZXngIsLU1GkxTWg0PWI1iLB5Qb3GE07M9ugJRcVIKP19tGdG4vVmEjiiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860709; c=relaxed/simple;
	bh=H3q5H6suiWXiuvs2KAMcY/pa2l8BVXHAsZ1qIm7fH5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOx423I1J0s49Ur2SE6J2UOqbVR920QDyAeeSphCJzeK/Xg45oMoIfMURVk4GeednkGNS9l4Zt3DeAHw0Lo1C6QMTytKBEmhThKTKV08HgcgsJ/957Mu1J9QZbGFt4X6dyH9CiQL3Um7q1RfRKXP7Kf4paeO5FGE2lQZbJjf0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwhWrqUs; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwhWrqUs"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f8657f29so50530156d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860707; x=1746465507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjtKTj8iYaV5Lk4x0tdvWcE0jO5ltQORsyv2ZseCCwg=;
        b=dwhWrqUsUhsPU3o6a0dtVAFlaAfNqLZirfe4NS9t7+je2ScHIYTQtHFRr98AFes8H3
         cjQI/NjS4sG8f7i6zc8GCwvwZCevxBiLDjZjE4hzekpWzomZEaNW91RISSTf5RT8/t1C
         qtiBZBNFdl6vggK7650Yq0DzHfdM+pNP7kB3cAIgReyukDXqBZDYpa1Dxu7C4ZMYSkUM
         283YwNLIMH9AcdsI2TJndver/0WB+gX7/XPLXixSXNFYCR94HP+Kt6mbTl4MWgyglktB
         mcGv9aRU4yZJeJA0HVqk8v4bnSBof7FuQDkolnDFS1ZLbT88eMYpcfjk75cMdebcieLl
         ICdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860707; x=1746465507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjtKTj8iYaV5Lk4x0tdvWcE0jO5ltQORsyv2ZseCCwg=;
        b=KT3qYxPfv4FoyJyIuhGM4C8RIFpL4yedEn3mbrSYG3L5kG3cTwjL6p4DhCkllX4RFf
         osxnZfHsXPBqAuaaHOqlx9Qppon2qRUlIXKiwik4EZuBNHR3K3M3SPbG0YW8CArub12B
         7Z5cCq4l0v8da0x25+9fXxZRclJFkAyfCJu/r4vBk+eG1uciB7g9L+jv0NDRLURwGs29
         PB5TdmGNGHvlJ5+34j2OL+MwR/CQrZNWT2ocRZsHt8xkyuOD2V9LuBWZsMA6+Bt0WeoF
         ei+HBk+84l6vjGPDwVJbwVk8PlLKRCKXfNH+7eKuqqom4AGoJsZCZ4It7RNV+YELdW7c
         O6dA==
X-Forwarded-Encrypted: i=1; AJvYcCWDfwmbXKdA8YB77DJMEW50uaIZ0u9QIR4Woz5CsbrLJs2c66x1TNKLHqy7UmLGqVPZri+zkYaFLJ/D250=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiX/fjE3I9boeNCfX00qArByztGoUfTZpei2ciEkec6sluFFWc
	CtpjgyEItB5QqjZZ4oU4s8GA6d+V7jLR5Zu6V5OspbSJZTCyTNIi
X-Gm-Gg: ASbGnctPkMD98malef8h5Yx1GvvLzGS1JGtrP+QJAdp6cA6CF3wfY5GIGF0dhMxnnOJ
	3hafXch8DKits0Xvy7CzagJzzPYPKyfELL6PE+AzO6qHbV6SgXqTGU5OTpxDLxTGu6K+PY7fjJc
	2EKPvcfeTgABvrT9dVhNkXgjuwyvvIdpXmIRV+tqo3Quh35ckxKsFYwiV4jMGWhXfCFNgNwdRvc
	WCYlgHwY2kAqALmBmJd5iZ8tYGbHPD0sK0NLqqAMLY9crfiREfKMv/8SVjFtFt8neCCbSGeDdTa
	WTiNX7ldQCw+ulnrFAwotK8DkOH6cCzLeHvyFVD2OzMgJpknl/4QnEG9S4G/+EoIa1X/
X-Google-Smtp-Source: AGHT+IEA7TYfHtaKvQ9mdaP5c5C6mbPEctCz601dDDlmmSTyKrk7y2ueKhroNRxv24n5SyIkTp4r/g==
X-Received: by 2002:a05:6214:768:b0:6ea:d393:962f with SMTP id 6a1803df08f44-6f4d1efe83cmr186471176d6.16.1745860707052;
        Mon, 28 Apr 2025 10:18:27 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8ee2:8c9a:73d0:fe8a:86bb:e664])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef3e7sm63443436d6.6.2025.04.28.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:18:26 -0700 (PDT)
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
Subject: [PATCH v3 4/4] mm/hugetlb: Convert use of struct page to folio in __unmap_hugepage_range()
Date: Mon, 28 Apr 2025 10:11:47 -0700
Message-ID: <20250428171608.21111-7-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428171608.21111-3-nifan.cxl@gmail.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
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
 mm/hugetlb.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6696206d556e..293c2afa724b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5815,12 +5815,12 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
-	struct page *page;
 	struct hstate *h = hstate_vma(vma);
 	unsigned long sz = huge_page_size(h);
 	bool adjust_reservation = false;
 	unsigned long last_addr_mask;
 	bool force_flush = false;
+	const bool folio_provided = !!folio;
 
 	WARN_ON(!is_vm_hugetlb_page(vma));
 	BUG_ON(start & ~huge_page_mask(h));
@@ -5879,14 +5879,13 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			continue;
 		}
 
-		page = pte_page(pte);
 		/*
 		 * If a reference page is supplied, it is because a specific
 		 * page is being unmapped, not a range. Ensure the page we
 		 * are about to unmap is the actual page of interest.
 		 */
-		if (folio) {
-			if (page_folio(page) != folio) {
+		if (folio_provided) {
+			if (folio != page_folio(pte_page(pte))) {
 				spin_unlock(ptl);
 				continue;
 			}
@@ -5896,12 +5895,14 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			 * looking like data was lost
 			 */
 			set_vma_resv_flags(vma, HPAGE_RESV_UNMAPPED);
+		} else {
+			folio = page_folio(pte_page(pte));
 		}
 
 		pte = huge_ptep_get_and_clear(mm, address, ptep, sz);
 		tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
 		if (huge_pte_dirty(pte))
-			set_page_dirty(page);
+			folio_mark_dirty(folio);
 		/* Leave a uffd-wp pte marker if needed */
 		if (huge_pte_uffd_wp(pte) &&
 		    !(zap_flags & ZAP_FLAG_DROP_MARKER))
@@ -5909,7 +5910,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 					make_pte_marker(PTE_MARKER_UFFD_WP),
 					sz);
 		hugetlb_count_sub(pages_per_huge_page(h), mm);
-		hugetlb_remove_rmap(page_folio(page));
+		hugetlb_remove_rmap(folio);
 
 		/*
 		 * Restore the reservation for anonymous page, otherwise the
@@ -5918,8 +5919,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
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
@@ -5943,16 +5944,17 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				 * count will not be incremented by free_huge_folio.
 				 * Act as if we consumed the reservation.
 				 */
-				folio_clear_hugetlb_restore_reserve(page_folio(page));
+				folio_clear_hugetlb_restore_reserve(folio);
 			else if (rc)
 				vma_add_reservation(h, vma, address);
 		}
 
-		tlb_remove_page_size(tlb, page, huge_page_size(h));
+		tlb_remove_page_size(tlb, folio_page(folio, 0),
+				     folio_size(folio));
 		/*
 		 * Bail out after unmapping reference page if supplied
 		 */
-		if (folio)
+		if (folio_provided)
 			break;
 	}
 	tlb_end_vma(tlb, vma);
-- 
2.47.2

