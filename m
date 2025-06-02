Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D06022616C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881990; cv=none; b=Ixz9JgdK0HGKeLotEzioBYIWx1bOja2VIffExGCQU5+JenQcrT7JNagAnaArc6ns0gyi594ChClnZe7IIinv0K9IVQkrBWSZPKYG69Bom6CN7abo0QrSTp0IPZrfklG91AelFXSYL3OZA6YVxUkkSuQIoKREmkdpvqB7Q+EcbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881990; c=relaxed/simple;
	bh=LGwMZ23Ye1yiBNLdoBZUkgTCpcRIKyrLcW515NUCYWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DtIrlSyeVXYdh92+T528tKUdR5QZKEYq/++2OSwuazKxoK/+B0ObkfcVmKcnCmpfnZWyqJ9rPMrEAeJ6HjmgMDZUX58ZolWC0bjlLbSQnz9iXw4ePfc3sBuUC4j2oVg2DSaayI2pAOfD1E81z+2fqVrIZkGnu1On/bpjBn4Z6gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m64HknKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m64HknKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C620C4CEEE;
	Mon,  2 Jun 2025 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748881989;
	bh=LGwMZ23Ye1yiBNLdoBZUkgTCpcRIKyrLcW515NUCYWA=;
	h=From:To:Cc:Subject:Date:From;
	b=m64HknKKkP2Q0voFIUj9QsKA8oBZjLvmvuNjmM9n1AJlkB1i+b0Y73mTIiv+JjuY5
	 612fI1/JAY2sKLhk6/Cf28bqZ/HOqpysxgStQBZYqA1agiaDrrdtrfzHB0Zj5UJBR3
	 /DMRtuZxfXxbuoU5Z+yLXNgnW8LtX4g1RQdlEsBH02pnholTRPNCKc+1JdOdGwt8bU
	 KseFxedfEwAPZowGBYPC94MkNr9HJ1aEkFuWGUstREHxAkFikZLSp5Vo8J6J+4VLOr
	 /QiW5SB6hMI5cDqYOB5+SKScQdPAYG35xDGFLMqj9pVvWZmJVFBlSncKdLvel4oU+M
	 1iX5YJdN6wQ0g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
Date: Tue,  3 Jun 2025 01:32:24 +0900
Message-ID: <20250602163302.478765-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extra-y syntax is planned for deprecation because it is similar
to always-y.

When building the boot wrapper, always-y and extra-y are equivalent.
Use always-y instead.

In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
keep the current behavior: prom_init_check is skipped when building
only modular objects.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/boot/Makefile   | 6 +++---
 arch/powerpc/kernel/Makefile | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 184d0680e661..b003f7ac8755 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -242,13 +242,13 @@ $(obj)/wrapper.a: $(obj-wlib) FORCE
 hostprogs	:= addnote hack-coff mktree
 
 targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a) zImage.lds
-extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
+always-y	:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
 		   $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds
 
 dtstree		:= $(src)/dts
 
 wrapper		:= $(src)/wrapper
-wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
+wrapperbits	:= $(always-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
 			$(wrapper) FORCE
 
 #############
@@ -455,7 +455,7 @@ WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
 WRAPPER_BINDIR := /usr/sbin
 INSTALL := install
 
-extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(extra-y))
+extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(always-y))
 hostprogs-installed	:= $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%, $(hostprogs))
 wrapper-installed	:= $(DESTDIR)$(WRAPPER_BINDIR)/wrapper
 dts-installed		:= $(patsubst $(dtstree)/%, $(DESTDIR)$(WRAPPER_DTSDIR)/%, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4d2daa8e7bca..ac01cedad107 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -201,7 +201,9 @@ obj-$(CONFIG_ALTIVEC)		+= vector.o
 
 obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init.o
 obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_entry_64.o
-extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
+ifdef KBUILD_BUILTIN
+always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
+endif
 
 obj-$(CONFIG_PPC64)		+= $(obj64-y)
 obj-$(CONFIG_PPC32)		+= $(obj32-y)
-- 
2.43.0

