Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211291DF24A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499388; cv=none; b=jyUyVGEqVwIEb9S1yKQ5XM+oIp4mn07opbnYdswCgFDIQ8BU8Oh76X4L02gtTDO2P++EGGS5UwEJjfe8Rv9Xte6cVM6S13uOVeEkyTOUBvXMuG+3SPDo0hYOpghVfw23LJKMLlUa5gP5ANfFa15l8RTruVJpuRgnMiGpkxleKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499388; c=relaxed/simple;
	bh=lLp1G3vvH2lkW8aBOpotaD1tve6BpjnMM2Zj1jzUZME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7S7H2a6clJji79DcrjztEHD+ILvJEHKBw8y59a3LbxCYH7lj2XcXAaY32UduxUVO2WE8nIwMqSwfnGu8COE/8EubZEnUTAwnLuyNrx/6cwlDVq6wKfWGwTafdpFYGKLYSWEdBlokwqJwoC2FPGHEcrmXCO9suKsK9xCCAlDg8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJLDwTJ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJLDwTJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01C7C4CEE4;
	Tue,  1 Apr 2025 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499387;
	bh=lLp1G3vvH2lkW8aBOpotaD1tve6BpjnMM2Zj1jzUZME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJLDwTJ0ExcsjRVMAmvREaEMgmKmFa7+iXUR6dhmVvZHexJup9lFqZuGZ7+iecDR4
	 4TqnrtLOWX8TwFSkdUlmaOIRCEqT1JtkIvaeoKLSRj+hcilHruB2BcInjQp+prS3vx
	 LT/e0/trIj9OzMSt+bAyIrri18ezvoipN4gpzBNRZv254lR1vylCyAD7tR52r0faaS
	 sbxOCb2QR//eKKCdvmYooj5pLojBM+oXbH6eoVD/C61PIXT7CkqhqrNdEncQS5abGM
	 dyr/7Hz3dv3wUTeLa6SRjGbBzK9xdH8qmpacXGtNSOBTfbe6f/Tt4csQ8/kRwE5JpS
	 MhWIvaSK26iXg==
Date: Tue, 1 Apr 2025 11:23:03 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Fernando Fernandez Mancera <ffmancera@riseup.net>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
	dwmw@amazon.co.uk, mhkelley@outlook.com
Subject: [PATCH -v4] x86/i8253: Call clockevent_i8253_disable() with
 interrupts disabled
Message-ID: <Z-uwd4Bnn7FcCShX@gmail.com>
References: <20250327234357.3383-1-ffmancera@riseup.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327234357.3383-1-ffmancera@riseup.net>


I've cleaned up and simplified the changelog, see the patch below.

Thomas, does this look good to you too?

Thanks,

	Ingo

=========================>
From: Fernando Fernandez Mancera <ffmancera@riseup.net>
Date: Fri, 28 Mar 2025 00:43:57 +0100
Subject: [PATCH] x86/i8253: Call clockevent_i8253_disable() with interrupts disabled

There's a lockdep false positive warning related to i8253_lock:

  WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
  ...
  systemd-sleep/3324 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
  ffffffffb2c23398 (i8253_lock){+.+.}-{2:2}, at: pcspkr_event+0x3f/0xe0 [pcspkr]

  ...
  ... which became HARDIRQ-irq-unsafe at:
  ...
    lock_acquire+0xd0/0x2f0
    _raw_spin_lock+0x30/0x40
    clockevent_i8253_disable+0x1c/0x60
    pit_timer_init+0x25/0x50
    hpet_time_init+0x46/0x50
    x86_late_time_init+0x1b/0x40
    start_kernel+0x962/0xa00
    x86_64_start_reservations+0x24/0x30
    x86_64_start_kernel+0xed/0xf0
    common_startup_64+0x13e/0x141
  ...

Lockdep complains due pit_timer_init() using the lock in an IRQ-unsafe
fashion, but it's a false positive, because there is no deadlock
possible at that point due to init ordering: at the point where
pit_timer_init() is called there is no other possible usage of
i8253_lock because the system is still in the very early boot stage
with no interrupts.

But in any case, pit_timer_init() should disable interrupts before
calling clockevent_i8253_disable() out of general principle, and to
keep lockdep working even in this scenario.

Use scoped_guard() for that, as suggested by Thomas Gleixner.

[ mingo: Cleaned up the changelog. ]

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Fernando Fernandez Mancera <ffmancera@riseup.net>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/r/20250327234357.3383-1-ffmancera@riseup.net
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
