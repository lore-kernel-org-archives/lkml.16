Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB17E1EF087
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102169; cv=none; b=OogCdaywHrhwrK8b1B0vs5D72va7pCtobRPbuYCLlwZSoULXJvAAwY7dfLYrRhv9Oe4+YDmeQjeDtTBHHoaeEwqAeuPrZed9+/5H5LYvKtT3HEfodDTIP5LE7ssU2le2dA4wA8a8pDb90wwvHmAJmss+VtmOEpwGF4UcLWG8quY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102169; c=relaxed/simple;
	bh=k1h1ntubma0+2YoJLfPA39BbWfB7bKHrWcN4BPqVCHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HoyvAMEyRtjdYt9lDn7rp2lGd9laQE0jWNdxa+qEbXbtF/8sIqanwqEVgL3a/qLTTBnYYthIAGp8otKyjhotm87doqCQtY+ipQZ2CFJHBohSHW3lahLuBkZccaBu2HfteUjKBxMQjE60yWdxbCMGAMYIHqLlBNwx4HRs7aWYASI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sxh+p30t; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sxh+p30t"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso3889746e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102166; x=1745706966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZmnKukadbd2DVD0OEXjqg+oIWqCHiujZSlF23WxiBI=;
        b=Sxh+p30tlE0m+FfoAmNSbLt+di6QjpJr59aMan2vb5JlsWgrfsQYuIgHYPHMp92OOv
         hGn3Ltw+VCTbYFKe4sKIrJI/jZQcVd79hr2X4CcuAlNAr1PpkS8jQ0odciq1/3e/Yshc
         NmC46nTGbNkCAznCQzuDN+brEZDbF93lNy7luN7oBQDvPB+AlvHAijdjJ4w2PbzTxxeF
         SX8evFxA6LH7bsW0Hh5cm9cZPsibQfMpP2KgN+3ALOikMN+lsgM4VYnS6Vd4G081ZPuF
         kWD3SePs0knNjQXuF0s87EYgp2IH//bacvmOTNPPpfi6klk9HySPsNChKrhyyTuhh5ei
         TOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102166; x=1745706966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZmnKukadbd2DVD0OEXjqg+oIWqCHiujZSlF23WxiBI=;
        b=eMedWM6OuLHIfm7rzoQDSez6NNGKO0yYh1Xq+CZQUPygEyMXZXV/fqEkunmQtfH7Xj
         stNHEux41IICv6HZ+TPGm/peRvLCS2VnhqyLMDCGiYQqrBWFIv1Rqim0Wx0VD6zVP00k
         g49hsUK1+mxVXLl1bVdzXOatbjhGg13To9V43Y7PZwAd0jc194YWzJry9HO8rrt7h5qP
         iiWeEIWby3Y2kv2yF44hKFA/Frrpdo9JAttA7BqtqrMeZMX4n9cTMADaKR0Wx2yu9wmO
         ko9fZmtCN1TXiH7V8EBOLwbesWWg2GWnSWnLfGo3p5wkZUUVaU4BE832BGVoufNIdktY
         AwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh6DXXdxzj978/DS5vP6ClilioiAVJ1/R9U5/ouKXn7rtBbO1v8SurssN5c/QOTrHWyznN1yPriw9qQ2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YycaGZuEUfQ4Aj4pvClzBDZVYBkxX3capy8N+Rnbx7VeftT4IC5
	20R+Gn6Lduh5iTNn1WuM+cEUBSeOFDQa/fUciO40mluApOa5zPPKz89bipf2ybX44tn15nSwevc
	HqdQ=
X-Gm-Gg: ASbGncsa2lcmDzrHEgTa1Ua083tspp5NGo7ADmIokApSAjjtSJOG0BqzHS2ng6RX4Vc
	7o66dooiyEhDH50Ayst5qkpybeL7r1fRBEM4zZEtxZ4k3aKKu54qDJQMmnKz+UDIKtPnmniR5Xq
	JJLepXrnjD97+C5xmI3qieqYtyQOVO0bcbfhdvcPCW2Rj3YGQY/MpTIPqWtY85VLcxo70Omfe27
	Jkc/auGf1KiVJ+Gij8lgwLIQyC0ApQyQ0dsv0RK4NiuSMOCjxVARedF0mmGS0m64dFLXzGvzylo
	eQTjyUSth2bqVRIidz5Lc2UzsXa47uNIcXGBkydiPoa530CvdoU=
X-Google-Smtp-Source: AGHT+IEcKs0MGpbznfsnmrfRQLSqoFKUEdc6MfTqSjSELeLCkrqH4RJxAyZmrS5qBrUmlZKS7RcNVQ==
X-Received: by 2002:a05:6512:3b93:b0:545:2ab1:3de with SMTP id 2adb3069b0e04-54d6e62b725mr1819788e87.13.1745102165769;
        Sat, 19 Apr 2025 15:36:05 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:54 +0200
Subject: [PATCH v6 07/31] ARM: entry: Rewrite two asm calls in C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-7-95f1fcdfeeb2@linaro.org>
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

The normal and trace entry code calls out to arm_syscall()
and sys_ni_syscall() from assembly, but these calls can
be moved over to the new C implementation.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/traps.h   |  2 +-
 arch/arm/kernel/entry-common.S | 23 +++++------------------
 arch/arm/kernel/syscall.c      | 13 +++++++++++--
 arch/arm/kernel/traps.c        |  2 +-
 4 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/arm/include/asm/traps.h b/arch/arm/include/asm/traps.h
index 2621b9fb9b19b064aa40a8ab4a3a89067b98a010..b888912c2450e0e8eec8139166c7292f283545c7 100644
--- a/arch/arm/include/asm/traps.h
+++ b/arch/arm/include/asm/traps.h
@@ -40,7 +40,7 @@ asmlinkage void dump_backtrace_stm(u32 *stack, u32 instruction, const char *logl
 asmlinkage void do_undefinstr(struct pt_regs *regs);
 asmlinkage void handle_fiq_as_nmi(struct pt_regs *regs);
 asmlinkage void bad_mode(struct pt_regs *regs, int reason);
-asmlinkage int arm_syscall(int no, struct pt_regs *regs);
+int arm_syscall(int no, struct pt_regs *regs);
 asmlinkage void baddataabort(int code, unsigned long instr, struct pt_regs *regs);
 asmlinkage void __div0(void);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 57aa1084a0476e9c218cd100ce4fdf4aaa748234..77801d039b5f6562b231a6fd4979e318c7e736a6 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -264,18 +264,10 @@ ENTRY(vector_swi)
 	mov	r0, tbl
 	/* r1 already contains regs */
 	mov	r2, scno			@ syscall number from r7
-	badr	r3, __ret_fast_syscall
-	bl 	invoke_syscall
-
-	/* Restore regs into r1 and lr after C call */
+	/* We return here no matter what, also pass this as an argument */
 	badr	lr, __ret_fast_syscall
-	add	r1, sp, #S_OFF
-
-2:	cmp	scno, #(__ARM_NR_BASE - __NR_SYSCALL_BASE)
-	eor	r0, scno, #__NR_SYSCALL_BASE	@ put OS number back
-	bcs	arm_syscall
-	mov	why, #0				@ no longer a real syscall
-	b	sys_ni_syscall			@ not private func
+	mov	r3, lr
+	b 	invoke_syscall
 
 #if defined(CONFIG_OABI_COMPAT) || !defined(CONFIG_AEABI)
 	/*
@@ -308,13 +300,8 @@ __sys_trace:
 	mov	r0, tbl
 	badr	r3, __sys_trace_return
 	bl	invoke_syscall_trace
-
-	/* Restore regs into r1 and lr after C call */
-	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
-	badr	lr, __sys_trace_return
-
-	cmp	scno, #-1			@ skip the syscall?
-	bne	2b
+	cmp	r0, #-1
+	bne	__sys_trace_return
 	add	sp, sp, #S_OFF			@ restore stack
 
 __sys_trace_return_nosave:
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index edc0ac88ec60ce3f23149a526de7dc1205906552..d637dc74b1c70415933898fbcadbedc71df5f654 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -12,7 +12,10 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 		/* Doing this with return makes sure the stack gets pop:ed */
 		return invoke_syscall_asm(table, regs, scno, retp);
 
-	return 0;
+	if (scno >= __ARM_NR_BASE)
+		return arm_syscall(scno, regs);
+
+	return sys_ni_syscall();
 }
 
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
@@ -20,9 +23,15 @@ __ADDRESSABLE(invoke_syscall_trace_asm);
 
 __visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
 {
+	if (scno == -1)
+		return -1;
+
 	if (scno < NR_syscalls)
 		/* Doing this with return makes sure the stack gets pop:ed */
 		return invoke_syscall_trace_asm(table, regs, scno, retp);
 
-	return 0;
+	if (scno >= __ARM_NR_BASE)
+		return arm_syscall(scno, regs);
+
+	return sys_ni_syscall();
 }
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39dca42e5cfac1d46213f0d5b63d5c..2e673ebf44abe5e7224acbe4f672bb74730a7f6c 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -602,7 +602,7 @@ do_cache_op(unsigned long start, unsigned long end, int flags)
  *  0x9f0000 - 0x9fffff are some more esoteric system calls
  */
 #define NR(x) ((__ARM_NR_##x) - __ARM_NR_BASE)
-asmlinkage int arm_syscall(int no, struct pt_regs *regs)
+int arm_syscall(int no, struct pt_regs *regs)
 {
 	if ((no >> 16) != (__ARM_NR_BASE>> 16))
 		return bad_syscall(no, regs);

-- 
2.49.0

