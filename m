Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9387405A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295086; cv=none; b=dPtXfgd0jnosExNkimkSQ0l9y+lLcqUK6tYHtSnnz1RkxacHvlvJKdvaZByGBSzM/rlobreSKv8UTu5QQtr/Wmxf13pnvIu+SHqiZPBMjNURHVoOZeM+z8w4YFY343LlvVj93BbUlHkKchbzBtkwdYE4gfJ74lkD2kqBuBXNwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295086; c=relaxed/simple;
	bh=uiSxmtJMthrLo+oH9HhdUFVGn3NpOpl/5AJlOYbiDcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9LwL6dKImJWQrIoHfsOWEJt5P2e9zoru6wTB9wyLbMjhYy/OmTIjdJC2uDLaDIWEicv40MowM/JnoosazjHC9tBV5j0dTa26l3eQzcwhOWAR1Rvnrp3umGfhYbTRq7EaJkKFqSKw/T/83+4zT3ujNw+Qbp/1OV8NQANkGLaM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSSLdjsu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSSLdjsu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-236377f00a1so2456555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295084; x=1750899884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/9FDFFbTGgOECfx9E1KzmmWlTydkD+KFqPPHo/qkbE=;
        b=MSSLdjsuONpD8xVvFktgRvCplEU0mbjdXdyX3qMmySIa0PYPYKYpID1d5619elLiZw
         YC+Tx39uv2P+aAwbvLGDSG0femtvg/754GvTZobe11ubDP/WtJ7KtKdzEMjR0Uh7WxWl
         V11cZ1J2re6RSZV/Zctwpo5Vk96arPdBdEikhWmVPPtvNubjYq4cRxonI9a5HGD+oMYZ
         HyjSpvCP105v4jGFEiXcjkH7rEayVyMEptl54EMHK2+6IC9Pc1bbthXbc9JGSYullOFk
         nqACD9otv1TIpbO91XDw7I5PBGkuwD6L5P8UKVb8bqSklc5qzRuJN+cyQ+GsGIuvGhMf
         RS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295084; x=1750899884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/9FDFFbTGgOECfx9E1KzmmWlTydkD+KFqPPHo/qkbE=;
        b=FlpzEPWy6T1eteMKJBVj2klbMuK5jW1JQS3JeyzukXV++TLeys/k4lgSfREoDVL1H8
         NzVJoUUGOl0Vc6iy5AtJTzp8anmgx3WVl1x37hGCxmV+/bmL8pvjnWRUWMCm8E1awuX+
         2oMvoW9huzeh9aPDeCGuK7h4zZ6HBF4dE7HR6VBvlIcmoruGwAiXxLW+YDMjWw7sAkRc
         9/U/yR1q8R3pqAP7Kg7cMG7R7z21lzRoZ7Ayx+vOHezn+b9WMOiJtUi/sRm7L0VqB+QW
         5eoeR6Hepat6icQ79O/Q/KSosYq3tvd7r3pMrHrm4nZXy33VPkVNIcsBz9KdSHKtda2u
         KqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0ClmTludnkya1TyefuKFOphMpOLNk9k8ZHiaR2ZODj//G+/Qw2bFK1KzkMIjDIKdIJMh4pPx1JopZOKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1fjyhDL6udZFp7suXPUis9AcsHM59MsRrEYWFJtLbvUGUEud
	0coBrTLE3N5JlCT8+ay3pr4nqNhPyAGTJVrk4bQ+8+1EPUVchai+g5dm
X-Gm-Gg: ASbGncuT4/qFw1bHmZPe/ZDcoLemM+/9CuSKJzJwEI27Gl9oo+n8os1ItoLbZfvvso/
	Wk2RO5O49IIxX6cplxj2vvASYVfTNtClaZcAAs3iy8+DGRR6oMhCRsBpExfw/4idDErJi9ANBw7
	NNq0WU/alvYPZitm8T0cKW+n/djrJDaBrWgecwQpFuHSCx6sDObbUFBO7k/EZlaB51SV003bW8P
	ic8w/d8XjHa8L+bheCLkpu7GFSIfRxe1WFVgrsLeRdB1QlM21ZoZe7ifUQbuoiLD08ynAxPaI0D
	wZTl7Y7fYzYcW78eb96EXs7XZQFSz84lM/MPkZzOtocUFkU9k1DZpbaQHVhqoAUj9DSPb3Ml23Y
	hWUZKiQ1lI3QOtuvawZlSAK9JeDojfiWm
X-Google-Smtp-Source: AGHT+IHvM6xy+FybjKS1IKrh7yVw74Mi4qPHFfz1bqRbdGlFvoJqyDnxRfmhedTPUtTIES8RLYdKIw==
X-Received: by 2002:a17:902:d485:b0:234:f580:9f5 with SMTP id d9443c01a7336-2366afbad1dmr293812725ad.9.1750295083540;
        Wed, 18 Jun 2025 18:04:43 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2366e4d67adsm88122985ad.75.2025.06.18.18.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:40 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 1F8D3ED6530; Thu, 19 Jun 2025 10:04:37 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/13] x86/um: nommu: syscall handling
Date: Thu, 19 Jun 2025 10:04:08 +0900
Message-ID: <bc5a2a14d41add7a2a44b12a21d9ccfa68a6baa5.1750294482.git.thehajime@gmail.com>
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

This commit introduces an entry point of syscall interface for !MMU
mode. It uses an entry function, __kernel_vsyscall, a kernel-wide global
symbol accessible from any locations.

Although it isn't in the scope of this commit, it can be also exposed
via vdso image which is directly accessible from userspace. A standard
library (i.e., libc) can utilize this entry point to implement syscall
wrapper; we can also use this by hooking syscall for unmodified userspace
applications/libraries, which will be implemented in the subsequent
commit.

This only supports 64-bit mode of x86 architecture.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 arch/x86/um/Makefile                    |  4 ++
 arch/x86/um/nommu/Makefile              |  8 +++
 arch/x86/um/nommu/do_syscall_64.c       | 37 ++++++++++
 arch/x86/um/nommu/entry_64.S            | 91 +++++++++++++++++++++++++
 arch/x86/um/nommu/syscalls.h            | 16 +++++
 arch/x86/um/shared/sysdep/syscalls_64.h |  6 ++
 6 files changed, 162 insertions(+)
 create mode 100644 arch/x86/um/nommu/Makefile
 create mode 100644 arch/x86/um/nommu/do_syscall_64.c
 create mode 100644 arch/x86/um/nommu/entry_64.S
 create mode 100644 arch/x86/um/nommu/syscalls.h

diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
index b42c31cd2390..227af2a987e2 100644
--- a/arch/x86/um/Makefile
+++ b/arch/x86/um/Makefile
@@ -32,6 +32,10 @@ obj-y += syscalls_64.o vdso/
 subarch-y = ../lib/csum-partial_64.o ../lib/memcpy_64.o \
 	../lib/memmove_64.o ../lib/memset_64.o
 
+ifneq ($(CONFIG_MMU),y)
+obj-y += nommu/
+endif
+
 endif
 
 subarch-$(CONFIG_MODULES) += ../kernel/module.o
diff --git a/arch/x86/um/nommu/Makefile b/arch/x86/um/nommu/Makefile
new file mode 100644
index 000000000000..d72c63afffa5
--- /dev/null
+++ b/arch/x86/um/nommu/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+ifeq ($(CONFIG_X86_32),y)
+	BITS := 32
+else
+	BITS := 64
+endif
+
+obj-y = do_syscall_$(BITS).o entry_$(BITS).o
diff --git a/arch/x86/um/nommu/do_syscall_64.c b/arch/x86/um/nommu/do_syscall_64.c
new file mode 100644
index 000000000000..5d0fa83e7fdc
--- /dev/null
+++ b/arch/x86/um/nommu/do_syscall_64.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/ptrace.h>
+#include <kern_util.h>
+#include <sysdep/syscalls.h>
+#include <os.h>
+
+__visible void do_syscall_64(struct pt_regs *regs)
+{
+	int syscall;
+
+	syscall = PT_SYSCALL_NR(regs->regs.gp);
+	UPT_SYSCALL_NR(&regs->regs) = syscall;
+
+	pr_debug("syscall(%d) (current=%lx) (fn=%lx)\n",
+		 syscall, (unsigned long)current,
+		 (unsigned long)sys_call_table[syscall]);
+
+	if (likely(syscall < NR_syscalls)) {
+		PT_REGS_SET_SYSCALL_RETURN(regs,
+				EXECUTE_SYSCALL(syscall, regs));
+	}
+
+	pr_debug("syscall(%d) --> %lx\n", syscall,
+		regs->regs.gp[HOST_AX]);
+
+	PT_REGS_SYSCALL_RET(regs) = regs->regs.gp[HOST_AX];
+
+	/* execve succeeded */
+	if (syscall == __NR_execve && regs->regs.gp[HOST_AX] == 0)
+		userspace(&current->thread.regs.regs);
+
+	/* force do_signal() --> is_syscall() */
+	set_thread_flag(TIF_SIGPENDING);
+	interrupt_end();
+}
diff --git a/arch/x86/um/nommu/entry_64.S b/arch/x86/um/nommu/entry_64.S
new file mode 100644
index 000000000000..e9bfc7b93c84
--- /dev/null
+++ b/arch/x86/um/nommu/entry_64.S
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/errno.h>
+
+#include <linux/linkage.h>
+#include <asm/percpu.h>
+#include <asm/desc.h>
+
+#include "../entry/calling.h"
+
+#ifdef CONFIG_SMP
+#error need to stash these variables somewhere else
+#endif
+
+#define UM_GLOBAL_VAR(x) .data; .align 8; .globl x; x:; .long 0
+
+UM_GLOBAL_VAR(current_top_of_stack)
+UM_GLOBAL_VAR(current_ptregs)
+
+.code64
+.section .entry.text, "ax"
+
+.align 8
+#undef ENTRY
+#define ENTRY(x) .text; .globl x; .type x,%function; x:
+#undef END
+#define END(x)   .size x, . - x
+
+/*
+ * %rcx has the return address (we set it before entering __kernel_vsyscall).
+ *
+ * Registers on entry:
+ * rax  system call number
+ * rcx  return address
+ * rdi  arg0
+ * rsi  arg1
+ * rdx  arg2
+ * r10  arg3
+ * r8   arg4
+ * r9   arg5
+ *
+ * (note: we are allowed to mess with r11: r11 is callee-clobbered
+ * register in C ABI)
+ */
+ENTRY(__kernel_vsyscall)
+
+	movq	%rsp, %r11
+
+	/* Point rsp to the top of the ptregs array, so we can
+           just fill it with a bunch of push'es. */
+	movq	current_ptregs, %rsp
+
+	/* 8 bytes * 20 registers (plus 8 for the push) */
+	addq	$168, %rsp
+
+	/* Construct struct pt_regs on stack */
+	pushq	$0		/* pt_regs->ss (index 20) */
+	pushq   %r11		/* pt_regs->sp */
+	pushfq			/* pt_regs->flags */
+	pushq	$0		/* pt_regs->cs */
+	pushq	%rcx		/* pt_regs->ip */
+	pushq	%rax		/* pt_regs->orig_ax */
+
+	PUSH_AND_CLEAR_REGS rax=$-ENOSYS
+
+	mov %rsp, %rdi
+
+	/*
+	 * Switch to current top of stack, so "current->" points
+	 * to the right task.
+	 */
+	movq	current_top_of_stack, %rsp
+
+	call	do_syscall_64
+
+	movq	current_ptregs, %rsp
+
+	POP_REGS
+
+	addq	$8, %rsp	/* skip orig_ax */
+	popq	%rcx		/* pt_regs->ip */
+	addq	$8, %rsp	/* skip cs */
+	addq	$8, %rsp	/* skip flags */
+	popq	%rsp
+
+	/*
+	* not return w/ ret but w/ jmp as the stack is already popped before
+	* entering __kernel_vsyscall
+	*/
+	jmp	*%rcx
+
+END(__kernel_vsyscall)
diff --git a/arch/x86/um/nommu/syscalls.h b/arch/x86/um/nommu/syscalls.h
new file mode 100644
index 000000000000..a2433756b1fc
--- /dev/null
+++ b/arch/x86/um/nommu/syscalls.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __UM_NOMMU_SYSCALLS_H
+#define __UM_NOMMU_SYSCALLS_H
+
+
+#define task_top_of_stack(task) \
+({									\
+	unsigned long __ptr = (unsigned long)task->stack;	\
+	__ptr += THREAD_SIZE;			\
+	__ptr;					\
+})
+
+extern long current_top_of_stack;
+extern long current_ptregs;
+
+#endif
diff --git a/arch/x86/um/shared/sysdep/syscalls_64.h b/arch/x86/um/shared/sysdep/syscalls_64.h
index b6b997225841..ffd80ee3b9dc 100644
--- a/arch/x86/um/shared/sysdep/syscalls_64.h
+++ b/arch/x86/um/shared/sysdep/syscalls_64.h
@@ -25,4 +25,10 @@ extern syscall_handler_t *sys_call_table[];
 extern syscall_handler_t sys_modify_ldt;
 extern syscall_handler_t sys_arch_prctl;
 
+#ifndef CONFIG_MMU
+extern void do_syscall_64(struct pt_regs *regs);
+extern long __kernel_vsyscall(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
+			      int64_t a4, int64_t a5, int64_t a6);
+#endif
+
 #endif
-- 
2.43.0

