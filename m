Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48347297A4A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299474; cv=none; b=C4jJLrKyOWz2dYky0on6GMe9igCrrz9vkfjrecoYOAsHVmF/WC0L7/rJgkG1u625z2iwKV9xMaqRa4Y4dcQX8SPRA6Nf0e8qaSb792gGyacHClfyTNc4iMPfS3HR3bKqn5ICUjUf9J2ycuOR5HOu37I/LwBEBNiG6mAY3AG3914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299474; c=relaxed/simple;
	bh=m1/f6cUwFgLy8rwGkqxjggADDxrq1GzWLphLxgSp2Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JcB3AxJ3eOmuNE0cJcoKt29C9TGp0owC3Z0MFEia6hWzj26sX2jpPqnVlulgDqPAwQPcior47oHW6TfxjW7FQrmqKaIrOfMbAeqYmbBwYIEk+GsvvJTzHZ9oS+vYYsXei7zHkiepLL+0wkEbREnnJFUTgu7YN42DnbW+K9iBeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwJXmkoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwJXmkoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1F6C4CEE7;
	Thu, 15 May 2025 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299474;
	bh=m1/f6cUwFgLy8rwGkqxjggADDxrq1GzWLphLxgSp2Ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwJXmkoNi8zObIQC2Qlysthx8Nnkqfcy0ax5uBGhyF2D+Mbpq2CY5nHcwtinrBOJ0
	 nCew/Hfh54PxdQ1iY7ywSHuryC1X4Vp7lBKsTt610if0Oq2Zk9h7yyMfkcxT0+lHqP
	 WBAmj11hxkGqR0SK3BrYkFqv/2zR6G5J+ofb/f+mEtkytaCg/CvX3O1dvztqniUz34
	 HCzLkFMUnxmdtZB8Tafv9dLaZR7Qgwpkl3PEgHK9Akx8aVAPEokUo9/q6bF5si05H+
	 UbOIjWA3ogSQRttbF1kHABH7e4hYzKpvvCku+TNBogIKiti38YbneLe2zhl6kjrjKb
	 dVbOSispgxiOg==
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
Subject: [PATCH 11/15] x86/cpu: Make CONFIG_X86_TSC unconditional
Date: Thu, 15 May 2025 10:57:01 +0200
Message-ID: <20250515085708.2510123-12-mingo@kernel.org>
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
Link: https://lore.kernel.org/r/20250425084216.3913608-12-mingo@kernel.org
---
 arch/x86/Kconfig     | 1 -
 arch/x86/Kconfig.cpu | 1 -
 arch/x86/xen/Kconfig | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be5f9be532a9..3747efea6a31 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -662,7 +662,6 @@ config X86_INTEL_QUARK
 	depends on X86_32
 	depends on X86_EXTENDED_PLATFORM
 	depends on X86_PLATFORM_DEVICES
-	depends on X86_TSC
 	depends on PCI
 	depends on PCI_GOANY
 	depends on X86_IO_APIC
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 246a221c32e2..5f0e29d154a8 100644
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

