Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87274211712
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071410; cv=none; b=n7mcX8g5A4oauCBOKEZveXeLoL1xqr5fGh9Fm0E2fauMZzLr3FXjFCAQMQY03f3FeQi4izAhKaWvs4Fygv333hr98wDMn5GO9yVhz6ZTlWcg92pBNIXp36Gt8psHmh05Tc2TimzFNR/HLpGAyngK5Jo0TTuj86w9uZfCPeUkWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071410; c=relaxed/simple;
	bh=lbZJml6REyBa5Wqf6whljObeSVlpAH/8U8yaPU9LXBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuW5SDMY6dCQXbnOtqIPp69w0oXeCC7t9YTdyQwCLcEDMwZK1R8JJgb1FoPywueq539OKAwDpiXtE/GTbqT7jW+fifIH7d2EFI+OmxPeE4j3UTvsh7flfJW5kgTg+YCMlzyU8RSzTbv01mBgJlNUMt/sH0xd+4gEdOLLMfzGGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiFnNZke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiFnNZke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33020C4CEDD;
	Thu, 27 Mar 2025 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071410;
	bh=lbZJml6REyBa5Wqf6whljObeSVlpAH/8U8yaPU9LXBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YiFnNZkeI7JgpBv25HYkHSKNyzApg2CQ2eRNboSy/UcBlKzQW3qfCpQrI4xhgwLne
	 UAEclnxYT9ZIT7TA6QQbEYjk3QmUMj/oLKJsokeR//XjU2nZcXAxK54Kggv/p+ImpN
	 Kb9pXl+++HkJ3RFd3lkL16p0k9Bz+27Op6mMm1tUVvga8NxidAlXI5AfXiLU8y93hh
	 4vqv688S2ZnGiwtj+K+xuv1GhFDPLdzMInhyd7QE2Jswv7x6Poz1rhwJDfK96/LuYN
	 NFzeYQhSTDKmYkNBvUA9aLvPSaNvBAOksMBVrS8X8gKMkHforFysVmWmZ+ql1NTSRf
	 3iuLxBmvHuveA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 05/14] bugs/powerpc: Pass in 'cond_str' to BUG_ENTRY()
Date: Thu, 27 Mar 2025 11:29:44 +0100
Message-ID: <20250327102953.813608-6-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327102953.813608-1-mingo@kernel.org>
References: <20250327102953.813608-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass in the condition string from __WARN_FLAGS(), WARN_ON()
and BUG_ON(), but don't use it yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/powerpc/include/asm/bug.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 34d39ec79720..b5537ba176b5 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -51,7 +51,7 @@
 	".previous\n"
 #endif
 
-#define BUG_ENTRY(insn, flags, ...)			\
+#define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
@@ -67,12 +67,12 @@
  */
 
 #define BUG() do {						\
-	BUG_ENTRY("twi 31, 0, 0", 0);				\
+	BUG_ENTRY("", "twi 31, 0, 0", 0);			\
 	unreachable();						\
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(cond_str, flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
+#define __WARN_FLAGS(cond_str, flags) BUG_ENTRY(cond_str, "twi 31, 0, 0", BUGFLAG_WARNING | (flags))
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -80,7 +80,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(#x, PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +90,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(#x, PPC_TLNEI " %4, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
-- 
2.45.2

