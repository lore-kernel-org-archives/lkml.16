Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8A255F5F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709457; cv=none; b=Xh0fOya7sgXoKOEW4v/Mn7bJATLVig2rT2kJ0LvLNLN9qJCGRMKHDevIHZ19n8I3B60ULmPk0+ZVug17x3rJ96Ha8jvVwjQolI6DL0l4DgKdDrBUSzKZfaRiuwk28e0jAyG8FDB4PgTNEDVQoRdbtzOF0Z4VvJUjQGdbbsRv5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709457; c=relaxed/simple;
	bh=FcRqnZOaCqu1jZn4i/3VammQunczwHnROu+ZhBBaPh8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uDyo/VPrPeRXSOvSyLd/dHtsYjuyW59KtH8ZF3QBg6AKsaM0ozsPnlFBFG2MLkqaWUsKmBoqTYi4vKqZnWaaclI8Khu9aUJ1iTgqNRyOytlHbsqh/Amat6ZogTiCj5WoItLw9VlMdpFtkuzwa7n8BHfBFOrLUD2ZGXwDzWvI5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:8180:83cc:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHD29-000000001rs-3iUn;
	Mon, 19 May 2025 22:48:49 -0400
Date: Mon, 19 May 2025 22:48:49 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 nadav.amit@gmail.com, Rik van Riel <riel@fb.com>
Subject: Re: [RFC v2.1 9/9] x86/mm: userspace & pageout flushing using Intel
 RAR
Message-ID: <20250519224849.4a98b33d@fangorn>
In-Reply-To: <20250520010350.1740223-10-riel@surriel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
	<20250520010350.1740223-10-riel@surriel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: riel@surriel.com

On Mon, 19 May 2025 21:02:34 -0400
Rik van Riel <riel@surriel.com> wrote:

> From: Rik van Riel <riel@fb.com>
>=20
> Use Intel RAR to flush userspace mappings.

The version below no longer segfaults.

However, I am still hitting the WARN_ON() in leave_mm(),
when called from the idle task through cpuidle_enter_state().

---8<---
=46rom e80e10cdb6f15d29a65ab438cb07ba4b99f64b6e Mon Sep 17 00:00:00 2001
From: Rik van Riel <riel@fb.com>
Date: Thu, 24 Apr 2025 07:15:44 -0700
Subject: [PATCH 10/11] x86/mm: userspace & pageout flushing using Intel RAR

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
 arch/x86/mm/tlb.c               | 133 +++++++++++++++++++++++++-------
 2 files changed, 111 insertions(+), 31 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflus=
h.h
index cc9935bbbd45..bdde3ce6c9b1 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -276,7 +276,8 @@ static inline u16 mm_global_asid(struct mm_struct *mm)
 {
 	u16 asid;
=20
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return 0;
=20
 	asid =3D smp_load_acquire(&mm->context.global_asid);
@@ -289,7 +290,8 @@ static inline u16 mm_global_asid(struct mm_struct *mm)
=20
 static inline void mm_init_global_asid(struct mm_struct *mm)
 {
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) ||
+	    cpu_feature_enabled(X86_FEATURE_RAR)) {
 		mm->context.global_asid =3D 0;
 		mm->context.asid_transition =3D false;
 	}
@@ -313,7 +315,8 @@ static inline void mm_clear_asid_transition(struct mm_s=
truct *mm)
=20
 static inline bool mm_in_asid_transition(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return false;
=20
 	return mm && READ_ONCE(mm->context.asid_transition);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 35489df811dc..457191c2b5de 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -203,7 +203,8 @@ struct new_asid {
 	unsigned int need_flush : 1;
 };
=20
-static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tl=
b_gen)
+static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tl=
b_gen,
+				       bool new_cpu)
 {
 	struct new_asid ns;
 	u16 asid;
@@ -216,14 +217,22 @@ static struct new_asid choose_new_asid(struct mm_stru=
ct *next, u64 next_tlb_gen)
=20
 	/*
 	 * TLB consistency for global ASIDs is maintained with hardware assisted
-	 * remote TLB flushing. Global ASIDs are always up to date.
+	 * remote TLB flushing. Global ASIDs are always up to date with INVLPGB,
+	 * and up to date for CPUs in the mm_cpumask with RAR..
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) ||
+	    cpu_feature_enabled(X86_FEATURE_RAR)) {
 		u16 global_asid =3D mm_global_asid(next);
=20
 		if (global_asid) {
 			ns.asid =3D global_asid;
 			ns.need_flush =3D 0;
+			/*
+			 * If the CPU fell out of the cpumask, it can be
+			 * out of date with RAR, and should be flushed.
+			 */
+			if (cpu_feature_enabled(X86_FEATURE_RAR))
+				ns.need_flush =3D new_cpu;
 			return ns;
 		}
 	}
@@ -281,7 +290,14 @@ static void reset_global_asid_space(void)
 {
 	lockdep_assert_held(&global_asid_lock);
=20
-	invlpgb_flush_all_nonglobals();
+	/*
+	 * The global flush ensures that a freshly allocated global ASID
+	 * has no entries in any TLB, and can be used immediately.
+	 * With Intel RAR, the TLB may still need to be flushed at context
+	 * switch time when dealing with a CPU that was not in the mm_cpumask
+	 * for the process, and may have missed flushes along the way.
+	 */
+	flush_tlb_all();
=20
 	/*
 	 * The TLB flush above makes it safe to re-use the previously
@@ -358,7 +374,7 @@ static void use_global_asid(struct mm_struct *mm)
 {
 	u16 asid;
=20
-	guard(raw_spinlock_irqsave)(&global_asid_lock);
+	guard(raw_spinlock)(&global_asid_lock);
=20
 	/* This process is already using broadcast TLB invalidation. */
 	if (mm_global_asid(mm))
@@ -384,13 +400,14 @@ static void use_global_asid(struct mm_struct *mm)
=20
 void mm_free_global_asid(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return;
=20
 	if (!mm_global_asid(mm))
 		return;
=20
-	guard(raw_spinlock_irqsave)(&global_asid_lock);
+	guard(raw_spinlock)(&global_asid_lock);
=20
 	/* The global ASID can be re-used only after flush at wrap-around. */
 #ifdef CONFIG_BROADCAST_TLB_FLUSH
@@ -408,7 +425,8 @@ static bool mm_needs_global_asid(struct mm_struct *mm, =
u16 asid)
 {
 	u16 global_asid =3D mm_global_asid(mm);
=20
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return false;
=20
 	/* Process is transitioning to a global ASID */
@@ -426,13 +444,17 @@ static bool mm_needs_global_asid(struct mm_struct *mm=
, u16 asid)
  */
 static void consider_global_asid(struct mm_struct *mm)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    !cpu_feature_enabled(X86_FEATURE_RAR))
 		return;
=20
 	/* Check every once in a while. */
 	if ((current->pid & 0x1f) !=3D (jiffies & 0x1f))
 		return;
=20
+	if (mm =3D=3D &init_mm)
+		return;
+
 	/*
 	 * Assign a global ASID if the process is active on
 	 * 4 or more CPUs simultaneously.
@@ -480,7 +502,7 @@ static void finish_asid_transition(struct flush_tlb_inf=
o *info)
 	mm_clear_asid_transition(mm);
 }
=20
-static void broadcast_tlb_flush(struct flush_tlb_info *info)
+static void invlpgb_tlb_flush(struct flush_tlb_info *info)
 {
 	bool pmd =3D info->stride_shift =3D=3D PMD_SHIFT;
 	unsigned long asid =3D mm_global_asid(info->mm);
@@ -511,8 +533,6 @@ static void broadcast_tlb_flush(struct flush_tlb_info *=
info)
 		addr +=3D nr << info->stride_shift;
 	} while (addr < info->end);
=20
-	finish_asid_transition(info);
-
 	/* Wait for the INVLPGBs kicked off above to finish. */
 	__tlbsync();
 }
@@ -840,7 +860,7 @@ void switch_mm_irqs_off(struct mm_struct *unused, struc=
t mm_struct *next,
 		/* Check if the current mm is transitioning to a global ASID */
 		if (mm_needs_global_asid(next, prev_asid)) {
 			next_tlb_gen =3D atomic64_read(&next->context.tlb_gen);
-			ns =3D choose_new_asid(next, next_tlb_gen);
+			ns =3D choose_new_asid(next, next_tlb_gen, true);
 			goto reload_tlb;
 		}
=20
@@ -878,6 +898,7 @@ void switch_mm_irqs_off(struct mm_struct *unused, struc=
t mm_struct *next,
 		ns.asid =3D prev_asid;
 		ns.need_flush =3D true;
 	} else {
+		bool new_cpu =3D false;
 		/*
 		 * Apply process to process speculation vulnerability
 		 * mitigations if applicable.
@@ -892,20 +913,25 @@ void switch_mm_irqs_off(struct mm_struct *unused, str=
uct mm_struct *next,
 		this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
 		barrier();
=20
-		/* Start receiving IPIs and then read tlb_gen (and LAM below) */
-		if (next !=3D &init_mm && !cpumask_test_cpu(cpu, mm_cpumask(next)))
+		/* Start receiving IPIs and RAR invalidations */
+		if (next !=3D &init_mm && !cpumask_test_cpu(cpu, mm_cpumask(next))) {
 			cpumask_set_cpu(cpu, mm_cpumask(next));
+			if (cpu_feature_enabled(X86_FEATURE_RAR))
+				new_cpu =3D true;
+		}
+
 		next_tlb_gen =3D atomic64_read(&next->context.tlb_gen);
=20
-		ns =3D choose_new_asid(next, next_tlb_gen);
+		ns =3D choose_new_asid(next, next_tlb_gen, new_cpu);
 	}
=20
 reload_tlb:
 	new_lam =3D mm_lam_cr3_mask(next);
 	if (ns.need_flush) {
-		VM_WARN_ON_ONCE(is_global_asid(ns.asid));
-		this_cpu_write(cpu_tlbstate.ctxs[ns.asid].ctx_id, next->context.ctx_id);
-		this_cpu_write(cpu_tlbstate.ctxs[ns.asid].tlb_gen, next_tlb_gen);
+		if (is_dyn_asid(ns.asid)) {
+			this_cpu_write(cpu_tlbstate.ctxs[ns.asid].ctx_id, next->context.ctx_id);
+			this_cpu_write(cpu_tlbstate.ctxs[ns.asid].tlb_gen, next_tlb_gen);
+		}
 		load_new_mm_cr3(next->pgd, ns.asid, new_lam, true);
=20
 		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
@@ -1096,7 +1122,7 @@ static void flush_tlb_func(void *info)
 	u64 local_tlb_gen;
 	bool local =3D smp_processor_id() =3D=3D f->initiating_cpu;
 	unsigned long nr_invalidate =3D 0;
-	u64 mm_tlb_gen;
+	u64 mm_tlb_gen =3D 0;
=20
 	/* This code cannot presently handle being reentered. */
 	VM_WARN_ON(!irqs_disabled());
@@ -1122,12 +1148,17 @@ static void flush_tlb_func(void *info)
 		loaded_mm_asid =3D this_cpu_read(cpu_tlbstate.loaded_mm_asid);
 	}
=20
-	/* Broadcast ASIDs are always kept up to date with INVLPGB. */
-	if (is_global_asid(loaded_mm_asid))
+	/*
+	 * Broadcast ASIDs are always kept up to date with INVLPGB; with
+	 * Intel RAR IPI based flushes are used periodically to trim the
+	 * mm_cpumask, and flushes that get here should be processed.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) &&
+	    is_global_asid(loaded_mm_asid))
 		return;
=20
-	VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id) !=3D
-		   loaded_mm->context.ctx_id);
+	VM_WARN_ON(is_dyn_asid(loaded_mm_asid) && loaded_mm->context.ctx_id !=3D
+		   this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id));
=20
 	if (this_cpu_read(cpu_tlbstate_shared.is_lazy)) {
 		/*
@@ -1143,7 +1174,8 @@ static void flush_tlb_func(void *info)
 		return;
 	}
=20
-	local_tlb_gen =3D this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen=
);
+	if (is_dyn_asid(loaded_mm_asid))
+		local_tlb_gen =3D this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_ge=
n);
=20
 	if (unlikely(f->new_tlb_gen !=3D TLB_GENERATION_INVALID &&
 		     f->new_tlb_gen <=3D local_tlb_gen)) {
@@ -1242,7 +1274,8 @@ static void flush_tlb_func(void *info)
 	}
=20
 	/* Both paths above update our state to mm_tlb_gen. */
-	this_cpu_write(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen, mm_tlb_gen);
+	if (is_dyn_asid(loaded_mm_asid))
+		this_cpu_write(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen, mm_tlb_gen);
=20
 	/* Tracing is done in a unified manner to reduce the code size */
 done:
@@ -1358,6 +1391,35 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct flush_tl=
b_info, flush_tlb_info);
 static DEFINE_PER_CPU(unsigned int, flush_tlb_info_idx);
 #endif
=20
+static void rar_tlb_flush(struct flush_tlb_info *info)
+{
+	unsigned long asid =3D mm_global_asid(info->mm);
+	u16 pcid =3D kern_pcid(asid);
+
+	/* Flush the remote CPUs. */
+	smp_call_rar_many(mm_cpumask(info->mm), pcid, info->start, info->end);
+	if (cpu_feature_enabled(X86_FEATURE_PTI))
+		smp_call_rar_many(mm_cpumask(info->mm), user_pcid(asid), info->start, in=
fo->end);
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
@@ -1418,15 +1480,22 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsig=
ned long start,
 	info =3D get_flush_tlb_info(mm, start, end, stride_shift, freed_tables,
 				  new_tlb_gen);
=20
+	/*
+	 * IPIs and RAR can be targeted to a cpumask. Periodically trim that
+	 * mm_cpumask by sending TLB flush IPIs, even when most TLB flushes
+	 * are done with RAR.
+	 */
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB) || !mm_global_asid(mm))
+		info->trim_cpumask =3D should_trim_cpumask(mm);
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
-		info->trim_cpumask =3D should_trim_cpumask(mm);
 		flush_tlb_multi(mm_cpumask(mm), info);
 		consider_global_asid(mm);
 	} else if (mm =3D=3D this_cpu_read(cpu_tlbstate.loaded_mm)) {
@@ -1737,6 +1806,14 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_=
batch *batch)
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) && batch->unmapped_pages) {
 		invlpgb_flush_all_nonglobals();
 		batch->unmapped_pages =3D false;
+	} else if (cpu_feature_enabled(X86_FEATURE_RAR) && cpumask_any(&batch->cp=
umask) < nr_cpu_ids) {
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
--=20
2.47.1

