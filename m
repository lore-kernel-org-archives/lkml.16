Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701052980A8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299465; cv=none; b=N2ROfpmK7Tzbklru+qqhFAy0U7jx40MT7ib/PqHIgMvfSw/RGdP2Bg09aUCwNcJl3c5X4rl9OYQ48nuMjjH4PrIBs9bpzEZDAT/Snn9HsIJ/qszFRl7KZkep8sXgkImwCLYLsyv0PTUsdgji4JwTgehSJYSGnPht9EdH08kfj+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299465; c=relaxed/simple;
	bh=lFDDfd1Kvdh8/uWhFlBJABxYTqvqtwIqY1sADEFEtQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWLBFemuM2Nkr0pNryDHb3IJTdtnUNLCa/zMzYz5C00pLPq0OLz14Ed9KX1LD0MZvdFLhO/bCKq3WACXQPWy0rVNc/vXteF6lk+M1Q9g3jo0ghQZlKbn0MhqSr44fByBKiTldMPJw5HKudkWgV1LOA2X75tWszPUOC8ExahbjIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+RGnsfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+RGnsfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EA0C4CEF0;
	Thu, 15 May 2025 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299462;
	bh=lFDDfd1Kvdh8/uWhFlBJABxYTqvqtwIqY1sADEFEtQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D+RGnsfn2RS+Th3gZ4wJ86a5gY4AeO2mtfde7xPK3mKtqZBv+TgmHWeaXaGzfio3V
	 t3NVCz0TkkE1yTf1HRIluKg5dEpTDO3IKO2NSANZP3zSno60/NUsPhxMq74hdSz0D2
	 nET5O/uENFVgCaSTWVpghtbpw3CTNUeRb87QG8rCEW8v8l6kqxfpaPM7jD2INpdgTJ
	 M5xgaTZAso20+GYPqx7t7vwO5dusM9ueIbjcHo0Ll15oDnfeT2DVl5PwvVIuTZs6Zf
	 SS2ajlWqnjiVJHw2e5/tka/2wtvsJgWNBdagkMSJiBNG0fgWy1Y/QTJb9VaEHrp1Sz
	 57z2NviTyyhjA==
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
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 08/15] x86/fpu: Remove MATH_EMULATION and related glue code
Date: Thu, 15 May 2025 10:56:58 +0200
Message-ID: <20250515085708.2510123-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515085708.2510123-1-mingo@kernel.org>
References: <20250515085708.2510123-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-9-mingo@kernel.org
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
index 1f29dc81018f..e983705a4fe3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1637,33 +1637,6 @@ config X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
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
index 53daf4654f6c..84901c3acc94 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -285,7 +285,6 @@ core-y  += arch/x86/boot/startup/
 libs-y  += arch/x86/lib/
 
 # drivers-y are linked after core-y
-drivers-$(CONFIG_MATH_EMULATION) += arch/x86/math-emu/
 drivers-$(CONFIG_PCI)            += arch/x86/pci/
 
 # suspend and hibernation support
diff --git a/arch/x86/include/asm/fpu/api.h b/arch/x86/include/asm/fpu/api.h
index 8e6848f55dcd..87b794921070 100644
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
index 948b4f5fad99..a39c0798c975 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -520,11 +520,6 @@ static inline void fpstate_init_fstate(struct fpstate *fpstate)
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
index 6bb3e35c40e2..20017fbfc16c 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -36,12 +36,7 @@ static void fpu__init_cpu_generic(void)
 	write_cr0(cr0);
 
 	/* Flush out any pending x87 state: */
-#ifdef CONFIG_MATH_EMULATION
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		;
-	else
-#endif
-		asm volatile ("fninit");
+	asm volatile ("fninit");
 }
 
 /*
@@ -83,13 +78,11 @@ static void __init fpu__init_system_early_generic(void)
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
index 8d08c58b3fe2..6b2ffb86c46d 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -1414,20 +1414,6 @@ DEFINE_IDTENTRY(exc_device_not_available)
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

