Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83721ADC6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322008; cv=none; b=SRSLBZkHZ23xMATJtdWhwfqg8g2sXE3lL8+sEl2XRSpBydUWYGkEyNaaOZKcWBEBmZ4f/uxL2CINvHUbBh3lf/boIy9IGofiBwlnj7LZ9EbFnlPPa53+FE6hzYAgdu/QAXgqol4sAovmuV9MRFUsS1Ys1hryQZQM1U7rtVnXbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322008; c=relaxed/simple;
	bh=JA2MdK9R8F/cOt9CUzPZz/x8ehY+74kE0g6wA3wRlHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pcarhOO5udarvCQBQXSK706rVm6feXKLZaP3MJAUnhOwp2JmK7wK7JuV5+YZ7VpBikYbO2TBKYucYltdvEfAYNrrhtn2iSbc/SJCvjY2uieI8An898Z03tuqFKuyJnpByAkPxcYZJBfQW+YTrIGm7D32MYC5Iq4cBcdm76Y5Tvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UGHCmX4U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UGHCmX4U"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so521643f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322005; x=1750926805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Kp9os+xz5VTdOcLDt+j5wxoDnuHFI6sku8Lw3uoFk=;
        b=UGHCmX4UhguqOuH05rjlmcJ4m1hF4cLJ8qpWXC5mWPhVL608OxNfwsz74/2AsWcfzD
         1a6qiSPHgMxUHeSTjeeuKU7ag/CmGmLwfZBvW8yOiFmwtRkPY9aLX2KoEdvmzbz3eT6L
         AgnXhHovVttKri9qcaBuCSV5MyjLP500Ep0hv6PB0eK8y/oaJl/WxPRy/KyCS5nNvgos
         rm4nL4VW68PASzbXNchLdKRJWnZXAJRei9e5RNVdv7mBWjr34maHx+UPwjEaSxg+H+ws
         Vn4UZho1vSC8cm/nNLIMCV13yMgaakXLJTBfDEV6AhHO9k4d43tBjdOH2A/1AHBhpdhz
         Sx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322005; x=1750926805;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6Kp9os+xz5VTdOcLDt+j5wxoDnuHFI6sku8Lw3uoFk=;
        b=uTuw8OijPbLU40s1vrpNk7sRtgOQ7jRkim/QJgUEOrD/5IOiATrkGUOG3XenLe+01D
         9+9NNmtv8xXbUyM1fuv7YB7Tmz3MEyzTwouRGxKID8wx7oW5idEpIsjwxojdxY3H0Xnq
         RqGBoKF5hcWWw/5P49qg+LeT9UVh8BLZXVwYwabmn9l8RH2scW01uBMNSl5lpemUaicO
         QQjiN+sv1swvOy7mdbG8mjvq2QS+gA0mnVvRhl7JIInXLXthYD2X1spbErnWMJ2VZ6qR
         HUXDptHmwyUP3bGLUMDzsTeSn+F3Ug8iUMaoH56tfevLgn6+m9lwz8Yxobu4lodNFP+Q
         Da8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7iC9EXCkOjJ++4Ci7V2A9a3PnnYbaESkQ08LjdO7jz/whryafq+Pa+W+bHX/3GoVnyJPROWADgMjipho=@vger.kernel.org
X-Gm-Message-State: AOJu0YznTVW8dP5WXuvlQIbf5uAV+jrxLTf1mrs8PnNemDIEImGNmavT
	FDCdSiMaIjYUeW62C0PPmJNJECZJsc+cPRDZykl+AUXMQL8ryd1LRUivZkePaho26ow=
X-Gm-Gg: ASbGncvgYerRwc+rr/kyAyuM+3PswjKgPCcH6xcGAKJt3bCwtx4ioAdielG+GTldomJ
	jjw0f+hoUyAvL5a2lweS1s6r5wcGqIcOECxFEH4ZB46yrA2nErZh0kLy/U7NwCrEbTpmebVYTij
	mZclAl73X4E/L3VG0tHtWC0QnpmN5l66vnak+x+EWL4YPkRtCDVq1v6LO4O63J3dgE/snEj9T9Z
	m2bjrVlVH8+FCCrsMIkus4UbKGbumxzeuWzCczn6Vu/L0cMAJJfb8CsrGo8S9/9v2CW4YCH4t62
	3CZW+L8yy7SmXtuFdibG1Z7/M5JBhyXLDGC8fZopfWc6A+RQFi+2eFjl
X-Google-Smtp-Source: AGHT+IFYckMm6TqdR+SMt29zt/hysoGmTKQvGlottOkHITi2OJ20YHyb6IYgKfQEgRh6pcZHDimpKw==
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr17795119f8f.58.1750322004914;
        Thu, 19 Jun 2025 01:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/12] gpio: use new GPIO line value setter callbacks
Date: Thu, 19 Jun 2025 10:33:13 +0200
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnLU2gC/4XNQQqDMBAF0KvIrDsliTZGV71HcRHsqAPFyERCi
 3j3prlAl+/D//+ASMIUoa8OEEocOawZ5lLBuPh1JuRnNhhlbsrqFueNw7jwhpF2lFSMpMnZprW
 uawzk6iY08bvMPobsheMe5FNekv6lfwaTRoWdqltVO6cnb+4vXr2Ea5AZhvM8v1gCtuG5AAAA
X-Change-ID: 20250617-gpiochip-set-rv-gpio-e1e864768942
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JA2MdK9R8F/cOt9CUzPZz/x8ehY+74kE0g6wA3wRlHU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tNX/mWswsFP4HvzFmsSabfA47FF7DtFw8Jl
 09zIyLDComJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLTQAKCRARpy6gFHHX
 cunRD/9vOYV44Hogp+oRtgtxtMzTmPR/jtz8WK4sNlre2T2WIXXIQVGwBDZYkLX/9JO0IggsrRg
 5KbC5YjZhcef6xGufV58QXSUwtr57RBdAz0mKoSnP9zZYAxoud22AmqWm0GuKUdfGyQwLAk/N27
 d0f6rQAXmiMWYB7QNcdYjKAXY9l9EUaRvZsg7h1EaBimz+TWvZgwZ0INAxZfonXhOSKOW/+fI8F
 arO6dq6dIqMPBHz9CIX33WGKstSq64w9ROgBHTT6+s4lMOFbQ2EuCmyH65UwYJrv5ZgKSvkemnB
 KMixt+xY3bUqavu/BU/1qeuDHQfltZKqyDFT6RUgilXBhsNdHasaMyhTWOt56OANNSgRZWLVrj6
 VLcpaoIuvdqpXnXwO5ufD6Vke6/p+ejZtlcK0L56OFESwJrtdGk+gxGOnomrjm/5LRyfkO+1QoO
 B1LhRJ5UUQoFO3mPkLGTTYuFwd05KDeTi67lRDefrekAuXDtQw+5+8WIzMcJCdPYYHzztt82F2p
 sxoGc3Qt42sTzluSykzvqyoV2ZMWnerxNKjKzBDoRwuycmN1G80nrXKvps9jDb+Fob8U9s02dRy
 d2hqXFuSm8UPq6hoQqa6BMjC4dnlW+FmcwPA4yS6T3lU1oIh01M2TxTv3Fq8EBjFcZFsem6jjK2
 LGqnxwEzBeILlaw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- fix a NULL-pointer dereference in gpio-reg: use the correct function
  pointer when calling the setter callback directly
- Link to v1: https://lore.kernel.org/r/20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org

---
Bartosz Golaszewski (12):
      gpio: pca9570: use new GPIO line value setter callbacks
      gpio: pcf857x: use new GPIO line value setter callbacks
      gpio: pch: use new GPIO line value setter callbacks
      gpio: pl061: use new GPIO line value setter callbacks
      gpio: pmic-eic-sprd: drop unneeded .set() callback
      gpio: pxa: use new GPIO line value setter callbacks
      gpio: rc5t583: use new GPIO line value setter callbacks
      gpio: rdc321x: use new GPIO line value setter callbacks
      gpio: reg: use new GPIO line value setter callbacks
      gpio: rockchip: use new GPIO line value setter callbacks
      gpio: rtd: use new GPIO line value setter callbacks
      gpio: sa1100: use new GPIO line value setter callbacks

 drivers/gpio/gpio-pca9570.c       |  5 +++--
 drivers/gpio/gpio-pcf857x.c       | 17 ++++++++++-------
 drivers/gpio/gpio-pch.c           |  6 ++++--
 drivers/gpio/gpio-pl061.c         |  6 ++++--
 drivers/gpio/gpio-pmic-eic-sprd.c |  7 -------
 drivers/gpio/gpio-pxa.c           |  6 ++++--
 drivers/gpio/gpio-rc5t583.c       | 19 ++++++++++++++-----
 drivers/gpio/gpio-rdc321x.c       |  8 +++++---
 drivers/gpio/gpio-reg.c           |  8 +++++---
 drivers/gpio/gpio-rockchip.c      |  8 +++++---
 drivers/gpio/gpio-rtd.c           |  6 ++++--
 drivers/gpio/gpio-sa1100.c        |  7 +++++--
 12 files changed, 63 insertions(+), 40 deletions(-)
---
base-commit: 9da895e97057ad946b2e727694af3fa5ee51d527
change-id: 20250617-gpiochip-set-rv-gpio-e1e864768942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

