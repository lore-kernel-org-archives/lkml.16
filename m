Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E18262FF9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280950; cv=none; b=jbhnmSZBtlgfjJsgYTH/6MI4kLO2Ks+PHrw0Vt/1zdbhoaeHgwFsE6/MrjqN8ReWUm9dn18UIeJo7/Xc3yICiUbQ0jrXjRLH71HLEeR29Y1Hf393E4zTIO8+PKRpP7DWoPmailxRgsKOCLr0lMlcGRE/n0pDf/Qpb2voXSjAouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280950; c=relaxed/simple;
	bh=M0nny4REtUZhhIQOIJ8d/6AAG3bKyfZKLTfcSkQpEvE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EsPeKoDxS9QYR60w43zorgO/wlbtMlRCWBYOI4bV66rtX8d7jj5PcKt3POaktrl7SU20aezBCfEqA/NLYQvLAS7yOc5w3E5gnMg4Qx4ENkBezObkeg7hgZ2eUXk66Yp2ksYwer3oXEBXD+sg3HP2CkLeqMsFmrHNPuRoYBvLuB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nYyjJlFg; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nYyjJlFg"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748764d84feso83559b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280946; x=1750885746; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=nYyjJlFg2rTv8CRUwBOIesBYnt4LrHextH9wSRF1dhWEu2h5mO8qhCqUUIOoRuvHgl
         N0Nd8h/sctu7FkrkmPgVwidEd/fQKEWRbt7dOAIGkiJxC/ZgWGt1i/U+1ahbWEQgAexz
         dZzy07a1waAU95K7wfabNF+RwvaOzvlMdwn6WeKKgkLe85lj9k+lG+dWBjRNKbqelDm4
         cNt4OdaVW2Ems9y8JNm4VFBLthH0egr8PSMTLVLrIv06QoW+8VJ9l+I49MQXF+iJXqI0
         RVEBYnaFMoKz2eapmOVKU/AJe6gIpzqLqfWSAAJg/1B8jUbLzmSBbUr2zGJWWnkKZfsE
         wsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280946; x=1750885746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/s7oEmyKauEAHgwht1yQk0tIZg1WwzoDzyegW5BYz4=;
        b=ncVYXKNBqwvwOwdBU9SHzOx65h9Uos0l45M6EM62+kDCjmU39scusi39rBxfUGsKOq
         fCj3kGxuyp3zZX7LkVXMInn6Kib5k4bh754tsCgVBYH+94Szs9eHu9RTDts8AImYH9JG
         edTqR5DMBfYMTem/36ZqCkyHAL7922lMRwgV5ONZuNyiVn5LOLAUg72Sl7ypkLNqZ69T
         auRvT7TaS+5AH1DONTDfA25vLkDIGHgcmLyBGQetbwGmg9AVqcZQUsEMZZhgH96mB17s
         bEPzi9kbK9b9gB5l6/KTy46IrBZOqQV/53+1Xa1gbVmNYUIVrrlW1ubi1IKB0/WgkKh4
         RO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyeWnKjmVJptwX69EKLdaW2es7s4eRLRi4dXxEAJHnuLPegCTJBEMEardt9zbI7syFLMcIcvECXQbZL1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9JAdZIVY53aj9g+XmisJpkwyUq2X1Pp4X0uDdYCDjH7Bcou6
	30VleyfrXe3cxeFXqlIqxqzvuyAqAXtBl/PydZujvZwf2bmXVR2wzgDfCgtcJbp3n8Qg1DuSQVr
	q+kEzbcaEMm8irp+DIegKn1N8meOKEg==
X-Google-Smtp-Source: AGHT+IE4wAa1uushSqyIX9OxwMbbvMZIhYwycwsJVo+y3iWpXe65Hsxtzoc09JZEPg3XDw2ypEIRNrbYPoxWDj9ezfs=
X-Received: from pfbih12.prod.google.com ([2002:a05:6a00:8c0c:b0:740:b0f1:1ede])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4f88:b0:747:ee09:1fd2 with SMTP id d2e1a72fcca58-7489cfcb1d3mr26921054b3a.12.1750280946665;
 Wed, 18 Jun 2025 14:09:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:40 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-4-willmcvicker@google.com>
Subject: [PATCH 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.50.0.rc2.761.g2dc52ea45b-goog

