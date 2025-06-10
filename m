Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0D729B8FC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558962; cv=none; b=CNcOq2m61CrE1pppM1h/PP+6w/FROCB9AB24GjCyIIsCILjTNWWbzO6sNvlH6eo5ByFU+qmkzCCinrD13lq2RE/3WPl7mJGf2a6gnHd3WpbIP82l7k2oHZy4COYbMKpr4Phcljl+tBiUVWVrPQVmAbUJmjjvD2a921oZm0vMz3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558962; c=relaxed/simple;
	bh=/mdAoFgifrGqKEEyhtg6uTaMhvs2r5wvt9hHVXqUsuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvrP2Y9y/ElJPIqv2St4XtmqI/LmutKlBDqnJPHJEXB8WP0usGr3Uah7MpZwHRcZ0L1WOiv1O6KlMMrY/gnz53EXlarGwCW1F85YNwSfltTLluV2QRUBLc2f+JwuU09w1JigI94dW+kchixejfXAEz+OJs1brVyo1yGUwZUDXsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zOLyH1Ta; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zOLyH1Ta"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453066fad06so19288985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558958; x=1750163758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiLT6wBQ650bzMQiyRtp5HseVhCkXjDZMFQECvgUq8g=;
        b=zOLyH1TagnK0tAeBjC28pcb2Cfx85s+gKA8rAR9e2vj3mnCkDuF5Dc09jHrqHqYlYV
         L9U7tlC2iI6Z5xNZsrvvJt7vReUac3gWPDxQMqW5UMOgtlZLKOkdDcVhGek+xIPpBPgz
         FI/Z7UKob/nmjIi4hAhiqUG3SFQ6+QoiLbk+3Uzlc2jxe0GBZF3tTW9TleyQYqdbTQP+
         fee4o7rTpRjMPGyaJQs1mBZdtQDPD8qmY4QFhghhjZescWocnUhgN0K7UbwdV6IHhvEp
         fBRXdQOefBWKbpf0zvCJV8gavWbJdOTMjqlyDqdbZhxkjKZ3jXpevarj9RUVSz963gpg
         AUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558958; x=1750163758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiLT6wBQ650bzMQiyRtp5HseVhCkXjDZMFQECvgUq8g=;
        b=fnwc7kmRg7wpgHpAIqW/Bt9btcPAoPXRJu413c+nHvYGUY8tbrFOgSjE8ZqXdpIjJN
         v4pcynfrxN2m1p0Et3BrzxR4BDxcAY20W402rw4pe6CtuPMBmoecTPL4kNOk/nW99lM5
         h43I5fbUhVi2Qe9Dl0Az9RSS9G5nA7uqIf98R06sSkw9HHPWzNRmz2Nd9iO2AG99I/Ki
         LzeELhqtzZocSllMoX22THeO635ivwHqU8V/uPVomhPoffQmDncyxNF6ls0JqyM/qsjr
         SZksMSK2yD8RCdoEn81l+BgeJZso1RjVsy+LA7dvuEOwaPv93yhs9Co2ozm3fLqzJ1Gz
         gF3w==
X-Forwarded-Encrypted: i=1; AJvYcCV5MO54SST+7WygJBHnCnipwLE+WVMyflOhtxb0HkYwZqnsmRI/+nKkOPKwuV/7j/W7jVGMPCUTUtJ8dbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTG5O6NWBaEcck1g51LCLOkWdvKPLq48RLUnoji2+3ywIm2of+
	VpVvLFNaAOEVFJ5oSlnq2l+B4ALoA/qA/mBk3aaR91L3EDOYGDF1d1vuXC//x5pjkF4=
X-Gm-Gg: ASbGncviDXZMSlrVWHWCBJhbMIJmKXXm9RX3IVppfAlUlO2VbRzcqh5t2yt4iiDAqDy
	biozOfYUjnv3tg5Su8rOl91Bb9SEnYUG2y+ELhEshBauiusg8c09h6itDOcg21r7rjNJUa8alzF
	wrnCYUqHAJfv1h1IIwC0AFRZsZW3adfwtkAgU4vnX1bqchZAynNJbwFskRM9s9Aa/pFb+/Hv4pH
	wzAKelSDrINF/UgWm1zYbqujFvWztxnA3QqOq0sd4hViMpphXCDJZR6wbhIib8rgUPGSsL8M07h
	W0+pdGY6AZ+lwEbOkFoJ+iSsKkJm64Hu3CetxM55f+KeL99bOA4jIQ==
X-Google-Smtp-Source: AGHT+IGoSNhkQQUc8dbsTa39caQaeUFBSNvNDoCuunqJlyIF33dJ65pZKYd2lzs7WVwwtjBnsP8EQg==
X-Received: by 2002:a05:600c:3e84:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-45201417068mr156513005e9.2.1749558958214;
        Tue, 10 Jun 2025 05:35:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:37 +0200
Subject: [PATCH 3/7] media: solo6x10: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-3-c088006a152c@linaro.org>
References: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qJ7nbVmG9TqqpeyD/Rk6MzccGsAO1RnTiYTVKl04x9Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCadGfT6tsJ0ampv05o4yVZMWeuF4Ht0vCt63
 rpDqVdK4xeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 cm7HEAClpF8c85JeHHwpmEkbX5J3SM/K2hWTckAq1+2pOb/D9rN51WXNL1GKmXda95xWFPb8Ql3
 3+UUGeQtMNFK6RdR+WMUXk8CDLa3yN+KMN+5RoMWGWF7bnYPlMPLhYB0Bow7lRYutbV1Fzf1SUv
 3iZvdWfpvs0cGtnhXKHQvJK9llrV5Xmn/YWCIc+QsNmdUlTKqxUu5JvYQWfMnw2dSEtEKJTpOzU
 5Op3oYSWaq65qPgQTZOBLihzyOtCKXSs9GeADVPP7R6UUs5Sb7OmUlc0BiarhRLlo9jl+fYBiOV
 Y2ZmYfDQeVi+p0841IXc+Axd/br77FQnejUoHaWrvpEzaMqBDPxBhqX2duseMecdGVJtYASCxri
 Rr0YVJbspRHeFtowKjsDgIg+O33oy0H4vRFctv7vE03/Zft4TqGxLXnX1+Buv9CNUcF9J0yAuCm
 nNkR7+c7woz7qROajOfNUiEzDf0gUx78ppqlLW+PgrrgKXm2tZXl6Cy3KiCOWQvUEJUeNO3Ys5H
 HJonmu6f4AgtAmChADna/c4xiv4Fx6dFViujt+AjnSGvvo2fpb9DW5dxLr7RwXVJBMWTXyXAJ4C
 +jpNUnEMLcQQVQtXG381jI0YK660I5nVc3avYSFhkIug8fzD28aipWehAp2I/V7GhJzb4nEGkpp
 7Cp8vv1dnL/8mCA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/pci/solo6x10/solo6x10-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-gpio.c b/drivers/media/pci/solo6x10/solo6x10-gpio.c
index f51f865c69bd7b04fac7a1f951c734965d8fc993..6948f246a29ca92f12e3320d9c130d9bda7eef6a 100644
--- a/drivers/media/pci/solo6x10/solo6x10-gpio.c
+++ b/drivers/media/pci/solo6x10/solo6x10-gpio.c
@@ -127,7 +127,7 @@ static int solo_gpiochip_get(struct gpio_chip *chip,
 	return 1 & (ret >> (offset + 8));
 }
 
-static void solo_gpiochip_set(struct gpio_chip *chip,
+static int solo_gpiochip_set(struct gpio_chip *chip,
 						unsigned int offset, int value)
 {
 	struct solo_dev *solo_dev = gpiochip_get_data(chip);
@@ -136,6 +136,8 @@ static void solo_gpiochip_set(struct gpio_chip *chip,
 		solo_gpio_set(solo_dev, 1 << (offset + 8));
 	else
 		solo_gpio_clear(solo_dev, 1 << (offset + 8));
+
+	return 0;
 }
 #endif
 
@@ -156,7 +158,7 @@ int solo_gpio_init(struct solo_dev *solo_dev)
 
 	solo_dev->gpio_dev.get_direction = solo_gpiochip_get_direction;
 	solo_dev->gpio_dev.get = solo_gpiochip_get;
-	solo_dev->gpio_dev.set = solo_gpiochip_set;
+	solo_dev->gpio_dev.set_rv = solo_gpiochip_set;
 
 	ret = gpiochip_add_data(&solo_dev->gpio_dev, solo_dev);
 

-- 
2.48.1

