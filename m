Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF6525FA23
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095746; cv=none; b=m97/2vTQ8bLLZ+vzy7QXRvgDtXLjTv2nxXOp/AekzlEiwLnKq/gRbYZWmRK1Y7uaTCHmMzzweiH00VlcOdgp0klx2INMQu1vB2WZvg8HV8NPrplrfhQMXXMLZak3QmjtWHIznxwbkPQ5wmI8xBIsSwyVLTFjOypG7quLbuFeBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095746; c=relaxed/simple;
	bh=k4/MKOOZH4NpMS5GeWM0EvPG1Sqm8xWCVQ2WGoP0xdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piDexQO2VQ9HUbKnbpu8FyfPYubCijhhko2ubwJvrlm9pnJxaq4y5Iiwfdh+cD9ulKKaiyBa0Fvjh6bp3tLO0MtC7s+TcJE/ANWT2Y0Rk341aowH5B/wbrE98QADybNqMObHaeXE/CA7vZ+kWUgv9EGmBjf6Voa5t5PS/0oDdmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfykiJaP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfykiJaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F46C4CEE9;
	Tue,  8 Apr 2025 07:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095746;
	bh=k4/MKOOZH4NpMS5GeWM0EvPG1Sqm8xWCVQ2WGoP0xdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pfykiJaPTuSsy06Tgsybau043mDI9B9HKdx6J2Kxhztk35dE2hRxtQMmG+ggoN78Y
	 sRzpMyuS2zSiYAZ1lCOjzn12NdujnCSWJirVmyHY/ldTIxBU2CiP/y7kO7YhHmp9kK
	 pfJdopflL9VBOTccYbz4eoWVbO2GmjYRUIICqdcLij1kLaeNxDWX/ANuQq+8/j0Hor
	 aNvJ22SZuTYOg+ykkaV9IH80nKrvK6lxL9zmBmt2bTbBaQoM5gcMZfaf6vrp1ikJh3
	 KSdZd5p4a13GqTcxogigijNZJZ8pzUG2KFkeNCTDOnlRioHEq6l8uupuSj4AgoCn6c
	 +A3I0os7O5sQA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 2/4] objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRET
Date: Tue,  8 Apr 2025 00:02:14 -0700
Message-ID: <19a76c74d2c051d3bc9a775823cafc65ad267a7a.1744095216.git.jpoimboe@kernel.org>
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

INSN_CONTEXT_SWITCH is ambiguous.  It can represent both call semantics
(SYSCALL, SYSENTER) and return semantics (SYSRET, IRET, RETS, RETU).
Those differ significantly: calls preserve control flow whereas returns
terminate it.

Objtool uses an arbitrary rule for INSN_CONTEXT_SWITCH that almost works
by accident: if in a function, keep going; otherwise stop.  It should
instead be based on the semantics of the underlying instruction.

In preparation for improving that, split INSN_CONTEXT_SWITCH into
INSN_SYCALL and INSN_SYSRET.

No functional change.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/arch/x86/decode.c      | 18 +++++++++++-------
 tools/objtool/check.c                |  6 ++++--
 tools/objtool/include/objtool/arch.h |  3 ++-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 33d861c04ebd..3ce7b54003c2 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -522,7 +522,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 			case INAT_PFX_REPNE:
 				if (modrm == 0xca)
 					/* eretu/erets */
-					insn->type = INSN_CONTEXT_SWITCH;
+					insn->type = INSN_SYSRET;
 				break;
 			default:
 				if (modrm == 0xca)
@@ -535,11 +535,15 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 			insn->type = INSN_JUMP_CONDITIONAL;
 
-		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
-			   op2 == 0x35) {
+		} else if (op2 == 0x05 || op2 == 0x34) {
 
-			/* sysenter, sysret */
-			insn->type = INSN_CONTEXT_SWITCH;
+			/* syscall, sysenter */
+			insn->type = INSN_SYSCALL;
+
+		} else if (op2 == 0x07 || op2 == 0x35) {
+
+			/* sysret, sysexit */
+			insn->type = INSN_SYSRET;
 
 		} else if (op2 == 0x0b || op2 == 0xb9) {
 
@@ -676,7 +680,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 
 	case 0xca: /* retf */
 	case 0xcb: /* retf */
-		insn->type = INSN_CONTEXT_SWITCH;
+		insn->type = INSN_SYSRET;
 		break;
 
 	case 0xe0: /* loopne */
@@ -721,7 +725,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		} else if (modrm_reg == 5) {
 
 			/* jmpf */
-			insn->type = INSN_CONTEXT_SWITCH;
+			insn->type = INSN_SYSRET;
 
 		} else if (modrm_reg == 6) {
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c81b070ca495..2c703b960420 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3684,7 +3684,8 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 			break;
 
-		case INSN_CONTEXT_SWITCH:
+		case INSN_SYSCALL:
+		case INSN_SYSRET:
 			if (func) {
 				if (!next_insn || !next_insn->hint) {
 					WARN_INSN(insn, "unsupported instruction in callable function");
@@ -3886,7 +3887,8 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			WARN_INSN(insn, "RET before UNTRAIN");
 			return 1;
 
-		case INSN_CONTEXT_SWITCH:
+		case INSN_SYSCALL:
+		case INSN_SYSRET:
 			if (insn_func(insn))
 				break;
 			return 0;
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 089a1acc48a8..01ef6f415adf 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -19,7 +19,8 @@ enum insn_type {
 	INSN_CALL,
 	INSN_CALL_DYNAMIC,
 	INSN_RETURN,
-	INSN_CONTEXT_SWITCH,
+	INSN_SYSCALL,
+	INSN_SYSRET,
 	INSN_BUG,
 	INSN_NOP,
 	INSN_STAC,
-- 
2.49.0

