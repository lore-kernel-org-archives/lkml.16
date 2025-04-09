Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C92144B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233123; cv=none; b=C3paliFKD7b3l8rxPmeoOZvm6O0E4lQM82JHl1i2mlmkJqJfw1/WzPeC5jkV8x0JJNsTKcHgyDoFNPCVCrluxY9SJod9Snmy1mEPAL1I2810QgJF97df+vUJE06HwWhyE6ZUvtMiV4PY/WpPR2zz+u6mIkYLMSW+0rTaJEyZK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233123; c=relaxed/simple;
	bh=+zdko4ltFn0osG/aK0C6R4EHXLADPKkqIWLi0Kot1ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L27Sn5zDSYxx4osZqf3mBtmOTCbh6CZkpwYwzlYZJK6iM0+FuAo/gvG9YZaQO21SGQZ2SktuV9g2BQjGALfQfy4DtwXp32HbPKPr2WLO3fq03z076VtaV1HTY9HA7cSJzEEwAF27vp5hF7BN0M4Qm9aAoggVoIeADwFun1cadcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqbDe4bv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqbDe4bv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909B4C4CEEB;
	Wed,  9 Apr 2025 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233123;
	bh=+zdko4ltFn0osG/aK0C6R4EHXLADPKkqIWLi0Kot1ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqbDe4bv38gERWdXxkT0tiD3thc/eflafvO6WizpzYbOl4O4UsVczsFPvaLtdmJT+
	 80uyFckHh0MO6+ExXtIRJy3Y3ExGI/PqFBN62q3dufenk74JCWV5kZkjKJraCgTvQz
	 bxi6FqwMjpn5+EZJcgVNr0SDhELNn3l25LeMUxJDPmh40QYd/u+xyMG0htHIse2xen
	 l1m6uHaBRxCCkt/17dJk2K9ZxtpgfTrd0aM81ZLMGOj8c8GzbxqioMAzyAjhncG2mA
	 jJ5Uo0AyeHUV/pAoCWDhRBwT3M78ZAShPPD0Ny/Fo8/IMR60q/eUsP/aa2IOQGbk5a
	 pbqP0gAm6wnrA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 7/8] x86/fpu: Remove init_task FPU state dependencies, add debugging warning for PF_KTHREAD tasks
Date: Wed,  9 Apr 2025 23:11:26 +0200
Message-ID: <20250409211127.3544993-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
References: <20250409211127.3544993-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_task's FPU state initialization was a bit of a hack:

		__x86_init_fpu_begin = .;
		. = __x86_init_fpu_begin + 128*PAGE_SIZE;
		__x86_init_fpu_end = .;

But the init task isn't supposed to be using the FPU context
in any case, so remove the hack and add in some debug warnings.

As Linus noted in the discussion, the init task (and other
PF_KTHREAD tasks) *can* use the FPU via kernel_fpu_begin()/_end(),
but they don't need the context area because their FPU use is not
preemptible or reentrant, and they don't return to user-space.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Uros Bizjak <ubizjak@gmail.com>
Link: https://lore.kernel.org/r/20240605083557.2051480-4-mingo@kernel.org
---
 arch/x86/include/asm/processor.h |  6 +++++-
 arch/x86/kernel/fpu/core.c       | 15 +++++++++++----
 arch/x86/kernel/fpu/init.c       |  3 +--
 arch/x86/kernel/fpu/xstate.c     |  3 ---
 arch/x86/kernel/vmlinux.lds.S    |  4 ----
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index b7f7c9c83409..eaa7214d6953 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -516,7 +516,11 @@ struct thread_struct {
 #endif
 };
 
-#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
+#ifdef CONFIG_X86_DEBUG_FPU
+extern struct fpu *x86_task_fpu(struct task_struct *task);
+#else
+# define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
+#endif
 
 /*
  * X86 doesn't need any embedded-FPU-struct quirks:
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 4a2193892e5d..4d1a205b7ce2 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -51,6 +51,16 @@ static DEFINE_PER_CPU(bool, in_kernel_fpu);
  */
 DEFINE_PER_CPU(struct fpu *, fpu_fpregs_owner_ctx);
 
+#ifdef CONFIG_X86_DEBUG_FPU
+struct fpu *x86_task_fpu(struct task_struct *task)
+{
+	if (WARN_ON_ONCE(task->flags & PF_KTHREAD))
+		return NULL;
+
+	return (void *)task + sizeof(*task);
+}
+#endif
+
 /*
  * Can we use the FPU in kernel mode with the
  * whole "kernel_fpu_begin/end()" sequence?
@@ -599,11 +609,9 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 	 *
 	 * This is safe because task_struct size is a multiple of cacheline size.
 	 */
-	struct fpu *src_fpu = x86_task_fpu(current);
-	struct fpu *dst_fpu = x86_task_fpu(dst);
+	struct fpu *dst_fpu = (void *)dst + sizeof(*dst);
 
 	BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);
-	BUG_ON(!src_fpu);
 
 	/* The new task's FPU state cannot be valid in the hardware. */
 	dst_fpu->last_cpu = -1;
@@ -666,7 +674,6 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 	if (update_fpu_shstk(dst, ssp))
 		return 1;
 
-	trace_x86_fpu_copy_src(src_fpu);
 	trace_x86_fpu_copy_dst(dst_fpu);
 
 	return 0;
diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index da41a1d2c40f..16b6611634c3 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -38,7 +38,7 @@ static void fpu__init_cpu_generic(void)
 	/* Flush out any pending x87 state: */
 #ifdef CONFIG_MATH_EMULATION
 	if (!boot_cpu_has(X86_FEATURE_FPU))
-		fpstate_init_soft(&x86_task_fpu(current)->fpstate->regs.soft);
+		;
 	else
 #endif
 		asm volatile ("fninit");
@@ -207,7 +207,6 @@ static void __init fpu__init_system_xstate_size_legacy(void)
 	fpu_kernel_cfg.default_size = size;
 	fpu_user_cfg.max_size = size;
 	fpu_user_cfg.default_size = size;
-	fpstate_reset(x86_task_fpu(current));
 }
 
 /*
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index ab2588b8f17f..00e87afa876d 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -834,9 +834,6 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 	if (err)
 		goto out_disable;
 
-	/* Reset the state for the current task */
-	fpstate_reset(x86_task_fpu(current));
-
 	/*
 	 * Update info used for ptrace frames; use standard-format size and no
 	 * supervisor xstates:
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index d9ca2d1754da..ccdc45e5b759 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -181,10 +181,6 @@ SECTIONS
 		/* equivalent to task_pt_regs(&init_task) */
 		__top_init_kernel_stack = __end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE;
 
-		__x86_init_fpu_begin = .;
-		. = __x86_init_fpu_begin + 128*PAGE_SIZE;
-		__x86_init_fpu_end = .;
-
 #ifdef CONFIG_X86_32
 		/* 32 bit has nosave before _edata */
 		NOSAVE_DATA
-- 
2.45.2

