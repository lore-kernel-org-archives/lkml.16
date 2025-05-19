Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827472690FA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640952; cv=none; b=gNJqYaFSOk+Ug90q9P8VX5XGYpclbwIrKmMvp+wxo/woU9ZF7jwnAeLFbjDqG1wCSnOaCLyymJHRY0ZLW3kD7uAk6ezFGNVxOPcLYdTeQyAxeH/hbz5+Eo8JNJLwcRwDQ39ZZE5WpjOUObN+FllsV8mTNXQ90gk5oyaT0w5als0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640952; c=relaxed/simple;
	bh=SUvq8+/P1bH8HQn7a35qaXBHPdO8YqeMux3tV7BsN10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iHVM+IkucumH+cKl5BhLw04SzCgUUjcCG2oKh0qrAPfBTrnklGLVsYMtDL99g8QiYOXQ9RwHf92ClgGat94lsl1Mb3S9EzKiZSeCX+84S88O5Ict8NiJGw1+m+XMxXfDcTtWj9GE7BHD45L7k+PClbilkJ7t5o/WJpF0yBmuwlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5B2D14BF;
	Mon, 19 May 2025 00:48:56 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3537C3F6A8;
	Mon, 19 May 2025 00:49:02 -0700 (PDT)
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
Subject: [PATCH v3 4/5] arm64: Add batched version of ptep_modify_prot_start
Date: Mon, 19 May 2025 13:18:23 +0530
Message-Id: <20250519074824.42909-5-dev.jain@arm.com>
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

Override the generic definition to use get_and_clear_full_ptes(). This helper
does a TLBI only for the starting and ending contpte block of the range, whereas
the current implementation will call ptep_get_and_clear() for every contpte block,
thus doing a TLBI on every contpte block. Therefore, we have a performance win.
The arm64 definition of pte_accessible() allows us to batch around it in clear_flush_ptes():
#define pte_accessible(mm, pte)	\
	(mm_tlb_flush_pending(mm) ? pte_present(pte) : pte_valid(pte))

All ptes are obviously present in the folio batch, and they are also valid.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  5 +++++
 arch/arm64/mm/mmu.c              | 12 +++++++++---
 include/linux/pgtable.h          |  4 ++++
 mm/pgtable-generic.c             | 16 +++++++++++-----
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 2a77f11b78d5..8872ea5f0642 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    pte_t old_pte, pte_t new_pte);
 
+#define modify_prot_start_ptes modify_prot_start_ptes
+extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
+				    unsigned long addr, pte_t *ptep,
+				    unsigned int nr);
+
 #ifdef CONFIG_ARM64_CONTPTE
 
 /*
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8fcf59ba39db..fe60be8774f4 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
 early_initcall(prevent_bootmem_remove_init);
 #endif
 
-pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, unsigned int nr)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
 		/*
@@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
 		 * in cases where cpu is affected with errata #2645198.
 		 */
 		if (pte_user_exec(ptep_get(ptep)))
-			return ptep_clear_flush(vma, addr, ptep);
+			return clear_flush_ptes(vma, addr, ptep, nr);
 	}
-	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
+	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
+}
+
+pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+{
+	return modify_prot_start_ptes(vma, addr, ptep, 1);
 }
 
 void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e40ed57e034d..41f4a8de5c28 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
 			      pte_t *ptep);
 #endif
 
+extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
+			      unsigned long address,
+			      pte_t *ptep, unsigned int nr);
+
 #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
 extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
 			      unsigned long address,
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 5a882f2b10f9..e238f88c3cac 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
 }
 #endif
 
-#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
-pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
-		       pte_t *ptep)
+pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
+		       pte_t *ptep, unsigned int nr)
 {
 	struct mm_struct *mm = (vma)->vm_mm;
 	pte_t pte;
-	pte = ptep_get_and_clear(mm, address, ptep);
+	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
 	if (pte_accessible(mm, pte))
-		flush_tlb_page(vma, address);
+		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
 	return pte;
 }
+
+#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
+pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
+		       pte_t *ptep)
+{
+	return clear_flush_ptes(vma, address, ptep, 1);
+}
 #endif
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-- 
2.30.2

