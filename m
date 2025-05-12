Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CE91C8639
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074036; cv=none; b=gS789W7J1dC652wJXwjewpC7fVVHFSHgGTYVKoZeJkbnfQPlLaFVz/RR6bXd4s+/KwFUGlr2+KLEo9gLF7euevCVqPtct2akXNoMl157Cyo7poJmtOtLMt4TJzGDzMahagACbvyhnCe98qAad2m8LDUbB8cNOaFVXX3wsZgsd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074036; c=relaxed/simple;
	bh=2bRnPOgixSh1KN5TilifSXLoxOTTFgZvz6H1AGyqCe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oo/IQIrRgkq6nvTIadAwoX3kdnocqZ9siTZU0jm9t9DOgOQ/HW/1RtOgJEBUoPVdKrEoRrzXhgU3G5bRxjXg7zz7a9tJUZE6oTMqWW/7KWnky8z/RsD2DNVW66wfKFdtzhThJoLOqQC8wLE/1X5w9K7OGZWFyjbevo6UsY3gOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zx7790M1cz9sB2;
	Mon, 12 May 2025 20:15:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RD4ewTYA1SE; Mon, 12 May 2025 20:15:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zx7786JDDz9s9J;
	Mon, 12 May 2025 20:15:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C80628B764;
	Mon, 12 May 2025 20:15:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pjYqhLFiADqp; Mon, 12 May 2025 20:15:00 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 880118B763;
	Mon, 12 May 2025 20:14:59 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: Fix build of VDSO32 with pcrel
Date: Mon, 12 May 2025 20:14:55 +0200
Message-ID: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747073696; l=2735; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2bRnPOgixSh1KN5TilifSXLoxOTTFgZvz6H1AGyqCe4=; b=gJKXhk5l8wg7PTWXYLYWRfjMZnNjPB8gWqHCIsAtnbSFXNMPDLiWnB7uowT38KyfINX9TmzEO 8GXCIPXwtSbBp79ffWNmIrzbr2p8zraECBzL2A5mZjKofq7Ogp1mQ38
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Building vdso32 on power10 with pcrel leads to following errors:

	  VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: syntax error; found `@', expected `,'
	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: junk at end of line: `@notoc'
	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
	 ...
	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2

Once the above is fixed, the following happens:

	  VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
	cc1: error: '-mpcrel' requires '-mcmodel=medium'
	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
	make: *** [Makefile:251: __sub-make] Error 2

Make sure pcrel version of CFUNC() macro is used only for powerpc64
builds and remove -mpcrel for powerpc32 builds.

Fixes: 7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL addresing")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h | 2 +-
 arch/powerpc/kernel/vdso/Makefile  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 02897f4b0dbf..b891910fce8a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -183,7 +183,7 @@
 /*
  * Used to name C functions called from asm
  */
-#ifdef CONFIG_PPC_KERNEL_PCREL
+#if defined(__powerpc64__) && defined(CONFIG_PPC_KERNEL_PCREL)
 #define CFUNC(name) name@notoc
 #else
 #define CFUNC(name) name
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index e8824f933326..8834dfe9d727 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -53,7 +53,7 @@ ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WAR
 ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 CC32FLAGS := -m32
-CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
+CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc -mpcrel
 ifdef CONFIG_CC_IS_CLANG
 # This flag is supported by clang for 64-bit but not 32-bit so it will cause
 # an unused command line flag warning for this file.
-- 
2.47.0

