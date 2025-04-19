Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3161EB9ED
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102165; cv=none; b=PXu5bsRqu/CBxX+cXmx2tLpMr3bHKYCeEnYOIHozO4KIJqOTk+/5Myaub2mIfziDTd3mHByiW5YHut7A5CpLOTa+j1P1GpE80xsRPCO4miHgAUc52xNiATMA9llBtTupUiz2u1+eKf9xPivCqxwARAgvG4Lh/BeVvChkqOgyqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102165; c=relaxed/simple;
	bh=x51ftGxFUB9O1hqt7z81KzMyFEFQ3AVXRy2zKxRqQ0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRqz8TDYX65EM5obGHVCwKIwFXLNNOkTEoEa9JI/QCPZYG1K2VNrm5JwzH8kTflkdgfPo0lFwK0v/xkbW1fJLooqhEL3HyyJCrqiMroqBMAPun514oMUtszMFY8B06JEvCaSCoAyZiHVLcop/DQ+V8g9hCiXsEQabVzOOxhWFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8ZgwVc6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8ZgwVc6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d65eb26b2so2640466e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102162; x=1745706962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGj2mqpewSEqRb9t6DrzjDdnFip55vEOgyWPwRrWkco=;
        b=w8ZgwVc68SkIG+MVpRpd1e+aMB2a7pvY+PVaSrSZJXNOjTWhvhzDmCP2ZDauikF47f
         79ejk83UWqMoTyR18PebjeemizUiN+X5IaZ277L1nCR2tYJcx174AXcTzpQFioaTpoPc
         Xm7vjt3DOGqlWAh2QDcn3HxQ6WGVz9mNLIsy4yVgw9fb1g3l4FC32lcTYEJ38ZiwNMJ0
         hVnQwCIJFrPcNLe7B0F7LGJcgKnT3aUGQ0ENgqwIXRfNNSIXz9SIqi1GK6zYICzeeKRm
         1/uq5nLtRhwUgUd+yvoaiFqznUJcD9S0Mt+P9VI9P7fV2LXjyOwmMMTHXT5VdcRnjMYg
         TdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102162; x=1745706962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGj2mqpewSEqRb9t6DrzjDdnFip55vEOgyWPwRrWkco=;
        b=OiBFirg8dTunDCbcpa49znegohOnmekxFaKbwllXtdEXAeZbOJa48nUzw2fRHh8VVy
         l15u2At4f1FC495shQ+91nYZkyu6Qlx30Jt9aLJd/4cGLlLkcDvC6kT37IcOeIbNl7ey
         2vYQzidvGl7iUgAOmOAHZ5tHlEGSXBRvvv0Vd+m+CLkA6ihGG/IQYwZWeRZtIqgCDtet
         sJWVl97s2Fv5APBz+dbzEzS/3Uza6iESJNeX9WBrUO1bUGxi9mJlbanzkJcMXtwaMnfN
         jkizHwg82BZcEfk1KcaU1COF4j1VI3WdLXLi/avjZBprS7kgpfWwJeCdHYanikR6jtBo
         Q2pg==
X-Forwarded-Encrypted: i=1; AJvYcCXPmXtUa07hntB4WtJE1Af/BWYnGcKVAX4xTHPcooziXtIaVlT7dxvGKHOsvoeALcqFcctYrGp3HBN5FWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXYFYbuWDdFkH9P0S8h4SZ/XeGEa9K99Y0duUyq/OxwK+gtIL
	erHUK9eh1codXg6InmpaVlYU3Qoj+yu/QYMYVd7nIVixkMSErT9QjyJBe+fm+eg=
X-Gm-Gg: ASbGncsJGJrMMfeewRyR/d8L3iudaybqxRy0YKcAdf9UZDDqeztXiLWwmlY1/ZHfHPW
	TxtQ268W7nVeBBeTLcwVu1VN7pr2wwNt9bJHdq3btj2r5bpGh4wEHGBTuAOz1ZkiIOZ2QWI7c8x
	4UifOFrY+JMpuZv2LV1lZN4VckH9svOxbZcVzAr1u8iCbt8O2p/1apVXk3z9L/8qLu7vDmAkuta
	qY4ha/beFNSdHZ0hqviARCEfGmiX57KgOeTxhldhOEHcCsy9PJ32+tQGtW5UsV444UO0vHNTr6L
	w9s3IKyIt/Ej7SQRuR8y9K9DWuBOWYwqZ7F7UQdUO+bVReUzmMw=
X-Google-Smtp-Source: AGHT+IEgRdGrAKuD8P++6CqHoCvgvQ5QEk0YY5omU/4y6fTVMIpqUi+sqyaRus7zaV38Lo9BtOSCaA==
X-Received: by 2002:a05:6512:3e16:b0:549:8f15:db36 with SMTP id 2adb3069b0e04-54d6e675800mr2197914e87.51.1745102161596;
        Sat, 19 Apr 2025 15:36:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:51 +0200
Subject: [PATCH v6 04/31] ARM: process: Rewrite ret_from_fork i C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-4-95f1fcdfeeb2@linaro.org>
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

Move the direct assembly call to schedule_tail() and the
call starting a kernel thread into a C version of ret_from_fork()
in process.c and rename the old ret_from_fork to ret_from_fork_asm
following the pattern in x86.

Leave a comment on what we will do when we get to switching to
generic entry with this as a base.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/switch_to.h |  4 ++++
 arch/arm/kernel/entry-common.S   | 22 +++++++++++++++-------
 arch/arm/kernel/process.c        | 24 ++++++++++++++++++++++--
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/switch_to.h b/arch/arm/include/asm/switch_to.h
index 9372348516ce9b80fa713966943d0bc622e86066..18d084aff5a4faa7cc5e40d48fbc4aa97a89b0c6 100644
--- a/arch/arm/include/asm/switch_to.h
+++ b/arch/arm/include/asm/switch_to.h
@@ -17,6 +17,10 @@
 #define __complete_pending_tlbi()
 #endif
 
+asmlinkage void ret_from_fork_asm(void);
+__visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+			     int (*fn)(void *), void *fn_arg);
+
 /*
  * switch_to(prev, next) should switch from task `prev' to `next'
  * `prev' will never be the same as `next'.  schedule() itself
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 2f93c2f6d5b8fdf6aaf3dda0192bde144fcf238d..df6961a1006b7a0f3522728812bf52ccb849e511 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -5,6 +5,7 @@
  *  Copyright (C) 2000 Russell King
  */
 
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/unistd.h>
 #include <asm/ftrace.h>
@@ -128,15 +129,22 @@ ENDPROC(ret_to_user)
 /*
  * This is how we return from a fork.
  */
-ENTRY(ret_from_fork)
-	bl	schedule_tail
-	cmp	r5, #0
-	movne	r0, r4
-	badrne	lr, 1f
-	retne	r5
+SYM_TYPED_FUNC_START(ret_from_fork_asm)
+	/*
+	 * ret_from_fork() expects:
+	 * r0: prev
+	 * r1: regs
+	 * r2: fn() for kernel process or NULL
+	 * r3: fn_arg for kernel process or N/A
+	 */
+	mov	r1, sp
+	mov	r2, r5
+	mov	r3, r4
+	bl	ret_from_fork
+	mov	r0, #0
 1:	get_thread_info tsk
 	b	ret_to_user
-ENDPROC(ret_from_fork)
+SYM_FUNC_END(ret_from_fork_asm)
 
 /*=============================================================================
  * SWI handler
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index e16ed102960cb01d625e2ccc484f238b824b03b3..81c1c3f988344185917cf4e53d0d8ee47ae912f4 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -29,6 +29,7 @@
 #include <asm/processor.h>
 #include <asm/thread_notify.h>
 #include <asm/stacktrace.h>
+#include <asm/switch_to.h>
 #include <asm/system_misc.h>
 #include <asm/mach/time.h>
 #include <asm/tls.h>
@@ -230,7 +231,26 @@ void flush_thread(void)
 	thread_notify(THREAD_NOTIFY_FLUSH, thread);
 }
 
-asmlinkage void ret_from_fork(void) __asm__("ret_from_fork");
+/* The assembly stub sets up the parameters and calls ret_from_fork() */
+asmlinkage void ret_from_fork_asm(void) __asm__("ret_from_fork_asm");
+
+__visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+				     int (*fn)(void *), void *fn_arg)
+{
+	schedule_tail(prev);
+
+	/* Is this a kernel thread? */
+	if (unlikely(fn)) {
+		fn(fn_arg);
+		/*
+		 * A kernel thread is allowed to return here after successfully
+		 * calling kernel_execve().  Exit to userspace to complete the
+		 * execve() syscall.
+		 */
+	}
+
+	/* syscall_exit_to_user_mode(regs); here once we switch to generic entry */
+}
 
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
@@ -263,7 +283,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		thread->cpu_context.r5 = (unsigned long)args->fn;
 		childregs->ARM_cpsr = SVC_MODE;
 	}
-	thread->cpu_context.pc = (unsigned long)ret_from_fork;
+	thread->cpu_context.pc = (unsigned long)ret_from_fork_asm;
 	thread->cpu_context.sp = (unsigned long)childregs;
 
 	clear_ptrace_hw_breakpoint(p);

-- 
2.49.0

