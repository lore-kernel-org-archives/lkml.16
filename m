Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7795220D4E7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839147; cv=none; b=TIaytnA8SpJL3LOvOOcWqWKtABcxejbACfwWG7hWc0ADc91ud3PACuZvFoKOqr3CpUO6/O9QkKwBuLSC1zk2d+zXm3EisO2I0GO8ZQwWyIT/FsZ0y18DF69S8bQoJhbZO3sUQOZ6ymiVqE5KV/w8BWQQjNQhVc+cPubWbpChP4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839147; c=relaxed/simple;
	bh=3Q6PvI9WLyYhMaGfJjkTb+FYVTdE2N8kvgVnMIWR/m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qa5Yq99gPxoAQAWMVJ0lJguQS/AvXF7LgzYgO4sXu9lzqlel9V+xwIxpveeu0dLYCgFC7pOKFpDI0E9/jjZpWioJFAe2N7+ctlJwUMLof1M2JYgk20KqVTFhLmMIpmHbBJ315rMKp7UayxzVyt0fD6OxTwmOWgQJxc/4wQkTHRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cXR0yF29; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cXR0yF29"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a51481a598so3194970f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839144; x=1751443944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUoo6FJst5NdWLmIH4CqS4bd0d0TxJYeNn2FpbLv3cA=;
        b=cXR0yF29cy9rc745is0Jex+On7JBZM3pRf0qPdHnTuk+RDuDQvHO1MsYqv9XPVZEXn
         Kam0McmGfvHbTqFtOHXQ0Wb6jPwBcOBc4OguhmaNHjYcXvAHm5wQ6pzND8GHgM80QLli
         ve7YQeoMFaRq0SI7/3ewE0ReTlVUh5fhQlnTqsyRliU79oLVZi7vT9V4zyZbnXsva9nr
         02OpCK0hvH3x3VOO8QmtaeGiSiR0sPJueGzoV41pRin9TVzPXfvxnc93RH89iEd+N34H
         h1FcFF7VAYT59MsrLEYo7AAzGI0fvxUGPsH74bzwjBEtWIFxzIiw1jkTVQYvpHUOzRej
         yA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839144; x=1751443944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUoo6FJst5NdWLmIH4CqS4bd0d0TxJYeNn2FpbLv3cA=;
        b=v6vNuQDEWmKmOz4+PSSl3Mx0Ang2yaDWCCmbmzeE4/2xS7WkeJJv9a0vq4RnsGVWm5
         w/xo9iv0ozw/rS0hV045la6KQFHYUhUOYf3FWdyl5TWbjIgwuP81Rkkzbcpuo8wxj+IH
         MWFAOjEXFH5DmZ+Zgs1Xr75O7mameHqczvYyuUzXfHgK63Ro5gi/Mr2JgiA93ZPTONFz
         WMt00LQG3WS6IIQ7W+gzpfskAl3MWb9c5XtKicysuvd48X1pqYAAYGgXd2KxOOcIaGPD
         +nnMPZTzVt6pAEXD5GujO5/nDaRtPz8RpJQsUeBm+j7Jt9ExvkOY5w3tfcBSPPuAwyXe
         yFTw==
X-Forwarded-Encrypted: i=1; AJvYcCUlgDVu0aaQUEgnRPVObRqaGiBsk+kVCmNfnUq1lMr3E8S8aFCVz2/SNrLaghS820+UcCFlRz1cH1GXUJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFV9Qy5Iue2ROv1gfCo1Mw917cFs5vcLF1wvByipz/B67at//
	adFMo17pkfX+yaZnNxXcfO0o9opa2NLjqKG+5Ht3xFC5Yq9vM1iahUrLkg4p9yw7iao=
X-Gm-Gg: ASbGncvoVvSum3Lg0xpMRyC/IxSYe5TZmwLAypOrNc/60Zmek5z/G2C92feChh2WMQY
	UhbPz5UmHyZq8KmhY0dxheiYi/oKiI2zAT8V2BxohDycjLudEYXWiCsZuG5+ZXyceUZKawdkIFb
	1lamOadKOhTE4nqXcs6+rBwRqv96MYz02WWHabXEEhtKS1xxpkf9E33M1hSZI+TLiqvcfpg/+Lg
	QaAiRwDPvb9FN9kIGlUlbnz1M2Zee2dGUhXH2BvQ7PWpfhqF66ZvyNLrtMcajzGQWQFNQx7kYvl
	hyRX9UlsNVeGms4eL58IeEqunXWFtroCnIueb5DAfyLXrHLuUbARID9ZCuSVR6U=
X-Google-Smtp-Source: AGHT+IHoTnmbQpVOqUBn04Pr6So0n0WsB+ZlquCI3rmaIUNAwfhUugZ1XzHHxQ5IwkSpcBcGAAFTAg==
X-Received: by 2002:a05:6000:41f2:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a6ed66a4c1mr1590058f8f.35.1750839143559;
        Wed, 25 Jun 2025 01:12:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm12228065e9.5.2025.06.25.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:12:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: pisosr: remove unneeded direction_output() callback
Date: Wed, 25 Jun 2025 10:12:22 +0200
Message-ID: <20250625081222.12744-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core can handle input-only chips that don't implement the
direction_output() callback at all. There's no need for the driver to
provide a dummy implementation so drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pisosr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index e3013e778e15..a69b74866a13 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -67,13 +67,6 @@ static int pisosr_gpio_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static int pisosr_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	/* This device is input only */
-	return -EINVAL;
-}
-
 static int pisosr_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct pisosr_gpio *gpio = gpiochip_get_data(chip);
@@ -108,7 +101,6 @@ static const struct gpio_chip template_chip = {
 	.owner			= THIS_MODULE,
 	.get_direction		= pisosr_gpio_get_direction,
 	.direction_input	= pisosr_gpio_direction_input,
-	.direction_output	= pisosr_gpio_direction_output,
 	.get			= pisosr_gpio_get,
 	.get_multiple		= pisosr_gpio_get_multiple,
 	.base			= -1,
-- 
2.48.1

