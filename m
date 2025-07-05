Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1E12045B7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731304; cv=none; b=tE6pZWdINNbZ0reXzc4aSTERzjGVtuevz/PGnXkl8C8B40c6r/CqsnCJ9sjslPHymUHG+kuDsNrXpnBrpcPQyYfPVPmP/A4LROoTQ6uPWtFl4SIDIP97T3wqdKsR6Vlk5lLPsT+LV7lbTT2oHsj6O3/26HkWGRZ1V5oWdAxuey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731304; c=relaxed/simple;
	bh=mnI5OrOewPtdQ/G80YzBo8jhcAlK4vHIg53CHnk5VjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSQIeMh8juJ6zeQt91eDZS4AH+BfaINlDMKiZJvxMF+ETE37Yp9LZGITpoaKXXGHnKwY8IAZz6RyZ60kmlwFnGIGlj4h3xDufLbFSkYg04Ypj68pVmmPsH3jBIWB+5IS7+Y9sGWMguYUATEX+9YmVSmcshqTuhyHWYFRXtFZ+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FRCrVBUu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRCrVBUu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453749af004so8312245e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731301; x=1752336101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osuBUk+4ThRfAG7Ujv4lPHRHswiWAgzdxeBhJMKG9IY=;
        b=FRCrVBUu58738h3Emx4keqXx9rV3Dmkzy22RAWM/hr5rRjR0GaaeC44k9l78zWnEg7
         CiHQ1C+itT5x5L1/l81QtIJkyt4nFNONRb2J/n+e0ad9vXfPoCzs7tvc7M4glDamd+OC
         vLOTmw3XW12d8X0BX8kdGnCOmlDdrhh4sJi4wzhct1XfOSgt2nSyIhh6QbUGf97OMyrc
         5ohi4oy0sDYfCwVFkrT5ud8NcL7xKoplM7N98MihaHZlVe6iLZUvK9O8JNv4C1rKF/lv
         IFyY7iuVNC2Bj4RE6I8xUMttFldF1/tnzWXWYID65FMSLvmrvifdVEV1P1x70cyOtGuk
         vBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731301; x=1752336101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osuBUk+4ThRfAG7Ujv4lPHRHswiWAgzdxeBhJMKG9IY=;
        b=oXuesTBxNEcu0ZJ+qYMoZ/QeFs9O+xBjzGJTf+FO5WzQwo+7HbCUPoPdTpEAql7DTn
         QpZkGUfAhYvqksAI4q8VuuX85HVAxAkoRETWAqaMRs7GXDfjcUwra2jdQvXbZ/Xsjxb8
         IFN7ie40UWpvivPA8J7+h6osyLHp5nG21cdiQKJG6+/46SZmyWqDyx9DErgoTg9PVN/g
         CWdHSpDom9ZvTyKzDVo6rq6XYDm4H+5q/IqelVhx9l9htWnDKWFD08poDsMe7N6lq9Zo
         mg/yqrMEynpYhg8Mmcobmw03ov3bZWnTCGWZdRwzyTQm3l2TcL4vJzmu/46d050HSpwA
         5MVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7TAaQxCTedi4aEayw6P7ce1Ix3iwSQKDI+Ki6ERAREMpuO9yBBAUn9gLlsYgbjNFtVQlHmx/ip9gfvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIxysBeWOBTgu1L+8hBIiRbwFxkbsj15mVFwJ+Y5fBWEe1Fo9U
	BVT3xTmRU3bURKjqpRrNxKx9FHNCqSz6iiwIW0V6wn0FO1zfT99y0urNJhWNM36nADY=
X-Gm-Gg: ASbGncuBEWYHZL68yCw7WQgzpjUM5a4sG+0GvBYCh/E+CGatTdgYLjgdXYfvTAMNdfJ
	JN3slo6nH7adT1Sku8eyRIoT4El6U/GObOMiO/yR6mk39HIyOkoxDNUInhcHWIGJrt5AOt+1qKG
	s/nhHHXT02Kp8WefUDwPUqFfy+EXK0Uf0e3thSYfOoAxBh2Pd5eE4+MaaeuGE5Ejo2A/RH9taUy
	O6iA+zN+GX7tDUdMaaVD4ESMq3TmGYA3XitE07Arww5n+dn6LvHMf4FMhZFvoxhE8vZqXqlZ0u8
	oOijhbnY+HJoiwZgjZHvdVBz5+G+/rQ9QcxLcTr378WMnZ9k8bLzxEmPkeKMOyAqK1++RqoABlx
	qumPrf9WJO0Rz
X-Google-Smtp-Source: AGHT+IHFp1ZRuo2swTFvhI128EMHrHfW78e+zYbmpP8AY6+G7M3+REEL8HWOaYI9iVcJps8HGL/x/g==
X-Received: by 2002:a05:600c:4504:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-454bb81b945mr24666245e9.15.1751731301050;
        Sat, 05 Jul 2025 09:01:41 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/20] clocksource/drivers/vf_pit: Pass the cpu number as parameter
Date: Sat,  5 Jul 2025 18:01:11 +0200
Message-ID: <20250705160129.3688026-5-daniel.lezcano@linaro.org>
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

In order to initialize the timer with a cpumask tied to a cpu, let's
pass it as a parameter instead of hardwiring it in the init function.

No functional changes intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 34edb23194c5..20f637c8e856 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -147,7 +147,7 @@ static irqreturn_t pit_timer_interrupt(int irq, void *dev_id)
 }
 
 static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
-				      unsigned long rate, int irq)
+				      unsigned long rate, int irq, int cpu)
 {
 	/*
 	 * PIT0 and PIT1 can be chained to build a 64-bit timer, so
@@ -163,7 +163,7 @@ static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
 	BUG_ON(request_irq(irq, pit_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
 			   "VF pit timer", &pit->ced));
 
-	pit->ced.cpumask = cpumask_of(0);
+	pit->ced.cpumask = cpumask_of(cpu);
 	pit->ced.irq = irq;
 
 	pit->ced.name = "VF pit timer";
@@ -221,6 +221,6 @@ static int __init pit_timer_init(struct device_node *np)
 	if (ret)
 		return ret;
 
-	return pit_clockevent_init(&pit_timer, timer_base, clk_rate, irq);
+	return pit_clockevent_init(&pit_timer, timer_base, clk_rate, irq, 0);
 }
 TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
-- 
2.43.0

