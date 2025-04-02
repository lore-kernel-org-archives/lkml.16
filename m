Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA42237179
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587168; cv=none; b=OsJsufSMZrvhnYHWGq1ZStFs1KrpLrueDYv3c/YY3gKDavTvEdeyQaNaWeuH+EO3776yNzkN8Pec/O8MhDqmNM3qC5MZqbwGy/C0HuNEL8/vMkwFPtrZlLGw9aHD8OCvAf1WlKGoWSssjzmToFfTv3uEOnFpeoovKvkALMbvn/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587168; c=relaxed/simple;
	bh=NW9l22mXyPj/Fc8NtQZqNbq47+xPnMqEPj1Ls6OWb8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kt+14zHC3yoD+f6LcYsN1d/wKcJZYSjx3z1fPKKbJjdHZTP5YBc4MKKTy09iSfyABVgv3qNkXF1Nu/pxDT4k11GHwSFerjY675RG6jSmmJvcz0Hjc6hUbLbBO9dq68dP61iCNuPoA++nWi3tuy+0n+Jczn6y9PcjvfDuCpnOMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gj35kfmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gj35kfmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84835C4CEDD;
	Wed,  2 Apr 2025 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587167;
	bh=NW9l22mXyPj/Fc8NtQZqNbq47+xPnMqEPj1Ls6OWb8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gj35kfmHhqGaNY68yK9mQG3BJ0qiJaHMyIl23+hxL7Wwc2Ju4oTarfz1KYZmD9Vm3
	 4Isi3orA2NULC5EJ+WK7OStyCo5pdlk6u0GWSvWfgUL4VPOucTAcrnQ3bHZfEhnEa7
	 6y1gNdUjkBQGr2v9Ga9DwMpIA7y8sbZKUkKiCTx4KT1JUZ0iY7Pow2DkqEqGlN6cBq
	 0T3nI7SrJFGlbM7xd4L/sk0wDWepCbfAr445Niy7i8OXCzeEt6AnuUzlfGuTLvRzQ6
	 boUFjHxmrpBSWq9oEH9HxjFT0wY532dgY/jys0wjIezqJvb/dBd7KMCPudGEgxAXiu
	 LxbfYxBe97Jqg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 3/7] x86/mm: Make use_/unuse_temporary_mm() non-static
Date: Wed,  2 Apr 2025 11:45:36 +0200
Message-ID: <20250402094540.3586683-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402094540.3586683-1-mingo@kernel.org>
References: <20250402094540.3586683-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Lutomirski <luto@kernel.org>

This prepares them for use outside of the alternative machinery.
The code is unchanged.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20241119163035.533822339@infradead.org
---
 arch/x86/include/asm/mmu_context.h |  3 ++
 arch/x86/kernel/alternative.c      | 64 --------------------------------------
 arch/x86/mm/tlb.c                  | 64 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 64 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 2398058b6e83..b103e1709a67 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -272,4 +272,7 @@ unsigned long __get_current_cr3_fast(void);
 
 #include <asm-generic/mmu_context.h>
 
+extern struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm);
+extern void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm);
+
 #endif /* _ASM_X86_MMU_CONTEXT_H */
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cfffcb80f564..25abadaf8751 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2111,73 +2111,9 @@ void __init_or_module text_poke_early(void *addr, const void *opcode,
 	}
 }
 
-/*
- * Using a temporary mm allows to set temporary mappings that are not accessible
- * by other CPUs. Such mappings are needed to perform sensitive memory writes
- * that override the kernel memory protections (e.g., W^X), without exposing the
- * temporary page-table mappings that are required for these write operations to
- * other CPUs. Using a temporary mm also allows to avoid TLB shootdowns when the
- * mapping is torn down.
- *
- * Context: The temporary mm needs to be used exclusively by a single core. To
- *          harden security IRQs must be disabled while the temporary mm is
- *          loaded, thereby preventing interrupt handler bugs from overriding
- *          the kernel memory protection.
- */
-static inline struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
-{
-	struct mm_struct *prev_mm;
-
-	lockdep_assert_irqs_disabled();
-
-	/*
-	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
-	 * with a stale address space WITHOUT being in lazy mode after
-	 * restoring the previous mm.
-	 */
-	if (this_cpu_read(cpu_tlbstate_shared.is_lazy))
-		leave_mm();
-
-	prev_mm = this_cpu_read(cpu_tlbstate.loaded_mm);
-	switch_mm_irqs_off(NULL, temp_mm, current);
-
-	/*
-	 * If breakpoints are enabled, disable them while the temporary mm is
-	 * used. Userspace might set up watchpoints on addresses that are used
-	 * in the temporary mm, which would lead to wrong signals being sent or
-	 * crashes.
-	 *
-	 * Note that breakpoints are not disabled selectively, which also causes
-	 * kernel breakpoints (e.g., perf's) to be disabled. This might be
-	 * undesirable, but still seems reasonable as the code that runs in the
-	 * temporary mm should be short.
-	 */
-	if (hw_breakpoint_active())
-		hw_breakpoint_disable();
-
-	return prev_mm;
-}
-
 __ro_after_init struct mm_struct *text_poke_mm;
 __ro_after_init unsigned long text_poke_mm_addr;
 
-static inline void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm)
-{
-	lockdep_assert_irqs_disabled();
-
-	switch_mm_irqs_off(NULL, prev_mm, current);
-
-	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
-	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
-
-	/*
-	 * Restore the breakpoints if they were disabled before the temporary mm
-	 * was loaded.
-	 */
-	if (hw_breakpoint_active())
-		hw_breakpoint_restore();
-}
-
 static void text_poke_memcpy(void *dst, const void *src, size_t len)
 {
 	memcpy(dst, src, len);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0925768d00cb..06a1ad39be74 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -972,6 +972,70 @@ void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
 }
 
+/*
+ * Using a temporary mm allows to set temporary mappings that are not accessible
+ * by other CPUs. Such mappings are needed to perform sensitive memory writes
+ * that override the kernel memory protections (e.g., W^X), without exposing the
+ * temporary page-table mappings that are required for these write operations to
+ * other CPUs. Using a temporary mm also allows to avoid TLB shootdowns when the
+ * mapping is torn down.
+ *
+ * Context: The temporary mm needs to be used exclusively by a single core. To
+ *          harden security IRQs must be disabled while the temporary mm is
+ *          loaded, thereby preventing interrupt handler bugs from overriding
+ *          the kernel memory protection.
+ */
+struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
+{
+	struct mm_struct *prev_mm;
+
+	lockdep_assert_irqs_disabled();
+
+	/*
+	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
+	 * with a stale address space WITHOUT being in lazy mode after
+	 * restoring the previous mm.
+	 */
+	if (this_cpu_read(cpu_tlbstate_shared.is_lazy))
+		leave_mm();
+
+	prev_mm = this_cpu_read(cpu_tlbstate.loaded_mm);
+	switch_mm_irqs_off(NULL, temp_mm, current);
+
+	/*
+	 * If breakpoints are enabled, disable them while the temporary mm is
+	 * used. Userspace might set up watchpoints on addresses that are used
+	 * in the temporary mm, which would lead to wrong signals being sent or
+	 * crashes.
+	 *
+	 * Note that breakpoints are not disabled selectively, which also causes
+	 * kernel breakpoints (e.g., perf's) to be disabled. This might be
+	 * undesirable, but still seems reasonable as the code that runs in the
+	 * temporary mm should be short.
+	 */
+	if (hw_breakpoint_active())
+		hw_breakpoint_disable();
+
+	return prev_mm;
+}
+
+void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm)
+{
+	lockdep_assert_irqs_disabled();
+
+	switch_mm_irqs_off(NULL, prev_mm, current);
+
+	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
+	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
+
+	/*
+	 * Restore the breakpoints if they were disabled before the temporary mm
+	 * was loaded.
+	 */
+	if (hw_breakpoint_active())
+		hw_breakpoint_restore();
+}
+
 /*
  * Call this when reinitializing a CPU.  It fixes the following potential
  * problems:
-- 
2.45.2

