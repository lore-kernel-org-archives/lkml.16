Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC623AE95
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571670; cv=none; b=iiVkJyzLkvD3HvasERBqVghQhEK59kB/yyeTLrkIvh5Uk6iOJOw81CRnIm4wxVP52Gu7qscCh1lacnAmRGXbU867HqrcbtR5Hm/9VYze5x68S1Zv8zEFJrlEDYRSePKFu4XP1efytC+is+BOohLQ2fvwvqOLxexjIBgcbXR42sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571670; c=relaxed/simple;
	bh=Lg7SIXa0ie0LybxnwabcVg+h7GXu/NKorvK1sVySxcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnfqamFcdjSDSLyhV/ZMd73S0uz6YOhgWczgjNkLrFiBEQ7hwrPPXhGG8FIVmkM0BPPZtpzm27XidcD2NepmBvwGyDwmID0SZ8kIGtY8JrYCIFK8We8E9UzzsLOJW0rYoabk64X87PVIm9dvvRPgexF1bWElzcux0sM1+OAvdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZZK9c1k2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZZK9c1k2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1398647f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571667; x=1746176467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=;
        b=ZZK9c1k2GpIRHpaiYjHGfTkfd1bluAxmhM0YKsfWg6lFA7aG1w2lznLj5CSIpLodCY
         A0K0dvRJ8L4X70n0V/+YrMw3nN4Af9OZnvVRECkuQLEX5KSjtfl+Omu9pcxM2OPZ039S
         /upDGy8jEQeuMqXT4WSxeH+ofguqk8T8/Tf0wIfUda3Lh+6+xJoEnoCP6Ksta6gP47We
         JjtAQBwY6ByTyxtVAguQ6Tz349UAT3QwpsyQEyZKk1nkbgtDmMOk0HxkUS7KLE9NCyGK
         u72uJb4cmvWeaTWI3qUzlDG1uIFPGF+BnICzPykMQL+VhmruGFXyEfKBOfo/BXDeIIbL
         SrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571667; x=1746176467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB90erWf+Gm+Y0GtLErqGxR/pE5/v4Z/PlOKc5IF8Kc=;
        b=hadYKkIl1kBTdwhmZYcEV2mRFWLDMM0u+1TRROwWrFRIrPk7gy3Uv1NyzWmIfpjBy7
         3msodjpX5HNyP6gbBhF7KQoJDJiJW0F7Omrp1NWsU/jCmQkSK3ZV57uONRbAr5NW0TsW
         JyRySjvham0lbUGx9ZUBHdobwCZ6VVlEQsHajAl+ydDYoPrxQGISpCixac0P+z1nWa0H
         a7L8F4uT6GkuN4lT8f6i2zWWdeKSiNF0lWBlUChdgeEcWRgMWOZM6oKfLMp7EjDvAgxZ
         cocLYCdjs3swzzj+f6Ri171TDIXM15X7yPRiwYEn1m/vyKJQaowrfkDfTN4QD3U5XCAB
         YYww==
X-Forwarded-Encrypted: i=1; AJvYcCUUgQc1DqV4YxO+3Rv7UdB3ohVkaYFFTyHDLIOWgP+EL/q2dcL6C1az7RTFYHMfLoswFaJVIlV2hqZsoho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys78ceENL9e5oHQAslL062HDEMJ1Xcnuscskh2OT3lkclOCyXu
	/28AHLhUBKAoExB8uEBGHUYNh/F9XGEFUn4Sc4idBpokFmxWlXZTRaousMQKXsU=
X-Gm-Gg: ASbGncsC9xL3LVvXK3EixRUaYwgjquzq9Mm8wRWAhr00W2/MmqbtffyqXuhiSofESbJ
	96qlEkWmG4Ne09NqcxjIcgddxdi1frPZECGrHqx+3a2RaqS5oX7L7DW1Lg7wBgcJKbGI2tLJiTL
	LRogSPwWDsea87gC/5xO0a0lBhc76iLgyDFZbx1v+jxKNxDS6SIdLJ7CjIRKEwXKA5eWG894MJ9
	Ebinyy6AnDuNTSGgYEYIaeFy/jeha/YYThTlohCkssuwvStEnxTUEmn+Dv6d62GiLaBHLoEeMu+
	9P+PXa+kP4WhUKZOKrBLwuo9LnGmrY/QtA==
X-Google-Smtp-Source: AGHT+IF0m8rX5UMES4nVD0erCZ4KstVSP6VZhmeff7Jfr6OuosoVYyYD4igGlIuV4D5i2BVa1x4EkQ==
X-Received: by 2002:a05:6000:1a88:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a074faf4b3mr1205781f8f.56.1745571666825;
        Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:57 +0200
Subject: [PATCH 1/5] pinctrl: mediatek: airoha: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uaHOfJ94TFx8k9XlThx6lSkpYsN9+1e6SW0WrRZmuoc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Pjw/np8UeS1ttDZIlSftl0HIaXAVQAcTl+
 qHDg6ttNnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPTwAKCRARpy6gFHHX
 chLhD/429DgRXwmTcgjG7Djz7jHNaXG0YDQCs3in+FxM1KrmgZ7nENGsnYdogEPNSvdYBfsUhwf
 JSQNi2Z47oZ0and5Yvmmv3FnmvnBUpbtPa4O++YpL8TVUq7teVZIBYCPkxG6uWpbX339RqRVb4Z
 Eu9FEoXAE5JRDGSRUmJDfaRHGeGq4apiYTNBsQpo9cnQN5L4m9pDIlRoM7+e2tYyrEzG6/v8egd
 OSP1y6+t9WuoDPeH25a1e9Ta1ehj2ViYsD9E4pQE7gM7EPm0OsJqxT007wmerUBuqvCq4rTncQ2
 0EQP7ORGcUfUsLT5R/cBcIYlUFbhziuNBpeBaKginbJoYLu8wfb+ospruKX203GPKzCFPtSSRQj
 9TyWwf1wV+kQYa/OkcDoCC9ScRxvDE6V7FTE4KzW54hNfzl46gZK8JoJKj1+7yQQgjVnY4AqENs
 Pt5WUaDQWxdfQotValBICHCN1jMnaWl4dDMso+xs72ErbEvVrbB5xIWWPoFuBGdazfWDfMDjyaI
 teZVW4YCDH9O2N30eJRp9/ON2MYaliiSvfVZDr6YcXTCzcmsLIIgKqrvexUxntmwoYebcguTINs
 SGM+230tfxLUtpfvpwqrxYPrpsv28wSCb1BlDuLaLdh+bHvGajSdqgZlxAAN8qwALpRkoR4o/K8
 rSv4Yz4yX+so0eQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5d84a778683d..b97b28ebb37a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2247,15 +2247,16 @@ static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 }
 
 /* gpio callbacks */
-static void airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
-			    int value)
+static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			   int value)
 {
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
 	u32 offset = gpio % AIROHA_PIN_BANK_SIZE;
 	u8 index = gpio / AIROHA_PIN_BANK_SIZE;
 
-	regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.data[index],
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(pinctrl->regmap,
+				  pinctrl->gpiochip.data[index],
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -2280,9 +2281,7 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
 	if (err)
 		return err;
 
-	airoha_gpio_set(chip, gpio, value);
-
-	return 0;
+	return airoha_gpio_set(chip, gpio, value);
 }
 
 /* irq callbacks */
@@ -2419,7 +2418,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
-	gc->set = airoha_gpio_set;
+	gc->set_rv = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
 	gc->ngpio = AIROHA_NUM_PINS;
@@ -2715,9 +2714,7 @@ static int airoha_pinconf_set_pin_value(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
-
-	return 0;
+	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
 }
 
 static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,

-- 
2.45.2

