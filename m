Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6B2356D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584849; cv=none; b=f/6LNMKrpmgmcfECOFdjWJJ9P7aH9fYstuJZ6qk/WPMyWQGzXOWdL1fb7Owb2eKQoRfgYg0tskTE1XCirCgPnZU2Ck49YigcHQrdr+rj/WOKMHjvVxBAhGRjIZ5mLzLDQ+SrKowjyqsgEe+t8baa53NdaeB8Xazl/m6M4Pe+3e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584849; c=relaxed/simple;
	bh=FvJhDbZlkhqWGp9e6GweBlySxjEOHlRiq2qB2gxXvDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=av6J2/e0nZ9kGPpuhPh+Pr6hJs4iZDoPQGP0E/JQUFpl+K/sRFu+jp9o/fxAaspJcklJy1DQCXd1lf8fBVc1b9kn0b2wGU10+sY9fq44I+hFxlbzoO+L0TJPiQjbCPPioKsHUJjjtBesRcqSff+1Ks/cAB2GykQkzUPRHbPHDuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PpvH1hXT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PpvH1hXT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39149bccb69so5670576f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743584845; x=1744189645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLgWundaL8QamxaRs+5uVFJ86tOM7kRZUzXC//Q9sps=;
        b=PpvH1hXTkYQ9rf2X8Xy9mPp+tcAhDC9KVE8NFaEERhB9v5eTexQkMkxlkS/04LYxpg
         PJyTYjoTF9avQ1wqEdwy8SsSOnZpei3M12YMM5n3i4GML3EAaAJdWUjIod8EQNd4gDCu
         O5Vvw9IFE+0T4BwPW5NOkwCnMVZFcIwzYL4YproM3/kUXXi+nZdthyEGY/m6CJBGIyIu
         +aEfPfekCcGMYVTWYEL86aqvpMomEdskvyynBFfZE08wDU+V6YqXvf3sPBOik/a6z3tC
         OjKR2YmWNy5/lNd6KHf4L2RPS0bkWCl5uGeM4NbxO2/e2jYBIXXtgTepovUDWvMtVNfS
         bQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584845; x=1744189645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLgWundaL8QamxaRs+5uVFJ86tOM7kRZUzXC//Q9sps=;
        b=IeOTexcZdFDD8o9dvt+rVwcB/5XkoTsmeAQn0Ay/FMx8HF48zSqCunqBx6dd/SFI+g
         t49U+yKugLfeWSXPFotuSKpTq6tbmcYd31jMSgUsflrl3PevlwTdasZIk+F/yR+3CcC0
         cE8L0LhR9vBA67qoD3J2iqwCCJdr94+vH17MVDR8nK7BXTDP5/zeww01AoVhlwPyVHhs
         VzjwIZa9A5XNBVjsO7PeZ+PYGA1EH2u8Jx6hwzUXiuFu2po1tKZcaHBq30LUfke2uaPY
         EidPOlH5WYB8+9LXGpGeQ3/pRZvu5oLQfgsKfH3Al6nJaxwAvKLkx7l+a9o8PG6CVKJa
         wf7g==
X-Gm-Message-State: AOJu0YzbuD3mlwaPokT1g79a8xxlPPThCAi9RfCAm10hngbGzbsM1fsc
	F1Wg0B5JcXect0g35Vs1NhBEZ3kBVwHLRDlkS4yGJYDcc5JFO6naXSxgDQsPggo=
X-Gm-Gg: ASbGncsKc+IyB1X0xBTT38REDVTJQsGFpP+IKOLaPmlmRwrU6LXtA7NKEOr19vYManR
	sgvMhL1f3nX6Y+hMTBw1JlIoSyt0hsFCCE8qhO0poOzA4Z07iYPRtqkvDj8MJMn+XWYpFILE4WF
	4hPYvM2KaTc2IBRHEzSd1bO0VveDjCgkq81lpZkGFBuZXfLobDgyHBN+gLESan3EzC6wMhp5tdI
	L8Yy6LxJbE+R1cFV1x28qHpzdyL8PwPqJKwv+CXZTMezkFzzt0TmCYTFLKyAYSKPmzPQghaytsx
	ZjfxPlfYph4DJq0XWDLZs8qmwfR2HbLhzIS0iSnHJUX8AOIcCLa7L8KvX01I1dyg4wunQyw=
X-Google-Smtp-Source: AGHT+IHahBuvz0VSy0je+Uw9JxlLQ/T/HpeSWQaJdJcQo2Z9V4XSsGVgZGJdW6O9X3wMojJfNYf0hw==
X-Received: by 2002:a5d:47c1:0:b0:391:30b9:556a with SMTP id ffacd0b85a97d-39c29737feemr1392089f8f.7.1743584845121;
        Wed, 02 Apr 2025 02:07:25 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b65b4fcsm16680724f8f.11.2025.04.02.02.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:07:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v4 2/2] clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms
Date: Wed,  2 Apr 2025 11:07:12 +0200
Message-ID: <20250402090714.3548055-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

STM supports commonly required system and application software timing
functions. STM includes a 32-bit count-up timer and four 32-bit
compare channels with a separate interrupt source for each
channel. The timer is driven by the STM module clock divided by an
8-bit prescale value (1 to 256).

STM has the following features:
    • One 32-bit count-up timer with an 8-bit prescaler
    • Four 32-bit compare channels
    • An independent interrupt source for each channel
    • Ability to stop the timer in Debug mode

The s32g platform is declined into two versions, the s32g2 and the
s32g3. The former has a STM block with 8 timers and the latter has 12
timers.

The platform is designed to have one usable STM instance per core on
the system which is composed of 3 x Cortex-M3 + 4 Cortex-A53 for the
s32g2 and 3 x Cortex-M3 + 8 Cortex-A53 for the s32g3.

There is a special STM instance called STM_TS which is dedicated to
the timestamp. The 7th STM instance STM_07 is directly tied to the
STM_TS which means it is not usable as a clockevent.

The driver instantiate each STM described in the device tree as a
clocksource and a clockevent conforming to the reference manual even
if the Linux system does not use all of the clocksource. Each
clockevent will have a cpumask set for a specific CPU.

Given the counter is shared between the clocksource and the
clockevent, the STM module can not be disabled by one or another so
the refcounting mechanism is used to stop the counter when it reaches
zero and to start it when it is one. The suspend and resume relies on
the refcount to stop the module.

As the device tree will have multiple STM entries, the driver can be
probed in parallel with the async option but it is not enabled
yet. However, the driver code takes care of preventing a race by
putting a lock to protect the number of STM instances global variable
which means it is ready to support the option when enough testing will
be done with the underlying time framework.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Suggested-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig         |   9 +
 drivers/clocksource/Makefile        |   2 +
 drivers/clocksource/timer-nxp-stm.c | 495 ++++++++++++++++++++++++++++
 3 files changed, 506 insertions(+)
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..e86e327392af 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -763,4 +763,13 @@ config RALINK_TIMER
 	  Enables support for system tick counter present on
 	  Ralink SoCs RT3352 and MT7620.
 
+config NXP_STM_TIMER
+	bool "NXP System Timer Module driver"
+	depends on ARCH_S32 || COMPILE_TEST
+	select CLKSRC_MMIO
+	help
+	  Support for NXP System Timer Module. It will create, in this
+	  order, a clocksource, a broadcast clockevent and a per cpu
+	  clockevent.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 43ef16a4efa6..c3a92e6b9f94 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -92,3 +92,5 @@ obj-$(CONFIG_GXP_TIMER)			+= timer-gxp.o
 obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
 obj-$(CONFIG_RALINK_TIMER)		+= timer-ralink.o
+obj-$(CONFIG_NXP_STM_TIMER)		+= timer-nxp-stm.o
+
diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
new file mode 100644
index 000000000000..8c542139033c
--- /dev/null
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ * Copyright 2018,2021-2025 NXP
+ *
+ * NXP System Timer Module:
+ *
+ *  STM supports commonly required system and application software
+ *  timing functions. STM includes a 32-bit count-up timer and four
+ *  32-bit compare channels with a separate interrupt source for each
+ *  channel. The timer is driven by the STM module clock divided by an
+ *  8-bit prescale value (1 to 256). It has ability to stop the timer
+ *  in Debug mode
+ */
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/sched_clock.h>
+#include <linux/units.h>
+
+#define STM_CR(__base)		(__base)
+
+#define STM_CR_TEN		BIT(0)
+#define STM_CR_FRZ		BIT(1)
+#define STM_CR_CPS_OFFSET	8u
+#define STM_CR_CPS_MASK		GENMASK(15, STM_CR_CPS_OFFSET)
+
+#define STM_CNT(__base)		((__base) + 0x04)
+
+#define STM_CCR0(__base)	((__base) + 0x10)
+#define STM_CCR1(__base)	((__base) + 0x20)
+#define STM_CCR2(__base)	((__base) + 0x30)
+#define STM_CCR3(__base)	((__base) + 0x40)
+
+#define STM_CCR_CEN		BIT(0)
+
+#define STM_CIR0(__base)	((__base) + 0x14)
+#define STM_CIR1(__base)	((__base) + 0x24)
+#define STM_CIR2(__base)	((__base) + 0x34)
+#define STM_CIR3(__base)	((__base) + 0x44)
+
+#define STM_CIR_CIF		BIT(0)
+
+#define STM_CMP0(__base)	((__base) + 0x18)
+#define STM_CMP1(__base)	((__base) + 0x28)
+#define STM_CMP2(__base)	((__base) + 0x38)
+#define STM_CMP3(__base)	((__base) + 0x48)
+
+#define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
+
+struct stm_timer {
+	void __iomem *base;
+	unsigned long rate;
+	unsigned long delta;
+	unsigned long counter;
+	struct clock_event_device ced;
+	struct clocksource cs;
+	atomic_t refcnt;
+};
+
+static DEFINE_PER_CPU(struct stm_timer *, stm_timers);
+
+static struct stm_timer *stm_sched_clock;
+
+/*
+ * Global structure for multiple STMs initialization
+ */
+static int stm_instances;
+
+/*
+ * This global lock is used to prevent race conditions with the
+ * stm_instances in case the driver is using the ASYNC option
+ */
+static DEFINE_MUTEX(stm_instances_lock);
+
+DEFINE_GUARD(stm_instances, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
+
+static struct stm_timer *cs_to_stm(struct clocksource *cs)
+{
+	return container_of(cs, struct stm_timer, cs);
+}
+
+static struct stm_timer *ced_to_stm(struct clock_event_device *ced)
+{
+	return container_of(ced, struct stm_timer, ced);
+}
+
+static u64 notrace nxp_stm_read_sched_clock(void)
+{
+	return readl(STM_CNT(stm_sched_clock->base));
+}
+
+static u32 nxp_stm_clocksource_getcnt(struct stm_timer *stm_timer)
+{
+	return readl(STM_CNT(stm_timer->base));
+}
+
+static void nxp_stm_clocksource_setcnt(struct stm_timer *stm_timer, u32 cnt)
+{
+	writel(cnt, STM_CNT(stm_timer->base));
+}
+
+static u64 nxp_stm_clocksource_read(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	return (u64)nxp_stm_clocksource_getcnt(stm_timer);
+}
+
+static void nxp_stm_module_enable(struct stm_timer *stm_timer)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_timer->base));
+
+	reg |= STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_timer->base));
+}
+
+static void nxp_stm_module_disable(struct stm_timer *stm_timer)
+{
+	u32 reg;
+
+	reg = readl(STM_CR(stm_timer->base));
+
+	reg &= ~STM_ENABLE_MASK;
+
+	writel(reg, STM_CR(stm_timer->base));
+}
+
+static void nxp_stm_module_put(struct stm_timer *stm_timer)
+{
+	if (atomic_dec_and_test(&stm_timer->refcnt))
+		nxp_stm_module_disable(stm_timer);
+}
+
+static void nxp_stm_module_get(struct stm_timer *stm_timer)
+{
+	if (atomic_inc_return(&stm_timer->refcnt) == 1)
+		nxp_stm_module_enable(stm_timer);
+}
+
+static int nxp_stm_clocksource_enable(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	nxp_stm_module_get(stm_timer);
+
+	return 0;
+}
+
+static void nxp_stm_clocksource_disable(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	nxp_stm_module_put(stm_timer);
+}
+
+static void nxp_stm_clocksource_suspend(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	nxp_stm_clocksource_disable(cs);
+	stm_timer->counter = nxp_stm_clocksource_getcnt(stm_timer);
+}
+
+static void nxp_stm_clocksource_resume(struct clocksource *cs)
+{
+	struct stm_timer *stm_timer = cs_to_stm(cs);
+
+	nxp_stm_clocksource_setcnt(stm_timer, stm_timer->counter);
+	nxp_stm_clocksource_enable(cs);
+}
+
+static void __init devm_clocksource_unregister(void *data)
+{
+	struct stm_timer *stm_timer = data;
+
+	clocksource_unregister(&stm_timer->cs);
+}
+
+static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer *stm_timer,
+					   const char *name, void __iomem *base, struct clk *clk)
+{
+	int ret;
+
+	stm_timer->base = base;
+	stm_timer->rate = clk_get_rate(clk);
+
+	stm_timer->cs.name = name;
+	stm_timer->cs.rating = 460;
+	stm_timer->cs.read = nxp_stm_clocksource_read;
+	stm_timer->cs.enable = nxp_stm_clocksource_enable;
+	stm_timer->cs.disable = nxp_stm_clocksource_disable;
+	stm_timer->cs.suspend = nxp_stm_clocksource_suspend;
+	stm_timer->cs.resume = nxp_stm_clocksource_resume;
+	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
+	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+
+	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, devm_clocksource_unregister, stm_timer);
+	if (ret) {
+		clocksource_unregister(&stm_timer->cs);
+		return ret;
+	}
+
+	stm_sched_clock = stm_timer;
+
+	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
+
+	dev_dbg(dev, "Registered clocksource %s\n", name);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_read_counter(struct stm_timer *stm_timer)
+{
+	return readl(STM_CNT(stm_timer->base));
+}
+
+static void nxp_stm_clockevent_disable(struct stm_timer *stm_timer)
+{
+	writel(0, STM_CCR0(stm_timer->base));
+}
+
+static void nxp_stm_clockevent_enable(struct stm_timer *stm_timer)
+{
+	writel(STM_CCR_CEN, STM_CCR0(stm_timer->base));
+}
+
+static int nxp_stm_clockevent_shutdown(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	nxp_stm_clockevent_disable(stm_timer);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+	u32 val;
+
+	nxp_stm_clockevent_disable(stm_timer);
+
+	stm_timer->delta = delta;
+
+	val = nxp_stm_clockevent_read_counter(stm_timer) + delta;
+
+	writel(val, STM_CMP0(stm_timer->base));
+
+	/*
+	 * The counter is shared across the channels and can not be
+	 * stopped while we are setting the next event. If the delta
+	 * is very small it is possible the counter increases above
+	 * the computed 'val'. The min_delta value specified when
+	 * registering the clockevent will prevent that. The second
+	 * case is if the counter wraps while we compute the 'val' and
+	 * before writing the comparator register. We read the counter,
+	 * check if we are back in time and abort the timer with -ETIME.
+	 */
+	if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
+		return -ETIME;
+
+	nxp_stm_clockevent_enable(stm_timer);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_set_periodic(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	return nxp_stm_clockevent_set_next_event(stm_timer->rate, ced);
+}
+
+static void nxp_stm_clockevent_suspend(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	nxp_stm_module_put(stm_timer);
+}
+
+static void nxp_stm_clockevent_resume(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	nxp_stm_module_get(stm_timer);
+}
+
+static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm_timer *stm_timer,
+						  const char *name, void __iomem *base, int irq,
+						  struct clk *clk, int cpu)
+{
+	stm_timer->base = base;
+	stm_timer->rate = clk_get_rate(clk);
+
+	stm_timer->ced.name = name;
+	stm_timer->ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	stm_timer->ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
+	stm_timer->ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
+	stm_timer->ced.set_next_event = nxp_stm_clockevent_set_next_event;
+	stm_timer->ced.suspend = nxp_stm_clockevent_suspend;
+	stm_timer->ced.resume = nxp_stm_clockevent_resume;
+	stm_timer->ced.cpumask = cpumask_of(cpu);
+	stm_timer->ced.rating = 460;
+	stm_timer->ced.irq = irq;
+
+	per_cpu(stm_timers, cpu) = stm_timer;
+
+	nxp_stm_module_get(stm_timer);
+
+	dev_dbg(dev, "Initialized per cpu clockevent name=%s, irq=%d, cpu=%d\n", name, irq, cpu);
+
+	return 0;
+}
+
+static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
+{
+	struct stm_timer *stm_timer = per_cpu(stm_timers, cpu);
+	int ret;
+
+	if (WARN_ON(!stm_timer))
+		return -EFAULT;
+
+	ret = irq_force_affinity(stm_timer->ced.irq, cpumask_of(cpu));
+	if (ret)
+		return ret;
+
+	/*
+	 * The timings measurement show reading the counter register
+	 * and writing to the comparator register takes as a maximum
+	 * value 1100 ns at 133MHz rate frequency. The timer must be
+	 * set above this value and to be secure we set the minimum
+	 * value equal to 2000ns, so 2us.
+	 *
+	 * minimum ticks = (rate / MICRO) * 2
+	 */
+	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
+					(stm_timer->rate / MICRO) * 2, 0xffffffff);
+
+	return 0;
+}
+
+static irqreturn_t nxp_stm_module_interrupt(int irq, void *dev_id)
+{
+	struct stm_timer *stm_timer = dev_id;
+	struct clock_event_device *ced = &stm_timer->ced;
+	u32 val;
+
+	/*
+	 * The interrupt is shared across the channels in the
+	 * module. But this one is configured to run only one channel,
+	 * consequently it is pointless to test the interrupt flags
+	 * before and we can directly reset the channel 0 irq flag
+	 * register.
+	 */
+	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
+
+	/*
+	 * Update STM_CMP value using the counter value
+	 */
+	val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
+
+	writel(val, STM_CMP0(stm_timer->base));
+
+	/*
+	 * stm hardware doesn't support oneshot, it will generate an
+	 * interrupt and start the counter again so software need to
+	 * disable the timer to stop the counter loop in ONESHOT mode.
+	 */
+	if (likely(clockevent_state_oneshot(ced)))
+		nxp_stm_clockevent_disable(stm_timer);
+
+	ced->event_handler(ced);
+
+	return IRQ_HANDLED;
+}
+
+static int __init nxp_stm_timer_probe(struct platform_device *pdev)
+{
+	struct stm_timer *stm_timer;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const char *name = of_node_full_name(np);
+	struct clk *clk;
+	void __iomem *base;
+	int irq, ret;
+
+	/*
+	 * The device tree can have multiple STM nodes described, so
+	 * it makes this driver a good candidate for the async probe.
+	 * It is still unclear if the time framework does correctly
+	 * handle a parallel loading of the timers but at least this
+	 * driver is ready to support the option.
+	 */
+	guard(stm_instances)(&stm_instances_lock);
+
+	/*
+	 * The S32Gx are SoCs featuring a diverse set of cores. Linux
+	 * is expected to run on Cortex-A53 cores, while other
+	 * software stacks will operate on Cortex-M cores. The number
+	 * of STM instances has been sized to include at most one
+	 * instance per core.
+	 *
+	 * As we need a clocksource and a clockevent per cpu, we
+	 * simply initialize a clocksource per cpu along with the
+	 * clockevent which makes the resulting code simpler.
+	 *
+	 * However if the device tree is describing more STM instances
+	 * than the number of cores, then we ignore them.
+	 */
+	if (stm_instances >= num_possible_cpus())
+		return 0;
+
+	base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base), "Failed to iomap %pOFn\n", np);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Clock not found\n");
+
+	stm_timer = devm_kzalloc(dev, sizeof(*stm_timer), GFP_KERNEL);
+	if (!stm_timer)
+		return -ENOMEM;
+
+	ret = devm_request_irq(dev, irq, nxp_stm_module_interrupt,
+			       IRQF_TIMER | IRQF_NOBALANCING, name, stm_timer);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to allocate interrupt line\n");
+
+	ret = nxp_stm_clocksource_init(dev, stm_timer, name, base, clk);
+	if (ret)
+		return ret;
+
+	/*
+	 * Next probed STM will be a per CPU clockevent, until
+	 * we probe as much as we have CPUs available on the
+	 * system, we do a partial initialization
+	 */
+	ret = nxp_stm_clockevent_per_cpu_init(dev, stm_timer, name,
+					      base, irq, clk,
+					      stm_instances);
+	if (ret)
+		return ret;
+
+	stm_instances++;
+
+	/*
+	 * The number of probed STM for per CPU clockevent is
+	 * equal to the number of available CPUs on the
+	 * system. We install the cpu hotplug to finish the
+	 * initialization by registering the clockevents
+	 */
+	if (stm_instances == num_possible_cpus()) {
+		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "STM timer:starting",
+					nxp_stm_clockevent_starting_cpu, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id nxp_stm_of_match[] = {
+	{ .compatible = "nxp,s32g2-stm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
+
+static struct platform_driver nxp_stm_probe = {
+	.probe	= nxp_stm_timer_probe,
+	.driver	= {
+		.name		= "nxp-stm",
+		.of_match_table	= nxp_stm_of_match,
+	},
+};
+module_platform_driver(nxp_stm_probe);
+
+MODULE_DESCRIPTION("NXP System Timer Module driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

