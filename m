Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D81D63F0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295089; cv=none; b=kdnxDyMySaY8xkMp1QQQcLTocIJ6MkCZRkTov3nGmsEIwpYCdgWoVRSZpKCsyipv29AMQV/s9zJ5UFJ0/mIsFhHdSYjuYaPiScFGSUFkP7nmkmTe8kCFPNdu3NOYpCbspNykCrEQU7WoMVvvw0CURpIQkkFmv66V5sH+1ZDBFnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295089; c=relaxed/simple;
	bh=AdjiadfNdikwR+Cvww+/ONdcJ2psLy/wXdOHlbBBnww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/vN46qnVuN1FAV7ECaTMiQKqO5vcXGCCa2x7mKRdMlzJu2DwjXr14SH9MmxFGcU84AE2Bwf49MuuYOJMmgDVcZJ8yyhKjQMPEpjlf90p7PA1CCR2Kp8ogU/vqRKlXtS2fDRxrmcyGM48hJLfcIj2D1nY14fH7XHoMKwzEmnXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0ZYGF4X; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ZYGF4X"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234d3261631so2029675ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295087; x=1750899887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1JpwCKV9cSghAwgpJmSpCtGipBuaO2tDQC5fW0CSv4=;
        b=b0ZYGF4XS1+bEz/0Xk/CGoQxyBpy/aPue6MiHCezZ1TLridsgi6IdOgrAZnEDzb4e+
         yqeivIvHsbE7KPO1SxXl5XoxhHbsqtEaz8N2T1xX56RGqFeujBkwZSUokmYxDkuMOCfO
         F4T3gzDzI7JWp6gwynapcSDpQHl8zbmHPE8446xEm6LQCyKXAEeWUhSygy3xb7112lel
         bcLSb109NKhpwgtCfj9ATfYH3/y2GyGeF3xtyXKhOiNAqWNic463f6mKqyVUGUNoiv0v
         md025lTBI0nI4GKlHLwRQ5mZLUnbfugfInYndulMUgd+UJBNPHhX9Gtjx/iRE1nx1rAF
         ypPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295087; x=1750899887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1JpwCKV9cSghAwgpJmSpCtGipBuaO2tDQC5fW0CSv4=;
        b=UGg+cQPwHWrkrntD303+Ye2p+2kfoycf8WlHw+jxcBkk44rYKz8MiKUO169cByffsF
         jO4eKlaHl8dEpex6wFx1bS7w5HuQEKx+rujmTy/oHyiJ1ndF6QuByIygQsOcpyb2FI0j
         l9LsEogWPYfCDXdYv421j9/Qsxwdm5bLdvnnXyudReCtMX4pxI4jPLV155/BWV4LZAQb
         wGH4Ggp020Nf6+n5szZgpTO4yIlBxuFyGHOFyLPfPwhiOi8agMJNTaLF1ybD9hoTpE7Y
         t+FQCk7aU7gPGJ7bNL1PVnuZ7YLy6xf+xwO1oCaJlI4j3eXYvbJTfmiIezEOHEaYA9gj
         sZcA==
X-Forwarded-Encrypted: i=1; AJvYcCWDD9QoN/PHwhSygGB1zTMiOuPdyU5Dc8Mwb+YnnLkoCQiyfc8cu6mJzJb4fRxd961N3VN02WOH7m99CgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYCY/QgbBBW29yR4U5r93hPWgyTgtYR6r0aZN/65mm+TwnIdXJ
	zOq5kHxHeGMDbE+kaQ2JO291SI2Xs6gsclIZHcPVhGlbCPiI/KQFz15lOO0PMQ==
X-Gm-Gg: ASbGnctXzQwoeJAM78eUj3N4F45lZ29vYInahGGFMC9yS9jaBhtEfLKYdYaNXEbbjtB
	hup2b5sz5S4wjrqShPKTWm5EejqsOCeXRvVrcI5zGHeqoGol3P3YOhZ5kPu0lCgeZvscPG4RP9n
	V39k909kUbliQ1wolN7q6E0JE5jdTYNjoN7rykA0NVFh27eqJlj1KqJgv7LqlS6BmV+StfnUlBY
	ZTNDpxN4RvuuXNwxWeJ0QihbLj0ZsysHcXsw67yCDd2YJpVv+0TaiL4/jAE7FDgOcVUyDM9JjeI
	xGUxrhClcNOz0j0MhhSjHZrjmV6Pk3DSIs6U8extf9ufg5vSf6+VTjeqw6KYQYO3h9/dxwxWm8C
	Khvf0tSGC7s1U/nA2hc/S9+6goDs9IF+0
X-Google-Smtp-Source: AGHT+IHDigGDVi6Llb6rP2JHFHMbl9WEBfHRUW50U+jgVpWh5ds2qZPmAqsuS7zCc3upwEx3RuRZdg==
X-Received: by 2002:a17:902:e805:b0:234:c65f:6c0c with SMTP id d9443c01a7336-2366b00ed66mr294160555ad.15.1750295087364;
        Wed, 18 Jun 2025 18:04:47 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782bdsm108126865ad.113.2025.06.18.18.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:46 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id DD028ED6534; Thu, 19 Jun 2025 10:04:44 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 06/13] x86/um: nommu: process/thread handling
Date: Thu, 19 Jun 2025 10:04:10 +0900
Message-ID: <031503649a24799bff082cf917c36550f4820181.1750294482.git.thehajime@gmail.com>
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

