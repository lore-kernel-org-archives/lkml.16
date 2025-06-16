Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E531DA60F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077430; cv=none; b=PZV2Ar2KJZYBRcZLvGM2qu1w+xmYyvWw9tDWmlNeYRrHgF0LtfEsCyQNnzmAAi0SFQGtY2Q8ZzOj4PAG3knjrhBXF96/4Kc7uo6/VzsHRVyY0dgmJ+IW1ZbTMH7gWPF/q9P+ItCfyqvduOi/S8JJ1bR/jJtgNg71xtcwtbktWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077430; c=relaxed/simple;
	bh=iqxpQ31NnIr15+hxa1grefLGXBJHd71+OgICHQ9pOd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QL/WSl11ins6qxVWo2u8+hg8EdrKKejU7zwjXHrJKkTl3UQn2Pe274xf1zkGLnrJA0Src/6RuR3KeAecxMvuyu+xIMT62SESGj5aYxDXeFSimIsYiSDM8TEK9PbNwbrvrdqRQkpwXu4bGIcD3iuFGR4No57ZKmFyn1k3LJ1FVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFthRNVO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFthRNVO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad93ff9f714so786164966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750077427; x=1750682227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVrCDLR9+fe8Evk2gmSpRa1xvcJ0Jsx0A+L7DiKuD0M=;
        b=DFthRNVOP3g5bfZr3oH+f4SKQxVfgOgJvATRoa+4wPO1p0TfR4iUUErf6zmHFeeRAr
         0NrMDXGqK3pKUOXy2qO8+N0QBkfXVCK3GkZV6V0mGYXf3ZGI+c1ih+U/pBP7SsV4Cyso
         w9wzTwF4lR0FNOG6aVgOLYP7IiZLE3vgcxLtnDrEaUrmL14WUQhcpw4Qeh3S/Z+m5mw9
         xiVttEhttg9Qfjv4cAWVsR90nja0bgL+p8xq5zX4EPPMfzIgGOQdscmMfKzbJI44dT4c
         AGxgi6GjuzaPJJLYJQG/6kYLsv55vzvmNkWA9viy7HurN31YljVi1kOQVOSBT1FEqEMv
         a3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077427; x=1750682227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVrCDLR9+fe8Evk2gmSpRa1xvcJ0Jsx0A+L7DiKuD0M=;
        b=gExU03edpmSZOVmLBLB8KG3JO5L4vH3jK1lDJMcJnPOVHBJO4A8KRVblyEp0Eli6wE
         na2wS/ggzDVwwjYhrr/2lEIlvOog/EalgY6mE6kR36chwaGrYtP/2uXljhyFNY/CnUDX
         HrGy6dFdCwHrcgHR51UYIIehJSCT//Uzw0X9yh40f5+bEBjyREOEbB2UK5VohO+l4Fhk
         M7tSXVU8S5WCawrf8a4F2z96R48vOkeIongD6FIgrLmkmTyRLuQYIvHhdHlfA/qf9dM6
         eaNps3kNPBrq0U0LNO00hvLgw3fBS+Ty1p16JFoWKKmtFATAz6cogpUIzgY+HeB3xKyU
         RMTw==
X-Forwarded-Encrypted: i=1; AJvYcCUs6wydWXGHDq6hf07VMIVBT4sXfTAFX7ACuJz0RcrEF4ndP1sE+NNL82HlbmJzK8E85AUb+J940NQrVjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lQNXhTAJ66TIgN0/pxIz0aRB4zALfUASJ59EjNo8a+SwxpyW
	bor6sQ0clKcbrdpZKWBmdVSL9cSE3na6HsoeGQM3g9pUkmOImFo2qhxc
X-Gm-Gg: ASbGncskKVPx75bSPRrfKfQRV+6gQ2QwQSpudGUOtsv5+eQn3QPZSOIVGmAE1Ei6uw7
	mmDc2wlhzTzcw7ETidUtPP6JGPOA3eO92RepkQL0sZA/2wJ8HFJqcn1jGPZDpmLnw8e6L5f1MFk
	jI8ns3SbBkx7k5X490eI4r6RifabRKJP7IyGl7uHpQXoJh7JEQjdikSJEf4Pk0zUnA6xmtkJQWf
	e38dZTmcgJq71iAtoDSYc5vB7+OegBHITf5+A9eW5L2DCuXDJyyoNTw2BeaKjJnIqKgkTubBZnu
	tBVpRklRblQ9oVl9wfXm4Lk4aBAxtVrhr8jSNxBXm2tH7yN/XX2vtUElgBvolw4oPiy4FOGXElo
	WRg==
X-Google-Smtp-Source: AGHT+IEuYhJ950tKZ8R3D1FckqPYUE4h8XjhQkQHD0ltwNT6UUWZK7aIsz8//f3kzyOOQyzf1kmw3w==
X-Received: by 2002:a17:906:6a1c:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-adfad4f4e53mr829632566b.50.1750077427007;
        Mon, 16 Jun 2025 05:37:07 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec89299c2sm652325066b.119.2025.06.16.05.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:37:06 -0700 (PDT)
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
Subject: [PATCH] x86/startup: Let the caller retrieve encryption mask
Date: Mon, 16 Jun 2025 12:34:13 +0000
Message-ID: <20250616123605.927-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

Don't return encryption mask . This makes __startup_64() to handle
doing the actual work including encrypting the kernel. The caller has
already access to encryption mask and can directly retrieve it. On C
code, the caller can call sme_get_me_mask() and include /arch/x86/include/asm/mem_encrypt.h
directly while on assembly functions like startup_64 the "sme_me_mask"
is directly accessible to them if CONFIG_AMD_MEM_ENCRYPT is set. This
also makes consistent with the way secondary_startup_64_no_verify label
is handled. On intel CPUs this is not even neccessary, so we should
retrieve the mask only if CONFIG_AMD_MEM_ENCRYPT is set.

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

