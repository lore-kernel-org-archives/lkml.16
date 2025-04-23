Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982326A0D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392531; cv=none; b=hRChItLPuY09E463Cq7VGQbXyNXsVP7N2k1jeHalk3n3UNdLG5xAwyHmB6Tz+VuLjncp5bNUmbYeDeImHsbvMdTN56yZGzcra+8L5l3cUOkOUq7nA9PfCo7B16SGM/9afuv+evO/osL2Ax3h77zow+4BnGTdjgRWveHWSSy86/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392531; c=relaxed/simple;
	bh=7C+LNsVab5vr5HZgHbL9vCFP4eASEkV4s77Udtvpj3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0G0So/D/dBprEbQd+WAujRJgIf8i9t3IGX62WRSYUWAH5I2GRq7hzaxpk5Whj2rUbD5oRlvWtPBPDhroLLAEU+tZHz27xBbLniJsiatMVGZ7M8XljB7akIApo69U/uQXHuLH5f1AUUXmFuj8DP3lP0GvT7JVQCiWDYQ+cektHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oQHeLvfF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oQHeLvfF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so4136094f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392528; x=1745997328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=;
        b=oQHeLvfFLYHwKtKPkckT95AKZxSGGJTSpXA5mAp1TaIof/NxnCLVtsQEwJzA6PFViU
         rTgMZcss9MiZH1c6pILEhiJDHi+oOVejDb54CeIqJnVvczYoKZ4mVAMOnOMeFXcKDe2h
         iiPUqGxCcKb5OoBwCYNqCg6AvyJBRt7rBNIA52cxhvbO6vbvrgGDfZVT/ALSTJC+9OHr
         E/G8KcNU2NXHm46p++ze1Y+0p+1geZzQGE4hAKrJwY7VIqTGPK6yF2rZCZNKlh9vdfJb
         nsOXPJ9d3pihVnzSKmOwkzwTgRlv1xgXRIVFVwztdSN+iIWXmDH/+xWjqfAQd7P5ohRs
         tsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392528; x=1745997328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MPclfNXGHsV8MZaXGNXPoIUNkZUY12DESp/EGnzFtA=;
        b=pb00ZVzLPtcWqbXhtBONdZuDe7NOUA36a4v63DuFnexKl5pwqN3afBHCZth7yr+I54
         7pkdypzprPhnDjOf899oxkFT6ishFv0tLD45mdI66w9x0xS97yhThoOgtDZFo8jLrtSc
         3Yf+sZoqU4FX0GfAm5LS4HpgTcFdEzI4B6lOIg0RU5AIcfQ0A1Qngi6RPG5FnBCnOowe
         4t9HCTOiwPHbEdizqbfPa9XeMlQTqQtbrmny7qUq2kkpati508EwsGuTl/yVLHfmOYHq
         JY2RnkzdLIyIU0X5HbeTdV6C7u9wDOTNPkTrWw7rRR3InpZHn11Tbf1xZnRwjS94eOXh
         SdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnRfyigHLOOJLJEVsU1CbPtwC+dZkd2By5OaQDbuVZF61pkly79m3HjfTFVC5yFUW3PCsF1UUtDmeTgws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lolnh5t4UX4gJAV7R0dmEvAHlcJwFMjuA0oNble+QtNjNddC
	AEGttxsXY79CMMO1bNtfJIySzZ7eu2P7QhLOIZSj/yB3J5+G98fE3hsP078jxI0=
X-Gm-Gg: ASbGncut56fXXQPVo0R1ZqEZadcVPS88BUG+IulEB6LRChdSyHTKmRvSacEuLloeYli
	EAB4AL8TwbkMr59e8OQ6YySsOBQoQDt0elXYVZz+3jzry7E5sCddaEMe+IHH0phNBkgM9TiYISj
	QGZbMYN4yPiPifFYl1Ad9BheXy/j0tFOKBKwxAYHILkTGwgUVI3f/+jO2/mwpReICtZldKtrpgz
	kFo9otJ5LLR2p/rbba0laI+ZG0Nai1YvgUJs5atA9lDCBArb/ycIEB2uwgJv+oiVpKQiRwqP636
	3xi4ZcxAdXCPTTwlS6lpifR8vpKG2i7O0w==
X-Google-Smtp-Source: AGHT+IE+EYnrfW54icqKEGRQVESmbeO48iqpEBpeyStDk2tewi09mNWNZhnFX5SLcVdwpUyDg1P6zw==
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr15795824f8f.39.1745392527777;
        Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:13 +0200
Subject: [PATCH 11/12] gpio: loongson: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-11-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=99W25ILmVjnRf/yi2U9/4v/maPAhA/fNyMvWAd93oJw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODuW1HwT5L1heIPW8u0acldNLxdbYmai+QB
 lCwyKbDCsqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 coNPEADBSAcxIsHdv3O6rLXDUMyohTqVcWNFYAMTwTqpb1HtgvRkHOabZqgoyERJ6y2hD9u1xeT
 LH5bBYVhdTXqAJSrMktvY/zTtO4hBbdFE1xgJLwB1qE+SsxnNL376z1PEoIWyJ1NZv6ZvhepPJH
 h5ckAt+F9XLL3pD03wOQXRXl7sUmsEbXEb72stmtgYIs2XE7o/5QRHWvmORaLInPdeCCV64w+NO
 pE1nmuWlRyZcNJ12iMJcmDeI93N+N/rIk0Wr0z4rk7gjiv2wsUvZMgKicQMeI43XEhfcsgdloQa
 vQ1KjIPR69EU42UH7WjYSlhdcn0nvU48In+PnIzDTk1EY5X87IEnShhQD8rCfiV8QYdfyQq9dHb
 2iSyRO9phbOJmQu8kfNbUuQrlwqJtvs6k9BlCVJ863HuyqBFhB0hvcxchOjIKZKhobV1in6uSxi
 lNxKCwfcmT82uYTDXRo8xvU6OosAsEg3jdNbREVJ19+WFQaQXSpGxKoW8VyNC1FFEWckucx4j/R
 UN/ChK+jIEeoK9VbnyYII9PSqWi9f63XZrDfA0WmATPC7zWUoRJ5AiyOQZgLWfjEJYTvxXyOWqp
 qvTPJyXN6SalFAOVDoHuVF1QdSMM0BV4ey6hVpSqGNN/BDvOZMQw7aqCot8ow8ftgamkYh/zsOP
 pxsEDKbDN+/kk4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index a42145873cc9..8f3668169ebf 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -48,8 +48,8 @@ static int loongson_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & BIT(gpio + LOONGSON_GPIO_IN_OFFSET));
 }
 
-static void loongson_gpio_set_value(struct gpio_chip *chip,
-		unsigned gpio, int value)
+static int loongson_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				   int value)
 {
 	u32 val;
 
@@ -61,6 +61,8 @@ static void loongson_gpio_set_value(struct gpio_chip *chip,
 		val &= ~BIT(gpio);
 	LOONGSON_GPIODATA = val;
 	spin_unlock(&gpio_lock);
+
+	return 0;
 }
 
 static int loongson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
@@ -104,7 +106,7 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	gc->base = 0;
 	gc->ngpio = LOONGSON_N_GPIO;
 	gc->get = loongson_gpio_get_value;
-	gc->set = loongson_gpio_set_value;
+	gc->set_rv = loongson_gpio_set_value;
 	gc->direction_input = loongson_gpio_direction_input;
 	gc->direction_output = loongson_gpio_direction_output;
 

-- 
2.45.2

