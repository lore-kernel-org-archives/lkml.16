Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850AB23ABB3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415855; cv=none; b=WkjEsVCQpxH8J8mwOd8/9KCASoxGoy9UipYIGVz/EtG1JtJ0V46Fjf6TjT/p5YwWB9Pxa8QFOaskjPOUYuBujYwQ+035mAruawz7r2VN9vmRHb5gBouDRxOJAHvYFVNuJtAlKpP+HZ4uFmclQo6btqSgJRXMxHEHmyvhJv6sC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415855; c=relaxed/simple;
	bh=3qKNaEjgInflBHOaU8rjAHsxtVNSXL2xnI6SOmj6QnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PUR0VhivQ/B/2/TMB6yICj6Vzd8zO41j3rD3fqWB8ch+DpVU4SEl2JTU4D8E3c9OE2Grlyp0f138cpx7LL4Z9aaNiPH73d1QFu0xP9d0CoOhYnDE4s88FYR2/dxtINnUWPtqKbFinaZEku508qYIGHAQcPAs/gT0Kxmj2FkPgpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KAbPp1010255;
	Fri, 20 Jun 2025 12:37:25 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH 2/3] tools/nolibc: add a new target "headers_all_archs" to loop over all archs
Date: Fri, 20 Jun 2025 12:37:04 +0200
Message-Id: <20250620103705.10208-3-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250620103705.10208-1-w@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This target allows to install the nolibc headers for all supported
architectures at once, just like it is in the development tree. This
is a first step to support full multi-architecture support.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 9197c79b267a4..8de6ac5cec425 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -23,6 +23,8 @@ else
 Q=@
 endif
 
+nolibc_supported_archs := aarch64 arm loongarch m68k mips powerpc riscv s390 sparc x86
+
 nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
 arch_file := arch-$(nolibc_arch).h
 all_files := \
@@ -83,6 +85,7 @@ help:
 	@echo "  all                 call \"headers\""
 	@echo "  clean               clean the sysroot"
 	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
+	@echo "  headers_all_archs   prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
 	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
 	@echo "  help                this help"
 	@echo ""
@@ -110,6 +113,13 @@ headers_standalone: headers
 	$(Q)$(MAKE) -C $(srctree) headers
 	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
 
+# installs headers for all archs at once.
+headers_all_archs:
+	$(Q)mkdir -p "$(OUTPUT)sysroot"
+	$(Q)mkdir -p "$(OUTPUT)sysroot/include"
+	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
+	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
+
 # GCC uses "s390", clang "systemz"
 CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
 
-- 
2.17.5

