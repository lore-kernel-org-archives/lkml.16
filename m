Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838928B7FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874631; cv=none; b=OsAvr6ur5G5pTFWGOKO0qsTVDUblMRmeMPg5S9tgrXvAbZK5vwuCs6ghgVUtOKS6F40xaI8g3ngHjkWY4wRbeIWqrTign7KIoXYdoiJo+v47xvkwS5FiVqotQQs+qgcTzo2+An10mOng5d1Mk1iylspZArsNK28noqoMFd63tMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874631; c=relaxed/simple;
	bh=ns4HPQvyVEmwd6DgqwghvAqtJacXIUmRanS8Kt/6WXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oD0+4vdKkT23e72wX4UEiXJvUiUvowyA9o5/MzC3cxGIRIGNyK+tL+ex81R1DS/g98hBhdw+NFC8NinJXcg3cithiTfymr4UXZF9hiCKlT72UOXFTobNYeKWpYRTsVXxnr4PTo/Oz278aQFG80tp+RhTfFqbPHgGd6j4zViScbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r5KW2CEM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r5KW2CEM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so21840605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874628; x=1752479428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=;
        b=r5KW2CEMfxIEzB6tlqjxNxON9QH+IRfEl+EEYURHfZQfQCVcI9PskUWze5UklXBAC+
         v8CWMtzpd6yNZXZzIQ8M+trVT06dMmLueac0ty/rjZ7PH1ONZn9/0MzIbcK1j4amACLv
         QMyGN3eP0zxCPrQ4o9bHQAw5x2pb19Vc0AiIKsIASIAJVfuiOfmU20JkrP25TGU0DWgN
         K2RgavESLWZT+S/miF43agNupibaiXgqv5bGwNkj9uQbMVCT/lUgdIkgXxu4bT6f0Cja
         qYy/qPLvFcaWgKLD4vmwnI248ySfGy2qyMtxFrxVvVQjABEhpXdUB13aX65HNOMOPm6+
         Bp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874628; x=1752479428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=;
        b=HF8GEKr/TTXDFX4Raiu9W0t8iaM7ysvAqyvd3qtPEXqDk21vUueatVRDGPh93lZIP2
         5DnTZKafzpNgZ7pTbQTA0+T6PS+cVLV/ersSvnZVEvg3nDc2qsMc0hy+0rGr8Y2a9m2a
         DKGRUyk2rExUjkefGIcVll/w2yIMvOBxOqtOZze9sZLlf6SmLJ6OiMc14gOyTBpdWazz
         43vmVeb1S2BlQRGVXacCp1mF1BI8Aa2yi85V0CHsQ6AWz8RVcEZZ4bqwMH6CVXAQJ0yA
         cWfqH865IJz4XK9xmt/Y0U8GYCOZIp8WL0S6OER6/ykwk7fXbeWioICgAIj75Hl/+t1z
         puDw==
X-Forwarded-Encrypted: i=1; AJvYcCVSDH6AR4LWSSONclt/dHTelLrwSL/T2PmSg3dzSVu0t2HZltM6136Oa0dX1DFv3Ask46Yo3xUg2zS/wKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YykSePgTe4EVfWHYOBQycrev6xE57D2mvY6hbU0fZjeX6I6URYw
	txT0opBOwqO/kRcq57DXRj5h9XyXPQNvZUmVFzt3hDxt0sFzRo/0jChq8xAkIFGqM9o=
X-Gm-Gg: ASbGncvfIrHczsiALTOgqXNWR3hgYi+ejzQS6xw4nnKCP1e0QJrnHDYiQwbOJ86dgsa
	LkBLjDjt8bCU73wL+s2/bnQnpGw8BI9NUMOTUQdiFyn1X9DJOBRi4i1Rh2uW0k8CtXaC36C0b2T
	a6uZJ++H4zw3wjFZ0GC2a+wZQyCyxkimpf+77kY1htCJ8nvlaMKmLbzyYqfhrKpkuHGmYWc/FAU
	13q7QIYmXQHlzdYLLAprvfG65fYriAbyd8OoJwJYr5dGqkppMzTwd+UwvBBYgAaEA2sV4/WGb2c
	RUy2efCa1ZWlEe1rZ8rZp8ro9+uiiQ+gbVdol07CqvwK1L5eQqY1HYjX
X-Google-Smtp-Source: AGHT+IGlE+pJSFOw6vH9Aqv3avNwNGn5mFUP5UKn0Q9HP54n73BXvlRB3Kq5i+TgrQRQO3lRBaB9xw==
X-Received: by 2002:a5d:5f55:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b4964df03fmr10640130f8f.35.1751874628016;
        Mon, 07 Jul 2025 00:50:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:18 +0200
Subject: [PATCH 05/12] gpio: tqmx86: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NgRXFxECTIGOfluzrXyJwaqY8NOQtfYF0rMAtRS6Rhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6ErAw3SowptdZuCyqLCjwppWgEQANfdpre
 IzHnSXPb+6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 chTnD/42+6CRgyNGdp2thzTybYnTiJryeQNSK/Lx2NfE2jcS4iboKz75sI8BXNYY1dR2bcGRQay
 CPk1u4V3Ya6I8jTXAZUe8S2T6ELuz1oNMQ4yvREaony2TzhBuBG8ffMuDZF0z7Bu/og3xtySKkx
 oIz3vRU/p6GtI49O5J9DpHQE8SBUg9Wd2K7rmcUklTTcmnOuIA0WY4Rj4reZHNLUeQ2nqBtIsL4
 6C24ncTwFj/e2YNxci+6lYlsrG87UZOJemMomVa28JW/JR9pxgVgLCwxQYJgggEIHsFvDPl1dDn
 V4VczZaTaTRb/CqRNawgRzseqnuZg9sNOhpWEpZtqseGjjXqVDzJt5mf0IZMPIQjGp1FpzTfDm/
 xoWSQ9rffO5MdrZBkRQ/XrfL8M2e2TfMcDDrijL4XEi3Ia8xHwhF0YKj7QP9YOoD058yxCg57Uh
 on8oGG1tn6KJgGp5RWKiW+Kml3l/NFyiNbl+yxLKMo8u9usCBkVOo94NoeTeLpphdQInkVbAO2b
 xJ5tj+q8rStmfUmkNaL553TMOEdsYEp+4HnnXLmbznSZMuVg1VuJYRXEhGHBfN9iiPdbHPdnT2T
 MJO5yz11R8Ck8meOOQSEKqfECz0WdrCyazIpGS0a2CScrg/HGmvsjElOlBmKwWqJBTuz7lGtNz+
 AzbrtTSPCMbmASw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tqmx86.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 18f523a15b3c03e083b363a026e751f7367fb080..056799ecce6a256f3438d9fd81ee4677cdd20125 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -93,14 +93,16 @@ static void _tqmx86_gpio_set(struct tqmx86_gpio_data *gpio, unsigned int offset,
 	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
 }
 
-static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 
 	guard(raw_spinlock_irqsave)(&gpio->spinlock);
 
 	_tqmx86_gpio_set(gpio, offset, value);
+
+	return 0;
 }
 
 static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
@@ -368,7 +370,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = tqmx86_gpio_direction_output;
 	chip->get_direction = tqmx86_gpio_get_direction;
 	chip->get = tqmx86_gpio_get;
-	chip->set = tqmx86_gpio_set;
+	chip->set_rv = tqmx86_gpio_set;
 	chip->ngpio = TQMX86_NGPIO;
 	chip->parent = pdev->dev.parent;
 

-- 
2.48.1

