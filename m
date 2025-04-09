Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F92147FE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233109; cv=none; b=snlFYlsx9woUgM4d2O1y/yEq4nMfMpgzx8dOqjt5Ds+J64TB2RanjjdGoeCiNnz+DQGn3ZiqkomVDFEdZTNN2Sm/elsWZZDTdvZQ/VVJTcxFAJ5ou8FnlziwzSU/rNjplTq68mMhll1OiE0R0h5HjDkE/r2lKBmxNyiJbzsmC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233109; c=relaxed/simple;
	bh=HDFc8XxXpcfoEsZT3dQ6ISqPPlGcS2r3vI+88Ffx9xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eItlXxz4/Av07rvt/5SLu0A0tO5KncQ+Wa/plxmMuG6GhbAG5iC25XMIV00zMhcjp4O7waAhe8T1aoxu1vTAoxJEX+4QREJPVG94zkU8MhlWNv/qE1yMkhM7tSx1Q8P/GZEEbaM+jgdGZlJhc3lYjRnKnN6Kzv7mz8R7jNQgXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hl5BKyNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hl5BKyNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA9CC4CEE9;
	Wed,  9 Apr 2025 21:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233108;
	bh=HDFc8XxXpcfoEsZT3dQ6ISqPPlGcS2r3vI+88Ffx9xE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hl5BKyNGiw9/wcg2KlNeabgbcuA8c5E0PcOX3ce5h/nn08Io+lnRZPrl2l5hCagMg
	 NxkIBt2tSF9nN5O+lK/QG/F6Ii+wYFPBmqwhpjWDKkVAwImKJoOUsyX8Dg7NMQUfIN
	 AiuGxZ7QrM1arLIOYcC86XC55S6zg4RkIVDnAr+hRKoCDtvLZ5Ne8DmWx0Nr7OJ+xq
	 XSd9Lm0cxADg4bjPHDQop36IvtUlpiy4Tewq+Ix9O7+BLcbb4AuD+U6B/kawcMOy9Z
	 YRPiT9ei2TYeDJ+2pyQh+OUS4T810cQK2LQCNrcL9xinhrUd6vpab84Lm9veY5/6Xa
	 EKw6MZFImeG8w==
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
Subject: [PATCH 3/8] x86/fpu: Make task_struct::thread constant size
Date: Wed,  9 Apr 2025 23:11:22 +0200
Message-ID: <20250409211127.3544993-4-mingo@kernel.org>
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

Turn thread.fpu into a pointer. Since most FPU code internals work by passing
around the FPU pointer already, the code generation impact is small.

This allows us to remove the old kludge of task_struct being variable size:

  struct task_struct {

       ...
       /*
        * New fields for task_struct should be added above here, so that
        * they are included in the randomized portion of task_struct.
        */
       randomized_struct_fields_end

       /* CPU-specific state of this task: */
       struct thread_struct            thread;

       /*
        * WARNING: on x86, 'thread_struct' contains a variable-sized
        * structure.  It *MUST* be at the end of 'task_struct'.
        *
        * Do not put anything below here!
        */
  };

... which creates a number of problems, such as requiring thread_struct to be
the last member of the struct - not allowing it to be struct-randomized, etc.

But the primary motivation is to allow the decoupling of task_struct from
hardware details (<asm/processor.h> in particular), and to eventually allow
the per-task infrastructure:

   DECLARE_PER_TASK(type, name);
   ...
   per_task(current, name) = val;

... which requires task_struct to be a constant size struct.

The fpu_thread_struct_whitelist() quirk to hardened usercopy can be removed,
now that the FPU structure is not embedded in the task struct anymore, which
reduces text footprint a bit.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Fixed-by: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Uros Bizjak <ubizjak@gmail.com>
Link: https://lore.kernel.org/r/20240605083557.2051480-2-mingo@kernel.org
---
 arch/x86/include/asm/processor.h | 20 +++++++++-----------
 arch/x86/kernel/fpu/core.c       | 23 ++++++++++++-----------
 arch/x86/kernel/fpu/init.c       | 17 ++++++++++-------
 arch/x86/kernel/process.c        |  2 +-
 include/linux/sched.h            | 15 ++++-----------
 5 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 2f631e0adea3..5ea7e5d2c4de 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -516,21 +516,19 @@ struct thread_struct {
 #endif
 
 	/* Floating point and extended processor state */
-	struct fpu		fpu;
-	/*
-	 * WARNING: 'fpu' is dynamically-sized.  It *MUST* be at
-	 * the end.
-	 */
+	struct fpu		*fpu;
 };
 
-#define x86_task_fpu(task) (&(task)->thread.fpu)
-
-extern void fpu_thread_struct_whitelist(unsigned long *offset, unsigned long *size);
+#define x86_task_fpu(task) ((task)->thread.fpu)
 
-static inline void arch_thread_struct_whitelist(unsigned long *offset,
-						unsigned long *size)
+/*
+ * X86 doesn't need any embedded-FPU-struct quirks:
+ */
+static inline void
+arch_thread_struct_whitelist(unsigned long *offset, unsigned long *size)
 {
-	fpu_thread_struct_whitelist(offset, size);
+	*offset = 0;
+	*size = 0;
 }
 
 static inline void
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index dc6d7f93c446..853a738fdf2d 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -593,8 +593,19 @@ static int update_fpu_shstk(struct task_struct *dst, unsigned long ssp)
 int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 	      unsigned long ssp)
 {
+	/*
+	 * We allocate the new FPU structure right after the end of the task struct.
+	 * task allocation size already took this into account.
+	 *
+	 * This is safe because task_struct size is a multiple of cacheline size.
+	 */
 	struct fpu *src_fpu = x86_task_fpu(current);
-	struct fpu *dst_fpu = x86_task_fpu(dst);
+	struct fpu *dst_fpu = (void *)dst + sizeof(*dst);
+
+	BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);
+	BUG_ON(!src_fpu);
+
+	dst->thread.fpu = dst_fpu;
 
 	/* The new task's FPU state cannot be valid in the hardware. */
 	dst_fpu->last_cpu = -1;
@@ -663,16 +674,6 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
 	return 0;
 }
 
-/*
- * Whitelist the FPU register state embedded into task_struct for hardened
- * usercopy.
- */
-void fpu_thread_struct_whitelist(unsigned long *offset, unsigned long *size)
-{
-	*offset = offsetof(struct thread_struct, fpu.__fpstate.regs);
-	*size = fpu_kernel_cfg.default_size;
-}
-
 /*
  * Drops current FPU state: deactivates the fpregs and
  * the fpstate. NOTE: it still leaves previous contents
diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index ad5cb2943d37..848ea79886ba 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -71,8 +71,15 @@ static bool __init fpu__probe_without_cpuid(void)
 	return fsw == 0 && (fcw & 0x103f) == 0x003f;
 }
 
+static struct fpu x86_init_fpu __attribute__ ((aligned (64))) __read_mostly;
+
 static void __init fpu__init_system_early_generic(void)
 {
+	fpstate_reset(&x86_init_fpu);
+	current->thread.fpu = &x86_init_fpu;
+	set_thread_flag(TIF_NEED_FPU_LOAD);
+	x86_init_fpu.last_cpu = -1;
+
 	if (!boot_cpu_has(X86_FEATURE_CPUID) &&
 	    !test_bit(X86_FEATURE_FPU, (unsigned long *)cpu_caps_cleared)) {
 		if (fpu__probe_without_cpuid())
@@ -150,6 +157,8 @@ static void __init fpu__init_task_struct_size(void)
 {
 	int task_size = sizeof(struct task_struct);
 
+	task_size += sizeof(struct fpu);
+
 	/*
 	 * Subtract off the static size of the register state.
 	 * It potentially has a bunch of padding.
@@ -164,14 +173,9 @@ static void __init fpu__init_task_struct_size(void)
 
 	/*
 	 * We dynamically size 'struct fpu', so we require that
-	 * it be at the end of 'thread_struct' and that
-	 * 'thread_struct' be at the end of 'task_struct'.  If
-	 * you hit a compile error here, check the structure to
-	 * see if something got added to the end.
+	 * 'state' be at the end of 'it:
 	 */
 	CHECK_MEMBER_AT_END_OF(struct fpu, __fpstate);
-	CHECK_MEMBER_AT_END_OF(struct thread_struct, fpu);
-	CHECK_MEMBER_AT_END_OF(struct task_struct, thread);
 
 	arch_task_struct_size = task_size;
 }
@@ -213,7 +217,6 @@ static void __init fpu__init_system_xstate_size_legacy(void)
  */
 void __init fpu__init_system(void)
 {
-	fpstate_reset(x86_task_fpu(current));
 	fpu__init_system_early_generic();
 
 	/*
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 47694e391506..3ce4cce46f3f 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -103,7 +103,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	dst->thread.vm86 = NULL;
 #endif
 	/* Drop the copied pointer to current's fpstate */
-	x86_task_fpu(dst)->fpstate = NULL;
+	dst->thread.fpu = NULL;
 
 	return 0;
 }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..4ecc0c6b1cb0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1646,22 +1646,15 @@ struct task_struct {
 	struct user_event_mm		*user_event_mm;
 #endif
 
-	/*
-	 * New fields for task_struct should be added above here, so that
-	 * they are included in the randomized portion of task_struct.
-	 */
-	randomized_struct_fields_end
-
 	/* CPU-specific state of this task: */
 	struct thread_struct		thread;
 
 	/*
-	 * WARNING: on x86, 'thread_struct' contains a variable-sized
-	 * structure.  It *MUST* be at the end of 'task_struct'.
-	 *
-	 * Do not put anything below here!
+	 * New fields for task_struct should be added above here, so that
+	 * they are included in the randomized portion of task_struct.
 	 */
-};
+	randomized_struct_fields_end
+} __attribute__ ((aligned (64)));
 
 #define TASK_REPORT_IDLE	(TASK_REPORT + 1)
 #define TASK_REPORT_MAX		(TASK_REPORT_IDLE << 1)
-- 
2.45.2

