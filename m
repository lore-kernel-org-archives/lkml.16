Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54056221D8F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275815; cv=none; b=hlRPlSvGZEwbvLiUwfdBq4SUaprcUl10NY0X7A2ugVBwepQPSbk2tP5Wy/97rHdrLVhomnUJA8GhjdoklAJeHgmkiR0JMeFHdWltNRoaMhD9VkptinsJaIkOCcYHmaJqP54+lOcGyLyx3PqGdLvFl5ydqYKmTl/gWX4dFlF1Opo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275815; c=relaxed/simple;
	bh=U32O6gpHaPHK23/7gdVmxwYFuZ9Da+Dn1al7zxctPU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFbTv3dkRpQcDk3JO/+WW26YOtMNaHAOkznSL7/N1nLU9U/5HubDOiNFL2YQcWbAAjU2SF2GWPPkYi38mJ0t7m+xF7wd3V3EOmZxA1UuyWfMWUgLnFCxdAKBvUAFfaajQdd3EmxvlnrWVy9XlfVKHRlLlw/HZQ6Q7r/TSE6sJ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NQr9i1gu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NQr9i1gu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4395578be70so3887825e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275811; x=1739880611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6s/3Qc5kj61ZYPHh1DjfYym66L0t2z7xf+S0LPTqjrM=;
        b=NQr9i1guaRZ21li6lhJGJcRwCw+fMrVW+qxYCy5iKeyCpu2Ye7GkbNJmdiE5JPRvEh
         nqkHKccJIIGqu7MQ/1KoJqPnndpFjx6t430IqJGD/i5n8WBfCw0DwtW2RXU8Ybj5kKyD
         ihkC6nU/mgJap1vzJR+Yogau/eDGpbd0A2NIl7z5lB+ZGIFfE6wF3qtry9hQtA2yKyuQ
         pZVBUVTWbNGgftWyQ7lUfDq6Eucq5m1O46n5FZWqZYUjlh2Gq527DbJuj2Huy6iJpuw/
         koiI4t1vJinIWJBTGDxe3Fjj6oEWjEpixay948dMi45HkIOOWzC6LkwDpR7iw8jeF0Fj
         cY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275811; x=1739880611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6s/3Qc5kj61ZYPHh1DjfYym66L0t2z7xf+S0LPTqjrM=;
        b=sHZyY/Qp5elCRXfWNL4yhaMchXYjPEMsJgV646aBBK6o5n83GZFGuX0iYP/uMGawak
         3jf5geQQUI+Mvnx/mcLVT8saONayMxwwLFod8Lh2D2H/U3QML9xVnkSdcEPMDQ2ZtzEX
         1kFcZ9X75VbCWsknsjMUKDgYLvMY3Oqb4xP3444Q5CSZNoXUxwln29Y6npS+bsQfa8eT
         0ktfaZpHV6ysWJDwNl1iEt9kyIF2wWOKqS8Dnuc4lolzJz6T4ZRIUgRL78knsahV1Tvp
         DwLWGGMmnA3oxSxWAqm7YouE4vxygtRpfII/XYBPvk0Qpra3gZP/xnNn4HFwhJruXP84
         M2kg==
X-Forwarded-Encrypted: i=1; AJvYcCVsJ5mFpZrlCWUsB1iWOmLJjzsx0t1hJwOHeZnH5Zx2zY/IOFQneKCaTHkCVzBYuVOqf+09PBzFI0/T82Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTiF6yqRAffPuQIHDIXcUhnd19VCf//nFE5bScnhOcPZgC/EL
	ntP1Zo/slNnJg0gA+0JCU7fY7y2vWP4nmwmUasDzkYoZ37fhwqgRgRHyjiWsVq8=
X-Gm-Gg: ASbGncvPqaJLy+AlO/TLvTcH2aT6dbJwAnPbOtofGa/9P99K5mT1yXjMtr0+mTvt5dy
	dXpa2KlS4Z9IydgSZPSnItxov+h7pg2ES5zY2mY6Zr29Cm03E0b5q15kv9MeyNu0vuKro5CnN3i
	CUzBlGi2i0AyJlFXXMETv6zTtsQ0uNwHMda63JW4DIiz+doLqbKmBO+ciZlr5t64J/0FY6qNh8K
	oI4C/Kn5x8VhGfjDa3uIks/hAcAHQp1Ro8g4GziPvu44RMPpgWbOecIazTCbx97Dl2wZxsXHcWm
	kcAu4x0=
X-Google-Smtp-Source: AGHT+IEAg/pd03kYibzlfvSIvaqSVi+PbHjfA0+hJLFu7VnMhfg+SjjsM8kKANNRe9M0XCJR/yb96Q==
X-Received: by 2002:a05:600c:1911:b0:439:3f09:9f57 with SMTP id 5b1f17b1804b1-4393f09a24emr71567815e9.28.1739275811521;
        Tue, 11 Feb 2025 04:10:11 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:44 +0100
Subject: [PATCH 10/14] gpio: max77650: use value returning setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-10-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7Yn+9j8mSRoVcG++9lBVBUXAn3Cu9Rh2EzIAuG2CoYU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4XuECycR3qhOz/OYu84vZrJcUgcvNbq5Tw/
 AiFsff0T9mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FwAKCRARpy6gFHHX
 csV1EACd44PZNfM4fIZiQchYANBJsGiF5TjH6x92VBA9EbWxUhZHbq0f2O4Ts6dA9ax0RAGSIS9
 wvQdN6uEu+kWvZwFHQ/rl3WSMK+7hOkjHhd0oMNttZFzo2ZNtcZl0wK01L5joMszeWMDUtZSnoS
 kRXQQzk4mAlwbB6ptn7UXFyKiBmVJmQiuiiDDrVuoKLgpBZKqdv7hQD48slwxlchf3kgS0KIXFZ
 OdzSgZGr7f9XE4q2SSAxAD99q4aER6nZUpyY/ufo9rpY7xrcj7zNr0bii3QLdNLFlCbjROBl+mn
 7mtA+ctGns2QHZvZ4BVt/FVdDsIci4JkpHSR/luLp5/jLnMC11pyA+Z8sR1+ICDRCVVLoDufjBG
 awKgUEjiKWj0c7GLdN44qS2F3LU/+6E98ESik/eC6MBgo26o97V8xUIpKG/F7dtaYaqvUnomZx8
 HhGDOd6KWvJC+pr4/m4dUV4IEGJ7g/XouYcWL33Zv9HfkvX9TNiqCyIE9fMXq9aajYWS+2MJjLa
 nMYkFbSZKBx3STNd2niNXLth8tXt3r4ywbG9dcY7KTfjv8Pynj57ahcwj5ZFQV6huDX6IuvmZ9l
 9mun4hkh4bbkdeFMsHLVYbicg/UIGZYQWxu9vYYeJC+nMmMk/cIwrLU6FffkT9zo8WsnHeX2gS5
 3G+BFNOoyuFy0FA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max77650.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77650.c b/drivers/gpio/gpio-max77650.c
index 3075f2513c6f..a553e141059f 100644
--- a/drivers/gpio/gpio-max77650.c
+++ b/drivers/gpio/gpio-max77650.c
@@ -62,18 +62,16 @@ static int max77650_gpio_direction_output(struct gpio_chip *gc,
 				  MAX77650_REG_CNFG_GPIO, mask, regval);
 }
 
-static void max77650_gpio_set_value(struct gpio_chip *gc,
-				    unsigned int offset, int value)
+static int max77650_gpio_set_value(struct gpio_chip *gc,
+				   unsigned int offset, int value)
 {
 	struct max77650_gpio_chip *chip = gpiochip_get_data(gc);
-	int rv, regval;
+	int regval;
 
 	regval = value ? MAX77650_GPIO_OUT_HIGH : MAX77650_GPIO_OUT_LOW;
 
-	rv = regmap_update_bits(chip->map, MAX77650_REG_CNFG_GPIO,
-				MAX77650_GPIO_OUTVAL_MASK, regval);
-	if (rv)
-		dev_err(gc->parent, "cannot set GPIO value: %d\n", rv);
+	return regmap_update_bits(chip->map, MAX77650_REG_CNFG_GPIO,
+				  MAX77650_GPIO_OUTVAL_MASK, regval);
 }
 
 static int max77650_gpio_get_value(struct gpio_chip *gc,
@@ -168,7 +166,7 @@ static int max77650_gpio_probe(struct platform_device *pdev)
 
 	chip->gc.direction_input = max77650_gpio_direction_input;
 	chip->gc.direction_output = max77650_gpio_direction_output;
-	chip->gc.set = max77650_gpio_set_value;
+	chip->gc.set_rv = max77650_gpio_set_value;
 	chip->gc.get = max77650_gpio_get_value;
 	chip->gc.get_direction = max77650_gpio_get_direction;
 	chip->gc.set_config = max77650_gpio_set_config;

-- 
2.45.2

