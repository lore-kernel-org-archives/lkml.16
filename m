Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1412DF3CA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168409; cv=none; b=sUHY0u/HIpdNmGn2dXxclglhce5vrbxum7t9KyFg3S+XlG72P/8CpCPdXpiGLykuzAdYrrDtyJuaNEZKIsKqZ6tRn5D09MDO+7B4JnRLAzd3SwffjjtqgVVNb+sB+az3KoF7JewHUtHQVGL7vH/B4BLb4ZU3TMrnwVPEyVZ40Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168409; c=relaxed/simple;
	bh=NZKg4wa8vVf4B62e57Cic7zPSKwig91Ih3EmxJQLJBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nL+hs7GHYlllnGtn7yu3lfz+msLTCCtTOwYQDRnb7sx/WuKGXTA4kCxm7ehmVsxLPNZbg/9N4dRXx8XUhlRgTTwR1ESUAfbippMbxGtvI4DqqSKND5miRdSV2O/v0X8ppOfOYIGnuRQEs7M0oZZr/TfQ58dAG/a6sSDkYk6u1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y/Op96qo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nptp+fnK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y/Op96qo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nptp+fnK"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750168405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p2KqeKdW8sHhhAuKR11sOYDRX7INggsdzTxSiKJAp4M=;
	b=Y/Op96qo4L8mSSNDtUcrmyw9IgJJt9/kUr82j104rxQ1pj1zDkXRbmISbiOssBfwBCuP5B
	dLK34sF/Dpla8W0FjYQV8blY24vGqGLDyEK3JirD+HTyfYputYXKI+CVra01qXY8V3kubG
	vAUkAICHyhBEtWWT7a0oWI0v0hDmi6iFnw9J+fv8i3y/fPZlr6gYmx76SAJrCwyWbjEuWA
	v1vNzPZfEg86DTvKkv5JHkoVeb/7/99aIjqVh3y1uREwFteNXe0IStC5MAGgqxJaRbmJmx
	//cxkGK856Z3f+XbBoVhuBakiSi50EWINyTv7QKiAP/BuOJK5EoBoP5bbNafew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750168405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p2KqeKdW8sHhhAuKR11sOYDRX7INggsdzTxSiKJAp4M=;
	b=nptp+fnKV7IzXmT8I5LxyAkorgyjHrQ0ozB3DE65mPtC50FeApxzyT/dCVv0zZqQvn+Vwq
	q17yc5BAmRUjflBg==
Date: Tue, 17 Jun 2025 15:52:55 +0200
Subject: [PATCH RFC] um: time: fix userspace detection during tick
 accounting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250617-uml-tick-timer-v1-1-01aab312f56b@linutronix.de>
X-B4-Tracking: v=1; b=H4sIADZzUWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Nz3dLcHN2SzORsIJGbWqRrYZSaaGFpYmmanGymBNRUUJSallkBNjB
 aKcjNWSm2thYABqP4x2UAAAA=
X-Change-ID: 20250617-uml-tick-timer-82ea89495cc6
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Meyer <thomas@m3y3r.de>, Anton Ivanov <aivanov@brocade.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750168402; l=2406;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NZKg4wa8vVf4B62e57Cic7zPSKwig91Ih3EmxJQLJBc=;
 b=fgLn2APrjZIegFKZhsjPGBR/Ns+aqzryNNZOjmlLlkX2tzCKF6NJkw62zHLmGYAJfU/Rw7Xeh
 1JDtQSn4TIzDPZUbXSpGDAiVNf5JQYHsrAebCOWJjnt7EKmCdtI7mDZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The cpu usage timekeeping triggered by the tick credits passed time to
either the kernel or the currently running userspace process.
On UML, tick interrupts firing while userspace is running are not marked
correctly so this bookkeeping is broken and always credits the idle task.

The rootcause is the following callchain always passing user_tick=false
to account_process_tick():

um_timer()
  -> handle_irq_event()
    -> tick_handle_periodic()
      -> tick_periodic()
        -> update_process_times(user_tick=user_mode(get_irq_regs()))
          -> account_process_tick(task, user_tick=false)

As a result CPUCLOCK_VIRT does not advance,
breaking for example signal(SIGVTALRM).

The issue can be reproduced easily with the selftest
tools/testing/selftests/timers/posix_timers.c,
which hangs in the ITIMER_VIRTUAL/SIGVTALRM testcase.

Fix up the IRQ regs by correctly setting is_user in the IRQ registers.

Fixes: 2eb5f31bc4ea ("um: Switch clocksource to hrtimers")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
I'm not familiar with UML, so this is probably not the right fix.
Feel free to treat it as a bugreport instead.
---
 arch/um/kernel/time.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/um/kernel/time.c b/arch/um/kernel/time.c
index ae0fa2173778f43273fd0550f77fc99bbb1c3e3a..a6c17302403aeb3170a1104117c4e713e3afdfe0 100644
--- a/arch/um/kernel/time.c
+++ b/arch/um/kernel/time.c
@@ -856,6 +856,7 @@ static struct clock_event_device timer_clockevent = {
 
 static irqreturn_t um_timer(int irq, void *dev)
 {
+	struct pt_regs *regs;
 	/*
 	 * Interrupt the (possibly) running userspace process, technically this
 	 * should only happen if userspace is currently executing.
@@ -864,9 +865,13 @@ static irqreturn_t um_timer(int irq, void *dev)
 	 */
 	if (time_travel_mode != TT_MODE_INFCPU &&
 	    time_travel_mode != TT_MODE_EXTERNAL &&
-	    get_current()->mm)
+	    get_current()->mm) {
 		os_alarm_process(get_current()->mm->context.id.pid);
 
+		regs = get_irq_regs();
+		regs->regs.is_user = true;
+	}
+
 	(*timer_clockevent.event_handler)(&timer_clockevent);
 
 	return IRQ_HANDLED;

---
base-commit: 9afe652958c3ee88f24df1e4a97f298afce89407
change-id: 20250617-uml-tick-timer-82ea89495cc6

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

