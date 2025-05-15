Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20052980B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299468; cv=none; b=SysAFbT08zjtYaXesObJDHdJjrcjQ7/WLhe36lT0fTP2cDou0NjPRiSJU5QEe+oEneTSS5GohEE1sy/Ne/yEI7Eyat+ZA26O6cTrrZ+c4yUliprFq9n/uVrsRVoW2BSgE6Br3rJhJjSRZKjZAbDg55zrPu9esCx6LQFwXv3LjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299468; c=relaxed/simple;
	bh=5iShoFeNRgDVmEFMgRIhhGEkEjFE5sRIS9jH53sfYnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbNN24BGYLv+cxTuR+MH3q3Tx/xEbh8PxpQ6groYMNHU5/NmUPpKsWSWqWqPAZ6q//K7JmEoekmFXcrM23XG8w/xbWQmyDUS8PaT5xxC6bNGA5U7OMCsbfBNFp9MiSe5F2/ma04m0N8Ti1sePfsqYsRqIQTQWUhLTuHI1aqWIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihJ/n4e6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihJ/n4e6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A25C4CEE7;
	Thu, 15 May 2025 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299466;
	bh=5iShoFeNRgDVmEFMgRIhhGEkEjFE5sRIS9jH53sfYnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihJ/n4e6U/YFj/zGxO6jEG+XLoAaq8lhzKRlLv837tKiN8FBdESttHvsAOvSRXr2S
	 Jg5qpY1rFgjWaKI+TL+3OtEAlLY0GgN7JiNJD+76Aum5XFtQK+chkG23wYn5BaUS6d
	 N3ERjfhKczZchP7WweFkp4IfCfhxK0A971WK4eOMjuhwtfQAxboolwlLqaYUyQC8JF
	 9fsRfrXXjP99Ys5egoBQ27+FCIzCQes1nh6FuyUbyKNRDyZcHQ/GqkWO7sV3pIUDSl
	 PD1AfhVV4F5d5NPyu+2Xwq/LVj6+ae0coiJF/+dWnsm3pCYo+fyahrGIE94rez45A0
	 jjth56mF4Yosg==
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
Subject: [PATCH 09/15] x86/fpu: Remove the 'no387' boot option
Date: Thu, 15 May 2025 10:56:59 +0200
Message-ID: <20250515085708.2510123-10-mingo@kernel.org>
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

Without math emulation there's no point to this option.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-10-mingo@kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |  4 ----
 arch/x86/Kconfig                                | 20 +++++++++-----------
 arch/x86/kernel/cpu/common.c                    |  7 -------
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8f75ec177399..e380fff281a9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4067,10 +4067,6 @@
 			These settings can be accessed at runtime via
 			the nmi_watchdog and hardlockup_panic sysctls.
 
-	no387		[BUGS=X86-32] Tells the kernel to use the 387 maths
-			emulation library even if a 387 maths coprocessor
-			is present.
-
 	no4lvl		[RISCV,EARLY] Disable 4-level and 5-level paging modes.
 			Forces kernel to use 3-level paging instead.
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e983705a4fe3..be5f9be532a9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2739,18 +2739,16 @@ menuconfig APM
 	  1) make sure that you have enough swap space and that it is
 	  enabled.
 	  2) pass the "idle=poll" option to the kernel
-	  3) switch on floating point emulation in the kernel and pass
-	  the "no387" option to the kernel
-	  4) pass the "floppy=nodma" option to the kernel
-	  5) pass the "mem=4M" option to the kernel (thereby disabling
+	  3) pass the "floppy=nodma" option to the kernel
+	  4) pass the "mem=4M" option to the kernel (thereby disabling
 	  all but the first 4 MB of RAM)
-	  6) make sure that the CPU is not over clocked.
-	  7) read the sig11 FAQ at <http://www.bitwizard.nl/sig11/>
-	  8) disable the cache from your BIOS settings
-	  9) install a fan for the video card or exchange video RAM
-	  10) install a better fan for the CPU
-	  11) exchange RAM chips
-	  12) exchange the motherboard.
+	  5) make sure that the CPU is not over clocked.
+	  6) read the sig11 FAQ at <http://www.bitwizard.nl/sig11/>
+	  7) disable the cache from your BIOS settings
+	  8) install a fan for the video card or exchange video RAM
+	  9) install a better fan for the CPU
+	  10) exchange RAM chips
+	  11) exchange the motherboard.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called apm.
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 114aaaf6ae8a..a996915f763f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1655,13 +1655,6 @@ static void __init cpu_parse_early_param(void)
 	int arglen;
 
 #ifdef CONFIG_X86_32
-	if (cmdline_find_option_bool(boot_command_line, "no387"))
-#ifdef CONFIG_MATH_EMULATION
-		setup_clear_cpu_cap(X86_FEATURE_FPU);
-#else
-		pr_err("Option 'no387' required CONFIG_MATH_EMULATION enabled.\n");
-#endif
-
 	if (cmdline_find_option_bool(boot_command_line, "nofxsr"))
 		setup_clear_cpu_cap(X86_FEATURE_FXSR);
 #endif
-- 
2.45.2

