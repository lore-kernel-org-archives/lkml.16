Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2BD3FB0E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747096605; cv=none; b=XwpaDvDCaELiuR5iEkAL/lH7RebWZZM9vOph7Eis7kjM4Itsy9eKl9/LKURjigRIuC0zGOMaJ5E9657RHyXTPuh5jhV6qvOb85Xwx49pbuJCWs+AqEf20oP3Eph2x0q+EkAUDsjaLvwqX+qAAUQ0BiW2yXnMinHxv7f/++JqYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747096605; c=relaxed/simple;
	bh=yb8jSVRsF30mHGOhOVdM3imAWsNOsAUSfNyxlcnfirk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsqnVcaFDUk9fW5rPYNpctX5MhJIxsizdI06zbzMtvryjSl9Rz1MqNGlhZ0VP6sKTgrLHgntniv26H8MPnWa5M7L3ri9TS6ZPLHwur3LC2QcIpN7jy21jig0KpO7vCJACG7WK7kpcRtmC0NlFnH423DvjS6rA+C+d29WvlEirBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hfDkTmhz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hfDkTmhz"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74019695377so3711158b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747096602; x=1747701402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HA199g5QXmHqVIsbfWXsAzYBHgqNJazclMs1z1NJXJM=;
        b=hfDkTmhzeA9rIAWsn0azZww56h74mks+koiDvV09oG+FlK/3aUQ0QrSHmg/g0DtFX9
         ItWUhym2n/HSAOOYkT6PA2NnccFsOU3NuyqGsv9K69f//x2irwUn2I4MxwmCqGMmdehj
         4XncuyU7L/hrRo5opYHJOFe7AS3Yw2jhe1uDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747096602; x=1747701402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HA199g5QXmHqVIsbfWXsAzYBHgqNJazclMs1z1NJXJM=;
        b=G/sg6D5dyS2MjWTiTgK5L5uwlLeQhtd9gmrtCV6FlCRbW7bB8Uq6+P7pyZSrXvKEFX
         F/Z7BcVTEb3AbK6jdwk+nRkRr3DK9DdSy9lOSkOqxtlgkdfYbaynP70tXB1Te4Yic2LH
         dcX7dY7GlmZTlpC65mtBckETcljYmg+BrnXzR7jcjYJHwvfWwMQyZ1g24Q/NfiReAuVL
         kPrKOgier7KIPObLuSJNOkX/e4WRnutl0Zuz2W/i/rHzZ0hxPB49JX8EVwH8yZMfwGyf
         /b1Hac4iyjIDNtQOo058uS9CDvyDbTmzK7UjXbdUlKyvUj1kCcoATssSZWIpZRSQXGLN
         PXhA==
X-Forwarded-Encrypted: i=1; AJvYcCWH0D9Yvk8FLQSA4prFC8d9YMMoLg/wnzndPCRCi8nTIGNdhLoslC8W/KR49uVZvRwi1oS2XU4iIsqo27Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FHe8cuvKqC5+nF1GD86nJDEVPeJZLQH08cDOoIxUcT69XxrU
	UTpGDfS7FRbT2fXug0/p+kfJ7O+PcTehG6yu5q2nM5cH+tMmhKwRClyDEh2tgw==
X-Gm-Gg: ASbGncs+fpC+oWDHm4aNh8M1dLY+tvY4yXH68c369MtqfsaKsIYdpbzOyZaAF0HIJIH
	lXgqhwPY/LFEF5tHyWwczo8fzL30IJgQXw6cEsGvHLaTadB+y4aOtoMpGch/x8VhJb99s79AekD
	fFDb/9BW00u87o1MmXN+hsPkiYaUKJCathX3NlXs1yWFjFrtTMIsigssfCgTMnhORyDYEJtRELi
	Vxzub9utEmeRrr7vJp9AtNtOnB4gSCVkHeNn50VMg9RcAnp4u6Kb4U3dW0lf5o1VH3hbKNHnlYz
	4GRabjDo8ZankkMWlWUp+WAt9dfF//n0K52KjbP5LGbSHN11ID+MbCHxR8bx7A/zuIsB44efw8O
	So3Ny9EZ9KmnXSIxDWLWUm59Z62eVuOpM+II=
X-Google-Smtp-Source: AGHT+IGTlWjnHg+bWaHK446oE4g5aGMBwlecdmK/2JewCCDAhph9OjKEstpKEUumR8JMf8iUdJ2OJA==
X-Received: by 2002:a05:6a20:7288:b0:215:edf7:c8f2 with SMTP id adf61e73a8af0-215edf7cae1mr835745637.16.1747096602544;
        Mon, 12 May 2025 17:36:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e14:7:ed5d:332e:f26c:a223])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2350ddb7f8sm5197691a12.50.2025.05.12.17.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 17:36:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: chintanpandya@google.com,
	Douglas Anderson <dianders@chromium.org>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if depth > 1
Date: Mon, 12 May 2025 17:32:52 -0700
Message-ID: <20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag doesn't work properly if the
IRQ disable depth is not 0 or 1 at suspend time. In this case, the
IRQ's depth will be decremented but the IRQ won't be enabled to wake
the system up. Add a special case for when we're suspending and always
enable the IRQ in that case.

A few notes:
* As part of this, irq_startup() can no longer force the depth to 0.
  Change irq_startup() to decrement by 1 and make all other callers of
  irq_startup() initialize the depth to 1 to keep them working the
  same.
* In order to avoid turning __enable_irq() into spaghetti code for the
  special case, swap from a "switch" statement to a handful of
  "if/else". Nicely, this eliminates an old "goto".

Fixes: 90428a8eb494 ("genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I fully realize there are rough edges to this patch. Specifically,
it's a bit ugly to init the depth to 1 in all the callers. Things
could also get dicey of any code tries to enable/disable the IRQ
_after_ we've set the "IRQD_IRQ_ENABLED_ON_SUSPEND", though I hope
that doesn't happen.

If you hate this patch, feel free to simply treat it as a bug report.
I'm happy if someone wants to write an alternative patch or I can make
whatever cleanups are needed and send a v2/v3/etc. Let me know!

This patch has only been lightly tested.

 kernel/irq/chip.c       |  3 ++-
 kernel/irq/cpuhotplug.c |  4 +++-
 kernel/irq/manage.c     | 29 ++++++++++++++++-------------
 kernel/irq/pm.c         |  2 +-
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 36cf1b09cc84..24a5958c09e4 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -272,7 +272,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
 	const struct cpumask *aff = irq_data_get_affinity_mask(d);
 	int ret = 0;
 
-	desc->depth = 0;
+	desc->depth--;
 
 	if (irqd_is_started(d)) {
 		irq_enable(desc);
@@ -313,6 +313,7 @@ int irq_activate_and_startup(struct irq_desc *desc, bool resend)
 {
 	if (WARN_ON(irq_activate(desc)))
 		return 0;
+	desc->depth = 1;
 	return irq_startup(desc, resend, IRQ_START_FORCE);
 }
 
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 15a7654eff68..8d98a2961e91 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -218,8 +218,10 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 	if (desc->istate & IRQS_SUSPENDED)
 		return;
 
-	if (irqd_is_managed_and_shutdown(data))
+	if (irqd_is_managed_and_shutdown(data)) {
+		desc->depth = 1;
 		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+	}
 
 	/*
 	 * If the interrupt can only be directed to a single target
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 753eef8e041c..a8c9b645fe49 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -688,7 +688,14 @@ EXPORT_SYMBOL_GPL(irq_set_vcpu_affinity);
 
 void __disable_irq(struct irq_desc *desc)
 {
-	if (!desc->depth++)
+	struct irq_data *irqd = &desc->irq_data;
+
+	/*
+	 * Always increase the disable depth; actually do the disable if
+	 * the depth was 0 _or_ we temporarily enabled during the suspend
+	 * path.
+	 */
+	if (!desc->depth++ || irqd_is_enabled_on_suspend(irqd))
 		irq_disable(desc);
 }
 
@@ -786,15 +793,12 @@ void disable_nmi_nosync(unsigned int irq)
 
 void __enable_irq(struct irq_desc *desc)
 {
-	switch (desc->depth) {
-	case 0:
- err_out:
+	struct irq_data *irqd = &desc->irq_data;
+
+	if (desc->depth == 0 || desc->istate & IRQS_SUSPENDED) {
 		WARN(1, KERN_WARNING "Unbalanced enable for IRQ %d\n",
 		     irq_desc_get_irq(desc));
-		break;
-	case 1: {
-		if (desc->istate & IRQS_SUSPENDED)
-			goto err_out;
+	} else if (desc->depth == 1 || irqd_is_enabled_on_suspend(irqd)) {
 		/* Prevent probing on this irq: */
 		irq_settings_set_noprobe(desc);
 		/*
@@ -809,9 +813,7 @@ void __enable_irq(struct irq_desc *desc)
 		 * invoke irq_enable() under the hood.
 		 */
 		irq_startup(desc, IRQ_RESEND, IRQ_START_FORCE);
-		break;
-	}
-	default:
+	} else {
 		desc->depth--;
 	}
 }
@@ -1774,6 +1776,9 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
 		}
 
+		/* Undo nested disables: */
+		desc->depth = 1;
+
 		if (!(new->flags & IRQF_NO_AUTOEN) &&
 		    irq_settings_can_autoenable(desc)) {
 			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
@@ -1785,8 +1790,6 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 			 * interrupts forever.
 			 */
 			WARN_ON_ONCE(new->flags & IRQF_SHARED);
-			/* Undo nested disables: */
-			desc->depth = 1;
 		}
 
 	} else if (new->flags & IRQF_TRIGGER_MASK) {
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index c556bc49d213..b151a94f6233 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -86,8 +86,8 @@ static bool suspend_device_irq(struct irq_desc *desc)
 			 * Enable interrupt here to unmask/enable in irqchip
 			 * to be able to resume with such interrupts.
 			 */
-			__enable_irq(desc);
 			irqd_set(irqd, IRQD_IRQ_ENABLED_ON_SUSPEND);
+			__enable_irq(desc);
 		}
 		/*
 		 * We return true here to force the caller to issue
-- 
2.49.0.1045.g170613ef41-goog

