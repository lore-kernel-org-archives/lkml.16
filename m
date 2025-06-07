Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B420D4E3
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290622; cv=none; b=lTdG+mpvM2l0pAqEAJN3N7uTgFf0tLQAqoYgpLs1Dc1YVkJLQpaTqBucKtILZao18ZWQF10mgaBubIBZuFwEjv7YVA+PHUiEs87U94787u3dnz8s1seJEabthUDskmEznN85N+C4r2B9buOxPQZDSIjWE6Ifl5LpCdCM0a6fk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290622; c=relaxed/simple;
	bh=i+OfsPwLoK5azu0EdY+IsK9gunqujhn7UxYgkkXzcKc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=QMEiY+OtzLsfaY60wsTmCkdJKlLxKzEgJX/NOBqZui/EwyJ0P54sjiFmGUuT0Abe+di0crPqir4WCSDioGo8KSJ53dAuyOQRkUBaWb4lufvw53LbEkaS9uwA/4DLv1th52Z0lmKu72LfiT8CSkeGDaqL6W2emt9UvJqfI9GdiK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kg+8tAMh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kg+8tAMh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=H5XuaI4M2quwYMvzlGKb3RXWYbNYp0xBI+Jvaliu4Hk=; b=kg+8tAMhRDRepDJJe3NguKC4MA
	SuAVdrmB2OpQduG/bvgOHAqT23Nc5L1mVeLavVpGAyRsVMJwI+sH4cpGOzQzCbfI9jGr0r6WBeve0
	z2NBROlec14JJWCLiPq+PE23iivHFZI7SNU8bpp/OKM6jJEPOEF81HILX0nuE+QsoqDlfVh2waLJa
	aqOaLBrW1wqqLNn+SXNwl0e99YoTHRzMGAYh5Nn4M38VDRwYksHT7kPsdusxs8Ozh5S23TzUR/Wsf
	rhvWABdo6bpccauhfBD+B2ReCg6sEQGcFTbVQVgA/3LqkP8W7P+t/0WzOLL0kPdMoq2UBkmIy6w+z
	+a9/rruA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqOn-00000006HYV-2HhU;
	Sat, 07 Jun 2025 10:03:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id A14EB308637; Sat,  7 Jun 2025 12:03:35 +0200 (CEST)
Message-ID: <20250607095619.149445852@infradead.org>
User-Agent: quilt/0.66
Date: Sat, 07 Jun 2025 11:42:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [PATCH 10/11] x86: Clean up default rethunk warning
References: <20250607094224.104791182@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Replace the funny __warn_thunk thing with a more regular WARN_ONCE()
and simplify the ifdeffery.

Notably this avoids RET from having recursive RETs (once from the
thunk and once from the C function) -- recurive RET makes my head hurt
for no good reason.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/entry.S               |    4 ----
 arch/x86/include/asm/nospec-branch.h |    2 --
 arch/x86/kernel/cpu/bugs.c           |    5 -----
 arch/x86/lib/retpoline.S             |   22 +++++++++++++++-------
 4 files changed, 15 insertions(+), 18 deletions(-)

--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -13,8 +13,6 @@
 #include <asm/cpufeatures.h>
 #include <asm/nospec-branch.h>
 
-#include "calling.h"
-
 .pushsection .noinstr.text, "ax"
 
 /* Clobbers AX, CX, DX */
@@ -61,8 +59,6 @@ EXPORT_SYMBOL_GPL(mds_verw_sel);
 
 .popsection
 
-THUNK warn_thunk_thunk, __warn_thunk
-
 /*
  * Clang's implementation of TLS stack cookies requires the variable in
  * question to be a TLS variable. If the variable happens to be defined as an
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -386,8 +386,6 @@ extern void clear_bhb_loop(void);
 
 extern void (*x86_return_thunk)(void);
 
-extern void __warn_thunk(void);
-
 #ifdef CONFIG_MITIGATION_CALL_DEPTH_TRACKING
 extern void call_depth_return_thunk(void);
 
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -3415,8 +3415,3 @@ ssize_t cpu_show_indirect_target_selecti
 	return cpu_show_common(dev, attr, buf, X86_BUG_ITS);
 }
 #endif
-
-void __warn_thunk(void)
-{
-	WARN_ONCE(1, "Unpatched return thunk in use. This should not happen!\n");
-}
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -12,6 +12,7 @@
 #include <asm/percpu.h>
 #include <asm/frame.h>
 #include <asm/nops.h>
+#include <asm/bug.h>
 
 	.section .text..__x86.indirect_thunk
 
@@ -416,6 +417,19 @@ EXPORT_SYMBOL(its_return_thunk)
 
 #endif /* CONFIG_MITIGATION_ITS */
 
+        .pushsection        .rodata.str1.1
+.Lwarn:
+        .string "Unpatched return thunk in use.\n"
+	.popsection
+
+/*
+ * Helper that will trip WARN_ONCE() after alternatives have ran.
+ */
+#define ALT_WARN_RETHUNK						\
+	ANNOTATE_REACHABLE ;						\
+	1: ALTERNATIVE "", "ud2", X86_FEATURE_ALWAYS ;			\
+	ASM_BUGTABLE_FLAGS(1b, .Lwarn, 0, 0, BUGFLAG_WARNING | BUGFLAG_ONCE )
+
 /*
  * This function name is magical and is used by -mfunction-return=thunk-extern
  * for the compiler to generate JMPs to it.
@@ -432,15 +446,9 @@ EXPORT_SYMBOL(its_return_thunk)
 SYM_CODE_START(__x86_return_thunk)
 	UNWIND_HINT_FUNC
 	ANNOTATE_NOENDBR
-#if defined(CONFIG_MITIGATION_UNRET_ENTRY) || \
-    defined(CONFIG_MITIGATION_SRSO) || \
-    defined(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)
-	ALTERNATIVE __stringify(ANNOTATE_UNRET_SAFE; ret), \
-		   "jmp warn_thunk_thunk", X86_FEATURE_ALWAYS
-#else
+	ALT_WARN_RETHUNK
 	ANNOTATE_UNRET_SAFE
 	ret
-#endif
 	int3
 SYM_CODE_END(__x86_return_thunk)
 SYM_PIC_ALIAS(__x86_return_thunk)


