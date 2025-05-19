Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED6B274FD0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653051; cv=none; b=Ms/Blmodw6jZIy5/gDJPGifeev41f3siMQHGuGQs3T7PsIzsys597L+BBvuf9Mi2XmH2C1NkXaOhOKgW/OvyOIMnXtae/q81ZsnyBuwfHGRPwFrdq/bKWUbWhiy+M4J2SB4R5uS9wythkZv5+x3ZGVeojeWS1MKMiGcVlmuGDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653051; c=relaxed/simple;
	bh=+MErdg+V0LPrf8hytuQxFuXkZLlvEoQ0xdUCI+ffAyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ru0cwjPUJVPvaSbeI7PVxq+BQNCYdBnTVCc+NyJaAVCEx82ViJ8lM9ARH8rtJq8C5ag3XThyJ5RYNhofCEX6ITJUsctkXmm1qW4MLHXO7OHf/EQu3Gt1x2PbqFYQFv8FikQ4YR9yExi9oLsfNBiMCkJPpyNs7KFGul3nj5OZe80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dqDJ1rw2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dqDJ1rw2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so52660185e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653048; x=1748257848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQesA0mAGw3TzpZuibjNO/Bi3DH12rgsDcmFFieVgcU=;
        b=dqDJ1rw2VVdLnJRixwKhrIi3DNSfH99kcqHvuzaYMt3MAgM9/xGj6DzuzUwqIjQCSK
         vYm9yzscjZdXpH6zUMuRnbUS8gaRajprEWvmTeJTI4jmOBANENPeE7MXGaOPdztNa+A/
         37MEK4EbIkTQ1/gr/Z7ol4/5JP7JVOunQihpTB61l67B3AMPVZZHG15O1m31IpgxdmNv
         q9huOuRDebNXf1E1k9Vtm+nPppUMdZDpPI5iv4Winljw9bqFMxFPeaJs19lhOisdUDhM
         2gHKQdVI9C18K/Pw6ut17lzd3PFL29U3K28P9ZilGPE0fR25N/i5rss8ct9FVpvv9m+T
         oxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653048; x=1748257848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQesA0mAGw3TzpZuibjNO/Bi3DH12rgsDcmFFieVgcU=;
        b=iOc+uvvA8tUe2UowuKTLJCObYGKFv51bPcQ9e9AZMW56Jr+PBfFBLplFea8v6FGFCe
         4rbP+1Hxjq6+VmPFI68myyWM6ThniV14pJe3kKfDivCJn9JDvg5D1PT/sF+6E7GJFdme
         nahSpY+bHb500MRGkcgWNQgJlEyT/SEprimnfoKNjCh9nMT741iwq6g4sIrrM4gdaQhu
         aZ3QPyo2Gwg1hXwGq3I1D/qZG67aES/P3pTFg10CSb1N+pBogeO8ZDyGEINWm/ivZXya
         XKvHHbu5KYq1JSnRul0K4jG5EacZjPw98imeJFNG9PjxupMEv110OJMGpAFh22rnEpOc
         w3iw==
X-Forwarded-Encrypted: i=1; AJvYcCVnXzMDfZqknl+1tlWL258tFXhk53MOWxvAJwMhPgceFoljOCDfdzyL2ou/w/7fYDSD1KWvt3fGwbWcriU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSMUXw5yfN/MtCHn3f6D3y8PTCCR3lx/ZpzdZWS5vs+JhsAwNi
	/AgaPq767s0urYzNzY9AYIE7T7YaEz3XCWZ01dh3weeaj6ZZjZoctLYGBfRgHlPsQLQnr9HD733
	hjxrd
X-Gm-Gg: ASbGncsfoezmVE+duKTHZr7tKYUU3aAyWHvUrboHIzXh2sMkEbto8WGZB+f37+MrHVo
	9/6CGHCgD2JaFAVCvfa66YdYWjY/C4cHLFYzHIzBl/BKsw/ipPkhl82SXWsOGi7MRbdzjG2RxZw
	VV44PtSl/vP4jpB6/YhW3pKRfDpIwEuPgQ7JE0reDDlJ7CC9kmYtutaFaTpOv289we86jgU9CeQ
	4oT/6fBjz6hI6hbBkXerspEvq0f/lFm+mTbQsvi1DxY8iwUmZZzVxtcVGd/AaajElaGxuexxU+q
	+WEQ8vGROm0gqsrHWG0CySYePyoYYhespDoAyInhW74N
X-Google-Smtp-Source: AGHT+IET05zvHkOV63pi/1VD2x0QeOMR2pHpNGp+mVy7MBqburyggfJ9YRtAFd2QdvfCP5pxswOGuQ==
X-Received: by 2002:a5d:64c7:0:b0:3a3:64c2:2a8b with SMTP id ffacd0b85a97d-3a364c22c3emr8563184f8f.49.1747653048157;
        Mon, 19 May 2025 04:10:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm12290575f8f.75.2025.05.19.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:10:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:10:43 +0200
Subject: [PATCH 3/3] gpiolib: remove unneeded #ifdef
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-irq-kconfig-fixes-v1-3-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yYiPlBaEHgEo7p4NSvYYs0UMewOB0XRMzl6SDZKp+LU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoKxG0mpnlCt3t57MVRfjNXbYcrzSdyQfNrDru8
 jIJmXElMemJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaCsRtAAKCRARpy6gFHHX
 cm/IEADdNNMCXARXJYttQUnS8MXlhS9SgrmBBMyuZTYTrU1Q16XIAqRc2ioQTgjiY6Q09VklP7E
 aji4xP1K0+b2UF9ZRYndiNI/drl8LE6FK8+YC/n+LdDY3o7gAUsPfGeLu77J/kk2zk4pTtzHOnJ
 DXraoRRo2jRCu6HsUHUECatSUIVmhM1yJ7Bnoc06APYY4zxROoieJsCrx4by6oOX2JMmSuaaxWG
 IBSUtDQxL/24kT5eNXvRFQ7VrNN+VUm4icTkbMdR8UdpVEeubFMPUz22ygOw5jG1zPoUoG5ptl3
 uTbqkdqbJFKnFSxrVuSIBsAcBgRn2mmkdcwRMMu5mFzo192tChCnAHsxkPrHVDl+rbvNyO50WYt
 Pa3VwSOlfjLYr9zBf+F08+q86s4tv/XYL0BsxHEM53NV30NTanBE665xgg+xaUdHTwoIuMNBzVE
 drrLEVaV2EqYJzismo9908xXk9hNwGFUCfG9cz9Jb4UMb3yLW2m+FRKV6RAigYrVrGPrgtT0ybz
 FTQYzQkfnHeLbhTuKW0u25LYUErmwFwWGR+LaJgTr3LG3Eunhtcm6KxZWFo0iA8WF+NllOzNoxm
 ofy81ZpP65OSKstvG818mlXhrALZovdsH1aL9DqK/GxFp8cF+FsG6AE+J0aXwMhSrjOJi/AxO3F
 fwpcJBMTrpq7dOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We are already within another `#ifdef CONFIG_GPIOLIB_IRQCHIP` in
gpiochip_to_irq() so there's no need for another guard. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c787c9310e85af4c22ffc9bb8e791931fd056c89..e4d4c8507ff9e9ad3e02f8a985300fa1e1056dc6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1888,7 +1888,6 @@ static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct irq_domain *domain = gc->irq.domain;
 
-#ifdef CONFIG_GPIOLIB_IRQCHIP
 	/*
 	 * Avoid race condition with other code, which tries to lookup
 	 * an IRQ before the irqchip has been properly registered,
@@ -1896,7 +1895,6 @@ static int gpiochip_to_irq(struct gpio_chip *gc, unsigned int offset)
 	 */
 	if (!gc->irq.initialized)
 		return -EPROBE_DEFER;
-#endif
 
 	if (!gpiochip_irqchip_irq_valid(gc, offset))
 		return -ENXIO;

-- 
2.48.1

