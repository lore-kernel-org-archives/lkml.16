Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ADF1EBA1E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102186; cv=none; b=DHEiuoikD+8RTTLd/jkERMoMQZkD4QPw4QP4/Hg+APCCAwVjmwElXWgJl3bUaWfZRnMCjMkCELnQXTiPdU2jHAiXrgtBPlCZIJJw+7iamwj1F99dGvOBq+OcMXHP3ZwwHfqV88Qx7q0y0SIKGCyFmQ2akKZfUYeodjgjuEfFL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102186; c=relaxed/simple;
	bh=LbR4osUWoLkFLreske/FjNr3vqn3nXzgNQfKY52KpMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuFHFWcQNN6HKaQBsM7JVuYdA52shoHyRmZVg5LxZTAkHXSI9K8IEnlxU2Nf0rKKrYB49N6ESUQmEeXKW7qtmFDxAoEUDgijzBFUWSPT0/xC9P0uNhUvang3E+fnac/UezhCIS6MFtIL100CBT8+bT+QTvIQahK0ECpYpCw3/yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECO8ekzl; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECO8ekzl"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54c090fc7adso3177145e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102183; x=1745706983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA9fXt6iW3iv41wst4sIpkLmpsfTQfiB6NSTaz4f3Lo=;
        b=ECO8ekzlnNKSlwrNyf8Spmz0aDcXhzL7YPA9ObrUkgjUFKe+Y+h8cbLIVMptF6G9Rk
         jtb1sHGZ53eqc32NZ/bRqwKIenFAL5EJXqgaXH62ThS1R+iK8lUg/bhr9M+Rmgol5JdV
         LyYq2Ky7lJDL9H4/R8yrNsJXFUqZEBcuiAyH/L1NZ+wvGSdLPJ9VdLrOUApYtlul9yu3
         nzJKEqZ5lMqdiC2oOZnxsxU15GR7RL/M9LUg9W9DubUrJ9OH3qeAH/H7fIEjIvhT/JfD
         OGCCF+hbTj+nx8FNGNDWL0GcQgsu+jgOXKSGQGp9aEMR61rvBsos6H3XD9m0/1gwSgl3
         AILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102183; x=1745706983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA9fXt6iW3iv41wst4sIpkLmpsfTQfiB6NSTaz4f3Lo=;
        b=betqpoUem/gdmvTr2B2VqC9q5YHWpt/0eVxq2m7tQyNzeMxhYgStpo12oAoy5bPMrz
         q46yT78ozhfXhZKPVnI0I9Aqef63mBKqK6wTgQ3jJxVzG7M52S1kKVEN89hapmWnFXjV
         LE9Pfueos1COTcmE0mUg3XenVtxwDjhuSGWMJsGKYxmq6yh2PeHv9nAigRH6vJGJoWaZ
         h+xV3b5ozqPQ8NbmCsFSRB9mrWtLH7+/uyZh4zfl/Ql+3pXbDEyuuSxaapgtiuNH9stq
         5B3BfNszljFf0LwLwGDc40EF85OZs3FUvhcMBQ/3Y8bVIanQ0StSNxhZ/fs16ILtt/5K
         GckA==
X-Forwarded-Encrypted: i=1; AJvYcCXemtgVLVrjHJXmGKl2ngcSV0P3rXsGqOMf8MTjRkHDZsROvl8rd+A+oec+PP/Gp1TU8+4sbovZXgZDAb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdqNGEgBzVt5VlDw09tzdTxd5BfrVg+NcY8m18N+tjcwtIIs7j
	vHDQsZjTYCGzyJNj8lkf2sz8/8qbEcOEpyavOIrder/vNCr3pmXp0SRod2NEZYg=
X-Gm-Gg: ASbGncslwTWkXT662osxM/5BKxlMimWCwVjVVqEcaWrRrtpNrlMnX7rOKZ+NHsWiIJZ
	XRXvvH5tkyjl/jv2X594vevlv2WG5bzNSOp+mqM2JWV0c3tZHWbhzGxxV7N8N8PA4vZPaR+nTew
	h+fsUMpxUeIqRq62WG0Q99ORdWCN3fgwtuejFIh1zyWRrpebEbh6Qc3xu1hE8haVkBfvMQ6XUHw
	aYWWRV/nQEHJFjerXNlUrCguXvn2bZO0LqF8zgiGr77KYpWCx+fICaufVahzys+1b4pVtkg8hpF
	knMoJaybMnfquzuBP3L1UhlUo4wv77zaFL/wZpf6RgqGuE+gyGY=
X-Google-Smtp-Source: AGHT+IF2zPQ/WKqF3wNtgpQmZ4+Rq+76q40tDwICNvok0//cFZwaJDMB36r2Jqc7UyoA/kUxnRmHQA==
X-Received: by 2002:a05:6512:b0f:b0:54d:65cb:6c28 with SMTP id 2adb3069b0e04-54d6e61a356mr1780325e87.9.1745102183076;
        Sat, 19 Apr 2025 15:36:23 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:07 +0200
Subject: [PATCH v6 20/31] ARM: entry: Untangle ret_fast_syscall/to_user
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-20-95f1fcdfeeb2@linaro.org>
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

The return to userspace is a bit hard to follow. To prepare
the ground for further refactorings we rewrite the functions
to ret_fast_syscall and ret_to_user are mostly stand-alone
symbols.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index d27e34d7e97a079d62e7b778cf7cf97c302e4763..ece9215717143427de7572a18a6dbe620a9193e9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -44,20 +44,23 @@ ret_fast_syscall:
 	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
-	beq	no_work_pending
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
-
-	/* Slower path - fall through to work_pending */
+	beq	2f
 
 	tst	r1, #_TIF_SYSCALL_WORK
-	beq	slow_work_pending
+	beq	1f
+
 	b	ret_to_user
 
-slow_work_pending:
-	mov	r0, sp				@ 'regs'
+1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending
-	b	no_work_pending
+
+2:	asm_irqentry_exit_to_user_mode
+
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs
+ UNWIND(.fnend		)
 ENDPROC(ret_fast_syscall)
 
 /*
@@ -74,7 +77,9 @@ ENTRY(ret_to_user)
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
-	bne	slow_work_pending
+	beq	no_work_pending
+	mov	r0, sp				@ 'regs'
+	bl	do_work_pending
 no_work_pending:
 	asm_irqentry_exit_to_user_mode
 

-- 
2.49.0

