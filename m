Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE29214A64
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731309; cv=none; b=glIYzyvtusak78KishRTfF7oEYUPO7EQh8EH8qvj0ktI9FNBTGc4V02W5n1ppP1HgHBYNuk3MXv3UhY52xKXI182nOrA71pxMnFaRmApBcIiX+hjG24zgoN/HQvIjL5Jbr1ML01tr3lbx7MCPmxKwOGu1wXhfm32HSuGOh1iEMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731309; c=relaxed/simple;
	bh=nsWKX7yXBlKTfW43Ga3c2IphihOG9YrRRqUHkJ2CJ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KU2bd/dYxhspQthvKotw6O+sXhygA5XHYjT3b8knB5Ay1+3hxnfk69c7T51tP3Ar56JtbyFZ1SIaiJjZbX27pTJDIW4ebItmAqh+FgmkSvSazpJsc4qmaS/RK/Y80vtYPi2TTELOxoXmtg9Qe2m8RDZriLO1ycALud4WcdgXvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahjeYddF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahjeYddF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453608ed113so19782765e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731306; x=1752336106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEQCdckMoJILMrxsJxrQhV/cerlhngIx9VU0NgcJ4PA=;
        b=ahjeYddF6lVn1HLbykCPvF3wDphI0haymNT39Atu5G0h24XkJH8DU4Qqp2DW/cFzqk
         CJ0ZKmvCkb19fSgARvritu7FcJKfvHT383dg3eigSnxKOgfgR6kwZmsqPKTEQDjOOLuB
         ta0OMSB4nGZGeQUPrLagwU3I+dwPoizPuc5mKdNLwQbWlO1f9SXasC/0cv6CNT0Rw6tg
         TIIf8wLDV3/La8yGkfDqRASXbHNCSkA0ZQUXYYnmhYmPKJsYwpJnYwViRBUmCTpEHKB9
         1wJG7t+XcEa2FEUTtA2zrrZdaOqoyMIyLcDwGH+8UTRP9tTgANaOKt8/OvYHmIXEeq20
         qpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731306; x=1752336106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEQCdckMoJILMrxsJxrQhV/cerlhngIx9VU0NgcJ4PA=;
        b=xCfFBZSiGU1RVnPWsptfyJOnrDZqoOIN8rQWbALdEXtNb9P63wr0Axac+RJKw+ffek
         1VvsoqDUkHzgp4xZ9LzReTGPDh3wU0X9f1sFBnMdHPuzPFs3zLpRBCNPRf54q+qTq6vW
         MVkVnQ5nEMmZnGfLQh25k4mdHA1CFgK52EInQ9k0bW87wlErWgJ7vwkFKbq3QOrsckh/
         hedvhQgBQHOCHeE5apjaWRoi2dRNGypc/fJWc2dW1ZPEw8Ik8mnljXzrYfa6iO8GPp6I
         gVVmAt8QKbD0gw2hQbBGqCPLSJqLiMVUj4fqvr+cOi388qsGZRQ6QHDQ4gdxvsbZrj+O
         JcWw==
X-Forwarded-Encrypted: i=1; AJvYcCXcCsZLLLZfbYcapnURyJXL3Q6hiOyHp75mqwgqojqW6xcF8KOfu/lEge6yIDg541PbifKBwFvuwv5wYAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNLif17AUJdr5vmBZZ+QO4Nl0WT6kd2asuCPLYUK+Oa3kKVBtZ
	GqHLayt9+a7oQBG0xB3dglZgs8JNZABt0wn3gkWAzO/WrV4jEYjMwlb6P7GOhWO2Heo=
X-Gm-Gg: ASbGnctHNVf00pUPrzfsTT9aQqOBg/fxiAPptrxlelHbida6Dx8SyPCUkkt3M/Y/eWn
	3cNcjhq49v8a3bDU4mJ5MNvcshoErXyWiKh6JAzOKLSt2kPFCRWq776mfMNRkKy9xDszRfkIZq5
	HtEkMTPcLOXGs1PugowzjbWqnTYNEl4mzmt9Dw4oiCOnKJeO+i7Prm5+ZZrvkp00glHh8/UAj8P
	XLdnNl2+fI8mj04kVRcCUe1PibMi58CZ9DmYXFWan0YPybQqubotC/Dx5QCAWWDOvSDK5i8+eSc
	yedrZpePTXrNcUQV9/o5LEcYHfyrKJuxiK9Liqu1G6BKjTUHqbZCQdMheWVDs7eeas0vnmCEpaC
	dxFM26Iao59g0
X-Google-Smtp-Source: AGHT+IEr7IPcPvwmAyKORoZLvgtUzaKCvNkwX4pPCxXcXRD+t0/2nnn3F9D6UTQD+bRVagxjJ6wVMQ==
X-Received: by 2002:a05:600c:1da0:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-454b31105demr59836495e9.27.1751731305474;
        Sat, 05 Jul 2025 09:01:45 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/20] clocksource/drivers/vf-pit: Register the clocksource from the driver
Date: Sat,  5 Jul 2025 18:01:15 +0200
Message-ID: <20250705160129.3688026-9-daniel.lezcano@linaro.org>
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

The function clocksource_mmio_init() uses its own global static
clocksource variable making no possible to have several instances of a
clocksource using this function. In order to support that, let's add
the clocksource structure to the pit structure and use the
clocksource_register_hz() function instead.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index be71c215d641..066d0d2600f4 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -44,6 +44,11 @@ static inline struct pit_timer *ced_to_pit(struct clock_event_device *ced)
 	return container_of(ced, struct pit_timer, ced);
 }
 
+static inline struct pit_timer *cs_to_pit(struct clocksource *cs)
+{
+	return container_of(cs, struct pit_timer, cs);
+}
+
 static inline void pit_timer_enable(struct pit_timer *pit)
 {
 	writel(PITTCTRL_TEN | PITTCTRL_TIE, pit->clkevt_base + PITTCTRL);
@@ -64,6 +69,13 @@ static u64 notrace pit_read_sched_clock(void)
 	return ~readl(clksrc_base + PITCVAL);
 }
 
+static u64 pit_timer_clocksource_read(struct clocksource *cs)
+{
+	struct pit_timer *pit = cs_to_pit(cs);
+
+	return ~(u64)readl(pit->clksrc_base + PITCVAL);
+}
+
 static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base,
 				       unsigned long rate)
 {
@@ -73,6 +85,11 @@ static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base
 	 * for anyone else who needs them.
 	 */
 	pit->clksrc_base = base + PIT_CH(2);
+	pit->cs.name = "vf-pit";
+	pit->cs.rating = 300;
+	pit->cs.read = pit_timer_clocksource_read;
+	pit->cs.mask = CLOCKSOURCE_MASK(32);
+	pit->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
 	/* set the max load value and start the clock source counter */
 	writel(0, pit->clksrc_base + PITTCTRL);
@@ -83,8 +100,7 @@ static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base
 
 	sched_clock_register(pit_read_sched_clock, 32, rate);
 
-	return clocksource_mmio_init(pit->clksrc_base + PITCVAL, "vf-pit", rate,
-				     300, 32, clocksource_mmio_readl_down);
+	return clocksource_register_hz(&pit->cs, rate);
 }
 
 static int pit_set_next_event(unsigned long delta, struct clock_event_device *ced)
-- 
2.43.0

