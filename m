Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71A1FC7D2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102182; cv=none; b=XEpJG/R0KknHGCGwm/hepNa0ryTqL8STAdE94s7JJDOduMJIzMcC5zgpK60BbINzITi+sTwJR5ujZ0Y5evoEKPp3QYeyqP5RcymmYSqfmjF7lx4e1YFsl0Z3txRk5KHp6fQV+a/lnKbWT5LSCCDGpYG3MCpQmmUBzCnsG10pMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102182; c=relaxed/simple;
	bh=W4q2zOUElPxjHDV+c348EedF0ypLBZNLFgL+7Zyhgr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCnzIanHIYq/lCocnJSSVIuSUf93yS3G+PU5TXL+Wk7dA43MPz4wmi+5wSUTirU1JNZz4E0LP9diHGHT3YfZZaBL0sKQzYuFnw1+ftFbu+wD7FL8Vvh8fPLtTS3vTk1OH8zFyphLlj+FEKxkLo0YDkXjyut01K0GoHjqCF+hK38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClB+SUKW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClB+SUKW"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54c090fc7adso3177065e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102179; x=1745706979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7+Tt2ojtTtBptuYKtkf/giwQP7CrCvyuDJQU12zbcM=;
        b=ClB+SUKWBXRThuP36cu9efZ1o9lFQ34i2aGYjAx0z6mV11cr/E8GHwGslJXXij93pp
         RZxplEfKIuttvJx2CSJndpS3tioM9rHDSwvne4q/qNkFLjE3x5XpVOZ7PmlNOKA8KZHk
         tRFK54gAG/aHPXwG+hUC9Q7VZmk15WkgFiaXr67sTAc+o/GVED/8XhMTiXHTYUyWo8jM
         JMNBYHNxmBKFqDLrCLCASf9tbheOfBnUncUi7wdKN//OrTBmekHAuhTYqqV9oMLBrlh4
         UQxbQq/zvocKgm7ff5cmv9HqPCfuHkxUqbV5bWaZb+JiO9e9jvo9K4MbPdIvQy48jbkm
         BW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102179; x=1745706979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7+Tt2ojtTtBptuYKtkf/giwQP7CrCvyuDJQU12zbcM=;
        b=FOfKW/QvSUralnAHouSfU6htzdCnidp+7KK1V1WrTMbfTrsF7G4SdxUBgnRpyNCo9P
         WFkKY+w9szSPnBaF7anMaQxulF/6XpHyRnb/gWBn+zEWTlsfkqWCETtQo4mpLJUYLw4B
         nSGvAZjVHhDTy4sKqAkMR30HtfhxNETgdrPL3l9L0Ul4LdUHMulD4V2nw4KBb0Ag44Nt
         i5zs1aH9h66+06SnTuJiMlwJOh6cBBIBxnDamXr4PUyow67kQtb/PmM8WAV4EMzcPiCD
         npG7ogq2/WcRoIXOWEPxWX94TrZOUQX86v6iKK2dDVMBIQZ3zXKLb+SifDIyIjf53SMb
         raXA==
X-Forwarded-Encrypted: i=1; AJvYcCXZiejsoGG6xd5JvecPYElcYej9A2qeLhEsZVTUc1OYvXG2FdDMQwdOjQOg4OF912FHBTvRC83J4Bx2dvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeYDDoWqZlhv9NbfNbRDOcJg3g/QQIdUtpx9lPoVgqVeKWYY2g
	fzw1qmi1IpfakBN0UKlWuqLiUQmFs0ypNGczWrKtJ6blBeO+SVNRbTJPkzgx6LRuVilLinDx2fc
	LOlY=
X-Gm-Gg: ASbGnctY9o5Ku71JIwLU9HOCJYW4+V3eO8O6Pcwx9TlADmZp+wWlaVM4Rk6rGZNDdfS
	cu7fRsFQ44Bw6tnY0Y5yiSwq8hsSQ2zfdXX8zHGhTwcbAO/8nJ0AyCxwK5aNUI7JlcALW1Qf3/J
	8uF0180kT/PUqgJCbcjShuvCJCDZnuw0n/5zVufqQrepzuLaQ72s8HwsaUNhk7pFYf6IP9aUxTk
	jQwDZkP3rMIcTba7N0v1Z73pw9amAmOaI7g7BBdBtnuUZoz3RGcwmBJ58YJzyIarSYYvzbslbeJ
	YLgzabQPqOxEiIWgFUuHnfZ88rTJhIrlC643TtM3PTrHC+ebJfo=
X-Google-Smtp-Source: AGHT+IHrbIlYr0r08V7TlSz7Uj4jFvFElGjucRwZThVCiqe6hs7u3xT14gKAOK2Wl8KarbpfesjTqQ==
X-Received: by 2002:a05:6512:3da3:b0:549:74a7:12de with SMTP id 2adb3069b0e04-54d6e6629e9mr2248868e87.48.1745102178995;
        Sat, 19 Apr 2025 15:36:18 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:04 +0200
Subject: [PATCH v6 17/31] ARM: entry: Implement syscall_exit_to_user_mode()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-17-95f1fcdfeeb2@linaro.org>
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

Mirroring syscall_enter_from_user_mode() we create the sibling
call syscall_exit_to_user_mode() and start to move some stuff
over from assembly, first the rseq call and the interrupt
disablement.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h   |  1 +
 arch/arm/include/asm/signal.h  |  1 -
 arch/arm/kernel/entry-common.S | 10 ++--------
 arch/arm/kernel/entry.c        |  8 ++++++++
 arch/arm/kernel/signal.c       |  7 -------
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index e259b074caef75c7f777b18199623f07bebee5b4..8b8cc9a1eefbd00dd75d4e344576fc184a413768 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -9,6 +9,7 @@ struct pt_regs;
  * to generic entry once they are semantically equivalent.
  */
 long syscall_enter_from_user_mode(struct pt_regs *regs, long);
+void syscall_exit_to_user_mode(struct pt_regs *regs);
 void irqentry_enter_from_user_mode(struct pt_regs *regs);
 void irqentry_exit_to_user_mode(struct pt_regs *regs);
 
diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index 7acccc96840c8a17744cc3f2894f19d142aba4fd..bb753cd3e29fc54186543c48b2aee7b221301a37 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -23,7 +23,6 @@ typedef struct {
 
 #include <asm/sigcontext.h>
 
-void do_rseq_syscall(struct pt_regs *regs);
 void do_work_pending(struct pt_regs *regs, unsigned int thread_flags);
 
 #endif
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index df564388905ee019cd5553f8b37e678da59e3222..3559e0a9f5e079f1af91392bf000d39f9b45906c 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -65,12 +65,9 @@ ret_fast_syscall:
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
 	add	sp, sp, #(S_R0 + S_OFF)
-#if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	mov	r0, sp				@ 'regs'
-	bl	do_rseq_syscall
-#endif
-	disable_irq_notrace			@ disable interrupts
+	bl	syscall_exit_to_user_mode
 	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
 	movs	r1, r1, lsl #16
 	beq	no_work_pending
@@ -97,13 +94,10 @@ ENDPROC(ret_fast_syscall)
  * do_work_pending() will update this state if necessary.
  */
 ENTRY(ret_to_user)
-#if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
 	mov	r0, sp				@ 'regs'
-	bl	do_rseq_syscall
-#endif
-	disable_irq_notrace			@ disable interrupts
+	bl	syscall_exit_to_user_mode
 ENTRY(ret_to_user_from_irq)
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 1973947c7ad753fccd694b3ef334fba1326f58b6..47233804733752aef0f2fec6f54badeab18e98d0 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/entry.h>
+#include <asm/signal.h>
 #include <linux/context_tracking.h>
 #include <linux/irqflags.h>
+#include <linux/rseq.h>
 
 long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 {
@@ -14,6 +16,12 @@ long syscall_enter_from_user_mode(struct pt_regs *regs, long syscall)
 	return syscall;
 }
 
+void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	rseq_syscall(regs);
+	local_irq_disable();
+}
+
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	trace_hardirqs_off();
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 7b1a16e86b236575efdc29cda9b751e8e2a3f64e..03b20637a2e1ca6f327223c9132915a97a9c4697 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -659,13 +659,6 @@ struct page *get_signal_page(void)
 	return page;
 }
 
-#ifdef CONFIG_DEBUG_RSEQ
-asmlinkage void do_rseq_syscall(struct pt_regs *regs)
-{
-	rseq_syscall(regs);
-}
-#endif
-
 /*
  * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
  * changes likely come with new fields that should be added below.

-- 
2.49.0

