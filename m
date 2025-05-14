Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D72274FC2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219396; cv=none; b=CUtOB/8VFgVOQL5Pou1VXZ73RkkYWPqbHP3nBBY1Y0yny/d041xtyMe/je8C0xfg6gJD9GXYGCQ7hoM1wzfp3CUEhYmD7FCRAY7aopG7qZpkxQ5WWkMVlTH5ws8wUPhW1zvlvJV9IspTy1TmPpNM0kru2j8uneNv4DgxkO+krXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219396; c=relaxed/simple;
	bh=wVgytFlfrZYDQdk7biHLFWpfSUdJ1/Hab/NTcZzWFsE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MavVAcpIF/ZmwhM2gyEfnuG4FsYWGqdm5dpIt47TA6akto7kSYrBbWrU2BqSZCV1ieuyq3yKFJcQNN2osYwctw8uDhxH33zC6bnh31mA08BNDwJHPsh2+MSW0jq97tIwznvp/WnlOsUzMeJyFABPxhVCmslIy8CHu9wp9s4TP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C4gNuFur; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4gNuFur"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a0b6cb5606so3061184f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219392; x=1747824192; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWJj8+iqJAgJOO5WqllK6FIvG4mC5sXfm+BBNrQO94U=;
        b=C4gNuFurX07oEhTN+azdqQx+KKGIRxMmzieLHUYQsJXEe4aFxG3EJgJZlra5k0cXm9
         wa1B2ZBS0ZKchgq4v4C2mR8JoqXLwtVDBp/SsStNOptx1cIAJOivJxOrysRku5kaa9lK
         afVETKTje0HjtvB3oenN/xN5Ek7K2XEP6CbRbO6wlEKdD6IyePwrT5SbddClER+Rkwki
         LWO+JJ/GzqGbr1ZvPMh55MAN2mjOmyylI0iUsd2LBtV+lBhCHtPcewLYbn7D9leKfOkF
         rrstck9sjXjupTGkGJKtT+iE1N+YKx6/S8ibBuAUfl4/kH9kKfcrRYzSx9p+O7Mq/Mc8
         XsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219392; x=1747824192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWJj8+iqJAgJOO5WqllK6FIvG4mC5sXfm+BBNrQO94U=;
        b=wrXzJQvIA1fkWlv6qSOUfWuooXW08fMmRoq7VVDK40mj+yDNTWAnvq/x1Q1cyWvAY3
         aLP75ALlckzrfx/rTNBcPjVNbkKaxfjua02iCPFK9rnRvMWzfFOTQ0q1rQCkiSUlTDjH
         6k4jOjB6h7LEtPqd2yeSEyXByfchG57NgTusJ4XIYWQ4AxEsLmg22NQFlH1rll11ml1y
         MNrbIVdLLsj9bvxpfZlWNevr7lkgbOrNL7q2u+/RAYXeLOUbI1TIyc45MKQom9MIvqCk
         ZrDga966sc7go4xpoiVo3pseBlLKi6eLyUCuUR6rzGf7jOVmoFFrctJ6vjGSUd5N8Plc
         9HDA==
X-Gm-Message-State: AOJu0YzBpIF9HG9P6KIvaiPxLOj3HRK5z4I+kibOgh5VzrLjXTFIETn/
	/gUZJkJuYHyzmF8gPXYaHbcvOmKp8/kcSoxBWVEyRaFftgzLtTsifoCWNYVf2gf/8jSpwWhsG/a
	q1+Ju3a5X9fgzBBHV34VyybzObMIbaT1MEJcGQspGmbhRjo7BEXvcrjd4f0uJRTqWA7htFm09ij
	JgoFTDYsnlyZn90WC61lr5AaUXzf6K2A==
X-Google-Smtp-Source: AGHT+IEKogkGnauwUE1wTbaou6kMGdNu8wrl6JgiLLpViruNP1QShp21+4kbLzoUYQ9q/gzJRYLmr5+j
X-Received: from wmbfl10.prod.google.com ([2002:a05:600c:b8a:b0:440:68cb:bd4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40c9:b0:391:39fb:59c8
 with SMTP id ffacd0b85a97d-3a3496c1ebdmr2427927f8f.25.1747219392654; Wed, 14
 May 2025 03:43:12 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:49 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5643; i=ardb@kernel.org;
 h=from:subject; bh=ZJqS2ncMmT4amBTlidYVOfxHc+2GJc7TrdutOHDYkMc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleNUXpb8B/58wSixdnbvr7JJ0Yf7dFg/OuMoXRcT9u
 sf4ZnZWRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIUiMjwwGZjPI4q0af+Q8c
 2WV8Nu7ck/x/ssj9l/f+f8jmtGhscGf4X/T/ku+XKq07U9eG2gv7CXbukpyxkGPVowx+i+1rii+ ksQAA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-15-ardb+git@google.com>
Subject: [PATCH v3 6/7] x86/boot: Drop 5-level paging related variables and
 early updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The variable __pgtable_l5_enabled is no longer used so it can be
dropped.

Along with it, drop ptrs_per_p4d and pgdir_shift, and replace any
references to those with expressions based on pgtable_l5_enabled(). This
ensures that all observers see values that are mutually consistent.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         |  1 -
 arch/x86/boot/compressed/pgtable_64.c   | 12 -----------
 arch/x86/boot/startup/map_kernel.c      | 21 +-------------------
 arch/x86/include/asm/pgtable_64_types.h |  9 ++-------
 arch/x86/kernel/head64.c                |  8 --------
 5 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 72b830b8a69c..3d5c6322def8 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -190,7 +190,6 @@ static inline int count_immovable_mem_regions(void) { return 0; }
 #endif
 
 /* ident_map_64.c */
-extern unsigned int __pgtable_l5_enabled, pgdir_shift, ptrs_per_p4d;
 extern void kernel_add_identity_map(unsigned long start, unsigned long end);
 
 /* Used by PAGE_KERN* macros: */
diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index 5a6c7a190e5b..591d28f2feb6 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -10,13 +10,6 @@
 #define BIOS_START_MIN		0x20000U	/* 128K, less than this is insane */
 #define BIOS_START_MAX		0x9f000U	/* 640K, absolute maximum */
 
-#ifdef CONFIG_X86_5LEVEL
-/* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
-unsigned int __section(".data") __pgtable_l5_enabled;
-unsigned int __section(".data") pgdir_shift = 39;
-unsigned int __section(".data") ptrs_per_p4d = 1;
-#endif
-
 /* Buffer to preserve trampoline memory */
 static char trampoline_save[TRAMPOLINE_32BIT_SIZE];
 
@@ -127,11 +120,6 @@ asmlinkage void configure_5level_paging(struct boot_params *bp, void *pgtable)
 			native_cpuid_eax(0) >= 7 &&
 			(native_cpuid_ecx(7) & (1 << (X86_FEATURE_LA57 & 31)))) {
 		l5_required = true;
-
-		/* Initialize variables for 5-level paging */
-		__pgtable_l5_enabled = 1;
-		pgdir_shift = 48;
-		ptrs_per_p4d = 512;
 	}
 
 	/*
diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 905e8734b5a3..056de4766006 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -14,25 +14,6 @@
 extern pmd_t early_dynamic_pgts[EARLY_DYNAMIC_PAGE_TABLES][PTRS_PER_PMD];
 extern unsigned int next_early_pgt;
 
-static inline bool check_la57_support(void)
-{
-	if (!IS_ENABLED(CONFIG_X86_5LEVEL))
-		return false;
-
-	/*
-	 * 5-level paging is detected and enabled at kernel decompression
-	 * stage. Only check if it has been enabled there.
-	 */
-	if (!(native_read_cr4() & X86_CR4_LA57))
-		return false;
-
-	__pgtable_l5_enabled	= 1;
-	pgdir_shift		= 48;
-	ptrs_per_p4d		= 512;
-
-	return true;
-}
-
 static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
 						    pmdval_t *pmd,
 						    unsigned long p2v_offset)
@@ -102,7 +83,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	bool la57;
 	int i;
 
-	la57 = check_la57_support();
+	la57 = pgtable_l5_enabled();
 
 	/* Is the address too large? */
 	if (physaddr >> MAX_PHYSMEM_BITS)
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 3e94da790cb7..dc3a08b539d8 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -21,8 +21,6 @@ typedef unsigned long	pgprotval_t;
 typedef struct { pteval_t pte; } pte_t;
 typedef struct { pmdval_t pmd; } pmd_t;
 
-extern unsigned int __pgtable_l5_enabled;
-
 #ifdef CONFIG_X86_5LEVEL
 #ifndef pgtable_l5_enabled
 #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING)
@@ -31,9 +29,6 @@ extern unsigned int __pgtable_l5_enabled;
 #define pgtable_l5_enabled() 0
 #endif /* CONFIG_X86_5LEVEL */
 
-extern unsigned int pgdir_shift;
-extern unsigned int ptrs_per_p4d;
-
 #endif	/* !__ASSEMBLER__ */
 
 #ifdef CONFIG_X86_5LEVEL
@@ -41,7 +36,7 @@ extern unsigned int ptrs_per_p4d;
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
  */
-#define PGDIR_SHIFT	pgdir_shift
+#define PGDIR_SHIFT	(pgtable_l5_enabled() ? 48 : 39)
 #define PTRS_PER_PGD	512
 
 /*
@@ -49,7 +44,7 @@ extern unsigned int ptrs_per_p4d;
  */
 #define P4D_SHIFT		39
 #define MAX_PTRS_PER_P4D	512
-#define PTRS_PER_P4D		ptrs_per_p4d
+#define PTRS_PER_P4D		(pgtable_l5_enabled() ? MAX_PTRS_PER_P4D : 1)
 #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK		(~(P4D_SIZE - 1))
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 84b5df539a94..68f6a31b4d8e 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -48,14 +48,6 @@ unsigned int __initdata next_early_pgt;
 SYM_PIC_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
-#ifdef CONFIG_X86_5LEVEL
-unsigned int __pgtable_l5_enabled __ro_after_init;
-unsigned int pgdir_shift __ro_after_init = 39;
-EXPORT_SYMBOL(pgdir_shift);
-unsigned int ptrs_per_p4d __ro_after_init = 1;
-EXPORT_SYMBOL(ptrs_per_p4d);
-#endif
-
 #ifdef CONFIG_DYNAMIC_MEMORY_LAYOUT
 unsigned long page_offset_base __ro_after_init = __PAGE_OFFSET_BASE_L4;
 EXPORT_SYMBOL(page_offset_base);
-- 
2.49.0.1101.gccaa498523-goog

