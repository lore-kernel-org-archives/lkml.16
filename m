Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903D2192E4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731311; cv=none; b=odSjMXrPReSs6eH9urZLzhwCexSrFlV/Q7VYB0vbMwcaTPg2wVlX1oiPd4nUB0KA7sTWcOINPh2mUV2RMcD1adr5GPKCy7ovHF79n6jGO/+vw5gXwhp7CcbYreCRtr3V7Xhoc6ZqpV+ExoqBc26YEo2a/wZZPHoN3ncFkgOdzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731311; c=relaxed/simple;
	bh=uLmjASnX+lXSNLbsHzfA/tFtcdNVxkDiK4Er8ZRvOS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpyjW3BY1iaUzH9BbtfKfSgj/vJMF3AOjXBSA+cJK+8Ss2jTYqZ033Q/bJB8nofUnTuvh4LrBImWxVOmhXXcAaI+Y8o94hGJOuEEme37rTwdw9barYCfI6evCb153x6hr+3LtKKlmCAsYSj4JWK2MoDqMrpkqbLvOK8+R06ieUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DgmlFZFd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DgmlFZFd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso10568935e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731308; x=1752336108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iRTXuoySUpyv8yKOgWp8j3UzPB2h8co2atI6iCSHNI=;
        b=DgmlFZFdOmZdyzKjBj3sE9+J++dyA4UnKZs/WX97K+4vEnm0r9vdT3o/MOGRlez4Bx
         ngU0KeG4cJ3KmLitc2oDmTGv5ngjfrIKb99VWUQEwfSwOFQH1/BGxlSgXgX69mnS/pjP
         yRTPD+zAxiVATRrIbJjjaOlRVzlHwwtyWJ7ZM0L++78S/GvHrNn+vclflipak5VXRRbe
         IdZU1B1+7wBCMDHE04a8nDZWhKAsSmAxwwa9Wgov2ebPKQlD+GFlVTMFoyYS3cYe1jse
         HrP5KUYMacNRDpCR+0+VY4fiYFBfFzQLtC6J5diUI1EhFSW+9rLPOn4sH6oqeCFP1Xim
         +7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731308; x=1752336108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iRTXuoySUpyv8yKOgWp8j3UzPB2h8co2atI6iCSHNI=;
        b=ANg9E+Rm36KKR49SHqYmFiogDBgdXsMsxKGG0S6S4JDxqGPYnco/khfgDvwYa6/6au
         OjXZSQA54Y0YpurBUQJu2UVkSfTK2C8G+KuZfbxN/A5jslTJRxXDzWmwgz9yG5MliHD1
         Zed2jIZRXcbjswkyBpvqPlTHK2JUXTy9xYIWOPltO5F9Zn3st57UC/s+CchcK9F6646M
         6lDbaHqdCivMT0pwAhQ0RX5aoP6fDcY2Wja5mW0RNWqN97b7EZDHME5nj6oqGkCrFaHZ
         ejx7g4V2TC6a9H0P3oHI4c5oC8fh47rcymlxyjYnoCBjyKyB4CoOof5sLrb5h+uV4i5d
         Vj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUYXSLC/1af29OyUt/IJ1Ba/IJFa0edagTQiLVmgQfk1CvXf4sYdF5JkIfnsOcYbUDAwThmVPW0wEP5uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQoNA6zaNJxyTh9UeWRsAlbLP1YLfPjz9l2VzZRpH9hQul+IOh
	39jDWWgVvc5+zSP1vazNFrMp591tWIDJbcODBEktw6lciidjaz6Y43g2W6Oax9gDHbo=
X-Gm-Gg: ASbGncsTdzyLRaB4oPOv4NKB2bGvpjtG3B3EGqKbYQOTJe74r+k7z6td2Vyl4bpbwZl
	eeZXrTLA37hft/wBXZ0GfTzUKCkulKwoAABw1kWDqQCSn2LXN/iok3Exr83mCLfaKLIHtXZnAEg
	3utkjwt8qpREeRJxINHj40rDRdzx5HKLlcXM4vw54m2PcHWeVTvyQEvw1n6zNbjNGmqbNdMdY+6
	v5mwXAN38piqFbOVrljzxQkvGhDqYnWGjUotXqfUeEy3pfQ7xlacIAP/E2dC8auyZVg8HzVs5hH
	5WDxtdx6Fmog5Sa3UcGikXKFU2SfZ/GmXC7V5Xcj4zToB8D8LG5TbuGs1nw6Zw4qWWmZ5fg7KDJ
	mpuSdNctLAv+S
X-Google-Smtp-Source: AGHT+IG/Y3gyGtioMIaqus+k33HYrhmxb6/14GpeFOVQdX2xDOHasZCYpjPxjk3g6TD8mwVYKbdXhA==
X-Received: by 2002:a05:6000:2508:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3b4970131c3mr4528141f8f.23.1751731308161;
        Sat, 05 Jul 2025 09:01:48 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/20] clocksource/drivers/vf-pit: Use the node name for the interrupt and timer names
Date: Sat,  5 Jul 2025 18:01:18 +0200
Message-ID: <20250705160129.3688026-12-daniel.lezcano@linaro.org>
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

In ordero to differentiate from userspace the pit timer given the
device tree, let's use the node name for the interrupt and the timer
names.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index bd90c607c45e..71a17b6aab06 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -79,8 +79,8 @@ static u64 pit_timer_clocksource_read(struct clocksource *cs)
 	return ~(u64)readl(PITCVAL(pit->clksrc_base));
 }
 
-static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base,
-				       unsigned long rate)
+static int __init pit_clocksource_init(struct pit_timer *pit, const char *name,
+				       void __iomem *base, unsigned long rate)
 {
 	/*
 	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
@@ -88,7 +88,7 @@ static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base
 	 * for anyone else who needs them.
 	 */
 	pit->clksrc_base = base + PIT_CH(2);
-	pit->cs.name = "vf-pit";
+	pit->cs.name = name;
 	pit->cs.rating = 300;
 	pit->cs.read = pit_timer_clocksource_read;
 	pit->cs.mask = CLOCKSOURCE_MASK(32);
@@ -162,8 +162,8 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
-				      unsigned long rate, int irq, int cpu)
+static int __init pit_clockevent_init(struct pit_timer *pit, const char *name,
+				      void __iomem *base, unsigned long rate, int irq, int cpu)
 {
 	/*
 	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
@@ -178,12 +178,12 @@ static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
 	pit_irq_acknowledge(pit);
 
 	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
-			   "VF pit timer", &pit->ced));
+			   name, &pit->ced));
 
 	pit->ced.cpumask = cpumask_of(cpu);
 	pit->ced.irq = irq;
 
-	pit->ced.name = "VF pit timer";
+	pit->ced.name = name;
 	pit->ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	pit->ced.set_state_shutdown = pit_shutdown;
 	pit->ced.set_state_periodic = pit_set_periodic;
@@ -208,6 +208,7 @@ static int __init pit_timer_init(struct device_node *np)
 	struct pit_timer *pit;
 	struct clk *pit_clk;
 	void __iomem *timer_base;
+	const char *name = of_node_full_name(np);
 	unsigned long clk_rate;
 	int irq, ret;
 
@@ -244,11 +245,11 @@ static int __init pit_timer_init(struct device_node *np)
 	/* enable the pit module */
 	writel(~PITMCR_MDIS, timer_base + PITMCR);
 
-	ret = pit_clocksource_init(pit, timer_base, clk_rate);
+	ret = pit_clocksource_init(pit, name, timer_base, clk_rate);
 	if (ret)
 		goto out_disable_unprepare;
 
-	ret = pit_clockevent_init(pit, timer_base, clk_rate, irq, 0);
+	ret = pit_clockevent_init(pit, name, timer_base, clk_rate, irq, 0);
 	if (ret)
 		goto out_pit_clocksource_unregister;
 
-- 
2.43.0

