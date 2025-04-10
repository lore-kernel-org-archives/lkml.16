Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C611372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267002; cv=none; b=QovVKQ8bRkAsPLmhxBxyPsKc99VLi2gaEwhEBk5nCibBaKQ+D/kyYw9Vj2gZa11hjPp/+/l6IudbJ2qKt0OqTN/bXGtdTATwC6WT7d5gkZfG3tRk/fSqq39EePMuNDe+wiOzZcIVK9W7BUk+ImK6lYVwybpf/PB7qjJ99BQuuq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267002; c=relaxed/simple;
	bh=VJXXc6yS61Zt3aKauy5XLMWk+Rcl7vqyHTDQlbGVC7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eDQ+toZohYT12suf0QYqg9p302BeFUM71cBaJMFhYrwET0PibdJq/Zh2HMAO1IzuBhk/V6j4m/Qfvgok+Ksvbggp+fP0XKS7qn9g3JqZ0YGAobb/F5Jm46ePoq+sZlYQVRc/rFD/hG2JzeB9zFoTTIcYfzWj/XKIswWvZ6NUEzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZY9490GX2z2Cdmm;
	Thu, 10 Apr 2025 14:33:13 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 936D11A0188;
	Thu, 10 Apr 2025 14:36:36 +0800 (CST)
Received: from huawei.com (10.175.124.71) by kwepemg100017.china.huawei.com
 (7.202.181.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Apr
 2025 14:36:35 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <akpm@linux-foundation.org>, <mike.kravetz@oracle.com>,
	<david@redhat.com>, <joshua.hahnjy@gmail.com>
CC: <muchun.song@linux.dev>, <mawupeng1@huawei.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Date: Thu, 10 Apr 2025 14:26:33 +0800
Message-ID: <20250410062633.3102457-1-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemg100017.china.huawei.com (7.202.181.58)

During our testing with hugetlb subpool enabled, we observe that
hstate->resv_huge_pages may underflow into negative values. Root cause
analysis reveals a race condition in subpool reservation fallback handling
as follow:

hugetlb_reserve_pages()
    /* Attempt subpool reservation */
    gbl_reserve = hugepage_subpool_get_pages(spool, chg);

    /* Global reservation may fail after subpool allocation */
    if (hugetlb_acct_memory(h, gbl_reserve) < 0)
        goto out_put_pages;

out_put_pages:
    /* This incorrectly restores reservation to subpool */
    hugepage_subpool_put_pages(spool, chg);

When hugetlb_acct_memory() fails after subpool allocation, the current
implementation over-commits subpool reservations by returning the full
'chg' value instead of the actual allocated 'gbl_reserve' amount. This
discrepancy propagates to global reservations during subsequent releases,
eventually causing resv_huge_pages underflow.

This problem can be trigger easily with the following steps:
1. reverse hugepage for hugeltb allocation
2. mount hugetlbfs with min_size to enable hugetlb subpool
3. alloc hugepages with two task(make sure the second will fail due to
   insufficient amount of hugepages)
4. with for a few seconds and repeat step 3 which will make
   hstate->resv_huge_pages to go below zero.

To fix this problem, return corrent amount of pages to subpool during the
fallback after hugepage_subpool_get_pages is called.

Fixes: 1c5ecae3a93f ("hugetlbfs: add minimum size accounting to subpools")
Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/hugetlb.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 39f92aad7bd1e..50bd1fe3ab400 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3010,7 +3010,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 	struct hugepage_subpool *spool = subpool_vma(vma);
 	struct hstate *h = hstate_vma(vma);
 	struct folio *folio;
-	long retval, gbl_chg;
+	long retval, gbl_chg, gbl_reserve;
 	map_chg_state map_chg;
 	int ret, idx;
 	struct hugetlb_cgroup *h_cg = NULL;
@@ -3163,8 +3163,16 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 		hugetlb_cgroup_uncharge_cgroup_rsvd(idx, pages_per_huge_page(h),
 						    h_cg);
 out_subpool_put:
-	if (map_chg)
-		hugepage_subpool_put_pages(spool, 1);
+	/*
+	 * put page to subpool iff the quota of subpool's rsv_hpages is used
+	 * during hugepage_subpool_get_pages.
+	 */
+	if (map_chg && !gbl_chg) {
+		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
+		hugetlb_acct_memory(h, -gbl_reserve);
+	}
+
+
 out_end_reservation:
 	if (map_chg != MAP_CHG_ENFORCED)
 		vma_end_reservation(h, vma, addr);
@@ -7216,7 +7224,7 @@ bool hugetlb_reserve_pages(struct inode *inode,
 					struct vm_area_struct *vma,
 					vm_flags_t vm_flags)
 {
-	long chg = -1, add = -1;
+	long chg = -1, add = -1, spool_resv, gbl_resv;
 	struct hstate *h = hstate_inode(inode);
 	struct hugepage_subpool *spool = subpool_inode(inode);
 	struct resv_map *resv_map;
@@ -7351,8 +7359,16 @@ bool hugetlb_reserve_pages(struct inode *inode,
 	return true;
 
 out_put_pages:
-	/* put back original number of pages, chg */
-	(void)hugepage_subpool_put_pages(spool, chg);
+	spool_resv = chg - gbl_reserve;
+	if (spool_resv) {
+		/* put sub pool's reservation back, chg - gbl_reserve */
+		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
+		/*
+		 * subpool's reserved pages can not be put back due to race,
+		 * return to hstate.
+		 */
+		hugetlb_acct_memory(h, -gbl_resv);
+	}
 out_uncharge_cgroup:
 	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
 					    chg * pages_per_huge_page(h), h_cg);
-- 
2.43.0

