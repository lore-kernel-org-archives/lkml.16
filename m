Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE302066D7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275811; cv=none; b=EDocXKRHg8q4wQchwy5gYAcYzAllwEfsC61p/u7NeBuOxWmV+PhCT8qLm/zvQ5FB5XBPTMtC6aobFRp9vhQHWVOCnaN3x9r0nxpRfmAboI4bTVzNLUpmiIb8WgKKqNO2EWX7AM+zENHOqe95U6mSax9+v2gl51kpDN0EfS9vC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275811; c=relaxed/simple;
	bh=zsSWhWJja5bjynEs4UeWrPkKMTggjfp9Yk48/oxvSbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdWODS7bYGahFJZtKqsKCnDWWAiXjpefTSECkFLzhtMDTJmK8O/maMJW5pVEEzDdj2Kd6ScLUyVcIIc1bnR82bKxjEyGCqYVv69aSm+54Z85LyIBhkTjNHRc9XTLR6WEcfoXdMUt0ITqi31AiV+rUlgcJumMQzncsnylJd5UgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lEoUAoGy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lEoUAoGy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-439473da55aso12431585e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275806; x=1739880606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flGMeg5VushkPeMvEbQ8kx2w4d/f13NaDyOkOchHg9U=;
        b=lEoUAoGyb48BIo27r8qgfQKsPF48/7OYnHiIp5q941FoQRIpAplVsm67wGtgOJ1HDo
         dDUJyBKzKwBrZhEkFcrPH4w+WL/mzy9XBwgIbsQgGxSRf7SUEl+7Pq7k84PPZ0b+H6nK
         jJ/sHJRA+74FYoOBmVAu8/bo6NTP8NkzvSzlN4Ufkr/syZJ67f8kag7DYChrZ1kT//Ln
         DDO9Nff+w/o8oY+ngl7uLzUoF5kcSe3fndC191TGV3RVPkK56VLVaI3PPOXLQaoqOEh6
         OvtsSv8ndlnsNwMPf9KZppOcwA5/Cw8Yjfid2GGHq7QiKzK6778VwHxhh8niydlOetds
         ABJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275806; x=1739880606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flGMeg5VushkPeMvEbQ8kx2w4d/f13NaDyOkOchHg9U=;
        b=YiwB8OiNepWSEd4z9XqblcYeH3qUYJvrPPyvBYRuY8tdw1qTaEn/TiDj4ksQJqygCN
         AMHf4R/IKPLNFJbTyNxg7lon3EZuuuO02mNJMekEx0p8qkpAUVVkCIvp3TLZSwHHXmdD
         +k3w7SgdKfrjBap5unZFsmimM8z31qbJUBcfSrvn/0nIvDm7tzsMm7ixvaRoXHV3MKxr
         IRUYGkZOcBEZzzPiWvRTchU3bM5j4qMQu5Uc5QyncNe2mQ648WdUXJm6hA5zLtEi2Goc
         ZkeAasiCgR+/inmr3ocH/nLlnHEpobAmuBJ/GFO6CWOfECAJBx1dR3Pv7G4sONpkv8OI
         OhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH6AwodmYW/fTrS+zs+Ruzfu7EBAVyD6c59/774use/EmuL/hd26R2AobqKkZpds9cltjLzpcRTpA0sMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIacJXj38WrshDAuTWBKRETgGNZyTTKKhquSyE9ROirm7MG1fR
	qS3Qo43q0eBl3FqB1T7XNUPaXwiIQTYoMQ0UWXCwzHXvi/KFCzYNJewVMWbCcbI=
X-Gm-Gg: ASbGncuOq466mZ6BrOucgppMOuLqQuxSYAhjyJRUYm3QQRHWODB8mSJOIRFb8lOyUGT
	u0vZjuL8h8euWIxzfhM4eZM7cQokKpOidNurkcNWseaSiO0eG79NxEg4s9Xvs3SWQaaN/XXbcGw
	5HBZhIchsTt7c1k+ZRq7jSNl4m4HrRD0fVNIlHgcp6us9m6i6trw4xHyutGXqt2VdpIIoEgRlq5
	kaWKRbHrDQ8f0xF6GNrJJm7qzBVg737sn0G6hZmWfdEKi8gCEjVc5D6mcRPP6NoCp0Qu+cVb04R
	54fjnW4=
X-Google-Smtp-Source: AGHT+IHTtUOjwp2MTisEoq2qXc8kpIkQePo/nqKya2pkK2EtTcQmJ7kE6tNedkI1/cyWmwMVryFVRQ==
X-Received: by 2002:a5d:64af:0:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-38dd0cb6a75mr12035035f8f.22.1739275806467;
        Tue, 11 Feb 2025 04:10:06 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:39 +0100
Subject: [PATCH 05/14] gpio: sim: use value returning setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-5-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qgip9bWI/vEDIjIxM48q+Vgy3ZpuucV2NIkQXo3Sfzw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4WLpbRPKvx2jxe9bpfi1dULTAbOwUCmEDdB
 m+aroirElqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 ctTsD/9hMGs8OBSM9c9QKMIU2N3W76nYowAseouI1RyUA+FmKsmnaU3/CjwEsNWSIRf2x2yciiz
 Vm97XxNXAsA1okzFjOPiKohXvzs5Ky0icjQZ0YNa62rWPGkDoHxukLyBpo6wJB/zZ0y2yiEML9z
 QRSZqM2RSVlJTnMLkF4anwAzg1M6fxekE/7LCvRLVcLOEEdDJvqZxT2YJcnsTWROiLDitisSejF
 zzVo+ez96hnJ5EKZitr8wZtpdiOMDDbwxQ0H6uiIKxaFspsTKqhDym2FhIhuOs43+MjgDT4iGeD
 rLpGRBi6feGA6xeG21X7XDzt3KtTGTWn3q5cpFwesaQ1cnYU64wMNlMZnu5NHPA56S4HAyUeisN
 b3w3ghuwseF1cPCygDHekCzQ5aSP8tfwaMou8mxUTJEL1CMfnqyoHzoxr5b8k3CPhAsgFhaiHSW
 dc5kQvu1a38iNssF11z24EqtRaw21yUZiMS2s3M5spL5RVJPtui4eqFX3+HK3IGIbKApgZU6sNP
 OHGZ/+mnO1nPcum/PvH+a2YjJlZiQwThnPXvMh3fWadt9K2RaUcG0BZfd5dWuPg9weH8wQXLK7N
 E5U0pdUYhRA2/nLG1s4Tsr93VxyxYXC1gw2lXCIoej+/rAj8INQgbfTNDFoZbXRlCGHLRZVT/yL
 dMcI6BRNXB752mg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index b6c230fab840..b3baa7e872bd 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -119,12 +119,14 @@ static int gpio_sim_get(struct gpio_chip *gc, unsigned int offset)
 	return !!test_bit(offset, chip->value_map);
 }
 
-static void gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	scoped_guard(mutex, &chip->lock)
 		__assign_bit(offset, chip->value_map, value);
+
+	return 0;
 }
 
 static int gpio_sim_get_multiple(struct gpio_chip *gc,
@@ -138,14 +140,16 @@ static int gpio_sim_get_multiple(struct gpio_chip *gc,
 	return 0;
 }
 
-static void gpio_sim_set_multiple(struct gpio_chip *gc,
-				  unsigned long *mask, unsigned long *bits)
+static int gpio_sim_set_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	scoped_guard(mutex, &chip->lock)
 		bitmap_replace(chip->value_map, chip->value_map, bits, mask,
 			       gc->ngpio);
+
+	return 0;
 }
 
 static int gpio_sim_direction_output(struct gpio_chip *gc,
@@ -481,9 +485,9 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	gc->parent = dev;
 	gc->fwnode = swnode;
 	gc->get = gpio_sim_get;
-	gc->set = gpio_sim_set;
+	gc->set_rv = gpio_sim_set;
 	gc->get_multiple = gpio_sim_get_multiple;
-	gc->set_multiple = gpio_sim_set_multiple;
+	gc->set_multiple_rv = gpio_sim_set_multiple;
 	gc->direction_output = gpio_sim_direction_output;
 	gc->direction_input = gpio_sim_direction_input;
 	gc->get_direction = gpio_sim_get_direction;

-- 
2.45.2

