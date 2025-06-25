Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5312D321D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847635; cv=none; b=uPI5nH5QAuV8auSNk1d6cIXEQH5lUZvVmvHR8IdYllcuzu23e5qBl1YpTRL5Li6gnBUyojqIu1b13AqDa/K5dD6EaonTn1FTmdmzvzdLsjApcJD8GtP8GHivfVVzEzkGr04FNdFEj0nJNzcz8Q/VsCW6psmTgWvhXlHy8hL5si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847635; c=relaxed/simple;
	bh=oPskcyliwOMdOIg807PyHOObgsieHNOMoG8WkB/cb4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ND6lfq5C7edfv54ul/ZQGicp0YqO+RjlkiiWTUxsCCkyuM70buFZ1Ry0PNQbQ76iSJ2HnKh0ZupbMZZh/Ia3n95IkYVD9apo+8TTaLs5mmY26cyXyGXtUZNa7hZ6Zm8s/AMKsHBSyWXrBeeuj4Ys86PMplojpkO5tcJMROw3jEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BHkgeTNo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BHkgeTNo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so8328145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847632; x=1751452432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=;
        b=BHkgeTNociFuJ+rt3G7qJQMXayjOR7Je78/rLTRyO8DIrwUv9tfOlguIeq8m3ASBAW
         sqv+WcIb0O25KUkj3C9DrtjW9iC4ADdrcc/0uZKl1JKSnLrz4Odnzc5akXK9E6cUqLvB
         xPEhv+oGSvhNJETie+5R9zzm0JIZL52YuCXtp1MmQLvi/ayAev63a4k7SyxbcNhnyDaH
         7mq0HIUdjDftcZBuhByxue3mMGpqda/pzuEJZGyO0OqetZA7D3OVxvrgTqKJj2QfLd6k
         2goNwqtVd7O/DhygDhjl6dt0hFinNgmonwgJnQ27OItpuiMi5QNEYK0lP3doRhWgeGZ7
         dUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847632; x=1751452432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6ZfGeAkXZ73Y1KWGs+ss+amnyN2DFHuOZR9Jo0dyjk=;
        b=wMEVFvJioPiG/aqrJWAyzjYmC5R6HJ1+Z78telencdOekVj3klGaU9kcKqV8Ibb9RH
         fHf6NQt59RYcIrIiaRHcJxjlhu2efARJOAaGC74xuQ378mRyDPPmYwctfp7I3JzPovDO
         Ev7ycDoQTMcmqZAIxxFvayAGOxrgbyLv/U10wmGOVacVwQMKE1WLSS/E2h6oIXUsyKwN
         ImlNnuXlkHBXz0Yt0yEL1wxBQTHKabgZOhT+AEGpXrQcVxYoqsXfNkFATDxvUrbYE2LD
         yATUZbUMHKAMsoYz2g8Jtcj8czMwToDHWdFt62p+/eeAbChN8rh9c+64OQStzKioFRbW
         i0WA==
X-Forwarded-Encrypted: i=1; AJvYcCWY4ef8eCb8VUlcKKK4LAkroOs2pMQR8QVgeCzsSo0F1iSs+PXHK18dRNHDARSZaQL2hk+pGX9slXI5bzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNc0K/vPn5ynrXvYyLS2oS32zHRXQ4I8KtBBR+IyGpAaVZ7Vjz
	awMZ1a9A3gmiHPOzciBiLY+HqGx3zPmnKvp9dNbW1hrjYCeb8QBa6IIPXfnEzEFVvgA=
X-Gm-Gg: ASbGncv8M8UJsiy+k1ZnGLyMGMOLyJpYX724yCSHu7NlHuPhzLME35MYWe7NPxtIlFC
	FNnmHhIwfPfctMO14nrowRKC84tmiZSc0f6KHTTHUVDT+uI02NV++rBlxclIzxlAWEuy4cGtmdJ
	aeCyCMnWT3x4U5nR4kgLm56NJcA9P7lFgj1RRX7xxr2ACgZN8l8Hj9qWfoqI/7EUJ/936xEuzoP
	KqU1P2u6egry6rXdIOtRHBJp5DA33yptz3bqz3iSvufJWxxRkgaafVr2lVP0oxztc9A9jJFKGKX
	Zghjs8TzB1DOP3X1tGJ1qDPc89J1lwqI2d2y06KzwwpBJ7QuARsV0HorDXQPSUa6tdY=
X-Google-Smtp-Source: AGHT+IGGcN7WUw8zzW4bU1XVR3qpO9sgtito9/eGMkKkDd29OeHegSc8qveoQUTN22kyvswbIXCBvg==
X-Received: by 2002:a05:600c:4443:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-45381af21fdmr18915265e9.32.1750847632081;
        Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:34 +0200
Subject: [PATCH 11/12] gpio: tangier: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UPda8VLJo3OBoIL/W0Ct/orzjZK2QuSKpe06Y6G7WUo=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhb0ICioo+hAcr5UWIJINtVh6Z8N/KKejk5v7M1jOjhd43zG
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoW9CAAAoJEBGnLqAUcddydWIP/1eE
 oAzYegzqMKV/tKdTsVzHqG8LAUBTYy84VakX8ZVlCBMOxbOsqhsV9zsazPR8Up7wrITUsChfuxM
 cwrvui0/hpZ7ORdDbpBzEeoH00USXn8aecQGgCDgEYHHFo9JT9qlFjni0J/EyDHxO1JrQzfuCAR
 AILY81G6ibxRYHjZJX2OSyLo2mvUDArUHYDF9JglLbCDUSRBEPD1Mdf9fVqDzTKVwu7mvX/tRrM
 97xQAAawd2ZCERvP/NXtVvGXt0AG02D2ADMi4EmswH1vMdqbl0PaSEUt6eIK4XbjXPck3OFwpju
 Kn30+92qMYfPstHocKD3IKjIhx+tDmkFyvxoMmaITqWSuLaph9yNeyZ/Zf1risZLckcYed2DthQ
 o+zOyM0bGYCXSWlQC+qwNuUvEcvC/8J3cjpCmcoKQHJBlZP9KAR32qoxDJRePob3kfrqL01CCWf
 mMfiUIf7nBJ6gDCiYFkf5dNtJ+iWYTcwhYbuNTCwVzJGNWfypYncBMpqyrBFKd9+jB35i0BUydO
 xPW/5f3ASSR8yBBVO+zk9LwuoTxw6vUlF76Go6Tp7eRs6ugeiNUJFj9XVquFifCUsm6RNTsaQz6
 IsM0MdJekXnvMTkmwguqfs6dcCqdDtFcujyJ4LtJOoqPAa1z5qYV9wfb3nWM/INEUfs5i5C7agn
 jNnJO
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tangier.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index a415e6d361731e809d137a92b6c4658b447c26bd..ce17b98e0623ea6c0c2146430da38833dfd16cbe 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -90,7 +90,7 @@ static int tng_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(readl(gplr) & BIT(shift));
 }
 
-static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
 	void __iomem *reg;
@@ -101,6 +101,8 @@ static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	writel(BIT(shift), reg);
+
+	return 0;
 }
 
 static int tng_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -428,7 +430,7 @@ int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio)
 	gpio->chip.direction_input = tng_gpio_direction_input;
 	gpio->chip.direction_output = tng_gpio_direction_output;
 	gpio->chip.get = tng_gpio_get;
-	gpio->chip.set = tng_gpio_set;
+	gpio->chip.set_rv = tng_gpio_set;
 	gpio->chip.get_direction = tng_gpio_get_direction;
 	gpio->chip.set_config = tng_gpio_set_config;
 	gpio->chip.base = info->base;

-- 
2.48.1

