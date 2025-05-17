Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194F1EE03D
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473424; cv=none; b=uAplWDdc3C7HDcJPKw7UcrJ8yOHIw77CGMvDAKCvDbzcXTLy38uJAghtx+LkBjPHV6R3fBksnS17JeayKeB776mVxKlfCEBUtAaFuttunVkuGIzMU7/aow4TuSE3fLMzOnm89Rw3ko0VNlt9xbR09NyLDG03xLnxyxngzGMntsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473424; c=relaxed/simple;
	bh=0t8T1QbYeQN2hvCtMCujog7MqzzzxGy3Vuk4n4AIUGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xq6ga28PsxOgjGvFTc98qDUvSa1bJvOZhcxsPG/uQ2DAHtCQbtvYEpGb3M2yvHqxXS7TyTtjiEbuwGCrACwq1HctGKLtxbVb3w9YUShtZ4zXe+zjB2n1XWgxGH1jZulPUm9Ex1uSS3vb5/OcqNGaQIceZxortcvUvomthLk7tpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/PLFQyQ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/PLFQyQ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a367b3bc13so84452f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473421; x=1748078221; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yfXKW9qA3ci94z4bkzfydUvCwbLjyFz+98FQfnm8O8=;
        b=Y/PLFQyQd1kO0RijHZRw0P78hqh288/O4+6Z4Lieoy+X09CSKtCQZsu7MZykzRv6Ww
         Tb8ODpVaiJ1N9JflzRpPNCn1nNPfsBxTOpmc19mZHU8rEQcNSBdMpUCfKIoQmMItuImI
         i2eFXa5YxkSfPcdCz8vrqJhTh4P0n//LkrTyXp269QoSblEGYqA+oK6Dapi02iepW8ys
         pK8e0pd2aOgQeo7tEvDHaP28u89euI/RmBZqsbTGmWGzBtt0m1JFuLeSURdCkPZp9hT7
         q8FyTX727RAEEBKhnLWKRtFfdmfQFYGgxA9seNk1y1BpTg6o40Xl1NWBSCfpjsxmcWrb
         UUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473421; x=1748078221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yfXKW9qA3ci94z4bkzfydUvCwbLjyFz+98FQfnm8O8=;
        b=wMPzRzo041xxCS4QSDkWMW+r4sLJM5M5YSUqPBHJPG/pOp7lN4A5b2nwirZpcLbhIl
         5N8vQOqxFq1nUuSa6RdW0YwIyPH+TEDzvWnLDtxeJ06inxSbCYY6uBazocvIde2M1cxP
         DukFOoa26PdkJNu5C/0cl89ZTEUC4WWGZ4bHDXkt/MVi4Zc2U1YhNgNpC0NDcDCt3Cab
         L+kRhZtdwUJzRDpI0fEnT4QeH0ek0MZL7kK6b9PLNKh7VNKKYOEgZzBP1v348ED1K+fV
         5EFfNRZ5vMx8ZaVg3U0b9QepzABBGlhCqrITpxGdEod2Svu1KaB4Is+05/2oKtFImzpX
         9l4g==
X-Gm-Message-State: AOJu0Yynl066XIoQV3HdFWR6dMmuDL5ubOX2MjVeMPs/fzyueK5hyfFN
	TvOM0Pzyhl7davjggwMZxDcFmYK0mJp+vK4jXK8au4NlL12O3YrITIbBlRYFuGmaVaoTkWdKR3S
	5WrvSgV4ezE88LN9MTBgjZCw8/spSny3Z6IlS9phyTZu5SL2RmZN5sRM3Q5Q6DKMMZ08c4ugjw+
	995SyU7RCVlf0wYZ6a3fo28k8b1qupRdzLgA==
X-Google-Smtp-Source: AGHT+IGGrQXFH7FGCf2kNULNg9gKfn9HqOMF6Sks7YuziECohlfEXUWRIhlJ3RLm6GwWWCniuGJpeAse
X-Received: from wmbfj10.prod.google.com ([2002:a05:600c:c8a:b0:440:60ac:3f40])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:230a:b0:3a3:64d2:cee2
 with SMTP id ffacd0b85a97d-3a364d2d10dmr2619421f8f.45.1747473421223; Sat, 17
 May 2025 02:17:01 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:46 +0200
In-Reply-To: <20250517091639.3807875-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5410; i=ardb@kernel.org;
 h=from:subject; bh=rA4TspQiCNXQdmEQ/LEBR6E/QrtzS3QcW5m4BFJZm+A=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+K+6uFvvpC2XGnn/rOF9P/fUudVPlty8dT1z0uwec
 efDAqcyOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEGqUY/qna3Tn3NtnjI+fT
 Frb5L8q+uu2wK1nFMj3tjmT7+5jHvvwM/31muotEVN7v9BEL/Je54nHpsVX8VtrO2XH/vJIaN2y cwwUA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-14-ardb+git@google.com>
Subject: [PATCH v4 6/6] x86/boot: Drop 5-level paging related variables and
 early updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
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
index 65e7ff5d7ded..8c3e9114a639 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -188,7 +188,6 @@ static inline int count_immovable_mem_regions(void) { return 0; }
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
index a3f7ec94012b..a873dec1a615 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -21,11 +21,6 @@ typedef unsigned long	pgprotval_t;
 typedef struct { pteval_t pte; } pte_t;
 typedef struct { pmdval_t pmd; } pmd_t;
 
-extern unsigned int __pgtable_l5_enabled;
-
-extern unsigned int pgdir_shift;
-extern unsigned int ptrs_per_p4d;
-
 #endif	/* !__ASSEMBLER__ */
 
 #ifndef pgtable_l5_enabled
@@ -37,7 +32,7 @@ extern unsigned int ptrs_per_p4d;
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
  */
-#define PGDIR_SHIFT	pgdir_shift
+#define PGDIR_SHIFT	(pgtable_l5_enabled() ? 48 : 39)
 #define PTRS_PER_PGD	512
 
 /*
@@ -45,7 +40,7 @@ extern unsigned int ptrs_per_p4d;
  */
 #define P4D_SHIFT		39
 #define MAX_PTRS_PER_P4D	512
-#define PTRS_PER_P4D		ptrs_per_p4d
+#define PTRS_PER_P4D		(pgtable_l5_enabled() ? MAX_PTRS_PER_P4D : 1)
 #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK		(~(P4D_SIZE - 1))
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 455f12850778..137c93498601 100644
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
 unsigned long page_offset_base __ro_after_init = __PAGE_OFFSET_BASE_L4;
 EXPORT_SYMBOL(page_offset_base);
 unsigned long vmalloc_base __ro_after_init = __VMALLOC_BASE_L4;
-- 
2.49.0.1101.gccaa498523-goog

