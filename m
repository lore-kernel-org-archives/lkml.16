Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E45221DB9
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628016; cv=none; b=sBna7cNlhNH2vO0z02JSbWebaHJxHQ/9FI9RkxGNmVZdT9//aNsiCU/nfWeNfs4Wjl/HkZgiFfkya94ku+1OI7qbg6WOdnq4KoZ6Dk6++8ijyHiJ9wwe40szKqm1BhVi3GxA9uzyeKPrhTuKcsOGtZ/eY4B7jRfDkunQr11WR0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628016; c=relaxed/simple;
	bh=yMx3RnJmWQF39D3YDn4nS0qlnS46T4/ZbrLmkWs9msA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GiOADQ6vsZq4F+5ea4ZeSi1m/AEByxpUXGsas2M+4Kcq1NI1ebkcdetRsuc8rNpZw6Tf3GffQMKJ7d54OOLOoQa/LMcjE4rjYmM4FlvxLqdD+UzIHQ/Pm8vXRAXhoa/QqLZUCgePahAh6cv57jM8/mnoscqXTYP8l5osllOij7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW7td+an; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW7td+an"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234bfe37cccso45271745ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628014; x=1751232814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWmA09AalrKCKqNdOimE9etFAWoYaJVH+yPCouYXbe4=;
        b=EW7td+anAoFktFdhJGPriv9B6dB4f4U5ERGE4xy+YZWTsHmUv483vAugT1oRjNnGfj
         ktoImR2iGgsKfG0Bbe5uvlO305UTHEhRQn6f6shJ+HUEMupzh7A5p9oRyGE/30j1rtdK
         Y3glXJKainGvakPjk0aHMHkmQzJu8TwuFDZWlx7TyZJ2kBcZeucn/Wb3Lwnlz1Sxle3Q
         adox0/lMEIrbfGBT9rAhIUx9/bQCYJH0uZihUW6dDee3iEdAA0Q8oOH5xmBPsu4NgoyI
         aaKyG9u1b/AV6pz90kKe7Hv/L01mLbK2buVqzGihkMdMGkpdLEfiZPD1+uv+fQ97oqni
         s+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628014; x=1751232814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWmA09AalrKCKqNdOimE9etFAWoYaJVH+yPCouYXbe4=;
        b=uyxZRrFMOvg63RFGgglBvcOb8H2lSZPcDSUDnyU7waCXnRCbnymldj8XfPMt5nHBfi
         Qcs74LsahZCEPK+gGM2SpUYTfqsNY54cgb+bZvc0f309vB0P/5NRD4i8JFMDBiWE/Y/k
         cM0qoOeYTu0ePx0uQscbJKCexjJ2VgWvRX0lrpe/XeiZEDU5j0hL+RutPKG2+fzsKbPD
         VQgjxfo+qrQ7l6a40NGrSZaABDG+v9H9G+L+8TpaffzXfhia5fN/pLGm2NR4tRoaOYmG
         EYcwNBygb/n4qwupLnBl3dGz4OyA2KT0u+DAXn7WbWQunH5cPN+1gk5yzgy+yzf/p3/r
         8MMg==
X-Forwarded-Encrypted: i=1; AJvYcCWbQzs0navIBikJ0aJ3qVEjVZUvMWAvdanUIqcdNAYojsvH534Yp6jdsHAD/C6dPwxJ05TDV0YUo0OxUNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqpfC102hX12bWLMZcCHxzVclti1wRxsF5RnFjg8nzXm2zPH7
	GWieb5OFRQpWU27T8QytM1RsJzowLLVq4zpK9S6l1Dx3Ybr0DZX6vRlK
X-Gm-Gg: ASbGncuAy88yLN5kCwFk9PGxbeJsN+JdDDSRSbxNmpv3GBRGade+ms5hMETE0Q0o2fj
	UPpnVDvHs8SmHkvgpbuGCEOjiIJrLWQN2uya6H8AAfwXDkOMAr8fL5wYgg0dmHhWz6xipgOiw8+
	xLy1oSQ7aaWBwmIOl+aFt48VfODvvpIiR84dlgRTEXd2qxj/o6TB04T5k2xokMQ3hZ6ySp7+3OA
	KH8Ka0ix5ijty84vHRxzN8ShqIVfBktgtPG5vkFrb4+FGQoPeF6PnNQzVyP4zoYjF/roCo0qbKx
	yB9ouLwhg8YA+M7UMu/pd+x08D5SGHj4FC14QYV8ZTgc0jHW00lcM4Sl1CNWYdahG0Yl8GmGMcA
	Cakwznc0mu/cC4XF0kgz1OgDRgJFSXcYO77aPL8iz1M0=
X-Google-Smtp-Source: AGHT+IFahGSpnoHBpn2Cds8cB3SpBCFDv0BojRPvfSRb4pA+F4Lk4gBS9gdDKoH1fQRiUwr1fYoqQg==
X-Received: by 2002:a17:903:1aa7:b0:234:8a4a:adad with SMTP id d9443c01a7336-237d98f9968mr163441015ad.26.1750628013744;
        Sun, 22 Jun 2025 14:33:33 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83936e1sm67971125ad.5.2025.06.22.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:29 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 5F881EF1EB0; Mon, 23 Jun 2025 06:33:27 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 06/13] x86/um: nommu: process/thread handling
Date: Mon, 23 Jun 2025 06:33:04 +0900
Message-ID: <92ad19005df45ac15452be94c9cb522c87c8ee1c.1750594487.git.thehajime@gmail.com>
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
 arch/x86/um/Makefile                 |  3 +-
 arch/x86/um/nommu/Makefile           |  2 +-
 arch/x86/um/nommu/entry_64.S         | 22 ++++++++++++++
 arch/x86/um/nommu/syscalls_64.c      | 44 ++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+), 3 deletions(-)
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
index 000000000000..e88e93e9d80a
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
+	 * The FS_BASE registers are saved here.
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

