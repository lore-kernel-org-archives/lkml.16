Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7123BCF5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571671; cv=none; b=Pi5GK/cVjfJweJ8G8GXN/W7xtLkdjJa7A+fg5+7omf0Cj4kC8uPvhXjtkRNIGF1mmnn7HtLMhG21lBPoupvrb4lYxSESwx988tzxvWmP0zoYMAttlAHCKK6cCXHtU1kvjqJ3e8CvPfhQspAjxiRIoqQ6lsZouR4Q5OcltlVO0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571671; c=relaxed/simple;
	bh=phhWviKKhhzzjzPDil2DbjlngOzuC2xCXBD1aK0WBVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tminzOoUMIL56s23GOnA15EA4Wdrq0Y5Wq4NRgv/qGRu3kS3lxU6ngTGNSKkTWBAPL24RQ0Pyk82hLoYm84HBfhjX+sTMObRbRGcIQUO2Xy981ZD3WWi+lYFVFubgJF4mcy2C2VrrxsfmtDSfMNo8I7q7JYQe4vBmwzWf/VOEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EYnj0Hxi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EYnj0Hxi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c266c1389so1369160f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571668; x=1746176468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=EYnj0Hxi6pW4zADwpWaOo3NtQwbi0vT+6Hk+dxRI21HdXhQrg+F2r/uAcsJWHRbrYK
         pW2OOIgmEZs0gktiK94MCgPEOLud5BwOTeoBdCLQqlekerFZCzSI+9A9JG96uqtQoaiS
         e4SYx9dg25qQjdKXQhqLtRlWA5iQxdRqLe0uBU0l9JNU2GU04elS0OCVSEFD4JPFJRuO
         brTs5DQzxozWyP5xoPAK2y8uaIDXXM/hlvIAR9OPPc0QkTOxlmwp03bWeP8FSq3hzS+K
         ATYpHlNyt7wNzUiYibGon8VZ00bEM7cswU1WbqD1QtIq9bDWgNcgeYcZX5/KO03IE1Hy
         DmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571668; x=1746176468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG92M+ThGG8rcCnZb6WUafkA585r/LuxT+alwijT/5c=;
        b=l7aDfAHbEqin9C83MZeHH4n4Bib3GAU/Ed6FMdlaSAb6hkNhHgcVs246WfkLIEit9s
         7THVLMDn9AyDdvCGt2HKRWa1MF1nIUXERyACpAVUYqxt05IPj7aRu/ZhLxIEQfkBdCyu
         hJAkuqxtfg+PS3TCsqr+HYLxpAykIh20cIhmB+65hW7v38am0H7/Y3qnLNEaLBVK5Om8
         I1gR2hNSu6a8AbpbOWWYcAYLhTgWk6FMBrZ0Msu5LDG2W/38dIu/wXO4/0yXEff/eRFW
         9aYH0KItoHiVPjRCLYzjh9YYojawbpzdVUrh5TjottruCDa0jUwrVRxHo3dpybVB8keL
         +wag==
X-Forwarded-Encrypted: i=1; AJvYcCXgIaMhIZQiampemDyLIbhatApK/YoiesIXOWhQyQWMehInwzvb2HZayiNfIs45iFOfwWBO3Me/YKjEukg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFZED6Y5nTbQDmw0HIOgXEFtxODKMLx4ueWRHWpu8nNgg5rFM
	JdJuKtaIc31DW7Q399Bx/2O/YUFomkckkhh/uCkS1zy0oZhQ+KZXCW73RAIZJwg=
X-Gm-Gg: ASbGncuQoEockdn/rKg2P/vJC0ut0LwReAvZe0zNFH2G3BOtxtEam9EV6mnfhrrZ9kS
	iXG9BbH24//a0MHGndc/vQ1XjKFcFLeTKFXxmZksq5i9gn9r3+Uz2dOx/V6JzmFNwSH+Oiky86F
	SGoZO/mjH67TK2q+EZN44fEfXVy+fFqsonj3arXdY9UdGZu6nPjU+Jv2ircFRc/4FEegZIpSvML
	PoVl+sffEDBL6gjSHmnmCuDf8IEn3IgAS4QTSWfmfTZRCcSeQF2U86j2y0CoYZlLAI6hMA/ac/K
	VO16wgDJUbN7RACmDLjfBwlUMBkbvAJZFA==
X-Google-Smtp-Source: AGHT+IFW7oHQT2iQkXG5/oplsgKCVuoYvLPqlkf0fWIPHa0BO2c6LkQgBuCA2L7Ixcx9kcJza03b8Q==
X-Received: by 2002:a05:6000:1ac6:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-3a074f4853cmr1080551f8f.51.1745571667902;
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:58 +0200
Subject: [PATCH 2/5] pinctrl: mediatek: paris: don't double-check the GPIO
 number
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-2-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nUKaoN4taOpveP3nc3OVuJSxVohaZIGpFohuQJLAScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09P1im4kKMb6U7RG39p9G/VrnbdkYWFGjboY
 3bmo1dLQC6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 crgtD/9is3Kf21qiXzq1VSscbgtqKAJ8hb/XCsd0cS2PtTKxYDWP1SnTIL4KX7ofzZY6+UNXOZp
 dy+D4aO7WNZsFR0/IHIeqWBWEk3rmMlSGkbfrIVDhpWvtIo6opyCQxql8Q5LViq0LRe6JEPRdoC
 Lor1QT7DRjA92oRtQppJ2/eJZFWLujiVsYYPLfXICUinmpUOHk2wHZ7Juzozwht7N/RM8hDQi5w
 Tq5I9jApIX7HuFwuRuILD7KrOPs3yAIkxg5EIl9t/8uEheTZAUl8gjFrt2oXh1d8QjiG6UIsnQ0
 FCxUF6W7Qt3yoXvJB7BVE+lfhs5yJuhuQiBz7jSQOmUCnEpPC+rnlE6PEgqlrlB4S3UfQMyfxXu
 TkZGAWz6/V/ricSCTfoPbWxtHT/fmyIr/PoIil6NMgsEtw2lsTQZclPoBCEjv8FSHBZaLlZp21M
 QjWftw1cUSxo+sR0S6FDFFCo3EdAN3zIgltKS6I3KlaRXzygoM+OsakxjcXFba51INkzT5w7nD9
 EsU0E0Z17ILt6kloAzswTHoIJKQM1NeKw/qUNa1zMq4sLMkRIadcAf8J8lFYGsqLQt+KrRyjmQN
 85NWWLYzuxDF0gYe0/Ci8Zos6oglGyM6ff6HvFfXZwh0zf1/igURjsYJ8qyXym9CZlTm2F6YJGx
 sWnd0wD08yn563g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core already makes sure we don't pass invalid GPIO numbers down to
the driver callbacks. Remove needless checks from the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 87e958d827bf..852ce0ac7ff9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -840,9 +840,6 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	/*
 	 * "Virtual" GPIOs are always and only used for interrupts
 	 * Since they are only used for interrupts, they are always inputs
@@ -868,9 +865,6 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -885,9 +879,6 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio >= hw->soc->npins)
-		return;
-
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
@@ -895,22 +886,12 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	return pinctrl_gpio_direction_input(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
-
-	if (gpio >= hw->soc->npins)
-		return -EINVAL;
-
 	mtk_gpio_set(chip, gpio, value);
 
 	return pinctrl_gpio_direction_output(chip, gpio);

-- 
2.45.2

