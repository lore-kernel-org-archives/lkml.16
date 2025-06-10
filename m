Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426EB28C879
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555869; cv=none; b=LIPEirHNfmA4RcrTctu1P4WY8ymkt7FiP5qyGGSvNo9T8SaTHTAsV3YarAD8HqL1GrRWI2eooqqpBAhpalGY2oRpjbz2RIckDgS/76+72OL/ZjwQBsXrZhXZAqI8F63cpHUdrgqyk9kO/7eCRO4L9RRsMTRhEexoFaKmuwcjQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555869; c=relaxed/simple;
	bh=blBfohToxSm9BTYqFUg7FXOdjMwEciWUkbCQxST5+Qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SynLCO4GLNMygEqmrOeKR6AcExGTIPKMaCfdJ4BKEwgmIrldTnGQ4S8eYDKvxZJpbzh5solo9FWUfKirlPS6KeGeDl75Q1TGAnAHX5sHFGdjXeD42+AifN2ptmZ7y65IjGY5Tzw5O64rU84fhLOO2VsEv8kJe6VTT9fKzfRihrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3091E169C;
	Tue, 10 Jun 2025 04:44:08 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B66DD3F59E;
	Tue, 10 Jun 2025 04:44:21 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: pageattr: Use walk_page_range_novma() to change memory permissions
Date: Tue, 10 Jun 2025 17:14:01 +0530
Message-Id: <20250610114401.7097-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250610114401.7097-1-dev.jain@arm.com>
References: <20250610114401.7097-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since apply_to_page_range does not support operations on block mappings,
use the generic pagewalk API to enable changing permissions for kernel
block mappings. This paves the path for enabling huge mappings by default
on kernel space mappings, thus leading to more efficient TLB usage.

We only require that the start and end of a given range lie on leaf mapping
boundaries. Return EINVAL in case a partial block mapping is detected; add
a corresponding comment in ___change_memory_common() to warn that
eliminating such a condition is the responsibility of the caller.

apply_to_page_range ultimately uses the lazy MMU hooks at the pte level
function (apply_to_pte_range) - we want to use this functionality after
this patch too. Ryan says:
"The only reason we traditionally confine the lazy mmu mode to a single
page table is because we want to enclose it within the PTL. But that
requirement doesn't stand for kernel mappings. As long as the walker can
guarantee that it doesn't allocate any memory (because with certain debug
settings that can cause lazy mmu nesting) or try to sleep then I think we
can just bracket the entire call."
Therefore, wrap the call to walk_kernel_page_table_range() with the
lazy MMU helpers.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 158 +++++++++++++++++++++++++++++++--------
 1 file changed, 126 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..2c118c0922ef 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -8,6 +8,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
+#include <linux/pagewalk.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -20,6 +21,100 @@ struct page_change_data {
 	pgprot_t clear_mask;
 };
 
+static pteval_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
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
+	.walk_lock	= PGWALK_NOLOCK,
+};
+
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
 
 bool can_set_direct_map(void)
@@ -37,22 +132,7 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
-static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
-{
-	struct page_change_data *cdata = data;
-	pte_t pte = __ptep_get(ptep);
-
-	pte = clear_pte_bit(pte, cdata->clear_mask);
-	pte = set_pte_bit(pte, cdata->set_mask);
-
-	__set_pte(ptep, pte);
-	return 0;
-}
-
-/*
- * This function assumes that the range is mapped with PAGE_SIZE pages.
- */
-static int __change_memory_common(unsigned long start, unsigned long size,
+static int ___change_memory_common(unsigned long start, unsigned long size,
 				pgprot_t set_mask, pgprot_t clear_mask)
 {
 	struct page_change_data data;
@@ -61,9 +141,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;
 
-	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
-					&data);
+	arch_enter_lazy_mmu_mode();
+
+	/*
+	 * The caller must ensure that the range we are operating on does not
+	 * partially overlap a block mapping. Any such case should either not
+	 * exist, or must be eliminated by splitting the mapping - which for
+	 * kernel mappings can be done only on BBML2 systems.
+	 *
+	 */
+	ret = walk_kernel_page_table_range(start, start + size, &pageattr_ops,
+					   NULL, &data);
+	arch_leave_lazy_mmu_mode();
+
+	return ret;
+}
 
+static int __change_memory_common(unsigned long start, unsigned long size,
+				  pgprot_t set_mask, pgprot_t clear_mask)
+{
+	int ret;
+
+	ret = ___change_memory_common(start, size, set_mask, clear_mask);
 	/*
 	 * If the memory is being made valid without changing any other bits
 	 * then a TLBI isn't required as a non-valid entry cannot be cached in
@@ -71,6 +170,7 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	 */
 	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
 		flush_tlb_kernel_range(start, start + size);
+
 	return ret;
 }
 
@@ -174,32 +274,26 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 
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
+	return ___change_memory_common((unsigned long)page_address(page), PAGE_SIZE,
+					set_mask, clear_mask);
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
+	return ___change_memory_common((unsigned long)page_address(page), PAGE_SIZE,
+					set_mask, clear_mask);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.30.2

