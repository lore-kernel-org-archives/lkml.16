Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05366289343
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228909; cv=none; b=Vz7ekNqjtXSafwS0ysx+hdMpr2voCT6Ompc5Lm9U1OXCOd/hU68gbwgN1tBHlqrgc89qJiGKE1pGodSZNdcURCRACgRPoJ/tJYWO6Eqp+yfjdwGDqlqLlEs1wTQYNyoLC44l3GgCSWCaZC4ahW+n0s/n3iYZw9UqbGUxSjJt3xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228909; c=relaxed/simple;
	bh=P5OnIlIGnMENYkhS5dpuJSK6OCVqV92HACcfOeKIQDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VFEqUOrTc+GJqmQRJdrXNESeXgs+gE/0I4QgmSXxxS9aPXzSFJSq9gr5ua+KcjqwglP3YbwVQQsqzNoEFjyP5dJ3vGSIKcRlts3mmhYG6YWNX6A/3Katg5sK+1Uyzh2AX1UU+9tnFlB20gjGprLgNgOE3QxJ9vMvRkEoUvVB24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSqXIAy5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSqXIAy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDCDC4CEEB;
	Fri,  6 Jun 2025 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749228908;
	bh=P5OnIlIGnMENYkhS5dpuJSK6OCVqV92HACcfOeKIQDc=;
	h=From:To:Cc:Subject:Date:From;
	b=rSqXIAy5Xm0pE82gyNYJ04nj5NRULpd2ZZrHLDr2xfuFR5LFKEVAL3sx9z2/w5YnC
	 nOIBicxMbGzMpLQOWis6/CIjC18UoaRUQR+pKdnWW9gDIXicVV/KywhXcNk8x2reWn
	 MJY1Uox88DFiiSEWwPFciXePZpHuIfKNKvqUUtLAERYSmrgBktAx0xsSmxkqgTn/Md
	 YwxeZSN9yi2UZdh4d9Tzu/1EN/0ZTnc/B0qQDAMZ9o5UT73dNa2gC5z0W36oHVel6n
	 NVIM6ndNgymDnv4fwIKdeLCCzdMqYX4a+2eThDfkLodDSkW/0d4SrRwq0So6Ke8eeY
	 viGXXCepZVHjA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH] x86/its: Move ITS indirect branch thunks to .text..__x86.indirect_thunk
Date: Fri,  6 Jun 2025 09:55:02 -0700
Message-ID: <67a17ed2fc8d12111e76504c8364b1597657c29a.1749228881.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ITS mitigation includes both indirect branch thunks and return
thunks.  Both are currently placed in .text..__x86.return_thunk, which
is appropriate for the latter but not the former.

For consistency with other mitigations, move the indirect branch thunks
to .text..__x86.indirect_thunk.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/retpoline.S | 75 +++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/arch/x86/lib/retpoline.S b/arch/x86/lib/retpoline.S
index d78d769a02bd..f513d33b6d37 100644
--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -15,7 +15,6 @@
 
 	.section .text..__x86.indirect_thunk
 
-
 .macro POLINE reg
 	ANNOTATE_INTRA_FUNCTION_CALL
 	call    .Ldo_rop_\@
@@ -73,6 +72,7 @@ SYM_CODE_END(__x86_indirect_thunk_array)
 #undef GEN
 
 #ifdef CONFIG_MITIGATION_CALL_DEPTH_TRACKING
+
 .macro CALL_THUNK reg
 	.align RETPOLINE_THUNK_SIZE
 
@@ -126,7 +126,45 @@ SYM_CODE_END(__x86_indirect_jump_thunk_array)
 #define GEN(reg) __EXPORT_THUNK(__x86_indirect_jump_thunk_ ## reg)
 #include <asm/GEN-for-each-reg.h>
 #undef GEN
-#endif
+
+#endif /* CONFIG_MITIGATION_CALL_DEPTH_TRACKING */
+
+#ifdef CONFIG_MITIGATION_ITS
+
+.macro ITS_THUNK reg
+
+/*
+ * If CFI paranoid is used then the ITS thunk starts with opcodes (0xea; jne 1b)
+ * that complete the fineibt_paranoid caller sequence.
+ */
+1:	.byte 0xea
+SYM_INNER_LABEL(__x86_indirect_paranoid_thunk_\reg, SYM_L_GLOBAL)
+	UNWIND_HINT_UNDEFINED
+	ANNOTATE_NOENDBR
+	jne 1b
+SYM_INNER_LABEL(__x86_indirect_its_thunk_\reg, SYM_L_GLOBAL)
+	UNWIND_HINT_UNDEFINED
+	ANNOTATE_NOENDBR
+	ANNOTATE_RETPOLINE_SAFE
+	jmp *%\reg
+	int3
+	.align 32, 0xcc		/* fill to the end of the line */
+	.skip  32 - (__x86_indirect_its_thunk_\reg - 1b), 0xcc /* skip to the next upper half */
+.endm
+
+/* ITS mitigation requires thunks be aligned to upper half of cacheline */
+.align 64, 0xcc
+.skip 29, 0xcc
+
+#define GEN(reg) ITS_THUNK reg
+#include <asm/GEN-for-each-reg.h>
+#undef GEN
+
+	.align 64, 0xcc
+SYM_FUNC_ALIAS(__x86_indirect_its_thunk_array, __x86_indirect_its_thunk_rax)
+SYM_CODE_END(__x86_indirect_its_thunk_array)
+
+#endif /* CONFIG_MITIGATION_ITS */
 
 #ifdef CONFIG_MITIGATION_RETHUNK
 
@@ -370,39 +408,6 @@ SYM_FUNC_END(call_depth_return_thunk)
 
 #ifdef CONFIG_MITIGATION_ITS
 
-.macro ITS_THUNK reg
-
-/*
- * If CFI paranoid is used then the ITS thunk starts with opcodes (0xea; jne 1b)
- * that complete the fineibt_paranoid caller sequence.
- */
-1:	.byte 0xea
-SYM_INNER_LABEL(__x86_indirect_paranoid_thunk_\reg, SYM_L_GLOBAL)
-	UNWIND_HINT_UNDEFINED
-	ANNOTATE_NOENDBR
-	jne 1b
-SYM_INNER_LABEL(__x86_indirect_its_thunk_\reg, SYM_L_GLOBAL)
-	UNWIND_HINT_UNDEFINED
-	ANNOTATE_NOENDBR
-	ANNOTATE_RETPOLINE_SAFE
-	jmp *%\reg
-	int3
-	.align 32, 0xcc		/* fill to the end of the line */
-	.skip  32 - (__x86_indirect_its_thunk_\reg - 1b), 0xcc /* skip to the next upper half */
-.endm
-
-/* ITS mitigation requires thunks be aligned to upper half of cacheline */
-.align 64, 0xcc
-.skip 29, 0xcc
-
-#define GEN(reg) ITS_THUNK reg
-#include <asm/GEN-for-each-reg.h>
-#undef GEN
-
-	.align 64, 0xcc
-SYM_FUNC_ALIAS(__x86_indirect_its_thunk_array, __x86_indirect_its_thunk_rax)
-SYM_CODE_END(__x86_indirect_its_thunk_array)
-
 .align 64, 0xcc
 .skip 32, 0xcc
 SYM_CODE_START(its_return_thunk)
-- 
2.49.0

