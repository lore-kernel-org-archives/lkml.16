Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A091DE3C7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058343; cv=none; b=qb9elpSIXEn+/7RZhUGHLi1TnJszA5a0C+jOui2fPRLYpw4lTX1PnYhITNAB6FWPfVprbUS3JRD8nXKUyD4zXw6iaO9+oa0UCFHpqcWfwvMbCkxpYXxGVe8BM/jrwajsxO+amDh9ntJO3GNM3MJ1UPVyhXOw+GG0KejUeoFU/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058343; c=relaxed/simple;
	bh=b/qgu6/medib2vu4jNB/RyGMXO6WslAvUTV0AIziuY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fI9gNMJMo/UBIL/9sL/g7ZD24yvjvnHd5MmX6/FrH3b4LpfR0JWNrLR4ey6i5mFbCw+FRKY/XVUXKxE+B+5JjZpCxuWOIE9jAmUP61CRXll/noHp4c0wNKjYy/ZnES2b0tGv/jUJbUyyFohmNaHYqT4nU70484f/f1i5+/2DT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E2jNH6+9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E2jNH6+9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2747162f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058340; x=1750663140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTP8xNB64zIn9DIEvp87doAXF5a/sVMPLzzHk43KYWg=;
        b=E2jNH6+95ccs3apCDnOeCeCVIp3e28riGIqxDeP6CV0xsG8fjtvYgFHZg9TcSFl3RG
         fakQDhH7vxDEftiTC/WhMqMK0IUdJVqAt/rqF5fnYh5jpsMLe0gvAJdTbVtnJONmmvF+
         gVkjEE5P+o7ZErW64Ynjc6cbapiC/BR9MXouOFr6GRNJq2FgUhcqBdrMGM5nxTtzO5qJ
         2z/6onPmGxsbZNP8jf6IjiVoHN1U0i06r4NnUDLFPzlw1s5xQKYbuNzmmVDDJCnDSsa9
         CYAOvGP+5K55m9D7qRXWHUo+NveFvwB4EIp3iEnLw4fNJgskOVLX1UtsEbM8tiGG7oTH
         azgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058340; x=1750663140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTP8xNB64zIn9DIEvp87doAXF5a/sVMPLzzHk43KYWg=;
        b=kLrkphuNKTNWdFtnI1bVZEl37964Pw39BrHS8FiPxQRZELFqMg76Mo3+aGQvhds3gO
         Wenbwuptupkd0wA574uVkHFgE/mLXkxn6jth4EF+LrRR3DToc7wrWYCgyZGf8GTca9lz
         dukZqBmTWmJmZ6g6WijL+cCW/ImjB3Fl3OA1vHYxZBCji602UtDpoSwb/k2Z1iJdmjZC
         UXLhXN188TGBSrgQovI5CftiBrfe6Y+LCBE0ThLQor1mvPWIxr44A37fSIk8F9K10X9J
         fSKx3G2ooOlMx7VSGILFYVi2jE0HyexWudSI88h9TduRmu0bpIQd9gs0GuY4pGt9R8ys
         h8uw==
X-Forwarded-Encrypted: i=1; AJvYcCWXNmeSN23Kz+aI1Kkg16EtciR7Gm08ar51MNDE9AJvru4DM+mptJxY2MyYcclv2qutfmo9RW6MDLRrNJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7rKc6EFbH0r9rP0+LXIC32RVD0wd5NhmclpJaeJ4Ke0BA/OE
	4FG6P78LbYh/1h3sqkhfr7ujLMb/e8qfPE52U4QyLfjmRWDZGWPj8GvvAr+EOFEf354=
X-Gm-Gg: ASbGnctOf3BCotrzFT7NEi6J2TLtJdFKRpp96uwN4tKpG6aiwChtqeKUgWHGsGTHOWJ
	L44vVNhD5wy5XaN9tcqQBejEMhTC4X8P9WlwjThNsd6FtR9PER/64Scjvvq7wXZt8x7DrZ7ZYOl
	CcSaNbCCsXxeBfcZfDSj5cCdyOisVMB+hMcP+Hh4/PxSvo1XX+ey6gyaycfq6SFPOWoTSI3H+X7
	frMchk/H0xyRpxI1orsNrdjdoSSL5O42BJ3910TjHogPudPvCKuH+gb+vDWrsmnLCR/XULgDwtV
	OK5ewQqogA48r7AOycFet7jyGsGIgK1Wnf3n2BGH+8glthBuvNYhpKTH
X-Google-Smtp-Source: AGHT+IHJwXDSA4Z5xe9culUJGL+TV3WkdcCjz/o5pvo+YDSZ+lGiZKhbROr9J7tnrwvTTu9uyJoTTg==
X-Received: by 2002:a05:6000:708:b0:3a5:2cb5:6402 with SMTP id ffacd0b85a97d-3a572366594mr5798288f8f.12.1750058339835;
        Mon, 16 Jun 2025 00:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:18:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:50 +0200
Subject: [PATCH v2 1/7] media: dvb-frontends/cxd2820r: use new GPIO line
 value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-1-6825114f18b0@linaro.org>
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N9OvQ6idGerlmLwTIQS5N5xpWnMU9Eqb+M235W9W9/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VfUCH8X17r5pnPQAArlMx0ie4BcV65lDtej
 K8ofAVFSluJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FXwAKCRARpy6gFHHX
 cvILD/40T92AubfBQ0A8MrcZS9ZOtc0sRIrcm7vjV8QU5m0Lru+HCv3binRNDyv9ye9PnZguVzc
 pHNNVZfUmjnE700pWtmvPiUKImzBBxc3wo8X4nxNbFUBqbf3FkzOfAdRFj4Ptr+sECms7XQrBMi
 qb5soJkuQSqUoK3VV7i4y04lqUgK6Bs5BKr/LQ90PByxbqmu8hbm65oUYYfOua9Iz5FEVqdHJMO
 HKBSjKlxYAb58ym9Jzg0SXl2Zm8PQwo7/+e5NjRRcGkO3PsL0spUPHvtGUQBJrFYMt+CQroAcGm
 4tM9cXn+TNRPy1uZDLhtec9BexB+WJArnAkUJOC01FYge8qEmzRDTnnhGdJTxPE0D5pNDLFz5U+
 FDz+XYD68WTOxF3uNS3/uhg+hPIS02qMy1FdRR32NndRoG9xWM+uet2lJjRl9RshUoZSN1ThDnd
 j1NTqoz69lwsigEBYVsbsDAffI+7Y0B0bVnqNmeP/jzqD5R9XXS4gWRt5IHOW5mdYkO0dmTh/DS
 XqOT8uCr2K/TI65F1Sor+rOppLSeodjPpxOiaUqQOy8GMXrcJr8zccM0VZ0XBb6sHxFIog02RFm
 Is0dOfI6ESG3494of5kAFh1UuVtYqtMZcsEI6+F3vN4zJrZnE0XqA8oslJmZRJ7FQcIgli99oyW
 /Deo8F6L0mnbwFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/dvb-frontends/cxd2820r_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index c3d8ced6c3baa6608e17cc4797dbeddc5a5ed510..a31a8a6a494652e6aae874c399fc70df3f9ee172 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -433,7 +433,7 @@ static int cxd2820r_gpio_direction_output(struct gpio_chip *chip, unsigned nr,
 	return cxd2820r_gpio(&priv->fe, gpio);
 }
 
-static void cxd2820r_gpio_set(struct gpio_chip *chip, unsigned nr, int val)
+static int cxd2820r_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
 {
 	struct cxd2820r_priv *priv = gpiochip_get_data(chip);
 	struct i2c_client *client = priv->client[0];
@@ -446,7 +446,7 @@ static void cxd2820r_gpio_set(struct gpio_chip *chip, unsigned nr, int val)
 
 	(void) cxd2820r_gpio(&priv->fe, gpio);
 
-	return;
+	return 0;
 }
 
 static int cxd2820r_gpio_get(struct gpio_chip *chip, unsigned nr)
@@ -651,7 +651,7 @@ static int cxd2820r_probe(struct i2c_client *client)
 		priv->gpio_chip.parent = &client->dev;
 		priv->gpio_chip.owner = THIS_MODULE;
 		priv->gpio_chip.direction_output = cxd2820r_gpio_direction_output;
-		priv->gpio_chip.set = cxd2820r_gpio_set;
+		priv->gpio_chip.set_rv = cxd2820r_gpio_set;
 		priv->gpio_chip.get = cxd2820r_gpio_get;
 		priv->gpio_chip.base = -1; /* Dynamic allocation */
 		priv->gpio_chip.ngpio = GPIO_COUNT;

-- 
2.48.1

