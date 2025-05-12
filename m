Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293C381AF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747018645; cv=none; b=RSL53mIh3SSJv3Eoma4ADP1ojAqjhkwyi7URVLpTzRGI3wY3FnNuV+s294Y8GpSfLXXyeEaYTevLEMEEVEH/JTDy8LjcY7rrg7gorvNIN+ilFTMB+ZqxZRK47c3lTlEadLpwXT3ma36vW8o61EXadATdfoyPUognU8rqMmzfOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747018645; c=relaxed/simple;
	bh=8jcCbCGPRF9j9gxfu7C7ogkon8w/3qpLF/dFLtryrXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixQdS1B6SbZirkvvFOV2J76hBWDa7PYhSN5mHXPdTm1KQrtM9LgGHQnlo+7a3CgjVk01bFOEnw2/V+9zUjoC7B6w/Sdh0YyFSKB3Vab3eI5Qey5UXpY8TP5+l+b83Gs6fUa2LRH5fEsQiSyEN5H314LxVHoXrXsruTQ1uX8TgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ckT1JmUG; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ckT1JmUG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747018640; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=PyJc3K6r4UwcpFe6wy9ZHDQCmkxdwkGl4rZwFtFT4DI=;
	b=ckT1JmUG077NnRQ8v54MPlKwDp1+PQ4z7Am2V11FM+lQQukyFaaTYKuDU9igaF2ghUh0uW3MIgdEQN50pV+45NOC5TnNZK3UiuUKTh7SKRLdkEJS7pgiftLRaDEgUNwlBhDQQzOAmQKXhkQP+GAtaZNimEO/3VU32GlK+OacVtE=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WaChNWA_1747018637 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 May 2025 10:57:18 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	david@redhat.com
Cc: hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ziy@nvidia.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] mm: khugepaged: convert set_huge_pmd() to take a folio
Date: Mon, 12 May 2025 10:57:11 +0800
Message-ID: <110c3e1ec5fe7854a0e2c95ffcbc985817180ed7.1747017104.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've already gotten the stable locked folio in collapse_pte_mapped_thp(),
so just use folio for set_huge_pmd() to set the PMD entry, which is more
straightforward.

Moreover, we will check the folio size in do_set_pmd(), so we can remove
the unnecessary VM_BUG_ON() in set_huge_pmd(). While we are at it, we can
also remove the PageTransHuge(), as it currently has no callers.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
Changes from v2:
 - Update the releated comments.
 - Pass the 'page' for set_huge_pmd().
 - Add acked tag from David.

Changes from v1:
 - Remove the unnecessary VM_BUG_ON().
 - Remove the PageTransHuge().
---
 include/linux/page-flags.h | 15 ---------------
 mm/khugepaged.c            | 11 +++++------
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 37b11f15dbd9..1c1d49554c71 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -907,20 +907,6 @@ FOLIO_FLAG_FALSE(partially_mapped)
 #define PG_head_mask ((1UL << PG_head))
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-/*
- * PageHuge() only returns true for hugetlbfs pages, but not for
- * normal or transparent huge pages.
- *
- * PageTransHuge() returns true for both transparent huge and
- * hugetlbfs pages, but not normal pages. PageTransHuge() can only be
- * called only in the core VM paths where hugetlbfs pages can't exist.
- */
-static inline int PageTransHuge(const struct page *page)
-{
-	VM_BUG_ON_PAGE(PageTail(page), page);
-	return PageHead(page);
-}
-
 /*
  * PageTransCompound returns true for both transparent huge pages
  * and hugetlbfs pages, so it should only be called when it's known
@@ -931,7 +917,6 @@ static inline int PageTransCompound(const struct page *page)
 	return PageCompound(page);
 }
 #else
-TESTPAGEFLAG_FALSE(TransHuge, transhuge)
 TESTPAGEFLAG_FALSE(TransCompound, transcompound)
 #endif
 
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b04b6a770afe..33daea8f667e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1465,9 +1465,9 @@ static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
 }
 
 #ifdef CONFIG_SHMEM
-/* hpage must be locked, and mmap_lock must be held */
+/* folio must be locked, and mmap_lock must be held */
 static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
-			pmd_t *pmdp, struct page *hpage)
+			pmd_t *pmdp, struct folio *folio, struct page *page)
 {
 	struct vm_fault vmf = {
 		.vma = vma,
@@ -1476,13 +1476,12 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 		.pmd = pmdp,
 	};
 
-	VM_BUG_ON(!PageTransHuge(hpage));
 	mmap_assert_locked(vma->vm_mm);
 
-	if (do_set_pmd(&vmf, hpage))
+	if (do_set_pmd(&vmf, page))
 		return SCAN_FAIL;
 
-	get_page(hpage);
+	folio_get(folio);
 	return SCAN_SUCCEED;
 }
 
@@ -1689,7 +1688,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 maybe_install_pmd:
 	/* step 5: install pmd entry */
 	result = install_pmd
-			? set_huge_pmd(vma, haddr, pmd, &folio->page)
+			? set_huge_pmd(vma, haddr, pmd, folio, &folio->page)
 			: SCAN_SUCCEED;
 	goto drop_folio;
 abort:
-- 
2.43.5

