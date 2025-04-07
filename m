Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95C22DF86
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010301; cv=none; b=Ghz4Q2+D/9pxvmmCRAYB+xqQzjWRR9i8pfBdT3P5qrWFA0jM8r60ZyngGQsAQ09/ODhNx7+P867ogaArNj3+X+VeiDjXnPeG2umZJPw7OOyegIu9rg3iYxKxwhZQsidLPxVLgwZao/aae7VkQVFbhZiETiOq0/2R478aUdDEAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010301; c=relaxed/simple;
	bh=fa5cTkRDqqhhVl7VbbjXyrlh+4Fb8+6MIvJLxTQ35n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSvqOQN7pdpGH3SaqlB4HrEx+xmo8uBx0DELdTuDdpBlPskhq+0fpcurAQJr4gV4bbPawK7Mm7zQ6XHytWMtCNVMB4T1hM8P190x8Qor5xV61Mmvmtvr6+3VV0DRLcpl5DLZms/RE3MGumxGSBdEK5CANxU115NzDNn3MjaiWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UGqeFo4f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UGqeFo4f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso25865605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010299; x=1744615099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhxzR9twRT0d+wFu1RoPufbuenYk6hkExQ8ZTUxlkc8=;
        b=UGqeFo4fl0ioCqwVGldqEvRpW7ZOYntIvSdL9qAOkTyuyZyj4BsLDfukq211+weB/r
         OPfoomS7DKW9hT/5fSArxPWMZmUIyZvrepOjgmJpVG2dGswD0yZAZwkqfLmSst+r+6cx
         hS0uOet7yNLn8UFydrGNeA1ytTadbdXsLbH2aOQKGWgUESXM4eoC6WMd9AGvXnK7d3kf
         xgaKM8nEIWrn3kPrOUnrces0KS15vQytnJwIAa/jMxZY01hNSa9TCPf3yo49GgsjeNPG
         oDpTuOtJGP85ZnwgSHVV07JRZbggCXmUlsPlVdljssNk9JCokl7EGmRbfKJ+x19lcDrO
         ZV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010299; x=1744615099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhxzR9twRT0d+wFu1RoPufbuenYk6hkExQ8ZTUxlkc8=;
        b=hb04yScBRQN8GgxBcZ7K4oRlkt92j2qyE1aDnKDoBxB/Qts6F0sdCGLGAVYxsGp+dS
         YvdHhGKENGz8IU7I0qA5M80C8N91J/lXV8rxd+zvKumVKV831PeX2iXchmdKrNCJZ+ek
         BbLS12TS+UWmP8Mokxr2AkpGgM3oy30WRez9cyKzxsa1K8or+itNga3RQBTCAPXWas2B
         O9g2f/Kg6AUVrc7Z9NVlJl5rtN3+hRg/IpjecpkGFMIWwdqWI3zcdufENdWL7LZyPGTe
         vND/QPaASlHyYgU92R9YDKGfgTkHzkVY9ZSLNBBycCu0sJscNS3qB2JVepf2G9IgOtem
         VVgA==
X-Forwarded-Encrypted: i=1; AJvYcCX6CoJlwZg/zarCY2e3l9XqLpycA+cedCPOhpN7MjFE0SH37pnfubfddCDHzTrodVVanvwqRqfW3hs+3Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dwWEHfH65EZ7OqhjrC3m8AFoRKqh5S+0yTZXmPE8CrcX7nvb
	R6HFJKoMylb0jabOYhkizLPGFeqhgD2m2BtFphwqSRXSTtPaMj9EZxCHBJlkXig=
X-Gm-Gg: ASbGnctguX1kDOLvvpWjD8YnoqxhSc9hb7lma6q6zRjzDJEaNq4GdFFYCZk8G7goIpI
	pNU7Kc+FlbM6xPT9R0PwjCPHh1GS1eMC1LNt6z1O7b1OyWj/pqNhEWhHwZATx8NEE8cLxcOciyU
	vnQy5UK6sTxEttYguvJH7w8L7POGgVCFsnvxEvEgoleHND7VpsSZjV58GcB5EQXWqffRW/CRqdD
	OwvXTebav9cpbN3X9ZPwSiORggiBDL2AOi38fePjwxadKd7CkjlraVDoKaEwiv92xKned8z//mh
	2nAyvkGMwcJj0Gg5Oeu8/RyOIudX2XVvSEqKDg==
X-Google-Smtp-Source: AGHT+IEEQ3IgiYXXskI8H0hQrZ/0JzuSRwAl1jb0RZVx7lz1HQP/lzeUUQGscgemWEtfywJxfZWEsw==
X-Received: by 2002:a05:600c:c9:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-43ed710c09amr62998745e9.1.1744010298832;
        Mon, 07 Apr 2025 00:18:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:13 +0200
Subject: [PATCH 5/7] iio: adc: ad4130: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-5-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9o+4uCrbiIXfKgm+/fV007oYqSqjRct9ZS0ApGPT4xk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wzEtTvFQmxKS+7PuuBvSTB5CU+q0uhl8WJo
 YELb669MW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 cuYoD/4oOVVae8g8AEBdQIk/D/lfjmviqihOcm4tLhTCMcEO2AmPpVRe9y8kB3aNPzQvuxolavt
 9Ui5KIABZmi3+twx6sLnxcOTiwOTPsOVe/DXk5DYH4aBpzG2tJ8xWLxA9PAgEdHihE8zR8KS6F6
 v3wB5m26dF8fRKlAgN87MvGagSO1crfm9PzPesvf/S5H0+p0obq7f/TK5xrtOcSDQh2DA82lNp/
 0jArJg3DX6x+2BfKdifoc5yKzVFhVCBbIFcFb6SYlcKv/tCu+vXlqhp6T8gkkrcfUqA6JiMC3l6
 WyUYEFdA3G61IwFBxyAucGVOJSEPXKZj63VRxiBM77vHw7HfxlTuHomWzyUx9+OBcerEYUq73Jh
 vYSk7/fo2i+GOQtIAMoh2apxTgzqOsIPuO3Zh6RKdVjRFid8fxVbfX1Cm42Y9BT+UUhLed6wGM/
 rpgB+ITD7aJDPHgIGFz8YYlMS4mVU1WQUfPNRTr1J7fprQjFxq/jv1vBhabwFZCjHYlvIY6aW6L
 EtMRdihuGb0w34CZiazMUh01KkAwDLsNdNGHshDqh6ZNI1OyfXsR8W3apRtXitZHc7wOAqudolA
 70IHiyciRLcenZfcA6b+go8frxJ9nrRHaFgrXM6mTHtf9f8/G6wuZD6Pk7yKkPEzmOZlDY0pJ96
 UIM/PxqKEVUGc5A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/adc/ad4130.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
index 0f4c9cd6c102..6cf790ff3eb5 100644
--- a/drivers/iio/adc/ad4130.c
+++ b/drivers/iio/adc/ad4130.c
@@ -522,15 +522,15 @@ static int ad4130_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static void ad4130_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int value)
+static int ad4130_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct ad4130_state *st = gpiochip_get_data(gc);
 	unsigned int mask = FIELD_PREP(AD4130_IO_CONTROL_GPIO_DATA_MASK,
 				       BIT(offset));
 
-	regmap_update_bits(st->regmap, AD4130_IO_CONTROL_REG, mask,
-			   value ? mask : 0);
+	return regmap_update_bits(st->regmap, AD4130_IO_CONTROL_REG, mask,
+				  value ? mask : 0);
 }
 
 static int ad4130_set_mode(struct ad4130_state *st, enum ad4130_mode mode)
@@ -2064,7 +2064,7 @@ static int ad4130_probe(struct spi_device *spi)
 	st->gc.can_sleep = true;
 	st->gc.init_valid_mask = ad4130_gpio_init_valid_mask;
 	st->gc.get_direction = ad4130_gpio_get_direction;
-	st->gc.set = ad4130_gpio_set;
+	st->gc.set_rv = ad4130_gpio_set;
 
 	ret = devm_gpiochip_add_data(dev, &st->gc, st);
 	if (ret)

-- 
2.45.2

