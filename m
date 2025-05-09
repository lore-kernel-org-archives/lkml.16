Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCB4A00
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751543; cv=none; b=gmRdz4h+nRdU6LVQds6K3LNoSI3zgk7qHhV/YDA0hn7pTCTFkE6FyWt/doP0bpms/FBqa69Z1mww8vf7TnNWSvqULubZ0yoNoy1qRrJZq00RyWQkECkwQpCcbDyxasTx9odEzcLE430BQH8QDy2h4eQLH6hMUT/azcDMvqCC1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751543; c=relaxed/simple;
	bh=qewSU7Sq7g61DxSgIYVfGi2mLbJgj8aKyKmSToVQvU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dF0WnyuHpZT/HKLa5tWpT0fedtxd3FA4NlmUeFjFvWR1LWbldWHfeRjTl3gaelIu0Qb1nqC6AgYF/zzRzP0I18HfZsA6Ym2/4g5YPDvZlKhCTeSttQyGNJbvW5HOZobu6S7PGb8k0aVa9VYoDr8sDkl87JpM+9HqScKzDJVZ1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vvOkThBX; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vvOkThBX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746751531; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qjnjp9Z+cW5n7RR26tliecf8wD7X0OE0V0g/huCs4kU=;
	b=vvOkThBX8gR0s/1NcK0zObgKTZRWeufPlxN3lpeDSk+7I3aLIS8RcLlOt4VRxVZwNWQqr/NbxhqnE9iH51uhfZt0JawaCWtEY758YFHvu/5DKH8d1JOpIgVYYt3tByhBHpppKxe8UfLvC1ERtiTOXs+0jQRiEFeie/DPP6WiDSQ=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wa0xfSH_1746751530 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 08:45:31 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@redhat.com
Cc: 21cnbao@gmail.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process large folios
Date: Fri,  9 May 2025 08:45:21 +0800
Message-ID: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When I tested the mincore() syscall, I observed that it takes longer with
64K mTHP enabled on my Arm64 server. The reason is the mincore_pte_range()
still checks each PTE individually, even when the PTEs are contiguous,
which is not efficient.

Thus we can use pte_batch_hint() to get the batch number of the present
contiguous PTEs, which can improve the performance. I tested the mincore()
syscall with 1G anonymous memory populated with 64K mTHP, and observed an
obvious performance improvement:

w/o patch		w/ patch		changes
6022us			549us			+91%

Moreover, I also tested mincore() with disabling mTHP/THP, and did not
see any obvious regression for base pages.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Changes from v2:
- Re-calculate the max_nr, per Barry.
Changes from v1:
- Change to use pte_batch_hint() to get the batch number, per Ryan.

Note: I observed the min_t() can introduce a slight performance regression
for base pages, so I change to add a batch size check for base pages,
which can resolve the performance regression issue.
---
 mm/mincore.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/mm/mincore.c b/mm/mincore.c
index 832f29f46767..42d6c9c8da86 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -21,6 +21,7 @@
 
 #include <linux/uaccess.h>
 #include "swap.h"
+#include "internal.h"
 
 static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
 			unsigned long end, struct mm_walk *walk)
@@ -105,6 +106,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *ptep;
 	unsigned char *vec = walk->private;
 	int nr = (end - addr) >> PAGE_SHIFT;
+	int step, i;
 
 	ptl = pmd_trans_huge_lock(pmd, vma);
 	if (ptl) {
@@ -118,16 +120,26 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		walk->action = ACTION_AGAIN;
 		return 0;
 	}
-	for (; addr != end; ptep++, addr += PAGE_SIZE) {
+	for (; addr != end; ptep += step, addr += step * PAGE_SIZE) {
 		pte_t pte = ptep_get(ptep);
 
+		step = 1;
 		/* We need to do cache lookup too for pte markers */
 		if (pte_none_mostly(pte))
 			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
 						 vma, vec);
-		else if (pte_present(pte))
-			*vec = 1;
-		else { /* pte is a swap entry */
+		else if (pte_present(pte)) {
+			unsigned int batch = pte_batch_hint(ptep, pte);
+
+			if (batch > 1) {
+				unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
+
+				step = min_t(unsigned int, batch, max_nr);
+			}
+
+			for (i = 0; i < step; i++)
+				vec[i] = 1;
+		} else { /* pte is a swap entry */
 			swp_entry_t entry = pte_to_swp_entry(pte);
 
 			if (non_swap_entry(entry)) {
@@ -146,7 +158,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 #endif
 			}
 		}
-		vec++;
+		vec += step;
 	}
 	pte_unmap_unlock(ptep - 1, ptl);
 out:
-- 
2.43.5

