Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0E2C3755
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771673; cv=none; b=lLNRcSG7TxTvD6oHchA0Iwb9by0HxJv6uq0MB/Xt5/ShM271dz6TbWRgIFCxcpsgWd5YD0UEoBXmqsPv0JewWk18ShwscUnkGQSt5mA5RuZh+lxxZG7RV5+qxgsLoT8x15wpbaAUib+JRY7iUbV23s8uLgYeG8B1D7nUwLtdIfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771673; c=relaxed/simple;
	bh=UFfRQ2EJYA6t2/ihgwQbY8hF0TN3XoMYDsor98fDvRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiaVT218YPBnkUAwpTxnvkdaxASEqv9hzFU6oBp4hfb9frMvkXNmbOSUiFo+caaK6ARs2zbl6HeocUiyyXQR5rm7LrtPzcavGI8pbUS2WJPNosf9rxJqaktoGWUZ/tDDF449Qb89nxuH01ff29sXtX5fyPKuAoJKttA24H/raEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j2q0x3e4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j2q0x3e4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so3010995e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771670; x=1751376470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=;
        b=j2q0x3e4u4wfv7mFt4+MfB5Ey4iA+4TxUVP36g+ELa0kFosIifBgYRzGTZAMFWQs/b
         JRiyOi+4IdWRKA2fj7Z6qyagDni3iKY0T4DsYPhVak/hVnmkVMFK9JD2Of/YhYVzEy+P
         17kuGfMUIqcvVjIeaxm8ChMSZIH996xZfJsOuwJwqCjv8maKpF7HCJDVULGS7OkS6Ez3
         dPXsx37Te9p0FVJkYX5jL+VBpfz2jgMJYtbQONlCvK9OZ/86rPzawOdQO0n0XkCJoUqG
         lAsx1O0Pp/6ZbSUjHnApsHkiBJ1x1X23cud2FnMx7NnLPKgJD5OLc0lwrrY2KHjgZtHM
         ya6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771670; x=1751376470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q+y4cuauV8ZEEI+QC1z+4Pk/VGahhcnIIdZRyJGl5s=;
        b=rPhwGw/cbaiocT+co4gZxnSGm5jL8mUX0m1bNKAW0OjH9Svdv3PcbX7oOYmv4LFe46
         tbNYBvkcIC/cSNBc09q9sTQ+PT1+up9Nv476KEWqL0pN9zMZoa3diNL8PZm5O1hyriJe
         ROvDTB6ufBRzt9Al56PA488dlZ0JB0UwmcqDs596Yyw3aPRzA6t3xdvQedFUHMqlC1La
         KlfiQgjso8CulVj2pq+Chz21yqJ9zaFTrdGlf7L4cg5NGDheGd68FiCjf6GLjaCbJmbw
         rHwITwJt1xB8a9Sn+UOIxRcuokvgqRBtXWm2zSsqky0AbvmzLl0An2FeZ4EXTvgAOTJ3
         1q6Q==
X-Gm-Message-State: AOJu0YzzRi0KhEeacHnsMCJhd84tfl4Of+6mUAS7bb7sN8g/WzyO6XHx
	qvzG3D7kAPv9J3pF10bDLj0aT51u5hNSnYN3q34/lnLwowyoCsupQ3LiheZe1V4zr6g=
X-Gm-Gg: ASbGncs7ZcqAs0wIs/pfA4mrSPYZspXuerkaWtDWhj8CXC1hXPlo08lwKRH4Rg/4gDU
	RK2NnOtRnlsOezeu+ah7JtNmbqY4oaGIDENcujwQFmPOigFSWGoelwVUHCMYW7hL8FCA46XwBxK
	zATwIbPuYUcsRCzZ/Y8MS4UhuXXZAsD5u9pYfTWW+VOdytr8SCA6fRP+JXSNFOVXNpInmJJlUMC
	u0ZlBQO1vIE6kiJuJGX/TTo6OA6KD377CVFp+FyWfrPB/zL1QRooRhMtib/eE4OpBxJuwqR9u89
	e9pDsV4gBwy4TOyqBmNf6wEoY+pTx1l1ZKL3Nr4odhU3iBphBej/AJVHF0SyNDBmsA==
X-Google-Smtp-Source: AGHT+IGmfcrcXv6qaFxA1auGYNl1GVJJJbUjwBsK+LmrzR1ie3pLAeiZE448ONV4ULqg3P1+gJfQqQ==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr149902315e9.27.1750771670024;
        Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:38 +0200
Subject: [PATCH 6/8] gpio: cadence: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-6-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4868;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ss3poqXhlzfLiQ3jDcCO7Ok2SGZU2TtFIGp++gjWDXE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfNhmKPg3fhAoCDk3zfW13JMYx7TnigjXcX2
 WYivj+S/buJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cukxEADOJBsGcGX2kQ6qOkTQJ1Ttww1F/PBoovmhmVco4RYgvPzBD3oT06ENe65hXmz24vD6Fy3
 yMJPZN1fuYn5UddaygrS5rHO3A+0DljhVkz7PwE1cTBIs8616DckVet8FtrDXIwJyVzu8x55zMv
 UfvHiGfccZqbMHhQxVAxz6nQkjOQd3/JDZEtTY/bsANtSfH3f0rSlcqp4jL+pdsaNeZLMJ5LOhW
 ePIwy8NAzS2tHbIXjK2jMC8jWDX5nZyxQIYwf3pIa7nn4A/JP4tRLXXtiCmN2+Vd3qychphUQTD
 vQOLstSPzVRsXFyoZRr657j/m2g1Kj7Ayc8xLo2zqLgRMskyq68sCoszsK1AS1GqnFHPx9RxjZ7
 ab4Sd9xtfeZ1sdjht1VOK74HY+NGAAoUtX3hJN7Q98rNxmlmkZ/cFySw8ninCz2d28q2Ra03X86
 3iHV2ABaAIN1fDLQbGqc6ISuTL+Zlj/jCwZFyV/iUcLBoc6NRc3sYGDcPWhSHvyKDXF2uXDX34q
 m029iuqJcZTJCalVj2hMMG1gtc8YmijWfxgFH0x4AG7Tr10207uV5yilsU7WJUd5y18geyXNaYX
 jVd2/+nZdV6JvAwWLPEJ0UIwIJmv7pD/TGTPTrNStpuUPVONPnptUrP2YXHv5vJlWmCMUPxzIsC
 OSOIGxyS07RCzWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e6ec341d55e9047b2fa8718799ba72d54624388e..8243eddcd5bbe537bab1bedc72c80ee88839f5d3 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -12,6 +12,8 @@
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -31,7 +33,7 @@
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
 struct cdns_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
@@ -40,7 +42,7 @@ static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
@@ -52,7 +54,7 @@ static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
@@ -86,7 +88,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -142,6 +144,7 @@ static const struct irq_chip cdns_gpio_irqchip = {
 
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct cdns_gpio_chip *cgpio;
 	int ret, irq;
 	u32 dir_prev;
@@ -168,32 +171,33 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * gpiochip_lock_as_irq:
 	 * tried to flag a GPIO set as output for IRQ
 	 * Generic GPIO driver stores the direction value internally,
-	 * so it needs to be changed before bgpio_init() is called.
+	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 	iowrite32(GENMASK(num_gpios - 1, 0),
 		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 
-	ret = bgpio_init(&cgpio->gc, &pdev->dev, 4,
-			 cgpio->regs + CDNS_GPIO_INPUT_VALUE,
-			 cgpio->regs + CDNS_GPIO_OUTPUT_VALUE,
-			 NULL,
-			 NULL,
-			 cgpio->regs + CDNS_GPIO_DIRECTION_MODE,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = cgpio->regs + CDNS_GPIO_INPUT_VALUE;
+	config.set = cgpio->regs + CDNS_GPIO_OUTPUT_VALUE;
+	config.dirin = cgpio->regs + CDNS_GPIO_DIRECTION_MODE;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	ret = gpio_generic_chip_init(&cgpio->gen_gc, &config);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register generic gpio, %d\n",
 			ret);
 		goto err_revert_dir;
 	}
 
-	cgpio->gc.label = dev_name(&pdev->dev);
-	cgpio->gc.ngpio = num_gpios;
-	cgpio->gc.parent = &pdev->dev;
-	cgpio->gc.base = -1;
-	cgpio->gc.owner = THIS_MODULE;
-	cgpio->gc.request = cdns_gpio_request;
-	cgpio->gc.free = cdns_gpio_free;
+	cgpio->gen_gc.gc.label = dev_name(&pdev->dev);
+	cgpio->gen_gc.gc.ngpio = num_gpios;
+	cgpio->gen_gc.gc.parent = &pdev->dev;
+	cgpio->gen_gc.gc.base = -1;
+	cgpio->gen_gc.gc.owner = THIS_MODULE;
+	cgpio->gen_gc.gc.request = cdns_gpio_request;
+	cgpio->gen_gc.gc.free = cdns_gpio_free;
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
@@ -210,7 +214,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		struct gpio_irq_chip *girq;
 
-		girq = &cgpio->gc.irq;
+		girq = &cgpio->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &cdns_gpio_irqchip);
 		girq->parent_handler = cdns_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -226,7 +230,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gen_gc.gc, cgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		goto err_revert_dir;

-- 
2.48.1

