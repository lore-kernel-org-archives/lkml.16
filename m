Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C823E47B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395475; cv=none; b=q3pfQZNdjI/6nN66fEoE8baCDrDjUD9t0YO0/09L17Jt0UBwVAATzOVhjKsaYpmcvznI/TYU9U/VsUuXml88F+tMGzQ+d6bW4WgzaFcwkzYv8gIJkF+ekGFW+2z9Ro1vJ3xfYBk0WgzXP+hNKZXwc2taDZM01v4dA2Ut7rvnzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395475; c=relaxed/simple;
	bh=awl/7E1ji534cXc/ww/L2rcWUhrfX+LPnJudYVkFZ5c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNmDSar8mLlACbQZk5NQZDP9mz3RDUPr1ovhUZ2SvXFNEClHNKk26eaBb1JH5l7s/MBgQ0vVzl9dofmIFPniTBdIrhWbZAhGB0i6JVAnse6u+a0Rxdj61sqyYcOD7yMElnlGIUEI7sAELBuFGWM4UVccDs3CUsE7hp2gqBYm5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Wenjie Xu <xuwenjie04@baidu.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <akpm@linux-foundation.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Wenjie Xu
	<xuwenjie04@baidu.com>, Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] hugetlb: two-phase hugepage allocation when reservation is high
Date: Fri, 16 May 2025 19:35:52 +0800
Message-ID: <20250516113552.17648-1-xuwenjie04@baidu.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) To
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43)
X-FEAS-Client-IP: 10.127.64.36
X-FE-Policy-ID: 52:10:53:SYSTEM

When the total reserved hugepages account for 95% or more of system RAM
(common in cloud computing on physical servers), allocating them all in one
go can starve the rest of the kernel and lead to OOM during early boot.

The previous hugetlb vmemmap batching change (91f386bf0772) can worsen
peak memory pressure under these conditions by deferring page frees,
exacerbating allocation failures. To prevent this, split the allocation
into two equal batches whenever
huge_reserved_pages >= total_base_pages * 95ULL / 100UL.

This change does not alter the number of padata worker threads per batch;
it merely introduces a second round of padata_do_multithreaded(). The added
overhead of restarting the worker threads is minimal.

Fixes: 91f386bf0772 ("hugetlb: batch freeing of vmemmap pages")

Co-developed-by: Li RongQing <lirongqing@baidu.com>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Signed-off-by: Wenjie Xu <xuwenjie04@baidu.com>
---
 mm/hugetlb.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6ea1be71aa42..7bdcaab6f7ec 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3616,12 +3616,21 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
 		.numa_aware	= true
 	};
 
+	unsigned long huge_pages;
+	int i, hugetlb_page_alloc_iter;
+
+	unsigned long total_base_pages = totalram_pages();
+	unsigned long huge_reserved_pages = h->max_huge_pages << h->order;
+
+	hugetlb_page_alloc_iter = (huge_reserved_pages >= total_base_pages * 95ULL / 100UL)
+				 ? 2 : 1;
+
+	huge_pages = h->max_huge_pages / hugetlb_page_alloc_iter;
+
 	unsigned long jiffies_start;
 	unsigned long jiffies_end;
 
 	job.thread_fn	= hugetlb_pages_alloc_boot_node;
-	job.start	= 0;
-	job.size	= h->max_huge_pages;
 
 	/*
 	 * job.max_threads is 25% of the available cpu threads by default.
@@ -3645,10 +3654,17 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
 	}
 
 	job.max_threads	= hugepage_allocation_threads;
-	job.min_chunk	= h->max_huge_pages / hugepage_allocation_threads;
+	job.min_chunk	= huge_pages / hugepage_allocation_threads;
 
 	jiffies_start = jiffies;
-	padata_do_multithreaded(&job);
+	for (i = 0; i < hugetlb_page_alloc_iter; i++) {
+		job.start = huge_pages * i;
+		job.size = (i + 1 == hugetlb_page_alloc_iter)
+			 ? h->max_huge_pages - huge_pages * i
+			 : huge_pages;
+		padata_do_multithreaded(&job);
+	}
+
 	jiffies_end = jiffies;
 
 	pr_info("HugeTLB: allocation took %dms with hugepage_allocation_threads=%ld\n",
-- 
2.41.0

