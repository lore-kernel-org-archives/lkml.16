Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A9D1E1E1C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751110538; cv=none; b=n8ORSghP63cel+I1N/IsV2H3PA4Bzl5dTLRlm132eE1hEalrkbEX6s+X9VXWZsnyCyfTMQsHDsH7rh5ljbMVDKLnQxT38FeGAnXp98vWxstKvgTF53gDJenfSUNY0KrX7XfVoN951y2vRic1PhpMYFQ+pP/Hox3XIk88xYUfRA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751110538; c=relaxed/simple;
	bh=LShM5SswDrluRPqHh5X+SzOl+BLPvCh7VicYl+BQmiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qGN9hDjeyhTX2pd404TbmcdAv7t5+J3bDjZebhZDY0uD+0hjXODn8RyUPYiu4MD5J2+hQTXvqGeuLutERYilxrtL2d73W5wyMgP6TiHjpqhjFE+8d0J+UsNKnyi7AT/3T3/rvU5ZUs0GKCWNIxcI6IWEHYZ8dqNcloUQnv9baJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF0401BD0;
	Sat, 28 Jun 2025 04:35:19 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F31033F762;
	Sat, 28 Jun 2025 04:35:28 -0700 (PDT)
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
Subject: [PATCH v4 4/4] arm64: Add batched versions of ptep_modify_prot_start/commit
Date: Sat, 28 Jun 2025 17:04:35 +0530
Message-Id: <20250628113435.46678-5-dev.jain@arm.com>
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

Override the generic definition of modify_prot_start_ptes() to use
get_and_clear_full_ptes(). This helper does a TLBI only for the starting
and ending contpte block of the range, whereas the current implementation
will call ptep_get_and_clear() for every contpte block, thus doing a
TLBI on every contpte block. Therefore, we have a performance win.

The arm64 definition of pte_accessible() allows us to batch in the
errata specific case:

#define pte_accessible(mm, pte)	\
	(mm_tlb_flush_pending(mm) ? pte_present(pte) : pte_valid(pte))

All ptes are obviously present in the folio batch, and they are also valid.

Override the generic definition of modify_prot_commit_ptes() to simply
use set_ptes() to map the new ptes into the pagetable.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 10 ++++++++++
 arch/arm64/mm/mmu.c              | 28 +++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ba63c8736666..abd2dee416b3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1643,6 +1643,16 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    pte_t old_pte, pte_t new_pte);
 
+#define modify_prot_start_ptes modify_prot_start_ptes
+extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
+				    unsigned long addr, pte_t *ptep,
+				    unsigned int nr);
+
+#define modify_prot_commit_ptes modify_prot_commit_ptes
+extern void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+				    pte_t *ptep, pte_t old_pte, pte_t pte,
+				    unsigned int nr);
+
 #ifdef CONFIG_ARM64_CONTPTE
 
 /*
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 3d5fb37424ab..38325616f467 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -26,6 +26,7 @@
 #include <linux/set_memory.h>
 #include <linux/kfence.h>
 #include <linux/pkeys.h>
+#include <linux/mm_inline.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -1524,24 +1525,41 @@ static int __init prevent_bootmem_remove_init(void)
 early_initcall(prevent_bootmem_remove_init);
 #endif
 
-pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, unsigned int nr)
 {
+	pte_t pte = get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
+
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
 		/*
 		 * Break-before-make (BBM) is required for all user space mappings
 		 * when the permission changes from executable to non-executable
 		 * in cases where cpu is affected with errata #2645198.
 		 */
-		if (pte_user_exec(ptep_get(ptep)))
-			return ptep_clear_flush(vma, addr, ptep);
+		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
+			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
+					  PAGE_SIZE, true, 3);
 	}
-	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
+
+	return pte;
+}
+
+pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+{
+	return modify_prot_start_ptes(vma, addr, ptep, 1);
+}
+
+void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, pte_t old_pte, pte_t pte,
+			     unsigned int nr)
+{
+	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
 }
 
 void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
 			     pte_t old_pte, pte_t pte)
 {
-	set_pte_at(vma->vm_mm, addr, ptep, pte);
+	modify_prot_commit_ptes(vma, addr, ptep, old_pte, pte, 1);
 }
 
 /*
-- 
2.30.2

