Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AF29C32F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350168; cv=none; b=I8Y8btqOZeuvxrV/9r969QuC9OgHl416bbnmOvHp6b5NYUuKOvMLh19/H1uBuxP84qpPeE67bTvO5Q/pXuXuOeyq4ApgJjSvx8zp7m1VAYBdv0VzmGcP7/X9KElSl5YUlbBQ7nyJsF69SuTyQYCPPoFpMbKzC9ZihPG273TbyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350168; c=relaxed/simple;
	bh=+Zusv4g+u/zW0IcYKf98daAfMcPmsjKjF92ucQMyf2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVp7VFXrDx96ttM7kWOoNCHZoSgoXSoPzX2YycldiEEuH2uEGkQcu2WK9GPBV/aZVnEi3x18z6Y5U322H3TncaR4Ghzn6ORy/dydLaTa1F7Hjie6oc6XLWpB/wNaeDAeycA17CGrP3+Zq+uN8fUIUZG3j7caoYsYU1E1IfrN+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMH4fUfS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMH4fUfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13B9C4CEE2;
	Fri, 11 Apr 2025 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350167;
	bh=+Zusv4g+u/zW0IcYKf98daAfMcPmsjKjF92ucQMyf2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mMH4fUfSkD8KcDMKcNbtQQVK5tJzNO+p9jQvXQ+vYZzrMFOiI+zWsom46GFK3INjS
	 Bvb+CTXAA00Fo9Ek7/VUK3QWrSD6DIg3Je3VdS5iDueNeNZrV59wy3NVWEw5OLRNu9
	 hqdk9ITTKhkotSpxrwl/1DcVhdUhtGR1cyTwzrYdDLeZ0cmzz1KDqCrRKDJuubqp5S
	 kf5Xy4cI433zbqek+NSQlLUh1sD7N4TQjzFivNyv/lS/3iPt8MsREew7plbndv9/0d
	 LrULnHtY5XiRHkTws7q10MRLQ9b6cjETSybY8R1taogqO+N7I+W6Nnv3doz8Ql0eUh
	 e60vbxw/MxBSg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 40/53] x86/alternatives: Rename 'text_poke_sync()' to 'smp_text_poke_sync_each_cpu()'
Date: Fri, 11 Apr 2025 07:40:52 +0200
Message-ID: <20250411054105.2341982-41-mingo@kernel.org>
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
index f3c9b70afb0c..d9dbbe9d9667 100644
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
index 556a82f576cd..e4c51d81a72f 100644
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

