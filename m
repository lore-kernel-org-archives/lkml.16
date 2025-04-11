Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09206280A2A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350092; cv=none; b=FMb5nYwjQzxcg7HZcX9gUjXwxJGfnPyCF/ke5B7xEu9nFNa9MuoknM5wYJGfhWyDd0sFvAMV4qhMCi0xnDsZXZYKPQmu0+gaZiVJSnPvInr+1hCnRvrxnTztC5zKtNGOGi+SvA2gMpL5ZPsE0FunmyrZqFhgyQtNcaCGddSuCJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350092; c=relaxed/simple;
	bh=+3TFSMmZfapb3avr4NuLCplNFnlG3WK2pBGYdCTARa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZ9Cj17zasnLay9uqTKfihp5GEp6wjs0gprOpnytF7mGP1IIvKMdJxQ48Pglyzt7RApGr/6CqZ878sruthu+IFhQNV5aXMsdE5CzRgrT8CK+LBgzt0VTP4gl4CT7uBNj2K+o88/yP71tAqEAamv13BckwsBLxp95um92Eg1UxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/KVge6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/KVge6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F063C4CEE2;
	Fri, 11 Apr 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350091;
	bh=+3TFSMmZfapb3avr4NuLCplNFnlG3WK2pBGYdCTARa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/KVge6BI1kxznqQMm+jRv27d6bqlc6NPtGw6Nkna2rtRCN6sh6pMJwp2VX26bBNM
	 OoxnhF5QYzBvdPMYNplM+syfCKpcVgFJLlaUalISK7TKp1gsRcvabP6TNyeIPKiLB4
	 IsUpdPIKCsqQzL/yMQR6cqKdreujY9Ps1j1spSs9+InvHr3TEcmfUPCZT9+lU/VNyz
	 0BeuxBtzfsKSbSjCqk0G4GJ1Fm3jL/bZdShjQB3NLiXIQpeztbZORtPnq/0MiKn2j+
	 pciXE8xHnioa+pjdMhBtwf7MxdDuXX9/LlqCzd4ZJhmF294W/d2bEqmGml5ARzEEln
	 EFEjD7KVoLOeA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 08/53] x86/alternatives: Rename 'poking_mm' to 'text_poke_mm'
Date: Fri, 11 Apr 2025 07:40:20 +0200
Message-ID: <20250411054105.2341982-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put it into the text_poke_* namespace of <asm/text-patching.h>.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h |  2 +-
 arch/x86/kernel/alternative.c        | 18 +++++++++---------
 arch/x86/mm/init.c                   |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 93a6b7bc78bd..7a95c0820b3e 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -128,7 +128,7 @@ void *text_gen_insn(u8 opcode, const void *addr, const void *dest)
 }
 
 extern int after_bootmem;
-extern __ro_after_init struct mm_struct *poking_mm;
+extern __ro_after_init struct mm_struct *text_poke_mm;
 extern __ro_after_init unsigned long poking_addr;
 
 #ifndef CONFIG_UML_X86
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 44269d8bf492..5afd453e4352 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2191,7 +2191,7 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
 	return temp_state;
 }
 
-__ro_after_init struct mm_struct *poking_mm;
+__ro_after_init struct mm_struct *text_poke_mm;
 __ro_after_init unsigned long poking_addr;
 
 static inline void unuse_temporary_mm(temp_mm_state_t prev_state)
@@ -2201,7 +2201,7 @@ static inline void unuse_temporary_mm(temp_mm_state_t prev_state)
 	switch_mm_irqs_off(NULL, prev_state.mm, current);
 
 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
-	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(poking_mm));
+	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(text_poke_mm));
 
 	/*
 	 * Restore the breakpoints if they were disabled before the temporary mm
@@ -2266,7 +2266,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	/*
 	 * The lock is not really needed, but this allows to avoid open-coding.
 	 */
-	ptep = get_locked_pte(poking_mm, poking_addr, &ptl);
+	ptep = get_locked_pte(text_poke_mm, poking_addr, &ptl);
 
 	/*
 	 * This must not fail; preallocated in poking_init().
@@ -2276,18 +2276,18 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	local_irq_save(flags);
 
 	pte = mk_pte(pages[0], pgprot);
-	set_pte_at(poking_mm, poking_addr, ptep, pte);
+	set_pte_at(text_poke_mm, poking_addr, ptep, pte);
 
 	if (cross_page_boundary) {
 		pte = mk_pte(pages[1], pgprot);
-		set_pte_at(poking_mm, poking_addr + PAGE_SIZE, ptep + 1, pte);
+		set_pte_at(text_poke_mm, poking_addr + PAGE_SIZE, ptep + 1, pte);
 	}
 
 	/*
 	 * Loading the temporary mm behaves as a compiler barrier, which
 	 * guarantees that the PTE will be set at the time memcpy() is done.
 	 */
-	prev = use_temporary_mm(poking_mm);
+	prev = use_temporary_mm(text_poke_mm);
 
 	kasan_disable_current();
 	func((u8 *)poking_addr + offset_in_page(addr), src, len);
@@ -2299,9 +2299,9 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 */
 	barrier();
 
-	pte_clear(poking_mm, poking_addr, ptep);
+	pte_clear(text_poke_mm, poking_addr, ptep);
 	if (cross_page_boundary)
-		pte_clear(poking_mm, poking_addr + PAGE_SIZE, ptep + 1);
+		pte_clear(text_poke_mm, poking_addr + PAGE_SIZE, ptep + 1);
 
 	/*
 	 * Loading the previous page-table hierarchy requires a serializing
@@ -2314,7 +2314,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * Flushing the TLB might involve IPIs, which would require enabled
 	 * IRQs, but not if the mm is not used, as it is in this point.
 	 */
-	flush_tlb_mm_range(poking_mm, poking_addr, poking_addr +
+	flush_tlb_mm_range(text_poke_mm, poking_addr, poking_addr +
 			   (cross_page_boundary ? 2 : 1) * PAGE_SIZE,
 			   PAGE_SHIFT, false);
 
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..84b52a1ebd48 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -824,11 +824,11 @@ void __init poking_init(void)
 	spinlock_t *ptl;
 	pte_t *ptep;
 
-	poking_mm = mm_alloc();
-	BUG_ON(!poking_mm);
+	text_poke_mm = mm_alloc();
+	BUG_ON(!text_poke_mm);
 
 	/* Xen PV guests need the PGD to be pinned. */
-	paravirt_enter_mmap(poking_mm);
+	paravirt_enter_mmap(text_poke_mm);
 
 	/*
 	 * Randomize the poking address, but make sure that the following page
@@ -848,7 +848,7 @@ void __init poking_init(void)
 	 * needed for poking now. Later, poking may be performed in an atomic
 	 * section, which might cause allocation to fail.
 	 */
-	ptep = get_locked_pte(poking_mm, poking_addr, &ptl);
+	ptep = get_locked_pte(text_poke_mm, poking_addr, &ptl);
 	BUG_ON(!ptep);
 	pte_unmap_unlock(ptep, ptl);
 }
-- 
2.45.2

