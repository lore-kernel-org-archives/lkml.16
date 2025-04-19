Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D961EBA19
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102185; cv=none; b=uYjtPTnGg6lu+MD057ip8fhubn9g0t2w69SR9+90gZilntwZc/oRpB+XRVi/OnTGPkRfQLGs/XE9NFMlwVL3PIFEytVCV3yANF+L8sej17qMCq1O2NU5seBSqgW2F8s0JKjmcb3F4NYH60eqK/GBUCFerlEODFo8X/Ugu3fqOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102185; c=relaxed/simple;
	bh=uzb8ozZAoEt/9ZNtFSIrYvQshl9f5/Sj8FTbEBSaVVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b55a5XFv9iK2sB5NE+rEHDpq/QN53tkmEI0fb3aZ8CINMji56z/iFU1X4FtTP7TXJsDC+nBfVdi7JO2YC5LFyaokNPBYYW5jz8qe6U8yN4gB4ir7WwTJ17C049uom0lIMao90s96RgeJjYyVqJSOA9WLoPT6YfdI5i4+LrWHAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LoNXLdrq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LoNXLdrq"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b166fa41bso3305388e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102181; x=1745706981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smP6wtuEPxGQlG+yx8YbiPVrmm7vWSzlxcMcUy2wQgU=;
        b=LoNXLdrqQuj77vfWnVk5rVF4TyY3qUebmSBRzGBMFr+0K0/Tnzb++5O8B1lS6Dawkr
         A8NuODw7f/PUbiEQmbMV5jT76kYHfV7lOtM+Y00EeDXyCn0eh1bJpAlE/UiNswy1QLgX
         QKFf+Tly2xGSaEepL+nwu96XREOfgJw50b3yZJHO1LW7OJBLj+3DcY5lrJaxOHQ1FlbZ
         R5dsnD1i6kC94Yxy1WZLPDdIhzHbyFtP/rH4jGlq3AB5C8tsZmV5fWHYfDJDTX1yW0Dl
         sTKg6OBl/sKvKWOjQ2Le3c2JDf4PjaLrbgDMYDslj633IKq9qKcEhdX7Z8+kOHXzZHCc
         pBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102181; x=1745706981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smP6wtuEPxGQlG+yx8YbiPVrmm7vWSzlxcMcUy2wQgU=;
        b=LHOGYOxBazZwcYDejTpC2uO9HBkFnV1Lv3tJOwV27J3nGzq5HCJAvB1WEOX2NnphiL
         plPgJD30zSVu4tkz1ET4tfFBxn829KLicIu7gfDzZghgMAsNNUq/wQDhtvAkC7NzqU3l
         AAoRQ7fUoCWAYUF08rSyqshRPD+t3tk02SEKBjlxpQCBUbhL33Fetbungdyw5DvFCPnV
         MVWL5IPNV1aD9tZyZyOSFngIFxRgolJuAQ6RuQ6pv+UvTPq4B+JmA9ojh9C6/X+i8HEk
         roOAtbiKOIxX3vxdFwj99B/EDUOWoFBshAWreI+6SeIxcIxube1ekYwNHOBwqO1l1X9t
         9TWg==
X-Forwarded-Encrypted: i=1; AJvYcCXCOZ/TlYUF7cmEsVd0k4atAXMKtNHWCrOP/xcxbykqbGj9c/wwjw6IG0YlQ3rYcRbqQsZp/LMzQU7NZqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzbml7rh4b8paMJ1MT1nnmvo4xRP3P3d3elnmKs7SLaCU1zn3f
	n1oY9apAogAtTMMk6yVndppmQIybkMSvrXRuSS1Drsk05AT8l3SeCGpFw/c4VWI=
X-Gm-Gg: ASbGncvYVAWHPU8tub4BrjsWttW8KWB8GOYB3f3FzLKhegdUD8ldVIYCOMcYX2H+Y3Z
	SOO2PJU/UQuIFxy26b2by+Agt5Mq6wc9lkoFxf4m0zeQk1UkDYoFvukuxlqgfE3B9BWIKt+fpdp
	zRCwtJ4nEN0fRKK/A1K5mXQlWbWoN3UNYL8NzZASYuMuRjPcSZ+PtpLPScL5SIqNjLEI2yGILJe
	qa57sb7EHzM8fq3e7Sf0rEiiA3ETgdo2Q0oJl5tmdgGhUv+TIR+d7dAXrn2VHc7fKoRQUolXcXh
	QMV0mJkQwUwU274zcUSJeWY1uUw83+xJn+o9Ly05FBcO2QYVnJI=
X-Google-Smtp-Source: AGHT+IEXHVxk/ZPzizZxk/wtdsPQEkeFJ8rWxX8XwR/1XQy0SnPGf2l5NdkpLMSSJywv9IZRutxODg==
X-Received: by 2002:a05:6512:1106:b0:549:38d2:f630 with SMTP id 2adb3069b0e04-54d6e62b9damr2006675e87.24.1745102181592;
        Sat, 19 Apr 2025 15:36:21 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:06 +0200
Subject: [PATCH v6 19/31] ARM: entry: Remove fast and offset register
 restore
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-19-95f1fcdfeeb2@linaro.org>
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

Now all remaining invocations of restore_user_regs has
fast = 0 and offset = 0 set, so drop these parameters
to the macro.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S   |  2 +-
 arch/arm/kernel/entry-common.S |  2 +-
 arch/arm/kernel/entry-header.S | 29 +++++++++--------------------
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 460aa92c3c1f50de905550acf363c58f509bfe0a..3cd5a80b47758867d1db6c3971030370bca1551a 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -497,7 +497,7 @@ __fiq_usr:
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi
 	get_thread_info tsk
-	restore_user_regs fast = 0, offset = 0
+	restore_user_regs
  UNWIND(.fnend		)
 ENDPROC(__fiq_usr)
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index dddbd6ba1eb9fcbc2c0d81f24e1a9b3231558d7f..d27e34d7e97a079d62e7b778cf7cf97c302e4763 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -81,7 +81,7 @@ no_work_pending:
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 	bl	stackleak_erase_on_task_stack
 #endif
-	restore_user_regs fast = 0, offset = 0
+	restore_user_regs
 ENDPROC(ret_to_user_from_irq)
 ENDPROC(ret_to_user)
 
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 50c0b55adc7421e7be123c9d00f94b1ebb93ff9e..51c7f93c1ded1db56f173c7aaed8094ef011ff5a 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -290,7 +290,7 @@
 	.endm
 
 
-	.macro	restore_user_regs, fast = 0, offset = 0
+	.macro	restore_user_regs
 #if defined(CONFIG_CPU_32v6K) && \
     (!defined(CONFIG_CPU_V6) || defined(CONFIG_SMP))
 #ifdef CONFIG_CPU_V6
@@ -309,8 +309,8 @@ ALT_UP_B(.L1_\@)
 #ifndef CONFIG_THUMB2_KERNEL
 	@ ARM mode restore
 	mov	r2, sp
-	ldr	r1, [r2, #\offset + S_PSR]	@ get calling cpsr
-	ldr	lr, [r2, #\offset + S_PC]!	@ get pc
+	ldr	r1, [r2, S_PSR]			@ get calling cpsr
+	ldr	lr, [r2, S_PC]!			@ get pc
 	tst	r1, #PSR_I_BIT | 0x0f
 	bne	1f
 	msr	spsr_cxsf, r1			@ save in spsr_svc
@@ -318,31 +318,24 @@ ALT_UP_B(.L1_\@)
 	@ We must avoid clrex due to Cortex-A15 erratum #830321
 	strex	r1, r2, [r2]			@ clear the exclusive monitor
 #endif
-	.if	\fast
-	ldmdb	r2, {r1 - lr}^			@ get calling r1 - lr
-	.else
 	ldmdb	r2, {r0 - lr}^			@ get calling r0 - lr
-	.endif
 	mov	r0, r0				@ ARMv5T and earlier require a nop
 						@ after ldm {}^
-	add	sp, sp, #\offset + PT_REGS_SIZE
+	add	sp, sp, #PT_REGS_SIZE
 	movs	pc, lr				@ return & move spsr_svc into cpsr
 1:	bug	"Returning to usermode but unexpected PSR bits set?", \@
 #elif defined(CONFIG_CPU_V7M)
 	@ V7M restore.
 	@ Note that we don't need to do clrex here as clearing the local
 	@ monitor is part of the exception entry and exit sequence.
-	.if	\offset
-	add	sp, #\offset
-	.endif
-	v7m_exception_slow_exit ret_r0 = \fast
+	v7m_exception_slow_exit ret_r0 = 0
 #else
 	@ Thumb mode restore
 	mov	r2, sp
-	load_user_sp_lr r2, r3, \offset + S_SP	@ calling sp, lr
-	ldr	r1, [sp, #\offset + S_PSR]	@ get calling cpsr
-	ldr	lr, [sp, #\offset + S_PC]	@ get pc
-	add	sp, sp, #\offset + S_SP
+	load_user_sp_lr r2, r3, S_SP		@ calling sp, lr
+	ldr	r1, [sp, S_PSR]			@ get calling cpsr
+	ldr	lr, [sp, S_PC]			@ get pc
+	add	sp, sp, S_SP
 	tst	r1, #PSR_I_BIT | 0x0f
 	bne	1f
 	msr	spsr_cxsf, r1			@ save in spsr_svc
@@ -350,11 +343,7 @@ ALT_UP_B(.L1_\@)
 	@ We must avoid clrex due to Cortex-A15 erratum #830321
 	strex	r1, r2, [sp]			@ clear the exclusive monitor
 
-	.if	\fast
-	ldmdb	sp, {r1 - r12}			@ get calling r1 - r12
-	.else
 	ldmdb	sp, {r0 - r12}			@ get calling r0 - r12
-	.endif
 	add	sp, sp, #PT_REGS_SIZE - S_SP
 	movs	pc, lr				@ return & move spsr_svc into cpsr
 1:	bug	"Returning to usermode but unexpected PSR bits set?", \@

-- 
2.49.0

