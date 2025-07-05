Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307B224244
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731315; cv=none; b=DxEn1g8YmtQblyVl7ksySIV+jpr8KRUl4XIP4lzuG7SunR7QIfpUdFV+1RSSD0q/UravzY9TCIm/jPfSgB5nZ+Jmy9s/3V90TX7FeUX4vhnAmzLiBTWwmSrH4T6vSum3x44hdFmWbYgZB450Z4edTFPepb3GkvDxNOAxMIjCNeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731315; c=relaxed/simple;
	bh=pObI2EQG5LiDbmAHSfrMSs3BP/z6H4FpuOeuE1RumSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkvUJnTVgJTqa+WtsI23jCqveP5W38brQF+qwBqixT0NT2hU98RMcrmLfZHb0Sywx8ugPhPJ0Q0lVTXsNJneKGk9OWSad6+yAVEeopfJDhMlz3bVO2lM/JJnZC9PfTLLw8T+zTcG7c5g4d+kc7830GQAZpK8HyGLLZkIgMSCQO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FC6AFutA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FC6AFutA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso960210f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731312; x=1752336112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNJoN4bYMaPBOO9S8IIDZYxxEVqr6kUjQKFS1akjlOY=;
        b=FC6AFutAsgFtbpouyFYo7TR4WxpGs9si0G0fJTfFJXjAY7sOX4vHXzvizjn3ob91Cf
         tuI2aV9VEADBSziRG28CQfSMkwPDkW6F3/8cSp6CsyqYg+P/GAFLigupgR3apYfNipcC
         xqAKnybgScERw4zUQGqSnktaR3u/RBzLD46LyCb9o4FK3fOSMEkxETvPfcc6myL80VOW
         m8bv+J6F6XRdz+Uclkzcbr6YysCs2NPLRxhMsse0hFj6sN/7ZuXT76MsFuXje0ppKYF8
         v4ySEQMy5f6dh/T6+1KME5WR6p6jbn8LChK9OYgVeBzKrV44n5OaY1Tjty7kFtVhegyh
         xg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731312; x=1752336112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNJoN4bYMaPBOO9S8IIDZYxxEVqr6kUjQKFS1akjlOY=;
        b=wNcJYUXRbaxmSDFU1oIsWAODrRERpXTwotl+rKbeCKQPIhYYzPGbzYRcVk+TISSnJP
         UTHtcGmZlks5xQ4+1C2Sqefs1aWj/B285fBP1jaiFDry8COYPby6EsX56GfW9puK1uyS
         JG728xWJwAETVbLbXb0dENf1xJP3lSW32rHje71afN43hvHyd/VfOrXnGowmPZ/SoxXL
         DmwTtABFXpyXuZVpWHJzj33X35pHE5J4jmjwlRwHAtOv3DAqIRScmOY8qJGhNV9xb1j9
         80PjFoNuul8vWrfgDPrfKES03Trc3TLhS/uBB4UypwJkiQBKTQUA81+mBkOfYcAUYlya
         g/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg9ty6sSNWScj9HauW4u6SDrLadkjvvUU3Ev4XPoCg4ZD04WmgBK1QJq0p700PQvgwFNON3eEIxTFtsbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybeHaRThysD3gytCr3NEtLHkDzuHfgm0zjPTfzMgPNHD1UdGE9
	OBXDWh6ikynqgOj8JqqSGImIVjnx5ST+wzQB/9ZWQrDPxxl/IAVwNsZxyrvbPF534ZA=
X-Gm-Gg: ASbGncvKdiZTGHyS2koiNO3uz3MzynD7z+S+kQc8O26kqYvYaJzrMmTnZhVFz917L2e
	Pt8HD0uHgzesu7TXj5c2zXK4wWqG/ycfw9+ZEnx64zkf2kbZ08gjuPny354cFN2+14uafHUnavo
	whg/91OlaJ9ni6HA5NoH+DyxAsM1d5UXghMEL24dQqUpiIVjjFKrqekPwezb8FkpVp3F2QEeXZp
	Bw5RoKHoEzG8lzz7ON8UYYM4x9LJZAfiWKSrPjzxp81wIT8QPAvuxhOo3TnuPg1Wn0DKAR6lKBE
	d04MurcaoTgFEivFDDvEpElcZj7R9Q3RPRvOF63hwkoOLjwiQ2F83tvF9fSIcQiYno1H5sjCBtd
	wCOmUgz9GZAGh
X-Google-Smtp-Source: AGHT+IE7Uh/ctiDa+ulLGb+GCu71uBWVfMQX5bRy0jUZrSQ7uh1PNGs4tNC7dFfLUI9ZdEdrV2Z38A==
X-Received: by 2002:a05:6000:22ca:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3b49aa1f0f2mr1585210f8f.19.1751731311732;
        Sat, 05 Jul 2025 09:01:51 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:51 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/20] clocksource/drivers/vf-pit: Consolidate calls to pit_*_disable/enable
Date: Sat,  5 Jul 2025 18:01:22 +0200
Message-ID: <20250705160129.3688026-16-daniel.lezcano@linaro.org>
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

The difference between the pit_clocksource_enable() and
pit_clocksource_disable() is only setting the TIF flag for the
clockevent. Let's group them and pass the TIF flag parameter to the
function so we save some lines of code. But as the base address is
different regarding if it is a clocksource or a clockevent, we pass
the base address in parameter instead of the struct pit_timer.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 34 ++++++++++++------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index cd104129e900..f4b25d5a5685 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -64,14 +64,16 @@ static inline void pit_module_disable(void __iomem *base)
 	writel(PITMCR_MDIS, PITMCR(base));
 }
 
-static inline void pit_timer_enable(struct pit_timer *pit)
+static inline void pit_timer_enable(void __iomem *base, bool tie)
 {
-	writel(PITTCTRL_TEN | PITTCTRL_TIE, PITTCTRL(pit->clkevt_base));
+	int val = PITTCTRL_TEN | (tie ? PITTCTRL_TIE : 0);
+
+	writel(val, PITTCTRL(base));
 }
 
-static inline void pit_timer_disable(struct pit_timer *pit)
+static inline void pit_timer_disable(void __iomem *base)
 {
-	writel(0, PITTCTRL(pit->clkevt_base));
+	writel(0, PITTCTRL(base));
 }
 
 static inline void pit_timer_set_counter(void __iomem *base, unsigned int cnt)
@@ -79,16 +81,6 @@ static inline void pit_timer_set_counter(void __iomem *base, unsigned int cnt)
 	writel(cnt, PITLDVAL(base));
 }
 
-static inline void pit_clocksource_enable(struct pit_timer *pit)
-{
-	writel(PITTCTRL_TEN, PITTCTRL(pit->clksrc_base));
-}
-
-static inline void pit_clocksource_disable(struct pit_timer *pit)
-{
-	pit_timer_disable(pit);
-}
-
 static inline void pit_irq_acknowledge(struct pit_timer *pit)
 {
 	writel(PITTFLG_TIF, PITTFLG(pit->clkevt_base));
@@ -122,9 +114,9 @@ static int __init pit_clocksource_init(struct pit_timer *pit, const char *name,
 	pit->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
 	/* set the max load value and start the clock source counter */
-	pit_clocksource_disable(pit);
+	pit_timer_disable(pit->clksrc_base);
 	pit_timer_set_counter(pit->clksrc_base, ~0);
-	pit_clocksource_enable(pit);
+	pit_timer_enable(pit->clksrc_base, 0);
 
 	sched_clock_base = pit->clksrc_base + PITCVAL_OFFSET;
 	sched_clock_register(pit_read_sched_clock, 32, rate);
@@ -143,9 +135,9 @@ static int pit_set_next_event(unsigned long delta, struct clock_event_device *ce
 	 * and the PITLAVAL should be set to delta minus one according to pit
 	 * hardware requirement.
 	 */
-	pit_timer_disable(pit);
+	pit_timer_disable(pit->clkevt_base);
 	pit_timer_set_counter(pit->clkevt_base, delta - 1);
-	pit_timer_enable(pit);
+	pit_timer_enable(pit->clkevt_base, true);
 
 	return 0;
 }
@@ -154,7 +146,7 @@ static int pit_shutdown(struct clock_event_device *ced)
 {
 	struct pit_timer *pit = ced_to_pit(ced);
 
-	pit_timer_disable(pit);
+	pit_timer_disable(pit->clkevt_base);
 
 	return 0;
 }
@@ -182,7 +174,7 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 	 * to stop the counter loop in ONESHOT mode.
 	 */
 	if (likely(clockevent_state_oneshot(ced)))
-		pit_timer_disable(pit);
+		pit_timer_disable(pit->clkevt_base);
 
 	ced->event_handler(ced);
 
@@ -200,7 +192,7 @@ static int __init pit_clockevent_init(struct pit_timer *pit, const char *name,
 	pit->clkevt_base = base + PIT_CH(3);
 	pit->cycle_per_jiffy = rate / (HZ);
 
-	pit_timer_disable(pit);
+	pit_timer_disable(pit->clkevt_base);
 
 	pit_irq_acknowledge(pit);
 
-- 
2.43.0

