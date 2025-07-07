Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036B28A1D6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874638; cv=none; b=rKI+oXbaJ6nPAFfZNNbs1KuW+Ce9AYKH6w6TawFuq+Z0FdCXZnZwnCj/+6Q1gvK/e8EDiu54q6bAu3YF0+EdeF4KliH4WNd9EA4HdNdGgN86E/uPHnuwN3qhp8ywhpJ9Zryy5rhUk/tUWP/AQrPurpkH6/U+JT96WN/8V7KBvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874638; c=relaxed/simple;
	bh=J3lfSaGSJElFYN8a7NlOaJspSwrbv0Tab0XbH566Gt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrbWg0axIBTNmE51dDI1RRXI1ZaX1WqvAoQg3XctfBHjM2qFR/BDSOrx9+DtP6jO4eRkGyLseMHXbW80nhCR/yRnEX9q4HL9pEHlTePzQ6EusostXuy4QEx2GlfASEWSY8Sbqmpj+/LpDXkqcrolhoCPu34MIdcRD2yDgcXkpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lQMkXnSE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lQMkXnSE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cf214200so20713385e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874635; x=1752479435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5m95BPd+tC0NJEgq1fKV46WFawJx2Vc2kdVjnJZ0X7U=;
        b=lQMkXnSET9715hSPiqi0jd2OMPePVJtNl+7OmbfaZyiiUZZmvd/P6DPUSCwEBfEkDV
         UzsX+REO7QRcKTpvZkNGy+BAeKsPWqDnIVm/eUMwaqWmmvBvKLv+Cbyp0FPl6/AjWfsg
         LTKZKZdVeW1h/0mGveFDf83nsyfnP2BcqEcrpcgA9N2imGz33MgMHCrlHvg+8R8qiSXh
         vG6I1WNqLye33KWqb8P+8dI9At+eVdLtrdycHO7mctQ2waLpw1WtVVM1tH3sercH8FUz
         ua9NkygjOX2nyYAY/rSLKN0DWHdCpa9L/Ys4Co1BEUnRw2Ghmq982PiPqkyhYuc5ajdd
         17Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874635; x=1752479435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5m95BPd+tC0NJEgq1fKV46WFawJx2Vc2kdVjnJZ0X7U=;
        b=GCmHN+2MWsvgMC826wTrwI8p9POUZs7mhDufNicnjlmTRfYi70s1ZyvW4ED0y3CMhf
         GiZf1/WSnerxQTpzX+9NvAL3r1kRXCQMOxkpVaevbdYSEkoNEh6pJa0druvPwUGBhvne
         GZjP9nMiG0N535HLpHSLaMFdxB7Xrbi8zoN3KIrJCDyqdYnrEU19YoZd/dm1SV1gawWB
         u/s9nCpwf6pRzBN8eNGzMDIZJEpNfNd2oeigG4mk6PfqMenRnsUfitGV+UN85IKnM3gT
         rWyTsxGL+RyBv3ldD0f4q1NlnOlScFD6GEy4ig1aN7ZkSPgQlSZ0AUnM67rXkrL0AiN6
         aaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXprovOcHcJapGrRKewc4a4YwYs5vv5QY/tDI04SfJ4OQYOXFfCufiwbTBXDyc8cfYUhrwtH3S+CvbeHXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiloXyr+jeJ4DPiHzPsS/02m1VJfFDjh0kV7hz8NGFFpcs/Cj/
	lHJj8N1ffSzzBI+a0fDy6jfw+MHuuXa66wdJbhyotBdo9nQzEby6BIIPkT+T/n5KlAw=
X-Gm-Gg: ASbGncumTb1kR5Wy4I4/OZYT/XhB0U6Lfv6vk1A5ZHph1S7XLvb7r+ZS9ZJGIkD3Qss
	ICvLS+P6JlVui91RXFp4gvW7V8rbyZmy/8cbci9qXVKXxd1QnmWXXj+pGn7tucxgQiV117UcnAW
	jwbsFIPjr+SXRwmXOiGzDdpq4gYXfaKOhSuDbemOwadcOVwHd22yrCjotdEao/6+zPoBF4hUMRg
	/r7mt1jZklY46s1DexP8A6uxqR0YwKZTT+0iKy4KPRhlL1qdRg7d2b+4/7sSn+4wn6SeTgycWsW
	FGiC+h8FrW2SyIkvqBeSWMaJ+uNxzszabu0YEjQ7R1i0x6KzMmAiAudO
X-Google-Smtp-Source: AGHT+IHsI+U/zbDSojMWN6sQm8VqQSx9aNhllH3AxLDc+j6V7DOcunJJMpxwdV+S7DO5xusMHGPzvQ==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3b4964f4da0mr9403903f8f.2.1751874634985;
        Mon, 07 Jul 2025 00:50:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:24 +0200
Subject: [PATCH 11/12] gpio: viperboard: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-11-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6288;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hG6ioXzqzHsweEWMJ3BfovvFEd26Ob457d1Hk91Aou8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w8kR5HfkB64zWwyrPXKAiwMT9HvA9xCgXzs
 3pKgIk6+6SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8PAAKCRARpy6gFHHX
 cpLoEACy+LzB2oIjcjJubbFal3oJ0odHk4EQHj7PZKBDox/S3htDeM1+FAViWFPpp44LwXrHVJd
 rZLJkEinpuIpyjqfpENeFgXMgEWWCCIOUmcK4azXhS5YPVnFkxl0LhTQez814mKWgJAZM1yuj0R
 tSvipK4cQBa8UUl1RKXrsb0naRvbfkkApmgloy5RrY7pJTBEU+trqDIVB61vU2mZ6hTjZ9+gogU
 //5ti98loMrVW9mdvZsWcpJt4vxDoHAm0JBMwOgo4VMqo3ghx/4uTh4Ozm8GPxTSjDu92RY31pZ
 vRWnd57ryNVnSwOwM1i5pWbpZ9UfSC0OztH1+3BvaTPOREZI8dy1CHM6303RX0ZmDZPYoaHNPKz
 PVxCW6p5NJK+F3rPr6XQ9L6Q0d/FUuCpbLXvhOvEmGs/Bu0GFv2drMbQlB72t91n/R0DN8+/Qrp
 jXKsNHqtJ4+NKrRrWLXdTl1ICMclZQ5td0zoqaGNHMMIRfff3g93xTnixkXNdHWQ9P7gtid84w1
 6mUrycMIacz+as0MO4Ej+Q3NUmLeslYFrxRKnnztz239jNC/RQCjuhicBVqLCzwG40JLIPWGKf2
 bNs9D4gCLrABH/LxryBSFYkDCZw28ipZknYxo3iDkX1Lc7/NnRYdPjMGiVeTSsUWggbTiKxqCEQ
 FJke3RNIg2OY+yw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-viperboard.c | 116 ++++++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index e55d28a8a66f25dd0949133c4a7f3bca9b5711dc..3eba77f981d3a502b67a0a7cdea51c706d4c3376 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -128,45 +128,50 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
 	return answer;
 }
 
-static void vprbrd_gpioa_set(struct gpio_chip *chip,
-		unsigned int offset, int value)
+static int vprbrd_gpioa_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
-	int ret;
+	int ret = 0;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpioa_msg *gamsg = (struct vprbrd_gpioa_msg *)vb->buf;
 
-	if (gpio->gpioa_out & (1 << offset)) {
-		if (value)
-			gpio->gpioa_val |= (1 << offset);
-		else
-			gpio->gpioa_val &= ~(1 << offset);
+	if (!(gpio->gpioa_out & (1 << offset)))
+		return 0;
 
-		mutex_lock(&vb->lock);
+	if (value)
+		gpio->gpioa_val |= (1 << offset);
+	else
+		gpio->gpioa_val &= ~(1 << offset);
 
-		gamsg->cmd = VPRBRD_GPIOA_CMD_SETOUT;
-		gamsg->clk = 0x00;
-		gamsg->offset = offset;
-		gamsg->t1 = 0x00;
-		gamsg->t2 = 0x00;
-		gamsg->invert = 0x00;
-		gamsg->pwmlevel = 0x00;
-		gamsg->outval = value;
-		gamsg->risefall = 0x00;
-		gamsg->answer = 0x00;
-		gamsg->__fill = 0x00;
+	mutex_lock(&vb->lock);
 
-		ret = usb_control_msg(vb->usb_dev,
-			usb_sndctrlpipe(vb->usb_dev, 0),
-			VPRBRD_USB_REQUEST_GPIOA, VPRBRD_USB_TYPE_OUT,
-			0x0000,	0x0000, gamsg,
-			sizeof(struct vprbrd_gpioa_msg), VPRBRD_USB_TIMEOUT_MS);
+	gamsg->cmd = VPRBRD_GPIOA_CMD_SETOUT;
+	gamsg->clk = 0x00;
+	gamsg->offset = offset;
+	gamsg->t1 = 0x00;
+	gamsg->t2 = 0x00;
+	gamsg->invert = 0x00;
+	gamsg->pwmlevel = 0x00;
+	gamsg->outval = value;
+	gamsg->risefall = 0x00;
+	gamsg->answer = 0x00;
+	gamsg->__fill = 0x00;
 
-		mutex_unlock(&vb->lock);
+	ret = usb_control_msg(vb->usb_dev, usb_sndctrlpipe(vb->usb_dev, 0),
+			      VPRBRD_USB_REQUEST_GPIOA, VPRBRD_USB_TYPE_OUT,
+			      0x0000, 0x0000, gamsg,
+			      sizeof(struct vprbrd_gpioa_msg),
+			      VPRBRD_USB_TIMEOUT_MS);
 
-		if (ret != sizeof(struct vprbrd_gpioa_msg))
-			dev_err(chip->parent, "usb error setting pin value\n");
+	mutex_unlock(&vb->lock);
+
+	if (ret != sizeof(struct vprbrd_gpioa_msg)) {
+		dev_err(chip->parent, "usb error setting pin value\n");
+		return -EREMOTEIO;
 	}
+
+	return 0;
 }
 
 static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
@@ -304,37 +309,42 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
 	return (gpio->gpiob_val >> offset) & 0x1;
 }
 
-static void vprbrd_gpiob_set(struct gpio_chip *chip,
-		unsigned int offset, int value)
+static int vprbrd_gpiob_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
 	struct vprbrd *vb = gpio->vb;
 	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
 
-	if (gpio->gpiob_out & (1 << offset)) {
-		if (value)
-			gpio->gpiob_val |= (1 << offset);
-		else
-			gpio->gpiob_val &= ~(1 << offset);
+	if (!(gpio->gpiob_out & (1 << offset)))
+		return 0;
 
-		mutex_lock(&vb->lock);
+	if (value)
+		gpio->gpiob_val |= (1 << offset);
+	else
+		gpio->gpiob_val &= ~(1 << offset);
 
-		gbmsg->cmd = VPRBRD_GPIOB_CMD_SETVAL;
-		gbmsg->val = cpu_to_be16(value << offset);
-		gbmsg->mask = cpu_to_be16(0x0001 << offset);
+	mutex_lock(&vb->lock);
 
-		ret = usb_control_msg(vb->usb_dev,
-			usb_sndctrlpipe(vb->usb_dev, 0),
-			VPRBRD_USB_REQUEST_GPIOB, VPRBRD_USB_TYPE_OUT,
-			0x0000,	0x0000, gbmsg,
-			sizeof(struct vprbrd_gpiob_msg), VPRBRD_USB_TIMEOUT_MS);
+	gbmsg->cmd = VPRBRD_GPIOB_CMD_SETVAL;
+	gbmsg->val = cpu_to_be16(value << offset);
+	gbmsg->mask = cpu_to_be16(0x0001 << offset);
 
-		mutex_unlock(&vb->lock);
+	ret = usb_control_msg(vb->usb_dev, usb_sndctrlpipe(vb->usb_dev, 0),
+			      VPRBRD_USB_REQUEST_GPIOB, VPRBRD_USB_TYPE_OUT,
+			      0x0000, 0x0000, gbmsg,
+			      sizeof(struct vprbrd_gpiob_msg),
+			      VPRBRD_USB_TIMEOUT_MS);
 
-		if (ret != sizeof(struct vprbrd_gpiob_msg))
-			dev_err(chip->parent, "usb error setting pin value\n");
+	mutex_unlock(&vb->lock);
+
+	if (ret != sizeof(struct vprbrd_gpiob_msg)) {
+		dev_err(chip->parent, "usb error setting pin value\n");
+		return -EREMOTEIO;
 	}
+
+	return 0;
 }
 
 static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
@@ -370,14 +380,14 @@ static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
 	mutex_lock(&vb->lock);
 
 	ret = vprbrd_gpiob_setdir(vb, offset, 1);
-	if (ret)
+	if (ret) {
 		dev_err(chip->parent, "usb error setting pin to output\n");
+		return ret;
+	}
 
 	mutex_unlock(&vb->lock);
 
-	vprbrd_gpiob_set(chip, offset, value);
-
-	return ret;
+	return vprbrd_gpiob_set(chip, offset, value);
 }
 
 /* ----- end of gpio b chip ---------------------------------------------- */
@@ -400,7 +410,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpioa.base = -1;
 	vb_gpio->gpioa.ngpio = 16;
 	vb_gpio->gpioa.can_sleep = true;
-	vb_gpio->gpioa.set = vprbrd_gpioa_set;
+	vb_gpio->gpioa.set_rv = vprbrd_gpioa_set;
 	vb_gpio->gpioa.get = vprbrd_gpioa_get;
 	vb_gpio->gpioa.direction_input = vprbrd_gpioa_direction_input;
 	vb_gpio->gpioa.direction_output = vprbrd_gpioa_direction_output;
@@ -416,7 +426,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpiob.base = -1;
 	vb_gpio->gpiob.ngpio = 16;
 	vb_gpio->gpiob.can_sleep = true;
-	vb_gpio->gpiob.set = vprbrd_gpiob_set;
+	vb_gpio->gpiob.set_rv = vprbrd_gpiob_set;
 	vb_gpio->gpiob.get = vprbrd_gpiob_get;
 	vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
 	vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;

-- 
2.48.1

