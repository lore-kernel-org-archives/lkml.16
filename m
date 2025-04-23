Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7862741CC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394845; cv=none; b=W0d0VxG0zaZCOG/N4dazcZhqT2nSLLU7ulfQ+f3z4KrnHY7pfz0CBXFNLTMPImkfASZ6hZBxVP4jB6g8YpkEUbB3sYpkMeEnFwV7LmjOJgpY70Y8s+GfEfft7jlFHO8ygvTs7Q7A5XHGI7WS1Bi618QXZcpJIA71e+WPEhRcK3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394845; c=relaxed/simple;
	bh=sCy5NeyycV32ZFT/SmRZqkdiozOKWMJ6jALzEvjVFEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQPfLBb16kXt2ld+atTcC15lwe7T7YrUOIh6VQox5eYp80+cPvl21Wv+MeLoyG7lvaO3CePpWE6AI+meQnWELb5m+g9ef1WfSE9LBZ7Nodx7TlrWyASQWnVqHeuayPMm205d6VD13Um2VEaE+gZwmBcY9VJQOzXkt4vRfXLiRiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vBU9ilyS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vBU9ilyS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so42951945e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394842; x=1745999642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yu2B6Dfdj7hXwrKNPHrcuBuguJrhn9KHB4prAy73JA=;
        b=vBU9ilySXIUPoTG3iQbj/PbG9CD5+lKsJyTj1w9PWLdgoT9t4o+6eiyq3NG33yacTr
         ouUgMxmLxPArsotpZyWyO5nXLRFGeP2JrbgRpQ1VOqnxyc9BrkHTAPI1kv4cvlVq4+g6
         DtSmNU+oGTtpJEeRdhyhzWgrLc9V7eSIsJ1wNhoHceQ2yBe4ugo0GcT0rhQqGs9H3YCL
         +QyUmlQa85be51mKmXJsoJsva4IWn+qsGU2n0KSAll4p1PMW4Oo66x9gp3sUYOUUYoUb
         1YxUSyhx3J/QVDd9Yp7KhK00kHhhjzjwhcj2EL8CTG2S7c86XvfgxfIr7K+fMgQyuOp+
         nXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394842; x=1745999642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Yu2B6Dfdj7hXwrKNPHrcuBuguJrhn9KHB4prAy73JA=;
        b=qYt8le0AHmCiVbkNAraie6asIksK58N4BLzYUd3q4pA9ean3eHqcWuvwm85sznUvpJ
         g+3wEx8T9I8lRiHbgeNcv5ifOL8wuNQqRvq76vdWVmB7KMltNN6JLvHKB81gZKUtnYAo
         u/zFdzG9EuWXGg391lf8pMBQaS74nxpxfyJZ3myO1VkYnm7NtJC0RAH1qrz/xIvXOG6a
         cGsot6tr1Wi1RrCORHRDjOZgkQk3ScLY0doQYNxYGN1dYUTSmiiZzWN1pt2Uji8J2ruv
         kz27BT1osjBTO+bbDGnwUyvaGN/qSRuEcMxTe6h27txTaC0GQeNcsxYUkI6AKXzO22kx
         UYGw==
X-Forwarded-Encrypted: i=1; AJvYcCWP9v/GzqocvoLJNOe7TM69KXK9xiSyfKerqlxa2rmtDRRZxhrUpRfFtzNRvFin2MphHejBIVfAatBFr5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGlK9C5ITYzwKjRsDS9ugXuAFPFzlgjPgIba/tHfaWN7wu+gY7
	wrqpuqIZc8o+H4E0d6oDxgnVrQOZ1I2vYo+EyZiZbjrRvzPW1oOtJTkKxgrDyps=
X-Gm-Gg: ASbGncvK+3eHCm7vt5AyhLx3JtFMoGrj0FYK7ltPd/NlCg49xwUloXVsVogAiFltCK0
	belXWYY3bUvc7mygO2ifcLlqToqlsv7dIU3MUCEol6nMrYrBZORkr3HBfTgBuXOB5jEMYSomiM3
	ZqBYSgRwZj7CBIt0OKBB3LfM24exAc1XPsONtER2ekATF2YSlzHm6wFyQ0xFJQhoxORs7RSBH3G
	OvHL2T8I/0ZKtUdmhmq7NGpkdTKwmS1CCx6VVU7fnLW+gEhleg/9tsIGA1EvpqTo61O4ohhkJ7o
	RZV2bbtQE3tyB3Q4PUMW12O5g09quvU2tw==
X-Google-Smtp-Source: AGHT+IHatYCxnScGlxG87IK46dtvJduo0XuMEsaC1y7/BEaXRE/DSRM5w5YythQpUe474HkAYKao6w==
X-Received: by 2002:a05:6000:1ac9:b0:390:dfa1:3448 with SMTP id ffacd0b85a97d-39efbacfc53mr15450031f8f.43.1745394841674;
        Wed, 23 Apr 2025 00:54:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:50 +0200
Subject: [PATCH 1/4] leds: lgm-sso: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-1-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=K5A9vi+sTXjh4YAzZucX9KK05Nsn0WvlpjHF6gNLFV8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyX/mB8z42UH7vVXi4u6OPF6UZICjwIQ3yLE
 HkQSNpBofyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 clLhEADKTRSWatjKVRUHVfZtcveYdXevLl6ot2u8ju67n79RYjtXSYoJZNSoUhLJysJx3uc98K/
 Gz5Hk1uqM0IkpMDd+5wSXvadxG3pGF212nev9ze70d1fdfkTbgydPWhVYrFkmOvPumcFjOXAYpE
 3jUiTpUV8mRCmlD6xUP/uXke9Zx++M+vO9m935xjeqZJ4/Y31u05FDd0C/P3FVAEjwQIQvg6i/9
 V+6TxINRtHoLqnTc89xJnnS1BlljM+LAH/bvlNJfQZ6y5psArwBf5FUFv64xqPIDWS90hLy6TT6
 G6LY7McaSa6o66JvL+qudztr/kEAiDEaBY/nVLzPD+p7gs2dXlzPcHaDNU0yKIhFwd2P9BN7H/J
 5HiA5m+29RGUax0cP/BuX3xvwjQ1MXP7KPEQgd842OHvqFsVFDcqgoDP2Yc0iLJPnOdnw6z37bC
 aJig3cuBo3YNjCLcGZAHoEWBLb2lFn9otAgEMe5/ASUTnkg5hmHGFrCZsgqG8BVc9t8WmMtaaRi
 J1LOobI6UMC1kZC830TwHAKa5TjiB9I4B1sfKyAxbMr9mIR8JuLs1ZkoXmO9XsLRKFYC6/WuEKY
 hZ2m5B2oc1EutgqSbKRZBtYYQg3VX5swPxGuYFunNTZih4eqG5/thwyeQjG1QE9m6TSqgLi9iFk
 E/mUMgkgAUeQrUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/blink/leds-lgm-sso.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index effaaaf302b5..c9027f9c4bb7 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -450,7 +450,7 @@ static int sso_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(reg_val & BIT(offset));
 }
 
-static void sso_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int sso_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct sso_led_priv *priv = gpiochip_get_data(chip);
 
@@ -458,6 +458,8 @@ static void sso_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	if (!priv->gpio.freq)
 		regmap_update_bits(priv->mmap, SSO_CON0, SSO_CON0_SWU,
 				   SSO_CON0_SWU);
+
+	return 0;
 }
 
 static int sso_gpio_gc_init(struct device *dev, struct sso_led_priv *priv)
@@ -469,7 +471,7 @@ static int sso_gpio_gc_init(struct device *dev, struct sso_led_priv *priv)
 	gc->get_direction       = sso_gpio_get_dir;
 	gc->direction_output    = sso_gpio_dir_out;
 	gc->get                 = sso_gpio_get;
-	gc->set                 = sso_gpio_set;
+	gc->set_rv              = sso_gpio_set;
 
 	gc->label               = "lgm-sso";
 	gc->base                = -1;

-- 
2.45.2

