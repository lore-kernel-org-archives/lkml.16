Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5325BEFE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453380; cv=none; b=GLBrfm1lRq9ZHD7FG5u36C56CG+d6gmXa6ctlS8mOxA3jj9IB37Rljc+pXnNNYVS2IwwY3mz/DjvLAYkeK+M8/Juj3rHF190RMrc1msvd71/j2mhAScjSyQgzKXWG+CQSzefXPNiA7ZDgtXPflhTIPjNHx92SdmY0mFoi5HXMeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453380; c=relaxed/simple;
	bh=plRQfGzNNXIV+20HCi83sjnczPExr4J+Xynr2Ax4ACg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMS4eyTGMDtHXvHug3cOgE8qFwcGij0vIJE9x8hPhHljPwSQQ+St0yRjDCuJMjvkfQdaXWJGoNlVnNX5z9V39HWth/wj3maAlTRN5XJqaU0mCclV+x9rYcOEoCfkiS1ZPyHnwRWbkxKzu1+nUiaFV6Nx/gGPP99i11a+zkfCxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WdvUTeTL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WdvUTeTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdSzsUX0r6Sl18OoUi8XlsHVLZGeoeHXJaQLdIlqVew=;
	b=WdvUTeTLEelQMJ0O1STY6qqe6Erw7N40VSoEwwE9sGhfwhky2jneT5NB9Pq7ZFeic5uTYM
	CGijz3aQZfndeNp05NSIqGcmqYOkJRo6aBb1TEnZ6spRCQbjno7iejq8D0FmR+cxCtsfrh
	59UdcqseionJo3aCMl19WNtH/XRQu8U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-qoLKK1wJMdybJQHbddU2rg-1; Wed, 02 Jul 2025 06:49:37 -0400
X-MC-Unique: qoLKK1wJMdybJQHbddU2rg-1
X-Mimecast-MFC-AGG-ID: qoLKK1wJMdybJQHbddU2rg_1751453376
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so3098261f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453376; x=1752058176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdSzsUX0r6Sl18OoUi8XlsHVLZGeoeHXJaQLdIlqVew=;
        b=Y980vnjbGvILL7jFMZ/jB+BXnbAootzCYHaxdh7uloluA6gc+Aecup5QgqZpnV05E1
         w//yEiK+K6/k9WKChdAsW2ZHswwRV0IPyFGA0MNJ3GxDM7TgTvJIXmta6IyLauFW8gHO
         bQW09VnmjL6qn/rlu86gSBhhMXZlqu5cE0971OsNYbKnvezIF1IKqeu2mm33fHcSa2rS
         jgtftky3uxSlBk2NNOEUGNMkvIV+DZkBg32u/+z2GBlr/91AjAuIQepHf6Xvz06OxAZQ
         hssakJNwAZCUkz+8In28959XLNFUpx1olXMmrwzdXmHZJOfmIKRQlO219MHHom8HeSQ/
         XWTQ==
X-Gm-Message-State: AOJu0YyQqi74rxItVBaRDqsbP/0mJenTScUxUL09RPdYk6Zm5r0S0JNV
	ukNecJu6aoT36Y36MaEoEMGiRYHpcE1Omk8sfMOvPZprAgxILSPcbh0F65eNAwcVujidFC2TazY
	Bk1sv3VkDuh/n48YTgXQaheb1G+56kHMmb0toWQPKk2Z3nvZg7ou35g0KDe64wyX3kOfj6tCY01
	Y3iHBQG5uJ+y28/x/Tim+MAy3cyNh76xi36OSZZme4VgvemMOP
X-Gm-Gg: ASbGncsc10i8Jq+IPdJlx3aKl6fqz/DtSufzPPhgRAHNPttZb0PzHckWalVLbgVYiqY
	cqiT+r0K5D1pKc7BbtukmFKUzDvThU0HWTg92SVQ79YYgwhqzrVAxjtqFzLh23phmbilMQEbR21
	UXg9cxfCHUsno2coPb+j/Prqmq1y35/hwfdyJkvb8sKlRYyRm9j6nN9xB5VgiLyiZp0o2RlOyMi
	38QrxZfUnalMhzY0IOCNagjx3/4MAKlf8YhGxnUTEksYxSxmmOYPLfQ36MqJfx1jzbu6o3K828a
	7MCA+Tf8koUvOtSG
X-Received: by 2002:a5d:64e8:0:b0:3a5:2ec5:35a9 with SMTP id ffacd0b85a97d-3b1fdf024d3mr1851818f8f.3.1751453375559;
        Wed, 02 Jul 2025 03:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjFtDc8oNq3Sjw8kwMyszC7GGt08Dk1rENRIs8iM2js5xYxb1Rg+m2Mck5dqr0G+VSIa7Ztw==
X-Received: by 2002:a5d:64e8:0:b0:3a5:2ec5:35a9 with SMTP id ffacd0b85a97d-3b1fdf024d3mr1851758f8f.3.1751453374854;
        Wed, 02 Jul 2025 03:49:34 -0700 (PDT)
Received: from localhost ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f918sm15668044f8f.100.2025.07.02.03.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:49:34 -0700 (PDT)
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
Subject: [PATCH v2 3/4] mm: split folio_pte_batch() into folio_pte_batch() and folio_pte_batch_flags()
Date: Wed,  2 Jul 2025 12:49:25 +0200
Message-ID: <20250702104926.212243-4-david@redhat.com>
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

Many users (including upcoming ones) don't really need the flags etc,
and can live with the possible overhead of a function call.

So let's provide a basic, non-inlined folio_pte_batch(), to avoid code
bloat while still providing a variant that optimizes out all flag
checks at runtime. folio_pte_batch_flags() will get inlined into
folio_pte_batch(), optimizing out any conditionals that depend on input
flags.

folio_pte_batch() will behave like folio_pte_batch_flags() when no
flags are specified. It's okay to add new users of
folio_pte_batch_flags(), but using folio_pte_batch() if applicable is
preferred.

So, before this change, folio_pte_batch() was inlined into the C file
optimized by propagating constants within the resulting object file.

With this change, we now also have a folio_pte_batch() that is
optimized by propagating all constants. But instead of having one instance
per object file, we have a single shared one.

In zap_present_ptes(), where we care about performance, the compiler
already seem to generate a call to a common inlined folio_pte_batch()
variant, shared with fork() code. So calling the new non-inlined variant
should not make a difference.

While at it, drop the "addr" parameter that is unused.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/linux-mm/20250503182858.5a02729fcffd6d4723afcfc2@linux-foundation.org/
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h  | 11 ++++++++---
 mm/madvise.c   |  4 ++--
 mm/memory.c    |  8 +++-----
 mm/mempolicy.c |  3 +--
 mm/mlock.c     |  3 +--
 mm/mremap.c    |  3 +--
 mm/rmap.c      |  3 +--
 mm/util.c      | 29 +++++++++++++++++++++++++++++
 8 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index dba1346ded972..6c92956ac4fd9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -218,9 +218,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 }
 
 /**
- * folio_pte_batch - detect a PTE batch for a large folio
+ * folio_pte_batch_flags - detect a PTE batch for a large folio
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
+static inline unsigned int folio_pte_batch_flags(struct folio *folio,
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
index 661bb743d2216..fe363a14daab3 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -349,8 +349,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 {
 	int max_nr = (end - addr) / PAGE_SIZE;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, 0, NULL,
-			       any_young, any_dirty);
+	return folio_pte_batch_flags(folio, ptep, pte, max_nr, 0, NULL,
+				     any_young, any_dirty);
 }
 
 static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
diff --git a/mm/memory.c b/mm/memory.c
index 0a47583ca9937..26a82b82863b0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -995,8 +995,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 		if (vma_soft_dirty_enabled(src_vma))
 			flags |= FPB_RESPECT_SOFT_DIRTY;
 
-		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr, flags,
-				     &any_writable, NULL, NULL);
+		nr = folio_pte_batch_flags(folio, src_pte, pte, max_nr, flags,
+					   &any_writable, NULL, NULL);
 		folio_ref_add(folio, nr);
 		if (folio_test_anon(folio)) {
 			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
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
index 98ed3e49e8bbe..a15939453c41a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1868,8 +1868,7 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 	if (pte_unused(pte))
 		return 1;
 
-	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 0,
-			       NULL, NULL, NULL);
+	return folio_pte_batch(folio, pvmw->pte, pte, max_nr);
 }
 
 /*
diff --git a/mm/util.c b/mm/util.c
index 0b270c43d7d12..cf41edceec7d2 100644
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
+ * This is a simplified variant of folio_pte_batch_flags().
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
+	return folio_pte_batch_flags(folio, ptep, pte, max_nr, 0, NULL, NULL, NULL);
+}
+#endif /* CONFIG_MMU */
-- 
2.49.0

