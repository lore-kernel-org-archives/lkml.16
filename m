Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B65B239591
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570564; cv=none; b=Uo/N+TtzNjT52jiylDwZLR4RqhGMQpMY4JnjxlrrS58vjo90anC4V6OZps7YXzywaWAws5zLUMyrvCUT0ZjZT4pwvCD2i5lneO8YKNo+jtPQ0ZV6epLLnxq6dCiE1VYqoo+91ZLJQNOIC8c+1e9dTy9BdRK05Du3EkqiVKPm0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570564; c=relaxed/simple;
	bh=KNL/iSIey6awHew2sR7v6ErttybNRwGXLg/x5jvMP8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NasNUw/S6q9RxK8fOscjOurNDxpxd/QgZswG6aba5GdtzS1RmiLMBGbpO+61/VYavOUlJ/CWdri9q//+GEJEQrKbm77h9ak7/mL8VZkIOkiDffUzddjBU8vWo2JtKpUNuYZAQjRBy+GgAijW81bC4qvnwjJqdbnNRipLVOQZkOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j45G1EBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j45G1EBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62805C4CEEC;
	Fri, 25 Apr 2025 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570564;
	bh=KNL/iSIey6awHew2sR7v6ErttybNRwGXLg/x5jvMP8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j45G1EBxRs0+i+BevgqySIqvR1Bxl7OhaZCMERsB1xZ7wAL9oLjpvNX+rUpkMKOKK
	 aqxEtKEKHg9lEaXXgsKNLM1VuM6GRZOKaV54BXfZQjdkvJr6poqCT8t0MtPjySLUr3
	 7hHe/BjRRzacvrxphGohxUsYGGVXWifXObktwQoHV6gety0+Cuw2f4Q+tDjqpv1Pg+
	 h0l2UEGmAXuDwzNlzM2/24YKFtXOWT7L9RP8U9CcJ4VmCQnnnn1s1KmpN2QyMu5Qhl
	 KLZIhDMfWn5BjnO29TQIJMB1OxhFkXpTz4OTDXmqoyRL/VI3/dLsrxsYxD1V6Jtt/k
	 cCwOJPxFec9uw==
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
Subject: [PATCH 04/15] x86/cpu: Remove TSC-less CONFIG_M586 support
Date: Fri, 25 Apr 2025 10:42:01 +0200
Message-ID: <20250425084216.3913608-5-mingo@kernel.org>
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

Remove support for TSC-less Pentium variants.

All TSC-capable Pentium variants, derivatives and
clones should still work under the M586TSC or M586MMX
options.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/Kconfig.cpu            | 10 +---------
 arch/x86/Makefile_32.cpu        |  1 -
 arch/x86/include/asm/vermagic.h |  2 --
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index df586ff2178f..e9499e58776c 100644
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

