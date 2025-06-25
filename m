Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D010E3074A3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847621; cv=none; b=bbDDn/hj6DgOshlKISeeSI6mg/v3gmk7/hlx5Dyf/O+1zj/1HTud+AITVH79G3KXFzgvEdex0Kt/mMp4uwqDsEb1Q5sVLGlWrPJ8Bmbj+1JTkpfk4uneSiBi7oCH1a97H/I9SloXlqFaUckaGYg2iBHoYjxorM1j+NPcKWTaO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847621; c=relaxed/simple;
	bh=42Gx7MVqg9RLVZZL0nQGlW/DfixSJ60vSIokymr97mo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SrYDNANPhEDdxwA6Sdavf4P4KnkvbYJuShIaPr9SbCtzT+yst3ciUdcGnCznB9ZtUoAKQIqiy6x1t9D+VSGXtGyV2Hj2rizCI+ETbmi0Zd56VNGv1xmT6Ye62qpY6qms3yM3lfLJgqiQvpGNOIOnQKIEMNtSnNVC67NZL+OCR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DuAoz7BD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DuAoz7BD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso15443155e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847618; x=1751452418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
        b=DuAoz7BDRNn+op6H4XZzfpcHgm/7vaIIRt7p3WfObfn0rlbEFTBB4zdvh3j/EzfgMK
         1wGddPwfvJPjjpHwrfInZHvNdhmiHUA4MKfOg5wtZG9fhjHSdswRfX267IK9zLRm/Yi1
         tzUiWDtMvJbO8FT32rOBW2kAqMpNASnR6x4uT4ZxF/TxagK6LPwGCqbc3I8GfGOWYTLN
         xNHM8Qc5HkmeU024dpjx9/62vj4of04vLVu131njY3J1A82D+bri/HKbXnuEvuxAvBH7
         i4ujnFybqYdD3XzcMDDPD2d/AjOSkQTAXYJP8NNra9SBNYwqDnU5dfQlxw5kq4jXFqyK
         YMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847618; x=1751452418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
        b=URYuRPebdGEAF9yCg+PUegmh+vSqa3eZToaZ5fxBRRIefuSOIWSqaKlFT22qhJR9t2
         W9JtDysyL2XzqfctdtBiEtJkbwEFaoXxjU/x86K+1eAbtAB/qY+L9wvv36cEQMDP0l8F
         8dZ3EU3xvJRHaxR9m14xjlQOVGOdlwVBd/YtV6SE9zw8bsrjEu0Pr0DnvqS/+e2w1H/X
         xPsJzL6M5WSJ1CWnpaNWbwJxBOy/3zS4FY4D5y6XLFigdhp2r4OfAuf87XrMW1EZLN/h
         kD6NOd+fN6DExr3globGjayro2tz3v07DOM8pi9pswdMFlh5Wu4bW0XwJ0TblEjZGNCW
         Z9tg==
X-Forwarded-Encrypted: i=1; AJvYcCXCGF6bIcf3YUdkmpTMFtizb6jU1kcuK/Q2VED+qj0EvHgpvDsXw4V5kqgWgNRhtFYh8lM8+nKifSDoctU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdocu2BdIti/zVXh6GhZX7N5fxcBqqKC62B6hVP2dMaegIF5s
	909OiGQPVYN3qrxbmfBsgSoJIVKxxa43kYKMVJ40FDngGyzFDf1nOfspyltZVkZIzMg=
X-Gm-Gg: ASbGncvONDJvfuJlodeUV/2sHYlSfL0KPe23U3fHGbrfxwteEWqaY1f4Img2dHePIse
	uKeb9YO3OzPJmbSBV6ms2nTHPx1XAP+mdhmcPFmSj0FuWjfylkRim6l0ragtlrjAiJutyZRdc0u
	sXqWgHRGz72RGzvhruRHiCnG2b//chjPF86/zeRL3JVj6ZV+ZzceG9Swet5cRK5dF+KAxLbW0aK
	LJVDhg84QoxUP+/GRFByCNgr4CAHUtjuG2bNsrveOceP+4PrDWGMswNOyDCbV9LEOtA6AVQ8M5R
	lGdpJ8a30bei3x9nVJ616b5SX7hdjDtkZ/ZFynhkYFVlHw6RmNEo0V9cqLU4BzJEHW0=
X-Google-Smtp-Source: AGHT+IFotUTj5zcp7ShZ6IoB9WHymxHO7Rq5Lsk8ESCqSS7UfKL93wxzqyd9QmnDn3AYs6nJhvFulA==
X-Received: by 2002:a05:600c:a45:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-45381b0f48dmr20255625e9.22.1750847617865;
        Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed, 25 Jun 2025 12:33:23 +0200
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPQW2gC/x3MMQqAMAwAwK9IZgM1aBW/Ig5io2ZpS6oiFP9uc
 bzlMiRW4QRjlUH5liTBFzR1Beux+J1RXDGQoc5Y6nCPEtZDIiY+Ue/fqOHyjtAMgyV21LdND2W
 Iyps8/z7N7/sBvsgfCm0AAAA=
X-Change-ID: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=42Gx7MVqg9RLVZZL0nQGlW/DfixSJ60vSIokymr97mo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B6XbDc1lIy1VT9BCDCPgIvuXS+r0NgLXwjx
 3/PIGOmGaKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQegAKCRARpy6gFHHX
 cgTSEACFaucbwtdUwbgQWlc6On2PxsVQjx1y4B4b4AdaA4k1pQv3Mnkwj5zwmymAtY7xsbo1u5E
 7IExozMIQbhO3mBHTgvqM2xttAWFJoNEe38l/HvCFGOWAokGWyEnJl2XrzrsqKzTtxvd6oOEn8H
 wOhHqs6ZcnnWZiR8YV2uofWZbqn7Hkt/eZPRBzIlz4pwUbP2o2J+dhh5s6glon2J7+CYt+unvFL
 gORIlOItofYQPbdl2rFqKKeTLjyfKeLSIMAUAdXGcUuduoypT2gnYxru40kJEDN4vW+8rFhKFcE
 f0UYhwxnFqaDCdy2RTTB77JOdYKXSSTEYtFaYZj8xQSTTw/ciMwRiiucffXqNk71ASkMiC6cZUy
 cowudu4dzmh3ntG3AoC4HtYdmZ+mJFJRQLdA9O2k8PCh1djKhGJlUr85g3OMkJLe6OjCtOgQejm
 SDZcQ/8bTpwNkDz9w2//nWDSJ9GEdpxjv6xDe6JmFkFgw0xdlFFzw18MXwPIU/aKYWVDTvNoCqv
 uKbFZJUbUX7WrvVFGm5OVRPj1scmPBIJ+BwTdbu9ANkqYCb0T4usSWzvUPNaWH5UhrLlYBv3t9I
 Y8xJBm0XUvvEmU/RxOdrHzvSL0shP9QjkOVLCU/ozuc7IMBna+xP/0StXa4JPC4s9eQ+RlX/9/1
 5yU3ObdZpXw9csA==
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
      gpio: sama5d2-piobu: use new GPIO line value setter callbacks
      gpio: sch311x: use new GPIO line value setter callbacks
      gpio: sch: use new GPIO line value setter callbacks
      gpio: siox: use new GPIO line value setter callbacks
      gpio: spear-spics: remove unneeded callbacks
      gpio: spear-spics: use new GPIO line value setter callbacks
      gpio: sprd: use new GPIO line value setter callbacks
      gpio: stmpe: use new GPIO line value setter callbacks
      gpio: stp-xway: use new GPIO line value setter callbacks
      gpio: syscon: use new GPIO line value setter callbacks
      gpio: tangier: use new GPIO line value setter callbacks
      gpio: tc3589x: use new GPIO line value setter callbacks

 drivers/gpio/gpio-sama5d2-piobu.c |  8 ++++----
 drivers/gpio/gpio-sch.c           |  9 +++++----
 drivers/gpio/gpio-sch311x.c       |  8 +++++---
 drivers/gpio/gpio-siox.c          | 11 ++++++-----
 drivers/gpio/gpio-spear-spics.c   | 21 +++++----------------
 drivers/gpio/gpio-sprd.c          |  8 +++++---
 drivers/gpio/gpio-stmpe.c         | 15 +++++++++------
 drivers/gpio/gpio-stp-xway.c      | 10 +++++-----
 drivers/gpio/gpio-syscon.c        | 33 ++++++++++++++++++---------------
 drivers/gpio/gpio-tangier.c       |  6 ++++--
 drivers/gpio/gpio-tc3589x.c       | 11 +++++++----
 11 files changed, 73 insertions(+), 67 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

