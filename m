Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC91F8916
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931323; cv=none; b=nXWBhmrsrkxC30qIAflsEDWIFTmUjAVyJ1k7xpHZNWl+PwmHZ5VhtHpEZctRtxH2c8uKfIKzPvawkqU6JMoLZjnRQRFd9YXUyXAntnZnVgcFYnVV7wQo9ljgQtWvoMYGD46Xxa4RcPUR/zQHOWftV9geMJ6cRR6g34YWL+gm2Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931323; c=relaxed/simple;
	bh=UIpXAWe7qZ2zYq+NLH5QockvHxWbiZUlnY+HasPUK7Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=P4ytEy2IWGsg1FBSd9r0gR7bbXhsdrYBdTtGR7KAKXz7dR7OeWZsRqMfOvjv5V8IndODo9xNEOWNDCti/Y4kQoQgkz1Yo2VUdAhCY3Ad7+UVgEQAAObNHIm+dtYeLVbDkZ/v3m8DW3A1/Bf6OLE105+gzuO35YJoLJJWuSkXq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UiQ+oj6b; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UiQ+oj6b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=L5KFRG9+qs4ZpSTEsGUBPsv/WS7rphmSwxBen5PJStA=; b=UiQ+oj6b/U1jcYvxHaiDYyFvjd
	dXxgCh3TbEW0oL65w441Ciqjq3/Nplw7DIpKnsj6tNF+nWv04IwDiBT3Hkgq+vygXHV7hsOgji6AB
	WaJtX9mV7F7KqSTQWqZnyqwe+TW1SSOQ8q9y3nJl+TPdwiCZppMWcjHE8Dh80I2BGkWSMLDl7QoMw
	cLnlkjXkD0uQvsMhftdf/BJIw2dutbPbeNu0GEmXJhnpNzNAvu6VllXxSkO/YiSwaEqOEVqOmS0RD
	f7HnFDVCjqM0pEQefQn//2yy+vwfzBwZ6QHi/hm2n08ngZL9M9ZLuvynY1EUZUHOl4+uD4vgvwpJ+
	l02ingsw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT8-0000000HAee-4362;
	Fri, 07 Feb 2025 12:28:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 39A8C302E9C; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.721120726@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:36 +0100
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
Subject: [PATCH 07/11] x86/traps: Cleanup and robustify decode_bug()
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Notably, don't attempt to decode an immediate when MOD == 3.

Additionally have it return the instruction length, such that WARN
like bugs can more reliably skip to the correct instruction.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/bug.h |    5 +-
 arch/x86/include/asm/ibt.h |    4 +-
 arch/x86/kernel/traps.c    |   82 ++++++++++++++++++++++++++++++++-------------
 3 files changed, 65 insertions(+), 26 deletions(-)

--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -22,8 +22,9 @@
 #define SECOND_BYTE_OPCODE_UD2	0x0b
 
 #define BUG_NONE		0xffff
-#define BUG_UD1			0xfffe
-#define BUG_UD2			0xfffd
+#define BUG_UD2			0xfffe
+#define BUG_UD1			0xfffd
+#define BUG_UD1_UBSAN		0xfffc
 
 #ifdef CONFIG_GENERIC_BUG
 
--- a/arch/x86/include/asm/ibt.h
+++ b/arch/x86/include/asm/ibt.h
@@ -41,7 +41,7 @@
 	_ASM_PTR fname "\n\t"				\
 	".popsection\n\t"
 
-static inline __attribute_const__ u32 gen_endbr(void)
+static __always_inline __attribute_const__ u32 gen_endbr(void)
 {
 	u32 endbr;
 
@@ -56,7 +56,7 @@ static inline __attribute_const__ u32 ge
 	return endbr;
 }
 
-static inline __attribute_const__ u32 gen_endbr_poison(void)
+static __always_inline __attribute_const__ u32 gen_endbr_poison(void)
 {
 	/*
 	 * 4 byte NOP that isn't NOP4 (in fact it is OSP NOP3), such that it
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -94,10 +94,17 @@ __always_inline int is_valid_bugaddr(uns
 
 /*
  * Check for UD1 or UD2, accounting for Address Size Override Prefixes.
- * If it's a UD1, get the ModRM byte to pass along to UBSan.
+ * If it's a UD1, further decode to determine its use:
+ *
+ * UBSan{0}:     67 0f b9 00             ud1    (%eax),%eax
+ * UBSan{10}:    67 0f b9 40 10          ud1    0x10(%eax),%eax
+ * static_call:  0f b9 cc                ud1    %esp,%ecx
+ *
+ * Notably UBSAN uses EAX, static_call uses ECX.
  */
-__always_inline int decode_bug(unsigned long addr, u32 *imm)
+__always_inline int decode_bug(unsigned long addr, s32 *imm, int *len)
 {
+	unsigned long start = addr;
 	u8 v;
 
 	if (addr < TASK_SIZE_MAX)
@@ -110,24 +117,42 @@ __always_inline int decode_bug(unsigned
 		return BUG_NONE;
 
 	v = *(u8 *)(addr++);
-	if (v == SECOND_BYTE_OPCODE_UD2)
+	if (v == SECOND_BYTE_OPCODE_UD2) {
+		*len = addr - start;
 		return BUG_UD2;
+	}
 
-	if (!IS_ENABLED(CONFIG_UBSAN_TRAP) || v != SECOND_BYTE_OPCODE_UD1)
+	if (v != SECOND_BYTE_OPCODE_UD1)
 		return BUG_NONE;
 
-	/* Retrieve the immediate (type value) for the UBSAN UD1 */
-	v = *(u8 *)(addr++);
-	if (X86_MODRM_RM(v) == 4)
-		addr++;
-
 	*imm = 0;
-	if (X86_MODRM_MOD(v) == 1)
-		*imm = *(u8 *)addr;
-	else if (X86_MODRM_MOD(v) == 2)
-		*imm = *(u32 *)addr;
-	else
-		WARN_ONCE(1, "Unexpected MODRM_MOD: %u\n", X86_MODRM_MOD(v));
+	v = *(u8 *)(addr++);		/* ModRM */
+
+	if (X86_MODRM_MOD(v) != 3 && X86_MODRM_RM(v) == 4)
+		addr++;			/* SIB */
+
+	/* Decode immediate, if present */
+	switch (X86_MODRM_MOD(v)) {
+	case 0: if (X86_MODRM_RM(v) == 5)
+			addr += 4; /* RIP + disp32 */
+		break;
+
+	case 1: *imm = *(s8 *)addr;
+		addr += 1;
+		break;
+
+	case 2: *imm = *(s32 *)addr;
+		addr += 4;
+		break;
+
+	case 3: break;
+	}
+
+	/* record instruction length */
+	*len = addr - start;
+
+	if (X86_MODRM_REG(v) == 0)	/* EAX */
+		return BUG_UD1_UBSAN;
 
 	return BUG_UD1;
 }
@@ -258,10 +283,10 @@ static inline void handle_invalid_op(str
 static noinstr bool handle_bug(struct pt_regs *regs)
 {
 	bool handled = false;
-	int ud_type;
-	u32 imm;
+	int ud_type, ud_len;
+	s32 ud_imm;
 
-	ud_type = decode_bug(regs->ip, &imm);
+	ud_type = decode_bug(regs->ip, &ud_imm, &ud_len);
 	if (ud_type == BUG_NONE)
 		return handled;
 
@@ -281,15 +306,28 @@ static noinstr bool handle_bug(struct pt
 	 */
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_enable();
-	if (ud_type == BUG_UD2) {
+
+	switch (ud_type) {
+	case BUG_UD2:
 		if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
 		    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
-			regs->ip += LEN_UD2;
+			regs->ip += ud_len;
 			handled = true;
 		}
-	} else if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
-		pr_crit("%s at %pS\n", report_ubsan_failure(regs, imm), (void *)regs->ip);
+		break;
+
+	case BUG_UD1_UBSAN:
+		if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
+			pr_crit("%s at %pS\n",
+				report_ubsan_failure(regs, ud_imm),
+				(void *)regs->ip);
+		}
+		break;
+
+	default:
+		break;
 	}
+
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_disable();
 	instrumentation_end();


