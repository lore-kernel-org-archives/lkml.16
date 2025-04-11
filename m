Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A4280A42
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350094; cv=none; b=LMbmOcV44lQBpNdEB/UaaP6MgSP32rMuNyrDl3RqGX3nK4MgQNBSdqGc4VXL4kLL6es++QttKZk0vWv3EbUFh3sZleFBlicH3MeN9liEelP+f7hyYOodixmZNsEbhKQv86Hkq5ZJXM+xmADRAHt/MZmwrqQyWPgdp8f5VGgMMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350094; c=relaxed/simple;
	bh=N5+8VWro4dAMeojhXBYAQkgI64QssYs5rPPdSnMjZLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsqu46nshw3TkUhmH2liKJUuS8DyaIAvK1G3A7MUDWzF51XzmybPuKau5h64G8LSciQydLhQzhN0IvT9DVXckgDp4Lx8RbMluzWOSEYM1CrSpc+VZrij7Tu2MKhpB58jSnq+OPzufZXnCHYUcbioPbyT62Ro7CoWJenvaK8QTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQU66mGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQU66mGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC34C4CEE5;
	Fri, 11 Apr 2025 05:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350093;
	bh=N5+8VWro4dAMeojhXBYAQkgI64QssYs5rPPdSnMjZLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQU66mGYZX3PRpdBzmh49S/xOqF47126gDvyS2gr1GOECjtNqP1tQg8LpkmjyfQsl
	 cgY1DhDLMsIRh3UYRS688JhNzAwX+IpZ/HnO63IQyrAT6jSquZBzL5yFUarAvIY4bd
	 JKiJNlZab5a9I+2Abu3JoMmRnzWVSihntYWNEwmsMMxy9yecldhEaIyui/qhnWoUKK
	 iymq/vzb9tXrQ/a5uGV1VJn78mzZQXMlqmUSIM+Blojw8JAR5XeXlc8aSKtEVxHQvj
	 bqyGr6pR9QtcC913gY1TrcxRxZM/qWnelXyRyvXSiGhmIEIHAzoHJALUZK8FCN0GFN
	 lUBR9O1POdEUQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 09/53] x86/alternatives: Rename 'poking_addr' to 'text_poke_mm_addr'
Date: Fri, 11 Apr 2025 07:40:21 +0200
Message-ID: <20250411054105.2341982-10-mingo@kernel.org>
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
 arch/x86/kernel/alternative.c        | 16 ++++++++--------
 arch/x86/mm/init.c                   | 10 +++++-----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 7a95c0820b3e..c8eac8cf4737 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -129,7 +129,7 @@ void *text_gen_insn(u8 opcode, const void *addr, const void *dest)
 
 extern int after_bootmem;
 extern __ro_after_init struct mm_struct *text_poke_mm;
-extern __ro_after_init unsigned long poking_addr;
+extern __ro_after_init unsigned long text_poke_mm_addr;
 
 #ifndef CONFIG_UML_X86
 static __always_inline
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5afd453e4352..a64032b2f6ca 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2192,7 +2192,7 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
 }
 
 __ro_after_init struct mm_struct *text_poke_mm;
-__ro_after_init unsigned long poking_addr;
+__ro_after_init unsigned long text_poke_mm_addr;
 
 static inline void unuse_temporary_mm(temp_mm_state_t prev_state)
 {
@@ -2266,7 +2266,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	/*
 	 * The lock is not really needed, but this allows to avoid open-coding.
 	 */
-	ptep = get_locked_pte(text_poke_mm, poking_addr, &ptl);
+	ptep = get_locked_pte(text_poke_mm, text_poke_mm_addr, &ptl);
 
 	/*
 	 * This must not fail; preallocated in poking_init().
@@ -2276,11 +2276,11 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	local_irq_save(flags);
 
 	pte = mk_pte(pages[0], pgprot);
-	set_pte_at(text_poke_mm, poking_addr, ptep, pte);
+	set_pte_at(text_poke_mm, text_poke_mm_addr, ptep, pte);
 
 	if (cross_page_boundary) {
 		pte = mk_pte(pages[1], pgprot);
-		set_pte_at(text_poke_mm, poking_addr + PAGE_SIZE, ptep + 1, pte);
+		set_pte_at(text_poke_mm, text_poke_mm_addr + PAGE_SIZE, ptep + 1, pte);
 	}
 
 	/*
@@ -2290,7 +2290,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	prev = use_temporary_mm(text_poke_mm);
 
 	kasan_disable_current();
-	func((u8 *)poking_addr + offset_in_page(addr), src, len);
+	func((u8 *)text_poke_mm_addr + offset_in_page(addr), src, len);
 	kasan_enable_current();
 
 	/*
@@ -2299,9 +2299,9 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 */
 	barrier();
 
-	pte_clear(text_poke_mm, poking_addr, ptep);
+	pte_clear(text_poke_mm, text_poke_mm_addr, ptep);
 	if (cross_page_boundary)
-		pte_clear(text_poke_mm, poking_addr + PAGE_SIZE, ptep + 1);
+		pte_clear(text_poke_mm, text_poke_mm_addr + PAGE_SIZE, ptep + 1);
 
 	/*
 	 * Loading the previous page-table hierarchy requires a serializing
@@ -2314,7 +2314,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * Flushing the TLB might involve IPIs, which would require enabled
 	 * IRQs, but not if the mm is not used, as it is in this point.
 	 */
-	flush_tlb_mm_range(text_poke_mm, poking_addr, poking_addr +
+	flush_tlb_mm_range(text_poke_mm, text_poke_mm_addr, text_poke_mm_addr +
 			   (cross_page_boundary ? 2 : 1) * PAGE_SIZE,
 			   PAGE_SHIFT, false);
 
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 84b52a1ebd48..f8c74d19bebb 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -835,20 +835,20 @@ void __init poking_init(void)
 	 * will be mapped at the same PMD. We need 2 pages, so find space for 3,
 	 * and adjust the address if the PMD ends after the first one.
 	 */
-	poking_addr = TASK_UNMAPPED_BASE;
+	text_poke_mm_addr = TASK_UNMAPPED_BASE;
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
-		poking_addr += (kaslr_get_random_long("Poking") & PAGE_MASK) %
+		text_poke_mm_addr += (kaslr_get_random_long("Poking") & PAGE_MASK) %
 			(TASK_SIZE - TASK_UNMAPPED_BASE - 3 * PAGE_SIZE);
 
-	if (((poking_addr + PAGE_SIZE) & ~PMD_MASK) == 0)
-		poking_addr += PAGE_SIZE;
+	if (((text_poke_mm_addr + PAGE_SIZE) & ~PMD_MASK) == 0)
+		text_poke_mm_addr += PAGE_SIZE;
 
 	/*
 	 * We need to trigger the allocation of the page-tables that will be
 	 * needed for poking now. Later, poking may be performed in an atomic
 	 * section, which might cause allocation to fail.
 	 */
-	ptep = get_locked_pte(text_poke_mm, poking_addr, &ptl);
+	ptep = get_locked_pte(text_poke_mm, text_poke_mm_addr, &ptl);
 	BUG_ON(!ptep);
 	pte_unmap_unlock(ptep, ptl);
 }
-- 
2.45.2

