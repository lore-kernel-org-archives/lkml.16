Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D711F09B3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102175; cv=none; b=WwcUcZ1ofRAgvzq6a6jKdbCV4cYwUyps0rWHRhTMkqMzQB7eeKMQV59YlAFg661VERO+Cc4pS5R1OxpKk+zG3ZyN/MwShwgeJF/dzq4Ox0sWxRvGPEeGJXgjTVrpWfjsYUcM6+pq+uMX063IwhXh5V4bMjqR6keLs9bF4IgC44U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102175; c=relaxed/simple;
	bh=TP4Yh+9WJlDZaqz4bf4qUkZ08SlWdrw1wBwo43PLPwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYq4tnMG2HI83TrBHIX8rXjvqO/oDAYK75iM2+LcPTjRdV4qvDkxgK0JNxKKIrgime3fdhADT4OMDy7cZ6h9FOzq8/AtupDg4kdQhWO3mnfUpoL+SSREofzyRIXMpXvVOM8tyyMcXKjOet7FIeIjMWTK5Tnc5xNyKqFVKjknJjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qYeUhee+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYeUhee+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10956398so3476814e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102171; x=1745706971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l98x3YSTQCmRpdwObE91jKVkzt4FjWNoTJCcOXRWYQo=;
        b=qYeUhee+2AMKeypIRHznx4N3FZLrPFjYLcicZDnv36F0MNUX1SPh2qg58xiAbNN6TH
         1jj1pKsi/aQ08Rw77pTewJIft8yypgS7+wJH0WTJI6Rl/sMcaQX6Qgqh/4pYEjsIhaXp
         /oe4GU+W6sGD+Hy7mksFZGQlEDvqfollRUtxN3fmrLahbqBxFErlS5RnR0cShoeAPT0S
         WVBspt0e5ojYd+3/xHqJFg2dmjhUX+G+QGHJ+QrNg02Ufx86xkANtFtDFiXTxlWdyDyT
         mlGKbRCiDab5+RlO5SzfyLT1RtUGih4iF3E3vCOVGCScg45XshVKUNQCna6kZZQouxuu
         cafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102171; x=1745706971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l98x3YSTQCmRpdwObE91jKVkzt4FjWNoTJCcOXRWYQo=;
        b=E4T4bs1x4sY6YZ/FyCUj9+plbSHfTLpg0l2UYQqldxE02csEiLzmf1vr6y1BKicDFv
         GQ0AdgDrr2/BOI9Jep2z2SUJPx3pTs5RoZxhvyO66Z3YKstPyNUI8VA/c3D8kIVo2em5
         SBIGam5hGiUw7E2plQKTKnEksJHVnKzpKtatjQjegCupKpcatctO0i0cwA4ihIDvuZOG
         OqsGKP+gOT7ZXadslOEOowzkbCics3+YsIZ9tEUDSt+Cb4JcXDf0l9OsKFk19B8NRmdl
         B4k8p3pWzana+k6dFlQoqDEGzubD6gvT2wobw1JY3vjOBqsVLzTl+1WD37ZWcSfgzjne
         lcMA==
X-Forwarded-Encrypted: i=1; AJvYcCXV0uOrDOfe4wQ/8dNYPfj04wNTB0a5gUuVICrEbcRIhIfeEOnExE4RqFprDh+LnOxY19GX60evTMBe3oY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4ZuavorxL/JR6HovDYF5slEDl3yUuvwJVsQklwHIM9xNmKHn
	XN+bhq0zHPWAM/s5b2BYYrOt8cjLZ0obREFjlcHgeByJF1400gcXBbeXM+Lr1WA=
X-Gm-Gg: ASbGncvW6zI44J6HWEAOwc+XC6GsUsmt1tJILhXp01ZDId+BJrSqMDUsSu2/lGUMuPV
	pPElRyQxpjdJ0qBQmpe3CZHRIZEade3ryecudPaPLPQxuvAW+B6TcTfI/WC+RmQaYDhFZgd6YTK
	HCVxyUs9SytIiDOZWtmLm/4Ig6Ymqzwgn8edg8xjvtznFUelODALCH83sgwu7cOLpGl0Kh3IhhF
	6K7fP+F4GjFbgVX0jN1yF273dHVqfVYB+4Do1TDUOydcWdy3j9rmMtx75kdNt33e9O97xLSQ8xV
	NuvAkCy2/ZRLOcLEE6fuGzLqPAwR3tptwTcZ4fbDXVqmLq0N/zg=
X-Google-Smtp-Source: AGHT+IHq/GECB8/PhsmzHvDnTv89Wx7raTEYHUi/0yF8Wzd8LfNYvvGMkk5FpZPXmnpYgbFS+fFHuw==
X-Received: by 2002:a05:6512:3d29:b0:54d:6c14:3caf with SMTP id 2adb3069b0e04-54d6e780055mr1794566e87.11.1745102171471;
        Sat, 19 Apr 2025 15:36:11 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:58 +0200
Subject: [PATCH v6 11/31] ARM: entry: Merge the common and trace entry code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-11-95f1fcdfeeb2@linaro.org>
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

The trace entry code now can handle recursive and complex
calls in C using stack.

Move the common code over to using that approach.

We now use the ret_fast_syscall return path also when tracing,
which appears to work just fine.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  3 +--
 arch/arm/kernel/entry-common.S | 61 +++++++++---------------------------------
 arch/arm/kernel/syscall.c      | 35 +++++++++++-------------
 3 files changed, 28 insertions(+), 71 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index cb0073c4151bf70a82d15e17a95b6b6f48b245d6..9c664d8c5718f58034f442c20a030b59faf65dd9 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,8 +19,7 @@
 
 extern const unsigned long sys_call_table[];
 
-int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
-void invoke_syscall_trace(void *table, struct pt_regs *regs);
+int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index dbc947d301ec11bb13007cb4bb161c035ede5c10..f0f1f8723965313b287158fb2a238908db72fcd2 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -39,7 +39,6 @@ saved_pc	.req	lr
  * from those features make this path too inefficient.
  */
 ret_fast_syscall:
-__ret_fast_syscall:
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
 	disable_irq_notrace			@ disable interrupts
@@ -47,13 +46,13 @@ __ret_fast_syscall:
 	movs	r1, r1, lsl #16
 	bne	fast_work_pending
 
-	restore_user_regs fast = 1, offset = S_OFF
+	restore_user_regs fast = 0, offset = S_OFF
  UNWIND(.fnend		)
 ENDPROC(ret_fast_syscall)
 
 	/* Ok, we need to do extra processing, enter the slow path. */
 fast_work_pending:
-	str	r0, [sp, #S_R0+S_OFF]!		@ returned r0
+	add	sp, sp, #(S_R0 + S_OFF)
 	/* fall through to work_pending */
 #else
 /*
@@ -63,10 +62,9 @@ fast_work_pending:
  * call.
  */
 ret_fast_syscall:
-__ret_fast_syscall:
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
-	str	r0, [sp, #S_R0 + S_OFF]!	@ save returned r0
+	add	sp, sp, #(S_R0 + S_OFF)
 #if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
@@ -83,7 +81,9 @@ ENDPROC(ret_fast_syscall)
 #endif
 
 	tst	r1, #_TIF_SYSCALL_WORK
-	bne	__sys_trace_return_nosave
+	beq	slow_work_pending
+	b	ret_to_user
+
 slow_work_pending:
 	mov	r0, sp				@ 'regs'
 	bl	do_work_pending
@@ -257,19 +257,15 @@ ENTRY(vector_swi)
 	str	scno, [tsk, #TI_ABI_SYSCALL]
 #endif
 	mov	r1, sp				@ put regs into r1
-	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
-
-	tst	r10, #_TIF_SYSCALL_WORK		@ are we tracing syscalls?
-	bne	__sys_trace
-
 	mov	r0, tbl
-	/* r1 already contains regs */
 	mov	r2, scno			@ syscall number from r7
-	/* We return here no matter what, also pass this as an argument */
-	badr	lr, __ret_fast_syscall
-	mov	r3, lr
-	b 	invoke_syscall
+	bl	invoke_syscall_trace
+	cmp	r0, #0
+	beq	ret_fast_syscall
+	/* This path taken when tracing */
+	add	sp, sp, #(S_R0 + S_OFF)
+	b	ret_to_user
 
 #if defined(CONFIG_OABI_COMPAT) || !defined(CONFIG_AEABI)
 	/*
@@ -289,20 +285,6 @@ ENTRY(vector_swi)
 ENDPROC(vector_swi)
 	.ltorg
 
-	/*
-	 * This is the really slow path.  We're going to be doing
-	 * context switches, and waiting for our parent to respond.
-	 */
-__sys_trace:
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	mov	r0, tbl
-	bl	invoke_syscall_trace
-	add	sp, sp, #S_OFF			@ restore stack pointer
-	b	ret_to_user
-
-__sys_trace_return_nosave:
-	b	ret_to_user
-
 	.macro	syscall_table_start, sym
 	.equ	__sys_nr, 0
 	.type	\sym, #object
@@ -402,25 +384,6 @@ sys_mmap2:
 		b	sys_mmap_pgoff
 ENDPROC(sys_mmap2)
 
-/*
- * This call wants:
- * r0: syscall table
- * r1: regs
- * r2: syscall number
- * r3: pointer to return function
- */
-SYM_TYPED_FUNC_START(invoke_syscall_asm)
-#ifdef CONFIG_CPU_SPECTRE
-	csdb
-#endif
-	mov	tbl, r0
-	mov	scno, r2
-	mov	lr, r3				@ return address
-	ldmia 	r1, {r0 - r3}			@ reload r0-r3
-	/* Arguments 5 and 6 are (hopefully) on the stack */
-	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
-SYM_FUNC_END(invoke_syscall_asm)
-
 /*
  * This call wants:
  * r0: syscall table
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index e90f04f35b3485968a1e9046cf0889f56cca92e5..36330023b5484399a4ca2fdb5727b410e2c74b6f 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -3,50 +3,45 @@
 #include <linux/syscalls.h>
 #include <asm/syscall.h>
 
-int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno, void *retp);
-__ADDRESSABLE(invoke_syscall_asm);
-
-__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp)
+static inline bool has_syscall_work(unsigned long flags)
 {
-	if (scno < NR_syscalls)
-		/* Doing this with return makes sure the stack gets pop:ed */
-		return invoke_syscall_asm(table, regs, scno, retp);
-
-	if (scno >= __ARM_NR_BASE)
-		return arm_syscall(scno, regs);
-
-	return sys_ni_syscall();
+	return unlikely(flags & _TIF_SYSCALL_WORK);
 }
 
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
 __ADDRESSABLE(invoke_syscall_trace_asm);
 
-__visible void invoke_syscall_trace(void *table, struct pt_regs *regs)
+__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
 {
-	int scno;
+	unsigned long flags = read_thread_flags();
 	int ret;
 
-	scno = syscall_trace_enter(regs);
-	if (scno == -1)
-		goto trace_exit_nosave;
+	if (has_syscall_work(flags)) {
+		scno = syscall_trace_enter(regs);
+		if (scno == -1)
+			goto trace_exit_nosave;
+	}
 
 	if (scno < NR_syscalls) {
 		ret = invoke_syscall_trace_asm(table, regs, scno);
-		goto trace_exit_save;
+		goto exit_save;
 	}
 
 	if (scno >= __ARM_NR_BASE) {
 		ret = arm_syscall(scno, regs);
-		goto trace_exit_save;
+		goto exit_save;
 	}
 
 	ret = sys_ni_syscall();
 
-trace_exit_save:
+exit_save:
 	/* Save return value from syscall */
 	regs->ARM_r0 = ret;
+	if (!has_syscall_work(flags))
+		return 0;
 
 trace_exit_nosave:
 	local_irq_enable();
 	syscall_trace_exit(regs);
+	return 1;
 }

-- 
2.49.0

