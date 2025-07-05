Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1F209F5A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731305; cv=none; b=fi+5Q9ma26Z9/lgegvKm1NITF4oVl2GAFGPTwFq9nN8dYfTB2jXBX2EQ46uCcpTskOmWzngCpweZSqb+4P6oM4TVLsolT73ZmEJAwM2fm+8xUt4TgsKpxJuBkA7XlU8B0uMvhjutTJoIrJY13g54khxnT/qommUqMNM/A1R758I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731305; c=relaxed/simple;
	bh=rB0RSw9Z+0WSX7+8sve+aEuU7EIPgo2ibCmehHgLJRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PY7reS4iMFQWzpav05w/rs+pAYH3SGy2nHDv1qwESJv+0GrlHq0rOVJQSkd3/V/e1BUPoi939piV/lz0zYsEGP6wDz09QexFwRoSbbq4NuTInRedCMo+BE1b+Pht8aewovyIsBTm5IZ5UUoAuh77kSlDRfUJSVLYc3LTIIW/e+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8vtL8ZC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8vtL8ZC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so933249f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731302; x=1752336102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQHfJyFRiIICm4X1h0CxbHPbRqVpH05B906HjCThtsI=;
        b=E8vtL8ZCnxz88I3eW4YfsOe/jM6xuML0VNUguglJ3zi4KhrFRDSuYkpbRE+gWvqcWk
         VMF+Ab9/06IriPS+NI7JNkQoZoV+lFRndqRGsuSxYWS5i93+tf7bNvwShC1tJ3zKGXOe
         N48kHk0YAZQMifLHfL9W7PbMgx4YtwH7IHZUXDQJ5cFx8iFbgjLAI+P2WUjcVO8Lc/Z0
         /LIvXKjzczWoS7PyzTd3aoWh/KNHVqgmA9uvKGmTButeFmEYgVP6pm7ZUNQgP38tpZl7
         qCqyXwgQHNxpfReyHVxvugpFuEY6Ob/tAypB0LTT9dggjLye2U8BO6YW960Pkcsp4qII
         ASFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731302; x=1752336102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQHfJyFRiIICm4X1h0CxbHPbRqVpH05B906HjCThtsI=;
        b=Io811ILifB9Hkh5pOCTJVNKcG4n2B93pZuY6vSG4vlpUktvHMvMNdsoUFNJHS4THlJ
         zVnhSlvJCYLqe0NJtLP2OOay0gSy3UxnoR3nhTUIs/29QQwF1/FTQcxkoxBNnlB0vtT0
         86ayZ4nfublv53P8lAgwEGjNG9nQbmWVB5J7pmC9KoP7yz9kokv3lpQVKnLpm3lIOqDE
         YxkPaSsR07yWu1Fl0BlCILTMEJiNFcp5A9BaxgokYyj63FwrBX8e3E93lGJi/tI0zZEr
         joDhai0EKE6b6oM0VNU6G8Z+lBOhP+SlSna8YpB+r6XQDX0PnkTEc8MPUTJ2wYHCuN9a
         sRRg==
X-Forwarded-Encrypted: i=1; AJvYcCV+2fMrilfGe+/xlNAfsNQlRufdqDvwFo/1ZwMMGrW+mnpg6FrhP/sLv1WMN26qyZv80csFtr61oFCIWsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2wopr67fDRXdrTI6R4yDzlhWApEPHg6NlJgZ0aiLWdgKZWAZ
	Iy5FwosDSEmTXzuagjxbuQLN7fkVYIHjRgi544GqS530eutsBrbUoPX9YfgcdefObqo=
X-Gm-Gg: ASbGnctKdok/U2t1xPI6v0Wd/pcVp0QvkaSQHCnbKGThlUlfSP1aPXQPjcmW/3dD5UG
	+13ZmNum/da47EsfQ9suBGdCsWYdew2sfNlOTwTpJ6RqWErG8AySG8+xHM7K7ma8U5Ye+vdQjEo
	CdXyn9y5jBckgWKofY5BPSC4/CSBvuv6J48v8umwe5hqW5NbiP5NN8mDrxKWWG+sSIDI3sOZJ/6
	RLVvJJZB3JwWWce5AKMgBeus6Zto0bGC25cg7TMemNoztk3wliVUyxv3hUar+vkbYf/cyaeSRQC
	zZmzSmVt2nqMbB9fS+zBRG8tp0sKAYBHgiUw9ds/YGRJ3ciNoN5jd3f1AHVAfWfcnRwEN74+MmU
	jDunkxewalCh4
X-Google-Smtp-Source: AGHT+IFeaVRSzTNz/VdNMNQsTZ3QWmzX0EE92wM7GCY4yaaZNOw45r4CCh8oDEF2jvcKIKTkrvktKw==
X-Received: by 2002:a05:6000:220f:b0:3a5:7991:ff6 with SMTP id ffacd0b85a97d-3b49a9fea7cmr1909373f8f.1.1751731302034;
        Sat, 05 Jul 2025 09:01:42 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:41 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/20] clocksource/drivers/vf_pit: Encapsulate the initialization of the cycles_per_jiffy
Date: Sat,  5 Jul 2025 18:01:12 +0200
Message-ID: <20250705160129.3688026-6-daniel.lezcano@linaro.org>
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

Move the cycles_per_jiffy initialization to the same place where the
other pit timer fields are initialized.

No functional changes intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 20f637c8e856..3c1ac05626de 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -155,6 +155,7 @@ static int __init pit_clockevent_init(struct pit_timer *pit, void __iomem *base,
 	 * for anyone else who needs them.
 	 */
 	pit->clkevt_base = base + PIT_CH(3);
+	pit->cycle_per_jiffy = rate / (HZ);
 
 	writel(0, pit->clkevt_base + PITTCTRL);
 
@@ -212,7 +213,6 @@ static int __init pit_timer_init(struct device_node *np)
 		return ret;
 
 	clk_rate = clk_get_rate(pit_clk);
-	pit_timer.cycle_per_jiffy = clk_rate / (HZ);
 
 	/* enable the pit module */
 	writel(~PITMCR_MDIS, timer_base + PITMCR);
-- 
2.43.0

