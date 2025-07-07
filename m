Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442428A1D8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874627; cv=none; b=DD2uvKmV9cve8eIBXGZhMVwLraqZ3pv7ta1ZFVJ6UzsGpra3gvxjsx1x2nnlfqV2fDshgv7dzs6eLmvvySulULa3GbzEgSFzj/jy/uImJh977AurTLnbCzE3ULUij1SR0g1tu10VrgFDsA6+uUivmK8PXJ3k6arqkrql1akHWGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874627; c=relaxed/simple;
	bh=o3ttjvWaE7oBjAWT5UQDQCptRYAsYF8S/9c+FjxVKOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIMGrb7noS3FYzbsc34zy2TTG3JmTNqG8ih+qsQcCy90SL39cUEAEDaW6TjCyJ2Un01MiLH7ZNrZhT6anX3Mxbaui7PhZwJIghxmHJlLzUCY3o9i4fQ6YEsNuHBUMbObOxwDnaRhvpm2TX7F1wjZyPvjfto4vvl+w2+QNW41qr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LpjdJZdp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LpjdJZdp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a510432236so1921292f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874625; x=1752479425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5D/gCx91/Y//En9n7QYQnwwJaerz4uwu5zS3XJUkJg=;
        b=LpjdJZdpjvSWdsHDK7KwAohZcc07bR2p2+0LwmZ5Eutof0Xnkizk9ZrQKyLsM9hNyH
         aqYcPKMcqDYvXnV3Nx1hGb/Ly6x16bylKfIIiDuG2eYU+EW2Cf09eHkxxUnrJ8uccc5o
         pLt3MkVy85AlpP2xPNpjPYSi76ZPIAK7hLiySS1fg6xDj5PKwQlUnoL+nuLSruRI+cGq
         G8jHbs4b4cpHqjVvY00h9qfCpt7bVKrDwk3mk4yZhxFneCfEyGSRq1DUcICkc5zN/fva
         afjrTtqEMTBTy+V5/71XfGDGPZYfizF+QjDEMqjy/NQiDKAUaDu80MJRfocS3ydizql3
         nt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874625; x=1752479425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5D/gCx91/Y//En9n7QYQnwwJaerz4uwu5zS3XJUkJg=;
        b=k8rHPSgjHzEKxoIMnoEkmrRkLiQ47qbNivI9sbvmrwlOcxOLaEv83HaH1YTprlE6HR
         4k5/sTkeyw+4pYWYUwcwjo8JskDAn4vxKmY5DJlIfBXXXgeV6Bxx7KRy7b15p1jDp4Ez
         t3y8gORBecw518nBvBV9A4zhL828h3/AVoH29FDkGHO2r6gSBxvCXcLcsBR76flONdDr
         PU5qMcIts/uuzo0SnFqnDzXiDmls7VLvdZ1UHp7tLgJyykoRZUVqT4h8frzTkUz8kGSr
         xyMEkzOcdWWFm5Zq//TXTZKMcDRKE6UK+8s+0cOHYfwfRUMP9hp/otak33ubQs5VJ2rw
         VK2w==
X-Forwarded-Encrypted: i=1; AJvYcCVtQtXGsoX84nrC363RK5oIfkBmAWPQPOcY+o7+gGt+t2iKX+BwLXayAoYgXyE2SL5V95WbFQKFguzNXZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0rd5z6exQDff5RKsRr20xyMiG4eXA46q+lX8iNl17G6E0IrO
	+IZpmaF77i7RqDS0j0Hx7VdtOVO8lmKjwALJkdZjXEgUd592iE4//2Adl8bNKoCuWMI=
X-Gm-Gg: ASbGncvqqRH9VlNa0qLcta5yhqY7btAM/fn/UZWfSsOqEZnDk2CwNK5STVgTpjO40Xn
	l/R3a8L4TusbOa+7eid8xi9AAUv+JeEqMrpb0UUnOTpHpSK7xhDiIPxyQjrua4Jnn5D/vj/Vi1a
	snXMNozYbaSURlrrixo1/+WMjo0Y4IsMT2zN5Z2isecuxcRkXQOYEqqRD8Xd6nSTWDkujZbxyFr
	ZKwhz/8+Fmy+jVawrKVO6VRT1wp1QTIGs74wTbM2JWVZHs5zxlK+4emvx+8pW0vaoFD7IS9yHAj
	lezvWE6UP5oQNXj41ovcXqT6A/7qGij44AvNbtcQYsBvlWS1qf2uEczk
X-Google-Smtp-Source: AGHT+IE9q3D6H1GQiSGZ7AcHRsGtYbQq9ZPf0BYDp6zHpmdTX7TwrerIwRMk4FYZqkacGFOvWKLeNw==
X-Received: by 2002:a05:6000:1788:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3b497038e7emr8999552f8f.40.1751874624545;
        Mon, 07 Jul 2025 00:50:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:16 +0200
Subject: [PATCH 03/12] gpio: tps65912: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-3-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=njAvtdVnxWRlINwsdw8tywJxxxUNxg5ByBiqLbpLFkc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6MMvFmoVqaXM5v/0/S4TOBonUxrVRC0Rfy
 oCggMgQFOCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 csJWD/0e0mBypz9MzWTZzbT4hEw7e0gkI0Ba1/PVBmUVVodHFTL3Stjt0WmK646DDRMpHqBHTiY
 Iq9ZzKlhSx5O2rvppnDdI/MzSktt0Lv3hl4GO6zPP9WBYvdv6LBfSRFi2a3p/lUV6api0DmI+s2
 PISctwGoDbaZnZeOTYZ981yBhivTw7yjHcMNVFPMMnPfHG5D96v1ONuWJFgEuQ3x8H6DVTDJLMK
 qPgqpOLr19TG2cLGAeEui+ES+KxO+OgrzsSTuz9ujFuCtRhLKU3cXLcQof2fx9fwg/cHWlopiTf
 m2HJYDx/jMQIWHsiwjOaNjjmw9Le4rwzjvUZUR2QhD1Sjh6QJrGiU+myMmijns5Xhd5+LB7Hc9n
 hJ2rPXYZ91ttj1Ozdee1UOwXBBsbLYDonURUnLr4Re/6nFMeYKjYPpAO1mLV0amLGLXzv/X/1+L
 0BQroNJK0NtWuTz9hZ/RCkyKxvnjWazk83nQtoE1guYFenIfZzKeMNn4ogIbzT5a1/4R2VxzCEJ
 IlKZuHBNjtx0/J8Gtqzv1EkZo72E58dgRnxmzUSb+zxNYbKTtIsOxbEqVTeC1YVEF4bWfdgEP1Q
 U7IRchb1/aaSwRZ09j2dPlDS987IdvdVB3gySxb0S2tQxyN/vd1SbtrGPxXizFKMr07xx2eF+SO
 a1O0y5m9g0Y+bvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65912.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index bac757c191c2ea0d103eb0577710065611fd79aa..d586ccfbfc56c17ca18f5c2b04a807305dd66890 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -76,13 +76,13 @@ static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps65912_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps65912_gpio *gpio = gpiochip_get_data(gc);
 
-	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
-			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
+	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
+				  GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
 }
 
 static const struct gpio_chip template_chip = {
@@ -92,7 +92,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= tps65912_gpio_direction_input,
 	.direction_output	= tps65912_gpio_direction_output,
 	.get			= tps65912_gpio_get,
-	.set			= tps65912_gpio_set,
+	.set_rv			= tps65912_gpio_set,
 	.base			= -1,
 	.ngpio			= 5,
 	.can_sleep		= true,

-- 
2.48.1

