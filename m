Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20A1F03C9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102173; cv=none; b=CxRZ2AU1r3fg4eVJuGw5XLuJeNpZMfPkCVvx/RbGvxRNGvmd1riH8pt0+K1OBIkZf1N5dyJOUdA5CiT6zqIPs5Xclp25XGPEp60/6+oEk2v+Zj21C0eh+0WyBr3HK0hyLxzzRzZYA3uaoTqXkxRJ2frJZ863cRxi7H/Rb20Bz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102173; c=relaxed/simple;
	bh=2OFGKWEMTrRTT5tjjZH4BJSkfjxSF6tWnNPFMBBZOXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZwrN7Y8SqtS/NUzJiI/xvV4qBPUxZkYPbdmwkc3YzN9xVN6Vc3GsW4GAzSEumi48ZvZ3VqD1lxedX+h1RH55np1MiF2NncD21SBeUqr4Egym9960//xsHmrLNdgfMicgit7ITdrSAc6wXUiQcs6QKluftuWWL5TMqR9ZnBcJMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXRIVsoA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXRIVsoA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54af20849adso2805458e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102170; x=1745706970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiM2m9ABoxfWOeD3G81zWg3PRWoAeqZTvFDZw3I7hGA=;
        b=FXRIVsoA9ERexj9OyECweIpw4x5xycgbwx8bc2KNqTr0AieeDfFsX+J5FuOpk0fiYx
         U5EhoLcPBHQx9CvW7UT1g2ZJo2DdYoQZ0D6BHhZSVT3TJ2eEuHKQaXJjcwrloGXkX7Da
         fdfnqnwsSdZgzccB60QzhZ0mvYB4MEjW0+x8KArYSs4TPW9AE8Md4g2neId7mXViDIS3
         ogn8gzvoGbg0ZQauzCUUf6wU1NMmlbjsWcy42ikTOpyXVIbECylK998BDtxMyTguwA9w
         VwnGF1WE0R5WAoanhzGE6Hm8+ojQaqjGJgnlcwmxv1fOqCRjRLZOPmDn/WciomiIm8Rf
         Yp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102170; x=1745706970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiM2m9ABoxfWOeD3G81zWg3PRWoAeqZTvFDZw3I7hGA=;
        b=NGzUqo6j/3JSuXhflAWMdaJPzZTelhLcvIdD+fi/gi46uoy8lZfbW0oBxjltYvAg8I
         ww9ceKzD7cv9yHGdutkqYDStcdFr1bgtuzF+60yNKfBeyjq37hj/yFdTGj/REN9WNLGG
         Vfz9yvHS642mgxzXScdt3lQCOjkOjNlhwUHdmdbhS4wl0uEfGMMuz0I3w6/gwRmJVB1U
         UJ2PfeFiGdfqTomC3T70KzLSNzIiGFS9zWLplQInFaFCmjXxIDRb7RCw82a8lnJehpBR
         s6d1hO6T2DGrqQ0bUUs+QMY3WBalOXTDaEuu0bnl9UJT7lhwMHiYdjB9/Vi15BX0RXv+
         t+sg==
X-Forwarded-Encrypted: i=1; AJvYcCXmoIarxh9LlgLIkPp6LUXGtWh7WzZYz1sJRcIk4LKYLtDu/rThXD9x5r3N26oAUEd5uRnscycFgpLdZEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcswZgW8ydOKIH6sOKayiFs2L3d0zE2UiHfL2TjcCPC++t8Bo
	PVCSILljOxYlKWQvk6deIqWAz69Y/4pGFQKwRx5xH6x8onEQH5XgdE1cH0XQ1m0=
X-Gm-Gg: ASbGnctGltKRWvXHHSikHn8Kuzy/ZKlEu+dS7bxJqzxKjDQc9I562nAzA/+B4kDgd8y
	gMn/LaWedaIvAoKc4uoPmJlE1CgdI7pvii4vjw9FzuNdSwDZgi1dNhsAkk5msCc9Cnij76uMVuT
	AUga+Pp83FjFg34ntbc9Z9VoeGaHT3Pr/g2hNKbmS2lCZOvWEPW7/VYmlG11RSF+e2FwCl8gQJE
	LurRnZ6zElPSOsl1GqHXbaEKXjFOqElaV/kV6PEQ1VbWno9e/13Ckb068JFy5iLY2SdXtLrCjsh
	NY7wf63hnSnnFBX/U02N+w0D6/sKcK0PN41W8RklxqcAVqLM9g+FebzwmyeGKQ==
X-Google-Smtp-Source: AGHT+IFUHnCFl3rwYhxdXisPsoj8SpByV0bgu6OwD68TwJ1OsQbpjFjweq7RH2TQHdNEzdVERV/lRQ==
X-Received: by 2002:a05:6512:1151:b0:54b:f99:776c with SMTP id 2adb3069b0e04-54d6dc055ebmr2313462e87.24.1745102169877;
        Sat, 19 Apr 2025 15:36:09 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:57 +0200
Subject: [PATCH v6 10/31] ARM: entry: move all tracing invocation to C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-10-95f1fcdfeeb2@linaro.org>
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

The traced invocation of syscall is rewritten in C, moving
over also the call to syscall_trace_exit() to C.

To do this we cannot have invoke_syscall_trace_asm() be a
leaf call, which is the mechanism we hithereto relied on
to make sure the stack is pulled back to the state we were
at before we called out to the code written in C.

Push the registers potentially used by C on the stack, and
make a copy of the two stack-pushed syscall arguments
on the top of the stack before invoking the syscall and
then drop these copied arguments and pop back the
registers before returning from invoke_syscall_trace_asm().

As we are now calling from and returning to C, we no
longer need to pass the regs pointer around so drop it.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  2 +-
 arch/arm/kernel/entry-common.S | 32 +++++++++++++++-----------------
 arch/arm/kernel/ptrace.c       |  2 +-
 arch/arm/kernel/syscall.c      | 30 +++++++++++++++++++++---------
 4 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 66067d165ba3fbbe0f840a89ae396eb1a311bacc..cb0073c4151bf70a82d15e17a95b6b6f48b245d6 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -20,7 +20,7 @@
 extern const unsigned long sys_call_table[];
 
 int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
-int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp);
+void invoke_syscall_trace(void *table, struct pt_regs *regs);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 8baab7f97f59c434396f30b08ddd3029c5f9c0e5..dbc947d301ec11bb13007cb4bb161c035ede5c10 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -296,22 +296,11 @@ ENDPROC(vector_swi)
 __sys_trace:
 	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
 	mov	r0, tbl
-	badr	r2, __sys_trace_return
 	bl	invoke_syscall_trace
-	cmp	r0, #-1
-	bne	__sys_trace_return
-	add	sp, sp, #S_OFF			@ restore stack
-
-__sys_trace_return_nosave:
-	enable_irq_notrace
-	mov	r0, sp
-	bl	syscall_trace_exit
+	add	sp, sp, #S_OFF			@ restore stack pointer
 	b	ret_to_user
 
-__sys_trace_return:
-	str	r0, [sp, #S_R0 + S_OFF]!	@ save returned r0
-	mov	r0, sp
-	bl	syscall_trace_exit
+__sys_trace_return_nosave:
 	b	ret_to_user
 
 	.macro	syscall_table_start, sym
@@ -437,18 +426,27 @@ SYM_FUNC_END(invoke_syscall_asm)
  * r0: syscall table
  * r1: regs
  * r2: syscall number
- * r3: pointer to return function
  */
 SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
 #ifdef CONFIG_CPU_SPECTRE
 	csdb
 #endif
+	/* Save registers because we are being called from C */
+	push	{r4 - r10, lr}
 	mov	tbl, r0
+	/* Make space to copy the two syscall stack arguments */
+	sub	sp, sp, #S_OFF
 	mov	scno, r2
-	mov	lr, r3				@ return address
-	ldmia	r1, {r0 - r6}			@ reload r0-r6
-	stmia	sp, {r4, r5}			@ update stack arguments
+	badr	lr, __invoke_syscall_trace_ret	@ return right here
+	ldmia	r1, {r0 - r6}			@ reload r0-r6 from regs
+	stmia	sp, {r4, r5}			@ copy stack arguments
 	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
+__invoke_syscall_trace_ret:
+	/* Drop the copied stack arguments */
+	add	sp, sp, #S_OFF
+	pop	{r4 - r10, lr}
+ ARM(	mov	pc, lr		)
+ THUMB(	bx	lr		)
 SYM_FUNC_END(invoke_syscall_trace_asm)
 
 #ifdef CONFIG_OABI_COMPAT
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 07b0daf47441f1f76a8af416acc74fa5ed770403..ac7b98ae47249b4a00fc1cb871bb2d309bfd8c88 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -888,7 +888,7 @@ asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 	return scno;
 }
 
-asmlinkage void syscall_trace_exit(struct pt_regs *regs)
+void syscall_trace_exit(struct pt_regs *regs)
 {
 	/*
 	 * Audit the syscall before anything else, as a debugger may
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index 377e16c8c53c8e809e3f8b157a889ef115d5c043..e90f04f35b3485968a1e9046cf0889f56cca92e5 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -18,23 +18,35 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 	return sys_ni_syscall();
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
 __ADDRESSABLE(invoke_syscall_trace_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp)
+__visible void invoke_syscall_trace(void *table, struct pt_regs *regs)
 {
 	int scno;
+	int ret;
 
 	scno = syscall_trace_enter(regs);
 	if (scno == -1)
-		return -1;
+		goto trace_exit_nosave;
 
-	if (scno < NR_syscalls)
-		/* Doing this with return makes sure the stack gets pop:ed */
-		return invoke_syscall_trace_asm(table, regs, scno, retp);
+	if (scno < NR_syscalls) {
+		ret = invoke_syscall_trace_asm(table, regs, scno);
+		goto trace_exit_save;
+	}
 
-	if (scno >= __ARM_NR_BASE)
-		return arm_syscall(scno, regs);
+	if (scno >= __ARM_NR_BASE) {
+		ret = arm_syscall(scno, regs);
+		goto trace_exit_save;
+	}
 
-	return sys_ni_syscall();
+	ret = sys_ni_syscall();
+
+trace_exit_save:
+	/* Save return value from syscall */
+	regs->ARM_r0 = ret;
+
+trace_exit_nosave:
+	local_irq_enable();
+	syscall_trace_exit(regs);
 }

-- 
2.49.0

