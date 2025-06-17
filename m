Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E2D143C61
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145921; cv=none; b=l/kiu1/wQQEXC8EM2YhsHb8irPccjACFfjNKFaDKgKehcSDAo7t2s/kw77S/m0tY2FS9GWWDdSptCzjbRJTpdd9cf5mjYqJOYOainnuYJkt2VIDc5vEQN5V/xEp9wfy+4bumjhsPgKqEMk600Fe0Ngs97PCS/90IJfm63iCsg9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145921; c=relaxed/simple;
	bh=KZOING/mDVUKD5KJdkayGsXHbyafG7w0PcU3zLZ0gbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qayvaO1KF9BfnHU6YfY5cOA6VIUvox2BPIfSjBDyGOl7wFj0cd0u+7AgzIM1NrFxBVLwWQIhvS2MySUXnRu7Eb6vLlujvlbm7HE2Mbx3Z4eFeB+Z+/S/ULTCGsiDWbsJmB8UCdQ3dQvmcMa9IG4jlr4cOh6fgaUiCJAbBb9vEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNjpuvXu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNjpuvXu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade33027bcfso875374066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750145918; x=1750750718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fLZD03V0V23y4xqSX2E4ox9XKd7nBZzRlAChw4zNo4o=;
        b=TNjpuvXuBNo+lsJm22jpmQ2+Z+suBJlETpSGxpbwF0wOHscT6vFrarK/youvPF85y9
         6iAHVz3eITgzt2kEEK2Mg/2rlgm0tLtXfUyqx2VV2Hh7aOVW2O09zCmEO8hTE2RYdfq+
         DMeyFUjUMvU8FWAepNrl/rRNTvtES1zNmXDhqSGcuHWLoAYHZcP76a6dq2QXxxLrQrMf
         BeJfPMkOCqEmFbkDYqH9IFlSx4332aR3AFf9gj7lqRTEIr8rHb95FNJ4XikSGb59pvwA
         qJsv7kpOXXG+KfRWKNmozJIAWjsNGjJ5tscr+zbMTLcx1ya1ZLf+TwZfO3wI6bAPQFVb
         WzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145918; x=1750750718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLZD03V0V23y4xqSX2E4ox9XKd7nBZzRlAChw4zNo4o=;
        b=S4ViJVu1kByWx07aGPKl206J29354JqYyDY5Uysz7++4siRswKP0JW0AZFzZ6cXZwX
         XzFGsj+G3ZB9vtYsk90xYOHN4DTzZPR0lp1qPYi/qnA3DUADMi9ieum/GE6U2fh3dqbg
         YZezPXtR6kiCpweUl9oI63mrFoAPMZqnn6PPeoerMPC5VoTwySyyGon56IoUMKdbsiYc
         KrsAGWyFwRyFjQNuKxhuzvwjuMvUdvolLI8sF7rgKsJVzPubYsm7bFszB5f49R/mNDt8
         DTsn5Aj8BWsXMZcX8TJgY4ttpbnawUu3FfN5aYU3IQ7i0H0jnL1s8Zx3T+UNQC2gBgxo
         Rlqg==
X-Forwarded-Encrypted: i=1; AJvYcCUAbHSL3ZmkJt6+Nzj0GJLiTvYPE6qVGZJjdsv4HtAPq94+yjvaYT1ukwCIUjKiJd/5S6jzfY0ooNUuDEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqX2l6Eb520i2nvB6KQ7uaytwQMzkioOKhdv70Ez7Ihaw6X5Uu
	deL5m1T4OvOZjjWDwQ0woJgxtgt0TSBzx8mmvY31evLxCZyajNjStad6
X-Gm-Gg: ASbGnctR58HSuGTxPh9wSzDaTittAeTVtwjp/vtSnS4/ntPTwAtQEzB6otTYqa3cq9u
	lExv9jxIhwihrYnxeOnrWlajECZKx62uyebTcpInVaxWj9uDh2jUEJ/H4kyEi6WBppuUi3VJ64I
	rZ2EJ/qCIYiPa698162wk0CwkPs+Wn3MBpx+8qyXlna8TiJ00CZmBXN+pa7+saoLFSGDYyINQac
	KKwQp7PVNjdPteZRT7m7MMPmyrcPE/WSrM4ytfK3xu6udw0jSqpdZIV6jdjIwpsYzULsaSISW0K
	wH0QwGHDj5yUHkfNJtKV/lQfpBX86238EVd5sVBQ+ZIStKuuzUajVvtjvPgaQtig6lh91JVnmSX
	n
X-Google-Smtp-Source: AGHT+IGc6RFVq3svexj34tuH0LNYJ8Vd//MMWwEPANY9hQ2KdP4uaIcs3SmzBJ1HUvEI9wKz9IrSbg==
X-Received: by 2002:a17:907:3e1e:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-adfad487be3mr1065252366b.47.1750145917683;
        Tue, 17 Jun 2025 00:38:37 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8929e07sm813665066b.131.2025.06.17.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:38:37 -0700 (PDT)
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
	Khalid Ali <khaliidcaliy@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] x86/boot: Don't return encryption mask from __startup_64()
Date: Tue, 17 Jun 2025 07:36:25 +0000
Message-ID: <20250617073733.760-1-khaliidcaliy@gmail.com>
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506171012.Ji3c5sJh-lkp@intel.com/
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

