Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F74288C9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299452; cv=none; b=XJHt56PiaRIOVWt6sIz+PWBs6UxrYUII9Ucsav3j0pF+EGinh9LVCUt5wiTYdGgOB3bNJM0y0kuQczRw1/lLk2pc82qJ90N3dmKi1O17yxvD0clohkz2QBLjFwfFM2mZKPhUr8do99tH/fpGvvUtlo0rj42j3Rjk4HyOaQCUJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299452; c=relaxed/simple;
	bh=jg/MsgimZX8oAlGKsFQk0sHpdMmkgyLhuyqnfwI8eMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvuF11g7mw3QaGUa3beC8tjze+XAwNfMBo1KNqi9EvSjmpZfWCYe1bHzthpV7XA3l4znRRgC3DQUL52LIT2O1BFrEl0EoPKEefJxcT7Rts6vlt3fKxgtv1+BHAlQ4cVzqs+iOfluxERABgpWPFWeEVJ21S79pICGh6j93OXIzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvuIzAev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvuIzAev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37352C4CEE7;
	Thu, 15 May 2025 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299452;
	bh=jg/MsgimZX8oAlGKsFQk0sHpdMmkgyLhuyqnfwI8eMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvuIzAev3tBN8tR1TyhZLqYV3BYu0viNzQpIPHeiJZF0TC2pkQ4T8Zh5sVzy2qimH
	 l5oSmGld9o64gufLSO2LhEd/F0ZzMSBmpqAJBGnBRfME9I++Z1aNImQJ2w8bGxyORd
	 rJfyKXzNYfAR4SJyjexi8rvqtaxVuM7R5hUh+QJ+Y4zJndzlLGhVANI1O1c8127894
	 SeS3tFV+flnYEHDW8QBw9OB+QVGRm2tH9hDCTutrmqqXPiaDgHoP+0ni8tMSdaz70I
	 uZDDrf7aUl4H8Pq17gIWlOKEG3jC5EBeMuVKkY8Jemz/3332sFfLc8/H+BmaVPFMHY
	 o0Ik72Xo9dPTg==
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
Subject: [PATCH 05/15] x86/cpu, x86/platform, watchdog: Remove CONFIG_X86_RDC321X support
Date: Thu, 15 May 2025 10:56:55 +0200
Message-ID: <20250515085708.2510123-6-mingo@kernel.org>
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: Ahmed S . Darwish <darwi@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20250425084216.3913608-6-mingo@kernel.org
---
 arch/x86/Kconfig         | 11 -----------
 drivers/watchdog/Kconfig |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 557322108b15..1f29dc81018f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -674,17 +674,6 @@ config X86_INTEL_QUARK
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

