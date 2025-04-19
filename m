Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E500620766E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102199; cv=none; b=b6H71m1HkpFEY/1HnPyjMPpdxrdqGxVdqcaUI7A8oHVsj3r1NFBIWYedZPMyG75RYL9d0Cvf2GdKZ72axhjMUYRiL8BoDVTuTwoAswl6AT/ogU8wEcxxrH3wTL7l8ZrF9vAepUmDhoe37wFZwUKmYEteZ7RqttOcDMR1eGgaBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102199; c=relaxed/simple;
	bh=BOvtfPt6xNH869woUtCJZ45j9F0mCh3hK8QARZXY+ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sy7WTV5R51ttrIC3X+wmJgs5mXR3XhTgdlKpG8BRxYJF6uRahPAZYHhDl9DHSW/5w+bMoI+yHdvXwFhXl0IO2YpCvpE8tm9gs7jtxw/fd3OKyq2vqMTVyokRrYTwPrDc4AUHAsz3ZMH/5Q6Nu/HNgCC9rTN9C+Fry//4DJFp1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4NDnZDQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4NDnZDQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549b159c84cso3516374e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102196; x=1745706996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8D88jB/ZLUR+u5sD/SlqiLgwtYZ6RyfN75LGR2wihE=;
        b=I4NDnZDQLnDRX7jBU6jo+J3GuuTtFSoDVZZIP1EH5kldmjFmgWqdiRCyl2lg5gglO8
         2Zh00A12sXccZDeI9ucSnvmfYpfSan4N4SStgclZNyoUt+RQgQFu0mN5krGah8MA2q49
         opCX2iqAM5XSqrYGayMF1qTzIKqdCkWA7spVW+isa6qIhGIZO1Zwzc+waSTRHNKHEJiG
         ezihROTKHdhiK5XSzk0iU+XhdNTipAzHladFLTyfylpCepaNcFkrh1mQgrDijpozwKha
         obnJWpSBm9fTGsbbItxxO0VwRo1XYnvNmqusb1TYoTjSTd7uPlK+UfAUjoXNbmkbqAF6
         605A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102196; x=1745706996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8D88jB/ZLUR+u5sD/SlqiLgwtYZ6RyfN75LGR2wihE=;
        b=nVIYBGjiwbo5EypD90uApHnnyvL9hH7oVk3Fkc4jVP/bw+XNJkIx84Wy4KfwS6AmjZ
         BrehxJa/9nE2+CyZ4g/gVqDme637WYpbxDFyJNXmx8u31PYoGSQJbAYLqhGeKO85oJf/
         65DYeQCjQe+FCtK+YKH2HzXtIDxC5o2FH15T84pB6dyKnk+wBjWzrvVXEbr24qDMRTIl
         Y3ZlvvwNRjFyR8SetEskyZ6Z4dHjVSeZqZj3yuGLSzQVrp8EE31xRlgY93D18lvdo+df
         d4S5BpMxLplvym3LjEkPwlvBaHu804CxgTTqG23nv18ZnIKh3w/mVaQ8srqEmdhTIwBE
         lhuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF9jyoIELfQxLGOA0sFbRBJeYDas25VSxADhPeqdvMOrgwrGcohhYbKtcfIBImzbnGO9ddtWEh6KmRMds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYLBYLIHftDt1Z+sPa+ExRT5ZcWpwtuEFtRQeF3+93RSvv3p4
	hqufyWiSsLuEZ8XkOdpKSF1Myq5MnZFOYFlA4s0wXJRA7tmfkaQ0LUhkWJDYMao=
X-Gm-Gg: ASbGnctEuICegSG4kyJ+ObMv/C1yyLgK645eBgyP117VqAfD81VXG/piyp+SzSv00DW
	E9qzkpOHnuag9krJra9QIM5E58SPfzqQyOspVql+ZtAIi6u0d68XMQe2w+6ZHyCXiB18OKXIEr5
	xkVjYgCLwV/SJmB3Ak6ptktHbwu9kZbRTMswMyPqcltlflJBY3+fzF5+ZJ1u9QRwUNosm/wjpSB
	F/mybHizNoq47N2yB6BmvgA+wKZGQEZsUFI5XHJ08r6SMxUGm2j/WLsX+IB29EkK6C2CfuIN3hk
	XwlrslTt1esaA7O5k7Lib63r9WyjFXamq8LlwayOu092ULYJLdk=
X-Google-Smtp-Source: AGHT+IHBK8ZZfAXfhtWw4iocc/9sst0szqHvSr6OfamFmJ2B5DuDtCYQs8hP/2Z2Lqta1P1S3o2oQw==
X-Received: by 2002:a05:6512:124c:b0:54d:6574:faf1 with SMTP id 2adb3069b0e04-54d6e62be76mr2063101e87.16.1745102195926;
        Sat, 19 Apr 2025 15:36:35 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:17 +0200
Subject: [PATCH v6 30/31] ARM: entry: Block IRQs in early IRQ context
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-30-95f1fcdfeeb2@linaro.org>
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

When dabt, pabt or und exceptions occur on ARM, ordinary
interrupts (IRQs) can still happen. This isn't nice for the
kernels context tracker, which expect (when using generic
entry at least) that any nested IRQs happens
between irqentry_enter() and irqentry_exit(), else it
thinks something is fishy.

This change blocks interrupts in the pabt, dabt, und and
abt exception paths (all of them really) by unconditionally
setting PSR_I_BIT in the early exception handler, until
after context has been established with irqentry_enter()
and before it is exited with irqentry_exit(). Inside the
context-tracked exception handler we enable IRQs again,
and once we leave it we disable them while exiting the
exception.

The local_irq_disable() in bad_mode() can be dropped
since we are now disabling IRQs in the early assembly
exception handler for all exceptions.

This seems like not perfect: it seems an interrupt
could still occur right before CPSR is set, or right after
the userspace registers are restored in ret_from_exception.
I would like to know if there is some
way to set up these exceptions to inherently block IRQs
when handled, until we explicitly allow them between
irqentry_enter() and irqentry_exit() or if this is simply
the best we can do on ARM for these exceptions to make the
context tracker happy.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S |  6 +-----
 arch/arm/kernel/entry.c      | 18 ++++++++++++++++++
 arch/arm/kernel/traps.c      |  1 -
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ae2f952beea7611f0abc7bd299fc944335a21219..3dae35b0bb3f440ecaf157a45687bf4690fb8f88 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -416,11 +416,6 @@ ENDPROC(__irq_usr)
 __und_usr:
 	usr_entry uaccess=0
 
-	@ IRQs must be enabled before attempting to read the instruction from
-	@ user space since that could cause a page/translation fault if the
-	@ page table was modified by another CPU.
-	enable_irq
-
 	tst	r5, #PSR_T_BIT			@ Thumb mode?
 	mov	r1, #2				@ set insn size to 2 for Thumb
 	bne	0f				@ handle as Thumb undef exception
@@ -847,6 +842,7 @@ vector_\name:
 	@
 	mrs	r0, cpsr
 	eor	r0, r0, #(\mode ^ SVC_MODE | PSR_ISETSTATE)
+	orr	r0, r0, #PSR_I_BIT
 	msr	spsr_cxsf, r0
 
 	@
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 01e4339ccdb4951e04a89fb91ad7c6e1991e09af..3881670e0987ee40be6fff32f412edcf4f3ec80a 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -17,8 +17,18 @@ noinstr asmlinkage void arm_und_handler(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	/*
+	 * IRQs must be enabled before attempting to read the instruction from
+	 * user space since that could cause a page/translation fault if the
+	 * page table was modified by another CPU.
+	 */
+
+	local_irq_enable();
+
 	do_undefinstr(regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
@@ -27,8 +37,12 @@ noinstr asmlinkage void arm_dabt_handler(unsigned long addr, unsigned int fsr,
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	local_irq_enable();
+
 	do_DataAbort(addr, fsr, regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
@@ -37,8 +51,12 @@ noinstr asmlinkage void arm_pabt_handler(unsigned long addr, unsigned int ifsr,
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
+	local_irq_enable();
+
 	do_PrefetchAbort(addr, ifsr, regs);
 
+	local_irq_disable();
+
 	irqentry_exit(regs, state);
 }
 
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 934708b9eb6f4d615000c0d667d1c7cfcd0d2820..7d557339490e3e6056ad772690f340f127f51c51 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -508,7 +508,6 @@ asmlinkage void bad_mode(struct pt_regs *regs, int reason)
 	pr_crit("Bad mode in %s handler detected\n", handler[reason]);
 
 	die("Oops - bad mode", regs, 0);
-	local_irq_disable();
 	panic("bad mode");
 }
 

-- 
2.49.0

