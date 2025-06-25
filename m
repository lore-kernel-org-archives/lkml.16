Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C72701D8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867410; cv=none; b=dmy2wB0Pu2BPU+c8QhhUAPv9qKNy1q7KTfb3y2PVUpgMhVG2Q0ggf6MHJJf98W6pXF2GCs3SNKjUtVAB+0hTBcdwUvUbf1TZpY77wff+w7nra0iifhOziTS+JRfG/FFyHq2hvhip9PyHci/ifVUYKnT5RL35FOxNFBN+svLVidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867410; c=relaxed/simple;
	bh=+Tn3XMEuIl+oO9cH/X4OHCBkfYT4u93OoaGdjpzI3x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFokm6/4lOqBtY8dsPKp+LyQEIgCjzBoBQnNtlTaamnJilvO5q9TgQ9LgIKFE3EQAxJHMPtPOmV84pc4Ahp2KhC56K6KL1mbTBvxyFX9QA0Oj8optSKxcwIZa0p/gWsY0DrrBD1ameCPS6/lESX8X/E3lCzn8U4CGgjqDPnMzKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV6mRoz9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV6mRoz9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-addcea380eeso12481766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867407; x=1751472207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+o7xhfLbwy8knh/+QcuI0nvWF/uzyMkygKurrRJTxE=;
        b=lV6mRoz9A2v4sYATJE9A0R0osKQbbWfgMtYOlSABpAGUIA11KWH6BIUwWMfn0EwtUR
         tnkmFy5dnmSxxfcBifeXV1E6znPnHRKstHqdTQ5Ewp0Kjb+WCCv9DNeWW4riIjAAZI2o
         xc1mJaqYhqzfg5tmNm3ZxTBwcW2xpZYvJcDzvRO7xq67VApgQblLo2XuyRbK0m76VUIG
         9KKXgv9F2ZHzuDWjBeJFvlKv6jJOcsIg+Sxz+tlfTHtlIkghBjqyculRI+hunvSVCNIV
         Kue5XWbma5HfIE21e2dDA0hGH2IetGqkv1ka5tmalHdn9e1cqfhilSvSqiKW0n4UtpIY
         GkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867407; x=1751472207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+o7xhfLbwy8knh/+QcuI0nvWF/uzyMkygKurrRJTxE=;
        b=qNFhpe4zL1Jlqq0vv38crIXsvSs0kTJfmuddR0z7K/YBTdTlL0q60it+TsBqTgCsQi
         Y6k+L1H94UxgBDFnUtNnf1Gp7UqI2liYdc0tkg0yTZ5X0/s846OfZSVByM9468sz79Y7
         8xERSeO1mUpNSimia6/ewwbFgfHp2kS+dCe0blK5OYmpiroas3PycDzMKJC4L6dug966
         5jhtrS9GcBYRVk8Mr6l4hWJhQns6abD55Hb9nGXbXFdjVfq9U+Onjj/TeuDZKwEID2Yd
         OWoe5IRYo6TGJthRAX0/gsbiNBouiqPQOJN/NBNHcCPMhXlc1bRoUYjhUas8VAoF6fP3
         Tprw==
X-Forwarded-Encrypted: i=1; AJvYcCVSpOgisnwhwtt6FZl5zc79r/G6qEkl+T4P2msLUBvQnbvalPSbl3dsLnoqlz/9yu5vBPfxFG4azu+Cr2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz14pKx7c5+WlXMQGasZld1E1dbB+/4JtkO3XCsb5FgXBodndop
	slEYXjO+eKv3OLmGfQXusLZ7DOBRPNmJN4SdVF3kG1Lj9Iv/LOSmZtYp
X-Gm-Gg: ASbGncvnxEGoGcLDOlbs9yWRS5V46CCxR+nq590TdYtMee7WmkPCuPiZH3FbvIUDAUS
	q2WzVWDePttV+77fHt+/+HQiKEW56MsVsZmgIXdXTnQjQfA+V5kdTOW1bHH4x905aDYKgdwhJM+
	RBfs/0SJ/0PkV74qOx8Zi1aMRgOSZWp7ZgnXl7BQs2mwT13APIfphNb1kKiuHqQri+0gQsBku7K
	A38JBH+qKH4aalZmxdftLPoZt8VW22SeT6ymFkcXjUQSYxhvvx6909pMzxbO4c3T2BW6fb1l4Wg
	PL08MNUOaM2U4+bmi1A4lqpQWeygy/8rJ9qRLR7oTy5KuuFr5mx4p/yhzCBoGKtbVwyBv8B+869
	OsVEBO8pYuCs=
X-Google-Smtp-Source: AGHT+IGoycNFcDmuSvIbsMjNAdlhKOWh4IkP3o5+4CJMpXCvYqdA912JS855QdwUKDvPZ0uITUoQQQ==
X-Received: by 2002:a17:906:c10a:b0:ae0:628a:5093 with SMTP id a640c23a62f3a-ae0be7fdd39mr435167866b.3.1750867406425;
        Wed, 25 Jun 2025 09:03:26 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0c8f2b340sm87299966b.122.2025.06.25.09.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:03:25 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>,
	Kai Huang <kai.huang@intel.com>
Subject: [RESEND PATCH v5] x86/boot: Don't return encryption mask from __startup_64()
Date: Wed, 25 Jun 2025 16:02:36 +0000
Message-ID: <20250625160238.734-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

Currently, __startup_64() returns encryption mask to the caller, however
caller can directly access the encryption.

The C code can access encryption by including
arch/x86/include/asm/setup.h and calling sme_get_me_mask(). The assembly
code can access directly via "sme_me_mask" variable.

This patches accounts that, by adjusting __startup_64() to not return
encryption mask, and update startup_64() to access "sme_me_mask" only if
CONFIG_AMD_MEM_ENCRYPT is set.

This cleans up the function and does seperation of concern.
__startup_64() should focus on action like encrypting the kernel, and
let the caller retrieve the mask directly.

CHanges in v5:
 * Improve commit message for better clarity.
 * Fix some issues returned by kernel test robot.
 * Add Huang, Kai Ack tag.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
Acked-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/boot/startup/map_kernel.c | 11 +++--------
 arch/x86/include/asm/setup.h       |  2 +-
 arch/x86/kernel/head_64.S          |  8 +++-----
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 332dbe6688c4..0425d49be16e 100644
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
index 4d654ed7982e..c46a175a2a12 100644
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
+	leaq	early_top_pgt(%rip), %rax
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
+	addq	sme_me_mask(%rip), %rax
 	mov	%rax, %rdi
 
 	/*
-- 
2.49.0

