Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A618EAB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747119443; cv=none; b=jK5Gsi81thgwOIDbZjVkr9mHBN3rkW9/NQVCcI0gxiwegMUxF3VA7wVH1EXqFeJHNnJjsNotSBNZEUJoRCMVGvnsRBgbUttQ/DE8PgCmyZ/iYl4/g+Snl8wn6sxADdjc+u/pOWxsfWgNis3DvRECFBaTgdR2T06oeuxHampoj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747119443; c=relaxed/simple;
	bh=wWBSbQEhRhPMzGf67h4+e4/npWtlFLmds1lYZF9ydfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlayXwGfKMTDjDV7ypqz+YuUTxhXSmOjxdnU9uXGOaKBYBIsbBqYfpEn8o+ib0fT6b7IGa1WWJaVK0UuVyMYpXBHtE4LlcOivp3sGrZeGM/1eBKdIInwsqQ2XaJzS4f5eoTQUnUzrdeBKo2WMHtJ2B7Z7x5Juwsh3qci7ig/Ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QEXSuvJO; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QEXSuvJO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747119435; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=edxi2BtbIftkD9Lsw4c9tFqAnSMnCehdjxij2qYlJH4=;
	b=QEXSuvJOmCeruRXV9rWKcRYZ9EPxPPdgX47DbvnUDfZixpJhvVluHYvS455Eqhd7aIBseGI90rkeluQd/MfsgpdCFqB2IobeXuiOeBKW5d1PVTOfhiUDE95OQLr7TTte9pyfvxo6FJBst2RPGboRER8wuB7XXM5X63kySglRbKA=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WaVI5CS_1747119433 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 13 May 2025 14:57:14 +0800
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
Subject: [PATCH] mm: khugepaged: decouple SHMEM and file folios' collapse
Date: Tue, 13 May 2025 14:56:35 +0800
Message-ID: <ce5c2314e0368cf34bda26f9bacf01c982d4da17.1747119309.git.baolin.wang@linux.alibaba.com>
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
Acked-by: David Hildenbrand <david@redhat.com>
---
Changes from RFC:
 - Add acked tag from David. Thanks.
 - Remove CONFIG_SHMEM in khugepaged.h file.
---
 include/linux/khugepaged.h |  8 --------
 mm/Kconfig                 |  2 +-
 mm/khugepaged.c            | 13 ++-----------
 3 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
index 1f46046080f5..b8d69cfbb58b 100644
--- a/include/linux/khugepaged.h
+++ b/include/linux/khugepaged.h
@@ -15,16 +15,8 @@ extern void khugepaged_enter_vma(struct vm_area_struct *vma,
 				 unsigned long vm_flags);
 extern void khugepaged_min_free_kbytes_update(void);
 extern bool current_is_khugepaged(void);
-#ifdef CONFIG_SHMEM
 extern int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 				   bool install_pmd);
-#else
-static inline int collapse_pte_mapped_thp(struct mm_struct *mm,
-					  unsigned long addr, bool install_pmd)
-{
-	return 0;
-}
-#endif
 
 static inline void khugepaged_fork(struct mm_struct *mm, struct mm_struct *oldmm)
 {
diff --git a/mm/Kconfig b/mm/Kconfig
index d4fd40f56178..79237842f7e2 100644
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

