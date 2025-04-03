Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C64253B52
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706118; cv=none; b=qcF9YVp4DzwdeEbPcofKZRTE+ACX10gDBxd/P63tpvtxJy/lj4drKCwjaJA7aIFotFlgD4bWFWij18B4O39GRDBSUL9ATiVIRo+NE5oDyJbVJxfRLl5KLHqKwFwQozOKpJjaaZJa5awBlmIm3niDQRS1wrFqpMfHvzUv93XONtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706118; c=relaxed/simple;
	bh=8P0P5BcP8urVIBNQ3hfPs5Y+xq7pRxfRGwWX9gCwOF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJs3jPHmZEipIj2FBFL8jR8JpTtL4i8CLm6izGvLvH/5ADQ4zFSDZnSvFYSxBwBZ/bwa6KYCd0UUVcLmjPMCDTMHjO10PDGYvrRdofD78TQK7CM2VsdQcRYOfZEj/gzfnJxyfRHv2s33P5pgw2DgAQqQc+rRvdRORKQqEBYxFL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQjS0boK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQjS0boK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08989C4CEE3;
	Thu,  3 Apr 2025 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706118;
	bh=8P0P5BcP8urVIBNQ3hfPs5Y+xq7pRxfRGwWX9gCwOF4=;
	h=From:To:Cc:Subject:Date:From;
	b=AQjS0boKkQO8HGBtqnPSmbMwVm4KX9CZ1gWTjH8LQjsc+6erEjagaZ0LIsiL1Ngm8
	 LrJ6Otop+FFtYS2xjs1MPpj5PeMJhzNUWDP22iYmm7F0inXnDDoA47euwI1VcR2+5t
	 ZKGz81ItLII49lZ30vHXuUEIQUgRSv6SEl9eQe1Linoo2JIBqUrRBWtsY7sVDBA9tl
	 hTQrkI8eKIiTbn8sC1jm6B7o8ISXgerIGm6qfD5hwxRI4cvCPftLlqIxTY3bOFw5Gr
	 r8HFQ3x5m1To4rGOwjmNeUfcKEEw3U/EBhS7OhSPLIDGkigp3eq6TZDYDeo5Kk/INd
	 TXnlP5LXEP29A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] objtool: Fix SYSCALL instruction handling and INSN_CONTEXT_SWITCH
Date: Thu,  3 Apr 2025 11:48:13 -0700
Message-ID: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The !CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat() ends
with a SYSCALL instruction, which in reality is a hypervisor call to
trigger an IRET.

Objtool doesn't know that, so it falls through to the next function,
triggering a false positive:

  vmlinux.o: warning: objtool: xen_reschedule_interrupt+0x2a: RET before UNTRAIN

Fix that by adding UD2 after the SYSCALL to avoid the undefined behavior
and prevent the objtool fallthrough, and teach validate_unret() to stop
control flow on the UD2 like validate_branch() already does.

Unfortunately that's not the whole story.  While that works for
validate_unret(), it breaks validate_branch() which terminates control
flow after the SYSCALL, triggering an unreachable instruction warning on
the UD2.

The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
represent both call semantics (SYSCALL, SYSENTER) and return semantics
(SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
control flow whereas returns terminate it.

validate_branch() uses an arbitrary rule for INSN_CONTEXT_SWITCH that
almost works by accident: if in a function, keep going; otherwise stop.
It should instead be based on the semantics of the underlying
instruction.

INSN_CONTEXT_SWITCH's original purpose was to enable the "unsupported
instruction in callable function" warning.  But that warning really has
no reason to exist.  It has never found any bugs, and those instructions
are only in entry code anyway.  So just get rid of it.

That in turn allows objtool to stop caring about SYSCALL or SYSENTER.
Their call semantic means they usually don't affect control flow in the
containing function/code, and can just be INSN_OTHER.  The far
returns/jumps can also be ignored as those aren't used anywhere.

With SYSCALL and SYSENTER, INSN_CONTEXT_SWITCH now has a sane
well-defined return semantic.

Fixes: a2796dff62d6 ("x86/xen: don't do PV iret hypercall through hypercall page")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/xen/xen-asm.S          |  6 +-----
 tools/objtool/arch/x86/decode.c | 14 ++------------
 tools/objtool/check.c           | 13 ++++++-------
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 109af12f7647..5bdae7839c08 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -38,9 +38,7 @@ SYM_FUNC_START(xen_hypercall_pv)
 	ANNOTATE_NOENDBR
 	push %rcx
 	push %r11
-	UNWIND_HINT_SAVE
 	syscall
-	UNWIND_HINT_RESTORE
 	pop %r11
 	pop %rcx
 	RET
@@ -226,9 +224,7 @@ SYM_CODE_END(xen_early_idt_handler_array)
 	push %rax
 	mov  $__HYPERVISOR_iret, %eax
 	syscall		/* Do the IRET. */
-#ifdef CONFIG_MITIGATION_SLS
-	int3
-#endif
+	ud2		/* The SYSCALL should never return. */
 .endm
 
 SYM_CODE_START(xen_iret)
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 33d861c04ebd..628c2c8a0f6a 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -535,10 +535,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 			insn->type = INSN_JUMP_CONDITIONAL;
 
-		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
-			   op2 == 0x35) {
+		} else if (op2 == 0x07) {
 
-			/* sysenter, sysret */
+			/* sysret */
 			insn->type = INSN_CONTEXT_SWITCH;
 
 		} else if (op2 == 0x0b || op2 == 0xb9) {
@@ -672,10 +671,6 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			break;
 		}
 
-		fallthrough;
-
-	case 0xca: /* retf */
-	case 0xcb: /* retf */
 		insn->type = INSN_CONTEXT_SWITCH;
 		break;
 
@@ -718,11 +713,6 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			if (has_notrack_prefix(&ins))
 				WARN("notrack prefix found at %s:0x%lx", sec->name, offset);
 
-		} else if (modrm_reg == 5) {
-
-			/* jmpf */
-			insn->type = INSN_CONTEXT_SWITCH;
-
 		} else if (modrm_reg == 6) {
 
 			/* push from mem */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4a1f6c3169b3..e9cba4c56aa4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3685,13 +3685,6 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			break;
 
 		case INSN_CONTEXT_SWITCH:
-			if (func) {
-				if (!next_insn || !next_insn->hint) {
-					WARN_INSN(insn, "unsupported instruction in callable function");
-					return 1;
-				}
-				break;
-			}
 			return 0;
 
 		case INSN_STAC:
@@ -3886,6 +3879,9 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			WARN_INSN(insn, "RET before UNTRAIN");
 			return 1;
 
+		case INSN_CONTEXT_SWITCH:
+			return 0;
+
 		case INSN_NOP:
 			if (insn->retpoline_safe)
 				return 0;
@@ -3895,6 +3891,9 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			break;
 		}
 
+		if (insn->dead_end)
+			return 0;
+
 		if (!next) {
 			WARN_INSN(insn, "teh end!");
 			return 1;
-- 
2.48.1

