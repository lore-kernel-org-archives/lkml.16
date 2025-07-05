Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004E221275
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731314; cv=none; b=PpPUZIeL3l5U31dfnjX5l1LV9d1wdzeCAo2HG0vdltHSnj9fC9t6MumTRN7Vdes77UhwoAaH3upkV1/iLqUUcg4fEx39TFjswL7ANXYCcRM96hbgGhCHHdwpM7nnBywkmCKLugavx2eVR1YbHaMepOVnw/FBnWzPGlrXUgXnORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731314; c=relaxed/simple;
	bh=Oh4Ofnnw4QF6S+0bQZnheIS7RZBM0UyjZLsFpssMpec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIf3vYYovnnh7/GAlQXpZ/ObBYyMWhQtDFBwDLGBKjypJORbfaW5gRwt9BqienPULhnbLug3F7JVK9he5iY+xfToWE33xHaudeFPi17NQ+rd7GN1owug87yzHoG5gZEGLh4AtgCQnHK8JXOyZYgRRb7XEWp9DYBDmz9iin7MzCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZCgomXh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZCgomXh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a510432236so1224466f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731311; x=1752336111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+fFdRYZ3TAHkcOKpTJMOQSd6U/RR1e2kTAZj7zQhdM=;
        b=MZCgomXh1AaCu5brl79OKyCWv1KBlACbP4Endzktf+6wCP0iFZAwAt59RdY/rlOH5Q
         DdGBFq9jMMpbUHidUDR2lbEgCRCUaqi+la2udS/qst6BS64cGt9fZlnztBSX4odBSXB/
         HBTxdrVkhn5N7ZF2ArLdQK4LD6m7SOD0/v99fPH5q82sBOylsU98CvqJLwCZ56XkW8z7
         BPKoOGVfd5xOV+M6ude/cCKKGMDDI2lc30FVM/5OmGtjEkfjF9p1zGh1gsybXLV9Wjeu
         uqJHuIM/swZN1iYU5HLkOIMbrWwuCRXG61JpGcHFgNaes0B1bw9slpYf+j3sx09pjvZY
         O7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731311; x=1752336111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+fFdRYZ3TAHkcOKpTJMOQSd6U/RR1e2kTAZj7zQhdM=;
        b=V12akaJTAS3wPyqW6+a8ikMFjoDEKhKagBi8SooIKbYsSpaXIJ8NtokWlVdJzZAJfD
         Kh26hFP2BhO3jNhVZN1WzxHB2sOOwSRk5w/On2KGtYlAmzAeJ3zfohJaDUOdagXw6XS3
         hE4EQBFyd9XWRRIoHjpMZP8mk0AaVz4wRZOUq2iPRgeDeaf+hRuj3yw9Cx2uo4N0aTni
         BOrVznh5pjYSrW6kX79WUEBlkm1g9vFvWFatZJpsVnTQze/9lmZc2hsgSSS2p+JS7Fu6
         5C8/Lwik3F9iAqrYLD5gPmYrzaX8nuKbpePBkaoSZ62wWt68f/O3jzKwh+LAGoU14mT/
         TBBg==
X-Forwarded-Encrypted: i=1; AJvYcCURbAalkeTP412nRgaPypAqq8mSnfJOOmjcsONfJeJs7bIonhjysPa/vzLEduBxuiFeNKnbvmP9oX9ngcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEEuPN9IVm57aMdxeKfWax02wufopS2AIUASZrLta6cUoShXfg
	qhfuSta4Qq3PulanMkx2OqQfXf8PZjVnX+53GjpEYaOuFILJ926rDTZCumWETKp54Ns=
X-Gm-Gg: ASbGnctmVH1zpgwVJpY6tIzOqQSTp9jUgzcpP8fMOgYh9bUPWJ/1LC+cQVfYu0+l8ct
	ttok1hzWPo6W+sWcdd5jCUHIpSuHCB+3XjCFhkeWvEX0AB1h0BBUXS1plRi60U0PzvZZt9GNGTY
	+5TylbJ6gyQ9fVNtr2bO9/wqHEpdq3aENuPI5dL1WaZo68mOUN1s71frKcrWds0wsCBQZ2f7XKv
	yhr8KRtiTCdisX889YuCNplyjMpGrCN/eNv8dSE1sBEo3bdLdHb7ZUKUDJc0gbCqujzVh9fhAOW
	BtOOw8AT/evhyzDdvi6z8TTcr8hvuIrX47khbHVrvCLWNfyjucBA8/wZNEM8Fs3RU1tQAJPH5+1
	uGzrH5Qiyl3k/
X-Google-Smtp-Source: AGHT+IFT3IjTvNKdZiC6EV3u4alZJqD0K3CXCuryyg5QovVbb4bIlWrWlGndwXsPEaQx8PTldPanqA==
X-Received: by 2002:a05:6000:653:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3b497212ca8mr6010703f8f.12.1751731310792;
        Sat, 05 Jul 2025 09:01:50 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:50 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/20] clocksource/drivers/vf-pit: Encapsulate set counter function
Date: Sat,  5 Jul 2025 18:01:21 +0200
Message-ID: <20250705160129.3688026-15-daniel.lezcano@linaro.org>
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

Encapsulate the writel() calls to set the counter into a
self-explainatory function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index 043e36b2165d..cd104129e900 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -74,6 +74,11 @@ static inline void pit_timer_disable(struct pit_timer *pit)
 	writel(0, PITTCTRL(pit->clkevt_base));
 }
 
+static inline void pit_timer_set_counter(void __iomem *base, unsigned int cnt)
+{
+	writel(cnt, PITLDVAL(base));
+}
+
 static inline void pit_clocksource_enable(struct pit_timer *pit)
 {
 	writel(PITTCTRL_TEN, PITTCTRL(pit->clksrc_base));
@@ -118,7 +123,7 @@ static int __init pit_clocksource_init(struct pit_timer *pit, const char *name,
 
 	/* set the max load value and start the clock source counter */
 	pit_clocksource_disable(pit);
-	writel(~0, PITLDVAL(pit->clksrc_base));
+	pit_timer_set_counter(pit->clksrc_base, ~0);
 	pit_clocksource_enable(pit);
 
 	sched_clock_base = pit->clksrc_base + PITCVAL_OFFSET;
@@ -139,7 +144,7 @@ static int pit_set_next_event(unsigned long delta, struct clock_event_device *ce
 	 * hardware requirement.
 	 */
 	pit_timer_disable(pit);
-	writel(delta - 1, PITLDVAL(pit->clkevt_base));
+	pit_timer_set_counter(pit->clkevt_base, delta - 1);
 	pit_timer_enable(pit);
 
 	return 0;
-- 
2.43.0

