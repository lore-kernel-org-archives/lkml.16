Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6984A1EEE6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747246520; cv=none; b=qMKJ0arsc192WHj7FWVKbAEm3Oz4ZUANFifcXVhZtuyHkqyIU/gbenN3uaJVjuZ+kXzkdi256xOeGDtzyYFx9BvIWewzlwb2KTfS6GLNzsC3+HWdaTjyWroDMhgswxBd4t9vrviEdgGPWw/fKf43uBMvd2zagHeRMNtP8MBbVTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747246520; c=relaxed/simple;
	bh=sQBNDuoCCm0gZyBQPoLlardBIRQsVDb6bSdjodHqAOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TsaubgZquHpI/5ZsUGVTQu9hEdSJC7iATA3X50tfYjsXBaZ6QBHyE4sMHNEqKFTm1vRdR/zV5ZzGLoWMz4V5KrTac/DsnaqkZuiv62TQBz6dYRiOKTSI+9AcpBcZ+uUqZfcRiJcaNkxlasiLYC1zaS30I9wPbAjmiRpcQZSiMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RWCOTLaY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RWCOTLaY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N7Vo3IqgK9BkC8E4Aq4FOp4PU5nfnsaex4sJ5pt58us=; b=RWCOTLaYQIbC63QFYOO+pWgC5t
	R33CdUA6Rx2Yi5n35oBNV/APOweIUr8kWZyPE8TZWi5pcqM/AHNhgVsIe/TkXP/eHi2mQNHLkMBKt
	iXdI7RgkEjs+jK1mD0wwNYJc3sOPuT6PY9FwCmUe+6vaUB94hytT8VAu1VLJrsLg6AlrPJIZXBfu4
	NK09iR+tNrHN9A+iVMSVsi/GZxrfJ+VinSWHjn/l5YC3ArD7fizyyEazJm1MI8CSJEWuru36FdTyl
	pntPPR9MMdGNFnQoTjYcDMlT5Ra8JP4Mfa114lRAjyPNEBjxGc2rMkEliHqc8Hh7p4qQ5sWi3Huyg
	qWJvpRTg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGdN-0000000Cfal-2IgJ;
	Wed, 14 May 2025 18:15:13 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: Rename page->index to page->__folio_index
Date: Wed, 14 May 2025 19:15:07 +0100
Message-ID: <20250514181508.3019795-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All users of page->index have been converted to not refer to it any more.
Update a few pieces of documentation that were missed and prevent new
users from appearing (or at least make them easy to grep for).

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 arch/arm/mm/flush.c      | 4 ++--
 include/linux/mm.h       | 6 +++---
 include/linux/mm_types.h | 6 +++---
 kernel/futex/core.c      | 2 +-
 mm/filemap.c             | 4 ++--
 mm/memory.c              | 4 ++--
 mm/page-writeback.c      | 6 +++---
 mm/truncate.c            | 2 +-
 mm/zpdesc.h              | 4 ++--
 9 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 0749cf8a6637..5219158d54cf 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -227,9 +227,9 @@ void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
 	}
 
 	/*
-	 * If this is a page cache page, and we have an aliasing VIPT cache,
+	 * If this is a page cache folio, and we have an aliasing VIPT cache,
 	 * we only need to do one flush - which would be at the relevant
-	 * userspace colour, which is congruent with page->index.
+	 * userspace colour, which is congruent with folio->index.
 	 */
 	if (mapping && cache_is_vipt_aliasing())
 		flush_pfn_alias(folio_pfn(folio), folio_pos(folio));
diff --git a/include/linux/mm.h b/include/linux/mm.h
index dcdb798184ef..977b5e5b02eb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1500,9 +1500,9 @@ vm_fault_t finish_fault(struct vm_fault *vmf);
  * the page's disk buffers. PG_private must be set to tell the VM to call
  * into the filesystem to release these pages.
  *
- * A page may belong to an inode's memory mapping. In this case, page->mapping
- * is the pointer to the inode, and page->index is the file offset of the page,
- * in units of PAGE_SIZE.
+ * A folio may belong to an inode's memory mapping. In this case,
+ * folio->mapping points to the inode, and folio->index is the file
+ * offset of the folio, in units of PAGE_SIZE.
  *
  * If pagecache pages are not associated with an inode, they are said to be
  * anonymous pages. These may become associated with the swapcache, and in that
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 56d07edd01f9..86db7fc40021 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -108,7 +108,7 @@ struct page {
 			/* See page-flags.h for PAGE_MAPPING_FLAGS */
 			struct address_space *mapping;
 			union {
-				pgoff_t index;		/* Our offset within mapping. */
+				pgoff_t __folio_index;		/* Our offset within mapping. */
 				unsigned long share;	/* share count for fsdax */
 			};
 			/**
@@ -489,7 +489,7 @@ FOLIO_MATCH(flags, flags);
 FOLIO_MATCH(lru, lru);
 FOLIO_MATCH(mapping, mapping);
 FOLIO_MATCH(compound_head, lru);
-FOLIO_MATCH(index, index);
+FOLIO_MATCH(__folio_index, index);
 FOLIO_MATCH(private, private);
 FOLIO_MATCH(_mapcount, _mapcount);
 FOLIO_MATCH(_refcount, _refcount);
@@ -590,7 +590,7 @@ TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
 TABLE_MATCH(mapping, __page_mapping);
-TABLE_MATCH(index, pt_index);
+TABLE_MATCH(__folio_index, pt_index);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 TABLE_MATCH(page_type, __page_type);
 TABLE_MATCH(_refcount, __page_refcount);
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index cca15859a50b..ecd74370e216 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -206,7 +206,7 @@ static u64 get_inode_sequence_number(struct inode *inode)
  *
  * For shared mappings (when @fshared), the key is:
  *
- *   ( inode->i_sequence, page->index, offset_within_page )
+ *   ( inode->i_sequence, page offset within mapping, offset_within_page )
  *
  * [ also see get_inode_sequence_number() ]
  *
diff --git a/mm/filemap.c b/mm/filemap.c
index 7b90cbeb4a1a..9a9a82f37913 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -142,7 +142,7 @@ static void page_cache_delete(struct address_space *mapping,
 	xas_init_marks(&xas);
 
 	folio->mapping = NULL;
-	/* Leave page->index set: truncation lookup relies upon it */
+	/* Leave folio->index set: truncation lookup relies upon it */
 	mapping->nrpages -= nr;
 }
 
@@ -949,7 +949,7 @@ noinline int __filemap_add_folio(struct address_space *mapping,
 	return 0;
 error:
 	folio->mapping = NULL;
-	/* Leave page->index set: truncation relies upon it */
+	/* Leave folio->index set: truncation relies upon it */
 	folio_put_refs(folio, nr);
 	return xas_error(&xas);
 }
diff --git a/mm/memory.c b/mm/memory.c
index 18730fffa8e9..b6d8fe185888 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4579,8 +4579,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 
 		/*
 		 * KSM sometimes has to copy on read faults, for example, if
-		 * page->index of !PageKSM() pages would be nonlinear inside the
-		 * anon VMA -- PageKSM() is lost on actual swapout.
+		 * folio->index of non-ksm folios would be nonlinear inside the
+		 * anon VMA -- the ksm flag is lost on actual swapout.
 		 */
 		folio = ksm_might_need_to_copy(folio, vma, vmf->address);
 		if (unlikely(!folio)) {
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index c81624bc3969..339084d2c2f2 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2564,11 +2564,11 @@ struct folio *writeback_iter(struct address_space *mapping,
 	if (!folio) {
 		/*
 		 * To avoid deadlocks between range_cyclic writeback and callers
-		 * that hold pages in PageWriteback to aggregate I/O until
+		 * that hold folios in writeback to aggregate I/O until
 		 * the writeback iteration finishes, we do not loop back to the
-		 * start of the file.  Doing so causes a page lock/page
+		 * start of the file.  Doing so causes a folio lock/folio
 		 * writeback access order inversion - we should only ever lock
-		 * multiple pages in ascending page->index order, and looping
+		 * multiple folios in ascending folio->index order, and looping
 		 * back to the start of the file violates that rule and causes
 		 * deadlocks.
 		 */
diff --git a/mm/truncate.c b/mm/truncate.c
index 5d98054094d1..3c1bcdc3a3e9 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -421,7 +421,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
 			struct folio *folio = fbatch.folios[i];
 
-			/* We rely upon deletion not changing page->index */
+			/* We rely upon deletion not changing folio->index */
 
 			if (xa_is_value(folio))
 				continue;
diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index fa47fece2237..506eec5d98fe 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -51,8 +51,8 @@ struct zpdesc {
 ZPDESC_MATCH(flags, flags);
 ZPDESC_MATCH(lru, lru);
 ZPDESC_MATCH(mapping, movable_ops);
-ZPDESC_MATCH(index, next);
-ZPDESC_MATCH(index, handle);
+ZPDESC_MATCH(__folio_index, next);
+ZPDESC_MATCH(__folio_index, handle);
 ZPDESC_MATCH(private, zspage);
 ZPDESC_MATCH(page_type, first_obj_offset);
 ZPDESC_MATCH(_refcount, _refcount);
-- 
2.47.2

