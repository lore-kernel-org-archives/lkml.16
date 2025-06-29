Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F19222F765
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751216865; cv=none; b=eprsrVXXeiKO5lsBbTuBbPxSf8PSYLLf7TO3Kt6RKoQOI9KeOsnhJAAQCjdH5JoPyMCdbMWz0FQnCTXBYNTJ/dlrS5N+aBolzrsM9DRuQ61tzUsVaLFTBRio8DIFuoZaTEjljUsZ6VLPqAybepjcGsnh9jrUuHTPhVSFXVjTP2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751216865; c=relaxed/simple;
	bh=Des8q0UDHaege6zmti1sR3Qz/HJBmgilCuYce6UhV1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KuCRD7cmju1euZU5bqhUt1zmQKiJ/0EceLL/zg9kgHEH6ftuI/05qOJ/IbCOXdZldhBCi0UmZl6Cr92NXdSeUPlNn50XuQRB64JsNlC+f5F6+zjIB2mAP7QXZnq6TmNBNTK68EDDfoqJiDV2XW2YEnk8Tm/VZ9IfPNlVLORngzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55TH7dkj016862;
	Sun, 29 Jun 2025 19:07:39 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Willy Tarreau <w@1wt.eu>
Subject: [RFC PATCH v2 1/2] tools/nolibc: make the "headers" target install all supported archs
Date: Sun, 29 Jun 2025 19:07:31 +0200
Message-Id: <20250629170732.16817-2-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <20250629170732.16817-1-w@1wt.eu>
References: <20250629170732.16817-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The efforts we go through by installing a single arch are counter
productive when the base directory already supports them all, and
the arch-specific files are really small. Let's make the "headers"
target simply install headers for all supported archs and stop
trying to build a hybrid "arch.h" file on the fly, to instead keep
the generic one.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/Makefile | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index c69d7bf60c71e..d5be3d213c885 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -24,6 +24,8 @@ Q=@
 endif
 
 arch_file := arch-$(ARCH).h
+nolibc_supported_archs := arm64 arm loongarch m68k mips powerpc riscv s390 sparc x86
+
 all_files := \
 		compiler.h \
 		crt.h \
@@ -81,7 +83,7 @@ help:
 	@echo "Supported targets under nolibc:"
 	@echo "  all                 call \"headers\""
 	@echo "  clean               clean the sysroot"
-	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
+	@echo "  headers             prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
 	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
 	@echo "  help                this help"
 	@echo ""
@@ -92,18 +94,12 @@ help:
 	@echo "  OUTPUT  = $(OUTPUT)"
 	@echo ""
 
+# installs headers for all archs at once.
 headers:
-	$(Q)mkdir -p $(OUTPUT)sysroot
-	$(Q)mkdir -p $(OUTPUT)sysroot/include
-	$(Q)cp --parents $(all_files) $(OUTPUT)sysroot/include/
-	$(Q)if [ "$(ARCH)" = "i386" -o "$(ARCH)" = "x86_64" ]; then \
-		cat arch-x86.h;                 \
-	elif [ -e "$(arch_file)" ]; then        \
-		cat $(arch_file);               \
-	else                                    \
-		echo "Fatal: architecture $(ARCH) not yet supported by nolibc." >&2; \
-		exit 1;                         \
-	fi > $(OUTPUT)sysroot/include/arch.h
+	$(Q)mkdir -p "$(OUTPUT)sysroot"
+	$(Q)mkdir -p "$(OUTPUT)sysroot/include"
+	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
+	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
 
 headers_standalone: headers
 	$(Q)$(MAKE) -C $(srctree) headers
-- 
2.17.5

