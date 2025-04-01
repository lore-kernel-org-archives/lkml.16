Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431C20D51E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743534373; cv=none; b=Ba957JH96AXDzSHwAll9WtsRtNu/vw1rS71I6ikcH+5E9sRed0Bc6gKjAr7RLy3rdcdlxy3smJEYpprlIOhG20cY4WOWOw6PUiMEY6NIzAt5r8cMC1pOIiPnt0yYziO89/0qGrJ6e5xRPJRN3iSXYr21gwN27CxS+yR1dKyfmgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743534373; c=relaxed/simple;
	bh=eJAQpeTiAEAWn6jE5rU5Hw60MZwHgDyggy23BmOnCmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVhYANLgPzhkFsrQjD+cPdNqZvtjUI5Pw+oALY+9wAHC0ZPS4WTc3ELk0Vwrrrv2lHV5I7n2OxhHhEOUpnon3gywX+00r3/JwGhHAzSD7NiuQFTY/7v5OsHS661x4jQ0vsGqQ0kTwi0smBvXRKh2lkdhXkSNM5cpEYRVCF79Urs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7F2IdkZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7F2IdkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212FEC4CEE4;
	Tue,  1 Apr 2025 19:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743534372;
	bh=eJAQpeTiAEAWn6jE5rU5Hw60MZwHgDyggy23BmOnCmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7F2IdkZaqMzSzeegNTiIx+ppAXKFRQfKjRikFyhSKvsOt2MMbS3JCE4LU3KgRBHX
	 NQGnAZDUqmfFDoTJNr7SnMaaKwzciY0L6RXr8AWfG01+067eDJ8K9nJ5iqsdbC50+G
	 j14t18qFxvsFQy1H3lPlC4RdAA5ucVrNMEaJ3DRRMasFZhJ6qNAjsurTH4lpwlVI6M
	 PhGbLbqWUkdmPH3dDQ4wHGTnFSuqNI5jj3vwWNpRrM6ZG66hB7UkQDpSkKJU8/uQOs
	 umjdmfYHy6UvZYjfo4xN1SNlBhq+KcJKOdD3INnStIWOSf3DppdbIGdZ65HRg/kEeM
	 61ozhF13jEytw==
Date: Tue, 1 Apr 2025 21:06:08 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 11/49] x86/alternatives: Remove the confusing, inaccurate
 & unnecessary 'temp_mm_state_t' abstraction
Message-ID: <Z-w5INj77OkbFDQe@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-12-mingo@kernel.org>
 <20250401143624.GI5880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401143624.GI5880@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Mar 28, 2025 at 02:26:26PM +0100, Ingo Molnar wrote:
> > So the temp_mm_state_t abstraction used by use_temporary_mm() and
> > unuse_temporary_mm() is super confusing:
> 
> I thing I see what you're saying, but we also still have these patches
> pending:
> 
>   https://lkml.kernel.org/r/20241119162527.952745944@infradead.org
> 
> :-(

Yeah, so I think we should do your queue on top of mine, the
whole temp_mm_state_t abstraction was rather nonsensical,
and we shouldn't be iterating confusing code...

I've ported patches #1 and #3 from your queue on top, see
attached below - these should be the two that represent 99%
of the conflicts between these two efforts AFAICS.

Does that work for you?

Thanks,

	Ingo

================>
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue, 19 Nov 2024 17:25:28 +0100
Subject: [PATCH] x86/mm: Add mm argument to unuse_temporary_mm()

In commit 209954cbc7d0 ("x86/mm/tlb: Update mm_cpumask lazily")
unuse_temporary_mm() grew the assumption that it gets used on
poking_nn exclusively. While this is currently true, lets not hard
code this assumption.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/20241119163035.322525475@infradead.org
---
 arch/x86/kernel/alternative.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5b1a6252a4b9..cfffcb80f564 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2161,14 +2161,14 @@ static inline struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
 __ro_after_init struct mm_struct *text_poke_mm;
 __ro_after_init unsigned long text_poke_mm_addr;
 
-static inline void unuse_temporary_mm(struct mm_struct *prev_mm)
+static inline void unuse_temporary_mm(struct mm_struct *mm, struct mm_struct *prev_mm)
 {
 	lockdep_assert_irqs_disabled();
 
 	switch_mm_irqs_off(NULL, prev_mm, current);
 
 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
-	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(text_poke_mm));
+	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
 
 	/*
 	 * Restore the breakpoints if they were disabled before the temporary mm
@@ -2275,7 +2275,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * instruction that already allows the core to see the updated version.
 	 * Xen-PV is assumed to serialize execution in a similar manner.
 	 */
-	unuse_temporary_mm(prev_mm);
+	unuse_temporary_mm(text_poke_mm, prev_mm);
 
 	/*
 	 * Flushing the TLB might involve IPIs, which would require enabled


======================================>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 19 Nov 2024 17:25:30 +0100
Subject: [PATCH] x86/mm: Make use/unuse_temporary_mm() non-static

This prepares them for use outside of the alternative machinery.
The code is unchanged.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lkml.kernel.org/r/d1205bc7e165e249c52b7fe8cb1254f06e8a0e2a.1641659630.git.luto@kernel.org
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
