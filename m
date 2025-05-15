Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE882297A6B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299449; cv=none; b=u9W9RpxgPPnKte0KtwxXixLaE9j4CPiHhcX9fuK3D9na6rva2P8fk037jsinSttWTyh84dak3kmTXgb6nxGVljjAe4+Lxf8zTJ+AKQLgcS05514nEyjXZmSESJEGxjVSD33Qp5CcSPnOFxnE3+LwnBvuMKPMlpYyjQcpwvQCrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299449; c=relaxed/simple;
	bh=sT3vfi0x4wXLV/8seHmEtDP0ilzDxriliPmKFVTOD28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VbY58iAckeel29Vt5qaJ56GjDRVtb1ua52Sl2u8/PSx4gdofrn/yh8ZOWBH0mwU6dvwhAOTkVRgMRE3YYOp5hWqpRcyb/Q0UpYg8EJ8hhEPyDvkbXmqHVuoElk8wS6r1sLt9nwgijPbh0hRqOWPFIz6oplfUd26fFcYlSLxvwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8qhUp8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8qhUp8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4937C4CEE7;
	Thu, 15 May 2025 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299448;
	bh=sT3vfi0x4wXLV/8seHmEtDP0ilzDxriliPmKFVTOD28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8qhUp8QFEjaXfdmtTVhkoWdlIRD8nHezV8FjaLgTFmvTho0oWNBCoZXVSXufx9Bl
	 xDrrQAa11hKf1CmcpDhO4riZm1xl6ag7s+2wzhlzQM0ZDxVu8Z+i/LUKl9QyjxnlW8
	 1Qp1LffAY/1AkEm4Rin128yZ8rG0k6DuvDoDXsIn9dEb98JH4Ad/DbtIc02cqbc++U
	 0JLl8q80Dc1iLo6zWZP10hzGzMyprrVzLLhZk+BWwnz6xP2XQmvlHPgyGBgItY85RK
	 67HbptkYAe1o5uFkO0EWtOsIyn0jrSRY3V7ku96cnPRalIksCUyUvIdhU47Grqx9Qd
	 wp8xlUR/ai72A==
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
Subject: [PATCH 04/15] x86/cpu: Remove TSC-less CONFIG_M586 support
Date: Thu, 15 May 2025 10:56:54 +0200
Message-ID: <20250515085708.2510123-5-mingo@kernel.org>
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

Remove support for TSC-less Pentium variants.

All TSC-capable Pentium variants, derivatives and
clones should still work under the M586TSC or M586MMX
options.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-5-mingo@kernel.org
---
 arch/x86/Kconfig.cpu            | 10 +---------
 arch/x86/Makefile_32.cpu        |  1 -
 arch/x86/include/asm/vermagic.h |  2 --
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 68788de88b1d..abe4596ffa47 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -43,14 +43,6 @@ choice
 	  See each option's help text for additional details. If you don't know
 	  what to do, choose "Pentium-Pro".
 
-config M586
-	bool "586/K5/5x86/6x86/6x86MX"
-	depends on X86_32
-	help
-	  Select this for an 586 or 686 series processor such as the AMD K5,
-	  the Cyrix 5x86, 6x86 and 6x86MX.  This choice does not
-	  assume the RDTSC (Read Time Stamp Counter) instruction.
-
 config M586TSC
 	bool "Pentium-Classic"
 	depends on X86_32
@@ -226,7 +218,7 @@ config X86_L1_CACHE_SHIFT
 	default "7" if MPENTIUM4
 	default "6" if MK7 || MPENTIUMM || MATOM || MVIAC7 || X86_GENERIC || X86_64
 	default "4" if MGEODEGX1
-	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODE_LX
+	default "5" if MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MGEODE_LX
 
 config X86_F00F_BUG
 	def_bool y
diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index 2dda0a19b06a..43226c9fe795 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -10,7 +10,6 @@ else
 align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
 endif
 
-cflags-$(CONFIG_M586)		+= -march=i586
 cflags-$(CONFIG_M586TSC)	+= -march=i586
 cflags-$(CONFIG_M586MMX)	+= -march=pentium-mmx
 cflags-$(CONFIG_M686)		+= -march=i686
diff --git a/arch/x86/include/asm/vermagic.h b/arch/x86/include/asm/vermagic.h
index b3a8beb32dfd..e26061df0c9b 100644
--- a/arch/x86/include/asm/vermagic.h
+++ b/arch/x86/include/asm/vermagic.h
@@ -5,8 +5,6 @@
 
 #ifdef CONFIG_X86_64
 /* X86_64 does not define MODULE_PROC_FAMILY */
-#elif defined CONFIG_M586
-#define MODULE_PROC_FAMILY "586 "
 #elif defined CONFIG_M586TSC
 #define MODULE_PROC_FAMILY "586TSC "
 #elif defined CONFIG_M586MMX
-- 
2.45.2

