Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E91E521E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473420; cv=none; b=imwdfBlD0DJuVwLnggLhzYyemfZwWB+Br6iIeM1PGnPuZmnMIBv57OQCKwvftmbdgnxH8s59sTJLCmV9wX4viyDi0u7uqkuvAVK2Mf1PH31imPiAOLWVn6NGVuzqKhh6ikEilEWe+ccLDjj8oNVIjY56Aa/drLtIDSjRinV0j+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473420; c=relaxed/simple;
	bh=LrYCuiDJiGB848WGTFaxS545ElR8sRVOtr/mTgwPJn4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HyKq1oXYFrjDJt4lys2b7XNrN4vQDCFNbvCM2lSCWMGw5yMbJMIeBnnwagJkbrTWuQg3bw7EhZw89dTsYyQ08gpTflR2I/qHAYG++r6BjTdX6Hr5lCy2ke9QOIjqDsHQv3XDtyPIquLtL2os2BysfEOutAKc7y4IrJtAQLHrZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zJOzmc1i; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zJOzmc1i"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441c96c1977so18505235e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473417; x=1748078217; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvPK23kMajR02E8bh8W17jGFJeTrq3SL6S8Nz/0H/6g=;
        b=zJOzmc1ip/PAoOShiv0hPgsQ5pgjBo4lpe0+EvVNk6eQQeiW0nuDAH8KfhrS39vQik
         V9uRdzFy6y/iJcOnuMIjMAXvVrwPTZqI8miRdGu3uPyypGz5kaJ7VWqWhMxrxNd9nbc5
         TxNxDHiE1s0BGlYouteKwDwIOfm/CdpOEsNsURl0+vRqLK7ASy32t17zCxYBwBRyy6F/
         IsUfD49vvan7i9tmzMFgtIsRn51ig8T4MWzEiX+RYUHakgOxRt6IuYUUJkuf8MJSv1rC
         z1fyUS5SE0Tiy4rHA5U9EKMSakZ9CmT3B+QVQUwF+ful2TojdGWkN+RjlknSB1//g/eF
         IZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473417; x=1748078217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvPK23kMajR02E8bh8W17jGFJeTrq3SL6S8Nz/0H/6g=;
        b=hkZosJvW9hM4uNPNWF8BNvsgErR1Gwpm9OnfJiXyIMpeT9Dr+4D0BraWKuDFVHqX0U
         OsvZshJRCHIjprvs+qxVV8uUKXEGivXQyuD/l6Ce6EFjS1Iqtz3r0sCtoJxkEQbSDbss
         ek3dLp2kFkON51tcQXxxTKV2M8CxFcgzZFjmH1QNvNEMmK0aZprw8vobTnhizL35+htv
         vr9YPThlMuLDlGe8vIC0G7tjWmLUCuCfAQG65zsChFqNrIsFXeAhr5x0p1eLOMjOyUCd
         6zNOwZJSRHpi847DtP3xAPfPRVSgXA1gxkLI5KeC76r2dFMPJYoLz/f69N7SX5EVmvjI
         +XNA==
X-Gm-Message-State: AOJu0Yy04hby65swiBZB1o6/G2Gjs31/XQrkEc/KC31HXpI8WM7U4IKP
	yIZ93H3dRJ1s09bMKb0TohvTc0bXRsaLJUGnEpA1O4nBG3WJdly4vWVVnuPG+sEcg414UIjMziv
	/fc9MhoStILAEO+yAssIp/3dg8tJSBtBT2S9YiAX+8anq7+BeSbsDzndQD/a1Eigq+pJRAK4cEP
	kIOJzgvbgbevaGUsga0N/9I+ai6I/TzsGJZw==
X-Google-Smtp-Source: AGHT+IHgcrTX567r8tsWZ4BIFPA+SZMwnFNqHDNGcBlQeKcxYYes6HeXNfVSIa4ZFft89GzjSotTfp5e
X-Received: from wmrn39.prod.google.com ([2002:a05:600c:5027:b0:440:5e01:286b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1881:b0:39a:cb5b:78fe
 with SMTP id ffacd0b85a97d-3a35fe952cdmr4466053f8f.34.1747473417221; Sat, 17
 May 2025 02:16:57 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:44 +0200
In-Reply-To: <20250517091639.3807875-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896; i=ardb@kernel.org;
 h=from:subject; bh=9ddViHhv7qt25KUQb0TRCKOa0MYESX6EDtdopTEwpsc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+PfHN9d2Z0r82uh9/4Hn83vLjI0dTKfpPeGI05u/5
 WCtpmNuRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIvwjD/9roxvnih5Lm7L29
 xLOBn+vagzClLzxTd3wOTv4r4BkVuI/hN/tTPQXD36L3Q5tucjQ8Olb+cZ/dm0lJzPN3fsjqeP/ tHDcA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-12-ardb+git@google.com>
Subject: [PATCH v4 4/6] x86/boot: Set 5-level paging CPU cap before entering C code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In order for pgtable_l5_enabled() to be reliable wherever it is used and
however early, set the associated CPU capability from asm code before
entering the startup C code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/cpufeature.h | 12 +++++++++---
 arch/x86/kernel/cpu/common.c      |  3 ---
 arch/x86/kernel/head_64.S         | 13 +++++++++++++
 3 files changed, 22 insertions(+), 6 deletions(-)

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
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 7392a75d85c3..6846a83fa1b6 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1752,9 +1752,6 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 	setup_clear_cpu_cap(X86_FEATURE_PCID);
 #endif
 
-	if (native_read_cr4() & X86_CR4_LA57)
-		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
-
 	detect_nopl();
 }
 
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 069420853304..21a713fac86c 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -27,6 +27,7 @@
 #include <asm/fixmap.h>
 #include <asm/smp.h>
 #include <asm/thread_info.h>
+#include <asm/cpufeature.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -58,6 +59,18 @@ SYM_CODE_START_NOALIGN(startup_64)
 	 */
 	mov	%rsi, %r15
 
+	/*
+	 * Set the X86_FEATURE_5LEVEL_PAGING capability before calling into the
+	 * C code, to give it a consistent view of any global pseudo-constants
+	 * that are derived from pgtable_l5_enabled().
+	 */
+	mov	%cr4, %rax
+	btl	$X86_CR4_LA57_BIT, %eax
+	jnc	0f
+
+	setup_force_cpu_cap X86_FEATURE_5LEVEL_PAGING
+0:
+
 	/* Set up the stack for verify_cpu() */
 	leaq	__top_init_kernel_stack(%rip), %rsp
 
-- 
2.49.0.1101.gccaa498523-goog

