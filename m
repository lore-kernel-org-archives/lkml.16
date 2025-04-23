Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298F274664
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406654; cv=none; b=nfJu8Y13OiGrKWTZe+A8p15UyVgSpXLFGU3l/BhYOJEBI5COiKp/y7SrZvEgkFcbRxWBLhi9XiutQ3u78mOHm9sQMP1qotXC36sQ1jIy+4otRuaUCTQyZEa9xxMvoS3f+ieCNRZMsRQ5P1xLzlzL6E45WUB7G4+sqZ23BdtDVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406654; c=relaxed/simple;
	bh=P1yDcuKVSS92bW/obG4PbcSbjS6P1dtU1oq/VhxlyVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nCqMOdL3DptD7EedvOGcK+Wrd4youRs2MIXrEso6+Oo6cLhRQzFE5tLH6r9PR0eMsrrqP/0G5iJYqasVWnhED3d8AbChljVy8RDnViklpkxiLCew2n4FJXQ67eZnOEci9n0oqXgK2LnhaTJS4LldgdMSjb013uJqJQW7y/NNQEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tu5OOt+a; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tu5OOt+a"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-44059976a1fso23814325e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406651; x=1746011451; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxApNsLTT5sudbmHPjTE/gvVQtNjwMPXDMW0YLEQcas=;
        b=Tu5OOt+aSr2/W7eO1BywNxj41QQNreWCkodBG3Vi2xZ/JjFioA9PA58t+cv8rR9WEy
         DGpQhDOiWHDEfxko2dtmyqevC6r2pQUYaIS1MJew/yTCCk6n1kfDZcCB42Z9a8z+m5yK
         Xf7W7OZq60QX7uPHrlrulaRqC9QWVIQBmkoaduAvwiFIsCF/oKAHxqGc46KD2QoJKKxw
         Tkx52kl8hQLHRZzoS1Uu54TGPWzVz+/krDxMyUV/SH9jR7FruGpmIAOg5ckI7c0RgaVh
         F432nok7oDX6a6Zay5wEW6We+mLR76zwEfqOmX6tjNGd1cs1ibl3CgdUkQLm6IK616EO
         Z0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406651; x=1746011451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxApNsLTT5sudbmHPjTE/gvVQtNjwMPXDMW0YLEQcas=;
        b=wviJzYK0GBWYUhQ500l5ov2yvULJn5+MyAg+BJuPY4uVsQsaITgd8cQL4K/siKw7ut
         MkJiajAtXtlWp88m7kgOPfPqT0r1uCG/GiBMp1iPS47QpJPJnQw3MvBlQDHzi0/gaiIK
         rWxiJaSFPH69f99hONC1kkQDHwG8tMxP1wCvMrt3cfnS4gyvBOfK35+305Fn64ZpRYkw
         pOHAfSZgyMvfg5XSYI3urhdEjZ0O7jelEamxcTBGEsoNovBWR29V1i+itIbuyQczyqDR
         p9WFKsG6YIMDrmYfI0pS9dOE8EeNkFBqUaMY/qHYSkjjAIrGdJn1IOreFs2AwI9xr6jk
         PYfA==
X-Gm-Message-State: AOJu0YzdcOX/OnIqBSp/AIfXPWU/3OShKd+4q0lnsE2llsoo+bgebKnN
	YS7cLko2W1e5+cEt5bl/Ew5ZHzVyrWXWSwb2pp9F8Ea+Vcb9+lsBybuJOuSJPm57y61cv6UXRMU
	ZGaIzMFoyh78gDfmTDHIbx9atE+NAz68i2g2prF/JrVjq9bYWaQkjw0S5pu4KgD2htlXazs8OyI
	/I4lNy039jB+oW6bQXY+jYYwqCtMXOGA==
X-Google-Smtp-Source: AGHT+IE3ZYrPhMrkKiKPfMJeH8kjeNNcHVz2R6ikggf2cAjm3b6CLwtUjPvK80MC245UD8NjieFrxL2D
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:43c:f60a:4c59])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d08:b0:43b:cc3c:60bc
 with SMTP id 5b1f17b1804b1-4406aba7ecdmr199178195e9.15.1745406651373; Wed, 23
 Apr 2025 04:10:51 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:57 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7799; i=ardb@kernel.org;
 h=from:subject; bh=sWwa7y2W0Temi1y3WLio3OoGWuUuyEhLAHrY/J19j+k=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1PTi7IWOLxhXyd9avuE9z+kPJzb8Nc7YVvblicn5D
 b4hsxfldZSyMIhxMMiKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJrDjHyHB/y9GMeJX98TN4
 px/UfqdsaihjwMLxukV60+OU4yeNuSoY/hkUZGsY76tcpl3E9dMoNSp7WmnHyR2/DnRfPsOb3nX pJSMA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-21-ardb+git@google.com>
Subject: [RFC PATCH PoC 08/11] x86/boot: Move startup code out of __head section
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Move startup code out of the __head section, now that this no longer has
a special significance. Move everything into .text or .init.text as
appropriate, so that startup code is not kept around unnecessarily.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/gdt_idt.c    |  4 +--
 arch/x86/boot/startup/map_kernel.c |  4 +--
 arch/x86/boot/startup/sme.c        | 26 ++++++++++----------
 arch/x86/kernel/head_32.S          |  2 +-
 arch/x86/kernel/head_64.S          |  2 +-
 arch/x86/platform/pvh/head.S       |  2 +-
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/x86/boot/startup/gdt_idt.c b/arch/x86/boot/startup/gdt_idt.c
index a3112a69b06a..d16102abdaec 100644
--- a/arch/x86/boot/startup/gdt_idt.c
+++ b/arch/x86/boot/startup/gdt_idt.c
@@ -24,7 +24,7 @@
 static gate_desc bringup_idt_table[NUM_EXCEPTION_VECTORS] __page_aligned_data;
 
 /* This may run while still in the direct mapping */
-void __head startup_64_load_idt(void *vc_handler)
+void startup_64_load_idt(void *vc_handler)
 {
 	struct desc_ptr desc = {
 		.address = (unsigned long)rip_rel_ptr(bringup_idt_table),
@@ -46,7 +46,7 @@ void __head startup_64_load_idt(void *vc_handler)
 /*
  * Setup boot CPU state needed before kernel switches to virtual addresses.
  */
-void __head startup_64_setup_gdt_idt(void)
+void __init startup_64_setup_gdt_idt(void)
 {
 	struct gdt_page *gp = rip_rel_ptr((void *)(__force unsigned long)&gdt_page);
 	void *handler = NULL;
diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 099ae2559336..75b3dd62da50 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -36,7 +36,7 @@ static inline bool check_la57_support(void)
 	return true;
 }
 
-static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
+static unsigned long __init sme_postprocess_startup(struct boot_params *bp,
 						    pmdval_t *pmd,
 						    unsigned long p2v_offset)
 {
@@ -90,7 +90,7 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
  * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
  * subtracting p2v_offset from the RIP-relative address.
  */
-unsigned long __head __startup_64(unsigned long p2v_offset,
+unsigned long __init __startup_64(unsigned long p2v_offset,
 				  struct boot_params *bp)
 {
 	pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index d55b24cd4d08..914016184755 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -91,7 +91,7 @@ struct sme_populate_pgd_data {
  */
 static char sme_workarea[2 * PMD_SIZE] __section(".init.scratch");
 
-static void __head sme_clear_pgd(struct sme_populate_pgd_data *ppd)
+static void __init sme_clear_pgd(struct sme_populate_pgd_data *ppd)
 {
 	unsigned long pgd_start, pgd_end, pgd_size;
 	pgd_t *pgd_p;
@@ -106,7 +106,7 @@ static void __head sme_clear_pgd(struct sme_populate_pgd_data *ppd)
 	memset(pgd_p, 0, pgd_size);
 }
 
-static pud_t __head *sme_prepare_pgd(struct sme_populate_pgd_data *ppd)
+static pud_t __init *sme_prepare_pgd(struct sme_populate_pgd_data *ppd)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -143,7 +143,7 @@ static pud_t __head *sme_prepare_pgd(struct sme_populate_pgd_data *ppd)
 	return pud;
 }
 
-static void __head sme_populate_pgd_large(struct sme_populate_pgd_data *ppd)
+static void __init sme_populate_pgd_large(struct sme_populate_pgd_data *ppd)
 {
 	pud_t *pud;
 	pmd_t *pmd;
@@ -159,7 +159,7 @@ static void __head sme_populate_pgd_large(struct sme_populate_pgd_data *ppd)
 	set_pmd(pmd, __pmd(ppd->paddr | ppd->pmd_flags));
 }
 
-static void __head sme_populate_pgd(struct sme_populate_pgd_data *ppd)
+static void __init sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 {
 	pud_t *pud;
 	pmd_t *pmd;
@@ -185,7 +185,7 @@ static void __head sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 		set_pte(pte, __pte(ppd->paddr | ppd->pte_flags));
 }
 
-static void __head __sme_map_range_pmd(struct sme_populate_pgd_data *ppd)
+static void __init __sme_map_range_pmd(struct sme_populate_pgd_data *ppd)
 {
 	while (ppd->vaddr < ppd->vaddr_end) {
 		sme_populate_pgd_large(ppd);
@@ -195,7 +195,7 @@ static void __head __sme_map_range_pmd(struct sme_populate_pgd_data *ppd)
 	}
 }
 
-static void __head __sme_map_range_pte(struct sme_populate_pgd_data *ppd)
+static void __init __sme_map_range_pte(struct sme_populate_pgd_data *ppd)
 {
 	while (ppd->vaddr < ppd->vaddr_end) {
 		sme_populate_pgd(ppd);
@@ -205,7 +205,7 @@ static void __head __sme_map_range_pte(struct sme_populate_pgd_data *ppd)
 	}
 }
 
-static void __head __sme_map_range(struct sme_populate_pgd_data *ppd,
+static void __init __sme_map_range(struct sme_populate_pgd_data *ppd,
 				   pmdval_t pmd_flags, pteval_t pte_flags)
 {
 	unsigned long vaddr_end;
@@ -229,22 +229,22 @@ static void __head __sme_map_range(struct sme_populate_pgd_data *ppd,
 	__sme_map_range_pte(ppd);
 }
 
-static void __head sme_map_range_encrypted(struct sme_populate_pgd_data *ppd)
+static void __init sme_map_range_encrypted(struct sme_populate_pgd_data *ppd)
 {
 	__sme_map_range(ppd, PMD_FLAGS_ENC, PTE_FLAGS_ENC);
 }
 
-static void __head sme_map_range_decrypted(struct sme_populate_pgd_data *ppd)
+static void __init sme_map_range_decrypted(struct sme_populate_pgd_data *ppd)
 {
 	__sme_map_range(ppd, PMD_FLAGS_DEC, PTE_FLAGS_DEC);
 }
 
-static void __head sme_map_range_decrypted_wp(struct sme_populate_pgd_data *ppd)
+static void __init sme_map_range_decrypted_wp(struct sme_populate_pgd_data *ppd)
 {
 	__sme_map_range(ppd, PMD_FLAGS_DEC_WP, PTE_FLAGS_DEC_WP);
 }
 
-static unsigned long __head sme_pgtable_calc(unsigned long len)
+static unsigned long __init sme_pgtable_calc(unsigned long len)
 {
 	unsigned long entries = 0, tables = 0;
 
@@ -281,7 +281,7 @@ static unsigned long __head sme_pgtable_calc(unsigned long len)
 	return entries + tables;
 }
 
-void __head sme_encrypt_kernel(struct boot_params *bp)
+void __init sme_encrypt_kernel(struct boot_params *bp)
 {
 	unsigned long workarea_start, workarea_end, workarea_len;
 	unsigned long execute_start, execute_end, execute_len;
@@ -485,7 +485,7 @@ void __head sme_encrypt_kernel(struct boot_params *bp)
 	native_write_cr3(__native_read_cr3());
 }
 
-void __head sme_enable(struct boot_params *bp)
+void __init sme_enable(struct boot_params *bp)
 {
 	unsigned int eax, ebx, ecx, edx;
 	unsigned long feature_mask;
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index 2e42056d2306..5962ff2a189a 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -61,7 +61,7 @@ RESERVE_BRK(pagetables, INIT_MAP_SIZE)
  * any particular GDT layout, because we load our own as soon as we
  * can.
  */
-__HEAD
+	__INIT
 SYM_CODE_START(startup_32)
 	movl pa(initial_stack),%ecx
 	
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index e448279a0f87..0cbc992c39e4 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -33,7 +33,7 @@
  * because we need identity-mapped pages.
  */
 
-	__HEAD
+	__INIT
 	.code64
 SYM_CODE_START_NOALIGN(startup_64)
 	UNWIND_HINT_END_OF_STACK
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index cfa18ec7d55f..16aa1f018b80 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -24,7 +24,7 @@
 #include <asm/nospec-branch.h>
 #include <xen/interface/elfnote.h>
 
-	__HEAD
+	__INIT
 
 /*
  * Entry point for PVH guests.
-- 
2.49.0.805.g082f7c87e0-goog

