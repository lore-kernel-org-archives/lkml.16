Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8E239099
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875841; cv=none; b=Nc3YpJ0Gl4JrKWHkBuFXHPiKtwLc1auolD8gJGkMQE73YgTSuHdwL+lv9Tt1BCk0I2yNb3+RYJ/nxMtxD8oc+vX5kSv2YasULo9WEPcrvnPhgwWnnKb+YtrIN4OtH0SN9W9/cAOIrqwEeysfxCAK4Fd3IXpp6PSnrPHuXota1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875841; c=relaxed/simple;
	bh=ArGqYqLAPAwYcAf5/soqdMotxidfgLg0HCKUX+WdmsU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HdsxkPcygPynWK/vGHybiUScpByyySyVI8UalYxvvKZx8sheAD1KbiV23CElVXsYaR5TovX1KrEU0luvh4xe1lX2mx2/RPn3RMUgyObOUo7vE6YrQE1SvnAXO0eJ8K7r+9+tDgbBNXGzrlzoEuLCi3uHFIwP1kZRYo3JsjemBWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Rr0vZ+y1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Rr0vZ+y1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=69eKPMKauwr5SrpkkD7307Ri6VHkmTkjx6DQ3rxMAyA=; b=Rr0vZ+y154c6de0eVfQK5ZZvnq
	nkZ+Q98GTYjKZRetaekSAnnJHNGUUN38OTgpS7VBKtpsJUr/zrcEPMvBtVstyp/NLKLYIB/5GiDod
	OXaitPg0Q+UMDsxU6aJjUS24dMToOpyJHTxE3rwEyAmxvYTftRLv/l0zXsuSSPheQlarwrgKKsq4M
	DlP12tLjv9cqA3MMw7N266EGWhl8WF+aSJg9A62bp+QviefOLuARJ51b53sMwNaZFjABBTn7fdF9I
	1ImeSCqVTX7ShCQqPNcy8PyMZx4vzL6PCQ/OFCMk12O/cyqwcULJOQEfLhyf6IzbLn0GtyXB8M9HC
	kVahMgLg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Um-00000000dlJ-26x5;
	Mon, 02 Jun 2025 14:50:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 247083080C5; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144756.163540221@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 8/8] x86: Clean up default rethunk warning
References: <20250602144201.301974933@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Bad-Reply: References but no 'Re:' in Subject.

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
 arch/x86/lib/retpoline.S             |   24 +++++++++++++++++-------
 4 files changed, 17 insertions(+), 18 deletions(-)

--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -13,8 +13,6 @@
 #include <asm/cpufeatures.h>
 #include <asm/nospec-branch.h>
 
-#include "calling.h"
-
 .pushsection .noinstr.text, "ax"
 
 /* Clobbers AX, CX, DX */
@@ -53,8 +51,6 @@ EXPORT_SYMBOL_GPL(mds_verw_sel);
 
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
 
@@ -416,6 +417,21 @@ EXPORT_SYMBOL(its_return_thunk)
 
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
+	1: ALTERNATIVE "", "ud2", X86_FEATURE_ALWAYS ;			\
+	ASM_BUGTABLE_FLAGS(1b, .Lwarn,					\
+	                   0, 0, BUGFLAG_WARNING |			\
+	                   BUGFLAG_ONCE | BUGFLAG_FORMAT) ;		\
+	ANNOTATE_REACHABLE
+
 /*
  * This function name is magical and is used by -mfunction-return=thunk-extern
  * for the compiler to generate JMPs to it.
@@ -432,15 +448,9 @@ EXPORT_SYMBOL(its_return_thunk)
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


