Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2BC1DB13A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168470; cv=none; b=DXXwRpqQspWvYwd5rzBZRk+qmE3IMdp3hoJHEYUyUCSEbks7m16I0eje/6FAxADMkRff1bMk+HDVQZEsmWcyfkh6X4p+o9kGg7Ocac+eadGavE/vOV38afxgIIWi3mHdmVgIbkgcOsUgafLBrihdUQrDRHd3DmuOf3ACOfSY/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168470; c=relaxed/simple;
	bh=zLq8STooLiEFACeGxzmrydh0oVt7CoI/XgW+S8Jj1Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuuV/V4kRJP7MHmoFKqYBZmsQYbhnWG6m21wSgP5W/8ntOvuPfXi3UMo0J8Bi+qSmU8MtenFG4l7yJEvLUkYVLB8dtQDHw0zrmHRjY7YqboDHy8u6imO2tl+AXtRdwvoMeHB/v2ovXMtZPS8UDnjp0xKFFBsh3pH7z9fWIc5gDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfbadmiG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfbadmiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC71C4CEE5;
	Fri, 28 Mar 2025 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168470;
	bh=zLq8STooLiEFACeGxzmrydh0oVt7CoI/XgW+S8Jj1Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pfbadmiGpbYWlnhw5hVzrGSis1xttMCnZOXYr7flIxeoY9P409b32QvYHq3gXYXYB
	 Nukm78B58Xq5AJnvRfdwTg3g9DGrHQj2PCNouwG8pkTgXb5oIC8YA7nqDviKHVsyZD
	 x1yfqUqHmwTj/xfHqrF7CXR2QO2X6vDRTZcRW/f7uOM/7zvAtgTiMWILlyjEEdmL1n
	 gFLEPTpaazFGlpzTjQ8l1huq4NS5NN/U4M7nBQZiTTC6sDef5LxGkpqcSo/4+gPLL3
	 2CTI7umDaH5RpdizheZ/T0tJP6SsBEvesI1pz5vwv2MArGb/zfIfs+GeVUOFd82uiw
	 f4M23QRJ4MvuQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 11/49] x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
Date: Fri, 28 Mar 2025 14:26:26 +0100
Message-ID: <20250328132704.1901674-12-mingo@kernel.org>
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

So the temp_mm_state_t abstraction used by use_temporary_mm() and
unuse_temporary_mm() is super confusing:

 - The whole machinery is about temporarily switching to the
   text_poke_mm utility MM that got allocated during bootup
   for text-patching purposes alone:

	temp_mm_state_t prev;

        /*
         * Loading the temporary mm behaves as a compiler barrier, which
         * guarantees that the PTE will be set at the time memcpy() is done.
         */
        prev = use_temporary_mm(text_poke_mm);

 - Yet the value that gets saved in the temp_mm_state_t variable
   is not the temporary MM ... but the previous MM...

 - Ie. we temporarily put the non-temporary MM into a variable
   that has the temp_mm_state_t type. This makes no sense whatsoever.

 - The confusion continues in unuse_temporary_mm():

	static inline void unuse_temporary_mm(temp_mm_state_t prev_state)

   Here we unuse an MM that is ... not the temporary MM, but the
   previous MM. :-/

Fix up all this confusion by removing the unnecessary layer of
abstraction and using a bog-standard 'struct mm_struct *prev_mm'
variable to save the MM to.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 056872aebe6e..edff7714556e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2139,10 +2139,6 @@ void __init_or_module text_poke_early(void *addr, const void *opcode,
 	}
 }
 
-typedef struct {
-	struct mm_struct *mm;
-} temp_mm_state_t;
-
 /*
  * Using a temporary mm allows to set temporary mappings that are not accessible
  * by other CPUs. Such mappings are needed to perform sensitive memory writes
@@ -2156,9 +2152,9 @@ typedef struct {
  *          loaded, thereby preventing interrupt handler bugs from overriding
  *          the kernel memory protection.
  */
-static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
+static inline struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
 {
-	temp_mm_state_t temp_state;
+	struct mm_struct *prev_mm;
 
 	lockdep_assert_irqs_disabled();
 
@@ -2170,8 +2166,8 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
 	if (this_cpu_read(cpu_tlbstate_shared.is_lazy))
 		leave_mm();
 
-	temp_state.mm = this_cpu_read(cpu_tlbstate.loaded_mm);
-	switch_mm_irqs_off(NULL, mm, current);
+	prev_mm = this_cpu_read(cpu_tlbstate.loaded_mm);
+	switch_mm_irqs_off(NULL, temp_mm, current);
 
 	/*
 	 * If breakpoints are enabled, disable them while the temporary mm is
@@ -2187,17 +2183,17 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
 	if (hw_breakpoint_active())
 		hw_breakpoint_disable();
 
-	return temp_state;
+	return prev_mm;
 }
 
 __ro_after_init struct mm_struct *text_poke_mm;
 __ro_after_init unsigned long text_poke_mm_addr;
 
-static inline void unuse_temporary_mm(temp_mm_state_t prev_state)
+static inline void unuse_temporary_mm(struct mm_struct *prev_mm)
 {
 	lockdep_assert_irqs_disabled();
 
-	switch_mm_irqs_off(NULL, prev_state.mm, current);
+	switch_mm_irqs_off(NULL, prev_mm, current);
 
 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
 	cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(text_poke_mm));
@@ -2228,7 +2224,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 {
 	bool cross_page_boundary = offset_in_page(addr) + len > PAGE_SIZE;
 	struct page *pages[2] = {NULL};
-	temp_mm_state_t prev;
+	struct mm_struct *prev_mm;
 	unsigned long flags;
 	pte_t pte, *ptep;
 	spinlock_t *ptl;
@@ -2286,7 +2282,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * Loading the temporary mm behaves as a compiler barrier, which
 	 * guarantees that the PTE will be set at the time memcpy() is done.
 	 */
-	prev = use_temporary_mm(text_poke_mm);
+	prev_mm = use_temporary_mm(text_poke_mm);
 
 	kasan_disable_current();
 	func((u8 *)text_poke_mm_addr + offset_in_page(addr), src, len);
@@ -2307,7 +2303,7 @@ static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t l
 	 * instruction that already allows the core to see the updated version.
 	 * Xen-PV is assumed to serialize execution in a similar manner.
 	 */
-	unuse_temporary_mm(prev);
+	unuse_temporary_mm(prev_mm);
 
 	/*
 	 * Flushing the TLB might involve IPIs, which would require enabled
-- 
2.45.2

