Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD3022D9E6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877544; cv=none; b=C2+Z4Mgo+wFeBNKiOfmz/JvNSeTNgP0Bk9mUASc/kxZIFZ0fEPuhcpPFUeqPAJCDy7lrsbYsLJTrrQ1HIyp+Q4+bVcy1V6GZOg/mjSz9LnkerQ1h6u4wkGH8p4a+Hggf12qdSYo1XVXJfq6pnjjBHWq6zAMzyko+g/QSqA+yV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877544; c=relaxed/simple;
	bh=fAaZ3L9vEbtazUSHdMUtxxloxioTW1ggL5LaUshczj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8bwZPtjgwwTrttj3uCcaop6zbrai4VNVy2dy+hMXls8e7qNm/ReXYVGqANnqonnK5kPOgiRduqqQt+6XUddLMFV7TLrWBbJUEKhskD7c9UjIsvM+eMVXYKxGYdZizXpn/4jSbpgarLvdr1gIYvxHjMCtA12wMdEj/7vIyouRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F91URjb/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F91URjb/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ce671a08so28506605e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877541; x=1749482341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=F91URjb/WGSoAqAcBC8zFjUfDp1lz/YszN3KYCr6bGO0Tp8Rga+s+biUpF0AE/DMqQ
         7KAny3x/t60b65aHrC1KflTYMQG6Dh+ECjxWv4dNSQDeuz6WRSdEoFbsWdgY8BuASXrm
         FrSg82I2BQyGnCx6i29qgDNZA/9AquaSKRlR4AHcNndnd3iasRf3G49QgWunnFqN63h0
         q8RA0zbRyPQPtau6MCMrSxJ2znqryoKBFe5n8y1aPh5WN8Q6QH5WGfNcHdZoZYJMDUS7
         CAcMEVGskAO3EnDB1GEtLzbGMlHGH3BRfhPWxuXtEaLgork/ASe0y1fUIg9ndRzzbvit
         Vwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877541; x=1749482341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2bXZElBrRwneMKewEI3S9wHUbgph+s2MD8uEMc202U=;
        b=n2ha29ImNUpRwCYV++xjK6IBdptdlP0D5Wbd1uE9ApplNR91WMLZfkbF1jmW6XeSJa
         9kcO48M/OEcARgSdpQvA8P+U7sUlF6E9qEiB5GJHNpmegWQ0vfSKTDzk3jZkS0xzogqC
         XSXI5eMdSOIsp3W3FwXPYskLhP8XGWZ4Fp/aWW5tfkjMoLfGqExuA2iroVUj7w4jp2X1
         BX4njKvGKfymEkOs1ag+0FvaEX6xvJotdURAZQqWZAKyXfLlgIhcMXfBcg+RCkNf7b1g
         wcZT/D0QHT3ahtJ1I1e+hsNVJbtZMaYBeyOs6tj5aCX1F2jMpFzulGBy/IiVOR2twazg
         rhvw==
X-Forwarded-Encrypted: i=1; AJvYcCXLyrU+rsAqtgnwVLT/XUb/TvpcTyccZPpKm8c8Nb5d9xPU/PE8TCufDfhfDBqo5anqQ74a33s+NoLdYuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0fFTDXlmqcq/FZ43jUd4s+P9CPGYfdoyI0kkyYv0tc7+jhHS
	i5wA6UHtxIn/DykKrrwKQPRbrW4nf68vAzyaZOPeioIxR94m9WQMTpQdTsPEfb6T60w=
X-Gm-Gg: ASbGncujQzHDQue90oFrxpZLODVJtols1/jFpxz7PodrSelYBTTDnqDVGDKupICLuXl
	0k/DC7DEGm+RxsYRCpzE0v35ULSzw0SHO5eQN19+LlsCLOmaCHTGRMKw6MmZQhuFILE+JP2x3Ww
	tK4Oebf/OyBLUL5iHpBkHToL0jcvUCly2Xt8ZQmIieX4LZ9U4D2ZUkaIyNL6ZDy7XZHQIkWbDMr
	0cdDZXLGdZoFbSK/vPi9HvzsnlTM4XfkIOGa19JQqmLiZinss6cOkxOrLbCrU844ymtO0aS3T16
	ChsceLL95VHltSG6JGbtT6Xp9LXzD3RjZfHwhTGFzwPjChg3WNDY94cpXQ1lViFMTsfQi85B/I2
	Y7KOZc0vE0QvS
X-Google-Smtp-Source: AGHT+IGm8o6nqRRjiZlM8OEtcH7Giz5iqVqvOKIqNhMfKW6+DVKKTld7vkKIltD7iNqNITzYzwGGxA==
X-Received: by 2002:a5d:5c84:0:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3a4fe3a8214mr6931603f8f.59.1748877541180;
        Mon, 02 Jun 2025 08:19:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Date: Mon,  2 Jun 2025 17:18:47 +0200
Message-ID: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-sun5i.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 6b48a9006444..f827d3f98f60 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 	cs->clksrc.read = sun5i_clksrc_read;
 	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
 	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	cs->clksrc.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&cs->clksrc, rate);
 	if (ret) {
@@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 	ce->clkevt.rating = 340;
 	ce->clkevt.irq = irq;
 	ce->clkevt.cpumask = cpu_possible_mask;
+	ce->clkevt.owner = THIS_MODULE;
 
 	/* Enable timer0 interrupt */
 	val = readl(base + TIMER_IRQ_EN_REG);
-- 
2.43.0

