Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065814C8E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859408; cv=none; b=aCDIy422QuE7dRmZ7/C4g0JceV9EV9FQieB1v/t8CDiPpkKGq/j/BXbfivWBAtv6G65QXYo8PuhTpJkPuOJIZt0utPUadEqiSY0nQmQLh2vU9MZbe+bTK0DPrKu/YEZTL0FBaxn+6yYRKOepYZLYUBDFW+EsJ4Wyuk1UubCpAKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859408; c=relaxed/simple;
	bh=y2mUyFbLUivGdmkfUFADgv9NK613QVnJe10D4dEcgzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffiBZeC5m91bE+13Ya6xLhznEINl5wtY2kRlQTrNspJJgvXMWoF3aPqprIbAior7X7uzIoiO9APfr4r7r2Y+vEiD85aTq5WdcG/MCiOCaO/unV4SVynUxPSxM7MkPOZFqbexCv55HYj7sv3bbAv4+fP20m9PbiauUF+BX9tmMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WvZcK2vv; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WvZcK2vv"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dcc38c7c6bso2238322a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738859404; x=1739464204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTHYqt8Iolcm07I+xgEP0zR0dZdIGXW4rO6IAVX9nWs=;
        b=WvZcK2vvnukoI/9z3tLA1S6RNj7Q7qaFprGKTT6OAI0OlUIzSzCsp3pV7eps1Nj6GM
         3kfuGT9j+RvG2U+Rx32PJ4VJM4pDmOVfGMSHptv6M5CEhwclyAmoZl6ixyHt7Dy3hETk
         DXNAVLVVNUoIjNdy8cNtyOX2RQ2k90wrVCL94ozBSDvyK3qnZiF+YWk/C7otq03Qizd9
         FDZGuyrUx8cv78ydgePIw81S7z33K/96DtOu7nHrElAQJeJgkNd14j4LeNdSmk5G4E7I
         ews6jpzY/qvgOUj6DozkprVOCNY+LATl/sA8on7RToZ0loTsSNiFDjHrZSyg4C5TYwyZ
         foZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859404; x=1739464204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTHYqt8Iolcm07I+xgEP0zR0dZdIGXW4rO6IAVX9nWs=;
        b=ZFAkP4HmK/ZKhwgGWt3EmQfIjuYNVDvbe9NASh97GiSpRRDO9a4KZ7TI6v/f8G7yMs
         amZh8glIxWmlcVnS/k9caixQnnQdajzeNQ188/alQ+iSGH+UcDsKNkwZAOK8GHfP5jGK
         Q38M/OytxlcA43YtqFsivfl9wZPlyrfrfMMXsqYarv4p3SzPUWL2G6cBz1vTUyatRsRN
         7sv4w4Yoh+ZS6R/KZ56h7RN6SBgoI4kiZfVns7fqCAi7d4JDbC9m4/fteF37MmmUukXl
         4nP/ne0v55hNhwuFJjcFemyO9FCXY57V+Gmwd2pw92zLhjtvfANtNciiRCX58wdIz3Pz
         OIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQtOjtNf1d6nOFXI/X8aejImuq7ucmCvdcBWmLOeImrFufiocPFll1gaN+Sl9ecyUoV9Sj8L5R4ScHnJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0UcgYdI2wNOZzOgIZu0fHu9jk52EV5dgaPVdkZp9W86NNqTf
	Y5nJF9dv8qdWEscCAcK0TG2didRP277nwIpYacEkY/9H+oLvCfIu+E2xW8NoBcc=
X-Gm-Gg: ASbGncs3v+RrCiq5mEg09tcl+JzNq22Q+9ZYTACFGxOKjVEVGzbnWGvEI4tb38DV8iW
	IUxG4WulerG0axK7bbPoSJTVcNmu+HVdmdKvE6xO3bYlKhpI+KKni2gTOxvMLYkpWC1WXhyoeGP
	ftzK6zYdypKtppNlC9sYNwmiiG1ne/zZgGG+a6m5ho4l0nrxcVyncl47hgWgc8qhDuryPDwoT70
	aDDYPVjoaZJcqiOpRqeGXNo/UQFmAfwjft+AruxJIoGacfW1MheYAHCu5yhAGA7eSXG5Soz/sEM
	Jf4u4HOtCh6fLUIR0/9/MfazRw==
X-Google-Smtp-Source: AGHT+IGFKO1yTLaJU2dy15//LnRcqKY2L7NyYivlZuIz2JXRsBeH4+staiSMPbr0dsyaGwAlbB7myg==
X-Received: by 2002:a17:907:7b89:b0:ab7:5a5e:b652 with SMTP id a640c23a62f3a-ab75e26457amr687233866b.15.1738859403998;
        Thu, 06 Feb 2025 08:30:03 -0800 (PST)
Received: from localhost.cz ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365c9fdsm120445466b.169.2025.02.06.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:30:03 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: bibo mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Youling Tang <tangyouling@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] loongson: Fix idle VS timer enqueue
Date: Thu,  6 Feb 2025 17:29:22 +0100
Message-ID: <20250206162922.3028861-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206162922.3028861-1-marco.crivellari@suse.com>
References: <20250206162922.3028861-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>

Loongson re-enables interrupts on its idle routine and performs a
TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.

The IRQs firing between the check and the idling instruction may set the
TIF_NEED_RESCHED flag. In order to deal with the such a race, IRQs
interrupting __arch_cpu_idle() rollback their return address to the
beginning of __arch_cpu_idle() so that TIF_NEED_RESCHED is checked
again before going back to sleep.

However idle IRQs can also queue timers that may require a tick
reprogramming through a new generic idle loop iteration but those timers
would go unnoticed here because __arch_cpu_idle() only checks
TIF_NEED_RESCHED. It doesn't check for pending timers.

Fix this with fast-forwarding idle IRQs return value to the end of the
idle routine instead of the beginning, so that the generic idle loop
handles both TIF_NEED_RESCHED and pending timers.

Fixes: 0603839b18f4 ("LoongArch: Add exception/interrupt handling")
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
 arch/loongarch/kernel/idle.c  |  3 +--
 arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
 3 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
index 86d5d90ebefe..ab2e9a262ee2 100644
--- a/arch/loongarch/kernel/genex.S
+++ b/arch/loongarch/kernel/genex.S
@@ -18,28 +18,33 @@
 
 	.align	5
 SYM_FUNC_START(__arch_cpu_idle)
-	/* start of rollback region */
-	LONG_L	t0, tp, TI_FLAGS
-	nop
-	andi	t0, t0, _TIF_NEED_RESCHED
-	bnez	t0, 1f
-	nop
-	nop
-	nop
+	/* start of idle interrupt region */
+	li.w	t0, CSR_CRMD_IE
+	/* idle instruction needs irq enabled */
+	csrxchg	t0, t0, LOONGARCH_CSR_CRMD
+	/*
+	 * If an interrupt lands here; between enabling interrupts above and
+	 * going idle on the next instruction, we must *NOT* go idle since the
+	 * interrupt could have set TIF_NEED_RESCHED or caused an timer to need
+	 * reprogramming. Fall through -- see handle_vint() below -- and have
+	 * the idle loop take care of things.
+	 */
 	idle	0
-	/* end of rollback region */
-1:	jr	ra
+	nop
+	/* end of idle interrupt region */
+SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
+	jr	ra
 SYM_FUNC_END(__arch_cpu_idle)
 
 SYM_CODE_START(handle_vint)
 	UNWIND_HINT_UNDEFINED
 	BACKUP_T0T1
 	SAVE_ALL
-	la_abs	t1, __arch_cpu_idle
+	la_abs	t1, __arch_cpu_idle_exit
 	LONG_L	t0, sp, PT_ERA
-	/* 32 byte rollback region */
-	ori	t0, t0, 0x1f
-	xori	t0, t0, 0x1f
+	/* 16 byte idle interrupt region */
+	ori	t0, t0, 0x0f
+	addi.d	t0, t0, 1
 	bne	t0, t1, 1f
 	LONG_S	t0, sp, PT_ERA
 1:	move	a0, sp
diff --git a/arch/loongarch/kernel/idle.c b/arch/loongarch/kernel/idle.c
index 0b5dd2faeb90..54b247d8cdb6 100644
--- a/arch/loongarch/kernel/idle.c
+++ b/arch/loongarch/kernel/idle.c
@@ -11,7 +11,6 @@
 
 void __cpuidle arch_cpu_idle(void)
 {
-	raw_local_irq_enable();
-	__arch_cpu_idle(); /* idle instruction needs irq enabled */
+	__arch_cpu_idle();
 	raw_local_irq_disable();
 }
diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/reset.c
index 1ef8c6383535..d78e8a1064a1 100644
--- a/arch/loongarch/kernel/reset.c
+++ b/arch/loongarch/kernel/reset.c
@@ -20,6 +20,11 @@
 void (*pm_power_off)(void);
 EXPORT_SYMBOL(pm_power_off);
 
+static __always_inline void native_halt(void)
+{
+	asm volatile("idle 0" : : : "memory");
+}
+
 void machine_halt(void)
 {
 #ifdef CONFIG_SMP
@@ -32,9 +37,9 @@ void machine_halt(void)
 	pr_notice("\n\n** You can safely turn off the power now **\n\n");
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 
-	while (true) {
-		__arch_cpu_idle();
-	}
+	while (1) {
+		native_halt();
+	};
 }
 
 void machine_power_off(void)
@@ -52,9 +57,9 @@ void machine_power_off(void)
 	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
 #endif
 
-	while (true) {
-		__arch_cpu_idle();
-	}
+	while (1) {
+		native_halt();
+	};
 }
 
 void machine_restart(char *command)
@@ -73,7 +78,7 @@ void machine_restart(char *command)
 	if (!acpi_disabled)
 		acpi_reboot();
 
-	while (true) {
-		__arch_cpu_idle();
-	}
+	while (1) {
+		native_halt();
+	};
 }
-- 
2.48.1

