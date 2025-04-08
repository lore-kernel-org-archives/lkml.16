Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4488261593
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097053; cv=none; b=hx4y9MSTkCH7Ar2eHh2NihzBvWEwUCleKYJp91bMQgYvmK6p8JI0wZbERoQEIXISkABJaM5CSP3uco6QarVHnMk1fYfedPa7BYHARd0HOwp1yHuSw9ON/lp2aUBYu8XZAWIk4UheD11zV5bMXlKp/PQ2l+B3lTH5FziEp6WESJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097053; c=relaxed/simple;
	bh=hmSxWGIiK/DtDwGKJHp041KAlwlf/8OprB/NVG8dke8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeyJNWUAj8Iq6CthuzINYyCMgLZLHzJDqSsWpvLKxPCX6wQ0GeVf8hIDkfQ1BZoZKH0PZF8N1Klw4Pu6q4/LWjZNePlspONL3+e7e6LIF4VrGBe1JZlHxlHjRiQzQXA7yWxPE96NgJSFR5/P6nM1vIN1jXoCBkUOlDOOaNTJOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BjmtHDyu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BjmtHDyu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac339f53df9so909675566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097050; x=1744701850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=BjmtHDyuKnlFfBK0vH6M3+3br0zZ2mFCf22sAkLEhxDNfcqlU3zP7hvE1HrwBN6SLJ
         Ihz59AlOM5u0OSx1n8DQqBBIjQS/HulxCk/79pe/RVPCo1aYjP/vS802U4vTgtLxDuQd
         Mxo7bDrP3q9U++6m8FD3s/ic8arsNtg266LUPDoQ1dveybzWmn0F4NRobCsJ84xtYMxn
         I8Rng74pSBwBvo81xVo+zQLySQKMY8mGBGiHlgHWzDedurJNP+haXpE3nQeZ9WGStw+c
         SpOXkg7eaOfz2E+ZS78WVMrZ0rC7GoZeH1vbQP8ZyMScu53Ns0QuBBQfF1t0JBIRQ7tx
         XIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097050; x=1744701850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=viy4fKeZUgMYM61drhEr8aRKKpnRpJdskHZ0IMgtBUNaUGnF1zGlXHHX1rEZcBZwiX
         g6Iq5C3W1CVQbUToeOGGxRX0okmAiSMSovE1KqAYuMX5B69FNS9Tbe9IdG0cbsofUauu
         ocBwRwSXAp7ppybbF2hdFOSsY62yGc4OPyDxTnqIRvc96D58xq0s5K36sx34dMeljLNp
         5PMq1PNZ4QAO6giQXfY/aaZFaFqGWy/Lbkn2Nu/qSTQMD1FCYarHPLs9kXQN01Av5J1i
         +sYL1n5frY9PyBylC6bHutfwFqXUIsTcXcbkP404uyd6WkZNeT7yDaqj6gTlNSWkyYzL
         mpMw==
X-Forwarded-Encrypted: i=1; AJvYcCX3zds2c0Y5FGoG9iXuSZ9oC9SuyxCofn50lFDrvwl6rh0OgyCXEbaDxy2IJP4fm3eWxCuJx5wq6ozEdVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZddhb9IMyLIBvkievHN05fUkQUQhMyVWRgnvIqtZLI04tSnsU
	PAd6P3begZxQYy5nR/r1h0S4NscphD4980R7IkedACAKQCmOD2UX25ZEzT3SDkHVNj6HG9XWuKk
	cfwk=
X-Gm-Gg: ASbGnculZazMo3DtsAI96Vx87OIJeSxdBg0qn4pJrYuTSGJBOCtUcd89QPbREeP4iwj
	CYtdu3+87li/t6Cr08sxWn5FWjVf7e6YYQY0zgqcioBrNEyGExu+kMfEehfcLCruQUCaL9XrAO0
	LQVJK5TVOLhCDVNUJOr3SJnnYU6/nJ9VbPv/oqqiXfXlRcAMOJJtavk+v5gIWmy1Q8vJl88lnvk
	tRY02myytGk7Xek05IkLiOPuX/lRszeD6wjfbEvQpADoGRfOJdi5MXIbzpxTzDwW7Fd4Ny7TVr7
	U77Y5RmE+OoCGMrJh0fFSc+mgjawVOfrrIumFw==
X-Google-Smtp-Source: AGHT+IGDlv/Wz2Tv0JI+8Hx2njCPUM9rczyDR5EAPHa4oqor0nd3oFYHO3dEgeKjIpQ3eleoyeURtg==
X-Received: by 2002:a5d:59ae:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39cb35aa8ecmr14702868f8f.33.1744096676320;
        Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:43 +0200
Subject: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zFDAJ44H3rDElvqiaNPmVwvOeCsvopBV8K2+vzPv+N0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2aCcCPhwuF/Scl+dWhUvbWutpdgADlyzo6E
 dkwEIOpAkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnRjEACRE1eo2DpKjHGbPlQbMpv86tO6SMwS6frSIq+KfYxOaODnxG0vYoNPl1XeTMMPfKWxuKo
 MspJKWTkvUN0QuIxmjcZ8vBjIh2Ssf2biltkgH+3Ut1/ExIvxXr/M7gT0UOy2/r94+c7DkVzBEK
 MXr/4KXQXVZ4OSvLf588xywzpAYfsAPShtYaqDz9OdGk8uc9fPG5lzGH4ccc++V5cuv0ZlY9tD3
 ZXnb+hLdVs0BvC1ESV29eq9xcIkTRj/KhdzH4WdJDJB4Fx4xRvCBxuTrv9+Hv2FE6VyVgnX8Knt
 wPQY7lA3cwjzj0sWtwauKnLeZ0x1DD6IMexNhfxrfvgGpEXh0w3i09yOn6vnAvTxetgrzUoiZsq
 5210n+9CVXDRsBqfEUuqtBOx2/HJBwMibEOeyf/tK8wVBtbrEFq1ji769lP5H/PGJUFNT0bPXLd
 vnKVHrJiJUiyX0REr7gSm1AjTYXZb/jNq6PcBIY1JG8vYGaruh/7KsvN5PbWlmeIxn2DIKitoEB
 5c3paQ4gObhMQ1lHal6NduGavNkTb99awzhp7MjrFLQ7vHEkk6LWPVdn1/obav1Qnh7bwi6/RYI
 rfIeivF5Tge1zaLyASFLrEOQUIffbwsDEofBTf4iFicbK3EDjEXXtUNKuD4DDgO+q2/1XPzUYDj
 IgJ4xDux3XMrr+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ee7bbc72f9b3..a76f266b4b94 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				  value ? BIT(bit) : 0);
 }
 
-static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned int bit, reg;
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
 
-	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
-			   value ? BIT(bit) : 0);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				  value ? BIT(bit) : 0);
 }
 
 static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.set_config		= gpiochip_generic_config,
-	.set			= aml_gpio_set,
+	.set_rv			= aml_gpio_set,
 	.get			= aml_gpio_get,
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,

-- 
2.45.2

