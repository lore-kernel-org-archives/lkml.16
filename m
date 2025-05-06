Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B97270EA1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522126; cv=none; b=nGQ27azMpFABTJqx7C8+td12xheW9vmQJZnBRssAFEcXdpr22RoqqZqmYTz7fQu+0i0Gm7TS5giHASB2SseJxgAuNqfLf3P54kSUsGwOb+ePXnfOYTyvhgydHRXf8ZLrTsIwGvHbIzLHjM7J4ul36Hg6sR3MDyCyQ9grTOhpZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522126; c=relaxed/simple;
	bh=JFsmM57P/O8V67mF5am73nGzAoBwKLj9GVKn594zJu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vt0o21ywFiitjm8C25NOi6s97ZByGBXbOkAaJ1vZbZNauxT6f4vn0dbGBKuh9zATwt4nV2z0szkSnZIKz+jcpgcPmKEKNBgI6T1CBystRX0a0zRc/XB8BbppPI53LB8Z1e+91pCZXIRoUpHLilwWYl7cTIQigppu1icfjUeRdDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KiqDPwVr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KiqDPwVr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf257158fso29118285e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522122; x=1747126922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RViy5sXSyCVllDQ7MtbJFUrGShqaZa6Mlg+17kGovwY=;
        b=KiqDPwVr/bqGRBpancIeuMJGK33ys3EC+5/gGnOiTmzlKk/K0VYeX8kgo15qFTHhay
         XgrnqhGnrGrcPS4vDQJIcAySVa5p4pWN2E5hnB7ov0rSYp4Wp/EY7rRjqs+iqQPE++SG
         8ZgvX2KGamktM4UK8AFz6Xm8wW+c1ro3KZYWC2QVVLqk1oxY2m7GsazjDHbdztfVOv1M
         tfT3Wlk0ROfCqBdcLzQlHivmYF1tlNyubmTaTg5pecI2t851kYxHjpgO6AIEJuaU0+3g
         jTpSOOw36aJTgwyrIlR4gzkA1KMEWDEStMTx3VbLwt6eQ/DZ/rjbAMXAsT66LffXiF5T
         gFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522122; x=1747126922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RViy5sXSyCVllDQ7MtbJFUrGShqaZa6Mlg+17kGovwY=;
        b=O/f9UKh6YmSe+PBc5mTnhncZvZxf//NF9rVpHVubADKthg7If3wAkoj/EJz5qq+hEa
         X4JSEbXS93B7HC6uP9wS5nXuKPc4/dOYk74y0sC+D0y7fvpGwgChEHWIMIFjjIMVm/iX
         3RkUURXDeyx+jZqHYggwJ67X7GiBFrrcGJu+nDasdCVeabUS13dixB8P3vE1EHnDg9Sp
         4ft3j/Nf194/SmoBSWchBQMcxHIeZP4mTWdvUfVU6NEFyzdJh4IcBfFC9j6G13+u+RLz
         +Rd2vHZmzMQMDRyB6D4GzrZ6yw0Zf3JrutTqjMy4g/kLLNNVEjxbeXI0fyEnfIqgQ7Dx
         mWWA==
X-Forwarded-Encrypted: i=1; AJvYcCU6wJNaop35jaHwI7KYHtm0mw54FVMhFOI6Zg8s2SQNMtajtXj3fPvO/XFBMBlsYfipF4f1arqhXO6Agvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykRndcxUWQ92tokLNnxsacsXPjHmL2mKZNI8GSe1jgf6dnpx3c
	p+2H4tk9zR7jLgYxN/FeaNagAgLM2byS1wKPFKwzAzAN5PEINdguD0gIBA36j4/zu+BV43DNQ4q
	z
X-Gm-Gg: ASbGncvPHv23iIHUJvB+E03YBBidmXzKN2jR8F08R57oIXDmWve9YAoPSfBlEBbY++f
	CdJwzwSJVoRu7gNlJIyLK9SiudcuB29epd+XI4e7c0pvXxlPPZXh1ljlmdTiW5sDpYdS1+9l039
	BlaGeIEYadDcueQdFJFScRbcWMLsubWyyq1PvTVGSHU4pjBs2U3plyfZuSqinQCLHQyZAxvdkim
	6Vi98xQ6tIPyisTrTEZTn6osfB9gD0ik0aAwAriPG4Modx7qiZQWochGrLkU9dMNrycPWFzrjda
	PpbgI5pShSvaSV1zAu4otQJzNAqVqe/A2l8=
X-Google-Smtp-Source: AGHT+IGdutjQDLWY4nxQmqNnyyXxS0dNKsu0ias92lCYMh/g/yYLkvUyWFqlVczz1tB/yWiChJXrVg==
X-Received: by 2002:a05:600c:1c9b:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-441d04fe785mr18148395e9.8.1746522122499;
        Tue, 06 May 2025 02:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:52 +0200
Subject: [PATCH 09/12] gpio: max77620: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-9-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N25xpJo8Wn4hKIWS80X1OeMM9GyN+r2jXu3hvoWtCc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//2ujX9nyCkowWcEn/X2y1T3zJBYnvdxiIf
 DI/74eJ1XSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 cglrD/9d2BqfRFTo/ZvbXdSOrxA5s7AwPuYI4BfypgQhHVodS2YDBzc38ssqw2XFiZLwZWBz3H1
 yT5wAUAQQWE5s9wPYMUmf1RoawcD7o1WoJQHOR8SBDCgNxqt6AAw5p3Upal0icQAj1onotwcC42
 oNnVxsffJn0EcIybOmVUS3TyWy//M9EPvurNHwQ1vHB57HsRCTqVyhlAVuSKDpPsUVQgJArFX/I
 24hJt5bDP3QjFBrYQdhuHUdaAT7Mebw5Pf8e2tAfjCmsWaVwl0B7Q/0lx+ER809GOfvtwmlr6dr
 e8+bhQwIDDfkfDahHnGbsvEpeFgNvweIilQIyD9TWa6E0gO9dF4Wt3MZBAbTlAXXLDIt9zvBDiV
 FHzaje/uSGCjxE9b56QumVVPfB/u60CwCfAGv30O1Ftc8Nlm+t7vPOHzSuCLvIwVIq0uBgCdXTx
 6vSsM1FOpiW8Wpxh1AVdHMAWNGJjhOMCjA9P/qc9UixgIihxDtU8XCvCGxjWNUkc3ozxh6LzXGz
 tRO2yeelJaxSePVRjF+pIuA7t4GLAlbuH7QCABaWhi9/cQI2fv557qemD5P1yTrLqvVyKzQP6fq
 lYkOBAWGLMIM+8AHGQ+5CXXpTGrzzE5LP/N0ABm64t1B3Uzn5AJ0cpN5WBiA5KuY61hBME/RAxd
 hntlJwr9tShuI5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max77620.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8c2a5609161fd..af7af8e40afe4 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -223,20 +223,17 @@ static int max77620_gpio_set_debounce(struct max77620_gpio *mgpio,
 	return ret;
 }
 
-static void max77620_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int max77620_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
 	u8 val;
-	int ret;
 
 	val = (value) ? MAX77620_CNFG_GPIO_OUTPUT_VAL_HIGH :
 				MAX77620_CNFG_GPIO_OUTPUT_VAL_LOW;
 
-	ret = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
-				 MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK, val);
-	if (ret < 0)
-		dev_err(mgpio->dev, "CNFG_GPIO_OUT update failed: %d\n", ret);
+	return regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
+				  MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK, val);
 }
 
 static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
@@ -314,7 +311,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
-	mgpio->gpio_chip.set = max77620_gpio_set;
+	mgpio->gpio_chip.set_rv = max77620_gpio_set;
 	mgpio->gpio_chip.set_config = max77620_gpio_set_config;
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;

-- 
2.45.2

