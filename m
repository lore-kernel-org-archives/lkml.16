Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F372E7187
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945329; cv=none; b=H+0IZWN0h4xe+HWXERIFGL5xPkXEID9ven4OGTwE4hUyuLYWbunsb9px94cHg+NskE4bIo/OmP53DUz3ZZulftgsRa0rPo90Vqc27HMBKi8/kTTFcW5E0aej5iPzvSUOgImJkfhZEgG4wLMWKDni873ta4E0BQV4GLS7hphSiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945329; c=relaxed/simple;
	bh=nQL9qL18Vb2CXS7ndOrNIvZy9URifx39W6PpmGQvWJA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZBmTv/vzcSd8OJA7iJXW3IkdYqXPnw4yJIz1kzTnn2lftyc84Oa0RKvm3/hAFl3lYNNXViKG+tpvGLBImmy1Z0cQIHTQOPIWVXY8AcUfGu7xKIGe1xChA4DeXqa+p8ZlaVjjabEBWgDUqt1IS9WY+GL8a004LOZeTygRQ62e97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FBD6JQkv; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FBD6JQkv"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso597841f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945326; x=1751550126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgRyE+5ZFAr6FW9KaXMYIeYZG6lVPAbPaVY2rL2tJCY=;
        b=FBD6JQkvPpSWm9/p/41RH9lLravwqkc9DJ+g2VaZXBnoJwszZgpF82p6wJHxFnVIam
         dWIM6QrcgzPYpRdYLCMIK5pykrU36GrR/ZuZDx03RHbfZx5rWjOjuoVX+b+IMt54x6gi
         H0dcl42jn17/F7+QUMWMNyb6drq++FK2SnM/m67/fNoJGyq4fVu8oK+VqdGgiBInHSWr
         hTwSmo2x52aRRxgWJA8pJ1ImIchnYKzHNZ2EFS9QY0Jp4I4m8dVTKRPXzuWzyuGoRMWN
         xpuYYZiyJAEIlK0AgJU2k2Ym0ZLVoMUt8h+0UOW6YqqYJOswYUeme7LpXDmm4aaSSo+C
         HtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945326; x=1751550126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgRyE+5ZFAr6FW9KaXMYIeYZG6lVPAbPaVY2rL2tJCY=;
        b=B3iLyzXgQC+bEqHer0vizbPHfG+H9gzYjn5TR9zwVp2TZfORgKGP/gFTXZBzlvW3Jq
         yHju0rJf1tW0+iaWfS0jWfdW2PECpjaU8nwqqcNJKztymXM/XAm8P6V4NO+apiUYPMUs
         DqCraxjWMlpOPLEsp2oPsGCSl5YrToZ9/ZuWBK2d3axNqnQOwHFC+nVDCaKhfu0oht78
         TZFMkpfR+MgC+h/4MQN23KLJqN9C5ig3HB81L2Grwa5i2FXIgdEQVtAUFkG+UyWVSLOa
         2l0X0iqzhyx8a3CKE47uXtLKEywfz0P+lV/e2stbTPxXGRLO37lDsTFT8K6ttGN7a57E
         AAiA==
X-Forwarded-Encrypted: i=1; AJvYcCXwFRd/9cnK6aKyyYqoaTf9GaIt5Q/NnEWQ8AuvXUdYOo8WNruRZFFRpbfmOUS3vRFLHDpsxo3xIgHGc7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpIUo+lmeMAtfcv+XbBp7mjsOh80T1zqnVmyZTuG+pHLpVw33
	6lMhcSONZj+dFLCYcohUW35uStnTCW+KFm8W+/bqiSYiebPzpzp7eOKu4LHYKZf7VHSdfqREBjL
	mw+STsQ==
X-Google-Smtp-Source: AGHT+IFk9I2UFBPk4ooJjt86C1f4Vas4CeRth34J1XeNIpRrMluDFvYvas36eaZF9LEyQqYzdAYxPmqxpJ8=
X-Received: from wmth13.prod.google.com ([2002:a05:600c:8b6d:b0:44f:f406:f4f2])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6f18:0:b0:3a5:8a68:b823
 with SMTP id ffacd0b85a97d-3a6ed60755dmr5704580f8f.23.1750945326673; Thu, 26
 Jun 2025 06:42:06 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:48 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-2-glider@google.com>
Subject: [PATCH v2 01/11] x86: kcov: disable instrumentation of arch/x86/kernel/tsc.c
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

sched_clock() appears to be called from interrupts, producing spurious
coverage, as reported by CONFIG_KCOV_SELFTEST:

  RIP: 0010:__sanitizer_cov_trace_pc_guard+0x66/0xe0 kernel/kcov.c:288
  ...
   fault_in_kernel_space+0x17/0x70 arch/x86/mm/fault.c:1119
   handle_page_fault arch/x86/mm/fault.c:1477
   exc_page_fault+0x56/0x110 arch/x86/mm/fault.c:1538
   asm_exc_page_fault+0x26/0x30 ./arch/x86/include/asm/idtentry.h:623
  RIP: 0010:__sanitizer_cov_trace_pc_guard+0x66/0xe0 kernel/kcov.c:288
  ...
   sched_clock+0x12/0x70 arch/x86/kernel/tsc.c:284
   __lock_pin_lock kernel/locking/lockdep.c:5628
   lock_pin_lock+0xd7/0x180 kernel/locking/lockdep.c:5959
   rq_pin_lock kernel/sched/sched.h:1761
   rq_lock kernel/sched/sched.h:1838
   __schedule+0x3a8/0x4b70 kernel/sched/core.c:6691
   preempt_schedule_irq+0xbf/0x160 kernel/sched/core.c:7090
   irqentry_exit+0x6f/0x90 kernel/entry/common.c:354
   asm_sysvec_reschedule_ipi+0x1a/0x20 ./arch/x86/include/asm/idtentry.h:707
  RIP: 0010:selftest+0x26/0x60 kernel/kcov.c:1223
  ...
   kcov_init+0x81/0xa0 kernel/kcov.c:1252
   do_one_initcall+0x2e1/0x910
   do_initcall_level+0xff/0x160 init/main.c:1319
   do_initcalls+0x4a/0xa0 init/main.c:1335
   kernel_init_freeable+0x448/0x610 init/main.c:1567
   kernel_init+0x24/0x230 init/main.c:1457
   ret_from_fork+0x60/0x90 arch/x86/kernel/process.c:153
   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   </TASK>

Signed-off-by: Alexander Potapenko <glider@google.com>
---
 arch/x86/kernel/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 84cfa179802c3..c08626d348c85 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -43,6 +43,8 @@ KCOV_INSTRUMENT_dumpstack_$(BITS).o			:= n
 KCOV_INSTRUMENT_unwind_orc.o				:= n
 KCOV_INSTRUMENT_unwind_frame.o				:= n
 KCOV_INSTRUMENT_unwind_guess.o				:= n
+# Avoid instrumenting code that produces spurious coverage in interrupts.
+KCOV_INSTRUMENT_tsc.o					:= n
 
 CFLAGS_head32.o := -fno-stack-protector
 CFLAGS_head64.o := -fno-stack-protector
-- 
2.50.0.727.gbf7dc18ff4-goog

