Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F2F1DAC95
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768254; cv=none; b=l5w1F8kWeyEIYCaH4VjJdScsyPfE+hu/Pa1bMPSOJaRMGj8o6ekXPlNgDXkNha0ElqKqnNSSA1OL/qzZwdlTXxxfHT7dixY4nji9LiD8dLbfXyrNIXLwyvscp3GQkh8dj0ufyoNxuWIckJv5cZ7+8NsxKxE4yOzsBVsKWE/5p24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768254; c=relaxed/simple;
	bh=we+4uLqMLRcQvkQL3DqN30UXhLctct4D1lj8cXVEU2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nr3LolhzCNK9T/TBriULhApnP9hsWPtzxThPnhdU97Dp2lfjuBwDQ4uM2EK8EjmyDfP8Gp9ZYtakg92F+vzUq3xwLLmYRJ9NPwczE6vc8yTxWaed7U9jssNGPRUfmads/Q3PAFMBHuugnEiXDxumxhiMmnbae9GXotPwNZtWzZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A0151063;
	Wed,  5 Feb 2025 07:11:16 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DD7A3F5A1;
	Wed,  5 Feb 2025 07:10:49 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/16] arm64/mm: Avoid barriers for invalid or userspace mappings
Date: Wed,  5 Feb 2025 15:09:49 +0000
Message-ID: <20250205151003.88959-10-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__set_pte_complete(), set_pmd(), set_pud(), set_p4d() and set_pgd() are
used to write entries into pgtables. And they issue barriers (currently
dsb and isb) to ensure that the written values are observed by the table
walker prior to any program-order-future memory access to the mapped
location.

Over the years some of these functions have received optimizations: In
particular, commit 7f0b1bf04511 ("arm64: Fix barriers used for page
table modifications") made it so that the barriers were only emitted for
valid-kernel mappings for set_pte() (now __set_pte_complete()). And
commit 0795edaf3f1f ("arm64: pgtable: Implement p[mu]d_valid() and check
in set_p[mu]d()") made it so that set_pmd()/set_pud() only emitted the
barriers for valid mappings. set_p4d()/set_pgd() continue to emit the
barriers unconditionally.

This is all very confusing to the casual observer; surely the rules
should be invariant to the level? Let's change this so that every level
consistently emits the barriers only when setting valid, non-user
entries (both table and leaf).

It seems obvious that if it is ok to elide barriers all but valid kernel
mappings at pte level, it must also be ok to do this for leaf entries at
other levels: If setting an entry to invalid, a tlb maintenance
operaiton must surely follow to synchronise the TLB and this contains
the required barriers. If setting a valid user mapping, the previous
mapping must have been invalid and there must have been a TLB
maintenance operation (complete with barriers) to honour
break-before-make. So the worst that can happen is we take an extra
fault (which will imply the DSB + ISB) and conclude that there is
nothing to do. These are the aguments for doing this optimization at pte
level and they also apply to leaf mappings at other levels.

For table entries, the same arguments hold: If unsetting a table entry,
a TLB is required and this will emit the required barriers. If setting a
table entry, the previous value must have been invalid and the table
walker must already be able to observe that. Additionally the contents
of the pgtable being pointed to in the newly set entry must be visible
before the entry is written and this is enforced via smp_wmb() (dmb) in
the pgtable allocation functions and in __split_huge_pmd_locked(). But
this last part could never have been enforced by the barriers in
set_pXd() because they occur after updating the entry. So ultimately,
the wost that can happen by eliding these barriers for user table
entries is an extra fault.

I observe roughly the same number of page faults (107M) with and without
this change when compiling the kernel on Apple M2.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 60 ++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1d428e9c0e5a..ff358d983583 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -767,6 +767,19 @@ static inline bool in_swapper_pgdir(void *addr)
 	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
 }
 
+static inline bool pmd_valid_not_user(pmd_t pmd)
+{
+	/*
+	 * User-space table pmd entries always have (PXN && !UXN). All other
+	 * combinations indicate it's a table entry for kernel space.
+	 * Valid-not-user leaf entries follow the same rules as
+	 * pte_valid_not_user().
+	 */
+	if (pmd_table(pmd))
+		return !((pmd_val(pmd) & (PMD_TABLE_PXN | PMD_TABLE_UXN)) == PMD_TABLE_PXN);
+	return pte_valid_not_user(pmd_pte(pmd));
+}
+
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
 #ifdef __PAGETABLE_PMD_FOLDED
@@ -778,7 +791,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 	WRITE_ONCE(*pmdp, pmd);
 
-	if (pmd_valid(pmd)) {
+	if (pmd_valid_not_user(pmd)) {
 		dsb(ishst);
 		isb();
 	}
@@ -836,6 +849,17 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 
 static inline bool pgtable_l4_enabled(void);
 
+
+static inline bool pud_valid_not_user(pud_t pud)
+{
+	/*
+	 * Follows the same rules as pmd_valid_not_user().
+	 */
+	if (pud_table(pud))
+		return !((pud_val(pud) & (PUD_TABLE_PXN | PUD_TABLE_UXN)) == PUD_TABLE_PXN);
+	return pte_valid_not_user(pud_pte(pud));
+}
+
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
 	if (!pgtable_l4_enabled() && in_swapper_pgdir(pudp)) {
@@ -845,7 +869,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 
 	WRITE_ONCE(*pudp, pud);
 
-	if (pud_valid(pud)) {
+	if (pud_valid_not_user(pud)) {
 		dsb(ishst);
 		isb();
 	}
@@ -917,6 +941,16 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 #define p4d_bad(p4d)		(pgtable_l4_enabled() && !(p4d_val(p4d) & P4D_TABLE_BIT))
 #define p4d_present(p4d)	(!p4d_none(p4d))
 
+static inline bool p4d_valid_not_user(p4d_t p4d)
+{
+	/*
+	 * User-space table p4d entries always have (PXN && !UXN). All other
+	 * combinations indicate it's a table entry for kernel space. p4d block
+	 * entries are not supported.
+	 */
+	return !((p4d_val(p4d) & (P4D_TABLE_PXN | P4D_TABLE_UXN)) == P4D_TABLE_PXN);
+}
+
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
 	if (in_swapper_pgdir(p4dp)) {
@@ -925,8 +959,11 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 	}
 
 	WRITE_ONCE(*p4dp, p4d);
-	dsb(ishst);
-	isb();
+
+	if (p4d_valid_not_user(p4d)) {
+		dsb(ishst);
+		isb();
+	}
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1044,6 +1081,14 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 #define pgd_bad(pgd)		(pgtable_l5_enabled() && !(pgd_val(pgd) & PGD_TABLE_BIT))
 #define pgd_present(pgd)	(!pgd_none(pgd))
 
+static inline bool pgd_valid_not_user(pgd_t pgd)
+{
+	/*
+	 * Follows the same rules as p4d_valid_not_user().
+	 */
+	return !((pgd_val(pgd) & (PGD_TABLE_PXN | PGD_TABLE_UXN)) == PGD_TABLE_PXN);
+}
+
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
 	if (in_swapper_pgdir(pgdp)) {
@@ -1052,8 +1097,11 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 	}
 
 	WRITE_ONCE(*pgdp, pgd);
-	dsb(ishst);
-	isb();
+
+	if (pgd_valid_not_user(pgd)) {
+		dsb(ishst);
+		isb();
+	}
 }
 
 static inline void pgd_clear(pgd_t *pgdp)
-- 
2.43.0

