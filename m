Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962D28EA45
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795699; cv=none; b=Ujsg0xewO64w6k90ziSaRNwPCZulmzyzPHB0IrdGW3DRqRpaen57Bw7H23NB3mD2pXBCOKzs+9mRfC3FHizeKpvyYCC6j/AXQWCbGTLQneBCXxyGytFgwU8M4VqVEjQL/aW8zLMZ4MIRAQYh6X++IhUslqD87O9xmjzqdHKlYtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795699; c=relaxed/simple;
	bh=Os34QkPsUxapPXKtp4qvwvK+U+l2R7dq6pJu+K/CLyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8XJGvuFQg9Up6OBlEOhw/6do7g3C7WQBtBPfmwZDp5WcZ50gDGmHbI9lF48h8AEzinE1NKSlBdf+vaS9TssCdHULGg8Q/KIHjy/8GpfwVE1RJp5XYQHVdtoGRRpGdKl/LW0UsmmQVdCwnbV2FEZuJsgGpWkT6DrMVpEHJEKQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kZwy5Zl7; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kZwy5Zl7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746795682; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=9s9+fSm3d9sYXbAKKWZ972t50BxpSt+iX1qvnN/E/ls=;
	b=kZwy5Zl72wux0DWuzEvT9CyBxpOyNOO1xUM9YJGM1MsJt7h0n+TQ96+6d7QHqcRrlOyJV7xR2xM83SdhI/4gqfQmTDupU8fQZnsEtg9ogVrvUqTfdwc19Q5/MRaNChRMJIiz0Qe7b8PJCnNdRerfv/z4DoGWHY7QWh2H5DzIKhk=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wa3fmW9_1746795680 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 21:01:21 +0800
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
Subject: [PATCH v2 2/2] mm: convert do_set_pmd() to take a folio
Date: Fri,  9 May 2025 21:01:04 +0800
Message-ID: <87097d3d5ef1d46959d09cfc7e192c4551b87771.1746795452.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <bc3d4638747e8141133676069336d868c2b2d360.1746795452.git.baolin.wang@linux.alibaba.com>
References: <bc3d4638747e8141133676069336d868c2b2d360.1746795452.git.baolin.wang@linux.alibaba.com>
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
---
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
index aca66e7f4fd9..c4b5031f3254 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1478,7 +1478,7 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	mmap_assert_locked(vma->vm_mm);
 
-	if (do_set_pmd(&vmf, &folio->page))
+	if (do_set_pmd(&vmf, folio, &folio->page))
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

