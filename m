Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B92797B0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737723; cv=none; b=TjCoat2iW1wMQmPfjlphwHExntEjdjZkv1ZFgnKCCnWXiCbkgmpcJBZ74BdDuzKWoSfyl/AvjcGTbQomxKURMqLcPUl/m94dPVh6aX+wPWrK6xssLETiGvFc1QfdeT3WGK4xefrWisnmkm8Fb0Pfm46y0f3rjN6HGk4GMhsg9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737723; c=relaxed/simple;
	bh=+MyvW2EHsxt/O0++0RVZnEf3VvLfJdqD1fhOcXenVDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oJODeXHtctJPN3DKBo9z8Kr0bU5Af8RhvuJn4RTDCQqtwCGn3Yuprue1GYJZkeRFODxXC15PAMxEJ00xfiw3Q0N4c0BH4qtBEvOgFD/SAJfZ/o4fBGcDiEy4giYd+CoH8w+XC7P1VEnhBJF/jOemWudkX2geARdOPiaZKWZZJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqWgXk4H; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqWgXk4H"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a35bf8377fso3639885f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737720; x=1748342520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uj4Q+He/H++iaFQMlkeqyoPnpvIYhWgw+w5Luxphrzs=;
        b=NqWgXk4HzUKqaAA5TnkDr3pWQqWX8w1M79X5+mG37dTlz7YlRwyWD6i8vq2iqS3J37
         ZaH1XE/N8N22o68DJ1qXBNB4KPMh3t3BxhWxMEpeOOyUnAGXK1G5XPzTPJWApNtbqYYB
         vAZTOHRMIqjJx8GbKQ7iX/HEHtYWb8AdUhO1ectYGRHHyaHSiKU/cMahJDxwHVDYeE88
         dFv8EA4RvQQcKZO76vNbB6ibRVEnquDqjqfDgLNiwFNr9CoP3wvOBwbOgY9kb+rra4qk
         0QO0a3IXTkH7OEPjyeithaReb9ueL3S2PLteQMsNgz0vu3a8kYWgULpytYR3T8k2u6ZC
         ZwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737720; x=1748342520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uj4Q+He/H++iaFQMlkeqyoPnpvIYhWgw+w5Luxphrzs=;
        b=PD85TnOUj429K+zHaQN8NvpnQaCsqbJFcJFUapp9OpmSb6LmBQ1dmh5sQVAsWdt8fG
         JEaj7LoIH+fORHBnJNEL4VgbUyL4/TwSfHSvF3UFp9w+uzeOIWGxM/dLj8Gi4yxQas+a
         rN0MLB6gJsO/mycI/LGAn/NqdJGtxJ2l76a1kPCL8EwDvrQvXQzFtj1UTMAT2938fPeP
         7S+THiLLFzrnmEEEGdqtwWE8VGo+bwkEQftCv05llPQ8kurl0XUeGFZw52XWUgl8oMm8
         CazGG5B8MKGeG/47tZpN3fhE15NHuuopJnGieFRTwEAQmJkC5uj28ofxlhiDo8DHgSsP
         TRsg==
X-Gm-Message-State: AOJu0Yy0N+17xHTP3utxZRzFu0n//asG9ljS1IGDBgGOKftzUIfLxE+i
	D0CJADaRWg/s/VwmNcFHG+z85Y8Hv3oajwHc+YshZQNzUTL8rb0iXytHvAosyp9bYY7WmkZ+jCu
	Z10CTvlkS7i04aS1Xmrd8y7cnwggx4swArYlUwEb4hFZVJxdj7hrahbsBuhyYpa/WdrRa2qIpnc
	plCdYvlf7SeM6Fclb8Lpg24AlRVO1QKmXqtg==
X-Google-Smtp-Source: AGHT+IEFV2sngwYRGFYToKf8y9KYHxToadVmLd1SCpMth0+HYqiItVgv6B+MSkf4Ru4ObRXR4goGxOPZ
X-Received: from wrbef4.prod.google.com ([2002:a05:6000:2184:b0:3a3:6ead:f185])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f30f:0:b0:3a3:60f0:e2eb
 with SMTP id ffacd0b85a97d-3a360f0e520mr11371461f8f.33.1747737720434; Tue, 20
 May 2025 03:42:00 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:41 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6598; i=ardb@kernel.org;
 h=from:subject; bh=FaTVq0lH0XHnDqaF/OcYxL33XT0OcqBaLolXkM/upfQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnJj2v5EOi9IttT52WiRwM+dit/cv/LaPtkxmNy0+lv
 5zJO8+oo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkz3mGf4aSppkzte1+37w7
 OzvO7b36OxHlay8euN96eHy71Ypqv1KG/1UG3gfmpgacDHaPLX+/9VGo2kyWFYfu/mUJuppoLmX ozwUA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-11-ardb+git@google.com>
Subject: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable to
 record pgdir_shift
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Shrink the global variable 'pgdir_shift' to a single byte, and move it
to the cache hot per-CPU variable section so that it can be accessed
virtually for free.

Set the variable from asm code before entering C so that C code is
guaranteed to always consistently observe the correct value.

For the decompressor, provide an alternative that tests the CR4.LA57
control bit directly - this is more costly in principle but this should
not matter for the early boot code, and the LA57 control bit is
guaranteed to be in sync with the number of paging levels in use.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h         |  6 +++++-
 arch/x86/boot/compressed/pgtable_64.c   |  2 --
 arch/x86/boot/startup/map_kernel.c      |  1 -
 arch/x86/include/asm/page_64_types.h    |  2 +-
 arch/x86/include/asm/pgtable_64_types.h | 13 +++++++++++--
 arch/x86/kernel/head64.c                |  2 --
 arch/x86/kernel/head_64.S               |  5 +++++
 arch/x86/mm/pgtable.c                   |  4 ++++
 8 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index db1048621ea2..97b80d08f03c 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -28,6 +28,10 @@
 #define __pa(x)  ((unsigned long)(x))
 #define __va(x)  ((void *)((unsigned long)(x)))
 
+#ifdef CONFIG_X86_64
+#define pgdir_shift()	(native_read_cr4() & X86_CR4_LA57 ? 48 : 39)
+#endif
+
 #include <linux/linkage.h>
 #include <linux/screen_info.h>
 #include <linux/elf.h>
@@ -189,7 +193,7 @@ static inline int count_immovable_mem_regions(void) { return 0; }
 #endif
 
 /* ident_map_64.c */
-extern unsigned int __pgtable_l5_enabled, pgdir_shift, ptrs_per_p4d;
+extern unsigned int __pgtable_l5_enabled, ptrs_per_p4d;
 extern void kernel_add_identity_map(unsigned long start, unsigned long end);
 
 /* Used by PAGE_KERN* macros: */
diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index bdd26050dff7..898a4e66e401 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -12,7 +12,6 @@
 
 /* __pgtable_l5_enabled needs to be in .data to avoid being cleared along with .bss */
 unsigned int __section(".data") __pgtable_l5_enabled;
-unsigned int __section(".data") pgdir_shift = 39;
 unsigned int __section(".data") ptrs_per_p4d = 1;
 
 /* Buffer to preserve trampoline memory */
@@ -123,7 +122,6 @@ asmlinkage void configure_5level_paging(struct boot_params *bp, void *pgtable)
 
 		/* Initialize variables for 5-level paging */
 		__pgtable_l5_enabled = 1;
-		pgdir_shift = 48;
 		ptrs_per_p4d = 512;
 	}
 
diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 332dbe6688c4..06306c5d016f 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -24,7 +24,6 @@ static inline bool check_la57_support(void)
 		return false;
 
 	__pgtable_l5_enabled	= 1;
-	pgdir_shift		= 48;
 	ptrs_per_p4d		= 512;
 
 	return true;
diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index 7400dab373fe..e1fccd9116c3 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -48,7 +48,7 @@
 /* See Documentation/arch/x86/x86_64/mm.rst for a description of the memory map. */
 
 #define __PHYSICAL_MASK_SHIFT	52
-#define __VIRTUAL_MASK_SHIFT	(pgtable_l5_enabled() ? 56 : 47)
+#define __VIRTUAL_MASK_SHIFT	(pgdir_shift() + 8)
 
 #define TASK_SIZE_MAX		task_size_max()
 #define DEFAULT_MAP_WINDOW	((1UL << 47) - PAGE_SIZE)
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 1481b234465a..3ee747f596e3 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -7,6 +7,7 @@
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
 #include <asm/kaslr.h>
+#include <asm/percpu.h>
 
 /*
  * These are used to make use of C type-checking..
@@ -23,6 +24,15 @@ typedef struct { pmdval_t pmd; } pmd_t;
 
 extern unsigned int __pgtable_l5_enabled;
 
+#ifndef pgdir_shift
+DECLARE_PER_CPU_CACHE_HOT(u8, __pgdir_shift);
+
+static __always_inline __attribute_const__ u8 pgdir_shift(void)
+{
+	return this_cpu_read_stable(__pgdir_shift);
+}
+#endif /* pgdir_shift */
+
 #ifdef USE_EARLY_PGTABLE_L5
 /*
  * cpu_feature_enabled() is not available in early boot code.
@@ -36,7 +46,6 @@ static inline bool pgtable_l5_enabled(void)
 #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
 #endif /* USE_EARLY_PGTABLE_L5 */
 
-extern unsigned int pgdir_shift;
 extern unsigned int ptrs_per_p4d;
 
 #endif	/* !__ASSEMBLER__ */
@@ -44,7 +53,7 @@ extern unsigned int ptrs_per_p4d;
 /*
  * PGDIR_SHIFT determines what a top-level page table entry can map
  */
-#define PGDIR_SHIFT	pgdir_shift
+#define PGDIR_SHIFT	pgdir_shift()
 #define PTRS_PER_PGD	512
 
 /*
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 533fcf5636fc..e2d9e709ec01 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -52,8 +52,6 @@ SYM_PIC_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
 unsigned int __pgtable_l5_enabled __ro_after_init;
-unsigned int pgdir_shift __ro_after_init = 39;
-EXPORT_SYMBOL(pgdir_shift);
 unsigned int ptrs_per_p4d __ro_after_init = 1;
 EXPORT_SYMBOL(ptrs_per_p4d);
 
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 3e9b3a3bd039..d35b75a5f892 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -71,6 +71,11 @@ SYM_CODE_START_NOALIGN(startup_64)
 	xorl	%edx, %edx
 	wrmsr
 
+	movq	%cr4, %rax
+	btl	$X86_CR4_LA57_BIT, %eax
+	jnc	0f
+	movb	$48, PER_CPU_VAR(__pgdir_shift)
+0:
 	call	startup_64_setup_gdt_idt
 
 	/* Now switch to __KERNEL_CS so IRET works reliably */
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 62777ba4de1a..a7eaeaa595f8 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -46,6 +46,10 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
+DEFINE_PER_CPU_CACHE_HOT(u8, __pgdir_shift) = 39;
+EXPORT_SYMBOL_GPL(__pgdir_shift);
+SYM_PIC_ALIAS(__pgdir_shift);
+
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-- 
2.49.0.1101.gccaa498523-goog

