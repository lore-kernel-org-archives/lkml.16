Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45274252917
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447664; cv=none; b=WntP4Nw9BKoUPFcwEwWjJrhJ/XchcHC2r7oX1OefbtDQkGG5BBLbRx5s8o7ZeK+Qo4CdJk3/RkClaAPgiUUqVhUJ/ZTzUb94tX/t3bddcpWhdE54TzooiFm6SoaUPnQEST9VkRdUZkQSVsG/qZ+KI9IX+RAqZJ753LvPp6+dqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447664; c=relaxed/simple;
	bh=fn+DiZ9hmHtFHZaBJ0yup2wbdgRWJbZj6dBaX7075Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJKk+om88wAM1vXc2Jx0Rqc5WX79DBrmnJnVDqEjiyui/es9pUQbkdtBBcgHh8PkJPWrEiyp+foqkfL+H8QdED5pTMHrjpqNQbQIWI0+iK79j/I3MggXPSfLa9QMRvurBnMmYtS4BlZkzbucOTO6WOQC7KfbwFjUGxb9sL7WvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PdyOoA3J; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PdyOoA3J"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54700a463so3981282f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447660; x=1752052460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gFRDPHlPBhPYpwnAB3nm+bI/7JOZSpr774UIl84njE=;
        b=PdyOoA3JqE1LYv8PpTeZ4+vPGgJFMCkhYFZsXFK6XBGePfGBquuY3wGrOWdBMUpRU5
         6+yR5Iov5si0myNhDnzXUHk5kM2GsB+dgzXcbRgvvtuc2uLzG6Z9UoRVnh4E7gd72YS6
         Vz3D5adQr/RmtbM0tzx5ZLu2xGI47h5QLPqanapKiqL9QjRQ+uzuJKLQ0dnGhji2gGfs
         OF39+fbmm4HB/g8AtH421VkAB5BJGhRgf4hu8QGOR/bwmNEyqwGVeGtqIZDrLM2eWViU
         GA5Go9qLs3v7VKsxLMO5tn0KDamfdOwdjecOgx74g3CCVl/gReNgPP3W3iS5ucrzyLLS
         KFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447660; x=1752052460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gFRDPHlPBhPYpwnAB3nm+bI/7JOZSpr774UIl84njE=;
        b=fjH5/CVv7vOh4hKTlQ1vMGJnRLBqU+ijAB4OkifSCuGfp/Fd82hGTw1myahm4PXn3T
         jUSnf8+yHSHNiZlF0A2X0r+nPRv4uqsoX18cTPiGGh+U7kyW3e20cK6opT4cS61CCHEG
         oQOKHFIqOC5MN3xc3huPVqS4UmuunnAFAMvompMz0VjBB+fltfsTBq64bOvhBiHnlGzL
         gjNL77K/DEztQtiB1sOc/EEC5CW62LGTk4tel0YB7dd9qt7b+HwzwQUN1ko+hummnEE2
         781Ves5aubu0ZDE7zFhSdEo2tZd3s5euhDre4TyPOuf1rDgmlvzzeSclCfav08E958nr
         p03Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeY2usE9fQ7x0gdEVuG58cf3cOEvpDaOyThtMrWi0WuJ+rnP8b3ZyxF5+xhA0orP6F7ONtSpA+Ca7ZO4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdugLzUCM8xoJP9ic4TR7V4BK64EhJwZ0ETkz0P48Hg+9Ewrj
	mjO/f8AF/g885sW7hl7oo2m5BZRj8BNhUlfNzW+93/rjnk9cpvKOgUxlXNnt5PGi24s=
X-Gm-Gg: ASbGncvJFPv0J8Tjg5+tHbLBL3J744q4tXZddnk+SWG+93RF4kNtG+fe5rDgLBsMjZP
	0Xf62fclrWiPxAFofA2EVSquMG2T4OGeQdSw0or2GKEqhInXE1yXPsGv7HXjiiPPl9FRCgrKK1f
	LJ7hGjo69yOaH5FRMzzpK8RmwqUelD7NcyqamHLG/mV07kV5rIprepWImg+72pCPhCv7L+JuBfv
	hADSTG/jexmisE//X0hLnX/+Zbe45FV0yyAdI6d9X1N8ANCc1BdiEUm6BCewcvXttYAxXYNO2er
	EgnDhsV0FYJbUdWZDFp2iNJgchXma9Hm8tf8WaJg3Rl1Gc545wlw+g==
X-Google-Smtp-Source: AGHT+IEaKvOgBVbQc3AVstYfDGLuebZpjD9V4E0weFw4hA6msx2v2pc2O9+iMPDV7d2cD14iSyrodw==
X-Received: by 2002:a05:6000:471a:b0:3a4:ebfc:8c7 with SMTP id ffacd0b85a97d-3b1f62b4593mr1675354f8f.8.1751447660238;
        Wed, 02 Jul 2025 02:14:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:09 +0200
Subject: [PATCH 08/12] gpio: tps65086: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-8-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RiT9KYPZUPjJUkrlmsJNGrBCQ+q5tQCHFo0GQajIRV4=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhk+GCiyW/Cax+5pbuuzScmqmztCTHWKXzuJP8YZ3ecqf9mU
 okCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoZPhgAAoJEBGnLqAUcddyZxcQALhn
 HzumMruTT5i8skOXaq7vBezQ67+D44ywos/R/9YyECsugqcOYF5gnZLm0c/JZs25cGpEU/pLe6c
 NsIvsTOJG+l9To2DUUtoW3SHChZ8f2miugnn4C9+H4dN/PyZFRDg/eJbGEn5VGivT2c6Qw+dJgi
 Lg1RKTy/qT5pEZixB1wQ8swCHiSUwDWjPxDAhtzZai/pVF5i/bO+ULtZhHdm0Sp2OLyBWKWcqT1
 oqpSO9oh94luYrY5iVwMxnjs2KvXJd7lG6xV/95tPZ5u+MI4/p5gQ1NO1qK8u0NLOaGi03YdKkW
 dVpf2aB5P2ibvpbU1PyqfhTZRCYaJgdiJWYzwK1uuaf09ddKByZy3QM4EhnlYxjYhMwtmGnxQOz
 bduT62luwT8SEn8bZGligtnyFqcnmIuN+um4aoi4Zy6iAb5FPC/2f8/J7j89ohcUfDtNgXV6H+h
 Rk4lDbQyEHZqKv7AWN8v3InNCoPuERGio04kWmqITxo6ZdRFTOmlcSQDR9r0UMEYgDWkZTRfxKi
 yyNEAUt4Qe6Z4iPyg6G0JLTX50N6/XpQLw+8l23lJa0UFVWS/Xw9OGWMn8yuJcdg353ZJERKFhA
 kDEeJLIei7hTx9otZ3g9MMixXBcNIxyCSGqF8jEzbDEg5DD9B5MKR3TOx1dTqj9sVG1/lSMuVxI
 DH0kD
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65086.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index 8f5827554e1e89b2cc2cac0e43521246fc986408..08fa061b73efcffd5f68724ae3fdc54515d45adb 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -37,10 +37,8 @@ static int tps65086_gpio_direction_output(struct gpio_chip *chip,
 	struct tps65086_gpio *gpio = gpiochip_get_data(chip);
 
 	/* Set the initial value */
-	regmap_update_bits(gpio->tps->regmap, TPS65086_GPOCTRL,
-			   BIT(4 + offset), value ? BIT(4 + offset) : 0);
-
-	return 0;
+	return regmap_update_bits(gpio->tps->regmap, TPS65086_GPOCTRL,
+				  BIT(4 + offset), value ? BIT(4 + offset) : 0);
 }
 
 static int tps65086_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -55,13 +53,13 @@ static int tps65086_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return val & BIT(4 + offset);
 }
 
-static void tps65086_gpio_set(struct gpio_chip *chip, unsigned offset,
-			      int value)
+static int tps65086_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
 {
 	struct tps65086_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->tps->regmap, TPS65086_GPOCTRL,
-			   BIT(4 + offset), value ? BIT(4 + offset) : 0);
+	return regmap_update_bits(gpio->tps->regmap, TPS65086_GPOCTRL,
+				  BIT(4 + offset), value ? BIT(4 + offset) : 0);
 }
 
 static const struct gpio_chip template_chip = {
@@ -71,7 +69,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= tps65086_gpio_direction_input,
 	.direction_output	= tps65086_gpio_direction_output,
 	.get			= tps65086_gpio_get,
-	.set			= tps65086_gpio_set,
+	.set_rv			= tps65086_gpio_set,
 	.base			= -1,
 	.ngpio			= 4,
 	.can_sleep		= true,

-- 
2.48.1

