Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7B1EDA2A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102167; cv=none; b=mMr8CbvdEnMtb0vyrwURmBakNcFlLa8WocZe8+rGLLLoWHhmgCvKRTYa5gBuSxF6+UwzDcI/WCgiRs/PepAkKyVH2PqG7DfhqYyM+ihW5H4WEK21c20D3O1bOYzDi795LqYWQ1MadeIbnNjdW76+ZWYLj63sHZB8/G2yRMKF8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102167; c=relaxed/simple;
	bh=vxXREzGudOwqK27uoMMKU7o1vWyo48YpN/GHhfP2amM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7voastF0K/dVfLlPpGrxqXlhpwkt1gZF9Bn4pGbAfpZL+Yx+/xpOgQN/sSI08gyLCNOzCKR6HJ9cGKuf3pYqHt+7RJ3x/KEnqHCRUb+ztNiljeSWSgVsa1KGokV3ivRjAwH37NV/on3Y4S7Ys5Y4Vj7QrTwZM3Chlah4VYJUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Off9w2yR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Off9w2yR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548409cd2a8so3915411e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102163; x=1745706963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRhCeJvUzi6fE4P1HsVoSPsfz0kLlIAvb//vG5rLP0o=;
        b=Off9w2yRwcXZt4Mrh8gU6U8D2gbwhrq7L30C4WfEY8vG01KF/GxVp/zWpSyjYoHBYe
         T+Y5ShskyVE37tVJH3jmenWg7XpdHwIP8IcC5Smo0Eb79CcYpHAgjKtSobkNkl0JEwj4
         hVRXaFkjoqqlNyhs+E12BtzXGT2mXOY17AITT2/cJrEF19vEmQFH38EZ7Jz/ZW/LGK6Y
         7ACSMCyWa4ST7I4WDKThhqT8ZtNP1I5b54Rdf6krVmbqNMdaqGcaikGZvUBUlRKsaoIB
         xtGW/yh+nQ3SFQcD59Sog9XMc8nK3TupeQQ5+PkKWA7eVwwujiiWKZdadHauC2nqSPWR
         m/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102163; x=1745706963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRhCeJvUzi6fE4P1HsVoSPsfz0kLlIAvb//vG5rLP0o=;
        b=NLPa/BMGLuw6JQF7aNACU604OXbweW59V7AQ3QDfQFIc4yOjwQCRz49QvktH1PF3zZ
         gDQXJJ6rY2nBqnxYz07txgKOyxvouRwHUjctYgVIus1KECCDfWTXnUfx7S/5/f2L6Kxs
         Ai2IXcrzuV8tKDT/eXXTHj/D+3TGmbnQeYJeYKBtYbf9GK9RGTSGZvjneWfc/37pHnoH
         opBEz7aFY9J9D0o+UsncXtocRhir+7LcPukXttZpUfzWhDPGBJ5E2aXPfLk+FSP3+brj
         gmSohov0ve3MPMjboYBgvC6zeIwD6UHNeiZxsypdKg8n8GZGRAXVXdqIv0ZQUvEC4RXE
         yd3A==
X-Forwarded-Encrypted: i=1; AJvYcCWlGG9F9Yw15/+FdhuenWB/vHi0Vd2b+hED0sIJeO0vFr+KtQoyEC9UsJzpzmoiJzuiJ8q20RPmS6kfyK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwANDuXKpzUHkOQpjdrcd6dmtnygVFQd/FO+GNMbQYvIOwoSCRI
	yZPAfixfhFE5eaw9uoaZ/JaDtszot7Ps/KIKQoiFMGQUX+e+vyAHqaimLnVH77c=
X-Gm-Gg: ASbGncvq9wck5/kB0OqIWCEkgO0s+MeXRlQXfEO63fTXeDBcBDi/cz21OWFfUbGYPbs
	KJPAABszDglRsEt+y4RDHJO5EaUjslInbknZzDGJQnemc6CcHqy/vvyGeceHqfe3b6xLGUm4yBb
	wr1VE7Vh7KSLhafuqlWbSELh9D3VeoYY6rybGRR+gSe3S9gOkhm7SF3bjWaozlDMTPZJ2alSZdn
	xNrJIscicQGqpwzP2JFUe+Rdii4zd1jCXzud4SWZoXcf6I31RzxmXpxV8DD5+oUGB32g3FJUhxn
	cACerZZ/uplxFaq4vGP/02FUVINDiZHoddgTgdVpnoeNhY23+Sj9rh3oVuyJ0Q==
X-Google-Smtp-Source: AGHT+IEeGCMHqxwit+Owc8qaBud2K8eXJfTXFHX95D/1MI3+kTRdPxunWD+MPU/Bh4fCWiX1DSmdpA==
X-Received: by 2002:a05:6512:10d4:b0:545:ea9:1a1f with SMTP id 2adb3069b0e04-54d6e6301e0mr1711739e87.25.1745102163166;
        Sat, 19 Apr 2025 15:36:03 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:52 +0200
Subject: [PATCH v6 05/31] ARM: process: Remove local restart
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-5-95f1fcdfeeb2@linaro.org>
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

The ARM kernel contains a quirk to handle syscall restarts
inside the kernel without exiting to userspace. The generic
entry cannot handle this.

Rename do_signal() to arch_do_signal_or_restart() to fit
with the upcoming generic entry conversion.

This is essentially a revert of commit 81783786d5cf
"ARM: 7473/1: deal with handlerless restarts without leaving the kernel"
from 2012.

After the conversion to generic entry later in this series,
the local restart will be reimplemented again, but in C.

Link: http://lists.infradead.org/pipermail/linux-arm-kernel/2012-June/104733.html
Link: https://lore.kernel.org/all/1340377626-17075-1-git-send-email-will.deacon@arm.com/
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/signal.h  |  3 +--
 arch/arm/kernel/entry-common.S |  9 +--------
 arch/arm/kernel/signal.c       | 28 +++++++++-------------------
 3 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/arch/arm/include/asm/signal.h b/arch/arm/include/asm/signal.h
index 8b84092d151800cb4076672d1c31f0a83777d0d8..7acccc96840c8a17744cc3f2894f19d142aba4fd 100644
--- a/arch/arm/include/asm/signal.h
+++ b/arch/arm/include/asm/signal.h
@@ -24,7 +24,6 @@ typedef struct {
 #include <asm/sigcontext.h>
 
 void do_rseq_syscall(struct pt_regs *regs);
-int do_work_pending(struct pt_regs *regs, unsigned int thread_flags,
-		    int syscall);
+void do_work_pending(struct pt_regs *regs, unsigned int thread_flags);
 
 #endif
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index df6961a1006b7a0f3522728812bf52ccb849e511..da5c2d4b62e56cce644b15e329ab4149d69c5b79 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -86,14 +86,8 @@ ENDPROC(ret_fast_syscall)
 	bne	__sys_trace_return_nosave
 slow_work_pending:
 	mov	r0, sp				@ 'regs'
-	mov	r2, why				@ 'syscall'
 	bl	do_work_pending
-	cmp	r0, #0
-	beq	no_work_pending
-	movlt	scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)
-	str	scno, [tsk, #TI_ABI_SYSCALL]	@ make sure tracers see update
-	ldmia	sp, {r0 - r6}			@ have to reload r0 - r6
-	b	local_restart			@ ... and off we go
+	b	no_work_pending
 ENDPROC(ret_fast_syscall)
 
 /*
@@ -266,7 +260,6 @@ ENTRY(vector_swi)
 	 */
  TRACE(	ldmia	sp, {r0 - r3}		)
 
-local_restart:
 	ldr	r10, [tsk, #TI_FLAGS]		@ check for syscall tracing
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 79a6730fa0eb7d6581343bdbbeb6834dcaabb9f8..7b1a16e86b236575efdc29cda9b751e8e2a3f64e 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -18,6 +18,7 @@
 #include <asm/traps.h>
 #include <asm/unistd.h>
 #include <asm/vfp.h>
+#include <asm/syscall.h>
 #include <asm/syscalls.h>
 
 #include "signal.h"
@@ -534,9 +535,10 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
  * the kernel can handle, and then we build all the user-level signal handling
  * stack-frames in one go after that.
  */
-static int do_signal(struct pt_regs *regs, int syscall)
+static void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	unsigned int retval = 0, continue_addr = 0, restart_addr = 0;
+	bool syscall = (syscall_get_nr(current, regs) != -1);
 	struct ksignal ksig;
 	int restart = 0;
 
@@ -590,16 +592,14 @@ static int do_signal(struct pt_regs *regs, int syscall)
 	} else {
 		/* no handler */
 		restore_saved_sigmask();
-		if (unlikely(restart) && regs->ARM_pc == restart_addr) {
+		if (unlikely(restart) && regs->ARM_pc == restart_addr)
 			regs->ARM_pc = continue_addr;
-			return restart;
-		}
 	}
-	return 0;
+	return;
 }
 
-asmlinkage int
-do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
+asmlinkage void
+do_work_pending(struct pt_regs *regs, unsigned int thread_flags)
 {
 	/*
 	 * The assembly code enters us with IRQs off, but it hasn't
@@ -612,19 +612,10 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 			schedule();
 		} else {
 			if (unlikely(!user_mode(regs)))
-				return 0;
+				return;
 			local_irq_enable();
 			if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-				int restart = do_signal(regs, syscall);
-				if (unlikely(restart)) {
-					/*
-					 * Restart without handlers.
-					 * Deal with it without leaving
-					 * the kernel space.
-					 */
-					return restart;
-				}
-				syscall = 0;
+				arch_do_signal_or_restart(regs);
 			} else if (thread_flags & _TIF_UPROBE) {
 				uprobe_notify_resume(regs);
 			} else {
@@ -634,7 +625,6 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 		local_irq_disable();
 		thread_flags = read_thread_flags();
 	} while (thread_flags & _TIF_WORK_MASK);
-	return 0;
 }
 
 struct page *get_signal_page(void)

-- 
2.49.0

