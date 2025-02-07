Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D951E0DE5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931313; cv=none; b=MQse8PekR2LOTI1DPWex66t+uZZ6zOkC1k60/btF9YYFAM91xU3eYpfidAPlOBbQ4+vx1i+nbAh6kxt2NlL78pTdcnF0M+RRt1ZLjpuoYEhoXTyK1rR7YZSW7k2kWtpGGZm3wHAVyGht+UFuJmR+NQGQcR5gHuOkBOqRQvfpnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931313; c=relaxed/simple;
	bh=6Q1bNawOVx4uNLkKUtLr5ZKzVL0qJcYQRtjgWlkEBLo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=L9Y+QAerGHs8U3yzyZ41CNnhHs5SiO/9tRfOtCcQ7a3IhBxYvWDo1dZpdslWLlvR4B6YhaC2U34aYqS91KK/Edlh0AF9eJ4chr1aTA4qAcmJzTXEmOpIICOuy4Kr0h2E2oMRT8qMNfZNMmpJkJLuAkrD71CGJ/2aP4xh5UUpgQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MrzKa/jY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MrzKa/jY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=8YwrG2M1NyVkR8ph2MYJ1NCP71F6/4x9C2wwGwvDUvk=; b=MrzKa/jYlpQsyAYsJzfAdOJ/qC
	Ri9HhwVgXMNWyh2ZRFO8wnzJZL4lAfoHGnsWI3EVJHYIl6nqIHcKZhmqP+vxOZLMgEMZmTWK9TMGg
	3Mcrf+Jj0/4Ptl10QNeCIF6W0zYHbPPaFFrii4j4KljgzX5yNRgB3tpzJJcFl43NXzJBau9jgLxh5
	cpcZgl519PtkFewpmt9ymhUPdR1zrn0IWEVJePj4MQX+X31pYn71vdzuUP0FJoFI3L/cO1tSUfsq+
	BSEzerLdY7NotinxayWPSRde5NXxPeqU5PB6GmrKWz5/W8/4huYlMoqdRInaZhW6VYNM/sfZh0CVU
	hwcAM3RA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT8-0000000HAec-3FsO;
	Fri, 07 Feb 2025 12:28:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 328C130088D; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.509520369@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:34 +0100
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
Subject: [PATCH 05/11] x86/boot: Mark start_secondary() with __noendbr
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The handoff between the boot stubs and start_secondary() are before IBT is
enabled and is definitely not subject to kCFI. As such, suppress all that for
this function.

Notably when the ENDBR poison would become fatal (ud1 instead of nop) this will
trigger a tripple fault because we haven't set up the IDT to handle #UD yet.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/kernel/smpboot.c |    3 ++-
 include/linux/objtool.h   |    4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -229,7 +229,7 @@ static void ap_calibrate_delay(void)
 /*
  * Activate a secondary processor.
  */
-static void notrace start_secondary(void *unused)
+static void notrace __noendbr start_secondary(void *unused)
 {
 	/*
 	 * Don't put *anything* except direct CPU state initialization
@@ -314,6 +314,7 @@ static void notrace start_secondary(void
 	wmb();
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }
+ANNOTATE_NOENDBR_SYM(start_secondary);
 
 /*
  * The bootstrap kernel entry code has set these up. Save them for
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -128,7 +128,7 @@
 #define UNWIND_HINT(type, sp_reg, sp_offset, signal) "\n\t"
 #define STACK_FRAME_NON_STANDARD(func)
 #define STACK_FRAME_NON_STANDARD_FP(func)
-#define __ASM_ANNOTATE(label, type)
+#define __ASM_ANNOTATE(label, type) ""
 #define ASM_ANNOTATE(type)
 #else
 .macro UNWIND_HINT type:req sp_reg=0 sp_offset=0 signal=0
@@ -147,6 +147,8 @@
  * these relocations will never be used for indirect calls.
  */
 #define ANNOTATE_NOENDBR		ASM_ANNOTATE(ANNOTYPE_NOENDBR)
+#define ANNOTATE_NOENDBR_SYM(sym)	asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
+
 /*
  * This should be used immediately before an indirect jump/call. It tells
  * objtool the subsequent indirect jump/call is vouched safe for retpoline


