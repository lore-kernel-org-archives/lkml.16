Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F98262FDC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454481; cv=none; b=ZrNkzlo5j5zdEDtqjfgP1elh4xTWE6DEI5Tt7HYz8X26zBXdhc4AU2FgSOletc29sNH20FIOjYxoV8TaRQVtcB6lGaKnHPtpDyaCvgs76mMC8scmyXyFT+txr2Q9goY+5TrvwUmQCsSUR1hbDzk2AwAmsUWCvq3zcFKGNMdufdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454481; c=relaxed/simple;
	bh=iq5EbOPuBdZmLwhjWwZ4Tu3NTW5FLwSPpNp7cvQvjwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eChPv8x+x4g0m+WUaDR+bvq3JEe3d5GAqVE23S7bFbnwX8RUzPfIidbglO6U2VX0UvOT5Jh3RDAcuuMlMCWznj4ELJv68F6i/q5elbbxbRhk85AtLgugUj4DZTIlO10NAm7+kV7+ZHS94UqQ7wfJcqrbMxaAHNK6QOfRaI/15JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XvNRCZuo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XvNRCZuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751454478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3oAnJSM0KYfarg3+XnNxR/2W/7E08lIWfFxeFG4I6C8=;
	b=XvNRCZuoWif6jMVdBzgA0sX+BfTatPGyYbm9sR7cqoyzJzbVU6il8rahgKlAmh2ViSkfR8
	mAwmK4c80BqT+vggDVD0ysricbUa1cik8Xi5FlmHbG9kJcMdCpxnHDQeYQrU94nx7ybad/
	ubcUOds4cjJglCRrlUMaXDX7zN/NOcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-QSLckNXnN22tIfbW3d-rNQ-1; Wed, 02 Jul 2025 06:49:39 -0400
X-MC-Unique: QSLckNXnN22tIfbW3d-rNQ-1
X-Mimecast-MFC-AGG-ID: QSLckNXnN22tIfbW3d-rNQ_1751453378
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a578958000so1707809f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453378; x=1752058178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oAnJSM0KYfarg3+XnNxR/2W/7E08lIWfFxeFG4I6C8=;
        b=K9euXdEKABhP4j0GtBEgM3IXI6jKhN0DXHwNASO0KxRBJ/x2vlqDVzjoOsIhgiHH6J
         hUtEyVNV6oMJdfnohgDUbjemA5EZ89czFso8bf2eiC8U0sPV/K6IWL6dNbnBggImMC+o
         P2PVBtXJeVAqwqjSbCerrgTXx7UbHkGchXz3jOc1BYm1uK4S4t8dvTebkSz6Y1UXOIj4
         boUVBvZZdQ7gchxEHZishajHPgyYtA5r3KRbWpb0xxgH+MlW7xseAUsZuuZ6goKeBq7d
         zTpCBwN+yFIxMoWnoTUcgUxWiZac5pL+2YHkenZMVZEN++WGNhJkk+YJb/sK9W8zcQnU
         bc0g==
X-Gm-Message-State: AOJu0Yzqw0KWC6edzCdIykgH7muWKYoxu1GWnutS8K4sHAvhI3TmmYWD
	k2vYE7utPd6XFAtCzqRZeh1hy6BVUiT9f3WDDaahLsKwOPSt3ejOxZusVW/qID44ES2WnBnzblW
	8c1ZNXEA5jJe5y9Qoy4Bm39gjhK9LQZ1GZbekq75A62pVD0PPDlQtoxls7Skmwa+xg+5uDhr4ov
	eUj9K/qL5136Tono1BpoZlyrApFBwsHD77GasMTRUq21d80rk2
X-Gm-Gg: ASbGncukpQatBlCuKuMBZT9NxTvrMMdQ9d51e7nks2rMCbvPa/cwzOt/vk+Nbi0X+Z0
	BFuBqWu9W/cm9qaYq9+ru1D66WOWiCj+x6sooJA4Ei4gHI7nFOn9jcIP9Qw9/7ZsGRdrE3XcO+c
	xzDLwUI74N9Ky0UpjTFDBVfkCyBOiB4bblR2zAKjyWQPstDJh/oLnPPZHUAmWvix6OfOjVd7BOv
	zcb0LuLoNSZGP7Jpavucwcc+Y2E0fR5g9iY9PxvQeUlRUYtoO0zS+FM2Qsq/VDvhG4cZY7CD/++
	hHBMsuXB7+BqpOfX
X-Received: by 2002:a5d:5f4e:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3b20234d94cmr1583878f8f.49.1751453377782;
        Wed, 02 Jul 2025 03:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqpc4JaEHI4XLQrd/hrL7HETc6C5MvZ9hTJGeziQf4Dkb9UiYdEYneULGVBMvUpSbvMTd7UQ==
X-Received: by 2002:a5d:5f4e:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3b20234d94cmr1583828f8f.49.1751453377074;
        Wed, 02 Jul 2025 03:49:37 -0700 (PDT)
Received: from localhost ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c8013fesm15956078f8f.38.2025.07.02.03.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:49:36 -0700 (PDT)
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
	Harry Yoo <harry.yoo@oracle.com>,
	Lance Yang <ioworker0@gmail.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2 4/4] mm: remove boolean output parameters from folio_pte_batch_ext()
Date: Wed,  2 Jul 2025 12:49:26 +0200
Message-ID: <20250702104926.212243-5-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702104926.212243-1-david@redhat.com>
References: <20250702104926.212243-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead, let's just allow for specifying through flags whether we want
to have bits merged into the original PTE.

For the madvise() case, simplify by having only a single parameter for
merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
dirty bit is not required, but also not harmful. This code is not that
performance critical after all to really force all micro-optimizations.

As we now have two pte_t * parameters, use PageTable() to make sure we
are actually given a pointer at a copy of the PTE, not a pointer into
an actual page table.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 65 +++++++++++++++++++++++++++++++++------------------
 mm/madvise.c  | 26 ++++-----------------
 mm/memory.c   |  8 ++-----
 mm/util.c     |  2 +-
 4 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 6c92956ac4fd9..b7131bd3d1ad1 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
 /* Compare PTEs respecting the soft-dirty bit. */
 #define FPB_RESPECT_SOFT_DIRTY		((__force fpb_t)BIT(1))
 
+/*
+ * Merge PTE write bits: if any PTE in the batch is writable, modify the
+ * PTE at @ptentp to be writable.
+ */
+#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
+
+/*
+ * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
+ * modify the PTE at @ptentp to be young or dirty, respectively.
+ */
+#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
+
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
 	if (!(flags & FPB_RESPECT_DIRTY))
@@ -220,16 +232,12 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 /**
  * folio_pte_batch_flags - detect a PTE batch for a large folio
  * @folio: The large folio to detect a PTE batch for.
+ * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
  * @ptep: Page table pointer for the first entry.
- * @pte: Page table entry for the first page.
+ * @ptentp: Pointer to a COPY of the first page table entry whose flags this
+ *	    function updates based on @flags if appropriate.
  * @max_nr: The maximum number of table entries to consider.
  * @flags: Flags to modify the PTE batch semantics.
- * @any_writable: Optional pointer to indicate whether any entry except the
- *		  first one is writable.
- * @any_young: Optional pointer to indicate whether any entry except the
- *		  first one is young.
- * @any_dirty: Optional pointer to indicate whether any entry except the
- *		  first one is dirty.
  *
  * Detect a PTE batch: consecutive (present) PTEs that map consecutive
  * pages of the same large folio in a single VMA and a single page table.
@@ -242,28 +250,32 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * must be limited by the caller so scanning cannot exceed a single VMA and
  * a single page table.
  *
+ * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
+ * be updated: it's crucial that a pointer to a COPY of the first
+ * page table entry, obtained through ptep_get(), is provided as @ptentp.
+ *
  * This function will be inlined to optimize based on the input parameters;
  * consider using folio_pte_batch() instead if applicable.
  *
  * Return: the number of table entries in the batch.
  */
 static inline unsigned int folio_pte_batch_flags(struct folio *folio,
-		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
-		bool *any_writable, bool *any_young, bool *any_dirty)
+		struct vm_area_struct *vma, pte_t *ptep, pte_t *ptentp,
+		unsigned int max_nr, fpb_t flags)
 {
+	bool any_writable = false, any_young = false, any_dirty = false;
+	pte_t expected_pte, pte = *ptentp;
 	unsigned int nr, cur_nr;
-	pte_t expected_pte;
-
-	if (any_writable)
-		*any_writable = false;
-	if (any_young)
-		*any_young = false;
-	if (any_dirty)
-		*any_dirty = false;
 
 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
 	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
 	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
+	/*
+	 * Ensure this is a pointer to a copy not a pointer into a page table.
+	 * If this is a stack value, it won't be a valid virtual address, but
+	 * that's fine because it also cannot be pointing into the page table.
+	 */
+	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
 
 	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
 	max_nr = min_t(unsigned long, max_nr,
@@ -279,12 +291,12 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;
 
-		if (any_writable)
-			*any_writable |= pte_write(pte);
-		if (any_young)
-			*any_young |= pte_young(pte);
-		if (any_dirty)
-			*any_dirty |= pte_dirty(pte);
+		if (flags & FPB_MERGE_WRITE)
+			any_writable |= pte_write(pte);
+		if (flags & FPB_MERGE_YOUNG_DIRTY) {
+			any_young |= pte_young(pte);
+			any_dirty |= pte_dirty(pte);
+		}
 
 		cur_nr = pte_batch_hint(ptep, pte);
 		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
@@ -292,6 +304,13 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 		nr += cur_nr;
 	}
 
+	if (any_writable)
+		*ptentp = pte_mkwrite(*ptentp, vma);
+	if (any_young)
+		*ptentp = pte_mkyoung(*ptentp);
+	if (any_dirty)
+		*ptentp = pte_mkdirty(*ptentp);
+
 	return min(nr, max_nr);
 }
 
diff --git a/mm/madvise.c b/mm/madvise.c
index fe363a14daab3..9de9b7c797c63 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -344,13 +344,12 @@ static inline bool can_do_file_pageout(struct vm_area_struct *vma)
 
 static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 					  struct folio *folio, pte_t *ptep,
-					  pte_t pte, bool *any_young,
-					  bool *any_dirty)
+					  pte_t *ptentp)
 {
 	int max_nr = (end - addr) / PAGE_SIZE;
 
-	return folio_pte_batch_flags(folio, ptep, pte, max_nr, 0, NULL,
-				     any_young, any_dirty);
+	return folio_pte_batch_flags(folio, NULL, ptep, ptentp, max_nr,
+				     FPB_MERGE_YOUNG_DIRTY);
 }
 
 static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
@@ -488,13 +487,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 		 * next pte in the range.
 		 */
 		if (folio_test_large(folio)) {
-			bool any_young;
-
-			nr = madvise_folio_pte_batch(addr, end, folio, pte,
-						     ptent, &any_young, NULL);
-			if (any_young)
-				ptent = pte_mkyoung(ptent);
-
+			nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
 			if (nr < folio_nr_pages(folio)) {
 				int err;
 
@@ -724,11 +717,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 		 * next pte in the range.
 		 */
 		if (folio_test_large(folio)) {
-			bool any_young, any_dirty;
-
-			nr = madvise_folio_pte_batch(addr, end, folio, pte,
-						     ptent, &any_young, &any_dirty);
-
+			nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
 			if (nr < folio_nr_pages(folio)) {
 				int err;
 
@@ -753,11 +742,6 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
 					nr = 0;
 				continue;
 			}
-
-			if (any_young)
-				ptent = pte_mkyoung(ptent);
-			if (any_dirty)
-				ptent = pte_mkdirty(ptent);
 		}
 
 		if (folio_test_swapcache(folio) || folio_test_dirty(folio)) {
diff --git a/mm/memory.c b/mm/memory.c
index 26a82b82863b0..0269edb520987 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -972,10 +972,9 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		 pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long addr,
 		 int max_nr, int *rss, struct folio **prealloc)
 {
+	fpb_t flags = FPB_MERGE_WRITE;
 	struct page *page;
 	struct folio *folio;
-	bool any_writable;
-	fpb_t flags = 0;
 	int err, nr;
 
 	page = vm_normal_page(src_vma, addr, pte);
@@ -995,8 +994,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		if (vma_soft_dirty_enabled(src_vma))
 			flags |= FPB_RESPECT_SOFT_DIRTY;
 
-		nr = folio_pte_batch_flags(folio, src_pte, pte, max_nr, flags,
-					   &any_writable, NULL, NULL);
+		nr = folio_pte_batch_flags(folio, src_vma, src_pte, &pte, max_nr, flags);
 		folio_ref_add(folio, nr);
 		if (folio_test_anon(folio)) {
 			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
@@ -1010,8 +1008,6 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 			folio_dup_file_rmap_ptes(folio, page, nr, dst_vma);
 			rss[mm_counter_file(folio)] += nr;
 		}
-		if (any_writable)
-			pte = pte_mkwrite(pte, src_vma);
 		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
 				    addr, nr);
 		return nr;
diff --git a/mm/util.c b/mm/util.c
index cf41edceec7d2..ce826ca82a11d 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1197,6 +1197,6 @@ EXPORT_SYMBOL(compat_vma_mmap_prepare);
 unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
 		unsigned int max_nr)
 {
-	return folio_pte_batch_flags(folio, ptep, pte, max_nr, 0, NULL, NULL, NULL);
+	return folio_pte_batch_flags(folio, NULL, ptep, &pte, max_nr, 0);
 }
 #endif /* CONFIG_MMU */
-- 
2.49.0

