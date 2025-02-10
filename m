Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E62628C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739152699; cv=none; b=UBq2rfKqxb9qi7axK06Ruid25dGJWnUQyfWvXSgG+ks+bLvkPkLRREx5KX4b1ie0Fp9xhueqbZZbN2jQgbwqkcqX0FafyMphpay2pmmEDUfty+O7LkMgxKEHMilwElFJH3g8M4Pgx8r3+H7drZj6abqJR3FV3k6Fz2d6meBCA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739152699; c=relaxed/simple;
	bh=XUrrHRWytIEDHe71W0a0Ed6Mtjvpw0cu1lsWlMHCaSQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=IRuFhYon6hGa0WSgg33OarMxByyupulwf9IV5gnFt9wdGs2oxnd0aUGW3KPRKGDe/glze+nHKSfFxMKZYVbG+FodRyU49oYBiHBnQv5NLO3NiLrVNiexk3IoKgJP3FMNftwJgoWhX99SM0Ck2cc1vhK+P2CuqLxojbJ7DVCibX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Bd+RXmFn; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Bd+RXmFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=Q3Xj9GzrFFmpq/2ACr
	EPZg39Mv76RqsgUb3eYGwsiN0=; b=Bd+RXmFnajMe770FLYJrO+Q0nO/greOli2
	74AnjNPj7prwWXhL3Sg5Tfbse+qAei2xKHSSJMjWtscBazrbPk012HOnqqjR01Yk
	H+NGxRR8cKlDdPF6bfzco14G3u3okanQE8W4pzg8bwVP6zU/t5jWhIbUwdAaNvWX
	ztiNnVHpY=
Received: from hg-OptiPlex-7040.hygon.cn (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3N3O3XKlnw57OAg--.49629S2;
	Mon, 10 Feb 2025 09:56:08 +0800 (CST)
From: yangge1116@126.com
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	21cnbao@gmail.com,
	david@redhat.com,
	baolin.wang@linux.alibaba.com,
	aisheng.dong@nxp.com,
	liuzixing@hygon.cn,
	yangge <yangge1116@126.com>
Subject: [PATCH V2] mm/cma: using per-CMA locks to improve concurrent allocation performance
Date: Mon, 10 Feb 2025 09:56:06 +0800
Message-Id: <1739152566-744-1-git-send-email-yangge1116@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:_____wD3N3O3XKlnw57OAg--.49629S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF17Xr43tr1rCry8WF43trb_yoW5Zw1kpr
	WrWw1DJry5Xr17Zw1UAayq9rnY9wn29FWUKFWFva4fZ3ZxAr909r1rta45uF48urZ7WFyS
	vry0q3y5Za1UZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRoCJQUUUUU=
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbifgLvG2epUJ-RIwAAs7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: yangge <yangge1116@126.com>

For different CMAs, concurrent allocation of CMA memory ideally should not
require synchronization using locks. Currently, a global cma_mutex lock is
employed to synchronize all CMA allocations, which can impact the
performance of concurrent allocations across different CMAs.

To test the performance impact, follow these steps:
1. Boot the kernel with the command line argument hugetlb_cma=30G to
   allocate a 30GB CMA area specifically for huge page allocations. (note:
   on my machine, which has 3 nodes, each node is initialized with 10G of
   CMA)
2. Use the dd command with parameters if=/dev/zero of=/dev/shm/file bs=1G
   count=30 to fully utilize the CMA area by writing zeroes to a file in
   /dev/shm.
3. Open three terminals and execute the following commands simultaneously:
   (Note: Each of these commands attempts to allocate 10GB [2621440 * 4KB
   pages] of CMA memory.)
   On Terminal 1: time echo 2621440 > /sys/kernel/debug/cma/hugetlb1/alloc
   On Terminal 2: time echo 2621440 > /sys/kernel/debug/cma/hugetlb2/alloc
   On Terminal 3: time echo 2621440 > /sys/kernel/debug/cma/hugetlb3/alloc

We attempt to allocate pages through the CMA debug interface and use the
time command to measure the duration of each allocation.
Performance comparison:
             Without this patch      With this patch
Terminal1        ~7s                     ~7s
Terminal2       ~14s                     ~8s
Terminal3       ~21s                     ~7s

To slove problem above, we could use per-CMA locks to improve concurrent
allocation performance. This would allow each CMA to be managed
independently, reducing the need for a global lock and thus improving
scalability and performance.

Signed-off-by: yangge <yangge1116@126.com>
---

V2:
- update code and message suggested by Barry. 

 mm/cma.c | 7 ++++---
 mm/cma.h | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 34a4df2..a0d4d2f 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -34,7 +34,6 @@
 
 struct cma cma_areas[MAX_CMA_AREAS];
 unsigned int cma_area_count;
-static DEFINE_MUTEX(cma_mutex);
 
 static int __init __cma_declare_contiguous_nid(phys_addr_t base,
 			phys_addr_t size, phys_addr_t limit,
@@ -175,6 +174,8 @@ static void __init cma_activate_area(struct cma *cma)
 
 	spin_lock_init(&cma->lock);
 
+	mutex_init(&cma->alloc_mutex);
+
 #ifdef CONFIG_CMA_DEBUGFS
 	INIT_HLIST_HEAD(&cma->mem_head);
 	spin_lock_init(&cma->mem_head_lock);
@@ -813,9 +814,9 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 		spin_unlock_irq(&cma->lock);
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
-		mutex_lock(&cma_mutex);
+		mutex_lock(&cma->alloc_mutex);
 		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
-		mutex_unlock(&cma_mutex);
+		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
 			break;
diff --git a/mm/cma.h b/mm/cma.h
index df7fc62..41a3ab0 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -39,6 +39,7 @@ struct cma {
 	unsigned long	available_count;
 	unsigned int order_per_bit; /* Order of pages represented by one bit */
 	spinlock_t	lock;
+	struct mutex alloc_mutex;
 #ifdef CONFIG_CMA_DEBUGFS
 	struct hlist_head mem_head;
 	spinlock_t mem_head_lock;
-- 
2.7.4

