Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF701EB5DD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609987; cv=none; b=iY5SRNgTXWgM85uerP4gbOmX62IPzmNBbAiGOziK21fvljBQlXNG9bwomOFCFx8nbUSJf/jweC0p8Y5ek8v3p8qt2ih7tSjzwAp/mAFoNXaCt8oCdggkK0uMWQluvs4w23vgukf3RZ4t+NvxYSjf7ni8e/Ywd7Cv1QnQk9diMio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609987; c=relaxed/simple;
	bh=edb1F0ELtb6ma+5nvYAcL+6DNpG8qMzqeCimtjZQEuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qD2rdZlv5Rwk2327zU5kpaZf9jC3HjqP+XvJ6WjGiJUMaeYadaXRjccGSf+2lAdcKOanrOmCZWiP4nWPPVnNGhs+aAekG1AqlVLUGGzUQYKJJhJC+7u3rJRafEykwf8gvzRiCuNwiE47hC3NQBm06SokVD/4KMIVqjC1TvIczoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=X4VnYI8a; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="X4VnYI8a"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746609981; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=SPbYJw55rv/PzjxTaZakdI9TN7HDp9a+IFeGVFn/9gY=;
	b=X4VnYI8aRBCrfpBk9ZghE9TgzHfcD2bIa0/DouYk+7XrY8iRjrPfTfebQNZTws1uTZZBhSJNqEQz1a26hHKqQOm5l9hCgmepNnGbblYl1Clsgr5MGrvCBMZW9ZNmfAjCFvugYiECf+t+mJRptcouzEYcJR91s9ABHDfXETLRUus=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZopYX-_1746609978 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 17:26:19 +0800
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
Subject: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
Date: Wed,  7 May 2025 17:26:13 +0800
Message-ID: <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
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

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mm.h |  2 +-
 mm/filemap.c       |  3 +--
 mm/khugepaged.c    |  2 +-
 mm/memory.c        | 12 ++++++------
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43748c8f3454..e00d81b9eb2a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1237,7 +1237,7 @@ static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
 	return pte;
 }
 
-vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page);
+vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio);
 void set_pte_range(struct vm_fault *vmf, struct folio *folio,
 		struct page *page, unsigned int nr, unsigned long addr);
 
diff --git a/mm/filemap.c b/mm/filemap.c
index 7b90cbeb4a1a..fbf8d7b76ab7 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3532,8 +3532,7 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct folio *folio,
 	}
 
 	if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
-		struct page *page = folio_file_page(folio, start);
-		vm_fault_t ret = do_set_pmd(vmf, page);
+		vm_fault_t ret = do_set_pmd(vmf, folio);
 		if (!ret) {
 			/* The page is mapped successfully, reference consumed. */
 			folio_unlock(folio);
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0215ef6095d9..575a3384d046 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1479,7 +1479,7 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 	VM_BUG_ON(!folio_test_large(folio));
 	mmap_assert_locked(vma->vm_mm);
 
-	if (do_set_pmd(&vmf, &folio->page))
+	if (do_set_pmd(&vmf, folio))
 		return SCAN_FAIL;
 
 	folio_get(folio);
diff --git a/mm/memory.c b/mm/memory.c
index 68c1d962d0ad..0f5c8d8d59b0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5176,14 +5176,14 @@ static void deposit_prealloc_pte(struct vm_fault *vmf)
 	vmf->prealloc_pte = NULL;
 }
 
-vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
+vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
 {
-	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = vmf->vma;
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
 	pmd_t entry;
 	vm_fault_t ret = VM_FAULT_FALLBACK;
+	struct page *page;
 
 	/*
 	 * It is too late to allocate a small folio, we already have a large
@@ -5251,7 +5251,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
 	return ret;
 }
 #else
-vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
+vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
 {
 	return VM_FAULT_FALLBACK;
 }
@@ -5345,6 +5345,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 	else
 		page = vmf->page;
 
+	folio = page_folio(page);
 	/*
 	 * check even for read faults because we might have lost our CoWed
 	 * page
@@ -5356,8 +5357,8 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 	}
 
 	if (pmd_none(*vmf->pmd)) {
-		if (PageTransCompound(page)) {
-			ret = do_set_pmd(vmf, page);
+		if (folio_test_pmd_mappable(folio)) {
+			ret = do_set_pmd(vmf, folio);
 			if (ret != VM_FAULT_FALLBACK)
 				return ret;
 		}
@@ -5368,7 +5369,6 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 			return VM_FAULT_OOM;
 	}
 
-	folio = page_folio(page);
 	nr_pages = folio_nr_pages(folio);
 
 	/*
-- 
2.43.5

