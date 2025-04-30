Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF9F1DE8B4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987262; cv=none; b=WvaRS8izl4pSsT4vQ0r4qaDotRUgEs+xjXfwZPwdAFh2X1c+tYz3ebfbCc7vM3d0D/TcPRAYCTTZpJ5JRBDXp3EarZlkXu8X4o8C4o5lFLfPoIw0zyaD0n+zA15bBeJRyD84O6rIZOSrTheThe6E0gJTWhgRSp5qd3AfRUhnU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987262; c=relaxed/simple;
	bh=14ZwErdFw/tkVVG22Dt416W3KY7eTBOFbpsU/xBx3Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWB51QJVdih+0X6Or264Cv8xMQ/h1BgQn1iALhrfiPm6Gv5t1XhOq2Xw6EC1kOJ52PZgndvF/X9UyxTMYtYqWfxZ8LErOgRua6omP9ULwxYbg5jwb9UpFa62eatNJEdFrcoXNkePJSogLZAMMmmPmoulF647njye5TgP9whvBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVe0jmU3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVe0jmU3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22423adf751so68759005ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987260; x=1746592060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxkcTNzm3D6nL0kwz3FotmEhOp0HbpyTDMavm76nXag=;
        b=CVe0jmU3NH21at/3cJucOV/NkL7sQ4xlxXbaAWggs2QGD05U0tBGrMsskKQbNRejsH
         maNBBhZYCijZAY+GXwqpOJNCFaxbtaUgqCAh9ej7A9ZgrMI4EBCR75UIcxA2Nde48KRW
         uwYxZHRv/67qwre0en9gMlcl56iCmAIRlRlQAQME3acO9X/HFTUpa/DPATVcPHTE/d4a
         wxhSG0ydW6k/WYCbNwwqKCM4FcKLGCbwLyYuCva5Lejzo+VTZWPT93Vnt9HBzkafnxC1
         BK9u+EGgf714085k4oEOb89Q2KMi4e7aqVYnPGpS5ZhKTwwenShGUuSCp/xu7we0nTco
         8QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987260; x=1746592060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxkcTNzm3D6nL0kwz3FotmEhOp0HbpyTDMavm76nXag=;
        b=RHTYuxqQtmotZVW2/NKRnqBB5ZgLwzEaHiJhoYJUYt4z3Zr96qfEkrgs1pNKYZrNWF
         9fFzREOroIaoB5jjSKs2N7nFhYD4WPV4KpSG7yOG3ppIasmYLnUOhM+0LmpJXKIoINDL
         03JrxBuz56bSUSkJI4dC4oNsYOYppXrvVFK0XqcjCdkn/xaySTy0xejVo39osXnSm8UI
         3ROyE8o638nnn3Cnj5Dx+QXQdnXdVE5hvfPZzt+/2EdKs00BBbDU3Ure5UoUMjl9omOh
         r+DbSfKd3IP6fBu+aK5y4kdX7PMJxsqPmJcGITNlLUFFJoDf1crppa1zatz3Tgnz6ca3
         Ir9g==
X-Forwarded-Encrypted: i=1; AJvYcCV22srTFHkLlQtQ6KobKc1pIr+Apcd5sr3PALEq0lNMr6SENzRwnFwdsqhFeY+zE8TawI1EPfCKIzFMPok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyihWs+fVzb5FiGLpfRf7bccvSMl1mJhidhcFrcR4miciUMNXE
	YahHuhYZRx34FdpjtlvyXbN05w8Qvo9aL3IdKvZzVXnG+juGwMAo
X-Gm-Gg: ASbGncvfw9JkL040hEmzUaNVPqltN32NWWJ7xMlrfNziQPSgco6y6SXwBrLUAyjgqpH
	8XRVooYrwIWeY6zuzdpmJUNVf8c3+xgOxZPAsdSkCMCEils6LjRsyi4RhUe5ilw+MKSQt7uZoi0
	+x4fmhWJClVC9KxC8iofDjaioJU8kHnHUXIv9hCtA7LoC4/wWhdKBf2cQMoSLlVypMcNgFPWoex
	g6+RGOMHn1D81NHN4vvUwrFlFCpcZ+JzUrcNkCnNAqxvw24Ab8Wd7e4JBBwFU8JDDG0vD+W3FDe
	BjQHvrD+3U5U3HPXW/a3IXdQRMJePab3LxnGcMXg+eB/LUUWFfWNdOQkGLzCbZ39xqcq85NOiJc
	CTA3P3XbFsgFvJwhqVgxyZA==
X-Google-Smtp-Source: AGHT+IHgdjbusCjYmIH+ACOzIzDAu13eai9H3Z92dIgixBY5dCjEqln5XxlFGM+akjniyzUkMjrgLw==
X-Received: by 2002:a17:902:c950:b0:224:c47:cbd with SMTP id d9443c01a7336-22df32b7e5dmr29296215ad.0.1745987259538;
        Tue, 29 Apr 2025 21:27:39 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd20dsm112320725ad.79.2025.04.29.21.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:27:38 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 9C164E94816; Wed, 30 Apr 2025 13:27:36 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 02/12] um: decouple MMU specific code from the common part
Date: Wed, 30 Apr 2025 13:27:08 +0900
Message-ID: <7663e05099b914d3b978a521b2d3f67791a3abe9.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This splits the memory, process related code with common and MMU
specific parts in order to avoid ifdefs in .c file and duplication
between MMU and !MMU.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 arch/um/kernel/Makefile         |   5 +-
 arch/um/kernel/mem-pgtable.c    |  55 +++++++++++++
 arch/um/kernel/mem.c            |  35 ---------
 arch/um/kernel/process.c        |  25 ++++++
 arch/um/kernel/skas/process.c   |  27 -------
 arch/um/os-Linux/Makefile       |   3 +-
 arch/um/os-Linux/internal.h     |   5 ++
 arch/um/os-Linux/process.c      | 133 ++++++++++++++++++++++++++++++++
 arch/um/os-Linux/skas/process.c | 132 -------------------------------
 9 files changed, 223 insertions(+), 197 deletions(-)
 create mode 100644 arch/um/kernel/mem-pgtable.c

diff --git a/arch/um/kernel/Makefile b/arch/um/kernel/Makefile
index 4df1cd0d2017..827a7438509d 100644
--- a/arch/um/kernel/Makefile
+++ b/arch/um/kernel/Makefile
@@ -16,9 +16,10 @@ extra-y := vmlinux.lds
 
 obj-y = config.o exec.o exitcode.o irq.o ksyms.o mem.o \
 	physmem.o process.o ptrace.o reboot.o sigio.o \
-	signal.o sysrq.o time.o tlb.o trap.o \
-	um_arch.o umid.o kmsg_dump.o capflags.o skas/
+	signal.o sysrq.o time.o \
+	um_arch.o umid.o kmsg_dump.o capflags.o
 obj-y += load_file.o
+obj-$(CONFIG_MMU) += mem-pgtable.o tlb.o trap.o skas/
 
 obj-$(CONFIG_BLK_DEV_INITRD) += initrd.o
 obj-$(CONFIG_GPROF)	+= gprof_syms.o
diff --git a/arch/um/kernel/mem-pgtable.c b/arch/um/kernel/mem-pgtable.c
new file mode 100644
index 000000000000..549da1d3bff0
--- /dev/null
+++ b/arch/um/kernel/mem-pgtable.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2000 - 2007 Jeff Dike (jdike@{addtoit,linux.intel}.com)
+ */
+
+#include <linux/stddef.h>
+#include <linux/module.h>
+#include <linux/memblock.h>
+#include <linux/swap.h>
+#include <linux/slab.h>
+#include <asm/page.h>
+#include <asm/pgalloc.h>
+#include <as-layout.h>
+#include <init.h>
+#include <kern.h>
+#include <kern_util.h>
+#include <mem_user.h>
+#include <os.h>
+#include <um_malloc.h>
+
+
+/* Allocate and free page tables. */
+
+pgd_t *pgd_alloc(struct mm_struct *mm)
+{
+	pgd_t *pgd = (pgd_t *)__get_free_page(GFP_KERNEL);
+
+	if (pgd) {
+		memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
+		memcpy(pgd + USER_PTRS_PER_PGD,
+		       swapper_pg_dir + USER_PTRS_PER_PGD,
+		       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
+	}
+	return pgd;
+}
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY,
+	[VM_EXEC]					= PAGE_READONLY,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED
+};
+DECLARE_VM_GET_PAGE_PROT
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 61b5a5ede01c..cbe8b9d03d8c 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -6,7 +6,6 @@
 #include <linux/stddef.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
-#include <linux/mm.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
 #include <linux/init.h>
@@ -206,45 +205,11 @@ void free_initmem(void)
 {
 }
 
-/* Allocate and free page tables. */
-
-pgd_t *pgd_alloc(struct mm_struct *mm)
-{
-	pgd_t *pgd = __pgd_alloc(mm, 0);
-
-	if (pgd)
-		memcpy(pgd + USER_PTRS_PER_PGD,
-		       swapper_pg_dir + USER_PTRS_PER_PGD,
-		       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
-
-	return pgd;
-}
-
 void *uml_kmalloc(int size, int flags)
 {
 	return kmalloc(size, flags);
 }
 
-static const pgprot_t protection_map[16] = {
-	[VM_NONE]					= PAGE_NONE,
-	[VM_READ]					= PAGE_READONLY,
-	[VM_WRITE]					= PAGE_COPY,
-	[VM_WRITE | VM_READ]				= PAGE_COPY,
-	[VM_EXEC]					= PAGE_READONLY,
-	[VM_EXEC | VM_READ]				= PAGE_READONLY,
-	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
-	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY,
-	[VM_SHARED]					= PAGE_NONE,
-	[VM_SHARED | VM_READ]				= PAGE_READONLY,
-	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
-	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
-	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
-	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY,
-	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
-	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED
-};
-DECLARE_VM_GET_PAGE_PROT
-
 void mark_rodata_ro(void)
 {
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index 0cd6fad3d908..08959745c30d 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -25,6 +25,7 @@
 #include <linux/tick.h>
 #include <linux/threads.h>
 #include <linux/resume_user_mode.h>
+#include <linux/start_kernel.h>
 #include <asm/current.h>
 #include <asm/mmu_context.h>
 #include <asm/switch_to.h>
@@ -46,6 +47,8 @@
 struct task_struct *cpu_tasks[NR_CPUS];
 EXPORT_SYMBOL(cpu_tasks);
 
+static char cpu0_irqstack[THREAD_SIZE] __aligned(THREAD_SIZE);
+
 void free_stack(unsigned long stack, int order)
 {
 	free_pages(stack, order);
@@ -295,3 +298,25 @@ unsigned long __get_wchan(struct task_struct *p)
 
 	return 0;
 }
+
+
+static int __init start_kernel_proc(void *unused)
+{
+	block_signals_trace();
+
+	start_kernel();
+	return 0;
+}
+
+int __init start_uml(void)
+{
+	stack_protections((unsigned long) &cpu0_irqstack);
+	set_sigstack(cpu0_irqstack, THREAD_SIZE);
+
+	init_new_thread_signals();
+
+	init_task.thread.request.thread.proc = start_kernel_proc;
+	init_task.thread.request.thread.arg = NULL;
+	return start_idle_thread(task_stack_page(&init_task),
+				 &init_task.thread.switch_buf);
+}
diff --git a/arch/um/kernel/skas/process.c b/arch/um/kernel/skas/process.c
index 05dcdc057af9..5247121d3419 100644
--- a/arch/um/kernel/skas/process.c
+++ b/arch/um/kernel/skas/process.c
@@ -16,33 +16,6 @@
 #include <skas.h>
 #include <kern_util.h>
 
-extern void start_kernel(void);
-
-static int __init start_kernel_proc(void *unused)
-{
-	block_signals_trace();
-
-	start_kernel();
-	return 0;
-}
-
-extern int userspace_pid[];
-
-static char cpu0_irqstack[THREAD_SIZE] __aligned(THREAD_SIZE);
-
-int __init start_uml(void)
-{
-	stack_protections((unsigned long) &cpu0_irqstack);
-	set_sigstack(cpu0_irqstack, THREAD_SIZE);
-
-	init_new_thread_signals();
-
-	init_task.thread.request.thread.proc = start_kernel_proc;
-	init_task.thread.request.thread.arg = NULL;
-	return start_idle_thread(task_stack_page(&init_task),
-				 &init_task.thread.switch_buf);
-}
-
 unsigned long current_stub_stack(void)
 {
 	if (current->mm == NULL)
diff --git a/arch/um/os-Linux/Makefile b/arch/um/os-Linux/Makefile
index 049dfa5bc9c6..331564888400 100644
--- a/arch/um/os-Linux/Makefile
+++ b/arch/um/os-Linux/Makefile
@@ -8,7 +8,8 @@ KCOV_INSTRUMENT                := n
 
 obj-y = execvp.o file.o helper.o irq.o main.o mem.o process.o \
 	registers.o sigio.o signal.o start_up.o time.o tty.o \
-	umid.o user_syms.o util.o drivers/ skas/
+	umid.o user_syms.o util.o drivers/
+obj-$(CONFIG_MMU) += skas/
 
 CFLAGS_signal.o += -Wframe-larger-than=4096
 
diff --git a/arch/um/os-Linux/internal.h b/arch/um/os-Linux/internal.h
index 317fca190c2b..bcbf64ce8cd1 100644
--- a/arch/um/os-Linux/internal.h
+++ b/arch/um/os-Linux/internal.h
@@ -2,6 +2,11 @@
 #ifndef __UM_OS_LINUX_INTERNAL_H
 #define __UM_OS_LINUX_INTERNAL_H
 
+/*
+ * process.c
+ */
+extern int userspace_pid[];
+
 /*
  * elf_aux.c
  */
diff --git a/arch/um/os-Linux/process.c b/arch/um/os-Linux/process.c
index 184566edeee9..2331e32c4898 100644
--- a/arch/um/os-Linux/process.c
+++ b/arch/um/os-Linux/process.c
@@ -6,6 +6,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdbool.h>
 #include <unistd.h>
 #include <errno.h>
 #include <signal.h>
@@ -15,9 +16,15 @@
 #include <sys/prctl.h>
 #include <sys/wait.h>
 #include <asm/unistd.h>
+#include <linux/threads.h>
 #include <init.h>
 #include <longjmp.h>
 #include <os.h>
+#include <as-layout.h>
+#include <kern_util.h>
+
+int userspace_pid[NR_CPUS];
+int unscheduled_userspace_iterations;
 
 void os_alarm_process(int pid)
 {
@@ -158,3 +165,129 @@ void os_set_pdeathsig(void)
 {
 	prctl(PR_SET_PDEATHSIG, SIGKILL);
 }
+
+int is_skas_winch(int pid, int fd, void *data)
+{
+	return pid == getpgrp();
+}
+
+void new_thread(void *stack, jmp_buf *buf, void (*handler)(void))
+{
+	(*buf)[0].JB_IP = (unsigned long) handler;
+	(*buf)[0].JB_SP = (unsigned long) stack + UM_THREAD_SIZE -
+		sizeof(void *);
+}
+
+#define INIT_JMP_NEW_THREAD 0
+#define INIT_JMP_CALLBACK 1
+#define INIT_JMP_HALT 2
+#define INIT_JMP_REBOOT 3
+
+void switch_threads(jmp_buf *me, jmp_buf *you)
+{
+	unscheduled_userspace_iterations = 0;
+
+	if (UML_SETJMP(me) == 0)
+		UML_LONGJMP(you, 1);
+}
+
+static jmp_buf initial_jmpbuf;
+
+/* XXX Make these percpu */
+static void (*cb_proc)(void *arg);
+static void *cb_arg;
+static jmp_buf *cb_back;
+
+int start_idle_thread(void *stack, jmp_buf *switch_buf)
+{
+	int n;
+
+	set_handler(SIGWINCH);
+
+	/*
+	 * Can't use UML_SETJMP or UML_LONGJMP here because they save
+	 * and restore signals, with the possible side-effect of
+	 * trying to handle any signals which came when they were
+	 * blocked, which can't be done on this stack.
+	 * Signals must be blocked when jumping back here and restored
+	 * after returning to the jumper.
+	 */
+	n = setjmp(initial_jmpbuf);
+	switch (n) {
+	case INIT_JMP_NEW_THREAD:
+		(*switch_buf)[0].JB_IP = (unsigned long) uml_finishsetup;
+		(*switch_buf)[0].JB_SP = (unsigned long) stack +
+			UM_THREAD_SIZE - sizeof(void *);
+		break;
+	case INIT_JMP_CALLBACK:
+		(*cb_proc)(cb_arg);
+		longjmp(*cb_back, 1);
+		break;
+	case INIT_JMP_HALT:
+		kmalloc_ok = 0;
+		return 0;
+	case INIT_JMP_REBOOT:
+		kmalloc_ok = 0;
+		return 1;
+	default:
+		printk(UM_KERN_ERR "Bad sigsetjmp return in %s - %d\n",
+		       __func__, n);
+		fatal_sigsegv();
+	}
+	longjmp(*switch_buf, 1);
+
+	/* unreachable */
+	printk(UM_KERN_ERR "impossible long jump!");
+	fatal_sigsegv();
+	return 0;
+}
+
+void initial_thread_cb_skas(void (*proc)(void *), void *arg)
+{
+	jmp_buf here;
+
+	cb_proc = proc;
+	cb_arg = arg;
+	cb_back = &here;
+
+	block_signals_trace();
+	if (UML_SETJMP(&here) == 0)
+		UML_LONGJMP(&initial_jmpbuf, INIT_JMP_CALLBACK);
+	unblock_signals_trace();
+
+	cb_proc = NULL;
+	cb_arg = NULL;
+	cb_back = NULL;
+}
+
+void halt_skas(void)
+{
+	block_signals_trace();
+	UML_LONGJMP(&initial_jmpbuf, INIT_JMP_HALT);
+}
+
+static bool noreboot;
+
+static int __init noreboot_cmd_param(char *str, int *add)
+{
+	*add = 0;
+	noreboot = true;
+	return 0;
+}
+
+__uml_setup("noreboot", noreboot_cmd_param,
+"noreboot\n"
+"    Rather than rebooting, exit always, akin to QEMU's -no-reboot option.\n"
+"    This is useful if you're using CONFIG_PANIC_TIMEOUT in order to catch\n"
+"    crashes in CI\n");
+
+void reboot_skas(void)
+{
+	block_signals_trace();
+	UML_LONGJMP(&initial_jmpbuf, noreboot ? INIT_JMP_HALT : INIT_JMP_REBOOT);
+}
+
+void __switch_mm(struct mm_id *mm_idp)
+{
+	userspace_pid[0] = mm_idp->pid;
+}
diff --git a/arch/um/os-Linux/skas/process.c b/arch/um/os-Linux/skas/process.c
index ae2aea062f06..40136102fc11 100644
--- a/arch/um/os-Linux/skas/process.c
+++ b/arch/um/os-Linux/skas/process.c
@@ -5,7 +5,6 @@
  */
 
 #include <stdlib.h>
-#include <stdbool.h>
 #include <unistd.h>
 #include <sched.h>
 #include <errno.h>
@@ -16,7 +15,6 @@
 #include <sys/wait.h>
 #include <sys/stat.h>
 #include <asm/unistd.h>
-#include <as-layout.h>
 #include <init.h>
 #include <kern_util.h>
 #include <mem.h>
@@ -25,15 +23,9 @@
 #include <registers.h>
 #include <skas.h>
 #include <sysdep/stub.h>
-#include <linux/threads.h>
 #include <timetravel.h>
 #include "../internal.h"
 
-int is_skas_winch(int pid, int fd, void *data)
-{
-	return pid == getpgrp();
-}
-
 static const char *ptrace_reg_name(int idx)
 {
 #define R(n) case HOST_##n: return #n
@@ -315,8 +307,6 @@ static int __init init_stub_exe_fd(void)
 }
 __initcall(init_stub_exe_fd);
 
-int userspace_pid[NR_CPUS];
-
 /**
  * start_userspace() - prepare a new userspace process
  * @stub_stack:	pointer to the stub stack.
@@ -398,7 +388,6 @@ int start_userspace(unsigned long stub_stack)
 	return err;
 }
 
-int unscheduled_userspace_iterations;
 extern unsigned long tt_extra_sched_jiffies;
 
 void userspace(struct uml_pt_regs *regs)
@@ -560,124 +549,3 @@ void userspace(struct uml_pt_regs *regs)
 		}
 	}
 }
-
-void new_thread(void *stack, jmp_buf *buf, void (*handler)(void))
-{
-	(*buf)[0].JB_IP = (unsigned long) handler;
-	(*buf)[0].JB_SP = (unsigned long) stack + UM_THREAD_SIZE -
-		sizeof(void *);
-}
-
-#define INIT_JMP_NEW_THREAD 0
-#define INIT_JMP_CALLBACK 1
-#define INIT_JMP_HALT 2
-#define INIT_JMP_REBOOT 3
-
-void switch_threads(jmp_buf *me, jmp_buf *you)
-{
-	unscheduled_userspace_iterations = 0;
-
-	if (UML_SETJMP(me) == 0)
-		UML_LONGJMP(you, 1);
-}
-
-static jmp_buf initial_jmpbuf;
-
-/* XXX Make these percpu */
-static void (*cb_proc)(void *arg);
-static void *cb_arg;
-static jmp_buf *cb_back;
-
-int start_idle_thread(void *stack, jmp_buf *switch_buf)
-{
-	int n;
-
-	set_handler(SIGWINCH);
-
-	/*
-	 * Can't use UML_SETJMP or UML_LONGJMP here because they save
-	 * and restore signals, with the possible side-effect of
-	 * trying to handle any signals which came when they were
-	 * blocked, which can't be done on this stack.
-	 * Signals must be blocked when jumping back here and restored
-	 * after returning to the jumper.
-	 */
-	n = setjmp(initial_jmpbuf);
-	switch (n) {
-	case INIT_JMP_NEW_THREAD:
-		(*switch_buf)[0].JB_IP = (unsigned long) uml_finishsetup;
-		(*switch_buf)[0].JB_SP = (unsigned long) stack +
-			UM_THREAD_SIZE - sizeof(void *);
-		break;
-	case INIT_JMP_CALLBACK:
-		(*cb_proc)(cb_arg);
-		longjmp(*cb_back, 1);
-		break;
-	case INIT_JMP_HALT:
-		kmalloc_ok = 0;
-		return 0;
-	case INIT_JMP_REBOOT:
-		kmalloc_ok = 0;
-		return 1;
-	default:
-		printk(UM_KERN_ERR "Bad sigsetjmp return in %s - %d\n",
-		       __func__, n);
-		fatal_sigsegv();
-	}
-	longjmp(*switch_buf, 1);
-
-	/* unreachable */
-	printk(UM_KERN_ERR "impossible long jump!");
-	fatal_sigsegv();
-	return 0;
-}
-
-void initial_thread_cb_skas(void (*proc)(void *), void *arg)
-{
-	jmp_buf here;
-
-	cb_proc = proc;
-	cb_arg = arg;
-	cb_back = &here;
-
-	block_signals_trace();
-	if (UML_SETJMP(&here) == 0)
-		UML_LONGJMP(&initial_jmpbuf, INIT_JMP_CALLBACK);
-	unblock_signals_trace();
-
-	cb_proc = NULL;
-	cb_arg = NULL;
-	cb_back = NULL;
-}
-
-void halt_skas(void)
-{
-	block_signals_trace();
-	UML_LONGJMP(&initial_jmpbuf, INIT_JMP_HALT);
-}
-
-static bool noreboot;
-
-static int __init noreboot_cmd_param(char *str, int *add)
-{
-	*add = 0;
-	noreboot = true;
-	return 0;
-}
-
-__uml_setup("noreboot", noreboot_cmd_param,
-"noreboot\n"
-"    Rather than rebooting, exit always, akin to QEMU's -no-reboot option.\n"
-"    This is useful if you're using CONFIG_PANIC_TIMEOUT in order to catch\n"
-"    crashes in CI\n");
-
-void reboot_skas(void)
-{
-	block_signals_trace();
-	UML_LONGJMP(&initial_jmpbuf, noreboot ? INIT_JMP_HALT : INIT_JMP_REBOOT);
-}
-
-void __switch_mm(struct mm_id *mm_idp)
-{
-	userspace_pid[0] = mm_idp->pid;
-}
-- 
2.43.0

