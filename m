Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBBA23A99D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572124; cv=none; b=q/9Fwp0Yoa9NpUUxSZjgN9rjBEMAc6h0549geQ3FDqDI1mQUmpgx/JOsVQo4guvFJI9In9IaczkvzZFJ2d/PnJ41KAqCXko94wxyn+UkkfdTtHqzr+UQbjwuV3LABhRTgIQOGB/kQjJz9lG2fARHkUg/xMkYcs/lNDxXUT99vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572124; c=relaxed/simple;
	bh=EulgghYY9EmhroqWoYb5VtIek8zQSwFJqay015WfuEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFaDrtAWtM3pEN5QC9ssXdzOe1yFUp7MBO3/tD7F5hP9o5qmU5ff/Etg9VVH1zYtxGNJLbKn3zUcOr4DSkoG8bFGeQzmBipwGakpL2+foUO4OjJC7kv+8wi/Fo6jYvewetgTAvLvMSZl7LcL4+pVRhWlOH1f1bvh/GZk1QB8TEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zsK6zUoz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zsK6zUoz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1796017f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572120; x=1746176920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=;
        b=zsK6zUozVmJ9/TzYyWWuW3pE+QnJogQLOwddHjZAHMMMH5+Hq8o1OgolIDnGci6x02
         8QDCgKXcHt4F5pZyQtNVmTHVUKW0aXLwfdJwnVq93f7pD1fVJvZyiMz/oLv6BgT05icK
         /Jq0KTdg3yk7cMvO/gQ7yiSinWinym3cCOo02K5TE8xPGI44tTf7RXdqcgc0Jg8BIZli
         V3ju4YLzlO7j6keGVZj41xhRKA+6SPDbqkBBERJt2WYxxEiLZGaoA9DRxBCBo7eYrC0a
         obntM/IoH0nBO4ggIvJFTcdSQfzsriwjqwrmfKH0OWu+Gg0iBNoVazZioaMTJMtG4CPK
         GUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572120; x=1746176920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=;
        b=ojhM1tveQV/W48lWwT9JDoWUiJ2iC+5zc4fS6f/MnIiV16G37ixM10v2IcYG/ZXTZy
         7uImW1G+5DZOBWpAgz2nMrSAJ4jNeZzhd3hqO+gb6C+tkrPkGqxBe0WEdU5mbXN2EApq
         X6LzvMbYSgYVqh+4BfD7DIGXQvGFIirJxAP72cEhWHaJbhL2j3IWqmrCZjvHrCvLCk+c
         elZXXvHfOBCydtMyxVM+Fssc1SU1TkCpiUa5Th6Hnynnvk7XPLuuoBHeZLSoLMRgbp4+
         Iy+qLY71v7vSeYBidPS5TOEEqse+VUZuks03rMR2jcVHtyUoEhzc6W/CkKJ7OPLjw+fp
         xKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYlUHFVxxbcz9Ble19L7DqvuL4/MYHOJHqBFuzQDIKfMsFL3vZU87pI4BNLwJ67RaymRLw2cyS4waK4XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9YRvXEWOGYN2aUCn2HvOWEJUTQAzauV83Ta1pvsmvWIUGhNv
	iA/HU0jYqrMM813v5oDu8ZKx6IaO196BAu0oe0jydtx/852o2vwGbK7gDiD3f//OUqzAPb8E+wE
	JGIs=
X-Gm-Gg: ASbGncuakKaV3a74Jp+LMzcunUoBj1dWW9S8AKM6Sq36jJlagY0Kd40dV4JHX3uXoHS
	7YMOl9ccPU9UEZVdVXMWOeEhjqpIaYAbAxUBimhH4ylx6Aljla4az3iULPj6ijHQqrLvr8+7T8E
	7A8p/wlo4FqgbNpv+av9vTVAuG1F/XMDkjPDyDBRHMf0si52bZcPrgA6FsvMwMXUA0Oron1nGw0
	WPoaD9jdbMbzs6PVr/QhnGbT0dQ3oXDo5E92sPrcjkIRhwRf9jDU/R1gDvHzUrBQIoMC/hEfi71
	/dzF7FDMExhT9V2Kzoy7bmkwimSrXn80XA==
X-Google-Smtp-Source: AGHT+IGN/vWTOOdJRbfqbsJsmvKshGEv6l4OK38T6XOXQRPgrvaijj8/T19lKBfroHc+Nolpyh8Jqw==
X-Received: by 2002:a05:6000:258a:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a074f154f4mr940261f8f.41.1745572119738;
        Fri, 25 Apr 2025 02:08:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:30 +0200
Subject: [PATCH 2/3] pinctrl: bcm: iproc-gpio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-2-6b8883d79b66@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AXQvvsX8aRsrH6IPjREq5g+zCKjZWUt9eQLSBi8qPzM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPM33kYpK05MSkPsmYPi2ni2pXZtF3jM//c
 +NOmi85KW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 cumND/9NDhDagbohLKHaVpqHCjYGMLprtLl0fswvDQm6vOrfMCMczKAQ2yKRl7wy5ssQj5ExYFe
 iiVWum+9hVvTsheYOoQLoLDOjffUKPtRs9ottEeT7W6B6aZkqLgvgEPKEtHz33pDMuV7Vl8LPBy
 +Tl++w9ixP4DS+7Pgf4Fb+DnkSHy54Jb471i+LP/buYQCS6/WaR/a7xY9t+dSvlJiF7aMogsWs0
 8UIS7KUOTGNac1pMUj1vjNMbbazqmx+yi/LUGMuF9FaUTo95pxr/ngMR7h6P2l/ECYWoqxx4HeO
 InOzcRHBGE3WSpGP+5Q2nedWWs2+J7hNaQZPDgPSwMPcmnofz6CIkOonLbAg1MQsqUU0flDVYER
 cZlwX7FIMeJFNWN5SbyAsdz3z7rtBBdO/0u7GHxvTyKWVZCd7cIsTgiCqQPdE2HwexPtMMRux89
 /QTTBhM0/BB5vXgdwxJTfF8FahYkc03S08Ew3ICCKoXjMsVZ5xrN+JOdnkacZLCMcJ1ftqpBwLJ
 jnb4yRvayiA+5ErzzEwSDs+3zgAGe/AAWkB8Uz/hjvTELKCMVeT/4vwIBgJWUPQgTHdHgwF1lci
 +FJVQIkoPiUp9l17NDejpnFAFqgHqY7LXJ8VA0Pvpo1JYmdQdLWOQbTmsdU4uoCXKV299Nn9a6f
 GRikUNE+adMm9qA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index c9a3d3aa8c10..1d08b8d4cdd7 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -390,7 +390,7 @@ static int iproc_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int iproc_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -400,6 +400,8 @@ static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u set, value:%d\n", gpio, val);
+
+	return 0;
 }
 
 static int iproc_gpio_get(struct gpio_chip *gc, unsigned gpio)
@@ -863,7 +865,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = iproc_gpio_direction_input;
 	gc->direction_output = iproc_gpio_direction_output;
 	gc->get_direction = iproc_gpio_get_direction;
-	gc->set = iproc_gpio_set;
+	gc->set_rv = iproc_gpio_set;
 	gc->get = iproc_gpio_get;
 
 	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,

-- 
2.45.2

