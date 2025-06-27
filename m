Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B6186294
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992783; cv=none; b=lkFRutKFVn/0FQ8gZyFhY+46gRRCm4hHg9emBLZk4L2fxm2kQ8d9GROZ6erfhxeKW4ZxIjezL2Xwl15sV7QMKic4uHAVmvRV2xQCeV9ZmmUcNgG0QdK5kSo5q6wM3XagpV3K83zaiS2FtDMLK27h+h7hWcD+3dVecknlvyglqZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992783; c=relaxed/simple;
	bh=i4Ehn82wQMBANVZn2Qv6kpXeHEI63GE7vJ4zmZW/Xpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1SBKkQKK707YNbaXFVxT34W1cOXHqoEtvHoc/CIKgv1AMKAcppwT7bdjmDbgHppsM/1/DmBgCIDr5GnOBvUqUyY++X4DQOjiB/vT2nsvu7AcCmjKYS35KhRloB8wnAadlJP20HuzKhAQlpBkMK7hkASLh2vIkzKoq0F3DJpO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKd++Msq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKd++Msq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so12404455e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750992779; x=1751597579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6PzA7mB8f6GScrtLf4fvCqozUiHt2kWSKvUWfhehRw=;
        b=XKd++Msq1tzGVYVPH9iXIa8rLjXA0VACUQ9iw7w3RagweLI4wBL/3h5jZ5fBFtNKuU
         U2XDFQxZsB1kmikdqXAnRsoNBseJtP/1KqHUwBl/RFIE1uKMS7OODe2m629mouYvU4UM
         I2SYwrNRev1Rqc72i9MfYksx9DeNtmbySoZp3j6uxvhUtxPH1BNq72v75zJXp5IJQP/A
         DLnF3y+JgP494WHJO2ShB88XUdvMMuddEdmbr4vbXV/zPgdPKA6PthpFO3WhZa4U/8EL
         +gususJWUEzXTqDDw7Stu+NESr2XQsbV7Ju+7Hw9w4xFVtWFT2cVNjr2ACnzCDfGa1bB
         QDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750992779; x=1751597579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6PzA7mB8f6GScrtLf4fvCqozUiHt2kWSKvUWfhehRw=;
        b=fiN4QBikV5A30vzv1txjlfCRN6bdd/B2UBuHSkytXasCGqsc5FnF88gF+CvZO6QkFx
         qsuJqc+Sl84QMe6jt9tcGY9xudWZMb7LUTJk2fQWPe0w6m9eSimYIyQ/gHliOdTioROY
         TtaqwetxAA83Ze9It2CLBSHpda3osbrHv2HnqAv3rlf+UKEHxgPNhLV2j6oIs+7XjjQK
         /Syjxup7lk4fsi7Ct6WF2+ELKhA4HBnH9GkVKKykP1wWZnB3bUxNVz656x15zKk7LIwT
         3CP2/GUG4RRupUdQneSQfDmdUFNTozECL13XFXl7N7pmal2LZ/MGtVfjE8DhvNwnI3Ou
         85zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnbcIYIyP6NNS+PvFnB6lcaqc1d7QzmNmaUmSQv+SZVwTdLpclIMqPvxSWXpKF7sRbzfI+ZFYcgSLy6V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YykJ2oxPyKidTgECDTYOd/0fHj3YNuln4+c8PKQcIl3kpo33i8e
	a6GQmAAcDH89CYYB+bOOsThc/JOQwaLn0Th1y5Aur4MmXcwEav4bpSeN
X-Gm-Gg: ASbGncsqi7ePW5bHO6va16smaZkv2BQx7C2Hnmpb9SFKVzr9YlBJF8y6zYtYtNU1yv3
	MI0mVy8DA7azz3dtRNZTKxvzDl8lzsrNaL0jiT77+60G8Br5rK2Z0K+7+4gS8VXXg9yOgwrQgaq
	Y5r+Zg/aQiBI64I6S5svVWBJQnk5yibwThhoC2HZIRXVHwkpj1PV1du9/6ZgGIneMcbmsoWduF+
	C43QJ+q51E2hwL3VPZYSPAnbL9oeW6TVUNGHgqYwAKpRPZWmaHOG5q1NKFAWWt9xPxKquteHyVI
	Kae5UcmMId8lGYGcKkXm8hlEkCkQSukJ4+XCxDW1wrdMHBMR
X-Google-Smtp-Source: AGHT+IFBUodrO2XKQIiwzTtHA/m8Q0lEsRRL9iE7J3KYXgrGSCiuYQrK9rEZ8la7pXGRsNR2J1eheQ==
X-Received: by 2002:a05:600c:3582:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-4538ee3b4dcmr12330455e9.8.1750992779126;
        Thu, 26 Jun 2025 19:52:59 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4213f0sm36194695e9.36.2025.06.26.19.52.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 19:52:58 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@redhat.com,
	21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	huang.ying.caritas@gmail.com,
	zhengtangquan@oppo.com,
	riel@surriel.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	harry.yoo@oracle.com,
	mingzhe.yang@ly.com,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support partial batches
Date: Fri, 27 Jun 2025 10:52:14 +0800
Message-ID: <20250627025214.30887-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
can read past the end of a PTE table if a large folio is mapped starting at
the last entry of that table.

So let's fix the out-of-bounds read by refactoring the logic into a new
helper, folio_unmap_pte_batch().

The new helper now correctly calculates the safe number of pages to scan by
limiting the operation to the boundaries of the current VMA and the PTE
table.

In addition, the "all-or-nothing" batching restriction is removed to
support partial batches. The reference counting is also cleaned up to use
folio_put_refs().

[1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com

Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 mm/rmap.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..1320b88fab74 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,32 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 #endif
 }
 
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-			struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+			struct page_vma_mapped_walk *pvmw,
+			enum ttu_flags flags, pte_t pte)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-	int max_nr = folio_nr_pages(folio);
-	pte_t pte = ptep_get(ptep);
+	unsigned long end_addr, addr = pvmw->address;
+	struct vm_area_struct *vma = pvmw->vma;
+	unsigned int max_nr;
+
+	if (flags & TTU_HWPOISON)
+		return 1;
+	if (!folio_test_large(folio))
+		return 1;
 
+	/* We may only batch within a single VMA and a single page table. */
+	end_addr = pmd_addr_end(addr, vma->vm_end);
+	max_nr = (end_addr - addr) >> PAGE_SHIFT;
+
+	/* We only support lazyfree batching for now ... */
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-		return false;
+		return 1;
 	if (pte_unused(pte))
-		return false;
-	if (pte_pfn(pte) != folio_pfn(folio))
-		return false;
+		return 1;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-			       NULL, NULL) == max_nr;
+	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+			       NULL, NULL, NULL);
 }
 
 /*
@@ -2024,9 +2033,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
-			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-				nr_pages = folio_nr_pages(folio);
+			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
 
@@ -2206,13 +2213,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			hugetlb_remove_rmap(folio);
 		} else {
 			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
-			folio_ref_sub(folio, nr_pages - 1);
 		}
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
-		folio_put(folio);
-		/* We have already batched the entire folio */
-		if (nr_pages > 1)
+		folio_put_refs(folio, nr_pages);
+
+		/*
+		 * If we are sure that we batched the entire folio and cleared
+		 * all PTEs, we can just optimize and stop right here.
+		 */
+		if (nr_pages == folio_nr_pages(folio))
 			goto walk_done;
 		continue;
 walk_abort:
-- 
2.49.0

