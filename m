Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698F1AF4C1
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739009980; cv=none; b=s6jiwD2MPyzpcMV7ESvbXI2ZgMR3M0mdCQTZZDRUgDarulrRT2DKMhs8krRtMu96ZvmH4tHFZkRo+G252jpx4wOq/JHejnu0tdwn1YKhD6IG0hOX5K7MUM5/2We4uuYEvs7Vw9N6Ko7ZUNQndFIAsDbQbp2FHxoVpKJ7ywH7Gzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739009980; c=relaxed/simple;
	bh=tVzmkJNBmCrybh26B0umNvfyRgCPWNFEKRHkE+9/lKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUT6M7wnh/O3Ovr6yRx7bSBa+58fLWaUnhX5Z5Nx/1ZQWIM4sUoprheploayXzKGfrApHfTPnoS+RdvGwn71Ynvctbq8b57OssF+ng1iX+NL4M/zcX5girUaZNj6jggeMHhmM4Rwv8/fHwJwfyG9ADnQeX7Jxzn/SPpOFt0+IhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xh1iTkSA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xh1iTkSA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f664af5so31403995e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739009977; x=1739614777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Esg1VGvjrb5D7MYR0Br3tbmyn/kKCtNgEXu25xtXGMs=;
        b=Xh1iTkSA1cns3kaEmq6pxBVG8pQIecXEqpwapIQaOYMTu0fuz6FMPvW435zSGCjA3g
         4axK5FEcqmnvk5balVMWNVtgQPWq9mC8CZci3SIyyfq8VbrV0wREEoTQ74OjnULExEn7
         W3d7Z4yLNXW4MyDDkGfwlwkyjvhcaieKnvhFPkr7pBq+/rk7ZHTbKNMpLPwjOeuZILY5
         yQbxCba+gRBAa7lRBBvLwcwKTBb1huhUx+izFfm1VjRZsSUXvwEmeD0J2hY7HpJrM3oj
         wA/VmUVQzA0njk2Y2svdMNN+ZrR4WQWUAxu+zM88Kf+kXEEza5tZMeuIe9DExrdGrwX1
         c1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739009977; x=1739614777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Esg1VGvjrb5D7MYR0Br3tbmyn/kKCtNgEXu25xtXGMs=;
        b=fZcVyx1nUIyLEKalk8eoy7b8JEHEkbXxZ6s04aqdvYnvh1akE7QNbEHplM1pG/MsFo
         bAhv6ReP2O55r94D2ESloP+bT9G+NP8Cw7+jShkDbXR9KvzasqvnomdT98fko8kDc8rI
         b5EQVEeu3JOSkfWq3VLs/Mwxu2AHibd4c/2g1jDry1gpwK+Up+tWhfT2/zXX0X69fx5f
         XIVF81eDO9g9HqQ06i8ESbToicUNbbYrdsS37MSe0qgNQGwDLu3CAIbVvX+kJPN3+8Te
         iLzfMClcJEq6wbKnddCsZ6rA2sUEmcpNDYXYvh3cb7N+wkgAR2tEm27Aa7DxXfxu4qob
         X9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUerQ9TcXFaXoNg+r67Jy05/wAyzbMpINjGmf/XWZCBX4txRQsJERIerG/9aVvNopZs+cYhX9Qy2KTt5ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBohQCOs68hhe1vU4BUk9FqLcZmNf/Ru09ZHoqKxEu7Tx2Km0S
	+jaVbAYOEueR878PGPru7K7C+K44Hfa5NrNZFDls90tQxqBmMJbrRztNy4ievJw=
X-Gm-Gg: ASbGnctEufK1vQdXcZe3M3g5/5yuIW1iQzY1880W3gaY/MP5kcjsdMXTc76a8gGpeTK
	kEG5t/7g1Tfy/EIsCMaHsrWCOmnvwXEe3os79QwPwU5DIC4zX/whmf55kWum2nOmUSox+9jZ8AE
	Ck1QIbvAYahGOwld1ciEYSI2xZwubnF4cPwjwyi/cOnqoHDU4eGRZq7XmaGdL8xIUQAKvoDOGNn
	9Ldyo7GkMEZg+mnkofiY+S4o55voKOPBbv3p8MXPiCBTRMQ/2EMWNyaIb/ZJQPbmSQfDeCagNuc
	rKcICuJCGVkeqeuutMS0+aQqaTZBk2WN/gX5yMM=
X-Google-Smtp-Source: AGHT+IGhC8dMLdeFtEA9/zv/9/BP6e90UJJFspn28VVaOtsiGyJLXQCXGSsryUTvVDwrVL1pNCRtuw==
X-Received: by 2002:a5d:64a3:0:b0:38d:cf33:31c6 with SMTP id ffacd0b85a97d-38dcf3336e9mr2666075f8f.50.1739009976593;
        Sat, 08 Feb 2025 02:19:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd3a9cc05sm1474057f8f.0.2025.02.08.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:19:36 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 1/1] [PATCH] loongson: Fix idle VS timer enqueue
Date: Sat,  8 Feb 2025 11:19:24 +0100
Message-ID: <20250208101924.20743-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208101924.20743-1-marco.crivellari@suse.com>
References: <20250208101924.20743-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Cc: WANG Xuerui <kernel@xen0n.name>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 arch/loongarch/kernel/genex.S | 31 +++++++++++++++++--------------
 arch/loongarch/kernel/idle.c  |  3 +--
 arch/loongarch/kernel/reset.c | 18 +++++++++---------
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
index 86d5d90ebefe..9623298a5cf1 100644
--- a/arch/loongarch/kernel/genex.S
+++ b/arch/loongarch/kernel/genex.S
@@ -18,28 +18,31 @@
 
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
+	ori		t0, zero, CSR_CRMD_IE
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
+	/* 3 instructions idle interrupt region */
+	ori	t0, t0, 0x0c
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
index 1ef8c6383535..8fd8c44b02cb 100644
--- a/arch/loongarch/kernel/reset.c
+++ b/arch/loongarch/kernel/reset.c
@@ -32,9 +32,9 @@ void machine_halt(void)
 	pr_notice("\n\n** You can safely turn off the power now **\n\n");
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 
-	while (true) {
-		__arch_cpu_idle();
-	}
+	while (1) {
+		asm volatile("idle 0" : : : "memory");
+	};
 }
 
 void machine_power_off(void)
@@ -52,9 +52,9 @@ void machine_power_off(void)
 	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
 #endif
 
-	while (true) {
-		__arch_cpu_idle();
-	}
+	while (1) {
+		asm volatile("idle 0" : : : "memory");
+	};
 }
 
 void machine_restart(char *command)
@@ -73,7 +73,7 @@ void machine_restart(char *command)
 	if (!acpi_disabled)
 		acpi_reboot();
 
-	while (true) {
-		__arch_cpu_idle();
-	}
+	while (1) {
+		asm volatile("idle 0" : : : "memory");
+	};
 }
-- 
2.48.1

