Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DFE26983E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392530; cv=none; b=tsPZODsTuBCtNqjGSf7PsnP0N79PwEQQm3kWDApXWP/rToaTMYdND7wjkta4aVhM2w9YwvACLI+WTuY/GP1lhkHKik2ncrmQ9cFIhdNViCfEHvQmqB57MNsH4CureMkgSr0ZQBW3HtxygkInwBdi1I19ia4Bu+0nUJ6Ja71FQDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392530; c=relaxed/simple;
	bh=dRmgJRa861MmI7blzQlLwpGi6JFHMnyAWY0K50sqM2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZ8yUIsUfV2u0CJoqIe4nS+4IQa0pZlEkUB9iKeZyLiBvi8OhGnAvzxXFfL27kYTyCVHPvJZTWgO6XohmbWIELAttI1ZazEQh0+MA8gAEtZyjXTxFlRIpCxQX2pHxuWFDXSev+QrnWtvO1aqfIXwslgsCp9kDrpgWaJoEe9d1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nANj4de8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nANj4de8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c1389so4467055f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392526; x=1745997326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=nANj4de82SsjnCkhPuDL7SHPTXUSjaVsPwVhpcApbskINOGTGOra7rZ/kW/0xeCJIc
         30RrWf/4woyVQm95rPt2TqepHHBltrPg4TZWQQSD49AU2HCnSqfMdNga/z67FJSnWcgo
         +Y030nBkiJ+8DP915XbWfdKGb2zpIUPff0tVpgUOb2HP5jUyCapExwT3RlfNq68A/8ba
         KRgEs+tiMT1NyL/6WCWcafXazVtUcAoAJOS6FIdrfoqVV7RHrbldbJs9/5QT0AWhQdoa
         gbsp3wSEQa/eyYC5eYD0kkKu2AqNn8A3CPcf1qgsFGvtyIBbuVc4XVf7Nunf0cAcCxWl
         HwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392526; x=1745997326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ir3eyI8qcGGsO3Ggl/orTJMx3W1xOxCUBEIWWxHP8U=;
        b=c842HpRBemGU73Kgrg7QDZ5fcQfB0nSjQgwaD4VnuhY1bNkTLzueDXBn+2YycYVwYW
         h0d5zIf12diJ66C7+veCbC26oIXRyFdYErMLukkDxa55szLri9ROp4qEQGd+QThFRMDM
         MuLVE4lxVba6hq4OJqxPhwiPBnC5bSLoEyFt90Otu3gCu7dFISOldm9tp7Uji+CFhZKc
         YYzlYy8lav6pj9LJL3GRJcvY5BYptqe/UWC5X6V17OtcHku97Yr7sRyiHOxV5xh9XUMX
         Pc7U7xpvZkklFqyE6DLasyDCvYvtdK28uRdISuwsuhHQebyHSnyaPTAgTjvPz3+Y+Nq/
         +nEg==
X-Forwarded-Encrypted: i=1; AJvYcCUZG7Mgm5IUzNf6y71sMD31AZYoPr/fGp4/RTI/BuTYJX7TonMB0lOBQC/dkr8MrQ6g2Nl400RyJ1q3VHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DT4QTXsYj3brlQxY1lY1irCXGphn6lUuzv1WRea9UFNcc7Ii
	eNjdGhusafyJxR8W99QGChW7Ua/oXPy9K/p4maZTl/9fWDT9UQ/uRHk6La7XpCM=
X-Gm-Gg: ASbGncsqDI3j5LwZHyLKdsvqNdHCEwfAWC2bYAJvGiQd3yk4GrBm1gHi92G/7h1B7nT
	LZkdTDenU0qZ33XqqRh801SIF74FDBn1icgV1wpEkBEP9tJg/K7Fv4SxDbf02BKHmGg+N/1kM0J
	E/ZmNhrQzJyK+en4rSz67aKuY3wCtbM/yRxvI6MUp+PbzgaQqkxXMd6q5WAHzO8h9FyQt3qAjYU
	EiDuQApXVtNEoDX0FR4LqnD+FKXnqnOKTgK59a+hrEYCYEPvXEObYs/F9Hk0KFX+XviDHtXpJaF
	iw+Vkm7JcpRv5+0Ey7QcFJlvL/YKrWVt4g==
X-Google-Smtp-Source: AGHT+IF6SVfs8RHa2BnADJcSY6J1I9halvCK1KnXR67dc661aBEXTvglED7nQaJPJMMIX/l2j+WJCw==
X-Received: by 2002:a05:6000:c08:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a065bc358amr1886761f8f.35.1745392525708;
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:11 +0200
Subject: [PATCH 09/12] gpio: logicvc: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-9-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uEXyapUiU2zuU+gAX/AtJAOANlE8Iy85z/xFY4aI4tc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCCFWE0JSqUtSesVr7mzuU1M/ku4tksaurU
 rUbPU9KQmOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 cmecD/oDvN3BKxrxrluO97/IgXHtepSYXO/eBzaKqLSk46iZdLfN1ELs7wHsUUCRmq2Hcej463z
 TxWtZwr07ZL908O8pz8zRVVcnJO1yFup+nI+BE7cZ4T7/Pj19/VGw1ho5Th1IVliSLTPDxKv3wE
 UV75Y1wlMk68b6hXi8hM23v4fz6OXZgdEVCnYPAxYhtntLyBaB4BtG+ThkjKk6d4ss+PUJ17Gdk
 EyPqUiuMp1mEwIusQp7OsSs4yIpAHNJhCDzNJ/uRmyPQ1f2yXkEz2FVHWApJJxXonw1VRWvpFLq
 ZG8F8Bk+K0XoBf++3dofAzsCvMyggHSEyAewsW0QmB8skAO926oR8QpVD9gstdjpzKls8ei2q9W
 Xg9m3Lcquv19Yw9wnZFpRpnNn+XtgJ4cj+83IztRU33NvxcbvFbB9Z9XMNcBj9sz0iAgA6txYgw
 h5wILlAHqzeoFU7ibGssNASTrg8bH0JSP0ViL5PctN/ye5/i1xGUryRXb650M4S6KRQCSjgL/VK
 i0RmEiBUqd0Dvr2K5qGV16O1j39J7oVtu60wglI9huydbBqbJG3pMQvi8Bae5FR1Zdj6/a+GLdJ
 Lcqd053up9xLuw11VFAGN9he49iS8D/z83e2oMdox2G/EHa7hq+p5yQKWQz9+oNDKRmkWne24k1
 NSW65Qz796zVw2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-logicvc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index 05d62011f335..19cd2847467c 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -61,23 +61,22 @@ static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(value & bit);
 }
 
-static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int logicvc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
 	unsigned int reg, bit;
 
 	logicvc_gpio_offset(logicvc, offset, &reg, &bit);
 
-	regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
+	return regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
 }
 
 static int logicvc_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned offset, int value)
 {
 	/* Pins are always configured as output, so just set the value. */
-	logicvc_gpio_set(chip, offset, value);
-
-	return 0;
+	return logicvc_gpio_set(chip, offset, value);
 }
 
 static struct regmap_config logicvc_gpio_regmap_config = {
@@ -135,7 +134,7 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 	logicvc->chip.ngpio = LOGICVC_CTRL_GPIO_BITS +
 			      LOGICVC_POWER_CTRL_GPIO_BITS;
 	logicvc->chip.get = logicvc_gpio_get;
-	logicvc->chip.set = logicvc_gpio_set;
+	logicvc->chip.set_rv = logicvc_gpio_set;
 	logicvc->chip.direction_output = logicvc_gpio_direction_output;
 
 	return devm_gpiochip_add_data(dev, &logicvc->chip, logicvc);

-- 
2.45.2

