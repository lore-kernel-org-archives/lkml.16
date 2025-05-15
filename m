Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE575293B69
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299481; cv=none; b=ckguBk7gRtenOmMVUTWTg9Npl5uYQDEWZw5qYCT66uzM/MDnsOU7y4cR5LJYq4S40ApNpPf/X0PCRXPNox1AXbb+IdXS82Kdu1k/9vaoaju2azk/aI3IFgC7a/bYGygTWP9o1FwfdPN8jj8rqm4USjZDoX5AwhMzMjQyzwh8xFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299481; c=relaxed/simple;
	bh=vT91OralCxDf7tZj4Ytf33Vg6J6q4NXGQ0jCa9/KjeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eesmwMfLkw8bR7+G6XuScuE8QRW4R3EYEuqPomxKhuTw+hcbKGE42zM0xZMx4Y7FYOhju6u7ec5U/lunOeCr2qiDzCGF9MNDkI5EbCWm3lvNb7qZd/HySeJWI8HU2cwWKui0Uq1pe6XfGPfGXij/SzasbTwn+idYwboxvoCVzB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlmvBLWk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlmvBLWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3DFC4CEE7;
	Thu, 15 May 2025 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299481;
	bh=vT91OralCxDf7tZj4Ytf33Vg6J6q4NXGQ0jCa9/KjeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IlmvBLWkjfSSubbX7HQmCZuqWfmAPCDiI5FEG35hDj6ugQddbIiIWGRzdhEnMlWCb
	 EAJmnH368Ssu7BScuJqrLP1Y7qtdUm7hs+Di9fGdQhQ73RKSRde0+jwlyYWT5UaZTG
	 1JK22i08IHw0CZlhW/K7Nxexnd9hb4naBfsTHmRwro/Riy/Pz0yuSxr1h7615OPU+r
	 mCYTeSpIfBhq0G2YG9iITt4fiGI/eMunlkJUX2FnnjA+DCsrb3q5yJEBEjDwONo3Vi
	 Jrk21mcALfDuVZ7mAiEUVgNa9N0qZqk+DcLp+941P4bgg8+/rUJy3HO5U0+gYM4hLH
	 IwauUpC0r/x2Q==
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
Subject: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Date: Thu, 15 May 2025 10:57:03 +0200
Message-ID: <20250515085708.2510123-14-mingo@kernel.org>
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

I.e. it's a boot time requirement for the CPU to support it.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-14-mingo@kernel.org
---
 arch/x86/Kconfig             | 2 +-
 arch/x86/Kconfig.cpu         | 3 +--
 arch/x86/Kconfig.cpufeatures | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3747efea6a31..a715f877e199 100644
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
index 5f0e29d154a8..b3772d384fa0 100644
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
 
 config X86_DEBUGCTLMSR
 	def_bool y
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

