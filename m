Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8731EF39E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102178; cv=none; b=KHTa+MNDKLhQImr2q0tWmwke4z5dmq1wckLfzSNLnlOpkB2zBbSWIWoHBPMx2+g33gxpEwWSAC94cTFCy/ku7vffI2aqfFyDqhoi+GfMaU5FrfEGFbJce2gB9RlSUnbU+gZlUnbJVuUcdqsCriSC34Br179LG4vAAfUWoNH1G9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102178; c=relaxed/simple;
	bh=I2SqRts3VUwyOzoRPfNKAEKVttfPnh16xRR50RNsoSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdEQnyaYg5NShGXR5QoDCpoEfxTCkHaKPlGBUfNPMPgYlWJgOuc5FPjEm9f5Tz8Avg6h80KvRZ3sOYd0Gv0zHJj+aCtrjQGB/Z9DqIo3oz0OU9HWvvAzeCgDbPxW9nirmv5ZKXsGra8s1pih+kLIFZMOiptyJqavvn4D9B4siCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hiKL+bb0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hiKL+bb0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so3088109e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102174; x=1745706974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haBpLM2DDViWHZC+WLr3EUnb76m+EmYlOZpo3tV17aw=;
        b=hiKL+bb08VMjS7tvLLQFVAJyfNljewIAjw8bUoZBGXODu/m7JKHMmdz0PN0SAugzMW
         xkFcJPzTZNR327CDDBjhqFRmhAL4AOQEszshQqMRjMlReBN8XMOFAnDu9Kfozdv7P2Qt
         080VDVTnrVoF7sJ7p52xolkDmOq7C2qxRMer2nemACOQI2E1AnPYJdO/lT1x5W488Z2o
         4EVVkGbPhkVxMJwcO0304f2Z3S7/cvXaEKqP4gnS+IbPs99Dg/7NRTIj3sppUqpEbU7D
         /rfb4u+YZRlt14/FmHgZ8Tmd+x0L+bY+lEeEGhGNVaBC4sUdYIVolMh4M1dwv0updGGQ
         +t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102174; x=1745706974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haBpLM2DDViWHZC+WLr3EUnb76m+EmYlOZpo3tV17aw=;
        b=sFLv+M875JHQs0QGmRUAoAyCOZYXXWdFqFfTlTcyKl8++2QmabCZFM2j/4pQzxxn72
         onSvDDdyIchiMfvxY9+SBT6TCX210Y7P6/qGeeVL0araxPb3gmaikknpVYwG5nFmymhu
         x6GJ5YUWIYGUewNVSXoJsCX3kLWvgYL4joYaFqWJQy+kUU3DVEruAlWtRJ0gSdWlpLi2
         ax65xEpRoxYlwYOn8iKR+kPO3b2dIOqzDRAlr09waf06mQqFCX0BYvdaTBLCQuJcPxwg
         1MsPFNRKLXS0L91oWHpaDEhz3WcvEVfV67AnfM8owZv7Y6sB4ednejZE1zXqYqG0XMyt
         X/pw==
X-Forwarded-Encrypted: i=1; AJvYcCXGEBv803V5njCX4/oL9uau9M/Hf0u5yRlp9stxZHyFO1eTj4gJ64LK/vYdf9gclDaat/VIiOE0nAPkF5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxememTV/ruHEym2bQyd5zynoCAye4NACZPhvNCWLU87TxRBNOD
	TqUopAl2WWpl9CaizXMey+wEclOdPaice1EkvM5ONM2oOPqlUQtXmzaqco9cgb0=
X-Gm-Gg: ASbGncsbvf8hET+0L7SdxIKXvgJV11YwztUjdI0w8d1NySGuag5sO1G7PpKJZdBB0hq
	SvqzB+QJEdUkumk3NUssgsydFKRciZXYGkoTTmMsmNQwFzoSf65q1KUwNWiv3oFkSN8LEEbBhF/
	qvv8hxDq2QjE7190K8N1a/6rNIpvxmwoPGdzFN0uSTRtxco1kWQHlq3RfLvyDfqcZQnwoWUkAGF
	Tc1nIpYZ9esGy9jEmcS3sBWxB+Nor6PaM507ptJ7KoxbYaE5EQLbEuMKDX/gf5+B5jkSljUgvIV
	it4EaGBBJPN+hhDJBHOA+rs43StUG5YR5ZPD/tKpaRE1yEJtuj0=
X-Google-Smtp-Source: AGHT+IGVYEfxzTi9voc5pCztNpyTSQ7pQu8il04+sUvFiXGiIYsFbJz8etUwlaq/dGEklq0WmoUWOg==
X-Received: by 2002:a05:6512:12d4:b0:54b:117c:a3b7 with SMTP id 2adb3069b0e04-54d6e66da7amr1884687e87.57.1745102174033;
        Sat, 19 Apr 2025 15:36:14 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:00 +0200
Subject: [PATCH v6 13/31] ARM: entry: Create user_mode_enter/exit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-13-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2

The callbacks to the context tracking will be repurposed
for several uses that are needed on the IRQ transition
to/from userspace.

Rename the macro, establish call sites in C calling into
the context tracking following the corresponding generic
entry function prototypes, despite the assembly macro
names become a bit long this makes it clear to readers
exactly what is going on and where this call will go.

Drop the ifdefs pertaining to context tracking from
the macro. The C calls we will use have stubs that will
compile these out anyway.

The inversion of the signature of the context tracking
calls are especially confusing since the generic entry
uses the reverse semantics: *enter from* user mode (to
kernel mode) and *exit to* user mode (from kernel mode)
instead of the other way around as the old context tracker
code user_exit_callable() and user_enter_callable()
which have inverted semantics.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   | 14 ++++++++++++++
 arch/arm/kernel/Makefile       |  2 +-
 arch/arm/kernel/entry-armv.S   |  2 +-
 arch/arm/kernel/entry-common.S |  4 ++--
 arch/arm/kernel/entry-header.S | 24 ++++++++++++------------
 arch/arm/kernel/entry.c        | 15 +++++++++++++++
 6 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
new file mode 100644
index 0000000000000000000000000000000000000000..e26f369375ca3cf762f92fb499657a666b223ca2
--- /dev/null
+++ b/arch/arm/include/asm/entry.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ENTRY_H__
+#define __ASM_ENTRY_H__
+
+struct pt_regs;
+
+/*
+ * These are copies of generic entry headers so we can transition
+ * to generic entry once they are semantically equivalent.
+ */
+void irqentry_enter_from_user_mode(struct pt_regs *regs);
+void irqentry_exit_to_user_mode(struct pt_regs *regs);
+
+#endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index 69ddf51081f4791982518d37df60c11211b8955a..dd45c6eb8cbdd2595edc4f26026c12b25dd49717 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -17,7 +17,7 @@ CFLAGS_REMOVE_return_address.o = -pg
 
 # Object file lists.
 
-obj-y		:= elf.o entry-common.o irq.o opcodes.o \
+obj-y		:= elf.o entry.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
 		   stacktrace.o sys_arm.o time.o traps.o \
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ef6a657c8d130663e68acd07226815ce8a3fff7d..93a37437a9520118eff411f009e8f6bd729412fc 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -406,7 +406,7 @@ ENDPROC(__fiq_abt)
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
 #endif
-	ct_user_exit save = 0
+	asm_irqentry_enter_from_user_mode save = 0
 	.endif
 	.endm
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f1e48002bd3075ea67b5883178583127fa0055c6..ff1dd3169346f3770cad6b7e218f5d74ffc646fe 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -111,7 +111,7 @@ ENTRY(ret_to_user_from_irq)
 no_work_pending:
 	asm_trace_hardirqs_on save = 0
 
-	ct_user_enter save = 0
+	asm_irqentry_exit_to_user_mode save = 0
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
@@ -191,7 +191,7 @@ ENTRY(vector_swi)
 	alignment_trap r10, ip, cr_alignment
 	asm_trace_hardirqs_on save=0
 	enable_irq_notrace
-	ct_user_exit save=0
+	asm_irqentry_enter_from_user_mode save = 0
 
 	/*
 	 * Get the system call number.
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 52b4fa97226dbfa4b55aca8eaf74ae24e1e220f8..fb5bb019199b2871e29e306a29bea8fdf47dd7f3 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -362,31 +362,31 @@ ALT_UP_B(.L1_\@)
 	.endm
 
 /*
- * Context tracking subsystem.  Used to instrument transitions
+ * Context tracking and other mode transitions. Used to instrument transitions
  * between user and kernel mode.
- */
-	.macro ct_user_exit, save = 1
-#ifdef CONFIG_CONTEXT_TRACKING_USER
+*/
+	.macro asm_irqentry_enter_from_user_mode, save = 1
 	.if	\save
 	stmdb   sp!, {r0-r3, ip, lr}
-	bl	user_exit_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_enter_from_user_mode
 	ldmia	sp!, {r0-r3, ip, lr}
 	.else
-	bl	user_exit_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_enter_from_user_mode
 	.endif
-#endif
 	.endm
 
-	.macro ct_user_enter, save = 1
-#ifdef CONFIG_CONTEXT_TRACKING_USER
+	.macro asm_irqentry_exit_to_user_mode, save = 1
 	.if	\save
 	stmdb   sp!, {r0-r3, ip, lr}
-	bl	user_enter_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_exit_to_user_mode
 	ldmia	sp!, {r0-r3, ip, lr}
 	.else
-	bl	user_enter_callable
+	mov	r0, sp				@ regs
+	bl	irqentry_exit_to_user_mode
 	.endif
-#endif
 	.endm
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
new file mode 100644
index 0000000000000000000000000000000000000000..8b2e8ea66c1376759d6c0c14aad8728895b3ff1e
--- /dev/null
+++ b/arch/arm/kernel/entry.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <asm/entry.h>
+#include <linux/context_tracking.h>
+
+noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
+{
+	/* This context tracking call has inverse naming */
+	user_exit_callable();
+}
+
+noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
+{
+	/* This context tracking call has inverse naming */
+	user_enter_callable();
+}

-- 
2.49.0

