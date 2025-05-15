Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB78296168
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299440; cv=none; b=MIGyc4K+AQ7yKrvMyTrbeHioFKhiI8FjRllGJRkHmH/0hP5/qTTn2YKQSXbt4Y3yFVWq2BrDD2tGf7XzJcUJPwDy5sCEnCexZgoiWTFdBV02AJqEz7I2SOjZ5tCrTXO2QAaIBIIG7zcPboV8T2dOg3fM9daFqWvGH3H3X1pX4pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299440; c=relaxed/simple;
	bh=e1bJbtm/hjbaasup0DRmWYmhd9Ncj/lWapQEJjNSghU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnojKqIt9jX7iyDtwcY8G11SMaZChvp2sL9NPwQGjcR3KOomKR6ILLIdSQn464xIHBMUPJDBcDW/6eu+UayL/Jsyu9XcSy5W2eSEFFftgWG8nfu+x43kns1iHBx4m6DqFU6xhTV9l+HfYtA3Enuds3souGFeh71uXfSKRHs/bYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWYwQ0Ug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWYwQ0Ug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05244C4CEED;
	Thu, 15 May 2025 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299438;
	bh=e1bJbtm/hjbaasup0DRmWYmhd9Ncj/lWapQEJjNSghU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWYwQ0Ug7JpK1MzOaHnf4kZlKv1GLcnolzn5VXJ9ckr41pjqykk9z9FnDTdv0/V+7
	 dIDheAXYmScdR/E7L1kyBn9jUEkGA/+eqObtYig+e/IMWM2Tk5Bpx7ZZshQqZMWnte
	 9pCQBJm5o0BJueSFexXTx+KqdQktC1sOwe8T+PCQx0TqUy1hO+/GJsGp5UeBCXHJAo
	 4CKQWwgw06Kuf9iwloJzMTxlukRkk3Rha1DB7aF40W5fSA8ka6y+2tHzirMxCpMUwX
	 jwMWcOizKlwgAbH0RH/wao4ukwrQ9xGAXTd5NmiGq3aZnPF2axdSQhf/ynEu5rbzox
	 HYqa0yLpq3C9A==
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
Subject: [PATCH 01/15] x86/cpu: Remove M486/M486SX/ELAN support
Date: Thu, 15 May 2025 10:56:51 +0200
Message-ID: <20250515085708.2510123-2-mingo@kernel.org>
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

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-2-mingo@kernel.org
---
 arch/x86/Kconfig                | 10 ----------
 arch/x86/Kconfig.cpu            | 42 +++++++++--------------------------------
 arch/x86/Makefile_32.cpu        |  2 --
 arch/x86/include/asm/vermagic.h |  6 ------
 4 files changed, 9 insertions(+), 51 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 90570e3582cc..557322108b15 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -447,11 +447,6 @@ config SMP
 	  uniprocessor machines. On a uniprocessor machine, the kernel
 	  will run faster if you say N here.
 
-	  Note that if you say Y here and choose architecture "586" or
-	  "Pentium" under "Processor family", the kernel will not work on 486
-	  architectures. Similarly, multiprocessor kernels for the "PPro"
-	  architecture may not work on all Pentium based boards.
-
 	  People using multiprocessor machines who say Y here should also say
 	  Y to "Enhanced Real Time Clock Support", below. The "Advanced Power
 	  Management" code will be disabled if you say Y here.
@@ -2770,11 +2765,6 @@ menuconfig APM
 	  manpage ("man 8 hdparm") for that), and it doesn't turn off
 	  VESA-compliant "green" monitors.
 
-	  This driver does not support the TI 4000M TravelMate and the ACER
-	  486/DX4/75 because they don't have compliant BIOSes. Many "green"
-	  desktop machines also don't have compliant BIOSes, and this driver
-	  may cause those machines to panic during the boot phase.
-
 	  Generally, if you don't have a battery in your machine, there isn't
 	  much point in using this driver and you should say N. If you get
 	  random kernel OOPSes or reboots that don't seem to be related to
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 753b8763abae..981097bd868a 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -8,19 +8,18 @@ choice
 	  This is the processor type of your CPU. This information is
 	  used for optimizing purposes. In order to compile a kernel
 	  that can run on all supported x86 CPU types (albeit not
-	  optimally fast), you can specify "486" here.
+	  optimally fast), you can specify "586" here.
 
-	  Note that the 386 is no longer supported, this includes
+	  Note that the 386 and 486 is no longer supported, this includes
 	  AMD/Cyrix/Intel 386DX/DXL/SL/SLC/SX, Cyrix/TI 486DLC/DLC2,
-	  UMC 486SX-S and the NexGen Nx586.
+	  UMC 486SX-S and the NexGen Nx586, AMD ELAN and all 486 based
+	  CPUs.
 
 	  The kernel will not necessarily run on earlier architectures than
 	  the one you have chosen, e.g. a Pentium optimized kernel will run on
 	  a PPro, but not necessarily on a i486.
 
 	  Here are the settings recommended for greatest speed:
-	  - "486" for the AMD/Cyrix/IBM/Intel 486DX/DX2/DX4 or
-	    SL/SLC/SLC2/SLC3/SX/SX2 and UMC U5D or U5S.
 	  - "586" for generic Pentium CPUs lacking the TSC
 	    (time stamp counter) register.
 	  - "Pentium-Classic" for the Intel Pentium.
@@ -46,20 +45,6 @@ choice
 	  See each option's help text for additional details. If you don't know
 	  what to do, choose "Pentium-Pro".
 
-config M486SX
-	bool "486SX"
-	depends on X86_32
-	help
-	  Select this for an 486-class CPU without an FPU such as
-	  AMD/Cyrix/IBM/Intel SL/SLC/SLC2/SLC3/SX/SX2 and UMC U5S.
-
-config M486
-	bool "486DX"
-	depends on X86_32
-	help
-	  Select this for an 486-class CPU such as AMD/Cyrix/IBM/Intel
-	  486DX/DX2/DX4 and UMC U5D.
-
 config M586
 	bool "586/K5/5x86/6x86/6x86MX"
 	depends on X86_32
@@ -188,14 +173,6 @@ config MWINCHIP3D
 	  stores for this CPU, which can increase performance of some
 	  operations.
 
-config MELAN
-	bool "AMD Elan"
-	depends on X86_32
-	help
-	  Select this for an AMD Elan processor.
-
-	  Do not use this option for K6/Athlon/Opteron processors!
-
 config MGEODEGX1
 	bool "GeodeGX1"
 	depends on X86_32
@@ -268,12 +245,12 @@ config X86_L1_CACHE_SHIFT
 	int
 	default "7" if MPENTIUM4
 	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X86_64
-	default "4" if MELAN || M486SX || M486 || MGEODEGX1
+	default "4" if MGEODEGX1
 	default "5" if MWINCHIP3D || MWINCHIPC6 || MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODE_LX
 
 config X86_F00F_BUG
 	def_bool y
-	depends on M586MMX || M586TSC || M586 || M486SX || M486
+	depends on M586MMX || M586TSC || M586
 
 config X86_INVD_BUG
 	def_bool y
@@ -281,7 +258,7 @@ config X86_INVD_BUG
 
 config X86_ALIGNMENT_16
 	def_bool y
-	depends on MWINCHIP3D || MWINCHIPC6 || MCYRIXIII || MELAN || MK6 || M586MMX || M586TSC || M586 || M486SX || M486 || MVIAC3_2 || MGEODEGX1
+	depends on MWINCHIP3D || MWINCHIPC6 || MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODEGX1
 
 config X86_INTEL_USERCOPY
 	def_bool y
@@ -314,11 +291,10 @@ config X86_MINIMUM_CPU_FAMILY
 	default "64" if X86_64
 	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
 	default "5" if X86_32 && X86_CX8
-	default "4"
 
 config X86_DEBUGCTLMSR
 	def_bool y
-	depends on !(MK6 || MWINCHIPC6 || MWINCHIP3D || MCYRIXIII || M586MMX || M586TSC || M586 || M486SX || M486) && !UML
+	depends on !(MK6 || MWINCHIPC6 || MWINCHIP3D || MCYRIXIII || M586MMX || M586TSC || M586) && !UML
 
 config IA32_FEAT_CTL
 	def_bool y
@@ -354,7 +330,7 @@ config CPU_SUP_INTEL
 config CPU_SUP_CYRIX_32
 	default y
 	bool "Support Cyrix processors" if PROCESSOR_SELECT
-	depends on M486SX || M486 || M586 || M586TSC || M586MMX || (EXPERT && !64BIT)
+	depends on M586 || M586TSC || M586MMX || (EXPERT && !64BIT)
 	help
 	  This enables detection, tunings and quirks for Cyrix processors
 
diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index af7de9a42752..98ca6dd70d01 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -10,8 +10,6 @@ else
 align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
 endif
 
-cflags-$(CONFIG_M486SX)		+= -march=i486
-cflags-$(CONFIG_M486)		+= -march=i486
 cflags-$(CONFIG_M586)		+= -march=i586
 cflags-$(CONFIG_M586TSC)	+= -march=i586
 cflags-$(CONFIG_M586MMX)	+= -march=pentium-mmx
diff --git a/arch/x86/include/asm/vermagic.h b/arch/x86/include/asm/vermagic.h
index 5d471253c755..eda233a90ea8 100644
--- a/arch/x86/include/asm/vermagic.h
+++ b/arch/x86/include/asm/vermagic.h
@@ -5,10 +5,6 @@
 
 #ifdef CONFIG_X86_64
 /* X86_64 does not define MODULE_PROC_FAMILY */
-#elif defined CONFIG_M486SX
-#define MODULE_PROC_FAMILY "486SX "
-#elif defined CONFIG_M486
-#define MODULE_PROC_FAMILY "486 "
 #elif defined CONFIG_M586
 #define MODULE_PROC_FAMILY "586 "
 #elif defined CONFIG_M586TSC
@@ -31,8 +27,6 @@
 #define MODULE_PROC_FAMILY "K6 "
 #elif defined CONFIG_MK7
 #define MODULE_PROC_FAMILY "K7 "
-#elif defined CONFIG_MELAN
-#define MODULE_PROC_FAMILY "ELAN "
 #elif defined CONFIG_MCRUSOE
 #define MODULE_PROC_FAMILY "CRUSOE "
 #elif defined CONFIG_MEFFICEON
-- 
2.45.2

