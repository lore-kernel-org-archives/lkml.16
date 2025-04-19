Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E820010C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102183; cv=none; b=IPj2PM/NfjgSHywcfpktKM9BSTR7vNC/Mpdf8/uq3HdOejwLQkjh6NEfgYCzvFkOmPEKClorM2eW4gkd2HakixbJQrYuux10rtQva4J5Ei8Fj5aOqyE/q3I1ousQGeWP4iwycbfvskpprxsQmjSFTPPU63PDQEjru+oboAA0rqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102183; c=relaxed/simple;
	bh=sRj+8Oh0NZkpmwHziZ/jGho7nVCQ82mxLAQ9WXu83Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erpMNBLiDbh/tfRrgwO5RhV6P+hj0FNZ09Dm/f+q0mUtd0AGRFxaVJS3OR5lhbyuEsRXOxe7rDOdfYuD4iwX6xFPtseKcnwqV3r3s0SIAkF2MAat8f/z+/nx0iKrxG1juLchzrSfI7TU7imKDxd0PESsY1bYiiY+KT2EgQvGEVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCvdTJFQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCvdTJFQ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so3101746e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102180; x=1745706980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2CAOyyO+hXIbzI5viafcwpFofTGSFRrqZLvi/3aBA=;
        b=fCvdTJFQDNiSMNharoaVAbCZ5QBFRsBUdn3hYPzqxp4ZdFviSXEUpRBLFTTzNwBKg8
         H2HP5uEJ/CoNIhA9w34HMEf2vJIwyBMHRaRGFDDP7rLSHXy7ThWPhpL/5RUSg/xwHNRP
         FJyxaK4NJVOEyb7XVE16qZllRcvmOZ6zDrkSPFL5CTdWJTZy3caJrH9+1eo9RVcR0eQY
         CudY3kdRFpbKUiCB11UB7dH0vSYB1pVkVD9DnpnewQfQWA6X8Cn1Sjvv7w2VYuuJCEdO
         HNqopGDSWhxOAhV7bEQ73OZrbNSU8BkeEN13O6OzrEMJbr70iT26OEv40w7jSbcoJB+S
         D02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102180; x=1745706980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ2CAOyyO+hXIbzI5viafcwpFofTGSFRrqZLvi/3aBA=;
        b=r6kB9FYconWjnfGzJaAuyAQiEMISxePgeNAHU9yLdIReYz+0kJUC0MKuKcOnaZ1Fqy
         yGXa8GjjuaqkbJADNrPNlRjimUURtK+Aw9Itwt3w9c36zKNjDc3YmROydb8Ljhw/ofDO
         62J+/Yc7flqfGL15v3HSeoDz8iNT38bkp8Okz7nMy/GEuzoJPpJl1/ZeRCmNxKMRxwlg
         VcRhU4ssuv8ro0uHzWtH6xE1CD98BlcQoBiyCjvGdY2AFm43smP5Q+MYo/rbkkDxLfeQ
         uEX+XHYxStpXqUWtXAcEOSMjPJqdT7FON3hwjHENzZsO254pBILPUDJi0vxPFnSzAZG0
         F20g==
X-Forwarded-Encrypted: i=1; AJvYcCUJdK57PS8i14rl9fVj0kZ4AIyTMeOWLqVGCV6KPKpexdHOfxzf9WTZqVoxlBmsICUlLfd/Qnw4cVut5vc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm8zFWqYtuWAYwItVTcT4+iC5h/4SANAFpTyWt/dqvn3VHT/qe
	e5aueNYhufHmGoYu8tqIKYNhJO3JyZ3SVxx8YSNqF8H6+tyY7MwpnImWvKFchnU=
X-Gm-Gg: ASbGncvA/gFg+uaGEExvkehBHATAflA5LD+xPOCIvz0xgtDvEFSb3cAARKQqI9mnKmm
	VyS7pbR+MAWzr6K+FFMgnZFNEvatX4zo8TR/A3MVk2gjnng5MbY8RGY/c46Y+Of0CzSP6MySBBl
	ld7SRU0t9zqnKe1KNd4dUqwnqGhJSOL4TsQU0Nob6c1QgKQWj+PHNlAE8YY27SAbpNpZDTKHXUF
	rP1C34MAF5hQCsJhZm1tNaV5fBOCLzyGy/e5BvcHsf6yfoDaiHMGrR4n22G5GywoKjJ49Bqabmc
	6aiIXg3ZJnN7UekoolzEZox+VEhJLfr8VPlKE2xdZzsv2jPu/7k=
X-Google-Smtp-Source: AGHT+IFy8jjdgLjfaCOyW2gFGBs7/pfMPh1k6HYrKZA70Zav8DUkJktP7H7VAxHF4ELxWlpTqUqLsg==
X-Received: by 2002:a05:6512:12d0:b0:546:2f7a:38c4 with SMTP id 2adb3069b0e04-54d6e62b86amr1840188e87.13.1745102180032;
        Sat, 19 Apr 2025 15:36:20 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:05 +0200
Subject: [PATCH v6 18/31] ARM: entry: Drop the superfast ret_fast_syscall
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-18-95f1fcdfeeb2@linaro.org>
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

When not using any irqflags tracing, context tracking or rseq
debugging, the ARM kernel uses a "superfast" ret_fast_syscall
with a very few assembly instructions.

With generic entry, such local optimizations are not really
possible, we need to call C unconditionally and take the
(hopefully small) overhead.

With generic entry in C, most of the tracing (etc) calls are
replaced by stubs and optimized out by the compiler.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 3559e0a9f5e079f1af91392bf000d39f9b45906c..dddbd6ba1eb9fcbc2c0d81f24e1a9b3231558d7f 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -30,34 +30,8 @@ saved_pc	.req	lr
 
 	.section .entry.text,"ax",%progbits
 	.align	5
-#if !(IS_ENABLED(CONFIG_TRACE_IRQFLAGS) || IS_ENABLED(CONFIG_CONTEXT_TRACKING_USER) || \
-	IS_ENABLED(CONFIG_DEBUG_RSEQ))
 /*
- * This is the fast syscall return path.  We do as little as possible here,
- * such as avoiding writing r0 to the stack.  We only use this path if we
- * have tracing, context tracking and rseq debug disabled - the overheads
- * from those features make this path too inefficient.
- */
-ret_fast_syscall:
- UNWIND(.fnstart	)
- UNWIND(.cantunwind	)
-	disable_irq_notrace			@ disable interrupts
-	ldr	r1, [tsk, #TI_FLAGS]		@ re-check for syscall tracing
-	movs	r1, r1, lsl #16
-	bne	fast_work_pending
-
-	restore_user_regs fast = 0, offset = S_OFF
- UNWIND(.fnend		)
-ENDPROC(ret_fast_syscall)
-
-	/* Ok, we need to do extra processing, enter the slow path. */
-fast_work_pending:
-	add	sp, sp, #(S_R0 + S_OFF)
-	/* fall through to work_pending */
-#else
-/*
- * The "replacement" ret_fast_syscall for when tracing, context tracking,
- * or rseq debug is enabled.  As we will need to call out to some C functions,
+ * As we will need to call out to some C functions,
  * we save r0 first to avoid needing to save registers around each C function
  * call.
  */
@@ -75,7 +49,6 @@ ret_fast_syscall:
 ENDPROC(ret_fast_syscall)
 
 	/* Slower path - fall through to work_pending */
-#endif
 
 	tst	r1, #_TIF_SYSCALL_WORK
 	beq	slow_work_pending

-- 
2.49.0

