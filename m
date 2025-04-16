Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8B42288EA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744775775; cv=none; b=LoSrInlVoCkinTDK0kftEu4LohJAhkwRB2TvA34efgCkbMvzvjkIs/RJzXCXg/BFRxc65Hsl56CeeHAYxD7UpP1xT84sgoDc+KvE07YXFnzZKgRsUkyd5CiGAfoK6+40538GMqKlqZABDcVc3RRThdCz5uO9lBfF5Z4skx/huXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744775775; c=relaxed/simple;
	bh=CG4W3PtCvho6lU3wdJAKWnvax7/2hSUA0GJTXBRzVf0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lsI+uSAxBAC2hkl3BUioreOjwtj72hQhMa2N3nY5XmvM0NTU+HbrlUXdjl880NioxBhSv6KWe9wY+9LiFgqBTaM/+4+5OLF6y32ymyVWBFbh2yazenBXws9o22iY//gsN9g1cKt+5R7UkcD4DTEEDfoqTb39QMtNdJ/I/UWt3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9391516;
	Tue, 15 Apr 2025 20:56:09 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 339E53F694;
	Tue, 15 Apr 2025 20:56:08 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
Date: Wed, 16 Apr 2025 09:26:04 +0530
Message-Id: <20250416035604.2717188-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mov_q cannot really move PIE_E[0|1] macros into a general purpose register
as expected if those macro constants contain some 128 bit layout elements,
that are required for D128 page tables. The primary issue is that for D128,
PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
which the assembler can't accommodate.

Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.

While here also move PTE_MAYBE_NG/PTE_MAYBE_SHARED assembly overrides into
arch/arm64/kernel/asm-offsets.c to ensure PIRE0_EL1/PIR_EL1 are calculated
in assembly without arm64_use_ng_mappings and lpa2_is_enabled() symbols
being accessible. Also move the corresponding comment as well.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc2

Changes in V2:

- Added asm-offsets.c based PIE_E0_ASM and PIE_E1_ASM symbols as per Ard
- Moved PTE_MAYBE_NG and PTE_MAYBE_SHARED overrides inside asm-offsets.c
  along with the corresponding comment as per Ard

Changes in V1:

https://lore.kernel.org/linux-arm-kernel/20250410074024.1545768-1-anshuman.khandual@arm.com/

 arch/arm64/kernel/asm-offsets.c | 16 ++++++++++++++++
 arch/arm64/mm/proc.S            | 19 ++-----------------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index eb1a840e4110..5b99a78f6882 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -182,5 +182,21 @@ int main(void)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   DEFINE(FTRACE_OPS_DIRECT_CALL,	offsetof(struct ftrace_ops, direct_call));
 #endif
+	/*
+	 * The PROT_* macros describing the various memory types may resolve to
+	 * C expressions if they include the PTE_MAYBE_* macros, and so they
+	 * can only be used from C code. The PIE_E* constants below are also
+	 * defined in terms of those macros, but will mask out those
+	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
+	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
+	 */
+#undef PTE_MAYBE_NG
+#define PTE_MAYBE_NG		0
+
+#undef PTE_MAYBE_SHARED
+#define PTE_MAYBE_SHARED	0
+
+  DEFINE(PIE_E0_ASM, PIE_E0);
+  DEFINE(PIE_E1_ASM, PIE_E1);
   return 0;
 }
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index fb30c8804f87..80d470aa469d 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -512,26 +512,11 @@ alternative_else_nop_endif
 	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
 	cbz	x1, .Lskip_indirection
 
-	/*
-	 * The PROT_* macros describing the various memory types may resolve to
-	 * C expressions if they include the PTE_MAYBE_* macros, and so they
-	 * can only be used from C code. The PIE_E* constants below are also
-	 * defined in terms of those macros, but will mask out those
-	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
-	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
-	 */
-
-#define PTE_MAYBE_NG		0
-#define PTE_MAYBE_SHARED	0
-
-	mov_q	x0, PIE_E0
+	mov_q	x0, PIE_E0_ASM
 	msr	REG_PIRE0_EL1, x0
-	mov_q	x0, PIE_E1
+	mov_q	x0, PIE_E1_ASM
 	msr	REG_PIR_EL1, x0
 
-#undef PTE_MAYBE_NG
-#undef PTE_MAYBE_SHARED
-
 	orr	tcr2, tcr2, TCR2_EL1_PIE
 	msr	REG_TCR2_EL1, x0
 
-- 
2.25.1

