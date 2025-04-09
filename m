Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020925DAF8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188058; cv=none; b=dwBQ2M/A9zWgBkylgnH2wyhsjlAnaRnXhFd7nTbWFt2dvmyiHmbWXzSrFM9UiP+FSy3gRxTLsszP9m82BqFSLBJn8zHrYS3KtHfna/66WsRbh3baa+SrzNySDhLLLzHzd6vLgKcrXOXYkPmkDCIq2ljr8dhnlnUkn5bKhOMjSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188058; c=relaxed/simple;
	bh=5kdF5oVUy/yps6X9BImufh8OuKxxdQ4BjJ7Qv2H6pxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCqMbiR3vmO3bqSECtvzNM+VpNipqZI6Y6hZ29M8Zd6/wUo2TTsXMsmhQr9FY3rl5y+dLv+f5Nb78UkKxYVlrym7I2c0f7IJq6xsFYilUrZzUCoYpMgh0kHaqHT8VAKMHNSvgzFJ5El13elpp7rDeatANjjSWVkzXzhDzfkrVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a7DwWriq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a7DwWriq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso59835165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188054; x=1744792854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=a7DwWriq7SA9IP07wBkGlbj2ecfCCciZhMRHFI9RnVowC/12yGyANaSrGpPFiIaB2c
         RdJb5gGQ6UvpVm/6oFukZSYJNHXOnAM4dHx5XNrZmH2LGULyuer4pDD9WT9k0wX1AuV+
         Zo/x6C0Z0wKPTweyOs5yhFfsRb6teyRSBGH+vx02q+hsJAqP+iox9lsYjJpM7H1zlWvA
         TddcvvX9Std4TraFeCSRuh22Id4rTjYn/fdyjhDzcyJmif/gqADKQyeGpUbfQbqYPzhR
         p0M7z0uWNEyX9blmJXGb+iN9F5PLevQ8Oa05GLkPn3jBCL6c3tsdgHfeRPRfJNJS9QXg
         yTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188054; x=1744792854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=Taf+AB1cwxW4PJ4I/5VezC9iz9Rjy5Vl8bXZMZBcG7JUuDI4OVI2uRETrnKgyTSmwF
         TQ0eGxLXyL0YZMm/FECVxy3gWgVm9Jujflo1CWbDXdck0AMjEWrZ5u1ND9zFiGiovvSY
         UYCesZ09zUAdJ8v0ZLwRa+oRrrp4FIFhSWbZgmubSUg9KqaTwfbF42NNo4Z5M6fcV8jJ
         aux1XFndQ03ViOUDXPZMkjsCQexlgW6D1xZ4nx9Itaywhsu9sgy0wz4UXwnQIiKLeBBY
         H9WvUva8z51R0xNDzRLDdC4I4a4LEq195/YN4gXlL5uPzBV9oqB1D2gpit5LwD1cFu2u
         l3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCZzvIJpNNeUfgKB718PEPD+xw9lSl6cphpNrNR3iw18xd2Zp2GqiPSX3kHWNxMhkTgBuR5IGrfx/3qKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVXNEjdhw09YZyaOTGkZcR4J2HYrH6lJt8pnlSf1+n9TCI8jt
	X38P6mrhQDzRAexjEZ/zuCxxodg+DWFfQMVZqxv7ojCY/GAFhSEUPvKnsSXR6ms=
X-Gm-Gg: ASbGnctGhAlbq1uJbrFRURRk4LS1W9NZGNd/W3nYffoK3kpGScc1oGD8wL8kjuzy0x3
	5E3JhT9U0VGC5zJ0Kih75Fk+KFv/BWvMF6ZMMcSoFu5buEQVBHlstzsb9KZSAre2gQGUnRIi0Rd
	JVqldwFtxHpoH+Cd7/0AsJAYBTBwdbVqXZwDMlGCBc9DOT545lXjApDcJGFrjxlshKCxxziC26C
	qe+ch9Tno9cCZ18yJyGfRWKzoBJTUHERyNuvOTK1amSJAa+Feh7kIh6JilYLnLjHC8VB1rV4RMI
	7pdOED7Tb5h3MPVrZcGmIcWFlO/yoHM0cQ==
X-Google-Smtp-Source: AGHT+IG8LQlB/qJ4dprLDxOBQIbHnBXUqk5P+Akfq9rXwsoYQVM14BJpyBXYL2o8LGSSr/sh82IgJg==
X-Received: by 2002:a05:600c:3b8f:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43f1fe16c7dmr15845665e9.10.1744188053670;
        Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:45 +0200
Subject: [PATCH v2 7/7] iio: addac: ad74115: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-7-4b36428f39cb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GM/OUTdtJwVfHBffPnM20PvdLToT9f+xlEL0CqiIT9o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKM+RDKnpk08jf6biIZ3iU+KYy4c1FpPVE9g
 ineY3ogU3uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 crtWEADCEy9Fkv2WE4tKZ2plfQHL2JiepslTEmt6QhUmz6So59x/5RxyKgDu3LK85ixCUqiitQL
 3q7lufL7DXD2EX3Ai9owJsTIH+YHHC9pgD3o596P6gInTNQxn9derv4ukwZJOYhQ5IgAhzjzmpG
 ZT/fYog8HvtoUXTOYtZlmXKVoI23GIDf820V72btz1yz4Pp4HVspy3HALtUylwZpvLG7OvwpsCa
 oVkHg3j4j40BBqmkd7fWTCaNz6c0EdWVvtwL0VUEpuv5fWiL1kVtzznvCM7b7meTNE1lXjjS2hT
 4TLznQ3WjhVdFjmA329GHu9GBtPb2Y51r968yrfBQ7QcZiK+TjWq6+M5QRntMY/rMEkLN6uMzEC
 tzVRhY9HMzT5Gey6tto8zePpE03bgOdn2nkvV7M5PqbATGnKWKXda7Z4rd1lrANcU9ZyDklLAmf
 AokMsuxUbKxKpP9RfAjZKxZtZ5TcOroNFZTLY7qJWV6flXC4+Kglxe0Jd2Ook91qkuVtKBmSS3+
 QU7+Kcol9RRZV3pO+VABQvztImX3amgSer2m1HXZb/3yCutPB1PfnAbguPOGHbiWnETKr69q7nc
 vHr6TCmvDKeYRdTxJkZrgwLQ76O7CLQVK2pcJmwvKeGIBFLdeq3VTJjO8siiK/8+tTGwogsTiob
 Z55amYSelPNeVUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/addac/ad74115.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/addac/ad74115.c b/drivers/iio/addac/ad74115.c
index a7e480f2472d..2a809e07526b 100644
--- a/drivers/iio/addac/ad74115.c
+++ b/drivers/iio/addac/ad74115.c
@@ -542,18 +542,16 @@ static int ad74115_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(AD74115_GPIO_CONFIG_GPI_DATA, val);
 }
 
-static void ad74115_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ad74115_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ad74115_state *st = gpiochip_get_data(gc);
-	struct device *dev = &st->spi->dev;
-	int ret;
 
-	ret = regmap_update_bits(st->regmap, AD74115_GPIO_CONFIG_X_REG(offset),
-				 AD74115_GPIO_CONFIG_GPO_DATA,
-				 FIELD_PREP(AD74115_GPIO_CONFIG_GPO_DATA, value));
-	if (ret)
-		dev_err(dev, "Failed to set GPIO %u output value, err: %d\n",
-			offset, ret);
+	return regmap_update_bits(st->regmap,
+				  AD74115_GPIO_CONFIG_X_REG(offset),
+				  AD74115_GPIO_CONFIG_GPO_DATA,
+				  FIELD_PREP(AD74115_GPIO_CONFIG_GPO_DATA,
+					     value));
 }
 
 static int ad74115_set_comp_debounce(struct ad74115_state *st, unsigned int val)
@@ -1580,7 +1578,7 @@ static int ad74115_setup_gpio_chip(struct ad74115_state *st)
 		.direction_input = ad74115_gpio_direction_input,
 		.direction_output = ad74115_gpio_direction_output,
 		.get = ad74115_gpio_get,
-		.set = ad74115_gpio_set,
+		.set_rv = ad74115_gpio_set,
 	};
 
 	return devm_gpiochip_add_data(dev, &st->gc, st);

-- 
2.45.2

