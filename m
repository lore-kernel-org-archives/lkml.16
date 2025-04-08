Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1724264633
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100488; cv=none; b=t6Wb6Fw3z0LhLMo0+wc2zt+6s+Jg8oJAaPl1EtSRBVLrkVcGIDc3oiqVW0oTxudbn9MgM7GTVyzIWEf+JxYWX7dVs2q1wcROI09etpLjH4ymulHYsdEp3gVjl3u2K0W7pYN4Ymk4egOgCrl2xiUy7BaKs0p6YztHoEhxkAPqpiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100488; c=relaxed/simple;
	bh=XpWuCEwoPXT8o8UPr6REZoN2em1Xvh02RO7hc3Rm1Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZST+JK1cdulUyBUHuOjY6dnwC0+q2eN3pBjH+E4t3aoZ2LXRA49Xfe/m6OEQn2p6eSRZkai5FLM76vVSfrFww5bQOO0v3bbPWiKn7ZA0Rf7FPCQUG+n0/Hqk4mXjhkN3Ri3JicL9rv8Nvhy73T88SqhO9U0GbO2xrHzyXNO/xLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSPo58Rc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSPo58Rc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C962C4CEE5;
	Tue,  8 Apr 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100488;
	bh=XpWuCEwoPXT8o8UPr6REZoN2em1Xvh02RO7hc3Rm1Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NSPo58RcJQz3zoH2B3KAHc+x/g9CKL9pf12o+mZyVmLgW/Jn7Dr4mgfE6Rlo3mGDO
	 X0k7GgwL18iM+a4dYW7S/WaRBI+8k0mqlo978YP7PCWzWjiIrw+72kYwh+axCeY0Mz
	 ile+Zq9RV4+blooZLQyzrrIxPiuEr8tXP+Xv1FriwA9fLNNFkwEbBgwIrbBLoj4F/T
	 5FueZTrn9S70Xqes/nxbkjauARhYWIde8yQAalSBs5GxDiNIXyBmOMTz/rlyrSmJP7
	 kfcTYLu+IaL8MdTRKPsc+JNG1Nez5OR8WzC28YC0VNBTBbH8xfo+dL68UeiV+Livau
	 iAcOM9M6UQJqQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 5/5] objtool: Improve code generation readability
Date: Tue,  8 Apr 2025 01:21:18 -0700
Message-ID: <fa33720aa6022c6fab2336e129e08575177a8009.1744098446.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744098446.git.jpoimboe@kernel.org>
References: <cover.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the readability and compactness of the objtool annotations.
This makes it easier to see them and differentiate from other code.

Before:
-------

 911:
	.pushsection .discard.annotate_insn,"M",@progbits,8
	.long 911b - .
	.long 1
	.popsection

After:
------

 # <ANNOTATE_NOENDBR>
 911:	.pushsection .discard.annotate_insn,"M",@progbits,8; .long 911b - .; .long 1; .popsection
 # </ANNOTATE_NOENDBR>

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/objtool.h | 97 ++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 50 deletions(-)

diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 366ad004d794..66549603147e 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -8,19 +8,31 @@
 
 #include <asm/asm.h>
 
+#define __UNWIND_HINT(label, type, sp_reg, sp_offset, signal)	\
+	.pushsection .discard.unwind_hints;			\
+	/* struct unwind_hint */				\
+	.long label - .;					\
+	.short sp_offset;					\
+	.byte sp_reg;						\
+	.byte type;						\
+	.byte signal;						\
+	.balign 4;						\
+	.popsection
+
+#define __ASM_ANNOTATE(label, type)				\
+	.pushsection .discard.annotate_insn,"M",@progbits,8;	\
+	.long label - .;					\
+	.long type;						\
+	.popsection
+
 #ifndef __ASSEMBLY__
 
-#define UNWIND_HINT(type, sp_reg, sp_offset, signal)	\
-	"987: \n\t"						\
-	".pushsection .discard.unwind_hints\n\t"		\
-	/* struct unwind_hint */				\
-	".long 987b - .\n\t"					\
-	".short " __stringify(sp_offset) "\n\t"			\
-	".byte " __stringify(sp_reg) "\n\t"			\
-	".byte " __stringify(type) "\n\t"			\
-	".byte " __stringify(signal) "\n\t"			\
-	".balign 4 \n\t"					\
-	".popsection\n\t"
+#define UNWIND_HINT(type, sp_reg, sp_offset, signal)		\
+	"\n# <UNWIND_HINT>\n"					\
+	"987: "							\
+	__stringify(__UNWIND_HINT(987b, type, sp_reg,		\
+				  sp_offset, signal))		\
+	"\n# </UNWIND_HINT>\n\t"
 
 /*
  * This macro marks the given function's stack frame as "non-standard", which
@@ -45,23 +57,18 @@
 #define STACK_FRAME_NON_STANDARD_FP(func)
 #endif
 
-#define ASM_REACHABLE							\
-	"998:\n\t"							\
-	".pushsection .discard.reachable\n\t"				\
-	".long 998b\n\t"						\
-	".popsection\n\t"
-
 #define __ASM_BREF(label)	label ## b
 
-#define __ASM_ANNOTATE(label, type)					\
-	".pushsection .discard.annotate_insn,\"M\",@progbits,8\n\t"	\
-	".long " __stringify(label) " - .\n\t"			\
-	".long " __stringify(type) "\n\t"				\
-	".popsection\n\t"
-
 #define ASM_ANNOTATE(type)						\
-	"911:\n\t"						\
-	__ASM_ANNOTATE(911b, type)
+	"\n# <ANNOTATE_" __stringify(type) ">\n"			\
+	"911:\t"							\
+	__stringify(__ASM_ANNOTATE(911b, __PASTE(ANNOTYPE_, type)))	\
+	"\n# </ANNOTATE_" __stringify(type) ">\n\t"
+
+#define ASM_ANNOTATE_LABEL(label, type)					\
+	"\n# BEGIN ANNOTATE_" __stringify(type) "\n"			\
+	__stringify(__ASM_ANNOTATE(label, __PASTE(ANNOTYPE_, type)))	\
+	"\n# </ANNOTATE_" __stringify(type) "\n\t"
 
 #else /* __ASSEMBLY__ */
 
@@ -88,15 +95,7 @@
  */
 .macro UNWIND_HINT type:req sp_reg=0 sp_offset=0 signal=0
 .Lhere_\@:
-	.pushsection .discard.unwind_hints
-		/* struct unwind_hint */
-		.long .Lhere_\@ - .
-		.short \sp_offset
-		.byte \sp_reg
-		.byte \type
-		.byte \signal
-		.balign 4
-	.popsection
+	__UNWIND_HINT(.Lhere_\@, \type, \sp_reg, \sp_offset, \signal)
 .endm
 
 .macro STACK_FRAME_NON_STANDARD func:req
@@ -113,10 +112,7 @@
 
 .macro ANNOTATE type:req
 .Lhere_\@:
-	.pushsection .discard.annotate_insn,"M",@progbits,8
-	.long	.Lhere_\@ - .
-	.long	\type
-	.popsection
+	__ASM_ANNOTATE(.Lhere_\@, \type)
 .endm
 
 #endif /* __ASSEMBLY__ */
@@ -125,11 +121,12 @@
 
 #ifndef __ASSEMBLY__
 
-#define UNWIND_HINT(type, sp_reg, sp_offset, signal) "\n\t"
 #define STACK_FRAME_NON_STANDARD(func)
 #define STACK_FRAME_NON_STANDARD_FP(func)
-#define __ASM_ANNOTATE(label, type) ""
-#define ASM_ANNOTATE(type)
+
+#define UNWIND_HINT(type, sp_reg, sp_offset, signal)	""
+#define ASM_ANNOTATE(type)				""
+#define ASM_ANNOTATE_LABEL(sym, type)			""
 #else
 .macro UNWIND_HINT type:req sp_reg=0 sp_offset=0 signal=0
 .endm
@@ -146,30 +143,30 @@
  * Annotate away the various 'relocation to !ENDBR` complaints; knowing that
  * these relocations will never be used for indirect calls.
  */
-#define ANNOTATE_NOENDBR		ASM_ANNOTATE(ANNOTYPE_NOENDBR)
-#define ANNOTATE_NOENDBR_SYM(sym)	asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
+#define ANNOTATE_NOENDBR		ASM_ANNOTATE(NOENDBR)
+#define ANNOTATE_NOENDBR_SYM(sym)	asm(ASM_ANNOTATE_LABEL(sym, NOENDBR))
 
 /*
  * This should be used immediately before an indirect jump/call. It tells
  * objtool the subsequent indirect jump/call is vouched safe for retpoline
  * builds.
  */
-#define ANNOTATE_RETPOLINE_SAFE		ASM_ANNOTATE(ANNOTYPE_RETPOLINE_SAFE)
+#define ANNOTATE_RETPOLINE_SAFE		ASM_ANNOTATE(RETPOLINE_SAFE)
 /*
  * See linux/instrumentation.h
  */
-#define ANNOTATE_INSTR_BEGIN(label)	__ASM_ANNOTATE(label, ANNOTYPE_INSTR_BEGIN)
-#define ANNOTATE_INSTR_END(label)	__ASM_ANNOTATE(label, ANNOTYPE_INSTR_END)
+#define ANNOTATE_INSTR_BEGIN(label)	ASM_ANNOTATE_LABEL(label, INSTR_BEGIN)
+#define ANNOTATE_INSTR_END(label)	ASM_ANNOTATE_LABEL(label, INSTR_END)
 /*
  * objtool annotation to ignore the alternatives and only consider the original
  * instruction(s).
  */
-#define ANNOTATE_IGNORE_ALTERNATIVE	ASM_ANNOTATE(ANNOTYPE_IGNORE_ALTS)
+#define ANNOTATE_IGNORE_ALTERNATIVE	ASM_ANNOTATE(IGNORE_ALTS)
 /*
  * This macro indicates that the following intra-function call is valid.
  * Any non-annotated intra-function call will cause objtool to issue a warning.
  */
-#define ANNOTATE_INTRA_FUNCTION_CALL	ASM_ANNOTATE(ANNOTYPE_INTRA_FUNCTION_CALL)
+#define ANNOTATE_INTRA_FUNCTION_CALL	ASM_ANNOTATE(INTRA_FUNCTION_CALL)
 /*
  * Use objtool to validate the entry requirement that all code paths do
  * VALIDATE_UNRET_END before RET.
@@ -177,13 +174,13 @@
  * NOTE: The macro must be used at the beginning of a global symbol, otherwise
  * it will be ignored.
  */
-#define ANNOTATE_UNRET_BEGIN		ASM_ANNOTATE(ANNOTYPE_UNRET_BEGIN)
+#define ANNOTATE_UNRET_BEGIN		ASM_ANNOTATE(UNRET_BEGIN)
 /*
  * This should be used to refer to an instruction that is considered
  * terminating, like a noreturn CALL or UD2 when we know they are not -- eg
  * WARN using UD2.
  */
-#define ANNOTATE_REACHABLE(label)	__ASM_ANNOTATE(label, ANNOTYPE_REACHABLE)
+#define ANNOTATE_REACHABLE(label)	ASM_ANNOTATE_LABEL(label, REACHABLE)
 
 #else
 #define ANNOTATE_NOENDBR		ANNOTATE type=ANNOTYPE_NOENDBR
-- 
2.49.0

