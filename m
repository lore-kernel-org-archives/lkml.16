Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE842BEC25
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847628; cv=none; b=msWsVBqVx7dDiahAc7FhTR/GRqpKQ2S5qHgApByVraiZH+z9Lm7CjQAxMzQbxi9xU5VgyC8vKodUC6WYvsPzMlWwJi+TDwUpYXvO73uTw5o60DRwnhJR7M4wtXTzfCEc4DEC+IszweVhuBx3/yX0HZLS55ALocPcYb2S0ui8/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847628; c=relaxed/simple;
	bh=SQMikfH54IsfeMpR+L/xaq1fah7XLopJ47ae5Iy9WUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iydG2le8YpC5lIXuqBv+Wjs5YFIxL3lxE/0H1SbsabkTSTPfn8BjVFZ10K1d0V5S8k7F0i8oBXFcviI9HKpMhf5IssgLOfpmMWDVHjGTUfe//wb6o9EJdwOFMROTFi5UMXfrjuCum60A9MX9rEhp33qMZ7fM4/VzstEnZCQe1tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KPmqjQB0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KPmqjQB0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45310223677so47814545e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847625; x=1751452425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=;
        b=KPmqjQB010l80Xfc337CTcAVSAa2Pp5eYwnMPH9aQ6THbHeYAbGNyXTiQDM6ehUbZp
         44R+BjLEzN2GwL8qIYBxjOSkWj9wZ9krp6X5jaydtMMnb0iimNvv9u5w3ZbeH0qSo4XR
         H7JhzKyPNRN9wiiHn4FQRCenUYREGJJnpkve9QKOf7LA9uyjpeATDaHL0gj3YUFkPtrY
         Cd3CZfp4YZkszPnHwlbsEpE9hmN3C3w10WECdxGrstUSTFkZ7Rn7223reX1J1a6AY5Eg
         MglUfsrN3u4pMc1D560quUGtVrZmVhtZJC2YnsYfHWfz5Ry6lkivDkCGvLAptb5wzArT
         U3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847625; x=1751452425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zb19l62LN7ssNNUqMMp02ypDTWsuR6UE9OCfe02DEw=;
        b=mJjQ+l+m3Zr+yajt984MNzHaScYtSpk7OI+ssnM6CB14KNRb3ZcqMPFNO8q3wvl4uA
         k1oFhyOugpPvWZ62TsdTREE1TSe4+qVXp7YlkNG07t8EYYPQELtcSzyRtENVqN1n3Zbu
         WIpLUR3bP/TbjXLk+5N9udiSrwEKTwLQJtiN37ouhjPPzgzfa/m2ry74WUrdxVvWBuak
         SfMayNlE3OWAXlS1ETgJBLGsGqQxqMqZQEoUCRF0zzHTEBHMO4ffFq0LuYLTC5tdOx3D
         t9h1vOZmdnKzcFbjKKpgGqm9u6mlYA9vwhY3W6x4VtZakd1CET7e6crMvDaEApGQJ484
         5u6g==
X-Forwarded-Encrypted: i=1; AJvYcCVw9GelJ2svxaKcx6K4F7sy47thh+DCjkaxK62xDdnbBiQ33p9rRzgOCGc1MLHiOswy5R70VIM8MWpeylU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtjpXg37N6/bP/8hVNolcvZYZKmGUpH4yBHXSPiGPKuWp25FPv
	mz0IT34j9I3Ew1lYTRYMC6rLFGMDExriS3AUI7PGITfWXR453lzqZdDrf1OzlG1rXpLhWa9e685
	mWYnZMy0=
X-Gm-Gg: ASbGncvD/jqgpW+ZcFfbYzQ5ec7QJTAuwvAkupm0Fio/DrQmPIiq/A8TcarBuYGgEXj
	1QLS6pTU66EK9O61E9m8yFdOvzOkd6RNBkdZYItZy4VyZM2VjuToRnEjiObSgCJCxJ6sWZMEjG8
	n7cu2QJ2ym0DjiepvhJjkCJm+bSlp5D6Mx5O5T0kXtmKJ4Up64R1pkIZbLrVpF43eArN4xZZk46
	BvtDJciv1rKKXKJclVc4+3ufryaORlUs21sIDt0Q4+OrSJ8fSXBkwJnWFdtqCMKdtlKapWfK09S
	4kB1cCouX9eqXB3uGYIvUlmxOgJpL05w5kR8TkTYy0KVANKG5uSA2Ct6
X-Google-Smtp-Source: AGHT+IGE1iP8Q+/UBvqDvrwiy35DOn+9cFNtjYDncbc3WiyZ+/TZLkMjhHK06lIMfzCnTiYjrVT4RA==
X-Received: by 2002:a05:600c:37ca:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-45381ae5157mr21000645e9.23.1750847625330;
        Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:28 +0200
Subject: [PATCH 05/12] gpio: spear-spics: remove unneeded callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-5-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CY82p8ULaZbPaJLzsSE1jBEx4Q22047mL4oX3JNu98M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/VUUd0S0rRYJZkJ/S3qmK/y9uGk/fty3n2
 /3rwZgRjn+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ckPIEACZJ7YNhLX9LjsVao2rzFSTptRFTG8o45nfPlE3dmbbY3xiZpnoKARBKsndI3htD18t+Su
 fFS5ueGlSpJvuexYxJjGZPb8EyjUMiMd1ilvCVmZPqFkQS/BllugnD6vUj/l+iTO4mFIGg+Rl2e
 GFNV9Mhjupn4r+u9nSPYCjv8WfgeHF2mRHMeqM6mACuMrNoK4XShviCejqKJtIHbtXJpmd/kWw4
 CyWp++UesKsLwMU4t4a8OU5Lg0uDOUNdfpx3rfp6I0dXwrHYRI1LvvHJfxxTZDaQVvptd+5Zj1x
 DIy+KmElvIDe8VbtEUqbf2Am9xBq0IMpV7YhioCvnedxP2WRq2uD3OTDtBEPz81V4iq0GroVTN4
 /8jPC1gWkufJEJV1fgYHfU/9P7Q9P916XEXQfqN5Kw45PZUy5lQ0mtGXRy45+/eGiq3949p9zSo
 BFFLAV6nYTA04ChIoJEgBLJtSOIrOz5ffGpNb4RUkW6EfPxKTHYXxCyvsqIItmGrryUpDZXbmYH
 vvKA1o39bf4Gl6fZK5G7ffc+Fy4l8MFNoKtb5qJK7KcTMxAsuOIa9MrYYE01osnahxcGJ4znoBx
 CTyeRANlafMQ2TmkDUni5eowtmFeaXK2AZ+O4ZoWgoZ4kUifnBvUg9X2dUs+vzHHawl6x9psUt4
 Ky1BQHapjjvhdHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core can handle output-only chips that don't implement the get()
and direction_input() callbacks. There's no need to provide dummy
implementations in the driver so drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spear-spics.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 51539185400d329c5a065d7a51c27b2ae24f672c..964b7dcb30b7a5bccda964a637f7fec97fe02aa4 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,12 +51,6 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-/* gpio framework specific routines */
-static int spics_get_value(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
-}
-
 static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
@@ -76,11 +70,6 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
 }
 
-static int spics_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return -ENXIO;
-}
-
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
@@ -148,9 +137,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.base = -1;
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
-	spics->chip.direction_input = spics_direction_input;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.get = spics_get_value;
 	spics->chip.set = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;

-- 
2.48.1

