Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA320FAA9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071419; cv=none; b=XxjUn6u4wZn1873q/JFCg4MpVrthNzRv/D0QyNVitM5Cxuc8HLfLCwlnZmCtXoNe+BRMejjGnPxi3HYNBhLX2+87e9dr0GkyoOeZyQWCWetnmQkQkV9mS9JSQM1RbTqAxM/wLMvsdLq+bcLpFt4Vbf9HvnDzbbekDJwOovGerUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071419; c=relaxed/simple;
	bh=molGG3aPYi74hz9WVuXlbE1iJFE0MWmpVUKVIij8Ws4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lT/DDclUCFpyKCHnfVDxuwtnz2pVBPIYmcs1gSmaGMtMHW6CWzjehy+AkwG2gr5/ouGRaLSSLmFZ42Y3prBcGUHwinz7FxbY2jkl1VPLip6MLDpMs+gl7d67++3EmmtLDdZQcOR2CLgUlAQfk+NToMCuxNCDb9E7lolDtqFH32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biJxKx8+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biJxKx8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E05C4CEDD;
	Thu, 27 Mar 2025 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071419;
	bh=molGG3aPYi74hz9WVuXlbE1iJFE0MWmpVUKVIij8Ws4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=biJxKx8+zuUi+vNzm8YlLU88q2/Tn9vH7l3F1/Adm1a+X/rJKUlEwACBPkwOBvC5I
	 75VcVgdo3Ff/jMcMXDJ8VemeZwEikvhnEQm405t/Nn3Boms0xoQG2DwM3lsdDqTOkh
	 IVOb1qSmN6TjOR/HiYMjNi2WqpSvDgaqH5H8RVT/qYZLQEOjM62jgKsNuM5abrXJZK
	 wQEquhPN9zOShwiR7ObZ8WwdQXrGnsqIac+V9YmXPX17zOAF8MBDxLQsHSjjmdyabY
	 b1HLBApG3LSjWgLTjcdk2fVgFmZ4InDeIWbfcMBigowjRhBdhWm/d/wQ+R1AiGvyn7
	 Lvy2KpMBd0jYA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 10/14] bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()
Date: Thu, 27 Mar 2025 11:29:49 +0100
Message-ID: <20250327102953.813608-11-mingo@kernel.org>
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

Pass in the condition string from __WARN_FLAGS() to __BUG_FLAGS(),
but don't use it yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/riscv/include/asm/bug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index b22ee4d2c882..feaf456d465b 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -50,7 +50,7 @@ typedef u32 bug_insn_t;
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
+#define __BUG_FLAGS(cond_str, flags)				\
 do {								\
 	__asm__ __volatile__ (					\
 		"1:\n\t"					\
@@ -66,17 +66,17 @@ do {								\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
 #else /* CONFIG_GENERIC_BUG */
-#define __BUG_FLAGS(flags) do {					\
+#define __BUG_FLAGS(cond_str, flags) do {			\
 	__asm__ __volatile__ ("ebreak\n");			\
 } while (0)
 #endif /* CONFIG_GENERIC_BUG */
 
 #define BUG() do {						\
-	__BUG_FLAGS(0);						\
+	__BUG_FLAGS("", 0);					\
 	unreachable();						\
 } while (0)
 
-#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
+#define __WARN_FLAGS(cond_str, flags) __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags))
 
 #define HAVE_ARCH_BUG
 
-- 
2.45.2

