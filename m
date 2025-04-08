Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE55261380
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095748; cv=none; b=Ooapl45Z0USFe79lIeo1S+8kwTQpFfkPicDyQxhZmflKf4UbeUUHwgOAiV98KVq1lx29LpOjUjuKheCX1zyeZ9jAlPKSB/rI/J1TLKnaM+AoSSjCaiFpVnSIkIvphbsS4ktF3sREVhRw7hlUXnTA/9fFuSevC9ZYFTeID4BnWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095748; c=relaxed/simple;
	bh=UZHNB2WAaIfQoYLqr+y1DhwVCNZfceB4h6yShNlV8mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkENvMnrLXIabFtSl1KVF2REEBGG3zVzrTyvAS6ORbOljHrvJiOIl7jpYWe+zHBO7FVDQgo4YLAl7EGUnv+fdOk9XX8FIKGePctcvr1qm69cOY3eycl/ggyvFpxeOLpo/p89lS8P5wqAf9KruBgEIpaEA1tZ2jkAFk2zzxrlWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzCTGnLM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzCTGnLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452F7C4CEF2;
	Tue,  8 Apr 2025 07:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095747;
	bh=UZHNB2WAaIfQoYLqr+y1DhwVCNZfceB4h6yShNlV8mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzCTGnLMcbIpK9DVabRh3EcKZhX57rM/643RZ44nM2Lhj4zfD6kXZYHLXrKkGg2pl
	 DPMi+VgRJdeupVgeQssBVeQOXswn+KRRiQ3t/lr7aehnjMI/LzrJ+CnsXLPCfqXNdL
	 OXL+q0PsDJz+b9ALSa/ad7uQkZKD3ViYYqJUjGrtF1Wjsr1L5QbPXf3DrWXNGRebji
	 Mdhfl9VZyx5+CMihD8J5nXk3qtZ+cg6QmEXh/WcTEcbun252JVocc0znuLWFwcUI6N
	 XTv3zWCtJz6cs1ASjBR/3pfmFw6bCiUJyRR8nPgdJgRlnBB0R6nQfvP2scl+pXcD1O
	 wmEV7K5718Mxw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 4/4] objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics
Date: Tue,  8 Apr 2025 00:02:16 -0700
Message-ID: <19453dfe9a0431b7f016e9dc16d031cad3812a50.1744095216.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744095216.git.jpoimboe@kernel.org>
References: <cover.1744095216.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Objtool uses an arbitrary rule for INSN_SYSCALL and INSN_SYSRET that
almost works by accident: if it's in a function, control flow continues
after the instruction, otherwise it terminates.

That behavior should instead be based on the semantics of the underlying
instruction.  Change INSN_SYSCALL to always preserve control flow and
INSN_SYSRET to always terminate it.

The changed semantic for INSN_SYSCALL requires a tweak to the
!CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat().  In Xen,
SYSCALL is a hypercall which usually returns.  But in this case it's a
hypercall to IRET which doesn't return.  Add UD2 to tell objtool to
terminate control flow, and to prevent undefined behavior at runtime.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/xen/xen-asm.S |  4 +---
 tools/objtool/check.c  | 23 ++++++++++++++---------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 109af12f7647..461bb1526502 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -226,9 +226,7 @@ SYM_CODE_END(xen_early_idt_handler_array)
 	push %rax
 	mov  $__HYPERVISOR_iret, %eax
 	syscall		/* Do the IRET. */
-#ifdef CONFIG_MITIGATION_SLS
-	int3
-#endif
+	ud2		/* The SYSCALL should never return. */
 .endm
 
 SYM_CODE_START(xen_iret)
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 2dd89b0f4d5e..69f94bc47499 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3685,14 +3685,19 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			break;
 
 		case INSN_SYSCALL:
-		case INSN_SYSRET:
-			if (func) {
-				if (!next_insn || !next_insn->hint) {
-					WARN_INSN(insn, "unsupported instruction in callable function");
-					return 1;
-				}
-				break;
+			if (func && (!next_insn || !next_insn->hint)) {
+				WARN_INSN(insn, "unsupported instruction in callable function");
+				return 1;
 			}
+
+			break;
+
+		case INSN_SYSRET:
+			if (func && (!next_insn || !next_insn->hint)) {
+				WARN_INSN(insn, "unsupported instruction in callable function");
+				return 1;
+			}
+
 			return 0;
 
 		case INSN_STAC:
@@ -3888,9 +3893,9 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			return 1;
 
 		case INSN_SYSCALL:
+			break;
+
 		case INSN_SYSRET:
-			if (insn_func(insn))
-				break;
 			return 0;
 
 		case INSN_NOP:
-- 
2.49.0

