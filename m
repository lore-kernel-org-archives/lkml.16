Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E412C159F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025326; cv=none; b=qPPH5U/HWmtc/QssQ5ruIobi9nyTukjvxuY3h1NTnV/+tOoBePjE0OvwjVgSvGJrgMkBxds4XGBIAEkW4yjSSWpdFlefBatBqJPbq6yYFldu2SiOX9YiEkrlVwidAMe/rrNWVq9DngiA0wX1R4maSSTUMxbYYXhR3AE+KiCOV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025326; c=relaxed/simple;
	bh=QbExF6UdC/4KMzcunSfl3aChhZfOoMBJxxIvhw28ioM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJyYogfUMoCbNPft3NOmh3/zHl8zqeC4YNFzyI8tSbImPTvgMuLAEC9dTI9YmBJEyN4uCv9TSR2BkOoH1IDxALgG5okxPp0wxpQ1TqaIxi3DDKO5uJ57wIc1o0HdxF4onpl9ottTaEgzoYC10l4f5mnSTR/f2FzX3Cwh+n0+g2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h7ECdWcg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h7ECdWcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZhWbC449/E85Qp2hCEAAjgYYQkjVjspJG+Io0Fb7Zmc=;
	b=h7ECdWcgN7bU12y3gRtVRRZMABx0qyneT/lai+bxLhvcpeFttNwdtfBERcddYQqYqU9++b
	6a4RlUDnls8PmWFI7uZIU/l+j90xwajND8aiQcLsAYChv4+VbCS1h4FgzBBn0A/7ueCFO/
	a5IQCpHUmHrqdTeaoGJGQ6Hof+JNOyc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-j6Q8hs76NkqdDd3Jzo6HTg-1; Fri, 27 Jun 2025 07:55:22 -0400
X-MC-Unique: j6Q8hs76NkqdDd3Jzo6HTg-1
X-Mimecast-MFC-AGG-ID: j6Q8hs76NkqdDd3Jzo6HTg_1751025321
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso1018057f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025321; x=1751630121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhWbC449/E85Qp2hCEAAjgYYQkjVjspJG+Io0Fb7Zmc=;
        b=etu4VDhJC1N4iPwqQIj1LaFWI1tqrz61Kfyh4ylklbYstxhn85ZXDjn0d5AfYPW5B0
         qmghQ1w0Mc/iUKi6sNw+zgFnzK8n4gte5dPVEuxrseLTkmw8GSk4R45PL4vZmqhYrWHR
         vkm3TT31W3p7+MtTD8tuWh0wYM+9rQzwic7yZsuUUl+MpIKsMDwu6fNRYc4MImbk2Bh9
         sM54Z1On5UP6vVvc7aiBpi5tXRGegYRj53/+LAXTAEKCly6E1XhYdzrnoj07kQSDaiVd
         IR2xcjB4LjdxzHJXFnfaVvUqv/rurfzALAjoVCRCd2hlxziunZwoV4jY2ZbokwBlsw4O
         UIdQ==
X-Gm-Message-State: AOJu0YwuC5HV8qxKfr6Lq2XIzGpD6QZP+Baxy8+iqeUG6P7ZS53DH1uu
	ziIgX4yv8hDMZH8jNTTcogUQagiANdlfdk1K8ouUWB5IDtWWkO5yzVTujK3gdR/Homhwb1hmNXm
	qCtwebzxWt6vdcrMSBm7bRmo+SLARZftK93+/eXGqWIr25urK+pFjyDiwUXtcZuouRdEpessDf1
	+QImRH30Z9MReyfgRE+uWTqmQxntsStM5IluEszEjs8c/R6XsD
X-Gm-Gg: ASbGnctPTOCkZ7mEG68VH3tv0zy1hvUwxTH8mTWAKJm+WL8RQo6FbUDEh3zxPStUMmX
	gYetLXGE50mRacY8Sy7f2QzlPHNhKBxE50F2HVKzRuV8CCGRPN3UC28838bGTE4K2+cc3kGhx0Q
	jlyy2brglDdY8/y5LgL5pQzn8JwrtEhZoqNiNAd0GxhX0mtgUPl9lF7ZNF1vlNd1+5bzDkktzHU
	/p3nzjBtZnivu8AVXtEbL4OlOPTFGvqXXgy57vdgyPL6VwPDaCrNKUWDKIs1RF72C6kEvohzWSr
	p4qMmKmKaotirhuteLLWP98G4UTmzmJ4lu9dJUnZiZY+UFps6DoERMsqlFD3TAHp64X3iHc9pxy
	DLCQyfrM=
X-Received: by 2002:a05:6000:2a87:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a9008552e3mr2658202f8f.52.1751025320910;
        Fri, 27 Jun 2025 04:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDzWYzFV7FIhOpxS4HJCkd6UekDTy08Rd1STdD7Tfk9DLCZIZKNyDvYVpLpxawpg4A1Yk2Vg==
X-Received: by 2002:a05:6000:2a87:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a9008552e3mr2658153f8f.52.1751025320297;
        Fri, 27 Jun 2025 04:55:20 -0700 (PDT)
Received: from localhost (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52c99sm2473415f8f.49.2025.06.27.04.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:55:19 -0700 (PDT)
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
Subject: [PATCH v1 4/4] mm: remove boolean output parameters from folio_pte_batch_ext()
Date: Fri, 27 Jun 2025 13:55:10 +0200
Message-ID: <20250627115510.3273675-5-david@redhat.com>
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
 mm/internal.h | 58 +++++++++++++++++++++++++++++++--------------------
 mm/madvise.c  | 26 +++++------------------
 mm/memory.c   |  8 ++-----
 mm/util.c     |  2 +-
 4 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 6000b683f68ee..fe69e21b34a24 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -208,6 +208,18 @@ typedef int __bitwise fpb_t;
 /* Compare PTEs honoring the soft-dirty bit. */
 #define FPB_HONOR_SOFT_DIRTY		((__force fpb_t)BIT(1))
 
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
 	if (!(flags & FPB_HONOR_DIRTY))
@@ -220,16 +232,11 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 /**
  * folio_pte_batch_ext - detect a PTE batch for a large folio
  * @folio: The large folio to detect a PTE batch for.
+ * @vma: The VMA. Only relevant with FPB_MERGE_WRITE, otherwise can be NULL.
  * @ptep: Page table pointer for the first entry.
- * @pte: Page table entry for the first page.
+ * @ptentp: Pointer at a copy of the first page table entry.
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
@@ -242,28 +249,26 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * must be limited by the caller so scanning cannot exceed a single VMA and
  * a single page table.
  *
+ * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
+ * be modified.
+ *
  * This function will be inlined to optimize based on the input parameters;
  * consider using folio_pte_batch() instead if applicable.
  *
  * Return: the number of table entries in the batch.
  */
 static inline unsigned int folio_pte_batch_ext(struct folio *folio,
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
+	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
 
 	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
 	max_nr = min_t(unsigned long, max_nr,
@@ -279,12 +284,12 @@ static inline unsigned int folio_pte_batch_ext(struct folio *folio,
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
@@ -292,6 +297,13 @@ static inline unsigned int folio_pte_batch_ext(struct folio *folio,
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
index 9b9c35a398ed0..dce8f5e8555cb 100644
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
 
-	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL,
-				   any_young, any_dirty);
+	return folio_pte_batch_ext(folio, NULL, ptep, ptentp, max_nr,
+				   FPB_MERGE_YOUNG_DIRTY);
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
index 43d35d6675f2e..985d09bee44fd 100644
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
 			flags |= FPB_HONOR_SOFT_DIRTY;
 
-		nr = folio_pte_batch_ext(folio, src_pte, pte, max_nr, flags,
-				     &any_writable, NULL, NULL);
+		nr = folio_pte_batch_ext(folio, src_vma, src_pte, &pte, max_nr, flags);
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
index d29dcc135ad28..19d1a5814fac7 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1197,6 +1197,6 @@ EXPORT_SYMBOL(compat_vma_mmap_prepare);
 unsigned int folio_pte_batch(struct folio *folio, pte_t *ptep, pte_t pte,
 		unsigned int max_nr)
 {
-	return folio_pte_batch_ext(folio, ptep, pte, max_nr, 0, NULL, NULL, NULL);
+	return folio_pte_batch_ext(folio, NULL, ptep, &pte, max_nr, 0);
 }
 #endif /* CONFIG_MMU */
-- 
2.49.0

