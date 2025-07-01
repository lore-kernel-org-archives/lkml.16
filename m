Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288CE272E7F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368837; cv=none; b=OuJ6MEEH8ZDmbi5ijW630RRCK4QGX7XAYCpfnyMRryfT4eiypRoAMpf8DnsfeM9wPKkwvYbiZBRoQ7V/0u3iK+mv93bTiW1N0A/bbGIy/ZmBIUs0IUXz05TLASBGXB85pHgxg2hH2JGzVssIYuGfw3X1CeOx38hKgJ4kno8tLnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368837; c=relaxed/simple;
	bh=Fmh/oUteSMJXBwASChJwBISKL4lDdtXTv5z370N0ZhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8NzhAYqzEbrUznKY1rkRaagr0OD63jh2VL9zM0gvzjODB2ZRZtrXM+bJ0cizdsc0ymuBVofjufA4a8woGSm8E2jB3ekgnKHa5afoxo1n+oizjd+vGkQldxmWwCGNlLisNTOLlcqh5cqlbMFqGRwkp4UrEhmgwy13NwFdofX0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bWftm1SCKz9v6s;
	Tue,  1 Jul 2025 12:50:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZjP7bqju4rm; Tue,  1 Jul 2025 12:50:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bWftm0rDHz9v6d;
	Tue,  1 Jul 2025 12:50:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 17B0C8B765;
	Tue,  1 Jul 2025 12:50:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XdqZhR-nxYqf; Tue,  1 Jul 2025 12:50:08 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AB5E48B763;
	Tue,  1 Jul 2025 12:50:07 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] arch/powerpc: Remove support for older GCC and binutils
Date: Tue,  1 Jul 2025 12:50:07 +0200
Message-ID: <b6b94cba7492c8581e8d5d25b15962e5ad7a37c2.1751366979.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751367007; l=1618; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Fmh/oUteSMJXBwASChJwBISKL4lDdtXTv5z370N0ZhY=; b=em+8ziEW8wo/UJ208nB+/sKg9HEwdRL83AvMPAfM06pEayyHy/vcuDHEd/uGf/UuyUM1w/fRE cQI0OzWzOY5CGFcZiLtT0DgcNJiHgc5dffaHH0OVFbmtnkKvS1VHC5c
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30") raised
minimum GCC_VERSION and LD_VERSION.

Simplify powerpc build accordingly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig      | 2 +-
 arch/powerpc/boot/wrapper | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3e0cc83f120..cd35d90dfb49 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -252,7 +252,7 @@ config PPC
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
-	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
+	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 3d8dc822282a..a75baefd1cff 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -226,11 +226,7 @@ ld_is_lld()
 
 # Do not include PT_INTERP segment when linking pie. Non-pie linking
 # just ignores this option.
-LD_VERSION=$(${CROSS}ld --version | ld_version)
-LD_NO_DL_MIN_VERSION=$(echo 2.26 | ld_version)
-if [ "$LD_VERSION" -ge "$LD_NO_DL_MIN_VERSION" ] ; then
-	nodl="--no-dynamic-linker"
-fi
+nodl="--no-dynamic-linker"
 
 # suppress some warnings in recent ld versions
 nowarn="-z noexecstack"
-- 
2.49.0

