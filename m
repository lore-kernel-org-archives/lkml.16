Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7571E3DCF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150079; cv=none; b=WGSFCgxh1h/20FjFAdKtM99kXxlPwmAopN3NaYPFp8FBm1vrT9XoonAdft3TZNR7jkZi7w0iNlUrr9y46/NYZeXFw8zvlp2imw5DQsyEgBLOSFHyooZG1zVk01WN9Vc4zzaj8o30lX9w4KGn3UzYnMK/WdUcFX+3sVHg/hX/iKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150079; c=relaxed/simple;
	bh=VlWmSPgV1PjiqoBSuasdLioOpExD34OKldbn7qDwYB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1UvJPQqsqeJLBRzBVPau3nbVqlxwAZqqR8X5ZUptu1qNqiN9amD9Y+pG9i1lulISNfJZgZOYK5RfuLO6paI3H50cjCTPQB0j3hSfArbA28CN9yGUBxmFF/pOgCFJDCG3ns7osqgJV+Yk9B56B7GoZiOds5HUChsRmkwa+R/a1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYZNu/IY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYZNu/IY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453066fad06so40461775e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750150076; x=1750754876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+SpZuLBwukzwEpp0LTElP9gCCu2gWXx1DVuRQoCZ8U=;
        b=RYZNu/IY6pM9yFa+041uNQuU6EDk0S6EjZJFTjuTxDR/nFXBCw68nngSXJd+TtxdBi
         XLlDZo73SBLeVMFAe3xIhxTuVjvQlts3zAW5D0xiHVulUUTUO5efaDCPXU8EClbXjGl2
         vtNIMmq8xyw8TrGHDnqpbg1TEZOrQbgrbHVbbdTpP6Ht88AWSlDxKNyq09m1MssF1fln
         jOfeQfn3IelOZOexo1YaYgikUwNv2/nE8Iei8DVhMG7JKoSmWKQNvSYh3fRHfWmUjeVD
         XX6ZttWGz20oxNEvqmGtwJIZuG+M8umkhe9dHnWh28kyB/8y8Ok0fxtyVpjZ8UZXJM4x
         vk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150076; x=1750754876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+SpZuLBwukzwEpp0LTElP9gCCu2gWXx1DVuRQoCZ8U=;
        b=Ui72yqBUAoRTjcR2okxpV/sT8JbdaaXuO0dfHp2Hta7Fz07/A7x8bQMUpiCR2SP8UR
         bGOtbu2C6xnEW6DO/jVYelVUvXSsY0XFDvh0mYqMeIQf6msD15bnwyl/0IXDBlV+tYdt
         +ZoEqMOC0W8klT+Kw+Zd1RsEKmJTK/kqSW0c0S7KX2VWUU4m+4u4WwpbbTGHaU3hfmql
         T4COcAfnEh3luVAU4NervjWXpAOLX64TYDNDdjNzAhS1EUQRnJ5It1+LT5mINa5FeHTK
         jWLcGdh2+QbyvGzUsKTzj+sFAl/KiLZ48d72hXbFMObOcYotsHkAp7vbp9+9FbW86EIS
         67uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWldwsYLRHL0GKZl/ybDKs24UAEhUOhNA3rJqzOaPpR5jf6QqS01Z8B/xHo4ZQN7AwHNbokiforDvcH7u4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHhB0bVO5uDvqdOiJyo2Y0JK8oaGrlaDn3s9DM3NOsgGUAZQO
	ASQ63GEKr69fH8sMTpUMOuxshffBNeEggjDeLx+JD0nfEyT3U9bbSVZB
X-Gm-Gg: ASbGnctS+/J5ghpx7HUKylAavwF5eAi48M+twyMYIww22OzpBtotc32fs/mkHLW8DYH
	aMRZyAB1zZeib57LfyVk+OQmbDFfU3a9ad537H3EqMRYVJ/XvGPavLrQOSeuDF0sIYt1J1itNs2
	jZ8KnVQXNLSaJYGizX2nV1EEbXjVUOWkSw0D4f8PQPqafk+0SRimHwugRIiC2bmZYdKrehrrXMO
	PfyR3KEARhjn0h8prLHE6KQJ4rDtYQjvXAqqMNEwLXcZ5MCcYnRmBhAvdSHF6BY+DfmXMyYrc/l
	joAf7koACGJQ8dVWTuTTWjx3xDLLEYeeogT2kQVxkEil8ekWnStUUVWB/y6eDFhVCKJM+Zv0gvg
	PcA==
X-Google-Smtp-Source: AGHT+IGhSo4sTIxAKrr6iSdP/GPSFBv+fxRz/DzEUGmsb43kwWPBRI88SHOYqyq6LTAYoclrnvEfbQ==
X-Received: by 2002:a05:600c:1ca1:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-4533cac6479mr97494635e9.33.1750150076053;
        Tue, 17 Jun 2025 01:47:56 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e172b03sm167887695e9.36.2025.06.17.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:47:55 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	ardb@kernel.org
Cc: hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v3] x86/boot: Don't return encryption mask from __startup_64()
Date: Tue, 17 Jun 2025 08:46:46 +0000
Message-ID: <20250617084705.619-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid returning the SME encryption mask from __startup_64(), and instead
let the function handle encryption directly as needed. The encryption
mask is already available to callers and can be accessed via
sme_get_me_mask() in C code, or directly through the sme_me_mask symbol
in assembly, if CONFIG_AMD_MEM_ENCRYPT is enabled.

This change aligns with how secondary_startup_64_no_verify handles SME
and keeps the behavior consistent. For Intel CPUs, SME is not relevant,
so there is no need to retrieve the mask unless CONFIG_AMD_MEM_ENCRYPT
is enabled.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>

---
 arch/x86/boot/startup/map_kernel.c | 11 +++--------
 arch/x86/include/asm/setup.h       |  2 +-
 arch/x86/kernel/head_64.S          | 10 ++++------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 332dbe6688c4..6fdb340e9147 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -30,7 +30,7 @@ static inline bool check_la57_support(void)
 	return true;
 }
 
-static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
+static void __head sme_postprocess_startup(struct boot_params *bp,
 						    pmdval_t *pmd,
 						    unsigned long p2v_offset)
 {
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
@@ -84,7 +79,7 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
  * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
  * subtracting p2v_offset from the RIP-relative address.
  */
-unsigned long __head __startup_64(unsigned long p2v_offset,
+void __head __startup_64(unsigned long p2v_offset,
 				  struct boot_params *bp)
 {
 	pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
@@ -213,5 +208,5 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	for (; i < PTRS_PER_PMD; i++)
 		pmd[i] &= ~_PAGE_PRESENT;
 
-	return sme_postprocess_startup(bp, pmd, p2v_offset);
+	 sme_postprocess_startup(bp, pmd, p2v_offset);
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
index 3e9b3a3bd039..4390a28f7dad 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -106,18 +106,16 @@ SYM_CODE_START_NOALIGN(startup_64)
 
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
-
+	leaq	early_top_pgt(%rip), %rax
+	
 #ifdef CONFIG_AMD_MEM_ENCRYPT
+	addq	sme_me_mask(%rip), %rax
 	mov	%rax, %rdi
 
 	/*
-- 
2.49.0

