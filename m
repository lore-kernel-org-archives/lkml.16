Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D9B2045A0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102191; cv=none; b=erh5AATQvIOw62wGbTl0aaC6y3R5aOPDFlmyln7BJZn6wpeA9+8MuRWy697zRqdHVCuycA9WgMrQazwELhFklfTi8YnuNN2XwBjchUU76JCEmhci3lcJ4ZQAtKobXIJM30Okm7Idp/4ykAvrrRfQfiLfC3Maw93oOGBwnbm72gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102191; c=relaxed/simple;
	bh=PJv3fcmmCLyBKcEzeIRm+ZmuyJOawNybbGFw81URgAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blo7Z9mZsavhHT6jwMCoL7FStCz8FTqouIbcJrdfkEazQWF9FtfKHW0gJPV0/LE1a/Oq1WX2cl36Yvx2JaTZgrbNyigzaFg0C+ZIrYvdn96fborRVy7Yg+YtRIaa2J5bvtf/i9s6q/gSvuWc1X6ya2OZCWDgap6kcV8z4Gx1SWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLRiDCjY; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLRiDCjY"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso29317781fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102188; x=1745706988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0QkVYjXA/9OCp1QGsNJRd0EN1x8yIqxmjYApguAD+c=;
        b=uLRiDCjYSxufZ/6T5BxPs7cQjNhSZJ+eC9dET0Y6qJuv+2T33qWikcGykLx3QSVXPi
         SbRPf+LfbEzyhh6XgpPXB7zV6k6809PmsY7Eo3mWBmwnl0FPzlJNpe/16L/7PGHcSgM7
         drXK4fd5gXVr4Ipo666KofsN30v+PJtkWHYqmWi7CMhPOA1/bBMX2PNhue8iR3RaKsdf
         XcfUutBeR6q7Q1o9+ygd0668e3UfztnZFYmrCWbH5YEZ7M1MjWhBFmHPGyV/pUIagzxa
         UC9Vl4H6JBS+cIx9651Q6Np5QOapjUgU5XIBr7cLmAQwqP3mQ6rt5nR1NZkCgiCc/8cU
         mQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102188; x=1745706988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0QkVYjXA/9OCp1QGsNJRd0EN1x8yIqxmjYApguAD+c=;
        b=klp0bnkEBHxJ04zWSM6l/tD7uninaAz9DLC3Kz0qwGJQWdBr+9OmbTEf9zRB5VVJkA
         SSzNXPWuIA5wLjpH3EVCrznpzS17yQwIvtYcWE3NHRrTHox0YdoFMo4zO/jk5XWhuCBQ
         /ktTJhc0wyol+mxn+SuNKfKbZRi2hOvQwcFbd83OlTzCL+HcJ1Vc8GoEgi2HX8ed/VIR
         frUyByW33GFPSZaC1GNl/CjbO8Mn+qbID8J00kbUhZmDuDwbzbcoJou28WwysS9tYiIv
         JI2XnJVL1yGCTvWMl8JE2sN5iKjETZRGsA4Nu3Inipu/DlSDfTCqr2antW04mxxFhUEs
         mUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUye8Rp30ZtnvXrENa6I943A+PEKqRUjwNFCbUhlzuCvrWQp+JorrqMih1ea+suqhfWeqqc0wqvXaLsIBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUDwFFcoJYfcImkaAGvpbd7Fxvp7WVOTQ7QrDQWpGssBWQdsp
	m/XJdoKMtAHtKvrtZbyw8FiczVE8fijoFBIetOoLl+14o+Xt72LGU0zoi55hMMs=
X-Gm-Gg: ASbGncsfljqixZuGbrXd0jttJk9nHEdmTxJK6SCb3tVnyj9aVHMx1s+vneNxOJwetga
	ySDy9WcYoddUhkb9wLwDkGuU6dVsLdlZIvlv5FFuxCTeMN52h4tmhyOruCm91Xen6kGmB0R61P+
	FVal9bW8PkI5HdlWlHMaEAGfecSLNQ6cNsDCqx60iaY7Ocf2p0DE1yhw9mMjZP4GAVv2SDKDhzr
	GZMrK762i95b459TsWM5kZYA1MXz1/sxdwTZAM+/uIu54Sv7lLziDY+Q+YO88gluiqNIHnGjgSQ
	sWk4qV6jJQd/ud0miyWspNE0JB+HwLsJIuCzyVx3uit0eyArGcE=
X-Google-Smtp-Source: AGHT+IHDavBZ93agXbUvQF/6hQ58d4kFKhgOO+0wouRyvNbR41VTEJgISr5/oKDvWNecLDObQqdXtg==
X-Received: by 2002:a05:6512:1318:b0:545:2b24:c714 with SMTP id 2adb3069b0e04-54d6e62c9c2mr2159440e87.18.1745102188074;
        Sat, 19 Apr 2025 15:36:28 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:11 +0200
Subject: [PATCH v6 24/31] ARM: entry: Complete syscall and IRQ transition
 to C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-24-95f1fcdfeeb2@linaro.org>
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

This moves over the last few lines of assembly to C. The
subtle change is that in return to userspace from syscall
(SWI) or interrupt, we need to call do_work_pending()
as soon as the thread flags are != 0, just checking for
work with _TIF_SYSCALL_WORK is not enough (the machine will
freeze if we do that).

This is because do_work_pending() does not just handle
work: it handles _TIF_NEED_RESCHED, _TIF_SIGPENDING,
_TIF_NOTIFY_SIGNAL and _TIF_UPROBE as well.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 13 +------------
 arch/arm/kernel/entry.c        | 19 +++++++++++++------
 arch/arm/kernel/signal.c       |  3 +--
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index e2ac6d3216b6828d948d60c424ff95ccdad12331..6b0f86786a7d9e656ecbe8c741f2edbcbafd2915 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -61,12 +61,7 @@ ENTRY(ret_to_user)
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	1f
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-1:
+
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
@@ -74,12 +69,6 @@ ENTRY(ret_to_user)
 ENDPROC(ret_to_user)
 
 ENTRY(ret_to_user_from_irq)
-	ldr	r1, [tsk, #TI_FLAGS]
-	movs	r1, r1, lsl #16
-	beq	no_work_pending
-	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-no_work_pending:
 	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 88a7a699306ab61153d57333c26266b9161f5466..d7fdb9df33312dd2a914b59512b701748f33b597 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -6,11 +6,6 @@
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -28,7 +23,11 @@ void syscall_exit_to_user_mode(struct pt_regs *regs)
 
 	rseq_syscall(regs);
 	local_irq_disable();
-	if (has_syscall_work(flags))
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
 		do_work_pending(regs, flags);
 
 	trace_hardirqs_on();
@@ -45,6 +44,14 @@ noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 
 noinstr void irqentry_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
+	/*
+	 * It really matters that we check for flags != 0 and not
+	 * just for pending work here!
+	 */
+	if (flags)
+		do_work_pending(regs, flags);
 	trace_hardirqs_on();
 	/* This context tracking call has inverse naming */
 	user_enter_callable();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 03b20637a2e1ca6f327223c9132915a97a9c4697..a39ee14ec5b70b3738ecef537709326ef1e8217c 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -598,8 +598,7 @@ static void arch_do_signal_or_restart(struct pt_regs *regs)
 	return;
 }
 
-asmlinkage void
-do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
+void do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
 {
 	/*
 	 * The assembly code enters us with IRQs off, but it hasn't

-- 
2.49.0

