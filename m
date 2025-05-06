Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FCB264615
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522117; cv=none; b=LH87gRMNHWxCZ3Fc7zZJBqXL8HyM1onWoVXD3eStFYzGAEk/m1KnoAZjCoSHtCjENwtwFI4fLRgt1VNMUv3cQlCCJg8AtZ4pQ/902fyhBFiNii76Qy3oaWi/Ll9op9x8mX53C1sXgszPjOyCYmaFICXKEItkiTsI4ZVxgrteLQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522117; c=relaxed/simple;
	bh=gYKt/V/uMuHipLynaF1K3ceGiFbenp32cyT/tx97Akw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxN+Rh0U3+7jHdYnBx9YU1dZdz4GLqK7QjP0ikrH4laZ82tBaRI90CXKj/CbVvWkyN+7rsVID/Y+kYrfLl8qw2cn6yipKpHDe+3AXFkerZ0ehlW8Hc5/Q6a6jsnHaDKjGxA/5m+YgCkqdKfR3UmaateDL44bFOx+S3iotiMOlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E82NgLrd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E82NgLrd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso2469055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522114; x=1747126914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=E82NgLrd5aQePPCmpkwHp6MC+yNO5DOha0vWYFlF6Q5aYeifX+SWL6nYaeVHSx4mr7
         P/HxRA6mP89AtNKvVfP2SCwRoAFyf3JmcsLJbkONuTIvG3orazs9cQkFIX/OZOeWwT2F
         yWCnfXkLhrC/qVgQbubyv6LtctGSw47Vb4p0qMPfsWv1ESdL3QR+L6MN/mDh9WFatYpJ
         +dnQaKmS0duVcgh6ZinsEfRBP1kVpeGyB7M2ZvJSf2oMM9553pUfHJ4svHtx2eUQXpWx
         t46a2g2p7k0aN3GBLfXhg4ZxO4DqD+XVg04gsUSG3Ia1Vf/6upoY8AI9BVkz49Dv5Ma6
         LKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522114; x=1747126914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=R+dZlZyzZtNihn/x75WxMxarIYnDao0DjBQoksb5b9nz6eb9OC0n3DYBswyWHGBKHP
         4BgJ5z6s7/QvYvArAY7RTdJ8r/E9d/t0pHFvOxT9MbSCZGSJmBYZfw8VrtEcFy17+/9c
         gTe3EpjGhGHjOndlyJuJRi0/B1Ttsvm3AfkBdCYpTeZbSk+gQCh19JAhkd6zhHb11qSY
         h88B7jxWlp6yo54SgedosV+5Fe9l0B0VGUgmZUUbe0gAFBN4ibNq7uVYiUK0oTROjXlI
         yVtXigVclgeh+d7vRtLNJpyRuF0LhQKHbfeaJ+DaZskNLLXboBgoPGE5KZGNP9bJYsib
         cDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl8GV/iZ4jOPuYt2cc1Dfj1RjeuixvHnkB/9HgjY+10lOcu6jP5T/IN13bRrh2/b0jFyPoaa2PXpRX/ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCl6/IAkA/cfr4csHIxaKqHLR1vu8cRY16M90LYpKclv87FNAK
	Cnsl5v9xfZOlSDHYlh8Cy6FzfaN8pkS+4eFNPWDSRRWjoWyzJkA1vLJsLkkeMf73kzrJP1Immev
	X
X-Gm-Gg: ASbGnctdFdhVO2oriGQ4bf87RIk+bPKAQsuaIsEPos/2N6gqngRNlShO3P+Cvxve+Sx
	rkh2Qvhw1HyWmGIwovOXmm/QPcP/BOWv0h1CR+PvoT3ZBoo/XuhCZlVfzmvP7hmMHFQ+7n7GjAd
	/q39EzIzNha9HmoWAIBtnBt1en/iVUN2tFEsWoa0Ak0RXQEo+Gz8lpuuYHmQRI48448e99ysyB/
	7mM/g3utFJobY7DLrK5yv78YbB03Dcq+6mdbDRQY56MZmMIJgMui30ITKXlm0LhOSRs1nCykThU
	xlHvEChp4+XlK0l2m2yqD7CJqlb8mQgXNXU=
X-Google-Smtp-Source: AGHT+IGDU8UwVARAbr3wvLnx+R/CMU+fndtw+gPiz5QuLHtsjMKW02FOMERXLYV/50G6vY3UpD1p6Q==
X-Received: by 2002:a05:600c:a375:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441d10154abmr18934305e9.31.1746522114107;
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:44 +0200
Subject: [PATCH 01/12] gpio: lp873x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-1-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KzVnua5lKk6LSZ+RA6U6z6ophC29UZ2psB9O2qSifco=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/8PZdeK3eoxj5LZCAwJ2tSgAZHtlOTQquu1
 TAv25EMsKmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/AAKCRARpy6gFHHX
 ciBXD/9eOGxP6WMpRIbDeI4ZPyWQdRiVWSzDMz0kD+ULzuBS7OHZLm1Lxi6rYWDOoZpA1aa/qRm
 T5DXumO4TNeoTYBlW4zeeAEyA6tdzECpf1BhhK/71Cn3CTpEE5pCBPbr1SvCuil2ysLA1n3Xg75
 kgPpAliYslsoCvHFYMZmoP/fFYVs5VoMLCCbAt25ueJJhtaMLmaUr9+nsxjQWRQFjce8XjxLZii
 uJ3Itxgyt00NTON1YpRsK3F1mGAeoZ1Pd/RUkCVXkRsvFN+faFyk9IbdH7qlAUYAG0U+ejvRtYm
 /UyYpvwOe23hQyg+2Oi7V74VaTaEQoEy4t/s95EwAXun2JRR/3iJiMs2DCKh7mu6mmarCHQ0UJ9
 rxrMU0F8SWGoNdoHJI84PkrzCowsnyGfaRbErOycQwKW7sif5ra5B+FBN0FTOzpt9H50VtulR6u
 ki6ZquD5iMa4DJg4U7s5rj4LSL41DL1E1PI6WKGM1SotlSot6p+ShkRrgong21J0XZ/Ct28bQfO
 FHWNqOgECDw9gWlNurVLK1udL3d1qtF24kPC+tq5Z7CmYOa+J86cFTFVihnXzLEUpjlgrhnsTd9
 LVPrjLlEel3vU7pgznmnDpKarYuIvU6If7rb8TRGHcBwE3diBLGk+eBSPYNSNnX5lDbsWkoDzMr
 JAhTSgymkWD4x+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp873x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 5c79ba1f229c4..1908ed302e923 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -58,14 +58,14 @@ static int lp873x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return val & BIT(offset * BITS_PER_GPO);
 }
 
-static void lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp873x_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
-			   BIT(offset * BITS_PER_GPO),
-			   value ? BIT(offset * BITS_PER_GPO) : 0);
+	return regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
+				  BIT(offset * BITS_PER_GPO),
+				  value ? BIT(offset * BITS_PER_GPO) : 0);
 }
 
 static int lp873x_gpio_request(struct gpio_chip *gc, unsigned int offset)
@@ -124,7 +124,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp873x_gpio_direction_input,
 	.direction_output	= lp873x_gpio_direction_output,
 	.get			= lp873x_gpio_get,
-	.set			= lp873x_gpio_set,
+	.set_rv			= lp873x_gpio_set,
 	.set_config		= lp873x_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 2,

-- 
2.45.2

