Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4627057A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406650; cv=none; b=OYbH9xYvSojX6FIT5E874vPhoOZ73FHtCc5q9In2HSfwoNqSWGzEgJJS7UDPN7GLeWbgefS548rKvXzixAxPKoc058axcUbUv6Nxd19PUWMWOQtlwSYUJBxbvEtfbtgJTG2rPHEVyFNACf/V7reZGGLaCGzlK9gK/kZrzHQKYCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406650; c=relaxed/simple;
	bh=UKVuMNXgWDMwNKunagylIuuLfdoGqqCt/psLzOz4s9w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PiTRHOf9bEQS7fW4+8pu7axxdIisDT/6jkszqiTj9oQMtpYmq0pT54Yuu4IQ1b+iDDjzIE9ZkDlVtz5wBysc2PpPn/9v78p4ZKO6+IYr7OH373KtlXHMcMM/1EuYRvcipsTn18jYZYaZbipqrW5iWs1WIb768A0R8sJtofssSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W2qm9zxK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W2qm9zxK"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-440667e7f92so28879735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406647; x=1746011447; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6JWp+ZT6BrY4Sz4JeRmWQuSD5qSLIPDKmpbbDhaooKI=;
        b=W2qm9zxKNp0VcsZMVrgpGUH3CK6jD0Q/8gThrqnDWCc8GndEA4jj8mp5F89BcK9e/C
         pYO3ct/wLaFTXMwVgwqDhgcaJPC0aq7BiHShlk6efqESgic5TrLix8q0PxgsWsk1OZbG
         7LVnnzKnOZ/7OP/8pmKdHlC64eQ/0iG9dpa1OFtfhOvzroHhmmWFGo1iu4DoEsaVXskt
         lXLERHdyN8Xs5BwwIo1Pt3yXkThg5W3gFLCZVgsyOwYqp3LN9X881BlLvDaNAAgnVi2Z
         dkkr/NAsGSL9Kj0HGueIeGfFvvzrBKmHG6oa/waom64hDUCanBxEBV2QrtouwZfd0KfN
         WzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406647; x=1746011447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JWp+ZT6BrY4Sz4JeRmWQuSD5qSLIPDKmpbbDhaooKI=;
        b=En4wp8HavHRYkstJueCgc0MaAqGpr81WaXkFjMULHuPHLDh5X3syB0hspv8KXw7+HT
         UEEm+enB/865913UsUdz04ZTpUSCJBobqIrhbz6SjDfgtWvX2NDGiRv5zvULctgTa5u5
         PZGkf89yXgBFYcz3ia6J2OyFsTLMQFIJwAN1VbVNx0LiVFwzPV5xgmk/fsj/5CZMCqrK
         OtG05DCs+guIb/0M0feviUMJ8Aps7iPYH7uxxNCgEMF1wItNBWsVgTUnCzByVCTQGPOn
         1wOUJxefHH+j3hw7dAU+9oiL4lEahaOnZdfAxpWuXVY7kNixq7KxWjTJ9sZTnEJzAyRj
         UAUQ==
X-Gm-Message-State: AOJu0YyqynNS3GWdP051lrrtsOHPSI96+tIi2GgLWQFfXycKi57FktJH
	Tl+gKW5XJrIHt+tJSpT4i+NRf3OHAyrxeefcdcKFIk4FOTcZf/RxFThIuqCkb25WeWYGXi5CbqW
	7GzLQm7e/6PJXHfkbkl1meTWUJvjiDV4WZIEOBKuEUEt2KkpfPuITS7JLmzP5OyzYy0I1dhk5jj
	QMrvDG7SvBlOkX9PD2AXz65cT7uOGglQ==
X-Google-Smtp-Source: AGHT+IEKdlz2Ty8mtbipgYfwruOiiGEmbg5G9d3KFT4V3uLCjVMBhsDFx+6/0indt8OGnyIS9TBe4Qlt
X-Received: from wmbfl24.prod.google.com ([2002:a05:600c:b98:b0:43b:c336:7b29])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c12:b0:43e:ee80:c233
 with SMTP id 5b1f17b1804b1-4406ac20146mr153023665e9.32.1745406647367; Wed, 23
 Apr 2025 04:10:47 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:55 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4594; i=ardb@kernel.org;
 h=from:subject; bh=2E7YpnyQuBr+mAfDSoAVpwsc4EPphYHtbpgVaCqHdtw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1OR/vxadkU/0nj3Psv3+vyLPb/GsS7Orc3jSv7J/k
 hZUUz/VUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbyay4jw31mvoLFUTqvmr0u
 8+Wwmi7MDb++irmveo2MuegkkbdXtjL8D7hw69aPN2X8R2cKRz3xbZmasfLqbUumpTYZ35I2SXC V8AEA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-19-ardb+git@google.com>
Subject: [RFC PATCH PoC 06/11] x86/boot: Created a confined code area for
 startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In order to be able to have tight control over which code may execute
from the early 1:1 mapping of memory, but still link vmlinux as a single
executable, prefix all symbol references in startup code with __pi_, and
invoke it from outside using the __pi_ prefix.

HACK: omit sev-status.c for the time being - disentangling that is
rather challenging, and not necessary for a proof of concept
implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/Makefile | 18 ++++++++++++++++--
 arch/x86/include/asm/setup.h   |  1 +
 arch/x86/kernel/head64.c       |  2 +-
 arch/x86/kernel/head_64.S      |  6 +++---
 arch/x86/mm/mem_encrypt_boot.S |  6 +++---
 5 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index b514f7e81332..4062582144f6 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -17,8 +17,9 @@ KMSAN_SANITIZE	:= n
 UBSAN_SANITIZE	:= n
 KCOV_INSTRUMENT	:= n
 
-obj-$(CONFIG_X86_64)		+= gdt_idt.o map_kernel.o
-obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sme.o sev-startup.o
+pi-obj-$(CONFIG_X86_64)		+= gdt_idt.o map_kernel.o
+pi-obj-$(CONFIG_AMD_MEM_ENCRYPT) += sme.o #sev-startup.o
+obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sev-startup.o
 
 lib-$(CONFIG_X86_64)		+= la57toggle.o
 lib-$(CONFIG_EFI_MIXED)		+= efi-mixed.o
@@ -28,3 +29,16 @@ lib-$(CONFIG_EFI_MIXED)		+= efi-mixed.o
 # to be linked into the decompressor or the EFI stub but not vmlinux
 #
 $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
+
+#
+# Confine the startup code by prefixing all symbols with __pi_ (for position
+# independent). This ensures that startup code can only call other startup
+# code, or code that has explicitly been made accessible to it via a symbol
+# alias.
+#
+$(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_
+$(obj)/%.pi.o: $(obj)/%.o FORCE
+	$(call if_changed,objcopy)
+
+extra-y		:= $(pi-obj-y)
+obj-y		+= $(patsubst %.o,%.pi.o,$(pi-obj-y))
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 6324f4c6c545..895d09faaf83 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -53,6 +53,7 @@ extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long p2v_offset, struct boot_params *bp);
 extern void startup_64_setup_gdt_idt(void);
 extern void startup_64_load_idt(void *vc_handler);
+extern void __pi_startup_64_load_idt(void *vc_handler);
 extern void early_setup_idt(void);
 extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index b251186a819e..8107cd68bc41 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -320,5 +320,5 @@ void early_setup_idt(void)
 		handler = vc_boot_ghcb;
 	}
 
-	startup_64_load_idt(handler);
+	__pi_startup_64_load_idt(handler);
 }
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 0c0d38ebf70b..e448279a0f87 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -71,7 +71,7 @@ SYM_CODE_START_NOALIGN(startup_64)
 	xorl	%edx, %edx
 	wrmsr
 
-	call	startup_64_setup_gdt_idt
+	call	__pi_startup_64_setup_gdt_idt
 
 	/* Now switch to __KERNEL_CS so IRET works reliably */
 	pushq	$__KERNEL_CS
@@ -91,7 +91,7 @@ SYM_CODE_START_NOALIGN(startup_64)
 	 * subsequent code. Pass the boot_params pointer as the first argument.
 	 */
 	movq	%r15, %rdi
-	call	sme_enable
+	call	__pi_sme_enable
 #endif
 
 	/* Sanitize CPU configuration */
@@ -111,7 +111,7 @@ SYM_CODE_START_NOALIGN(startup_64)
 	 * programmed into CR3.
 	 */
 	movq	%r15, %rsi
-	call	__startup_64
+	call	__pi___startup_64
 
 	/* Form the CR3 value being sure to include the CR3 modifier */
 	leaq	early_top_pgt(%rip), %rcx
diff --git a/arch/x86/mm/mem_encrypt_boot.S b/arch/x86/mm/mem_encrypt_boot.S
index f8a33b25ae86..edbf9c998848 100644
--- a/arch/x86/mm/mem_encrypt_boot.S
+++ b/arch/x86/mm/mem_encrypt_boot.S
@@ -16,7 +16,7 @@
 
 	.text
 	.code64
-SYM_FUNC_START(sme_encrypt_execute)
+SYM_FUNC_START(__pi_sme_encrypt_execute)
 
 	/*
 	 * Entry parameters:
@@ -69,9 +69,9 @@ SYM_FUNC_START(sme_encrypt_execute)
 	ANNOTATE_UNRET_SAFE
 	ret
 	int3
-SYM_FUNC_END(sme_encrypt_execute)
+SYM_FUNC_END(__pi_sme_encrypt_execute)
 
-SYM_FUNC_START(__enc_copy)
+SYM_FUNC_START_LOCAL(__enc_copy)
 	ANNOTATE_NOENDBR
 /*
  * Routine used to encrypt memory in place.
-- 
2.49.0.805.g082f7c87e0-goog

