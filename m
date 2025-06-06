Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAC1BF58
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193357; cv=none; b=DLlr1uH4Pyp7mrhpJcaQlS93uTD1aL1HfSqYcmbub93rtTmLHIizVuapY8DujaFQjOPv2/2HsLHgtqakVwwTjeSXdiSkcH1sH/wYk0gEggOWAH60tNm79Z0Z/jhgMiFoh02z61xHekW1aypuPtd+l96KhsPUxwPrHjITAwN3FCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193357; c=relaxed/simple;
	bh=WZpvh8twhZKeYn8n5M47CATl7KMxz/7YeF7UTgrpTdU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RzECEBNU6qzw+hmYbBl/YxZIHqWdzfjfZqtCYy21RrYcLzh6XjZ/e0vB4LeF/6tCqENP5ju1QO4H66FLJpszd3PesFrOnJTzqJhY4y2srj9/cuVvWh+qtLZAIiHf/vT+uXxJg+qyY+KABEOT4g77E+do1GYmu6Tw2xY0lwUDoco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bDBx80NVxz2Cf50;
	Fri,  6 Jun 2025 14:58:36 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 0011A140295;
	Fri,  6 Jun 2025 15:02:24 +0800 (CST)
Received: from huawei.com (10.175.124.71) by kwepemg100017.china.huawei.com
 (7.202.181.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Jun
 2025 15:02:24 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <akpm@linux-foundation.org>, <vbabka@suse.cz>
CC: <surenb@google.com>, <jackmanb@google.com>, <hannes@cmpxchg.org>,
	<ziy@nvidia.com>, <wangkefeng.wang@huawei.com>, <mawupeng1@huawei.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] mm: Drain PCP during direct reclaim
Date: Fri, 6 Jun 2025 14:59:30 +0800
Message-ID: <20250606065930.3535912-1-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemg100017.china.huawei.com (7.202.181.58)

Memory retained in Per-CPU Pages (PCP) caches can prevent hugepage
allocations from succeeding despite sufficient free system memory. This
occurs because:
1. Hugepage allocations don't actively trigger PCP draining
2. Direct reclaim path fails to trigger drain_all_pages() when:
   a) All zone pages are free/hugetlb (!did_some_progress)
   b) Compaction skips due to costly order watermarks (COMPACT_SKIPPED)

Reproduction:
  - Alloc page and free the page via put_page to release to pcp
  - Observe hugepage reservation failure

Solution:
  Actively drain PCP during direct reclaim for memory allocations.
  This increases page allocation success rate by making stranded pages
  available to any order allocations.

Verification:
  This issue can be reproduce easily in zone movable with the following
  step:

w/o this patch
  # numactl -m 2 dd if=/dev/urandom of=/dev/shm/testfile bs=4k count=64
  # rm -f /dev/shm/testfile
  # sync
  # echo 3 > /proc/sys/vm/drop_caches
  # echo 2048 > /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
  # cat /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
    2029

w/ this patch
  # numactl -m 2 dd if=/dev/urandom of=/dev/shm/testfile bs=4k count=64
  # rm -f /dev/shm/testfile
  # sync
  # echo 3 > /proc/sys/vm/drop_caches
  # echo 2048 > /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
  # cat /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
    2047

Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
---
 mm/page_alloc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2ef3c07266b3..464f2e48651e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4137,28 +4137,22 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask, unsigned int order,
 {
 	struct page *page = NULL;
 	unsigned long pflags;
-	bool drained = false;
 
 	psi_memstall_enter(&pflags);
 	*did_some_progress = __perform_reclaim(gfp_mask, order, ac);
-	if (unlikely(!(*did_some_progress)))
-		goto out;
-
-retry:
-	page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
+	if (likely(*did_some_progress))
+		page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
 
 	/*
 	 * If an allocation failed after direct reclaim, it could be because
 	 * pages are pinned on the per-cpu lists or in high alloc reserves.
 	 * Shrink them and try again
 	 */
-	if (!page && !drained) {
+	if (!page) {
 		unreserve_highatomic_pageblock(ac, false);
 		drain_all_pages(NULL);
-		drained = true;
-		goto retry;
+		page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
 	}
-out:
 	psi_memstall_leave(&pflags);
 
 	return page;
-- 
2.43.0

