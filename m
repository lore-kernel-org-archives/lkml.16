Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7674C2D1911
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771675; cv=none; b=lGTT+8fd5pRLIT9nVaE42Kc2U+IzK0jNIEZ2AqPPmctgwyy+Ka/txAJ63FKYwDNied0V6d9k+YUoqgFO0J8pwmsFEypdLcDq0goenzfIoB5h1uoVhFWNxDWadje7+cpf9URPpeYu+pD1qTkZhwrFaeAqk0BlyRUtWxQYeUqG4RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771675; c=relaxed/simple;
	bh=R+PEDJ0Mv26hKQ/UhrohM2KU4JOPq3DqNEqRcM1cY8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKFBHAe1mq0ffaeZ5WP4PIpvpz5uCA4V94sZcrtZo3goqJ/Ll9eiwPZziW4cSlbGb7VFn0tKTkmA0XKOmea+4sBkw8H4X2fnT4GbwOQ1hc3dSzk+10TU3z2iCp+tG59AFTugGbBBxafLnqwHT9guPiGEm21Q7OxMrD4VHK+QaJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WdOOmfNd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WdOOmfNd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so29205195e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771672; x=1751376472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=;
        b=WdOOmfNdxv4PqeIhI2VisJK4KuOLlwgkrApJzF/FZnwPMg9yONpvIfBwa+vkhsP9Ez
         XJj/PKFtqdLXAFeAI+3EgILBU7I7VzqR2lA89MMarYvaUoHraOckQAIUNhSXq1+mgdY2
         5ThnxHHi4cnTggYhDzE53/rPmWO+plQ4kidAT9iLMzOFU6lRM2CGrkGyv/tTl2Kb7teX
         /GhWFu9THPBvTuW39ge+Nq7nOk7ULfzVLX9lkMK8EeJS1AYoA/KtQcsci/dBY/1yR3yg
         ChVCuM9ztrzt5AR3N+gedOx/m+F3YXXgTrQuVj4XFIPjlLZWgqDYaNyrempD6SuXCQeB
         Qr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771672; x=1751376472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kQaxyBIjK8VEwym/mLAJe8Z7aaiwFK7Iag2ch85G3A=;
        b=CK37UTJGPPmzXehA35+n1YggdJT6ZAiYk06KBPYwyVgRv8ChozZndTkzkKwk65BO6k
         CqbzD75/Fx6p7YZmcbluoSPWnOZH4wrzDRnYjbGVJa5xAv3slCPVRu5A1reza2Nwdzla
         Ty+ThRZApMr3tt6EAYbu5MgAiXYg1FENnevy+HNSQGFnryCwWB1kCy1vwujwemaMAqyw
         WcEQXFzYpBCQGzpV/XBlLPd/DGQscuGaleaLIV+d1YUb0sololevDqoUwmQqo4Ta9LHD
         yzzEe+ZTIxARsAGmsA3GQ6FCJTzdqMtrQjdRbKtwYAT+cSqksg3vMXZZkgaZdrYrBHzb
         SQHw==
X-Gm-Message-State: AOJu0YyEvtD41hSQkzLGRLlMEFAni99PRzrro/txuiy6YFxAuLCPKXlr
	QZy+cuEEGm8lBMRANy22oR2tIEgv4HjP9S1bjQdKHuYFCd8i4/I/diVbydUANG/01Xs=
X-Gm-Gg: ASbGncvDkKQTw+zbMblW9dxvj2qjb4vl9a7hc6R0QjO92E5t6k1JtrGnDp+GP3OWhvu
	rfReJrVMUCR2llYWaGtW1BbwqSo4oC4UKn0ZBMV90/8UpHT1A+cS6xo2ceSq37Yo3wa0TtPW/qp
	cdqSMeBWprBT3N2Ig20EsuNXDYuQHOyBdHGVSpFrRLOHM9c4EgKt49UqduhSJDe3yAvSGVSZ0yb
	1DwybkuMRUJ+vRcvF3SOycn/3zZxW1fcwz0ghm7dKkXwaiU8/FmP4NW+tthjQplKnBD2+Raaz/D
	pi+qTrI1D1lRNzSh/KSIw00jp1mRqHczrBOqEcqMk37EhjY7ofQJvXo=
X-Google-Smtp-Source: AGHT+IEPTDzwLXIM3Xph9atHSvAHfYbq+2JUrc/xQh3stYwnvBg1/yvk8jivlT9igvBuM/YtgbIgpg==
X-Received: by 2002:a05:600c:6211:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-453659f5828mr132853075e9.26.1750771671769;
        Tue, 24 Jun 2025 06:27:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:39 +0200
Subject: [PATCH 7/8] gpio: 74xx-mmio: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-7-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dUd8T2o5opExyjr3ESy2M3JllSvSI7yIu15ScqE/S2A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfN8G55LTaf9eBZt1P84/TXiIGPUQWZadRM0
 uyhNgVY3DuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzQAKCRARpy6gFHHX
 cmSAD/9YkjgnB3SuE3z5/gI6W0O1DNNnL31sikzurphtycOsPnuH0nx+xhHn7lENI7Lf5aKAkvS
 auPZhFMyAdNnnsBfZlP5FCFdp889Uxrgwl/QyQUn4doBf67v0gI8dv32BYDGw7ZcGe+4tJVjQ+5
 YStPY2QLQJwGmsm08MSU0i09S2O6b0exvICbSSNBe84p4aF6mmtBZU76dXKjsp3k8CfhnUTcQw8
 IqAS4TZ9P18ky4kxYrUcmuqskngqV/ugdcGRFhULphctmF38OTU2UNW61zWI+tq5i2xtHPYNNvx
 xwcHvDJzw7Uy9qH1V/EhKNOwbbR3xBv39S4QSZMiid5r7o+MQXsCypqr7uXNmOERi30Hltv9ucB
 WEfHQNK8YynKQR5NmyDUtO17ndT3MELJyjduRo4AZGHt0/NNy+L5J/G/MFTDbpTpdD7iyU9G4YM
 7nWwyz4dhN8TSnc1qHEXO6fT/E2TtOEnhoQU/vOt9Wpm5IoAElYIOrEPOQpunRaOQ3JN5l3ezDp
 iiODbsrAFEnZ9fNsBZ4nMCfdCAd+SWTHR0S/aMT39+fDkELXA0ICxBZz5RPkwNWvaAEeQlqfE2A
 l5zctvRNx0NhhJE7mzVrVSrmVk2TqNVNvcppwFKy6YXlDdGdGf4wOCbUT5MM3/TxNw7nNDxESjL
 nWWorj9IzX1A5Ig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 3ba21add3a1c669171578ceaf9cc1728c060d401..bd2cc5f4f851650a499382b050a556506f4c5031 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -8,6 +8,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -18,8 +19,8 @@
 #define MMIO_74XX_BIT_CNT(x)	((x) & GENMASK(7, 0))
 
 struct mmio_74xx_gpio_priv {
-	struct gpio_chip	gc;
-	unsigned		flags;
+	struct gpio_generic_chip gen_gc;
+	unsigned int flags;
 };
 
 static const struct of_device_id mmio_74xx_gpio_ids[] = {
@@ -99,16 +100,15 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
-	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set_rv(gc, gpio, val);
-		return 0;
-	}
+	if (priv->flags & MMIO_74XX_DIR_OUT)
+		return gpio_generic_chip_set(&priv->gen_gc, gpio, val);
 
 	return -ENOTSUPP;
 }
 
 static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct mmio_74xx_gpio_priv *priv;
 	void __iomem *dat;
 	int err;
@@ -123,19 +123,21 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	err = bgpio_init(&priv->gc, &pdev->dev,
-			 DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8),
-			 dat, NULL, NULL, NULL, NULL, 0);
+	config.dev = &pdev->dev;
+	config.sz = DIV_ROUND_UP(MMIO_74XX_BIT_CNT(priv->flags), 8);
+	config.dat = dat;
+
+	err = gpio_generic_chip_init(&priv->gen_gc, &config);
 	if (err)
 		return err;
 
-	priv->gc.direction_input = mmio_74xx_dir_in;
-	priv->gc.direction_output = mmio_74xx_dir_out;
-	priv->gc.get_direction = mmio_74xx_get_direction;
-	priv->gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
-	priv->gc.owner = THIS_MODULE;
+	priv->gen_gc.gc.direction_input = mmio_74xx_dir_in;
+	priv->gen_gc.gc.direction_output = mmio_74xx_dir_out;
+	priv->gen_gc.gc.get_direction = mmio_74xx_get_direction;
+	priv->gen_gc.gc.ngpio = MMIO_74XX_BIT_CNT(priv->flags);
+	priv->gen_gc.gc.owner = THIS_MODULE;
 
-	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	return devm_gpiochip_add_data(&pdev->dev, &priv->gen_gc.gc, priv);
 }
 
 static struct platform_driver mmio_74xx_gpio_driver = {

-- 
2.48.1

