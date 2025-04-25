Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62494248894
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571674; cv=none; b=Ct4ZSFfaKdzZRJuE0TT9YB/qPFwbUNCRy/xxAjsQBmJ2GYmubnyaAtAPMIg3AOH68fSxk8hQ82XoB7z7S85tUqGCBdcw1TOd6AOAd4n2AFgBr7WLFuue8eoy364VHOrebZlM5Z5mZCWSwR4t6zmfFxRaNw3h1JQjdDDGTrF2MNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571674; c=relaxed/simple;
	bh=uN2bLV37uQ7yhWkU01vCeS3PVLdk4JLJCesbUjcmI9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6hxvW0SvnXokCNDTgEOMVTcnzSEdMXFrVz6WXPYHDpqAbQyjIyGp7C0gH7LaOi+zE0i5VDmqUBmd4dve+B1FLEmWjydQNnHkoeTfucX/SXi7A9tMbb6PdobMXe/DzGAKPX+AJ1ZGR2hwlCnMDZOALhEE1jJGx52Wi3O/okuvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u09wwlHn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u09wwlHn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1551153f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571671; x=1746176471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZCsMbe0k2wJLLxto/ZgvqQ6R0v/kHbZTO0AQGYG2lM=;
        b=u09wwlHnfHMNDB14IRJ3ySkdwNEEpoDiW6DiNs/OFKl1XTlirIgsEA4C5n6UA4BmNH
         L90RVQd0ut6IwEE5RZPcuoKThp+L3z+lNpO2hHnWlkX9a3ysGwRnr2AK88VbRQmLdZIv
         3ED26TSwXN573dFOS9+k+OMnBsskkMO0qahAUdVYyQ/dAEHqm81ft7mjEp8Qdmro0Ogm
         umSRSffROk3OBzhpyeS5mnZW127/awecrIxgujmsk4gM6a4r8F3RxA4dYrT6X7Ba8ScO
         FSNHZgq7t2Rt8mD8yTkp0DSvKpEbF+W81EjnRoQDAHw9Yv/9UKMJwLf4OQmRfN1y7tSl
         +b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571671; x=1746176471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZCsMbe0k2wJLLxto/ZgvqQ6R0v/kHbZTO0AQGYG2lM=;
        b=WjfhxZbLF1I5faLnCFXTa9O9zhRfOOPYcPGoA7UyAknrVqVtmKOYHaMXXRHdc5bDK/
         5CthYe+9g9NIBHuIl6qaxNRO1tsgVZ0YSZbCT3fqvmVDKSakHFPNAPUgpFWN6X8MZX6o
         ZORklqcARFmEfqIHMZRVAJdgT5bDHiHX3c7716NEgM4Ops4ePJDLKLtgBFlrPGCvE0h/
         Dt/2TJFyP9+aIJ7uoqiLZH0AQdpJQg58DWVQeEwrubK3Bk+zdHtdtWKKA7MgoFXZhkK/
         latuNV5eyDYnkiEBqqEA21bOmmyGM4Kl2m6p7ghCDtbSPowTZ7OZJZmWkWDaugAFgNrb
         f5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVnAqKS4LxH3C1tepXSBhFDAvQ/wzz18zZ3tJNyzzbvBfrf9kXpKAz7kiHTtDxnTX4g6KgXM6Ggl2+gqLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtNGmp1XmQFy+FQIO9wDqUmDoutxvpfJKYWZA5WFNsCa0E4gH
	3J+/RP9BWE4EHuQG/eMBmz2CR1AODqHAZn3r8lOgKI0mw7B65eT0Kz3kHXi/B0c=
X-Gm-Gg: ASbGncvP0ArPmhfQm93X8OQtuLmeI1PG/8oijIwkBPb7KalB4Ls79b7OudB/wGp9QSx
	h5110IcbDZFIqrBeYZGiyXbsBa1Arw5ulFbTujBYN1zZVGXsSSq/0rQmgFrk+t7v/vmg18UedKg
	v0EnQ5/irdlclKDcnTX1acSBbMAiabVKSbAcDWh8HLSydsvpO6Q6jFXLxcjHI1UA4nDgTn5lOKl
	k3EK+MIifGT4O8dUZIKuodCPI6kTTlRN1QAiiaiGUCI1mkyhy1MkBggY4a6LmksC1qnMS+VOGD1
	AIsGXZM0uH1hOITc8UAqJuQFnySD3EHoRg==
X-Google-Smtp-Source: AGHT+IGjMuaC5BmBdOAnNw7BlPBWn5JH7qcxJo02GNuwlEcPgWwbqMJDn55V+Su/wdq4y957SwZGFg==
X-Received: by 2002:a05:6000:4282:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-3a074f39870mr1172764f8f.38.1745571670663;
        Fri, 25 Apr 2025 02:01:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:01:00 +0200
Subject: [PATCH 4/5] pinctrl: mediatek: moore: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-4-93e6a01855e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=K7gLMO3ecqvlBUfWOX7ZuqqYALbBQMdAQOJ0o+WSEZA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Qz3rBKY7vXoDHlL6r3flVEWoOZY6T/FJWf
 h5JONq15geJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 cisXD/9P57W0/UnC7KoUOw8VjozyNtjJ1rN06vVzNxprMdmp9PDpNlGb0vTLsahD+4NFVA3Q1BL
 p1W7I+viQtlMMu9GaPYfJgGOurfA8HdjHskblOFIVaifefVYzwy2jSyIPjndcW+rdrur5zeAwkl
 2zepHYZVYpZK45EtIf+V/938Oo0Sfmprv9Jio66HVvXGnuznGrUD4gS7j1tXl1/KdBqqIks4J7K
 IZwYIGhxQCVmj55ubdey7G1qgtAqasXlnOmq9xRmLGU3IIqENBgY9EV9KwrH+voXt3ICY6gqxy5
 ecCqIeMwR2gTvsucRyqxVP3ZfLDYlzvJG77PA5K+BBEorzi/oTKKRomwKzJl/s/iWZb4zX97gER
 t2Zzm2q4K5EzXkWxGUzYdSPep/j22uNtt+kTIzw6PK0XYmS5NPOcvVC8rmjW1NGTOGndaoMkDHY
 6MGmD/rpGacA17KSYUf+2PPtddEV5m0SDFIR41604HfByN99tInJvAKoH7Kn9s39Mc0stpq/RdX
 tCJiiYx/RWCcSM5ECjAiBzfR0o3lAyuS7+JcM7IAzc+W1rRG7ZJM6VQyOw95oe3Iupn4SLvv6yR
 Yw2WuWfIJnLiAzyPLUNqqXVE3CeyFs8pJuou+r91bJDnhIWJo7Ukqz9HMV6keK0XO6MUEid9Dec
 y24dE/UdR6r4niw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index aad4891223d3..827d0f191031 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -496,24 +496,26 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!value;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
-	if (!desc->name) {
-		dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
-		return;
-	}
+	if (!desc->name)
+		return -ENOTSUPP;
 
-	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	mtk_gpio_set(chip, gpio, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, gpio, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
@@ -567,7 +569,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-	chip->set		= mtk_gpio_set;
+	chip->set_rv		= mtk_gpio_set;
 	chip->to_irq		= mtk_gpio_to_irq;
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;

-- 
2.45.2

