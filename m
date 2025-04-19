Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58CF1EDA0B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102192; cv=none; b=dsEqXFOoFkzK2JvVMzubC8P+iWDxgVDqOxH0+VOS0nuXwX0D1Xp/TwCHl5EEyOVldZrsm4a+n9lWllfszoH5zXLvs77tXXkMnUjOoQfgIpqvWTSKsogZ5rRG/zjjVx+sOXrwbyG38jzNx2Y96cGCijlWa0EJV2eWuk5H2bUTzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102192; c=relaxed/simple;
	bh=F7VvDgUlgfGOSB+9rshUd3mbttPd084qdopa/4Grg/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfbaV6mUE669k/kceTEVpxFKu2pClxhX2ndDoJRXTQ8IPoZ17623EPabqnI8pw+KRYbETcn9iGa0rZBXnhLoNun92d3Lk3OEkpDGNUBLf4Q3oFytYn62qOPuToxJFnTeysj68W3fLtcfg4j0iWEaYhAJYR7EV1djNnttn/gaSYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLO9RplD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLO9RplD"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c090fc7adso3177224e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102189; x=1745706989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qw0V66m60nCqUZ6I3CWtDCcAEKaevGAZ9HVr27fyCOs=;
        b=pLO9RplDb31kh7PoBdc3jip4s63wga1B51vzrwhdQvh2kOKE4dd9y2KFdffwMC2Ehg
         XmAtQIAuS+96CjUpV77bKOJpXC519p6dJnpcPWTVoRpXJaOJR2ZHtSken8g+13wPfMiL
         i0C/s9BCXKKiLbiGYPkH84P7OqEY5KvrKTZpAk/sY5aD36rTJgxKM3CdpZApRiwLtd0a
         Fc86Lvo7CB+2uxS055iRDIEbLiQ2ANYSVrGW+YcPtiiPd0H4Ta0o+LAVR0vLtyn1VlV9
         +jwME1h7Tc7ncib6wWUnlmYmjqIq6eP1xO0F6FlWiqOH2WPMqO9pg/H3rGWQd5nhA4A0
         mxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102189; x=1745706989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw0V66m60nCqUZ6I3CWtDCcAEKaevGAZ9HVr27fyCOs=;
        b=q6E70NnDdpbsnosgbPGafRGn7Txwjm1K0vaEvzLAhdH6lwwS4JUSF1F9DLZKXWonei
         l66D08VvjFv+VGVaS5okwhvGjKLWMNNLXU9uSwpQfhHA4KOdyuBJ+BEB1Nwh9x/eOTrl
         H/fHI38pPmqTJVhmGC1P0UOhduL/13skNUR3dEO5+gtwv2eDxwH0Je3Aag1FbwFAHJwE
         wzZNa/xQX4rZoJXZJqIC3q63rzgkZFFY3v/mtjcHM5RKJTrxeTmgWkFqMfGB4PicdmnV
         Y54lAjDnG5dGwrgRke5xDiwrAypdKqLJveNiO/+rAijguh2QQ/OQNyi0COo6YvJghX3h
         jpJg==
X-Forwarded-Encrypted: i=1; AJvYcCUc+RsO6q7KtDOyXA1kO2MQctQxRFzvnMKlNzmS3IZ2Mqr6gEP1i7ojTgzmVf77ls33xlyRzNKI1L8Hkfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhle7YmdAsYN08LlrFDYkzBJWHmk2uj8wYt1hXdYvmZlI2xQb4
	TZeALMU4jSg0uyM0762j8Zi9JA8cYJzuxSPMo2gpeGT0dvKh/ig3cWu9a40Ye/w=
X-Gm-Gg: ASbGncsRnriXMG9RcQo/rdrUBY6eHcVDPqVjKx4to/IRDrS67oJQi3a77OY6IvO9Kae
	klqH4kMGfucnboXKVwBBnDJ5+ZYse7LVc4idG8h49+9RLW+Ko6NyH+6nWLJL1YobtGk2Uix7nvx
	dYKKtv0mY8a0MpvWM2wSPioZFsX3HPfIILYeitPRwHbesNd3pk6KVNXGokVfNRcgmcqTAt7DO1E
	PBD2YZJjRaX0OfFfU0GS7Qja3s+NpjkDxkhuboRutnYbhQEOrUtEA3BJm+iLqBrBBvFaEdMo1iS
	Ec5l3vwtyE+1NdH9gY2wF6+PxdqW/szSmAKt3S5ffAkeU/OiMv0=
X-Google-Smtp-Source: AGHT+IF0LG448Co8asu2b12O+qf9qV9IKjw3budk1sW5xJ+8nJP8Lbabi/R9ROBF67ZAdL1nIqOrww==
X-Received: by 2002:a05:6512:1598:b0:545:1d96:d6f7 with SMTP id 2adb3069b0e04-54d6e63528cmr2119221e87.32.1745102188993;
        Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:12 +0200
Subject: [PATCH v6 25/31] ARM: entry: Create irqentry calls from kernel
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-25-95f1fcdfeeb2@linaro.org>
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

This adds a few calls to C when exceptions enter/exit from
the kernel itself, so these can be used for generic entry.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   | 2 ++
 arch/arm/kernel/entry-armv.S   | 3 +++
 arch/arm/kernel/entry-header.S | 5 +++++
 arch/arm/kernel/entry.c        | 8 ++++++++
 4 files changed, 18 insertions(+)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index 8b8cc9a1eefbd00dd75d4e344576fc184a413768..a78bc5054b093120e903f08369fb8b1a9feb7f81 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -12,5 +12,7 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long);
 void syscall_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
+void irqentry_enter_from_kernel_mode(struct pt_regs *regs);
+void irqentry_exit_to_kernel_mode(struct pt_regs *regs);
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 3cd5a80b47758867d1db6c3971030370bca1551a..f64c4cc8beda6bcd469e6ff1a1f337d52dbbaf9c 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -205,6 +205,9 @@ ENDPROC(__und_invalid)
 	get_thread_info tsk
 	uaccess_entry tsk, r0, r1, r2, \uaccess
 
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_enter_from_kernel_mode
+
 	.if \trace
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 51c7f93c1ded1db56f173c7aaed8094ef011ff5a..49a9c5cf6fd5fbb917f2ada6c0d6cc400b7d3fb3 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -210,6 +210,7 @@
 	.else
 	@ IRQs off again before pulling preserved data off the stack
 	disable_irq_notrace
+
 #ifdef CONFIG_TRACE_IRQFLAGS
 	tst	\rpsr, #PSR_I_BIT
 	bleq	trace_hardirqs_on
@@ -217,6 +218,10 @@
 	blne	trace_hardirqs_off
 #endif
 	.endif
+
+	mov	r0, sp				@ 'regs'
+	bl	irqentry_exit_to_kernel_mode
+
 	uaccess_exit tsk, r0, r1
 
 #ifndef CONFIG_THUMB2_KERNEL
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index d7fdb9df33312dd2a914b59512b701748f33b597..674b5adcec0001b7d075d6936bfb4e318cb7ce74 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -56,3 +56,11 @@ noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
 }
+
+noinstr void irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+{
+}
+
+noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
+{
+}

-- 
2.49.0

