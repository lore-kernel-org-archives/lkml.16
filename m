Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC94D1F0E56
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102176; cv=none; b=R1tuShSYhnk9kBPLUmkUHE64WxdECRFyZ1Lw9Ri7UZfxZfvwdsTznEjjhgc8S7st1jET4HhppRkuqWHCZFvUFKfI6cDkc4vI3cAwvS8ieUvZR3k2UFBurrYvSz3UF/DQ4nceZIU05MiGtz0ZcSdXxQ6ASE50mjCKI2LItYvRuq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102176; c=relaxed/simple;
	bh=WVu6brjsAm8LEoheLO7yeNj/XkBw3giaH9+hopl2TYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+jzzsneT04R2CW72hyqJzersHwONhW8zwFiwI/8yeb6du2MFgBHJ3+EUUI43AXfURnY+TmYVZ7HgbNYJXBtPX6WZuKFcA+JYwgYSaPk2BX/EvD1XciFAxynZ6rnodkFUL1SXoJKtS9nPq53Y6VRElYSf3glQ6wooT+quOMvfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+D4jPT1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+D4jPT1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54e6788d07eso48281e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102173; x=1745706973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/0cVDZGMnreZxruSLY2dvzSLDJCCUi+BRk/vmsfPVk=;
        b=M+D4jPT12tY7vutkuZ1fUlSa97CsJxBtbhAvaf1HR4ZDbJQS9rxPQq+Oq9mzGuOfnJ
         EwFtweDrxZAsg8/NZ//qN+EVu6F3HliB8nQNFgQfi/bdcCeesiZ3UMlrHMKIyHj6yigU
         2wM1Ho7uN9K3PTSU8KWsQ8s6UPKD1iQ8GB/GLxNxlJN2AW8iSJizLoMoOrGXSKL8C3Fn
         pfhHuGjp/dNRdClRDeNHbSaGBZSuLz22+DOfSYMWnBWbGzRzblOslOfq5aSwR76AbHNg
         35xAuKAqSMO8SZlDO+ZWGgTo3DcyUnGX5ja2T/rM7q8+I3LF6NjS4L8SYMQmCEqoOamm
         XzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102173; x=1745706973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/0cVDZGMnreZxruSLY2dvzSLDJCCUi+BRk/vmsfPVk=;
        b=awm1R/ZkGrBTt60Mql3BnQv0s7aedRrpfFqRy+jN/mIGSM3dCmZT0Sh1BHfFxqZB5R
         A+qBh2q8nricZ7LWHnAbKTCxgKvBjHqUeLnrbIlm32IOyKfA3LbqrrYPZb3mfzK2PIBE
         l3ZGZaBI7Vg9378uZtz1PAtaDH/yBnmtWQ9qort93E26+JXrS8ZCUBvc4/ClY+Dx7AVa
         904BnLTtRe5ay7yoMhujTkLdd/68JBtVKf87bXT/9/5xF95y4tz0NKu77UlFbnXMoQvH
         o/4qH3ZVReaMbacS6v37FgzFp9KLK97RwM51ZEwYKL3Pk0f1hWQGQnQMdLlv5mAjuUwn
         2cbw==
X-Forwarded-Encrypted: i=1; AJvYcCVw2y7qWKBdfmcbGcU2jLfu1izrxtn2lZcOw9Gmheyb7X/oJetkhPPOjJtQ/pYNFv+l2m2H+JqP1ui47zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoXfCeYv9gOuOU5eXF06EcGRmGjTWDTO6We5o4onuoAbD5pLmV
	ZSWjC9xiWw+MYykhCbtz+J1UnNR6in2x6tHWlbgem+o+kwOZ9na23jSLA2oWKO4=
X-Gm-Gg: ASbGnctVg4PBXHGabS4Z8XIV9R1nESUvaQ20zeC70LIw7G3PYcFuGxCdbGYqK2U3qJ5
	cvAwEBEoPtUd4vUEOlmT1s+Kh3Bi44ME2tvE2YNA0anZTpAlG2OUFxYtj5bn7J44uCKhrk6vmGI
	PLJsBAusIioRNubAXL5FXAZXf6bkw/NIAurr1JxMqcOxt0pnHao5H21NxGqJ0/MOpTEX0+Y9zjM
	WD8qDzmnGBGGHpOSfuhKacfGOWe73DNNeMbqW33zGOOYSWJUdAAY5Sx077C6ILfiIm/bH4QLBay
	z4VBEVEN4EMpmuVUjXZ4eH3Uw8s/uX/56bFZewYs1deqq2j1sVQ=
X-Google-Smtp-Source: AGHT+IH5eyW+1pMgdFapklrs6OWOvrrQJkiCwqKe7oqBFGUg8NWg9+mef9o53f+m66wsGks9TAtwsg==
X-Received: by 2002:a05:6512:2c98:b0:54d:69fd:3598 with SMTP id 2adb3069b0e04-54d6dbf59b2mr2418793e87.18.1745102173077;
        Sat, 19 Apr 2025 15:36:13 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:59 +0200
Subject: [PATCH v6 12/31] ARM: entry: Rename syscall invocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-12-95f1fcdfeeb2@linaro.org>
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

Now that we do not have a separate trace syscall invocation
path, rename the invocation functions to be generic.

This can be squashed into the previous patch, it is just done
here for the previous patch to be easier to get a cleaner
diff and be easier to read.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  2 +-
 arch/arm/kernel/entry-common.S | 10 +++++-----
 arch/arm/kernel/syscall.c      |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 9c664d8c5718f58034f442c20a030b59faf65dd9..b94fd7ce17f82f0baf06b74800245112e1f13002 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,7 +19,7 @@
 
 extern const unsigned long sys_call_table[];
 
-int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno);
+int invoke_syscall(void *table, struct pt_regs *regs, int scno);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f0f1f8723965313b287158fb2a238908db72fcd2..f1e48002bd3075ea67b5883178583127fa0055c6 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -260,7 +260,7 @@ ENTRY(vector_swi)
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 	mov	r0, tbl
 	mov	r2, scno			@ syscall number from r7
-	bl	invoke_syscall_trace
+	bl	invoke_syscall
 	cmp	r0, #0
 	beq	ret_fast_syscall
 	/* This path taken when tracing */
@@ -390,7 +390,7 @@ ENDPROC(sys_mmap2)
  * r1: regs
  * r2: syscall number
  */
-SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
+SYM_TYPED_FUNC_START(invoke_syscall_asm)
 #ifdef CONFIG_CPU_SPECTRE
 	csdb
 #endif
@@ -400,17 +400,17 @@ SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
 	/* Make space to copy the two syscall stack arguments */
 	sub	sp, sp, #S_OFF
 	mov	scno, r2
-	badr	lr, __invoke_syscall_trace_ret	@ return right here
+	badr	lr, __invoke_syscall_ret	@ return right here
 	ldmia	r1, {r0 - r6}			@ reload r0-r6 from regs
 	stmia	sp, {r4, r5}			@ copy stack arguments
 	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
-__invoke_syscall_trace_ret:
+__invoke_syscall_ret:
 	/* Drop the copied stack arguments */
 	add	sp, sp, #S_OFF
 	pop	{r4 - r10, lr}
  ARM(	mov	pc, lr		)
  THUMB(	bx	lr		)
-SYM_FUNC_END(invoke_syscall_trace_asm)
+SYM_FUNC_END(invoke_syscall_asm)
 
 #ifdef CONFIG_OABI_COMPAT
 
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index 36330023b5484399a4ca2fdb5727b410e2c74b6f..6f518ec3870fb36a64d1b671b20f96d63a52bf78 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -8,10 +8,10 @@ static inline bool has_syscall_work(unsigned long flags)
 	return unlikely(flags & _TIF_SYSCALL_WORK);
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
-__ADDRESSABLE(invoke_syscall_trace_asm);
+int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno);
+__ADDRESSABLE(invoke_syscall_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
+__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
 	unsigned long flags = read_thread_flags();
 	int ret;
@@ -23,7 +23,7 @@ __visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
 	}
 
 	if (scno < NR_syscalls) {
-		ret = invoke_syscall_trace_asm(table, regs, scno);
+		ret = invoke_syscall_asm(table, regs, scno);
 		goto exit_save;
 	}
 

-- 
2.49.0

