Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96E1B6D11
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570585; cv=none; b=Nu3iQNPzKoI2RDOH9D3i6RufkNzGl+Nv4PfalzFOcfNdT5OxhSUDRYQZrVngw1W9KcdHmBeN4X7lo9bg8+JAnJ26ixJZuCw5eM8VM3ULTww5b5Zk3AZVNJedCTqOxwHvRO9WLySAstwTFzwVW9lAjKy7YftKmi3kPSiqXrRR11c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570585; c=relaxed/simple;
	bh=PIC1RYzVyDxRiQe/qEsgFbpLdGg7qmiKb8xV6wOUDuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nm331TSpV9CioNTVuYZ8UsxTA/et6nuI9oOfEtGQAmTseadsRHnqT3ujA8dJMuLsqzaaKyi2EJoxUlx3LpyoqjvKSnkIbjradbqbg9w1GwYp2YFv3BExdUlJIkN1Ds8pZb54j3bOaAwD8UuwgQSILMpCjG0ajczteY6g9be6cWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lULEzL2k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lULEzL2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1611AC4CEEC;
	Fri, 25 Apr 2025 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745570585;
	bh=PIC1RYzVyDxRiQe/qEsgFbpLdGg7qmiKb8xV6wOUDuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lULEzL2kK9vB/lLVic+o9OVO36dunrIj2d9f/qPj7QFpPOvKFnto6Tns8fL82B15V
	 BoZJaYDQTm3ZrrpkeB2EEBllAv3cIefBtmwQ2yv1hcJeLEoP8Z+gl+EIzZlnw/JJTL
	 JUKl2cF7QYtpenbfjgfGljA9rQdmZ9b+0KxfTXkJ4A3BiH23bT5/BYTQhZGCPjhWhq
	 yhg5YLbxFAitwO+iBddVqIW4YjhGP+lAtsYarTHzuCWHj+kcEvWVFJ7wh/37UFDIuG
	 cpaZuHAnGmMtudt4ZE9pb/thiUOTkiYzJjYHzVpJ1pwZ6yRCBKKRR23LYpLb7db+ev
	 J9yOujJhZm2ag==
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
Subject: [PATCH 11/15] x86/cpu: Make CONFIG_X86_TSC unconditional
Date: Fri, 25 Apr 2025 10:42:08 +0200
Message-ID: <20250425084216.3913608-12-mingo@kernel.org>
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
 arch/x86/Kconfig     | 1 -
 arch/x86/Kconfig.cpu | 1 -
 arch/x86/xen/Kconfig | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 137b5ddf1f86..465e5abd2750 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -661,7 +661,6 @@ config X86_INTEL_QUARK
 	depends on X86_32
 	depends on X86_EXTENDED_PLATFORM
 	depends on X86_PLATFORM_DEVICES
-	depends on X86_TSC
 	depends on PCI
 	depends on PCI_GOANY
 	depends on X86_IO_APIC
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index ab4988e06d86..30466a258db8 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -238,7 +238,6 @@ config X86_USE_PPRO_CHECKSUM
 
 config X86_TSC
 	def_bool y
-	depends on (MWINCHIP3D || MCRUSOE || MEFFICEON || MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MVIAC7 || MGEODEGX1 || MGEODE_LX || MATOM) || X86_64
 
 config X86_HAVE_PAE
 	def_bool y
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 98d8a50d2aed..222b6fdad313 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -10,7 +10,7 @@ config XEN
 	select X86_HV_CALLBACK_VECTOR
 	depends on X86_64 || (X86_32 && X86_PAE)
 	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
-	depends on X86_LOCAL_APIC && X86_TSC
+	depends on X86_LOCAL_APIC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
 	  kernel to boot in a paravirtualized environment under the
-- 
2.45.2

