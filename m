Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D032620D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096678; cv=none; b=iCkalfz7l0TdDvp0ihOr7v0eqFQgW9Uy23v2QcINrageG7JMqtReXZ4uoUP5NrFkzhrPAaDsjxxspgb5J4yRTBI9TZZa/2eRciFlX08EF81csx1gUXbkNb7WSgRC+8FLGKQNqFryx1YPwgeQRZlgyduUSEszgoMWK73YZXwsCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096678; c=relaxed/simple;
	bh=MyfYoAl7StVsO4BW3rx1l2AiXfWRq1lVePaWfhahBeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWKA2HDzni5WtsIOMpoqeql5AMpS6aNGlNhfJGX4yNvZ7QDjNbkUi5lsQ01iDyj3/LNu8+Bi3V3RdqW4D/ivU2bkhRg+sf+djbdbBH/eoEecWoU7f8v0spuCe5PNsdGnPifkyCVn5UGk2iIWlaSHiTY7PxsENHYEAy/a62ItyOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JOB7cEOy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JOB7cEOy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4559747f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096675; x=1744701475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVFJWADW/y0RMccjVQrvsZvTL6Kql3Z12L3/megvx2A=;
        b=JOB7cEOyJmtN5yX5YsH9OtLzPST66qUwqQ/+1oeJ8tddyJnSX8KUj45gR6UuERNBj1
         H9SBFzz7TfqC00EdMfEbTmmzNwCgJwIKM4tJp+JyZAuFemvaAqbjG5TfbEZLqKCCKzVx
         S+3m4pgl9Q9uuEHndfdXUZAjHTeDdcfKDy7xoOakjqdnS27hdJavgmH6NS9IHq5j8ZWP
         HJHtK5M+TbPMmFzEo1gDOKeBYzZhmqaPgI/O2O/BAAspf4uXVPn+e16P9xP9W3M788l6
         z8/h0z0OMBBXHdZUuRk3JaFFaLKvGEpdaOCymHJdYKINEHh3hb7ZLFXPcvFo+2kTNsQr
         UakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096675; x=1744701475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVFJWADW/y0RMccjVQrvsZvTL6Kql3Z12L3/megvx2A=;
        b=KwH+HZC2YERjsGbxkDWIZxQajnE9sws7fsXAvyRRtcFAzovFStsOFvribEXFMMJB5i
         OO9e8tCyHzNfUXJw2Z6EDa+QweYUN8Htx1uwzn21x7I4bXWgzycO/mXRYEae8RiumU4c
         qBQlAajbwy+wJO2Uo4M4WpBel5GOMDym8wB2k4Qs26RPsfWLBsH46gXYf7AVc+5Dckah
         2Ml1r+GgXKV2BmiSDhWjLswYbM/Ybh8kIohmNY6AEmodFvIltdDRwZW1H9wEqAf8Nxhb
         Y7JSPb0KNrmGR+8+9O7Dmm2QNJPQdEWrSkNSUnRww/aR73bV0TgjG/FR+pjs3DSPaADu
         mzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjMr5N/r75VVcCZbNBSMLrESKJPam760cJLZrtjMhF9TGgy2+Q7u7EiR/szqrcee2gQaaUC5DXoCxwD1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiiIPMmR5u9VLiNfECMSm1aFS66AxFp2Nm0+SM0FIN/a0j9FD+
	sDzqb08pv5n8E+0zOGUMjl2wEeFtIBGcdT/4t4xR3kSu7ocKvvprk6ZKcB1xMDQ=
X-Gm-Gg: ASbGnct8jcrTIg4rjApsCcm4ZwP29Z77QSffoQ/DubsSDo8HarawrgJT+Hj+uP+BVSB
	Ymkc63qn62cHY1D9QIcUMLBj9e6kG3UyBKTXmGQYaUC8NfeGgNllTBm7xJQAP+5iR7h5EeISekd
	QwmkIXJZ3jzeOWFtEBFsbOW8ea2qyMAGNXDxRRivgEdl055mhLzET+FpyidnTf00RkcePm5YYd1
	WWPwK36TDjtfD5fYGnG1b9gypTdgEJPBkXb4dax/Vw0aFu6lLg9VjSYmO/SSJ6XG4KNRjJfqS+G
	fClI/UjTgBAchiAt/i5L0HYb8R/AQpottnpfUw==
X-Google-Smtp-Source: AGHT+IGb12K5x3MyGax1/meWBHx/ceb2e/LqJgU9QQIZHIFbzKHDCky62yygJ2VTuSCj50YJyfE4bw==
X-Received: by 2002:a05:6000:4313:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39d0de679d1mr13305391f8f.47.1744096675082;
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:42 +0200
Subject: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=S3igGGikbfII9kNPL0KKjqnS8YUnpBiOi6WZKLdujUk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a21smivbrNX7hovJ5AmOVQjkGrJhwqOgTw
 9GIegrUEM2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 ci67EADKEh90ymTKMGsCY74l9LHK8QIQ4v/81+Rc6Eqfw4wVjL+lPNaGTcSBP2utqyO2KrQMMFw
 Ud7MCMHcZm7kzMCKgZhr4Q5hxKegKb2tXZsgsyhV8YdIebBSZmZS3xjHm1FTslGntrxTtZfUcgD
 9Ncx7bkinKF9GE+JhCUYTwm5rX/ImXZPua18/+263zoA9IcowGvpu+sHiPYBinPQTG/NzQUeczO
 GStvT8lo/PvFW5C2evtDAAac3WkpMH72Zd++nH3ZSzFjmh6wa+JuZj4++IaVtdQvf34/rVmBvxm
 6lfHwsxcLCcvsiKLGQvJ0pyMUTgjTXWuCVx1yI4OFqh/vGStiEpFn/FM4m6cgY2+8721nFS0XSg
 skTUnIqE+icmuFIxh33ZNyBinNKoXfA262Dd1FT4UU/UGWwK/zVzRXebNxxuWVofBCrpGfvckJj
 5An31hmmubXfJwwqfo1WCobGVNTYhODCiiFTT1nEEdIOgEF1ogNVoLg7ND2vY3mbvxs/m59mrBt
 Ghvcu71zj2ubCbOCger+FJ91d0OXgTTDx3l6RxskE+/H9YiT3YVPYtaxsW15NZ/wrgk3dpqh3Pb
 pxgF2SOpd2n46VLipFyjCU5PmDaB9KG2fyxu5yKFQym8Uk1AbdlkcgldvEzqzVK06tjwV4yQehq
 CrMwCr4lgCvIlLQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..e7485c82089c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -580,9 +580,9 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 					      gpio, value);
 }
 
-static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int meson_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
-	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
+	return meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
 }
 
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -616,7 +616,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-	pc->chip.set = meson_gpio_set;
+	pc->chip.set_rv = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;

-- 
2.45.2

