Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA61B6556
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168458; cv=none; b=Lvt6P1oU2WjoTQi2UgVrA8vSkgoHC+c7gGk3AF8WvkxUzk9KHaoEwxNu/FDb/qM7iTbajFu/2aSr4g6TGmEUPgDezzDeUSTIGlyuiijgwivQBhJZzD/Qp+k3PEUSXg5remdKAHgb9EEOTOacxzfQmNxB72YNFvjh9/N5RLEzyHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168458; c=relaxed/simple;
	bh=8o6K40ijblzs8OnbnRHq/Lq5frgDQwlgFuhwMQhHKZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MP5MFJpXwTJQ+nhQ5HiYMLPOHUtbMmkbJYUJwn/6anNMCgIkq8C4pPwyrp86Wo9Z2D71uj+Dr31rGPXphLxYyE0jOALLw9YX+BxbymB87rSohKfZpAH4yhsph5dJrv6sla+V+hwNUJ9ELH7/OkFQULzZDV3nBAI3GGU+ZILN01c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1jXlEeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1jXlEeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44CCC4CEEA;
	Fri, 28 Mar 2025 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168457;
	bh=8o6K40ijblzs8OnbnRHq/Lq5frgDQwlgFuhwMQhHKZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1jXlEeWcNq4IdRxNFLoE/UFqy8WdNXid6xioawOlNVXfiaFFU4qjhg7hu8ndYNI6
	 bOCMWHUnUY8rBNotL7IC4TR5LufIzMlwqQoidlk1vTokSCPXmoYJll/EcUac4mht9K
	 LI+cDXm5ISQ/S7HPnXKrK1EZav6Yw+cqXiGWdwKr/bD2OZj6QY1reJsA3k/+yrBZ9G
	 FutcstOqOCV81k9o8hE8xqBt+daUACU0rVZFhe05faLEkNqsJXTgaJPtDqUNZS0hmr
	 phMzsq12P/2cz+9YsENhkazheXc3WWGbdmNT6Yn7XhgHuis35yvx5ctht9d5DO58cB
	 3RpJFbCFP75pw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 06/49] x86/alternatives: Rename 'poking_mm' to 'text_poke_mm'
Date: Fri, 28 Mar 2025 14:26:21 +0100
Message-ID: <20250328132704.1901674-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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
index 42eb607c8629..afff3d886e30 100644
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
index e4c97c39eda1..01e2c42e45a2 100644
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

