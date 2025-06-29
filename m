Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1F422FF39
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216866; cv=none; b=ThhVed5FuBBn/XVsjtp1yJB98UZSxwLkoQo2ZdxceTP+KZlruAPFvu43KMXBpt7O5UamxwcDGIZG3hZC5Ei19hVx56BwLw3dwn57uw+u82NrllGgY36HLQ5OtSD+uEJGpuGcMEaEw7cVjmSYrGMC5ifmLO8D2W1GVzwhi2N55G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216866; c=relaxed/simple;
	bh=2jmnbI+oGmnBzC3CutU8HydjnbAM10mz6nlY1ZF8N64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=oUDuwdMMd6T/Q7KRIQcBP/EtOSbsL193LttipY9QXwT+QfdIrozfRDuiblBfbzTT26xEGS3SgbGhEyQLLTQhBn+E5gT5KxJ+jQDD2bgll4AMdtPmeBNNrbsQf7e9CXbZZlSaG5g2/tEMlRMp1Kq4H0Yoomn8AnM2fD0u2LfUbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55TH7dAq016863;
	Sun, 29 Jun 2025 19:07:39 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH v2 2/2] tools/nolibc: add a new "install_all_archs" target
Date: Sun, 29 Jun 2025 19:07:32 +0200
Message-Id: <20250629170732.16817-3-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250629170732.16817-1-w@1wt.eu>
References: <20250629170732.16817-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This installs all supported archs together, both from nolibc and kernel
headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
and asm/ is rebuilt from all these files in order to include the right
one depending on the build architecture. This is done by reusing a
template file (asm-template.h) for each file found under asm-arch-*,
and including the right sub-dir depending on the current arch.

This allows to use a single unified sysroot for all archs, and to only
change the compiler or the target architecture. This way, a complete
sysroot is much easier to use (a single directory is needed) and much
smaller.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile       | 24 ++++++++++++++++++++++++
 tools/include/nolibc/asm-template.h | 25 +++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 tools/include/nolibc/asm-template.h

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index d5be3d213c885..c47559a066f35 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -86,6 +86,7 @@ help:
 	@echo "  headers             prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
 	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
 	@echo "  help                this help"
+	@echo "  install_all_archs   install a multi-arch sysroot + kernel headers in \$${OUTPUT}sysroot"
 	@echo ""
 	@echo "These targets may also be called from tools as \"make nolibc_<target>\"."
 	@echo ""
@@ -105,6 +106,29 @@ headers_standalone: headers
 	$(Q)$(MAKE) -C $(srctree) headers
 	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
 
+install_all_archs: headers
+	@# install common headers for any arch, take them all. This will clear everything.
+	$(Q)$(MAKE) -C $(srctree) ARCH=x86 mrproper
+	$(Q)$(MAKE) -C $(srctree) ARCH=x86 headers_install no-export-headers= INSTALL_HDR_PATH="$(OUTPUT)sysroot"
+	@# remove the contents of the unused asm dir which we will rebuild from the arch ones
+	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
+	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
+	@# Now install headers for all archs
+	$(Q)for arch in $(nolibc_supported_archs); do \
+		echo "# installing $$arch"; \
+		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \
+			$(MAKE) -C $(srctree) ARCH=$$arch mrproper; \
+			$(MAKE) -C $(srctree) ARCH=$$arch headers_install no-export-headers= \
+				INSTALL_HDR_PATH="$(OUTPUT)sysroot/include/$$arch" >/dev/null; \
+			mv "$(OUTPUT)sysroot/include/$$arch/include/asm" "$(OUTPUT)sysroot/include/asm-arch-$$arch"; \
+			rm -rf "$(OUTPUT)sysroot/include/$$arch"; \
+		fi;\
+	done; \
+	mkdir -p "$(OUTPUT)sysroot/include/asm"; \
+	for file in $$(find "$(OUTPUT)sysroot/include/"asm-arch-* -maxdepth 1 -name '*.h' -printf '%P\n'); do \
+		sed -e "s!_ASMFILE_!$$file!" asm-template.h > "$(OUTPUT)sysroot/include/asm/$$file"; \
+	done
+
 # GCC uses "s390", clang "systemz"
 CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
 
diff --git a/tools/include/nolibc/asm-template.h b/tools/include/nolibc/asm-template.h
new file mode 100644
index 0000000000000..84930c4761d16
--- /dev/null
+++ b/tools/include/nolibc/asm-template.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+
+#if defined(__x86_64__) || defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
+#include "../asm-arch-x86/_ASMFILE_"
+#elif defined(__ARM_EABI__)
+#include "../asm-arch-arm/_ASMFILE_"
+#elif defined(__aarch64__)
+#include "../asm-arch-arm64/_ASMFILE_"
+#elif defined(__mips__)
+#include "../asm-arch-mips/_ASMFILE_"
+#elif defined(__powerpc__)
+#include "../asm-arch-powerpc/_ASMFILE_"
+#elif defined(__riscv)
+#include "../asm-arch-riscv/_ASMFILE_"
+#elif defined(__s390x__) || defined(__s390__)
+#include "../asm-arch-s390/_ASMFILE_"
+#elif defined(__loongarch__)
+#include "../asm-arch-loongarch/_ASMFILE_"
+#elif defined(__sparc__)
+#include "../asm-arch-sparc/_ASMFILE_"
+#elif defined(__m68k__)
+#include "../asm-arch-m68k/_ASMFILE_"
+#else
+#error Unsupported Architecture
+#endif
-- 
2.17.5

