Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49734AA71
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746492565; cv=none; b=rS93WZRSC1lMbC9YYuTusV/3SxN02f5CuOyVU2o8ZEcaxIxDD4oGKebSqeMXIG/TegmUCSo8tn3aUYY7p3P2I98EhC6Qe42wW2gJravO0kMjuEld3aXpMGQ/P9Zdh2K7pWfO/3bC9NX8SW2olEMByE7ocy8abCUyoIsLg01tpW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746492565; c=relaxed/simple;
	bh=EV8op9KpgnmZmV/JxT0ECHLeduQDSWJev2uNMIO9cZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAF142/BIPFnL9rhO0flLbbZ8NydtWujzP7ea0AauoHv8KNSfoFScKWRDjNZKDK06AVTeILTMVArOLljSdrVUo89r/DnKN6d72snAzcwOyz7pH2xlec2N5P5bfrVuv6+NOKtuwMv6doQhYSxJ/WY6lVWYb/OE8ziPFBvGk1+J0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uC6K6-000000000IF-40O7;
	Mon, 05 May 2025 20:38:14 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 9/9] x86/mm: userspace & pageout flushing using Intel RAR
Date: Mon,  5 May 2025 20:37:47 -0400
Message-ID: <20250506003811.92405-10-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506003811.92405-1-riel@surriel.com>
References: <20250506003811.92405-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

From: Rik van Riel <riel@fb.com>

Use Intel RAR to flush userspace mappings.

Because RAR flushes are targeted using a cpu bitmap, the rules are
a little bit different than for true broadcast TLB invalidation.

For true broadcast TLB invalidation, like done with AMD INVLPGB,
a global ASID always has up to date TLB entries on every CPU.
The context switch code never has to flush the TLB when switching
to a global ASID on any CPU with INVLPGB.

For RAR, the TLB mappings for a global ASID are kept up to date
only on CPUs within the mm_cpumask, which lazily follows the
threads around the system. The context switch code does not
need to flush the TLB if the CPU is in the mm_cpumask, and
the PCID used stays the same.

However, a CPU that falls outside of the mm_cpumask can have
out of date TLB mappings for this task. When switching to
that task on a CPU not in the mm_cpumask, the TLB does need
to be flushed.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/tlbflush.h |   9 ++-
 arch/x86/mm/tlb.c               | 119 +++++++++++++++++++++++++-------
 2 files changed, 99 insertions(+), 29 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..1940d51f95a9 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -250,7 +250,8 @@ static inline u16 mm_global_asid(struct mm_struct *mm)
 {
 	u16 asid;
 
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return 0;
 
 	asid = smp_load_acquire(&mm->context.global_asid);
@@ -263,7 +264,8 @@ static inline u16 mm_global_asid(struct mm_struct *mm)
 
 static inline void mm_init_global_asid(struct mm_struct *mm)
 {
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR)) {
 		mm->context.global_asid = 0;
 		mm->context.asid_transition = false;
 	}
@@ -287,7 +289,8 @@ static inline void mm_clear_asid_transition(struct mm_struct *mm)
 
 static inline bool mm_in_asid_transition(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return false;
 
 	return mm && READ_ONCE(mm->context.asid_transition);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index a4f3941281b6..724359be3f97 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -235,9 +235,11 @@ static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tlb_gen)
 
 	/*
 	 * TLB consistency for global ASIDs is maintained with hardware assisted
-	 * remote TLB flushing. Global ASIDs are always up to date.
+	 * remote TLB flushing. Global ASIDs are always up to date with INVLPGB,
+	 * and up to date for CPUs in the mm_cpumask with RAR..
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) ||
+	    cpu_feature_enabled(X86_FEATURE_RAR)) {
 		u16 global_asid = mm_global_asid(next);
 
 		if (global_asid) {
@@ -300,7 +302,14 @@ static void reset_global_asid_space(void)
 {
 	lockdep_assert_held(&global_asid_lock);
 
-	invlpgb_flush_all_nonglobals();
+	/*
+	 * The global flush ensures that a freshly allocated global ASID
+	 * has no entries in any TLB, and can be used immediately.
+	 * With Intel RAR, the TLB may still need to be flushed at context
+	 * switch time when dealing with a CPU that was not in the mm_cpumask
+	 * for the process, and may have missed flushes along the way.
+	 */
+	flush_tlb_all();
 
 	/*
 	 * The TLB flush above makes it safe to re-use the previously
@@ -377,7 +386,7 @@ static void use_global_asid(struct mm_struct *mm)
 {
 	u16 asid;
 
-	guard(raw_spinlock_irqsave)(&global_asid_lock);
+	guard(raw_spinlock)(&global_asid_lock);
 
 	/* This process is already using broadcast TLB invalidation. */
 	if (mm_global_asid(mm))
@@ -403,13 +412,14 @@ static void use_global_asid(struct mm_struct *mm)
 
 void mm_free_global_asid(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return;
 
 	if (!mm_global_asid(mm))
 		return;
 
-	guard(raw_spinlock_irqsave)(&global_asid_lock);
+	guard(raw_spinlock)(&global_asid_lock);
 
 	/* The global ASID can be re-used only after flush at wrap-around. */
 #ifdef CONFIG_BROADCAST_TLB_FLUSH
@@ -427,7 +437,8 @@ static bool mm_needs_global_asid(struct mm_struct *mm, u16 asid)
 {
 	u16 global_asid = mm_global_asid(mm);
 
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return false;
 
 	/* Process is transitioning to a global ASID */
@@ -445,7 +456,8 @@ static bool mm_needs_global_asid(struct mm_struct *mm, u16 asid)
  */
 static void consider_global_asid(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return;
 
 	/* Check every once in a while. */
@@ -499,7 +511,7 @@ static void finish_asid_transition(struct flush_tlb_info *info)
 	mm_clear_asid_transition(mm);
 }
 
-static void broadcast_tlb_flush(struct flush_tlb_info *info)
+static void invlpgb_tlb_flush(struct flush_tlb_info *info)
 {
 	bool pmd = info->stride_shift == PMD_SHIFT;
 	unsigned long asid = mm_global_asid(info->mm);
@@ -865,13 +877,6 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 			goto reload_tlb;
 		}
 
-		/*
-		 * Broadcast TLB invalidation keeps this ASID up to date
-		 * all the time.
-		 */
-		if (is_global_asid(prev_asid))
-			return;
-
 		/*
 		 * If the CPU is not in lazy TLB mode, we are just switching
 		 * from one thread in a process to another thread in the same
@@ -880,6 +885,15 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		if (!was_lazy)
 			return;
 
+		/*
+		 * Broadcast TLB invalidation keeps this ASID up to date
+		 * all the time with AMD INVLPGB. Intel RAR may need a TLB
+		 * flush if the CPU was in lazy TLB mode..
+		 */
+		if (cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+		    is_global_asid(prev_asid))
+			return;
+
 		/*
 		 * Read the tlb_gen to check whether a flush is needed.
 		 * If the TLB is up to date, just use it.
@@ -912,20 +926,27 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
 		barrier();
 
-		/* Start receiving IPIs and then read tlb_gen (and LAM below) */
-		if (next != &init_mm && !cpumask_test_cpu(cpu, mm_cpumask(next)))
-			cpumask_set_cpu(cpu, mm_cpumask(next));
+		/* A TLB flush started during a context switch is harmless. */
 		next_tlb_gen = atomic64_read(&next->context.tlb_gen);
 
 		ns = choose_new_asid(next, next_tlb_gen);
+
+		/* Start receiving IPIs and RAR invalidations */
+		if (next != &init_mm && !cpumask_test_cpu(cpu, mm_cpumask(next))) {
+			cpumask_set_cpu(cpu, mm_cpumask(next));
+			/* CPUs outside mm_cpumask may be out of date. */
+			if (cpu_feature_enabled(X86_FEATURE_RAR))
+				ns.need_flush = true;
+		}
 	}
 
 reload_tlb:
 	new_lam = mm_lam_cr3_mask(next);
 	if (ns.need_flush) {
-		VM_WARN_ON_ONCE(is_global_asid(ns.asid));
-		this_cpu_write(cpu_tlbstate.ctxs[ns.asid].ctx_id, next->context.ctx_id);
-		this_cpu_write(cpu_tlbstate.ctxs[ns.asid].tlb_gen, next_tlb_gen);
+		if (is_dyn_asid(ns.asid)) {
+			this_cpu_write(cpu_tlbstate.ctxs[ns.asid].ctx_id, next->context.ctx_id);
+			this_cpu_write(cpu_tlbstate.ctxs[ns.asid].tlb_gen, next_tlb_gen);
+		}
 		load_new_mm_cr3(next->pgd, ns.asid, new_lam, true);
 
 		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
@@ -1142,8 +1163,12 @@ static void flush_tlb_func(void *info)
 		loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
 	}
 
-	/* Broadcast ASIDs are always kept up to date with INVLPGB. */
-	if (is_global_asid(loaded_mm_asid))
+	/*
+	 * Broadcast ASIDs are always kept up to date with INVLPGB; with
+	 * Intel RAR IPI based flushes are used periodically to trim the
+	 * mm_cpumask. Make sure those flushes are processed here.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) && is_global_asid(loaded_mm_asid))
 		return;
 
 	VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id) !=
@@ -1363,6 +1388,33 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct flush_tlb_info, flush_tlb_info);
 static DEFINE_PER_CPU(unsigned int, flush_tlb_info_idx);
 #endif
 
+static void rar_tlb_flush(struct flush_tlb_info *info)
+{
+	unsigned long asid = mm_global_asid(info->mm);
+	u16 pcid = kern_pcid(asid);
+
+	/* Flush the remote CPUs. */
+	smp_call_rar_many(mm_cpumask(info->mm), pcid, info->start, info->end);
+	if (cpu_feature_enabled(X86_FEATURE_PTI))
+		smp_call_rar_many(mm_cpumask(info->mm), user_pcid(asid), info->start, info->end);
+
+	/* Flush the local TLB, if needed. */
+	if (cpumask_test_cpu(smp_processor_id(), mm_cpumask(info->mm))) {
+		lockdep_assert_irqs_enabled();
+		local_irq_disable();
+		flush_tlb_func(info);
+		local_irq_enable();
+	}
+}
+
+static void broadcast_tlb_flush(struct flush_tlb_info *info)
+{
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
+		invlpgb_tlb_flush(info);
+	else /* Intel RAR */
+		rar_tlb_flush(info);
+}
+
 static struct flush_tlb_info *get_flush_tlb_info(struct mm_struct *mm,
 			unsigned long start, unsigned long end,
 			unsigned int stride_shift, bool freed_tables,
@@ -1423,15 +1475,22 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 	info = get_flush_tlb_info(mm, start, end, stride_shift, freed_tables,
 				  new_tlb_gen);
 
+	/*
+	 * IPIs and RAR can be targeted to a cpumask. Periodically trim that
+	 * mm_cpumask by sending TLB flush IPIs, even when most TLB flushes
+	 * are done with RAR.
+	 */
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) || !mm_global_asid(mm))
+		info->trim_cpumask = should_trim_cpumask(mm);
+
 	/*
 	 * flush_tlb_multi() is not optimized for the common case in which only
 	 * a local TLB flush is needed. Optimize this use-case by calling
 	 * flush_tlb_func_local() directly in this case.
 	 */
-	if (mm_global_asid(mm)) {
+	if (mm_global_asid(mm) && !info->trim_cpumask) {
 		broadcast_tlb_flush(info);
 	} else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
-		info->trim_cpumask = should_trim_cpumask(mm);
 		flush_tlb_multi(mm_cpumask(mm), info);
 		consider_global_asid(mm);
 	} else if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
@@ -1742,6 +1801,14 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) && batch->unmapped_pages) {
 		invlpgb_flush_all_nonglobals();
 		batch->unmapped_pages = false;
+	} else if (cpu_feature_enabled(X86_FEATURE_RAR) && cpumask_any(&batch->cpumask) < nr_cpu_ids) {
+		rar_full_flush(&batch->cpumask);
+		if (cpumask_test_cpu(cpu, &batch->cpumask)) {
+			lockdep_assert_irqs_enabled();
+			local_irq_disable();
+			invpcid_flush_all_nonglobals();
+			local_irq_enable();
+		}
 	} else if (cpumask_any_but(&batch->cpumask, cpu) < nr_cpu_ids) {
 		flush_tlb_multi(&batch->cpumask, info);
 	} else if (cpumask_test_cpu(cpu, &batch->cpumask)) {
-- 
2.49.0

