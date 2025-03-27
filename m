Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080920FA99
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071414; cv=none; b=X1vfaeFURGewXq11Xv4JpruQLXoqUwE0tm27O1knc9kuijflaKMxIS+S7vPuX5IY23yWiwAdpZxpfVCoQ4ogV+xz2FA9GqjhKKkmZoAQXfEY4zn9A+l7/D0xZctiozrV9K3aDppnNCW8U3tuWouI40F6gDtgfZ30M0AAV5P3EuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071414; c=relaxed/simple;
	bh=AwKLO6MlaTLedN7k+hdE1I2gJG0P/wVaqml4h5jIdvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Si0hdCj1TtUGc4sBqVnrDgTJ016ZI/WgbAdo4xirc9QM+On/pn9TTR0aRThkcCMXn3wrzcxXSaGSHzVsXkHfkz76fJvLmIwX7xfHrsF9RKtiYBXYCWKPfkTT3pdWprWI3AYeOSjCAZbbp/Us14FtdANArkX2mm3DpB36p40WxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjUQcAvQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjUQcAvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD66C4CEDD;
	Thu, 27 Mar 2025 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071413;
	bh=AwKLO6MlaTLedN7k+hdE1I2gJG0P/wVaqml4h5jIdvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjUQcAvQ8frxg9vUD0TSyfF2PgDrieeHXkiXGPnc5XeobxE9B4/q5TrBunzpKfQPk
	 +DGkK0AvCMHk1PP6gAT/rZT4PWgkh5WhNoYkr56hXuBN99l97Y1hazSidm4nk9kIUU
	 tJLfJM+41d+yfzDg4P7UH09TsDs3aTvV4BuYVY1sBLp5jOZPxS+/IXgPVAT3DZL31y
	 pOPBXVtaRT9b0ZOZ53gwHZMp/E6n1cCWdfnxFoCGAKGqPkA6w81USxVxqp1wnG5Kk6
	 Lcbr/ypboGr7IzN4Xo3IxHEXYKFhEJLuWHFakkboNy3b+Ttf/RiP1AWxGjrZwMAPoi
	 IjY247Td2z+qA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 07/14] bugs/LoongArch: Pass in 'cond_str' to __BUG_ENTRY()
Date: Thu, 27 Mar 2025 11:29:46 +0100
Message-ID: <20250327102953.813608-8-mingo@kernel.org>
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

Pass in the condition string from __WARN_FLAGS(), but don't use it yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: <linux-arch@vger.kernel.org>
---
 arch/loongarch/include/asm/bug.h | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 51c2cb98d728..3c377984457d 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -20,39 +20,38 @@
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(cond_str, flags)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(cond_str, flags)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
 		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
-		.short flags; 					\
+		.short flags;					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(cond_str, flags)				\
+	__BUG_ENTRY(cond_str, flags)				\
 	break		BRK_BUG;
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS("", 0)
 
-#define __BUG_FLAGS(flags, extra)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
-			     extra);
+#define __BUG_FLAGS(cond_str, flags, extra)			\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(cond_str, flags)) extra);
 
 #define __WARN_FLAGS(cond_str, flags)				\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	__BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
 	instrumentation_end();					\
 } while (0)
 
 #define BUG()							\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(0, "");					\
+	__BUG_FLAGS("", 0, "");					\
 	unreachable();						\
 } while (0)
 
-- 
2.45.2

