Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D0EFC0B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763537; cv=none; b=RdgROWaeNbKH9fMsUbc9YCLwK2mRQ3XiULD1TbR8EfDtBe/GneM5T4pggDm+ZiM3Dg3faByLtqDtiHGrr1rFJsfwuzI4/XWxvcwvddnrUvWZixHnLqjvvyEohTbU9LC/FSrC04a+2Fr5QflQ89OK793T8DSFufRJwTLrg5PPris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763537; c=relaxed/simple;
	bh=kJgo/05KBHAX3dOu7Gr2W7wUkyozZfMGVAK6a2pteSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+RJuSCnYq4UOTd3YqHIxZOY6KBITTRKYbH1s7atwfBJlZFdKzsbJejDc/yEDLUrwZg0SAtXTTkKJqafImGpfLyQx7K5M7h93Q1KaP1X5XqG51NWwnBfSOKhLBlFxn1W9P7+9vWYw1TMhpuJImUrTKDcYYvG4/gkQjtqeoQbBWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rCqrhMp2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rCqrhMp2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o3tdG/ILmJ8WB9mJb6zPM5dQLbi+IcpxaV9npA9DxAc=; b=rCqrhMp2iqT/kkq0j//02TpF+W
	w+VR27oz7AikR0/YRzEpgNdd7I5hgoW+j92GuDa0FzgaLTdbnAC3C9n01l9/G5QMMyD2Dh3ckKecB
	fm4J341VsaYRVneRjPzraait+KIV/o8adFM1yvBqxJ43BGLAiUc6PU4dUqJ+E0Ckdo2uhY5UXgoHr
	MMKAyCUWT8x1131Q4Ks69x8vdiwxhdJfsoclNwpji+2ms98+PjYjGo2tsRYMx2A23CeE7PahgoJ2J
	yswhuu33CtRhf+PRhPlBy0Zn3EI/WWZKsl6wKw2OEvHKybGT+4wuvyH9x2hpO21H9wxLL4/Awh7EI
	Ux2QZlhg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tffor-00000004Vy6-0xWi;
	Wed, 05 Feb 2025 13:51:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 26DBC30083E; Wed,  5 Feb 2025 14:51:56 +0100 (CET)
Date: Wed, 5 Feb 2025 14:51:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
	mhklinux@outlook.com, andrew.cooper3@citrix.com,
	Manali Shukla <Manali.Shukla@amd.com>, David.Kaplan@amd.com
Subject: Re: [PATCH v8 10/12] x86/mm: do targeted broadcast flushing from
 tlbbatch code
Message-ID: <20250205135156.GI14028@noisy.programming.kicks-ass.net>
References: <20250205014033.3626204-1-riel@surriel.com>
 <20250205014033.3626204-11-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205014033.3626204-11-riel@surriel.com>

On Tue, Feb 04, 2025 at 08:39:59PM -0500, Rik van Riel wrote:

> @@ -1657,12 +1655,65 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  		local_irq_enable();
>  	}
>  
> +	/*
> +	 * If we issued (asynchronous) INVLPGB flushes, wait for them here.
> +	 * The cpumask above contains only CPUs that were running tasks
> +	 * not using broadcast TLB flushing.
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) && batch->used_invlpgb) {
> +		tlbsync();
> +		migrate_enable();
> +		batch->used_invlpgb = false;
> +	}
> +
>  	cpumask_clear(&batch->cpumask);
>  
>  	put_flush_tlb_info();
>  	put_cpu();
>  }
>  
> +void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +					     struct mm_struct *mm,
> +					     unsigned long uaddr)
> +{
> +	u16 asid = mm_global_asid(mm);
> +
> +	if (asid) {
> +		/*
> +		 * Queue up an asynchronous invalidation. The corresponding
> +		 * TLBSYNC is done in arch_tlbbatch_flush(), and must be done
> +		 * on the same CPU.
> +		 */
> +		if (!batch->used_invlpgb) {
> +			batch->used_invlpgb = true;
> +			migrate_disable();
> +		}

How about we do something like this instead?

This keeps all the TLBSYNC in the same task as the INVLPGB, without
making things complicated and allowing random CR3 writes in between
them -- which makes my head hurt.

---
--- a/arch/x86/include/asm/tlbbatch.h
+++ b/arch/x86/include/asm/tlbbatch.h
@@ -10,7 +10,6 @@ struct arch_tlbflush_unmap_batch {
 	 * the PFNs being flushed..
 	 */
 	struct cpumask cpumask;
-	bool used_invlpgb;
 };
 
 #endif /* _ARCH_X86_TLBBATCH_H */
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -106,6 +106,7 @@ struct tlb_state {
 	 * need to be invalidated.
 	 */
 	bool invalidate_other;
+	bool need_tlbsync;
 
 #ifdef CONFIG_ADDRESS_MASKING
 	/*
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -266,6 +266,37 @@ static void choose_new_asid(struct mm_st
 	*need_flush = true;
 }
 
+static inline void tlbsync(void)
+{
+	if (!this_cpu_read(cpu_tlbstate.need_tlbsync))
+		return;
+	__tlbsync();
+	this_cpu_write(cpu_tlbstate.need_tlbsync, false);
+}
+
+static inline void invlpgb_flush_user_nr_nosync(unsigned long pcid,
+						unsigned long addr,
+						u16 nr, bool pmd_stride)
+{
+	__invlpgb_flush_user_nr(pcid, addr, nr, pmd_stride);
+	if (!this_cpu_read(cpu_tlbstate.need_tlbsync))
+		this_cpu_write(cpu_tlbstate.need_tlbsync, true);
+}
+
+static inline void invlpgb_flush_single_pcid_nosync(unsigned long pcid)
+{
+	__invlpgb_flush_single_pcid(pcid);
+	if (!this_cpu_read(cpu_tlbstate.need_tlbsync))
+		this_cpu_write(cpu_tlbstate.need_tlbsync, true);
+}
+
+static inline void invlpgb_flush_addr_nosync(unsigned long addr, u16 nr)
+{
+	__invlpgb_flush_addr(addr, nr);
+	if (!this_cpu_read(cpu_tlbstate.need_tlbsync))
+		this_cpu_write(cpu_tlbstate.need_tlbsync, true);
+}
+
 #ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
 /*
  * Logic for broadcast TLB invalidation.
@@ -793,6 +824,8 @@ void switch_mm_irqs_off(struct mm_struct
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING))
 		WARN_ON_ONCE(!irqs_disabled());
 
+	tlbsync();
+
 	/*
 	 * Verify that CR3 is what we think it is.  This will catch
 	 * hypothetical buggy code that directly switches to swapper_pg_dir
@@ -968,6 +1001,8 @@ void switch_mm_irqs_off(struct mm_struct
  */
 void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 {
+	tlbsync();
+
 	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
 		return;
 
@@ -1623,11 +1658,8 @@ void arch_tlbbatch_flush(struct arch_tlb
 	 * The cpumask above contains only CPUs that were running tasks
 	 * not using broadcast TLB flushing.
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB) && batch->used_invlpgb) {
+	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		tlbsync();
-		migrate_enable();
-		batch->used_invlpgb = false;
-	}
 
 	cpumask_clear(&batch->cpumask);
 
@@ -1647,10 +1679,6 @@ void arch_tlbbatch_add_pending(struct ar
 		 * TLBSYNC is done in arch_tlbbatch_flush(), and must be done
 		 * on the same CPU.
 		 */
-		if (!batch->used_invlpgb) {
-			batch->used_invlpgb = true;
-			migrate_disable();
-		}
 		invlpgb_flush_user_nr_nosync(kern_pcid(asid), uaddr, 1, false);
 		/* Do any CPUs supporting INVLPGB need PTI? */
 		if (static_cpu_has(X86_FEATURE_PTI))
--- a/arch/x86/include/asm/invlpgb.h
+++ b/arch/x86/include/asm/invlpgb.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_INVLPGB
 
 #include <linux/kernel.h>
+#include <asm/page_types.h>
 #include <vdso/bits.h>
 #include <vdso/page.h>
 
@@ -31,9 +32,8 @@ static inline void __invlpgb(unsigned lo
 }
 
 /* Wait for INVLPGB originated by this CPU to complete. */
-static inline void tlbsync(void)
+static inline void __tlbsync(void)
 {
-	cant_migrate();
 	/* TLBSYNC: supported in binutils >= 0.36. */
 	asm volatile(".byte 0x0f, 0x01, 0xff" ::: "memory");
 }
@@ -61,19 +61,19 @@ static inline void invlpgb_flush_user(un
 				      unsigned long addr)
 {
 	__invlpgb(0, pcid, addr, 0, 0, INVLPGB_PCID | INVLPGB_VA);
-	tlbsync();
+	__tlbsync();
 }
 
-static inline void invlpgb_flush_user_nr_nosync(unsigned long pcid,
-						unsigned long addr,
-						u16 nr,
-						bool pmd_stride)
+static inline void __invlpgb_flush_user_nr(unsigned long pcid,
+					   unsigned long addr,
+					   u16 nr,
+					   bool pmd_stride)
 {
 	__invlpgb(0, pcid, addr, nr - 1, pmd_stride, INVLPGB_PCID | INVLPGB_VA);
 }
 
 /* Flush all mappings for a given PCID, not including globals. */
-static inline void invlpgb_flush_single_pcid_nosync(unsigned long pcid)
+static inline void __invlpgb_flush_single_pcid(unsigned long pcid)
 {
 	__invlpgb(0, pcid, 0, 0, 0, INVLPGB_PCID);
 }
@@ -82,11 +82,11 @@ static inline void invlpgb_flush_single_
 static inline void invlpgb_flush_all(void)
 {
 	__invlpgb(0, 0, 0, 0, 0, INVLPGB_INCLUDE_GLOBAL);
-	tlbsync();
+	__tlbsync();
 }
 
 /* Flush addr, including globals, for all PCIDs. */
-static inline void invlpgb_flush_addr_nosync(unsigned long addr, u16 nr)
+static inline void __invlpgb_flush_addr(unsigned long addr, u16 nr)
 {
 	__invlpgb(0, 0, addr, nr - 1, 0, INVLPGB_INCLUDE_GLOBAL);
 }
@@ -95,7 +95,7 @@ static inline void invlpgb_flush_addr_no
 static inline void invlpgb_flush_all_nonglobals(void)
 {
 	__invlpgb(0, 0, 0, 0, 0, 0);
-	tlbsync();
+	__tlbsync();
 }
 
 #endif /* _ASM_X86_INVLPGB */
