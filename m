Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD842951AB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558806; cv=none; b=LuF7/7ak30+p7Kt7+xpN584RkrRx+/NIjORRNhGKI3RmeM7IzwfhQJ6HEKWCA7viMmXJnjZou87AGUlavNGO35AxRoXI/hrclJCcYWdiySF5G2XZn6tqxsbJslbsJXBzOOw9jc5kktLuzlgPb+L/rMUQVOlWeyNOC6xMdAf0Ocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558806; c=relaxed/simple;
	bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o6bsLYQ/5LzvmHYlILVpiguhtVoiKJI20lRWijPGx4U0yTFy1x/JZsWuD84YYzSD/N692uz7F/yLrTz/VVH/7CW9yFkn7bRAm156yAMQae0v1qhchiOfUtOY3P1YetK877UkAB0cIi9MG9RrIF35j9nxPRmSlgDQNPjljyMMXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DdAuaY49; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DdAuaY49"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450dd065828so36630085e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558802; x=1750163602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=DdAuaY49PgQ5JpsdlfU1TEzS8QOgwfoP4zczOlY3qFz/PMQhq2sTNxB5NzsSvJFzGj
         M+juv/CxN/L0Ki5oyhfqu5ArL0uQ5/zP//XnT/Gqab239pGdyrZtucTQ4bYGkwhKWgZe
         iE8suL1tyZIUReNQ20rlAM3oPdbv8rTY7LC0l3py/EB2OR8sVculv48RN6OJDYQxpJPJ
         aqREJmcXzS44yOo6AASwVcugiERpnbeF8Z0tezSJtI8pccO2+am1qMJ+nLxL2IXTOF2p
         qs2SKLER2LKCrSRya6BU9kEIgzOS8owVMojmd0FmO0zrTQZKyJ/PJ5d7sgJMbPcsxnNB
         VcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558802; x=1750163602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=BtG5fypQ68Bn6xJk3UinO/hL/ow+ZZacrusciwIsgiFcg2X4Anri2pkghb7ey6mKpC
         V1V3T9HBrW27I5d1/Mj0y35Fy6dKtOHZV5spY3aB0JQndGoDDGW10iBsoXi1XccS5LR5
         xDR7UaloGDAQJE6+QfuGDYYMuMb42yAQw58cLPR0x9vTUc+Nybb0/Mdl8xVnHT5iMAWJ
         tuUliSNgG5FcSR8VPGGbmKxLETss7J6yuZghGOMKy5dsNJ6T8H1pxWfbeqRbNskn+Czm
         2fmd/EEuGy6AI7SVjD90frn2gptyI5p58K8m8ntfFGEDY03NjEOXF+98IHeS669dgV+f
         QjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhlc3Ece1gu1kZMrSD1yS1wHaW07qyP0mP/cGaTAAagJX6kZk2ekVOlUyyqAAMixVAadlsedCF+/D1rL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4sRYrJbIBqHpnS20evEAAGltgqQP6KMsJN4FbLjZMUzU+nFdP
	viMenuj0th58z3rUJrKuujbtuAM96rWRSzqt8aw3hcIZcs0Cd7KD/+3fO45oF0Hr8l4=
X-Gm-Gg: ASbGncvrINRp4GDHFSTHcvKWWWlmmefwh+waxi/c441Z8a/IvFImxXLdwNj2Ez3YZNq
	TmtIH4G7w8khM+2ziXeHbPHNSqS5AY2hNoBvsk/MFpl1ji2uvCm5LF4ZCvdjNaRPqAltIju01EL
	u54tDervqhtO1X8p4591Fb28AGLHG7k12km/uF42HYnj5muh/GLSIS30zXlSUwMYWG6xPVU3/8t
	ByGsl7cAKPXNjZVFr5+9CsfSkNuF3FjC7A0RmmVZoWSPzwdneb8zvd465VHdxrosoNgvIl2iJzl
	WymPdqdshvgVfPytca1MwFjTkvgmnG9kfSYuNBYKM91Nh8D4o5t85w==
X-Google-Smtp-Source: AGHT+IFlnKIx2sPK6MrXH51mtosjIEJBmZxPRvw+nyl9XpBpBAq4wOuT9n5DEtW3OFTtEqksbAo5Kw==
X-Received: by 2002:a05:600c:1909:b0:450:d019:263 with SMTP id 5b1f17b1804b1-45201437502mr155154265e9.18.1749558802123;
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert another round of GPIO drivers to using
 new line value setters
Date: Tue, 10 Jun 2025 14:33:10 +0200
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYmSGgC/x3MQQqAIBBA0avErBvQAYm6SrSQnHQ2KhoShHdPW
 r7F/y9ULsIVtumFwk2qpDig5wnOYKNnFDcMpMgoQwv6LOkMkrHyjaX9RqMWbclZp2mFkebClzz
 /dj96/wDxMn9UZgAAAA==
X-Change-ID: 20250527-gpiochip-set-rv-gpio-5071a2dad129
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYLDKKT/3+Muqt6vpoLhH2yAyeaiX8AvzjKc
 lz6bLAcJ8CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmCwAKCRARpy6gFHHX
 clG5EADX3eLse0M6879cp/rXFPzvNb0m0LUCg25b/7UyMAlntaEe6vfqpVdDnOymoShonFCkXzv
 UAW5igUaY4Qv+2V2lp3v0/nKaaYeJrOCDfUqrVQOxgrjQbfGFE5/gVuucblr0r0CSv06TL7XYn3
 95jvOjxXJS1R46cvDsFOvc8iY/Ysk5EE2kaHqYX1Zez3Fxe0j+P+AhjsjUgxExgTaYkgj9X9zLp
 Iu+nAJxFgnOojFHrmzm9mK4lntAhEgFQO/F1JWyaM3iBwo9mt6sM1y9VSJTI7BPRFEKas0gge/c
 +WO+kKXAYEQ6wmlUILezREVVJGDIx+bRxn5AIWBFuOd/Z3PfayT5w1/Y9xACMAhzLxl9yx5XesP
 nrKUhNloMEin8f0em+DkP0y8cvuSlidQRetWsqPNH0toyKsndjNNLfj2la3e3jr7a+jT80cJPNI
 1Avz+GrNf2pfgD4bWKTCV/os10gXRX886aWYB597vDmJtcg02a1ir2uHO7jVDLBeCnTA70tWjZI
 N5X9rUNrlBfLU0A2y3Fuu4E2H5BoAFR97vPSCLg63FIrfsm7vPc6BLdNICULsKJ1K+aw/vp9fWi
 KLUZjmJAwGPKjiCr8Wsw4Awh8QL0olPep0PXVM0IxA58xDrvoZkvlp/2/NT0SUetVd8mNoJ6G8j
 rmFYfB/NS4+mWZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: mmio: use new GPIO line value setter callbacks
      gpio: mm-lantiq: use new GPIO line value setter callbacks
      gpio: moxtet: use new GPIO line value setter callbacks
      gpio: mpc5200: use new GPIO line value setter callbacks
      gpio: mpfs: use new GPIO line value setter callbacks
      gpio: mpsse: use new GPIO line value setter callbacks
      gpio: msc313: use new GPIO line value setter callbacks
      gpio: nomadik: use new GPIO line value setter callbacks
      gpio: npcm-sgpio: use new GPIO line value setter callbacks
      gpio: octeon: use new GPIO line value setter callbacks
      gpio: omap: use new GPIO line value setter callbacks
      gpio: palmas: use new GPIO line value setter callbacks

 drivers/gpio/gpio-mm-lantiq.c  | 12 +++++-----
 drivers/gpio/gpio-mmio.c       | 53 ++++++++++++++++++++++++++----------------
 drivers/gpio/gpio-moxtet.c     | 16 ++++++-------
 drivers/gpio/gpio-mpc5200.c    | 12 ++++++----
 drivers/gpio/gpio-mpfs.c       | 11 +++++----
 drivers/gpio/gpio-mpsse.c      | 22 ++++++++----------
 drivers/gpio/gpio-msc313.c     |  6 +++--
 drivers/gpio/gpio-nomadik.c    |  8 ++++---
 drivers/gpio/gpio-npcm-sgpio.c |  6 +++--
 drivers/gpio/gpio-octeon.c     |  7 ++++--
 drivers/gpio/gpio-omap.c       | 14 +++++++----
 drivers/gpio/gpio-palmas.c     | 15 ++++++------
 12 files changed, 105 insertions(+), 77 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-gpio-5071a2dad129

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

