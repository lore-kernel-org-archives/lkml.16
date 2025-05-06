Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040281DE3A8;
	Tue,  6 May 2025 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746562026; cv=none; b=cz/QpI/mqRUm1u4JfZdnMtmT4Y6I+26Zm5Z7dYBKt/3+M0RU3BYO7aekWM9+Cha/ACPbj0xyCBwNyd+FCc/Spe2Qwbv2I+kBAx2G44B0R3kFHwPV5Gv+PCK9EvBNA8uzZTLfW3RZG4o/W5Dd53qfmMhXCVaD0106vpWGSat5WMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746562026; c=relaxed/simple;
	bh=rs25g11CJBXBRYyaXrvG97XFkeNvmD+nVlB+j3jsEDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2SZHVZvu0uzsZ2V04GPkVs2p31EX2Glvqk6ZA2/Hlvcf9DCo6Lv6DinZYBu5SkLVjsUVTdS0BLkX0ez18yYv+nF2SANQYCGsWqEAqfEv6IIn8gvO/y4+zQSs9wgY8A9sVRLJuTYRoYvkr93AKQZelm9xWJpBw7lHxozmPeLB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i55kYTMD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i55kYTMD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e4db05fe8so10371625ad.0;
        Tue, 06 May 2025 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562021; x=1747166821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUI8mxa13I1ALNn4kkk2pSY1KU5lEkvMWQI3vBwVdJk=;
        b=i55kYTMDxUtdukE4q/hhOlMj7Oa6C7AT4SIJrZyZFn+fpTVQe7XxVA1RHv0/DhngvD
         It/MADtxxKRbpX0oh/yDYe8qxkRXEL8Bg2SQQaAsink5Y8xTi2ISZOsFu0GaIWmuFfFY
         Hcp5sXllFPzjFvEKJNtS1bxIPbuUZRJZA+v32fafSBVzwAmWe7mjILjbczkVhMr5FZhJ
         hiZOVSxlyzr2rcSgYkyM5kbIp8ExLxe4HgPXzyynnuRxJozlUfysVWnzN6o1uceaxbAy
         t496fD1CM2SyrHYRu4oWPgbBmGxIH91yUtKBp42AMTNEUoV4KWsAtvvCuhQU6XqtXPbU
         YeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562021; x=1747166821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUI8mxa13I1ALNn4kkk2pSY1KU5lEkvMWQI3vBwVdJk=;
        b=CRqvNq7ienFx4OuoTeWYtFpy9wrhNT3StDy/EmshmoyhmI4dQlNkQ9Wyrf39qqhcQZ
         /KobdEJNLDif0gNzf6o1ZPb/oxk0SEHcG9UPWFIXKOxEhCJ/oeUX4mlHuyHrV6pi4dKN
         jCtCL/IUrAnpiHhIkf1Hih60mjpGHVtvk6EwZGcZQSS9srOhFirPo1XaZdlVHK2VdGzy
         E4AOrVL2zpOa5lvfUBOYwqv0WG9mJEjRDjSehMY3slcpJm36oKA7BkDMBmP7z4xu7tTY
         QD4Iq37FHu3jaENgwDNNeFiA4yGQjruDGeclWz1UdvmMmsSIzGI8qX/LOC/gUzeX5yEp
         MfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVds+1kcDvM0Y8/f45IpHHKCpkgkbnu/XDUrDCP8hT0Z5DqBvdezny0TDhBOOCGj2/AnCAfa3QgTglelg6J@vger.kernel.org, AJvYcCXg6DGgqDUVs9SvjMxz783wCZuhjeuMa7C/n2J5kr4sJuY1WZyje7CK6wMNUiCFDLfRsROIPsTYwDf5@vger.kernel.org
X-Gm-Message-State: AOJu0YzjiN2knZXtE9sBxOxKEONBnkbzFu/L7FZmpjotmcZHTmJX6ya4
	7Isri0Sap9BOQLgkK/gIfll9LHDBptza/E/wqJZDoWgMRbGlE5ooSjBshwqlNIE=
X-Gm-Gg: ASbGncv8okDYPd+XsyHdhnck2myqFVzR7sG0pO+xSvulxHqS5+oHN2NUJkE9dm1efkH
	nEPDd79MO6Jf30kL3nPeAfQPbFSHgNg+Fn+s5uFLgF/L8oAVSVESS9eqWrxIIY8ng9AVQTfdTvM
	bLRsmofBJUl4Lk82j861PuSOted5qk31NOIqaBhIhyxk4kWTE7slgQXTBhUunD7AGqenOzdITDs
	PwGIRIa2Kj/jrYYK7n3USmKHZ/BQTNaJYW5in57QRV6lo/lQbi/k7UzxRdmcGM0iKBIpqLHDqwt
	Crvr1O4K8dEhKq1D0r5hyARu3WO0FcWjfq9XzYvx1TAqYeWBf+be
X-Google-Smtp-Source: AGHT+IF5Y/rAQRJKhkkEXMCmbHoTWOuNGZSTyFjbU30GZOxKgVTOMASIzkupAneNrvC8khb4NbQ1jg==
X-Received: by 2002:a17:903:f90:b0:220:ca08:8986 with SMTP id d9443c01a7336-22e5ecade3bmr8339645ad.22.1746562020867;
        Tue, 06 May 2025 13:07:00 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm78378635ad.62.2025.05.06.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:07:00 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 00:06:13 +0400
Subject: [PATCH 2/3] clocksource/drivers/timer-vt8500: Add watchdog
 functionality
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v1-2-6b76f7f340a6@gmail.com>
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746562005; l=5194;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=rs25g11CJBXBRYyaXrvG97XFkeNvmD+nVlB+j3jsEDY=;
 b=oDKDtMHT3iU0PdwOZVXCTa/pmq+GInkIZmIaCIFJ6y84zT/N+41IEs31oxfVlhRznAxwXT2o5
 zpe4U9hDZ0LAi3tK+tw8nvKR/WP7BkBy5fhiRer08v0t8jU0VBOK/5K
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
 drivers/clocksource/Kconfig        |  6 +++-
 drivers/clocksource/timer-vt8500.c | 58 ++++++++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c8525996724fbf9c6e9726dabb478d86513b9..e4f9aade058af1adc279274c6c711658f9f4cd0a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -177,9 +177,13 @@ config TEGRA186_TIMER
 
 config VT8500_TIMER
 	bool "VT8500 timer driver" if COMPILE_TEST
+	depends on ARCH_VT8500 || COMPILE_TEST
 	depends on HAS_IOMEM
+	select WATCHDOG
+	select WATCHDOG_CORE
 	help
-	  Enables support for the VT8500 driver.
+	  Enables support for the timer and watchdog found on
+	  VIA/WonderMedia VT8500 and related SoCs.
 
 config NPCM7XX_TIMER
 	bool "NPCM7xx timer driver" if COMPILE_TEST
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index 9f28f30dcaf83ab4e9c89952175b0d4c75bd6b40..4e44133d455e1e9e016ddb6dfddca422295ab15c 100644
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
@@ -163,6 +204,13 @@ static int __init vt8500_timer_init(struct device_node *np)
 	clockevents_config_and_register(&clockevent, VT8500_TIMER_HZ,
 					MIN_OSCR_DELTA * 2, 0xf0000000);
 
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

