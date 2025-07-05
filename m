Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE48216E26
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731310; cv=none; b=mRGsYPVrWtefUR1WrrqYdWM0bvzh2dunFGFvej5xqgNcDlHyGF+r+n43g9zJ+pu3eIMon0ivS017MqJjW+8aWmfqSQ+bqcohrhLsA1wuN9+slfXVFayui5hfVIyYG/Cm4Z9w6koWnx5+U8tFyKkPKZRxZnlB74+LrGL6DjFxJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731310; c=relaxed/simple;
	bh=vZl55qaky8RpbCxvsZjG0b4j7P9ccJg4NMdyrbfnhLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT6mWXN1ahdSEc2QHrjXgFAQMwHl6qc7sz+bm3+XiUXV04E/5VY8izXtPFyhogp+by/H4UQ6lhG+8tPyKfWghV+tYZl5IetRP+mwVAFwXN88YwyTxjWa/R1bzb97Hfk2DzybuuwPjw+p1UWPJ8YE/ny35pGv1HiOnDyFx75DDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nb/77V5l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nb/77V5l"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so11595495e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731307; x=1752336107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pHQ+SaoND7s12pleVExrAUxaYMRyNLWiz8neJjCvyI=;
        b=Nb/77V5lw11cO7CEcB9ynJf4WCaVmxS/AyN5UsJmSnQ/8bHwM3KlRdWByittb6UOIJ
         3S4UGKA+FmwyFeALKAD+y337eEAWOQCpw4FZQ8jLFLQm0kc/A3IgOmF97wfNxy/OH7Bt
         K934SUfOm1DXLH+5fq7EsM0DSqCclY+U5CrD4aUCs3YqTHpo/pqwYcYItP37bAXuMLIf
         i2XtA0IBHmlZ8+tChStTYu4bH/K+dZlgqImD1ND4I7+bVKLBmEieV1xRL9gF6zAqAvbm
         Y03xAVm6/7bphoVkYZYAG/yowVDQ6cdkczQXa/7vV96rao2o5sKU0GZos1i9WR7YnvEq
         N3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731307; x=1752336107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pHQ+SaoND7s12pleVExrAUxaYMRyNLWiz8neJjCvyI=;
        b=gl8tNVSb7ExxptT9irB9jL+al1C+EjOXmNX9yULUa3ZE39Oz7v6Qfps9mq33vcpKim
         30LemCM7OXpTWaWgXfVpEgi24bUJDxtxOZ45DuP9q2BRdQFO7pN5STF778aC/a9O4p9a
         qNnoc4XSKclLP2hijc4Of8U7OCPQAdoyNkoqKagqHXFlFdQQj06w3SVOmno0VEIVVa7V
         6iPcN/4ZBan5vztz6A18BKWU68tAqkM4H0ce8TesQbTXeHCDyy5QUjJfEHrXuCPhGWBi
         S12YEFtjWIKNiXN14Xsz3JAGPDeeFiBKVq11sY5abniH6r1lPiPk/opY39+hhmy7J3tj
         dkTA==
X-Forwarded-Encrypted: i=1; AJvYcCUNDvpKwEuG/n0fw3bKCIE5yG1eIo60Xhp0jHfTpMUxsP4IkR6ZISlMj+lCFrA6t9Rl4YzPMwjrvDuA+kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY87eZFzceF/lZwKSqVU86vTEMd6AexeHWKq75NkPyYX1vHHLZ
	1KQXyEQR0rbIi55elUp+7/it6kDvfAq/UcblX5XXcht8RbfnoemWR7JM1HH9AL8/3X2mMpQDvSL
	xXWM/
X-Gm-Gg: ASbGncttPOuGwIx+Ms+fVEQOyPZ8n2G1tcUK23YV4JohXmlCQFr7khMa9RQroBEeVDf
	110rb/aRcreFcWYfftpaHjMiDigaqXTfXJpmn4l9ynJN7catfDtJuwWyIm2T6FcgKiQW68Gd/m1
	qzHd4hqDIdttHUqTnmaOoWXB9YEUmT+ahsc2QjsS0NE5neT7oVOtMKsyY/WY+V8uyl/94EC+K6S
	RImC7CUoQx4SvIz7jB0n2XUOwukyp/hUOZvSKeDvwKP+7A6Ifp0Uqb0Ym/x9oecyJwVlvHxs8Ar
	b5eNS4h+6IV88iOAnd59/U/kX7n7s33PxYG/OzosILXgWpooGIV4g6lW9fAuax3p4zLhx6RET6P
	FBzC/45IXsS9c
X-Google-Smtp-Source: AGHT+IF7QHaaYV2AquRYCLECTtx/6Qoi3UyvhQ4RdHTYFBrUs5y7WY864gV7PvOATiEnTH+KJxtovQ==
X-Received: by 2002:a05:600c:68da:b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-454b1f6a085mr60369065e9.13.1751731306401;
        Sat, 05 Jul 2025 09:01:46 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:46 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/20] clocksource/drivers/vf-pit: Encapsulate the macros
Date: Sat,  5 Jul 2025 18:01:16 +0200
Message-ID: <20250705160129.3688026-10-daniel.lezcano@linaro.org>
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

Pass the base address to the macro, so we can use the macro with
multiple instances of the timer because we deal with different base
address. At the same time, change writes to the register to the
existing corresponding functions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 35 ++++++++++++++++--------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 066d0d2600f4..9c5e06506c26 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -16,18 +16,21 @@
 #define PITMCR		0x00
 #define PIT0_OFFSET	0x100
 #define PIT_CH(n)       (PIT0_OFFSET + 0x10 * (n))
-#define PITLDVAL	0x00
+
 #define PITCVAL		0x04
-#define PITTCTRL	0x08
-#define PITTFLG		0x0c
 
 #define PITMCR_MDIS	BIT(1)
 
-#define PITTCTRL_TEN	BIT(0)
-#define PITTCTRL_TIE	BIT(1)
-#define PITCTRL_CHN	BIT(2)
+#define PITLDVAL(__base)	(__base)
+#define PITTCTRL(__base)	((__base) + 0x08)
+
+
+#define PITTCTRL_TEN			BIT(0)
+#define PITTCTRL_TIE			BIT(1)
+
+#define PITTFLG(__base)	((__base) + 0x0c)
 
-#define PITTFLG_TIF	0x1
+#define PITTFLG_TIF			BIT(0)
 
 struct pit_timer {
 	void __iomem *clksrc_base;
@@ -51,17 +54,17 @@ static inline struct pit_timer *cs_to_pit(struct clocksource *cs)
 
 static inline void pit_timer_enable(struct pit_timer *pit)
 {
-	writel(PITTCTRL_TEN | PITTCTRL_TIE, pit->clkevt_base + PITTCTRL);
+	writel(PITTCTRL_TEN | PITTCTRL_TIE, PITTCTRL(pit->clkevt_base));
 }
 
 static inline void pit_timer_disable(struct pit_timer *pit)
 {
-	writel(0, pit->clkevt_base + PITTCTRL);
+	writel(0, PITTCTRL(pit->clkevt_base));
 }
 
 static inline void pit_irq_acknowledge(struct pit_timer *pit)
 {
-	writel(PITTFLG_TIF, pit->clkevt_base + PITTFLG);
+	writel(PITTFLG_TIF, PITTFLG(pit->clkevt_base));
 }
 
 static u64 notrace pit_read_sched_clock(void)
@@ -92,9 +95,9 @@ static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base
 	pit->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
 	/* set the max load value and start the clock source counter */
-	writel(0, pit->clksrc_base + PITTCTRL);
-	writel(~0, pit->clksrc_base + PITLDVAL);
-	writel(PITTCTRL_TEN, pit->clksrc_base + PITTCTRL);
+	pit_timer_disable(pit);
+	writel(~0, PITLDVAL(pit->clksrc_base));
+	writel(PITTCTRL_TEN, PITTCTRL(pit->clksrc_base));
 
 	clksrc_base = pit->clksrc_base;
 
@@ -115,7 +118,7 @@ static int pit_set_next_event(unsigned long delta, struct clock_event_device *ce
 	 * hardware requirement.
 	 */
 	pit_timer_disable(pit);
-	writel(delta - 1, pit->clkevt_base + PITLDVAL);
+	writel(delta - 1, PITLDVAL(pit->clkevt_base));
 	pit_timer_enable(pit);
 
 	return 0;
@@ -171,9 +174,9 @@ static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
 	pit->clkevt_base = base + PIT_CH(3);
 	pit->cycle_per_jiffy = rate / (HZ);
 
-	writel(0, pit->clkevt_base + PITTCTRL);
+	pit_timer_disable(pit);
 
-	writel(PITTFLG_TIF, pit->clkevt_base + PITTFLG);
+	pit_irq_acknowledge(pit);
 
 	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
 			   "VF pit timer", &pit->ced));
-- 
2.43.0

