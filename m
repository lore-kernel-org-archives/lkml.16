Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B514A639
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009769; cv=none; b=SA8cBZ/6MdXzHHd+3oF2w0KE/4pVnTeBBQpFxcxF5TXIChHFXfri9aZl9t4tQwHECSWrbTib0ufr+Bd3WC9ybG9f9WFbZw1MHeJOX0c+skv9FYbtLD8ZR3U4/i1CrAXl3nG2JejMqJV0QPkA0IMICwqNPVoVT9yjVoVqfrUm8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009769; c=relaxed/simple;
	bh=QDLHMBZTpiBivDqp5pKtEBIW4NMS9LwrxmbdzYFamjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVKWAXGVoF7lp1TrjUbO1XlFTFh21c7SG4EqFi6R/ZYyM4MgrO60dbHKyfz91XlhxYzTwKi8fLrrzNwKn2ONyGFBwYcoxBK7iP53jdi2Ql5SQM7zMr0yCuWjHPB3dACKClPs3TPVPQrIbba+HRVQ+541Y3ihbqfExSJC8ZgXR58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YGaokiYn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YGaokiYn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so19887445e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009766; x=1744614566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oJEkpaKzk7KM5O+yA10t99Sq6/Y0ezDYdwYB3ESkdY=;
        b=YGaokiYnQNNRQaZous63gK6mZCrRiczGNpihvLSBeSeP276SOW8ULpL9P3+y1e83PQ
         vwd6pbL46AIUdkZSKmeyopjHsfOiok91z/HYST40UwZ6/4ZjdmI9ncffITh2c4AYSgWa
         1baBq00Yhd3elKt+6JJAdXIpPJ6HsHTIdbN0r4ivdWKF5Rw5Y9RjFgt4DCyEsep/eDVc
         kc5zZXxE9XQQ5kuZh6b+TpYpJxkHDAsepFDhUFrTn1b84GBBfUqLCSLHSS2d0jTd7zPW
         923EgzBHZwuuuCmOjqP7T7Bbb715CwvYklSMMzFq1XvD3up91Y4MQjCk2eF5zkVZ1p7h
         xytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009766; x=1744614566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oJEkpaKzk7KM5O+yA10t99Sq6/Y0ezDYdwYB3ESkdY=;
        b=L/NtJPE2CrOXjNmHGpa74tdhhVAgRUFHQO4JWoYcaBBrfwvbAruN4oWsDxJWZvOT5O
         ieWDief+ifabKup1fg7vILJNxK5DBP2RemXMRrUF6Ib7AlpYvhD9W2UIbL+pBxG5Wmpl
         Fbi5eRswtkiHTtj+sZeFQOHg+Eg0MLweY+OueFOx4/KQR7gzbQENi1AwQSYVNb3SCaJr
         oDqDM/Ty+vkhvDDXvX5RFDZQ67WtywD1lT91agalV07YpPvWn9U2/+bOuJW0fcwYnaz3
         OcV02AtGnL7i/H9lPlQqMxutRuKmPJp69MsslTzvIzuiUX+R+yuPUWe3d0EPTZ17Y64K
         +50Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl+RCHlWG4aEro2XL0HHK4vSppbK5p8yrE95NWMFxudd/YLRkdvRTXdEz9o99mflbaKSGmhs7QrJ05Zbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB3hSVKymY3gRCYoJN9PUmTbVBGbJCRrPVhWVEo+M8VIM2RATD
	zSKeCUMUZTEMeIq2MliQGXo98gbE4SiFqFlMV/tPuJSSsmV3gsr0Tc2U9MQykx4=
X-Gm-Gg: ASbGncv6+2Ifb9H2HcKHTPSf+DH41xqBAxPjmz1gdKfafFLbX3bMvMNXvPXCEnHAMJW
	wqXxKjmEYT21pCXBCG1wsMD8R+wFjng37AYJnuCFSwXeVdvdQvj9+r1N50UjqFOwyI6YyAJxuDI
	sKmPnYPdHTuB5XIGapk+iigqKf88i4fgcT6m/yVVquSMMhY7fLl5KYf1dGBX/NZA60IGq4rXZy4
	uawOWPc3FGHHiZTiRlPNtXRAzya1csfLY7IA47z9gWd46Da6RKGtUwrY614rM+qYDjDD8SzHXQX
	wDO9jrqKQcZY+rwzkr3PhaStQyruY/WH/R1w1y/Cm+gorrp6
X-Google-Smtp-Source: AGHT+IGFE6oyFiQ9CpLcLlV+haks6tvvNCLBB+aF4dXus3yMP1Llx4O8MohrwYM8rVwVT69R0foFDA==
X-Received: by 2002:a05:600c:8719:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43ecf8e7321mr124503985e9.17.1744009766064;
        Mon, 07 Apr 2025 00:09:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:18 +0200
Subject: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6854LsY/CEKL9LDW7nLKKhBRDGj/vD8F0/gksPec/Gs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ojv0NTNspg6Wx5Fggczg/6It7m8U2gT0lPo
 rxrHkr6h86JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6IwAKCRARpy6gFHHX
 chutD/0cndTpas2Wdg5qBWP1Y3VKSiVXC6hIuu1om0Dd6+1pvJPesqjLF2JFC6zXuYLNkg0+5Jg
 rGlvPXMOI1t9FgiAdbgKurXOq+HFhT4k2qSnOquBOC/PNHNbPYOOlpJuZidhiPkiCKltu3o92pr
 K7HivuuUnrD3r2PaQXoLjhIhZ+jnddu7iDYZQQYgSjAF2FXJVs/TOgQY+fnL2rRRAXZ4kfA/ll7
 6dbIgHm1IM735m+b5kQW+9UuDG14bt/y9uWTJbvgK+xvtRhl5k9jyTWi/P6P3K93ceJolsL+zdC
 WUj/jWB0+TrXlKsF57cr4miv9xpRtfcFOM68jyZJYP/8RT/B5CCxCMHxW7L7SpUkcHnwtwhj6p5
 Iz9NnHrsLZdZsytg+wpvHk5roaSVuWDVE77oA8uClfW6LB+PcAYTI3kuSkoVRVI7dfSXJWSLVn/
 ouOOd1MUVkGTz++pCGaCtcnKe176tnqXb5Wm5MNK93LUMpg2F7KMVNZUW0NBY47bKkYN3Wz9ANJ
 hLKVuAzR5UxbPRdG3dHLIKEHknx3vm0Ac7/z0V1wh99rz6jMLZWAHXAY+/BJPRpl9jTJQEazQ6e
 7nKzWccg6Qhy55gudCDhtyMQvrJPacNqZJ+cdOXjly/IYjPEwBorwqoF/42IPiZqADwOvawnQ1U
 Ns/4rCW8lnZP6Rw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/plat-orion/gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 595e9cb33c1d..766036fdd792 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -211,7 +211,7 @@ orion_gpio_direction_output(struct gpio_chip *chip, unsigned pin, int value)
 	return 0;
 }
 
-static void orion_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static int orion_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -219,6 +219,8 @@ static void orion_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 	spin_lock_irqsave(&ochip->lock, flags);
 	__set_level(ochip, pin, value);
 	spin_unlock_irqrestore(&ochip->lock, flags);
+
+	return 0;
 }
 
 static int orion_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
@@ -540,7 +542,7 @@ void __init orion_gpio_init(int gpio_base, int ngpio,
 	ochip->chip.direction_input = orion_gpio_direction_input;
 	ochip->chip.get = orion_gpio_get;
 	ochip->chip.direction_output = orion_gpio_direction_output;
-	ochip->chip.set = orion_gpio_set;
+	ochip->chip.set_rv = orion_gpio_set;
 	ochip->chip.to_irq = orion_gpio_to_irq;
 	ochip->chip.base = gpio_base;
 	ochip->chip.ngpio = ngpio;

-- 
2.45.2

