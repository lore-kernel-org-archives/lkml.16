Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2122D4ED
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168536; cv=none; b=OEZjEEEYf+LvKg5VtO80yZsoxNqn1g2zx58nr9LYkqwOo3NdDBLfIb/Ot2iDhp6T5tb7E+z8idEj3VJo16LJ6q2H9g8gd7BPxQPsy2U+Q5821rs841hhVR03FOvAAnVvztd8KjqQARAbCfF16ILi25v02NMC5MkB9aQchNYkf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168536; c=relaxed/simple;
	bh=EpzY1ysB9vvgVyONPFQ7L89dIUcTnCMnWw5EfRgCt8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKQpw4ckUh+tJp5vkKLUCzkF4ld0SHPHcgk2gO+EFdhKhSTpDCW6Fke6ZyTQeLAMi68+YeeJVssCMNcL6PEvJy+Fy5CDa1WTpM3BKjesv4COOccDpRt0s6SUAZqHpDlbHb8qO1zLHQEY0zb+ChNINjZZxVcGyNEFYBqbkF8MlsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOQClxIc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOQClxIc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531E2C4CEE4;
	Fri, 28 Mar 2025 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168536;
	bh=EpzY1ysB9vvgVyONPFQ7L89dIUcTnCMnWw5EfRgCt8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MOQClxIc+ZahvJ1elByNOWB+OVSzCoAtBs5aKsdB/ptmyFBIYO0QxB0o1vjJ+SbVv
	 YC2BhNM8x5QGVcWAd+fj2aB5SzWhDx9cEIyReyaglg0bBVrmaNHSDuGHYwMZTwjAq5
	 eG+mnIw3QqQ/c5dg/fjJMvBCxABIWBsFvuByncNR7M8PsMhZK5dTkz/yBwD+2DulHR
	 4ZaQk6yvE2/8bBOsGxhFj8GA9VqBI916P1EpFLPGZpe1LW18hQLD+b6PpzmZabahCD
	 TC1jDcutqgiCcgh+DniSsl/PNgzdNovZvu6RL8o/5pGf4RxMSo54+PfU8adCYBu6g0
	 pa9XvaNIpMHew==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 38/49] x86/alternatives: Rename 'text_poke_sync()' to 'smp_text_poke_sync_each_cpu()'
Date: Fri, 28 Mar 2025 14:26:53 +0100
Message-ID: <20250328132704.1901674-39-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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
index 20ce4eda6d47..6834e652d26c 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -32,7 +32,7 @@ extern void apply_relocation(u8 *buf, const u8 * const instr, size_t instrlen, u
  * an inconsistent instruction while you patch.
  */
 extern void *text_poke(void *addr, const void *opcode, size_t len);
-extern void text_poke_sync(void);
+extern void smp_text_poke_sync_each_cpu(void);
 extern void *text_poke_kgdb(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5293929488f0..b0bd8cd524c5 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2445,7 +2445,7 @@ static void do_sync_core(void *info)
 	sync_core();
 }
 
-void text_poke_sync(void)
+void smp_text_poke_sync_each_cpu(void)
 {
 	on_each_cpu(do_sync_core, NULL, 1);
 }
@@ -2469,8 +2469,8 @@ struct smp_text_poke_loc {
 #define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct smp_text_poke_loc))
 
 static struct smp_text_poke_array {
-	int nr_entries;
 	struct smp_text_poke_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
+	int nr_entries;
 } text_poke_array;
 
 static DEFINE_PER_CPU(atomic_t, text_poke_array_refs);
@@ -2649,7 +2649,7 @@ static void smp_text_poke_batch_process(void)
 		text_poke(text_poke_addr(&text_poke_array.vec[i]), &int3, INT3_INSN_SIZE);
 	}
 
-	text_poke_sync();
+	smp_text_poke_sync_each_cpu();
 
 	/*
 	 * Second step: update all but the first byte of the patched range.
@@ -2711,7 +2711,7 @@ static void smp_text_poke_batch_process(void)
 		 * not necessary and we'd be safe even without it. But
 		 * better safe than sorry (plus there's not only Intel).
 		 */
-		text_poke_sync();
+		smp_text_poke_sync_each_cpu();
 	}
 
 	/*
@@ -2732,13 +2732,13 @@ static void smp_text_poke_batch_process(void)
 	}
 
 	if (do_sync)
-		text_poke_sync();
+		smp_text_poke_sync_each_cpu();
 
 	/*
 	 * Remove and wait for refs to be zero.
 	 *
 	 * Notably, if after step-3 above the INT3 got removed, then the
-	 * text_poke_sync() will have serialized against any running INT3
+	 * smp_text_poke_sync_each_cpu() will have serialized against any running INT3
 	 * handlers and the below spin-wait will not happen.
 	 *
 	 * IOW. unless the replacement instruction is INT3, this case goes
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 09608fd93687..47cb8eb138ba 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -808,7 +808,7 @@ void arch_arm_kprobe(struct kprobe *p)
 	u8 int3 = INT3_INSN_OPCODE;
 
 	text_poke(p->addr, &int3, 1);
-	text_poke_sync();
+	smp_text_poke_sync_each_cpu();
 	perf_event_text_poke(p->addr, &p->opcode, 1, &int3, 1);
 }
 
@@ -818,7 +818,7 @@ void arch_disarm_kprobe(struct kprobe *p)
 
 	perf_event_text_poke(p->addr, &int3, 1, &p->opcode, 1);
 	text_poke(p->addr, &p->opcode, 1);
-	text_poke_sync();
+	smp_text_poke_sync_each_cpu();
 }
 
 void arch_remove_kprobe(struct kprobe *p)
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 9307a40f4983..0aabd4c4e2c4 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -513,11 +513,11 @@ void arch_unoptimize_kprobe(struct optimized_kprobe *op)
 	       JMP32_INSN_SIZE - INT3_INSN_SIZE);
 
 	text_poke(addr, new, INT3_INSN_SIZE);
-	text_poke_sync();
+	smp_text_poke_sync_each_cpu();
 	text_poke(addr + INT3_INSN_SIZE,
 		  new + INT3_INSN_SIZE,
 		  JMP32_INSN_SIZE - INT3_INSN_SIZE);
-	text_poke_sync();
+	smp_text_poke_sync_each_cpu();
 
 	perf_event_text_poke(op->kp.addr, old, JMP32_INSN_SIZE, new, JMP32_INSN_SIZE);
 }
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index a7998f351701..231d6326d1fd 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -206,7 +206,7 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
 				   write, apply);
 
 	if (!early) {
-		text_poke_sync();
+		smp_text_poke_sync_each_cpu();
 		mutex_unlock(&text_mutex);
 	}
 
-- 
2.45.2

