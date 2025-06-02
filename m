Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E282397A4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875842; cv=none; b=F20ShgCTxNZByEvSJ9K7fO2mTpTzvFmnNpb6gv6CfFFyPxWXypJZIn81zdgLf3YOAnujgFE2KWpOAHySGuB1e0dQadyqNsoqvvs3/HD9d1hzAgW6VCkPbiC2R+rEXNrNBAj/3wXQ6j48vLEd3MMIjB8+PgOhN7NczGPaQMRwVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875842; c=relaxed/simple;
	bh=9ask0x1MH44A13iKlcXRqwo+ulB6fe24UGpHQIqrNdU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=DlN8YLyiIaW0Vd2tLXwkPcov0hwCz3vpEM3oGck0Qj+mr2Xr0zX2Zi0SUOHSUTD4eJAR7fXyaZbsCZCnLpStAG8grMM2T5gn8+Jh89m4VJjFF80BxgM2TttArg/8cF+KgXXlmN8ChMFlSQkiF2uG3A7fHD9jXBEC7dw6CgkcDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bii+HbPL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bii+HbPL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Fe15PAc1KDj7wmr3V9LXMwmTjRdPDzQD54wLiyeYxnM=; b=bii+HbPLqDiKwg5qU1+KLHq/XH
	hzdZP8Czy92wrE04cF7aVbOstdaPJDmZ7P4+khI9pByGaDr0BJ7aL7aiXV7M9QHiNEmEwFJhJRrOo
	4XYvWqg+EXeGx37QpB4/6WR+6kx4nBIHTwB0ijE4Hcjs/Tl8ceXpA1pw9pam6GFgJaZWWMZt7wE5p
	dDMsJfkGyoNN1H8nWOT01KdvQvhYuhSInJbmFOy1FYeuwTGZ9WoySHV41BacqU4yq11rHXHFD1lgj
	sgeZt+FeOyykWkCUFRPYDMGJ7Jj7hSz/JCvxoBlE+oxze9y+7WahFuxwA5nVQaAbiK3/0LDLrwkSM
	d4dgAarg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Um-00000000dlI-24ur;
	Mon, 02 Jun 2025 14:50:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 1DA1E302E7A; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144755.928750774@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

Optimize __WARN_printf() for the common number of arguments.

By storing the WARN() format string in the bug_entry, it becomes
possible to print this from the exception handler, instead of having
to emit a __warn_printf() call before tripping the exception.

This yields more compact code, while also providing an opportunity to
simplify WARN_ONCE() -- in a future patch.

The only 'minor' detail is how to get the printf() arguments into the
exception handler.

Note that the regular calling convention uses 6 registers to pass
arguments (before pushing to the stack) and observe that UD1 has a
ModRM byte which can encode two registers.

This then suggests using UD1 exceptions for small __WARN_printf()
argument numbers, encoding the registers holding the arguments in the
UD1 instruction.

Except that, when creating a histogram of the number of arguments
given to WARN (including WARN_ONCE):

defconfig:			allyesconfig:
    899 __COUNT_printf_3           9694 __COUNT_printf_0
    795 __COUNT_printf_2           4498 __COUNT_printf_1
    360 __COUNT_printf_0           3213 __COUNT_printf_3
    212 __COUNT_printf_1           2949 __COUNT_printf_2
     86 __COUNT_printf_4            186 __COUNT_printf_4
     37 __COUNT_printf_5             84 __COUNT_printf_5
     15 __COUNT_printf_6             50 __COUNT_printf_6
     14 __COUNT_printf_7             16 __COUNT_printf_7
      3 __COUNT_printf_8              3 __COUNT_printf_8
      3 __COUNT_printf_12             3 __COUNT_printf_12
                                      2 __COUNT_printf_9

It becomes clear that supporting 3 arguments is rather critical. This
requires encoding 3 registers in an instruction, which calls for some
creativity :-)

Use the form:

  UD1	disp8(%ecx), %reg

And encode two registers (one per nibble) in the displacement value.
Use (%ecx) as base, because UBSAN already uses (%eax) to encode its
immediates.

This then yields the following encodings:

  nr args:		insn:
    0			UD2
    1			UD1	(%ecx), %reg
    2			UD1	%reg2, %reg1
    3			UD1	disp8(%ecx), %reg1

Use the normal COUNT_ARGS() trick to split the variadic WARN() macro
into per nr_args sub-marcos, except use a custom mapping such that 4
and above map to another variadic that does the current thing as
fallback.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |  115 +++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/traps.c    |  137 ++++++++++++++++++++++++++++++++++++---------
 2 files changed, 225 insertions(+), 27 deletions(-)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -5,6 +5,7 @@
 #include <linux/stringify.h>
 #include <linux/instrumentation.h>
 #include <linux/objtool.h>
+#include <linux/args.h>
 
 /*
  * Despite that some emulators terminate on UD2, we use it for WARN().
@@ -26,6 +27,7 @@
 #define BUG_UD2			0xfffe
 #define BUG_UD1			0xfffd
 #define BUG_UD1_UBSAN		0xfffc
+#define BUG_UD1_WARN		0xfffb
 #define BUG_EA			0xffea
 #define BUG_LOCK		0xfff0
 
@@ -108,6 +110,119 @@ do {								\
 	instrumentation_end();					\
 } while (0)
 
+#ifdef HAVE_ARCH_BUG_FORMAT
+
+#ifndef __ASSEMBLER__
+struct pt_regs;
+extern void __warn_printf(const char *fmt, struct pt_regs *regs);
+#define __warn_printf __warn_printf
+#endif
+
+#define __WARN_printf_0(flags, format)					\
+do {									\
+	__auto_type __flags = (flags) | BUGFLAG_WARNING | BUGFLAG_FORMAT; \
+	instrumentation_begin();					\
+	asm_inline volatile("1: ud2\n"					\
+			    ANNOTATE_REACHABLE(1b)			\
+	    __stringify(ASM_BUGTABLE_FLAGS(1b, %c[fmt], %c[file], %c[line], %c[fl])) "\n" \
+		     : : [file] "i" (__FILE__), [line] "i" (__LINE__),	\
+			 [fl] "i" (__flags), [fmt] "i" (format));	\
+	instrumentation_end();						\
+} while (0)
+
+#define __WARN_printf_1(flags, format, arg1)				\
+do {									\
+	__auto_type __flags = (flags) | BUGFLAG_WARNING | BUGFLAG_FORMAT; \
+	instrumentation_begin();					\
+	asm_inline volatile("1: ud1 (%%ecx), %[a1]\n"			\
+			    ANNOTATE_REACHABLE(1b)			\
+	    __stringify(ASM_BUGTABLE_FLAGS(1b, %c[fmt], %c[file], %c[line], %c[fl])) "\n" \
+		     : : [file] "i" (__FILE__), [line] "i" (__LINE__),	\
+			 [fl] "i" (__flags), [fmt] "i" (format),	\
+			 [a1] "r" ((unsigned long)(arg1)));		\
+	instrumentation_end();						\
+} while (0)
+
+#define __WARN_printf_2(flags, format, arg1, arg2)			\
+do {									\
+	__auto_type __flags = (flags) | BUGFLAG_WARNING | BUGFLAG_FORMAT; \
+	instrumentation_begin();					\
+	asm_inline volatile("1: ud1 %[a2], %[a1]\n"			\
+			    ANNOTATE_REACHABLE(1b)			\
+	    __stringify(ASM_BUGTABLE_FLAGS(1b, %c[fmt], %c[file], %c[line], %c[fl])) "\n" \
+		     : : [file] "i" (__FILE__), [line] "i" (__LINE__),	\
+			 [fl] "i" (__flags), [fmt] "i" (format),	\
+			 [a1] "r" ((unsigned long)(arg1)),		\
+			 [a2] "r" ((unsigned long)(arg2)));		\
+	instrumentation_end();						\
+} while (0)
+
+/*
+ * warn_add_reg var reg -- adds the machine register index to var
+ */
+#define DEFINE_WARN_REG \
+	".macro warn_add_reg var:req reg:req\n"							\
+	".set .Lfound, 0\n"									\
+	".set .Lregnr, 0\n"									\
+	".irp rs,rax,rcx,rdx,rbx,rsp,rbp,rsi,rdi,r8,r9,r10,r11,r12,r13,r14,r15\n"		\
+	".ifc \\reg, %%\\rs\n"									\
+	".set .Lfound, .Lfound+1\n"								\
+	".set \\var, \\var + .Lregnr\n"								\
+	".endif\n"										\
+	".set .Lregnr, .Lregnr+1\n"								\
+	".endr\n"										\
+	".set .Lregnr, 0\n"									\
+	".irp rs,eax,ecx,edx,ebx,esp,ebp,esi,edi,r8d,r9d,r10d,r11d,r12d,r13d,r14d,r15d\n"	\
+	".ifc \\reg, %%\\rs\n"									\
+	".set .Lfound, .Lfound+1\n"								\
+	".set \\var, \\var + .Lregnr\n"								\
+	".endif\n"										\
+	".set .Lregnr, .Lregnr+1\n"								\
+	".endr\n"										\
+	".if (.Lfound != 1)\n"									\
+	".error \"warn_add_reg: bad register argument\"\n"					\
+	".endif\n"										\
+	".endm\n"
+
+#define UNDEFINE_WARN_REG \
+	".purgem warn_add_reg\n"
+
+#define __WARN_printf_3(flags, format, arg1, arg2, arg3)		\
+do {									\
+	__auto_type __flags = (flags) | BUGFLAG_WARNING | BUGFLAG_FORMAT; \
+	instrumentation_begin();					\
+	asm_inline volatile(						\
+		DEFINE_WARN_REG						\
+		".set warn_imm, 0\n"					\
+		"warn_add_reg warn_imm, %[a3]\n"			\
+		".set warn_imm, (warn_imm << 4)\n"			\
+		"warn_add_reg warn_imm, %[a2]\n"			\
+		UNDEFINE_WARN_REG					\
+		"1: ud1 warn_imm(%%ecx),%[a1]\n"			\
+		ANNOTATE_REACHABLE(1b)					\
+		__stringify(ASM_BUGTABLE_FLAGS(1b, %c[fmt], %c[file], %c[line], %c[fl])) "\n" \
+		     : : [file] "i" (__FILE__), [line] "i" (__LINE__),	\
+			 [fl] "i" (__flags), [fmt] "i" (format),	\
+			 [a1] "r" ((unsigned long)(arg1)),		\
+			 [a2] "r" ((unsigned long)(arg2)),		\
+			 [a3] "r" ((unsigned long)(arg3)));		\
+	instrumentation_end();						\
+} while (0)
+
+#define __WARN_printf_n(flags, fmt, arg...) do {			\
+		instrumentation_begin();				\
+		__warn_printk(fmt, arg);				\
+		__WARN_FLAGS(BUGFLAG_NO_CUT_HERE | (flags));		\
+		instrumentation_end();					\
+	} while (0)
+
+#define WARN_ARGS(X...) __COUNT_ARGS(, ##X, n, n, n, n, n, n, n, n, n, n, n, n, 3, 2, 1, 0)
+
+#define __WARN_printf(taint, fmt, arg...) \
+	CONCATENATE(__WARN_printf_, WARN_ARGS(arg))(BUGFLAG_TAINT(taint), fmt, ## arg)
+
+#endif /* HAVE_ARCH_BUG_FORMAT */
+
 #include <asm-generic/bug.h>
 
 #endif /* _ASM_X86_BUG_H */
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -81,18 +81,6 @@
 
 DECLARE_BITMAP(system_vectors, NR_VECTORS);
 
-__always_inline int is_valid_bugaddr(unsigned long addr)
-{
-	if (addr < TASK_SIZE_MAX)
-		return 0;
-
-	/*
-	 * We got #UD, if the text isn't readable we'd have gotten
-	 * a different exception.
-	 */
-	return *(unsigned short *)addr == INSN_UD2;
-}
-
 /*
  * Check for UD1 or UD2, accounting for Address Size Override Prefixes.
  * If it's a UD1, further decode to determine its use:
@@ -103,24 +91,49 @@ __always_inline int is_valid_bugaddr(uns
  * UBSan{10}:    67 0f b9 40 10          ud1    0x10(%eax),%eax
  * static_call:  0f b9 cc                ud1    %esp,%ecx
  *
- * Notably UBSAN uses EAX, static_call uses ECX.
+ * WARN_printf_0:                        ud2
+ * WARN_printf_1:                        ud1    (%ecx),%reg
+ * WARN_printf_2:                        ud1    %reg,%reg
+ * WARN_printf_3:                        ud1    0xBA(%ecx),%reg
+ *
+ * Notably UBSAN uses (%eax), static_call uses %esp.
+ *
+ * @regs will return one register per nibble, typically ModRM reg in the low
+ * nibble and ModRM rm in the next nibble (including REX bits). In case of the
+ * WARN_printf_3 case the 8 bit immediate is used to encode two registers and
+ * a total of 3 nibbles will be set.
+ *
+ * @imm will return the immediate value encoded in the instruction, or 0.
+ *
+ * @len will return the length of the instruction decoded.
  */
-__always_inline int decode_bug(unsigned long addr, s32 *imm, int *len)
+__always_inline int decode_bug(unsigned long addr, u32 *regs, s32 *imm, int *len)
 {
 	unsigned long start = addr;
+	u8 v, rex = 0, reg, rm;
 	bool lock = false;
-	u8 v;
+	int type = BUG_UD1;
 
 	if (addr < TASK_SIZE_MAX)
 		return BUG_NONE;
 
-	v = *(u8 *)(addr++);
-	if (v == INSN_ASOP)
+	for (;;) {
 		v = *(u8 *)(addr++);
 
-	if (v == INSN_LOCK) {
-		lock = true;
-		v = *(u8 *)(addr++);
+		if (v == INSN_ASOP)
+			continue;
+
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
@@ -141,6 +154,9 @@ __always_inline int decode_bug(unsigned
 		return BUG_NONE;
 	}
 
+	*regs = 0;
+	*imm = 0;
+
 	v = *(u8 *)(addr++);
 	if (v == SECOND_BYTE_OPCODE_UD2) {
 		*len = addr - start;
@@ -150,19 +166,33 @@ __always_inline int decode_bug(unsigned
 	if (v != SECOND_BYTE_OPCODE_UD1)
 		return BUG_NONE;
 
-	*imm = 0;
 	v = *(u8 *)(addr++);		/* ModRM */
-
 	if (X86_MODRM_MOD(v) != 3 && X86_MODRM_RM(v) == 4)
 		addr++;			/* SIB */
 
+	reg = X86_MODRM_REG(v) + 8*!!X86_REX_R(rex);
+	rm  = X86_MODRM_RM(v)  + 8*!!X86_REX_B(rex);
+	*regs = (rm << 4) | reg;
+
 	/* Decode immediate, if present */
 	switch (X86_MODRM_MOD(v)) {
 	case 0: if (X86_MODRM_RM(v) == 5)
-			addr += 4; /* RIP + disp32 */
+			addr += 4;	/* RIP + disp32 */
+		if (rm == 1)		/* CX */
+			type = BUG_UD1_WARN;
 		break;
 
 	case 1: *imm = *(s8 *)addr;
+		if (rm == 1) {		/* CX */
+			/*
+			 * The 8bit immediate is used to encode two more
+			 * registers, while the rm value is used to encode
+			 * this is a UD1_WARN. Munge the immediate into the
+			 * regs value such that 3 nibbles are set.
+			 */
+			*regs = ((*(u8 *)addr) << 4) | reg;
+			type = BUG_UD1_WARN;
+		}
 		addr += 1;
 		break;
 
@@ -170,18 +200,37 @@ __always_inline int decode_bug(unsigned
 		addr += 4;
 		break;
 
-	case 3: break;
+	case 3: if (rm != 4)		/* SP */
+			type = BUG_UD1_WARN;
+		break;
 	}
 
 	/* record instruction length */
 	*len = addr - start;
 
-	if (X86_MODRM_REG(v) == 0)	/* EAX */
+	if (!rm && X86_MODRM_MOD(v) != 3)	/* (%eax) */
 		return BUG_UD1_UBSAN;
 
-	return BUG_UD1;
+	return type;
 }
 
+int is_valid_bugaddr(unsigned long addr)
+{
+	int ud_type, ud_len;
+	u32 ud_regs;
+	s32 ud_imm;
+
+	if (addr < TASK_SIZE_MAX)
+		return 0;
+
+	/*
+	 * We got #UD, if the text isn't readable we'd have gotten
+	 * a different exception.
+	 */
+	ud_type = decode_bug(addr, &ud_regs, &ud_imm, &ud_len);
+
+	return ud_type == BUG_UD2 || ud_type == BUG_UD1_WARN;
+}
 
 static nokprobe_inline int
 do_trap_no_signal(struct task_struct *tsk, int trapnr, const char *str,
@@ -305,14 +354,42 @@ static inline void handle_invalid_op(str
 		      ILL_ILLOPN, error_get_trap_addr(regs));
 }
 
+#ifdef HAVE_ARCH_BUG_FORMAT
+static inline unsigned long pt_regs_val(struct pt_regs *regs, int nr)
+{
+	int offset = pt_regs_offset(regs, nr);
+	if (WARN_ON_ONCE(offset < -0))
+		return 0;
+	return *((unsigned long *)((void *)regs + offset));
+}
+
+void __warn_printf(const char *fmt, struct pt_regs *regs)
+{
+	unsigned long a1, a2, a3;
+	u32 r = regs->orig_ax;
+
+	/*
+	 * @r is the ud_regs value from decode_bug() which will have at most 3
+	 * registers encoded. Notably printk() will ignore any spurious
+	 * arguments.
+	 */
+	a1 = pt_regs_val(regs, (r >> 0) & 0xf);
+	a2 = pt_regs_val(regs, (r >> 4) & 0xf);
+	a3 = pt_regs_val(regs, (r >> 8) & 0xf);
+
+	printk(fmt, a1, a2, a3);
+}
+#endif
+
 static noinstr bool handle_bug(struct pt_regs *regs)
 {
 	unsigned long addr = regs->ip;
 	bool handled = false;
 	int ud_type, ud_len;
+	u32 ud_regs;
 	s32 ud_imm;
 
-	ud_type = decode_bug(addr, &ud_imm, &ud_len);
+	ud_type = decode_bug(addr, &ud_regs, &ud_imm, &ud_len);
 	if (ud_type == BUG_NONE)
 		return handled;
 
@@ -334,7 +411,13 @@ static noinstr bool handle_bug(struct pt
 		raw_local_irq_enable();
 
 	switch (ud_type) {
+	case BUG_UD1_WARN:
 	case BUG_UD2:
+		/*
+		 * #UD does not have an error code, use orig_ax to pass the ud_regs value
+		 * to __warn_printf().
+		 */
+		regs->orig_ax = ud_regs;
 		if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
 			handled = true;
 			break;


