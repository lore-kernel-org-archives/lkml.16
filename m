Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA22AF1C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354546; cv=none; b=EozQz0DJQm4jST6CELbb0IAcSnG+Ivj6gpvPeJbIf4nMNYwVl/VOQNXal8ujsmR9VDLErYF5tnMENOnWYHCcSYYF72lcarRg8eaqwUaFnMh33qbQ1YJbhMZTj4KOqg6OYOoXZfRao/3FKhIzF5PHaYxvSa0t+deq0lEhcfLs3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354546; c=relaxed/simple;
	bh=DIxRg08LQ4Wnf9yoZGtSsTUBAIMgxjQdUlAbMXiawLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTKXUrHz8aMMTlgXl5OaS67CEyai4/UmywqU0ACdhioiFDgPEqZFK95tJzhnjEvI8atinL/fG1JgwAHfZfnAQlRGB9nE6EFxZniithc6OAsQOIC5Gi8rMxMXJWGYQ4ZfbpTobzOKbeY9oy9E3ccwSAGtWmjNPk76/WHic+wL3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p5UVphOM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p5UVphOM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45348bff79fso12341295e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750354542; x=1750959342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ToAOdTmq5s5XOCUlWw8XCgzHw+VGCfhPWa+zkrjEB4o=;
        b=p5UVphOM5qvx7XEOGeh9QXCNOtrTmr3eJ1gpRJu67ezCMM1sRJh9k3uDnuHOxhoPTw
         1Cj/BGNxLQBHHDPVc8rOVei+8NXKlYMLOYp7H4F5ZZYE0bYeTw5sMPMViaPU86ncRnCw
         NN6tFm4EQmxkI2inpZwEJidrQrY1qt5nIngdfJgx24d2vG/5214ZjS0qVJW4bkBW+xL0
         2ITPgTlTmcH/HOu9k75rC6TQKPQxL4nM+VJWFYPo8ADb4xZNuIA6lJ1uabUzbwZNaH7p
         nSqHyL1dmypBPnAnh4rLv4NXR3ZegPxgMvIvIrfrEnbO6suuT0DHtrQS24AFl+ea8/YI
         GGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750354542; x=1750959342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToAOdTmq5s5XOCUlWw8XCgzHw+VGCfhPWa+zkrjEB4o=;
        b=PRiOSieI5xO3dSyBySwju+1RZNOVxJD6JOwNGwujjOkaubfnPQS/NSo8fyGAu/cOv8
         STt4vYXfRhmeYDnKBSzJq+D1uavPb+998UziT2KtcY5zzm0+puQ0IFDn2dFgE3e0SvFX
         7U7a2kQrFnw6IGoJCNf6BBpmvFp5tuSG5gl76XMusYM4zggruVqxGLoToANC9NvNr3g5
         gPAU3zlNNY75seaPGt1WdY7ixqXVx47mwA46M+w3xFvUtNm9CAhSda8G8bUO6sgMKfaD
         /q05YsrPbdF+rF5RFbXXQipTV1S0uw1wRGUDWKlfBo8fcCfzs5TkPcn0nX4a74M+I1K5
         q8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVRF76pDXt/v65DmSBnPGD+LM8/VXcNYCZ/+1JgoENrUgiYzS+iQd13r3UB7qDqKm7PyNdfYd6nr12MF3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tejLAGumWyPVyNMSLgZ4OqHgdLzu6+tMa48hgP9rIjpZiQPk
	P08jrWiw080h7YihtA0hDRs26QkeaYgwKDJdoTzB0om5X+KAvzZlG5PSK0xNuYsbKyw=
X-Gm-Gg: ASbGncv1A8Vu5kcUq7eLZzHKv7XsBpNy/cwhL3aBqodfn3CzXvIIBXoJ5shpIIabwss
	vNGjiaRtAjk967lRX2DX0LWUIiK5zMtA9GkK7jqy+A+GXtzk9MqyQX+woaFh26f8/bNI75BXmQt
	e3dk2K2t9YOopcJfLLJTS6jQNPcQcsRPrQezVcybbtjQ/IdYVJTftf9yE2mC21DTaXckJQSlIjF
	wzBoiK5Yvg9nkl/cFtIxBuqiX25lfAdvWGWTbj3TWqaNktHbTV066NmcU1kF86B3uMio+RFkB/1
	u4S90+Yr6nfahkVHtAB28EIQlZhwt9qczjPL0B0h1i/YcqcL+nog4IjplPYAXTc=
X-Google-Smtp-Source: AGHT+IF616XQ9rBNp7YWYVBhGneXz5E6RZly2Cectt+D2w6ZUUlD4nbQ/o1uJeeix2qxHhBrt1B1Ww==
X-Received: by 2002:a05:600c:8b66:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-4533cb0c164mr183178165e9.24.1750354541541;
        Thu, 19 Jun 2025 10:35:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e741b43sm36311535e9.0.2025.06.19.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:35:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] pinctrl: aw9523: fix mutex unlock in error path
Date: Thu, 19 Jun 2025 19:35:37 +0200
Message-ID: <20250619173537.64298-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We must unlock the mutex *after* the `out` label or we'd trigger a
deadlock in error path.

Fixes: dffe286e2428 ("pinctrl: aw9523: use new GPIO line value setter callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-aw9523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index c84454038419..2935b2cceb03 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -652,9 +652,9 @@ static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 		if (ret)
 			goto out;
 	}
-	mutex_unlock(&awi->i2c_lock);
 
 out:
+	mutex_unlock(&awi->i2c_lock);
 	return ret;
 }
 
-- 
2.48.1

