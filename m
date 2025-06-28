Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D11319597F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751110522; cv=none; b=Q6RzXbCHNuDBYtZ19qCKjlKi2VIco1qT9uH6FWiOAlpUwxTYPKCFIWhhMGVPC2BNUvgbf92lRPQLq1mxYJdk6gI57Nso8zKBpp5pxgMWulngXF9upfwNlXbZJftqcvDly3h2MU3Bd+nNkg1CXlfwjsq3lWRaLu0coRS56FNq1zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751110522; c=relaxed/simple;
	bh=ah2syinEnPNEnbTUmIyBEW8DvuX0rQDh6MOfHgILfvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=any6Dd7iobY2nq22+b3Qc1bMvY+RlVQNjObVOt7MC+XU6IKk93sxa45ShSmEcYixjXYKB4+1aZQ+YBeQ7wUBfUwQAQGrxK5GBkTSCEzHtlhBO8A6cVSD7N7UNBu7pKvX3JKgwxRlwBHfy2MTfbpqNFaeqhL7UXtvo9ZcEMVBaU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47E391BD0;
	Sat, 28 Jun 2025 04:35:03 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A4413F762;
	Sat, 28 Jun 2025 04:35:12 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v4 2/4] mm: Add batched versions of ptep_modify_prot_start/commit
Date: Sat, 28 Jun 2025 17:04:33 +0530
Message-Id: <20250628113435.46678-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250628113435.46678-1-dev.jain@arm.com>
References: <20250628113435.46678-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
Architecture can override these helpers; in case not, they are implemented
as a simple loop over the corresponding single pte helpers.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
 mm/mprotect.c           |  4 +-
 2 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cf1515c163e2..662f39e7475a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
 
 /*
  * Commit an update to a pte, leaving any hardware-controlled bits in
- * the PTE unmodified.
+ * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
+ * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
  */
 static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 					   unsigned long addr,
@@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 	__ptep_modify_prot_commit(vma, addr, ptep, pte);
 }
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
+
+/**
+ * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
+ * over a batch of ptes, which protects against asynchronous hardware
+ * modifications to the ptes. The intention is not to prevent the hardware from
+ * making pte updates, but to prevent any updates it may make from being lost.
+ * Please see the comment above ptep_modify_prot_start() for full description.
+ *
+ * @vma: The virtual memory area the pages are mapped into.
+ * @addr: Address the first page is mapped at.
+ * @ptep: Page table pointer for the first entry.
+ * @nr: Number of entries.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
+ * in the batch.
+ *
+ * Note that PTE bits in the PTE batch besides the PFN can differ.
+ *
+ * Context: The caller holds the page table lock.  The PTEs map consecutive
+ * pages that belong to the same folio.  The PTEs are all in the same PMD.
+ * Since the batch is determined from folio_pte_batch, the PTEs must differ
+ * only in a/d bits (and the soft dirty bit; see fpb_t flags in
+ * mprotect_folio_pte_batch()).
+ */
+#ifndef modify_prot_start_ptes
+static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, unsigned int nr)
+{
+	pte_t pte, tmp_pte;
+
+	pte = ptep_modify_prot_start(vma, addr, ptep);
+	while (--nr) {
+		ptep++;
+		addr += PAGE_SIZE;
+		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
+		if (pte_dirty(tmp_pte))
+			pte = pte_mkdirty(pte);
+		if (pte_young(tmp_pte))
+			pte = pte_mkyoung(pte);
+	}
+	return pte;
+}
+#endif
+
+/**
+ * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
+ * hardware-controlled bits in the PTE unmodified.
+ *
+ * @vma: The virtual memory area the pages are mapped into.
+ * @addr: Address the first page is mapped at.
+ * @ptep: Page table pointer for the first entry.
+ * @old_pte: Old page table entry (for the first entry) which is now cleared.
+ * @pte: New page table entry to be set.
+ * @nr: Number of entries.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_modify_prot_commit().
+ *
+ * Context: The caller holds the page table lock. The PTEs are all in the same
+ * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
+ * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
+ * a/d bits on which were off in old_pte.
+ */
+#ifndef modify_prot_commit_ptes
+static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
+{
+	int i;
+
+	for (i = 0; i < nr; ++i) {
+		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
+		ptep++;
+		addr += PAGE_SIZE;
+		old_pte = pte_next_pfn(old_pte);
+		pte = pte_next_pfn(pte);
+	}
+}
+#endif
+
 #endif /* CONFIG_MMU */
 
 /*
diff --git a/mm/mprotect.c b/mm/mprotect.c
index af10a7fbe6b8..627b0d67cc4a 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 					continue;
 			}
 
-			oldpte = ptep_modify_prot_start(vma, addr, pte);
+			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
 			ptent = pte_modify(oldpte, newprot);
 
 			if (uffd_wp)
@@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			    can_change_pte_writable(vma, addr, ptent))
 				ptent = pte_mkwrite(ptent, vma);
 
-			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
+			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
 			if (pte_needs_flush(oldpte, ptent))
 				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
 			pages++;
-- 
2.30.2

