Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C32E7642
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163092; cv=none; b=BQOOF3kaFpyaQoiMB5pFRrZZYeHo6qqSlbmlcq3U5fJcXefcl2aCb4i9dTPiKrMHru0JkAqJ9eZOOyhTwiIoOtivwAN/OvoexYMVxT1IKAjscegfSB5juWt1pRmcud2ZEUiKv2hqtA3WJADfFg+/C609AxlGsVLYt2jw2QEfl64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163092; c=relaxed/simple;
	bh=TIbLTydFbIxMUGka9nMFS3KxZgZxnuWfV2GjJh3DcXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRNFjPeObHEDlLISTxdSV0+8lV2mDfsNAl/cFFNni+eBKeWjsWD66lhf2zr8A7amoqZY2OS05qIc1g19zU1W5Uv6JldDplE35n5MMxdOyM02NvoCA675qWA3mQVioh5RsaLz0HPjYRk301EVIhVFZ0+rwihTkzfA46mMq3cLwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HAf+3WaN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HAf+3WaN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4533bf4d817so18280405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163088; x=1750767888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=;
        b=HAf+3WaNaIkeA3s5LTvHxIKpT4cJOjuIY79m8X8/UKuupPtj5giANzCX4umC3igcKq
         oOShmMpcIwZSXJEUXD/7VEE35CB/YPOGEu9soY1Z1Ihm5+pIIbzDQmMghLN4PZcubMUu
         U7/Mn8/QCXizn/yeFzqJCb3n+ls0TmyNU4BVVPNKExbst4zipJ00lXVe3vePT7qC2YuU
         eHo+lxt1Su3NXeNOdo2+JciDp28Z4jTxP26c+4af0ipd4nbSYWCrCtAkrXqefQ9qE2lF
         DQGCpp5lYnH9Kbq7l3RLBsv1Cr7dDZJ6ABenqRD1gVDw/5hXJaSXT4vegB9NtGUQL0bb
         dU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163088; x=1750767888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBA3kzrSkCDXqL/qmFtpqMrbH8iiG3hu1F80uNaFdYQ=;
        b=MlBESX2XZS0nW+Canh/KoyXIEmfvpA2OHG1qlwNTrCdtUGhXf67fiQa/s0W7wNhTba
         0nJc7Q5VnNLtQ9wU6THlL1UkQWe+sIOalvLuKjU8Sf4oCj/3CWmrXKXl3d0Jc6d/bN40
         jUNKLYUZLEAI7jWTDUB8MHYDO3MWTY8moMgGCLM3ERD8zyl4LQwKFI48lfVzJ1mriASK
         sasxijbYZo2WABdgF8dld7SjSJIAuK70eFN23Ug+0XZv7CdUNnocLrBiGb1R758tJ+Cl
         Ex4yX5WfE6DzAfMPseSEKI9QBt3j+fKi7Y319ScO9hqyKAVd1mlQRVXhz2Mx3fCQDOi1
         F69g==
X-Forwarded-Encrypted: i=1; AJvYcCUrgG907MnWHgZZOp8zCrzUPKMCFFPgSMHIMeYREVEShKwQcW5cTTr/VeOG1nXQFwPU8mfdoO3xQjRSgpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01gYY1RB22/PhAnammgynbYYk2VO/xkxp7/Ql9y3h6UZg+TxC
	PlammHZQ+11Lu7oSxdooKHwLexiapE4iwz1H4aQdiM1f8Y4SjL4ltdap66tAv8L8rRoBHTDZOkf
	SogoASMQ=
X-Gm-Gg: ASbGncuqZkzgG8TuIL1pJ3RMSS7LowWV2Mot/Pk+X6Q0kQnmTRcDVRmspS9JxGmS9E+
	ZrS8HWKvFmZ91Mpo2IK6dmksPBQeYqirWPuxeLUh+zLaZwyTqVcEmJP45AGuXaQTWuqdjfofVbc
	xwPr6Oh65jIBKSBOqudpk2W0o9dU3ghOgm7G6LeTT1O0pe6HQqJLk7HHN6oTcirSHgJ1mPQRf/1
	fSbqrRrjr8szF/Je4Hx3C4zEW39UokgdfHoQKt9Jgd2adld7GltQBCEsar/yUi5fC8niTkCmYSt
	PCV2KkX/It3diaAuHuqMdH76h7UcDbf4tRPolhbAAwfgui034YO81P4y
X-Google-Smtp-Source: AGHT+IFM4CB6egWygK88t1cCzbwx8tBuCLfY0nKXhXb0rSxlnrlGoYbjnFIM6NMIfDKL54dPCw7nOA==
X-Received: by 2002:a05:600c:6989:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-4533ca54d9bmr129406995e9.11.1750163088388;
        Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:28 +0200
Subject: [PATCH 06/12] gpio: pxa: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-6-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=B+Qz2OspKJ91xFNTEdAqgmxdOA/mnHzp8sm3HNk30eo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6H5nCXll2tmzt32qwVJ5b3oXA1BlRJjKdG9
 qyMmbsQkzKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 crYrEACAJfGgkYJZ/u6TIzjXF0YEJwOtUfXB3u9+xQg83jnj0Sz1G2H/QIRldbaqCd8kUmXDI65
 U0eFZ619I553u6CBkPVrChl3ZZpXtUKtGWeB6ManlL30/0d31D70RtVTKbKWHN4SkTFXOUwr61V
 us0hdDZcVXONIlywiB7f9yUPaJb+SEygs3L2h2URtZ9XF7mwRvxRQVJ9HKe1sSnkEGczZDCQ+82
 Zi+gBEJnqqEK6cyMQmdBTYAPcSLi+GT5y6AHFGh50EKfqzjR9wEvwZ5E5GrfQM+SNxZVEXYL64v
 SbJH6gq+aHB9TwUiVoFRA6GI5ex4dq0Dx+R6b/k+ObpgcBKB0fCm5OCACmniQ4J0nHwpFNe69/Q
 0/MXLF/xPeNfTqpMFjRSoYsHf5OJTFyidc9WUKOkPWLakCilxZVYLXovCTdgyaGpr2u5H01mNFO
 gaTuYuqpVkMmeGw2KEwr4qaQaQeb+yBpGBcKNt6ntqnpsRfMz1sIgF4/s9yJZddJ9NOA8xWR/VN
 OXZ2p/rlEhoTCRH1kmNm6TqTFs72FvtA7UXobCt3Ya+NAIr6F7X9iLX0CEaY0w78ZnJWqkUxlBJ
 EQQaPvVZWslahNf+l5I7HxiDZ3oB5l6gkBTIG66RkME6zNBACqjO0X8zT1wS4UiXp+ChfLA8HBF
 /Ooc4sXgrvhot6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 131ab79ebce7555313fd93b3ebd80582d1b9327d..13f7da2a9486428bb8d1d44d2caf9f21f82cbca5 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -315,12 +315,14 @@ static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(gplr & GPIO_bit(offset));
 }
 
-static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pxa_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	void __iomem *base = gpio_bank_base(chip, offset);
 
 	writel_relaxed(GPIO_bit(offset),
 		       base + (value ? GPSR_OFFSET : GPCR_OFFSET));
+
+	return 0;
 }
 
 #ifdef CONFIG_OF_GPIO
@@ -353,7 +355,7 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio, void __iom
 	pchip->chip.direction_input  = pxa_gpio_direction_input;
 	pchip->chip.direction_output = pxa_gpio_direction_output;
 	pchip->chip.get = pxa_gpio_get;
-	pchip->chip.set = pxa_gpio_set;
+	pchip->chip.set_rv = pxa_gpio_set;
 	pchip->chip.to_irq = pxa_gpio_to_irq;
 	pchip->chip.ngpio = ngpio;
 	pchip->chip.request = gpiochip_generic_request;

-- 
2.48.1

