Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BAB1B6D11
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570592; cv=none; b=hZdjIU97siRivMP1kUMmP1h5tLZzQTzM6EE8eLVlbXcZmEzWcZjf9mmu1xnm96md5toOQklhKMA7q15eEuZ83PVbyvJuy+OXKWC/3XhyiNiZt8ux6fGV61Ip9yEX5XRVZ6QP8AmDRVecoG1rAAzGrY/IgycBKD6SbzFFHho6AxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570592; c=relaxed/simple;
	bh=qtViRP4R2MK+3DYmXWG1Vh9hHoPAFJ7cX1m4fuZ9CmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AErsH0nCEYTSNkcS7LEGYblXWE1xYtJh0htMO6mDZLlP96ZZKYOiOcV2z7DuhaUfJefxVXlFfWTw3zjohYluSSbpQ1/+woeQzIBCM+NmQ0k65ETMf970ZXIp6SNFd/YAX6PWCmLojD1ZL6Uoe1dWQ1dp2ZRFddwWwpFEZxqLPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUKHB32y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUKHB32y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2092CC4CEEB;
	Fri, 25 Apr 2025 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570591;
	bh=qtViRP4R2MK+3DYmXWG1Vh9hHoPAFJ7cX1m4fuZ9CmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cUKHB32ypWbaDCdoZevr2/Lz9go9dHuSVtCnUO4B6YXs12MoKIdcoLlgXy/D4Nef5
	 W8WK+qGtG9Riu6D48lJLhs/dJ8VDNe4fvkED5Zpfcab8+mTKSg99Ip8KnKnoK0WTlF
	 U01qOe3p2OWUQqfm1DHgXGz9HVCoAGpB6XtEYdI3d2z4fsZd3PLEx4qhJ7wHI+J2B3
	 0s5nQfFrt0aLXqj7EkgKSsIbFrGfVNuK8zQydwVThho3I/WF+ssK9Ne7F8CzInE2G8
	 Mm78OSfFh5z7Hjk5FgkYqzRGs2d/fm1X/FatkdWDnKeFSi5QrjS5LncL5At/kHA8ih
	 7gNsHotBUp5+Q==
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
Subject: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Date: Fri, 25 Apr 2025 10:42:10 +0200
Message-ID: <20250425084216.3913608-14-mingo@kernel.org>
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

I.e. it's a boot time requirement for the CPU to support it.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/Kconfig             | 2 +-
 arch/x86/Kconfig.cpu         | 3 +--
 arch/x86/Kconfig.cpufeatures | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 465e5abd2750..a9d717558972 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -136,7 +136,7 @@ config X86
 	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
-	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CX8
+	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 30466a258db8..6f1e8cc8fe58 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -245,7 +245,6 @@ config X86_HAVE_PAE
 
 config X86_CX8
 	def_bool y
-	depends on X86_HAVE_PAE || M586TSC || M586MMX || MK6 || MK7 || MGEODEGX1 || MGEODE_LX
 
 # this should be set for all -march=.. options where the compiler
 # generates cmov.
@@ -257,7 +256,7 @@ config X86_MINIMUM_CPU_FAMILY
 	int
 	default "64" if X86_64
 	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
-	default "5" if X86_32 && X86_CX8
+	default "5" if X86_32
 	default "4"
 
 config X86_DEBUGCTLMSR
diff --git a/arch/x86/Kconfig.cpufeatures b/arch/x86/Kconfig.cpufeatures
index cd551818f451..f04ae53435bc 100644
--- a/arch/x86/Kconfig.cpufeatures
+++ b/arch/x86/Kconfig.cpufeatures
@@ -42,7 +42,6 @@ config X86_REQUIRED_FEATURE_NOPL
 
 config X86_REQUIRED_FEATURE_CX8
 	def_bool y
-	depends on X86_CX8
 
 # this should be set for all -march=.. options where the compiler
 # generates cmov.
-- 
2.45.2

