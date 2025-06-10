Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B828B50E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548411; cv=none; b=TYbgw8TN0XK85iKu4IkUnsDKPe4soJd8dzuhRVASZdYnq3PxoUxXWqFWZrwzhYyifk0d5/imtSlNkVANZXFIFgBkF8FlGAxS42hzjefYmwdcwIHYf40dlCqkDvRHuhTKdWs4SxiTAwBaekOt7aoMOo7jGPZy102OgPVEX5Tkkxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548411; c=relaxed/simple;
	bh=4OzJPnbfFTAG/2npgoV8sSHsu/v3SbNkRCIb6UQqrxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qT2Z55fYoJk7WeLWE0M/6T1XaxBMqZBxOReLhhYEsWMwrz8LQVr5juoyVNig3RPulUdiTIHEh5pQRODFnU3m+/bxAEWs1RkuL5hi7m3PD1JuLIqPPb5Wg8Uq7E4xMUU0PuN16fpFuRj5tau0ddacxdZdsRHkaz1yOq+gpWb0nZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3V9xgL5F; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3V9xgL5F"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f9043f56so29097015e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548408; x=1750153208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU/OIVp1Ix9J2HIXNEwTULz0O5cS9CrQQSNEafNoGZ8=;
        b=3V9xgL5F2IxqswQyYBz/ihsi5fykm3MMZkAtu5gSwlcPwee6eU1BAJ0i1k0tTPr0yT
         bDxMt8fnKU8Psiqbmr9hTvawxLMjAIc3Dq/cqgIi/BZKMm5jm0Kw/S7VLtvhZH/mPgnP
         0SNRYCZ8qmFQtZ/Hj4wwbAQsXJmg/enie1akGU/iby3giDD0hRD3nYJY6OujwJTWKPoJ
         MSCiKgyOoh/q/zRo3nd4zAYtnvvTnzqvoUuE/1FXeDkznj2m0at17sVQO2QVrGEGq9eK
         1GuR8F5rFCHOPaIgc3mG8xSgmETwjs5pY3KsNJW8yAwqe6xCuzILjQSPjGjQzVhMxdLz
         PDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548408; x=1750153208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VU/OIVp1Ix9J2HIXNEwTULz0O5cS9CrQQSNEafNoGZ8=;
        b=Irk++KMqdHXnbmKjYwFD0gTwoQfxz/DW2Uxz+kik1Ohj2ih9DSHPQHU4ItI8RsO4DP
         x42/TIWOi3Fs5t7D5aR1chyxLKtfbfgLSLwhNMpXmjAqYiPQIq18Y7s1rR6XR9ovevh3
         xiPzqyAanc/8DYuTJdSdXVVvuM05GyQ4x80B0GI97cMSOdQGK44c2b6U6xrK9hQBiyE7
         fXMX0xyCKQ16FzvRvz5L4TT9f+13L1i3S+QbZV/KFdGxBmx+1Y+daalKa4kffj7IExGu
         kBsfMr+xk36oI2uzH5e7fymvTA5yK8EOjzdn6zkAxGcH+hWAhye3MMloTCtB8uuyRrsu
         wPgw==
X-Forwarded-Encrypted: i=1; AJvYcCVIGKjhAPTeOkFrHsErBl2B6sskv1c+B2CJm7A1U4Eg7Q2b3FndgBxlK6Bz62kBjryftkXxu/UxlGmY9vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmdJMZzeirZVMHNaifjKP0dpyXYGHRDVJZ7FUgAp4Vc8hPZsGY
	iDIOzhdob5YpdH1Qh8iDyv4A4TXlY/6qZ3/1xhGMgnm9t05WRxNXGpAkOb7+nQd7BU4=
X-Gm-Gg: ASbGncvF/ALN2OyCvCr9N02zblc1GEK5W6TAV06URkcSMXHiESICws6P/reIob6t17M
	8Y8oDlvRRBmdz+8SUBRBnHdhFxWp6+tGylsossTdWZi1BoJ9GHspm5u3320aN28F/PWGT1OkSP9
	SEnHtlyVDhlDdRXD0FSmDGtCP7ssXRc+x3eiWDsHeX0vdtPpQuLw4ynmvdGTeGtg1orsBT4Cj4x
	wkHLKghRvfzksK+RXgaH4O1mGjyNozHVTdnzmm37CWwDPP2EHAdWusZZy2fdCAvcPGqZYceBjGg
	Fk3U8goG/v8ZGkPJunm6Q68luBbxWNv36nHRdkUxwPSVUilCri+C
X-Google-Smtp-Source: AGHT+IHqr4QFKBekkAkLRtNcAcVe6DeuUz/hU7fpOo4EcWZuJA4X0CT7pCaULEQ3bxKSZR2prLHhJg==
X-Received: by 2002:a05:600c:1907:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-45201414a65mr121973985e9.21.1749548408118;
        Tue, 10 Jun 2025 02:40:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm134388355e9.19.2025.06.10.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:39:59 +0200
Subject: [PATCH RESEND 2/3] Input: adp5588 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-input-v1-2-5875240b48d8@linaro.org>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=g2mEe+Yprwpzn/4/9kXNyjawagXdr1kzrPV+thj2Bh8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/10c3qd40EIC2XIYd+GggMVnckEKZgee1x73
 UaIfSjLrHyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf9dAAKCRARpy6gFHHX
 chNuD/0ZjX9cH6gsCOH84FLosGXHz21Db9EPd885OORFVa2vnh0n45TNJt099NWxDcUcfqTfUg8
 Ai+vWygQ6VeAEDaE6V2d7vYMAvQd/Kh08KEeLpmQiZmQBeBAXAmd1i16Ao2qQyUorzVUpkxBbwU
 AbG6rkYDFd3z2QnPSgOwBEfy3vz6pOLEeUcmjtfg10rSCRh4lnZAt0594P/ielQRyoeqhxhkTJ4
 JNNVzEUAyRPeb11hXbkrSep9FmkDksnAeVZcA2tpt9krygy9OM1Msq67dhe1VxHODyHjt9o2khk
 F4FjiBtJYlWSlloRccM2KqZa/z/16KxHLOwofrDpMM6gx/mXJ9tjJ+LlPhuffCTYyvO3D8tha+N
 XeilZdpYUBQGal2+YBNqdmgymtD8JT3qWzKkO4RH7T+mx/QJ6ZUZ5EDXg6V54QN+degkA0mI+tZ
 U9LBbisClmKABFWhTv3BA6KrHt74blXx1zGL+I94S4irzU5eY23dTQ2+LWaU5frWAi9rezydoBD
 /UHSBdktYiHUIMNlAwoAD0t7bth8Kp8KBbmPvys6rg4FZ0xMOenwutozEXgh9aoJKkRW9QR4+eo
 QFhA5mf1m1bywVy6C7TQIHr8FjJb9LmQ/4yrkOhh2KxKI+70SOQMwnOkXduD/A5PXgmz04jdB8B
 PJ42QowSq108Mhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5588-keys.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index dc734974ce0687a6e850242b531979be8395b394..2b2aca08423a4ee658db56f77bae25ef5a18e7a6 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -232,8 +232,8 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	return !!(val & bit);
 }
 
-static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned int off, int val)
+static int adp5588_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -246,7 +246,8 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
+	return adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -424,7 +425,7 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.direction_input = adp5588_gpio_direction_input;
 	kpad->gc.direction_output = adp5588_gpio_direction_output;
 	kpad->gc.get = adp5588_gpio_get_value;
-	kpad->gc.set = adp5588_gpio_set_value;
+	kpad->gc.set_rv = adp5588_gpio_set_value;
 	kpad->gc.set_config = adp5588_gpio_set_config;
 	kpad->gc.can_sleep = 1;
 

-- 
2.48.1

