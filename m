Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890531B81DC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270836; cv=none; b=lto4R/t3NfXCx4MzbN24Q724lT08NTBQmf0CpwwfwjT/fadym4205EZrWglmtPeihdKvPF3WMT73wxbFqMdIhm3uvUn2vOj0qywTaN5BYx3+6QS77NhSjqFJjmQWUKeVkPSKN5Z4L3AkpciAbwDgX+OL1pQg+hfdIZqjZcGo2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270836; c=relaxed/simple;
	bh=DULo+ngNfrCsX6g2WrHFAv0Pz/TDbziwIZGugyXTNNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r+PqcEc3AQ45AFyXL+mClnzKBbp8UPJ69DyGsJztIBdhy6O8qQ6Xg8d3QSxMjjMWvmPzjGtynvKU+hfGxDvA6/hweR7JDcSi+JIznOsLo+ROrzn5o3OCz579wqfiYLsgCToSYfq5sHelS7WS49nrvRScTpaBgB3ObOX2iDh7/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADADF152B;
	Thu, 10 Apr 2025 00:40:32 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 915DC3F6A8;
	Thu, 10 Apr 2025 00:40:29 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
Date: Thu, 10 Apr 2025 13:10:24 +0530
Message-Id: <20250410074024.1545768-1-anshuman.khandual@arm.com>
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
required for D128 page tables. Fix this problem via first loading up these
macro constants into a given memory location and then subsequently setting
up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc1

 arch/arm64/kernel/head.S         | 3 +++
 arch/arm64/kernel/pi/map_range.c | 6 ++++++
 arch/arm64/kernel/pi/pi.h        | 1 +
 arch/arm64/mm/mmu.c              | 1 +
 arch/arm64/mm/proc.S             | 5 +++--
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 2ce73525de2c..4950d9cc638a 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
 	 * On return, the CPU will be ready for the MMU to be turned on and
 	 * the TCR will have been set.
 	 */
+	adr_l	x0, pir_data
+	bl      __pi_load_pir_data
+
 	bl	__cpu_setup			// initialise processor
 	b	__primary_switch
 SYM_CODE_END(primary_entry)
diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 81345f68f9fc..cd9d24e73046 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -103,3 +103,9 @@ asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
 
 	return ptep;
 }
+
+asmlinkage void __init load_pir_data(u64 pir_data[])
+{
+	pir_data[0] = PIE_E0;
+	pir_data[1] = PIE_E1;
+}
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..ae61df4fdb77 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -34,3 +34,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
 asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
 
 asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
+asmlinkage void load_pir_data(u64 pir_data[]);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..762e81ff4e85 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -58,6 +58,7 @@ static bool rodata_is_rw __ro_after_init = true;
  * with MMU turned off.
  */
 long __section(".mmuoff.data.write") __early_cpu_boot_status;
+unsigned long __section(".mmuoff.data.write") pir_data[2];
 
 /*
  * Empty_zero_page is a special page that is used for zero-initialized data
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index fb30c8804f87..7dd28cf101c2 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -524,9 +524,10 @@ alternative_else_nop_endif
 #define PTE_MAYBE_NG		0
 #define PTE_MAYBE_SHARED	0
 
-	mov_q	x0, PIE_E0
+	adr_l	x1, pir_data
+	ldr	x0, [x1, #0]
 	msr	REG_PIRE0_EL1, x0
-	mov_q	x0, PIE_E1
+	ldr	x0, [x1, #8]
 	msr	REG_PIR_EL1, x0
 
 #undef PTE_MAYBE_NG
-- 
2.25.1

