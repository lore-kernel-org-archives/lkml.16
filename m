Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5EB21CFEA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797205; cv=none; b=FuXkkOd7k+6Pwog028R0EV7CQRZVUy2nCAO+IaIY6lwar7CEX0ptWIg035iFqi/6vbL30xLo0WuMAhq4FFztloT/arNxNorQpgsdSZRyToBD+9mSPbSHIJUSSiYhjms0nZk8AY28B6Jbv75Ze5DvSnFVlfFCH+n5R9nEa6rVBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797205; c=relaxed/simple;
	bh=9+WuXZjXc9DbmTVWSy7YUuSmEAnLH0pAzkMsugcCiU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=its++WgtD4x48sWhautsi55ENCS4yDCe3+dffPbNreY/+rRmbrWzUzRrdALsNRuPqyC561rpeU2PZNjiEyHPoTDwYpKmlh39UNnOFdX1kG6USzoueH6G82ceNIT42lpRfaCgUw0YP2aBgtu3ryQowoVvYr0/YVDSeER+Gvfnxtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ0B6JU4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ0B6JU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A538C4CEDD;
	Fri,  4 Apr 2025 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743797204;
	bh=9+WuXZjXc9DbmTVWSy7YUuSmEAnLH0pAzkMsugcCiU0=;
	h=From:To:Cc:Subject:Date:From;
	b=RQ0B6JU4F2UVkd5L+RwC7TNLE9YBYVwusbt2dIS3RSuNUZd2ISZcHY7s4sIgNzp/c
	 EDwR9t5TYEKrOcSM+tWEB/x04qiHXg+dO/e5oTC5Tk2Me9HByG7Whf4bU+DZEbFOFY
	 YkIZOXBpLPjWSnb1q8s6flTZd+nFwzrb6Q2PeVUXjXUfrUKOhM9Er4hX3OfWCIYJQ+
	 LkR7el2lKOKH5+LTMMiwNfBoRMn8honjarsgDa0ehIkPntFhjNU8Imwa5Fm8XgtRPC
	 Q0iaZJEADON2Wyku07qTcUITf0vKcG8rsQGzB2vHKpijB9dVtNFM4GGVX+xJdK6U0g
	 Y/XzLdNHnnh1w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] objtool: Fix SYSCALL instruction handling and INSN_CONTEXT_SWITCH
Date: Fri,  4 Apr 2025 13:06:26 -0700
Message-ID: <b1c60a498c6146de0706572d3f47d3723ca91743.1743797052.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The !CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat() ends
with a SYSCALL instruction.  In Xen, SYSCALL is a hypercall.  Usually
that would return, but in this case it's a hypercall to IRET, which
doesn't return.

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

With SYSCALL and SYSENTER removed, INSN_CONTEXT_SWITCH now has a sane
well-defined return semantic.

Fixes: a2796dff62d6 ("x86/xen: don't do PV iret hypercall through hypercall page")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
v2:
- rename INSN_CONTEXT_SWITCH -> INSN_EXCEPTION_RETURN
- clarify that xen SYSCALL is a hypercall
- check for SYSEXIT

 arch/x86/xen/xen-asm.S               |  6 +-----
 tools/objtool/arch/x86/decode.c      | 20 ++++----------------
 tools/objtool/check.c                | 15 +++++++--------
 tools/objtool/include/objtool/arch.h |  2 +-
 4 files changed, 13 insertions(+), 30 deletions(-)

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
index 33d861c04ebd..992665ba41d7 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -522,7 +522,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			case INAT_PFX_REPNE:
 				if (modrm == 0xca)
 					/* eretu/erets */
-					insn->type = INSN_CONTEXT_SWITCH;
+					insn->type = INSN_EXCEPTION_RETURN;
 				break;
 			default:
 				if (modrm == 0xca)
@@ -535,11 +535,10 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 			insn->type = INSN_JUMP_CONDITIONAL;
 
-		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
-			   op2 == 0x35) {
+		} else if (op2 == 0x07 || op2 == 0x35) {
 
-			/* sysenter, sysret */
-			insn->type = INSN_CONTEXT_SWITCH;
+			/* sysret, sysexit */
+			insn->type = INSN_EXCEPTION_RETURN;
 
 		} else if (op2 == 0x0b || op2 == 0xb9) {
 
@@ -671,12 +670,6 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			}
 			break;
 		}
-
-		fallthrough;
-
-	case 0xca: /* retf */
-	case 0xcb: /* retf */
-		insn->type = INSN_CONTEXT_SWITCH;
 		break;
 
 	case 0xe0: /* loopne */
@@ -718,11 +711,6 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
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
index 4a1f6c3169b3..e04ce065a08b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3684,14 +3684,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 			break;
 
-		case INSN_CONTEXT_SWITCH:
-			if (func) {
-				if (!next_insn || !next_insn->hint) {
-					WARN_INSN(insn, "unsupported instruction in callable function");
-					return 1;
-				}
-				break;
-			}
+		case INSN_EXCEPTION_RETURN:
 			return 0;
 
 		case INSN_STAC:
@@ -3886,6 +3879,9 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			WARN_INSN(insn, "RET before UNTRAIN");
 			return 1;
 
+		case INSN_EXCEPTION_RETURN:
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
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 089a1acc48a8..5bba1a894e5c 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -19,7 +19,7 @@ enum insn_type {
 	INSN_CALL,
 	INSN_CALL_DYNAMIC,
 	INSN_RETURN,
-	INSN_CONTEXT_SWITCH,
+	INSN_EXCEPTION_RETURN,
 	INSN_BUG,
 	INSN_NOP,
 	INSN_STAC,
-- 
2.49.0

