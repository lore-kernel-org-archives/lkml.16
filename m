Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CC286353
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461428; cv=none; b=cx+Voy81kyZypcQqdmsm5WM44bHG6qVMz8R/Umjg0VbwU9p+nHVZvDvs7ogPtibUMLQ9rchjhNF3AK7A1KZQWMUgdmWdUCY3E7RXlYsJhRbNACCsNbvHDmZSsyczLixaIzWvS4xJWh59KrI5cCY+pW2Pg38GrQMzXz/cgfTgc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461428; c=relaxed/simple;
	bh=vBm1Go51HZB3lC9GO9QD98n88tObdApN44SRG+aV8D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OlySsezcvep/9x1CMVyMrrsxpnWdhsLWt82hG2ACLi27KJMa5tFJiQ+SsbFjhN0MNssy/K/CPa2o5i8HeO8DGAww7R4McZqQ4cKg2MTc/5pWkNazxL0QUpQAHTCmRZLqUUBldvkwKo4E0wx7U8UwSbZzIxu/8+sH5Kqw1amI+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKBXaXO4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKBXaXO4"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so757223066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751461425; x=1752066225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGzCzQ7v9oVvSEbBppuxeCe/U8mfygBOKWZ9kx4AUxo=;
        b=GKBXaXO4YEPRgDHF0M6XX5E4f0ZL4f7dsCUdFvcGVxlaf3vItAujdnVSktQusFR/Tu
         ilJxOIRlZDGEheVOERLsOdL8Vh/yrZnqGPVbIcFJpp09yc78HZd5UaNDBjaoyBETTLQD
         Va/8Htl5EW+PmtVzNfwM2lM/OiFbuXD+M0RU0ZF6cOpAvm9WgS5/Z+mfoVvoeYN7l4hB
         L3CbABA3ZLeS8P8Y5zNRIvBKI4MM7SXCJhAr/LYTADSCj48hobdkKtrFaIyj3rud/vjn
         Oorkrb0XllBg3LIwDKXwYcPWBUEhEw5JwReWUDyAuDxgsYErmytxjr3zm+w5WC36w243
         MyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461425; x=1752066225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGzCzQ7v9oVvSEbBppuxeCe/U8mfygBOKWZ9kx4AUxo=;
        b=SlyelUo9X1ai5pcH88n76oNuOqFZTi+/aWe19AKd1SZBJ1MTNGy9R2zasurQXh8r2v
         lzB3ZxQgxr2WWfymkjrvVOk8RETs5XKHGRHIv1d5bXBxQSRpqth6+tkiQ2iDx2+mgf8Q
         cpJNiGnVHeAqbMf3OV3XwxQajeZtPk4np++GpW396yCp+iMtAptefa1hYvJlimeSWZke
         TNn3Nz0LdEGTuyLxEUhOc9zBVqjXJLFyYThZGjOFEg4BmsXLlgKma+VP8UnswgQWdkbc
         mQ397w6s8vaFNgYn8tdTeO+wpHUvt5mS6NlXmTr/6stw14qkDuDuef5c1Ce3b3SncSEA
         fPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuZWTaNBY9gIx1aoY7UxA/pBgZKpMmSiDYWAlrJA0UKC06V2YUhs9avMXNvlqJWK8sgFB8DAc0nv8s+fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDF5c0+wCVxAg2Ko4VQO1ANbIw7DBYcWR59vmPcsgUg0hlNWo
	vYBLj0M0axS+liIyHD/0kkhCmsw8tgUokrNYQXhMx6Re0snYVlGsaNg5
X-Gm-Gg: ASbGncu7HNS2yv16vIXxE34VK2fjyGhVC3Wa69M8VIuvI3qyOT1UQNp4fDff1gHDozD
	Qs+Q5AiuQlNQZhiVjgmU5eJuWfE1JiHz8/O/EYB9pjOsmH+qAjlkgzgbuYpSiEbOYvP0uSTxYEO
	9Ll80+P3enZzWt2jVoxOxXolty+yRA9C8/9L2mDfBjqv/8Ff0rMvjPRRYm/Xf5urAgC4hBimHPf
	ychjxxqAPxIWBpf6EUO2sJ8B5+JfCWfY6tzSmLpx0vccGX1uUJnADBe949u5y7Uxe0ysLvFffSQ
	pe3lx1iKHrPIIRzTf5/ulK68IEvnDthiJH7FIS9YItjB8QtJBLxDfsWGiryd97VRihIsf93wPYj
	L
X-Google-Smtp-Source: AGHT+IFS8JdrFoTuPpoO116N/hA71ptbIDTadCblgRjHLBzIK8bRje9OJKwRWvjBBo2DqXSd7BiAig==
X-Received: by 2002:a17:907:7ba7:b0:ae3:bd9e:589f with SMTP id a640c23a62f3a-ae3c2d2cd67mr291819166b.38.1751461422998;
        Wed, 02 Jul 2025 06:03:42 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20a0sm1087829766b.177.2025.07.02.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:03:42 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaly@gmail.com>,
	Khalid Ali <khaliidcaliy@gmail.com>,
	Kai Huang <kai.huang@intel.com>
Subject: [PATCH v7] x86/boot: Don't return encryption mask from __startup_64()
Date: Wed,  2 Jul 2025 13:02:31 +0000
Message-ID: <20250702130252.881-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaly@gmail.com>

Avoid returning the SME encryption mask from __startup_64(), and instead
let the function handle encryption and fixups only. The encryption
mask is already available to callers and can be accessed via
sme_get_me_mask() in C code, or directly through the sme_me_mask symbol
in assembly, if CONFIG_AMD_MEM_ENCRYPT is set.

Make mask retrieval consistent with secondary_startup_64_no_verify(). 

No functional change intended.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
Acked-by: Kai Huang <kai.huang@intel.com>

---
Changes in v7:
  * Improve commit message for better clarity.
  * Add Huang, Kai Ack tag.
  * Fix parameter aligment.
  * Fix patch style issues.

 arch/x86/boot/startup/map_kernel.c | 17 ++++++-----------
 arch/x86/include/asm/setup.h       |  2 +-
 arch/x86/kernel/head_64.S          | 14 ++++++++------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 332dbe6688c4..3731896cd2f8 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -30,9 +30,9 @@ static inline bool check_la57_support(void)
 	return true;
 }
 
-static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
-						    pmdval_t *pmd,
-						    unsigned long p2v_offset)
+static void __head sme_postprocess_startup(struct boot_params *bp,
+					   pmdval_t *pmd,
+					   unsigned long p2v_offset)
 {
 	unsigned long paddr, paddr_end;
 	int i;
@@ -68,11 +68,6 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
 		}
 	}
 
-	/*
-	 * Return the SME encryption mask (if SME is active) to be used as a
-	 * modifier for the initial pgdir entry programmed into CR3.
-	 */
-	return sme_get_me_mask();
 }
 
 /*
@@ -84,8 +79,8 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
  * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
  * subtracting p2v_offset from the RIP-relative address.
  */
-unsigned long __head __startup_64(unsigned long p2v_offset,
-				  struct boot_params *bp)
+void __head __startup_64(unsigned long p2v_offset,
+			 struct boot_params *bp)
 {
 	pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
 	unsigned long physaddr = (unsigned long)rip_rel_ptr(_text);
@@ -213,5 +208,5 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	for (; i < PTRS_PER_PMD; i++)
 		pmd[i] &= ~_PAGE_PRESENT;
 
-	return sme_postprocess_startup(bp, pmd, p2v_offset);
+	sme_postprocess_startup(bp, pmd, p2v_offset);
 }
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 692af46603a1..29ea24bb85ff 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -50,7 +50,7 @@ extern unsigned long acpi_realmode_flags;
 
 extern void reserve_standard_io_resources(void);
 extern void i386_reserve_resources(void);
-extern unsigned long __startup_64(unsigned long p2v_offset, struct boot_params *bp);
+extern void __startup_64(unsigned long p2v_offset, struct boot_params *bp);
 extern void startup_64_setup_gdt_idt(void);
 extern void startup_64_load_idt(void *vc_handler);
 extern void early_setup_idt(void);
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 3e9b3a3bd039..8c5956204ce4 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -106,18 +106,21 @@ SYM_CODE_START_NOALIGN(startup_64)
 
 	/*
 	 * Perform pagetable fixups. Additionally, if SME is active, encrypt
-	 * the kernel and retrieve the modifier (SME encryption mask if SME
-	 * is active) to be added to the initial pgdir entry that will be
-	 * programmed into CR3.
+	 * the kernel.
 	 */
 	movq	%r15, %rsi
 	call	__startup_64
 
 	/* Form the CR3 value being sure to include the CR3 modifier */
-	leaq	early_top_pgt(%rip), %rcx
-	addq	%rcx, %rax
+	leaq	early_top_pgt(%rip), %rax
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
+	/*
+	 * Retrieve the modifier (SME encryption mask if SME
+	 * is active) to be added to the initial pgdir entry that will be
+	 * programmed into CR3.
+	 */
+	addq	sme_me_mask(%rip), %rax
 	mov	%rax, %rdi
 
 	/*
@@ -718,4 +721,3 @@ SYM_DATA_START_PAGE_ALIGNED(empty_zero_page)
 	.skip PAGE_SIZE
 SYM_DATA_END(empty_zero_page)
 EXPORT_SYMBOL(empty_zero_page)
-
-- 
2.49.0

