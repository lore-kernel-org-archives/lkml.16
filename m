Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8C21CFF6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462049; cv=none; b=c0LvgsCiiXWsYkWEXVAkYUi0SpXs00Tky9VjbQctMVHfglN2tFayiz8EAj8AO+9KM5fgcbubmlySxhArRdbb4j98Q3cQUYUFZrYJSZ8jw3IIpyOrLdmudm6//Ck7qjaNn9xWrdOAMr/UZOtl3IfamxyFtLwyWhzz5wgagRF92UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462049; c=relaxed/simple;
	bh=wY7+t4WrhnKpBLOfnJZyc9U97jJxjRqmIAP9fR9lAG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jnC8TM/XAg6tq6iBRUdNow9MUkdHvn6su/0dMHOg0Ztxt8t0txS6NwnCBVd7h9O4Fz1mgncLRrVS2u4hFhOgPY4Aa20vEu3oN3JKusfgR9vjlsr5j1l3AGHLLS642BIyIt+1o8Nzaa+eTJI3q5sSfIfo/Vd1w+jT/EQJihK8e/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TMTU89ds; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TMTU89ds"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so8572372a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462047; x=1744066847; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNxanwBhZtQZDwmjxM/W4Nk49HxAQJthjw2/nXfZ67g=;
        b=TMTU89dssJH4scHpaZuMNnTioJUQzdhLxS9C/zdUxUjCFT5/leU3IOatJv7I3KIQDq
         4qsKKxTo9HtycvMw/3RzbJkO9f/Wl+stQOgv2VOaRw7HQy5KgfqPeI/pTq/A08MTUxti
         77K8y2iRnLDrxfIBqPfbuUnGKS7AtfRDW4ehbq4kA1apaerKNQKhHW2Bmpayai4SFNMu
         9PunSGEVLnhjsbL2WX9P8gky6jUnVfhXMxIqcOkcJG3Bwdor3KrCrYvBwPCFvu33r/TQ
         z4YqfiBJ0ncTLy4ou3Gn3P1QG3AfYfMBTDDzNQloh6c1qSgNHr/kGYN1NNRyxciUfWrw
         PtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462047; x=1744066847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNxanwBhZtQZDwmjxM/W4Nk49HxAQJthjw2/nXfZ67g=;
        b=wF1kWZj6gDUNlHCCi5UvvNmrDV8Au35ANTd2MBG7CN0+QJ+ANIWEFZX7LDTs11fnoO
         MNuohFxob/Sj9bx2G/g0u+Wv9Owr5R3BJdIPbSRXfst3khanq8ivgmKyuTclLpORMS8e
         jDiYWD3l5Al27zTZ80C9SRUANuYnkT1gQF+rwAi29p9S+DAF02AI5gNRDAT8D0KF8/GE
         nwnjukRkBqzCBlWvtXHNmD3SBrVO6ODPx3pMmbrwP+3+tXRSzTCiVPNr/7kN04WpTEx+
         OUp6TKkMmr4AjJd42VrMxyt6WprVli9wrmDL7pi39Ymr2XnyFWZdJDIVy0VE7fommt+e
         DnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6IPkXEptnuzimTt8YQxRCLV5S1TDQIwllFCvwgfi7/fR3ilztUH/Odj/BxxPXsRlnNtg/RzZoJxhTnGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XgkbZO0NVjuW9ApyL6gC7V4BXM4Mh5x6kl2WYuw2Y6vRrhos
	7Fz5EyMC7/8aOTEWAv/C1gUYZyK5+lxlblIHYnfpB6Hi78CNfHOWawUtQedFQ1aCbCmHwWY7Ly8
	qUsnd026loqCBoUWaonxlaETFPg==
X-Google-Smtp-Source: AGHT+IGJF8B4sxZb6LHBqCORBrMjWxFGFtbVo3ixsesEJYQP3zIzMH571Rnw1V4KCZ3ejHSwrtmuRTWbQo8qDLDw2/U=
X-Received: from pjbqi8.prod.google.com ([2002:a17:90b:2748:b0:301:2a0f:b03d])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3bc8:b0:305:2d68:8d91 with SMTP id 98e67ed59e1d1-3056094bca9mr1574788a91.28.1743462046748;
 Mon, 31 Mar 2025 16:00:46 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:24 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-3-willmcvicker@google.com>
Subject: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"

When using the Exynos MCT as a sched_clock, accessing the timer value
via the MCT register is extremely slow. To improve performance on Arm64
SoCs, use the Arm architected timer instead for timekeeping.

Note, ARM32 SoCs don't have an architectured timer and therefore
will continue to use the MCT timer. Detailed discussion on this topic
can be found at [1].

[1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirantan@chromium.org/

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..05c50f2f7a7e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,12 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+
+	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 #endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 
 	return 0;
 }
-- 
2.49.0.472.ge94155a9ec-goog

