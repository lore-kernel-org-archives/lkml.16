Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AE225761
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009770; cv=none; b=BT3gsrNdyk6XiG2HYu1mhiZ82QfEotIZ5h6Lc6pIxXKM0WBjP2vOpsCxfiZ4fKONeNLHzvWbBAlR4PsNjvNqUHiyOVV+U/I6G3EtzjI4DY6lPsmD/PCO8jK8apqY+uPV+hHQ0z3RS3hXrg4IaDMzMQdTb9oIzMyN89mkXekwN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009770; c=relaxed/simple;
	bh=ozAN40jinl+xXLgyl7TwyrqEYX1yW7hYhTChwsJoIiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLcX5FRmUT/JIl9p7a7oaUnFLpqi9QOwqF2s9w9aRfw/OIzZUfCxx9wggYtMdIkpLKCvL4xBIwKGidCCJz0fbwEl2VgkZt3t6T8xD1iypIThw7g5SEBlbP254L5Dht2/LhjZT3z9w7um95cQnUOycr8D7kei82rYbRZZTFu5c3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zq78gfjk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zq78gfjk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso43859775e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009767; x=1744614567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P54VA/QfQ5VWCZa2DrfOM44F5qJ8PR9WzkkmyLvWpKo=;
        b=Zq78gfjkMdK17dFmwMiWgGWIjk4vEMM/LqKKh8VCfgXh3Uj/K4CGZ07sLe0Qkl2FxD
         UHUa3lBW2P7H3qph9EHUbpxCJ7Va1l7PgI8WkoqR0DKSTDnE6pf3FiwC373gKP13Stis
         tCOV7Ux774VYH5a5415qCH1u+zu9D/Omgg1cqCaDBIKWdi+hgQGEFIyOuh864PCg6Bqh
         dJ83o3QU/hKFjVIvBUrdOvZunHrbDN3aC9hB04ZBVgyalzIgiWGZ4+wGOSMnDmKeCxI8
         KT/u5CASQeKFPPj2liovOnloK8xP5rTuxCxGFEkWog03/9JqdiZcIAEO/oHl+2uY36RS
         ry0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009767; x=1744614567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P54VA/QfQ5VWCZa2DrfOM44F5qJ8PR9WzkkmyLvWpKo=;
        b=HRa0qc8ouQ7+C13FyyHZed4WsUjFBJkm7HeoHAr1U8S2ckjzF15ZapEWlIxhQeEi0S
         OkBDeqPyN1kX1pEr9FmF9bJJv16TyVxbeuXY9gFEt7G6IPMMBs2QLPRBc084gZXJDHzO
         +XqB7QvbO/duRnaXurxAyQgI0+uGDHNKFz5+dP3fqQgeJlbfjOlyiWui1toJKjdtQ/Qq
         NTocCRPtLMBNN31ZkmSTOXzTUts9ica+8XplOmUoIItUYxjaFcGAid5mX0yaVgKYhIBg
         awNA638PmY9fZCuF8QEs1u3Ca0yWebdsNLc1pkur5cyWTL6m3/9LDR4NmC/g1Ad8U/eZ
         OV2g==
X-Forwarded-Encrypted: i=1; AJvYcCUNbeLEyFG8Uu8+e7kqPaLRDJVqYrKEexJQ4AVzJDNoe8zeycfBYFsgwmECdd0LXFbfoibEAkMAEXHZB10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFzgmxbQ/EpUlWlkBzHIV2xGPcw+rK7NWlftmioXMqzsyUiKu
	beB/PoTZedb5KcNj5zVp41Gx6667lpRG/E/UXzs6iEbovxCcDF6XNzq95UJ1Q/E=
X-Gm-Gg: ASbGncs8RLgWwCw2TNfHPjfHqioMPNLb4UovaYXy7cmbMXf+GTedVotNALmPX8Md+J6
	OlcrYPHuT46s/+28uRxlvoAhbeW0XIsD8ow04DQ3tDHxJIUeuzwbgD0m3RhPSsASLqjnVZ0L1bb
	8ZeG/k5b0WsdU4bVT1Vc8VLht1qca/M49fFbOYt+qYuLOdeIIoIV2Bf0IuvOHEvc8/MY1vPVetY
	yxJwwm84eEyWSXxgVStUrAzw+ImMlWp93CAyFIO5/5U3Mf23LR2nPI9Ykdyy1RfBjGlxlBKGNkW
	h1+O6Sicxl4dEfreviCh/ZJG7c437I8gWr9Q3g==
X-Google-Smtp-Source: AGHT+IHlbYVaSeQ4i6pCJ+5QwB6SPB1j4w0/Dq7AFXUieSOfltPppg5yQl42lc4SWdhOL/4TY1MnaQ==
X-Received: by 2002:a05:600c:1912:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43ed0d98e11mr66774425e9.25.1744009767393;
        Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:19 +0200
Subject: [PATCH 2/4] ARM: sa1100/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-2-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xsWx6NHlIxnhL6jtmZVFoxqhJ5i8IDr9WwAEXelZLcc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ojCLYV8dzwcSNLnX4bkKX+gH1+RDkz/zjfu
 UvxHKlCXuyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6IwAKCRARpy6gFHHX
 chMGD/9WaglQntxBb+rFUYx9pTpsQhM2cuIhUhgxNCX/UTl/3szgAcD06UaZbzpECecUIUvcZcf
 xHvg9m/8zUqjvoulvOdHUUhu1M/64mJr08Mc59L7LYUNUP5DJgPZnDIFvclIIyXxgl2/R2TD2gb
 W1iJTaMePwcZgWSB00BZBRYxN/q8f/2O6XISU6cNUdJ0zYvgkW9M9tZhSzGQ65VB2MsoracdfiO
 Isfwpu60HyoH7bKqnCU3/NT3fn472ynWuWAOAKCLl5g5Bkv810i9mWpnLDn+db8t6hU86JhbldJ
 l/BNF2J2U4O74bHUDEVQwSDyvbHN1YOYCsTfOLgvQmlU7umqx+iCfPGsaqpp52oYItloneBpuWv
 HKWWkhv2YftZY44ytOEUa0y1HknhvANP18iKzjY+k4ZouGO45TXtsRrtHsYDOLk+c/DhqwwOmPF
 aDX2XQ3DsiwI6Jx3zvTNp5vT4FYSEwoSroABjT7ADXDkrS0mfbIwAAPYt60KWKhIQgj3OWAXJuM
 0a7oF0P4c5rvq5KFVG9hl6GsbYufNkx6PVx+uslfrKQBjHZuV0EL7wCO8V6y10cEZBBeeUTTK+n
 kGGs5+XXX1fhdeD5Y3suIaahWADJWI5MkDd+0OajiUpvCEENwVBvEsmdNIW0nm3nk7OTSTKfVTD
 wjA0QNCPuSn2sHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/common/sa1111.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 9846f30990f7..70dca9937644 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -563,7 +563,7 @@ static int sa1111_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(readl_relaxed(reg + SA1111_GPIO_PXDRR) & mask);
 }
 
-static void sa1111_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int sa1111_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct sa1111 *sachip = gc_to_sa1111(gc);
 	unsigned long flags;
@@ -574,6 +574,8 @@ static void sa1111_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	sa1111_gpio_modify(reg + SA1111_GPIO_PXDWR, mask, value ? mask : 0);
 	sa1111_gpio_modify(reg + SA1111_GPIO_PXSSR, mask, value ? mask : 0);
 	spin_unlock_irqrestore(&sachip->lock, flags);
+
+	return 0;
 }
 
 static void sa1111_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -613,7 +615,7 @@ static int sa1111_setup_gpios(struct sa1111 *sachip)
 	sachip->gc.direction_input = sa1111_gpio_direction_input;
 	sachip->gc.direction_output = sa1111_gpio_direction_output;
 	sachip->gc.get = sa1111_gpio_get;
-	sachip->gc.set = sa1111_gpio_set;
+	sachip->gc.set_rv = sa1111_gpio_set;
 	sachip->gc.set_multiple = sa1111_gpio_set_multiple;
 	sachip->gc.to_irq = sa1111_gpio_to_irq;
 	sachip->gc.base = -1;

-- 
2.45.2

