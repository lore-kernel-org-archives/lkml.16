Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631411DFE04
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931313; cv=none; b=J1Zo2VVd9pFoVvQZgdlx2IuzBJ97TpiJ1IVYRW8gITJQ6sVEc2L1IrMeVpam3xsTJ4VmYjKQUSusIy0HxltdrB+czT08YzvJHA+FQGtVPUPAgnFe9IZBN+TtaOQKhfnj6cOPuNRFZ+y4C4AcxDBxpwitsCKnCBt3MdSdod1+XXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931313; c=relaxed/simple;
	bh=XvNpgsUYXXKn3GS7s8clOJ4znqcbSSqGxW1VJsuwa8o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=q1NDf79sDA43g2y/gJ9nctJIO1PfjbCoNyV5QoBnyWfx2fZ4nqMGQY3M5EJkDYb/ZHmG72iHUkPbhAFJabblxzgP+N4CVEXTJ5SkDvBcL4Ku+hdGL7rBYysSyxt9asGuWrisxebMC0lHQxrLM/Oh9SpgqGawjUoJb2zTPab2DGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X0dlSdZ7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X0dlSdZ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=qQYv110ck7jBvbbLipQh+0XWA1ymIh2E1606AKuN1Ic=; b=X0dlSdZ77pTEGXc7j74IOYrCTO
	uwR/ZAOn3j59pBlPq+Wuykts8VShz7ZtymM/e3xWI1YmbPUkUdNAyGD2KemZRf+IPQdwkpzCPbymE
	rYmblMaevin3QyQmywb/M71ffDWFcRJWihf8+pm6ixCWmjDtpaG7rJWeO4+f93RCPUyO6jb4g+v78
	532RtcalDO088xvoE7pxExIW3EM0hvtOJrkKaQ6yE1J3KmyU6C+gibP5tL8sx2GgFpX7ttZVJ8rAd
	yfMes32HlN//1JpHSoTSMd3Sg26sCpOk6W8iUc97MfqWcWe1UfhUi9riwZbuVmgZp6RxI84DJjbtf
	jXIShYlw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNTA-00000007nBw-0W3v;
	Fri, 07 Feb 2025 12:28:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 451F930615B; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122547.022463564@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:39 +0100
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
Subject: [PATCH 10/11] x86: BHI stubs
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/cfi.h |    3 +
 arch/x86/lib/Makefile      |    3 -
 arch/x86/lib/bhi.S         |  130 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+), 1 deletion(-)

--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -101,6 +101,9 @@ enum cfi_mode {
 
 extern enum cfi_mode cfi_mode;
 
+typedef u8 bhi_thunk[32];
+extern bhi_thunk __bhi_args[];
+
 struct pt_regs;
 
 #ifdef CONFIG_CFI_CLANG
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -66,5 +66,6 @@ endif
         lib-y += clear_page_64.o copy_page_64.o
         lib-y += memmove_64.o memset_64.o
         lib-y += copy_user_64.o copy_user_uncached_64.o
-	lib-y += cmpxchg16b_emu.o
+        lib-y += cmpxchg16b_emu.o
+        lib-y += bhi.o
 endif
--- /dev/null
+++ b/arch/x86/lib/bhi.S
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/linkage.h>
+#include <asm/unwind_hints.h>
+#include <asm/nospec-branch.h>
+
+/*
+ * Notably, the FineIBT preamble calling these will have ZF set and r10 zero.
+ *
+ * The very last element is in fact larger than 32 bytes, but since its the
+ * last element, this does not matter,
+ */
+
+.pushsection .noinstr.text, "ax"
+
+	.align 32
+SYM_CODE_START(__bhi_args)
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_0, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_1, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_2, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	cmovne %r10, %rsi
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_3, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	cmovne %r10, %rsi
+	cmovne %r10, %rdx
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_4, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	cmovne %r10, %rsi
+	cmovne %r10, %rdx
+	cmovne %r10, %rcx
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_5, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	cmovne %r10, %rsi
+	cmovne %r10, %rdx
+	cmovne %r10, %rcx
+	cmovne %r10, %r8
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_6, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	cmovne %r10, %rsi
+	cmovne %r10, %rdx
+	cmovne %r10, %rcx
+	cmovne %r10, %r8
+	cmovne %r10, %r9
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_INNER_LABEL(__bhi_args_7, SYM_L_LOCAL)
+	ANNOTATE_NOENDBR
+	UNWIND_HINT_FUNC
+	jz 1f
+	ud2
+1:	cmovne %r10, %rdi
+	cmovne %r10, %rsi
+	cmovne %r10, %rdx
+	cmovne %r10, %rcx
+	cmovne %r10, %r8
+	cmovne %r10, %r9
+	cmovne %r10, %rsp
+	ANNOTATE_UNRET_SAFE
+	ret
+	int3
+
+	.align 32
+SYM_CODE_END(__bhi_args)
+
+.popsection


