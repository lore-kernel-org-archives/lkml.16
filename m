Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1683264606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322019; cv=none; b=J/tQ2U0jFkPnKZdy6xDAwRRHDwFzMYGRAwEKFl6gNEA9V6TlwW1e3d4uQBtPhojC5k4Z8e9WVYSbVLdrq2hTB6VHto2k10kNe4YoAHN1wZhX8ZiohGk/X+1Kk5kkXM63P3W9Nmii3RxsKHKrdZPzQIUysbY8vCuS0rYQQHG9GjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322019; c=relaxed/simple;
	bh=9Zaxzyv360mf7Zwzu4QdvYgk1SpKcZsIH3LbMJy1S68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWH69eW37aaCzR3uUHSHhP0VrFoXCQI1+qlkLkKCCVdwst+DoC2PdrteLqGIg5EnkGF0fm470UDrh8Eb3PJpOcI5W48C6ZkReWboTV+/H2rTONeVqWXCx8TerKvSgnggHZ9HrwmZJc48uaC8OEjw8+pRHXnaJui5S45AB+AmTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jEJz407X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jEJz407X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so4272455e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322014; x=1750926814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=jEJz407XT+C4Cri6NiWAGlY/pHMuLy37X8bIUvd6z2u53rJrx6UjALcbm7qQG3dR+o
         bRV/1RFwC5wd7dUR27q5mPQLA0FOWpzOVLYH/nOU9C9KawZmNdjqwVanYzBcrLny0rrc
         f2c8eYpG7BeahtX+rFdlnJg/etIaDaEjN1gBC24IU0H2E6+DshxuXaf46C5rnECIYJeD
         uGy3Xm0t5PS+BO39upzHDLFY0/6d6J/HbUSG8MD7nG7laJ3W/MCTPOyWVyPGh78MM+pG
         VBQAlwh+TmV9EO98mEy2AsqOMXtpDYjwGbbt9si4mH+jExrdz+mIYz4IzUrDv4002reV
         Smhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322014; x=1750926814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMHaAkSc/mi83kBCslhtD5+Hl3KktEIZpzS91Yh6h2M=;
        b=WXZSh1Hi0k52HWhUVHrxvCtc7+dMnwW/SvYpRkWNLVpzHeyXBsnZtZ0R06X9EVgdo7
         tXXRiQXpnE7drcGhLZNYnLrielZZ8lnSX/6yPP4lWwTAvb8k3L/naTPE2s6L+HD4JeiN
         HFSwTo5lqIlOMUDT3xXSNPsRHgiDdyLS6Ol9dQN3XQzLIejQZ1ozwrv5l1ZX4bU69O6r
         dSvV/5ZxoaZo3AQ9KaIBtfmKWaJSYGM/o317e+GiM4THJ8Iusqb0PMlgPEJgUFgFlWBC
         YS4BC65sD6CF//b+mNDHUP8Mq58wrcvYmfju4SsngroYO4iIauySyOhL0LQKNFkXugBW
         UgRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0pj+h5sjfLzXObohOSCgYWE2+fivnLYnfbo4xDCcuHXGGDzbG7nch0POIxbZAIOnm97zdubLXxPBz2Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWRr5oer3T8K0ZOXYDOLYLIxmakyTrITcVNcWCTa7m8OUiXR9V
	jXpbdNahdOEe2Gj60ep8YlIfvArZTAU6x/j8o1RdGkzQWr7KUtpgwabOWqXrvgJxJeU=
X-Gm-Gg: ASbGncuiJ+3EYDYeQvzOkxpVPF5BauT+OfIfcecduyy4YkG78ecXJLSgWHKWFVsxldM
	BIck6TZs4WHT+1SlL8A6jwbUkYgTWl5JzSjH/jK5U5p98V0bkm7dP4UBz5aKtHCy/Rx+qS2YXtW
	yMBf3lf6uMx3xosU9m/VMDvgHtQgrX0ad1KgKLFSGUWUVInqKPmsyInmtHhoJ0oUl2h3HSOq9ui
	sivbyZm8nsN3qyn05conMFmdrIDP9VvwF81SNyhKwRqYDWBhAqULmzmY6g4OUM/diJRiDMZvYWJ
	2tFvkSXmN5gCwr2sICmC1101px1KXlYTUtwyESHP/llUeo0Oo4kcTUl/
X-Google-Smtp-Source: AGHT+IEhu8xC4VxkK8D9y/IzWa7IE8mDdOLXw/zM9eziYcYO06FvESnlV4hQatzpue43BXOUc1GptA==
X-Received: by 2002:a05:600c:674a:b0:453:dda:a52e with SMTP id 5b1f17b1804b1-4533cad28b6mr179151175e9.33.1750322014059;
        Thu, 19 Jun 2025 01:33:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:21 +0200
Subject: [PATCH v2 08/12] gpio: rdc321x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-8-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/FTgaK1cWGc0DF5sQuXKwdEauaSqv0NFqrELnWAzquo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tSnuKbzHD0kBPGGPIrGC9b8qHlgSZpDe/Nl
 /r9LV/9112JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUgAKCRARpy6gFHHX
 cpppEAC8RwVAaPlajD9OEFEZmq9MCIAXiIYRgG5/b2nHs3KNntWqL//mWx9dmU1WzpQn39fw3Xq
 54qItaAMTtJVR7Ok6px0QA7xvOmK8exjF0AibgNZWkDnDu0jxXoOS0lUjn91yY51gL1LIqNpK+/
 m2GfPgRLaDPRy8sDWUezXb+u2HBhpOLWWRX33x+QTPVB4F67ri66CvcmDCiVou6Kyy7RNCEwRO8
 t8+lVxl5KyE6FNyAX3+nUWFq3dVOnLGcGK5AEbpKhF9Ho7M94LLbTthkWETb9dG+6BdpPEzJn3X
 Y6ZenbKzHOLjRkv9g/jb3ivNuMnqWedVOoQnC98hoz1DXHWtakIS60+xX7BJUvJc6aCoGiNhOe2
 o5I9kBFYOF8iwdn94Hvvh5+poPJGpuRaIuX8Xuikqmvo+b8cU/UeC16gHp1wOLnOci9bz/6SwK5
 IU7dotGSRGQAAXKT9q5y8Ue1723khYjt8QYHavZA+R3s/SvWCY4Qu3YL+TkasH5x2Mn+Bpe4MYN
 c4EKErHmU0mnLxxfIbL/lYKmkqYN7uOscb5iJDYkd3R0GLE3mBBDeAfeqGpqoZRXBsx5JX8HZe0
 OByPtqosTCnUi1LkQheHJCv8kNnRTMl6iOlz+6Rw6e18MCMvRGFVWQm1UkdwUkcjLJAqQniLweV
 B7jLW9cNfptPhnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rdc321x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index ec7fb9220a4747fad5dfdb88e25e68d2a104e37a..a75ed8021de57db122938e4736c3ac994bcdd2d1 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -64,8 +64,8 @@ static void rdc_gpio_set_value_impl(struct gpio_chip *chip,
 }
 
 /* set GPIO pin to value */
-static void rdc_gpio_set_value(struct gpio_chip *chip,
-				unsigned gpio, int value)
+static int rdc_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+			      int value)
 {
 	struct rdc321x_gpio *gpch;
 
@@ -73,6 +73,8 @@ static void rdc_gpio_set_value(struct gpio_chip *chip,
 	spin_lock(&gpch->lock);
 	rdc_gpio_set_value_impl(chip, gpio, value);
 	spin_unlock(&gpch->lock);
+
+	return 0;
 }
 
 static int rdc_gpio_config(struct gpio_chip *chip,
@@ -157,7 +159,7 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 	rdc321x_gpio_dev->chip.direction_input = rdc_gpio_direction_input;
 	rdc321x_gpio_dev->chip.direction_output = rdc_gpio_config;
 	rdc321x_gpio_dev->chip.get = rdc_gpio_get_value;
-	rdc321x_gpio_dev->chip.set = rdc_gpio_set_value;
+	rdc321x_gpio_dev->chip.set_rv = rdc_gpio_set_value;
 	rdc321x_gpio_dev->chip.base = 0;
 	rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
 

-- 
2.48.1

