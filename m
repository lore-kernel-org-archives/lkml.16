Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39D156237
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731304; cv=none; b=qxfykLWCEHE4cUH+G95FO1a0Vf6YTONP/KP96WAc3Hh9SJ0S8zE43UdyyXCh6hRgPbJ0P99WPE/l8Z8M9zCfQo0GgoDGnzIhKyzuh29ZCInbo/Vh70zbnSWgCFYS8y7/VpMPjXKrAdRV9ZpYfDOSWhr8VEN4j9jl0n5QgA5BMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731304; c=relaxed/simple;
	bh=GGQiVl+rH5kPD/h157z5GCTtVmkxMxWoUmPWAyc454M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4a6iSCLqAzgRjkGA0/NXpjgRTR+aXbg0Nf7gzcOvfQou0C1575xKjvWhAvWxgY7dHQ9HFv+Xt1cdfeawn9b9JUX8XLCxkdW6QmfkfQGMIKOanXxZj300hrnBmKZRFFTeJhOl0gaJae1tQ3VXfMWuK++BjyrABG0OIiHVtny9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cx7dkss/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cx7dkss/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso19118755e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731300; x=1752336100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwjVGIh+g4qPwGkdBIAQsGlXVYlDK4DU2asOMNFsxPI=;
        b=Cx7dkss/XD8R6dt1zt+8GSDFvkCupB/1wE/sqY1OTQB+h67DMZFwcH5UhXDvmXqM0J
         ykTaOnUeiedfRAjU99MAqXDdfjUVN0lqEiGPpTjyZTF5ajmNhnXciGNZtprVJbpPY3FD
         eVhlBMTiGmYxsXvwK3cTDoy3VC/1c84C6QCtVL7TQQTCE1Z43qhIYMNZvu0huFV4BFi8
         Rf6PxA9wHXOIKITxJyNPPKq1gnVeUfSm/K2Vbxu/jOws5xbgd3j5+tgAwacX8avxJnh5
         TgeOFVoe5Y3MnS4oG8KdVOawxpC1Ogmo3/Zszs+R4VM6eIk3PBR/cwxsCH8HbunGOApF
         qmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731300; x=1752336100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwjVGIh+g4qPwGkdBIAQsGlXVYlDK4DU2asOMNFsxPI=;
        b=ZB/7ZpHW1SOGdhs/nJcwAc48pfaVTXioQUL/Wb6oXyO3VZTz8uIqeGzoSDWUAFVmSs
         yDanr4vTfMGeIP12U+yzeMJ8Ip1HLcFS6TTF0DoVysuVEwjFxRKdllvus/nROgejbYSz
         JIY7Kbz6AeNzln1mgG+4gGMv8gCFOI5XW/8X9FAzD3nTeEuCu42CZVlFtJtINML8Yhq1
         4vvjNxacmhnVEfka+o3I8kMB4Q2u8BaNWnIJx42RtAYRw4TutuY7UY1UVRg1rr6k0i9/
         QNYTF8Gbny7g7Yb9Bez60NIe4gfnkpkqMTh8Vak1qRS9s3Gp6NRpzq3+Sqfgr9Mu/SfF
         d8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUBOEPc8ZhULeH1oWsM5Z9nJZ6xhcZjaMKoClCfAT5wk+SpvZd4P6WdnAJxkm7WD1MiF5A3muIuvBBcuTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEN71tF560wxaBTDpfbMHCtMaA/72IgxwDc0+0bud82cp7W/W
	FqipYoQ3jDofqsEATJD7CkWzUsWJubT2hkl+nkmVzDcZf8AiVZIOviH//u8B78f7IEJbYYkUR2Y
	MCnjO
X-Gm-Gg: ASbGncuLqcDJqSxLInwyIPdRc/VlQb12f3vbRZn4ZR6UulKCq7GFbPr00QQpdqnXKwE
	nRYGCbYciOCALJCPJSzFQDjqCWLImoqTcL6uLfJ3NZNh7DBaVLSmfaY7TbLvE9omlkZOYuqq9Kh
	5Wl5xZP9TGrWjKIBuWuj+D23+4/byTi87Uet4/hEPYHtQtDllwyygPmWacFk5drlkS8wU6R2NJD
	kval+u6fw81PEeJ5UbT3I13H032hUxykLfSCvF+jZPlYobuudwMAx02/MH2JwBeRJIbd+dc4tkC
	ymTYbDQrV6WxGrMFgkQM1saBjD0oDatjrmWVkwvnq6QBKelU10SV/BZDyOHSxYXMSHFbPUMEYXK
	i/vYx7WEhaONe
X-Google-Smtp-Source: AGHT+IH5fKE19hLemAxCfMP2vTKBXoM4JdSECXowDVMVSAZpN6E7us970Eh5fbe9LJq1Y77ZffD2cg==
X-Received: by 2002:a05:600c:83cc:b0:454:ab87:a0a0 with SMTP id 5b1f17b1804b1-454b4eadc2fmr63849875e9.17.1751731300110;
        Sat, 05 Jul 2025 09:01:40 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/20] clocksource/drivers/vf_pit: Rework the base address usage
Date: Sat,  5 Jul 2025 18:01:10 +0200
Message-ID: <20250705160129.3688026-4-daniel.lezcano@linaro.org>
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

This change passes the base address to the clockevent and clocksource
initialization functions in order to use different base address in the
next changes.

No functional changes intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 37 +++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 581b46e7b111..34edb23194c5 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -66,16 +66,27 @@ static u64 notrace pit_read_sched_clock(void)
 	return ~readl(clksrc_base + PITCVAL);
 }
 
-static int __init pit_clocksource_init(struct pit_timer *pit, unsigned long rate)
+static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base,
+				       unsigned long rate)
 {
+	/*
+	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
+	 * choose PIT2 as clocksource and leave PIT0 and PIT1 unused
+	 * for anyone else who needs them.
+	 */
+	pit->clksrc_base = base + PIT_CH(2);
+
 	/* set the max load value and start the clock source counter */
 	writel(0, pit->clksrc_base + PITTCTRL);
 	writel(~0, pit->clksrc_base + PITLDVAL);
 	writel(PITTCTRL_TEN, pit->clksrc_base + PITTCTRL);
 
+	clksrc_base = pit->clksrc_base;
+
 	sched_clock_register(pit_read_sched_clock, 32, rate);
+
 	return clocksource_mmio_init(pit->clksrc_base + PITCVAL, "vf-pit", rate,
-			300, 32, clocksource_mmio_readl_down);
+				     300, 32, clocksource_mmio_readl_down);
 }
 
 static int pit_set_next_event(unsigned long delta, struct clock_event_device *ced)
@@ -135,8 +146,16 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init pit_clockevent_init(struct pit_timer *pit, unsigned long rate, int irq)
+static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
+				      unsigned long rate, int irq)
 {
+	/*
+	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
+	 * choose PIT3 as clockevent and leave PIT0 and PIT1 unused
+	 * for anyone else who needs them.
+	 */
+	pit->clkevt_base = base + PIT_CH(3);
+
 	writel(0, pit->clkevt_base + PITTCTRL);
 
 	writel(PITTFLG_TIF, pit->clkevt_base + PITTFLG);
@@ -180,14 +199,6 @@ static int __init pit_timer_init(struct device_node *np)
 		return -ENXIO;
 	}
 
-	/*
-	 * PIT0 and PIT1 can be chained to build a 64-bit timer,
-	 * so choose PIT2 as clocksource, PIT3 as clockevent device,
-	 * and leave PIT0 and PIT1 unused for anyone else who needs them.
-	 */
-	pit_timer.clksrc_base = timer_base + PIT_CH(2);
-	pit_timer.clkevt_base = timer_base + PIT_CH(3);
-
 	irq = irq_of_parse_and_map(np, 0);
 	if (irq <= 0)
 		return -EINVAL;
@@ -206,10 +217,10 @@ static int __init pit_timer_init(struct device_node *np)
 	/* enable the pit module */
 	writel(~PITMCR_MDIS, timer_base + PITMCR);
 
-	ret = pit_clocksource_init(&pit_timer, clk_rate);
+	ret = pit_clocksource_init(&pit_timer, timer_base, clk_rate);
 	if (ret)
 		return ret;
 
-	return pit_clockevent_init(&pit_timer, clk_rate, irq);
+	return pit_clockevent_init(&pit_timer, timer_base, clk_rate, irq);
 }
 TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
-- 
2.43.0

