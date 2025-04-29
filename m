Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09223275844
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909696; cv=none; b=JN6H8UbqtNbyzEz/UrD1zOnwpJ0aAZZGUorP8K2RvfGrzmCweS1KRh2+/QGl+J0YW6kzeCjATDBXEWwtdWkKZiAEpYpfYk/ifKZBnPNtAmFOzizqiQm6N0Ac37C4gny4SYOzlEonM7oBFOBohOE2ZmVwHohhPBrMZgGnWloXw1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909696; c=relaxed/simple;
	bh=R6Oe7khnWkwcjhwjQWXM9/cUpFiONrmk2BxBrz0nO2g=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Zvvy5irVKwVSASCILntGIPbN+BfiYTrs79EwCNTKY/y1MdV6RIfRK6zf+rBv+LM6CkY4MEUZ6oAL4L9MJ9u/dHvs8A26s6jR0NIEqKxzqsEHBR6ufpAHy940esl6MlEIiFxqVJ4l1ph106HQRK8LlyD+iaqHuGT2/ZsEXQgmJf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w47YubRX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RGDynBWn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w47YubRX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RGDynBWn"
Message-ID: <20250429065420.188866381@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8Lrnr7Wjtl13Tnh7B/iTi/GvYg4WRlxJArWA8pN4YdQ=;
	b=w47YubRXI9t84t5CuVRZWKRf35gec+rHKEZ5RF24DKc7+eCXdupuvx+Ebblfoxl9bHKx8h
	G50PCJXyX6s0ddun1PHVSFfAzLn5UWlfcusS1hD+xf1UumZYK8AjYSFJVvlzZCBBJfVoxM
	+MfM4OBYVDBMI2ituE7a+W87DpP9K+ix1yqXvN2W79HVuj4zUZetqDdpTO/MiIs/3ESOdJ
	dQhyPv8c4n6cJmCLmzsOv4TzyDsjc8bAPVbRvN5Ey2Fm2ZSd/EpWTTjPHUQJNDAdTvg1n4
	EGBotDcS2WlbuSucv7T6vc+7oiif6FTCzHfgIWihw0V1QBU6gT2Z1BNouQeIsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8Lrnr7Wjtl13Tnh7B/iTi/GvYg4WRlxJArWA8pN4YdQ=;
	b=RGDynBWn4nFT2TMA+6tvl5xqFV2LwPBPGaH+w8OOmtpVGV21L2hrlQaJoPhP7VXlSod9Zh
	zmfPPNQY2RgVWeAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 03/45] genirq/autoprobe: Switch to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:52 +0200 (CEST)

Convert all lock/unlock pairs to guards.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/autoprobe.c |   26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

--- a/kernel/irq/autoprobe.c
+++ b/kernel/irq/autoprobe.c
@@ -43,18 +43,16 @@ unsigned long probe_irq_on(void)
 	 * flush such a longstanding irq before considering it as spurious.
 	 */
 	for_each_irq_desc_reverse(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (!desc->action && irq_settings_can_probe(desc)) {
 			/*
 			 * Some chips need to know about probing in
 			 * progress:
 			 */
 			if (desc->irq_data.chip->irq_set_type)
-				desc->irq_data.chip->irq_set_type(&desc->irq_data,
-							 IRQ_TYPE_PROBE);
+				desc->irq_data.chip->irq_set_type(&desc->irq_data, IRQ_TYPE_PROBE);
 			irq_activate_and_startup(desc, IRQ_NORESEND);
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 
 	/* Wait for longstanding interrupts to trigger. */
@@ -66,13 +64,12 @@ unsigned long probe_irq_on(void)
 	 * happened in the previous stage, it may have masked itself)
 	 */
 	for_each_irq_desc_reverse(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (!desc->action && irq_settings_can_probe(desc)) {
 			desc->istate |= IRQS_AUTODETECT | IRQS_WAITING;
 			if (irq_activate_and_startup(desc, IRQ_NORESEND))
 				desc->istate |= IRQS_PENDING;
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 
 	/*
@@ -84,18 +81,16 @@ unsigned long probe_irq_on(void)
 	 * Now filter out any obviously spurious interrupts
 	 */
 	for_each_irq_desc(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
-
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (desc->istate & IRQS_AUTODETECT) {
 			/* It triggered already - consider it spurious. */
 			if (!(desc->istate & IRQS_WAITING)) {
 				desc->istate &= ~IRQS_AUTODETECT;
 				irq_shutdown_and_deactivate(desc);
-			} else
-				if (i < 32)
-					mask |= 1 << i;
+			} else if (i < 32) {
+				mask |= 1 << i;
+			}
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 
 	return mask;
@@ -121,7 +116,7 @@ unsigned int probe_irq_mask(unsigned lon
 	int i;
 
 	for_each_irq_desc(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (desc->istate & IRQS_AUTODETECT) {
 			if (i < 16 && !(desc->istate & IRQS_WAITING))
 				mask |= 1 << i;
@@ -129,7 +124,6 @@ unsigned int probe_irq_mask(unsigned lon
 			desc->istate &= ~IRQS_AUTODETECT;
 			irq_shutdown_and_deactivate(desc);
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 	mutex_unlock(&probing_active);
 
@@ -160,8 +154,7 @@ int probe_irq_off(unsigned long val)
 	struct irq_desc *desc;
 
 	for_each_irq_desc(i, desc) {
-		raw_spin_lock_irq(&desc->lock);
-
+		guard(raw_spinlock_irq)(&desc->lock);
 		if (desc->istate & IRQS_AUTODETECT) {
 			if (!(desc->istate & IRQS_WAITING)) {
 				if (!nr_of_irqs)
@@ -171,7 +164,6 @@ int probe_irq_off(unsigned long val)
 			desc->istate &= ~IRQS_AUTODETECT;
 			irq_shutdown_and_deactivate(desc);
 		}
-		raw_spin_unlock_irq(&desc->lock);
 	}
 	mutex_unlock(&probing_active);
 



