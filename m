Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A622701B5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469528; cv=none; b=a/ut272pcYXjNG8YJStx3N3D0tWSE7T9jbe1xCe6hCNGuvkKTMu+I8amYjyian1/rdB/px1Ns1Dg3HRtWt5LMtK0n+dGf83a5BQRWi6QjxF2SdfcYZy4u6TMiDiPHbFYLYURSe87VghVnmkI/HAyzJCjZCjCuPmYfoYyeDf906U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469528; c=relaxed/simple;
	bh=FuFEl9n7hXKGBPHmlu+rFQ0mLr8r8w2qyN8+rXrz7D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzRB2x0RY1idlPNlz1k1Nrw94xXKLxIDCZcsu+9PrNs5ssdGkZKRhRPqUEUGqq5cLSz/AoD3L4lZUZkcNyb7SHIUACpswwby/wpNpNARFo8sPoshyRyUR2ZYxs1lrRACyBA666iXNMGVYA1imNUvIoB202SMxJ2jjaCGqev7jJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt9OBTx2; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt9OBTx2"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7387d4a336so3879498276.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746469526; x=1747074326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuThg12fH4g5ZORp98F9C2viVi9rSeBkPi/CF3lFj4A=;
        b=gt9OBTx2gTTxkXu++lXR18rLtpR0OIYLJTc3+juibHdKDRcKmRQTDWEBJxjhCz7Xdl
         oy+slaUj80bBuxhH8bARu3CPfAVy1/eh6gVt6khYKSeV7YjfFMOMtmyVK5OoWiHxvg9/
         Ho4RPtqXlQr3Gjnj9MbEFzzOdpRGXuI2bi4YiPLfGfXWdxArRZxKDtl6eEyybK/NkaiD
         cwWtVutO6Em7w9T3evBps1rY4gywLELBQGYLqwCk73yhFrOjeC/BwIvMd2AUtpQ2AOFf
         CyQrls14YoZOaifoCw0RnHP0oXFHTAnyeAxL7iMRwyqsFPTKLSP3HqoATuRWGAWKOqb+
         SCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746469526; x=1747074326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuThg12fH4g5ZORp98F9C2viVi9rSeBkPi/CF3lFj4A=;
        b=wV+SdFTT6hglqtAeks0wVt3HMpqAMZ2d9/pUb1SRKreR0QkQuDcFmrTuDbdC6mO3kW
         2PQLVkIyfg7wb+FSUpIiLiF/0tHTSsZe0OcIu3bDLd+R9EjAlbRW8obgDAyOkSh0cfOq
         LKz5iz0Nc4L0z+jea9G7D7XX160cSVi7z3JmK5TUa+kf0yW8iABv57GDcZzVQr2ZW8FA
         37Ugtmr3EAsjwIvgrV7p5tc2zuggJG6zyo+00zl9UNSOrvGl3Zm1X3czGwVVWUkLqFel
         H8X7bvCqK0bAU+F+pp/YOTSpen+x7hIKxA9ZsekydteIbL2TzKgMqeNMGBbpH3tJAeGu
         IhyA==
X-Forwarded-Encrypted: i=1; AJvYcCXAnT8++879lrnK2FyDtFgzV7usma9cOJ96CojQCDO0WOU8rDT/7t4NHKDb2vM2G7BcJmNWNi4s3sVcZPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYjPsnkKUPFhb9UFImfR5LnHlqaEW7/ucB1NdHrm/X4LbzIEPr
	+k+cTCePT2D6kX0jBeszxA4w6QRrqf6IgrKK0/U6ZTn6GCNmAyAw
X-Gm-Gg: ASbGncvlTcMx/tqv7AXo8ojJEHl7D9sPAZvAgIgybmsOJ/j2/2VVDd0n8qAnjgWJ6pX
	Q43X+QiwPwvDsupGeQRMjHGojcnptrltuEja7mn3iKVCWAPtSl0FGSHGTSuH/we2UbjZmgDdK7T
	nAWPFU0k7iLmJnLILthcYY2jyDuarlaSmGO1jq2qLjzwelR78VwGDWOY6NWYmyuQ4OwpU58Liv2
	8cNCGHjRMwVGCpAtKUHJCEH9eAbHTt8GSS77hq8CQ7ToRKHiT9CNDspKWSTFMSLCK7PlxLQH65V
	eeD5dpc1awS0hYqM7qMw9OmmVL7SlTgzG1wnI94XKErzu2kPNQszZ7J9udBRTA==
X-Google-Smtp-Source: AGHT+IHWYXQ31FfmXio3NIqUd2zrA9/4L6iOyWFYTcB4iuWcOjNrqaYf3lxVr14Id2sBiuOIFJkjlA==
X-Received: by 2002:a05:6902:729:b0:e72:ecd8:6d44 with SMTP id 3f1490d57ef6-e757d2d97c6mr10480471276.20.1746469525631;
        Mon, 05 May 2025 11:25:25 -0700 (PDT)
Received: from localhost.localdomain ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7a897asm2113429276.38.2025.05.05.11.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:25:25 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org,
	osalvador@suse.de
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	nifan.cxl@gmail.com,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH v4 4/4] mm/hugetlb: Convert use of struct page to folio in __unmap_hugepage_range()
Date: Mon,  5 May 2025 11:22:44 -0700
Message-ID: <20250505182345.506888-6-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505182345.506888-2-nifan.cxl@gmail.com>
References: <20250505182345.506888-2-nifan.cxl@gmail.com>
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
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 443b75e116cf..d53caf96a4b2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5843,11 +5843,11 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			    struct folio *folio, zap_flags_t zap_flags)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	const bool folio_provided = !!folio;
 	unsigned long address;
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
-	struct page *page;
 	struct hstate *h = hstate_vma(vma);
 	unsigned long sz = huge_page_size(h);
 	bool adjust_reservation = false;
@@ -5911,14 +5911,13 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			continue;
 		}
 
-		page = pte_page(pte);
 		/*
 		 * If a folio is supplied, it is because a specific
 		 * folio is being unmapped, not a range. Ensure the folio we
 		 * are about to unmap is the actual folio of interest.
 		 */
-		if (folio) {
-			if (page_folio(page) != folio) {
+		if (folio_provided) {
+			if (folio != page_folio(pte_page(pte))) {
 				spin_unlock(ptl);
 				continue;
 			}
@@ -5928,12 +5927,14 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
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
@@ -5941,7 +5942,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 					make_pte_marker(PTE_MARKER_UFFD_WP),
 					sz);
 		hugetlb_count_sub(pages_per_huge_page(h), mm);
-		hugetlb_remove_rmap(page_folio(page));
+		hugetlb_remove_rmap(folio);
 
 		/*
 		 * Restore the reservation for anonymous page, otherwise the
@@ -5950,8 +5951,8 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
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
@@ -5975,16 +5976,17 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
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
 		 * If we were instructed to unmap a specific folio, we're done.
 		 */
-		if (folio)
+		if (folio_provided)
 			break;
 	}
 	tlb_end_vma(tlb, vma);
-- 
2.47.2

