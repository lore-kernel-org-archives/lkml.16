Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F3D268C76
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640938; cv=none; b=l+6cefCvHLOO2OdUq4uuhjmj4hf6NR5Vxpdk4y7tIpPWphuZH3+lVObDSWh7S/aYVBa3jUUOvxzw/qNk8s0fed1+jwN519gN5fmYG3FTJbxZbMGzZRzqODhRUWC+CoGXp7jykq2bLRkCsA9eEN8DgnE8HEimRz3MDzqF5vu/ltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640938; c=relaxed/simple;
	bh=cPrKA+4x+iJul5/t6t3bf5TbqXask2D3t7NGX0HJN7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hbo/sNXWh7u52tqJfQ4gdknQrTg8wuDx697YVVZZrqLrbxXKlIWP8qn/zedvnltUkk2ZfsBVf/EKER2kV6JB1Xse7w7YDwTc8nz7ihB26uKnno2z/KWz9GjmUJACKHXuOQ+/wk9mHq8vx8b2mW7/vruQuqF87cIYoFeafoJZPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E96C14BF;
	Mon, 19 May 2025 00:48:42 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CEC893F6A8;
	Mon, 19 May 2025 00:48:48 -0700 (PDT)
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
Subject: [PATCH v3 2/5] mm: Add batched versions of ptep_modify_prot_start/commit
Date: Mon, 19 May 2025 13:18:21 +0530
Message-Id: <20250519074824.42909-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250519074824.42909-1-dev.jain@arm.com>
References: <20250519074824.42909-1-dev.jain@arm.com>
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
 include/linux/pgtable.h | 75 +++++++++++++++++++++++++++++++++++++++++
 mm/mprotect.c           |  4 +--
 2 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..e40ed57e034d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1333,6 +1333,81 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 	__ptep_modify_prot_commit(vma, addr, ptep, pte);
 }
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
+
+/**
+ * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
+ * over a batch of ptes, which protects against asynchronous hardware modifications
+ * to the ptes. The intention is not to prevent the hardware from making pte
+ * updates, but to prevent any updates it may make from being lost.
+ * Please see the comment above ptep_modify_prot_start() for full description.
+ *
+ * @vma: The virtual memory area the pages are mapped into.
+ * @addr: Address the first page is mapped at.
+ * @ptep: Page table pointer for the first entry.
+ * @nr: Number of entries.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_modify_prot_start(), collecting the a/d bits of the mapped
+ * folio.
+ *
+ * Note that PTE bits in the PTE range besides the PFN can differ.
+ *
+ * Context: The caller holds the page table lock.  The PTEs map consecutive
+ * pages that belong to the same folio.  The PTEs are all in the same PMD.
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
+ * @nr: Number of entries.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_modify_prot_commit().
+ *
+ * Note that PTE bits in the PTE range besides the PFN can differ.
+ *
+ * Context: The caller holds the page table lock.  The PTEs map consecutive
+ * pages that belong to the same folio.  The PTEs are all in the same PMD.
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
index 1ee160ed0b14..124612ce3d24 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -188,7 +188,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 						jiffies_to_msecs(jiffies));
 			}
 
-			oldpte = ptep_modify_prot_start(vma, addr, pte);
+			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
 			ptent = pte_modify(oldpte, newprot);
 
 			if (uffd_wp)
@@ -214,7 +214,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 			    can_change_pte_writable(vma, addr, ptent))
 				ptent = pte_mkwrite(ptent, vma);
 
-			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
+			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
 			if (pte_needs_flush(oldpte, ptent))
 				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
 			pages++;
-- 
2.30.2

