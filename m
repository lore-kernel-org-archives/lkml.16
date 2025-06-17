Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82412EF658
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170462; cv=none; b=TMYDLQlQZAki5pJEBw40/a8z76GmCEITCNJHf0my0O+yFs7WrP1uAF4OwEnhAWGmq2FvG8lx+Rj0UQ6icQQiavAxeP/H4C8Tb/GMcrXezGapANBuo5iNXHaLwrHj5yiO+Nl1HaZ6xhv93juSxGPaVGuK+prceB96meQy3jDCqWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170462; c=relaxed/simple;
	bh=790fOA7RxBVIZ/xoMWivZ6g0YL04wJEE8NPu4DME6eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVvC87RdXg112uyrjo+0ztBLhIMVUtr4IiYWL2x/ebStn6vhfXCP4e/ph2C4Q55/vK2P6G63TRF5FoN3r+o1PILB9OBgMevYTKlFbnvzzYJsfhBQimnPkAPpqA9FvOpZbVvJin+LeOXiyFa6GwZilGJxryw1dDhH4m+09CmMsTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQ1QN/E0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQ1QN/E0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk8AOrt1vmC16dsAcbo4Oj5HLTmpx2IIZZHPvU6hO0A=;
	b=BQ1QN/E0C1rhcNMN++3qKw8GAS2tQLgUntmiUQ8RTluvmEFNMoegl4oJ71eY60egXfndSs
	0tgRehLuWN6wgMq+rMubV3wgKUl/Zc0OV3DS2NrQ/LFo34qC6zpND2umhJmSRwa+n+DrJ+
	2PR9+DPZlwBGGtPdKAOkH8vNKanZp6U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-DWISZpDLPRuc0IZtUfGB1g-1; Tue,
 17 Jun 2025 10:27:34 -0400
X-MC-Unique: DWISZpDLPRuc0IZtUfGB1g-1
X-Mimecast-MFC-AGG-ID: DWISZpDLPRuc0IZtUfGB1g_1750170453
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42BA71955F37;
	Tue, 17 Jun 2025 14:27:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.174])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2D2019560B2;
	Tue, 17 Jun 2025 14:27:31 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: david@redhat.com,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lcapitulino@gmail.com,
	shivankg@amd.com
Subject: [RFC 1/3] mm: introduce snapshot_page()
Date: Tue, 17 Jun 2025 10:27:08 -0400
Message-ID: <48d49e3371c35a2da6f4c42d5d9f14b6476ff734.1750170418.git.luizcap@redhat.com>
In-Reply-To: <cover.1750170418.git.luizcap@redhat.com>
References: <cover.1750170418.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This commit refactors __dump_page() into snapshot_page().

snapshot_page() tries to take a faithful snapshot of a page and its
folio representation. The snapshot is returned in the struct
page_snapshot parameter along with additional flags that are best
retrieved at snapshot creation time to reduce race windows.

This function is intended to be used by callers that need a stable
representation of a struct page and struct folio so that pointers
or page information doesn't change while working on a page.

The idea and original implemenetation of snapshot_page() comes from
Matthew Wilcox with suggestions for improvements from David Hildenbrand.
All bugs and misconceptions are mine.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 include/linux/mm.h | 20 +++++++++++++
 mm/debug.c         | 42 +++------------------------
 mm/util.c          | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 38 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ef2ba0c667a..4d83674e32a7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4184,4 +4184,24 @@ static inline bool page_pool_page_is_pp(struct page *page)
 }
 #endif
 
+#define PAGE_SNAPSHOT_FAITHFUL     (1 << 0)
+#define PAGE_SNAPSHOT_PG_HUGE_ZERO (1 << 1)
+#define PAGE_SNAPSHOT_PG_FREE      (1 << 2)
+#define PAGE_SNAPSHOT_PG_IDLE      (1 << 3)
+
+struct page_snapshot {
+	struct folio folio_snapshot;
+	struct page page_snapshot;
+	unsigned long pfn;
+	unsigned long idx;
+	unsigned long flags;
+};
+
+static inline bool snapshot_page_is_faithful(const struct page_snapshot *ps)
+{
+	return ps->flags & 0x1;
+}
+
+void snapshot_page(struct page_snapshot *ps, const struct page *page);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/debug.c b/mm/debug.c
index 907382257062..7349330ea506 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -129,47 +129,13 @@ static void __dump_folio(struct folio *folio, struct page *page,
 
 static void __dump_page(const struct page *page)
 {
-	struct folio *foliop, folio;
-	struct page precise;
-	unsigned long head;
-	unsigned long pfn = page_to_pfn(page);
-	unsigned long idx, nr_pages = 1;
-	int loops = 5;
-
-again:
-	memcpy(&precise, page, sizeof(*page));
-	head = precise.compound_head;
-	if ((head & 1) == 0) {
-		foliop = (struct folio *)&precise;
-		idx = 0;
-		if (!folio_test_large(foliop))
-			goto dump;
-		foliop = (struct folio *)page;
-	} else {
-		foliop = (struct folio *)(head - 1);
-		idx = folio_page_idx(foliop, page);
-	}
+	struct page_snapshot ps;
 
-	if (idx < MAX_FOLIO_NR_PAGES) {
-		memcpy(&folio, foliop, 2 * sizeof(struct page));
-		nr_pages = folio_nr_pages(&folio);
-		if (nr_pages > 1)
-			memcpy(&folio.__page_2, &foliop->__page_2,
-			       sizeof(struct page));
-		foliop = &folio;
-	}
-
-	if (idx > nr_pages) {
-		if (loops-- > 0)
-			goto again;
+	snapshot_page(&ps, page);
+	if (!snapshot_page_is_faithful(&ps))
 		pr_warn("page does not match folio\n");
-		precise.compound_head &= ~1UL;
-		foliop = (struct folio *)&precise;
-		idx = 0;
-	}
 
-dump:
-	__dump_folio(foliop, &precise, pfn, idx);
+	__dump_folio(&ps.folio_snapshot, &ps.page_snapshot, ps.pfn, ps.idx);
 }
 
 void dump_page(const struct page *page, const char *reason)
diff --git a/mm/util.c b/mm/util.c
index 0b270c43d7d1..8c56e10aca5b 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1171,3 +1171,74 @@ int compat_vma_mmap_prepare(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 EXPORT_SYMBOL(compat_vma_mmap_prepare);
+
+static void set_flags(struct page_snapshot *ps, const struct folio *folio,
+		      const struct page *page)
+{
+	if (is_huge_zero_folio(folio))
+		ps->flags |= PAGE_SNAPSHOT_PG_HUGE_ZERO;
+	if (folio_ref_count(folio) == 0 && is_free_buddy_page(page))
+		ps->flags |= PAGE_SNAPSHOT_PG_FREE;
+	if (folio_test_idle(folio))
+		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+}
+
+/*
+ * Create a snapshot of a page and store its struct page and struct folio
+ * representations in a struct page_snapshot.
+ *
+ * @ps: struct page_snapshot to store the page snapshot
+ * @page: the page we want to snapshot
+ *
+ * Note that creating a faithful snapshot of a page may fail if the page
+ * compound keeps changing (eg. due to folio split). In this case we set
+ * ps->faithful to false and the snapshot will assume that @page refers
+ * to a single page.
+ */
+void snapshot_page(struct page_snapshot *ps, const struct page *page)
+{
+	unsigned long head, nr_pages = 1;
+	struct folio *foliop, folio;
+	int loops = 5;
+
+	ps->pfn = page_to_pfn(page);
+	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
+
+again:
+	memcpy(&ps->page_snapshot, page, sizeof(*page));
+	head = ps->page_snapshot.compound_head;
+	if ((head & 1) == 0) {
+		foliop = (struct folio *)&ps->page_snapshot;
+		ps->idx = 0;
+		if (!folio_test_large(foliop)) {
+			set_flags(ps, page_folio(page), page);
+			goto out;
+		}
+		foliop = (struct folio *)page;
+	} else {
+		foliop = (struct folio *)(page->compound_head - 1);
+		ps->idx = folio_page_idx(foliop, page);
+	}
+
+	if (ps->idx < MAX_FOLIO_NR_PAGES) {
+		memcpy(&folio, foliop, 2 * sizeof(struct page));
+		nr_pages = folio_nr_pages(&folio);
+		if (nr_pages > 1)
+			memcpy(&folio.__page_2, &foliop->__page_2,
+			       sizeof(struct page));
+		set_flags(ps, foliop, page);
+		foliop = &folio;
+	}
+
+	if (ps->idx > nr_pages) {
+		if (loops-- > 0)
+			goto again;
+		ps->page_snapshot.compound_head &= ~1UL;
+		foliop = (struct folio *)&ps->page_snapshot;
+		ps->flags = 0;
+		ps->idx = 0;
+	}
+
+out:
+	memcpy(&ps->folio_snapshot, foliop, sizeof(struct folio));
+}
-- 
2.49.0

