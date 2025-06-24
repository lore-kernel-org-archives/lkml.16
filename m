Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C42D2386
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771676; cv=none; b=H7Im+IFHgAJj9fNNDjfgIhR3JvK/iVQVVvBuhmxM9Q97Jmv7ES9tMeUTslb3k3V/GoJg8uUy8iMAdo9OJZiCQ142xek2weQQdszYZ07OQDY0PoaMTdk6xxil/YQmiCfHbJRRCCrzsFonDJu3b6WFMQBZk1rshnQM7IY1E5P+3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771676; c=relaxed/simple;
	bh=pM0n60h3HD/tmH+hBKVEPyS+pbvfe8o2Q+W4NhSPShI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqjAH+dHC6IKvg2h4+VCznMbv6VUMkVSIDv7gXeMpGciGuEpoOKCbO0VeQDWrsRbSErK+Xq/2Y8NthW8ALJk4CXe5LAfCOIZWHoB6cQ72H5wWGCoFPGBfTlBj9nSK7g/S9NKRqKWwnRUiAMNV1U+D6LOs/KkU3YudRvV/Bggh+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gj+TQiZW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gj+TQiZW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4177127f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771673; x=1751376473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=;
        b=Gj+TQiZWwcKDLXsiNwSpvYpa/+sIex4HpsSDDn0jnHEIJDOnDAjsuStUejo4Bvmr0f
         cwMUKoa57ufnjvlgK9xx1yzmyGiyMgNcMvmJxy+Zmca0J+GrtWeJzTCxu/+nQ6zkLvfR
         FWzrvWifVmU5j+4ztnzBaARWwZCxmfGhti+xeuyMNPAV0nJhCmJAfuVqyx6hwNG3U471
         dpEiYpjGSuTB02CwHEyfnBdxyYIh9XHWV59OWptmrN76sSPjz2LfZTADpG5eXxi3aH8E
         tGkESoYoPhC4MVN2Ku/N+JoqHpfxxireGeYu8fm8T5a7Jgo6Pt8Ri5AdMH2ykWROAHlk
         Hmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771673; x=1751376473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42qfBZRks5CGXOIurF+J5eyvnPR1JOmltRDytTpDnik=;
        b=RMc0TKLxEWJKg07yl8qf/sLn77V/nqDtkmv9849l0UjpdJ5DTrFHxvZFqfRcjZYfyw
         YbU2Baqo/1SEzSh8X4xTXcYDb0HXxwWxiatmHSrCFlOCIgeBlprnI0GUdFkFKkJKQfzM
         0Ev8Gd392JHmQbZT2vYkLSQGEY9H2lKxmGt/oZL17Pl4JR9kJm1XXyjv+I+M7bMZ5tg7
         6ovFgBNn2vMQVq8gt5R2z0P2nvKZBoArwxkk+lXRSZgKIPIEp9eAbrTfD00h446yyI75
         5lK6qNn4C9w6PfI9Dpc22yxmcFqXcjw/Gk1PXTbnouzmvyvlEt7YXKBnkD7S+zW6PkL1
         LH9Q==
X-Gm-Message-State: AOJu0Yxmbt/ao2m/vwrq2JjaHdzzKiZHktoMKA/Faph6tkP6WL/VMc3B
	1vvaAU8vJncbWs6PVmv1+sIm6n2xqMu04KKXtHzBJMsIZJdbUrjYyBYkAZgBb36jNBxbJAk4e3D
	cmfWVVWM=
X-Gm-Gg: ASbGnctbyl3wm60QZwXU9P6cssjUbDIoM+UOS03kbKBduFMFlNM/xb37Cv3xK8xHBxe
	KE1nKE0Vc5eXf4X3gcZSyymT+cVkR7nOgDFWif4i8HEueAQOt1vlbAweIOkkxGrn5p9QjHvyo4T
	au8TTmPzcZ52iQYWlrLpIS14L+crTxUOWWvg+uDDtX6lr0cVA7i4tcTjB2Mhg43pd9oPVGa0skv
	o36T0VwfHwBhY3AoysMWHAjHPx2HYhN7Q/BSLtMFfGEdYBkBuK0RtHpLXMuGlXTiz8P8zN3vh8I
	h/lPQd2G3lgf2qtXo+C28XFsVGa8qxXm2iqnmwWaWYo0omGwK3xmPp0=
X-Google-Smtp-Source: AGHT+IFDRcE0YvqSWvzHsw8Wjp0saBNngEo6sSuauX4WB6eVnw9c+hFTvCibFA5/V90NuJg61q4Heg==
X-Received: by 2002:a05:6000:2289:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a6d12de8f2mr12964118f8f.31.1750771673236;
        Tue, 24 Jun 2025 06:27:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:40 +0200
Subject: [PATCH 8/8] gpio: en7523: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-8-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AkIiGyeUQx2GXJPFGzxHW+/s0um0+Eyc9TO0+IVjWog=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfNCGRfJkuzmVlo7UHdKOCMgJbG51c0tv17w
 mTEfmkCEeOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cqKUEAC5HbCZgPEeSVMPAxNIYtukMgkpkvILoOnfoZLy8Pl6S+b+XsBUpG7X54Z5vx8BIdse5eR
 WuppKaqqv+DuFJsXPrA50NZq1NCPdiQra22q9AjNGL3BTp0MXZ37jmEwtT6EJ2HacV5eQvfb7Nb
 rZxBQ361MUGhBAH2Msvr6t/W39ttDaJ0RKpFzj6uLBHQZOxNqGotiVliYPKlnyQGXWmrv4FBzS9
 kpg1YJUct/gOoO/PXlqnTBlGFxkzo4g6pHxwrbR0OtABwZ0z797oeG8RJ60QWR6s3pvDYzF2oFz
 BKQh9SMvemblHJk55DfIKwx/8kXdYX+pTfW5/3q7RedjqXrGE33DR0eheSFN+hAx5em6CvDGGkD
 HJMRagpzEjPa3tXwKXUimxbJkSFlKOXCdEDCcYreD+SET0Y8tiK9HxQmy35v1ROrbwfXr7mWhnZ
 SNW2P8YD9YU08TELbFHP2feCHm4vw+7ftG+2l/3CnHlV2OG76GPcpWgVUAOBdsp+okHA1R4bLFb
 q3V0ydqrnvAJqV5DveHTqalUW5R3EqB0P1nMOq9vWQo1pymffGyoH9IcWVNu7vMkhkuBuEbAFcY
 9ZC1JZakPmq8qio0JnQ7bk+XCS1COTJ5Q6L0+54Uipo0vwctNVHV8uCjD+1yCSQ0NpLm0MVRrBY
 jH77CQ/Ax7J+MaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-en7523.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index c08069d0d1045e9df4a76cad4600bf25d4e3a7c5..cf47afc578a9cea1fb1adb97f51b143b13c66ab1 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -4,6 +4,7 @@
 #include <linux/io.h>
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -13,28 +14,23 @@
 
 /**
  * struct airoha_gpio_ctrl - Airoha GPIO driver data
- * @gc: Associated gpio_chip instance.
+ * @gen_gc: Associated gpio_generic_chip instance.
  * @data: The data register.
  * @dir: [0] The direction register for the lower 16 pins.
  * [1]: The direction register for the higher 16 pins.
  * @output: The output enable register.
  */
 struct airoha_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *data;
 	void __iomem *dir[2];
 	void __iomem *output;
 };
 
-static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
-{
-	return container_of(gc, struct airoha_gpio_ctrl, gc);
-}
-
 static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 			  int val, int out)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 output = ioread32(ctrl->output);
 	u32 mask = BIT((gpio % 16) * 2);
@@ -50,7 +46,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set_rv(gc, gpio, val);
+		gpio_generic_chip_set(&ctrl->gen_gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
@@ -70,7 +66,7 @@ static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 mask = BIT((gpio % 16) * 2);
 
@@ -79,6 +75,7 @@ static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device *dev = &pdev->dev;
 	struct airoha_gpio_ctrl *ctrl;
 	int err;
@@ -103,18 +100,21 @@ static int airoha_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->output))
 		return PTR_ERR(ctrl->output);
 
-	err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
-			 NULL, NULL, NULL, 0);
+	config.dev = dev;
+	config.sz = 4;
+	config.dat = ctrl->data;
+
+	err = gpio_generic_chip_init(&ctrl->gen_gc, &config);
 	if (err)
 		return dev_err_probe(dev, err, "unable to init generic GPIO");
 
-	ctrl->gc.ngpio = AIROHA_GPIO_MAX;
-	ctrl->gc.owner = THIS_MODULE;
-	ctrl->gc.direction_output = airoha_dir_out;
-	ctrl->gc.direction_input = airoha_dir_in;
-	ctrl->gc.get_direction = airoha_get_dir;
+	ctrl->gen_gc.gc.ngpio = AIROHA_GPIO_MAX;
+	ctrl->gen_gc.gc.owner = THIS_MODULE;
+	ctrl->gen_gc.gc.direction_output = airoha_dir_out;
+	ctrl->gen_gc.gc.direction_input = airoha_dir_in;
+	ctrl->gen_gc.gc.get_direction = airoha_get_dir;
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->gen_gc.gc, ctrl);
 }
 
 static const struct of_device_id airoha_gpio_of_match[] = {

-- 
2.48.1

