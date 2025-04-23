Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6113274FE0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394848; cv=none; b=n4tOnlHvZp+42JKpq4iGSSVM7RUi3IrHPW9p1nngyypDcCxn95GD6EZT/HDf/bbeKMoZA7RIiqNGwK7NZQfaXGVofVGvyHQVKz4NFkgRCNe+4lYWjl72mSOY/pCurNOFxSrbn9V2DCJviXl0F4k75Y+BrfdzR0kagHQwUPDCxp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394848; c=relaxed/simple;
	bh=zxOjYTiJyy84RQtnZPalRY61UtBT2cLl+d5QqitJRy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYtrt+uxJgRjIuagfoVTg7QN/RrBKPz47CK5uCXcLMhAQCcmolZJ4PxYzXTWcEp8AYHHrFxHefIdP7JUoVaDp229kIB0bx7KB2n0mbGurkpNwyhLsxsVD/kISic73xwuLoOcIcb6xcHhyNaHHUb+QY9jSQyEMJiNH51gaKYsjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sD1EDxSL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sD1EDxSL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee623fe64so5276372f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394844; x=1745999644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awmpLsPRHTvySKAhJ2vpQU4oTjj4fckiHhE0P3e8Csw=;
        b=sD1EDxSLOBZMDiLk/qGgOMmAw1fNF7boSwGBkMJXDAtrD3ZP/qQ8gH9x/79R/7AN6q
         zWa1fLzuGZoV//mf8oxsOGL3Ui94T+1VCBTXjX7B66VqNTZvj5rBo0IAbQWdAkVjkZdm
         ZL3uzMYvoXbDH6YBr1s4UVPHiczQdccRY1r7/gGjC+gUXxxgRRLSwEUjPVDeVPJm8Sgq
         WZ48aPsh2uG6gb8KoZnI/VpkA/Cvdm0bWazt7ijzaoCYwsLxgK8GP1qniH5QpgVGV/vi
         hSf9NfY850pqB808P03DlEnDvx6tMJxB4hzoijudLXpOnSGQVQLTW6CRUpJZxMRGDsMA
         SREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394844; x=1745999644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awmpLsPRHTvySKAhJ2vpQU4oTjj4fckiHhE0P3e8Csw=;
        b=OIZmLp+uPT6gF2GwzkWj6OAQUtB1DlQkb/wLymBlTCVEQkYsRRm1egAxxlzNQureua
         In0Swwwa+Vehpc5uoYqc3rfdSormcM3tRxQUUrQMfVeb9AyJ5JLZJbK5Xg70OYWvB0PH
         9/bnfB6iit6bkM8jyrVqo5QIyPfThYXshoA9gDti52ph9K4FHmEvguGE7XCX2Jn4d2vR
         mYMpwTcink+AT1ei+7GaBxoQj5nxLBOHQorVXsADTpcgOZYyACgW9z/yOog/W+BNXk9k
         U+vPkEHvivWaDchtZa2ACzeiz7GYsGa9RauRWj033+oUjAUdr/jyPNWRDLrui5evDV5q
         uomQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSdMitxH8yCN7zZ8qsietA33avKTgUnXUHTKu2nuNXUK2g01SKRh7968fyXex3xoEI9rE5k4KOrsMZZgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgCBJxph/zsxPwDQy6tSeb5+YNlB6fc5+x/CLXCA68uGqJDgM
	9FtZ2khb/AR4c2ScgxuHXSJejPUIzOTZsDO4QycOh+oDbjo+qHQgESO64vAq+WrYAmNZs8NJH4S
	ha0g=
X-Gm-Gg: ASbGncvowLmzImjh1pxtc76EjzfLKhX6YTONW5rFkliWT1bltfXWZf2b/cruA31Brll
	ortsBTc+jdha2wT+C5Wi9cNVCY9Iyf0VJ6b4y9OjVOTz+/FQnK2Hk9x2bnjzTQzuw8TJYpUAAma
	1w/HeSGTODaTcHKoH2x1ImGpdFKjmz5BMJFHLeE20K9Y7OnZNC3NnURD1tQOCBe/XYWUQ2nLS8e
	RyQWZm3JnR5/O7W4afzRyS+5hhWiAjQO4a+vB85iGJp+Qk5EiyaIg3WeZz7afeaz0kA3RNIn1Cz
	7UTZu/w6Yme0Bj4+0Jg3rp1nqT58ls0EeQ==
X-Google-Smtp-Source: AGHT+IHpJiw5FVvm/29U2iCX1LZCw0i/Nbm/maOexa2urIHeoGl97Wey43Yj0psGVkkZuo14ySAJXA==
X-Received: by 2002:a5d:5849:0:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39efba5b647mr15739927f8f.31.1745394844088;
        Wed, 23 Apr 2025 00:54:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:52 +0200
Subject: [PATCH 3/4] leds: pca9532: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-3-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q4N59dzS+Vuc+KWJbtCOPhsNB+gdq0KgGsw4pEhqZY0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyXc4I884o6/Xyc/tB3w4hoVI2mzM6RHhnTy
 h8HDxNzCriJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 cmdJEACil87EJKYf+Q8ROqUg1EIZAdyX1ELY8HGoJKDg50NwtPybyVb9CryftIWOX/JNRLrITVb
 aGTfPVIOTPwNPha9yMuXqYqQpTXhaAJctQmIdudIfaTcYHXSeYtKixn37VA0h8hXaoZ8NVtaGuF
 clbey04B1txEdgOZgXv9Y/XcGdA78fAQoVitn7PG5Lg59qc4qtFElYep0bVF6QVMXn+WmmIvrJH
 j5xYt0FJGJ8cUUjNw/fhOOXV/XuYdPMpoILT9vA02uwgATbfjx/h7IjB22xsUXXBWcZCiWDDqJD
 iAJqABycco25U5TSpkJJYUommbclinDkjx4Gf41yIKblHRIf1z7Raxy2UwNlmHGj2wPqySedLHa
 /Or+31/FeHIvds4F7AK9v2ZJ0/yRfeAqC0Ev0vuSNHKlsMiKXy6KgAAQPDFO1BMZsyXwvDQpB7b
 TQUCNdO3xF7C690ep9kQNJ8mWpLovYUlMgKVD6+L6M3TmUt3vac26UQP26+H1wt4YDBigXPNp8d
 TrfFRNTyuWZUbffroo1Z3kolwGlIXnGldSOYKwdPRoxakHKI/pMc6R/W0l76EG13XpD7XEjs/su
 zUNSqmIDVG20uzcIMAQhIIr8mLeHDpsNS0hodQE9VXhaU4UGI5LSbpkC9Lh+XSBxc2/opu5CkJ9
 F7+HOsImPhA2FDQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-pca9532.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 1b47acf54720..7d4c071a6cd0 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -318,7 +318,8 @@ static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
 	return -EBUSY;
 }
 
-static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int val)
+static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
@@ -329,6 +330,8 @@ static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int va
 		led->state = PCA9532_OFF;
 
 	pca9532_setled(led);
+
+	return 0;
 }
 
 static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
@@ -351,9 +354,7 @@ static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 
 static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset, int val)
 {
-	pca9532_gpio_set_value(gc, offset, val);
-
-	return 0;
+	return pca9532_gpio_set_value(gc, offset, val);
 }
 #endif /* CONFIG_LEDS_PCA9532_GPIO */
 
@@ -472,7 +473,7 @@ static int pca9532_configure(struct i2c_client *client,
 		data->gpio.label = "gpio-pca9532";
 		data->gpio.direction_input = pca9532_gpio_direction_input;
 		data->gpio.direction_output = pca9532_gpio_direction_output;
-		data->gpio.set = pca9532_gpio_set_value;
+		data->gpio.set_rv = pca9532_gpio_set_value;
 		data->gpio.get = pca9532_gpio_get_value;
 		data->gpio.request = pca9532_gpio_request_pin;
 		data->gpio.can_sleep = 1;

-- 
2.45.2

