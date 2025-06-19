Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456A1624FE
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318674; cv=none; b=rGmi2VrTVPOdVsb8pY8om7HgtOG2sMUCJHl2qTxIG7l9RFpI+9RmNTLIVEzLDeFYnXpux/4y9juMSE1fZwn52CL20L/QCLCSp3sY8S0f8MUjoC3xEpM76zko7zQvFXZI7Fvt5KoO6Vs4Gj7zg1g5flQLcSrng4PP0wkks6ofyKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318674; c=relaxed/simple;
	bh=akaZczTF2gdmBshzFpx3nJg0YRraZAelbZb0br0sQgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=by2FUcgeYhSgGmx4dwaGk57lG2puUX1XD9lw0ZKqXT2ECM5TK4CQ3py+6Wrri+0KvYkcssg6mJIexCMyLa53FBCFI3KZDoNZfwMLwu0KEpoghBwfa5jVErySTXm56cvDkH9MlRlYlsAVD9f4fUKIrpyIspEB0W7RPnU8UhyrDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVSiSXrT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVSiSXrT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so5349665e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750318671; x=1750923471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVOgHFnjJbaqD7diLL14lAkNgZLvbg+9Qxk9fcigUoo=;
        b=DVSiSXrT8CiReOfWuog6VPjEKbEjpNANh93NIv57mmOrgyWbZvs9OOViZicDwM4Jow
         zFDbU0wGvhDcFUnFbmCsDD9wnlVMLRsy5jOU+irx31RGSm6NBU7yUu2bxup9iwTBKzOD
         WI+Q0FjDyDxvKalFuDgFzN6uNzqugrXP2dD2dP1pE19KKheyPm40gCRWfuCMaCRWtmbf
         j0857/E73vjej1HyPfBAKUu95RgTD0Fv0K2KJk9bXeCiwtEj0sF9eaCTTkKn4UTd85se
         Og+0oG2xDIA5Ewa85d8KYGzjzY5dyMgcdRfrrSTlJnuHG7XESZYM0m8G/zfq9KOSHfBO
         gvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318671; x=1750923471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVOgHFnjJbaqD7diLL14lAkNgZLvbg+9Qxk9fcigUoo=;
        b=FFnjzvq7++ZNZCFPMglF3po7+X0yJ2L8BmVCsE/vpNHC8vvWFNHqu7CwI+ksZWdl8W
         vRQ0iolHOxRqxGL3BlFBDsTRxYO4PG619yiiSKAr5GPX1NjHRpxJH6FD1n78phGZAXXG
         yTuJLBx1AY2Kpo9cL3FMXnITVrUBXamTID0ZSS7g8TY/p+vCl1jG0tNu/3YZFR/u1ADW
         v2etfRRTG4L0t6TZRiWHd3cRCiGfhK/M57YxPSsHS0+Rs1wbP28zjRmccUAuLqlEoOBC
         xX2S/0bRL7JSSfRAPqsrI8LckGvOVmTrVh3qGkPZC8c3O7k2QllFpwbwVC11T34d3wKL
         4XRw==
X-Forwarded-Encrypted: i=1; AJvYcCV09pvTWR58c9ETA/Eq0YP6gorN0470P2hfBB6quYqCL0F4bezyKFQtJK0T5smNEJgypBPxgND6lZUEWyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fsahe8QouHfQolKtZkTQ/MnjOFbRbaREWV2z/SX2wTfTLHFw
	BNrJqGZA0mQP0nAqyLXvL1xcZezNquEKiEcbve0WKXwFYomQAU5tauLl
X-Gm-Gg: ASbGncsiFDCfIp3Y6g7yZWJdW7huuqSesfZgvxDENx/tLhKKQNHXM0Wc0XdBi8Mblem
	gZO631L8mbBCgGmVNu3V7mq0hmsHdQrQ37TmiZA7Y8ePjkwTZ9gkl46LBb3tKYNpXpWm8v3vRG3
	15CnEyxKriWfUAa80dD9CVscMBsT4p2CD0+1SF81GdvltwB0Kf1NQnhbEwGQ53+R7kcNsVhRtpk
	e6S6XGZOhn3UbuXjRBc09kmOhQnduGKhJNHCq3I0vAXWXintT5kNhsYr38nfzdPcb6KtRq+Ya3W
	cjs+yNU6DUrUWuvSJfEAlaCcp6EQVW63BzzgW82LtuP5VhQquZoWGGJD0aidHeQmxAAmmNujiZd
	0qZbhC0dm2R4=
X-Google-Smtp-Source: AGHT+IEHGYIqo4gZVkl4ew6hdq/I0SmHrA7X0AmmU6KpNHc08cIAsqosFKRlUDs0z0x7wiMtKR0C1w==
X-Received: by 2002:a05:600c:6749:b0:453:6150:de2f with SMTP id 5b1f17b1804b1-4536150df02mr2753755e9.1.1750318670553;
        Thu, 19 Jun 2025 00:37:50 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d74sm19083448f8f.10.2025.06.19.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:37:50 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v4] x86/boot: Don't return encryption mask from __startup_64()
Date: Thu, 19 Jun 2025 07:36:48 +0000
Message-ID: <20250619073652.719-1-khaliidcaliy@gmail.com>
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
 arch/x86/kernel/head_64.S          | 12 +++++-------
 3 files changed, 9 insertions(+), 16 deletions(-)

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
index 3e9b3a3bd039..8b50bdd90927 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -106,18 +106,16 @@ SYM_CODE_START_NOALIGN(startup_64)
 
 	/*
 	 * Perform pagetable fixups. Additionally, if SME is active, encrypt
-	 * the kernel and retrieve the modifier (SME encryption mask if SME
-	 * is active) to be added to the initial pgdir entry that will be
-	 * programmed into CR3.
-	 */
+	 * the kernel.
+	 /
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

