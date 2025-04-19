Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B321F2B85
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102182; cv=none; b=sfExNzHFlyuqtlEgxy4PWd4p7A5Es63pVh/gFHLRE9dmWKD7nvfOrqozswONHm1iJuo+9ie/GXI4AiYDVOy3Mh3uOLgDe6aZUMLeh638/u4Hlx401twxHw/Ff5corhy+LP6oSzjSo3r+uzoIP6DL5VPDxEUBZ8FuU4OXj7MarhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102182; c=relaxed/simple;
	bh=zr0CcD5C0UUiD02F3/fRpPP+MUf3gA7MAaEq74iaGUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggerBkJG8t9cIo/vi1K3PLdjZkNJ2ZmNArQ9kU6fS8f+B0xCoF6VtvWpEiqG+SmacPk4ELufKj72Ucb7JKE3e115ykPvtF4qfptZLsEE2FDjQZ1kMwZ8gk74BckuPhB+I34I4uROoyxtVnd0x/chouDccQyBVDSfnLJ9Y8J0yvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWFqVH+S; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWFqVH+S"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499659e669so3151393e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102178; x=1745706978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx+9sB1KcBfjXfw9YO0MHYbVgVBIoUFxRPysD28QEy4=;
        b=zWFqVH+Sz4Yqs5PoMEF+ab4SbrV2Okdof+Fj348EuNpNSqr5gW3amuOPqIyX4TekyW
         oal35Fzqre4OhJA4fOj4KBnPdNZsff2Rcx8+jcUJtJWK1Eq2MUSFJeqxOzogqCmPkNp0
         YiSOnOMbHkxIy/CM4sPaClokRrBmotZJrPJieDmPv3WQsZ1LGz1wNZ6LtP8NnADR/vQG
         k1cfwjvft5+68tqYt5FUzIbpLSKAVAcu5U1PZh/WT/+c/C7QDeTolkjXerB0UwPHvFWg
         /Mh8LUIzMu3SZs3FnJWe319nS5bD2/ovRsYBcxR2P+ACPQZ6ACsLIvSiO1aE0YefB3oR
         IUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102178; x=1745706978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx+9sB1KcBfjXfw9YO0MHYbVgVBIoUFxRPysD28QEy4=;
        b=Lxx4RQeZWQyPJtXApPWwe7cKN0/LvzCtvjz1rn7sQIF/Pr4IYpGESJWLooy5isjO7E
         xEVmFRUFfwbt87P6YTtqszBtVx9BBr9nYcewe6XeDUX5FGv4QFsF3uf5UNJ0s1GlLtVZ
         85F/mj35tkLpFCYtY/sdsi6dG4BzZMMDa9Jk1atd5LkOoAieofgsB+tMED+MJR4rTBhT
         +9XbNVa/FnuIqP/tKFQIhGcMTicXdN7hCiA/bj2PcQzq0+jqvciRrsDI28rQ9QOaI5Jk
         KtfLtlaBzlho8sggbb6+wPo4VO+60uI1E4h2S/DT+oG7nYuKAb4gOVHE1+2o5qhPhkDu
         47CA==
X-Forwarded-Encrypted: i=1; AJvYcCUPxDqg8F/EM5IUlncN1POheN70/q7Mu/ZYNiEUWglNmBgR94/oVRNCY+ECiE8CL61bCxqT00a2M8GdgOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsR4A+auSGemQQey4i8jZnw+82UYjthPfNJPxPDHogizQm+7s1
	fgPW6G2zOcTL+swqhpzk1lQGD6TScjw9UDnLogSvwLofxjlPJ9kfpfP0FuaCXxU=
X-Gm-Gg: ASbGncu7bZBqHJBonwtAiAxYBLoNh34u+mqIaCooqjEE5WIQOoJo+08KecVN/5RL5Lg
	N7++rFg65VL4Oo8cpqxNa1eTGXgNEQdxvGoigpCm9sE74ekH4P0hviHlKNv5kIl1egln1FNx1GV
	jl3TB3h6ajvYtDCoJa0fCLfqylSs8lBybB6kq1JNo6kdJZ4+oi2rNJMz3v1NtfAHSp4PgWjzEuR
	rrZCe0CyMq2sYH1nX9TbFaOQ66Zvzyu7G7/DZDfr3F7QT4fYO4zrv9n1OzbbC7XYMGb10H+iz/T
	Dc4sWXJBi6DMAC8lb4w+6yZYMYSfH9gFQI3G/i3V0TQ8kTCFaKM=
X-Google-Smtp-Source: AGHT+IEVMKYD0E4jGirYdTdJ4UFmci4roeaF66kGKgMlacyKSm/VZhP9xKOdtongxwYEh++1VrWQXw==
X-Received: by 2002:a05:6512:2309:b0:549:8f49:3414 with SMTP id 2adb3069b0e04-54d6e61dcc1mr1908146e87.6.1745102178019;
        Sat, 19 Apr 2025 15:36:18 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:03 +0200
Subject: [PATCH v6 16/31] ARM: entry: Drop argument to asm_irqentry macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-16-95f1fcdfeeb2@linaro.org>
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

asm_irqentry_enter_from_user_mode and asm_irqentry_exit_to_user_mode
have a "save" argument that will save and restore registers before
the call to the C function.

Now all invocations set this argument to 0 so drop the surplus
code.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S   |  8 ++++----
 arch/arm/kernel/entry-common.S |  2 +-
 arch/arm/kernel/entry-header.S | 18 ++----------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 6edf362ab1e1035dafebf6fb7c55db71462c1eae..460aa92c3c1f50de905550acf363c58f509bfe0a 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -422,7 +422,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -433,7 +433,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -447,7 +447,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -472,7 +472,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
-	asm_irqentry_enter_from_user_mode save = 0
+	asm_irqentry_enter_from_user_mode
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 14b2495cae3c2f95b0dfecd849b4e16ec143dbe9..df564388905ee019cd5553f8b37e678da59e3222 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -109,7 +109,7 @@ ENTRY(ret_to_user_from_irq)
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
-	asm_irqentry_exit_to_user_mode save = 0
+	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index fb5bb019199b2871e29e306a29bea8fdf47dd7f3..50c0b55adc7421e7be123c9d00f94b1ebb93ff9e 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -365,28 +365,14 @@ ALT_UP_B(.L1_\@)
  * Context tracking and other mode transitions. Used to instrument transitions
  * between user and kernel mode.
 */
-	.macro asm_irqentry_enter_from_user_mode, save = 1
-	.if	\save
-	stmdb   sp!, {r0-r3, ip, lr}
+	.macro asm_irqentry_enter_from_user_mode
 	mov	r0, sp				@ regs
 	bl	irqentry_enter_from_user_mode
-	ldmia	sp!, {r0-r3, ip, lr}
-	.else
-	mov	r0, sp				@ regs
-	bl	irqentry_enter_from_user_mode
-	.endif
 	.endm
 
-	.macro asm_irqentry_exit_to_user_mode, save = 1
-	.if	\save
-	stmdb   sp!, {r0-r3, ip, lr}
+	.macro asm_irqentry_exit_to_user_mode
 	mov	r0, sp				@ regs
 	bl	irqentry_exit_to_user_mode
-	ldmia	sp!, {r0-r3, ip, lr}
-	.else
-	mov	r0, sp				@ regs
-	bl	irqentry_exit_to_user_mode
-	.endif
 	.endm
 
 /*

-- 
2.49.0

