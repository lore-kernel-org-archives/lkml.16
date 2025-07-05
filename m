Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473F226177
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731316; cv=none; b=cbaImb7RrvEG2JVKdVfSWYxU56XXrIMID75cL/5qOieCXSZfauM25WvFKOat1kqkuZH75m6OJMEhcZ87e0FcAjoWkvWsW/V2Abd5sbC+yEeJr4Daw8y+iKPjSYA4Vulw4thpBj09+hWRssRE0P0LgSITEqqmdixbCppoj4HOzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731316; c=relaxed/simple;
	bh=kGZvQAD50Y8Q4JN1gTnKGg+3OG/VsXPwR8/ZVFMoDVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2r5CWqOEVIaCNLrgItgGz9/mV6E2mmuk/aOtMvR3DCHgXxncviz1TEcQNFX1fmYz2U3CTy4nY3akeQmq1Wc1f5S+MaToFafWr5RGou1d7InRuEPPmfPu/0Smiqyv0HPPTFTmsPf31rn4qffmVZGlhfjYjOQLMz0A22jCEfuOpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dd3TodwH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dd3TodwH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so9594435e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731313; x=1752336113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0u5WGu60gAe4X5wAzG7ytchje6/cn0os1FffAWN7bM=;
        b=Dd3TodwH0jsS365zPu+Dn8QqBuqOgt9aH/J5d1VP1BCdz0t0uMfVRlSFgHpf38LjDe
         DkzOn2pDnuzrEFSHZAuwXF0UFQy2oXwsp5ZRdqxXxEkesVlEzqv9kFMhz3pwm4GUULUh
         8ZxruaMTFpt1wL6eUk2tR1oo4j1FMU/Qp+nXc+1bNRzoi9bpWK/OHyA6ZAzyGvBdsX2o
         LOsk0XVERzAmYPtRUymvjrjhAByoslFd0000YgV9vNG7JCCe/Gi5cJpAKw7z1Pf0XI7R
         Ilobu49fsaXEqeTg1fAsJhsJlZnqLu0K6PQSkVvKniGeJEuY/p7q3iw86yeWp/vXhHRD
         fSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731313; x=1752336113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0u5WGu60gAe4X5wAzG7ytchje6/cn0os1FffAWN7bM=;
        b=vHG3zIL9nD5hCF/9Z1Jf6XFk2l2hifretE22T5DvnVIKWipLy7UZrcdsgJqNtpGEQy
         TTuyGifQEtO2DdERNptk+glp0RdcxpVyTDCaFcmc9VI3fUYQQMxBNyDOsZtjFecTcYl/
         uCGuDn31R0KdXVngUukXQrVUjKB71eisAxSo2qNx5CCPyXyvMYSV7DjkdXjMLONsxjph
         dIdjWfAANrqyNfP9DTBqYhjmWS/tsPII5TntzifwxaV/+kGOGUjen2txvJu8vwxPm7J8
         wUGcgB7zPwEvnR8kYNPK8ftLFJ6pmC2ZdfeKYMKI8QKfOGE8PeqAk0eBEh+BXvHyET9j
         l3/w==
X-Forwarded-Encrypted: i=1; AJvYcCW6s2DhdB+HhhEHuFuZkVT6M8K0pixAyRJARBExRx9ajoI8e9/CqimPQmvzSYaiEm7D9tyUsxULifWJC+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIEqSaBotEOXtwD2UXkAQ+3kdKCAZJLodigbjFMYnSmkJIELs3
	IA9ZLcQG0pn0xJbmpdc9lsLYGlsbIPC3FtcTGmoVaC5DF4O2IRz3zmYZKNkpw63g2Ws=
X-Gm-Gg: ASbGncuT7Hz7B2pWFlv6wCIvq39wo/GNP1Ai8d5ZLI8NyKwz7KHVrS4cUera3b4+bzX
	V8C6RLi35Botf/iFPUEn0Me1S/98zPU/Pm95NzBGZH8S4DJLilvpI9uPuEFRIG8+Ex4T7HP6r7+
	se/qn1UeESqS370p4CX+4IHQ4F6auQhWM6pQ+XxbTq3R3GRFZz6jyEaMorOSgzBB/FSlmEilQ4N
	5oUuGOhR89VjlPzFfS+ESy8MIwjj8VOWhjfX5HR7UJ/qw4Z87iBOkhD00O8y6CRLHycTi6QZhVk
	HXZghdSIFHhWkzzP9FADC6JKRq6IbHo4AyuT3UTUFtjEBVWi2Tcb02B0DbYM70TT2x8uPW8gCAW
	fIA0suRdB+0/4
X-Google-Smtp-Source: AGHT+IFysN609NdB2Ln2zBOnxBwj15O5MGcHoZgmNp3+QaxhaL90pycbix7ua86xmwxiXqywvd/pFw==
X-Received: by 2002:a05:600c:1c98:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-454b948f789mr40945535e9.17.1751731312642;
        Sat, 05 Jul 2025 09:01:52 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:52 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/20] clocksource/drivers/vf-pit: Unify the function name for irq ack
Date: Sat,  5 Jul 2025 18:01:23 +0200
Message-ID: <20250705160129.3688026-17-daniel.lezcano@linaro.org>
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

Most the function are under the form pit_timer_*, let's change the
interrupt acknowledgement function name to have the same format.

No functional changes intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index f4b25d5a5685..ff9d721f5e31 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -81,7 +81,7 @@ static inline void pit_timer_set_counter(void __iomem *base, unsigned int cnt)
 	writel(cnt, PITLDVAL(base));
 }
 
-static inline void pit_irq_acknowledge(struct pit_timer *pit)
+static inline void pit_timer_irqack(struct pit_timer *pit)
 {
 	writel(PITTFLG_TIF, PITTFLG(pit->clkevt_base));
 }
@@ -165,7 +165,7 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 	struct clock_event_device *ced = dev_id;
 	struct pit_timer *pit = ced_to_pit(ced);
 
-	pit_irq_acknowledge(pit);
+	pit_timer_irqack(pit);
 
 	/*
 	 * pit hardware doesn't support oneshot, it will generate an interrupt
@@ -194,7 +194,7 @@ static int __init pit_clockevent_init(struct pit_timer *pit, const char *name,
 
 	pit_timer_disable(pit->clkevt_base);
 
-	pit_irq_acknowledge(pit);
+	pit_timer_irqack(pit);
 
 	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
 			   name, &pit->ced));
-- 
2.43.0

