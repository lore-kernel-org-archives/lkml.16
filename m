Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65582BB15
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295084; cv=none; b=LcEM9BRKm8OEzFIX039H5leLjdM9fRPYktgBPj2jjs8byPo8SdqK6BRAkJN3M+CQQ6teUF3PXYPftUkiVsPX3chWXjMoE3E7YZKpMNNLKyUIFAD3z3xGvCwgyeOI9FU4bejO8YtKnIS10LZeCzbwP9h+owxviGNvLRI56GbJuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295084; c=relaxed/simple;
	bh=dfL0DB/1tST3mKTIw/ve96YMtsSJZhvdkubiQPYfGI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9EV6LsGOom46w8tM6PAqtUnyuqPiYTQJnZT61GVKjlm/iawR81lsaYdgH4K8gBE4fCTzhczD4xuEG8vBVavLIwYN3esvxSDKlDQ00u02v5v/rI0CqeOc+pi7+YEJZrxPvFQWVBYYUrk3nu/Q2PuaNo3L+Bz7tVUx6GmD5jlv/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvE7Wh9g; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvE7Wh9g"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b31cd61b2a9so200010a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295082; x=1750899882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qurq9zWrKcrFnW9xOg2bS+Q7Bbhohl82OFJAmRnuxPk=;
        b=FvE7Wh9gOxDQmTyL8po5dPT9sTA9OOp11lEi+Uq6Oov955ocMNuoai7lrYyC43mjUe
         pfCzqXAOzYGQGyEXdtrPNVkK91tCvxUXh0od/MT5HzlCR8YzShkDJgQ61HM80sRp+wR8
         TJ/ozgwiMNgagF7RvWbhQXPhuKxG5f8WiEK2LcaIiV1lyHlGD39vw/3VxLpfHFVieAgK
         R6KBiUd5eyibYsHLhj3bxa1MQPs2LxMofCi9ku2qXp76WRaAz6yMX4gOlHLPyadG5rMr
         MpB3z5y5E/fkkpMxpFw9zdUQGQBYnS3L97qMbOA2ueyfSkKHNOfp4XGxiLgkwtsb5fng
         ScZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295082; x=1750899882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qurq9zWrKcrFnW9xOg2bS+Q7Bbhohl82OFJAmRnuxPk=;
        b=qtd4kr29jGt5MxM/J/G0oD46+QjTGzMAudCs9l0pe6M9NqJX6wttmcV2qIYH4CFha8
         Fk8FqgNIjQ3giIGZK+Y72HCOjiwwybzuyvm+s/ClQniFXSYNJVx87oPGyGgAeWBftwyG
         rUY8+jTqFE327uY7d+7jMjgIA5eDNneDrU0N32xrnZVqu9l4rRoGsxs7zrqcL+gvYVpF
         iS9j+fue6zlSh0OmbXEH411eVUFCf7ZhkMAPQrx31KOb3UzGM9+6t4kEfviqoGdPOQW0
         uIy51LP6Xhb3KkXf/HbEKhd+4R+FYtA4p4FHqA1VYHlz0W00WYpJBcGyHbYkBRJNfggx
         AEoA==
X-Forwarded-Encrypted: i=1; AJvYcCWKa4jTRaTfPZjqrWqSco0qx3DJp5grz3L+y9ZPNVJ2qhFxjRJ04L5dPWeXLUgvYN3ijO+MfoBlYnHPRqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc+S12nX/V39UDRisVtnZHl+IzRoUkccd/1BCk00UC+UZj5+q3
	7vUDtk0lj+9lCMow6e5oEb7tx3ZUK+hgRzKCgx+DPJyUOZKI7QvQmTK3
X-Gm-Gg: ASbGncuH3yOzDEE0UvKfctjLnDGN3JbTB+MIgvJ0w88DxSfPA+RhDwZR+mKtBz8LutR
	I2A7qbd42pDEngmxXvxfcP53iq1WlX/YLUNu2WeHCL3XEOGYP/4ZRauUbovoipu3Ow35RaF4AXk
	5BQWPgId6HNz2S99J+TcIOiANIvBEs5USbmm4nyC821xlcoCwUZW8ES19yLQQ3Lnvtt3LuS6qJp
	csBij0C8kfzk7UiVPKla3U6QT1LaJCQp73hUmGfvQE+7g6VgIj4k56t6Icxd6XogL/xREOkrbWc
	sj5Y7wqr1V6yleFviZ1c5/1qZXNd3xoC0H2arRL/42YLlJQvfzE/NLwTgf/iYXqEUXjErBP2LEB
	Ub8haDnWcZ1mT66I4Qnx9UlOnRSHYAyox
X-Google-Smtp-Source: AGHT+IGGsTd0mGnaebBWcCkYOCEVuJRK3rXnecTPTmczQrPGvdQtHRuY0AFu7GQonB3MkwOMYxyHqA==
X-Received: by 2002:a17:90b:52c6:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-313f1dee421mr28875026a91.25.1750295082061;
        Wed, 18 Jun 2025 18:04:42 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a250c4bsm841242a91.30.2025.06.18.18.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:40 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 9DB60ED652C; Thu, 19 Jun 2025 10:04:33 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 02/13] um: decouple MMU specific code from the common part
Date: Thu, 19 Jun 2025 10:04:06 +0900
Message-ID: <8f04c03682594850e0f2f5bcff98d298c318d006.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
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
 arch/um/os-Linux/process.c      | 134 ++++++++++++++++++++++++++++++++
 arch/um/os-Linux/skas/process.c | 132 -------------------------------
 9 files changed, 224 insertions(+), 197 deletions(-)
 create mode 100644 arch/um/kernel/mem-pgtable.c

diff --git a/arch/um/kernel/Makefile b/arch/um/kernel/Makefile
index 4669db2aa9be..b7922f937213 100644
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
index 76bec7de81b5..106a2f85ab5c 100644
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
@@ -207,45 +206,11 @@ void free_initmem(void)
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
index fae836713487..c048fc838068 100644
--- a/arch/um/os-Linux/Makefile
+++ b/arch/um/os-Linux/Makefile
@@ -8,7 +8,8 @@ KCOV_INSTRUMENT                := n
 
 obj-y = execvp.o file.o helper.o irq.o main.o mem.o process.o \
 	registers.o sigio.o signal.o start_up.o time.o tty.o \
-	umid.o user_syms.o util.o skas/
+	umid.o user_syms.o util.o
+obj-$(CONFIG_MMU) += skas/
 
 CFLAGS_signal.o += -Wframe-larger-than=4096
 
diff --git a/arch/um/os-Linux/internal.h b/arch/um/os-Linux/internal.h
index 5d8d3b0817a9..89cfab0d5e47 100644
--- a/arch/um/os-Linux/internal.h
+++ b/arch/um/os-Linux/internal.h
@@ -5,6 +5,11 @@
 #include <mm_id.h>
 #include <stub-data.h>
 
+/*
+ * process.c
+ */
+extern int userspace_pid[];
+
 /*
  * elf_aux.c
  */
diff --git a/arch/um/os-Linux/process.c b/arch/um/os-Linux/process.c
index 00b49e90d05f..4eb7e137ef4b 100644
--- a/arch/um/os-Linux/process.c
+++ b/arch/um/os-Linux/process.c
@@ -6,6 +6,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdbool.h>
 #include <unistd.h>
 #include <errno.h>
 #include <signal.h>
@@ -15,10 +16,17 @@
 #include <sys/prctl.h>
 #include <sys/wait.h>
 #include <asm/unistd.h>
+#include <linux/threads.h>
 #include <init.h>
 #include <longjmp.h>
 #include <os.h>
 #include <skas/skas.h>
+#include <as-layout.h>
+#include <kern_util.h>
+
+int using_seccomp;
+int userspace_pid[NR_CPUS];
+int unscheduled_userspace_iterations;
 
 void os_alarm_process(int pid)
 {
@@ -189,3 +197,129 @@ void os_set_pdeathsig(void)
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
index e42ffac23e3c..808d8c205b65 100644
--- a/arch/um/os-Linux/skas/process.c
+++ b/arch/um/os-Linux/skas/process.c
@@ -18,7 +18,6 @@
 #include <sys/stat.h>
 #include <sys/socket.h>
 #include <asm/unistd.h>
-#include <as-layout.h>
 #include <init.h>
 #include <kern_util.h>
 #include <mem.h>
@@ -29,16 +28,10 @@
 #include <sysdep/stub.h>
 #include <sysdep/mcontext.h>
 #include <linux/futex.h>
-#include <linux/threads.h>
 #include <timetravel.h>
 #include <asm-generic/rwonce.h>
 #include "../internal.h"
 
-int is_skas_winch(int pid, int fd, void *data)
-{
-	return pid == getpgrp();
-}
-
 static const char *ptrace_reg_name(int idx)
 {
 #define R(n) case HOST_##n: return #n
@@ -433,9 +426,6 @@ static int __init init_stub_exe_fd(void)
 }
 __initcall(init_stub_exe_fd);
 
-int using_seccomp;
-int userspace_pid[NR_CPUS];
-
 /**
  * start_userspace() - prepare a new userspace process
  * @mm_id: The corresponding struct mm_id
@@ -548,7 +538,6 @@ int start_userspace(struct mm_id *mm_id)
 	return err;
 }
 
-int unscheduled_userspace_iterations;
 extern unsigned long tt_extra_sched_jiffies;
 
 void userspace(struct uml_pt_regs *regs)
@@ -786,124 +775,3 @@ void userspace(struct uml_pt_regs *regs)
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

