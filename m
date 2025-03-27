Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4C01AA1E0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743119050; cv=none; b=F4n+5P8rG5kIGbYJq1kQjzm5EC4epmCA7BA3G8nBMhYamWVxq23F2JtrY1LPdQqHV3YT7hBad1DeWGChQJ5z9C8mDBt65HCsHtmEyLm2IwcJgGXh5vJ//Jy1fnVSvPvnAN9cbJ1PWlwhNUGKKZjwaHZ9CifBvB/+okWqBI74BZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743119050; c=relaxed/simple;
	bh=alf3U4GcHSVeqmFlbDvuq5reIBuvm9agxUeKx/4y55g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3NaYp8E7qf0lyCfQ+Uy+k/nw8iZL44KaSW1/Mf9RIZrXfZPo1U3eJ3jTIQngu9gRY6UiA6BpUDJ0hxOq5PfEv34fEgI9bcIF7t61F7l/mNbJ4WvHqJwKcHfFtmYY8NcSRYAfRC6QFngY1tg6iFoiHBJM4YlRXA1APibiIkYUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=VlufetNz; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="VlufetNz"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4ZP0c740lGzDqVm;
	Thu, 27 Mar 2025 23:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1743119047; bh=alf3U4GcHSVeqmFlbDvuq5reIBuvm9agxUeKx/4y55g=;
	h=From:To:Cc:Subject:Date:From;
	b=VlufetNzwXU8NRcUODo7oGdFcHs8Cw+lmJ6fnJXrXemx7ckgsXDJm2/o35jEoxOOL
	 5VTc0efTvMQfBHjp0jc/xBpKSBgBpazFi7eIw4vCLQj+9LNmWgZ68xIfstaSYH+8J7
	 OoA3qeAJzbdEXyO2rPK8rPxSCfDs6KTFhEzn/jyc=
X-Riseup-User-ID: AA98FD0A338178116BF02F5E8D8EB66630877B08DD781AD6E5F015046AD33AE9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4ZP0c54WQZzFwfR;
	Thu, 27 Mar 2025 23:44:05 +0000 (UTC)
From: Fernando Fernandez Mancera <ffmancera@riseup.net>
To: x86@kernel.org,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk,
	mhkelley@outlook.com,
	mingo@kernel.org,
	Fernando Fernandez Mancera <ffmancera@riseup.net>
Subject: [PATCH v3] x86/i8253: Invoke clockevent_i8253_disable() with interrupts disabled
Date: Fri, 28 Mar 2025 00:43:57 +0100
Message-ID: <20250327234357.3383-1-ffmancera@riseup.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep complains correctly due to the context, but in reality there is
no possible deadlock. At the point where pit_timer_init() is called
there is no other possible usage of i8253_lock because the system is
still in the very early boot stage.

pit_timer_init() should disable interrupts before calling
clockevent_i8253_disable() and do not inflict the
raw_spin_lock_irqsave() on the callback function. This prevents lockdep
from detecting a false positive and future proves the code.

[   45.408952] =====================================================
[   45.408970] WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
[   45.408974] 6.14.0-rc7+ #6 Not tainted
[   45.408978] -----------------------------------------------------
[   45.408980] systemd-sleep/3324 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
[   45.408986] ffffffffb2c23398 (i8253_lock){+.+.}-{2:2}, at: pcspkr_event+0x3f/0xe0 [pcspkr]
[   45.409004]
               and this task is already holding:
[   45.409006] ffff9c334d7c2230 (&dev->event_lock){-.-.}-{3:3}, at: input_dev_resume+0x21/0x50
[   45.409023] which would create a new lock dependency:
[   45.409025]  (&dev->event_lock){-.-.}-{3:3} -> (i8253_lock){+.+.}-{2:2}
[   45.409043]
               but this new dependency connects a HARDIRQ-irq-safe lock:
[   45.409045]  (&dev->event_lock){-.-.}-{3:3}
[   45.409052]
               ... which became HARDIRQ-irq-safe at:
[   45.409055]   lock_acquire+0xd0/0x2f0
[   45.409062]   _raw_spin_lock_irqsave+0x48/0x70
[   45.409067]   input_event+0x3c/0x80
[   45.409071]   atkbd_receive_byte+0x9b/0x6e0
[   45.409077]   ps2_interrupt+0xb2/0x1d0
[   45.409082]   serio_interrupt+0x4a/0x90
[   45.409087]   i8042_handle_data+0xf8/0x280
[   45.409091]   i8042_interrupt+0x11/0x40
[   45.409095]   __handle_irq_event_percpu+0x87/0x260
[   45.409100]   handle_irq_event+0x38/0x90
[   45.409105]   handle_edge_irq+0x8b/0x230
[   45.409109]   __common_interrupt+0x5c/0x120
[   45.409114]   common_interrupt+0x80/0xa0
[   45.409120]   asm_common_interrupt+0x26/0x40
[   45.409125]   pv_native_safe_halt+0xf/0x20
[   45.409130]   default_idle+0x9/0x20
[   45.409135]   default_idle_call+0x7a/0x1d0
[   45.409140]   do_idle+0x215/0x260
[   45.409144]   cpu_startup_entry+0x29/0x30
[   45.409149]   start_secondary+0x132/0x170
[   45.409153]   common_startup_64+0x13e/0x141
[   45.409158]
               to a HARDIRQ-irq-unsafe lock:
[   45.409161]  (i8253_lock){+.+.}-{2:2}
[   45.409167]
               ... which became HARDIRQ-irq-unsafe at:
[   45.409170] ...
[   45.409172]   lock_acquire+0xd0/0x2f0
[   45.409177]   _raw_spin_lock+0x30/0x40
[   45.409181]   clockevent_i8253_disable+0x1c/0x60
[   45.409186]   pit_timer_init+0x25/0x50
[   45.409191]   hpet_time_init+0x46/0x50
[   45.409196]   x86_late_time_init+0x1b/0x40
[   45.409201]   start_kernel+0x962/0xa00
[   45.409206]   x86_64_start_reservations+0x24/0x30
[   45.409211]   x86_64_start_kernel+0xed/0xf0
[   45.409215]   common_startup_64+0x13e/0x141
[   45.409220]
               other info that might help us debug this:

[   45.409222]  Possible interrupt unsafe locking scenario:

[   45.409224]        CPU0                    CPU1
[   45.409226]        ----                    ----
[   45.409228]   lock(i8253_lock);
[   45.409234]                                local_irq_disable();
[   45.409237]                                lock(&dev->event_lock);
[   45.409243]                                lock(i8253_lock);
[   45.409249]   <Interrupt>
[   45.409251]     lock(&dev->event_lock);
[   45.409257]
                *** DEADLOCK ***

Signed-off-by: Fernando Fernandez Mancera <ffmancera@riseup.net>
---
v1: initial patch
v2: use local_irq_save()/restore() around clockevent_i8253_disable()
v3: improve wording of commit message, dropped "Fixes" tag and used
scoped_guard(irq) instead.
---
 arch/x86/kernel/i8253.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/i8253.c b/arch/x86/kernel/i8253.c
index 80e262bb627f..cb9852ad6098 100644
--- a/arch/x86/kernel/i8253.c
+++ b/arch/x86/kernel/i8253.c
@@ -46,7 +46,8 @@ bool __init pit_timer_init(void)
 		 * VMMs otherwise steal CPU time just to pointlessly waggle
 		 * the (masked) IRQ.
 		 */
-		clockevent_i8253_disable();
+		scoped_guard(irq)
+			clockevent_i8253_disable();
 		return false;
 	}
 	clockevent_i8253_init(true);
-- 
2.49.0

