Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB7B246BB8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448142; cv=none; b=tkre3PB7yfYNRvjjOIg5cgfXvTfcdy29Hi0rh4kGVTzqq6jdUpMkjdcy1tw2FMDy/6A1L05tuuv0Kq4rKpOdPanHnHI150cyHeSeevpPzxQF4pw7xY7IBK2loVO1R4CpqgGKsrOH7Le3vII2rpvVvELJzUAS3BIvQe6s4P4FYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448142; c=relaxed/simple;
	bh=jOLiWRKl/BnasF3kEQJEV/oHXlo55WDgn/DTu4UWOcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OITgJEm5K1XZcbw8rC4QuA4beIaPeujuV0i0mXondQ9wXoc3YmV8DXiw5Q8q/JiSmiZOKW+YptVa3gIPrGi6idzRdFttNDWGWJf77e5aTz3Yphd4rLWFG5ZNqQYnMWhwPEXMYWcMe3LB5BzKFBNoPyaHvgmBOUGmJX3Wxd/HMNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SEjCFeIJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SEjCFeIJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso65094425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448139; x=1752052939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=;
        b=SEjCFeIJ0GAT99BidT+IaO7PM++MRETTXRjFm2xO8t2v44Bt61UziUO/y+Vca9kEts
         TYpbMmYrbgF9QM57MNmxXTMO3hlEpHsSBjL94k08nHC/kWeHN5zFh8e694vHn+/Z7gS5
         ydzktdu4im4gTK+FTjeJVqtqcvsrSXJyqGvlK/OOpwzBsFMt8gsqiBSVaYblKj8F9BqV
         /g32/+jd4TwSQpccY4qMNIqEFOpT/mLN0K4S759y3wDeCeQ2sXi7UQ4CKXdraJ9XyZFb
         IDr6pdQ9QRQyjUoEiGeaert+Xe+qB3Iueunl+8yPrfc+7w5kMYNq/1LZHnrPkPUmoJm6
         3qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448139; x=1752052939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4z7uLdvG+/iHUHRwUBjtv9RcP8yTkbhvtYl1/Q8RRI=;
        b=W35kLhx+6kYLG2Kp02NI8g+nb6Wo/hnwVEB4Slh8LxT8PNOTbqkwXzQfw3cSFqP/2M
         IBRfAjJ1EqgG+zetsWbUbvSFQYNo9oPA871rjVwECPTJ3I2egipsBEQfjCbtefdJidiQ
         QhoM4Hbt89OzdGS8Iaia9TpYfhZNPsTixWAPZo6nMRJb5sGCwELnbluhws2enq9WugPe
         PQ66acIam9oc6Rx+mJzry/ETfoI8PyL9PkoQkSCYw5cvUnW0Nr9RgW01Er7uoL0t4sui
         K9oRiezbt39wvOtbyKiL79wKNuhxT8IuEpue3yN8eLwg3DWm6lihLH3Wq5PWiyogetN6
         93wQ==
X-Gm-Message-State: AOJu0Yxj7tIWtMlKxYsfPuLOjxP7v1gyEDhJ2Dd0jLl0aygNqXS7GLu+
	ahu6pVG+fW6GBYElSM/QeOzUOJcUH7FwDF4Pb8KiXacI2EqcT972QgjmqRO4y+VF2ag=
X-Gm-Gg: ASbGncsiToB20vp3ulxMKrMYZbhNK3mJkhQiyf27y2XoGs1uPx+Eu8NJv+m7DnecnSe
	/ABh6SZbKyiTubRLqdonREYbtDk7JrjlZ3wBWB030JzaywIsP+0iPMNM1u2NFv5/Nj015Hl1xhp
	uqiJXyLCD8IRHKBbRYn28padw2Rr65qc1FTXdNjDdTltrBN0U2NSziWQTRqVld8OiqxbM1AU687
	UbzzWfKbye1coiLIOshFL5P+9EjwzWsZz8GnKWDMjk6txAMXfzUVAZVWwiPUEtayofze42cpEvU
	TPglcpu80slagclA9pJA57jnBPfKmkPva/0/jn+w9aafLwYGUXB6Yw==
X-Google-Smtp-Source: AGHT+IHBXvE7b446X64FYR5qJVVdlVXFYhv2VtwqkK3inSCOodlHyO04CC6RTEHbQPm8wwAvG7hKEg==
X-Received: by 2002:a05:600c:b8d:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-454a3726701mr19897745e9.27.1751448138880;
        Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:11 +0200
Subject: [PATCH v2 4/8] gpio: clps711x: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-4-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1VKAdAKKIoL9buozcarUr5qCb4Dsa0/LBFXC4LmZLHs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpE4+oOICtUp+FSaA4fJrpU6lwXsLCylgffQ
 z9f02V0pbGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 coKlEACz8yJTnbagZm7wSx+ar/VBtkbPGeTQLH3onIRqkVA55DttopeidlxnERomP/YLLzMNape
 F923qXs8eDJBz/SC3gHrOKQptACBL9Oyg99fbXuIQrhVWtFdM7ZEq9mD1I9ChioOehf+2+C3FPI
 H1Gr4emOk3uUDreRP9GX5Q+HdPwJxBEqEow5SuDvkISSMC132pbZonfSOlu+ncFLK2oWQJaR7NF
 tY1q5cEvv7cyWqbqG9ZhI57J6SZlSPHrtfBdeUsj8H+SLgZZyK0gMkCde7anLZMs5Eigzj4mBcf
 jMZmlt4pReLvYejapfEQALgacsFQsZODdhaQsWYS3Jq0a0cQt1G32JXJHE7LCNVsXLdkaZ4cYYU
 zvE3UK80VfdFLGLirYISO8mSc/RF5P0foFaIV/kW1UP6WexYiSRpl55knz43Br5z+Dl06scoI7p
 5gLyrPzx12ZUjMfb/Or2RLnk0SjX0mJQhP1pneZwGX0yiI/umEbd51GsCWu5DMdWCkhRVczrPlB
 pm1Po3R3M4Gf5Pk3tpSXZEN7Fd+JJRAoJhgjj6un9LZSbcJmvZHJoRcSI+QuTKGdSRW1YwGcCzp
 TMybDr69MmHi/UzRfNEAstUg/tExr6NtSqNcEe9GcRXwWBGWBgSjhpWRpRd5NH63REsSjlZtoOM
 wvG0YPPlgAlu8RA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index c0c8d29d0dce7617c240daab6597692118b348cf..24ff2347d59974c5b1b43595a157d190e7fb4864 100644
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
@@ -36,34 +38,37 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
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
+	gen_gc->gc.base = -1;
+	gen_gc->gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
+	return devm_gpiochip_add_data(&pdev->dev, &gen_gc->gc, NULL);
 }
 
 static const struct of_device_id clps711x_gpio_ids[] = {

-- 
2.48.1

