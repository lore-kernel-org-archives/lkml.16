Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1ED25D902
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188057; cv=none; b=ghXj3V3Fo1qyFIlojEBUue3TqrARY/LnIK1vBqxbvO6D1PchqdXWDxpCzr5ggruG4oK7GhfEok8F7c7Zl06UY4YJvLc0nCuLFzIm4L+AaSQgs4brXSss47GBI6TxOyvXht5OYElL+3oM6XjtlzMePJlDY1AbdZ3Gziclh0Bv5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188057; c=relaxed/simple;
	bh=pPqlQo3DRiKCcYkAQJQaHw1DlE2TLJ3LSJd2MBRf7n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBtqzwNrMpdJmYOedyD76wsSDHYfHFTJWBRrJRhIRqO41+WH6Q+d5lMPJK9nu/Aw9mNxM38UW1crWhKr05FHhw4Dc6aV/RIf/biS4M5k5qOvOKpWD5poYhM//3hXSxPID/MG2IXfrtDrdM+lYEJRYDdPHq//rIXaALgKC8P9/aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zlXd6NXX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zlXd6NXX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43889505e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188052; x=1744792852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwTUwTMxyTj7zTjMDARLn6ufuL/C/9AMOfMQrrdFbkc=;
        b=zlXd6NXX4P9KuRmQLGg6Pddnrdh1u17sEwKiJ3eZ7XQu3rM/QUXPJmroX/BGyvgFtp
         VgXkdWihR1iQ7rPeOYhgbEO2g40Cl+vEb2Ww+ZrtDaVxXrH3No71d8CF2q47dMFxlZT4
         8bmr0ER+bbF/lQDKZsHjkIbE2gPUrj1vO/4Tt84b4Ns2wKuQV9HxudJmXbgMElqJByPY
         mMRGjS8ptre6fZilEGf+ru55jbR/GnBx7fq8fNIWkDzxf0Aq1SU9QXKegY+KkqiKDOkE
         yoe9NxKgY8WAr2TJDY1VrzJ/1K/BN+fxbdUNfDVLi9uwZ5YGQzSQjptbBBSjdRvfaPId
         Z0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188052; x=1744792852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwTUwTMxyTj7zTjMDARLn6ufuL/C/9AMOfMQrrdFbkc=;
        b=Sl6Vif/qSLmvfi6Ruw7Ft3DLZqFDyMVR9hjOl4MLTIki4yfF75m/1/LVb27XJqqjBX
         /CFXnF61hPh4fYaH6ZJVjOsvmeDzdnUnhYgm5kWHpw2ONmEUibaJJ/EeOq7PC0ZOzhbd
         huwWTB3LsbWSftnL0fEIzubUuQ0kx0KNOTWv/1ouGdpbN3RfETCW9b5+NYE1P4ZVVEiK
         C4ZM4e885zwD+ruSlF68xJf5E4UNbc910+s1/oHj0WQ2PGB4MpvlpnFYzFFMNW6xLbdy
         nItzRSBANzr5l/hsGyWF/eFFfezY84w0WbQEY7+b01jKyKhvjdmQ6CmmdTOCF19xQQNf
         ixYA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvcfy+RqR4AExKdMWKKB93UPDUndFDFEeWlgUTwxQkUSyAIg9DaURYfR2MgxX/LHh3IrVyeVoBB/UFXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLeC/P6cMMZ3z3RyEhEDqlS2brVQm5Pny6/XwNd60XNJw32Q8w
	sn62EcnDcOyDQvt4bqtSFNtRBXIYRBO7FQMY0O9Kj2X8w/wQWzKQV+vom3x9FRA=
X-Gm-Gg: ASbGnctpk9FFWL+aKmSBkYwDA9WDs1ITFwC8xAuBpbpmY/f+ZQVcaXdwHgAZQwOTkHx
	1jK2sm5M/my06QJqxQaF3PG1KoW/migjtbc/SsA6FPJFPwh3BbvFUmDiyBeDtUy/7FzXM7Y2j+Z
	IvHKnDVkxE3sZe0UYSBiEh+zm1FxFgJwm/Ev9S8hAVJzQav/OE3YQes3i4fwSYywqgRwhFy+YpY
	NkYCptDRiu26loH9W2D0xpkDSxTs5dPwCc0edlDYKxDoD9cVbODiA2zuT6rFxI4NCCw44TNhG0Q
	DAyJ+s3/rZk4MabICBJ4ErboQCEhvzEzFw==
X-Google-Smtp-Source: AGHT+IG2rUP1u8AtLqvFPqtI5IJP5tCAlsoMsV3VVHT0ZrACaP2KWQR8dxGZAgGDfwzhkpOlRtnpQQ==
X-Received: by 2002:a05:600c:3555:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43f1ff3bc66mr15768995e9.24.1744188052585;
        Wed, 09 Apr 2025 01:40:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:44 +0200
Subject: [PATCH v2 6/7] iio: addac: ad74413r: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-6-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BJlj3nSl7FlGTWhuoQWXENcxnJ6fTBwNzUrL3zDx7YM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKMly84lMX+ymyueER8h4PH2zH9nRYfOtQpl
 taKdWN8mdyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 cqF3D/9Nb7PFT24jUYlGv5l/crO6d49YufoF8aaamWFtpp9X+lAFTh5h7ZLaEqykLBKT/YiJnUS
 iO3vd2qf7p9YUkVFIJ0GbTTv7aSgwBWE+ZObPgIY+aPOpBv3xoYUk3zRkWWmmui28OJWPeRJWY0
 Y/59Z+7h7EKhYJ1A8ByjezbB5erDBnFDeZCqsAb43rvbXJQQSZa1fhoMa4ulVI94r6bFdvBqEEh
 5EbXwdNGX+8uwmO0RoBFjWp3FKebwGAwFqWqAdjkvdW+im/sKpl5zNYsTOgtkoo4TIAJzFnKVJ8
 EPwtuaFNvVydW48zZc/WItSB1ruxJTXaQaci2rXqXvg0v62dQ10oTgHvElBR7uWV8UOcoufs4f0
 hnYZgeE6vFP9UsE8UftKHtdCVoq8x8wLuBRP/LMaI+oI8risNBAworYt3j8tclGQdZxubeDskDa
 ioH6THD7IOImPDdwF9rlmSb8m1IY1m/WD87bf5Nr5QQsju133dD+jppDi5OX0fgxvWPlzDT2014
 +e3gYFDFDI5rUm+3BpfLvnFHmejUxh8Wb1j11z8q2B3kmAiW5aGdsVpnDIn8MvEptzG1JQ6kFdz
 oI8CMNsasqB54nGoCWZ3Rvk1giOZYzRHpZtYH8+C/QMRQJ2BARIMROUP4ScOciNYa2sEEb+f6DZ
 YD8KPLt7U7E/few==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/addac/ad74413r.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
index f14d12b03da6..adfa14c4b06f 100644
--- a/drivers/iio/addac/ad74413r.c
+++ b/drivers/iio/addac/ad74413r.c
@@ -276,8 +276,8 @@ static int ad74413r_set_comp_drive_strength(struct ad74413r_state *st,
 }
 
 
-static void ad74413r_gpio_set(struct gpio_chip *chip,
-			      unsigned int offset, int val)
+static int ad74413r_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct ad74413r_state *st = gpiochip_get_data(chip);
 	unsigned int real_offset = st->gpo_gpio_offsets[offset];
@@ -286,16 +286,16 @@ static void ad74413r_gpio_set(struct gpio_chip *chip,
 	ret = ad74413r_set_gpo_config(st, real_offset,
 				      AD74413R_GPO_CONFIG_LOGIC);
 	if (ret)
-		return;
+		return ret;
 
-	regmap_update_bits(st->regmap, AD74413R_REG_GPO_CONFIG_X(real_offset),
-			   AD74413R_GPO_CONFIG_DATA_MASK,
-			   val ? AD74413R_GPO_CONFIG_DATA_MASK : 0);
+	return regmap_update_bits(st->regmap,
+				  AD74413R_REG_GPO_CONFIG_X(real_offset),
+				  AD74413R_GPO_CONFIG_DATA_MASK,
+				  val ? AD74413R_GPO_CONFIG_DATA_MASK : 0);
 }
 
-static void ad74413r_gpio_set_multiple(struct gpio_chip *chip,
-				       unsigned long *mask,
-				       unsigned long *bits)
+static int ad74413r_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct ad74413r_state *st = gpiochip_get_data(chip);
 	unsigned long real_mask = 0;
@@ -309,15 +309,15 @@ static void ad74413r_gpio_set_multiple(struct gpio_chip *chip,
 		ret = ad74413r_set_gpo_config(st, real_offset,
 			AD74413R_GPO_CONFIG_LOGIC_PARALLEL);
 		if (ret)
-			return;
+			return ret;
 
 		real_mask |= BIT(real_offset);
 		if (*bits & offset)
 			real_bits |= BIT(real_offset);
 	}
 
-	regmap_update_bits(st->regmap, AD74413R_REG_GPO_PAR_DATA,
-			   real_mask, real_bits);
+	return regmap_update_bits(st->regmap, AD74413R_REG_GPO_PAR_DATA,
+				  real_mask, real_bits);
 }
 
 static int ad74413r_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -1424,8 +1424,8 @@ static int ad74413r_probe(struct spi_device *spi)
 		st->gpo_gpiochip.ngpio = st->num_gpo_gpios;
 		st->gpo_gpiochip.parent = st->dev;
 		st->gpo_gpiochip.can_sleep = true;
-		st->gpo_gpiochip.set = ad74413r_gpio_set;
-		st->gpo_gpiochip.set_multiple = ad74413r_gpio_set_multiple;
+		st->gpo_gpiochip.set_rv = ad74413r_gpio_set;
+		st->gpo_gpiochip.set_multiple_rv = ad74413r_gpio_set_multiple;
 		st->gpo_gpiochip.set_config = ad74413r_gpio_set_gpo_config;
 		st->gpo_gpiochip.get_direction =
 			ad74413r_gpio_get_gpo_direction;

-- 
2.45.2

