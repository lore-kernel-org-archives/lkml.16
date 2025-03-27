Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD220010C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108929; cv=none; b=PLrMH/QD8AZnlbrsdVg8SCj9vZt2KnAuzwI73iOsQXadclIzwfLcBCo5kaGwl8kjwZPTzxNxXrvYt2VznIq26sni6ipurCAL9y0jqkhkQwbG00oizt9x3EhuUGMoxwKukanhY8wT4D5n4FQdCjnlifCO8xAjCN3M0GMHGCW0scQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108929; c=relaxed/simple;
	bh=eLbTYSgijLpKFTpkDcIYsE290Y5rBuicH2nkZPZA5QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtOm+N+okDsNNPvP4h6O8RzMWqri5GjkWiDxyZNItYV0PCR1lYsHQI4OahqYQsCLqrmTev0KOcPdCf4Pb0fYtUgEgdA2i80StxZowu+AC054ll2UedNGp25D1AFqbxccDtJC39TgEq0KcoZOsBZioR+dEbaNlwEzU6Hx4nw3SpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j777JcAd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j777JcAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAD6C4CEEA;
	Thu, 27 Mar 2025 20:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108929;
	bh=eLbTYSgijLpKFTpkDcIYsE290Y5rBuicH2nkZPZA5QE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j777JcAdjK8rAUBX9vWJJ5jISV8BAD6TO4wCV/MJj9/FjU3LSh6/Pqa6vGFsoD3Vh
	 eORzYsR/YdQ2rVaiABqz7o/GFGg/qYwnot7jrFs4ki3rCG3h7uaWx+Cylz+a9uqUOH
	 dIb0rAbF+aq0zTXz6Mv/z9QCYOGPtklHhgb2QE8xRSwmZ0Lj1dWnrtUSg4lbvzKgD0
	 W2BpC2PLgjW7zaJLaYR+K5gh65fS46pTYEErRjm5rDlpS7/6U+0+YNcBOqm/Rx8iCO
	 t34iEuRLD0kMNhWZ8cwu8ZK1SJOxM4MCssCduyMGLhuHXIYQgePBHHjeWaFjlexhLb
	 bpp//Eh3giU5w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 37/41] x86/alternatives: Rename 'text_poke_int3()' to 'text_poke_int3_now()'
Date: Thu, 27 Mar 2025 21:53:50 +0100
Message-ID: <20250327205355.378659-38-mingo@kernel.org>
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

In the current name it's not obvious that the main difference
between text_poke_int3() and text_poke_int3_queue() is that
text_poke_int3() patches the kernel immediately.

Make this more apparent by renaming it to text_poke_int3_now().

Also extend the documentation to better describe its purpose.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h | 2 +-
 arch/x86/kernel/alternative.c        | 7 ++++---
 arch/x86/kernel/ftrace.c             | 8 ++++----
 arch/x86/kernel/jump_label.c         | 2 +-
 arch/x86/kernel/kprobes/opt.c        | 2 +-
 arch/x86/kernel/static_call.c        | 2 +-
 arch/x86/net/bpf_jit_comp.c          | 2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 7deb06aec467..611957617278 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -39,7 +39,7 @@ extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
 extern void *text_poke_set(void *addr, int c, size_t len);
 extern int text_poke_int3_handler(struct pt_regs *regs);
-extern void text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate);
+extern void text_poke_int3_now(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate);
 extern void text_poke_int3_finish(void);
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 2807d35c7676..6e2fab1768e2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2881,7 +2881,7 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
 }
 
 /**
- * text_poke_int3() -- update instructions on live kernel on SMP
+ * text_poke_int3_now() -- update instruction on live kernel on SMP immediately
  * @addr:	address to patch
  * @opcode:	opcode of new instruction
  * @len:	length to copy
@@ -2889,9 +2889,10 @@ void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, cons
  *
  * Update a single instruction with the vector in the stack, avoiding
  * dynamically allocated memory. This function should be used when it is
- * not possible to allocate memory.
+ * not possible to allocate memory for a vector. The single instruction
+ * is patched in immediately.
  */
-void __ref text_poke_int3(void *addr, const void *opcode, size_t len, const void *emulate)
+void __ref text_poke_int3_now(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	text_poke_int3_loc_add(addr, opcode, len, emulate);
 
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index ff3cdd08f28f..40b1c218ee86 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -186,11 +186,11 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 
 	ip = (unsigned long)(&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3_now((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 
 	ip = (unsigned long)(&ftrace_regs_call);
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3_now((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 
 	return 0;
 }
@@ -492,7 +492,7 @@ void arch_ftrace_update_trampoline(struct ftrace_ops *ops)
 	mutex_lock(&text_mutex);
 	/* Do a safe modify in case the trampoline is executing */
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3_now((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 	mutex_unlock(&text_mutex);
 }
 
@@ -586,7 +586,7 @@ static int ftrace_mod_jmp(unsigned long ip, void *func)
 	const char *new;
 
 	new = ftrace_jmp_replace(ip, (unsigned long)func);
-	text_poke_int3((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	text_poke_int3_now((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 	return 0;
 }
 
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index f72738e6d7d4..e5b58c81dfaf 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -102,7 +102,7 @@ __jump_label_transform(struct jump_entry *entry,
 		return;
 	}
 
-	text_poke_int3((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
+	text_poke_int3_now((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
 }
 
 static void __ref jump_label_transform(struct jump_entry *entry,
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index e13d4a2d9244..54bc5e7c6886 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -488,7 +488,7 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		insn_buff[0] = JMP32_INSN_OPCODE;
 		*(s32 *)(&insn_buff[1]) = rel;
 
-		text_poke_int3(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
+		text_poke_int3_now(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
 
 		list_del_init(&op->list);
 	}
diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index 3331a7c90b9a..146cc27848df 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -108,7 +108,7 @@ static void __ref __static_call_transform(void *insn, enum insn_type type,
 	if (system_state == SYSTEM_BOOTING || modinit)
 		return text_poke_early(insn, code, size);
 
-	text_poke_int3(insn, code, size, emulate);
+	text_poke_int3_now(insn, code, size, emulate);
 }
 
 static void __static_call_validate(u8 *insn, bool tail, bool tramp)
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 1e2a4b7a6b73..8d08c8ff3e50 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -629,7 +629,7 @@ static int __bpf_arch_text_poke(void *ip, enum bpf_text_poke_type t,
 		goto out;
 	ret = 1;
 	if (memcmp(ip, new_insn, X86_PATCH_SIZE)) {
-		text_poke_int3(ip, new_insn, X86_PATCH_SIZE, NULL);
+		text_poke_int3_now(ip, new_insn, X86_PATCH_SIZE, NULL);
 		ret = 0;
 	}
 out:
-- 
2.45.2

