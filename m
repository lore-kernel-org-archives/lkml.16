Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716AE1F0982
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359195; cv=none; b=qtM1aKeC3ONB3W8hHKnEsBAs3WNzUyrsDYACfc1dHzx/CuH1yNV9G/OD+eWuCv8WTa3NsKQyYIPVrxhPsvsN9fPvSZBtUjjlglrZwBoXvjg2oecWZHUWUH4ox5ZOSYYTrq7FRNXZVOjIWcLnZYA3ABtQ443AfbKuUpoVncYtgas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359195; c=relaxed/simple;
	bh=DeFj3YnYPJgXrhdKjKmrH+wYJx9uVlscYvffq2WUEm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=feEZG/cqTphbl9Dg+u3VuQWfT1iceOeRxndZC85HNPYPDIar55nRLYxMohXDv1Dnf7pOqxAs8Kbg4doz4fyyd0zySsFq6H6ackOQxFbdRzNMWIsiIUVclyBfpFc14d8EbnwVyrY1GH50K/FkUy+j1h5AGqfelQ56Etl60WDX5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1214E106F;
	Fri, 11 Apr 2025 01:13:11 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.73.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 068CB3F694;
	Fri, 11 Apr 2025 01:13:05 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hughd@google.com,
	vishal.moola@gmail.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] mempolicy: Optimize queue_folios_pte_range by PTE batching
Date: Fri, 11 Apr 2025 13:43:01 +0530
Message-Id: <20250411081301.8533-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the check for queue_folio_required(), the code only cares about the
folio in the for loop, i.e the PTEs are redundant. Therefore, optimize this
loop by skipping over a PTE batch mapping the same folio.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Unfortunately I have only build tested this since my test environment is
broken.

 mm/mempolicy.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b28a1e6ae096..b019524da8a2 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -573,6 +573,9 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 	pte_t *pte, *mapped_pte;
 	pte_t ptent;
 	spinlock_t *ptl;
+	int max_nr;
+	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	int nr = 1;
 
 	ptl = pmd_trans_huge_lock(pmd, vma);
 	if (ptl) {
@@ -586,7 +589,8 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 		walk->action = ACTION_AGAIN;
 		return 0;
 	}
-	for (; addr != end; pte++, addr += PAGE_SIZE) {
+	for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
+		nr = 1;
 		ptent = ptep_get(pte);
 		if (pte_none(ptent))
 			continue;
@@ -607,6 +611,11 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!queue_folio_required(folio, qp))
 			continue;
 		if (folio_test_large(folio)) {
+			max_nr = (end - addr) >> PAGE_SHIFT;
+			if (max_nr != 1)
+				nr = folio_pte_batch(folio, addr, pte, ptent,
+						     max_nr, fpb_flags,
+						     NULL, NULL, NULL);
 			/*
 			 * A large folio can only be isolated from LRU once,
 			 * but may be mapped by many PTEs (and Copy-On-Write may
@@ -633,6 +642,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 			qp->nr_failed++;
 			if (strictly_unmovable(flags))
 				break;
+			qp->nr_failed += nr - 1;
 		}
 	}
 	pte_unmap_unlock(mapped_pte, ptl);
-- 
2.30.2

