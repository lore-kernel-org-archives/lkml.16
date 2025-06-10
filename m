Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885E298985
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558818; cv=none; b=SwCfAmbs5zpK4gpsKyQTAJZ+4N30US/B26og52O86G/YYYpEjd8hRC3xi4vYYGT9IGbdlb4e1wfvM1i+F0QgIOPOhxSHBiO4EWF6+YHMy346RqSohMukBqeNpz6Y8fS2jCrtRWeRPGmZD1EpUWzscC4HesBUUgGk761sdG5ebtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558818; c=relaxed/simple;
	bh=uthcbW/WugGsTwB04iDzdxOtDJLGhQBk2AOOfRbDexo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZzXgsUoqA85IQ+jF81h/SG8LL228sZv2IWcvSZLMKMQsSAvLGVrixiX01vObAznxpIwTzTu0IiCfImvX9L4GrGGHkjwtoJKzbgBqPN+cCBY1amTl/FEqRD8SrR/7NTdZfM6dG0K20+BHpvAZIpEq/Tvb4s0zksXIl6hyT0zGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=04pGALaB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="04pGALaB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4623289f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558815; x=1750163615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
        b=04pGALaB8P6EWD7G92F9bhDEIKSjITGKDYzUar7La0dHp27yoCwZC4Pv5VQ/miCWwJ
         1h2HJNCmgd22Bc5yf1ledbueU4J33dDvs8jEAbnA1KU5AY3mL63k5bVTrOgfq9bOEDqf
         xE4vpSqGTIACrMUMtgb4UnYop8arAeIrcFYN+iZZmelo7OR34NP2/8MNUWUweCJMaqpQ
         b5GGR3n6JpcxobG698hRQEDhuTYJQrkvt4EBT6eaduly7QZHUC4knk8TgwhwnDZONCUe
         AbN5uoGq08tX4sXSaJWbtzR6AZATX1cCjOzdAmmIqYUW2WCvC1sTG0oHa98J0kpEEvh9
         bzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558815; x=1750163615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
        b=BvP0qwuo5H8ExH62jm9snqKUCLJt/cc2zVWASis8TdYU+XG4qbzaiKsJowHpij7hiG
         6dojUb6z8mOdTNBJ/sGRxkdgvzzPOZgalK3L7skmA6P2wJNAQlO+fAEzcpAn76STSije
         gB0UWq0MjaCoy5QiVsqmukr7ymdEKQqtayzKOPU4y/7HLL5TViPV83jZ897GrJyEHGrW
         88tmddHMCBkFoC/oPbcAcNSzPyNwAvPI1JqMvLt8K/hG0On6nhKI+dOBFrdG1O63e3I2
         cC/kt/lg9UleyhG/b3YneXkigZYzyqpYng+oHO7njpEVl8l+maUu94H0+ALWAivmJEYH
         BCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsOgYciaQuKVEd91rvDUeb8qQc5TtEKY206BB0tyNxaRfzknHsc0lNUoVoH+VR2s+6NBVZQFrCmbp2yqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKiZVZXI1ydQYZJn+URqHOnNthEeXXKOboVvhSeyfyZTmbuhq
	IRBLdIf/U/snc2QknDW09fsUjqQsiUW/jPppL6vwmfNXqODooUWPrYjMpAUx6aIvhhU=
X-Gm-Gg: ASbGnctLAB5AEccQjMfvG8db9dFeh2th49wyexpquB1G3PivhG7SbYqerATtyHZNyYo
	wGx+8pS8HN/RFEHmp9EQH4lf/Sh0MUbEdl7E5jbABXr/ffMURnH80zsdYHF8MwBO2N2pmJB3FRq
	LQg5btR9kZMyYf34tcqAMtEEkqEQz/JPsz5ZgvxKYQX2GyqeXRNprMLRLbPDW4rDiCRNcFQYhy8
	A9mQ3TJlTdTqmV6RpcLJ5KEW58fVx5IkUrldDdjBiyVmaeyZ4q18AbWGjbGSjbTd6EYP+XCVzUp
	VFMTCe5eJoes2fvV6KLRgKJ8BrFcQiJ7J6PCkYF5aC4JWkjY0kUeGQ==
X-Google-Smtp-Source: AGHT+IG1enS1XXO5MOMxHtGmC2A0TWdm1D38HYK+u7jLnOQJgSRjc8Tt9JvPkZ2QOIrOTK0nknN0Zg==
X-Received: by 2002:a05:6000:2389:b0:3a5:215a:39d7 with SMTP id ffacd0b85a97d-3a531ab525dmr12050338f8f.22.1749558814690;
        Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:21 +0200
Subject: [PATCH 11/12] gpio: omap: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-11-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yxpS9O8VyBwfb+1xhv8Bj1RrUY/8b3PCfbF1mQmw8vo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQMAyZ2DFFK2uTaeqWWkqsZrltQtYiNFD+/
 MelCJUiekWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cvAID/0SZN2Wd89qaQKgmmxwQk154LwwnFEUma6TiDSVFl0DYCIyoSmt+4ywy6/N7uybzS3xzR8
 wryJoLAuEDE8ndyVqjxweeVzP7/rSL0157QD86uNoS9RgjehI6GFWJY7jqIc6nzQRqQfjd4fA3y
 X51hb1N2boKXviFHtrMXrT7QsCH1/kB48RoFDmsxczMlCRDLNmLHEIBMoB8uexb7RkNv+ez4VgT
 4NqTADOXTj5kyXLTw5qABxy+OwvryoTQ0Phb90w9APCydzyQczAe+9qHW3XRuLHAXxMBVbPU3Hx
 czk2B4JWmnEmFMRSA0SthrZJk6pkl2RKeEPPxYXLvKA66IX1VmySqrHMqjEIlkje8vMYXi6HKdc
 OJx9I2c1uADeWrv/LWfubC5dlHXIe/Yz1MXY7PhBRom/bSOw114vQPADo4f1w6P0VhrS+IJGhgF
 lP1JWjYKSlGAJOlR4Bdan7uk5QXtcrn3bltIR9x1vJCMlmuZYZrNQzl27offS1w06rUuUK9uvwx
 IZRnZ6UAUfXoIAB0gbyqa+sORMJ4MXo5x5NShZmGLERhonmyI39orc4HEcm7a9p/qtiuD17AJTf
 U4MrqzutczKRKwe3qRSf3UFrc5gGSxR4yPGEGthaKAg1WdSyA7jHkMNgTpemGF7psGH7iDZk02R
 AGAbHK/H1WBZtCg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-omap.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 54c4bfdccf56812b5f79435a97b6eb90904ca59c..ed5c88a5c5207063e1269763e6239441a42e0c3d 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -953,7 +953,7 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int omap_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -962,10 +962,12 @@ static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->set_dataout(bank, offset, value);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
 }
 
-static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				   unsigned long *bits)
+static int omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	void __iomem *reg = bank->base + bank->regs->dataout;
@@ -977,6 +979,8 @@ static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	writel_relaxed(l, reg);
 	bank->context.dataout = l;
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
 }
 
 /*---------------------------------------------------------------------*/
@@ -1042,8 +1046,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct device *pm_dev)
 	bank->chip.get_multiple = omap_gpio_get_multiple;
 	bank->chip.direction_output = omap_gpio_output;
 	bank->chip.set_config = omap_gpio_set_config;
-	bank->chip.set = omap_gpio_set;
-	bank->chip.set_multiple = omap_gpio_set_multiple;
+	bank->chip.set_rv = omap_gpio_set;
+	bank->chip.set_multiple_rv = omap_gpio_set_multiple;
 	if (bank->is_mpuio) {
 		bank->chip.label = "mpuio";
 		if (bank->regs->wkup_en)

-- 
2.48.1

