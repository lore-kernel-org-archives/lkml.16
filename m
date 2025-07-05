Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BDA1AC88A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731301; cv=none; b=epX0eQR9Tt7M2WRNwXJl4y8IfEecTpQ3cDbqX4gl9OpGuaG1ThlcgT7PLrkT27dfTdpYvC+n27b2SSYjpyO5COpMnhrDOX3dFFrrxKkufHMudjVdmy+lu4tkpHkF9VustOHiloiG1x74VazDaCjcCeO3Uey0JMBlD2bu2SbIrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731301; c=relaxed/simple;
	bh=w2xwY+psk//OZwbddelgesU6on196c+FTOi3IN1ZjdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BbXi4elaq+MDEkmAmFV16bVsPN/gmNAceGYGwTkfEqzrCjMT2geORbZ2FXjyVo3L90mpFWGzE+gtSNr5UMXHY1lb9AHiimLfP9ztS2DGxP74hGw58iuf1sIycM6gEb+sr1/B9ktHEt+d5Y9qA4OSotvVGZvO+fyXJ8GgXO0MS1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tA+IbcHC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tA+IbcHC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso19568535e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731297; x=1752336097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=matpD/z9zLwTTC5HhjXOMGtKe1AMVVauG6MOZr7zlg4=;
        b=tA+IbcHC72WL6jrFRBk2XLL3T93jed5yAnry0viSKi3AA4JhUwYQfEgiloj2ViXGDI
         qNWXr9o0DoRrXCHKraPeBQIlkJGDIqKzeAXkKQlFXHA1VsMMsukx6vF/6Exg/xMtYwro
         E4aiGYwKtHEhkrvEL3NwmMVxkBy/XpqEj19kuXyzGsWAxfh0uGawP4whFjzYJmczSdla
         jSwyDxTvwQREjuoeNW+YeA+pKnyPvPyPaJ6PkNnF0016cAJUUXpIGFjQyk3Bm6WIssoo
         i/36EalasBSqtB+PYs5GxuPyU5fQxCYG/Ug2YV+LZ+yq0IvwSPNFtG+NvG1SkDavyNSW
         /Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731297; x=1752336097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=matpD/z9zLwTTC5HhjXOMGtKe1AMVVauG6MOZr7zlg4=;
        b=Qr9y6H3YK9J90Na9c+WcMluc0rS23kG8T/NpN0eeuU5jQvzNLRw2CUkJ0AkQ7HEuE1
         ndKG3wSPKBplZ1AdG5MV3ndKOqchtkq7HQZTGz/iE4wJz8a9Vbdpj0/5UoGhFBopYJoH
         ky09ZsxeybUexs6jbxE8pAeDQynSGVDxqTTnEKDk2ryyb//YGvKtCc9y1sOvOE0oJsUp
         cxV5tAY6bL0WXSqca97Pf+1dQp8wAS4nfXPGZ+pdg1h/mNR+A2s1NSIPFiDb7fOV861u
         mmXDwDK3fecqBGFditneL/TesUlk1DNaPpTckYOruvkDNxdpL43Ra3Kt1faLX8HBmef9
         Ugdw==
X-Forwarded-Encrypted: i=1; AJvYcCVwg14LxxYPdlzbKPDsbVWTR+ZuyjxH2l1ssDYpAJWKJ+PRYXbMyBLjcaJ+HEE+DDSmCBe/mw624j+06x4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrjhTTIuakqP4YyVwQwb91kQJvYPHhmbcsZotZMlg7XVJbzpgB
	ihaIJvRGPgQ2zmGflxvSY1BQodXjK2O9WQVnaJzeCa+Cz1tsWkXlAlcEoEKkkbAfp3o=
X-Gm-Gg: ASbGncuWQf25Hn7XGqOzVYBGlFAzIGz4bPjXr5ZbUCVuAWIUesD97w76PTGtFY9Vgiw
	HTHJO19xV5qH7ZDaagYcrsIB2TU8rAfGTSL6l+2VpxeZ+yOc4p6rcVuRcswxgIok4e5+1gXuOZ7
	TMrWl+qLpKA6amXffgmeKkm2J28pxrwdL22d7XzlFeoysyiLqeHVTcYvFLD1GKkSCNHfn0ukyoB
	lAdGFyAMTEOdZJfS1rkgjY5idyyj0pmJ9jnmAjwXBPerF1Z2yn5bJhFgz3FLlTiqO2Te1lQEG5L
	ZmyBqogQTjVsAn+yh6+IrB8Y8TSU/csz3/ElZO8Rf54miJauEqBEhsPBdzGi0vxrXdJOyBmTvhh
	kFxswk4ttyJtk
X-Google-Smtp-Source: AGHT+IEE0jhmeJOdrubLgwmLOC7nLIvfeLxYANT770HnC4dxDS77en1P2kCYBgTlcABjSGenIkiaSw==
X-Received: by 2002:a05:6000:20c5:b0:3b1:a735:e6bb with SMTP id ffacd0b85a97d-3b4925845f9mr3896023f8f.4.1751731297296;
        Sat, 05 Jul 2025 09:01:37 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:36 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/20] clocksource/drivers/vf-pit: Replace raw_readl/writel to reald/writel
Date: Sat,  5 Jul 2025 18:01:07 +0200
Message-ID: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses the raw_readl() and raw_writel() functions. Those are
not for MMIO devices. Replace them with readl() and writel()

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clocksource/timer-vf-pit.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 911c92146eca..8041a8f62d1f 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -35,30 +35,30 @@ static unsigned long cycle_per_jiffy;
 
 static inline void pit_timer_enable(void)
 {
-	__raw_writel(PITTCTRL_TEN | PITTCTRL_TIE, clkevt_base + PITTCTRL);
+	writel(PITTCTRL_TEN | PITTCTRL_TIE, clkevt_base + PITTCTRL);
 }
 
 static inline void pit_timer_disable(void)
 {
-	__raw_writel(0, clkevt_base + PITTCTRL);
+	writel(0, clkevt_base + PITTCTRL);
 }
 
 static inline void pit_irq_acknowledge(void)
 {
-	__raw_writel(PITTFLG_TIF, clkevt_base + PITTFLG);
+	writel(PITTFLG_TIF, clkevt_base + PITTFLG);
 }
 
 static u64 notrace pit_read_sched_clock(void)
 {
-	return ~__raw_readl(clksrc_base + PITCVAL);
+	return ~readl(clksrc_base + PITCVAL);
 }
 
 static int __init pit_clocksource_init(unsigned long rate)
 {
 	/* set the max load value and start the clock source counter */
-	__raw_writel(0, clksrc_base + PITTCTRL);
-	__raw_writel(~0UL, clksrc_base + PITLDVAL);
-	__raw_writel(PITTCTRL_TEN, clksrc_base + PITTCTRL);
+	writel(0, clksrc_base + PITTCTRL);
+	writel(~0UL, clksrc_base + PITLDVAL);
+	writel(PITTCTRL_TEN, clksrc_base + PITTCTRL);
 
 	sched_clock_register(pit_read_sched_clock, 32, rate);
 	return clocksource_mmio_init(clksrc_base + PITCVAL, "vf-pit", rate,
@@ -76,7 +76,7 @@ static int pit_set_next_event(unsigned long delta,
 	 * hardware requirement.
 	 */
 	pit_timer_disable();
-	__raw_writel(delta - 1, clkevt_base + PITLDVAL);
+	writel(delta - 1, clkevt_base + PITLDVAL);
 	pit_timer_enable();
 
 	return 0;
@@ -125,8 +125,8 @@ static struct clock_event_device clockevent_pit = {
 
 static int __init pit_clockevent_init(unsigned long rate, int irq)
 {
-	__raw_writel(0, clkevt_base + PITTCTRL);
-	__raw_writel(PITTFLG_TIF, clkevt_base + PITTFLG);
+	writel(0, clkevt_base + PITTCTRL);
+	writel(PITTFLG_TIF, clkevt_base + PITTFLG);
 
 	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
 			   "VF pit timer", &clockevent_pit));
@@ -183,7 +183,7 @@ static int __init pit_timer_init(struct device_node *np)
 	cycle_per_jiffy = clk_rate / (HZ);
 
 	/* enable the pit module */
-	__raw_writel(~PITMCR_MDIS, timer_base + PITMCR);
+	writel(~PITMCR_MDIS, timer_base + PITMCR);
 
 	ret = pit_clocksource_init(clk_rate);
 	if (ret)
-- 
2.43.0

