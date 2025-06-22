Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE81EF38E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628013; cv=none; b=B6xVYg+iNap4u6UIWMKE99yahjJFCRTtmKsCraQCduXXVJIjWGR4Jvxiimra2OLwHvjIug0KVFQqHJS8sbqPp8+Q5F+H1TqWBE4eA/Gyxt83T6b53Y8kzFLypEnFRzE+6fs53pd+Zl4KTZRxmhehFin1majAIkZUn17odG4FHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628013; c=relaxed/simple;
	bh=NtZJ+r2oFr+SH7wwZMO5qJK4wxp6UgcrPaIyCGQHA7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnsb2aK3Pz/8+5koy/uQ6t0nDD28NdxjfV/G5QkVmXI8SIQ/IUvPuC/MzDA4OVb2BVfDqWUlg3CDaak8yD2znD5sKU3zytC2fNgSIg73pna0z+wAUxDcb7fFfLgEJXSKYBCfhb8JEuxXHkjG2ov4iBVmu9k8wiZqEQUyqpiAe/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjSeh21o; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjSeh21o"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so2693912b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628011; x=1751232811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RAxhnmhedCbVcYMwch2f12BZ7LCLjFr4NInIHPP8YI=;
        b=YjSeh21ofc+wqPz4/DaycKfzULK/BxCLFK/J3Mgjn392cgJL3W9CWETDXgnjPQfh9t
         0ustbxE0nuLFp3lbsujDLg+7vwQ+OYd5n1AInQ+7oAB8QyuUs3Fmp/y1qK0zYj0fkl7K
         5BsTWlkPlB/sGa4LpjOFMNjsBXLBiRITveF/5+/F3TiEdZn8lqip0V4bg8+u7xl86yKv
         +vndvh7EnqeYtvr0wpZQ+Y18lwKUyuh4iVtkwmN1t/PtyXOgejW4xK8wp+3qAsjLNNEH
         m6Z13OJlFtRUsswZyA1zVdrb3RiWb+PqSJRzTbHKo/wAQ6Q9SinJh1NKc79ph7OR0H34
         CHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628011; x=1751232811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RAxhnmhedCbVcYMwch2f12BZ7LCLjFr4NInIHPP8YI=;
        b=aLWjbHTSi2HSRBbIPod+wqK+p1nMaoRhUWQEUxP429YxtRQiGQZVMjbLksuqkriHlM
         O0buvxJO735ln2iffWx2fw8xzvXNBtyPKtgNGEYTF7VxRr1o6by9cgl+PhsnbLhVfdeD
         TyrtGkQ5EAY7a0Qq1T08Ear8lv5EwcR1wmzB/mcKowd7Muv4pGEy3B7Jvj6mNSdOINYz
         7rVKkdLnyLBo6JG7OizndnLBgGraWvfEq5PpnhQPJlb/o/bhF7UU6ew6Xmh7m/f0yfMf
         ys1Vrqpz7GhdxNbEMo1uXftY6VPnUbv7u2/Fr4eVxp5BfSDlaKsQTOkcjcykcz4CtT8Z
         Z40Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnpEfprfquZE50Eb5yRXTIHkurTL+gkxeuq/1YSZb2APowQ+or1JOvlacKRP3VwWYT3bkl29PGmPk5F40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34ZwCcg5/B1gWrhJJOUY90XzLRBvGPKo/38kTKlMDO9LqVLvW
	O/ApuLyoduz3ZYJpZMevbwfI06C/Waz3CPpCdZsAuNCfcH+lMzIDSlfh
X-Gm-Gg: ASbGncu+zfUNviG2PYwkYd/u4XRTw+IDoB+wuWW9PgKh8HXvEQ8b6NRVfoinWFU+99e
	3v6b2oFXt89ZmTVKOw1KK6rKyVNSK1keuQZopfIGWqfJ0TjfJxn/xaVn45pyPSrpq5nhqwG9/zM
	/1aPLtsK3eS412p93nE2qPWpdnAnSaoreZU+QAvIdfjMKNocd3lCi6/ArQd+vqBf8/5WfRmY9Mj
	IJOY3/5geEBFPtc2Cqz9Tk0s7jCHh52Ak0SvfPT2IbKO9JMM/hAJ74ZZWmFbt3R1P7z16+ERKGL
	MUUK7HldAE8013avtCS+Sm7Ggzi68j9dJvkplwG6SPnixbdVQ5IwRZPdrvAM1gK/l4ktgwlX5o7
	EhmVeE+oItpkPOQH2CF2Ao54WDrLvxIhL
X-Google-Smtp-Source: AGHT+IFUHlTqUevwTXQzSa064MISHkFpoSR4ppWu4XfsTFKtBWOzpZZHg8+BGawYS5MSiaj7gUKlUA==
X-Received: by 2002:a05:6a00:2e03:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-7490f548544mr13040845b3a.9.1750628011304;
        Sun, 22 Jun 2025 14:33:31 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a621cd4sm6859224b3a.105.2025.06.22.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:29 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id A38BEEF1EAC; Mon, 23 Jun 2025 06:33:23 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 04/13] x86/um: nommu: syscall handling
Date: Mon, 23 Jun 2025 06:33:02 +0900
Message-ID: <c208f207a42a5d7ae3aa15de94ff372f9d755630.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
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
 arch/x86/um/nommu/do_syscall_64.c       | 25 +++++++
 arch/x86/um/nommu/entry_64.S            | 91 +++++++++++++++++++++++++
 arch/x86/um/nommu/syscalls.h            | 16 +++++
 arch/x86/um/shared/sysdep/syscalls_64.h |  6 ++
 6 files changed, 150 insertions(+)
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
index 000000000000..6b08daab6afe
--- /dev/null
+++ b/arch/x86/um/nommu/do_syscall_64.c
@@ -0,0 +1,25 @@
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
+	if (likely(syscall < NR_syscalls)) {
+		PT_REGS_SET_SYSCALL_RETURN(regs,
+				EXECUTE_SYSCALL(syscall, regs));
+	}
+
+	PT_REGS_SYSCALL_RET(regs) = regs->regs.gp[HOST_AX];
+
+	/* handle tasks and signals at the end */
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

