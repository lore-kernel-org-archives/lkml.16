Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4428D8DF
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134744; cv=none; b=emlSqJM8aECAh0q2PDBuxIUX5CwIyxuPf0BsJZDJoAapQxI4ZIfNyFBse8OitaFw15U9WKkKvpiZluU2OqF8pqHkJEFCGHOYgHw1csVEcLsn6KG3vpqLAD2Xw7P+6jmBA4MdNbqo9kRIai6HhFcTMNLtLCpbaeWmEYZU2SDgACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134744; c=relaxed/simple;
	bh=/otbjljyOWw0mpgcPxCo5xMQ7Y+NFUvSH6e6PfiY9Q8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S/wculW5BhcQ+FbDuZxHIQCF7xdUnFLbK11TGl3VvJ2yao/osanKqsgxjtlFYgaS0x4rM10puChngUFw2fAIEWGIwjiCXGxQFGOfXb6qPPNbuFYhBFEu/JeaiPqvlZPtz4kfx4+4xVYEniE3ol2AF76tAf+72bUYKKRkfj4TZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0GV0gaRh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0GV0gaRh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so28475595e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134740; x=1747739540; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SAYpIXNnR+AmlE/t9wgpjF89DkEAXCG+Ztf2OXxlSPs=;
        b=0GV0gaRhXv2V8/aL7NTy8I4YzmPPDazV9arzrjixVF07ExgKEW9pDQd385VR0PIZXP
         DzbXNy5OLcgABjbsCZoKbI8ztix9YByXuOw4SyTmmL6nPNF0h344Dni91xFPqYIJw77Q
         FCf+OQAqdzO6Da5Et7V2mLHM+Qai25PGcFKbUCkSsDUTTLfm6LAIyihSMlByTjsaRbgg
         P56N3cszfKjVn7xSV29468e3X98rEtnWFaEqFAKCAtxiT7NhV6GVxdTSblKl3OwjDB93
         VXth148NE3OkrzqmzTng6pR3iRROjyqPXtK8hPlXxEh4J0SNOoJm9x8GaJ/WhgeEsG+P
         kBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134740; x=1747739540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAYpIXNnR+AmlE/t9wgpjF89DkEAXCG+Ztf2OXxlSPs=;
        b=V4FIdkjYsjSNBuhnClgRs9RGhwEJzI+nl8MjQLdFKAfoGUKpLDQcU+eoSbBASHe3r1
         DWMG+jFXyyR2bk4URK1AInCxUm1v6YIoSDEYiSNnXQ+WNFxj4QpCKek1tKeMI7ov75XI
         vpKBTsP5f4hBT86xpL6dXBwZ5bFWsuRM+A0efFKZYbN2DiXMXTJ8ngXnhmJFmZgp7jiN
         MDAxxz8PLO7p6j8Vv6CSj8wOcXYzd5CUbeuf+avPdF11cuBnA2wwSt6NTtQO+iHUbhpH
         kkpH1vcjy95Y3zikNRVp0SuixLdBIocOyIjhjZFZ570dCA+1LlH1R4duYS9771Vaij05
         caIw==
X-Gm-Message-State: AOJu0YyVlNN71J5Dm+hyOJR+g2U9CIkT6eCWsKrCNBAZrq9QyjKtk0yh
	RZIIRsj5M0WmaJ4PJHhGSRvLsZdzgRxnao88rA5n4Tk5VwPzdhRJ8tgiivpjPJQaqQlvDslFhNN
	QWuLDie/CcpHSrW0GVNohJVkmYFoniagyRBqAEr58a1YSRKLl8dGbwySuIFrH01O/Xswm5qn/0k
	kEqrpaB+19+q+g7xc973/9wh60dqHpRw==
X-Google-Smtp-Source: AGHT+IFt5PSCcOC0+ikPBQdDo1XaZ3CAUrpM1xnhokHORtbwjon7haTdiVems+KqyFhVBkO1UYlhcxNf
X-Received: from wmbei9.prod.google.com ([2002:a05:600c:3f09:b0:441:aaa8:fb65])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3586:b0:43c:f85d:1245
 with SMTP id 5b1f17b1804b1-442d9cacc19mr143906065e9.17.1747134740472; Tue, 13
 May 2025 04:12:20 -0700 (PDT)
Date: Tue, 13 May 2025 13:12:03 +0200
In-Reply-To: <20250513111157.717727-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5778; i=ardb@kernel.org;
 h=from:subject; bh=xwv05gUBGQB+6b5sVJVLL3t/PSiOFjAnhqzD0OrgXww=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZkyU2h5VtiW7N5EhHjr++h2b7n2aatCu5/+1qkdz3W
 Rb2WUEdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCLvGxkZ/sy686ZVNp/h7hNN
 7+xtKT+nSwnsOWu+5//KOLFNp3tKShj+cPT2G2tWvV8qZyuaslhL9lh3vlKdo/LJvd9eHTGK2vG OFQA=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-13-ardb+git@google.com>
Subject: [RFC PATCH v2 5/6] x86/boot: Drop the early variant of pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) is guaranteed to
produce the correct value even during early boot, there is no longer a
need for an early variant and so it can be dropped.

For the decompressor, fall back to testing the CR4.LA57 control register
bit directly.

Note that this removes the need to disable KASAN temporarily while
applying alternatives, given that any constant or VA space dimension
derived from pgtable_l5_enabled() will now always produce a consistent
value.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         |  7 ++++---
 arch/x86/boot/startup/sme.c             |  9 ---------
 arch/x86/include/asm/pgtable_64_types.h | 14 ++------------
 arch/x86/kernel/alternative.c           | 12 ------------
 arch/x86/kernel/cpu/common.c            |  2 --
 arch/x86/kernel/head64.c                |  3 ---
 arch/x86/mm/kasan_init_64.c             |  3 ---
 7 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index db1048621ea2..72b830b8a69c 100644
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
@@ -28,6 +25,10 @@
 #define __pa(x)  ((unsigned long)(x))
 #define __va(x)  ((void *)((unsigned long)(x)))
 
+#ifdef CONFIG_X86_5LEVEL
+#define pgtable_l5_enabled() (native_read_cr4() & X86_CR4_LA57)
+#endif
+
 #include <linux/linkage.h>
 #include <linux/screen_info.h>
 #include <linux/elf.h>
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
index 88dc719b7d37..83cd6c4b9a3f 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -24,19 +24,9 @@ typedef struct { pmdval_t pmd; } pmd_t;
 extern unsigned int __pgtable_l5_enabled;
 
 #ifdef CONFIG_X86_5LEVEL
-#ifdef USE_EARLY_PGTABLE_L5
-/*
- * cpu_feature_enabled() is not available in early boot code.
- * Use variable instead.
- */
-static inline bool pgtable_l5_enabled(void)
-{
-	return __pgtable_l5_enabled;
-}
-#else
+#ifndef pgtable_l5_enabled
 #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING)
-#endif /* USE_EARLY_PGTABLE_L5 */
-
+#endif
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
index ea49322ba151..e1f8a7de07cc 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
 
 #include <linux/memblock.h>
 #include <linux/linkage.h>
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 14f7dda20954..84b5df539a94 100644
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
2.49.0.1045.g170613ef41-goog

