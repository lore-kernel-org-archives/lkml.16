Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F6FC0A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387770; cv=none; b=iodacWWaiOgciUHVjwJE1CDPpmb6Ds3evJuhyvUr/j7fn/r6AP7GGXnqzkj6pv54Foi5R5I9fCTB7f/e9JYIrvPwwHHb8Ba2aMRoBjc1hQQ5Q4toReXNpp29A/QzyD4aAI8CldU97thIZ0DzATno/zqTgPE+ZQyAke3j8wXLIrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387770; c=relaxed/simple;
	bh=R9pyu6SxVDRYySBOUHsmmz60FWD4QzVyTLXu21JzGQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q/mySNL4Lg4sc1SYGLtCAYP2xozDjHbUhYKWJ70ePzM5oTbOioLpH5Anet9KoeDsnnVVv92dqdLtfsDJrKUc7DyWJg4q1Tl+suGUGL7pZ0w+HGGPbGqHtPsnhbRkK/Jl3GIdqTpL0xFYs9qnvnO8PEqm5wfbLm3xoF2ZT72BQCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JZZ9bWDb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JZZ9bWDb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363497cc4dso49535965ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751387767; x=1751992567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOLuztNj03vJ+Lvv7ZhlIY6sagSprwhtrTY8mKCjRT8=;
        b=JZZ9bWDbR1bzi5ypi9RoirJEkfmLBfXY9erDBdzcU9Ubwd8qnYv+z88DsdiI++sLEt
         legKHfr2KSuGUlaFlMwXAhe4NpsGxqdhtCLkQ9fhkrvgf6ai6gRSmFX8e+1qUKHKnZtb
         Fk3gdQnRXLrSi4mOxNi0KL5lsxUDuoJchura34uDDVHQGqYz/hf86Nay288gYwLz6/A7
         ROsUY5D6xoLf2cw0Z8V/hV9wekorGqpbi2VZ53S5wc9UBJXHqTkX90wWshkA/dJBCdHs
         g4dM8MaS1cQBsu7eBDtGr2y1gnOs5qXpUmJfF0s7oxvoiwcmzNHSacnG0XbRNm83HPLl
         xz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387767; x=1751992567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOLuztNj03vJ+Lvv7ZhlIY6sagSprwhtrTY8mKCjRT8=;
        b=T3wHPdCfa5ZYqNEUhKDgM5iSZypyQdXY6xG5QPJaT1hHKEXPbDN2An+wqbe2ZzAw1d
         NHjE2189Dez290bkjOPgdFedm9dtVTWODt/uKqYIEmOwBhlSyEa6trXuWQlEuPuUqHRb
         ufiaXpClDj64oZJvSgJrZhMQRJYgo3GyR4sfHl0bfVbOhBJaqNFtHgTJAStnOIxz8vHO
         FxrExPn2WwTs28lvAJgNLqrn7BX0SRLz1+4qWJ/ommVBlhLM6cuBlrN57h000kK7+glj
         MKmnr3eaEVoWi0Hud/aL+7mZLAMauAM8jthaTmhgti8oeTDUM4XtUFakxFtrd8oSFRu5
         LO4Q==
X-Gm-Message-State: AOJu0Yx8UlT+Vv6cRgLcTNHbM/q3XgTlJzMIag0hY9PUV0kjfZ0xaS3d
	N2R/NIZiLl+JNqSFiprrv2sbnym2a0UfSBaYhk5wemdLxfj4e2yY9iR2SFbelYC7eZU=
X-Gm-Gg: ASbGnctF9KI2EBVSGdYsOvIA89spD/tV0sqVzhMXK4EOe1/xZ0+gLkkAR7actgz8cSp
	pgA1FTo/50gaFTswXHMLKzf+8x60+uRmCqrX1zNP1ZR0unOcRYjjDCU/WQukm3/QfXMPALVoHko
	os6JuIoDEegObDznnGB1+hu0GntWRztK97X4Hh+is2wqUCLPRHqlKlmmjfsZxqrTpprQaeUyZiR
	d9KJ+zgRm74N6iMD/MTPAJGO2obJ2YhaSd25SHFHzFX6L0ykRXHn7QqhmYJnHIjITy9LdupjzBh
	FMr9cd9PcCnv3tOLhLmaPWGSnUPtHLLCNUKeEkxc838WcvmkktteR8t1hWdt5ttSdTa25OQsoRZ
	qEaHlZA7lYcRcQcT0glS7
X-Google-Smtp-Source: AGHT+IFRsIbIEGD4GNMK9TygYJzEo5UAIfTX604PERX0zlKTw3v0A1OTc8v+I9D0f4GgwQUBlwA7Tw==
X-Received: by 2002:a17:903:2a87:b0:234:cf24:3be8 with SMTP id d9443c01a7336-23ac45e3721mr292368605ad.28.1751387767026;
        Tue, 01 Jul 2025 09:36:07 -0700 (PDT)
Received: from n37-056-208.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b8d96sm108567135ad.188.2025.07.01.09.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:36:06 -0700 (PDT)
From: Liangyan <liangyan.peng@bytedance.com>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Liangyan <liangyan.peng@bytedance.com>,
	Yicong Shen <shenyicong.1023@bytedance.com>
Subject: [RFC] genirq: Fix lockup in handle_edge_irq
Date: Wed,  2 Jul 2025 00:35:58 +0800
Message-Id: <20250701163558.2588435-1-liangyan.peng@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yicong reported a softlockup in guest vm triggered by setting NIC IRQ
affinity in irqbalance service.

When a NIC IRQ affinity is changed from cpu 0 to cpu 1 and cpu 0 is
handling the first interrupt of this IRQ in handle_edge_irq, the second
interrupt is activated and handled in cpu 1 which sets IRQS_PENDING flag,
cpu 0 will invoke handle_irq_event again after finish the first interrupt.
If the interval between two interrupts is smaller than the latency of
handling one interrupt in the loop of handle_edge_irq (i.e., unmask_irq +
handle_irq_event), cpu 0 may repeat to invoke handle_irq_event and not
exit handle_edge_irq which causes softlockup at last(hardlockup is
not enabled in guest vm).

In our online guest vm, we have some heavy network traffic business,
the number of NIC interrupt is more that 1000 per second, the NIC
mask/unmask_irq will trap to host and consume more than 1ms, this
softlockup is easy to reproduce. By bpftrace, we can see cpu 0 invokes
handle_irq_event more than 5000 times in handle_edge_irq when
softlockup occurs.

To fix this, we can limit the repeat times of calling handle_irq_event.

       cpu 0                                        cpu 1

  handle_edge_irq
    spin_lock
    do {
        unmask_irq if IRQS_PENDING
                                                handle_edge_irq
        handle_irq_event
          istate &= ~IRQS_PENDING
          spin_unlock
                                                  spin_lock
                                                  istate |= IRQS_PENDING
          handle_irq_event_percpu                 mask_ack_irq
                                                  spin_unlock
          spin_lock
      } while(istate & IRQS_PENDING)
      spin_unlock

The softlockup traces look something like this:
-----
watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [swapper/1:0]
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G             L
Hardware name: ByteDance Inc. OpenStack Nova, BIOS
RIP: 0010:__do_softirq+0x78/0x2ac
RSP: 0018:ffffa02a00134f98 EFLAGS: 00000246
RAX: 00000000ffffffff RBX: 0000000000000000 RCX: 00000000ffffffff
RDX: 00000000000000c1 RSI: ffffffff9e801040 RDI: 0000000000000016
RBP: ffffa02a000c7dd8 R08: 000002ea2320b76b R09: 7fffffffffffffff
R10: 000002ea3a1c0080 R11: 00000000002fefff R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000080
FS:  0000000000000000(0000) GS:ffff89323e840000(0000)
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2e5957c000 CR3: 0000000167a9a005 CR4: 0000000000770ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <IRQ>
 __irq_exit_rcu+0xb9/0xf0
 sysvec_apic_timer_interrupt+0x72/0x90
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x16/0x20
RIP: 0010:cpuidle_enter_state+0xd2/0x400
RSP: 0018:ffffa02a000c7e80 EFLAGS: 00000202
RAX: ffff89323e870bc0 RBX: 0000000000000001 RCX: 00000000ffffffff
RDX: 0000000000000016 RSI: ffffffff9e801040 RDI: 0000000000000000
RBP: ffff89323e87c700 R08: 000002ea22ebdf87 R09: 0000000000000018
R10: 000000000000010d R11: 000000000000020a R12: ffffffff9dab58e0
R13: 000002ea22ebdf87 R14: 0000000000000001 R15: 0000000000000000
 cpuidle_enter+0x29/0x40
 cpuidle_idle_call+0xfa/0x160
 do_idle+0x7b/0xe0
 cpu_startup_entry+0x19/0x20
 start_secondary+0x116/0x140
 secondary_startup_64_no_verify+0xe5/0xeb
 </TASK>

Signed-off-by: Liangyan <liangyan.peng@bytedance.com>
Reported-by: Yicong Shen <shenyicong.1023@bytedance.com>
---
 kernel/irq/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 2b274007e8ba..9f5c50e75e6b 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -764,6 +764,8 @@ EXPORT_SYMBOL_GPL(handle_fasteoi_nmi);
  */
 void handle_edge_irq(struct irq_desc *desc)
 {
+	bool need_unmask = false;
+
 	guard(raw_spinlock)(&desc->lock);
 
 	if (!irq_can_handle(desc)) {
@@ -791,12 +793,16 @@ void handle_edge_irq(struct irq_desc *desc)
 		if (unlikely(desc->istate & IRQS_PENDING)) {
 			if (!irqd_irq_disabled(&desc->irq_data) &&
 			    irqd_irq_masked(&desc->irq_data))
-				unmask_irq(desc);
+				need_unmask = true;
 		}
 
 		handle_irq_event(desc);
 
 	} while ((desc->istate & IRQS_PENDING) && !irqd_irq_disabled(&desc->irq_data));
+
+	if (need_unmask && !irqd_irq_disabled(&desc->irq_data) &&
+	    irqd_irq_masked(&desc->irq_data))
+		unmask_irq(desc);
 }
 EXPORT_SYMBOL(handle_edge_irq);
 
-- 
2.20.1

