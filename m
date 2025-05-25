Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8519DF60
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748206421; cv=none; b=VHv3Kl/K2k0XY1RNVnLZvXrBzugn3spfQETeH0Fi4PWFfg76XwQQOj+KOD6m4O3MJ2xe8okQbHD54a5V4PNCZ5PkVHDlsH+sJ0BRq4CryFnglhKygK/1+PjHd69JVJnVGZ8VTawSnNrTIo6J7Rkm1wgo2VC+jiJhOUqCIkogG3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748206421; c=relaxed/simple;
	bh=31cAvtfY+qqBwc5qZmqe6IahPY30POvCWwxqwMojtIE=;
	h=From:To:Cc:Subject:Message-ID:Content-Type:MIME-Version:Date; b=KX30o7UnLIEF+XDTMjgJOCE21WhR6Pcl9dzP+Q8zkiI6U0iUZjCMctwedL0H73rHNWe1dVLRbaRkLitan++iy4Sx5ADDKDOv5qIwLjnND9vpAoZSFhPUkTrhggtHXKOJTcwiVWlU1eYCUPmN1lo6QDYmS1CdiIxKYrGZAlaPbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P/A3hc9+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f0cLy2sI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P/A3hc9+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f0cLy2sI"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748206417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IrTbWNj3gUT2KY3fcXzCth0YPMjCrGbJA/ZvNTaKl0Q=;
	b=P/A3hc9+yA7LAji3V/xeq0HJhz6rI1mA1BO3WrZ14bzcjzgPHqvUhjJq8d96ntvnEVJKx1
	5ex5yyw7bzmcJiFP3mUESq0cF84/tyi0OhdM6WtExfMlG4UhoBGarCZgV723ymMaT6xLk1
	X+/oFiLLCkotW82CnTJqmjKlu+iFZvFZmgIYSO/bNc2cCDmXTqextjXdCKwD2uLK1e5ppm
	JLqwfOHxOTodM+wE6R9H7co2jo7KgOMmeSMUOgu8Y9p4H94Pubc9MUmrjP7VB+Gk1PHIgL
	5Whns2zCgD5wdXXWkw5H4jPBv10PhPGOw7V0+wFuz6ED+6QO/WUq0B2Ol0/E9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748206417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IrTbWNj3gUT2KY3fcXzCth0YPMjCrGbJA/ZvNTaKl0Q=;
	b=f0cLy2sIMgbncrRchwCyq1c3KaFqQ2F9xiUsFM7FO7ruktrrAOvTLlX8+tQq6Yjh7ujs1Q
	hLJM5maTguZ730Bg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] core/entry for v6.16-rc1
Message-ID: <174820637262.238682.1985899398053030312.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 May 2025 22:53:36 +0200 (CEST)

Linus,

please pull the latest core/entry branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-entry-2025-=
05-25

up to:  8278fd6006a0: LoongArch: entry: Fix include order


Updates for the generic and architecture entry code:

  - Move LoongArch and RISC-V ret_from_fork() implementations to C code so
    that syscall_exit_user_mode() can be inlined.

  - Split the RISC-V ret_from_fork() implementation into return to user and
    return to kernel, which gives a measurable performance improvement.

  - Inline syscall_exit_user_mode() which benefits all architectures by
    avoiding a function call and letting the compiler do better
    optimizations.

Thanks,

	tglx

------------------>
Charlie Jenkins (5):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      LoongArch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()
      LoongArch: entry: Fix include order


 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +--------------------------=
--
 8 files changed, 119 insertions(+), 79 deletions(-)

diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/inc=
lude/asm/asm-prototypes.h
index 51f224bcfc65..704066b4f736 100644
--- a/arch/loongarch/include/asm/asm-prototypes.h
+++ b/arch/loongarch/include/asm/asm-prototypes.h
@@ -12,3 +12,11 @@ __int128_t __ashlti3(__int128_t a, int b);
 __int128_t __ashrti3(__int128_t a, int b);
 __int128_t __lshrti3(__int128_t a, int b);
 #endif
+
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struc=
t *prev,
+							   struct pt_regs *regs);
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct t=
ask_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg);
diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
index 48e7e34e355e..2abc29e57381 100644
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
 SYM_CODE_END(handle_syscall)
 _ASM_NOKPROBE(handle_syscall)
=20
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 =3D struct task_struct *prev
-	move		a0, sp
-	bl 		syscall_exit_to_user_mode
+	move		a1, sp
+	bl 		ret_from_fork
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
=20
-SYM_CODE_START(ret_from_kernel_thread)
+SYM_CODE_START(ret_from_kernel_thread_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 =3D struct task_struct *prev
-	move		a0, s1
-	jirl		ra, s0, 0
-	move		a0, sp
-	bl		syscall_exit_to_user_mode
+	move		a1, sp
+	move		a2, s0
+	move		a3, s1
+	bl		ret_from_kernel_thread
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_kernel_thread)
+SYM_CODE_END(ret_from_kernel_thread_asm)
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 6e58f65455c7..3582f591bab2 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -13,6 +13,7 @@
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/entry-common.h>
 #include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -34,6 +35,7 @@
 #include <linux/nmi.h>
=20
 #include <asm/asm.h>
+#include <asm/asm-prototypes.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/elf.h>
@@ -47,6 +49,7 @@
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
=20
@@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override =3D IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
=20
-asmlinkage void ret_from_fork(void);
-asmlinkage void ret_from_kernel_thread(void);
+asmlinkage void restore_and_ret(void);
+asmlinkage void ret_from_fork_asm(void);
+asmlinkage void ret_from_kernel_thread_asm(void);
=20
 void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 {
@@ -138,6 +142,23 @@ int arch_dup_task_struct(struct task_struct *dst, struct=
 task_struct *src)
 	return 0;
 }
=20
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struc=
t *prev,
+							   struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct t=
ask_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg)
+{
+	schedule_tail(prev);
+	fn(fn_arg);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +186,8 @@ int copy_thread(struct task_struct *p, const struct kerne=
l_clone_args *args)
 		p->thread.reg03 =3D childksp;
 		p->thread.reg23 =3D (unsigned long)args->fn;
 		p->thread.reg24 =3D (unsigned long)args->fn_arg;
-		p->thread.reg01 =3D (unsigned long)ret_from_kernel_thread;
-		p->thread.sched_ra =3D (unsigned long)ret_from_kernel_thread;
+		p->thread.reg01 =3D (unsigned long)ret_from_kernel_thread_asm;
+		p->thread.sched_ra =3D (unsigned long)ret_from_kernel_thread_asm;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->csr_euen =3D p->thread.csr_euen;
 		childregs->csr_crmd =3D p->thread.csr_crmd;
@@ -182,8 +203,8 @@ int copy_thread(struct task_struct *p, const struct kerne=
l_clone_args *args)
 		childregs->regs[3] =3D usp;
=20
 	p->thread.reg03 =3D (unsigned long) childregs;
-	p->thread.reg01 =3D (unsigned long) ret_from_fork;
-	p->thread.sched_ra =3D (unsigned long) ret_from_fork;
+	p->thread.reg01 =3D (unsigned long) ret_from_fork_asm;
+	p->thread.sched_ra =3D (unsigned long) ret_from_fork_asm;
=20
 	/*
 	 * New tasks lose permission to use the fpu. This accelerates context
diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm=
/asm-prototypes.h
index cd627ec289f1..bfc8ea5f9319 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -52,6 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
=20
+asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct=
 pt_regs *regs);
+asmlinkage void ret_from_fork_user(struct pt_regs *regs);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4..0fb338000c6d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,17 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
=20
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_kernel_asm)
+	call schedule_tail
+	move a0, s1 /* fn_arg */
+	move a1, s0 /* fn */
+	move a2, sp /* pt_regs */
+	call ret_from_fork_kernel
+	j ret_from_exception
+SYM_CODE_END(ret_from_fork_kernel_asm)
+
+SYM_CODE_START(ret_from_fork_user_asm)
 	call schedule_tail
-	beqz s0, 1f	/* not from kernel thread */
-	/* Call fn(arg) */
-	move a0, s1
-	jalr s0
-1:
 	move a0, sp /* pt_regs */
-	call syscall_exit_to_user_mode
+	call ret_from_fork_user
 	j ret_from_exception
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_user_asm)
=20
 #ifdef CONFIG_IRQ_STACKS
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7c244de77180..485ec7a80a56 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -17,7 +17,9 @@
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
 #include <linux/personality.h>
+#include <linux/entry-common.h>
=20
+#include <asm/asm-prototypes.h>
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/csr.h>
@@ -36,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
=20
-extern asmlinkage void ret_from_fork(void);
+extern asmlinkage void ret_from_fork_kernel_asm(void);
+extern asmlinkage void ret_from_fork_user_asm(void);
=20
 void noinstr arch_cpu_idle(void)
 {
@@ -206,6 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct=
 task_struct *src)
 	return 0;
 }
=20
+asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct=
 pt_regs *regs)
+{
+	fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
+asmlinkage void ret_from_fork_user(struct pt_regs *regs)
+{
+	syscall_exit_to_user_mode(regs);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags =3D args->flags;
@@ -228,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kerne=
l_clone_args *args)
=20
 		p->thread.s[0] =3D (unsigned long)args->fn;
 		p->thread.s[1] =3D (unsigned long)args->fn_arg;
+		p->thread.ra =3D (unsigned long)ret_from_fork_kernel_asm;
 	} else {
 		*childregs =3D *(current_pt_regs());
 		/* Turn off status.VS */
@@ -237,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct ker=
nel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp =3D tls;
 		childregs->a0 =3D 0; /* Return value of fork() */
-		p->thread.s[0] =3D 0;
+		p->thread.ra =3D (unsigned long)ret_from_fork_user_asm;
 	}
 	p->thread.riscv_v_flags =3D 0;
 	if (has_vector() || has_xtheadvector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra =3D (unsigned long)ret_from_fork;
 	p->thread.sp =3D (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index fc61d0205c97..f94f3fdf15fc 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -14,6 +14,7 @@
 #include <linux/kmsan.h>
=20
 #include <asm/entry-common.h>
+#include <asm/syscall.h>
=20
 /*
  * Define dummy _TIF work flags if not defined by the architecture or for
@@ -366,6 +367,15 @@ static __always_inline void exit_to_user_mode(void)
 	lockdep_hardirqs_on(CALLER_ADDR0);
 }
=20
+/**
+ * syscall_exit_work - Handle work before returning to user mode
+ * @regs:	Pointer to current pt_regs
+ * @work:	Current thread syscall work
+ *
+ * Do one-time syscall specific work.
+ */
+void syscall_exit_work(struct pt_regs *regs, unsigned long work);
+
 /**
  * syscall_exit_to_user_mode_work - Handle work before returning to user mode
  * @regs:	Pointer to currents pt_regs
@@ -379,7 +389,30 @@ static __always_inline void exit_to_user_mode(void)
  * make the final state transitions. Interrupts must stay disabled between
  * return from this function and the invocation of exit_to_user_mode().
  */
-void syscall_exit_to_user_mode_work(struct pt_regs *regs);
+static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *r=
egs)
+{
+	unsigned long work =3D READ_ONCE(current_thread_info()->syscall_work);
+	unsigned long nr =3D syscall_get_nr(current, regs);
+
+	CT_WARN_ON(ct_state() !=3D CT_STATE_KERNEL);
+
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
+			local_irq_enable();
+	}
+
+	rseq_syscall(regs);
+
+	/*
+	 * Do one-time syscall specific work. If these work items are
+	 * enabled, we want to run them exactly once per syscall exit with
+	 * interrupts enabled.
+	 */
+	if (unlikely(work & SYSCALL_WORK_EXIT))
+		syscall_exit_work(regs, work);
+	local_irq_disable_exit_to_user();
+	exit_to_user_mode_prepare(regs);
+}
=20
 /**
  * syscall_exit_to_user_mode - Handle work before returning to user mode
@@ -410,7 +443,13 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs=
);
  * exit_to_user_mode(). This function is preferred unless there is a
  * compelling architectural reason to use the separate functions.
  */
-void syscall_exit_to_user_mode(struct pt_regs *regs);
+static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	instrumentation_begin();
+	syscall_exit_to_user_mode_work(regs);
+	instrumentation_end();
+	exit_to_user_mode();
+}
=20
 /**
  * irqentry_enter_from_user_mode - Establish state before invoking the irq h=
andler
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 20154572ede9..a8dd1f27417c 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -146,7 +146,7 @@ static inline bool report_single_step(unsigned long work)
 	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
 }
=20
-static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
+void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 {
 	bool step;
=20
@@ -173,53 +173,6 @@ static void syscall_exit_work(struct pt_regs *regs, unsi=
gned long work)
 		ptrace_report_syscall_exit(regs, step);
 }
=20
-/*
- * Syscall specific exit to user mode preparation. Runs with interrupts
- * enabled.
- */
-static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
-{
-	unsigned long work =3D READ_ONCE(current_thread_info()->syscall_work);
-	unsigned long nr =3D syscall_get_nr(current, regs);
-
-	CT_WARN_ON(ct_state() !=3D CT_STATE_KERNEL);
-
-	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
-		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
-			local_irq_enable();
-	}
-
-	rseq_syscall(regs);
-
-	/*
-	 * Do one-time syscall specific work. If these work items are
-	 * enabled, we want to run them exactly once per syscall exit with
-	 * interrupts enabled.
-	 */
-	if (unlikely(work & SYSCALL_WORK_EXIT))
-		syscall_exit_work(regs, work);
-}
-
-static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs =
*regs)
-{
-	syscall_exit_to_user_mode_prepare(regs);
-	local_irq_disable_exit_to_user();
-	exit_to_user_mode_prepare(regs);
-}
-
-void syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	__syscall_exit_to_user_mode_work(regs);
-}
-
-__visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
-{
-	instrumentation_begin();
-	__syscall_exit_to_user_mode_work(regs);
-	instrumentation_end();
-	exit_to_user_mode();
-}
-
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);

