Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED21E2613
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987274; cv=none; b=nJPibI8rZTFK4pPWIB7hhg+vBQ2iNM3vitrHeiw1OEpDfI6O6eCNGpq94b9LRUwv2Bcy+I3xU1rpup5fzT9zWiXeJZ1mDf/Q9B1cENBWfwddpK4ppiKpf7YYhqG3VfyEmbadpnGshLTvkkOIJx3qv5E3Gd7LIfun/8RFZ/V8lqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987274; c=relaxed/simple;
	bh=pRI1lMDDqWLaTBC/3kskcvEDE+HR1dGRP/QuNgv527s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNsL0lZJGZ4qApUUHyyumfFxvr5uy1q7Zbgr4G7zNq5nA/Q694auUwyz3iIw81A7R0JY1QtLaYSOxeMQ2GwjYOLAoE1QrOtTYsH7ZAP5CHDTlUsXAPu86JrNMY2muQx4Nisun0LfqNJlczVOW0JJ19BGsjz/m8uwVMjHa7DylsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHUDrrxI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHUDrrxI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22409077c06so109264305ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987272; x=1746592072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5NKRA2Vd8iUo2TNfSXqtZxbhUvo/xKWVJfwrs+7skI=;
        b=gHUDrrxIV2x9A5WckWMH0ENTEh/MamDOXC1yhzlEzXw+IWPRmT3lZEkrlgmaVQp9L6
         x1MXZm9MukquuyP8+ui2RK+ZOlq/7ECxqenT+D1r4uxpAnjby5gQ0e6XjFqiIobwl3gj
         +QmtQxsjvsQQc5GJ0bqYKFEMUuPsU/2etovLnGhCzqT6Wo98azqs0XblV1lp1LdPBzOM
         QP8+U+9Vo6su456L5kiEdt6bDdKppgm6WzgN/i0KOcdE99vQ/xxI4imIPyMmBouGbzIB
         Hom4CA3MWVgvQXq7Po4bQKCw4TqrX8W2tOFF0QKlex0D37Bx1ArdycON6nFLKDN3SQhK
         CvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987272; x=1746592072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5NKRA2Vd8iUo2TNfSXqtZxbhUvo/xKWVJfwrs+7skI=;
        b=nYgFFTIsobPguxQlzmlA3fO1hf6LxHiGlGCkNUQahzEnnkM6Fog1nLyeEB2nXZvm1E
         pFYVQx2rGhsFYDQTVFBKUvno/aRJmC8IvFVcZJpDgf9Yi8GNGmaXcOQ4C7UwUQbQakKv
         QP4gdmzsmCX5rmz3qPD87iAB9PlXxVg6sXfTCVcHKpWvjY2B+nSR/5XDmmMdzKQb8COK
         bKYte7B/2poSqKSmNzpYsrFxMnNgbc0C8RYa/GJMjB05u32uUxQWGbylQMUFXCzMOA+l
         4NJwmXAV2t/YE92WEn6aneuDtCgDQKgkT14XT7W113l0pZp9b9o6iVKniVYFTb6PUx+s
         AZCw==
X-Forwarded-Encrypted: i=1; AJvYcCWuT4SmrHMtaO5OXIbITCHgZwsmTIcfq9i0QVz/F08FrGzz3ZKL9COxZj4IS/W6yk4ipHF12zmpCf2K+Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWZSeSsli0JN+NmUAmXjFupnb2oB5t535oHn+fUTilGwhnXA4
	F+nJSPn69VDPUYNfhOEmR1jU/a/NSPr3dYKJT3Ywvisl6u7laJj3
X-Gm-Gg: ASbGnctjjqjphbHIg2QrI3DCQzjeDGzIDlN9M4MFh7JedGa3Kyb3q/jDlWpoXR1kJk3
	pbeZYRX5Si05cWa7rW0xp3p5mVshIfZbCumduIdweZwY4EpVsiw3WWaWgqa4ablu2caIVj+z7C7
	hU1C+JgXSf85rAxvDmuDe4POw9Vzlne+Enbtom9h1gkplfJxrq8EYAw5/P4tzjj9JkFDU1IAFMH
	DtDaxiYhc/vfV8uPG++91SCCGKDIZrbaT9RDmlVsPuD45IMQyAlWsx7uHIsBTYK8ajnMf8JaSf7
	di+LikxbdUgOb+gMEatOQkvnTVq9dm5GJ1NL4UZ79b+F/zgBKu80dMPBWDoou0tQvc7d/7Xl1p/
	lAasjBTALZV4=
X-Google-Smtp-Source: AGHT+IGOxIjchaID2CDqMQJI7v4ig2oBAAKA/o5gORT6xH9R/bvvse4aK4O3R8Prfqt9cmDnq/3Z6A==
X-Received: by 2002:a17:903:298e:b0:224:1c1:4ac1 with SMTP id d9443c01a7336-22df358f9c2mr28149925ad.47.1745987271755;
        Tue, 29 Apr 2025 21:27:51 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a33sm112187705ad.146.2025.04.29.21.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:27:51 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id C7F08E9481E; Wed, 30 Apr 2025 13:27:49 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/12] x86/um: nommu: process/thread handling
Date: Wed, 30 Apr 2025 13:27:12 +0900
Message-ID: <71d4afcd72f3ea4a513c012c8bc6db04419f57e9.1745980082.git.thehajime@gmail.com>
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

Since ptrace facility isn't used under !MMU of UML, there is different
code path to invoke processes/threads; there are no external process
used, and need to properly configure some of registers (fs segment
register for TLS, etc) on every context switch, etc.

Signals aren't delivered in non-ptrace syscall entry/leave so, we also
need to handle pending signal by ourselves.

ptrace related syscalls are not tested yet so, marked
arch_has_single_step() unsupported in !MMU environment.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 arch/um/include/asm/ptrace-generic.h |  2 +-
 arch/um/os-Linux/process.c           |  6 ++++
 arch/x86/um/Makefile                 |  3 +-
 arch/x86/um/nommu/Makefile           |  2 +-
 arch/x86/um/nommu/entry_64.S         | 22 ++++++++++++++
 arch/x86/um/nommu/syscalls_64.c      | 44 ++++++++++++++++++++++++++++
 6 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 arch/x86/um/nommu/syscalls_64.c

diff --git a/arch/um/include/asm/ptrace-generic.h b/arch/um/include/asm/ptrace-generic.h
index 4ff844bcb1cd..a9778c9a59a3 100644
--- a/arch/um/include/asm/ptrace-generic.h
+++ b/arch/um/include/asm/ptrace-generic.h
@@ -14,7 +14,7 @@ struct pt_regs {
 	struct uml_pt_regs regs;
 };
 
-#define arch_has_single_step()	(1)
+#define arch_has_single_step()	(IS_ENABLED(CONFIG_MMU))
 
 #define EMPTY_REGS { .regs = EMPTY_UML_PT_REGS }
 
diff --git a/arch/um/os-Linux/process.c b/arch/um/os-Linux/process.c
index 8a615875d1a1..3ac01881e905 100644
--- a/arch/um/os-Linux/process.c
+++ b/arch/um/os-Linux/process.c
@@ -28,6 +28,9 @@ int unscheduled_userspace_iterations;
 
 void os_alarm_process(int pid)
 {
+	if (pid <= 0)
+		return;
+
 	kill(pid, SIGALRM);
 }
 
@@ -45,6 +48,9 @@ void os_kill_process(int pid, int reap_child)
 
 void os_kill_ptraced_process(int pid, int reap_child)
 {
+	if (pid <= 0)
+		return;
+
 	kill(pid, SIGKILL);
 	ptrace(PTRACE_KILL, pid);
 	ptrace(PTRACE_CONT, pid);
diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
index 227af2a987e2..53c9ebb3c41c 100644
--- a/arch/x86/um/Makefile
+++ b/arch/x86/um/Makefile
@@ -27,7 +27,8 @@ subarch-y += ../kernel/sys_ia32.o
 
 else
 
-obj-y += syscalls_64.o vdso/
+obj-y += vdso/
+obj-$(CONFIG_MMU) += syscalls_64.o
 
 subarch-y = ../lib/csum-partial_64.o ../lib/memcpy_64.o \
 	../lib/memmove_64.o ../lib/memset_64.o
diff --git a/arch/x86/um/nommu/Makefile b/arch/x86/um/nommu/Makefile
index ebe47d4836f4..4018d9e0aba0 100644
--- a/arch/x86/um/nommu/Makefile
+++ b/arch/x86/um/nommu/Makefile
@@ -5,4 +5,4 @@ else
 	BITS := 64
 endif
 
-obj-y = do_syscall_$(BITS).o entry_$(BITS).o os-Linux/
+obj-y = do_syscall_$(BITS).o entry_$(BITS).o syscalls_$(BITS).o os-Linux/
diff --git a/arch/x86/um/nommu/entry_64.S b/arch/x86/um/nommu/entry_64.S
index e9bfc7b93c84..950447dfa66b 100644
--- a/arch/x86/um/nommu/entry_64.S
+++ b/arch/x86/um/nommu/entry_64.S
@@ -89,3 +89,25 @@ ENTRY(__kernel_vsyscall)
 	jmp	*%rcx
 
 END(__kernel_vsyscall)
+
+// void userspace(struct uml_pt_regs *regs)
+ENTRY(userspace)
+
+	/* align the stack for x86_64 ABI */
+	and     $-0x10, %rsp
+	/* Handle any immediate reschedules or signals */
+	call	interrupt_end
+
+	movq	current_ptregs, %rsp
+
+	POP_REGS
+
+	addq	$8, %rsp	/* skip orig_ax */
+	popq	%r11		/* pt_regs->ip */
+	addq	$8, %rsp	/* skip cs */
+	addq	$8, %rsp	/* skip flags */
+	popq	%rsp
+
+	jmp	*%r11
+
+END(userspace)
diff --git a/arch/x86/um/nommu/syscalls_64.c b/arch/x86/um/nommu/syscalls_64.c
new file mode 100644
index 000000000000..c78c442aed1d
--- /dev/null
+++ b/arch/x86/um/nommu/syscalls_64.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2003 - 2007 Jeff Dike (jdike@{addtoit,linux.intel}.com)
+ * Copyright 2003 PathScale, Inc.
+ *
+ * Licensed under the GPL
+ */
+
+#include <linux/sched.h>
+#include <linux/sched/mm.h>
+#include <linux/syscalls.h>
+#include <linux/uaccess.h>
+#include <asm/prctl.h> /* XXX This should get the constants from libc */
+#include <registers.h>
+#include <os.h>
+#include "syscalls.h"
+
+void arch_switch_to(struct task_struct *to)
+{
+	/*
+	 * In !CONFIG_MMU, it doesn't ptrace thus,
+	 * The FS_BASE/GS_BASE registers are saved here.
+	 */
+	current_top_of_stack = task_top_of_stack(to);
+	current_ptregs = (long)task_pt_regs(to);
+
+	if ((to->thread.regs.regs.gp[FS_BASE / sizeof(unsigned long)] == 0) ||
+	    (to->mm == NULL))
+		return;
+
+	/* this changes the FS on every context switch */
+	arch_prctl(to, ARCH_SET_FS,
+		   (void __user *) to->thread.regs.regs.gp[FS_BASE / sizeof(unsigned long)]);
+}
+
+SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
+		unsigned long, prot, unsigned long, flags,
+		unsigned long, fd, unsigned long, off)
+{
+	if (off & ~PAGE_MASK)
+		return -EINVAL;
+
+	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off >> PAGE_SHIFT);
+}
-- 
2.43.0

