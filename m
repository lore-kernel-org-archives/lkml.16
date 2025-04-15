Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5468E29E068
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729068; cv=none; b=VODw8c7bcpHo458g9xn9RIdebrp4JozKkpWEScHtSXs5OVfScyTSLTWuFzCpkgGyeFx2r75FqGft3Pc/93jPSdAjX3N3mNHzZTthfMqgHeyfxn/Vag40MgYokzXqY/4xQ3Z6kJIYZV6YVAVonK+nMrUPxddTJbp2Dnoh/tqrkMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729068; c=relaxed/simple;
	bh=vZtrQ9crj21c10RvKKaTlulPnt3zya5f6BVM9Z/ki/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HboLgvJaUYwTabrKmx331NdFwQb6HLrOxSQoP/++fFepC0Ydb4OPzG+b/0IQSSKzR4LQv8tImGkHv3UrfIqS3ukxJy99nZbP5J+QCUkucUg2G3+EtYmtPmqMfKpXK9NiYuN2tdohFdPvRTzhradFRFMDSVP1CrMJz1wAtc1YEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845B3152B;
	Tue, 15 Apr 2025 07:57:43 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.73.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D127B3F59E;
	Tue, 15 Apr 2025 07:57:40 -0700 (PDT)
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
Subject: [PATCH v2] mempolicy: Optimize queue_folios_pte_range by PTE batching
Date: Tue, 15 Apr 2025 20:27:31 +0530
Message-Id: <20250415145731.86281-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the check for queue_folio_required(), the code only cares about the
folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
this loop by skipping over a PTE batch mapping the same folio.

With a test program migrating pages of the calling process, which includes
a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
migrating once back and forth node-0 and node-1, the average execution
time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.

v1->v2:
 - Follow reverse xmas tree declarations
 - Don't initialize nr
 - Move folio_pte_batch() immediately after retrieving a normal folio
 - increment nr_failed in one shot

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mempolicy.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b28a1e6ae096..ca90cdcd3207 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
 static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 			unsigned long end, struct mm_walk *walk)
 {
+	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	struct vm_area_struct *vma = walk->vma;
 	struct folio *folio;
 	struct queue_pages *qp = walk->private;
@@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 	pte_t *pte, *mapped_pte;
 	pte_t ptent;
 	spinlock_t *ptl;
+	int max_nr, nr;
 
 	ptl = pmd_trans_huge_lock(pmd, vma);
 	if (ptl) {
@@ -586,7 +588,8 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 		walk->action = ACTION_AGAIN;
 		return 0;
 	}
-	for (; addr != end; pte++, addr += PAGE_SIZE) {
+	for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
+		nr = 1;
 		ptent = ptep_get(pte);
 		if (pte_none(ptent))
 			continue;
@@ -598,6 +601,11 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 		folio = vm_normal_folio(vma, addr, ptent);
 		if (!folio || folio_is_zone_device(folio))
 			continue;
+		if (folio_test_large(folio) &&
+		   (max_nr = ((end - addr) >> PAGE_SHIFT)) != 1)
+			nr = folio_pte_batch(folio, addr, pte, ptent,
+					     max_nr, fpb_flags,
+					     NULL, NULL, NULL);
 		/*
 		 * vm_normal_folio() filters out zero pages, but there might
 		 * still be reserved folios to skip, perhaps in a VDSO.
@@ -630,7 +638,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)) ||
 		    !vma_migratable(vma) ||
 		    !migrate_folio_add(folio, qp->pagelist, flags)) {
-			qp->nr_failed++;
+			qp->nr_failed += nr;
 			if (strictly_unmovable(flags))
 				break;
 		}
-- 
2.30.2

