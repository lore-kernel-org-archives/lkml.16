Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A01EEA4E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773482; cv=none; b=YXU3k+YoGK5Om3HtX6C3zLoa27Vb+H0lod6+iBmaqanhmuJX7wiA4ZIGScCIcTgHG2TJ9F6vCzZIBhCipBH2lwES/tmttHAbZQFlZmphWks1lDQblMENBhJjBsEQuIgCdNMb9Fe1QSgmERzyhdPEUDBXq9XfYduj9TlWHZPVhzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773482; c=relaxed/simple;
	bh=/wxzFAJWhXTRWiA4rv+u8jEVP0QqGm6mc+Wy5Om3SmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfX8DOGV8zZ8grVbNbItguM/xL8xz/L11FwjKAgjZvgZZWS9uwEyuammSkk3N/s/pcd5mx50Hq1367sY58qVtbCOHNr9xRPGb5lrDmU+cCkQbtE9ajoOfDhwKjinXla4eTMhOf3XziSsmNP9H81Tp1sYf6EXXA47WRMnRDcCb4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TRKnKpoG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FUS7Zx/u; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TRKnKpoG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FUS7Zx/u"
Date: Fri, 4 Apr 2025 15:31:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743773477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=V55n4+BdXPiTHEXRvGt5+QG54LfxTfkJtbWgjaVxqUo=;
	b=TRKnKpoGXvTVj/pD53j4jZegyqPxNxn148nXsQKUGT06EM3NEERkg5U961Fma+ulYQqvLL
	H8M8P7dOwSEzulyLPa/KXtdPlaupVDTcihUEylrSlx8WbUjPZifaqJ2AMlmsl99l/F8TKH
	n7w42eSIzO8vPyuGLxkCyBKXvIRKBzxV1FIaje1OdIEyqR5/cxJ54AjbXZRNjlWVvgLiaI
	6MHDbeLnkuWC8zHxXrcZBXBZoYLpGJEjBz4aB7KArTWAuNAJTFb5QESDtmTx8SlU6bNiT7
	xIRbDDuKFjN6QFbV+o63fxJJAuv7NttmuHlvm4VvXIsHWhzu2RohPvSQUZYxRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743773477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=V55n4+BdXPiTHEXRvGt5+QG54LfxTfkJtbWgjaVxqUo=;
	b=FUS7Zx/uir7S9XM6X61xQhqmTy1fVqNDrqxaKl5CrfE25Y3PvXxySSQo95NIEMiXINGlqW
	v71NIvWBo9EUAdDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] clocksource/i8253: Acquire the lock disabled interrupts.
Message-ID: <20250404133116.p-XRWJXf@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On x86 during boot, clockevent_i8253_disable() can be invoked via
x86_late_time_init -> hpet_time_init() -> pit_timer_init() which happens
with enabled interrupts.
If some of the old i8253 hardware is actually used then lockdep will
notice that i8253_lock is used in hardirq context. This causes lockdep
to complain because it observed the lock being acquired with enabled
interrupts and in hardirq context.

Make clockevent_i8253_disable() acquire the lock with disabled
interrupts.

Fixes: c8c4076723dac ("x86/timer: Skip PIT initialization on modern chipsets")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/clocksource/i8253.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/i8253.c b/drivers/clocksource/i8253.c
index 39f7c2d736d16..67dcd9c8f1875 100644
--- a/drivers/clocksource/i8253.c
+++ b/drivers/clocksource/i8253.c
@@ -103,8 +103,9 @@ int __init clocksource_i8253_init(void)
 #ifdef CONFIG_CLKEVT_I8253
 void clockevent_i8253_disable(void)
 {
-	raw_spin_lock(&i8253_lock);
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&i8253_lock, flags);
 	/*
 	 * Writing the MODE register should stop the counter, according to
 	 * the datasheet. This appears to work on real hardware (well, on
@@ -133,7 +134,7 @@ void clockevent_i8253_disable(void)
 
 	outb_p(0x30, PIT_MODE);
 
-	raw_spin_unlock(&i8253_lock);
+	raw_spin_unlock_irqrestore(&i8253_lock, flags);
 }
 
 static int pit_shutdown(struct clock_event_device *evt)
-- 
2.49.0

