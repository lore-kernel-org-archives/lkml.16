Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E435286416
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546549; cv=none; b=dO9mwA+wPPimtcOAMabNStcztCS+IBhXGEht9ZzmV1m4bxuxgXgMaxh9nmeDcwa1OxJ5v5PyWdeKcFogGRbxQfm7ebGSW0SBJqGw2UEAXJRps0kqmbChhtV4/uqMjVvlcgZ8uplhLcjz94TVqrrvGHLMLuQE2phspfEPcnD3a40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546549; c=relaxed/simple;
	bh=6czLOBAF5wJ+ZDZdtvidU8tWBaLpDs7uVQeeloyfnP4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ioMXIHaDwkUWaHCSCAmbPXD7Z1t7+5DHOuQXpAw+y2qO0CEC78ca0ZPMCKvqi/aVnI4iDSPwctIdj6YMFhpvcu02NAAw9v1yMA/BQ1UpMpzqEXSb2jrLwio0HuqUeTOfw/yBJWYR9Ej6gSG2uQwxq1imIQiqG36aLHwqDJxL6qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mS/psCip; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mS/psCip"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so36060095e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746546546; x=1747151346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypb7HL1OYOs6Rh7AaBImRSIYJgxMCsnqw8t5GRzXF38=;
        b=mS/psCipHamC4qn15iZ5PmegCv/V8cGcG7MihKvyMVOJClgltVerWDsTLvpmUp///X
         ToPEsDyu5Ru3XKMSK5SmnRyh9MQp7vLcFClvJIDI1CfOzY7ul9xTZ9HHqnFoFuLSeu66
         aW7XX2KefDDba8fOJ8td3GEqwJL/CUL94DdO2+0Kwv1jywH3GXWbQb/6tSXV+/I6fvf4
         WZtwUCSfjN78nrh5HHtVjNraYZnF63bRQhe3Rz8gGM/DydAPwCEg1IZb8hgpcJiWwlCI
         f17x2UNQb2vfO0FgIGPkOkA/4dK4THbY3vsV/KhDk1pgGyxdowHCA/k/I1A6jwjuzcpu
         QXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546546; x=1747151346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypb7HL1OYOs6Rh7AaBImRSIYJgxMCsnqw8t5GRzXF38=;
        b=JiYScOYLHueHCF8COxe7rGrPXf5FGXZ0hneKGccqups4EdgUiqyh0zny7d6DmTZ3Dy
         emo+oD+fL7FcWkmliH2PNUSfLgpfxtsfGjd4EFzZ/CavCS4gNpwchFrVWxIG3jX4nkKx
         +/i8UMZGzj8S3CrNLA8qFByCLTWr1rdrn8mSlOpcmSpCYbC1TAVTsqUJQ5syZv50f5tN
         YIPffhe3j8wZbSnR7xzKWJJX8iqXNdCQ9gvh7PsqTeeaa+Y0k/lyccQmn368tNxxXKos
         Nbm9kSQ6NNsStlIAX/f7eFxhYdOa5oHtSThXZOuCdqNlzRxwRi07KrAvNKJwqLGAJK2z
         CT+Q==
X-Gm-Message-State: AOJu0Ywz9b+ZUlL/ZS1Va9zXfn3E9hBbmUQvdUxs/MJkzYLwi59i862K
	cv0N4AG8yw+te4SXyl47gRyu1l+sBWnVcaEDL93l2wfxorfhcVJ2C5kTZK2U2R1WYQLP7YBIYZQ
	I7TySkaV+pRhaJSGkugTNiEJj7GccEjYEAt9mwkNpMyLxUBr1xgE51uDTAYSA0Op7tLCK0xYKoS
	PICAQy/wl5V5XgAE/PXdBKdI8biaLTlw==
X-Google-Smtp-Source: AGHT+IFcTpJiI837EzupEDowqsrxdzpaFyHm34euiPejDbsie/HSTKo/0v/izifg2YcfxCjDpRG+0f+3
X-Received: from wmbhh5.prod.google.com ([2002:a05:600c:5305:b0:43b:b74b:9350])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358b:b0:441:b5cb:4f94
 with SMTP id 5b1f17b1804b1-441d0fbd5cfmr28772025e9.5.1746546546001; Tue, 06
 May 2025 08:49:06 -0700 (PDT)
Date: Tue,  6 May 2025 17:45:35 +0200
In-Reply-To: <20250506154532.1281909-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4565; i=ardb@kernel.org;
 h=from:subject; bh=leJ0g34U6so2+LXXMrZ+3vnSiVdVNQLb/dH0njK6Az8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNKb4HGn0N6oYEr9t66/KLhdrswDxPjQ3aGxtIny9ene
 e3z71/fUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACby7ijD/1IhXZ+/Fg8ap62w
 W+Y3o8hJ+vTf58lOIc+vPt/YViEcZcbwv+q0l66ARV/T6km1jFWKTC++maUEf2Pt+OVg/m9e7dd d7AA=
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250506154532.1281909-7-ardb+git@google.com>
Subject: [RFC PATCH 2/3] x86/boot: Set __pgtable_l5_enabled correctly before
 calling into C code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Ensure that __pgtable_l5_enabled() is set to its permanent value before
calling into any C code that may manipulate page tables or reference any
global variable or object that may be dimensioned differently based on
whether 5-level paging is in use.

This avoids inconsistencies that are difficult to detect, and allows
pgtable_l5_enabled() to be emitted with the 'const' function attribute.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/head_64.S      | 6 ++++++
 arch/x86/boot/compressed/pgtable_64.c   | 6 +++---
 arch/x86/boot/startup/map_kernel.c      | 1 -
 arch/x86/include/asm/pgtable_64_types.h | 2 +-
 arch/x86/kernel/head64.c                | 2 +-
 arch/x86/kernel/head_64.S               | 7 +++++++
 6 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index d9dab940ff62..e6b254a12ca9 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -454,6 +454,12 @@ SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
 	shrq	$3, %rcx
 	rep	stosq
 
+#ifdef CONFIG_X86_5LEVEL
+	movq	%cr4, %rax
+	shrl	$X86_CR4_LA57_BIT, %eax
+	andl	%eax, __pgtable_l5_enabled(%rip)
+#endif
+
 	call	load_stage2_idt
 
 	/* Pass boot_params to initialize_identity_maps() */
diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index 5a6c7a190e5b..0aff7a637f54 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -11,8 +11,9 @@
 #define BIOS_START_MAX		0x9f000U	/* 640K, absolute maximum */
 
 #ifdef CONFIG_X86_5LEVEL
-/* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
-unsigned int __section(".data") __pgtable_l5_enabled;
+unsigned int __pgtable_l5_enabled = 1;
+
+/* These need to be in .data to avoid being cleared along with .bss */
 unsigned int __section(".data") pgdir_shift = 39;
 unsigned int __section(".data") ptrs_per_p4d = 1;
 #endif
@@ -129,7 +130,6 @@ asmlinkage void configure_5level_paging(struct boot_params *bp, void *pgtable)
 		l5_required = true;
 
 		/* Initialize variables for 5-level paging */
-		__pgtable_l5_enabled = 1;
 		pgdir_shift = 48;
 		ptrs_per_p4d = 512;
 	}
diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 099ae2559336..f3d09e61575b 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -26,7 +26,6 @@ static inline bool check_la57_support(void)
 	if (!(native_read_cr4() & X86_CR4_LA57))
 		return false;
 
-	__pgtable_l5_enabled	= 1;
 	pgdir_shift		= 48;
 	ptrs_per_p4d		= 512;
 	page_offset_base	= __PAGE_OFFSET_BASE_L5;
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 2ca568f56660..2c498d16609c 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -27,7 +27,7 @@ extern unsigned int __pgtable_l5_enabled;
 #include <asm/alternative.h>
 #include <asm/cpufeatures.h>
 
-static inline bool pgtable_l5_enabled(void)
+static inline bool __attribute_const__ pgtable_l5_enabled(void)
 {
 	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feat], "", "jmp %l[t_no]")
 		"	.pushsection .altinstr_aux,\"ax\"	\n"
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 498b9d6bdf2f..d3d1136ad802 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -49,7 +49,7 @@ SYM_PIC_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
 #ifdef CONFIG_X86_5LEVEL
-unsigned int __pgtable_l5_enabled __initdata;
+unsigned int __pgtable_l5_enabled __initdata = 1;
 unsigned int pgdir_shift __ro_after_init = 39;
 EXPORT_SYMBOL(pgdir_shift);
 unsigned int ptrs_per_p4d __ro_after_init = 1;
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 069420853304..1fe74bf828da 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -61,6 +61,13 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Set up the stack for verify_cpu() */
 	leaq	__top_init_kernel_stack(%rip), %rsp
 
+#ifdef CONFIG_X86_5LEVEL
+	/* __pgtable_l5_enabled needs to be correct before calling C code */
+	movq	%cr4, %rax
+	shrl	$X86_CR4_LA57_BIT, %eax
+	andl	%eax, __pgtable_l5_enabled(%rip)
+#endif
+
 	/*
 	 * Set up GSBASE.
 	 * Note that on SMP the boot CPU uses the init data section until
-- 
2.49.0.987.g0cc8ee98dc-goog

