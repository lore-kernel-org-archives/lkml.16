Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9104023E325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415855; cv=none; b=lSu2K8U+LsLXir9uoqjT4KxvpQ48CG920I1zFZedZPe9n07LP2BOi+l5y8ykImgh8x2tbGhahGWfV/NNO+pRGV6uSmk2MP9fqYwsFId9uT0hUiR3x6SCSEwhN4Q/pO9yYvfNGNPug4dxpeNok+ZD6mBFWrwy0gDpJfaNMku3SUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415855; c=relaxed/simple;
	bh=sr18R6sd48OdpaBt0pb4YucvjAl/AlGmSjFBN2u0WQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=gVdsyzX8Kl4z6C5adzcG39zzDIfQctctTvGIkZMUR/gXwDCtRUSz8joaMwNWWVRBBS/pX9J/e+GiWbpaUiCD0ylTOMHvSo0LzuQ5VTVaLY7dRjwtlpdPEMbJpiUPeMf4WeMgVlX7zYR1rjeTm5L37qZ9StK9xpbIr8CQs3kR2RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KAbQIP010256;
	Fri, 20 Jun 2025 12:37:26 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs" target
Date: Fri, 20 Jun 2025 12:37:05 +0200
Message-Id: <20250620103705.10208-4-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620103705.10208-1-w@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This installs all supported archs together, both from nolibc and kernel
headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
and asm/ is rebuilt from all these files in order to include the right
one depending on the build architecture.

This allows to use a single unified sysroot for all archs, and to only
change the compiler or the target architecture. This way, a complete
sysroot is much easier to use (a single directory is needed) and much
smaller.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 8de6ac5cec425..b6ed11d0b5419 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -88,6 +88,7 @@ help:
 	@echo "  headers_all_archs   prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
 	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
 	@echo "  help                this help"
+	@echo "  install_all_archs   install a multi-arch sysroot + kernel headers in \$${OUTPUT}sysroot"
 	@echo ""
 	@echo "These targets may also be called from tools as \"make nolibc_<target>\"."
 	@echo ""
@@ -120,6 +121,44 @@ headers_all_archs:
 	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
 	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
 
+install_all_archs: headers_all_archs
+	@# install common headers for any arch, take them all. This will clear everything.
+	$(Q)$(MAKE) -C $(srctree) ARCH=x86 mrproper
+	$(Q)$(MAKE) -C $(srctree) ARCH=x86 headers_install no-export-headers= INSTALL_HDR_PATH="$(OUTPUT)sysroot"
+	@# remove the contents of the unused asm dir which we will rebuild from the arch ones
+	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
+	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
+	@# Now install headers for all archs
+	$(Q)for arch in $(patsubst aarch64,arm64,$(nolibc_supported_archs)); do \
+		echo "# installing $$arch"; \
+		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \
+			$(MAKE) -C $(srctree) ARCH=$$arch mrproper; \
+			$(MAKE) -C $(srctree) ARCH=$$arch headers_install no-export-headers= \
+				INSTALL_HDR_PATH="$(OUTPUT)sysroot/include/$$arch" >/dev/null; \
+			mv "$(OUTPUT)sysroot/include/$$arch/include/asm" "$(OUTPUT)sysroot/include/asm-arch-$$arch"; \
+			rm -rf "$(OUTPUT)sysroot/include/$$arch"; \
+			case "$$arch" in \
+				arm)       cond="defined(__ARM_EABI__)" ;; \
+				arm64)     cond="defined(__aarch64__)" ;; \
+				loongarch) cond="defined(__loongarch__)" ;; \
+				m68k)      cond="defined(__m68k__)" ;; \
+				mips)      cond="defined(__mips__)" ;; \
+				powerpc)   cond="defined(__powerpc__)" ;; \
+				riscv)     cond="defined(__riscv__)" ;; \
+				s390)      cond="defined(__s390__) || defined(__s390x__)" ;; \
+				sparc)     cond="defined(__sparc__)" ;; \
+				x86)       cond="defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__) || defined(__x86_64__)";; \
+				*)         echo "Unsupported arch" >&2; exit 1;; \
+			esac;\
+			for file in "$(OUTPUT)sysroot/include/asm-arch-$$arch/"*.h; do \
+				base="$${file##*/}"; \
+				( echo "#if $$cond"; \
+				  echo "#include \"../asm-arch-$$arch/$$base\""; \
+				  echo "#endif" ) >> "$(OUTPUT)sysroot/include/asm/$$base"; \
+			done; \
+		fi;\
+	done
+
 # GCC uses "s390", clang "systemz"
 CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
 
-- 
2.17.5

