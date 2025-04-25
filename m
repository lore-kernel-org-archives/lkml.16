Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA4238C25
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570576; cv=none; b=UinnVVA2oCT3fw/2Q5jUjhtWTCxON8x3xsuRvizYrkAHRMGABy+Wl+NFGpQ1LJBl++aRLDx4nRnvLTuNyKFnWLtV1W+Gr4Vz5SAViGle2+HHTKmmSeI8E0BKhachPlY/lq+H5A63XPLJrkZdyuvYy17uAiUj2RFMFYj9KUn2W6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570576; c=relaxed/simple;
	bh=SX60kC/iqXz2oa2+SlcTIosGQupkYseFMYEmBsf6kzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYyjxxwMWyVkBu6Q9DYaobL+Tq7W+ORrwmHKoMmOcKFmnQgjEMToivqT2O59f7meiOkORDHQ+AzwtJwPOY3boaaDgcFxcIvYGQz3o00q/MpGnlVKhEk6hldV6iWdfreLqV3n8pxZqDTz4apskH6oc9MWI34QgtgjCT0hw1nBGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZqQ6njr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZqQ6njr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747C8C4CEEB;
	Fri, 25 Apr 2025 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570576;
	bh=SX60kC/iqXz2oa2+SlcTIosGQupkYseFMYEmBsf6kzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZqQ6njrGYz3oREJOXH7zs4FgeqaYkLK4PxH3e4pBBIA8tpFoqB3/rTc3y3bRPG9F
	 +Kc3R7HE1EjvIp+27nmo6+ayqjF9yNvaPl0RoClok8b4alY2lYCQmD6zMQyTB624PL
	 iFs8RZh+Rqe4JLwk4yUXDDLxlok1wn3EZIBOL4rZbhEPSybZwzJJb2zMGSVcpKCtRz
	 8tVjcQ9mtdsTVZezu1cEVSwFY4c5N/fPMFgmIekeXimX2AKNlQYb5shmWfJy6lwjtP
	 pyxVV0HOYTIcCkTfP1q3ViNhBRK8FhQyHJItjK3feeZHNoW1d1SJr/lfAeY7MpQjdW
	 iPlsDIRkg47SQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 08/15] x86/fpu: Remove MATH_EMULATION and related glue code
Date: Fri, 25 Apr 2025 10:42:05 +0200
Message-ID: <20250425084216.3913608-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250425084216.3913608-1-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/Kconfig               | 27 ---------------------------
 arch/x86/Kconfig.cpufeatures   |  1 -
 arch/x86/Makefile              |  1 -
 arch/x86/include/asm/fpu/api.h |  6 ------
 arch/x86/kernel/fpu/core.c     |  5 -----
 arch/x86/kernel/fpu/init.c     |  9 +--------
 arch/x86/kernel/traps.c        | 14 --------------
 7 files changed, 1 insertion(+), 62 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 62a9db3efa93..cd9dd10b15d2 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1636,33 +1636,6 @@ config X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
 	  Set whether the default state of memory_corruption_check is
 	  on or off.
 
-config MATH_EMULATION
-	bool
-	depends on MODIFY_LDT_SYSCALL
-	prompt "Math emulation" if X86_32 && (M486SX || MELAN)
-	help
-	  Linux can emulate a math coprocessor (used for floating point
-	  operations) if you don't have one. 486DX and Pentium processors have
-	  a math coprocessor built in, 486SX and 386 do not, unless you added
-	  a 487DX or 387, respectively. (The messages during boot time can
-	  give you some hints here ["man dmesg"].) Everyone needs either a
-	  coprocessor or this emulation.
-
-	  If you don't have a math coprocessor, you need to say Y here; if you
-	  say Y here even though you have a coprocessor, the coprocessor will
-	  be used nevertheless. (This behavior can be changed with the kernel
-	  command line option "no387", which comes handy if your coprocessor
-	  is broken. Try "man bootparam" or see the documentation of your boot
-	  loader (lilo or loadlin) about how to pass options to the kernel at
-	  boot time.) This means that it is a good idea to say Y here if you
-	  intend to use this kernel on different machines.
-
-	  More information about the internals of the Linux math coprocessor
-	  emulation can be found in <file:arch/x86/math-emu/README>.
-
-	  If you are not sure, say Y; apart from resulting in a 66 KB bigger
-	  kernel, it won't hurt.
-
 config MTRR
 	def_bool y
 	prompt "MTRR (Memory Type Range Register) support" if EXPERT
diff --git a/arch/x86/Kconfig.cpufeatures b/arch/x86/Kconfig.cpufeatures
index e12d5b7e39a2..cd551818f451 100644
--- a/arch/x86/Kconfig.cpufeatures
+++ b/arch/x86/Kconfig.cpufeatures
@@ -66,7 +66,6 @@ config X86_REQUIRED_FEATURE_UP
 
 config X86_REQUIRED_FEATURE_FPU
 	def_bool y
-	depends on !MATH_EMULATION
 
 config X86_REQUIRED_FEATURE_PAE
 	def_bool y
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 594723005d95..15975f63952e 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -284,7 +284,6 @@ archprepare: $(cpufeaturemasks.hdr)
 libs-y  += arch/x86/lib/
 
 # drivers-y are linked after core-y
-drivers-$(CONFIG_MATH_EMULATION) += arch/x86/math-emu/
 drivers-$(CONFIG_PCI)            += arch/x86/pci/
 
 # suspend and hibernation support
diff --git a/arch/x86/include/asm/fpu/api.h b/arch/x86/include/asm/fpu/api.h
index f42de5f05e7e..def9f7261b0d 100644
--- a/arch/x86/include/asm/fpu/api.h
+++ b/arch/x86/include/asm/fpu/api.h
@@ -119,12 +119,6 @@ extern void fpu__init_system(void);
 extern void fpu__init_check_bugs(void);
 extern void fpu__resume_cpu(void);
 
-#ifdef CONFIG_MATH_EMULATION
-extern void fpstate_init_soft(struct swregs_state *soft);
-#else
-static inline void fpstate_init_soft(struct swregs_state *soft) {}
-#endif
-
 /* State tracking */
 DECLARE_PER_CPU(struct fpu *, fpu_fpregs_owner_ctx);
 
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 91d6341f281f..59a4f430b46e 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -512,11 +512,6 @@ static inline void fpstate_init_fstate(struct fpstate *fpstate)
  */
 void fpstate_init_user(struct fpstate *fpstate)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		fpstate_init_soft(&fpstate->regs.soft);
-		return;
-	}
-
 	xstate_init_xcomp_bv(&fpstate->regs.xsave, fpstate->xfeatures);
 
 	if (cpu_feature_enabled(X86_FEATURE_FXSR))
diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 998a08f17e33..7f64d0677160 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -36,12 +36,7 @@ static void fpu__init_cpu_generic(void)
 	write_cr0(cr0);
 
 	/* Flush out any pending x87 state: */
-#ifdef CONFIG_MATH_EMULATION
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		fpstate_init_soft(&current->thread.fpu.fpstate->regs.soft);
-	else
-#endif
-		asm volatile ("fninit");
+	asm volatile ("fninit");
 }
 
 /*
@@ -81,13 +76,11 @@ static void __init fpu__init_system_early_generic(void)
 			setup_clear_cpu_cap(X86_FEATURE_FPU);
 	}
 
-#ifndef CONFIG_MATH_EMULATION
 	if (!test_cpu_cap(&boot_cpu_data, X86_FEATURE_FPU)) {
 		pr_emerg("x86/fpu: Giving up, no FPU found and no math emulation present\n");
 		for (;;)
 			asm volatile("hlt");
 	}
-#endif
 }
 
 /*
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 8d5bbac04435..6467b7832fea 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1413,20 +1413,6 @@ DEFINE_IDTENTRY(exc_device_not_available)
 	if (handle_xfd_event(regs))
 		return;
 
-#ifdef CONFIG_MATH_EMULATION
-	if (!boot_cpu_has(X86_FEATURE_FPU) && (cr0 & X86_CR0_EM)) {
-		struct math_emu_info info = { };
-
-		cond_local_irq_enable(regs);
-
-		info.regs = regs;
-		math_emulate(&info);
-
-		cond_local_irq_disable(regs);
-		return;
-	}
-#endif
-
 	/* This should not happen. */
 	if (WARN(cr0 & X86_CR0_TS, "CR0.TS was set")) {
 		/* Try to fix it up and carry on. */
-- 
2.45.2

