Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630442BD593
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025324; cv=none; b=iIWqabg7J2RhHGliI+HmCtBi0vU66teD+uO/Hq+urYnKRFQ1R3sb0FPEQHqll7rZ1M/cQ4S8etF2GPokhGchEO+JVIk6OXXB56Wma0j1T5UEr3xTttwGuCirJVE+HguKNuEEb3RD0UNTtqEMMgR74NCSQeoRMl2dTi2O6urq+cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025324; c=relaxed/simple;
	bh=4Q9Q8xKUR9b+Bvlz6WUpu8Kn6S6pLHJUlfdgy3oPyOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hd49iiUORRkID2ewtTjlgTAt2CGJG1I9dWmno/jmifr1J9c+o/vMqwq1R/6pHmsx/VpJkCYU/aWGw7pIokJDyjSUeYmljPs6TWipds8p8QW5guumTqCL4iJJYHVWRlIOhhJWBvAQQrJxL2DMdGJ3gZCq2smXmO1nz3eHOA6prXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUBYeEgP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUBYeEgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNZ4VUerWVmEqMtN0xpjRQfwGxXrNwD6y4D9M8fHC9o=;
	b=eUBYeEgPbqXhAsqMEuLPytMPyj2HFT/mO0ulNWyXQh7CFIDN6rQ6On5vIA+mKb8DAVqkli
	xIE3gKLGJd86sRmJv+oNGgU1u0SAB7yHPZ9xr9goL8f+rwModL2Uh+HMwrrEVdv4pW7yzv
	yzhsF5QGTbSAGEyy9kfQqMNdyJjZAgs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-cu4fawfbPgio4bckZbsI-w-1; Fri, 27 Jun 2025 07:55:20 -0400
X-MC-Unique: cu4fawfbPgio4bckZbsI-w-1
X-Mimecast-MFC-AGG-ID: cu4fawfbPgio4bckZbsI-w_1751025319
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso1136092f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025319; x=1751630119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNZ4VUerWVmEqMtN0xpjRQfwGxXrNwD6y4D9M8fHC9o=;
        b=J93FMLHuEZjjdqK/HaHgpy1JxLa0GaFKZZEWaqlLU1bftqPyj2hObWT5CsX6qWgVG6
         DntIcMa7a8TtO7yzQrXdlnFtTvrpSXmF4wKFtnDtreFM0RpNPcVaMfZRZefybfQLUIAx
         A50Q7yGRoYcCNtbzhw7Frv8nM+Qp8Hb07qSVErlRtRssWh8Nv6B6IGrU+JmpDAzN2oN2
         tLfPFiLsbYPX1ZmciwokI17fOayORABQPngaMHcptlSBggKpkIt0/2i3TGyQPI+yJ4mU
         zu0jgZbhXbGZ3j7ozBNTQIeP3kVtf8rPoSf/yPIi9Epgelwxw1qfulG9YgS9EWibnlte
         fVVA==
X-Gm-Message-State: AOJu0YyqS/bPqGflfZnua9CSuuNwsOelzuPN2jYPoxUlEOPh6ftMINtZ
	pjt4KBjCCt2YfNMd+OMrNhs7g8p1SmgBEjDS5egR2j2BWO5ZW6gZaGIhjrFkN3hUvEt050Mlu6q
	e3//t8DRfVShkvIlTZ2tsnr1LFQt8a0/2GMQDZ6bT5u8Ll2Q9mmPXrObP79Y0Can/iIpxUt8ZAv
	Fl8G2AcstFvtqxkwqCBx6LIIL48tU1saaoHZt6xfSHL/WMaX3M
X-Gm-Gg: ASbGncvg9yM38P6flHkTezQMoyRPvBd6uuC61LR863PquZ+wSD3GDBMfkC/Ig6tIQ/h
	ctp3T7Sr9lher3JZ9tXbn7ihvtNmwjE2D+u8rKZMkFm+ONjF55/4aZ8hy98fuR42NJC+R7wfxMI
	SnGSKMn6dU0LUqYbr8Zq2MbQN/TVawsAulvjE/jY+CgqGhcoc8mr0MI3TuHQzYb222p79pa8C8U
	YJrhx+ScF2f1xK32YuslY+TDEDyZJO6E5b/Oz4fdryj9I27CkSxJL3sYZordHbR8NSbv5myAMGv
	/41GATGMhrvrbs9Sg6D4llL4AGxDufV2ah4V3qXLz1patkVupHe1Jlfg265ecpnEG7W80IIuU/u
	/+3xcNDY=
X-Received: by 2002:a05:6000:70a:b0:3a5:39e9:928d with SMTP id ffacd0b85a97d-3a8e986a46dmr2562575f8f.0.1751025318878;
        Fri, 27 Jun 2025 04:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMmga7Hei4JTlN1BHMxoiYcjWrFmvyd2zxxUeKuwdClsZVEASJsZNiVNZKURNd0OK1IzvxGQ==
X-Received: by 2002:a05:6000:70a:b0:3a5:39e9:928d with SMTP id ffacd0b85a97d-3a8e986a46dmr2562522f8f.0.1751025318280;
        Fri, 27 Jun 2025 04:55:18 -0700 (PDT)
Received: from localhost (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7e6f23sm2591779f8f.11.2025.06.27.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:55:17 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch() and folio_pte_batch_ext()
Date: Fri, 27 Jun 2025 13:55:09 +0200
Message-ID: <20250627115510.3273675-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627115510.3273675-1-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many users (including upcoming ones) don't really need the flags etc,
and can live with a function call.

So let's provide a basic, non-inlined folio_pte_batch().

In zap_present_ptes(), where we care about performance, the compiler
already seem to generate a call to a common inlined folio_pte_batch()
variant, shared with fork() code. So calling the new non-inlined variant
should not make a difference.

While at it, drop the "addr" parameter that is unused.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h  | 11 ++++++++---
 mm/madvise.c   |  4 ++--
 mm/memory.c    |  6 ++----
 mm/mempolicy.c |  3 +--
 mm/mlock.c     |  3 +--
 mm/mremap.c    |  3 +--
 mm/rmap.c      |  3 +--
 mm/util.c      | 29 +++++++++++++++++++++++++++++
 8 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index ca6590c6d9eab..6000b683f68ee 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -218,9 +218,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 }
 
 /**
- * folio_pte_batch - detect a PTE batch for a large folio
+ * folio_pte_batch_ext - detect a PTE batch for a large folio
  * @folio: The large folio to detect a PTE batch for.
- * @addr: The user virtual address the first page is mapped at.
  * @ptep: Page table pointer for the first entry.
  * @pte: Page table entry for the first page.
  * @max_nr: The maximum number of table entries to consider.
@@ -243,9 +242,12 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * must be limited by the caller so scanning cannot exceed a single VMA and
  * a single page table.
  *
+ * This function will be inlined to optimize based on the input parameters;
+ * consider using folio_pte_batch() instead if applicable.
+ *
  * Return: the number of table entries in the batch.
  */
-static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
+static inline unsigned int folio_pte_batch_ext(struct folio *folio,
 		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
 		bool *any_writable, bool *any_young, bool *any_dirty)
 {
@@ -293,6 +295,9 @@ static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long ad
 	return min(nr, max_nr);
 }
 
+unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
+		unsigned int max_nr);
+
 /**
  * pte_move_swp_offset - Move the swap entry offset field of a swap pte
  *	 forward or backward by delta
diff --git a/mm/madvise.c b/mm/madvise.c
index 661bb743d2216..9b9c35a398ed0 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -349,8 +349,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 {
 	int max_nr = (end - addr) / PAGE_SIZE;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
-			       any_young, any_dirty);
+	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL,
+				   any_young, any_dirty);
 }
 
 static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
diff --git a/mm/memory.c b/mm/memory.c
index ab2d6c1425691..43d35d6675f2e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -995,7 +995,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		if (vma_soft_dirty_enabled(src_vma))
 			flags |= FPB_HONOR_SOFT_DIRTY;
 
-		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
+		nr = folio_pte_batch_ext(folio, src_pte, pte, max_nr, flags,
 				     &any_writable, NULL, NULL);
 		folio_ref_add(folio, nr);
 		if (folio_test_anon(folio)) {
@@ -1564,9 +1564,7 @@ static inline int zap_present_ptes(struct mmu_gather *tlb,
 	 * by keeping the batching logic separate.
 	 */
 	if (unlikely(folio_test_large(folio) && max_nr != 1)) {
-		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, 0,
-				     NULL, NULL, NULL);
-
+		nr = folio_pte_batch(folio, pte, ptent, max_nr);
 		zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, nr,
 				       addr, details, rss, force_flush,
 				       force_break, any_skipped);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 2a25eedc3b1c0..eb83cff7db8c3 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -711,8 +711,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!folio || folio_is_zone_device(folio))
 			continue;
 		if (folio_test_large(folio) && max_nr != 1)
-			nr = folio_pte_batch(folio, addr, pte, ptent,
-					     max_nr, 0, NULL, NULL, NULL);
+			nr = folio_pte_batch(folio, pte, ptent, max_nr);
 		/*
 		 * vm_normal_folio() filters out zero pages, but there might
 		 * still be reserved folios to skip, perhaps in a VDSO.
diff --git a/mm/mlock.c b/mm/mlock.c
index 2238cdc5eb1c1..a1d93ad33c6db 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -313,8 +313,7 @@ static inline unsigned int folio_mlock_step(struct folio *folio,
 	if (!folio_test_large(folio))
 		return 1;
 
-	return folio_pte_batch(folio, addr, pte, ptent, count, 0, NULL,
-			       NULL, NULL);
+	return folio_pte_batch(folio, pte, ptent, count);
 }
 
 static inline bool allow_mlock_munlock(struct folio *folio,
diff --git a/mm/mremap.c b/mm/mremap.c
index d4d3ffc931502..1f5bebbb9c0cb 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -182,8 +182,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
 	if (!folio || !folio_test_large(folio))
 		return 1;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
-			       NULL, NULL);
+	return folio_pte_batch(folio, ptep, pte, max_nr);
 }
 
 static int move_ptes(struct pagetable_move_control *pmc,
diff --git a/mm/rmap.c b/mm/rmap.c
index a29d7d29c7283..6658968600b72 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1859,8 +1859,7 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
 	if (pte_pfn(pte) != folio_pfn(folio))
 		return false;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
-			       NULL, NULL) == max_nr;
+	return folio_pte_batch(folio, ptep, pte, max_nr);
 }
 
 /*
diff --git a/mm/util.c b/mm/util.c
index 0b270c43d7d12..d29dcc135ad28 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1171,3 +1171,32 @@ int compat_vma_mmap_prepare(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 EXPORT_SYMBOL(compat_vma_mmap_prepare);
+
+#ifdef CONFIG_MMU
+/**
+ * folio_pte_batch - detect a PTE batch for a large folio
+ * @folio: The large folio to detect a PTE batch for.
+ * @ptep: Page table pointer for the first entry.
+ * @pte: Page table entry for the first page.
+ * @max_nr: The maximum number of table entries to consider.
+ *
+ * This is a simplified variant of folio_pte_batch_ext().
+ *
+ * Detect a PTE batch: consecutive (present) PTEs that map consecutive
+ * pages of the same large folio in a single VMA and a single page table.
+ *
+ * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
+ * the accessed bit, writable bit, dirt-bit and soft-dirty bit.
+ *
+ * ptep must map any page of the folio. max_nr must be at least one and
+ * must be limited by the caller so scanning cannot exceed a single VMA and
+ * a single page table.
+ *
+ * Return: the number of table entries in the batch.
+ */
+unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
+		unsigned int max_nr)
+{
+	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL, NULL, NULL);
+}
+#endif /* CONFIG_MMU */
-- 
2.49.0

