Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59F239591
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570567; cv=none; b=oAa9Wk3OOsL8bN1qkfMhSb4PzsQFGdOpPuuzNDWJXgYcrZpLGwsscG7MHtwVfWgN/uoGqCvzwEVtVWAu7gMT9Qql3JPAbQ7qdn+26NJPjjq4p48wa86cu9RcTtgUzah2OPQpsTUFy47yzvD7xTSO+KXX4x4hCT5MFMdVFiW76kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570567; c=relaxed/simple;
	bh=Ry/+FYgxtkycZtPaAopdFr9VMpbrDK/bptG6P08592s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shXaI5zhZHFdkAuHaHIrdn/ALMqdW+I5txiOg+bNbfsrymZq7+JCEN9nAnT46YJEaEvZNRB16+XNujgpgJjUR4gw9q0F6u7G1mxd1cP5ANDXIkEzIxRVJaqHKsMJmcmaV9L/fF18tUPxYIyVuoLBg6NJXTELRs6cRlxX9rvuMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tA/hk6vq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tA/hk6vq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A73C4CEEB;
	Fri, 25 Apr 2025 08:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570567;
	bh=Ry/+FYgxtkycZtPaAopdFr9VMpbrDK/bptG6P08592s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tA/hk6vqCL+SDD1BElUVLR/NpBgQyRBiQ5VwkAoPJrIEZKJ5UIkklNXcAcbcw9ABq
	 cM3+dkadOd2PtcHZe9U9Ex1dQHdlabNVNFHxUkStovcoMOtBELXAujoooWURcnLbpH
	 HntwQTCs4pPoL0EgN9wpsr9USH1Gd+9fXQbHBfKGsugnuP25fJToP4Y8d0JM2hIBLe
	 Re+Jr+bYv6V/FTXwIy5Lil0fPd/E2NYMScWjUE4Sno0vOb7DAj3fsjuzyau11BLY+R
	 sTBnbo/XcpuSAybEnCMxqWQNEtEgK76RESDQ0NIUzUT1uPd9nH0Jb7DnB2aRiUU+KJ
	 UdSu666R4St9A==
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
Subject: [PATCH 05/15] x86/cpu, x86/platform, watchdog: Remove CONFIG_X86_RDC321X support
Date: Fri, 25 Apr 2025 10:42:02 +0200
Message-ID: <20250425084216.3913608-6-mingo@kernel.org>
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

This depends on the to-be-removed M486 CPU support.

Note that we still keep the RDC321X MFD, watchdog and GPIO
drivers, because apparently there were 586/686 CPUs offered with the
RDC321X, according to Arnd Bergmann:

| "the [RDC321X] product line is still actively developed by RDC
|  and DM&P, and I suspect that some of the drivers are still used
|  on 586tsc-class (vortex86dx, vortex86mx) and 686-class
|  (vortex86dx3, vortex86ex) SoCs that do run modern kernels and
|  get updates."

For this reason, update the watchdog driver and enable it on
the broader 32-bit landscape:

  -       depends on X86_RDC321X || COMPILE_TEST
  +       depends on X86_32 || COMPILE_TEST

The MFD and GPIO drivers were already independent of CONFIG_X86_RDC321X.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/Kconfig         | 11 -----------
 drivers/watchdog/Kconfig |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7f1a405efde0..62a9db3efa93 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -673,17 +673,6 @@ config X86_INTEL_QUARK
 	  Say Y here if you have a Quark based system such as the Arduino
 	  compatible Intel Galileo.
 
-config X86_RDC321X
-	bool "RDC R-321x SoC"
-	depends on X86_32
-	depends on X86_EXTENDED_PLATFORM
-	select M486
-	select X86_REBOOTFIXUPS
-	help
-	  This option is needed for RDC R-321x system-on-chip, also known
-	  as R-8610-(G).
-	  If you don't have one of these chips, you should say N here.
-
 config X86_INTEL_LPSS
 	bool "Intel Low Power Subsystem Support"
 	depends on X86 && ACPI && PCI
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8..fcf0853a64d8 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1516,7 +1516,7 @@ config NV_TCO
 
 config RDC321X_WDT
 	tristate "RDC R-321x SoC watchdog"
-	depends on X86_RDC321X || COMPILE_TEST
+	depends on X86_32 || COMPILE_TEST
 	depends on PCI
 	help
 	  This is the driver for the built in hardware watchdog
-- 
2.45.2

