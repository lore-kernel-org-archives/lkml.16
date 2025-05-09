Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C0274FCA;
	Fri,  9 May 2025 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780092; cv=none; b=HxIB1S1k3huf15kQTTp7Xakr1i/ih8fxNg7K45+eXJXmCYQS+H31L3+o3K8I783CVgSPwRDxtzJRGaWQgzZW/8sUu/B5v7tjSM1bcEovFg9lnvE85IlmOBnUZv/rFCssRnJavthuk/9yO/WbwsG5zi1lp6x7nGbMjAv6Y2eo29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780092; c=relaxed/simple;
	bh=YhoZQ5OYQ/UTvTMR4AgPd2uAE5i+RB+fKHKGmCgwscI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A3XziWCVKhFvN/gpYjPOQR8vsDvXu1ErJ4iv9SDH/uQrb/NfBYJjM7SQXepkHcNQXhlVDRgDEIe3IrV4zajehZKLEiQzt1yWdopJWkg8GCbnRxQHLPj4cLh/mDry0QbDOyCiLfgXYjiA9GS/vLtKiyOQE5Et4n0bwA6LOcKfsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWaDjrFJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWaDjrFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0252DC4CEE4;
	Fri,  9 May 2025 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746780092;
	bh=YhoZQ5OYQ/UTvTMR4AgPd2uAE5i+RB+fKHKGmCgwscI=;
	h=From:To:Cc:Subject:Date:From;
	b=MWaDjrFJPBCu5ORNnwm/y625gwXqZAQTeX5EqJycQuT4X/VzQDdpcxwlFJyfxds2D
	 ZKtDeSv8zbyQx02d97ycFDebgApuNUhBPwxaSlmfOnwgv3F/tLX0DR5rIvQ0JSyvZR
	 5DiodK1a21yvu9gMRs6cJU5QmIkSiC+SBa76ys0Acv7kKCevZ/uxmfycpJV1uRh1+x
	 DLB3/8pvwH55ZWjbvZyqjuZRfMkdTQWb47ZgTbmYzmBb19x5XQ4dwCTy15zEAM5xIU
	 HFl4VTHewOIE4pO0HzDZ+HkPxa7D3Z5+9wp/PATC9bPMehuMRpRX4Fyt4vzS8ddENn
	 D7k/U0/YxBoaw==
From: Arnd Bergmann <arnd@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Gow <davidgow@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] um: stop using PCI port I/O
Date: Fri,  9 May 2025 10:40:52 +0200
Message-Id: <20250509084125.1488601-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

arch/um is one of the last users of CONFIG_GENERIC_IOMAP, but upon
closer look it appears that the PCI host bridge does not register
any port I/O, and the absense of both custom inb/outb functions and
a PCI_IOBASE constant means that actually trying to use port I/O
results on a NULL pointer access.

Build testing with clang confirms this by warning about this exact
problem:

include/asm-generic/io.h:549:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
  549 |         val = __raw_readb(PCI_IOBASE + addr);
      |                           ~~~~~~~~~~ ^

Remove all the Kconfig selects that refer to legacy port I/O
and instead just build the normal MMIO path that is emulated
by the virtio PCI host.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/um/Kconfig         |  6 ------
 arch/um/kernel/Makefile |  1 -
 arch/um/kernel/ioport.c | 13 -------------
 3 files changed, 20 deletions(-)
 delete mode 100644 arch/um/kernel/ioport.c

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 79509c7f39de..f08e8a7fac93 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -52,13 +52,7 @@ config NO_IOMEM
 config UML_IOMEM_EMULATION
 	bool
 	select INDIRECT_IOMEM
-	select HAS_IOPORT
 	select GENERIC_PCI_IOMAP
-	select GENERIC_IOMAP
-	select NO_GENERIC_PCI_IOPORT_MAP
-
-config NO_IOPORT_MAP
-	def_bool !UML_IOMEM_EMULATION
 
 config ISA
 	bool
diff --git a/arch/um/kernel/Makefile b/arch/um/kernel/Makefile
index 4df1cd0d2017..4669db2aa9be 100644
--- a/arch/um/kernel/Makefile
+++ b/arch/um/kernel/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_GPROF)	+= gprof_syms.o
 obj-$(CONFIG_OF) += dtb.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-$(CONFIG_STACKTRACE) += stacktrace.o
-obj-$(CONFIG_GENERIC_PCI_IOMAP) += ioport.o
 
 USER_OBJS := config.o
 
diff --git a/arch/um/kernel/ioport.c b/arch/um/kernel/ioport.c
deleted file mode 100644
index 7220615b3beb..000000000000
--- a/arch/um/kernel/ioport.c
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2021 Intel Corporation
- * Author: Johannes Berg <johannes@sipsolutions.net>
- */
-#include <asm/iomap.h>
-#include <asm-generic/pci_iomap.h>
-
-void __iomem *__pci_ioport_map(struct pci_dev *dev, unsigned long port,
-			       unsigned int nr)
-{
-	return NULL;
-}
-- 
2.39.5

