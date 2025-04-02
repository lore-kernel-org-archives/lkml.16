Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F61F7098
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636891; cv=none; b=MnxL7tN2KT/mAqC0Pw4ueSTNu9uJQZO9sWvVRhJp5LYqph+MMTpxihMgw7cZHb06vd4/KW0glL4bKXZNLbIb4aWphKfpe+L2AT02+vmxwn9W7sn5J4WFdT/frSV07sAy3PY91jvnRISIX36lT8BsZTJBUoSRtboHDWFQn/c4V1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636891; c=relaxed/simple;
	bh=ybEIMl+QUKadqWELK4Gmy+9k+si2Cgc18MkjtCiGmP8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZuWFF9udR2fD04mkLTHA/Hfz5qw14zR++ehtT0vgBhMnuL6Br6t5tGMBT8KytvtnjB4iXH+ll1s+YH+vBWG222TlEnwDrWMqzt1saATxZCRak7fo5hWrjFOvwXnFOTGheC28ahOnoMfsyHvHeI1XkH7wQretIO7+1+q0fSqn4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=21th/tS6; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="21th/tS6"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7377139d8b1so234398b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636889; x=1744241689; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=igB5EzbZ4UddujnhN5pTR462QEE2CggaY13KiAdG+kI=;
        b=21th/tS644a9Q/tsOdV+XBf+z2xo87d+KHLOe0IYRo9GJdjZSDQHdPNKM6A6MWddgY
         ITpdDLu9Sey5x4Oy4/AXyg1X+CY5fwGKvbEEZwY6BVjBgHw0ohNvRZ7aNyeN3qWM0p4g
         FeGW7yuo/h4k/uSGBS0aM4lcs/SvewZvLyHRxHjWPZxnV4qP6zJKgUDEetN9X5Ldb74E
         +lvsqOWQgW1U+Hnk4wp3Hrz7bJ+EKNurT1o6gQk/ZXXwNwCR9XQ4jw5Vp6gWNaEvXLzo
         idj8gEIRDEqLio2twqU+mntQzFwDusnBkerT/WsAaKkRkdENnr8Zlcx8YioaeyNX51yO
         RUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636889; x=1744241689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igB5EzbZ4UddujnhN5pTR462QEE2CggaY13KiAdG+kI=;
        b=uqbf9txtNrs4qqoQ6RwSnQ1faB1T2eqdSyKB3Q5sOAj1lSKrxGoxG7EN54jiIBYxLM
         maV5lSQHKGkFgdXGk/5UJYOE0wzjPUbIPE+Twj9SZ2LPw7fTyJN+GJRN2qSzYYvXBXaD
         t9DZ+BKloGc/PosjeyGVa/RVSDYkgt9p++RX9q/3CyJkQ9kEypJVNXOyRxGvgzwzwaPC
         opI3w65TELRHblBRj9h6BNi37R+lG0hVm4lw+RYqjDkNUvoY+gAGx02ctWyJHQmGG6KN
         avj+XvXsWyrmUUy21HG8Ghh4dPtKqpsM/GUBlHbYP1wSqFhXM2TDCd5/yzeqCV7kkxN2
         QZKA==
X-Forwarded-Encrypted: i=1; AJvYcCUFwQlXZurEjMwPLyTkhAnA6PdqRo67vA8U8cTd5Aq2pBNFe8Fa04PRSLmfbxKE4wmf7+pGT+6jVujNH0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfOmJZuvG1lNG22enN2oLCYqH4h9tRuvU+LJPbTEkatU5rQYx
	cnk3EkdTVGiFSeOFYHTTxdiAWSPwFoaf9iZMrqXlhF00LG1hsLfgfuvfVGjyAqegF7KGNwzyo1P
	T/Efgj8hg4/bjTKur5b9mqaLJAQ==
X-Google-Smtp-Source: AGHT+IHliF72RhoVlooK9L+c1Y4iuJGgr9wHIupvklzWWd4gEqQfjkuZNyDHtoJev6b5CUsHoC8Btppiv9aU79bLH+M=
X-Received: from pggj2.prod.google.com ([2002:a63:cf02:0:b0:af2:3436:98b5])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2d28:b0:1f5:93b1:6a58 with SMTP id adf61e73a8af0-2009f5b912cmr30610075637.8.1743636888966;
 Wed, 02 Apr 2025 16:34:48 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:54 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-4-willmcvicker@google.com>
Subject: [PATCH v2 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..a5ef7d64b1c2 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.49.0.472.ge94155a9ec-goog

