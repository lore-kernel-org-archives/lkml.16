Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D61F78F7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931320; cv=none; b=qTPgsWf7daNdTmrO0CP0DO+5sV1W6ODrNAk5K4oXzh+vMPb8UjyLVImIg2Wk623y27pUx2FEHAjN+DjB4Y03mT7L0lZDowQu4arVKMJd5afjfySrtW73dcGwr2LfLSAcZQHQXwq5/5bugx76gzA6yxFKeopmqGpN4+mUqSfPoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931320; c=relaxed/simple;
	bh=kztONzt9qazUS7blIa55eCBrBZ9fsT+kQft6opbqNvA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=PP/tcPNF9xTlJAXnhy/cgWAfi+rxBe3N6fzZG/qWWiPDGlRnpIdUuLpQZw8gvz8xedVDr0kGEXmWtUxUQ42OqQzfzWNydervmIj79vEWIJAcDKW6Jc9i5Jr0HLmjPYOobBu1wX9a+Rjcwew5UDkFOwqMz4PWVS+wOa4rjZBf/JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OSd7oOIu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OSd7oOIu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=hqPWks6/rGav+fO54QPGE1iljQwGuQ9KKEAve1G8rjE=; b=OSd7oOIuGMefIB7bluCv+mWf4E
	WzwROg8IdAw581ZTQz4FB3VxwpeShz3Z2683DEuOOVUWQ/tBvLScc0X+ss4tWNcuF/JMPuQz3rmsg
	wF6nWT862ZkZyPf+Vq4li1dVsfktEfGoAHhW2EEqNAgsdbgKnvuZr72cGRpm5Ov7wbZzIStOmuI1J
	J9LQ48LQGkE1QOcmyP26biK3fXYrxtrguI95EdiDvHeHcvs7vcCFmJ+AbQPFv8qjSCO+UoJfOg84x
	Fxf0gU8/FT9be/RhVck2gZa+86GZHnkXu1yUwWm27BU9JuXNBEQTRKMfN7+ZZu2pqATFYQqN/KgB4
	wf2JUIdw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT7-0000000HAeU-2eH8;
	Fri, 07 Feb 2025 12:28:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 27C36300642; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.181367417@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 alyssa.milburn@intel.com,
 scott.d.constable@intel.com,
 joao@overdrivepizza.com,
 andrew.cooper3@citrix.com,
 jpoimboe@kernel.org,
 jose.marchesi@oracle.com,
 hjl.tools@gmail.com,
 ndesaulniers@google.com,
 samitolvanen@google.com,
 nathan@kernel.org,
 ojeda@kernel.org,
 kees@kernel.org,
 alexei.starovoitov@gmail.com,
 mhiramat@kernel.org,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH 02/11] x86/ibt: Clean up is_endbr()
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Pretty much every caller of is_endbr() actually wants to test something at an
address and ends up doing get_kernel_nofault(). Fold the lot into a more
convenient helper.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Alexei Starovoitov <ast@kernel.org>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/events/core.c         |    2 +-
 arch/x86/include/asm/ftrace.h  |   16 ++--------------
 arch/x86/include/asm/ibt.h     |    5 +++--
 arch/x86/kernel/alternative.c  |   20 ++++++++++++++------
 arch/x86/kernel/kprobes/core.c |   11 +----------
 arch/x86/net/bpf_jit_comp.c    |    4 ++--
 kernel/trace/bpf_trace.c       |   21 ++++-----------------
 7 files changed, 27 insertions(+), 52 deletions(-)

--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2857,7 +2857,7 @@ static bool is_uprobe_at_func_entry(stru
 		return true;
 
 	/* endbr64 (64-bit only) */
-	if (user_64bit_mode(regs) && is_endbr(*(u32 *)auprobe->insn))
+	if (user_64bit_mode(regs) && is_endbr((u32 *)auprobe->insn))
 		return true;
 
 	return false;
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -36,21 +36,9 @@ static inline unsigned long ftrace_call_
 
 static inline unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
 {
-#ifdef CONFIG_X86_KERNEL_IBT
-	u32 instr;
-
-	/* We want to be extra safe in case entry ip is on the page edge,
-	 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
-	 */
-	if ((fentry_ip & ~PAGE_MASK) < ENDBR_INSN_SIZE) {
-		if (get_kernel_nofault(instr, (u32 *)(fentry_ip - ENDBR_INSN_SIZE)))
-			return fentry_ip;
-	} else {
-		instr = *(u32 *)(fentry_ip - ENDBR_INSN_SIZE);
-	}
-	if (is_endbr(instr))
+	if (is_endbr((void*)(fentry_ip - ENDBR_INSN_SIZE)))
 		fentry_ip -= ENDBR_INSN_SIZE;
-#endif
+
 	return fentry_ip;
 }
 #define ftrace_get_symaddr(fentry_ip)	arch_ftrace_get_symaddr(fentry_ip)
--- a/arch/x86/include/asm/ibt.h
+++ b/arch/x86/include/asm/ibt.h
@@ -65,7 +65,7 @@ static __always_inline __attribute_const
 	return 0x001f0f66; /* osp nopl (%rax) */
 }
 
-static inline bool is_endbr(u32 val)
+static inline bool __is_endbr(u32 val)
 {
 	if (val == gen_endbr_poison())
 		return true;
@@ -74,6 +74,7 @@ static inline bool is_endbr(u32 val)
 	return val == gen_endbr();
 }
 
+extern __noendbr bool is_endbr(u32 *val);
 extern __noendbr u64 ibt_save(bool disable);
 extern __noendbr void ibt_restore(u64 save);
 
@@ -98,7 +99,7 @@ extern __noendbr void ibt_restore(u64 sa
 
 #define __noendbr
 
-static inline bool is_endbr(u32 val) { return false; }
+static inline bool is_endbr(u32 *val) { return false; }
 
 static inline u64 ibt_save(bool disable) { return 0; }
 static inline void ibt_restore(u64 save) { }
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -852,16 +852,24 @@ void __init_or_module noinline apply_ret
 
 #ifdef CONFIG_X86_KERNEL_IBT
 
+__noendbr bool is_endbr(u32 *val)
+{
+	u32 endbr;
+
+	__get_kernel_nofault(&endbr, val, u32, Efault);
+	return __is_endbr(endbr);
+
+Efault:
+	return false;
+}
+
 static void poison_cfi(void *addr);
 
 static void __init_or_module poison_endbr(void *addr, bool warn)
 {
-	u32 endbr, poison = gen_endbr_poison();
-
-	if (WARN_ON_ONCE(get_kernel_nofault(endbr, addr)))
-		return;
+	u32 poison = gen_endbr_poison();
 
-	if (!is_endbr(endbr)) {
+	if (!is_endbr(addr)) {
 		WARN_ON_ONCE(warn);
 		return;
 	}
@@ -984,7 +992,7 @@ static u32  cfi_seed __ro_after_init;
 static u32 cfi_rehash(u32 hash)
 {
 	hash ^= cfi_seed;
-	while (unlikely(is_endbr(hash) || is_endbr(-hash))) {
+	while (unlikely(__is_endbr(hash) || __is_endbr(-hash))) {
 		bool lsb = hash & 1;
 		hash >>= 1;
 		if (lsb)
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -373,16 +373,7 @@ static bool can_probe(unsigned long padd
 kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offset,
 					 bool *on_func_entry)
 {
-	u32 insn;
-
-	/*
-	 * Since 'addr' is not guaranteed to be safe to access, use
-	 * copy_from_kernel_nofault() to read the instruction:
-	 */
-	if (copy_from_kernel_nofault(&insn, (void *)addr, sizeof(u32)))
-		return NULL;
-
-	if (is_endbr(insn)) {
+	if (is_endbr((u32 *)addr)) {
 		*on_func_entry = !offset || offset == 4;
 		if (*on_func_entry)
 			offset = 4;
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -641,7 +641,7 @@ int bpf_arch_text_poke(void *ip, enum bp
 	 * See emit_prologue(), for IBT builds the trampoline hook is preceded
 	 * with an ENDBR instruction.
 	 */
-	if (is_endbr(*(u32 *)ip))
+	if (is_endbr(ip))
 		ip += ENDBR_INSN_SIZE;
 
 	return __bpf_arch_text_poke(ip, t, old_addr, new_addr);
@@ -3036,7 +3036,7 @@ static int __arch_prepare_bpf_trampoline
 		/* skip patched call instruction and point orig_call to actual
 		 * body of the kernel function.
 		 */
-		if (is_endbr(*(u32 *)orig_call))
+		if (is_endbr(orig_call))
 			orig_call += ENDBR_INSN_SIZE;
 		orig_call += X86_PATCH_SIZE;
 	}
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -1038,27 +1038,14 @@ static const struct bpf_func_proto bpf_g
 	.arg1_type	= ARG_PTR_TO_CTX,
 };
 
-#ifdef CONFIG_X86_KERNEL_IBT
-static unsigned long get_entry_ip(unsigned long fentry_ip)
+static inline unsigned long get_entry_ip(unsigned long fentry_ip)
 {
-	u32 instr;
-
-	/* We want to be extra safe in case entry ip is on the page edge,
-	 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
-	 */
-	if ((fentry_ip & ~PAGE_MASK) < ENDBR_INSN_SIZE) {
-		if (get_kernel_nofault(instr, (u32 *)(fentry_ip - ENDBR_INSN_SIZE)))
-			return fentry_ip;
-	} else {
-		instr = *(u32 *)(fentry_ip - ENDBR_INSN_SIZE);
-	}
-	if (is_endbr(instr))
+#ifdef CONFIG_X86_KERNEL_IBT
+	if (is_endbr((void *)(fentry_ip - ENDBR_INSN_SIZE)))
 		fentry_ip -= ENDBR_INSN_SIZE;
+#endif
 	return fentry_ip;
 }
-#else
-#define get_entry_ip(fentry_ip) fentry_ip
-#endif
 
 BPF_CALL_1(bpf_get_func_ip_kprobe, struct pt_regs *, regs)
 {


