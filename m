Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F072472A6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447656; cv=none; b=TgcEkLeIIklQ98v4ngqfE6atHf8L0fCLmFQJ6Gg/mk62UB9HyWl6TlSGMLG9NpFcb4pZvg9zV1/foCJUWnl6i4GMuRlg/gtRuMR603IgKr4egHtuwdhMBSxiOGvTNFbhEbW0CJP7GAQsjWYppmSlOFcUqlK6cU9Ezbwoo9wZKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447656; c=relaxed/simple;
	bh=TMRIo9TPA0ZFKhS8jQstrYMHvTJA2pZgAqok2b7oY/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUbfFCIGhqC011OGs6jpMD3rJWVZ6pXCRMnTgMeBIOSqbFek8Zw59mSEGZeBYYnf/fQtb3EOmNPDXTv31TZ98wE+nikkgc7alFqKruaWVZPghFH9ieapnNLHLI2EQkZrS7yM5D6btK8V3LCP7l5HQNWrMXrq8BD8mL1fLj8vDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zGgE2KDO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zGgE2KDO"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2790987f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447653; x=1752052453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVir3rUZYULJ4/8xSOUlL3W6Rf9lDxNjt/qxu7kHiu8=;
        b=zGgE2KDO+tE8IIQGbY0UbCD7fglCYo4LNhQSGuYBUPUGCYVHUoOcf4Hwft8sSMfHYr
         VwQOARNd/7FnmxZgRBMWb/3xXI6bFYGKbb7tXwl4aXsxi/QIypp8eq8hTJh8Pq5ZN55k
         xY8ZVlTpCZTnGT5cFZto/85MsJSKig1i1COpZwm2xULxrIosb6bRbVq1M9ODRmv0zvYE
         gf08D4k7YNs4/iCQLSCIvDVL1Z3j8qqOQ++CViVxlzt3FIrt7/AexqDYK6IX8vBSgse7
         RPwOXYHPtcIKJ+d+u4Nd0WRIzaEoGGmsom/61AZpRagNRMSf+7edd3fEs6VuM1qggCbN
         oWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447653; x=1752052453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVir3rUZYULJ4/8xSOUlL3W6Rf9lDxNjt/qxu7kHiu8=;
        b=wpMnhY0xnZdHLP7aM6iUevr2tBponuv6eG124MuOVlbqsdYJpoGJXW08QOVSTKjUht
         UwNtEUPPjoLFUm228dMOKqkVXO8Mgbs77QJSrF4eP+HsKXSmQqTBwMrv4zZN7x+dBmF+
         nHKOFDT+hKeKYDfH9NOmdy6Mpmb8/xaLxNie42stzkGvDJHYYoN66t7sd3tRJ4QdYVZr
         /unaLTCE7E0dFL6hl7GlzPcI8E1BPBBA1P8ZcRcz8LyW+y+r0lp3vjHumEP0gv4xWd2e
         coi2yO+o+X2F3vGB7MD1pOSag3XpojZ0XuPq3fyH5LmPaiUCwYOHwMc6M/OzaeoXYV3f
         LR6A==
X-Forwarded-Encrypted: i=1; AJvYcCWISgmIKyp+a9e6x6T6jymEqRFSOfhdK68T1Ad6rWplwCdt/KmhAwUWQENbtX187LO5ft5XBNnXrp9GdI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQiO4UA21LNPYM0TvxQZnW5GwypolvgPe/XgJf2N4SX1fY6ID
	AZ/RPGiSlZjegL2CFwRsR6cwcf1D6tsOPXTHmLvxCtmXQsUlwv7xlw1GBJgIHCBvF6w=
X-Gm-Gg: ASbGncvXHCcgY4APDVGquHemu0IqZiPDDuH1fFt2UgqVLOLe3MYioU7j7MnjcjzXjWq
	0HRgLqkrCPEq0I/KbUOb2gK8N6lJW2nzF6CgD1qrh10UIlMIWgQORJr0T2zEDV/Eir8yNb1dVNF
	Tc6pNMEpzskTBfMpM2B43wrBY8amM0pCT6DzJ4NlAGT4IWN4edsQ/40jy0xJaEdaaZUNJeBo2jn
	0CCXVcdHbLyxNGs3QEhxpTPuN3qZjWOFWTfgOrHj9zUEVTotEbov9t2sKTYcdH/NHIWzo0w+BPM
	xgaPfGOtNPEUvVqSJpWLSXrQneZn2b8Z1pCutyyCcCMRBtkpKP8iXA==
X-Google-Smtp-Source: AGHT+IHTFHI4Hlm1o7BuZuSwgCjf1+jXg/EPypGdkpteiLfDWEvxu7PK8IVEsRQiVFD1JBEFyDhBGQ==
X-Received: by 2002:a05:6000:70c:b0:3a5:3930:f57 with SMTP id ffacd0b85a97d-3b2019b7d4cmr1188241f8f.51.1751447653385;
        Wed, 02 Jul 2025 02:14:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:03 +0200
Subject: [PATCH 02/12] gpio: tegra186: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-2-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=I1aUJ/2ZhyjiGLXTH4Z0j2soMk66wyb2rpoPn8Y66kY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhf2Fu3UiFP8D+PTH8iTpIRS5LmLgiyXJECD
 U6H2X5w1fCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4XwAKCRARpy6gFHHX
 cirND/9snpIMhH3Hn+ESMXCOzJaZuLS7Uqvvrk1NFGS1DHPXfd4jtTjkda3wCMHLZAi9820mB8b
 XUv3Qa/NRqy48vx0Vp6Ej8t0dMDVrsPayuZx5OxVDABxDN3qKFdF38A7pwryL19l+qMrXGjwVC0
 vP4I3b154iN9rV9IS+W1Rr+FK0LP/14i+2wh3r14rjMLekPnVdlwgFqRJ0aJ3HqnuE8XUOErGGG
 gqfvhdN997LZMKLG/l+viEqSDMEjRNBeX0S0e8ApeoZ7rQZtZa87UG9cEegwfNooJ7Ma+q+2B8G
 QzSJSAq6RxIIW0OJOVdlMFK1jRrhseEWHyFBPci+QJySErO3MJEq8IIXozTJOjWe9c0SZ7Snq61
 OZNl2k5iQ0orzCS283fYWu30G1OnXJ7Gp1b2c/u+E50TnKEy0Ho5dzUjj+3nEe2z+SoVwdpxhnF
 wdTQPfzy1Udm9tKJLbajPwlIP9iPEuH+7YBC/LITzx41SYO3yAmXBDuTfI1XNmiAZ7XrW+4AAK4
 YP3s3ocPU5wMFVEktvpxuijgSiw2elilQvtN1muq0LEYuxGrQB/DTiapHawUXMwV1Sc6phGGgoH
 kspRRREgnFWm3S+pdNHDhDWoXNaGK16JcmGBlKCLgIppMV2ywQ2sPSOwbo6ti9SoRap9CX0PtAR
 zsCDI98RGHBM5MQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tegra186.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 04effccf9ecdf0828bc50455dace3ba8e8bdbbef..f902da15c419588a2716a3fbae25d5c7637cdfc2 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -202,8 +202,8 @@ static int tegra186_init_valid_mask(struct gpio_chip *chip,
 	return 0;
 }
 
-static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int level)
+static int tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int level)
 {
 	struct tegra_gpio *gpio = gpiochip_get_data(chip);
 	void __iomem *base;
@@ -211,7 +211,7 @@ static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	base = tegra186_gpio_get_base(gpio, offset);
 	if (WARN_ON(base == NULL))
-		return;
+		return -ENODEV;
 
 	value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
 	if (level == 0)
@@ -220,6 +220,8 @@ static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
 		value |= TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
 
 	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
+
+	return 0;
 }
 
 static int tegra186_gpio_get_direction(struct gpio_chip *chip,
@@ -269,9 +271,12 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
 	struct tegra_gpio *gpio = gpiochip_get_data(chip);
 	void __iomem *base;
 	u32 value;
+	int ret;
 
 	/* configure output level first */
-	tegra186_gpio_set(chip, offset, level);
+	ret = tegra186_gpio_set(chip, offset, level);
+	if (ret)
+		return ret;
 
 	base = tegra186_gpio_get_base(gpio, offset);
 	if (WARN_ON(base == NULL))
@@ -886,7 +891,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.direction_input = tegra186_gpio_direction_input;
 	gpio->gpio.direction_output = tegra186_gpio_direction_output;
 	gpio->gpio.get = tegra186_gpio_get;
-	gpio->gpio.set = tegra186_gpio_set;
+	gpio->gpio.set_rv = tegra186_gpio_set;
 	gpio->gpio.set_config = tegra186_gpio_set_config;
 	gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
 	gpio->gpio.init_valid_mask = tegra186_init_valid_mask;

-- 
2.48.1

