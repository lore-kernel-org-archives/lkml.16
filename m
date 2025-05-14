Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EBC2749CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219394; cv=none; b=PWgY4q6cXDLkZS2hzu/IwmUVeMN4uW9m6eGGbv/dGGo+1aEqaT36ARukcGfYwOKeFD6FdgDyEDxhSoBRR1vvA5+kMpp1ZGnGV6OIJSn9OvV+TzPmExMKcapZyBfDd2UBoRabnE/pSkQ1N7H9BYj321KqmLp6R6WxZpvst5nSvlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219394; c=relaxed/simple;
	bh=xxoNEMSTUCYLsCNwLM9WUsxu7gCDKHVup2TQhrh3AoA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=itPLPEuQYJQXRx1PHtZJjP6sxuWUNa0GSbh/9WqVeUU78xy7CZ2H4tttB80yGHGnmvHZksNIFr8qrpPFibaM8x1ZQfj82BjSnNi1ySm0wcOgBKxrz40SDhm7TrHTdOq3nc5EA5djzn+3xgteqS5AXdtn4fzoMfsw6emnQQqnl70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4I2UHtM2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4I2UHtM2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so32305065e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219390; x=1747824190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KoCln9Dir8XSG1+T49pb7GLSaixX/5M9T2Zma60JTSY=;
        b=4I2UHtM2ZwB1pbLjbsOQgVM9oFnRH5QRZMiKHa1t/RBUhLhtCnWglJvIpffKp2+RFJ
         nQAdPhXoCCC8L4P4snjjCFr+/p7aRUZx6dzsUSGS9PrMShT+qGR6Cb+9YKuJuKTwaZ/R
         gXDKMoNrhyqohwpS6HfJVapiCtQnP0rSXe92BrBY3/9pdBoG54Cw5zvery1Gp2C+t9EO
         ykgL9eSb5Gev4FFsImopEshKikCV5WfBKcBtqKzkO1i2UvL5ffAMRDxUKwf+FOlEqh6W
         JbFyqjiCVs+cYcVM4Te+2XYrC8GdAjik3d14YLfpiBAhiToFvbYbXNlSuP9ceOLrWcSt
         2isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219390; x=1747824190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoCln9Dir8XSG1+T49pb7GLSaixX/5M9T2Zma60JTSY=;
        b=chNfmZToZ7+0I5iLjkcC9fRR4oap4buW7sFBowd8ooPybXpB9FjUWoxbKkDEqwnEqk
         SGRBBSBr+AxrtSA1iqMPCPfhqBs172FuW1yqw1ooVKX5J0RH+J3+uvxPMS8hdfms6eIH
         8CQA1SagsLWNZXwm9tNCbRj3l0EitxeA2RLKfqimPnUsZr4o6DvGCxr4APjH5l/v3vrc
         DodofnNPswKdjdxVUSdBAsn9Jji9ANbAMVVzgpi2b6FkE/8PcpJ1HOuo6zbXW4p9BtEu
         JOR7wk/gXoCgocJlw1Kq7xJLGwUXB+3HTqYXZKZI7iZZLUFFA8k5VIHUNdt3+xDNWD8x
         a9tA==
X-Gm-Message-State: AOJu0YxDaJX8dfPeNBgDuiPy1yGBQBFWEbxxCMbwS5SWGwlBQfNzW9UX
	kkN7yEHsle+cdYqEl1hNFOHBpn7pubrYNVbUHzb1kBUu/AbhihXBho16hINV62YgO+I65CVM9fx
	YIDEtJcQFnxlZFwRMTlzRQLfHom4qYVM71sk1Q179aMaqVevS9/csMp0C4iMKoFJJTy4QGtwKzJ
	mafTkfKctCOxXRMnDsTz3U0RL7NEzitA==
X-Google-Smtp-Source: AGHT+IFVekG9SdJs73x4qWOsN3ineFqG79bfgsNiuf/qRSGuIOZSQJ9IVALPJiKp04XquGiIKH1rfm56
X-Received: from wmbfm5.prod.google.com ([2002:a05:600c:c05:b0:43d:4ba5:b5d6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8012:b0:43d:82c:2b11
 with SMTP id 5b1f17b1804b1-442f216074bmr22373505e9.23.1747219390733; Wed, 14
 May 2025 03:43:10 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:48 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5778; i=ardb@kernel.org;
 h=from:subject; bh=yugaVGpx7jAlY4kkCR2uhnsWUOwUL6x2MzNG/46sYME=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleKXozk0RO2ttLs8ufTbPy6XMapf/qhKPrWeP+Wdck
 9x4WeNfRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiI30GG/xFBVhJdAdOuNH+e
 G7kv+kuGntCj08bz0l7/Vj2/5kqf8x6Gf5orXZ0+Z6qrnOiqb1b8d7zeeC3zi+qzekzHmE51VsQ tZQcA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-14-ardb+git@google.com>
Subject: [PATCH v3 5/7] x86/boot: Drop the early variant of pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
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
index 70ea1748c0a7..a6c25d005991 100644
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
index d31ae12663bb..3e94da790cb7 100644
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
index 2385528792b2..e39823d8d1ae 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -589,16 +589,6 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
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
@@ -666,8 +656,6 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
 
 		text_poke_early(instr, insn_buff, insn_buff_sz);
 	}
-
-	kasan_enable_current();
 }
 
 static inline bool is_jcc32(struct insn *insn)
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index c8954dc2fb26..08a586606e24 100644
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
2.49.0.1101.gccaa498523-goog

