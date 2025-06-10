Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA44295503
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558809; cv=none; b=BcqSkldjB69xgK7ZB4is4pQrIh/t9L0L6L4UfTUE3E50hWnGL3zFa4KpMxEiApM1SFc/QTapVJbcP68P2dlDsMEw1L5FFwbvTtokP4ch6tMu/6DD0p5NXLX5i8VArVcZ6SEb3cc0f/3RIUR3r0BUNfUBUztp4vpkH8juMWyMgMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558809; c=relaxed/simple;
	bh=6BpgFh0LqV1277QiqqV3R/j3rXXsCtZx4vsfZiGtS2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhj2UFTj5f/1BbZZANXEHsAj7dCHkw2j2Nt4aNBxvqRxNEAwjFnrlnxCxxORjsV+0TI7OssAGofWMyQ/J2q+bTA93vxgbQnCMtXrglwH628jnuMuNf9UN+FVtKHVnO02A7rIyUpCTuhDI8BbR9lvKuwQ7Qe80z/JiEnzCRRAkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y0XpqieW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y0XpqieW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4517466f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558806; x=1750163606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=y0XpqieWv2yl49aNAzbnAc6MNZ86KTpkeE/vD9s5uGFOBDxdH6xxfds6AEyI1PRcaA
         YQpnZa0EYYCrlEuD674mdBz9zmZxQcNOl5U2got+wS3xw892V3636kPZm6QL7c0HH20f
         TY2P1GAIZ/FKsw5keGqvLgqc8+S8Pdekewv6QeMorHj7yvgx9oVzzr6/a/0Cjj4F3t1q
         l0E7zTf2G/s454mkfM2tuJ6hvNXULUZaR3gemnWer/is/8cOwQCUwP3plnpIRy9mr/ok
         st19dHzmJRGUQCBrpjKHrYdd1MNjvKlkwojaXr0doIOo2bXegidBAnxttRF2orOX2qdc
         ftEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558806; x=1750163606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=Ptgn4yrcjn4DaDVv6XNAwdYiM5QSP31ukExuxwamR0FjKG+gyuXrMU0kPZCttSbB8c
         wxcRDevn8n7Vpl0z62+PzkeqpRA3bHIGqkIlm4RX+ZxTUiH+hKZRjUhnQfCyILNH1A/8
         suvlPv2H3GT01uMLUuplBSnm53MZqhSmzUi7kQrnG96jqG+NhqDqUe0XH8yyEtxbRSCu
         obnktHn0g4R+6LW97asugz3AjMZYqLQfyeYv0twCqO/xQjxlA85crqYwydk8bqnlsK6O
         txV0Y8GpNQzdZz/TEyQMFWRVnwsXzH0fKO6eKGRSxSE2QK5pRdI84YfEQQcOTY6n/RWs
         Kjqw==
X-Forwarded-Encrypted: i=1; AJvYcCXP2t5haNqUeBta06865/ifEsqAbtlOuUpZU6CGHr6BasxYmyqINR9W+YX6HaiILBFoOu4ijLJd93Fdf7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRPbMexFwf3cU3yfnQf1VogNSbOS/99WVOpkl/E9aX9lz1o9Is
	zBAiWNMm09N+SO68dcqCGlGm/mXdi6qL3w639lrIM2NQc5irg0R+nGW6EX7eZ6YGc30=
X-Gm-Gg: ASbGncueOzHzjGntXTmoQxn93GvFwJ75tIHVNJh36wTqCB8XVXeKZvc3VxqGdxAfk5T
	ML4dxtks9nnQWUfHdRNJmQXNNLGtPQMU1alCUlkmYyRqRqh27HEjYPTkxX/gHRtl7GTrWWH+JWN
	+4sf5kgIpnyyflQTSw6jjW1JpQczz6nhNpVDQIExGgH+ZWKd0xkpI0Ng2+E1/cVLRIrcjouaavX
	r/wD0WdWSKP2osvWadn/CPjxCDzrzqFEfor82+5r+e25j6en1pB6p5DRpwgr7XVxIsYVOAXLE7D
	RjdqvwmJtK7TGsZVgVlif8XFcWUNhImKszP4/5kZD8goVn3s5urcNQ==
X-Google-Smtp-Source: AGHT+IG10zG//yZ1b7GgucOGjVy/SV3P0HD9SPfMOme6APoyX0obpAM9Jiyhiw0LZzEqu8UJWmYDxg==
X-Received: by 2002:a05:6000:220d:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a531ce74b9mr14483221f8f.55.1749558805718;
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:13 +0200
Subject: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cJsz4ZGd9pC00Thnt+wIQZLp3beAzLcJOBBw0b6Px/s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYO3xnpUc/3u6ssQztvReVrCU8Qq6iiPbgtP
 Z3BmL+TVB2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cgezEADSssm46y31itfRn2QsV4tDRq/1Gvqk5nge7CWtX/usrhs/bK6sOyunBzV2g22yTs/iS3R
 /jcDfbiyCX0hofwExZyBaO6DbsNNGjbsHC8Y9E/WgfQoP808ECbR5jwqWJrOxoDZVIyJNzc6hK5
 olsmhMMw3rIUyfj9aKq5yv4XPuDmSk4ej/ZU1QrqEW0HqEcusEtYAVPi8b/f20VqWqhPsmxv/M+
 ybJk5xp+Q7PkxVKqrK8HwGRzVWlK7cAJUdGO3sRoN+BRPxG3x7XlfUMQHTdddkZGn4OfJf3Nihp
 x9FXOs4fh7m2+AbBNMRNtpLvNa3OuwWuqb8yx1m1ccM7OMpKokqDQiVap9+6bI9y8/CCg5MXOaF
 zf9VR/ogGqpBWtbCiRcOMHo+tMymgF2DsMNHobIwyukBOTY/dg9mok5PIBarL7DrEjmYtSuSMmi
 cR8DEjx8jynKaZuxFTxBQ3ta0s2sUk/h8dmx4KcaVMFAJLzGhm1E0sWKtS/Nos6JjmmjP0KMR1y
 Bbej6eKROTskkW5Fg2F4qL6qf5JfU5C+hpwYN3OEnSgAf54LKIBW0uTweVwGYju5nUEh4Tf8Yiz
 et0rvViK6DvnwoqFOtj5/Fg8i2xE3EpT6OYe9eBqxrkMe/ynuQyCXUbnFLXn45a8ZsWshT4g4FP
 1RApJSs+DO1jHdA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-moxtet.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 61f9efd6c64fb4babef5551fb2541659bf5a542b..27dd9c3e7b7717d43cad3d4c6de019c9401d05c7 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -52,15 +52,15 @@ static int moxtet_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 	return !!(ret & BIT(offset));
 }
 
-static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				  int val)
+static int moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				 int val)
 {
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 	int state;
 
 	state = moxtet_device_written(chip->dev);
 	if (state < 0)
-		return;
+		return state;
 
 	offset -= MOXTET_GPIO_INPUTS;
 
@@ -69,7 +69,7 @@ static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	else
 		state &= ~BIT(offset);
 
-	moxtet_device_write(chip->dev, state);
+	return moxtet_device_write(chip->dev, state);
 }
 
 static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -104,13 +104,11 @@ static int moxtet_gpio_direction_output(struct gpio_chip *gc,
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 
 	if (chip->desc->out_mask & BIT(offset))
-		moxtet_gpio_set_value(gc, offset, val);
+		return moxtet_gpio_set_value(gc, offset, val);
 	else if (chip->desc->in_mask & BIT(offset))
 		return -ENOTSUPP;
-	else
-		return -EINVAL;
 
-	return 0;
+	return -EINVAL;
 }
 
 static int moxtet_gpio_probe(struct device *dev)
@@ -142,7 +140,7 @@ static int moxtet_gpio_probe(struct device *dev)
 	chip->gpio_chip.direction_input = moxtet_gpio_direction_input;
 	chip->gpio_chip.direction_output = moxtet_gpio_direction_output;
 	chip->gpio_chip.get = moxtet_gpio_get_value;
-	chip->gpio_chip.set = moxtet_gpio_set_value;
+	chip->gpio_chip.set_rv = moxtet_gpio_set_value;
 	chip->gpio_chip.base = -1;
 
 	chip->gpio_chip.ngpio = MOXTET_GPIO_NGPIOS;

-- 
2.48.1

