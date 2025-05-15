Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2419CCFA
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315666; cv=none; b=coZlxdytnd+Fb8tYvki24C89I+PIZWN39uxZ26lSfjqzXkKvTccI9J2I8LOEgcKjsSDvqwa7IQlxQe9TBDY8GdFbjrLMRcfaU3MXE2hmYm8BN9x4RBF17oCUbXkxNAlLLpi72xYmTL/e+JBvzZnOwT5Z9CaOq2hYlO9Parm3JEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315666; c=relaxed/simple;
	bh=b/9OwF3dSBdL5COjQsJJdnpUucdyz6w0u0Q2USN+A1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPAzFUWRcBuHYelF1jGBQvNX+Llh1LEeR6RnuGcfCY/47lGi7tOnFHlmV9yF/dpSVzBwnp6KMr+c90Zjsa+P1sQXjk1EqM60MGmcW6zx8LRve2X56ohmQ8TieDJKAN9Mze1hhlhwWxVwgLtGrZ/gN0jlSkCac5RD8TUfAQnLktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWiFZwcZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWiFZwcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00222C4CEF1;
	Thu, 15 May 2025 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315666;
	bh=b/9OwF3dSBdL5COjQsJJdnpUucdyz6w0u0Q2USN+A1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWiFZwcZeBX250A3dbbHG4kRcK2hnkvUw/qI6UazMquyurlSOEL5QlsF7pbuizZK+
	 acGAsCUi6+NT/M1KhHp3h1BTYnz2jH6ufX8fKQzlU7hGw39UOaJdXaJ0JyOzQeP98i
	 EbR8Pkqch8NLQfTP+Bn343OucPABisy84d910Hj+QV3b47sS2HSDop6ye3/KPW4pAZ
	 asSVMWiCQOznrBkYyNFEv1CfGS5GGBGu0dtHiE3pywVeHe+Ep37JkJPQRBEfMTresb
	 m/Zu5gULGWM+q9vF328v5zl73+TZcKDiz5g2zZdRrlYKuzL7Q8TmulKggLeaOz6Fj9
	 Dzwmn6R044DbA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 06/13] x86/kconfig/64: Enable the KVM host in the defconfig
Date: Thu, 15 May 2025 15:27:12 +0200
Message-ID: <20250515132719.31868-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These days all distros enable KVM, and since the x86 defconfig
aims to be a distro kernel work-alike with fewer drivers and
a shorter build time, enable the KVM host in the defconfig too.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/x86_64_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 7d7310cdf8b0..156e9490e29b 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -50,6 +50,11 @@ CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_X86_ACPI_CPUFREQ=y
 CONFIG_IA32_EMULATION=y
+CONFIG_KVM=y
+CONFIG_KVM_INTEL=y
+CONFIG_KVM_AMD=y
+CONFIG_KVM_XEN=y
+CONFIG_KVM_MAX_NR_VCPUS=4096
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
-- 
2.45.2

