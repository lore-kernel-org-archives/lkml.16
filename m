Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DE1E7648
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473422; cv=none; b=YA36xeJ4bzGWm1R7pQT1ugBauhv3sNnnxOPCdISch+knwEswR97KL0m7s1q1EqfIk0H9kpC6HERB2kkMcHT/gHzXFCNaRV2v4ONfBWpMGlbdlxA1xDgnkPtlSgHTUXwLWGv3kO0z5M+Kkk3ObrV2Vj94j/EngsgkkOO6Hrulvd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473422; c=relaxed/simple;
	bh=3EwEj/6lMOnvgATJ6r0vVrXxYmo66nwJZa3pw0bSmpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KhRa+ggYnAGVJqilbTuekf3U0B+rA5HG12uaH/Sua1KROlCqQBJU5GHJ1Eg1LG7hg54nNU6HMfwOVaiL71oJfFtvQytryI/PB9GmFpMDeqzIfE7+rN3ifKQF8E5rT2c9VFOkXjwkxuqTh+kWxWyeQSkuVGiDxWQDNOF+8yep4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YAxTjO6t; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YAxTjO6t"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so22261745e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473419; x=1748078219; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x08rrTDWY9cAUMy0PmmEcseVvr8AaWm8xVAdcnsEt+s=;
        b=YAxTjO6t26LDMFzM+qEJNew+m1syZ0eJ+S/1MKOUu1qvu1DtvucOs2uw+6sgSA0P0m
         bzcQxplyARrNtq9AIzywucisDlLZAarBJkIlGs+ShcmG3C5Cv0+3SdIy1aOfcUBygADE
         2F2aBMRXyp784x+0ip1KHaQ/0l+F11SxInBcvMXntqsURZFcvTMdsMSuJJ5YH/BWcBA+
         pHb40K0QI3yjylgV+Z2lFphy/WJRukDr5+ATfTXvXaqc/iJEAOvI5gsFdUmkrNWvlqns
         iH8rncFdlEdNzCGHXjmeVyASCjgU702w2j6/8Z3m0Ll6GhAvY46gwu/HCAJvQBlGEd/L
         FNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473419; x=1748078219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x08rrTDWY9cAUMy0PmmEcseVvr8AaWm8xVAdcnsEt+s=;
        b=lk9uJqrlKNtdWY51TmiW43jusAQtxwDMuo7Mq3vtSjlD2CkKZvhuFHfQFyidYLxSr7
         U4GKEK+a/KxLX5ean4Ovt5JT96SqqZ0dhab8Jy6BiTdwFKqQMAGnMp80b6e7L/UW8BxE
         X6w+h+iBjgbNc/xnRap60wddAptWds4gW/V1B/7Lvi1zuxq/hg39KzDb8+2tyt/3ZCK6
         5+hZ/URrotP99fnB+MqO3NDQYWTZPD7b9xGU8YhZzieftWeuIUW4ete5RaHyrHftqlNX
         40nUdhqUBN/Q/CyhC9fB9NI7NQXyHHQnGHqMx3X47kL0qc0oKqnx+TWK6keZDHpjskZa
         0NBg==
X-Gm-Message-State: AOJu0YzXZA3m2Md4nMIFtdgzz2ZHiwOLkHfTf2E2qOO9hXTyf/lk40bw
	jhBv4qBIlsAfd43CuGgMDh0wLSj69wjVejJ3S5ovb+gf3xzWONWP05VyKmoK9meySjY9XyzNtcE
	lfhVHKbniYOAOTwDELCh2BSdJPUu4Vz0ydcgzqUXdZJUv8zS1ll38M3WmxhytfVIukeXKqCvHC7
	ts3K8GUWToWxmnFQhdogfSexI/0B9Kxq2vwQ==
X-Google-Smtp-Source: AGHT+IHKZJlY9Uv9u+cGzDV11hKu8wrzHdh212AZ6dF6ZNutFJXQwheB6bdOCI8Fb16m2tP/nCBgQxNr
X-Received: from wmsd12.prod.google.com ([2002:a05:600c:3acc:b0:442:cab2:15c3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d81:b0:43c:fc04:6d35
 with SMTP id 5b1f17b1804b1-442fd606b8emr59059445e9.4.1747473419209; Sat, 17
 May 2025 02:16:59 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:45 +0200
In-Reply-To: <20250517091639.3807875-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5985; i=ardb@kernel.org;
 h=from:subject; bh=QLFdRUPvLnW8mE/Zv58BLsDVSP21dwXqh8N0Ru2s09I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+M/2KVzeL2vUeX7wzZHwLzt+9rW/YOmklPzfqe94K
 2/fD2bsKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOZ+IWR4e6aafKHlrCyJd+c
 69vMc3/Lp8qjaa2TzzB4n+OTW/Lc/RzDP5N9G71XX5mzxuAiW3HUNXfu8vs/Z8cevJE63Vzu/T7 BxbwA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-13-ardb+git@google.com>
Subject: [PATCH v4 5/6] x86/boot: Drop the early variant of pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) is guaranteed to
produce the correct value even during early boot, there is no longer a
need for an early variant and so it can be dropped.

For the decompressor, fall back to testing the CR4.LA57 control register
bit directly.

Note that this removes the need to disable KASAN temporarily while
applying alternatives, given that any constant or VA space dimension
derived from pgtable_l5_enabled() will now always consistently produce
the correct value.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         |  5 ++---
 arch/x86/boot/startup/sme.c             |  9 --------
 arch/x86/include/asm/pgtable_64_types.h | 22 ++++----------------
 arch/x86/kernel/alternative.c           | 12 -----------
 arch/x86/kernel/cpu/common.c            |  2 --
 arch/x86/kernel/head64.c                |  3 ---
 arch/x86/mm/kasan_init_64.c             |  3 ---
 7 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index db1048621ea2..65e7ff5d7ded 100644
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
@@ -28,6 +25,8 @@
 #define __pa(x)  ((unsigned long)(x))
 #define __va(x)  ((void *)((unsigned long)(x)))
 
+#define pgtable_l5_enabled() (native_read_cr4() & X86_CR4_LA57)
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
index bf4c33ae24d7..a3f7ec94012b 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -23,29 +23,15 @@ typedef struct { pmdval_t pmd; } pmd_t;
 
 extern unsigned int __pgtable_l5_enabled;
 
-#ifdef CONFIG_X86_5LEVEL
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
-#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING)
-#endif /* USE_EARLY_PGTABLE_L5 */
-
-#else
-#define pgtable_l5_enabled() 0
-#endif /* CONFIG_X86_5LEVEL */
-
 extern unsigned int pgdir_shift;
 extern unsigned int ptrs_per_p4d;
 
 #endif	/* !__ASSEMBLER__ */
 
+#ifndef pgtable_l5_enabled
+#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING)
+#endif
+
 #ifdef CONFIG_X86_5LEVEL
 
 /*
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
index 6846a83fa1b6..65ee1de785ac 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
 
 #include <linux/memblock.h>
 #include <linux/linkage.h>
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 9f617be64fa9..455f12850778 100644
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

