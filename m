Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D111EBFFF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731303; cv=none; b=RWq91AbyrdOdUvR0bFsBwrJMvWdXL374EurqpxZRcYmE9S5E9Rs5VbIfzX248FIon0z4IL0razSea4+3x2wN19RpEfe7k0F/lc2PhPmGoHufhuMWjp61luE6btURH9PbqHehdqL15yq8yOeTtdq8pDqQ1yWy4z67/kpsk+Vx5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731303; c=relaxed/simple;
	bh=wLPx1HDQVtlNugq29o/geD+3v4xkIGWSgVS3BcOpj2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmmAOTBVGDVT++wdD7rNY4H2537KVbZMzW8SF621THlZumIniXMAjmyIzw8LWzKPm5HghdE3o9oAWdASuA3JfYQnl0ixsL4msIhgFITo18SnujjStZnxxNsbAyfBhmhL1YEnxZ+8FlfIgzHX1wiEKnhWyfqpXkqS8NvlFrsTTIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2QngloH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2QngloH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453749aef9eso5764145e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731300; x=1752336100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM5dvjMBBgACYhsoEyNV7zeYF3BEVZfZu3iChdk/r1A=;
        b=t2QngloHcIkgDWh0JKrLF0o7Vh8riP8aNFFeR77B3Q2SsmgvW/sjXSCrW4lyNEcyGX
         k6Upw5ndk1FlT6c8LSRO0sNgTwJjtyXtQs4n/xOYOn7GLDtyxUB8c3mzMr82pqxT0NOi
         sQ6H85VxeYH32qI2xYeBSQXxpmu9Qc80R5897lF2A0uOJWt547BbgZXZ9uJAIAZBepxi
         dcZ+wmjL0wqAps5EKycqO1Hc+0A3tsIjKFTbF8ZDU7w2i+7V8FgtwzeMdRRpzCejwe3r
         bVpMeg1+IHo+XdJQtsH90ib0qXUjDna9pKSQTI/n8tKkr9Mw9uzFgr4xJTnCo8kWgydK
         Hrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731300; x=1752336100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5dvjMBBgACYhsoEyNV7zeYF3BEVZfZu3iChdk/r1A=;
        b=oXTtyV2MQOQO+860pOt/lp5z+3po2wyzwXMyGobmNuvIZRk7mq70CgAqG+gjVGMwfG
         61Dmw0lfkJwGFCt4sf9CvE1gKCwVnNi6UuWRZsVt1TyTzqoHS++fslcSDXgip0KH1yIt
         JVegAuOcmQd3OLEPArZf205WZ2vv6vpvMf8TtuYHZxtV/UW35DYCeFB8ZK61TVNGsj/z
         n3ht7RBsciynsmR2I4uZ+Is0zXq35bShNdfTOsT33xY8dmR9SOTAe8XEUgALSXIB6TP+
         fQEaA5LcLw2ybHdme/CXnUKsBh6RjWg7P+BrK29oQD+FbaX4fZ9VMkExyCX1WBomEyvx
         viBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUweWqAfKMhk0rS0YJU1ybBbJ4D0nbz4RNmFRNM3MtZbzY3yu/emik1y9GeIDOmuciKeVjgJ3wgcqG8MRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxULU3RZPW5WXLaaw2owPFIByF1L9LYRpC0UDxQf+n6VUZ46mfQ
	8aKgUwcMpeA5gH/CMj806U9K6sp/qyMdmCk9uaAoD/9AsSXwBQrMzpC2r2q3N9OemO0=
X-Gm-Gg: ASbGnctAhx81KIHvKMad2NaZS0lLj3UPPH7Nuqrl+od+ZdJdZ9AnxAUabqPdo8KdRBa
	DOMu2xxd/yIVGbXcnclC2W7rmWGt1xSa7frzlEOYByfZ6zZU8lRVhK1ZUbVWFwPzYZHjqKgjpq8
	LPeejAAFnImYS4Mh5SdiTyp8h5McG4v3vhxSo6Hlnbp+NgK6h7CFUNLHD9n9292TTZt7Opwum/7
	i0ZwooawtzSufhTOo2daQwvQ6CESzb5Nen3uwzdEJ52mKdhZjmbin5W84KQRItXkYw5oF1cIGke
	SiyKsKW+Zn2ZuiW1yYr8K+y1jNHbCW14DJxnG4oZ4AV4baarb58jQLLIEBJVF2ar8KWAMjcHKGK
	T/zpqW/65y+E6
X-Google-Smtp-Source: AGHT+IElcZy7uoaV2kCrNGyL/luNly+nL7+wNhRbtV7YtvumISAxwtj95SgPbXaQTxr/CDKNhHGXbw==
X-Received: by 2002:a05:600c:a47:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-454bb816e9bmr21903155e9.12.1751731299164;
        Sat, 05 Jul 2025 09:01:39 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:38 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/20] clocksource/drivers/vf_pit: Set the scene for multiple timers
Date: Sat,  5 Jul 2025 18:01:09 +0200
Message-ID: <20250705160129.3688026-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is implemented as using a single timer and a single
clocksource. In order to take advantage of the multiple timers
supported in the PIT hardware and introduce different setup for a new
platform, let's encapsulate the data into a structure and pass this
structure around in the function parameter. The structure will be a
per timer instanciation in the next changes.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 119 +++++++++++++++++------------
 1 file changed, 70 insertions(+), 49 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 8041a8f62d1f..581b46e7b111 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -15,7 +15,7 @@
  */
 #define PITMCR		0x00
 #define PIT0_OFFSET	0x100
-#define PITn_OFFSET(n)	(PIT0_OFFSET + 0x10 * (n))
+#define PIT_CH(n)       (PIT0_OFFSET + 0x10 * (n))
 #define PITLDVAL	0x00
 #define PITCVAL		0x04
 #define PITTCTRL	0x08
@@ -29,23 +29,36 @@
 
 #define PITTFLG_TIF	0x1
 
+struct pit_timer {
+	void __iomem *clksrc_base;
+	void __iomem *clkevt_base;
+	unsigned long cycle_per_jiffy;
+	struct clock_event_device ced;
+	struct clocksource cs;
+};
+
+static struct pit_timer pit_timer;
+
 static void __iomem *clksrc_base;
-static void __iomem *clkevt_base;
-static unsigned long cycle_per_jiffy;
 
-static inline void pit_timer_enable(void)
+static inline struct pit_timer *ced_to_pit(struct clock_event_device *ced)
+{
+	return container_of(ced, struct pit_timer, ced);
+}
+
+static inline void pit_timer_enable(struct pit_timer *pit)
 {
-	writel(PITTCTRL_TEN | PITTCTRL_TIE, clkevt_base + PITTCTRL);
+	writel(PITTCTRL_TEN | PITTCTRL_TIE, pit->clkevt_base + PITTCTRL);
 }
 
-static inline void pit_timer_disable(void)
+static inline void pit_timer_disable(struct pit_timer *pit)
 {
-	writel(0, clkevt_base + PITTCTRL);
+	writel(0, pit->clkevt_base + PITTCTRL);
 }
 
-static inline void pit_irq_acknowledge(void)
+static inline void pit_irq_acknowledge(struct pit_timer *pit)
 {
-	writel(PITTFLG_TIF, clkevt_base + PITTFLG);
+	writel(PITTFLG_TIF, pit->clkevt_base + PITTFLG);
 }
 
 static u64 notrace pit_read_sched_clock(void)
@@ -53,21 +66,22 @@ static u64 notrace pit_read_sched_clock(void)
 	return ~readl(clksrc_base + PITCVAL);
 }
 
-static int __init pit_clocksource_init(unsigned long rate)
+static int __init pit_clocksource_init(struct pit_timer *pit, unsigned long rate)
 {
 	/* set the max load value and start the clock source counter */
-	writel(0, clksrc_base + PITTCTRL);
-	writel(~0UL, clksrc_base + PITLDVAL);
-	writel(PITTCTRL_TEN, clksrc_base + PITTCTRL);
+	writel(0, pit->clksrc_base + PITTCTRL);
+	writel(~0, pit->clksrc_base + PITLDVAL);
+	writel(PITTCTRL_TEN, pit->clksrc_base + PITTCTRL);
 
 	sched_clock_register(pit_read_sched_clock, 32, rate);
-	return clocksource_mmio_init(clksrc_base + PITCVAL, "vf-pit", rate,
+	return clocksource_mmio_init(pit->clksrc_base + PITCVAL, "vf-pit", rate,
 			300, 32, clocksource_mmio_readl_down);
 }
 
-static int pit_set_next_event(unsigned long delta,
-				struct clock_event_device *unused)
+static int pit_set_next_event(unsigned long delta, struct clock_event_device *ced)
 {
+	struct pit_timer *pit = ced_to_pit(ced);
+
 	/*
 	 * set a new value to PITLDVAL register will not restart the timer,
 	 * to abort the current cycle and start a timer period with the new
@@ -75,30 +89,37 @@ static int pit_set_next_event(unsigned long delta,
 	 * and the PITLAVAL should be set to delta minus one according to pit
 	 * hardware requirement.
 	 */
-	pit_timer_disable();
-	writel(delta - 1, clkevt_base + PITLDVAL);
-	pit_timer_enable();
+	pit_timer_disable(pit);
+	writel(delta - 1, pit->clkevt_base + PITLDVAL);
+	pit_timer_enable(pit);
 
 	return 0;
 }
 
-static int pit_shutdown(struct clock_event_device *evt)
+static int pit_shutdown(struct clock_event_device *ced)
 {
-	pit_timer_disable();
+	struct pit_timer *pit = ced_to_pit(ced);
+
+	pit_timer_disable(pit);
+
 	return 0;
 }
 
-static int pit_set_periodic(struct clock_event_device *evt)
+static int pit_set_periodic(struct clock_event_device *ced)
 {
-	pit_set_next_event(cycle_per_jiffy, evt);
+	struct pit_timer *pit = ced_to_pit(ced);
+
+	pit_set_next_event(pit->cycle_per_jiffy, ced);
+
 	return 0;
 }
 
 static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = dev_id;
+	struct clock_event_device *ced = dev_id;
+	struct pit_timer *pit = ced_to_pit(ced);
 
-	pit_irq_acknowledge();
+	pit_irq_acknowledge(pit);
 
 	/*
 	 * pit hardware doesn't support oneshot, it will generate an interrupt
@@ -106,33 +127,33 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 	 * and start the counter again. So software need to disable the timer
 	 * to stop the counter loop in ONESHOT mode.
 	 */
-	if (likely(clockevent_state_oneshot(evt)))
-		pit_timer_disable();
+	if (likely(clockevent_state_oneshot(ced)))
+		pit_timer_disable(pit);
 
-	evt->event_handler(evt);
+	ced->event_handler(ced);
 
 	return IRQ_HANDLED;
 }
 
-static struct clock_event_device clockevent_pit = {
-	.name		= "VF pit timer",
-	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-	.set_state_shutdown = pit_shutdown,
-	.set_state_periodic = pit_set_periodic,
-	.set_next_event	= pit_set_next_event,
-	.rating		= 300,
-};
-
-static int __init pit_clockevent_init(unsigned long rate, int irq)
+static int __init pit_clockevent_init(struct pit_timer *pit, unsigned long rate, int irq)
 {
-	writel(0, clkevt_base + PITTCTRL);
-	writel(PITTFLG_TIF, clkevt_base + PITTFLG);
+	writel(0, pit->clkevt_base + PITTCTRL);
+
+	writel(PITTFLG_TIF, pit->clkevt_base + PITTFLG);
 
 	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
-			   "VF pit timer", &clockevent_pit));
+			   "VF pit timer", &pit->ced));
+
+	pit->ced.cpumask = cpumask_of(0);
+	pit->ced.irq = irq;
+
+	pit->ced.name = "VF pit timer";
+	pit->ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	pit->ced.set_state_shutdown = pit_shutdown;
+	pit->ced.set_state_periodic = pit_set_periodic;
+	pit->ced.set_next_event	= pit_set_next_event;
+	pit->ced.rating	= 300;
 
-	clockevent_pit.cpumask = cpumask_of(0);
-	clockevent_pit.irq = irq;
 	/*
 	 * The value for the LDVAL register trigger is calculated as:
 	 * LDVAL trigger = (period / clock period) - 1
@@ -141,7 +162,7 @@ static int __init pit_clockevent_init(unsigned long rate, int irq)
 	 * LDVAL trigger value is 1. And then the min_delta is
 	 * minimal LDVAL trigger value + 1, and the max_delta is full 32-bit.
 	 */
-	clockevents_config_and_register(&clockevent_pit, rate, 2, 0xffffffff);
+	clockevents_config_and_register(&pit->ced, rate, 2, 0xffffffff);
 
 	return 0;
 }
@@ -164,8 +185,8 @@ static int __init pit_timer_init(struct device_node *np)
 	 * so choose PIT2 as clocksource, PIT3 as clockevent device,
 	 * and leave PIT0 and PIT1 unused for anyone else who needs them.
 	 */
-	clksrc_base = timer_base + PITn_OFFSET(2);
-	clkevt_base = timer_base + PITn_OFFSET(3);
+	pit_timer.clksrc_base = timer_base + PIT_CH(2);
+	pit_timer.clkevt_base = timer_base + PIT_CH(3);
 
 	irq = irq_of_parse_and_map(np, 0);
 	if (irq <= 0)
@@ -180,15 +201,15 @@ static int __init pit_timer_init(struct device_node *np)
 		return ret;
 
 	clk_rate = clk_get_rate(pit_clk);
-	cycle_per_jiffy = clk_rate / (HZ);
+	pit_timer.cycle_per_jiffy = clk_rate / (HZ);
 
 	/* enable the pit module */
 	writel(~PITMCR_MDIS, timer_base + PITMCR);
 
-	ret = pit_clocksource_init(clk_rate);
+	ret = pit_clocksource_init(&pit_timer, clk_rate);
 	if (ret)
 		return ret;
 
-	return pit_clockevent_init(clk_rate, irq);
+	return pit_clockevent_init(&pit_timer, clk_rate, irq);
 }
 TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
-- 
2.43.0

