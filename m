Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9D202F83
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731312; cv=none; b=udrRWcc9DjXf95EpccY0YiAQoUFadEUFHH3srqDGhcTVaYL7Oo7OCPIJmFRPgTYubjIBKWbpLdmT3eEZZeunF3/14Jb1ie4M0fzz3lKtVmfR2KM3bm3izVIy4jaJ4tEz+7NMXYxpQ1An//EJ/RqLyJGqd4elM4nfLHqjrZjG5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731312; c=relaxed/simple;
	bh=pycEubBSnlm4zMFftSIU46btDYW++Wa278KDmks4J8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOmGPsYXou3mv8p2cat6zThGzXI280ab/KOepbsGhSbbOZO4WmKFIDgAXPZTOE8FCBFu3jivsPq7uU21xhYAFWwF4GcyIgY8VAg9kBEGOhBO0dpYsM135NJH/7Pv5sNzPJworVMftOcklirrxgeLs7SFXKwf1TsCBxW7eKTbfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlGT1m9e; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlGT1m9e"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a51481a598so945811f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731309; x=1752336109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9G5Ik6rAGr49pOQia+vvE503dIWwpaIqGXGmqrMEO4=;
        b=NlGT1m9eiNsp+mmS9FZgaBbGpNofsTceCxwM0tL/ufK8LdOmtqj1ZIA82a7f8aEy4Y
         t2gIQu8bEufccSars578jGqBuUXBQL4dHbkeF+n3EmaoggTXwD/RVBqDZ97zhxCrjurA
         hycth0MruRj5DswgAp9bnCJ51l66gTwxNvyYX7/rWDwK0lTWh1ES9WikQmTvw9qzVpP1
         j52sIa672YBcOrzWSWhgFVaK5fg5+crb5fSqBCTeFN00RWFA2aAxURCO8mNsZ3Ibwg8T
         QtGhSOGRxW2GiqQaa5LgvwCW/+kSVI7gyKEs5VOJwWBmwgCR0jZv6YdpZr6K9seBpfrd
         Ba3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731309; x=1752336109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9G5Ik6rAGr49pOQia+vvE503dIWwpaIqGXGmqrMEO4=;
        b=i3w2QfyqmImiFoBBbdg5K8vcmRKzr3lekQKpBUBskziriRxYU5d86Kad0bnrIU0B9P
         2An2fBIEF5OFWYldeMv2Dbc/Xwkke2MTixxJVsSpUm7emp/WSUeTj1bNcoQV5JS4P3ZE
         0HosP+WSZWoO36YD/S1edPypJ1Xa6BKLndPHcwwhj+KEHfS/IUE5MxYTyMjQLw/zCisO
         mORtSloIC5VMYhOrm1Oz/8p1twXJDOMH9LLivwKj2K/8ezi4aqdWHoQuHqQUoI1ztk7P
         u7Y6dxYvQ+FHBCl0TY16m8CgkToPMOiTPAB2KXvxBm5YYJPN+4jjqkxU47kFkzISC4IB
         ZQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/9sXRiY+4B/BH8vr5aXf3msNNyk7tCo42J3V62tDmfEZF5h5gSbmgku1I5y9kjL8lSwTiDTjUttx2Vqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8mnskcKOPUk0vfQ2ykh4DEW8kXeiA4OYsOLg6Lh9XeYFSkr+r
	HP0c7rAQgxm1HsHElkiF+9uoYXh74QVDUvT6GoUMyZLJ91ApRlmB7LMT56qd2GJ7fbwakXJAFIW
	NXLvF
X-Gm-Gg: ASbGnctxTwkSjmIkdv6P1f5WTlC5FtgRA0vbDXeIYAVarmsEQZb1Hj0I7AxYCKvwyY8
	n5BqET9+d3UKsTe5tcgXOiWZdPJB4MMWHPzhEbzbGLuD7+CkDiCqmif4+xuE8VWpmMeYWl+vgTm
	sUediFYzLp+3Hqe8AMtdykO8LcDd7b4hVy3Iuwz8X9JMgWAscTatVE/H7BWDDiM1NzSgRh0XqxA
	6g+chEVoYv7kXnjth3xpprrNelC6/vTYyfZBmcMI6b+5udFj0uz9V/WwLxd5PF5WfLETxf3hxNo
	XZC5UxQlLO/phhfMWmA1JpQyJiky4qi/5VCXtkgt/ZZMKhqBMMD4FyE75RH4XVI1TjAkYOSx35i
	Sq9zKGXzIiC8peMjCdFxuHCE=
X-Google-Smtp-Source: AGHT+IEfa2tislxoh9XJa0UXTG0SGYsAh1OHTDCJeg2/O2i7GHbyOliUiKOPQsbQG3wVmlOhV/EwCw==
X-Received: by 2002:a05:6000:2202:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3b4970207a5mr4278947f8f.24.1751731309005;
        Sat, 05 Jul 2025 09:01:49 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:48 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/20] clocksource/drivers/vf-pit: Encapsulate clocksource enable / disable
Date: Sat,  5 Jul 2025 18:01:19 +0200
Message-ID: <20250705160129.3688026-13-daniel.lezcano@linaro.org>
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

For the sake of lisibility, let's encapsulate the writel calls to
enable and disable the timer into a function with a self-explainatory
name.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 71a17b6aab06..2799cff2a296 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -62,6 +62,16 @@ static inline void pit_timer_disable(struct pit_timer *pit)
 	writel(0, PITTCTRL(pit->clkevt_base));
 }
 
+static inline void pit_clocksource_enable(struct pit_timer *pit)
+{
+	writel(PITTCTRL_TEN, PITTCTRL(pit->clksrc_base));
+}
+
+static inline void pit_clocksource_disable(struct pit_timer *pit)
+{
+	pit_timer_disable(pit);
+}
+
 static inline void pit_irq_acknowledge(struct pit_timer *pit)
 {
 	writel(PITTFLG_TIF, PITTFLG(pit->clkevt_base));
@@ -95,9 +105,9 @@ static int __init pit_clocksource_init(struct pit_timer *pit, const char *name,
 	pit->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
 	/* set the max load value and start the clock source counter */
-	pit_timer_disable(pit);
+	pit_clocksource_disable(pit);
 	writel(~0, PITLDVAL(pit->clksrc_base));
-	writel(PITTCTRL_TEN, PITTCTRL(pit->clksrc_base));
+	pit_clocksource_enable(pit);
 
 	sched_clock_base = pit->clksrc_base + PITCVAL_OFFSET;
 	sched_clock_register(pit_read_sched_clock, 32, rate);
-- 
2.43.0

