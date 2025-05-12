Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D54C9F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020075; cv=none; b=r/bzszDFKcQ3mLL9eWZCZcb+wWsZM742RA0eunjwr0pYV19rAbeNGLgci7UGmWPBObA3hdqlAP8shhG15JjebbxTSJ4PGDu1pfusk71hGNSOG+vW0suiCGfPJ5h3HC512sxDFBE8EPHJ0me639g7lPK9CrWw1u63csXOWYGxhd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020075; c=relaxed/simple;
	bh=CtgSI+fxJjRVmqJ0Bmssr0UvRjViGI5ip8ljBsPka10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9Hp4b1Wr5A5A8HuBIekPX/wrnJpIESlGD4O/EuhCaSY0ef3KYbxhfo1rLxS3KRCRS3/WbQJIJYM16Nsm+0Q+KbkirBPf4ALx/2aiJJiFHbhTJAAqU1MAi14+fXfVRnOLeIa8OoX/RXUEZ8PJH2zE+TFL5D0LfkaVZl6H+6Fq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tyepGDtA; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tyepGDtA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747020065; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1aGuh4vY0PJLLvfAz43qLbcJbyRGl4IJ+D+IC93jcM4=;
	b=tyepGDtAQUCsazT2nwTFk4cof5lH8RKlyZoIlTYiRYrjCc3m7Gbnw8MHKnJ1d4W99Fica0mY7alvSPkkKl2xTXuE54/8Py9EET3WMlPBc9gj+9/DdxcD5blpmpkplCBUC4Si8hy1B/R8Fho21yo3ojyvhYJG0DNKZF8Q1+mpqrI=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WaCtNT0_1747020063 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 May 2025 11:21:03 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@redhat.com
Cc: lorenzo.stoakes@oracle.com,
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
Subject: [RFC PATCH] mm: khugepaged: decouple SHMEM and file folios' collapse
Date: Mon, 12 May 2025 11:20:52 +0800
Message-ID: <fbdbb35301219f8fef5697006b58d82b045114f5.1747019851.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, the file pages collapse was intended for tmpfs/shmem to merge
into THP in the background. However, now not only tmpfs/shmem can support
large folios, but some other file systems (such as XFS, erofs ...) also
support large folios. Therefore, it is time to decouple the support of
file folios collapse from SHMEM.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/Kconfig      |  2 +-
 mm/khugepaged.c | 13 ++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 713b29232e94..42be19d82c7f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -898,7 +898,7 @@ config THP_SWAP
 
 config READ_ONLY_THP_FOR_FS
 	bool "Read-only THP for filesystems (EXPERIMENTAL)"
-	depends on TRANSPARENT_HUGEPAGE && SHMEM
+	depends on TRANSPARENT_HUGEPAGE
 
 	help
 	  Allow khugepaged to put read-only file-backed pages in THP.
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index ebcd7c8a4b44..cdf5a581368b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1464,7 +1464,6 @@ static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
 	}
 }
 
-#ifdef CONFIG_SHMEM
 /* folio must be locked, and mmap_lock must be held */
 static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 			pmd_t *pmdp, struct folio *folio, struct page *page)
@@ -2353,14 +2352,6 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 	trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result);
 	return result;
 }
-#else
-static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
-				    struct file *file, pgoff_t start,
-				    struct collapse_control *cc)
-{
-	BUILD_BUG();
-}
-#endif
 
 static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 					    struct collapse_control *cc)
@@ -2436,7 +2427,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			VM_BUG_ON(khugepaged_scan.address < hstart ||
 				  khugepaged_scan.address + HPAGE_PMD_SIZE >
 				  hend);
-			if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
+			if (!vma_is_anonymous(vma)) {
 				struct file *file = get_file(vma->vm_file);
 				pgoff_t pgoff = linear_page_index(vma,
 						khugepaged_scan.address);
@@ -2782,7 +2773,7 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 		mmap_assert_locked(mm);
 		memset(cc->node_load, 0, sizeof(cc->node_load));
 		nodes_clear(cc->alloc_nmask);
-		if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
+		if (!vma_is_anonymous(vma)) {
 			struct file *file = get_file(vma->vm_file);
 			pgoff_t pgoff = linear_page_index(vma, addr);
 
-- 
2.43.5

