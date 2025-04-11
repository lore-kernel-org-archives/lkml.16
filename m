Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834527F4D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350087; cv=none; b=CTI+LnH4P2oyIP/LMyAWV7qpBFuKL61LlaBTwBvSyDRetfpTd/zG9jRDb4CdnkA7cfFn13mTLGN96Nj4TnWIqsByp7uVTlUoqz8Kaa3cANjyO8rZhP9Xx1yzwfFq0cF8Pfdj7IxlPcrvEhyoFgATJQxlXqDXyBZiWQYOeZWLPaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350087; c=relaxed/simple;
	bh=YDcAh8AaLBdt4MGFuGymYgJLwzdIfOqrt+w0YdFhNSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBBP699AJNRyCiQCwbT3gfysj3TabrFMq/Y6oauIZ495C5DduoFeBUzY0nwLWpTCs71ZFOCf8v5Axlc8krr+jrrPbfWnnKf7NZ0oqLWDtAmNfaDoD/3Q5A+F8RcCUQGDfBcSaJX/Ag8pEMHY1cRs7X8ivqPlqWfi3eHsBjyeQaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmxkPiK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmxkPiK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5CEC4CEE5;
	Fri, 11 Apr 2025 05:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350086;
	bh=YDcAh8AaLBdt4MGFuGymYgJLwzdIfOqrt+w0YdFhNSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZmxkPiK7nVIy70ZelS9By4ehK8FRMbJ+qBkjPTd4LPskNnd3glqB+GDjqtGUCb41W
	 Tjqy35tBblgiwRk1oFTlvCHiG7FH/iBeRWB3IfnP194N4Fw8mzq/hnpskH5RA4mu99
	 5bDR+kHRkuaXvC3vZsEF/lM0o/9/bYl8+qkaVhBmF+1G8b4YwjOj+n5Shdy6iEU/gp
	 nArwJ+otd9IvOMXgLPjcpFG7IUXDvgLpvxcKvHLrHHDRq2+nvJA6uo/hbXekFWDEU9
	 XV5choc5/4kqCgghwIJnZxyIRMcwUkjuAQJs+oFx9O4Px6oSkSaGGVJ665CuaRYpyF
	 +tLy00vGAkj7g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 06/53] x86/alternatives: Rename 'text_poke_bp()' to 'smp_text_poke_single()'
Date: Fri, 11 Apr 2025 07:40:18 +0200
Message-ID: <20250411054105.2341982-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
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
index ab9e143ec9fe..5189188b5e49 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -39,7 +39,7 @@ extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
 extern void *text_poke_set(void *addr, int c, size_t len);
 extern int poke_int3_handler(struct pt_regs *regs);
-extern void text_poke_bp(void *addr, const void *opcode, size_t len, const void *emulate);
+extern void smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate);
 
 extern void text_poke_queue(void *addr, const void *opcode, size_t len, const void *emulate);
 extern void text_poke_finish(void);
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 7305c29bc8d1..826c389b22eb 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2887,7 +2887,7 @@ void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const voi
 }
 
 /**
- * text_poke_bp() -- update instructions on live kernel on SMP
+ * smp_text_poke_single() -- update instructions on live kernel on SMP
  * @addr:	address to patch
  * @opcode:	opcode of new instruction
  * @len:	length to copy
@@ -2897,7 +2897,7 @@ void __ref text_poke_queue(void *addr, const void *opcode, size_t len, const voi
  * dynamically allocated memory. This function should be used when it is
  * not possible to allocate memory.
  */
-void __ref text_poke_bp(void *addr, const void *opcode, size_t len, const void *emulate)
+void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	struct text_poke_loc tp;
 
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index cace6e8d7cc7..7175a0404def 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -186,11 +186,11 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 
 	ip = (unsigned long)(&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 
 	ip = (unsigned long)(&ftrace_regs_call);
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 
 	return 0;
 }
@@ -492,7 +492,7 @@ void arch_ftrace_update_trampoline(struct ftrace_ops *ops)
 	mutex_lock(&text_mutex);
 	/* Do a safe modify in case the trampoline is executing */
 	new = ftrace_call_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 	mutex_unlock(&text_mutex);
 }
 
@@ -586,7 +586,7 @@ static int ftrace_mod_jmp(unsigned long ip, void *func)
 	const char *new;
 
 	new = ftrace_jmp_replace(ip, (unsigned long)func);
-	text_poke_bp((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
+	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
 	return 0;
 }
 
diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index f5b8ef02d172..166e12037199 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -102,7 +102,7 @@ __jump_label_transform(struct jump_entry *entry,
 		return;
 	}
 
-	text_poke_bp((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
+	smp_text_poke_single((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
 }
 
 static void __ref jump_label_transform(struct jump_entry *entry,
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 36d6809c6c9e..9307a40f4983 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -488,7 +488,7 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		insn_buff[0] = JMP32_INSN_OPCODE;
 		*(s32 *)(&insn_buff[1]) = rel;
 
-		text_poke_bp(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
+		smp_text_poke_single(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
 
 		list_del_init(&op->list);
 	}
diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index a59c72e77645..8164a7323c17 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -108,7 +108,7 @@ static void __ref __static_call_transform(void *insn, enum insn_type type,
 	if (system_state == SYSTEM_BOOTING || modinit)
 		return text_poke_early(insn, code, size);
 
-	text_poke_bp(insn, code, size, emulate);
+	smp_text_poke_single(insn, code, size, emulate);
 }
 
 static void __static_call_validate(u8 *insn, bool tail, bool tramp)
diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 9e5fe2ba858f..e2b9991c3326 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -629,7 +629,7 @@ static int __bpf_arch_text_poke(void *ip, enum bpf_text_poke_type t,
 		goto out;
 	ret = 1;
 	if (memcmp(ip, new_insn, X86_PATCH_SIZE)) {
-		text_poke_bp(ip, new_insn, X86_PATCH_SIZE, NULL);
+		smp_text_poke_single(ip, new_insn, X86_PATCH_SIZE, NULL);
 		ret = 0;
 	}
 out:
-- 
2.45.2

