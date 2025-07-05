Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA2230BEF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731318; cv=none; b=WYZ1L3CaFGOeQpeuOTQJGUoggitkdORUnMlCGItbjwUbXUWZZjUjtizHoyeeEuB9cMclgILH8dLxE1z1asAL2p22qPOTmCoyJQ0P9eL6s8fIjof0AKtMdE/kQowe1+8NN2NjX7vFFhWSte3+g1o3TgT5zqpA7r9iuNYEQpnPcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731318; c=relaxed/simple;
	bh=bC4F2h2goQeDhzG8ACLsYxBu3Anz9VIe75YWh2Wakqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgHx95lRkxKR+bxJfGbn1PH3K6sjh6SoSc6DA0bB6H2ZuYlcQ2mkq8yVoShH2xVuZkra2CZhSfIXRBCIFX3i9JiHVrl0kJcqKkqzAYc4O49VLJ97LYz8Du/P37l8vgV1Va4pT5Zil+/Lmsl2iowQjEq2o2GAfhjWVQK37dbUIAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqCvzlos; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqCvzlos"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453608ed113so19783765e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731315; x=1752336115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UOQXF8yZegr97IBmfniH+hmsiTBWBU5KqSoxX99kEM=;
        b=WqCvzloscDZORWfbGBUsIANQsp8a63RfDzgVOIfPMQnLm5K9zfbN2ykq3+6TmkldoE
         5fCgRzrWGZotlTLT5VcpUYmztQJDAV/aRMdN9iSfnKe5DL2afF161oik7VI1O2C7BY+y
         0N/qorWYA1YGZDE4hieZkc6KW8Hzgbp1PHRjhygZUl5Ua2BHC9TjIoGcU/NITWtOPtz4
         vlrB8tfOrPD2b7Tf0+J2bxmojBaTLPXW86itSOVe4uw1UqujeC4XTTQkh581klKrTzuc
         0+UDjGWSgkt7B4ij/KM+jAM7LNpjMk7We7yzBttMMUIr6ae8M2T+PK6Lp8l5Gh9HDN+h
         MnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731315; x=1752336115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UOQXF8yZegr97IBmfniH+hmsiTBWBU5KqSoxX99kEM=;
        b=kqelbLJ446B4Al0+aPzPdhZNuVioB4k7p+9ykL4lGPaNHGyWySsL0ZJYtv1g5cU/m/
         vmsB0vOib/3eedfeUXhPzHQcxD2JvHr26S+bw4+sP0yVEK/avaCpog6i7FSlCVLsiu5H
         8mCsCr3TXDACCK3K7dxhxUcbQ0r2hydYWLenNkovdLOD07DnkL0FG1GUZfWk5dHSMruO
         VVcusuWHh6mRc4JS2Ss4VLXSOuymnVoLmmcqO8AREM3i2R+brAFtuMnWEFstqquT+iDG
         zWSXy/V7kmTdjI3nL1KhMCOanmr+QGZ/xVk1pvXYz5TdzeQerGlGMKQcFQYNvoTF6qvA
         HzVg==
X-Forwarded-Encrypted: i=1; AJvYcCUt1rc8+Eptnvt2COhYLKGuGhsM+hhmmdh9rDG019nGUnR9kuFOeOpsSBmrmPh9LT6Pq10NLML0qdNdV4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTIswuDmazEtsA4SkR0KXvDVkt6ZSYeDPDbDsMaZ7nunS4s9i
	hGzmZ6fveT47RhvaP5SnJjMQTEWFDgMSiWXqozmW+npuN78uPUNOpG4rvNsjiuOJa2rH+57wwRO
	OmPB2
X-Gm-Gg: ASbGncvPIsSBY1hTh4s/Y+euodaiet/jVtVPOxcCI+kfCTzqGncRn1sLGNvDRDqK65k
	pf9uspnv5TNlGpdrwLXUR7B0/UFYHDgF6Pc/FTHHeo7PNWQBvzAdpwkT3qpH5HS4LHwppeChD0O
	zyVwjv3W2g/gF13xY8QQfCzZNE2beEkzTVeI6w1Zt9QdNDkquAhFvUEwQJq/9WC0XWqrSBp3Ii1
	kez+nQpYHNtWvUkm2h+51jrJ/sDUSWbd9Qs/3V6TWy6NGYlf3D5WEYy5i1iYxGmJTqk58Hpwdq0
	dugtx8qdlIMxO4I1Q3WtMArtOR9c5AO6FH/7wbJ9SzlXR9iF5k/DZhz7mLXWvkDduQHvwfcDOFX
	PpYFRk8p83isa
X-Google-Smtp-Source: AGHT+IFYNw8+9Qvdv0PbdgBqQfynVxtZABW8L0rDjRFHtvP4hDfKhXSPBnd/l0SFcP0jWWwF294AEA==
X-Received: by 2002:a05:600c:3549:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-454b308c9bcmr80605445e9.10.1751731314515;
        Sat, 05 Jul 2025 09:01:54 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:54 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/20] clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support
Date: Sat,  5 Jul 2025 18:01:25 +0200
Message-ID: <20250705160129.3688026-19-daniel.lezcano@linaro.org>
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

The S32G platform has two Periodic Interrupt Timer (PIT). The IP is
exactly the same as the VF platform.

The setup found for this platform is each timer instance is bound to
CPU0 and CPU1.

The changes bring the support for multiple timer instances. When we
reach the maximum PIT instances for this platform, which is described
in the match table data, the hotplug callbacks are called where they
finish the per CPU setup.

Tested on a s32g274a-rdb2.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-nxp-pit.c | 113 +++++++++++++++++++++++-----
 1 file changed, 96 insertions(+), 17 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-pit.c b/drivers/clocksource/timer-nxp-pit.c
index ff9d721f5e31..3e4caa106ee8 100644
--- a/drivers/clocksource/timer-nxp-pit.c
+++ b/drivers/clocksource/timer-nxp-pit.c
@@ -1,14 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright 2012-2013 Freescale Semiconductor, Inc.
+ * Copyright 2018,2021-2025 NXP
  */
-
 #include <linux/interrupt.h>
 #include <linux/clockchips.h>
+#include <linux/cpuhotplug.h>
 #include <linux/clk.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/sched_clock.h>
+#include <linux/platform_device.h>
 
 /*
  * Each pit takes 0x10 Bytes register space
@@ -37,11 +39,23 @@
 struct pit_timer {
 	void __iomem *clksrc_base;
 	void __iomem *clkevt_base;
-	unsigned long cycle_per_jiffy;
 	struct clock_event_device ced;
 	struct clocksource cs;
+	int rate;
+};
+
+struct pit_timer_data {
+	int max_pit_instances;
 };
 
+static DEFINE_PER_CPU(struct pit_timer *, pit_timers);
+
+/*
+ * Global structure for multiple PITs initialization
+ */
+static int pit_instances;
+static int max_pit_instances = 1;
+
 static void __iomem *sched_clock_base;
 
 static inline struct pit_timer *ced_to_pit(struct clock_event_device *ced)
@@ -98,8 +112,8 @@ static u64 pit_timer_clocksource_read(struct clocksource *cs)
 	return ~(u64)readl(PITCVAL(pit->clksrc_base));
 }
 
-static int __init pit_clocksource_init(struct pit_timer *pit, const char *name,
-				       void __iomem *base, unsigned long rate)
+static int pit_clocksource_init(struct pit_timer *pit, const char *name,
+				void __iomem *base, unsigned long rate)
 {
 	/*
 	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
@@ -155,7 +169,7 @@ static int pit_set_periodic(struct clock_event_device *ced)
 {
 	struct pit_timer *pit = ced_to_pit(ced);
 
-	pit_set_next_event(pit->cycle_per_jiffy, ced);
+	pit_set_next_event(pit->rate / HZ, ced);
 
 	return 0;
 }
@@ -181,23 +195,27 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init pit_clockevent_init(struct pit_timer *pit, const char *name,
-				      void __iomem *base, unsigned long rate, int irq, int cpu)
+static int pit_clockevent_per_cpu_init(struct pit_timer *pit, const char *name,
+				       void __iomem *base, unsigned long rate, int irq, int cpu)
 {
+	int ret;
+
 	/*
 	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
 	 * choose PIT3 as clockevent and leave PIT0 and PIT1 unused
 	 * for anyone else who needs them.
 	 */
 	pit->clkevt_base = base + PIT_CH(3);
-	pit->cycle_per_jiffy = rate / (HZ);
+	pit->rate = rate;
 
 	pit_timer_disable(pit->clkevt_base);
 
 	pit_timer_irqack(pit);
 
-	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
-			   name, &pit->ced));
+	ret = request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_NOBALANCING,
+			  name, &pit->ced);
+	if (ret)
+		return ret;
 
 	pit->ced.cpumask = cpumask_of(cpu);
 	pit->ced.irq = irq;
@@ -209,6 +227,23 @@ static int __init pit_clockevent_init(struct pit_timer *pit, const char *name,
 	pit->ced.set_next_event	= pit_set_next_event;
 	pit->ced.rating	= 300;
 
+	per_cpu(pit_timers, cpu) = pit;
+
+	return 0;
+}
+
+static int pit_clockevent_starting_cpu(unsigned int cpu)
+{
+	struct pit_timer *pit = per_cpu(pit_timers, cpu);
+	int ret;
+
+	if (!pit)
+		return 0;
+
+	ret = irq_force_affinity(pit->ced.irq, cpumask_of(cpu));
+	if (ret)
+		return ret;
+
 	/*
 	 * The value for the LDVAL register trigger is calculated as:
 	 * LDVAL trigger = (period / clock period) - 1
@@ -217,12 +252,12 @@ static int __init pit_clockevent_init(struct pit_timer *pit, const char *name,
 	 * LDVAL trigger value is 1. And then the min_delta is
 	 * minimal LDVAL trigger value + 1, and the max_delta is full 32-bit.
 	 */
-	clockevents_config_and_register(&pit->ced, rate, 2, 0xffffffff);
+	clockevents_config_and_register(&pit->ced, pit->rate, 2, 0xffffffff);
 
 	return 0;
 }
 
-static int __init pit_timer_init(struct device_node *np)
+static int pit_timer_init(struct device_node *np)
 {
 	struct pit_timer *pit;
 	struct clk *pit_clk;
@@ -261,16 +296,31 @@ static int __init pit_timer_init(struct device_node *np)
 
 	clk_rate = clk_get_rate(pit_clk);
 
-	/* enable the pit module */
-	pit_module_enable(timer_base);
+	pit_module_disable(timer_base);
 
 	ret = pit_clocksource_init(pit, name, timer_base, clk_rate);
-	if (ret)
+	if (ret) {
+		pr_err("Failed to initialize clocksource '%pOF'\n", np);
 		goto out_pit_module_disable;
+	}
 
-	ret = pit_clockevent_init(pit, name, timer_base, clk_rate, irq, 0);
-	if (ret)
+	ret = pit_clockevent_per_cpu_init(pit, name, timer_base, clk_rate, irq, pit_instances);
+	if (ret) {
+		pr_err("Failed to initialize clockevent '%pOF'\n", np);
 		goto out_pit_clocksource_unregister;
+	}
+
+	/* enable the pit module */
+	pit_module_enable(timer_base);
+
+	pit_instances++;
+
+	if (pit_instances == max_pit_instances) {
+		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "PIT timer:starting",
+					pit_clockevent_starting_cpu, NULL);
+		if (ret < 0)
+			goto out_pit_clocksource_unregister;
+	}
 
 	return 0;
 
@@ -288,4 +338,33 @@ static int __init pit_timer_init(struct device_node *np)
 
 	return ret;
 }
+
+static int pit_timer_probe(struct platform_device *pdev)
+{
+	const struct pit_timer_data *pit_timer_data;
+
+	pit_timer_data = of_device_get_match_data(&pdev->dev);
+	if (pit_timer_data)
+		max_pit_instances = pit_timer_data->max_pit_instances;
+
+	return pit_timer_init(pdev->dev.of_node);
+}
+
+static struct pit_timer_data s32g2_data = { .max_pit_instances = 2 };
+
+static const struct of_device_id pit_timer_of_match[] = {
+	{ .compatible = "nxp,s32g2-pit", .data = &s32g2_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pit_timer_of_match);
+
+static struct platform_driver nxp_pit_driver = {
+	.driver = {
+		.name = "nxp-pit",
+		.of_match_table = pit_timer_of_match,
+	},
+	.probe = pit_timer_probe,
+};
+module_platform_driver(nxp_pit_driver);
+
 TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
-- 
2.43.0

