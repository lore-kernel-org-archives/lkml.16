Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3190E4CE08
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096799; cv=none; b=eBOi/qIWu+C1nxPAfxEBazBtYWdw/2sp5V8Su3RRv5/NWsydoaZ/BfwRBCGc27j35l12w2HWk/sXZGwOrrTdBzcYnLIq+NmgoI+2sy3wjaOI6iUpJ/tz4J9r4qDrZSLEDgtisk2edzlBuMRXkpPKEm0OnXnFHULo36qeTLQ93FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096799; c=relaxed/simple;
	bh=tQ54Qro1ETvKh0Qp8/5C4GNVQLG7F16XZnB7oE+K7RU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c27tGzFPT8Szfeot4oplf9bqrqXKYmbxvoAtulymflWOON2wm2oqHmoObSa2bBvq5QYH0ueNc4J0RTfmr7Sk9ILTIT8rh8cufGdAe5nYE0oLHjkbOv+d280QfqboE5SmSBsTMCaOec3Jltwi68eWntywsT0caCuvekqmwa1V3+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BdAdKBaS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BdAdKBaS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0618746bso37189885e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096796; x=1744701596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rerWs08GGsXgOeYMakZOBzYIS3d4KsGA1S0Hv9BycuQ=;
        b=BdAdKBaSmeHLMbsHr7tr7kF/UgTvDRdoEpOkX71N3ll/g1tMsJb8lvIHuUbA/9ZsOd
         TGcp/1W5ydaafj1SPRX8ZWx31O1WG6atsdUPudM8L/gwqerVh8rAkDZUr/jy+ugxKsVk
         kK4sA8ExCQG33fI0IJF+ABpO5b/tyL3rwb/WG4Fw1piSqIRazED5Z7sH2AFVVdRiJJjh
         HpLghbM2ObEHSsKPiz+R40REXEnWSje5/RtLEvcsRMEhxHBw4pwpWyNHonCu9ZzX/ptL
         WD4IpN+wueiMVimC/uoNJJYageLUctKqM30Gg0G8Bo/DNapsZLxy5xQmdMeoMYpIofIw
         s4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096796; x=1744701596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rerWs08GGsXgOeYMakZOBzYIS3d4KsGA1S0Hv9BycuQ=;
        b=CnzJBrrls+X1ve0evzrp08l8ZOP4dRPYpp1AlW+clnE6/9tmBQeKVw9RoLJ0U5+Fbp
         zKRiseHc0PPi/n9ALazdvNaD5DDgPHl825JgEOMM2OwDy8FasGsKkVNO7oArnxUL5o5D
         9ErlJNrWg6MzgGEJ/k4ujeMbIrUQ4qRfUtGns6VnBqJOtlghbzAz/zsIH445whpl5Bp1
         Kw8HEXbdwS9LDDR6RzO/mByRrdat8qGeCJyNjcmo1OdARMHRNZMy/qMWqVQwXjChmAS5
         eBJWBq9TDqrKwEcdy4O1olkSmCDMfyqsp6ci/SYiaYyl5AildfCnfEOTLXaq2OgXKskP
         iQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvNfIv26HsdzriMkx2yGNxyAxNHngWU2J6x7eTt8f0oB1iXiUJEJZEsDeqrkAdSOxu20g0ADX/O/Tn+i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEn5PKyw8bwd5gklomCrEAEUC1C1EDHc16RQkMGSRM8gR/SlHZ
	uQpBIZmtDDHQZClA1f4glm2yDQ7AGeDj3vXEJamIG/m7I/LK5p0PSrYeRD+6CE1CLEGrpkFl2ul
	AmpM=
X-Gm-Gg: ASbGncup5nzCuOaNMdBCWdkIQ80SRo96W4CLDCVJZcwOhXRwefAbhkmdK/dEK/plI64
	XoqWSGCBjFcTWKDVlEfsPIT+AqhjPJZy/vQlvfi5MKoLDVl21t+3RRmOkeqepvhMtwk3ZevMVMG
	E6iuNrTRuzq1Y1rZxBTgVmtUyJsGAuIlXqeWrazN6rMyQm51dEDGrQBeGFTj2ET5ie3QW+WtZNd
	n4n2YdWTw2nIlH+n0WEceHBsKka6uosSZua2Fb2lGM4nPQEODEDF5a4ko+kIGRcGHzgMWT2QakY
	j4emZTfZN+iFXovr8uIkmrDydfVDbs4rNN1QGw==
X-Google-Smtp-Source: AGHT+IFJ3d3WIXXdbsxP6XFPVsMX+UDHR6kD/ikNQFP3rx9W9VQKg0xOqOdPRLMFIuHN2A8l/edjZw==
X-Received: by 2002:a05:6000:1867:b0:39c:cc7:3db5 with SMTP id ffacd0b85a97d-39cba9331d6mr11732877f8f.40.1744096796152;
        Tue, 08 Apr 2025 00:19:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6608sm13882872f8f.23.2025.04.08.00.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:19:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] platform/x86: convert GPIO chips to using new value
 setters
Date: Tue, 08 Apr 2025 09:19:52 +0200
Message-Id: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjO9GcC/x3MQQqAIBAAwK/EnluwsLK+Eh2k1lqolDUkiP6ed
 JzLPBBJmCIMxQNCiSP7M6MqC5g3e66EvGRDrepGaVXhGtjPGweMdKEkDLu9nJcDb9OiaTtjmr5
 z2mrIRRByfP/9OL3vB2cP6gBuAAAA
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tQ54Qro1ETvKh0Qp8/5C4GNVQLG7F16XZnB7oE+K7RU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M4a2vEGGaUJUjSn9RSI8MXa1+wPNhGq6TvrQ
 OPIwNI+6tGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOGgAKCRARpy6gFHHX
 cne2D/4sIlixNmzljnfrUKx7C8oUTtQL+EM3IVeXOH0ULFC+3lDbyYqS4G2rfgtRc3uCY46RNfO
 xwXkJOHG3hkf/Eii9A8AQoOcwAbdjTtN0sS3ReR0sWUhvhPe5nX1FwgfrGn8eg0e767pzxrVJJy
 uHqqWpCqp+YYbXytGxR0NtpJ0sTlheC7Sd9dSMKp0ha24NzkNaU3A4axXVJZ23CejiK5EIAZGSf
 O53eNHptbJDoCLmshPUCGfo0UhdNN3+UpZi4uKttrJfOLU+FJs71zyG4HkHfypIxsb/Ja/w1XaX
 bBA2po1uY62XVzcul50irpkXLtUPvWIH8G9kfpgo0K/LuOCVtjO/o7e7AfQb4cYMW49C5ZWABX4
 N3EaknY8mhP36f+FbpR53VzPTL6+4WOHwen0CXepbgmPB+8COzmtqq+fLaUxKqDj7pOV5B3Upvi
 I/dqEucnvUpkyNV0AGTtiuRIYe12WEymCCJfx7MyLNkhS78cYiJ+WOc9YCaf5hYH1cgDc0o5gJl
 oSjnl7uie156StpqRdCM65LRuZH10GGKahK7nNJhF0fHu059uLO96B07KmmGNBmfBUI6pXojV1i
 01HSqCcquBfSZsctp7MpdznO/jBF9DcSOpijmgddUKINx/S6ybRVYvsm7hNxQ3YflWm13mziyWW
 +T6lX86GMdKhqXg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the x86 platform GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      platform/x86: barco-p50: use new GPIO line value setter callbacks
      platform/x86: int0002: use new GPIO line value setter callbacks
      platform/x86: silicom: use new GPIO line value setter callbacks

 drivers/platform/x86/barco-p50-gpio.c      | 10 +++++++---
 drivers/platform/x86/intel/int0002_vgpio.c |  7 ++++---
 drivers/platform/x86/silicom-platform.c    | 11 ++++++-----
 3 files changed, 17 insertions(+), 11 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250401-gpiochip-set-rv-platform-x86-86788597f4a4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

