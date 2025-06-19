Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3870266EEA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322016; cv=none; b=asNVkMbTXBJxwMGng8w1yOz6URCbSsLl6wTssBwk70Csg75j7YjlrKgs5zxrbOw1jgauDR0mX1MZhPPEixlMYTr7vwwhJ3tPlxR0nSnR0krhR3WK+YAvh0q1jDyWBZ+JOTxqWbmYWX0iK4AGMg+P6vbhgs44m0rH6DOh1NnM0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322016; c=relaxed/simple;
	bh=KyzGRm5PzFaaCx6vaqmEFT/UHLNaTRS0BfqoZ2z4ZkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJeuQcKHa4DxIYCFN0+XXDz0GF3QaM0vURQrxQsjoxnilOJRlKH0C2z+r4sjSbf79XDNxmTVcO5DEXV90rxhwiljo7y6LOppPn00+HXjAt6kRPZWh0pcswOCYEfdLWcCd7cSOJ/5y9PqwG1Vs0XOnLrr674pDFX9+BBJ2WyS6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iAdD94qF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iAdD94qF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a463so274713f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322013; x=1750926813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=iAdD94qFvWGppkwFRh/nDnZuzgMBWiwjVN8bqYdEksYXHYlDWwgG0M/rug2K5SbjnG
         8aKuit9eP7531YEvIbpYUOfbJnallHS/bbSQwMC3mu+AYiuKlJlyepLRoLvxcJ+bbavD
         DunzRrK/8KsXMODgUCAr9No+xPtrVDN34qVoQ3dOytdkLNGmoBHYaMe6zPfH3h4PmgLO
         ZM9s0K5HpDfy9ijNsnu6ducf/156sT0etzMFx697bDOt/gYYvQylNmoSaZ4GbURZKWOA
         teKH5ww88yahRT4jFiV16ev0K6U1lzw3Tt9nyNqDcpbI8Vvq0MzttZzXq195mjNFoIDa
         A01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322013; x=1750926813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=AALYv11sO5wEJpu5QzmuhBoBIi8O3cCBTatGGleRPVuQhhwpSQ7jyH7uPYa+XWr3x+
         y3WUHSRAmsoSdPlRIriDFljuQVuAziM1GeagpZQaPqELnJuO6fpMrM8uKUAKIfBXeNNa
         D0u8d/aUxZdjJv/xfpu/JL/BnQtJyHswu00eQ0N3MhGdtYed2I4qnk76zokWZ+1is4gr
         IOsebJclGQDDUIn8TjZTZAhlxiwY680v6AwXoBOtkSVeZQVhYCNBL1o4g1ZBRztR9IJJ
         9YcG9PDiF0M9P9rYGZ9i/JYsyC5CJHnQXa8cI+R8xbuNQn866/p/fC1ICxIZu5RY8dYY
         c/vg==
X-Forwarded-Encrypted: i=1; AJvYcCU73QSVtCFC2zOZTkiWYxUyKIH4mgWne0g60Tjqt4ynwr8Tb/CPiFzQKajaUIptFIgtceCNHsPbne2bD/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSsl+Kd26/prZZmwYtgQ46xbhO53L9U5GUiSpFoZVLmCQnucG
	FhSEurszRR6a1rPnbtVfeZrMnotzLxEMNLNVrbF3hSHmhkNlelsHTiEbI8GmwbPYn2Q=
X-Gm-Gg: ASbGnctqCStBJLmliJ+qmundlysEIX/+6xdlfVq0GL5iQccJad/4E6MnUJ2UggVI0AH
	OTAvR75qGkeRxHonP30yIiMZd0Rj1IQxFmvm3M+29UgBPypyfFwVAQXURd/onxHyr+qNByKi8D+
	zOuHfJUM8Khnapc8JdYYV+7z4jLOBqROlktu5c06NeABIZXvtpvSROQsaEH4LH2yUh/Fc7ZlFTF
	MVT49v7FWul/qlupXYwFbXwSquPBmCGDWi03XnxtYXWcr7r88vLwfe3YBD+Qfa5qN0tRhz/PGnL
	qO1EA8FdfzF3pET/AiKpwTn3c5x5tdOqhJ2W9fdQw+/pymn2AM39YAoG
X-Google-Smtp-Source: AGHT+IEYd8zh0M+GIxvzO+cbczfDdVgwEB9/rBo3uvdJxipNvbLdwuD0peBA9caOs/ahFdM6KsbEFw==
X-Received: by 2002:a05:6000:1448:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a6c96e5663mr1866539f8f.23.1750322013194;
        Thu, 19 Jun 2025 01:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:20 +0200
Subject: [PATCH v2 07/12] gpio: rc5t583: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-7-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2356;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aSlqvGnhuSY1VlIGZB65GCCYVPKtjnadnIRxz6DCqho=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhTy1KgqNjnmKmQLkXGxxWam8m1Wn84v8Mmm9k8q48PP1VEY
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoU8tSAAoJEBGnLqAUcddyFFkP/3zl
 9RL/sxOpe2l7ZXx8muE1QdETZweVSf+QCakclyiBOlu9V+DX29m4PgdsLs7RKPBYR0bOoIDi37b
 cUxvgu1Db2DezcO6Hg/kISB1+kKTP1ra+mLibE2HkoRO0mGxEZUk5K7kWPfZxSjj0TkNOmIYb0u
 w0USK1lo+9vZbTXvUhMyxNzwP1oIzKV4EWICo7JXE3Yb25kPiera8eYaDQJmiGVzqsx2zlhOY4y
 7JpKNjCYk38N9bAJpcMTpRe6X0HRqLob3wwRAWArAqfiyx4pM391d/laNhzmaB1EXW1G4p3X//z
 kXkuOi4cLqMXpbFt975vL5Aio5buuqcB83ajhxzy3o4j9rx2josJqR9yLf6HyV/FrTjJPQNRHw8
 NFmhK39BfihcDsv2CStjI+rOhyR3whWppE+BvJi1H/Coa74Nsu1RblwOdUZzsvAY2NZMdgFXeE7
 X+5yOnzSdyGBGTPyO1Nmy9T/cPj8C0zokeHVrUU7+nsQuYPa5xy2UNrO8KoZoZytP5mmMTmmupL
 JHLECUgyjbL/duwYUzSsQGm3c8sEogb2FjvnpzeA0Ryk2j+tI7D0R03WcI9DpCgUNZSVWpGgk41
 TStG9T3DmCHn5cFwFUUV/EdG9woFsowNaioLk3P5F3nzAJk4sqhrc1Ge2ABs06g4AZ0JULQEtRY
 L7iFT
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rc5t583.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index c34dcadaee36d5fb775d4aaa8c8f8b275f4e2382..cf3e91d235df2eefc7d0fc93a58824edd55e9aba 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -35,14 +35,20 @@ static int rc5t583_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
+	int ret;
+
 	if (val)
-		rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
+		ret = rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT,
+				       BIT(offset));
 	else
-		rc5t583_clear_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
+		ret = rc5t583_clear_bits(parent, RC5T583_GPIO_IOOUT,
+					 BIT(offset));
+
+	return ret;
 }
 
 static int rc5t583_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
@@ -66,7 +72,10 @@ static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	int ret;
 
-	rc5t583_gpio_set(gc, offset, value);
+	ret = rc5t583_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
+
 	ret = rc5t583_set_bits(parent, RC5T583_GPIO_IOSEL, BIT(offset));
 	if (ret < 0)
 		return ret;
@@ -109,7 +118,7 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 	rc5t583_gpio->gpio_chip.free = rc5t583_gpio_free,
 	rc5t583_gpio->gpio_chip.direction_input = rc5t583_gpio_dir_input,
 	rc5t583_gpio->gpio_chip.direction_output = rc5t583_gpio_dir_output,
-	rc5t583_gpio->gpio_chip.set = rc5t583_gpio_set,
+	rc5t583_gpio->gpio_chip.set_rv = rc5t583_gpio_set,
 	rc5t583_gpio->gpio_chip.get = rc5t583_gpio_get,
 	rc5t583_gpio->gpio_chip.to_irq = rc5t583_gpio_to_irq,
 	rc5t583_gpio->gpio_chip.ngpio = RC5T583_MAX_GPIO,

-- 
2.48.1

