Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70865204855
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102194; cv=none; b=fhOUI5z9fooso0j0Fp+ZULOBuyY4AjYMsxRD40I2mKhkKOoeC5cZ1mX+VRpcZF7oYINUiwm72xG/Lb65F/I/t7CAmJcZ5wmkxAcy4b3lReTDW8naxxa5/DOWhF95wqxNPNEM8owIL7AiAAqkOqY4jt/uKV+IdE/XtfXyAZt+oDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102194; c=relaxed/simple;
	bh=N8RNWlP8Dv7mMzwffncyDVJMLt8wxm1aFqm7vuWENBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcbKH9A3SOzrL09nAgosKfD+b81EGsDqTYRfLlkLqMyvyfPkVqCaM7rQxtOhWHX2z7pq6GQ5Czi9UfmIKjB5e+ZJiNJTX5Q2Jk5/QVXGx0B8gk8VUSVGqZeBQEpztLajkry8iCj5wFqiJQmWCp+QZVr9gbmwbDn9juvWb3uOJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R764aesP; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R764aesP"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso3503857e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102190; x=1745706990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAvsOPeP+oswKyJJsbXrokIjvFxvOZNdow0lpkJuB2U=;
        b=R764aesPnromGN39qjAQ1HB4wb/UQIyENmAn/8dqtkgxINYKsmPgA/pAgPBHS3lP6m
         1mTk/d2ULPez9fJaJHK8hQ/f66lwq+mYeHxq7/jMN1/l7PDT7gB1Ak+36CCSKnRG0LZg
         oPcBo7swVyXJrFuxZ3ml/5VN3RAVo8nem9l8ujiVfplCPS8M8RwM31MXrLunRwrx9TD4
         F8RC+hWO575EYpSOdbGtzAx8VRfSmFePUUkbyAPz7bat77aveH7+u+Tmd+TXbKqQQDGp
         rYzCo/ea5mud6uZdYn7QvXAyrJOcLcdj2z8Gd7HW70UPH9RzYKCYiGd/4gT0LGMBRLmU
         8yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102190; x=1745706990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAvsOPeP+oswKyJJsbXrokIjvFxvOZNdow0lpkJuB2U=;
        b=eUSc8nsBj6mOOyvlhvR2B1juw3MBCiQeSY5nuiAuzK/gIeMReByW0JPQ1BQT2YV+s5
         FETkSX7CctAtis3P9IHKxI3soMK0SfyytzzNcGBsggrkehUt2EmB5Nev6ENK4JY53Kcm
         rBC8++5W6hmGF9PYz9M/a1CCFUjq7zg8iopPw6URseilko7bkxnxzd/xQKntx0/qxf5q
         ZZmz1GilfwRSSoZPw56GrB42+ubW+KZ/fatZOpn5xFDQ5n19+L7rA3giE3J6/uiIep8R
         zGllur4hApWR5osEiazgUxA3Bb7Kp9mUs/tVlFZ+20wd6iTip89ET1is1Jjsv6hhAaol
         k+gA==
X-Forwarded-Encrypted: i=1; AJvYcCXFvqHB9TmyjvhzWOltzKeE/1juqlFHJuAs1UuqQQgtKBF5Y6EbjqmXxsDLlDdhzafbDw19oBfNm1qjZcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaMjOzJPgrdCu5d9Yc4D0Fs5j1p+GDJNlJPdx/R68CeeE4Vwm3
	wOhO9NWOo3xIfRN5iTpDF/F9OlH+v9Lh/MdciIUg7zitUDCXwMbJe+SpvnJKU4E=
X-Gm-Gg: ASbGncsJG7B9AvFK83MhJ821dMoa7YHi3ek+MxR1OLjUi6jrxBWzEM6tkEnKwgp4oHZ
	NytWjOGAK9bzGf5WPbtFdXYHc/ZVXbW+2Pi+Aur16p5y85PKhXogSkschKZIFnjPhevLBNiGPUr
	tv0CMioYhunVyzrBZoe5gii35XpY4ZGl7kNKS4T0enNRjgXxGMmIP4iObfzehoco0nViIOquOnN
	hXBrd30VvJqCz2yIh0+/GHZHnmbYdXvUsfu6+0P2wb6bRw9FqCe9hmx4nHJqFzwBK4JJJnGfTOW
	OeWlCNomse0jLFdNhV3hEuuxEoPu5VqYMeVY01GpUEGlcX7/83uok3HUtgeNpA==
X-Google-Smtp-Source: AGHT+IH/THCTqweTbW4N/TTTzB4n2Pk1gT1TCe7h8Q6RxxoyRxUigVdyth6ikiAYh3mwUJu0bcl/Uw==
X-Received: by 2002:a05:6512:234f:b0:546:2f4c:7f4f with SMTP id 2adb3069b0e04-54d6e633de6mr1960703e87.28.1745102190459;
        Sat, 19 Apr 2025 15:36:30 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:13 +0200
Subject: [PATCH v6 26/31] ARM: entry: Move in-kernel hardirq tracing to C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-26-95f1fcdfeeb2@linaro.org>
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

Move the code tracing hardirqs on/off into the C callbacks
for irqentry_enter_from_kernel_mode() and
irqentry_exit_to_kernel_mode().

The semantic difference occurred is that we alsways check
the PSR_I_BIT to determine if (hard) interrupts were enabled
or not. The assembly has a tweak to avoid this if we are
exiting an IRQ since it is obvious that IRQs must have been
enabled to get there, but for simplicity we just check it
for all exceptions.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S   | 13 ++++---------
 arch/arm/kernel/entry-header.S | 19 ++-----------------
 arch/arm/kernel/entry.c        |  5 +++++
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index f64c4cc8beda6bcd469e6ff1a1f337d52dbbaf9c..2a789c8834b93475c32dcb6ba5854e24ddd8d6e9 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -158,7 +158,7 @@ ENDPROC(__und_invalid)
 #define SPFIX(code...)
 #endif
 
-	.macro	svc_entry, stack_hole=0, trace=1, uaccess=1, overflow_check=1
+	.macro	svc_entry, stack_hole=0 uaccess=1, overflow_check=1
  UNWIND(.fnstart		)
 	sub	sp, sp, #(SVC_REGS_SIZE + \stack_hole)
  THUMB(	add	sp, r1		)	@ get SP in a GPR without
@@ -208,11 +208,6 @@ ENDPROC(__und_invalid)
 	mov	r0, sp				@ 'regs'
 	bl	irqentry_enter_from_kernel_mode
 
-	.if \trace
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_off
-#endif
-	.endif
 	.endm
 
 	.align	5
@@ -239,7 +234,7 @@ __irq_svc:
 	blne	svc_preempt
 #endif
 
-	svc_exit r5, irq = 1			@ return from exception
+	svc_exit r5				@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
 
@@ -303,7 +298,7 @@ ENDPROC(__pabt_svc)
 
 	.align	5
 __fiq_svc:
-	svc_entry trace=0
+	svc_entry
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	svc_exit_via_fiq
@@ -321,7 +316,7 @@ ENDPROC(__fiq_svc)
 @
 	.align 5
 __fiq_abt:
-	svc_entry trace=0
+	svc_entry
 
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
  THUMB( mov	r0, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 49a9c5cf6fd5fbb917f2ada6c0d6cc400b7d3fb3..cfaf14d71378ba14bbb2a42cd36d48a23838eee1 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -199,26 +199,11 @@
 	.endm
 
 
-	.macro	svc_exit, rpsr, irq = 0
-	.if	\irq != 0
-	@ IRQs already off
-#ifdef CONFIG_TRACE_IRQFLAGS
-	@ The parent context IRQs must have been enabled to get here in
-	@ the first place, so there's no point checking the PSR I bit.
-	bl	trace_hardirqs_on
-#endif
-	.else
+	.macro	svc_exit, rpsr
+
 	@ IRQs off again before pulling preserved data off the stack
 	disable_irq_notrace
 
-#ifdef CONFIG_TRACE_IRQFLAGS
-	tst	\rpsr, #PSR_I_BIT
-	bleq	trace_hardirqs_on
-	tst	\rpsr, #PSR_I_BIT
-	blne	trace_hardirqs_off
-#endif
-	.endif
-
 	mov	r0, sp				@ 'regs'
 	bl	irqentry_exit_to_kernel_mode
 
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 674b5adcec0001b7d075d6936bfb4e318cb7ce74..1e1284cc4caed6e602ce36e812d535e6fe324f34 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -59,8 +59,13 @@ noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 
 noinstr void irqentry_enter_from_kernel_mode(struct pt_regs *regs)
 {
+	trace_hardirqs_off();
 }
 
 noinstr void irqentry_exit_to_kernel_mode(struct pt_regs *regs)
 {
+	if (interrupts_enabled(regs))
+		trace_hardirqs_on();
+	else
+		trace_hardirqs_off();
 }

-- 
2.49.0

