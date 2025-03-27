Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977631DE4E6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108856; cv=none; b=P0nvN4JzP0wkg9YMY7ZiaSNAgfCUMz36FZdGe2xQv7zvP0KCuPGsGubkgdsyDXCRXIxYxM6emBVANIUGp8oFl+UbKYB+wCgbm2ayJ6T/ioTfJcpTpuKS2jztX5VBKluOhrW84PkHJW3x1nsG6lUoz/Q2jKO3mjXC9PX9if6RiaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108856; c=relaxed/simple;
	bh=Za83jEeJe5sEnXkLkjmf0uI5lYD0YSWcEN8BPWeB1YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BursO/wq7m47/NNpuFpevMCuqSHofVLSNnQTlFeZfBE96V/CD9M3YxyAE76oz8i2JVA8TTWK65mB8BFUYb3PNToEMqxJYmQsJQzhQbk/up9DidXwo134lhgt6qGcQrW0zEvrYk3GH7t6N+z6yZ+dpS2nqskIqipsj+H8GF+72Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAWmBtly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAWmBtly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E69BC4CEDD;
	Thu, 27 Mar 2025 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108855;
	bh=Za83jEeJe5sEnXkLkjmf0uI5lYD0YSWcEN8BPWeB1YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAWmBtlyYYVO//fD4hy0uAg+0IMhHuSVjvbygCpD4sRsUcFEDjc8BMyatrofcYyqQ
	 YRh2ZwQk9FJX+0tfr5Rk1zIuFLNM0r6TZw8xebTxxkGh4m9HUUJjh5zZ9jyDMPZJBa
	 k/pPAIKPXv4X5aJUex6pA8Lk8vBNjYb7G5d9ytXXF21OlN0iQr4/C1GhW/kke8DtzT
	 2ADnX8ZLye+1DO4buYmaDjO7CvOKM7+3zz6PNQ5Jbsbx2HprdBkSxET7mkZ7nfAHGY
	 Siad0ZK17+e45VCBsKdhMZ4Vpkoch4etPRq8eteLbQ8xaXfo0wS89X1sIc9LgKLRry
	 klH/zNVrY31ww==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 06/41] x86/alternatives: Rename 'poking_mm' to 'text_poke_mm'
Date: Thu, 27 Mar 2025 21:53:19 +0100
Message-ID: <20250327205355.378659-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
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
index fbca0bd725b6..e41ea3040680 100644
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
index 5d410c97d451..f4baeeaa6c0c 100644
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

