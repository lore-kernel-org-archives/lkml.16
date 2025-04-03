Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A282512C6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696718; cv=none; b=d8SuqBCV4taUy3P65FYb0ih3Pgxm45hSqfOcr6gHmdlqT8itWcy0pFGdts567AFLckQf2kb5u4kxhCuVbCOSNDsHrpcvGJaze33XTakVhWBLPOXdawmKPyEZwrIVWPZiyfhRa/yRunSN9L2gV3S42aMtnYuJCmzCbVn9YqT6hkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696718; c=relaxed/simple;
	bh=YN2pXwJPF96nuWfOOWw4SHf2boGYg/WjkZVa17LBO0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/IOkh4QeMT4An4RPkKbWxmS2Abf7F6/wd+8IbF9/Pxrcqp7peKFEMI9k50mBbCOzjO9vYtcqaqu9MMI6qffLLw1FxrKfo0Vbsfq2TehKQCxnxvdyUDTTbu4EcHX8CUbCqNGijpRuwhY7aMqSJnHa2VUIDmWqkUaybchc5gAOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LNfeavMX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LNfeavMX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso7178805e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743696714; x=1744301514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlJ/3e3YnpRgmZpHOjkxenlx25AWe78lgTCbvE2lseU=;
        b=LNfeavMXYx1A6Clc0rTChXqeZRRD0IdwSayWR3lO81mowtXRPU/r69BF9WGhhTU5bB
         IcChRQPaGj5T84RS5HMGEnj6cDZSIEFwOwfU6Z/WxY9vCP9+zhd7lV03bDMxVqoYWQSs
         VZDqLa5XwjkoD/hYQ0ojicigzz8iMMX0dgFCpMexPKmZCRiX+UaZpzlACHBLhFsuOnzS
         F6HmJH1ugTgspGuQYmZwXGd5SusGg3IcrRJzXZ8sQd/OY9s5Yag6RgedN41qruulIA72
         w2gfRvdFFhDL6tbvHS0/fK/vz5aZuw7rqmbZj2NZjJGFqnvGegm8yAoM5UFUSddzN7Pd
         jASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696714; x=1744301514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlJ/3e3YnpRgmZpHOjkxenlx25AWe78lgTCbvE2lseU=;
        b=bt3RvfrjHfXADOHFdv3g+yPw/ydlMQPemXjn4slbVMU/AIplpxkJ5zunvSwvqCyRA5
         IYP132USSX7AxE/lb0Tq67ErcOXAodrR1VyYTGaqxpwJ6M/xmU65hAGn2Tl6hBBeJGa4
         qYTRU4DuE7KzH1E5SkVr/GxB4Lnyqr+wr1E90Bc+UoPW7AHOm0OUDHdhN/UaurnJGk5c
         JkfTL1ighs7hMk2lkCkQa5s2d/Bk7NG674msIn2+CknAGUPm8MrHKMo95awqAfl3nsfk
         SYJpUSeOD2eToQu+rem9ZT6s1aPn1xEUEcJ5r+qqYFzpdwvPJGlRVFHMeqsP1mkjv3ae
         z3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVijGph2JPNlUPV5q1zf1w2Dt9NORB627mDoljRWrJvi94+0l2R8O42jK1gomkemADm3gbzM9Mcv5JnSAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLbDj2cdAzJJNjJuxrMXC6B49uc5bdeq0y15MszwIUdpi8RlN
	lv20DPOelagloIQqra5NzVUwUnhpoEJQ9i+JNm+Q92j/kYOMR+hbeW8Vtg0tCPKQL3qf1sq6O9Q
	G
X-Gm-Gg: ASbGncuV6xQa2HGFCxiQGw128Znwzz20E7uvBUX0UUJGIjuGGMr8HlSC7hcZCSnsB4/
	zeE8d4F5jMUBtvJsTvorB9/d41xHv/sV8XorSEWhkQI9aVmHEcHF1oBPqa8XP3Zs7fUJbx9xIBO
	O8DBM9J+5VfezzN1KaCX/jlAs93zCcR47NoFA0Bxn7Fi5zHQv4fUIFuqF9JAJrucYn5PNaS+uk+
	OycNtPRCMHrK1/PRs5mdheVmMrIQcEKvDnqqG8FzeNV+UpWpb/puRn3w66ssraA9VBrPic0iJFf
	dxpdaA6x+9tMf4dym2sG4ig4DrOLl18zy0lcm5Q1FTJX9HJ9NIntKI6ClW3SJRjDuQU=
X-Google-Smtp-Source: AGHT+IEYuOKT9MoXGQk2Pwn8XDuqGb0/UN/Eea2Yg8DvCQmZBwvl5WxYzyJodEa0j4leNcgumWexJg==
X-Received: by 2002:a05:600c:4fd4:b0:43a:ed4d:716c with SMTP id 5b1f17b1804b1-43db628c146mr174184195e9.22.1743696714512;
        Thu, 03 Apr 2025 09:11:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226acfsm2112383f8f.88.2025.04.03.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:11:54 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
Date: Thu,  3 Apr 2025 18:11:42 +0200
Message-ID: <20250403161143.361461-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-1-marco.crivellari@suse.com>
References: <20250403161143.361461-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPS re-enables interrupts on its idle routine and performs
a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.

The IRQs firing between the check and the 'wait' instruction may set the
TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
interrupting __r4k_wait() rollback their return address to the
beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
again before going back to sleep.

However idle IRQs can also queue timers that may require a tick
reprogramming through a new generic idle loop iteration but those timers
would go unnoticed here because __r4k_wait() only checks
TIF_NEED_RESCHED. It doesn't check for pending timers.

Fix this with fast-forwarding idle IRQs return address to the end of the
idle routine instead of the beginning, so that the generic idle loop
handles both TIF_NEED_RESCHED and pending timers.

CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
There, NOPs are 2 byte in size, so change the code with 3 _ssnop which are
always 4 byte and remove the ifdef. Added ehb to make sure the hazard
is always cleared.

Fixes: c65a5480ff29 ("[MIPS] Fix potential latency problem due to non-atomic cpu_wait.")
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/mips/include/asm/idle.h |  3 +-
 arch/mips/kernel/genex.S     | 62 +++++++++++++++++++++---------------
 arch/mips/kernel/idle.c      |  7 ----
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
index 0992cad9c632..2bc3678455ed 100644
--- a/arch/mips/include/asm/idle.h
+++ b/arch/mips/include/asm/idle.h
@@ -6,8 +6,7 @@
 #include <linux/linkage.h>
 
 extern void (*cpu_wait)(void);
-extern void r4k_wait(void);
-extern asmlinkage void __r4k_wait(void);
+extern asmlinkage void r4k_wait(void);
 extern void r4k_wait_irqoff(void);
 
 static inline int using_rollback_handler(void)
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index a572ce36a24f..46d975d00298 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -104,42 +104,52 @@ handle_vcei:
 
 	__FINIT
 
-	.align	5	/* 32 byte rollback region */
-LEAF(__r4k_wait)
-	.set	push
-	.set	noreorder
-	/* start of rollback region */
-	LONG_L	t0, TI_FLAGS($28)
-	nop
-	andi	t0, _TIF_NEED_RESCHED
-	bnez	t0, 1f
-	 nop
-	nop
-	nop
-#ifdef CONFIG_CPU_MICROMIPS
-	nop
-	nop
-	nop
-	nop
-#endif
+	/* Align to 32 bytes for the maximum idle interrupt region size. */
+	.align	5
+LEAF(r4k_wait)
+	/* Keep the ISA bit clear for calculations on local labels here. */
+0:	.fill 	0
+	/* Start of idle interrupt region. */
+	local_irq_enable
+	/*
+	 * If an interrupt lands here, before going idle on the next
+	 * instruction, we must *NOT* go idle since the interrupt could
+	 * have set TIF_NEED_RESCHED or caused a timer to need resched.
+	 * Fall through -- see rollback_handler below -- and have the
+	 * idle loop take care of things.
+	 */
+1:	.fill	0
+	/* The R2 EI/EHB sequence takes 8 bytes, otherwise pad up.  */
+	.if		1b - 0b > 32
+	.error	"overlong idle interrupt region"
+	.elseif	1b - 0b > 8
+	.align	4
+	.endif
+2:	.fill	0
+	.equ	r4k_wait_idle_size, 2b - 0b
+	/* End of idle interrupt region; size has to be a power of 2. */
 	.set	MIPS_ISA_ARCH_LEVEL_RAW
+r4k_wait_insn:
 	wait
-	/* end of rollback region (the region size must be power of two) */
-1:
+r4k_wait_exit:
+	.set	mips0
+	local_irq_disable
 	jr	ra
-	 nop
-	.set	pop
-	END(__r4k_wait)
+	END(r4k_wait)
+	.previous
 
 	.macro	BUILD_ROLLBACK_PROLOGUE handler
 	FEXPORT(rollback_\handler)
 	.set	push
 	.set	noat
 	MFC0	k0, CP0_EPC
-	PTR_LA	k1, __r4k_wait
-	ori	k0, 0x1f	/* 32 byte rollback region */
-	xori	k0, 0x1f
+	/* Subtract/add 2 to let the ISA bit propagate through the mask.  */
+	PTR_LA	k1, r4k_wait_insn - 2
+	ori 	k0, r4k_wait_idle_size - 2
+	.set	noreorder
 	bne	k0, k1, \handler
+	PTR_ADDIU 	k0, r4k_wait_exit - r4k_wait_insn + 2
+	.set	reorder
 	MTC0	k0, CP0_EPC
 	.set pop
 	.endm
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 5abc8b7340f8..80e8a04a642e 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -35,13 +35,6 @@ static void __cpuidle r3081_wait(void)
 	write_c0_conf(cfg | R30XX_CONF_HALT);
 }
 
-void __cpuidle r4k_wait(void)
-{
-	raw_local_irq_enable();
-	__r4k_wait();
-	raw_local_irq_disable();
-}
-
 /*
  * This variant is preferable as it allows testing need_resched and going to
  * sleep depending on the outcome atomically.  Unfortunately the "It is
-- 
2.49.0

