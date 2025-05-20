Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2E27CCE3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737732; cv=none; b=NNiaUxZPjT61nTRhfl+QVJ0+7waco+pN/sP7VS24T/psRAMJhNaz0KsCeb4StMsLD4HcvrABVn9DxFeWi2DY/C9iviSMr55vceuKfIGrfl90dcWdx/6KNludlDggGSZN7PcsqVChHF0klCqx8sd021XN52BFRuJSxnKvuNYSWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737732; c=relaxed/simple;
	bh=smcEn5xuoSoyzet+/jPXo0e2FShvYyfWm91gjV2aYQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mEfs5/YNppvrFg0vDYWd/ZATDHMvHNO8XOYtLsiewpesC/eprqtSqMC4vdXSzCsviwhikwiFF6KwxFNFYJ6Ssni/BGNSvgDVOfSXWolcQaq7HB9UWk7W3ZQlVyy+28IqRp8DdCVmJWZb/HI6END13J7jnhUWP1NDen6FNdgzC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1lKOooIa; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1lKOooIa"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a36e6b7404so1420511f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737728; x=1748342528; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahzczk0+naUyrZTVIcCeBV1wVjE8c2wdirB75pAPflg=;
        b=1lKOooIa+F+428vJLAF2LOEvGtpPPayECPhvqjclNh/aRiMkvn3INmDe24jmeSdUCr
         0MulQ0tA/caw92B1shQYrvLdUwJzhNWtJ5TyYtdmeuQjnY6serv+cT3HrnB/9c06pqdU
         gKLIrTkuCsDUGWkKoR4E5W/RaJqiGgdIxWLAVGSo42YBQbnxzvFUtHcCcb/D3W3Hv1x2
         1GN4AaqMl7gxsgB3rEo6Bljg1bxrkLl2wmT10n+xuobOPKARgHsgQBWkUvaudeumxoXj
         HOumdpWiEq1NeDobApGC4PSVSef50MgG5AdSBAickKopdp00nIzzFxTWEyQztfAoeeky
         GEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737728; x=1748342528;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahzczk0+naUyrZTVIcCeBV1wVjE8c2wdirB75pAPflg=;
        b=KmutzYgmZbnSvRPDV7mxCOAhZVGf4/h94sMWEhCHu6xy8r9P2HgzL2hxoDNtjJ99RN
         z+KhPI89BWvS82cwUgoatVHlZLINgUlIjwE8iPdFPXboAWLnaqGJpQg8dtDoXKSF8jjJ
         L9l6365CD6qZUM4mRPsKgczFVCtGYhZ33gD9OAqYSFFOKDPGj6/kdMi46Mn7I3QrFPzF
         p6V0QW0J/p4ElPkFJQ2s3ToAzJlSXUgFA5AZsTf2hNtdN336/Un60e8atHohhYzKdTBY
         867Yzur3RpynOMKmIjuRoTefmSg7F6mFjH2FWGRZDz7ni1k6OeIvmgSmXPgLZRlpeXzH
         j2Vg==
X-Gm-Message-State: AOJu0Yxaw+Dny3ZBU8Vbovb/aiw0jt7/qsBMRGsV9d1ybwzRLG6R7oBz
	zqOjpVGH3otRDCMSTO7PWK+DpDu2DTOaXIJo3uJBzcZcJGWasC2eoMb0zqFhvCzCrRG4CxuPxDo
	lFQ8AVVaoirLn3NmAZDcjFUhlyh7xX76bj/lj7DmHP+AcrOeenmDSbECfd2Lm71mKFhv7tA0d7G
	YPxcqcAi1mogteXBVDSzK6tcrD9INNfhv+Tw==
X-Google-Smtp-Source: AGHT+IFf3Tl0mziMJzrvVu3v7W+x4TcXzDK5XfPPwOZpt3YclGoVMb0E1M3KDk0vyqCgQ+WbgLaGP5uu
X-Received: from wmbbd17.prod.google.com ([2002:a05:600c:1f11:b0:442:ddf8:99dc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40dd:b0:3a3:77d7:a669
 with SMTP id ffacd0b85a97d-3a377d7a688mr2969030f8f.52.1747737728564; Tue, 20
 May 2025 03:42:08 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:45 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4047; i=ardb@kernel.org;
 h=from:subject; bh=AeoaX0bk1REUaKBmW4W6OvWZS0AahPeIlF2xjdvR5c8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnJi/h8fSewhcBrV7bRcodfty/qG1cafTK9054Vz5je
 2vPqXsdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIcexn+l7MJlrk1lq3a+luW
 X7aX93nqdFOZBJd0ufsPWjSCTj44yPDPJizk+V9+Ps/dumdaDwa5K14wYKlWe8MuUP6r1EKsgIU DAA==
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-15-ardb+git@google.com>
Subject: [PATCH v5 6/7] x86/boot: Drop 5-level paging related global variable
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The variable __pgtable_l5_enabled is no longer used so it can be
dropped.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         |  1 -
 arch/x86/boot/compressed/pgtable_64.c   |  6 ------
 arch/x86/boot/startup/map_kernel.c      | 16 +---------------
 arch/x86/include/asm/pgtable_64_types.h |  2 --
 arch/x86/kernel/head64.c                |  2 --
 5 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 7f79c426f542..d6860b50afaf 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -190,7 +190,6 @@ static inline int count_immovable_mem_regions(void) { return 0; }
 #endif
 
 /* ident_map_64.c */
-extern unsigned int __pgtable_l5_enabled;
 extern void kernel_add_identity_map(unsigned long start, unsigned long end);
 
 /* Used by PAGE_KERN* macros: */
diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index 965fca150e68..4772919411a9 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -10,9 +10,6 @@
 #define BIOS_START_MIN		0x20000U	/* 128K, less than this is insane */
 #define BIOS_START_MAX		0x9f000U	/* 640K, absolute maximum */
 
-/* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
-unsigned int __section(".data") __pgtable_l5_enabled;
-
 /* Buffer to preserve trampoline memory */
 static char trampoline_save[TRAMPOLINE_32BIT_SIZE];
 
@@ -118,9 +115,6 @@ asmlinkage void configure_5level_paging(struct boot_params *bp, void *pgtable)
 	if (!cmdline_find_option_bool("no5lvl") &&
 	    native_cpuid_eax(0) >= 7 && (native_cpuid_ecx(7) & BIT(16))) {
 		l5_required = true;
-
-		/* Initialize variables for 5-level paging */
-		__pgtable_l5_enabled = 1;
 	}
 
 	/*
diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 5d3c6108f1c3..328a343bc355 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -14,20 +14,6 @@
 extern pmd_t early_dynamic_pgts[EARLY_DYNAMIC_PAGE_TABLES][PTRS_PER_PMD];
 extern unsigned int next_early_pgt;
 
-static inline bool check_la57_support(void)
-{
-	/*
-	 * 5-level paging is detected and enabled at kernel decompression
-	 * stage. Only check if it has been enabled there.
-	 */
-	if (!(native_read_cr4() & X86_CR4_LA57))
-		return false;
-
-	__pgtable_l5_enabled	= 1;
-
-	return true;
-}
-
 static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
 						    pmdval_t *pmd,
 						    unsigned long p2v_offset)
@@ -97,7 +83,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	bool la57;
 	int i;
 
-	la57 = check_la57_support();
+	la57 = pgtable_l5_enabled();
 
 	/* Is the address too large? */
 	if (physaddr >> MAX_PHYSMEM_BITS)
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index ed847a90cf4f..3c56b98b87b0 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -22,8 +22,6 @@ typedef unsigned long	pgprotval_t;
 typedef struct { pteval_t pte; } pte_t;
 typedef struct { pmdval_t pmd; } pmd_t;
 
-extern unsigned int __pgtable_l5_enabled;
-
 #ifndef pgdir_shift
 DECLARE_PER_CPU_CACHE_HOT(u8, __pgdir_shift);
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 5e5da6574a83..137c93498601 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -48,8 +48,6 @@ unsigned int __initdata next_early_pgt;
 SYM_PIC_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
-unsigned int __pgtable_l5_enabled __ro_after_init;
-
 unsigned long page_offset_base __ro_after_init = __PAGE_OFFSET_BASE_L4;
 EXPORT_SYMBOL(page_offset_base);
 unsigned long vmalloc_base __ro_after_init = __VMALLOC_BASE_L4;
-- 
2.49.0.1101.gccaa498523-goog

