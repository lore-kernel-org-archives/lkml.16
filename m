Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F4D26FA6F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406646; cv=none; b=gYLlE55RI/1kW4axz6cbPsEEwGnPOvK8ufKu6n+WXfl1JP2U4kX46gKlG5V74PeTrrTE71rI3k/jDdsfeyPdvtSicfUBFwcwP4/QtCD+XsAXO8Pk+pG9rVdKJ1ZsNYzWNmJySbj0lCMNWeIWPsF0iPommJpCAZ/KCe4zfbnoAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406646; c=relaxed/simple;
	bh=XkA3HYEGwj91QxLKsAzM0febMq73OcEzy2RmvnaYohg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MggiwUcnn3DFmqz+BhyOEW48tpf50SiBLix825MSTczUE3pcUSNXLQTa0PatlUfRLJG7frfRF+QPSgsAm6OtBEoPWCuNGf31pm6BWTGm9NqaM58cLzFvOFg+wkfw5k4pWc/OSIoJP+CAF6WeNXKwc6JLfDlP2962vdrIW4FvxcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=py9d4lib; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="py9d4lib"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43947a0919aso45194375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406643; x=1746011443; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h069Sp4yFKtz4Sfd7IxnH3MQe78yHPLJe923z0mD/9Y=;
        b=py9d4libj1mo9OFPUl1FLcMUsirBKrdJgH4nTyb2kRFGJJDekJEJQEL6JD7P+Dz/tx
         aSde5ATSKSX8ASqPlCu0TyJYogyVSuj3kkq6BMlwuk9pUdfFPQV9cX3nNtuBGEOO1jKV
         jlkfmLZVZEXZtcfiq/U+xUfPNZmzExYyQxmoq0eG/XIUiTCjqVLl8SSkP9xM9GBA/Sp/
         EYXV4ZIDyVMnRlSkV/H6tMNMPudYgayq0yYqxuskbedDVDCY2Q+BQNSqisq9O0pxEnVF
         5IrbvPcp129H5ng0xKTKTIY9wzaRckg6N99Yjk5ibk0aT/5DxPgE1AKAZbuJ6/tsm+qq
         4jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406643; x=1746011443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h069Sp4yFKtz4Sfd7IxnH3MQe78yHPLJe923z0mD/9Y=;
        b=cew6tlbp0+Q8UwJXZyAAIi1eUpvfNr2BAjhihQ0qvOg8tMc94w8VoDPwmzMX6+yDMg
         AKSEE9JISBZwFA6/27q7wtDqhqczimTOJSPXYnqWaspqrcbWMrO3zK/+Vf73DkzkHZom
         VP0v5ys5juQdf0hlzmC1jgBFnjfFJKRDcBucocjBcUAuVMhZVLGDjKz4LKxY0BdD22xx
         moTWDLURatnF9l0pgRcCNJxFotd6jSJ/CUTsHsX+EePqH3RO+yyofLsEeGojmGi2vZmM
         ClXNHK1yab3/Vu+g4ui+1yH5FxC+anXFURfglIV0xwlNWy2NolFFZdbvzBeW9nZwOeYS
         zS7Q==
X-Gm-Message-State: AOJu0Yx/f3pijByh9beKlVHZwK16xWeAfmHPChghJJHAnEUoKT4XWoMJ
	AnUcTEnthHrGtOq5LAiqbWZBj6CPkPfB1NHn1EulXeUaL9UXs6Wnh7pxFmUXS/nkErp2WrZ1E48
	tqWIY4BExzicqRtXxY5Iuinrta6NKiLENS5ixUsIQM4RqCYiJUTSAsuc57psSFZLHVO7z6Wxnmy
	+ewaRSQODdvoe6VhBq0bCzlogBp0dtoQ==
X-Google-Smtp-Source: AGHT+IHasKEFo0O1xl8qRFJr8I9yaIj0B0fZjnA5DS6M7Y8W+Kz92Kt4Pr2Iit49l8SkpRLdAHQm9k/l
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:43c:f60a:4c59])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:870f:b0:43c:fcbc:968c
 with SMTP id 5b1f17b1804b1-4406ab7a5ecmr167373975e9.7.1745406643318; Wed, 23
 Apr 2025 04:10:43 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:53 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7865; i=ardb@kernel.org;
 h=from:subject; bh=tzfXWCRTH9WnYCqa0wFjdgO1/a71ojpw+Fy+D8l8Il8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPjVH957dPZ8yYeF/Q6lbPHIF2k4PM10UdBrwKMqu+G2
 EjFi6l1lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkkKzMybN58eVtE/6QqMV2L
 y3+uzN/Ps764hqddvO1A0tyQaToadYwMTVVW+dW1SifUZjRVu+w4uPFGrXanx5rNa2SmvdVUfCT MDwA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-17-ardb+git@google.com>
Subject: [RFC PATCH PoC 04/11] x86/boot: Add a bunch of PI aliases
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Add aliases for all the data objects that the startup code references -
this is needed so that this code can be moved into its own confined area
where it can only access symbols that have a __pi_ prefix.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/coco/core.c          | 2 ++
 arch/x86/kernel/cpu/common.c  | 1 +
 arch/x86/kernel/head64.c      | 7 +++++++
 arch/x86/kernel/head_64.S     | 8 ++++++++
 arch/x86/kernel/setup.c       | 1 +
 arch/x86/kernel/vmlinux.lds.S | 4 ++++
 arch/x86/lib/retpoline.S      | 1 +
 arch/x86/mm/mem_encrypt_amd.c | 2 ++
 arch/x86/mm/pgtable.c         | 1 +
 9 files changed, 27 insertions(+)

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 9a0ddda3aa69..303360508a71 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -18,7 +18,9 @@
 #include <asm/processor.h>
 
 enum cc_vendor cc_vendor __ro_after_init = CC_VENDOR_NONE;
+SYM_PI_ALIAS(cc_vendor);
 u64 cc_mask __ro_after_init;
+SYM_PI_ALIAS(cc_mask);
 
 static struct cc_attr_flags {
 	__u64 host_sev_snp	: 1,
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 12126adbc3a9..8fe2e9859c4b 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -242,6 +242,7 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct gdt_page, gdt_page) = { .gdt = {
 #endif
 } };
 EXPORT_PER_CPU_SYMBOL_GPL(gdt_page);
+SYM_PI_ALIAS(gdt_page);
 
 #ifdef CONFIG_X86_64
 static int __init x86_nopcid_setup(char *s)
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 29226f3ac064..b251186a819e 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -48,23 +48,30 @@
  */
 extern pmd_t early_dynamic_pgts[EARLY_DYNAMIC_PAGE_TABLES][PTRS_PER_PMD];
 unsigned int __initdata next_early_pgt;
+SYM_PI_ALIAS(next_early_pgt);
 pmdval_t early_pmd_flags = __PAGE_KERNEL_LARGE & ~(_PAGE_GLOBAL | _PAGE_NX);
 
 #ifdef CONFIG_X86_5LEVEL
 unsigned int __pgtable_l5_enabled __ro_after_init;
+SYM_PI_ALIAS(__pgtable_l5_enabled);
 unsigned int pgdir_shift __ro_after_init = 39;
 EXPORT_SYMBOL(pgdir_shift);
+SYM_PI_ALIAS(pgdir_shift);
 unsigned int ptrs_per_p4d __ro_after_init = 1;
 EXPORT_SYMBOL(ptrs_per_p4d);
+SYM_PI_ALIAS(ptrs_per_p4d);
 #endif
 
 #ifdef CONFIG_DYNAMIC_MEMORY_LAYOUT
 unsigned long page_offset_base __ro_after_init = __PAGE_OFFSET_BASE_L4;
 EXPORT_SYMBOL(page_offset_base);
+SYM_PI_ALIAS(page_offset_base);
 unsigned long vmalloc_base __ro_after_init = __VMALLOC_BASE_L4;
 EXPORT_SYMBOL(vmalloc_base);
+SYM_PI_ALIAS(vmalloc_base);
 unsigned long vmemmap_base __ro_after_init = __VMEMMAP_BASE_L4;
 EXPORT_SYMBOL(vmemmap_base);
+SYM_PI_ALIAS(vmemmap_base);
 #endif
 
 /* Wipe all early page tables except for the kernel symbol map */
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index fefe2a25cf02..0c0d38ebf70b 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -573,6 +573,7 @@ SYM_CODE_START_NOALIGN(vc_no_ghcb)
 	/* Pure iret required here - don't use INTERRUPT_RETURN */
 	iretq
 SYM_CODE_END(vc_no_ghcb)
+SYM_PI_ALIAS(vc_no_ghcb);
 #endif
 
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
@@ -604,10 +605,12 @@ SYM_DATA_START_PTI_ALIGNED(early_top_pgt)
 	.quad	level3_kernel_pgt - __START_KERNEL_map + _PAGE_TABLE_NOENC
 	.fill	PTI_USER_PGD_FILL,8,0
 SYM_DATA_END(early_top_pgt)
+SYM_PI_ALIAS(early_top_pgt)
 
 SYM_DATA_START_PAGE_ALIGNED(early_dynamic_pgts)
 	.fill	512*EARLY_DYNAMIC_PAGE_TABLES,8,0
 SYM_DATA_END(early_dynamic_pgts)
+SYM_PI_ALIAS(early_dynamic_pgts);
 
 SYM_DATA(early_recursion_flag, .long 0)
 
@@ -651,6 +654,7 @@ SYM_DATA_START_PAGE_ALIGNED(level4_kernel_pgt)
 	.fill	511,8,0
 	.quad	level3_kernel_pgt - __START_KERNEL_map + _PAGE_TABLE_NOENC
 SYM_DATA_END(level4_kernel_pgt)
+SYM_PI_ALIAS(level4_kernel_pgt)
 #endif
 
 SYM_DATA_START_PAGE_ALIGNED(level3_kernel_pgt)
@@ -659,6 +663,7 @@ SYM_DATA_START_PAGE_ALIGNED(level3_kernel_pgt)
 	.quad	level2_kernel_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
 	.quad	level2_fixmap_pgt - __START_KERNEL_map + _PAGE_TABLE_NOENC
 SYM_DATA_END(level3_kernel_pgt)
+SYM_PI_ALIAS(level3_kernel_pgt)
 
 SYM_DATA_START_PAGE_ALIGNED(level2_kernel_pgt)
 	/*
@@ -676,6 +681,7 @@ SYM_DATA_START_PAGE_ALIGNED(level2_kernel_pgt)
 	 */
 	PMDS(0, __PAGE_KERNEL_LARGE_EXEC, KERNEL_IMAGE_SIZE/PMD_SIZE)
 SYM_DATA_END(level2_kernel_pgt)
+SYM_PI_ALIAS(level2_kernel_pgt)
 
 SYM_DATA_START_PAGE_ALIGNED(level2_fixmap_pgt)
 	.fill	(512 - 4 - FIXMAP_PMD_NUM),8,0
@@ -688,6 +694,7 @@ SYM_DATA_START_PAGE_ALIGNED(level2_fixmap_pgt)
 	/* 6 MB reserved space + a 2MB hole */
 	.fill	4,8,0
 SYM_DATA_END(level2_fixmap_pgt)
+SYM_PI_ALIAS(level2_fixmap_pgt)
 
 SYM_DATA_START_PAGE_ALIGNED(level1_fixmap_pgt)
 	.rept (FIXMAP_PMD_NUM)
@@ -703,6 +710,7 @@ SYM_DATA(smpboot_control,		.long 0)
 	.align 16
 /* This must match the first entry in level2_kernel_pgt */
 SYM_DATA(phys_base, .quad 0x0)
+SYM_PI_ALIAS(phys_base);
 EXPORT_SYMBOL(phys_base)
 
 #include "../xen/xen-head.S"
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833..ae1fdb0fc6ba 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -134,6 +134,7 @@ struct ist_info ist_info;
 
 struct cpuinfo_x86 boot_cpu_data __read_mostly;
 EXPORT_SYMBOL(boot_cpu_data);
+SYM_PI_ALIAS(boot_cpu_data);
 
 #if !defined(CONFIG_X86_PAE) || defined(CONFIG_X86_64)
 __visible unsigned long mmu_cr4_features __ro_after_init;
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index ccdc45e5b759..9340c74b680d 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -79,11 +79,13 @@ const_cpu_current_top_of_stack = cpu_current_top_of_stack;
 #define BSS_DECRYPTED						\
 	. = ALIGN(PMD_SIZE);					\
 	__start_bss_decrypted = .;				\
+	__pi___start_bss_decrypted = .;				\
 	*(.bss..decrypted);					\
 	. = ALIGN(PAGE_SIZE);					\
 	__start_bss_decrypted_unused = .;			\
 	. = ALIGN(PMD_SIZE);					\
 	__end_bss_decrypted = .;				\
+	__pi___end_bss_decrypted = .;				\
 
 #else
 
@@ -128,6 +130,7 @@ SECTIONS
 	/* Text and read-only data */
 	.text :  AT(ADDR(.text) - LOAD_OFFSET) {
 		_text = .;
+		__pi__text = .;
 		_stext = .;
 		ALIGN_ENTRY_TEXT_BEGIN
 		*(.text..__x86.rethunk_untrain)
@@ -391,6 +394,7 @@ SECTIONS
 
 	. = ALIGN(PAGE_SIZE);		/* keep VO_INIT_SIZE page aligned */
 	_end = .;
+	__pi__end = .;
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 	/*
diff --git a/arch/x86/lib/retpoline.S b/arch/x86/lib/retpoline.S
index a26c43abd47d..cabec2788e70 100644
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -394,6 +394,7 @@ SYM_CODE_START(__x86_return_thunk)
 #endif
 	int3
 SYM_CODE_END(__x86_return_thunk)
+SYM_PI_ALIAS(__x86_return_thunk)
 EXPORT_SYMBOL(__x86_return_thunk)
 
 #endif /* CONFIG_MITIGATION_RETHUNK */
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 7490ff6d83b1..9aaeda6eb83d 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -40,7 +40,9 @@
  * section is later cleared.
  */
 u64 sme_me_mask __section(".data") = 0;
+SYM_PI_ALIAS(sme_me_mask);
 u64 sev_status __section(".data") = 0;
+SYM_PI_ALIAS(sev_status);
 u64 sev_check_data __section(".data") = 0;
 EXPORT_SYMBOL(sme_me_mask);
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index a05fcddfc811..9e26215da18d 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -10,6 +10,7 @@
 #ifdef CONFIG_DYNAMIC_PHYSICAL_MASK
 phys_addr_t physical_mask __ro_after_init = (1ULL << __PHYSICAL_MASK_SHIFT) - 1;
 EXPORT_SYMBOL(physical_mask);
+SYM_PI_ALIAS(physical_mask);
 #endif
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
-- 
2.49.0.805.g082f7c87e0-goog

