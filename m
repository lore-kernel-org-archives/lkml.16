Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8A2853ED
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546547; cv=none; b=BxntdT2QXbehoD1PbHFghwJLTtbsFUKTq6P5XgCoqcIjd3de+9FwU9iwFdQJaIWZ0jfGwi3Qu0SogyC+1/jL67Feoqp5z4GzNNNrS0uT3SBAFVp1xDd/bWeOwG0S3b2VjnG/Z33DtKcZdaMk7LAaaiDbv+K6vj6tKeek01owyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546547; c=relaxed/simple;
	bh=5FLQksRYxIIEgXvt5dxKOv/P/ympY2aNPNmlglbj4S4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RDeFA7x5ZE0Vs4Dv87IXC47poxHtMjzRcwDXxEpR6xQPm9WBim341kQ8IR/vUl4/o72mTSPkMzYWbVnow8NSv7y79Tx8+DeLAdTl1yMjAg7xqPiMpXI+Si2lWymROF907ULXyVdHwLhwfu6idJ9z1cN5gavjc7dxuHh8Qief4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwYqx3AH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwYqx3AH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-441c96c1977so18036645e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746546544; x=1747151344; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXF4lSq4pEH5WEeWrXsCjVhC4xi+x1v4jlvmj9R+uac=;
        b=TwYqx3AHw0+wZqhtcgQn/IObRFYcwSIgIPVnMJQ1eCQwRniVMS6YGH9z1ih8oAXhkk
         kgMvIrF9JuHb0ajlEWUCkjeUXDiGSj3tao1F1/RjWMJVH9qEuSJgYRtrMqSFjKAB5rQq
         M/SLnEz5WuLrkgAIFpJYpHL0Ecz0IiE4PA1+uiJG6d10AKqRMPQfAlqj/cFwZvX6TZwb
         PmMLUsUVXjLQyut/8SGuyYKiS74BF77AyNdnNudq3IFqPbC+OXWsDh83k03OPtYyHzkM
         n2V2RWMwDq/afvYQzl9snKsaR8OaeHYrrmnXLmvmmrcRfd0p5rkCnYbOdPoIlM6D6cug
         lnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546544; x=1747151344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXF4lSq4pEH5WEeWrXsCjVhC4xi+x1v4jlvmj9R+uac=;
        b=OiyLLnWmYJCgXwMn0qQlGDQ4lml/xy4D5vMVzmHpJiNEw34K+W7NxTfOK6YnyYK1iu
         /NPfhCV8EkHRIlrEPjgU71Xhh8eiT+U4Iy/PaPH9QtjWj/nzcypuRqDCezL6l9PD44eG
         NKf+D1YSAembrAI6bP4KmYLWH/C+FKEgj0MWwvMyZlSqGYCXxtcCfMAxEYXWNZhUMeIg
         b0IgEYOhS1Pt4fqyJFBTvEUHB6vg1125qBdnVMMZpS77WYOcC+1dQIeUk1dC69gk4Apv
         FNzyCXFs4uFPxrhO2KeR/5xviZkonanik9lQRgD21pmzjkicziuFgPJF4YiamOmvIaU+
         kioQ==
X-Gm-Message-State: AOJu0Yz11Ku1MHhFr4nxsXbTorEmc/qwkJCl994Q+fdnx0ZTP4ZV+Ilx
	m8hqm7uWmqspOrCzHsXXT75Vq5dZDM7nIpI8srVr4UjxWbPDXenImF0dOVZB1/vl1eYLMEekC6D
	xllaxfdgua+wPzhRcPzDWKYDfuRXB4g44QyAJnPNFrQdE7k4hpAzJ9BJ5aAkbOB8dK2s7vBycj4
	3KXBTKnrMZDGMCViyGXFLzYtsJpheLKg==
X-Google-Smtp-Source: AGHT+IGhRWf4IrC+peWhhLkChuzm1fS8AAwbvzj5rCnpHD4gn8/Y9h8DypG2zuCqKD3tOQI31MsQrKX2
X-Received: from wmbfk13.prod.google.com ([2002:a05:600c:ccd:b0:43c:f6c0:3375])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2905:b0:3a0:82d4:ba90
 with SMTP id ffacd0b85a97d-3a0b4888e94mr19463f8f.21.1746546544019; Tue, 06
 May 2025 08:49:04 -0700 (PDT)
Date: Tue,  6 May 2025 17:45:34 +0200
In-Reply-To: <20250506154532.1281909-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7382; i=ardb@kernel.org;
 h=from:subject; bh=GMIIanHrqEMp7uk3UiKd+WhQc2Cc8mbf4u6A/So+Zjs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNKb97e6wJuu6or9ny/9L1WWFLyi+hDV9VzM7pEjk83W
 cm+9vaHjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRz+kM/8PTCrc/Y/324Ylx
 8g/emochTvGn338TmVy9+x3f0sjrr00ZGSafcFq5ek396u79D/iXuUy+p7jzys4jRRdyxONy7di Lq/kA
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250506154532.1281909-6-ardb+git@google.com>
Subject: [RFC PATCH 1/3] x86/boot: Use a single source of truth for pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

There are two versions of pgtable_l5_enabled(): an early one based on a
global variable that is set by the startup code, and a late on that is
based on the LA57 CPU capability.

Some objects opt into the early version if they contain code that may
run before CPU capabilities are determined, and will therefore always
use the early alternative, even if some of the code is still in use at
runtime.

Having two sources of truth also creates transient problems with KASAN,
as KASAN_SHADOW_START is defined in terms of pgtable_l5_enabled(), and
may therefore assume different values depending on the source file and
the moment during boot that it gets evaluated.

Fix this by collapsing the two into a single definition that always
produces the correct value, and can be used by all source files. Use
alternatives patching so that the runtime cost of it is identical to the
old implementation based on cpu_feature_enabled().

This also removes the need to temporarily disable KASAN when patching
alternatives.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         |  3 ---
 arch/x86/boot/compressed/vmlinux.lds.S  |  2 ++
 arch/x86/boot/startup/sme.c             |  9 -------
 arch/x86/include/asm/pgtable_64_types.h | 26 ++++++++++++--------
 arch/x86/kernel/alternative.c           | 12 ---------
 arch/x86/kernel/cpu/common.c            |  2 --
 arch/x86/kernel/head64.c                |  5 +---
 arch/x86/mm/kasan_init_64.c             |  3 ---
 8 files changed, 19 insertions(+), 43 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index db1048621ea2..9c3d2da8f86c 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -16,9 +16,6 @@
 
 #define __NO_FORTIFY
 
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 /*
  * Boot stub deals with identity mappings, physical and virtual addresses are
  * the same, so override these defines.
diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
index 3b2bc61c9408..32a1ee4e5681 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -35,6 +35,7 @@ SECTIONS
 		*(.text)
 		*(.text.*)
 		*(.noinstr.text)
+		*(.altinstr_aux)
 		_etext = . ;
 	}
 	.rodata : {
@@ -81,6 +82,7 @@ SECTIONS
 		*(.dynamic) *(.dynsym) *(.dynstr) *(.dynbss)
 		*(.hash) *(.gnu.hash)
 		*(.note.*)
+		*(.altinstructions .altinstr_replacement)
 	}
 
 	.got.plt (INFO) : {
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index 753cd2094080..c791f6b8a92f 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -25,15 +25,6 @@
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS
 
-/*
- * This code runs before CPU feature bits are set. By default, the
- * pgtable_l5_enabled() function uses bit X86_FEATURE_LA57 to determine if
- * 5-level paging is active, so that won't work here. USE_EARLY_PGTABLE_L5
- * is provided to handle this situation and, instead, use a variable that
- * has been set by the early boot code.
- */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/mem_encrypt.h>
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 5bb782d856f2..2ca568f56660 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -24,19 +24,25 @@ typedef struct { pmdval_t pmd; } pmd_t;
 extern unsigned int __pgtable_l5_enabled;
 
 #ifdef CONFIG_X86_5LEVEL
-#ifdef USE_EARLY_PGTABLE_L5
-/*
- * cpu_feature_enabled() is not available in early boot code.
- * Use variable instead.
- */
+#include <asm/alternative.h>
+#include <asm/cpufeatures.h>
+
 static inline bool pgtable_l5_enabled(void)
 {
-	return __pgtable_l5_enabled;
+	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feat], "", "jmp %l[t_no]")
+		"	.pushsection .altinstr_aux,\"ax\"	\n"
+		"6:	testb	$1, %a[l5en]			\n"
+		"	jnz	%l[t_yes]			\n"
+		"	jmp	%l[t_no]			\n"
+		"	.popsection				\n"
+		: : [feat] "i" (X86_FEATURE_LA57),
+		    [l5en] "i" (&__pgtable_l5_enabled)
+		: : t_yes, t_no);
+t_yes:
+	return true;
+t_no:
+	return false;
 }
-#else
-#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
-#endif /* USE_EARLY_PGTABLE_L5 */
-
 #else
 #define pgtable_l5_enabled() 0
 #endif /* CONFIG_X86_5LEVEL */
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index bf82c6f7d690..f4a8b81aac43 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -456,16 +456,6 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 	DPRINTK(ALT, "alt table %px, -> %px", start, end);
 
-	/*
-	 * In the case CONFIG_X86_5LEVEL=y, KASAN_SHADOW_START is defined using
-	 * cpu_feature_enabled(X86_FEATURE_LA57) and is therefore patched here.
-	 * During the process, KASAN becomes confused seeing partial LA57
-	 * conversion and triggers a false-positive out-of-bound report.
-	 *
-	 * Disable KASAN until the patching is complete.
-	 */
-	kasan_disable_current();
-
 	/*
 	 * The scan order should be from start to end. A later scanned
 	 * alternative code can overwrite previously scanned alternative code.
@@ -533,8 +523,6 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 		text_poke_early(instr, insn_buff, insn_buff_sz);
 	}
-
-	kasan_enable_current();
 }
 
 static inline bool is_jcc32(struct insn *insn)
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f0f85482a73b..7b8753224f3e 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
 
 #include <linux/memblock.h>
 #include <linux/linkage.h>
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 510fb41f55fc..498b9d6bdf2f 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -5,9 +5,6 @@
  *  Copyright (C) 2000 Andrea Arcangeli <andrea@suse.de> SuSE
  */
 
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/types.h>
@@ -52,7 +49,7 @@ SYM_PIC_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
 #ifdef CONFIG_X86_5LEVEL
-unsigned int __pgtable_l5_enabled __ro_after_init;
+unsigned int __pgtable_l5_enabled __initdata;
 unsigned int pgdir_shift __ro_after_init = 39;
 EXPORT_SYMBOL(pgdir_shift);
 unsigned int ptrs_per_p4d __ro_after_init = 1;
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d216..7c4fafbd52cc 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) "kasan: " fmt
 
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/memblock.h>
 #include <linux/kasan.h>
 #include <linux/kdebug.h>
-- 
2.49.0.987.g0cc8ee98dc-goog

