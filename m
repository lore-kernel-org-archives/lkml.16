Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5D84414
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555699; cv=none; b=h+FOGp2TpZf6EaEiRI06i8TWk/v/yfKlhE0265s8In7UZRAERxXiW2ewTs2EawqFzxBKN1PaUETwkB4dkEFx5yYtP6iHma/CMSTYmBs9mIBF6vKQTY/K5Fr7dP+Rom3sZdxBveZrt5/vdP9aA3ik7sZw+ydxvdCMya9J5fEawXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555699; c=relaxed/simple;
	bh=NDm2AvN+r0F7fNo4DFe18pO/1fnLPQM34yLbGLvff8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OK8Mjtx0ND1PvkKL3NoD9VI7DriYfYHdEz6E5QJRiGMFCDcmqky8SGRr9mIRoEIyKiFVW9EC+Ged65ztOEhI4n9Hl+WrfsZ91WkXLJx+kI4tG+aiRISsPsEqMDHiHQwITM4EEMu+w0B7dKUE1mr/0nRDvC+FmbtevmkEtGJCugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 041D3152B;
	Thu,  3 Jul 2025 08:14:40 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.88.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 528BE3F66E;
	Thu,  3 Jul 2025 08:14:48 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	yang@os.amperecomputing.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v4] arm64: Enable permission change on arm64 kernel block mappings
Date: Thu,  3 Jul 2025 20:44:41 +0530
Message-Id: <20250703151441.60325-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch paves the path to enable huge mappings in vmalloc space and
linear map space by default on arm64. For this we must ensure that we can
handle any permission games on the kernel (init_mm) pagetable. Currently,
__change_memory_common() uses apply_to_page_range() which does not support
changing permissions for block mappings. We attempt to move away from this
by using the pagewalk API, similar to what riscv does right now; however,
it is the responsibility of the caller to ensure that we do not pass a
range overlapping a partial block mapping or cont mapping; in such a case,
the system must be able to support range splitting.

This patch is tied with Yang Shi's attempt [1] at using huge mappings
in the linear mapping in case the system supports BBML2, in which case
we will be able to split the linear mapping if needed without
break-before-make. Thus, Yang's series, IIUC, will be one such user of my
patch; suppose we are changing permissions on a range of the linear map
backed by PMD-hugepages, then the sequence of operations should look
like the following:

split_range(start)
split_range(end);
__change_memory_common(start, end);

However, this patch can be used independently of Yang's; since currently
permission games are being played only on pte mappings (due to
apply_to_page_range not supporting otherwise), this patch provides the
mechanism for enabling huge mappings for various kernel mappings
like linear map and vmalloc.

---------------------
Implementation
---------------------

arm64 currently changes permissions on vmalloc objects locklessly, via
apply_to_page_range, whose limitation is to deny changing permissions for
block mappings. Therefore, we move away to use the generic pagewalk API,
thus paving the path for enabling huge mappings by default on kernel space
mappings, thus leading to more efficient TLB usage. However, the API
currently enforces the init_mm.mmap_lock to be held. To avoid the
unnecessary bottleneck of the mmap_lock for our usecase, this patch
extends this generic API to be used locklessly, so as to retain the
existing behaviour for changing permissions. Apart from this reason, it is
noted at [2] that KFENCE can manipulate kernel pgtable entries during
softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
This being a non-sleepable context, we cannot take the init_mm mmap lock.

Add comments to highlight the conditions under which we can use the
lockless variant - no underlying VMA, and the user having exclusive control
over the range, thus guaranteeing no concurrent access.

We require that the start and end of a given range do not partially overlap
block mappings, or cont mappings. Return -EINVAL in case a partial block
mapping is detected in any of the PGD/P4D/PUD/PMD levels; add a
corresponding comment in update_range_prot() to warn that eliminating
such a condition is the responsibility of the caller.

Note that, the pte level callback may change permissions for a whole
contpte block, and that will be done one pte at a time, as opposed to
an atomic operation for the block mappings. This is fine as any access
will decode either the old or the new permission until the TLBI.

apply_to_page_range() currently performs all pte level callbacks while in
lazy mmu mode. Since arm64 can optimize performance by batching barriers
when modifying kernel pgtables in lazy mmu mode, we would like to continue
to benefit from this optimisation. Unfortunately walk_kernel_page_table_range()
does not use lazy mmu mode. However, since the pagewalk framework is not
allocating any memory, we can safely bracket the whole operation inside
lazy mmu mode ourselves. Therefore, wrap the call to
walk_kernel_page_table_range() with the lazy MMU helpers.

[1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/
[2] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/

Signed-off-by: Dev Jain <dev.jain@arm.com>
---

v3->v4:
 - Drop patch 2, will add it back when we actually enable vmalloc block
   mappings by default (Ryan)
 - Rename ___change_memory_common -> update_range_prot (Mike Rapoport)
 - Explain why changing live kernel mappings mapped with PTE_CONT
   pte-by-pte is safe

v2->v3:
 - Drop adding PGWALK_NOLOCK, instead have a new lockless helper
 - Merge patch 1 and 2 from v2
 - Add a patch *actually* enabling vmalloc-huge permission change

v1->v2:
 - Squash patch 2 and 3
 - Add comment describing the responsibility of the caller to ensure no
   partial overlap with block mapping
 - Add comments and return -EINVAL at relevant places to document the usage
   of PGWALK_NOLOCK (Lorenzo)
 - Nest walk_kernel_page_table_range() with lazy_mmu calls, instead of
   doing so only per PTE level, fix bug in the PTE callback, introduce
   callbacks for all pagetable levels, use ptdesc_t instead of unsigned
   long, introduce ___change_memory_common and use them for direct map
   permission change functions (Ryan)

v1:
https://lore.kernel.org/all/20250530090407.19237-1-dev.jain@arm.com/

 arch/arm64/mm/pageattr.c | 155 +++++++++++++++++++++++++++++++--------
 include/linux/pagewalk.h |   3 +
 mm/pagewalk.c            |  24 ++++++
 3 files changed, 150 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..c6a85000fa0e 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -8,6 +8,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
+#include <linux/pagewalk.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -20,6 +21,99 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
+static ptdesc_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
+{
+	struct page_change_data *masks = walk->private;
+
+	val &= ~(pgprot_val(masks->clear_mask));
+	val |= (pgprot_val(masks->set_mask));
+
+	return val;
+}
+
+static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pgd_t val = pgdp_get(pgd);
+
+	if (pgd_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
+			return -EINVAL;
+		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
+		set_pgd(pgd, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	p4d_t val = p4dp_get(p4d);
+
+	if (p4d_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
+			return -EINVAL;
+		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
+		set_p4d(p4d, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pud_t val = pudp_get(pud);
+
+	if (pud_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
+			return -EINVAL;
+		val = __pud(set_pageattr_masks(pud_val(val), walk));
+		set_pud(pud, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pmd_t val = pmdp_get(pmd);
+
+	if (pmd_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
+			return -EINVAL;
+		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
+		set_pmd(pmd, val);
+		walk->action = ACTION_CONTINUE;
+	}
+
+	return 0;
+}
+
+static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pte_t val = __ptep_get(pte);
+
+	val = __pte(set_pageattr_masks(pte_val(val), walk));
+	__set_pte(pte, val);
+
+	return 0;
+}
+
+static const struct mm_walk_ops pageattr_ops = {
+	.pgd_entry	= pageattr_pgd_entry,
+	.p4d_entry	= pageattr_p4d_entry,
+	.pud_entry	= pageattr_pud_entry,
+	.pmd_entry	= pageattr_pmd_entry,
+	.pte_entry	= pageattr_pte_entry,
+};
+
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
 
 bool can_set_direct_map(void)
@@ -37,33 +131,35 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
-static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
+static int update_range_prot(unsigned long start, unsigned long size,
+			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-	struct page_change_data *cdata = data;
-	pte_t pte = __ptep_get(ptep);
+	struct page_change_data data;
+	int ret;
 
-	pte = clear_pte_bit(pte, cdata->clear_mask);
-	pte = set_pte_bit(pte, cdata->set_mask);
+	data.set_mask = set_mask;
+	data.clear_mask = clear_mask;
 
-	__set_pte(ptep, pte);
-	return 0;
+	arch_enter_lazy_mmu_mode();
+
+	/*
+	 * The caller must ensure that the range we are operating on does not
+	 * partially overlap a block mapping, or a cont mapping. Any such case
+	 * must be eliminated by splitting the mapping.
+	 */
+	ret = walk_kernel_page_table_range_lockless(start, start + size,
+						    &pageattr_ops, &data);
+	arch_leave_lazy_mmu_mode();
+
+	return ret;
 }
 
-/*
- * This function assumes that the range is mapped with PAGE_SIZE pages.
- */
 static int __change_memory_common(unsigned long start, unsigned long size,
-				pgprot_t set_mask, pgprot_t clear_mask)
+				  pgprot_t set_mask, pgprot_t clear_mask)
 {
-	struct page_change_data data;
 	int ret;
 
-	data.set_mask = set_mask;
-	data.clear_mask = clear_mask;
-
-	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
-					&data);
-
+	ret = update_range_prot(start, size, set_mask, clear_mask);
 	/*
 	 * If the memory is being made valid without changing any other bits
 	 * then a TLBI isn't required as a non-valid entry cannot be cached in
@@ -71,6 +167,7 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	 */
 	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
 		flush_tlb_kernel_range(start, start + size);
+
 	return ret;
 }
 
@@ -174,32 +271,26 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
-	struct page_change_data data = {
-		.set_mask = __pgprot(0),
-		.clear_mask = __pgprot(PTE_VALID),
-	};
+	pgprot_t clear_mask = __pgprot(PTE_VALID);
+	pgprot_t set_mask = __pgprot(0);
 
 	if (!can_set_direct_map())
 		return 0;
 
-	return apply_to_page_range(&init_mm,
-				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+	return update_range_prot((unsigned long)page_address(page),
+				 PAGE_SIZE, set_mask, clear_mask);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
-	struct page_change_data data = {
-		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
-		.clear_mask = __pgprot(PTE_RDONLY),
-	};
+	pgprot_t set_mask = __pgprot(PTE_VALID | PTE_WRITE);
+	pgprot_t clear_mask = __pgprot(PTE_RDONLY);
 
 	if (!can_set_direct_map())
 		return 0;
 
-	return apply_to_page_range(&init_mm,
-				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+	return update_range_prot((unsigned long)page_address(page),
+				 PAGE_SIZE, set_mask, clear_mask);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 682472c15495..8212e8f2d2d5 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -134,6 +134,9 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
 int walk_kernel_page_table_range(unsigned long start,
 		unsigned long end, const struct mm_walk_ops *ops,
 		pgd_t *pgd, void *private);
+int walk_kernel_page_table_range_lockless(unsigned long start,
+		unsigned long end, const struct mm_walk_ops *ops,
+		void *private);
 int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end, const struct mm_walk_ops *ops,
 			void *private);
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 648038247a8d..18a675ab87cf 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -633,6 +633,30 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
 	return walk_pgd_range(start, end, &walk);
 }
 
+/*
+ * Use this function to walk the kernel page tables locklessly. It should be
+ * guaranteed that the caller has exclusive access over the range they are
+ * operating on - that there should be no concurrent access, for example,
+ * changing permissions for vmalloc objects.
+ */
+int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
+		const struct mm_walk_ops *ops, void *private)
+{
+	struct mm_walk walk = {
+		.ops		= ops,
+		.mm		= &init_mm,
+		.private	= private,
+		.no_vma		= true
+	};
+
+	if (start >= end)
+		return -EINVAL;
+	if (!check_ops_valid(ops))
+		return -EINVAL;
+
+	return walk_pgd_range(start, end, &walk);
+}
+
 /**
  * walk_page_range_debug - walk a range of pagetables not backed by a vma
  * @mm:		mm_struct representing the target process of page table walk
-- 
2.30.2

