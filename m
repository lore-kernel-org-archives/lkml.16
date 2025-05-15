Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B257288C9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299442; cv=none; b=ohD1s78uwQXjlyujV4iEa5asb/mzUogFXG4sG9EPO/ELFgXl3GW9v14vwNTKQYmry2fXIp9RWhBFsHcnvJpcQFLYkZyYg0vZiykkc5JReZKBlFhli7daMB/WIVQEYiaHAoJRMR1i7g9BioDxH9RQqik6JQPSQuRyFlcGSXFWquY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299442; c=relaxed/simple;
	bh=/WTqk+zcprxQiI3n1FMFXKzpbhBWyvajIZSQZREjNhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3MT1cYs5j1aEJJrr8YWz4LS77J5M8l+JOgz+x+V0vJxrfh5JFIUl2pnW0wNqbpBv9WOIEhQ9XjLoDi8VcSBPuAsONca1/TbLXQO6wsjmyCv5Wb/vwjc4EmaWVhSYC9BD6tqcAyTwhFS8vU6TuLkqplo7SlhQldph7dlWvOT4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQTwIs47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQTwIs47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD5CC4CEF0;
	Thu, 15 May 2025 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299441;
	bh=/WTqk+zcprxQiI3n1FMFXKzpbhBWyvajIZSQZREjNhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PQTwIs470WzDwzsdh92rywxpB0k2fUh829M1L10yjiUDg0xPvBWvFKlSbDY/SU8Br
	 qn2s9w+sPQohncy6ck29EuQCmYtuK5DCcDvyALpGY7CTA0zjXtvqwVp839mwxIbQMf
	 8i4asGIq02MlOlmeDdStDdsvFDd86d7iwOH8YQ3TOmbt7IPdFQHGyrg2qJ5YAYyDK+
	 hyO5HNE0KimBHQBLGjwtdxjtaGm+iudTvn7CjXiX7Rkf1jXpPB1XB0mI37nzSI8u9z
	 fXk1FrBBKqjqWuHr4IoacJ302PbywAtkMwKcxqS4lcwowNnNaJTTsbHr2QggjKwX9X
	 awX65zswSgKnw==
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
Subject: [PATCH 02/15] x86/cpu: Remove CONFIG_MWINCHIP3D/MWINCHIPC6
Date: Thu, 15 May 2025 10:56:52 +0200
Message-ID: <20250515085708.2510123-3-mingo@kernel.org>
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

These CPUs lack CMPXCHG8B support, according to Arnd Bergmann:

  | "Winchip6 (486-class, no tsc, no cx8) and Winchip3D
  | (486-class, with tsc but no cx8)"

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-3-mingo@kernel.org
---
 arch/x86/Kconfig.cpu            | 28 ++++------------------------
 arch/x86/Makefile_32.cpu        |  2 --
 arch/x86/include/asm/vermagic.h |  4 ----
 3 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 981097bd868a..97bffa97df41 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -32,8 +32,6 @@ choice
 	  - "Athlon" for the AMD K7 family (Athlon/Duron/Thunderbird).
 	  - "Crusoe" for the Transmeta Crusoe series.
 	  - "Efficeon" for the Transmeta Efficeon series.
-	  - "Winchip-C6" for original IDT Winchip.
-	  - "Winchip-2" for IDT Winchips with 3dNow! capabilities.
 	  - "AMD Elan" for the 32-bit AMD Elan embedded CPU.
 	  - "GeodeGX1" for Geode GX1 (Cyrix MediaGX).
 	  - "Geode GX/LX" For AMD Geode GX and LX processors.
@@ -155,24 +153,6 @@ config MEFFICEON
 	help
 	  Select this for a Transmeta Efficeon processor.
 
-config MWINCHIPC6
-	bool "Winchip-C6"
-	depends on X86_32
-	help
-	  Select this for an IDT Winchip C6 chip.  Linux and GCC
-	  treat this chip as a 586TSC with some extended instructions
-	  and alignment requirements.
-
-config MWINCHIP3D
-	bool "Winchip-2/Winchip-2A/Winchip-3"
-	depends on X86_32
-	help
-	  Select this for an IDT Winchip-2, 2A or 3.  Linux and GCC
-	  treat this chip as a 586TSC with some extended instructions
-	  and alignment requirements.  Also enable out of order memory
-	  stores for this CPU, which can increase performance of some
-	  operations.
-
 config MGEODEGX1
 	bool "GeodeGX1"
 	depends on X86_32
@@ -246,7 +226,7 @@ config X86_L1_CACHE_SHIFT
 	default "7" if MPENTIUM4
 	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X86_64
 	default "4" if MGEODEGX1
-	default "5" if MWINCHIP3D || MWINCHIPC6 || MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODE_LX
+	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODE_LX
 
 config X86_F00F_BUG
 	def_bool y
@@ -258,7 +238,7 @@ config X86_INVD_BUG
 
 config X86_ALIGNMENT_16
 	def_bool y
-	depends on MWINCHIP3D || MWINCHIPC6 || MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODEGX1
+	depends on MCYRIXIII || MK6 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODEGX1
 
 config X86_INTEL_USERCOPY
 	def_bool y
@@ -266,7 +246,7 @@ config X86_INTEL_USERCOPY
 
 config X86_USE_PPRO_CHECKSUM
 	def_bool y
-	depends on MWINCHIP3D || MWINCHIPC6 || MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MGEODE_LX || MATOM
+	depends on MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MGEODE_LX || MATOM
 
 config X86_TSC
 	def_bool y
@@ -294,7 +274,7 @@ config X86_MINIMUM_CPU_FAMILY
 
 config X86_DEBUGCTLMSR
 	def_bool y
-	depends on !(MK6 || MWINCHIPC6 || MWINCHIP3D || MCYRIXIII || M586MMX || M586TSC || M586) && !UML
+	depends on !(MK6 || MCYRIXIII || M586MMX || M586TSC || M586) && !UML
 
 config IA32_FEAT_CTL
 	def_bool y
diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index 98ca6dd70d01..2dda0a19b06a 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -24,8 +24,6 @@ cflags-$(CONFIG_MK6)		+= -march=k6
 cflags-$(CONFIG_MK7)		+= -march=athlon
 cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)
 cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)
-cflags-$(CONFIG_MWINCHIPC6)	+= $(call cc-option,-march=winchip-c6,-march=i586)
-cflags-$(CONFIG_MWINCHIP3D)	+= $(call cc-option,-march=winchip2,-march=i586)
 cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
 cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
 cflags-$(CONFIG_MVIAC7)		+= -march=i686
diff --git a/arch/x86/include/asm/vermagic.h b/arch/x86/include/asm/vermagic.h
index eda233a90ea8..b3a8beb32dfd 100644
--- a/arch/x86/include/asm/vermagic.h
+++ b/arch/x86/include/asm/vermagic.h
@@ -31,10 +31,6 @@
 #define MODULE_PROC_FAMILY "CRUSOE "
 #elif defined CONFIG_MEFFICEON
 #define MODULE_PROC_FAMILY "EFFICEON "
-#elif defined CONFIG_MWINCHIPC6
-#define MODULE_PROC_FAMILY "WINCHIPC6 "
-#elif defined CONFIG_MWINCHIP3D
-#define MODULE_PROC_FAMILY "WINCHIP3D "
 #elif defined CONFIG_MCYRIXIII
 #define MODULE_PROC_FAMILY "CYRIXIII "
 #elif defined CONFIG_MVIAC3_2
-- 
2.45.2

