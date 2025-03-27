Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17761DC19F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108851; cv=none; b=GK18Zght3nUhFBg6/vo7PUozGt4nbZNM5KJ48D51PhzhVBSaOsiLUUtWcbr6xSBJoYoNuIuGtInisXcfc3H3ulnteKRCeiIsXvAPXNyKtEaWPLWdqPIjh1OWVMx7FsfoLO0ia2wU1Qa4QU+V+vuFR4Jpd+/PueZFyY15q+OXJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108851; c=relaxed/simple;
	bh=iHbffRJTfO2boKACLnGSrGageot4RkwbYElW5JK8Wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KyVKC32I8LO45h2VeuSIF+Mh40LoDZRyfVFJuVdN33VqVNbaNGQ6Zu2ymWtGI+97cKug1durGE9qUI3+YRh+/FYeGJ3ixkRa9+1YEYSfyf4hD6+g+MjfxOCBY757QDeGIv2VOarPBHhFIuFL5ylfGR6Svl74juDLGpkKxlXCnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXCm1gJ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXCm1gJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6266EC4CEEA;
	Thu, 27 Mar 2025 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108850;
	bh=iHbffRJTfO2boKACLnGSrGageot4RkwbYElW5JK8Wpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GXCm1gJ8dq9xyFZwiwS3t4nKDCe0oOJtaHXio7GQuN/R+f/COiIzCPvJeEK4PO7TD
	 j8xQ7pFZ6djIhT3Dus2UXJ9wbXexdkHpBBi0Gt9l57yAX6u0nlk2XrFrg9azfHzdcG
	 FHys7iJV0eDTQomRgVorQtm79OGcYvv13jpWd1vsafRi+ptwJT6TYQ7U3HapDwWCuO
	 Z3F09XWKFw1y7NEbcqkSdvA7c80OVqhEGbV2ADh3mxpshYeTZx8e3woArORydfpB8Y
	 4mgIa/zcNRB4RGkA7WtTUmtRj+U9TaV4xHzHqJh0zCJE+TRPQc6etbkCzHqhcYCBCf
	 9YviF+lfuW5Og==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 04/41] x86/alternatives: Rename 'text_poke_bp()' to 'text_poke_int3()'
Date: Thu, 27 Mar 2025 21:53:17 +0100
Message-ID: <20250327205355.378659-5-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 4 ++--
 arch/x86/kernel/ftrace.c             | 8 ++++----
 arch/x86/kernel/jump_label.c         | 2 +-
 arch/x86/kernel/kprobes/opt.c        | 2 +-
 arch/x86/kernel/static_call.c        | 2 +-
 arch/x86/net/bpf_jit_comp.c          | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index ab9e143ec9fe..944b2aad4351 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -39,7 +39,7 @@ extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
 extern void *text_poke_set(void *addr, int c, size_t len);
 extern int poke_int3_handler(struct pt_regs *regs);
-extern void text_poke_bp(void *addr, const void *opcode, size_t len, const void *emulate);
+extern void text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
 extern void text_poke_finish(void);
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index b0fa770b7460..661cb6b1fbc3 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2887,7 +2887,7 @@ void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const voi
 }
 
 /**
- * text_poke_bp() -- update instructions on live kernel on SMP
+ * text_poke_int3() -- update instructions on live kernel on SMP
  * @addr:	address to patch
  * @opcode:	opcode of new instruction
  * @len:	length to copy
@@ -2897,7 +2897,7 @@ void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const voi
  * dynamically allocated memory. This function should be used when it is
  * not possible to allocate memory.
  */
-void __ref text_poke_bp(void *addr, const void *opcode, size_t len, const void *emulate)
+void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_loc tp;
 
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index cace6e8d7cc7..4e284ff674f1 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -186,11 +186,11 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 
 	ip = (unsigned long)(&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 
 	ip = (unsigned long)(&ftrace_regs_call);
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 
 	return 0;
 }
@@ -492,7 +492,7 @@ void arch_ftrace_update_trampoline(struct ftrace_ops *ops)
 	mutex_lock(&text_mutex);
 	/* Do a safe modify in case the trampoline is executing */
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 	mutex_unlock(&text_mutex);
 }
 
@@ -586,7 +586,7 @@ static int ftrace_mod_jmp(unsigned long ip, void *func)
 	const char *new;
 
 	new = ftrace_jmp_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 	return 0;
 }
 
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index f5b8ef02d172..94e2dcc94d9d 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -102,7 +102,7 @@ __jump_label_transform(struct jump_entry *entry,
 		return;
 	}
 
-	text_poke_bp((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
+	text_poke_int3((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
 }
 
 static void __ref jump_label_transform(struct jump_entry *entry,
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 36d6809c6c9e..e13d4a2d9244 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -488,7 +488,7 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		insn_buff[0] = JMP32_INSN_OPCODE;
 		*(s32 *)(&insn_buff[1]) = rel;
 
-		text_poke_bp(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
+		text_poke_int3(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
 
 		list_del_init(&op->list);
 	}
diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index 9e51242ed125..3331a7c90b9a 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -108,7 +108,7 @@ static void __ref __static_call_transform(void *insn, enum insn_type type,
 	if (system_state == SYSTEM_BOOTING || modinit)
 		return text_poke_early(insn, code, size);
 
-	text_poke_bp(insn, code, size, emulate);
+	text_poke_int3(insn, code, size, emulate);
 }
 
 static void __static_call_validate(u8 *insn, bool tail, bool tramp)
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 72776dcb75aa..1e2a4b7a6b73 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -629,7 +629,7 @@ static int __bpf_arch_text_poke(void *ip, enum bpf_text_poke_type t,
 		goto out;
 	ret = 1;
 	if (memcmp(ip, new_insn, X86_PATCH_SIZE)) {
-		text_poke_bp(ip, new_insn, X86_PATCH_SIZE, NULL);
+		text_poke_int3(ip, new_insn, X86_PATCH_SIZE, NULL);
 		ret = 0;
 	}
 out:
-- 
2.45.2

