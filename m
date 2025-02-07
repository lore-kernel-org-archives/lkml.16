Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E61DE2D7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931314; cv=none; b=GL9lPhZn8+G1lkzLp70ZUOiG+7X6AUdLkL6o0AuNa39RIJRqEE+HioOUyXkPrQ9VaImtmyy6jWxZoCpvqohqyAl+jHyrN93c6axnKrJfdCdFzhs82SbUO/CevIu63cLT9u9+/KRl+/6IPsu+M4L+rxAAc1+zQHsBEfrsQ0H2E3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931314; c=relaxed/simple;
	bh=JBcZXkMbHaasTgMYbtpZTIxIdpc2x4ruCpuijKxhm7g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BtTfSyBk1YYq3SrAmhpKtaZmKqcZc3a/Rwg9XsupKwSnl3yvpxfXieJ2AgXVSnA+jgqd5W0OvVyskQSnTfQGIxPq6CoZ8kqdZdb86K+sz3/Z2WiQrJ04LgA27wfOceyPsgl9fHLnLo7uXWSUAk9VR9Wh7vjTr8+f31iFTEMZ9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fb3aQVHn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fb3aQVHn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ZUv5K/NDjIg1Db+z6YMSwmMOaXtAc4RYuDDWykJP/1A=; b=fb3aQVHnfYISsMPkNXTGWM3ZlS
	A9Os6rOW61SdozXfENBRgd6SaJJ4JndgenFbhFk9/cWG0tV+I3PNfTWSpTE0b73SCiRQqoHcB7bnI
	CSUede+7rMHo5Ip6nGycLvHz7TK3aD9FhcZV9yH60scebs0Cb68gekScMk4fxsI5jnFvExJH9Xpr6
	6aoTFngEQhiS2oJMkwI19eN6PVO3g3lPDiUKqpbJh0LWkjsRNRbJVOteTl6mQQ/xUMC9JkVWsnh9g
	cyCtQA0PP2IeEDb2dKJ8ZZoi1HGrjHua3SUz5ual7jG+yQWzi8r1RggtIa+4C7Go2XEsEcfnrfP7d
	uv2TJM4w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT8-00000007nBg-0L0Y;
	Fri, 07 Feb 2025 12:28:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 2B8783006C0; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.302679189@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:32 +0100
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
Subject: [PATCH 03/11] x86,kcfi: Fix EXPORT_SYMBOL vs kCFI
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The expectation is that all EXPORT'ed symbols are free to have their
address taken and called indirectly. The majority of the assembly
defined functions currently violate this expectation.

Make then all use SYM_TYPED_FUNC_START() in order to emit the proper
kCFI preamble.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/crypto/camellia-aesni-avx-asm_64.S  |    7 ++++---
 arch/x86/crypto/camellia-aesni-avx2-asm_64.S |    1 +
 arch/x86/crypto/camellia-x86_64-asm_64.S     |    9 +++++----
 arch/x86/crypto/serpent-avx-x86_64-asm_64.S  |    7 ++++---
 arch/x86/crypto/twofish-x86_64-asm_64-3way.S |    5 +++--
 arch/x86/crypto/twofish-x86_64-asm_64.S      |    5 +++--
 arch/x86/entry/entry.S                       |    3 ++-
 arch/x86/entry/entry_64.S                    |    5 +++--
 arch/x86/lib/clear_page_64.S                 |    9 +++++----
 arch/x86/lib/copy_page_64.S                  |    3 ++-
 arch/x86/lib/copy_user_64.S                  |    3 ++-
 arch/x86/lib/copy_user_uncached_64.S         |    3 ++-
 arch/x86/lib/getuser.S                       |   17 +++++++++--------
 arch/x86/lib/hweight.S                       |    5 +++--
 arch/x86/lib/memmove_64.S                    |    3 ++-
 arch/x86/lib/memset_64.S                     |    3 ++-
 arch/x86/lib/msr-reg.S                       |    3 ++-
 arch/x86/lib/putuser.S                       |   17 +++++++++--------
 18 files changed, 63 insertions(+), 45 deletions(-)

Index: linux-2.6/arch/x86/crypto/camellia-aesni-avx-asm_64.S
===================================================================
--- linux-2.6.orig/arch/x86/crypto/camellia-aesni-avx-asm_64.S
+++ linux-2.6/arch/x86/crypto/camellia-aesni-avx-asm_64.S
@@ -16,6 +16,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/frame.h>
 
 #define CAMELLIA_TABLE_BYTE_LEN 272
@@ -882,7 +883,7 @@ SYM_FUNC_START_LOCAL(__camellia_dec_blk1
 	jmp .Ldec_max24;
 SYM_FUNC_END(__camellia_dec_blk16)
 
-SYM_FUNC_START(camellia_ecb_enc_16way)
+SYM_TYPED_FUNC_START(camellia_ecb_enc_16way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst (16 blocks)
@@ -907,7 +908,7 @@ SYM_FUNC_START(camellia_ecb_enc_16way)
 	RET;
 SYM_FUNC_END(camellia_ecb_enc_16way)
 
-SYM_FUNC_START(camellia_ecb_dec_16way)
+SYM_TYPED_FUNC_START(camellia_ecb_dec_16way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst (16 blocks)
@@ -937,7 +938,7 @@ SYM_FUNC_START(camellia_ecb_dec_16way)
 	RET;
 SYM_FUNC_END(camellia_ecb_dec_16way)
 
-SYM_FUNC_START(camellia_cbc_dec_16way)
+SYM_TYPED_FUNC_START(camellia_cbc_dec_16way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst (16 blocks)
Index: linux-2.6/arch/x86/crypto/camellia-aesni-avx2-asm_64.S
===================================================================
--- linux-2.6.orig/arch/x86/crypto/camellia-aesni-avx2-asm_64.S
+++ linux-2.6/arch/x86/crypto/camellia-aesni-avx2-asm_64.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/frame.h>
 
 #define CAMELLIA_TABLE_BYTE_LEN 272
Index: linux-2.6/arch/x86/crypto/camellia-x86_64-asm_64.S
===================================================================
--- linux-2.6.orig/arch/x86/crypto/camellia-x86_64-asm_64.S
+++ linux-2.6/arch/x86/crypto/camellia-x86_64-asm_64.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 
 .file "camellia-x86_64-asm_64.S"
 .text
@@ -177,7 +178,7 @@
 	bswapq				RAB0; \
 	movq RAB0,			4*2(RIO);
 
-SYM_FUNC_START(__camellia_enc_blk)
+SYM_TYPED_FUNC_START(__camellia_enc_blk)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
@@ -224,7 +225,7 @@ SYM_FUNC_START(__camellia_enc_blk)
 	RET;
 SYM_FUNC_END(__camellia_enc_blk)
 
-SYM_FUNC_START(camellia_dec_blk)
+SYM_TYPED_FUNC_START(camellia_dec_blk)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
@@ -411,7 +412,7 @@ SYM_FUNC_END(camellia_dec_blk)
 		bswapq				RAB1; \
 		movq RAB1,			12*2(RIO);
 
-SYM_FUNC_START(__camellia_enc_blk_2way)
+SYM_TYPED_FUNC_START(__camellia_enc_blk_2way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
@@ -460,7 +461,7 @@ SYM_FUNC_START(__camellia_enc_blk_2way)
 	RET;
 SYM_FUNC_END(__camellia_enc_blk_2way)
 
-SYM_FUNC_START(camellia_dec_blk_2way)
+SYM_TYPED_FUNC_START(camellia_dec_blk_2way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
Index: linux-2.6/arch/x86/crypto/serpent-avx-x86_64-asm_64.S
===================================================================
--- linux-2.6.orig/arch/x86/crypto/serpent-avx-x86_64-asm_64.S
+++ linux-2.6/arch/x86/crypto/serpent-avx-x86_64-asm_64.S
@@ -9,6 +9,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/frame.h>
 #include "glue_helper-asm-avx.S"
 
@@ -656,7 +657,7 @@ SYM_FUNC_START_LOCAL(__serpent_dec_blk8_
 	RET;
 SYM_FUNC_END(__serpent_dec_blk8_avx)
 
-SYM_FUNC_START(serpent_ecb_enc_8way_avx)
+SYM_TYPED_FUNC_START(serpent_ecb_enc_8way_avx)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
@@ -674,7 +675,7 @@ SYM_FUNC_START(serpent_ecb_enc_8way_avx)
 	RET;
 SYM_FUNC_END(serpent_ecb_enc_8way_avx)
 
-SYM_FUNC_START(serpent_ecb_dec_8way_avx)
+SYM_TYPED_FUNC_START(serpent_ecb_dec_8way_avx)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
@@ -692,7 +693,7 @@ SYM_FUNC_START(serpent_ecb_dec_8way_avx)
 	RET;
 SYM_FUNC_END(serpent_ecb_dec_8way_avx)
 
-SYM_FUNC_START(serpent_cbc_dec_8way_avx)
+SYM_TYPED_FUNC_START(serpent_cbc_dec_8way_avx)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
Index: linux-2.6/arch/x86/crypto/twofish-x86_64-asm_64-3way.S
===================================================================
--- linux-2.6.orig/arch/x86/crypto/twofish-x86_64-asm_64-3way.S
+++ linux-2.6/arch/x86/crypto/twofish-x86_64-asm_64-3way.S
@@ -6,6 +6,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 
 .file "twofish-x86_64-asm-3way.S"
 .text
@@ -220,7 +221,7 @@
 	rorq $32,			RAB2; \
 	outunpack3(mov, RIO, 2, RAB, 2);
 
-SYM_FUNC_START(__twofish_enc_blk_3way)
+SYM_TYPED_FUNC_START(__twofish_enc_blk_3way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
@@ -269,7 +270,7 @@ SYM_FUNC_START(__twofish_enc_blk_3way)
 	RET;
 SYM_FUNC_END(__twofish_enc_blk_3way)
 
-SYM_FUNC_START(twofish_dec_blk_3way)
+SYM_TYPED_FUNC_START(twofish_dec_blk_3way)
 	/* input:
 	 *	%rdi: ctx, CTX
 	 *	%rsi: dst
Index: linux-2.6/arch/x86/crypto/twofish-x86_64-asm_64.S
===================================================================
--- linux-2.6.orig/arch/x86/crypto/twofish-x86_64-asm_64.S
+++ linux-2.6/arch/x86/crypto/twofish-x86_64-asm_64.S
@@ -8,6 +8,7 @@
 .text
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm-offsets.h>
 
 #define a_offset	0
@@ -202,7 +203,7 @@
 	xor	%r8d,		d ## D;\
 	ror	$1,		d ## D;
 
-SYM_FUNC_START(twofish_enc_blk)
+SYM_TYPED_FUNC_START(twofish_enc_blk)
 	pushq    R1
 
 	/* %rdi contains the ctx address */
@@ -255,7 +256,7 @@ SYM_FUNC_START(twofish_enc_blk)
 	RET
 SYM_FUNC_END(twofish_enc_blk)
 
-SYM_FUNC_START(twofish_dec_blk)
+SYM_TYPED_FUNC_START(twofish_dec_blk)
 	pushq    R1
 
 	/* %rdi contains the ctx address */
Index: linux-2.6/arch/x86/lib/clear_page_64.S
===================================================================
--- linux-2.6.orig/arch/x86/lib/clear_page_64.S
+++ linux-2.6/arch/x86/lib/clear_page_64.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <linux/export.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 
 /*
@@ -14,7 +15,7 @@
  * Zero a page.
  * %rdi	- page
  */
-SYM_FUNC_START(clear_page_rep)
+SYM_TYPED_FUNC_START(clear_page_rep)
 	movl $4096/8,%ecx
 	xorl %eax,%eax
 	rep stosq
@@ -22,7 +23,7 @@ SYM_FUNC_START(clear_page_rep)
 SYM_FUNC_END(clear_page_rep)
 EXPORT_SYMBOL_GPL(clear_page_rep)
 
-SYM_FUNC_START(clear_page_orig)
+SYM_TYPED_FUNC_START(clear_page_orig)
 	xorl   %eax,%eax
 	movl   $4096/64,%ecx
 	.p2align 4
@@ -44,7 +45,7 @@ SYM_FUNC_START(clear_page_orig)
 SYM_FUNC_END(clear_page_orig)
 EXPORT_SYMBOL_GPL(clear_page_orig)
 
-SYM_FUNC_START(clear_page_erms)
+SYM_TYPED_FUNC_START(clear_page_erms)
 	movl $4096,%ecx
 	xorl %eax,%eax
 	rep stosb
Index: linux-2.6/arch/x86/lib/copy_page_64.S
===================================================================
--- linux-2.6.orig/arch/x86/lib/copy_page_64.S
+++ linux-2.6/arch/x86/lib/copy_page_64.S
@@ -3,6 +3,7 @@
 
 #include <linux/export.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/cpufeatures.h>
 #include <asm/alternative.h>
 
@@ -13,7 +14,7 @@
  * prefetch distance based on SMP/UP.
  */
 	ALIGN
-SYM_FUNC_START(copy_page)
+SYM_TYPED_FUNC_START(copy_page)
 	ALTERNATIVE "jmp copy_page_regs", "", X86_FEATURE_REP_GOOD
 	movl	$4096/8, %ecx
 	rep	movsq
Index: linux-2.6/arch/x86/lib/memmove_64.S
===================================================================
--- linux-2.6.orig/arch/x86/lib/memmove_64.S
+++ linux-2.6/arch/x86/lib/memmove_64.S
@@ -8,6 +8,7 @@
  */
 #include <linux/export.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/cpufeatures.h>
 #include <asm/alternative.h>
 
@@ -26,7 +27,7 @@
  * Output:
  * rax: dest
  */
-SYM_FUNC_START(__memmove)
+SYM_TYPED_FUNC_START(__memmove)
 
 	mov %rdi, %rax
 
Index: linux-2.6/arch/x86/lib/memset_64.S
===================================================================
--- linux-2.6.orig/arch/x86/lib/memset_64.S
+++ linux-2.6/arch/x86/lib/memset_64.S
@@ -3,6 +3,7 @@
 
 #include <linux/export.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/cpufeatures.h>
 #include <asm/alternative.h>
 
@@ -28,7 +29,7 @@
  * only for the return value that is the same as the source input,
  * which the compiler could/should do much better anyway.
  */
-SYM_FUNC_START(__memset)
+SYM_TYPED_FUNC_START(__memset)
 	ALTERNATIVE "jmp memset_orig", "", X86_FEATURE_FSRS
 
 	movq %rdi,%r9
Index: linux-2.6/arch/x86/lib/msr-reg.S
===================================================================
--- linux-2.6.orig/arch/x86/lib/msr-reg.S
+++ linux-2.6/arch/x86/lib/msr-reg.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
 #include <linux/errno.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/msr.h>
 
@@ -12,7 +13,7 @@
  *
  */
 .macro op_safe_regs op
-SYM_FUNC_START(\op\()_safe_regs)
+SYM_TYPED_FUNC_START(\op\()_safe_regs)
 	pushq %rbx
 	pushq %r12
 	movq	%rdi, %r10	/* Save pointer */


