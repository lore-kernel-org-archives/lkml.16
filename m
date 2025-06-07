Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED6221DA3
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290627; cv=none; b=rJbrbI9/xLnBkyN++yrgYF49QnjytGe035XpXnAVxK9ckXckv0DhUt9p38UVFCpHMrxuP26mQCa8Z/5j0qIYDPn8eThNfW78dNnttB6mVFIr+PHf/zU1s3jCZdZF5FLYWOMMWNEn55b+lttatr8VmaO7zK2/qtD6UQhoyse0dCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290627; c=relaxed/simple;
	bh=DYaSQSo8XramTwIg+FgRYvsxuh7ZvjIEVzq0O2S2atw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=pChq5VC2kEhMMZYbz1OODEWu+nOCtyKjWLeZkg/0U9ZMCo3ZFNoKbHiC11oD1IchA/Bghh+AGRflj9qTkXtKV0V42y8HYgRbx+H0v+wi2eORoNXmza9jhMBEPVaB2qzYkMi0fG1phoVwcyccQ13gvs7W/vRuEPbigMyloMrMxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vn2avIXp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vn2avIXp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=bFVPEi6U0KQyYea2Fk8oEF2pdPqEcV65g1xBZZkCpvo=; b=Vn2avIXp/xUeAyetK/dZ6Y2vG3
	6UQV8im+ZY+7r1Fw77QyqG14MIrBB5CUVC9Jysgapge2mAxop9EK4MJun/c0YDe8vTYV8UdcKJmg5
	s2JSVmQJ/uNxJJrNAMFIVPLd25y1X26bl1Cv5J2vgnHfxMGZ+5HvPezgyysJbW1vYgRnnoXIe4JT5
	4OOp9+cEOEXa3Qw//jnUXJjXydHIIiot3+V7fPPuJHUJfTFfhtwuL6oc3E4Qpok0wXj0HVjmaDfwH
	YPCLKdPMSFKmKR+h5obj5r6bS3d/lHK3EgDCoFnirKA+Xf1XvOIxw8BPYSu4OHNpid32bI85nK9QS
	axHnOf1A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOn-00000001N8q-1dJZ;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 72AC330860A; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095618.934805791@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 08/11] x86_64/bug: Implement __WARN_printf()
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The basic idea is to have __WARN_printf() be a vararg function such
that the compiler can do the optimal calling convention for us. This
function body will be a #UD and then set up a va_list in the exception
from pt_regs.

But because the trap will be in a called function, the bug_entry must
be passed in. Have that be the first argument, with the format tucked
away inside the bug_entry.

The comments should clarify the real fun details.

The big downside is that all WARNs will now show:

 RIP: 0010:__WARN_trap:+0

This will be adressed in a follow up patch.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/entry.S     |    8 +++
 arch/x86/include/asm/bug.h |   47 +++++++++++++++++++
 arch/x86/kernel/traps.c    |  107 ++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 152 insertions(+), 10 deletions(-)

--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -32,6 +32,14 @@ SYM_FUNC_END(write_ibpb)
 /* For KVM */
 EXPORT_SYMBOL_GPL(write_ibpb);
 
+SYM_FUNC_START(__WARN_trap)
+	ANNOTATE_NOENDBR
+	ANNOTATE_REACHABLE
+	ud1 (%ecx), %_ASM_ARG1
+	RET
+SYM_FUNC_END(__WARN_trap)
+EXPORT_SYMBOL(__WARN_trap)
+
 .popsection
 
 /*
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -26,6 +26,7 @@
 #define BUG_UD2			0xfffe
 #define BUG_UD1			0xfffd
 #define BUG_UD1_UBSAN		0xfffc
+#define BUG_UD1_WARN		0xfffb
 #define BUG_EA			0xffea
 #define BUG_LOCK		0xfff0
 
@@ -49,6 +50,7 @@
 
 #ifdef CONFIG_X86_64
 #define HAVE_ARCH_BUG_FORMAT
+#define HAVE_ARCH_BUG_FORMAT_ARGS
 #define ASM_BUGTABLE_FORMAT(format)					\
 	ASM_BUG_REL(format)
 #define ASM_BUGTABLE_FORMAT_SIZE	4 /* sizeof(format) */
@@ -107,6 +109,51 @@ do {								\
 	instrumentation_end();					\
 } while (0)
 
+#define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
+
+#ifdef HAVE_ARCH_BUG_FORMAT
+
+#ifndef __ASSEMBLY__
+struct bug_entry;
+extern void __WARN_trap(struct bug_entry *bug, ...);
+
+struct pt_regs;
+struct sysv_va_list { /* from AMD64 System V ABI */
+	unsigned int gp_offset;
+	unsigned int fp_offset;
+	void *overflow_arg_area;
+	void *reg_save_area;
+};
+struct arch_va_list {
+	unsigned long regs[6];
+	struct sysv_va_list args;
+};
+extern void *__warn_args(struct arch_va_list *args, struct pt_regs *regs);
+#endif /* __ASSEMBLY__ */
+
+#define __WARN_bug_entry(flags, format) ({				\
+	struct bug_entry *bug;						\
+	asm(__stringify(ASM_BUGTABLE_FLAGS(1f, %c[fmt], %c[file], %c[line], %c[fl])) "\n" \
+	     "\tlea (123b)(%%rip), %[addr] \n1:\t"			\
+	     : [addr] "=r" (bug)					\
+	     : [fmt] "i" (format),					\
+	       [file] "i" (__FILE__),					\
+	       [line] "i" (__LINE__),					\
+	       [fl] "i" (flags));					\
+	bug; })
+
+#define __WARN_print_arg(flags, format, arg...)				\
+do {									\
+	int __flags = (flags) | BUGFLAG_WARNING | BUGFLAG_ARGS ;	\
+	__WARN_trap(__WARN_bug_entry(__flags, format), ## arg);		\
+	asm (""); /* inhibit tail-call optimization */			\
+} while (0)
+
+#define __WARN_printf(taint, fmt, arg...) \
+	__WARN_print_arg(BUGFLAG_TAINT(taint), fmt, ## arg)
+
+#endif /* HAVE_ARCH_BUG_FORMAT */
+
 #include <asm-generic/bug.h>
 
 #endif /* _ASM_X86_BUG_H */
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -108,19 +108,29 @@ __always_inline int is_valid_bugaddr(uns
 __always_inline int decode_bug(unsigned long addr, s32 *imm, int *len)
 {
 	unsigned long start = addr;
+	u8 v, reg, rm, rex = 0;
+	int type = BUG_UD1;
 	bool lock = false;
-	u8 v;
 
 	if (addr < TASK_SIZE_MAX)
 		return BUG_NONE;
 
-	v = *(u8 *)(addr++);
-	if (v == INSN_ASOP)
+	for (;;) {
 		v = *(u8 *)(addr++);
+		if (v == INSN_ASOP)
+			continue;
 
-	if (v == INSN_LOCK) {
-		lock = true;
-		v = *(u8 *)(addr++);
+		if (v == INSN_LOCK) {
+			lock = true;
+			continue;
+		}
+
+		if ((v & 0xf0) == 0x40) {
+			rex = v;
+			continue;
+		}
+
+		break;
 	}
 
 	switch (v) {
@@ -156,10 +166,21 @@ __always_inline int decode_bug(unsigned
 	if (X86_MODRM_MOD(v) != 3 && X86_MODRM_RM(v) == 4)
 		addr++;			/* SIB */
 
+	reg = X86_MODRM_REG(v) + 8*!!X86_REX_R(rex);
+	rm  = X86_MODRM_RM(v)  + 8*!!X86_REX_B(rex);
+
 	/* Decode immediate, if present */
 	switch (X86_MODRM_MOD(v)) {
 	case 0: if (X86_MODRM_RM(v) == 5)
-			addr += 4; /* RIP + disp32 */
+			addr += 4;	/* RIP + disp32 */
+
+		if (rm == 0)		/* (%eax) */
+			type = BUG_UD1_UBSAN;
+
+		if (rm == 1) {		/* (%ecx) */
+			*imm = reg;
+			type = BUG_UD1_WARN;
+		}
 		break;
 
 	case 1: *imm = *(s8 *)addr;
@@ -176,12 +197,73 @@ __always_inline int decode_bug(unsigned
 	/* record instruction length */
 	*len = addr - start;
 
-	if (X86_MODRM_REG(v) == 0)	/* EAX */
-		return BUG_UD1_UBSAN;
+	return type;
+}
 
-	return BUG_UD1;
+static inline unsigned long pt_regs_val(struct pt_regs *regs, int nr)
+{
+	int offset = pt_regs_offset(regs, nr);
+	if (WARN_ON_ONCE(offset < -0))
+		return 0;
+	return *((unsigned long *)((void *)regs + offset));
 }
 
+#ifdef HAVE_ARCH_BUG_FORMAT
+/*
+ * Create a va_list from an exception context.
+ */
+void *__warn_args(struct arch_va_list *args, struct pt_regs *regs)
+{
+	/*
+	 * Register save area; populate with function call argument registers
+	 */
+	args->regs[0] = regs->di;
+	args->regs[1] = regs->si;
+	args->regs[2] = regs->dx;
+	args->regs[3] = regs->cx;
+	args->regs[4] = regs->r8;
+	args->regs[5] = regs->r9;
+
+	/*
+	 * From the ABI document:
+	 *
+	 * @gp_offset - the element holds the offset in bytes from
+	 * reg_save_area to the place where the next available general purpose
+	 * argument register is saved. In case all argument registers have
+	 * been exhausted, it is set to the value 48 (6*8).
+	 *
+	 * @fp_offset - the element holds the offset in bytes from
+	 * reg_save_area to the place where the next available floating point
+	 * argument is saved. In case all argument registers have been
+	 * exhausted, it is set to the value 176 (6*8 + 8*16)
+	 *
+	 * @overflow_arg_area - this pointer is used to fetch arguments passed
+	 * on the stack. It is initialized with the address of the first
+	 * argument passed on the stack, if any, and then always updated to
+	 * point to the start of the next argument on the stack.
+	 *
+	 * @reg_save_area - the element points to the start of the register
+	 * save area.
+	 *
+	 * Notably the vararg starts with the second argument and there are no
+	 * floating point arguments in the kernel.
+	 */
+	args->args.gp_offset = 1*8;
+	args->args.fp_offset = 6*8 + 8*16;
+	args->args.reg_save_area = &args->regs;
+	args->args.overflow_arg_area = (void *)regs->sp;
+
+	/*
+	 * If the exception came from __WARN_trap, there is a return
+	 * address on the stack, skip that. This is why any __WARN_trap()
+	 * caller must inhibit tail-call optimization.
+	 */
+	if ((void *)regs->ip == &__WARN_trap)
+		args->args.overflow_arg_area += 8;
+
+	return &args->args;
+}
+#endif /* HAVE_ARCH_BUG_FORMAT */
 
 static nokprobe_inline int
 do_trap_no_signal(struct task_struct *tsk, int trapnr, const char *str,
@@ -334,6 +416,11 @@ static noinstr bool handle_bug(struct pt
 		raw_local_irq_enable();
 
 	switch (ud_type) {
+	case BUG_UD1_WARN:
+		if (report_bug_entry((void *)pt_regs_val(regs, ud_imm), regs) == BUG_TRAP_TYPE_WARN)
+			handled = true;
+		break;
+
 	case BUG_UD2:
 		if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
 			handled = true;


