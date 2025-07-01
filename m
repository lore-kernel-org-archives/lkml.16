Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289392737E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368837; cv=none; b=M1P+pTTZwqIyNH8bXfXp1JYJTnV3c7LfuIJjpjTBgUak09ltRA6BjtowQVWvxHYKkc+wVNc08xnoOuJi+soNVGluV6wLrk5iQtJP/28cNxw9kbULz1cEn8y5wpcRCPaneI9ePqR3RYePhGbbhauznSDWx68QWC7jxIkCiLbMjz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368837; c=relaxed/simple;
	bh=edM7g36LIzxnpCXk4fNdHPOI8dVpw9r0Fa+ZaaP4vC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUkYSO/0IdeID913YLl2nhpcmaQz8X0yDClYkBpCV0LywdFcHarggTdYXuK4IJpnGKjNMtcqQ8Z+JIfWU1z1/sgaKvM+82eBiu0eA0GU+3X8E449A+te3+gJuys4XkOM4cElUkZ++hgxLOZbSV1nueEs9+5C5ppq/MPNR6/RLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bWft33dNrz9v5M;
	Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6txJhLz5S1Ji; Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bWft32qhJz9v53;
	Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B4DA8B765;
	Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5LaM2CoUw8eA; Tue,  1 Jul 2025 12:49:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89E108B763;
	Tue,  1 Jul 2025 12:49:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Date: Tue,  1 Jul 2025 12:49:29 +0200
Message-ID: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751366969; l=1053; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=edM7g36LIzxnpCXk4fNdHPOI8dVpw9r0Fa+ZaaP4vC0=; b=onBYVdrKpVDLsab8iFcNaM/Z4XjUhzuEjMbpiSMR/HQMbd7GooQ6Lezo3cC5QbEwjGUWWmrt6 MNli6DDn0xvCw+mvkU1TqBvrjIDbt7JBQJhEaCYO7TERnNFYklFqFHh
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

When building with CONFIG_RELOCATABLE, there is a .interp section
which contains the name of the expected ELF interpreter:

Contents of section .interp:
 c0000000021c1bac 2f757372 2f6c6962 2f6c642e 736f2e31  /usr/lib/ld.so.1
 c0000000021c1bbc 00                                   .

That information is useless and even likely wrong. Remove it.

Link: https://github.com/linuxppc/issues/issues/434
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f3804103c56c..9753fb87217c 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -101,7 +101,7 @@ KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
 endif
 
 LDFLAGS_vmlinux-y := -Bstatic
-LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
+LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie --no-dynamic-linker
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
-- 
2.49.0

