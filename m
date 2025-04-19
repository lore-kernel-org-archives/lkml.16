Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451E203713
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102189; cv=none; b=t8YZ3rtqJbERzIndLHjn2zz17WvXMdFG2prhDwYD7M0fEbUvjKn/JHnZp/W160U9sh+wo8NLvP6FXWMaHGIwCW25tbGDCeKcTy8tgKEil3vBPMzBsYL5OWj+89hT8gY4kTfuxp0iAW/MZXY7KWPd3DcdY0JefMcODdoVSPca2i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102189; c=relaxed/simple;
	bh=wdz1T+zii2RG/EgefjsFSrGL9mmJN1Zi/51bwRmH298=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtTjM1pRqh4cFan607jYvd/I093EtgSYAap+HeFO++IovgR7QcbC7sI4VhpWVF4e2X84bAcER6q3SORNFmBY6g7faP14QFK5TT/dAH+k4LhpRy9NP7J8FsCHndBgx69rD6b8lXXtUnrL8wqOVhpLA5MyOverrpvIiPoc7bn11jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZ32uVf/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ32uVf/"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2762038e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102185; x=1745706985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD/Nu2Av3rMkoCf1kcmDdMh+qfX7Gu3u+XPV0sJ8QcQ=;
        b=KZ32uVf/dwvcODhoIqunlh6gmG/WgWTfWsbtZ/V0LXROu/ZUGenQbetdswR46pfJZ+
         LY2gOYJxJQQsYZv1WSKZUQ1dsq/2MKKK5/Vca6BsafIja9IayBT0aLfkulzDwFmyNLjW
         E4v1AlAPRpHq/hIyYOagf8ydKjyBGZJ1iOOdY+6IV6j6qnQpKAOUV/sXyf2qaHDnKdE6
         UvD1sEiCFERaDK37XMEhZhVZMIXnWVUI3YEwljWTLSh77mZNykQQmxU0dD7Cqopt2FQU
         DZVYHg0h8NTH9HK0qTN+rzWnmZ+9ylKrdlbJLXZvBDLVC1iMiGWCCUMg2ukaxPGJTgVj
         sN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102185; x=1745706985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MD/Nu2Av3rMkoCf1kcmDdMh+qfX7Gu3u+XPV0sJ8QcQ=;
        b=PuNxSnh/tCLWYPDttWUAKqM7P++TEgSIgBPMHxLX4BfJBIyrx0zKxdg4E/EfdViWzJ
         RkkcaRBhJKA71lIqIaV/2pAGKj8uEs63vceR3bt93SCgG3xVGIwBeOXGVhbYYLiyctKO
         5jtL/Q8pQh85QSZ3oSt+P0rxMi05YQR6hL+FetwZYZn4B70MPyr94/ptUku8gzsLdNu0
         8gF9Hboxov42dgC6cXHKia7LXZSh6LQvLLMQW8IXKUSYzTVJIn2l4Ijyroz6pVwVlS0s
         sb9dY+JU7ILFSi+HQjpZugu7aE7GbnZY+3YzcLZyOik4ekVpy/d4seHxxog5vJurx2Lm
         ZF4w==
X-Forwarded-Encrypted: i=1; AJvYcCV1vnsOHWW5m9s7x0YffZZ2KRUS+xKELQAzrO/E3bWKClDtIoYvk06WWXrxPNEjkH8FCB7zHRw1nAUMawg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLv1e6UEcp3kuSg37hlKKqUI+gy8I+uo0fc6erRhpFPtAGWUSu
	ybU+tYRAjwLSZYpO2pctoMTpfx1VfAo/dJdiMgvYzqy9QBIGYuuXX9uDnyHwcSM=
X-Gm-Gg: ASbGnct4vsM1NXmrQfObTBsJ13KYUenno36L9rIi6ehrifCHSx3QYgHu/qlCd2G9yDR
	nbyEZ+iR40ySlweoWOSf2c9ivTXgZsnZY5b7DHmOxGcHYxuaKSsX1OVgrkc5NTNx55wIoySL3tu
	qbIGyqBk95d7oGL9XlYE8zIPywt7Y3vDK/VYmwFyazitEdfvBuV70sjnWeMwBREXsR9eP/C3rb7
	aa1JeY+DTQtzArcOlIfPhHquoSl4QC/IzQxc0BWDUcBOSK7EQK1h7gyzZHmWudcyoxU2+v2ZQwg
	Y7/wzlz65SKR7vBvEZrn+qy/nkwsVQHG7Im7dOQPshwhB07cBGc=
X-Google-Smtp-Source: AGHT+IFOJZ5Y+jGQDL3SAl66onZDVj5qKLEaZqn2DNtHJeZeBNqZY7fqcX6ZDhbd7UrY2F5Kq+Yprw==
X-Received: by 2002:a05:6512:2393:b0:549:4d7d:b61b with SMTP id 2adb3069b0e04-54d6e66272emr2510712e87.35.1745102185559;
        Sat, 19 Apr 2025 15:36:25 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:09 +0200
Subject: [PATCH v6 22/31] ARM: entry: Move work processing to C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-22-95f1fcdfeeb2@linaro.org>
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

At the end of a syscall software interrupt and every time we exit
an interrupt handler we check if there is work to do, i.e. if the
current thread (userspace or kernel daemon) has set the
_TIF_SYSCALL_WORK flag.

Move this processing over to the C entry code.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 14 +-------------
 arch/arm/kernel/entry.c        | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 33bc9e7c5b32f62474724f1d47f97af24dba53bf..5385574c4339714f3d8b5ab6894f27466b89f932 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -42,19 +42,7 @@ ret_fast_syscall:
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
 	bl	syscall_exit_to_user_mode
-	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
-	movs	r1, r1, lsl #16
-	beq	2f
-
-	tst	r1, #_TIF_SYSCALL_WORK
-	beq	1f
-
-	b	2f
-
-1:	mov	r0, sp				@ 'regs'
-	bl	do_work_pending
-
-2:	asm_irqentry_exit_to_user_mode
+	asm_irqentry_exit_to_user_mode
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 47233804733752aef0f2fec6f54badeab18e98d0..0e3960844b94b14325eb00ce7dd791b36c43ac3c 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,10 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
+#include <asm/ptrace.h>
 #include <asm/signal.h>
 #include <linux/context_tracking.h>
 #include <linux/irqflags.h>
 #include <linux/rseq.h>
 
+static inline bool has_syscall_work(unsigned long flags)
+{
+	return unlikely(flags & _TIF_SYSCALL_WORK);
+}
+
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
 	trace_hardirqs_on();
@@ -18,8 +24,12 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 
 void syscall_exit_to_user_mode(struct pt_regs *regs)
 {
+	unsigned long flags = read_thread_flags();
+
 	rseq_syscall(regs);
 	local_irq_disable();
+	if (has_syscall_work(flags))
+		do_work_pending(regs, flags);
 }
 
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)

-- 
2.49.0

