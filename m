Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D3819E975
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744262445; cv=none; b=kImMRM7A2mZXlzzDOU9vIDm1XRIbY9xAMxY27GThvtqtTKzbwzpCmuuUfz8+DCq5ubbAS0JXy0I5l+QF6HXInVw4esdKxTfFcG4LhDOdG5dIunEXgxeadwTnWG7Z4NeUJeWQqPl9QHwdHh+YnBMyMFAb39aLvBDWXRkjVowFziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744262445; c=relaxed/simple;
	bh=JlHgBzwEAofj0ts4SN5jX3PPZnyFKFLz6sy7k/cemOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eEEsXMUlaj5q8Ix0kJf+4lR7vw5fRSLlEbWNS8f8qEeN823a0xRZVWhLRSRzDooZ1tR+w1/k+DRess9XNzdyLnAMPaPP4dgbBSrWnrZtvaMSah4uH385dm72M3iAo0VQUzfJdXxahgmPGdiT241ds0QEiZDwxrNXWmFzzZWiBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9069152B;
	Wed,  9 Apr 2025 22:20:41 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 099943F694;
	Wed,  9 Apr 2025 22:20:38 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH] arm64/mm: Implement pte_po_index() for permission overlay index
Date: Thu, 10 Apr 2025 10:50:21 +0530
Message-Id: <20250410052021.1533180-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan Roberts <ryan.roberts@arm.com>

Previously pte_access_permitted() used FIELD_GET() directly to retrieve
the permission overlay index from the pte. However, FIELD_GET() doesn't
work for 128 bit quanitites. Since we are about to add support for D128
pgtables, let's create a specific helper, pte_po_index() which can do
the required mask and shift regardless of the data type width.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc1

 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/include/asm/pgtable-prot.h  | 2 ++
 arch/arm64/include/asm/pgtable.h       | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index f3b77deedfa2..028a164924df 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -211,6 +211,7 @@
 #define PTE_PO_IDX_2	(_AT(pteval_t, 1) << 62)
 
 #define PTE_PO_IDX_MASK		GENMASK_ULL(62, 60)
+#define PTE_PO_IDX_SHIFT	60
 
 
 /*
diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 7830d031742e..b53bc241e4e7 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -136,6 +136,8 @@ static inline bool __pure lpa2_is_enabled(void)
 	((pte & BIT(PTE_PI_IDX_1)) >> (PTE_PI_IDX_1 - 1)) | \
 	((pte & BIT(PTE_PI_IDX_0)) >> (PTE_PI_IDX_0 - 0)))
 
+#define pte_po_index(pte)	((pte_val(pte) & PTE_PO_IDX_MASK) >> PTE_PO_IDX_SHIFT)
+
 /*
  * Page types used via Permission Indirection Extension (PIE). PIE uses
  * the USER, DBM, PXN and UXN bits to to generate an index which is used
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..41979c0e6c21 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -182,7 +182,7 @@ static inline bool por_el0_allows_pkey(u8 pkey, bool write, bool execute)
 	(((pte_val(pte) & (PTE_VALID | PTE_USER)) == (PTE_VALID | PTE_USER)) && (!(write) || pte_write(pte)))
 #define pte_access_permitted(pte, write) \
 	(pte_access_permitted_no_overlay(pte, write) && \
-	por_el0_allows_pkey(FIELD_GET(PTE_PO_IDX_MASK, pte_val(pte)), write, false))
+	por_el0_allows_pkey(pte_po_index(pte), write, false))
 #define pmd_access_permitted(pmd, write) \
 	(pte_access_permitted(pmd_pte(pmd), (write)))
 #define pud_access_permitted(pud, write) \
-- 
2.25.1

