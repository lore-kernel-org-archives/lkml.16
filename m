Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D128EB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141363; cv=none; b=hfx6L32GpRVNIUld6IFeVs33rZF9wP6aTfPtQq2WfkI+/4tZric9hpAqq9v9/RrvcJLdA91azQUfJzDFw9YFpKq3woJJtim1rMh1RJ61IqCj+DWJc/Y2iCtgR2CV50LlcSPyXVWRVz1cy5UgMqdbU6mbDuHfO1YtyHYRd2sC3+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141363; c=relaxed/simple;
	bh=pwKXZ7JdEhYK/8XERx6KXCjYqveKgYWh5sI7lsuJRCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHNcHC/ryjWxq/fjPZOyOhD/90rNxjiAmjSiQWXzmGZC5JzkZQEt04UKENyLeCVctE+ye2W2qZQBJmy7Ugl25Z5TXRGL6MUkmWEj7f2c4E/0rCfqZ0lXLP/n0iQd6DXzhjj9H4+zfXiEfw6gmVcUR7qYMv92vAxhO85e0JJcsI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=YHHnm21D; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="YHHnm21D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=khz39EtDqLWffJdydfpu+X36rlWqSeiyiuDlzc/r+Ug=; b=YHHnm21DlLph7IRT69AUT4M3xX
	mMMvaTZtrmUnp1LSQxORQf7RXoYZs2myZOJAl10WvyjglpTwzD7IHm4i+KZkrt1Wwz6pOXJqVek5X
	dplIjIH1SbjPOpF4ypKYAjT6IlN3b5tgVTQ7RrcLnlN3ChfE5yVHxxm5wbBSdJqAdxZ1X8jibAWK5
	x4D8w5V4Sg2bNCi13ZqjDrH+XL9twawyWWGRmgLj6YnD/V7qZdCA9VDJ2p2humpoHsi4/lNlcgCWk
	GMX7zOqgliPLZN2fNEhy8EqSk5nd6BmAkZvOfYNFKBMVdjbAkma78E4SR/8iDLzbYJuOwutaqexdR
	hYbTcgIw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3lKG;
	Thu, 05 Jun 2025 12:35:46 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 7/7] x86/mm: userspace & pageout flushing using Intel RAR
Date: Thu,  5 Jun 2025 12:35:16 -0400
Message-ID: <20250605163544.3852565-8-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 arch/x86/include/asm/tlbflush.h |   9 +-
 arch/x86/mm/tlb.c               | 177 ++++++++++++++++++++++++--------
 2 files changed, 141 insertions(+), 45 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e9b81876ebe4..21bd9162df38 100644
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
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) ||
+	    cpu_feature_enabled(X86_FEATURE_RAR)) {
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
index 8931f7029d6c..75f32f49bef6 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -222,7 +222,8 @@ struct new_asid {
 	unsigned int need_flush : 1;
 };
 
-static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tlb_gen)
+static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
+				       bool new_cpu)
 {
 	struct new_asid ns;
 	u16 asid;
@@ -235,14 +236,22 @@ static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tlb_gen)
 
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
 			ns.asid = global_asid;
 			ns.need_flush = 0;
+			/*
+			 * If the CPU fell out of the cpumask, it can be
+			 * out of date with RAR, and should be flushed.
+			 */
+			if (cpu_feature_enabled(X86_FEATURE_RAR))
+				ns.need_flush = new_cpu;
 			return ns;
 		}
 	}
@@ -300,7 +309,14 @@ static void reset_global_asid_space(void)
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
@@ -377,7 +393,7 @@ static void use_global_asid(struct mm_struct *mm)
 {
 	u16 asid;
 
-	guard(raw_spinlock_irqsave)(&global_asid_lock);
+	guard(raw_spinlock)(&global_asid_lock);
 
 	/* This process is already using broadcast TLB invalidation. */
 	if (mm_global_asid(mm))
@@ -403,13 +419,14 @@ static void use_global_asid(struct mm_struct *mm)
 
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
@@ -427,7 +444,8 @@ static bool mm_needs_global_asid(struct mm_struct *mm, u16 asid)
 {
 	u16 global_asid = mm_global_asid(mm);
 
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return false;
 
 	/* Process is transitioning to a global ASID */
@@ -445,7 +463,8 @@ static bool mm_needs_global_asid(struct mm_struct *mm, u16 asid)
  */
 static void consider_global_asid(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return;
 
 	/* Check every once in a while. */
@@ -490,6 +509,7 @@ static void finish_asid_transition(struct flush_tlb_info *info)
 		 * that results in a (harmless) extra IPI.
 		 */
 		if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm_asid, cpu)) != bc_asid) {
+			info->trim_cpumask = true;
 			flush_tlb_multi(mm_cpumask(info->mm), info);
 			return;
 		}
@@ -499,7 +519,7 @@ static void finish_asid_transition(struct flush_tlb_info *info)
 	mm_clear_asid_transition(mm);
 }
 
-static void broadcast_tlb_flush(struct flush_tlb_info *info)
+static void invlpgb_tlb_flush(struct flush_tlb_info *info)
 {
 	bool pmd = info->stride_shift == PMD_SHIFT;
 	unsigned long asid = mm_global_asid(info->mm);
@@ -530,8 +550,6 @@ static void broadcast_tlb_flush(struct flush_tlb_info *info)
 		addr += nr << info->stride_shift;
 	} while (addr < info->end);
 
-	finish_asid_transition(info);
-
 	/* Wait for the INVLPGBs kicked off above to finish. */
 	__tlbsync();
 }
@@ -862,7 +880,7 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		/* Check if the current mm is transitioning to a global ASID */
 		if (mm_needs_global_asid(next, prev_asid)) {
 			next_tlb_gen = atomic64_read(&next->context.tlb_gen);
-			ns = choose_new_asid(next, next_tlb_gen);
+			ns = choose_new_asid(next, next_tlb_gen, true);
 			goto reload_tlb;
 		}
 
@@ -900,6 +918,7 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		ns.asid = prev_asid;
 		ns.need_flush = true;
 	} else {
+		bool new_cpu = false;
 		/*
 		 * Apply process to process speculation vulnerability
 		 * mitigations if applicable.
@@ -914,20 +933,25 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 		this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
 		barrier();
 
-		/* Start receiving IPIs and then read tlb_gen (and LAM below) */
-		if (next != &init_mm && !cpumask_test_cpu(cpu, mm_cpumask(next)))
+		/* Start receiving IPIs and RAR invalidations */
+		if (next != &init_mm && !cpumask_test_cpu(cpu, mm_cpumask(next))) {
 			cpumask_set_cpu(cpu, mm_cpumask(next));
+			if (cpu_feature_enabled(X86_FEATURE_RAR))
+				new_cpu = true;
+		}
+
 		next_tlb_gen = atomic64_read(&next->context.tlb_gen);
 
-		ns = choose_new_asid(next, next_tlb_gen);
+		ns = choose_new_asid(next, next_tlb_gen, new_cpu);
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
@@ -1115,7 +1139,7 @@ static void flush_tlb_func(void *info)
 	const struct flush_tlb_info *f = info;
 	struct mm_struct *loaded_mm = this_cpu_read(cpu_tlbstate.loaded_mm);
 	u32 loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
-	u64 local_tlb_gen;
+	u64 local_tlb_gen = 0;
 	bool local = smp_processor_id() == f->initiating_cpu;
 	unsigned long nr_invalidate = 0;
 	u64 mm_tlb_gen;
@@ -1138,19 +1162,6 @@ static void flush_tlb_func(void *info)
 	if (unlikely(loaded_mm == &init_mm))
 		return;
 
-	/* Reload the ASID if transitioning into or out of a global ASID */
-	if (mm_needs_global_asid(loaded_mm, loaded_mm_asid)) {
-		switch_mm_irqs_off(NULL, loaded_mm, NULL);
-		loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
-	}
-
-	/* Broadcast ASIDs are always kept up to date with INVLPGB. */
-	if (is_global_asid(loaded_mm_asid))
-		return;
-
-	VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id) !=
-		   loaded_mm->context.ctx_id);
-
 	if (this_cpu_read(cpu_tlbstate_shared.is_lazy)) {
 		/*
 		 * We're in lazy mode.  We need to at least flush our
@@ -1161,11 +1172,31 @@ static void flush_tlb_func(void *info)
 		 * This should be rare, with native_flush_tlb_multi() skipping
 		 * IPIs to lazy TLB mode CPUs.
 		 */
+		cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(loaded_mm));
 		switch_mm_irqs_off(NULL, &init_mm, NULL);
 		return;
 	}
 
-	local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
+	/* Reload the ASID if transitioning into or out of a global ASID */
+	if (mm_needs_global_asid(loaded_mm, loaded_mm_asid)) {
+		switch_mm_irqs_off(NULL, loaded_mm, NULL);
+		loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
+	}
+
+	/*
+	 * Broadcast ASIDs are always kept up to date with INVLPGB; with
+	 * Intel RAR IPI based flushes are used periodically to trim the
+	 * mm_cpumask, and flushes that get here should be processed.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    is_global_asid(loaded_mm_asid))
+		return;
+
+	VM_WARN_ON(is_dyn_asid(loaded_mm_asid) && loaded_mm->context.ctx_id !=
+		   this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id));
+
+	if (is_dyn_asid(loaded_mm_asid))
+		local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
 
 	if (unlikely(f->new_tlb_gen != TLB_GENERATION_INVALID &&
 		     f->new_tlb_gen <= local_tlb_gen)) {
@@ -1264,7 +1295,8 @@ static void flush_tlb_func(void *info)
 	}
 
 	/* Both paths above update our state to mm_tlb_gen. */
-	this_cpu_write(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen, mm_tlb_gen);
+	if (is_dyn_asid(loaded_mm_asid))
+		this_cpu_write(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen, mm_tlb_gen);
 
 	/* Tracing is done in a unified manner to reduce the code size */
 done:
@@ -1305,10 +1337,6 @@ static bool should_flush_tlb(int cpu, void *data)
 	if (loaded_mm == info->mm)
 		return true;
 
-	/* In cpumask, but not the loaded mm? Periodically remove by flushing. */
-	if (info->trim_cpumask)
-		return true;
-
 	return false;
 }
 
@@ -1324,6 +1352,27 @@ static bool should_trim_cpumask(struct mm_struct *mm)
 DEFINE_PER_CPU_SHARED_ALIGNED(struct tlb_state_shared, cpu_tlbstate_shared);
 EXPORT_PER_CPU_SYMBOL(cpu_tlbstate_shared);
 
+static bool should_flush_all(const struct flush_tlb_info *info)
+{
+	if (info->freed_tables)
+		return true;
+
+	if (info->trim_cpumask)
+		return true;
+
+	/*
+	 * INVLPGB and RAR do not use this code path normally.
+	 * This call cleans up the cpumask or ASID transition.
+	 */
+	if (mm_global_asid(info->mm))
+		return true;
+
+	if (mm_in_asid_transition(info->mm))
+		return true;
+
+	return false;
+}
+
 STATIC_NOPV void native_flush_tlb_multi(const struct cpumask *cpumask,
 					 const struct flush_tlb_info *info)
 {
@@ -1349,7 +1398,7 @@ STATIC_NOPV void native_flush_tlb_multi(const struct cpumask *cpumask,
 	 * up on the new contents of what used to be page tables, while
 	 * doing a speculative memory access.
 	 */
-	if (info->freed_tables || mm_in_asid_transition(info->mm))
+	if (should_flush_all(info))
 		on_each_cpu_mask(cpumask, flush_tlb_func, (void *)info, true);
 	else
 		on_each_cpu_cond_mask(should_flush_tlb, flush_tlb_func,
@@ -1380,6 +1429,35 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct flush_tlb_info, flush_tlb_info);
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
+
+	finish_asid_transition(info);
+}
+
 static struct flush_tlb_info *get_flush_tlb_info(struct mm_struct *mm,
 			unsigned long start, unsigned long end,
 			unsigned int stride_shift, bool freed_tables,
@@ -1440,15 +1518,22 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
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
@@ -1759,6 +1844,14 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
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

