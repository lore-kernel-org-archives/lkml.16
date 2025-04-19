Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D120409E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102190; cv=none; b=U7iJcZ8XDo2Iea8PQ0NRAhfWFAG5cxd36hhifZRAPvvSDOwbC/c/Wc+qZKgJ1Wpy/W4CxjzthrxZlF04CNSzBRKrgewYcGuaVdp0Y/1Zy4+4oKfNEI/mR7Wog04C8gX1Gul5diVZCiZ2/HWfSwrtbSdefLJE3sairMwOUygbNPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102190; c=relaxed/simple;
	bh=os8NK0jSRHi6Z6k0L+lYRMJWNvlvBp3nqKvGGgzvPqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EILq9H+zmidWOU/J1TtSPI8BPylcTK5W3TMzmfRd6tcSD65yd8p2vSCgHTutV1D4Jqqam6dtlbYRe+SWZMbgetGLvwwzcDxRf3JLDL0AihjfuIlc9zAbto1lkt0V2mbR+A4Ub4nv60ZbhTT2Ts8jknMJPMamLU71w4MnSORmdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnAVcuZh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnAVcuZh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499d2134e8so3211605e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102187; x=1745706987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTVDaSvJ4L704RA6vZ0/T+s/rQlTI98VbS11Ma+Uwx0=;
        b=CnAVcuZhNCPAToQ5h66Ul8Dbi778wexkH3Eh8CwsjGxiqVmxtwtq7iH9prHr9G+3lK
         kwfQjb9C1KyEQr/sHX7GHnwwc2ikPDLZCh7pNboVIakhge99dl5lvpArcUObVYPU0aQV
         JKazUmh81IOyvA+6qs/Evm9zgLwCo9igKWAhAsSMBr4ha0lV7XmNYE0rgt5akZUYjo/8
         2MoLlGgj33F1rECqK16nOWxV3p+LucLY436VopicYiWd8mqi08iRh0myLvMBIMbAYX4a
         Xng+TUkfwuqWcW8H3k8pslzCwRFYcDvMLR59MQiHsLZtPD36SEvUuggzFp6YomwN6QRO
         MOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102187; x=1745706987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVDaSvJ4L704RA6vZ0/T+s/rQlTI98VbS11Ma+Uwx0=;
        b=O3e5n+Rr9hFaUvRMhut+JgDj99UbA0XQc9CFeVtmmLLZTVpVBk6I9h8gPSsbANQC7g
         vFnrcHSa/rpMKR4poNeG9zAvzaSTsF8KydKq4cLEm2oSSEiVuxM7kEKE9jOsloeeGkWc
         8aNImwbWsx5KKUrUfy9Ip9akKDFf+sC3FOol1GiGOyE6Uy1F61bZ7lG78ivs3S2GF304
         79Fd09hp9uFGiuUsvNdbrL95iosTepTLP49FM70yiJg5H8Wglnt5h/pN/Fad0VPuWXlW
         LNNeci+CpO8RCMtQwEyc39DsZKpkFROKhYm45tFemFr+1snvwkNnGfWJBFEgrJSW8+Sz
         uUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpdR2K4mSy4YcMg+3YuhFh7FK3EsJTjEJgqqrl9GVciPfdaUjTJguKXIJGnqzMY348wu2Djmqg/C0BhYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXVNhMVn4/ZPGZoleC/jNym3NQQoa5OVBJkC0hinCB8Oj1UGd
	EyY3mBjHJ1b0JpaNv7zBa8Am7j1Q1+mrOEaWobvv8dwNmKjV0ja6un8PdIpyvBg=
X-Gm-Gg: ASbGncuPYWJKBb+SMvYFXDi6hmr67HM818TDtbVgwKNI5cUrRL5OscQkr1jjIgix/6b
	5pfVSSd3nAPQ47v0ZXOmxDkIgyTs0a+NwH+I9uySjT3Vknb91EH+kOKLBa/g5wTdN6J8zCNoCPC
	fh6ejGtYEvAdWKD/bHsabT++RlQqdtKfEl9VDH3I0C3/xawnY4y9SqMOjVprTQbwlirUZbmN4On
	xBd0EgzOmSt7WWvCJg8e/vrgFNANM8vtQfq0whY+nkvB+Td+/uGk76IH0aRMpHzWOE4egHLGJE5
	V4nKVs6zWVENQJ9nOVnARNcTbPh6VNCh9NeCX5SbRUh27JbvJwY=
X-Google-Smtp-Source: AGHT+IFSClu7d5x/EKBK2U9rNLPTV0CRIKMtMGD/M+3v4fEe5EoA6+CF5GbxPDsD14QroLyqyRmiZg==
X-Received: by 2002:a05:6512:3d0e:b0:549:5989:bb89 with SMTP id 2adb3069b0e04-54d6e65911dmr1973786e87.35.1745102187044;
        Sat, 19 Apr 2025 15:36:27 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:10 +0200
Subject: [PATCH v6 23/31] ARM: entry: Stop exiting syscalls like IRQs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-23-95f1fcdfeeb2@linaro.org>
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

The syscalls are issued as software interrupts, and to this point
they were sharing code with the other exception handlers, but
this does not work with generic entry.

Make syscall_exit_to_user_mode do what irqentry_exit_to_user_mode
does at it's tail, and drop the invocations of
irqentry_exit_to_user_mode from the syscall path so that these
are now exception-exclusive.

Split ret_to_user and ret_to_user_from_irq into two distinct
execution paths.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 14 ++++++++++++--
 arch/arm/kernel/entry.c        |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 5385574c4339714f3d8b5ab6894f27466b89f932..e2ac6d3216b6828d948d60c424ff95ccdad12331 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -42,7 +42,6 @@ ret_fast_syscall:
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
@@ -62,6 +61,18 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
+	ldr	r1, [tsk, #TI_FLAGS]
+	movs	r1, r1, lsl #16
+	beq	1f
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
+1:
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ENDPROC(ret_to_user)
+
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
@@ -76,7 +87,6 @@ no_work_pending:
 #endif
 	restore_user_regs
 ENDPROC(ret_to_user_from_irq)
-ENDPROC(ret_to_user)
 
 /*
  * This is how we return from a fork.
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 0e3960844b94b14325eb00ce7dd791b36c43ac3c..88a7a699306ab61153d57333c26266b9161f5466 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -30,6 +30,10 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 	local_irq_disable();
 	if (has_syscall_work(flags))
 		do_work_pending(regs, flags);
+
+	trace_hardirqs_on();
+	/* This context tracking call has inverse naming */
+	user_enter_callable();
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)

-- 
2.49.0

