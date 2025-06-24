Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DC2C325A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771672; cv=none; b=ApC7ZeFvtbRKfd1ekpzyGxmTYLx3naAhfU3adg6FZ9HWu1C6lTQPSm6qu4umgIvfQYTF633K5CHqyx4EvVvwN9kdv9AuaHLVQpBk3ILfddUQIzGsAfUDpJtHieYMu2ktBWHCLII1m386rmd1QZOCAZGORun4JwJVzRHUepF504k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771672; c=relaxed/simple;
	bh=bWZ1u1STZp0yQIfYwwSw+kW7LNE5faGgyfS27qTRHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBdqIm3DQSMpbQPOAe8y+hPW5eyP62EAIbyz83w+2q8XB5TNp70T6U/FRVgIQN6a146MVwtv4BDgugurwfum7PstJLKMNSHck6B2TKHF0ZsQNRPK1Xq+qezNQdaNAkk0uuCoeamqfMj3WRtUs/Vh0aHw40Ph6W1mlM06Hv14FiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o8m1EzXp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o8m1EzXp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453608ed113so47086285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771668; x=1751376468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=o8m1EzXpkCG4kM6EvS+bAFLki5QTt6BQE/jVO2LvIRO0bYEzuPIihf3d3dyc+1+CnS
         KogBxaKgmfaCofuJgXKTjd2SZb+fcVkrgHDM84cguhXZexwtw3TqqU3QMkGGHlk0YteW
         im0Te8WcyGNzWJLuQi8XZ3Ax2OEDMD8TKEWFrVTgaxIqcad7J2Pmp+qQfyHAdQdj4TDN
         WG5F6f1xb2qos5gC1acs6NPZ6qGSo7bJbgsGWbpM7XtvJIzGPipl6yKVLKXQ7aVoiLxk
         T67SGdvPaZzXAwsioMqQxe1KWBG0ZKn6laN6kP1YWJMMfPOvMfHn6rzJ2hO442M/DtgZ
         hIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771668; x=1751376468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yz5UgUcfJE5/vvcmcGQA+0Z6POYK3b+XtNUBsVCQb4k=;
        b=IpqfHw29bn9g+/NvLEVXbXSRPywKdYtOU5iWQ2Nj1wBq4dtckS1rZIz1JdXc6nxaih
         497jcvdpjjpTjDR6+kBBI6/nzNab0Cbu5vLR3fzcoMLg+iS/R/OUxA3UwsSP/39RhUJq
         Wt1mBRZEpW8odWUkWdpY8zsKe9JNY9BKQm8IhkxNyR77GZ4qCUpZ42/HngXB3IvANpMI
         lS9foDAtg9y3hA6fhdyXhgnnmncvO/4Uoe6XqugrezD1guG7u36W4nqHlGUR21u3iWRb
         uEY55x7E061Dp4zOEGN8vH3CPhqM1jWrDCSliyJchmzcUjRAikNYdqw3IaPN42qTXskq
         Z/QQ==
X-Gm-Message-State: AOJu0YycYqEOe6DAJ4IYD0ZvkWld/DDe73YFfE+9ZSxT3dn9EwLG+Bgj
	ZAr4b3abUC36I1FyXlhpcO3nzWTaIcbMoKlnGWluyp0/Yejf4h/e18G6vmSFyiaiiWs=
X-Gm-Gg: ASbGnctPnNAALRU6HRhVflKbHdipA9/wrW7BX0rLoqDk+9THbpExG63aDl8qdCXAbFr
	25jaAtXpHqpEPjd1CePn8zXlXYGfs2/fs6QBJbshuuDi7Uck8tC2672Y0p4shpFeELKwmGsH0t3
	osCGF4T53fA64TrtS9VTGy2XJuIbInWOlHiUMJrowE0+974iZ7GZPaaC3apulZ97QFDY9R68mJ0
	FN2XJ2OL3lgGPONh+IimnCz3vVLPgrLJmZ8SqM4FphAnENDE9Yrk87Lx9/A2HtgiG33dcGXXw1w
	79m542NrurIB16Yin16whlRqsBKm+i5pejc1+A+KbPaqTVoq7IC4BQ4=
X-Google-Smtp-Source: AGHT+IG/rMIA1tRjVdj3q4SOViQlyMWTekKDIwuSgQnLjsVI8uTdmmUZ8XoTL0DwczoQXfHr+oFANw==
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-453659ee9famr163886375e9.16.1750771667661;
        Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:36 +0200
Subject: [PATCH 4/8] gpio: clps711x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-4-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OkRIBmYFSPotnoBgPQDP6/8HKcnoOvUDc41iS6fYioA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMbPu3QHXEoC8paJDXYv/gt/g9kEj7UXkyU
 u/AkDzJ9XyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cqvQEADRUtAfEOV7Ay2ZXGRBZi9QFKTOR5D69z+0IPw3vm3QCtGQZRlJ8JDtArb68wwxcn8W9Xl
 bhesTMoqW8ZvfiB9SwP1m0/MxRR4ur7gidUJir2mToNygsd2gZVzc1FiqtO7x5me/mGGdmR50jm
 AbhJMd74VIf8ONYDGvoR8+U3eaERIjx+FXy/ejzHQX0UYqSRyDMYYDC5n/Hsr+Su9Yi9R12eaoi
 Hnl8sa1QLcOO5vMmtjPkAQxkW8qKb3j59l7jv5w+6V5I8vlrb+gh5hTTMoIwuPwi79puS9eayf0
 AfL010thQXzq4JCkj3VnOpVabnqPMLND3RChr/ia906jXkX+A7IsE05MJcgrp0/be8cdSsvDcAu
 QrdjcI+YcElqlb0waB/hQvNub7yYf+TOlrKYpalE0O1Pfyc/8OdTWoPbzjQjXGoXHpDZUSxgtN4
 PGDp1IW/2933ZGNBxSqcHVaCIuOVTk5Cd2Su+YrheH83MGWIUgXVnufHgv85OTKuuK4ZTpq6SZ8
 4lI8d3sYUme9PeKZUPwbjh6p/nZGIDS3bpbENzlhuW8kLayIz2Ej4Rxe/fpY+GFgplPQDtJc3mp
 rKv/wXaVXbZGFr3G+dBjmdGrNM4B1oCPPb68byPwhd1GCP0/Z4jbqdK+TXRfwhUuINbZ9BetAMh
 PE1c7oyln4QHdhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d69a24dd4828975b4d62f66b011964456976bfa6..397b347ad6e8b036edbfff75b6a31f2170334f66 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -8,13 +8,15 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 
 static int clps711x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct gpio_generic_chip *gen_gc;
 	void __iomem *dat, *dir;
-	struct gpio_chip *gc;
 	int err, id;
 
 	if (!np)
@@ -24,8 +26,8 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if ((id < 0) || (id > 4))
 		return -ENODEV;
 
-	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	gen_gc = devm_kzalloc(&pdev->dev, sizeof(*gen_gc), GFP_KERNEL);
+	if (!gen_gc)
 		return -ENOMEM;
 
 	dat = devm_platform_ioremap_resource(pdev, 0);
@@ -36,35 +38,38 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dir))
 		return PTR_ERR(dir);
 
+	config.dev = &pdev->dev;
+	config.sz = 1;
+	config.dat = dat;
+
 	switch (id) {
 	case 3:
 		/* PORTD is inverted logic for direction register */
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 NULL, dir, 0);
+		config.dirin = dir;
 		break;
 	default:
-		err = bgpio_init(gc, &pdev->dev, 1, dat, NULL, NULL,
-				 dir, NULL, 0);
+		config.dirout = dir;
 		break;
 	}
 
+	err = gpio_generic_chip_init(gen_gc, &config);
 	if (err)
 		return err;
 
 	switch (id) {
 	case 4:
 		/* PORTE is 3 lines only */
-		gc->ngpio = 3;
+		gen_gc->gc.ngpio = 3;
 		break;
 	default:
 		break;
 	}
 
-	gc->base = -1;
-	gc->owner = THIS_MODULE;
-	platform_set_drvdata(pdev, gc);
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
+	platform_set_drvdata(pdev, &gen_gc->gc);
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1

