Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E37218592
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731311; cv=none; b=f9U6mnOFX9/ngdPhHqwlgehVbLaPy/P7I7jNc3pLRiPCM3uY7xBNkUBPgpx4YDHbF9uaO4b6oAN0ZJhwUyNCoyaiGZ/D1TAHxbQZ4lR1JyhREJcJDy4RxLVEBben2NKIOjYagwoo+qT52mMTDbGqcpOqIRz4qiROhD916EYMWSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731311; c=relaxed/simple;
	bh=2yrgJHpFQXntCMToaBUhqFtBafEzlbon+H+Q9INOMUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEGVkB7S/cLqvcxIKiwqZWG9hVAyA/1mSm9Salc1wxCAwZpQh/OjToCggCBVFuy6DF7l2Cb92zyws7OcQo23OfsHiImkI0XMSU9u+pZ2c2cFq+7D/glZEeENQr7E9jXSOcMcbtSbPBLPwLFUYX5vzPdXA5opcs2pA21bvYq+kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LL9SqzvT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LL9SqzvT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so9594035e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731307; x=1752336107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY8pP4xQ1hmkEiu4C5Alatv6YSX0vG6PcTSp262oRbo=;
        b=LL9SqzvTbZ76OPTzg63ijOhOAgnvAghla/UIfUCOF8jyb64NpCXUOLPnCFUGZMhFZC
         v4M4j44eGqmQkmX2Ys2n3PBiqaLaUrPm+Wk/sj8yTBFfHvAbyC4esuKg5ZbegQdQlTL+
         zcwV2EM5jpLflpFicJy6NFeu9DO7vEvpACBkLufWUWGp9ITH3ik4ZZDI6IPCmtgyK1bh
         pIbJYWFAOzQclPtgRyfoHj4yp34m0ENIAhcPTlXwJKx5eQy+tUxIOjoNHyXVNnVM1dXB
         RZxmQXzLT/21PLDMD6Gymxm7VjUh36GKMnJJ88Q5Jq+WD4169ebzXrK3vHmrBLTRRPhq
         eIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731307; x=1752336107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY8pP4xQ1hmkEiu4C5Alatv6YSX0vG6PcTSp262oRbo=;
        b=BhNTgospYpKCt3c5xLwSt1HtfRd6EWUBlGZpu4jrX8nsvycnZFS0UvzDQbWqrMXD+v
         q36mwrM4ROyI78dNr8ud8TnAalNmLH7ZGy4Lpie1Xgzd60N1kgJQdVcnsHW12WY+q3i7
         xtgb86poBRNESTIS14d3sIsi15a1G4HpFIu6lDehA8fps6BhogGqckjfnOmfga7iP87S
         blMattMV8ZDWzCw06N5Xlav4kIoPeTSfEPARpZ/jUv9iozg+4HbJqy/S9n6hehItk8ub
         SQ0H/+MKG/rIaHOG7Va2PuTulR+ETLEtVvH79ooC0Ozrm5K6oriA59M204TUWrVss8Dq
         Y7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVdDRnuxGnTUwGkjLTB6e0MAOA1CQbC4AbDtuM8aGuw6LBuiRDQsFEUCuf2HXOJsVxlOw86mYsbrBU4uE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHdfNoF2GSCrG7t0D5c2PYpnIom0RxCoBoFQljupqx7YTTmxdK
	vcIGHdpNFQjEELWJXNf0tU/SRJkBLHzhKp3uf9QuhWglMDZ+RWGC63BqX/IAsdpkEBk=
X-Gm-Gg: ASbGnctfQGeb53n+Qh51B8q1BSLU/RO0ZRpG+fdwv70ULtVMJPoID/Ln4batSLmL+Zl
	Y6LWHtr7325pYdv39El3SbDiQE7/S7sJCHiSDX2be0YDPRCvUW79A8YU/QVNwwpibVnwSIv/CS5
	fQMC9OTIzWCH0F2aHZW9dt2vLYlQdXvFknTbgRVZf0OZRyzB8A8CdC3T5q7Mjy8i4IbfuZCSacn
	P6Nd7DDWzCdpjUzMX2jKefhw8aMjvRIuLnM2iTU7nLEG/LYS/MRrYHT+CnU7VKNSmyf2uVZKHUF
	WoNECVcUshJ7sL1KHEVWcIOxfG5joxWZnXSAJKqw0rvfI4QnWIUtoxeK0f0kMV3UJWsdo8SPw3E
	uLEaYIgUTO25z
X-Google-Smtp-Source: AGHT+IHcnYSLkm/y8jqSkKc0J4/5epN1ck/Y00Gyc/grMO/zbcSwrwb2S+fnmbPxGh+3jK6al9he3g==
X-Received: by 2002:a5d:584b:0:b0:3a6:d967:380c with SMTP id ffacd0b85a97d-3b4964dee7emr5556514f8f.36.1751731307304;
        Sat, 05 Jul 2025 09:01:47 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:46 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/20] clocksource/drivers/vf-pit: Encapsulate the PTLCVAL macro
Date: Sat,  5 Jul 2025 18:01:17 +0200
Message-ID: <20250705160129.3688026-11-daniel.lezcano@linaro.org>
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

Pass the channel and the base address to the PITLCVAL macro so it is
possible to use multiple instances of the timer with the macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 9c5e06506c26..bd90c607c45e 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -17,13 +17,13 @@
 #define PIT0_OFFSET	0x100
 #define PIT_CH(n)       (PIT0_OFFSET + 0x10 * (n))
 
-#define PITCVAL		0x04
-
 #define PITMCR_MDIS	BIT(1)
 
 #define PITLDVAL(__base)	(__base)
 #define PITTCTRL(__base)	((__base) + 0x08)
 
+#define PITCVAL_OFFSET	0x04
+#define PITCVAL(__base)	((__base) + 0x04)
 
 #define PITTCTRL_TEN			BIT(0)
 #define PITTCTRL_TIE			BIT(1)
@@ -40,7 +40,7 @@ struct pit_timer {
 	struct clocksource cs;
 };
 
-static void __iomem *clksrc_base;
+static void __iomem *sched_clock_base;
 
 static inline struct pit_timer *ced_to_pit(struct clock_event_device *ced)
 {
@@ -69,14 +69,14 @@ static inline void pit_irq_acknowledge(struct pit_timer *pit)
 
 static u64 notrace pit_read_sched_clock(void)
 {
-	return ~readl(clksrc_base + PITCVAL);
+	return ~readl(sched_clock_base);
 }
 
 static u64 pit_timer_clocksource_read(struct clocksource *cs)
 {
 	struct pit_timer *pit = cs_to_pit(cs);
 
-	return ~(u64)readl(pit->clksrc_base + PITCVAL);
+	return ~(u64)readl(PITCVAL(pit->clksrc_base));
 }
 
 static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base,
@@ -99,8 +99,7 @@ static int __init pit_clocksource_init(struct pit_timer *pit, void __iomem *base
 	writel(~0, PITLDVAL(pit->clksrc_base));
 	writel(PITTCTRL_TEN, PITTCTRL(pit->clksrc_base));
 
-	clksrc_base = pit->clksrc_base;
-
+	sched_clock_base = pit->clksrc_base + PITCVAL_OFFSET;
 	sched_clock_register(pit_read_sched_clock, 32, rate);
 
 	return clocksource_register_hz(&pit->cs, rate);
-- 
2.43.0

