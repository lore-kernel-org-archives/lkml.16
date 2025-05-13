Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1B28C87E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134742; cv=none; b=pbxqlU3kVxEPLeZlv6TcbQcZZO2tN+hHRBNGoBqtKvYE4v+PKM4YfYI74ndQxpgBb2jR+etg81FOI4/QwJhzxsz5B9j3Soj7ed+WkVyKnWFQ18ebGjkZM20YtDmxEwOb5kXZs/G4Lc5UDHIfaAgTRIZ0gXBTxQE0yQcWPLUqUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134742; c=relaxed/simple;
	bh=sbJ8Fw1r90yZtfHFFE9JF4oqF4T7ODzQ/pSatIIn69I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sr7IBRgfKIY5oElDPPOG1nbM2YVDeT0IEUF4P/1hBTrjBS596M7Ia24GYCgv/fNGErfauVdf/XKa1Gtj0LzpkEAUftfUSc7YmkMGq8gKY4uyly4zkTui+DjTVjlsicbU/sbB71sUmBXqtmT9jWlocvJOcEz6UzFm/CdGRlvcoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4SklP7I; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4SklP7I"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a1f9ddf04bso2301442f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134738; x=1747739538; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrcABwo7ZQTn+m5mWd/OtSEyPzIuybBaQHAplVXjEhE=;
        b=P4SklP7IkMjj8zSxKS/J7lQsSGX1d/QUKzNR/d1O8ZaO0gYRPjtvWBT4WvqoEkUZEU
         QKFnQKPeObZoDrq+hvvgmOShkNuBnVcP2ap4/IuGgEt/BB3SYINNAylF6Mf9opLskKxA
         9DfqfBZCMFJpHgpMqR08h8yAovrc9MbqPs1F8682jXlWyAAPWKK5p71Xc7Ry4N0ufkHk
         Yk+8uhTipWPuE79mZvi7ENUBGj8AWbYFzil5j8ebiq9Yq9V4QoOPDZ5rUJgIy5IO3bzQ
         ky7n2/SldLljJdrZZlattK+EJpRbU+w2ir202YpoeKuZ0DkHmPb8vctWCXdEDWJTdW0o
         heYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134738; x=1747739538;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrcABwo7ZQTn+m5mWd/OtSEyPzIuybBaQHAplVXjEhE=;
        b=vt+spq2yvtJRgyOQQm+cb17edRvpdbWBOtgusMZ5S1wjQl1y62jH/06tn7X3zWcVbC
         zoQfdR/wngeRu48T0xmhuiuRi8SMJdoF3+BTXYK/vefsxN4+akSay3lS7n7OgmGC0yue
         hpqV493Y0Jjnrj7eK+mUhmLM4FCT7i0e/PhvhL9lfQTRHFNq7fkL06Uih3S6OOI65GWw
         +PoiNf40ZiMmNYnaxOwycidKY1NjeJjmO1HRP5/P69ZPNeFwL1AVIVcokB4dWDOMJ5tZ
         U6cikMVFKtQWtx05GYagkh/r8gafp7oqoPj+5GX4hFBG6Dryu6rhU36VVq+zlOa+318u
         lr1w==
X-Gm-Message-State: AOJu0YyKH/tvI36bO+Ogcyuba5RZcfPXg8n9DIsqsuANta9UeVmwycUi
	FiB0QRV5p4LoC0eyyZx35fvjaV8d2qzR7g/cT58juNA5bluBdZovzUpFJiMX+m8CYv9P0z5RRjY
	3s0M2flZOjHqQcMOzjfA645Ipirizf6BL79BDJN6dNQZW20zPBwZpMHM3pNdyiUsPDBHxOKnVgO
	uTq3OX+2KOGQJ/H/n/PKWBYazo39Y8YA==
X-Google-Smtp-Source: AGHT+IHI5HQZ+9PFF0vfq7SzZfXG0glKF0P9kl036c9kIW6+c1GIQEQf573tAmGCBebB5nf93P3UElvt
X-Received: from wmbhj9.prod.google.com ([2002:a05:600c:5289:b0:43b:bd03:5d2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f4a:0:b0:3a0:b563:2451
 with SMTP id ffacd0b85a97d-3a1f64276b1mr12064732f8f.5.1747134738590; Tue, 13
 May 2025 04:12:18 -0700 (PDT)
Date: Tue, 13 May 2025 13:12:02 +0200
In-Reply-To: <20250513111157.717727-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4607; i=ardb@kernel.org;
 h=from:subject; bh=9j53WpWB7md8IeK5be3OARrIP92+C+LWx2Fx91Qse0c=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZk5nvXoDgNGEO3hti0/iXqMlP5TleEMI22/p8Ade2E
 GZmS42OUhYGMQ4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJF9BYwMW9YsrMj/zziXvbmz
 K27Nk+ocS6dNkj05j+bIst96dzw7jeF/wk3dA8ZS+gwBu3S+PrvgOKlogmr6L+uMr0uED8YFBZR xAgA=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-12-ardb+git@google.com>
Subject: [RFC PATCH v2 4/6] x86/boot: Set 5-level paging CPU cap before
 entering C code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In order for pgtable_l5_enabled() to be reliable wherever it is used and
however early, set the associated CPU capability from asm code before
entering the startup C code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/cpufeature.h | 12 +++++++++---
 arch/x86/kernel/asm-offsets.c     |  8 ++++++++
 arch/x86/kernel/asm-offsets_32.c  |  9 ---------
 arch/x86/kernel/cpu/common.c      |  3 ---
 arch/x86/kernel/head_64.S         | 15 +++++++++++++++
 5 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 893cbca37fe9..1b5de40e7bf7 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -2,10 +2,10 @@
 #ifndef _ASM_X86_CPUFEATURE_H
 #define _ASM_X86_CPUFEATURE_H
 
+#ifdef __KERNEL__
+#ifndef __ASSEMBLER__
 #include <asm/processor.h>
 
-#if defined(__KERNEL__) && !defined(__ASSEMBLER__)
-
 #include <asm/asm.h>
 #include <linux/bitops.h>
 #include <asm/alternative.h>
@@ -137,5 +137,11 @@ static __always_inline bool _static_cpu_has(u16 bit)
 #define CPU_FEATURE_TYPEVAL		boot_cpu_data.x86_vendor, boot_cpu_data.x86, \
 					boot_cpu_data.x86_model
 
-#endif /* defined(__KERNEL__) && !defined(__ASSEMBLER__) */
+#else /* !defined(__ASSEMBLER__) */
+	.macro	setup_force_cpu_cap, cap:req
+	btsl	$\cap % 32, boot_cpu_data+CPUINFO_x86_capability+4*(\cap / 32)(%rip)
+	btsl	$\cap % 32, cpu_caps_set+4*(\cap / 32)(%rip)
+	.endm
+#endif /* !defined(__ASSEMBLER__) */
+#endif /* defined(__KERNEL__) */
 #endif /* _ASM_X86_CPUFEATURE_H */
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index ad4ea6fb3b6c..6259b474073b 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -33,6 +33,14 @@
 
 static void __used common(void)
 {
+	OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
+	OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
+	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
+	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
+	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
+	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
+	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
+
 	BLANK();
 	OFFSET(TASK_threadsp, task_struct, thread.sp);
 #ifdef CONFIG_STACKPROTECTOR
diff --git a/arch/x86/kernel/asm-offsets_32.c b/arch/x86/kernel/asm-offsets_32.c
index 2b411cd00a4e..e0a292db97b2 100644
--- a/arch/x86/kernel/asm-offsets_32.c
+++ b/arch/x86/kernel/asm-offsets_32.c
@@ -12,15 +12,6 @@ void foo(void);
 
 void foo(void)
 {
-	OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
-	OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
-	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
-	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
-	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
-	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
-	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
-	BLANK();
-
 	OFFSET(PT_EBX, pt_regs, bx);
 	OFFSET(PT_ECX, pt_regs, cx);
 	OFFSET(PT_EDX, pt_regs, dx);
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index aaa6d9e51ef1..ea49322ba151 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1672,9 +1672,6 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 	setup_clear_cpu_cap(X86_FEATURE_PCID);
 #endif
 
-	if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
-		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
-
 	detect_nopl();
 }
 
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 069420853304..b4742942bece 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -27,6 +27,7 @@
 #include <asm/fixmap.h>
 #include <asm/smp.h>
 #include <asm/thread_info.h>
+#include <asm/cpufeature.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -58,6 +59,20 @@ SYM_CODE_START_NOALIGN(startup_64)
 	 */
 	mov	%rsi, %r15
 
+#ifdef CONFIG_X86_5LEVEL
+	/*
+	 * Set the X86_FEATURE_5LEVEL_PAGING capability before calling into the
+	 * C code, so that it is guaranteed to have a consistent view of any
+	 * global pseudo-constants that are derived from pgtable_l5_enabled().
+	 */
+	mov	%cr4, %rax
+	btl	$X86_CR4_LA57_BIT, %eax
+	jnc	0f
+
+	setup_force_cpu_cap X86_FEATURE_5LEVEL_PAGING
+0:
+#endif
+
 	/* Set up the stack for verify_cpu() */
 	leaq	__top_init_kernel_stack(%rip), %rsp
 
-- 
2.49.0.1045.g170613ef41-goog

