Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CA264A7C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522122; cv=none; b=lWw9Ae3s4L3fuNG1IG4Z577I4SeJdE65he4QN2rTD8e84slYOzwjce5xD54JeblITy6tMOwlih2Y+UkJEV1jnZqhsyrpLpPW9Fzv4UYi8ptc1yCCd6z2iva1jcbKjHFWQ7/n5wgtcor/lca6vPGL+YCOSs7opphwrpjJUIIOZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522122; c=relaxed/simple;
	bh=/euti+QuooeNdB+WdZUjDlGE6JGFo/o5Aun83gK9Nww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEwEejk7EasQFJPsU3JDCUC2f08+/FW3IBp9+LlnUsl9zNx/c4G8daVBUmFOmeyA8ukvK3Ku4eWUAmvJwuCUMJAbpDlqzOQhKTbBhGLS8zW7sAAS6PjSdOHyVJo9TQQBXMZwwAFhXDzOtg7qv5xtdDvUHTK7kJoCKW6N+caQki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bMiGOidQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bMiGOidQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441ab63a415so53419625e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522118; x=1747126918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=;
        b=bMiGOidQ+oEdZHJ/IiwTPDM+zhtGtrmvnbojczCBzeLJ7ejRe159xq+RSLhsVcz73C
         bK0XcwJeWl++EZPvtvs32B7aJBt0gpOoVhZPiD2dvF1jjYt9LGpPHaJ5zBv7knq/Yl0w
         XKSm9qqPY9Rb3RKgcXB7p1pQcGUdK1bqKBM4w/DMyz72mCdS39NFev7Kxytol1aRxNqP
         R3A83QbxvnvLixgp4WQxEcKyE+zx2lQDSWRyMpF3oLjxOnVOVllZb5iDgzVwxyi96ADQ
         jMgL5cvdzQyyiRLE/+/vsgieUjpHFQ3RmDcH19cQ1LtLZtm89E+oVUIgzRP/jkqbphu5
         SnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522118; x=1747126918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=;
        b=boawyI2FHIHvb0Dh05lNu9+/vylRsFD2nDGpn9ByEEeg556Fr2FropnteJsibeGozJ
         967ugjCojP8toYqMsL0aoI4mKki3Riprr4Sx3PL08HUghEwXgZW/0y0lBzNsK1yvQ3/O
         BEt+Uok2rsGM2vT7UrzcPQfBGd3dkcwYkop+qcoOLIqiqLezOyqccgGuiXoUiWORZP7j
         2R+/ZNiiAkI4mpGixfqKhbTnwdMZOtiV1N9x5EBTOFV+F3gqXpMEflMfbXW7sqav1ABw
         5bkVfVIIF4dxYX5SmdUwigCfvwbN3CqMdGNfSQm6Npj0XHCzAWjRk4TefqgeMCQxd1FG
         rQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCU6+GqDW0j3oRiMgNN6gLZfbdS778rASOq8tR/3i/MhLEhwsnamQnAUe7Y9mSKCGVXfRHj9/MAyZtTJh8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWyqG1Z/zNrdQ/fV+zHeNvXviLiu/hChbZACfKR+Cjx6u0UDA
	ZH62aNFVkUlGmHQQFa7xIq0F+hAYJkmkqx+2tnPN/Jx37/l1+Ma1kJv8JlbJZashujDFEKpT87M
	D
X-Gm-Gg: ASbGnctqUP6UkwbeiZhlZX/7W5XsjZ583dBT/DUoVHd0nhcMvB5OF7n9siybL1p6z7a
	y2j9m4MlojmAsblAy3AzqrSdDETwMV0LI3gucc/yG1AhXGVThBwOs9aUJQwj8vb+Js58C4wT3pD
	nMAyuxeQ3yh7G26jaFMEXjzkknolFN2imp0P/6GsDKUQNnGTyJHZ51kWa8UCaJQJkSM41hHz5Im
	jZj1CEUz558qMQflmGzl/9venHEKRkTeqI+S8CpW1L7umKdBTy8HyTHbsnv/TxzeSrY+FJLJ2m7
	ehnQ4/dJAlMH1qZ9En3aowUV5R5QBuDAk7Y=
X-Google-Smtp-Source: AGHT+IHlrqVIs5Aw286+uquukoDPpnOG8CuGZuW/5Q7O+V4/Xk4pBW6x/ZhR+RATXx4lWatFtAIZYQ==
X-Received: by 2002:a05:600c:3c9b:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-441d0fcd574mr18810665e9.14.1746522118135;
        Tue, 06 May 2025 02:01:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:48 +0200
Subject: [PATCH 05/12] gpio: madera: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-5-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VRF/3N1EVGTtM6WG9zf061j9Cu7jjnguKsupmm1lpOk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9HAJpDoBjHPguAUrkQ2bywcX0IE4BkH72+
 gedeertAESJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 cmW4D/wN/rp+VApidRjxuIIZZuw5p6GCIcK7pifUdrQJgNqrwknypL7yMfOuZhfzvGJtf7Pt0aZ
 ANnCXCR6wj0ZptCeqhSAN4cR+cB3sqy/D7AiVjPwEF/dHzLauvNZviX4DqjpkfpZ/cHVp61q5cP
 pS5dluslaLUqUlJhpN47WpCdZAfy0LEyMgGPjyjWJvB7+m3kTf6il/Pt22y7Y5QJkqbLp2rvsIl
 kYltmOq2+ZDnlt+FTSrM0zpOBmnLsOe9lmXeeSlIlb8wJdbOtzLM6aAKDcNj1UrOUKW/6yNnxrT
 HKbqSA3kIr3QGEE29jBCD8sdNysAsSYvXIr0BSmDJmVL5GZihzsPl+v4ghss5DB5yj7HJ+P6Bv8
 bThnZPd+f4niokXgcKGD87GalnGPCESS63IjePPCIQ//CLa9cgZMWIw3drkFkYZIROYxscxwf1B
 lPIwm9ptXGE6IDQeAYZckd2EwXftyWs9WBoC9bHaQ+oxeOxLdqmEqqHqofitTxT2r3iBGEDEXba
 tFcGhWZyg5Aac7bGW37Qs9QkLEO9Q7pf7drBBnXLqux2qfVqCU+HY+oebMQc7MmO2DSAqGvPQPV
 a7HASDWQuejDmEfxkjjye+/Aj4H3A2M9Xhvc0BqfgUB2pXj2FvhWMKiRqisY+FrAzGjcASUDc05
 p3o05soZ+uWZTXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-madera.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 8f38303fcbc4a..e73e72d62bc8d 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -87,23 +87,17 @@ static int madera_gpio_direction_out(struct gpio_chip *chip,
 				  MADERA_GP1_LVL_MASK, reg_val);
 }
 
-static void madera_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int madera_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct madera_gpio *madera_gpio = gpiochip_get_data(chip);
 	struct madera *madera = madera_gpio->madera;
 	unsigned int reg_offset = 2 * offset;
 	unsigned int reg_val = value ? MADERA_GP1_LVL : 0;
-	int ret;
 
-	ret = regmap_update_bits(madera->regmap,
-				 MADERA_GPIO1_CTRL_1 + reg_offset,
-				 MADERA_GP1_LVL_MASK, reg_val);
-
-	/* set() doesn't return an error so log a warning */
-	if (ret)
-		dev_warn(madera->dev, "Failed to write to 0x%x (%d)\n",
-			 MADERA_GPIO1_CTRL_1 + reg_offset, ret);
+	return regmap_update_bits(madera->regmap,
+				  MADERA_GPIO1_CTRL_1 + reg_offset,
+				  MADERA_GP1_LVL_MASK, reg_val);
 }
 
 static const struct gpio_chip madera_gpio_chip = {
@@ -115,7 +109,7 @@ static const struct gpio_chip madera_gpio_chip = {
 	.direction_input	= madera_gpio_direction_in,
 	.get			= madera_gpio_get,
 	.direction_output	= madera_gpio_direction_out,
-	.set			= madera_gpio_set,
+	.set_rv			= madera_gpio_set,
 	.set_config		= gpiochip_generic_config,
 	.can_sleep		= true,
 };

-- 
2.45.2

