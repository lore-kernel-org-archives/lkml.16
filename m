Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9BA20299E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677386; cv=none; b=qutu9hfZbT89UejLhQaAL4bsDsaW61iam6G8hJZK1urNzHZ/EymHlIKnIzd0w4pCAMvxXcPcnTpM5DLiEjtez25ERic2vshp32m7z4fTEw+y6y1rFrqhX8VnXPHYTqLL/6adBO1sivdg/8U33sS/Z2kWV+MLfSQIFBXBxnItE9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677386; c=relaxed/simple;
	bh=x28gEEIvJkfbmw1RZ/L4ZvpuQyWRWSv/riFIO9MGc8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJFriTaZZP5KcqUTGhNDkSSg6C3cM+Mo4GYCPwEHOCLqrshQU8pRNGH5xItGGjlYC50/9ygxk9KEmF2eVEZ5RT89ljHzzj7L+pfvUK8s5X4Pwy8oy7W3cG4sUOGEM+RhzlkRvHZEuMxHlR5lFN2KFafIYpFC8spLQj7CjAzomus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=efspxjNn; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="efspxjNn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746677376; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=UGP4SdAGpL+u7FxUuxhPuYPqxiJA4339HAssaexHvLE=;
	b=efspxjNncRJRCKaKU07ITa+HMnJcF6BL22oOCWG4IoD1TZTd8zuwGH9Kt8y+Zf7u0nINn5/yyh4ReOH2OChzoPiZaRSrQdHDgtiGWLFu/+K0XxBIKGgOvmUlCMEqp347+5r4nLWHRfNGwaSioma6FYOiFkz0+NxI/EKNBgwQDyo=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZzDCrr_1746677374 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 May 2025 12:09:35 +0800
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
Subject: [PATCH v2] mm: mincore: use pte_batch_bint() to batch process large folios
Date: Thu,  8 May 2025 12:09:27 +0800
Message-ID: <e89f3af69104c18e45362c6c48058edd2bddf501.1746677237.git.baolin.wang@linux.alibaba.com>
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
Changes from v1:
 - Change to use pte_batch_hint() to get the batch number, per Ryan.

Note: I observed the min_t() can introduce a slight performance regression
for base pages, so I change to add a batch size check for base pages,
which can resolve the performance regression issue.
---
 mm/mincore.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/mm/mincore.c b/mm/mincore.c
index 832f29f46767..2e6a9123305e 100644
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
@@ -118,16 +120,23 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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
+			if (batch > 1)
+				step = min_t(unsigned int, batch, nr);
+
+			for (i = 0; i < step; i++)
+				vec[i] = 1;
+		} else { /* pte is a swap entry */
 			swp_entry_t entry = pte_to_swp_entry(pte);
 
 			if (non_swap_entry(entry)) {
@@ -146,7 +155,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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

