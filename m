Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C752201260
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108936; cv=none; b=p0AnZ1M/eu+KsQISaek0lWLHIlEct9c7UWtfnw4Y6nMWOW56Ruh2+NcELfFARVGThJlA9UERehoKjHmxXP9r7ewYybUwguK/hjRR50LiYyqUJETGbFt4wArDiWuP93rsL6V041fqDZS+qD/ZUFQIessJZvFWoLup/Ibv8YSlXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108936; c=relaxed/simple;
	bh=wRb65iHgs3gw2lvD+qtC5MU5+7GuZzV78UYKyZwK4oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8orZ/bpj7NyI6Vri1Fc36eQW8RXudZ52AkzRK5DLAAE/p76yRuMY0u+pFNon7SJ97ood5DyuzuEJ6ye5vioXOK8iaNZfhjQXPN862R/sd2NLhPOYNXTnSJN/Kr52DaqBNy7bohcWcyu3O/3eMRiMU74ozuSAL+AD23DxQ/DmAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIjya98v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIjya98v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5640FC4CEDD;
	Thu, 27 Mar 2025 20:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108936;
	bh=wRb65iHgs3gw2lvD+qtC5MU5+7GuZzV78UYKyZwK4oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIjya98vF3cjhYtjFLRdDFLNMI0mqMXKGbdY+sLlra/0mYema/qh82bXww7qPXChG
	 X9VhghQ4z+UhGK++/01ch33Naez9CxNWItMLX+49YYzKw+w62wLQXDbyQw1nZyUzL+
	 o4ZCLIVot07Ft4ZtZGJDSUN55yvnkjyvw9KsydRYKex0O/ACWZ/QLhJHd1nGa6tS7g
	 27TcCfMO6JBdrWwyskNB7pJQ7iVnaF4tNHMIb9YbchpsHEEWYg9xrmCcTLL1glerNR
	 0eZmdvH4TI8wSeU6gffZsCwT/MudijgPy2mQFM30gguHYRXo/Zz8DxuiOSrv/KBh7r
	 uwzrVfypC1n5Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 40/41] x86/alternatives: Rename 'text_poke_sync()' to 'text_poke_sync_each_cpu()'
Date: Thu, 27 Mar 2025 21:53:53 +0100
Message-ID: <20250327205355.378659-41-mingo@kernel.org>
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

Unlike sync_core(), text_poke_sync() is a very heavy operation, as
it sends an IPI to every online CPU in the system and waits for
completion.

Reflect this in the name.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/text-patching.h |  2 +-
 arch/x86/kernel/alternative.c        | 12 ++++++------
 arch/x86/kernel/kprobes/core.c       |  4 ++--
 arch/x86/kernel/kprobes/opt.c        |  4 ++--
 arch/x86/kernel/module.c             |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index 611957617278..ff30aa1d0c47 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -32,7 +32,7 @@ extern void apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u
  * an inconsistent instruction while you patch.
  */
 extern void *text_poke(void *addr, const void *opcode, size_t len);
-extern void text_poke_sync(void);
+extern void text_poke_sync_each_cpu(void);
 extern void *text_poke_kgdb(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 1b523496a2f6..32d3707d7963 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2445,7 +2445,7 @@ static void do_sync_core(void *info)
 	sync_core();
 }
 
-void text_poke_sync(void)
+void text_poke_sync_each_cpu(void)
 {
 	on_each_cpu(do_sync_core, NULL, 1);
 }
@@ -2469,8 +2469,8 @@ struct text_poke_int3_loc {
 #define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct text_poke_int3_loc))
 
 static struct text_poke_int3_array {
-	int nr_entries;
 	struct text_poke_int3_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
+	int nr_entries;
 } tp_array;
 
 static DEFINE_PER_CPU(atomic_t, tp_array_refs);
@@ -2649,7 +2649,7 @@ static void text_poke_int3_batch_process(void)
 		text_poke(text_poke_int3_addr(&tp_array.vec[i]), &int3, INT3_INSN_SIZE);
 	}
 
-	text_poke_sync();
+	text_poke_sync_each_cpu();
 
 	/*
 	 * Second step: update all but the first byte of the patched range.
@@ -2711,7 +2711,7 @@ static void text_poke_int3_batch_process(void)
 		 * not necessary and we'd be safe even without it. But
 		 * better safe than sorry (plus there's not only Intel).
 		 */
-		text_poke_sync();
+		text_poke_sync_each_cpu();
 	}
 
 	/*
@@ -2732,13 +2732,13 @@ static void text_poke_int3_batch_process(void)
 	}
 
 	if (do_sync)
-		text_poke_sync();
+		text_poke_sync_each_cpu();
 
 	/*
 	 * Remove and wait for refs to be zero.
 	 *
 	 * Notably, if after step-3 above the INT3 got removed, then the
-	 * text_poke_sync() will have serialized against any running INT3
+	 * text_poke_sync_each_cpu() will have serialized against any running INT3
 	 * handlers and the below spin-wait will not happen.
 	 *
 	 * IOW. unless the replacement instruction is INT3, this case goes
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 09608fd93687..5e35c95524dc 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -808,7 +808,7 @@ void arch_arm_kprobe(struct kprobe *p)
 	u8 int3 = INT3_INSN_OPCODE;
 
 	text_poke(p->addr, &int3, 1);
-	text_poke_sync();
+	text_poke_sync_each_cpu();
 	perf_event_text_poke(p->addr, &p->opcode, 1, &int3, 1);
 }
 
@@ -818,7 +818,7 @@ void arch_disarm_kprobe(struct kprobe *p)
 
 	perf_event_text_poke(p->addr, &int3, 1, &p->opcode, 1);
 	text_poke(p->addr, &p->opcode, 1);
-	text_poke_sync();
+	text_poke_sync_each_cpu();
 }
 
 void arch_remove_kprobe(struct kprobe *p)
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 54bc5e7c6886..5efa7b50bbb3 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -513,11 +513,11 @@ void arch_unoptimize_kprobe(struct optimized_kprobe *op)
 	       JMP32_INSN_SIZE - INT3_INSN_SIZE);
 
 	text_poke(addr, new, INT3_INSN_SIZE);
-	text_poke_sync();
+	text_poke_sync_each_cpu();
 	text_poke(addr + INT3_INSN_SIZE,
 		  new + INT3_INSN_SIZE,
 		  JMP32_INSN_SIZE - INT3_INSN_SIZE);
-	text_poke_sync();
+	text_poke_sync_each_cpu();
 
 	perf_event_text_poke(op->kp.addr, old, JMP32_INSN_SIZE, new, JMP32_INSN_SIZE);
 }
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index a7998f351701..1c598c90e24d 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -206,7 +206,7 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
 				   write, apply);
 
 	if (!early) {
-		text_poke_sync();
+		text_poke_sync_each_cpu();
 		mutex_unlock(&text_mutex);
 	}
 
-- 
2.45.2

