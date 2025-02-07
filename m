Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314411E102A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931314; cv=none; b=mBbDJlsPzh+bAllvOKfxA28o3+ybape8sYmszucUi7iejuvm/cfOUFSWJSt/Dn8hMmidcmrrMePHdxSArDkN0ekdQvehAJ+yL43GoOUj5CY7sojeNMgd3GW8H8HQcI9XIHGcIbZvUHsY7YYV+GodgrpeMfpXDD2JjQ9ugn4z5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931314; c=relaxed/simple;
	bh=1yhsFTAJC0fyLfAlQ7ZXicMfYzFRyVFlwOSBTX9grv4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=bFfnHFLIaON35XKIXGhB8hLADTzPdOCGNmpSDGL9imnBKEEx6HgqLuAaN0hzUAbPyCWDVi0krAf/VJMYS+2IVIX1tj3XOO5KqlKTHn7TT+5Rt41jn0juVdkXKTiJrr+WaCAoGQhLY7RtyxGYIzneaq+2Daksj0BjAr8xlo4IfL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NgHZNCmp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NgHZNCmp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=L+COfsvQhb7CX9P6B6i2gM9H/qGrRRtoSf00jF2EqEI=; b=NgHZNCmpKTbr5/IWPtwlj1MSl6
	jObMLasIj8dwRPBNZxwS6Foc8uao49b2oJb0ucdUhorePEcNeiQSwCfsHFE792Y2hrjzYnoL5M8++
	t5vtsVFCNuugvpwUw+eNYsEeCICJG9hXD2C2aONBJuxM29tJC7X+lJuFC6qPZorWCXYVfkSq0CZni
	nuNpIyGxN/BDVmj0sHHt/MDDVMGOqe4gxXslM3yM69/X5eaN6ajVP/wMmazr1iSl+IfO1eKNys4du
	M+V7VcRhST1CUgN37hZIHHuFRGYiNja/UUtbT8imADM/lTuBIh9eCvVrAmsmU/SfrlGXRZZ/AtLSu
	XQtFHiMA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNTA-00000007nBy-2kTv;
	Fri, 07 Feb 2025 12:28:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 499A530619B; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122547.124276834@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:40 +0100
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
 mhiramat@kernel.org
Subject: [PATCH 11/11] x86/fineibt: Add FineIBT+BHI mitigation
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Due to FineIBT weakness, add an additional mitigation for BHI.

Relies on clang-cfi to emit an additional piece of magic in the kCFI
pre-amble:

  https://github.com/llvm/llvm-project/commit/e223485c9b38a5579991b8cebb6a200153eee245

Which encodes the number of argument registers in the target register:

	movl	0x12345678, %reg	// CFI hash


XXX get Scott to write a blurb about how this works to mitigate BHI


  FineIBT				FineIBT+BHI

  __cfi_foo:				__cfi_foo:
     endbr64				   endbr64
     subl $0x12345678, %r10d               subl $0x12345678, %r10d
     jz	  1f                               call __bhi_args[\reg]
     ud2
  1: nop
  foo:                                  foo:
     osp nop3				   osp nop3
     ...                                   ...

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 Makefile                      |    3 ++
 arch/x86/Kconfig              |    8 +++++
 arch/x86/include/asm/cfi.h    |    9 +++++-
 arch/x86/kernel/alternative.c |   60 +++++++++++++++++++++++++++++++++++-------
 arch/x86/net/bpf_jit_comp.c   |   32 +++++++++++++++-------
 kernel/bpf/core.c             |    4 +-
 6 files changed, 94 insertions(+), 22 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -1014,6 +1014,9 @@ CC_FLAGS_CFI	:= -fsanitize=kcfi
 ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
 	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
 endif
+ifdef CONFIG_FINEIBT_BHI
+	CC_FLAGS_CFI    += -fsanitize-kcfi-arity
+endif
 ifdef CONFIG_RUST
 	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST selects
 	# CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2473,6 +2473,10 @@ config CC_HAS_RETURN_THUNK
 config CC_HAS_ENTRY_PADDING
 	def_bool $(cc-option,-fpatchable-function-entry=16,16)
 
+config CC_HAS_KCFI_ARITY
+	def_bool $(cc-option,-fsanitize=kcfi -fsanitize-kcfi-arity)
+	depends on CC_IS_CLANG && !RUST
+
 config FUNCTION_PADDING_CFI
 	int
 	default 59 if FUNCTION_ALIGNMENT_64B
@@ -2498,6 +2502,10 @@ config FINEIBT
 	depends on X86_KERNEL_IBT && CFI_CLANG && MITIGATION_RETPOLINE
 	select CALL_PADDING
 
+config FINEIBT_BHI
+	def_bool y
+	depends on FINEIBT && CC_HAS_KCFI_ARITY
+
 config HAVE_CALL_THUNKS
 	def_bool y
 	depends on CC_HAS_ENTRY_PADDING && MITIGATION_RETHUNK && OBJTOOL
--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -72,7 +72,7 @@
  * __cfi_foo:
  *   endbr64
  *   subl 0x12345678, %r10d
- *   jz   foo
+ *   jz   foo			# call __bhi_args[\reg] when CONFIG_FINEIBT_BHI
  *   ud2
  *   nop
  * foo:
@@ -97,6 +97,7 @@ enum cfi_mode {
 	CFI_OFF,	/* Taditional / IBT depending on .config */
 	CFI_KCFI,	/* Optionally CALL_PADDING, IBT, RETPOLINE */
 	CFI_FINEIBT,	/* see arch/x86/kernel/alternative.c */
+	CFI_FINEIBT_BHI,
 };
 
 extern enum cfi_mode cfi_mode;
@@ -116,6 +117,7 @@ static inline int cfi_get_offset(void)
 {
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+	case CFI_FINEIBT_BHI:
 		return 16;
 	case CFI_KCFI:
 		if (IS_ENABLED(CONFIG_CALL_PADDING))
@@ -128,6 +130,7 @@ static inline int cfi_get_offset(void)
 #define cfi_get_offset cfi_get_offset
 
 extern u32 cfi_get_func_hash(void *func);
+extern int cfi_get_func_arity(void *func);
 
 #else
 static inline enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
@@ -140,6 +143,10 @@ static inline u32 cfi_get_func_hash(void
 {
 	return 0;
 }
+static inline int cfi_get_func_arity(void *func)
+{
+	return 0;
+}
 #endif /* CONFIG_CFI_CLANG */
 
 #if HAS_KERNEL_IBT == 1
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -962,6 +962,7 @@ u32 cfi_get_func_hash(void *func)
 	func -= cfi_get_offset();
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+	case CFI_FINEIBT_BHI:
 		func += 7;
 		break;
 	case CFI_KCFI:
@@ -976,6 +977,21 @@ u32 cfi_get_func_hash(void *func)
 
 	return hash;
 }
+
+int cfi_get_func_arity(void *func)
+{
+	bhi_thunk *target;
+	s32 disp;
+
+	if (cfi_mode != CFI_FINEIBT_BHI)
+		return 0;
+
+	if (get_kernel_nofault(disp, func-4))
+		return 0;
+
+	target = func + disp;
+	return target - __bhi_args;
+}
 #endif
 
 #ifdef CONFIG_FINEIBT
@@ -1020,6 +1036,8 @@ static __init int cfi_parse_cmdline(char
 			cfi_mode = CFI_KCFI;
 		} else if (!strcmp(str, "fineibt")) {
 			cfi_mode = CFI_FINEIBT;
+		} else if (IS_ENABLED(CONFIG_FINEIBT_BHI) && !strcmp(str, "fineibt+bhi")) {
+			cfi_mode = CFI_FINEIBT_BHI;
 		} else if (!strcmp(str, "norand")) {
 			cfi_rand = false;
 		} else {
@@ -1064,6 +1082,7 @@ asm(	".pushsection .rodata			\n"
 	"fineibt_preamble_start:		\n"
 	"	endbr64				\n"
 	"	subl	$0x12345678, %r10d	\n"
+	"fineibt_preamble_bhi_call:		\n"
 	"	je	fineibt_preamble_end	\n"
 	"	ud2				\n"
 	"	nop				\n"
@@ -1072,10 +1091,12 @@ asm(	".pushsection .rodata			\n"
 );
 
 extern u8 fineibt_preamble_start[];
+extern u8 fineibt_preamble_bhi_call[];
 extern u8 fineibt_preamble_end[];
 
 #define fineibt_preamble_size (fineibt_preamble_end - fineibt_preamble_start)
 #define fineibt_preamble_hash 7
+#define fineibt_preamble_bhi  (fineibt_preamble_bhi_call - fineibt_preamble_start)
 
 asm(	".pushsection .rodata			\n"
 	"fineibt_caller_start:			\n"
@@ -1094,13 +1115,16 @@ extern u8 fineibt_caller_end[];
 
 #define fineibt_caller_jmp (fineibt_caller_size - 2)
 
-static u32 decode_preamble_hash(void *addr)
+static u32 decode_preamble_hash(void *addr, int *reg)
 {
 	u8 *p = addr;
 
-	/* b8 78 56 34 12          mov    $0x12345678,%eax */
-	if (p[0] == 0xb8)
+	/* b8+reg 78 56 34 12      movl    $0x12345678,\reg */
+	if (p[0] >= 0xb8 && p[0] < 0xc0) {
+		if (reg)
+			*reg = p[0] - 0xb8;
 		return *(u32 *)(addr + 1);
+	}
 
 	return 0; /* invalid hash value */
 }
@@ -1109,7 +1133,7 @@ static u32 decode_caller_hash(void *addr
 {
 	u8 *p = addr;
 
-	/* 41 ba 78 56 34 12       mov    $0x12345678,%r10d */
+	/* 41 ba 78 56 34 12       movl    $(-0x12345678),%r10d */
 	if (p[0] == 0x41 && p[1] == 0xba)
 		return -*(u32 *)(addr + 2);
 
@@ -1178,7 +1202,7 @@ static int cfi_rand_preamble(s32 *start,
 		void *addr = (void *)s + *s;
 		u32 hash;
 
-		hash = decode_preamble_hash(addr);
+		hash = decode_preamble_hash(addr, NULL);
 		if (WARN(!hash, "no CFI hash found at: %pS %px %*ph\n",
 			 addr, addr, 5, addr))
 			return -EINVAL;
@@ -1197,6 +1221,7 @@ static int cfi_rewrite_preamble(s32 *sta
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
 		u32 hash;
+		int reg;
 
 		/*
 		 * When the function doesn't start with ENDBR the compiler will
@@ -1206,7 +1231,7 @@ static int cfi_rewrite_preamble(s32 *sta
 		if (!is_endbr(addr + 16))
 			continue;
 
-		hash = decode_preamble_hash(addr);
+		hash = decode_preamble_hash(addr, &reg);
 		if (WARN(!hash, "no CFI hash found at: %pS %px %*ph\n",
 			 addr, addr, 5, addr))
 			return -EINVAL;
@@ -1214,6 +1239,19 @@ static int cfi_rewrite_preamble(s32 *sta
 		text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
 		WARN_ON(*(u32 *)(addr + fineibt_preamble_hash) != 0x12345678);
 		text_poke_early(addr + fineibt_preamble_hash, &hash, 4);
+
+		WARN_ONCE(!IS_ENABLED(CONFIG_FINEIBT_BHI) && reg,
+			  "kCFI preamble has wrong register at: %pS %px %*ph\n",
+			  addr, addr, 5, addr);
+
+		if (cfi_mode != CFI_FINEIBT_BHI || !reg)
+			continue;
+
+		text_poke_early(addr + fineibt_preamble_bhi,
+				text_gen_insn(CALL_INSN_OPCODE,
+					      addr + fineibt_preamble_bhi,
+					      __bhi_args[reg]),
+				CALL_INSN_SIZE);
 	}
 
 	return 0;
@@ -1330,6 +1368,7 @@ static void __apply_fineibt(s32 *start_r
 		return;
 
 	case CFI_FINEIBT:
+	case CFI_FINEIBT_BHI:
 		/* place the FineIBT preamble at func()-16 */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
@@ -1343,8 +1382,10 @@ static void __apply_fineibt(s32 *start_r
 		/* now that nobody targets func()+0, remove ENDBR there */
 		cfi_rewrite_endbr(start_cfi, end_cfi);
 
-		if (builtin)
-			pr_info("Using FineIBT CFI\n");
+		if (builtin) {
+			pr_info("Using FineIBT%s CFI\n",
+				cfi_mode == CFI_FINEIBT_BHI ? "+BHI" : "");
+		}
 		return;
 
 	default:
@@ -1372,6 +1413,7 @@ static void poison_cfi(void *addr)
 	 */
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
+	case CFI_FINEIBT_BHI:
 		/*
 		 * FineIBT prefix should start with an ENDBR.
 		 */
@@ -1394,7 +1436,7 @@ static void poison_cfi(void *addr)
 		/*
 		 * kCFI prefix should start with a valid hash.
 		 */
-		if (!decode_preamble_hash(addr))
+		if (!decode_preamble_hash(addr, NULL))
 			break;
 
 		/*
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -410,16 +410,21 @@ static void emit_nops(u8 **pprog, int le
  * Emit the various CFI preambles, see asm/cfi.h and the comments about FineIBT
  * in arch/x86/kernel/alternative.c
  */
+static int emit_call(u8 **pprog, void *func, void *ip);
 
-static void emit_fineibt(u8 **pprog, u32 hash)
+static void emit_fineibt(u8 **pprog, u8 *ip, u32 hash, int reg)
 {
 	u8 *prog = *pprog;
 
 	EMIT_ENDBR();
 	EMIT3_off32(0x41, 0x81, 0xea, hash);		/* subl $hash, %r10d	*/
-	EMIT2(0x74, 0x07);				/* jz.d8 +7		*/
-	EMIT2(0x0f, 0x0b);				/* ud2			*/
-	EMIT1(0x90);					/* nop			*/
+	if (cfi_mode == CFI_FINEIBT_BHI && reg) {
+		emit_call(&prog, __bhi_args[reg], ip);
+	} else {
+		EMIT2(0x74, 0x02);			/* jz.d8 +2		*/
+		EMIT2(0x0f, 0x0b);			/* ud2			*/
+		EMIT1(0x90);				/* nop			*/
+	}
 	EMIT_ENDBR_POISON();
 
 	*pprog = prog;
@@ -448,13 +453,14 @@ static void emit_kcfi(u8 **pprog, u32 ha
 	*pprog = prog;
 }
 
-static void emit_cfi(u8 **pprog, u32 hash)
+static void emit_cfi(u8 **pprog, u8 *ip, u32 hash, int reg)
 {
 	u8 *prog = *pprog;
 
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
-		emit_fineibt(&prog, hash);
+	case CFI_FINEIBT_BHI:
+		emit_fineibt(&prog, ip, hash, reg);
 		break;
 
 	case CFI_KCFI:
@@ -505,13 +511,17 @@ static void emit_prologue_tail_call(u8 *
  * bpf_tail_call helper will skip the first X86_TAIL_CALL_OFFSET bytes
  * while jumping to another program
  */
-static void emit_prologue(u8 **pprog, u32 stack_depth, bool ebpf_from_cbpf,
+static void emit_prologue(u8 **pprog, u8 *ip, u32 stack_depth, bool ebpf_from_cbpf,
 			  bool tail_call_reachable, bool is_subprog,
 			  bool is_exception_cb)
 {
 	u8 *prog = *pprog;
 
-	emit_cfi(&prog, is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash);
+	if (is_subprog) {
+		emit_cfi(&prog, ip, cfi_bpf_subprog_hash, 5);
+	} else {
+		emit_cfi(&prog, ip, cfi_bpf_hash, 1);
+	}
 	/* BPF trampoline can be made to work without these nops,
 	 * but let's waste 5 bytes for now and optimize later
 	 */
@@ -1480,7 +1490,7 @@ static int do_jit(struct bpf_prog *bpf_p
 
 	detect_reg_usage(insn, insn_cnt, callee_regs_used);
 
-	emit_prologue(&prog, stack_depth,
+	emit_prologue(&prog, image, stack_depth,
 		      bpf_prog_was_classic(bpf_prog), tail_call_reachable,
 		      bpf_is_subprog(bpf_prog), bpf_prog->aux->exception_cb);
 	/* Exception callback will clobber callee regs for its own use, and
@@ -3047,7 +3057,9 @@ static int __arch_prepare_bpf_trampoline
 		/*
 		 * Indirect call for bpf_struct_ops
 		 */
-		emit_cfi(&prog, cfi_get_func_hash(func_addr));
+		emit_cfi(&prog, image,
+			 cfi_get_func_hash(func_addr),
+			 cfi_get_func_arity(func_addr));
 	} else {
 		/*
 		 * Direct-call fentry stub, as such it needs accounting for the
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -707,7 +707,7 @@ void bpf_prog_kallsyms_add(struct bpf_pr
 	 * When FineIBT, code in the __cfi_foo() symbols can get executed
 	 * and hence unwinder needs help.
 	 */
-	if (cfi_mode != CFI_FINEIBT)
+	if (cfi_mode != CFI_FINEIBT && cfi_mode != CFI_FINEIBT_BHI)
 		return;
 
 	snprintf(fp->aux->ksym_prefix.name, KSYM_NAME_LEN,
@@ -727,7 +727,7 @@ void bpf_prog_kallsyms_del(struct bpf_pr
 
 	bpf_ksym_del(&fp->aux->ksym);
 #ifdef CONFIG_FINEIBT
-	if (cfi_mode != CFI_FINEIBT)
+	if (cfi_mode != CFI_FINEIBT && cfi_mode != CFI_FINEIBT_BHI)
 		return;
 	bpf_ksym_del(&fp->aux->ksym_prefix);
 #endif


