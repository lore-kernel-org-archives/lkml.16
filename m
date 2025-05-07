Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381B92165EC;
	Wed,  7 May 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601140; cv=none; b=VdfNIOS4zmtvkzCQ93/ftTo7azlwfqdPFDySFwlxkszg+JiMplf8VxFa4L8tiPzPHSaHgL74dlHplzSv11/si8HuUderRfG9YoGJoHltCnF+ikN4cqWkVTy/31jfT/RTN3vZ51zVcjwfLx/+3CxqFbedM8Dk4XlDZYKBw/l1qGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601140; c=relaxed/simple;
	bh=M8A28/FCgOo+Deh18WtLaw69mM3yhAAB9vBej8CvPmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tv6WOF9Vwj1ABjycvLDAndesBvRKFmRJC6Or2jWcASUegwmG34U8meRSpSpzVTkft85jBibf6L906BM+4GYOBrevZSy1tt9AkG2/YEgYncuQ1DXBfogR0Fy+WUe9BCz2nonOv34ItZDjTDuRlYCflQU3KPkf3iwZLeuHIkDfe3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiYUHKni; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiYUHKni"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30828fc17adso6436888a91.1;
        Tue, 06 May 2025 23:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601138; x=1747205938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwqaFQ8ta774Od/giScBMq+pGLs67O+6YYSzVsHWz8U=;
        b=DiYUHKniGJt9JkGT1w4EtcGgm4op9fR1dQfUA6g9FTL3kRKfMYTxxmV0CGc7Cc43iu
         EwToENrEx/BmnGOlRHa20hYMXK3mMclKyP8xugIAdCslmkzjg5h0xyORhp29RAQUJbcu
         6qlGHxZsZVm6Yo9QCA5CvffWTSKb3qSoPh3F2erjESkgWyNg0xbU4LLdnZszu4iUg+o+
         OnEbG7H6hUxjCjIo22bn8DAsvaBkWxDNV9dElm1Lqmj+vjY8/ccZyz5yGZNrcf+c4lZ2
         GebF0kRb0e5eY3fMxspX/6cfQDPOudvTw5Jnw2/8frmyOfZxctbDwdys/QSG3uPpDAcd
         8G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601138; x=1747205938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwqaFQ8ta774Od/giScBMq+pGLs67O+6YYSzVsHWz8U=;
        b=wUsu4WuGi5eMsh3iWgUaT7S8r4kbI2L/iTmF8KmPD6so1Z2LrDAKWHhNPbl80vra4j
         zS5VgTqrl7iG/2JyzDDzqz7ggJjGomi4/ppwdgf6Msl2lZyCJtiVlITRj7jZNAK5w6ht
         jGsSv4KLgoYpF5+4XaT9RMiddanVQv3LGwjgqYMPpkf3jvnOMr9ALPxhZgf0oKKKzM7l
         vzpA+gPr/LreClGUyQhlA6lfN3T1wH7dmRDmckxmHlGpdpbV+cEyrwOim99sbIdBM7Ra
         aMQl8SgdjN3XmeBODQJyzcihD8u0vWMowa537ca+UdbcTtMcoALAG4dEPj8wVkFjJPDQ
         46ug==
X-Forwarded-Encrypted: i=1; AJvYcCX/gOqgZNLpKCa3om9fMSLY1PgiZCgCk7MKZZclcUAfeDNYyWfV/qB2bxzfImYo5VQUsH1C+mKY9zjx@vger.kernel.org, AJvYcCXWmrygiTovDjyyCLGIm99jXkntulgMI/ntznvmj24yob6ne82QTYSUJAMx7CCcsvF4vUWh0iPZ+o1L6Njb@vger.kernel.org
X-Gm-Message-State: AOJu0YwNZZeT2w4ucPoFmVECX0tSUn621PUeKTAxpkIhqjWUOaayymK+
	CQ5pRD7DSTHTv3YwpPh/UB4C5w5gRRl1WU5Q2DXMak607+/Ho3kLc5m39rLmhs18UA==
X-Gm-Gg: ASbGncvTWSvLICGb0giDnOuL1rfydKWpe+YvnFjY5L9eJpN4zhlN6kLMiNXuj4FTbBG
	T6Qv3DwArgRSGtjQ+XvZkUVi8KS+HAnFaQ35OIcQXA4t9L3dBJHeM3eX7yMeEAXdTLaZv/yscK+
	qkgjVtytZt7E9vDCDVaeHXB/8ZnTHSQAgIjN0VOuPwsZgP3yz0ELskAS3dAyFmTfjw+TCN7fpOu
	7oErpSLaoD/w8GFKLsIfdxuAIKUYb47tmu0y0VRVCwo5+HiHOISANs2dfq/Vpwbo2uANgxLpI65
	SGB7dKVUqJ7+WW2o24sVjveSsEXy68BWKKZmmhuE9vhr+h4qJLPG
X-Google-Smtp-Source: AGHT+IGaP59zSzmHsRzTedrW0PoLslMePgrQ205Ilt53DZ9ptJ+jiAmMSHZMCXtZEn5exXudS80wEg==
X-Received: by 2002:a17:90b:4a82:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-30aac1b3322mr3482753a91.16.1746601138036;
        Tue, 06 May 2025 23:58:58 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:57 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:32 +0400
Subject: [PATCH v2 3/4] clocksource/drivers/timer-vt8500: Add watchdog
 functionality
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=5490;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=M8A28/FCgOo+Deh18WtLaw69mM3yhAAB9vBej8CvPmM=;
 b=DTwPvujc+dzWl1IVbzguAeSoM1aBFWO/ppre0b9GS9cnvyG6K+kcbZYTdwUB/upwnCr7nKc0/
 oFc/Z7V/5n6DkVxk9TTqEF8yGx30u2xWnIfr5K4U5/7iwkB1NgkRYiQ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia system timer IP can generate a watchdog reset when its
clocksource counter matches the value in the match register 0 and
watchdog function is enabled. For this to work, obvously the clock event
device must use a different match register (1~3) and respective interrupt.

Check if at least two interrupts are provided by the device tree, then use
match register 1 for system clock events and match register 0 for watchdog
respectively.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/Kconfig        | 11 +++++++
 drivers/clocksource/timer-vt8500.c | 61 ++++++++++++++++++++++++++++++++++----
 2 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c8525996724fbf9c6e9726dabb478d86513b9..8f5e41ff23386d9ecb46b38603dae485db71cfc7 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -181,6 +181,17 @@ config VT8500_TIMER
 	help
 	  Enables support for the VT8500 driver.
 
+config VT8500_TIMER_WATCHDOG
+	bool "Enable VT8500 watchdog functionality"
+	depends on VT8500_TIMER
+	depends on WATCHDOG && WATCHDOG_CORE=y
+	help
+	  VIA/WonderMedia SoCs can use their system timer as a hardware
+	  watchdog, as long as the first timer channel is free from other
+	  uses and respective function is enabled in its registers. To
+	  make use of it, say Y here and ensure that the device tree
+	  lists at least two interrupts for the VT8500 timer device
+
 config NPCM7XX_TIMER
 	bool "NPCM7xx timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..4128c4f19adc2e02b6df2d0aa2dca4659f62fba7 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -22,6 +22,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
+#include <linux/watchdog.h>
+
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
 
@@ -55,6 +57,9 @@
 #define MIN_OSCR_DELTA		16
 
 static void __iomem *regbase;
+static unsigned int sys_timer_ch;	 /* which match register to use
+					  * for the system timer
+					  */
 
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
@@ -81,15 +86,15 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
 
-	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0)
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(sys_timer_ch)
 	       && --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
+	writel(TIMER_INT_EN_MATCH(sys_timer_ch), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
@@ -120,6 +125,40 @@ static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int vt8500_watchdog_start(struct watchdog_device *wdd)
+{
+	u64 cycles = wdd->timeout * VT8500_TIMER_HZ;
+	u64 deadline = clocksource.read(&clocksource) + cycles;
+
+	writel((u32)deadline, regbase + TIMER_MATCH_REG(0));
+	writel(TIMER_WD_EN, regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static int vt8500_watchdog_stop(struct watchdog_device *wdd)
+{
+	writel(0, regbase + TIMER_WATCHDOG_EN_REG);
+	return 0;
+}
+
+static const struct watchdog_ops vt8500_watchdog_ops = {
+	.start			= vt8500_watchdog_start,
+	.stop			= vt8500_watchdog_stop,
+};
+
+static const struct watchdog_info vt8500_watchdog_info = {
+	.identity		= "VIA VT8500 watchdog",
+	.options		= WDIOF_MAGICCLOSE |
+				  WDIOF_KEEPALIVEPING |
+				  WDIOF_SETTIMEOUT,
+};
+
+static struct watchdog_device vt8500_watchdog_device = {
+	.ops			= &vt8500_watchdog_ops,
+	.info			= &vt8500_watchdog_info,
+	.max_hw_heartbeat_ms	= -1UL / (VT8500_TIMER_HZ / 1000),
+};
+
 static int __init vt8500_timer_init(struct device_node *np)
 {
 	int timer_irq, ret;
@@ -131,7 +170,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	timer_irq = irq_of_parse_and_map(np, 0);
+	sys_timer_ch = of_irq_count(np) > 1 ? 1 : 0;
+
+	timer_irq = irq_of_parse_and_map(np, sys_timer_ch);
 	if (!timer_irq) {
 		pr_err("%s: Missing irq description in Device Tree\n",
 								__func__);
@@ -140,7 +181,7 @@ static int __init vt8500_timer_init(struct device_node *np)
 
 	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
 	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
-	writel(~0, regbase + TIMER_MATCH_REG(0));
+	writel(~0, regbase + TIMER_MATCH_REG(sys_timer_ch));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {
@@ -163,6 +204,16 @@ static int __init vt8500_timer_init(struct device_node *np)
 	clockevents_config_and_register(&clockevent, VT8500_TIMER_HZ,
 					MIN_OSCR_DELTA * 2, 0xf0000000);
 
+	if (!IS_ENABLED(CONFIG_VT8500_TIMER_WATCHDOG))
+		return 0;
+
+	if (!sys_timer_ch) {
+		pr_info("%s: Not enabling watchdog: only one irq was given\n",
+			__func__);
+	} else {
+		watchdog_register_device(&vt8500_watchdog_device);
+	}
+
 	return 0;
 }
 

-- 
2.49.0

