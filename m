Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA191EB5FF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102179; cv=none; b=rf2gaFbTknHmN8MQmKsqFpN0S/m1dxdQ8xsnpEUkgs0dNMAUOcXTgJ5X35VqYvu9jTfQxbp7VOJrlSZFa2OPtjT9m990S1d0PWgHDFqkPmD3tKEkCIqPYlMGqT20Cwxf2rl8oo2G7FmpfFcbel36+l/0UwiW+/DtQmPRwlwnCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102179; c=relaxed/simple;
	bh=Ux9KdL8Xwrhk8Nc9+cZ/O2L+pGIkK2cv5JJYwyFc3I8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wwv+oijulCa+O9GD+C5ZASXDQk2c6lGMkcGZGAbQS3pFswnUfaCqo7PbRlEmgw5ZBjGQ5V3rwwqH7Du/jhBmP5zzxlpFd1KZN2YouYIAGCBCTuFxkQy8OreiCsGGxQudipXj4Y/lig2ShPcm3MsHnr7cDXrXZesUvo4KNrAB6Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCWbEqFU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCWbEqFU"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b166fa41bso3305264e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102175; x=1745706975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S06JQqVlFUu5YQR6B7LpPsHspKKb3zlQ4EOB8DFSLhc=;
        b=QCWbEqFUTVOtlWu8n1JYxQH4CqVeSpGB29RxiQ1zHzlhiP7wFoeS4T3dm6hdoM5Iz7
         VGDAyKFN+BmTN66lyO8GYMzQ83+hYk/nJw3lQEXAFfkL3/19ot4Ga6/i+PaO1/PX5hW7
         i3e8nkT/QiiGlCUw+JWa4yvJw+XsBC+2PPzc1Nr/ip+Eqp1TLh8ueasfRKU1aQKIbNbz
         B1MMZmutrQH+BxIMv/SAJIfu7Ca8KoeywL3K0itsx0WEuCMP4ezHb/S0/qH8e0hz6DXY
         sA0SHdB25pVyUYVgmTqLEVAy4uiw1WOH9//ngyeUYTn65iPtnGIH562fM6RO85sJy6EM
         pp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102175; x=1745706975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S06JQqVlFUu5YQR6B7LpPsHspKKb3zlQ4EOB8DFSLhc=;
        b=kFMpj1L3vnmTggAlh4WYecNBGx2+rzHrm7b/tNiFxGzTHs6TV/m0HQYvyr/Ghzcyr9
         qVfqd0jZQby0uGPcc1ZvkuXGuw2BlbXTUKV1STcuXf8YxEOfOXkqp1gkhXS64FMHq0ry
         zbcbh2F9z+sglf89gkqK51GP0rvqShHQ+o2qPSFAes8l0vUkIde4/kyX8hPSARorKWkN
         n9Prhe0gZSjxc8vjugbS2WiP9m07qf/UYxPOJSyCyPDHJS/0QYtaTUhO9O55n0OYmnRF
         H7UC2jNamMwf7O7WZEaua0vbhcKTQ0R3gHQPQOF0R9KAHMc9SwlBvOjs+LHAnTz7tdpC
         ndFA==
X-Forwarded-Encrypted: i=1; AJvYcCUcApgLmDEe9RWyvnKva9d/lsE1/CJbt+ics7Vl1Tw8zsap8VLbcoJL6eqmluFtCaOfgHkBIBGHTP9PKeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh0Q5a6ON7xLpRvarQXyIKia4dULotDBQxV31hM3rUF+fbOiu+
	+biHX7jvQ2/OGNMmKkoUz0a4Y9c1nCXJ9NJKRiT3+g3wQoi3N6yRfxiwo/tJ4vI=
X-Gm-Gg: ASbGnct9B7sO3IyudBUnQH6WZOF9hv269yfVfjC8GU1IbelNLel8TzhqHfvFIMhPN3D
	eFtveGFHhxZporC43EhCokzHN8ROypn2+C/D74K8aXlSbYcgZf0+wfaGj1/UMvZ7LCRwjaqAQuA
	wkpkB7/x78hfqB9V3kVwEHCoELT1p7Cfe287Q/w4gezlLlr+ScUqLmBlC1roX7uHaxb0ZmQ5xen
	r4zP1vh8YacbUjbC8a5cBYe+sc/kkrMrsm8jm1AMSVCy5Wr0o+WstwbcSdQ8oYTXQtY5gpSvkQm
	nCTlnpcfXMm+C9mdQU2oh2IlIWUH9LG24CgEKxmRCrJFGrXpAJY=
X-Google-Smtp-Source: AGHT+IGrGpnN8/tEv6ndwbb/jlIR6Kig9UXaFiAlwtupFJWaEj/+/pWLTfpATpASNAxUxjR0OdE0lA==
X-Received: by 2002:a05:6512:3d8f:b0:54b:f10:fe46 with SMTP id 2adb3069b0e04-54d6e633c8cmr1668429e87.25.1745102175072;
        Sat, 19 Apr 2025 15:36:15 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:01 +0200
Subject: [PATCH v6 14/31] ARM: entry: Drop trace argument from usr_entry
 macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-14-95f1fcdfeeb2@linaro.org>
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

The trace argument select whether to look into tracing of
the hardirqs for the exceptions from userspace, but also
selects whether to call further down to establish context
for RCU.

Split off a second macro that is called on everything
except the FIQ since this is the only outlier.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-armv.S | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 93a37437a9520118eff411f009e8f6bd729412fc..c71110126fc105fc6ac2d6cb0f5f399b4c8b1548 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -357,7 +357,7 @@ ENDPROC(__fiq_abt)
 #error "sizeof(struct pt_regs) must be a multiple of 8"
 #endif
 
-	.macro	usr_entry, trace=1, uaccess=1
+	.macro	usr_entry, uaccess=1
  UNWIND(.fnstart	)
  UNWIND(.cantunwind	)	@ don't unwind the user space
 	sub	sp, sp, #PT_REGS_SIZE
@@ -401,13 +401,14 @@ ENDPROC(__fiq_abt)
 	@ Clear FP to mark the first stack frame
 	@
 	zero_fp
+	.endm
 
-	.if	\trace
+	/* Called after usr_entry for everything except FIQ */
+	.macro	usr_entry_enter
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
 #endif
 	asm_irqentry_enter_from_user_mode save = 0
-	.endif
 	.endm
 
 	.macro	kuser_cmpxchg_check
@@ -429,6 +430,7 @@ ENDPROC(__fiq_abt)
 	.align	5
 __dabt_usr:
 	usr_entry uaccess=0
+	usr_entry_enter
 	kuser_cmpxchg_check
 	mov	r2, sp
 	dabt_helper
@@ -439,6 +441,7 @@ ENDPROC(__dabt_usr)
 	.align	5
 __irq_usr:
 	usr_entry
+	usr_entry_enter
 	kuser_cmpxchg_check
 	irq_handler from_user=1
 	get_thread_info tsk
@@ -452,6 +455,7 @@ ENDPROC(__irq_usr)
 	.align	5
 __und_usr:
 	usr_entry uaccess=0
+	usr_entry_enter
 
 	@ IRQs must be enabled before attempting to read the instruction from
 	@ user space since that could cause a page/translation fault if the
@@ -476,6 +480,7 @@ ENDPROC(__und_usr)
 	.align	5
 __pabt_usr:
 	usr_entry
+	usr_entry_enter
 	mov	r2, sp				@ regs
 	pabt_helper
  UNWIND(.fnend		)
@@ -495,7 +500,7 @@ ENDPROC(ret_from_exception)
 
 	.align	5
 __fiq_usr:
-	usr_entry trace=0
+	usr_entry
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
 	bl	handle_fiq_as_nmi

-- 
2.49.0

