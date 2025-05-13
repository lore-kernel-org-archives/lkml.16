Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1307628DB4C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134745; cv=none; b=rgYjJGz8f/9gcy6l75PCE3xe2tM2iOy+nrydgFjISEtUnAqSs53gFgSFbk3im2Ztew/TgcU+d8Y8+F9htGPXHboDNxG9mzyuKDIUAJOUUO/n7u77h+BCh1SocJPCnP04iWcqOjHglmbsIEhNOfW48NKlWVUrkJ4JFVQ5ErWY/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134745; c=relaxed/simple;
	bh=VZ0ZLmOePVFOuTmwTCqhvNytrOl8syhg+VWczGqwaVk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hVi324HqnfKnAlcYjDDf5cUYCyFVtQERUfEdozlu8mPx69qmR1ykcTT7fxIO1ekUcvviiuWjAtXg0OD0j8CnHqjsK/++7lEkdfIKWKUumJ9QO9EOHC0vYXkC1q+SdBhBPMPfgIJQzW1GaN+nP15Gc9a77Uf90BM+JmJpGODBFFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiDcDAea; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiDcDAea"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a0db717b55so2828226f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134742; x=1747739542; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzGj7/7HNCkOX8Jy6N1ShBJ0VGLtjdGMeKMS0UkPr2U=;
        b=GiDcDAeajXCwTYtHjPackOjbUzf2TxNoUtJ5EbQ/oS0Z8vOElAFthCc0wzvUlmA72V
         d9/+7jvQPY2j0lk4jo3soh6tzc4y5UK0LswcbveJHviI5k+Sp0lrOZ4dIfsQqQCI2Vu5
         iOPPgLkHZz9of/y/jz0uwLyBEot3GLpOURW5008FobzXwnBCa+ZDVKOx4S0hx2b+9+sF
         BIfnWGh3oZpMvPQsX4ri5myKRi5dKhgvGFPTiZsRT9I2feXNa/XCh1HtiMNV2mljBzEV
         bs0KBdu+aF7pKWAev34WwJUupOt5K9lmL5vv3+rldGNovzh7Gufo+CjUbbHj5E1b6KrB
         1brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134742; x=1747739542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzGj7/7HNCkOX8Jy6N1ShBJ0VGLtjdGMeKMS0UkPr2U=;
        b=GJ4w5dqEcsS7V02dkgmDfDx/lZbIfXCYdh1WxunSzwguzqOXWxXONbwvxPg1LHEeGI
         N4YjmegccM0GwpVJXRuH8ozyJkbMZjUxZz7ogapEfMRhAnKpFSfFNuOuPc/D2DTd4Xs4
         SR3SxvUtqI3fG7QI36/1kPBIGEPjpKR6fi137jGvoXi7ZViE+Dd9/f4q05QT6aUXMMeK
         ZWOrOdGKpx/7IsX2rhp6ne93lx+X5MUWLxYHUYINNLSGsORAGLBS4iZQLRHDS+7GPDV3
         P9Fn7R7oWLgkk/Z+bwV36FvNJm9N0gQdKlDiDhcnbJQE4w4qIE73no/u/cXNl7c+oet2
         ipag==
X-Gm-Message-State: AOJu0YzgZ8D+wfBxIQudMtblBA4jrHKSXuxq6YR3WlTbnJAIdNYRxLXI
	rIYpUkXRar+fPwWJu+f+yX/pF5zLNWKYTk6DaeEh7ipfZeLYgvgr4l3N4KGAUTsb38CpWHxqQup
	TRFDZXXqIyryClMXzIx3sPqHRzmA1SfO9AZbRBnDznD0LmSz/oEdA/tvrT/R5kngLMmhDlITwln
	mGBAh4D6WEHGb9tJaR2bnrA/ySR8ahlg==
X-Google-Smtp-Source: AGHT+IESX49CIEDe9BU8khZDCxb5erpT7tCrhSDtiDit1VRdndDnzur7Lk8/6OehzO6FEl3BXIpR/H1Y
X-Received: from wrgb2.prod.google.com ([2002:a05:6000:3c2:b0:3a1:a98e:dc0b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f51:0:b0:3a0:83b1:b3c1
 with SMTP id ffacd0b85a97d-3a1f6432c26mr12712980f8f.15.1747134742479; Tue, 13
 May 2025 04:12:22 -0700 (PDT)
Date: Tue, 13 May 2025 13:12:04 +0200
In-Reply-To: <20250513111157.717727-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5646; i=ardb@kernel.org;
 h=from:subject; bh=p3CnmI29Ai+wS7jnpKGLR8D1i2u4QBwZebDaCkr/b04=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZk5X346ddMaoXRM6vS7XcuS0q8NKDxSzLJd9cTdI52
 Lu75O3+jlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARCW6Gf/bhe5tuZHbJ/lhs
 /IJp6zP2j8tvlEx64zMtJfeNXdT2klWMDMsaVR+c5Dqhb9e/t+D66dTUPYoKE7+ZRzQLKD1e8jT biAUA
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-14-ardb+git@google.com>
Subject: [RFC PATCH v2 6/6] x86/boot: Drop 5-level paging related variables
 and early updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
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
index 83cd6c4b9a3f..26deb6831235 100644
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
 
 #define SHARED_KERNEL_PMD	0
@@ -43,7 +38,7 @@ extern unsigned int ptrs_per_p4d;
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
  */
-#define PGDIR_SHIFT	pgdir_shift
+#define PGDIR_SHIFT	(pgtable_l5_enabled() ? 48 : 39)
 #define PTRS_PER_PGD	512
 
 /*
@@ -51,7 +46,7 @@ extern unsigned int ptrs_per_p4d;
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
2.49.0.1045.g170613ef41-goog

