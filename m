Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0424C19597F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751110530; cv=none; b=BCO+W/Jq3LUVCyQVjGkPjMbz4AeJXPmOKc/RUNcsWPRHiPWZoPX0oeEpIUHY28A1h/dQarSyn2ZA/vf3bK+l44zSMCrAmLYNqdCGAkouqFF1hJB+U7pPZsIuoKQocOb6QKUL0R5jgDVVYXSUPJ6bX4LPkUiFjjBpxCHFd2a2EAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751110530; c=relaxed/simple;
	bh=nPYaSwFH+Qd3oI6VaUdovIuW0JAmKGFC6AKJtda1+h4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=atUPhBOym3zfaowBieQj1NVLk7QBRjD0EBGD/WAYOosjgHZSaYqqcMoC6NjSEm+uNRM4pGkHvoRKEZ6wKKRSVeou1BdG64inmRa9XT6nztVLA0QuBeUdBQxN5M08AmQLIpsIvgX/W+XbCt8378CcQz1WmeBZHK/5cd+ZRP8bm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 914721BD0;
	Sat, 28 Jun 2025 04:35:11 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA6D23F762;
	Sat, 28 Jun 2025 04:35:20 -0700 (PDT)
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
Subject: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Date: Sat, 28 Jun 2025 17:04:34 +0530
Message-Id: <20250628113435.46678-4-dev.jain@arm.com>
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

Use folio_pte_batch to batch process a large folio. Reuse the folio from
prot_numa case if possible.

For all cases other than the PageAnonExclusive case, if the case holds true
for one pte in the batch, one can confirm that that case will hold true for
other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty
and access bits across the batch, therefore batching across
pte_dirty(): this is correct since the dirty bit on the PTE really is
just an indication that the folio got written to, so even if the PTE is
not actually dirty (but one of the PTEs in the batch is), the wp-fault
optimization can be made.

The crux now is how to batch around the PageAnonExclusive case; we must
check the corresponding condition for every single page. Therefore, from
the large folio batch, we process sub batches of ptes mapping pages with
the same PageAnonExclusive condition, and process that sub batch, then
determine and process the next sub batch, and so on. Note that this does
not cause any extra overhead; if suppose the size of the folio batch
is 512, then the sub batch processing in total will take 512 iterations,
which is the same as what we would have done before.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 143 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 117 insertions(+), 26 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 627b0d67cc4a..28c7ce7728ff 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -40,35 +40,47 @@
 
 #include "internal.h"
 
-bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
-			     pte_t pte)
-{
-	struct page *page;
+enum tristate {
+	TRI_FALSE = 0,
+	TRI_TRUE = 1,
+	TRI_MAYBE = -1,
+};
 
+/*
+ * Returns enum tristate indicating whether the pte can be changed to writable.
+ * If TRI_MAYBE is returned, then the folio is anonymous and the user must
+ * additionally check PageAnonExclusive() for every page in the desired range.
+ */
+static int maybe_change_pte_writable(struct vm_area_struct *vma,
+				     unsigned long addr, pte_t pte,
+				     struct folio *folio)
+{
 	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
-		return false;
+		return TRI_FALSE;
 
 	/* Don't touch entries that are not even readable. */
 	if (pte_protnone(pte))
-		return false;
+		return TRI_FALSE;
 
 	/* Do we need write faults for softdirty tracking? */
 	if (pte_needs_soft_dirty_wp(vma, pte))
-		return false;
+		return TRI_FALSE;
 
 	/* Do we need write faults for uffd-wp tracking? */
 	if (userfaultfd_pte_wp(vma, pte))
-		return false;
+		return TRI_FALSE;
 
 	if (!(vma->vm_flags & VM_SHARED)) {
 		/*
 		 * Writable MAP_PRIVATE mapping: We can only special-case on
 		 * exclusive anonymous pages, because we know that our
 		 * write-fault handler similarly would map them writable without
-		 * any additional checks while holding the PT lock.
+		 * any additional checks while holding the PT lock. So if the
+		 * folio is not anonymous, we know we cannot change pte to
+		 * writable. If it is anonymous then the caller must further
+		 * check that the page is AnonExclusive().
 		 */
-		page = vm_normal_page(vma, addr, pte);
-		return page && PageAnon(page) && PageAnonExclusive(page);
+		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
 	}
 
 	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
@@ -80,15 +92,61 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	 * FS was already notified and we can simply mark the PTE writable
 	 * just like the write-fault handler would do.
 	 */
-	return pte_dirty(pte);
+	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
+}
+
+/*
+ * Returns the number of pages within the folio, starting from the page
+ * indicated by pgidx and up to pgidx + max_nr, that have the same value of
+ * PageAnonExclusive(). Must only be called for anonymous folios. Value of
+ * PageAnonExclusive() is returned in *exclusive.
+ */
+static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
+				bool *exclusive)
+{
+	struct page *page;
+	int nr = 1;
+
+	if (!folio) {
+		*exclusive = false;
+		return nr;
+	}
+
+	page = folio_page(folio, pgidx++);
+	*exclusive = PageAnonExclusive(page);
+	while (nr < max_nr) {
+		page = folio_page(folio, pgidx++);
+		if ((*exclusive) != PageAnonExclusive(page))
+			break;
+		nr++;
+	}
+
+	return nr;
+}
+
+bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t pte)
+{
+	struct page *page;
+	int ret;
+
+	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
+	if (ret == TRI_MAYBE) {
+		page = vm_normal_page(vma, addr, pte);
+		ret = page && PageAnon(page) && PageAnonExclusive(page);
+	}
+
+	return ret;
 }
 
 static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *ptep, pte_t pte, int max_nr_ptes)
+		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
 {
-	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+
+	flags &= ~switch_off_flags;
 
-	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
+	if (!folio || !folio_test_large(folio))
 		return 1;
 
 	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
@@ -154,7 +212,8 @@ static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma
 	}
 
 skip_batch:
-	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
+	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
+					   max_nr_ptes, 0);
 out:
 	*foliop = folio;
 	return nr_ptes;
@@ -191,7 +250,10 @@ static long change_pte_range(struct mmu_gather *tlb,
 		if (pte_present(oldpte)) {
 			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
 			struct folio *folio = NULL;
-			pte_t ptent;
+			int sub_nr_ptes, pgidx = 0;
+			pte_t ptent, newpte;
+			bool sub_set_write;
+			int set_write;
 
 			/*
 			 * Avoid trapping faults against the zero or KSM
@@ -206,6 +268,11 @@ static long change_pte_range(struct mmu_gather *tlb,
 					continue;
 			}
 
+			if (!folio)
+				folio = vm_normal_folio(vma, addr, oldpte);
+
+			nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
+							   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
 			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
 			ptent = pte_modify(oldpte, newprot);
 
@@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * example, if a PTE is already dirty and no other
 			 * COW or special handling is required.
 			 */
-			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
-			    !pte_write(ptent) &&
-			    can_change_pte_writable(vma, addr, ptent))
-				ptent = pte_mkwrite(ptent, vma);
-
-			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
-			if (pte_needs_flush(oldpte, ptent))
-				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
-			pages++;
+			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
+				    !pte_write(ptent);
+			if (set_write)
+				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
+
+			while (nr_ptes) {
+				if (set_write == TRI_MAYBE) {
+					sub_nr_ptes = anon_exclusive_batch(folio,
+						pgidx, nr_ptes, &sub_set_write);
+				} else {
+					sub_nr_ptes = nr_ptes;
+					sub_set_write = (set_write == TRI_TRUE);
+				}
+
+				if (sub_set_write)
+					newpte = pte_mkwrite(ptent, vma);
+				else
+					newpte = ptent;
+
+				modify_prot_commit_ptes(vma, addr, pte, oldpte,
+							newpte, sub_nr_ptes);
+				if (pte_needs_flush(oldpte, newpte))
+					tlb_flush_pte_range(tlb, addr,
+						sub_nr_ptes * PAGE_SIZE);
+
+				addr += sub_nr_ptes * PAGE_SIZE;
+				pte += sub_nr_ptes;
+				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
+				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
+				nr_ptes -= sub_nr_ptes;
+				pages += sub_nr_ptes;
+				pgidx += sub_nr_ptes;
+			}
 		} else if (is_swap_pte(oldpte)) {
 			swp_entry_t entry = pte_to_swp_entry(oldpte);
 			pte_t newpte;
-- 
2.30.2

