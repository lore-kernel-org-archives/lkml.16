Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB49263F3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097795; cv=none; b=aYGXMfhg3GYP734yeer0EndE/MQp3fgobs61hidSY3BEIyQUxozJ42wS7nUWCJ9YwV0UCgUdkcB/fc/felRWwFLxzp0pgzemgeD1s7GFHqB1rQL4jChkJCa2THGcymMBPEzfQ34WnedLYgRgL1Hpq0gCZ2g6DgGntESO4TpKXSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097795; c=relaxed/simple;
	bh=f1gvdJx8Loyz8p9Ae5vvTtn8TGqY6yTHOkwuoxiu7Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZhzTVOnWrxctVtLxnY2LrDrkW88/aVAwy2vYfYjYbiesmbMLZ/LWFy4SVST0GCxEqIIZCUAjfNSHC1e5I0dlVEumlDdxLWyi81nfQ4Ag+QYBP5MBMz6HMV1Roft3Rd2Y8MVbpN1XWMxd0Ochmou7qHN/cjKiCq0zeRmx15bweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NWpOVDfw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NWpOVDfw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-399749152b4so2626444f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097791; x=1744702591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYYBwBUgrkHK/0euSwqf61Okzm14DHjthqYOcHC33Wc=;
        b=NWpOVDfw3MwlJuMGAVsX0l82C7l1S3sPWHDTB8ZKAy8dJh72DYF/CVFU2/LgACZduq
         qxRhMGjwOw2yyG3IzTXjuN6yOmuBd/PjKA3gQmbL5iXR0kzImUEypCvo2+3NpP7WSdSA
         Yvi1r4aUB9aBeJw7GBtVVqMZIyre0nev+3wP4ccoyAUnlW4jz/9KTgH+UekGC5ssbXmA
         jA2Bt9jlVg1JyDLSehFGQ/nkSFBhxTLrgOzsIpBRJiQd5rC3fK2jrBQet70yq+jc36Gc
         F84856JC9EmwNimuC+Jykvh8VPF4FSKdecfrTqV7ykRWRz+ioZlw35rgIXOT7qZLdvvX
         /otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097791; x=1744702591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYYBwBUgrkHK/0euSwqf61Okzm14DHjthqYOcHC33Wc=;
        b=jzYNfnRJ1JP6KJPNox1FpcTABUhQiMqw6H7qRox8msMDzIYFX4DsywgutUtYQmWG1e
         DLDX4S51tOoMjWIDh4iqCpdZXX58XETxnFe6ZfiJksgUIolSpHwRuHe91oGDSK5kH+XV
         sHiVeyXKmeEqvIIqHOL1+FUoWopJj+D2WQYgU45DJ8ac/Ec6/4UZ4WR04rE03FVSwC7v
         ymBKedQBtnSVJADJUsxvxmdguCNGXYnfVZLeOa8zIWHy0uO24Pjf930h74jeuJih1q1x
         LvjyH3syhio2WmnoAq6WLWL65E2GWXWZ31OVytj8kMWrVc7zKelnHugq9rR/jmGrCMtf
         rung==
X-Gm-Message-State: AOJu0YxCaFhtX7nmKDNxtItcSGfBRIhB+5TBUI7Rd3Q+4MyDeREwYQOR
	30897bBHaAbWgh9punBr5FMLKTHrNq6Wu2Ja/v9wq0ldfCMvrvVMxF+ee0iB4RE=
X-Gm-Gg: ASbGncsAdVUQs80F+NzpmOHXXktV//tTB3I888J2hDMQlevkjIuoBD0Ug7ynkq/tNZ3
	Yit7HNuccNXY4VRNKv6Iu76PDulyxNFU0MC60OrbzEwNDldn7mRaL3F5v8jIM4HBnGidxI0vYbx
	qjJA+2j9+cRdeagXvHZllXauF8ccYrTI62T5ofja+LgaN5SFhlct95udTG8lpGn1bvrHAZme1NM
	iLI/DzLVM4PiHmtb/UCXijpPXRKuqg5jCBnXKCVAkU0Gfdr5FNd2rT6Ues7sZcvksb7mMQ2pagI
	zeCOEIGQuMsOjjcgYsvZwapPI6zgJvb4BC+xtw==
X-Google-Smtp-Source: AGHT+IHuknOf2MEYZIH4vly+yvgFVYTvAeajz7uAY1cJhAG9CEANFH/3i0TlBwFBJIv1EMxCaXRMlQ==
X-Received: by 2002:a05:6000:18a6:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39cba975ba2mr12601970f8f.42.1744097791599;
        Tue, 08 Apr 2025 00:36:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:36:28 +0200
Subject: [PATCH 1/4] regulator: rpi-panel-attiny: don't double-check GPIO
 range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-1-a18b6154b31a@linaro.org>
References: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6w/lhSUlY/2g8qgnJibVufLNc/lhrp+acFD/YyHB5IA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH9KEqqz+ltxQ3NzEB73XhAjAFA+ZqB10gwX
 USTjcIaM+qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/QAKCRARpy6gFHHX
 cqgfEAC8B7CjZtEgDQt844CEnE3o4Hptp6uxl1TFS9daIlxRiPt4T5jTbt2mBlMitOLhBhff45a
 ynEwfbPlRXMPDUsdF1E5yPEfWavRK/VHriAWMz2trlzYSDZWHzWrGJ7ZSkKR2gQfXcA84D2pgMI
 HWxQlMu5kg5EMZA0tD/psg4RY3xxYjUqY0A28Qbymxiud6wrM5TOqpGhnT2gEgBFuMVJImV1Oub
 ao8q5yRCoql9OK7XQUfddrnZyV2vCL3YtItUsCBkScqnY2kBrJiwub1CDKAXsCBvwlIAF2igfCR
 BoRvluQH2UKKcpetIhVBWG5Fus1Gwjk0/WJ+aK94cYm1soGcRINyKFcR3VYymhkFbtcUC4mfZVC
 ENdSiumxFSi9XYhwTIfX/YeDJfvV+JJUuy0gD+VZhy/Gr0V0bkaHzBJvUcvzMpeiTCUNwqwYmq/
 ZnNkl2W0FXx1mKTrOfsYsFO18dxzYSHgrzbxlfPlMu6XXUYEv9Q+xFxvVsn6hD/bIb5S/TMAmEP
 05dnaRn7qd2YGA0viW13hOl348YrbqUjc6c9v+cV/cdcHhBd20Fa3Zx39sOijKba86EaFE4Sv6K
 oROLlatNX+VwreqdjkhMr2Sbg94niDwJrwS+DdXYkHRwx57z/t+C1WlkCtd8Vhb377xReAHyi9K
 ZB4cx07MFICC/DA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core already checks GPIO ranges, there's no need to check it again
in the set() callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 6c3b6bfac961..f5ce50ced294 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -216,9 +216,6 @@ static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 	struct attiny_lcd *state = gpiochip_get_data(gc);
 	u8 last_val;
 
-	if (off >= NUM_GPIO)
-		return;
-
 	mutex_lock(&state->lock);
 
 	last_val = attiny_get_port_state(state, mappings[off].reg);

-- 
2.45.2

