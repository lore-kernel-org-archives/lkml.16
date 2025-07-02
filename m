Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993012571D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453379; cv=none; b=t3252SmwaGwZ+K3U8p6f7m+0U8HszjneN0MhcAiP4vMp6PBPrRszMLRQf7aRsd6EYu0IFXSbjv9tsf1tt7YfbODeUExPHTBdb8SYOAjEY/NidGzfmRYp8qdb6Z6MDL3iICW6UlQdewZvkomC1yYim8TMBhcC/LITLo1gxVg9Qgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453379; c=relaxed/simple;
	bh=mbpxhWXUwl1lWdA+zRmdbhqQLXQzQ8VkXVmBdJJDKwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A22BVLKhyql3we1ohN+FeLCUYP1HnRPJFQMpWK3Ue+tWonRXAagCGIs/3Pt/+AcGZCaPKM3/NE/dIXrBxxrETNlXMk452gNblK5urC7ZOKYSnvnD/pzRUHaLhjGsi/OUPBGjOYkczk/FBNC8mvwPqlS8sK/CWGe9NIyV78r3aKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4KSuoON; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4KSuoON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPISzlN4Ef+CieamPDhRbk3MzYno0ZPxQFyByj0IeiE=;
	b=N4KSuoONw+0+Mhq4nHRO35wE9LmU4aRolMRm2YYuL4dzBOs5fjzmB5SU0V6wouJiZptdtP
	zmz0+JZLMSaiJDzZno0ee0xxSxCbfrUBxKEE9y5yBn/B/ckA2aPaQAPajZRezyJ+BvKEUp
	wkcdDgbzbZb+b4XWiKtypPdq76v9C3c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-0ZTNDZsmNtSWSUrM_BCQuA-1; Wed, 02 Jul 2025 06:49:35 -0400
X-MC-Unique: 0ZTNDZsmNtSWSUrM_BCQuA-1
X-Mimecast-MFC-AGG-ID: 0ZTNDZsmNtSWSUrM_BCQuA_1751453374
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so29915765e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453374; x=1752058174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPISzlN4Ef+CieamPDhRbk3MzYno0ZPxQFyByj0IeiE=;
        b=o4rA3+Mx1xtZQGvWBYJQ0XruC9SrFKCSGNOvGdOel5U3dJte7PluUvBszTO5mROmV0
         bN16wQfA0m/kSDel6hA2brIsliglTJ4sy6Z1V/UQAHrrv+/ER2tHKDuXeyIc2GKV5NiP
         9rslvadnjWBx7D1y3GT4/m6DxOsYK9gKDitZX9LwkzoOXNbiPdLlT7VFvpDRFWXZIG2/
         vOzAQiaPepJFaQ71+gDbeYlI00fPyqiMhFhLUTKDkOviYpMXfKIac2rRuUyMM0LeT5nu
         r/TCBVxUiDw4qnYJhSi+ADeI3LjktKQEmOVKroKuffBI4W1VC8K3SvA+/fTfm4nQe1fE
         6hjg==
X-Gm-Message-State: AOJu0YzkcbXKCYRFLlfl7rZ+fj7kb78TYpnjPPZN48GsfSgZmnB/FIw3
	inN6zcnUT3ssZq7mPl4mKtfIMGDB2OveJW1i6bj73Y9SI88elIupBzUyPvqapvShZhqoStmvvjh
	V5/QvxQixRiyLuqxivySzd92j5scLL7bDYTeCfYU9CeQwsDlGRuBJk3oLdP+kpfJoNzTw1IjaT+
	m2sOg55uZx+ViCD4w0dArlCGM2Spcy9WiesAQXXbyxFrABTYmm
X-Gm-Gg: ASbGncv7iKALfRxnXFtkvMgJtwxgHMDQRULQv5vfGy+0deLQZQrv0WzCQusr9+jAOjd
	emM5s09Ejfrf7o/GnMBPEvGzCmOj3xc4SGPgvc2XDZduamKPwISd1P2+YMOxfJ7RZhQyrGq0rZi
	JAYF73kgi26wVgCb3x+G8HNWlbVJhxI1fne42WTO5OztrK7je+8+4d7XzcQ0v5A7vPd/pXX93uq
	20AshWCbFT1a/vyERStquk3hIJ0e9xNF4ixbzKWfaHYz/N9OrmddS236ieYY/sNeZmujC/09NCm
	YglZCPaSc84aF/Ll
X-Received: by 2002:a05:600c:6992:b0:453:8a63:b484 with SMTP id 5b1f17b1804b1-454a373837cmr28268995e9.30.1751453373768;
        Wed, 02 Jul 2025 03:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHQPoDIN7PwQ921rzZl2n7gXmku1+dhq1oXexaGTT/h4Oq5IhCFDNuSHNV22agwohZ0LPOxg==
X-Received: by 2002:a05:600c:6992:b0:453:8a63:b484 with SMTP id 5b1f17b1804b1-454a373837cmr28268245e9.30.1751453372813;
        Wed, 02 Jul 2025 03:49:32 -0700 (PDT)
Received: from localhost ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b6d50sm227736465e9.30.2025.07.02.03.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:49:32 -0700 (PDT)
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
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v2 2/4] mm: smaller folio_pte_batch() improvements
Date: Wed,  2 Jul 2025 12:49:24 +0200
Message-ID: <20250702104926.212243-3-david@redhat.com>
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

Let's clean up a bit:

(1) No need for start_ptep vs. ptep anymore, we can simply use ptep.

(2) Let's switch to "unsigned int" for everything. Negative values do
    not make sense.

(3) We can simplify the code by leaving the pte unchanged after the
    pte_same() check.

(4) Clarify that we should never exceed a single VMA; it indicates a
    problem in the caller.

No functional change intended.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 170d55b6851ff..dba1346ded972 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -221,7 +221,7 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * folio_pte_batch - detect a PTE batch for a large folio
  * @folio: The large folio to detect a PTE batch for.
  * @addr: The user virtual address the first page is mapped at.
- * @start_ptep: Page table pointer for the first entry.
+ * @ptep: Page table pointer for the first entry.
  * @pte: Page table entry for the first page.
  * @max_nr: The maximum number of table entries to consider.
  * @flags: Flags to modify the PTE batch semantics.
@@ -233,24 +233,24 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  *		  first one is dirty.
  *
  * Detect a PTE batch: consecutive (present) PTEs that map consecutive
- * pages of the same large folio.
+ * pages of the same large folio in a single VMA and a single page table.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
  * the accessed bit, writable bit, dirty bit (unless FPB_RESPECT_DIRTY is set)
  * and soft-dirty bit (unless FPB_RESPECT_SOFT_DIRTY is set).
  *
- * start_ptep must map any page of the folio. max_nr must be at least one and
- * must be limited by the caller so scanning cannot exceed a single page table.
+ * @ptep must map any page of the folio. max_nr must be at least one and
+ * must be limited by the caller so scanning cannot exceed a single VMA and
+ * a single page table.
  *
  * Return: the number of table entries in the batch.
  */
-static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
+static inline unsigned int folio_pte_batch(struct folio *folio, unsigned long addr,
+		pte_t *ptep, pte_t pte, unsigned int max_nr, fpb_t flags,
 		bool *any_writable, bool *any_young, bool *any_dirty)
 {
-	pte_t expected_pte, *ptep;
-	bool writable, young, dirty;
-	int nr, cur_nr;
+	unsigned int nr, cur_nr;
+	pte_t expected_pte;
 
 	if (any_writable)
 		*any_writable = false;
@@ -267,29 +267,22 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 	max_nr = min_t(unsigned long, max_nr,
 		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
 
-	nr = pte_batch_hint(start_ptep, pte);
+	nr = pte_batch_hint(ptep, pte);
 	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
-	ptep = start_ptep + nr;
+	ptep = ptep + nr;
 
 	while (nr < max_nr) {
 		pte = ptep_get(ptep);
-		if (any_writable)
-			writable = !!pte_write(pte);
-		if (any_young)
-			young = !!pte_young(pte);
-		if (any_dirty)
-			dirty = !!pte_dirty(pte);
-		pte = __pte_batch_clear_ignored(pte, flags);
 
-		if (!pte_same(pte, expected_pte))
+		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;
 
 		if (any_writable)
-			*any_writable |= writable;
+			*any_writable |= pte_write(pte);
 		if (any_young)
-			*any_young |= young;
+			*any_young |= pte_young(pte);
 		if (any_dirty)
-			*any_dirty |= dirty;
+			*any_dirty |= pte_dirty(pte);
 
 		cur_nr = pte_batch_hint(ptep, pte);
 		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
-- 
2.49.0

