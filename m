Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E0248F62
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 02:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747018650; cv=none; b=j/t0NIIHJTV/4fOnq35I7ue73PJr5ttaYtsKrNuU2EdoXGC9mW5XYDDb4MKfvNmfe1AgH2naj67vefq4ST4DrMLkIBHLLDS7ADFeZOuN32x4EEQF7wPMouRHgQjbKMmH2DP0pIqITg5AGQqasuib+uOJ79IkWjlczuiMnyAe2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747018650; c=relaxed/simple;
	bh=ZtbLvJBzxvRSYcN5glkmuTVuIIMdVNa0/EYcYyLR6AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqnFd+143RMulJZZ5uaUmAI9ZxV7xJ8En5q/HyH/ySj3OuW6EE5bGwPyw2rzBGw3cN6sJYeKoQpZjm2doLZvC1dIeAbVzFoF6gWp39qgmheLhMCZKCpEcNvqGJBS0NRnXNjvbR05cbpHIr6GmDa7yxHhkmZvaiuqPrWIAMJHsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Bbka7HBK; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Bbka7HBK"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747018641; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=mPeFvP+FQPTExRpd018ev5w7o1ErZKGyo2JdMUchx80=;
	b=Bbka7HBKQ8+orT/MacEc1uJIz7ma4F6hqK7Vo63AsyeK0AXE0q9DzdHi5gMRbMXEbE4t20EzWmUPh+kbdz7D9EJWCDeRbQjgJr5d7RZqIUL91v5214Tto1XalycLwvWLffiCWVh2xSXSmIeFKvCEOhM97QehQxVCPIdhodFXgG8=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WaCm9jf_1747018639 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 May 2025 10:57:20 +0800
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
Subject: [PATCH v3 2/2] mm: convert do_set_pmd() to take a folio
Date: Mon, 12 May 2025 10:57:12 +0800
Message-ID: <9b488f4ecb4d3fd8634e3d448dd0ed6964482480.1747017104.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <110c3e1ec5fe7854a0e2c95ffcbc985817180ed7.1747017104.git.baolin.wang@linux.alibaba.com>
References: <110c3e1ec5fe7854a0e2c95ffcbc985817180ed7.1747017104.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In do_set_pmd(), we always use the folio->page to build PMD mappings for
the entire folio. Since all callers of do_set_pmd() already hold a stable
folio, converting do_set_pmd() to take a folio is safe and more straightforward.

In addition, to ensure the extensibility of do_set_pmd() for supporting
larger folios beyond PMD size, we keep the 'page' parameter to specify
which page within the folio should be mapped.

No functional changes expected.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
Changes from v2:
 - Add reviewed tag from Zi.

Changes from v1:
 - Keep the 'page' parameter of the do_set_pmd().

Note: I did mm selftests and built kernel on tmpfs/xfs filesystems, and
did not find any regression.
---
 include/linux/mm.h |  2 +-
 mm/filemap.c       |  2 +-
 mm/khugepaged.c    |  2 +-
 mm/memory.c        | 11 +++++------
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43748c8f3454..d5f578c91e77 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1237,7 +1237,7 @@ static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
 	return pte;
 }
 
-vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page);
+vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page);
 void set_pte_range(struct vm_fault *vmf, struct folio *folio,
 		struct page *page, unsigned int nr, unsigned long addr);
 
diff --git a/mm/filemap.c b/mm/filemap.c
index 7b90cbeb4a1a..09d005848f0d 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3533,7 +3533,7 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct folio *folio,
 
 	if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
 		struct page *page = folio_file_page(folio, start);
-		vm_fault_t ret = do_set_pmd(vmf, page);
+		vm_fault_t ret = do_set_pmd(vmf, folio, page);
 		if (!ret) {
 			/* The page is mapped successfully, reference consumed. */
 			folio_unlock(folio);
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 33daea8f667e..ebcd7c8a4b44 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1478,7 +1478,7 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	mmap_assert_locked(vma->vm_mm);
 
-	if (do_set_pmd(&vmf, page))
+	if (do_set_pmd(&vmf, folio, page))
 		return SCAN_FAIL;
 
 	folio_get(folio);
diff --git a/mm/memory.c b/mm/memory.c
index 68c1d962d0ad..9c202c32ca66 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5176,9 +5176,8 @@ static void deposit_prealloc_pte(struct vm_fault *vmf)
 	vmf->prealloc_pte = NULL;
 }
 
-vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
+vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
 {
-	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = vmf->vma;
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
@@ -5251,7 +5250,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
 	return ret;
 }
 #else
-vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
+vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *page)
 {
 	return VM_FAULT_FALLBACK;
 }
@@ -5345,6 +5344,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 	else
 		page = vmf->page;
 
+	folio = page_folio(page);
 	/*
 	 * check even for read faults because we might have lost our CoWed
 	 * page
@@ -5356,8 +5356,8 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 	}
 
 	if (pmd_none(*vmf->pmd)) {
-		if (PageTransCompound(page)) {
-			ret = do_set_pmd(vmf, page);
+		if (folio_test_pmd_mappable(folio)) {
+			ret = do_set_pmd(vmf, folio, page);
 			if (ret != VM_FAULT_FALLBACK)
 				return ret;
 		}
@@ -5368,7 +5368,6 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 			return VM_FAULT_OOM;
 	}
 
-	folio = page_folio(page);
 	nr_pages = folio_nr_pages(folio);
 
 	/*
-- 
2.43.5

