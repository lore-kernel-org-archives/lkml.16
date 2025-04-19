Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174291EE7B6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102168; cv=none; b=MCJnUgcvtwI+OeXC7W1j7aGzXQnc29Q0WVZDeVcplUu4/hUCYlHV9UKXyuioGvQJF6b4pHkFEAkeP8SXdAzDwoK6oLlSm45GOx5cPEbNT5IJmysfAvEPBknYz/0JYPEogQYQvLd7Fr0uplEJQVaORPC3U4XxbKLPlK2NbPRvTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102168; c=relaxed/simple;
	bh=vHJ6hKyjPK9/VnvJJFsVbStSsVdAnTrU8oOpLaxYpko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rREmqknj1tfZwJQ9xP0/+v/WffUVLj1ye2EzaJ9HAP7A4QtH3G2O40PZ77nkaWoEbpgoA1Aeu4SPkgeGj6Xnsf59nGdwtFEsneoX6wNXSUb+KHFWzCUMJyN2LcquVp0fz579ushjIxxtLQX3QCmHXza7YHlSKhfsQmc7Hw56BnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LjB+/rTo; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjB+/rTo"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so3101545e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102164; x=1745706964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/zBRaBIfgD03SLfWB2fpie1ECbuX1JEqLTmdVNljN0=;
        b=LjB+/rTolPS02YuZMxlCKG3edPcSjy6PdjWRkfpTEs0dEiPrcd6jdDDffbb5Ma8Ejd
         vFQXA+TJbgUjYPXgbR796AQ6vbeqTcU8PQwry9BLfRIoQ2VLAlh7X1GXTdB67eQLUu0E
         k7bj5QCI9AqXzrZiyxoRsyw4BtJHFrvFv5eXG88a38vmXeHzH4cr9n1i+4FedQFcqqP3
         F//IMjj9zilgdYTBQJ+IVPLducR3+iB9AFdjzPB0B65jse+VnpDSHPjfUpglicd/LA18
         tWDOsmKb8MWa77aFpkFsPWY65Fm9FTrve13JYP5n4IU8bxJiIzN0GPQeJh6euLnO8sdA
         TTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102164; x=1745706964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/zBRaBIfgD03SLfWB2fpie1ECbuX1JEqLTmdVNljN0=;
        b=ZgfLnfuxFC8n9sUcBg1LeHeruCm+gj7vQBSqLI3QHjrAw7NwRAJzK7qumNfE7k6tAs
         8RvXo0rHo4cMcCo5ndWVuLslWu1L/TA18NoamJe/sLiVPkDQaaWcZVYFKa5+QRxF21RD
         fJycUuA39LCEDR7l1so3wlfq+GF0On/s4pKa08pSEzrqiY/Rsmi6V8vVqeh00s1hf6Dd
         UTIKUyo4YzffgKvf7XIV/N1jfTtqT+QKY5Lkq/X0RF86XrXg30W6LSIgLvk995e6UIXM
         Ew/e+D1SAwep7eCFxZ0j6cYwQQKsTpsXHbdVo8UXQEfveP/UAwYjtT15z7PFRBbqoLoV
         5b2w==
X-Forwarded-Encrypted: i=1; AJvYcCV5SYRTkIlBwWkcfpvFXd2jf8xxYpCI24/DldRPws1HZuULvKxce9CMWOXTF6EdnEbaJNVV+aqY5Z/dMp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZymhYVRgS3UpMNBd1mjC7HC13dANFM2tzG17WerynmL5ms6Y
	+D9AEAZGcLmYaY4Z3DO5C2fT50/WBckNBFfLZGL+DyFrWmM5KyRULFTkE1IPVTG1wE3SorUoE/H
	MfLA=
X-Gm-Gg: ASbGnct9ihHNil3e68FtDa+/oM8zRzTanL3vZUW90jees2A2l0a46cZXIpSeDwB47XE
	H9ocELUenhwL4TxHyHpkalHJ9GdII80elR3GvIVF7zELHVoV7JPXoorRBR+wYbHBGuXSn9ne8QP
	V66UVG0YZrmyAKbXajSurGnIGTlCMXlD1tm+x0KGVAlbpSkbzfWBg4iJbsyJzs5mZB0KbNzrOvE
	HkzJNiznlPZwELPil8eSY6Uwqq7vr2pizxhy/r/eMhY1s8eZPgYIDCmNJVJzR4y1NAUrVQ6fBy3
	07OhTggRHJuwEd+f3eFRURiXIxhhLXBfsu0knhDv/CLdVQOVhUM=
X-Google-Smtp-Source: AGHT+IGnYl36iobf0ClJBjp9ukIPfElQP0sR9IENkVwuBI5zDR+urZvC5l7btb+28mbhOG6+h12jCQ==
X-Received: by 2002:a05:6512:118b:b0:545:c7d:1791 with SMTP id 2adb3069b0e04-54d6e663ee5mr1864316e87.43.1745102164214;
        Sat, 19 Apr 2025 15:36:04 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:53 +0200
Subject: [PATCH v6 06/31] ARM: entry: Invoke syscalls using C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-6-95f1fcdfeeb2@linaro.org>
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

This makes the assembly invoking syscalls switch over to
doing this from C with a small assembly stub to actually
jump into the syscall.

Split the syscall invocation into two paths: one for plain
invocation and one for tracing (also known as "reload"
as it was reloading the registers from regs). We rename
this path with the infix "trace" as that code will be
trace-specific as we move code over to C.

Some registers such as r1 and lr get cobbled during the
C calls and need to be restored when we return.

Right now the part in C doesn't do much more than check the
syscall number to be valid (a test previously done with
a cmp r #NR_syscalls inside the invoke_syscall macro)
but we will gradually factor over more assembly to C that can
then be switched to the generic entry code so the exercise
gets a point.

Since both functions are called from a C file that is in
turn only called from assembly, the functions have to be
tagged with __ADDRESSABLE() in order not to upset CFI.

Tested with a full system boot and by issuing some command
line tools with strace to make sure the tracing path still
works.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  3 ++
 arch/arm/kernel/Makefile       |  3 +-
 arch/arm/kernel/entry-common.S | 65 ++++++++++++++++++++++++++++++++++++------
 arch/arm/kernel/entry-header.S | 25 ----------------
 arch/arm/kernel/syscall.c      | 28 ++++++++++++++++++
 5 files changed, 90 insertions(+), 34 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index fe4326d938c18efb54c96930e6b52ab7da9b2942..1d21f26ecf510ac00a878b4d51a5753ee49475f5 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,6 +19,9 @@
 
 extern const unsigned long sys_call_table[];
 
+int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp);
+
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
 {
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index b3333d070390a8ff366a306931614b1b260647bd..69ddf51081f4791982518d37df60c11211b8955a 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -20,7 +20,8 @@ CFLAGS_REMOVE_return_address.o = -pg
 obj-y		:= elf.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
-		   stacktrace.o sys_arm.o time.o traps.o
+		   stacktrace.o sys_arm.o time.o traps.o \
+		   syscall.o
 
 KASAN_SANITIZE_stacktrace.o := n
 KASAN_SANITIZE_traps.o := n
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index da5c2d4b62e56cce644b15e329ab4149d69c5b79..57aa1084a0476e9c218cd100ce4fdf4aaa748234 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -254,21 +254,23 @@ ENTRY(vector_swi)
 #else
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
-	/*
-	 * Reload the registers that may have been corrupted on entry to
-	 * the syscall assembly (by tracing or context tracking.)
-	 */
- TRACE(	ldmia	sp, {r0 - r3}		)
-
+	mov	r1, sp				@ put regs into r1
 	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 
 	tst	r10, #_TIF_SYSCALL_WORK		@ are we tracing syscalls?
 	bne	__sys_trace
 
-	invoke_syscall tbl, scno, r10, __ret_fast_syscall
+	mov	r0, tbl
+	/* r1 already contains regs */
+	mov	r2, scno			@ syscall number from r7
+	badr	r3, __ret_fast_syscall
+	bl 	invoke_syscall
 
+	/* Restore regs into r1 and lr after C call */
+	badr	lr, __ret_fast_syscall
 	add	r1, sp, #S_OFF
+
 2:	cmp	scno, #(__ARM_NR_BASE - __NR_SYSCALL_BASE)
 	eor	r0, scno, #__NR_SYSCALL_BASE	@ put OS number back
 	bcs	arm_syscall
@@ -301,7 +303,16 @@ __sys_trace:
 	add	r0, sp, #S_OFF
 	bl	syscall_trace_enter
 	mov	scno, r0
-	invoke_syscall tbl, scno, r10, __sys_trace_return, reload=1
+	mov	r2, r0				@ scno into r2
+	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
+	mov	r0, tbl
+	badr	r3, __sys_trace_return
+	bl	invoke_syscall_trace
+
+	/* Restore regs into r1 and lr after C call */
+	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
+	badr	lr, __sys_trace_return
+
 	cmp	scno, #-1			@ skip the syscall?
 	bne	2b
 	add	sp, sp, #S_OFF			@ restore stack
@@ -415,6 +426,44 @@ sys_mmap2:
 		b	sys_mmap_pgoff
 ENDPROC(sys_mmap2)
 
+/*
+ * This call wants:
+ * r0: syscall table
+ * r1: regs
+ * r2: syscall number
+ * r3: pointer to return function
+ */
+SYM_TYPED_FUNC_START(invoke_syscall_asm)
+#ifdef CONFIG_CPU_SPECTRE
+	csdb
+#endif
+	mov	tbl, r0
+	mov	scno, r2
+	mov	lr, r3				@ return address
+	ldmia 	r1, {r0 - r3}			@ reload r0-r3
+	/* Arguments 5 and 6 are (hopefully) on the stack */
+	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
+SYM_FUNC_END(invoke_syscall_asm)
+
+/*
+ * This call wants:
+ * r0: syscall table
+ * r1: regs
+ * r2: syscall number
+ * r3: pointer to return function
+ */
+SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
+#ifdef CONFIG_CPU_SPECTRE
+	csdb
+#endif
+	mov	tbl, r0
+	mov	scno, r2
+	mov	lr, r3				@ return address
+	ldmia	r1, {r0 - r6}			@ reload r0-r6
+	stmia	sp, {r4, r5}			@ update stack arguments
+	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
+SYM_FUNC_END(invoke_syscall_trace_asm)
+
 #ifdef CONFIG_OABI_COMPAT
 
 /*
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 99411fa913501cad8b55ef04a2b8ab3d44f3e39e..52b4fa97226dbfa4b55aca8eaf74ae24e1e220f8 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -389,31 +389,6 @@ ALT_UP_B(.L1_\@)
 #endif
 	.endm
 
-	.macro	invoke_syscall, table, nr, tmp, ret, reload=0
-#ifdef CONFIG_CPU_SPECTRE
-	mov	\tmp, \nr
-	cmp	\tmp, #NR_syscalls		@ check upper syscall limit
-	movcs	\tmp, #0
-	csdb
-	badr	lr, \ret			@ return address
-	.if	\reload
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	ldmiacc	r1, {r0 - r6}			@ reload r0-r6
-	stmiacc	sp, {r4, r5}			@ update stack arguments
-	.endif
-	ldrcc	pc, [\table, \tmp, lsl #2]	@ call sys_* routine
-#else
-	cmp	\nr, #NR_syscalls		@ check upper syscall limit
-	badr	lr, \ret			@ return address
-	.if	\reload
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	ldmiacc	r1, {r0 - r6}			@ reload r0-r6
-	stmiacc	sp, {r4, r5}			@ update stack arguments
-	.endif
-	ldrcc	pc, [\table, \nr, lsl #2]	@ call sys_* routine
-#endif
-	.endm
-
 /*
  * These are the registers used in the syscall handler, and allow us to
  * have in theory up to 7 arguments to a function - r0 to r6.
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
new file mode 100644
index 0000000000000000000000000000000000000000..edc0ac88ec60ce3f23149a526de7dc1205906552
--- /dev/null
+++ b/arch/arm/kernel/syscall.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/syscalls.h>
+#include <asm/syscall.h>
+
+int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+__ADDRESSABLE(invoke_syscall_asm);
+
+__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp)
+{
+	if (scno < NR_syscalls)
+		/* Doing this with return makes sure the stack gets pop:ed */
+		return invoke_syscall_asm(table, regs, scno, retp);
+
+	return 0;
+}
+
+int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
+__ADDRESSABLE(invoke_syscall_trace_asm);
+
+__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
+{
+	if (scno < NR_syscalls)
+		/* Doing this with return makes sure the stack gets pop:ed */
+		return invoke_syscall_trace_asm(table, regs, scno, retp);
+
+	return 0;
+}

-- 
2.49.0

