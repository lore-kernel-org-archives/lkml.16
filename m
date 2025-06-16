Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0320C030
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091900; cv=none; b=QSOa2+wYyoDhmH8hurOw9MvmFQGU1S0nJoVj+tiQLoJCqJDJIaa4oobWLFzPimS//K4QyQIcUgt/V46xZPrpd2PfNZkPXt55JNeTs+Kg6dDFQSLZLNhAJN2qp0LseXBf2zurVp+GhqruhBf+aoek31xhrFmmREH6ZBcs1xzC0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091900; c=relaxed/simple;
	bh=VdMj41CG/GoyQ4OV5XmdOE4S5q9Mz3+ag815Parhci4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DsLKRJmy7fw6uOoJGOuVx4Gsns18YMBGJR4/w+ol6pmNEP6zZrgKEcxcWh8XU+F4IFNgfQjYRQgbemy94X3sGPfk6Lv3W3YDzsp+I9oybL8hhgV/9AUZ44s85DGK4UJfxtDyJHUw9Uen3+k2+xNCtBkCQfq3ajtqGqqDQabMe5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwB3kfEf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwB3kfEf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d54214adso36958545e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750091897; x=1750696697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVOgHFnjJbaqD7diLL14lAkNgZLvbg+9Qxk9fcigUoo=;
        b=KwB3kfEftSHD4i2ychXQKmyIO1PNzkQc38fsOO3BVYDfjBnxSiCttx0OuKh9AjSWBv
         KMr235wLXghfj9FGw8eRH3HkDojWj+pznEy23S5dFBMqLqOicGo0u/G1Xmh8kM31IAvr
         urIZ4o2456km+xvM2ETzKCuFkkeH0wrHm+ricMVgi4POI4hTj2fYVr41WdZqJi2Cxccx
         J4ZJ6Q0FkUys2zHd3CB9DBdXRSQMSxwEZJPiNesGHv8bLS0Xibk1QUN/GL1aXXHL0f8C
         ewPVoO5v25r9aBR/fZB7wg1pGQmfguuUL7DobWwZFykhsBhoUib0nBuyRjqBIOvEtxgt
         yhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091897; x=1750696697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVOgHFnjJbaqD7diLL14lAkNgZLvbg+9Qxk9fcigUoo=;
        b=gwmBHYgJsci6I9BjkW/52EAn3PJ496KdxG6pPxHMTOV6vNTz4NR8x5FBQ4LRXbR45D
         vGs4CXwVZ/Qjt+I8OVQ397IvNGZXp+LZihuJagBlXJ7quzpFlzVZ/64xLDKKQzrOmLpr
         jpNVo9RU221GYFWCPG+9rIQloKVmyoIUERBnW9hhhN96uQPfZXfWDQe+spyTPa4OdloT
         6EiGlqiK4Cit84U6QqgvuSTxJsIfqptgExBL0aKrSODt1JZe4GVKmxVE3faFb2uZD1hc
         FzziSZKrlF1pdysFXiDxVSO/9AlMe/GJ13W6nN9R9XEXIO0/bX4sZtmRye/z6ER6Ma6I
         es1g==
X-Forwarded-Encrypted: i=1; AJvYcCUUcvaL7LKDLcZpzJN1utN5ESarFb7qBzf8s0wVIGHBbslOUoc1ouLhunuqWfykTzPbeb136mCgMIaBE1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4H9Qfse4xxq/6soyuj6rs3rbzAs2tpNfl0PTeXqVKKDgYQHj
	lphqP0Z+4YyXTFR/VQKF7FX9AlreMMwJmiGpc97PWwkdMSduLw3iE/0F
X-Gm-Gg: ASbGncsvU7mWrOOlzF6GK2v0dVvcHc8hDonyp/VKYYANtHSDvL5ALW09UlqlnUTYc9n
	qhdmuD89KRC+ntdhozoY4cPf5kOPFyCxOGvYV827zwArRP1OL2pxnSvemwdv6c4zzP1brfgEm1Y
	Rn7wQtL4vdaleoSO6DI2xQk5dskFNt58/QIB6q67ENGk0pqKIgP4a+95GCtGV6TLg896zOvoEhg
	HYoZnqyji72zK2sB8FlxBOwMET2Eh91RFrXQdDFXUixlMAIfusOjkHJrQKBD7DC8Teqrg86iK9O
	YJmXTDBk7myJmrAEY2RfX3HfsbTFF9NUJzHetYMrs9rN6BVSngt1vehL5XpTG1EXFoMIj0WjrM1
	0HOHWFdNkBFA=
X-Google-Smtp-Source: AGHT+IEQDiZywIsXkW6ShknHqUsaYVDHo6ekrrWnpwL3ayETYiM2Qs7R99o4HPioFiT8g3kaKRocng==
X-Received: by 2002:a05:600c:358b:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-4533ca4681amr94620725e9.6.1750091896326;
        Mon, 16 Jun 2025 09:38:16 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e09c2ffsm147725575e9.18.2025.06.16.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:38:15 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v2] x86/boot: Don't return encryption mask from __startup_64()
Date: Mon, 16 Jun 2025 16:36:12 +0000
Message-ID: <20250616163704.849-1-khaliidcaliy@gmail.com>
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

