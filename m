Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0B1DE89A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108869; cv=none; b=R0oOXET3wzZhnJHUmAYs8kjPOWmz4/j35eKwofUxLy6RyedVOVPiJnb4AfjKokUw47tXggYagOWUoM34IDWqB4JezPZqKK0I0E3DT2F1WVVhxhDOjt5CuFd3z8yzx4lO7avmyB3g7OVT2dLM2ePe19VnCJyqBtZegXYjiLccIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108869; c=relaxed/simple;
	bh=A3v7IO8MRmxIxGpCftVasykegOu8TrEKYmjKX1aqWSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiTdMQgvtyd79xaKtdsnfAreRL7PA703zeXuZt5LL1k4njFQxABkPec5TSYOxNeTUYq7iN9lS/DxSyc1IqmYJheUJXmBNvSP9i1jMAr6rGqOf4lkpDl9hcjgKHNKJVY9kCV/ngv+QxijbT+q880QDXc2BbN6OVaQWmf63wmYxKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGQ/K5uT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGQ/K5uT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A07C4CEE8;
	Thu, 27 Mar 2025 20:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108869;
	bh=A3v7IO8MRmxIxGpCftVasykegOu8TrEKYmjKX1aqWSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tGQ/K5uTD4ubJ75IJiILJjxjydR9j80kEZiBvhdQnF613eXJnBZsznGGZy1kDPDIc
	 I1zMKTsJBX85V4qP1NZWAYgl9RJg3HhTQnwqLrFG1mQWZD0VQyl+JGGXDeNt8NOxxL
	 bhAyk/u+9VB/TA1zRLWJ0sqbCZWJ1bGJT8ckReS/xDsKq5+Pvx7uusp8rUatex9AhP
	 qlQKdOzWPSUB6EP9aVwMKSdESkNTHAf5U+FTcfs88qZpwbCAuPUUOoNJnbSGO8kdNl
	 rkPbEnWB8PpdPDOwe+yDY+ZoeIOqEpEl9IlYlRclSQSD3ynjMv2XBzNQVPrPs4eyWq
	 Gyx05zuucD3jw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 12/41] x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
Date: Thu, 27 Mar 2025 21:53:25 +0100
Message-ID: <20250327205355.378659-13-mingo@kernel.org>
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
index 7d14c8abd3aa..557ee2546177 100644
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
 __ro_after_init unsigned long text_poke_addr;
 
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
 	func((u8 *)text_poke_addr + offset_in_page(addr), src, len);
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

