Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391F205ADA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102198; cv=none; b=X1hbVPX3PtgbMS2zK/H/r53YsMnSer9wMSx+qZt76d37+YuU1OkckwPVhiWx+ORhhHTQBagNQf6cxoLoCfWhk2bmZlqw9MnQ+LLmA88Bafy4W18O1ooW0Vodri18RI1JP8NFgEx/hhCgmOg0up7oPU3hzCUpiqGvbSbnWOs4dyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102198; c=relaxed/simple;
	bh=CzfCDEt9+I9JJGzQxTK0gYuGEqBtYaoR8Ot9ml0a5C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QX00IKKOB7Pre/caLCxqiSc7Jszb/y1zAWOpe2ekptOSZaD2B/sMGmtCTfG0BhqRhBWpx1VNTSYqm11cZCJxQJh/OMdUGnwuak7RCa05v7kLxf2dQPdS4TQF2JmgGO2CQcZCWHmdYxgmSNcHdzpdUvt8Ksv1R7xoqXrEb1u+3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qbGNjj5G; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qbGNjj5G"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4051353e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102194; x=1745706994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1nHLhPzci00uDFYrIjAPuXCUFMrFbVsdBm05lwc/W4=;
        b=qbGNjj5GHXEXtZBaMRW76MVb+qabZ9p++sN9ESgE6yo3nb8b2V4ZlJu45BY+g7C4Z3
         DMlclURQw1qFXPGxYDkFmtN/2gy+5BF1tENiY8o6jjgf60ZubQBCqT2sb1X6zbzi+Zvw
         +QEUFBUwtEzGTvcHL6nyArUC2PkQ9Ip8b9pNr0vLTtjtWgLpFYUVsL2Ro6Th0XBo3Bow
         ia9hqvZ3zhge+Juh4MSbQpcBjtio3a/YuaGD8WwxPmMOp0KJWEOcOXSDMIkib/n+C9tN
         ttlt6zaIktuLrWJejJgl9xSQ1Kg6A/gup4ikuLsYxy3ywO1Twfy0Yud7w+spw8OXjpXC
         ggdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102194; x=1745706994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1nHLhPzci00uDFYrIjAPuXCUFMrFbVsdBm05lwc/W4=;
        b=l/qIHIrhPjEL+SoGSBlISnZRstFQtOfF4OJPpA9hywFduVEC8tOQSVbfL0MTmi2d9c
         8/e8GbKF8FvHL6r+oM4DIECEbaEBtueNu3P4vRrq+wobKQdkwgMUihbkpsA+BzjZiaVE
         6R3teHX66wNzCrwUNQrhGtjpP+cvAGZ9Pgx4Pwn3WaIALQ2+/XygMEB0igY8WqwyhlHj
         B093o+iWSKWQROKMfDCEh6v/uUTbkNhzXU2FQ17SGP7rxOKWnw1Q+Bb4ywPQ1IEPmJP+
         vZNZv5shu3yiTwokCR5U7wRmF0Gh8NJVTXDA18/vOT7y6sVV0BkSFp5+TV7Sd/stCVQO
         s40Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3CgNqXvkl2dB58p1gbZiiHcsNKenz4CtIxB6/Y3dhvrfvaZGoR+h8KpJckl0X3SqtccoFWuf2+rt1xLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwVAybCivkVHlhjPBXdzFtejH+oONtcwtY2xuX91Kt/+s9qGo
	DTpHloMrnmTsiSrwuI+mVhiCgJrI3t311X1zgAoyGA/9Z65LjIxjZtnK1IGhfJk=
X-Gm-Gg: ASbGncuSeRn7V3tWQuhTreo93pfgtneM+SLhMXH3mpbVvQw3oak/B3kThqWQHJh+E55
	2QFgQawLr5NnBEdqbJZe3mxOuFM5KvsqT69ugpTJPK/NLv9B/6RLapYqEXQoHrQCutDmSnGbfN4
	ArXYxd40zzhsbWO9li7fpdhrUt4PgBKKI1VkOkIjgsIU6L2EulP9xCyFLq/n+bEZYCodC+6MJ+r
	qZhuXaFnUuJc9spIeZiX1YlY1ypc6GiGvGbkQusiVtNx2l7iUHsJHeyGuIdk9xIB2uSo68tyPuB
	MOxQ5F7dksG3PeMo7tCA7sC8gGMZ0SU1t81ql/XihI8fZIAzs0E=
X-Google-Smtp-Source: AGHT+IE6l5qP5DGTLy4Ptn2H1Xz57Z4Q2oJKbYb+kGrNvk2+Du1tz16uHmlRf14y0ssnW/7d8csuFA==
X-Received: by 2002:a05:6512:138b:b0:545:bf4:4bd4 with SMTP id 2adb3069b0e04-54d6e61ba39mr1774812e87.7.1745102194351;
        Sat, 19 Apr 2025 15:36:34 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:16 +0200
Subject: [PATCH v6 29/31] ARM: entry: Handle dabt, pabt, and und as
 interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-29-95f1fcdfeeb2@linaro.org>
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

While it isn't entirely intuitive, it appears that any kind
of exception such as data or prefetch abort ("page faults")
need to be handled as some kind of "interrupts" when using
generic entry. At least this is what other platforms are doing.

The same goes for undefined instruction handling, i.e.
floating point emulation in the kernel (und-exceptions).

This is necessary for the context checking to pass: without
this patch, a whole slew of warnings start to trigger
from syscall_exit_to_user_mode_prepare()
CT_WARN_ON(ct_state() != CT_STATE_KERNEL), i.e. syscalls
seems to exit from user mode to user mode (not good),
because the page faults screws up the context tracker.

This patch restores the order.

If this seems like the previous patch introduces a
regression that is then fixed in this patch, it can simply
be squashed into the former: having this rewrite separately
surely makes development and review easier.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/entry.h |  3 +++
 arch/arm/include/asm/traps.h |  2 +-
 arch/arm/kernel/entry-armv.S |  7 +++----
 arch/arm/kernel/entry.c      | 31 +++++++++++++++++++++++++++++++
 arch/arm/kernel/traps.c      |  2 +-
 arch/arm/mm/abort-ev4.S      |  2 +-
 arch/arm/mm/abort-ev4t.S     |  2 +-
 arch/arm/mm/abort-ev5t.S     |  4 ++--
 arch/arm/mm/abort-ev5tj.S    |  6 +++---
 arch/arm/mm/abort-ev6.S      |  2 +-
 arch/arm/mm/abort-ev7.S      |  2 +-
 arch/arm/mm/abort-lv4t.S     | 36 ++++++++++++++++++------------------
 arch/arm/mm/abort-macro.S    |  2 +-
 arch/arm/mm/abort-nommu.S    |  2 +-
 arch/arm/mm/fault.c          |  4 ++--
 arch/arm/mm/fault.h          |  8 ++++----
 arch/arm/mm/pabort-legacy.S  |  2 +-
 arch/arm/mm/pabort-v6.S      |  2 +-
 arch/arm/mm/pabort-v7.S      |  2 +-
 19 files changed, 77 insertions(+), 44 deletions(-)

diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index df2dd14ab51a586b83b6da6bbf9bd99858c1ddf4..de722084d5309194e02cb87db64ec32b9e6cd627 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -4,6 +4,9 @@
 
 struct pt_regs;
 
+void arm_und_handler(struct pt_regs *regs);
+void arm_dabt_handler(unsigned long addr, unsigned int fsr, struct pt_regs *regs);
+void arm_pabt_handler(unsigned long addr, unsigned int ifsr, struct pt_regs *regs);
 void arm_irq_handler(struct pt_regs *regs, int mode);
 void arm_fiq_handler(struct pt_regs *regs);
 void arm_exit_to_user_mode(struct pt_regs *regs);
diff --git a/arch/arm/include/asm/traps.h b/arch/arm/include/asm/traps.h
index f8695104c72f2f450092839c7c50920e540e594b..0ca98271e10a210225c1714f5b24668cebab2def 100644
--- a/arch/arm/include/asm/traps.h
+++ b/arch/arm/include/asm/traps.h
@@ -37,7 +37,7 @@ extern void ptrace_break(struct pt_regs *regs);
 extern void *vectors_page;
 
 asmlinkage void dump_backtrace_stm(u32 *stack, u32 instruction, const char *loglvl);
-asmlinkage void do_undefinstr(struct pt_regs *regs);
+void do_undefinstr(struct pt_regs *regs);
 asmlinkage void bad_mode(struct pt_regs *regs, int reason);
 int arm_syscall(int no, struct pt_regs *regs);
 asmlinkage void baddataabort(int code, unsigned long instr, struct pt_regs *regs);
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 498a22f5fa8a6516d1eab584f0523c3d6c6e4926..ae2f952beea7611f0abc7bd299fc944335a21219 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -230,7 +230,7 @@ __und_fault:
 	ldr	r2, [r0, #S_PC]
 	sub	r2, r2, r1
 	str	r2, [r0, #S_PC]
-	b	do_undefinstr
+	b	arm_und_handler
 ENDPROC(__und_fault)
 
 	.align	5
@@ -449,9 +449,8 @@ __pabt_usr:
 ENTRY(ret_from_exception)
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)
-	get_thread_info tsk
-	mov	why, #0
-	b	ret_to_user
+	disable_irq_notrace
+	b	ret_to_user_from_irq
  UNWIND(.fnend		)
 ENDPROC(__pabt_usr)
 ENDPROC(ret_from_exception)
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 08b8680233e5aae6e477f9bf15d7f06d7fd3e5af..01e4339ccdb4951e04a89fb91ad7c6e1991e09af 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -8,8 +8,39 @@
 #include <linux/percpu.h>
 #include <linux/rseq.h>
 #include <asm/stacktrace.h>
+#include <asm/traps.h>
 
 #include "irq.h"
+#include "../mm/fault.h"
+
+noinstr asmlinkage void arm_und_handler(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	do_undefinstr(regs);
+
+	irqentry_exit(regs, state);
+}
+
+noinstr asmlinkage void arm_dabt_handler(unsigned long addr, unsigned int fsr,
+					 struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	do_DataAbort(addr, fsr, regs);
+
+	irqentry_exit(regs, state);
+}
+
+noinstr asmlinkage void arm_pabt_handler(unsigned long addr, unsigned int ifsr,
+					 struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	do_PrefetchAbort(addr, ifsr, regs);
+
+	irqentry_exit(regs, state);
+}
 
 static void noinstr handle_arm_irq(void *data)
 {
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 526c6307a80c8dd54941363e72fbb329386c2906..934708b9eb6f4d615000c0d667d1c7cfcd0d2820 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -442,7 +442,7 @@ int call_undef_hook(struct pt_regs *regs, unsigned int instr)
 	return fn ? fn(regs, instr) : 1;
 }
 
-asmlinkage void do_undefinstr(struct pt_regs *regs)
+noinstr void do_undefinstr(struct pt_regs *regs)
 {
 	unsigned int instr;
 	void __user *pc;
diff --git a/arch/arm/mm/abort-ev4.S b/arch/arm/mm/abort-ev4.S
index a10bcb89594dd38ce31ca30bf97d68cf421afc42..68d8ae2f4e9c0955c9f08112b4ff1887867d550a 100644
--- a/arch/arm/mm/abort-ev4.S
+++ b/arch/arm/mm/abort-ev4.S
@@ -24,4 +24,4 @@ ENTRY(v4_early_abort)
 	bic	r1, r1, #1 << 11 | 1 << 10	@ clear bits 11 and 10 of FSR
 	tst	r3, #1 << 20			@ L = 1 -> write?
 	orreq	r1, r1, #1 << 11		@ yes.
-	b	do_DataAbort
+	b	arm_dabt_handler
diff --git a/arch/arm/mm/abort-ev4t.S b/arch/arm/mm/abort-ev4t.S
index 14743a2f6997fcae0eeb55f53dec07b7b2ec227c..76c6cfa79e2a32e34b6f35a15c71c1af407956f3 100644
--- a/arch/arm/mm/abort-ev4t.S
+++ b/arch/arm/mm/abort-ev4t.S
@@ -25,4 +25,4 @@ ENTRY(v4t_early_abort)
 	bic	r1, r1, #1 << 11 | 1 << 10	@ clear bits 11 and 10 of FSR
 	tst	r3, #1 << 20			@ check write
 	orreq	r1, r1, #1 << 11
-	b	do_DataAbort
+	b	arm_dabt_handler
diff --git a/arch/arm/mm/abort-ev5t.S b/arch/arm/mm/abort-ev5t.S
index 98c523118820798668bf04d065ad86ea05fb6d2c..fda1e54debc44b380fb3f3af95c1f198a9cc008a 100644
--- a/arch/arm/mm/abort-ev5t.S
+++ b/arch/arm/mm/abort-ev5t.S
@@ -25,7 +25,7 @@ ENTRY(v5t_early_abort)
 	uaccess_disable ip			@ disable user access
 	bic	r1, r1, #1 << 11		@ clear bits 11 of FSR
 	teq_ldrd tmp=ip, insn=r3		@ insn was LDRD?
-	beq	do_DataAbort			@ yes
+	beq	arm_dabt_handler			@ yes
 	tst	r3, #1 << 20			@ check write
 	orreq	r1, r1, #1 << 11
-	b	do_DataAbort
+	b	arm_dabt_handler
diff --git a/arch/arm/mm/abort-ev5tj.S b/arch/arm/mm/abort-ev5tj.S
index fec72f4fbaf508597d826e58d0dc084ee6e58dd0..a786a7d69e6ae23aa1125ccd41deaaaa743601e1 100644
--- a/arch/arm/mm/abort-ev5tj.S
+++ b/arch/arm/mm/abort-ev5tj.S
@@ -22,12 +22,12 @@ ENTRY(v5tj_early_abort)
 	mrc	p15, 0, r0, c6, c0, 0		@ get FAR
 	bic	r1, r1, #1 << 11 | 1 << 10	@ clear bits 11 and 10 of FSR
 	tst	r5, #PSR_J_BIT			@ Java?
-	bne	do_DataAbort
+	bne	arm_dabt_handler
 	do_thumb_abort fsr=r1, pc=r4, psr=r5, tmp=r3
 	ldreq	r3, [r4]			@ read aborted ARM instruction
 	uaccess_disable ip			@ disable userspace access
 	teq_ldrd tmp=ip, insn=r3		@ insn was LDRD?
-	beq	do_DataAbort			@ yes
+	beq	arm_dabt_handler			@ yes
 	tst	r3, #1 << 20			@ L = 0 -> write
 	orreq	r1, r1, #1 << 11		@ yes.
-	b	do_DataAbort
+	b	arm_dabt_handler
diff --git a/arch/arm/mm/abort-ev6.S b/arch/arm/mm/abort-ev6.S
index 836dc1299243415faaac1a93dce35ac46ae1a7da..2366236053eb86484cb179ff572f06db6559426b 100644
--- a/arch/arm/mm/abort-ev6.S
+++ b/arch/arm/mm/abort-ev6.S
@@ -42,4 +42,4 @@ ENTRY(v6_early_abort)
 	orreq	r1, r1, #1 << 11		@ yes.
 #endif
 1:	uaccess_disable ip			@ disable userspace access
-	b	do_DataAbort
+	b	arm_dabt_handler
diff --git a/arch/arm/mm/abort-ev7.S b/arch/arm/mm/abort-ev7.S
index 53fb41c24774db985eddc370904aa7666527f538..72b6eba101555651d7afd749fd5d7715a2964372 100644
--- a/arch/arm/mm/abort-ev7.S
+++ b/arch/arm/mm/abort-ev7.S
@@ -18,5 +18,5 @@ ENTRY(v7_early_abort)
 	mrc	p15, 0, r1, c5, c0, 0		@ get FSR
 	mrc	p15, 0, r0, c6, c0, 0		@ get FAR
 	uaccess_disable ip			@ disable userspace access
-	b	do_DataAbort
+	b	arm_dabt_handler
 ENDPROC(v7_early_abort)
diff --git a/arch/arm/mm/abort-lv4t.S b/arch/arm/mm/abort-lv4t.S
index fbd60a120f6684c56c63cea10b00200765473f1d..3fef9c1479c17bb07652e43e0b8b0683e00c4b2f 100644
--- a/arch/arm/mm/abort-lv4t.S
+++ b/arch/arm/mm/abort-lv4t.S
@@ -46,8 +46,8 @@ ENTRY(v4t_late_abort)
 /* 9 */	b	.data_arm_ldmstm		@ ldm*b	rn, <rlist>
 /* a */	b	.data_unknown
 /* b */	b	.data_unknown
-/* c */	b	do_DataAbort			@ ldc	rd, [rn], #m	@ Same as ldr	rd, [rn], #m
-/* d */	b	do_DataAbort			@ ldc	rd, [rn, #m]
+/* c */	b	arm_dabt_handler		@ ldc	rd, [rn], #m	@ Same as ldr	rd, [rn], #m
+/* d */	b	arm_dabt_handler		@ ldc	rd, [rn, #m]
 /* e */	b	.data_unknown
 /* f */	b	.data_unknown
 
@@ -60,7 +60,7 @@ ENTRY(v4t_late_abort)
 
 .data_arm_ldmstm:
 	tst	r8, #1 << 21			@ check writeback bit
-	beq	do_DataAbort			@ no writeback -> no fixup
+	beq	arm_dabt_handler		@ no writeback -> no fixup
 	str	r9, [sp, #-4]!
 	mov	r7, #0x11
 	orr	r7, r7, #0x1100
@@ -81,11 +81,11 @@ ENTRY(v4t_late_abort)
 	addeq	r7, r7, r6, lsl #2		@ Undo decrement
 	str	r7, [r2, r9, lsr #14]		@ Put register 'Rn'
 	ldr	r9, [sp], #4
-	b	do_DataAbort
+	b	arm_dabt_handler
 
 .data_arm_lateldrhpre:
 	tst	r8, #1 << 21			@ Check writeback bit
-	beq	do_DataAbort			@ No writeback -> no fixup
+	beq	arm_dabt_handler		@ No writeback -> no fixup
 .data_arm_lateldrhpost:
 	str	r9, [sp, #-4]!
 	and	r9, r8, #0x00f			@ get Rm / low nibble of immediate value
@@ -101,14 +101,14 @@ ENTRY(v4t_late_abort)
 	addeq	r7, r7, r6			@ Undo decrement
 	str	r7, [r2, r9, lsr #14]		@ Put register 'Rn'
 	ldr	r9, [sp], #4
-	b	do_DataAbort
+	b	arm_dabt_handler
 
 .data_arm_lateldrpreconst:
 	tst	r8, #1 << 21			@ check writeback bit
-	beq	do_DataAbort			@ no writeback -> no fixup
+	beq	arm_dabt_handler		@ no writeback -> no fixup
 .data_arm_lateldrpostconst:
 	movs	r6, r8, lsl #20			@ Get offset
-	beq	do_DataAbort			@ zero -> no fixup
+	beq	arm_dabt_handler		@ zero -> no fixup
 	str	r9, [sp, #-4]!
 	and	r9, r8, #15 << 16		@ Extract 'n' from instruction
 	ldr	r7, [r2, r9, lsr #14]		@ Get register 'Rn'
@@ -117,11 +117,11 @@ ENTRY(v4t_late_abort)
 	addeq	r7, r7, r6, lsr #20		@ Undo decrement
 	str	r7, [r2, r9, lsr #14]		@ Put register 'Rn'
 	ldr	r9, [sp], #4
-	b	do_DataAbort
+	b	arm_dabt_handler
 
 .data_arm_lateldrprereg:
 	tst	r8, #1 << 21			@ check writeback bit
-	beq	do_DataAbort			@ no writeback -> no fixup
+	beq	arm_dabt_handler		@ no writeback -> no fixup
 .data_arm_lateldrpostreg:
 	and	r7, r8, #15			@ Extract 'm' from instruction
 	ldr	r6, [r2, r7, lsl #2]		@ Get register 'Rm'
@@ -180,10 +180,10 @@ ENTRY(v4t_late_abort)
 /* 3 */	b	.data_unknown
 /* 4 */	b	.data_unknown
 /* 5 */	b	.data_thumb_reg
-/* 6 */	b	do_DataAbort
-/* 7 */	b	do_DataAbort
-/* 8 */	b	do_DataAbort
-/* 9 */	b	do_DataAbort
+/* 6 */	b	arm_dabt_handler
+/* 7 */	b	arm_dabt_handler
+/* 8 */	b	arm_dabt_handler
+/* 9 */	b	arm_dabt_handler
 /* A */	b	.data_unknown
 /* B */	b	.data_thumb_pushpop
 /* C */	b	.data_thumb_ldmstm
@@ -193,10 +193,10 @@ ENTRY(v4t_late_abort)
 
 .data_thumb_reg:
 	tst	r8, #1 << 9
-	beq	do_DataAbort
+	beq	arm_dabt_handler
 	tst	r8, #1 << 10			@ If 'S' (signed) bit is set
 	movne	r1, #0				@ it must be a load instr
-	b	do_DataAbort
+	b	arm_dabt_handler
 
 .data_thumb_pushpop:
 	tst	r8, #1 << 10
@@ -217,7 +217,7 @@ ENTRY(v4t_late_abort)
 	subne	r7, r7, r6, lsl #2		@ decrement SP if POP
 	str	r7, [r2, #13 << 2]
 	ldr	r9, [sp], #4
-	b	do_DataAbort
+	b	arm_dabt_handler
 
 .data_thumb_ldmstm:
 	str	r9, [sp, #-4]!
@@ -234,4 +234,4 @@ ENTRY(v4t_late_abort)
 	sub	r7, r7, r6, lsl #2		@ always decrement
 	str	r7, [r2, r9, lsr #6]
 	ldr	r9, [sp], #4
-	b	do_DataAbort
+	b	arm_dabt_handler
diff --git a/arch/arm/mm/abort-macro.S b/arch/arm/mm/abort-macro.S
index bacf53fd0b70c6307e74ef8601d8dcc7db292700..30bb5e2135862902951b5077b0b860fd12ed8c28 100644
--- a/arch/arm/mm/abort-macro.S
+++ b/arch/arm/mm/abort-macro.S
@@ -20,7 +20,7 @@
 	orreq	\tmp, \tmp, #1 << 11		@ Set L-bit if yes
 	tst	\tmp, #1 << 11			@ L = 0 -> write
 	orreq	\fsr, \fsr, #1 << 11		@ yes.
-	b	do_DataAbort
+	b	arm_dabt_handler
 not_thumb:
 	.endm
 
diff --git a/arch/arm/mm/abort-nommu.S b/arch/arm/mm/abort-nommu.S
index 6e2366a263219b379f4fdb43cc8e5413fb36e52a..573a09529ac7794f8004680ab350750de7c8e15d 100644
--- a/arch/arm/mm/abort-nommu.S
+++ b/arch/arm/mm/abort-nommu.S
@@ -17,5 +17,5 @@
 ENTRY(nommu_early_abort)
 	mov	r0, #0				@ clear r0, r1 (no FSR/FAR)
 	mov	r1, #0
-	b	do_DataAbort
+	b	arm_dabt_handler
 ENDPROC(nommu_early_abort)
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de5590bff6c2acaf446d01c589a5f7987..78afb701b34a17d8d841762944eb5f8af6843dc4 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -588,7 +588,7 @@ hook_fault_code(int nr, int (*fn)(unsigned long, unsigned int, struct pt_regs *)
 /*
  * Dispatch a data abort to the relevant handler.
  */
-asmlinkage void
+void
 do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 {
 	const struct fsr_info *inf = fsr_info + fsr_fs(fsr);
@@ -618,7 +618,7 @@ hook_ifault_code(int nr, int (*fn)(unsigned long, unsigned int, struct pt_regs *
 	ifsr_info[nr].name = name;
 }
 
-asmlinkage void
+void
 do_PrefetchAbort(unsigned long addr, unsigned int ifsr, struct pt_regs *regs)
 {
 	const struct fsr_info *inf = ifsr_info + fsr_fs(ifsr);
diff --git a/arch/arm/mm/fault.h b/arch/arm/mm/fault.h
index e8f8c190254442a015a6cbc179602589cfddb0ea..36a7e7138c310a8311458207d2b694cb44c63b93 100644
--- a/arch/arm/mm/fault.h
+++ b/arch/arm/mm/fault.h
@@ -37,9 +37,9 @@ static inline int fsr_fs(unsigned int fsr)
 
 void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs);
 void early_abt_enable(void);
-asmlinkage void do_DataAbort(unsigned long addr, unsigned int fsr,
-			     struct pt_regs *regs);
-asmlinkage void do_PrefetchAbort(unsigned long addr, unsigned int ifsr,
-				 struct pt_regs *regs);
+void do_DataAbort(unsigned long addr, unsigned int fsr,
+		  struct pt_regs *regs);
+void do_PrefetchAbort(unsigned long addr, unsigned int ifsr,
+		      struct pt_regs *regs);
 
 #endif	/* __ARCH_ARM_FAULT_H */
diff --git a/arch/arm/mm/pabort-legacy.S b/arch/arm/mm/pabort-legacy.S
index b2ffce4201062e3ec2045364ddc454cf706bab8d..26c62e568638d37133661f4f5b8dec430593f8eb 100644
--- a/arch/arm/mm/pabort-legacy.S
+++ b/arch/arm/mm/pabort-legacy.S
@@ -18,5 +18,5 @@
 ENTRY(legacy_pabort)
 	mov	r0, r4
 	mov	r1, #5
-	b	do_PrefetchAbort
+	b	arm_pabt_handler
 ENDPROC(legacy_pabort)
diff --git a/arch/arm/mm/pabort-v6.S b/arch/arm/mm/pabort-v6.S
index 8686265dc9418b29381942bfd87a937a3234d46e..25abd11a35253bf464fe9fd7fc14fd11bc564dcd 100644
--- a/arch/arm/mm/pabort-v6.S
+++ b/arch/arm/mm/pabort-v6.S
@@ -18,5 +18,5 @@
 ENTRY(v6_pabort)
 	mov	r0, r4
 	mrc	p15, 0, r1, c5, c0, 1		@ get IFSR
-	b	do_PrefetchAbort
+	b	arm_pabt_handler
 ENDPROC(v6_pabort)
diff --git a/arch/arm/mm/pabort-v7.S b/arch/arm/mm/pabort-v7.S
index 9c70b1a21dc9204f24524df9905fbc077a82f2dc..e05c7d44d307adeba6759213374b2aa328c693da 100644
--- a/arch/arm/mm/pabort-v7.S
+++ b/arch/arm/mm/pabort-v7.S
@@ -18,5 +18,5 @@
 ENTRY(v7_pabort)
 	mrc	p15, 0, r0, c6, c0, 2		@ get IFAR
 	mrc	p15, 0, r1, c5, c0, 1		@ get IFSR
-	b	do_PrefetchAbort
+	b	arm_pabt_handler
 ENDPROC(v7_pabort)

-- 
2.49.0

