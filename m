Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009AC2BD58A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847626; cv=none; b=Rz2xrwoEfaV68yptt/RatohEV+pcq+IMEGMrDEYWXS05vorYPFGHp5EYK+i+gKMEZ4pt6/5RwZBW9B5T4shn7Adm+HIYt5gTD4Lwtrzrw7mRreHGQEh413lqjQxjF0gSbPtMbPDku67ME3WjiJRgUMMhNStEbIavzyLqnwZAwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847626; c=relaxed/simple;
	bh=729bTHeMbxQBEWcLQhpwWJ2bHQvRnqwTAVtSem1K0kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LedOqBGMhBEvhdqpv9lo1iQfrLG5aRJY0d8aGePN1FyEeJPpivkjEW+cTfMBFmEZH/sjOHIMzfZkemUQntZkevRNblJs2pLx1OCKFxDB8eZ8ogRoCymFlFCxxghstYIBc1yRGfoZsytwC54fd+lz5Qze5rjoXFgC2FkvHY8EynY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jlno8gm7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jlno8gm7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45348bff79fso68678655e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847623; x=1751452423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
        b=Jlno8gm7CFFi0GZCfZjZdluLwdqG2VBiuXElRNSfpi68cOZB7+fEfuZu58w4Ao0iCd
         d030vhujAcvvg047sVlLojsHtELsWIfthdGwpM5tvHTJpaAIvV2/J0vuG7vhbkdIJF7n
         PqxBoEJhazdV13qjoK7kB1SudLIok/iM7B4iUEN4fk2rIGMXJLxim5yKwXzJmpDiROfG
         SxbDgQWffhY42pldx1Qyb3WYMAW9u2UO8LCZfaEkYsltMVTI8LxHprvhG03B/Q0sxuN+
         ALfmLHqIHed/7EBdcHDQ3G/Dp68qpmzEv9ikwqpfZoHh+fxT740+z4w0jID9cAu3aJMt
         +kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847623; x=1751452423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU449U3rD07cot6WAW8djohd5BFLFtc92RhNFArY8gQ=;
        b=doPZZnVT2EeTLtjBAzG0uTbu1qeXftcqVP+Ol5bieVnQzTKBbqpY6zSE3xZ6/x3+3z
         VqUHyuX/Lnkc2ercZxpJL7YtY464sgRA2VhWJvKyotjgusMgHb+l1VjbZ+4m/Jc09z22
         gm+vlDnfJQk6ph5yx9wkgu9zammNj+4uKsUlKH8F1nPM6z5uR9+PCbs46WWj2uUQRTE4
         DpnSKIVJ/XJqWsW4djcCC6nu8ttrN2qwJ6iA4NaOVHmxPrb3NcyJq/bgXOJNZp+rIq/M
         jNLQErIfga82OYqNADlQeiTv+WcCAYNqlcIduj59Sv/ZuOJVrKCBZXEFFSSFCvKSdcuA
         0CiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1vYyMo1Na1oBhzFa7nLqz+49M0GzgiRjIkACe2VOtlgISFzRhEadakpRQ1jiPC1LjBs2S4Yom7rSpzBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uO+z1oMw8cBrQYvjiTcr4NlY5LCtlAtNxREEOza9kbAWHwel
	SsbPOoV/6/mf4Pt8jOj1VhDkLuS2aOyte5hJTKYm+UmK+PSDgs9vtyhRPTIqZGH/IDY=
X-Gm-Gg: ASbGnctUyRVHidYP11xjG/OBoo/EOelJtigZuJd0lX2tO3fSiClovPdTwnJnm9NmZ/u
	kwAyAghK8uPfypDb+sV3S7yDAm6BE6UP+xoGKzs9CUMWA+rkqgsGtledVM4dFjVHBrk3JNgp+4q
	tf6MLoMD+wdl5vUDnRUykAIXO8m+Sxi50ySnJvvP9PsIPDopYzVL/5GiVRelXnK3xIJVigtpO7K
	yvyMPlsXsVnOb4OKA+4nY35Px/Mm3K3EbLMQrVymnEQ0li4zyIOHCZOunutgT8R+A0874ZaDy+Y
	M+kFQxSc9NK0wTiI9TjtZ7k/prUGmz9Zm97aQ0rD5d2XH/GFRMlb875e
X-Google-Smtp-Source: AGHT+IExdKWHy0zZaVYCrqx+BP7uJ368HB9lkEt9PPvj6/TYCB40ZTHcV1Ct7Y5lmkJLBkvOCbR3KA==
X-Received: by 2002:a05:600c:4689:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453837b27admr15033695e9.19.1750847623364;
        Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:27 +0200
Subject: [PATCH 04/12] gpio: siox: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJcwe6Hr5XvIVx8G6ghZMJiYUF0XZL199iB3coJfAfk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+PQpCwI9SoOycpwUWmzmglijqLdeB/U5Eg
 kE1VEMdyMKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cuFFEADfNeOln1AAQDWFM9wsl7uEhDwfsbG71W4/R7OgBczrNFkK+UtKviXp2HJ9O01kv/hOWs7
 6EHhIBxDrY3pFDdCE+Wy+NSeUrjAmu+c6e318/1GLlFKuByq4RPXekslFzg6vFxqLpDcBZj90CU
 c1wUFWCZZtASvlEycZTrptz7iDoRsiWrrPfWbca1szxTMpwerPyUpMF0VrP36xurC6WQxW/1h4V
 Cq8YmYy3rwSH1f4uuM/kkAJe3bLS34cD0HuZjVpU5B/y4k5lwv57dve6LYSEU4Fy4eXI41eQwW2
 +Gpch2bEFZmJlkUth7pHVoLmFsvZQPMhWgw0A6jegQII82k8eM45CJRXZArNUsMPuJDlXur4HF+
 rBIwKFgRSKQzG7HhSE+xwKGkmdqCXc1C1Wn83SO0y+V3uvW91HAwGZZQOnG8CjBVdxdOcsh2pAx
 bealDn8ZLONkKw/5Z8zYQEtxUIP1bWTLUPoftc6X7gWjyZG8OX4vs8KCXh1isM5o+f7usuQNiYa
 vO4UW8hil77mCfWWx4yzX6r87ZS36V6WZqYWVgLkaCiN8/d4JG21eaKqPcLxX3E/veTMsMy/RTy
 4ZXlQq5YztpHNAInC0FbcAuM54PMNKASc4AGGwTpKZaAiFtsMzwBpcZ+uKxpP0+H7/IBsqKPnbb
 bsgrz1crt8iUXww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-siox.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 051bc99bdfb2aa3c8a382f773c5892fed6e0a8b3..95355dda621b40124f4702432565b7381c4e6686 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -160,8 +160,8 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void gpio_siox_set(struct gpio_chip *chip,
-			  unsigned int offset, int value)
+static int gpio_siox_set(struct gpio_chip *chip,
+			 unsigned int offset, int value)
 {
 	struct gpio_siox_ddata *ddata = gpiochip_get_data(chip);
 	u8 mask = 1 << (19 - offset);
@@ -174,6 +174,8 @@ static void gpio_siox_set(struct gpio_chip *chip,
 		ddata->setdata[0] &= ~mask;
 
 	mutex_unlock(&ddata->lock);
+
+	return 0;
 }
 
 static int gpio_siox_direction_input(struct gpio_chip *chip,
@@ -191,8 +193,7 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
 	if (offset < 12)
 		return -EINVAL;
 
-	gpio_siox_set(chip, offset, value);
-	return 0;
+	return gpio_siox_set(chip, offset, value);
 }
 
 static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -236,7 +237,7 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 	gc->get = gpio_siox_get;
-	gc->set = gpio_siox_set;
+	gc->set_rv = gpio_siox_set;
 	gc->direction_input = gpio_siox_direction_input;
 	gc->direction_output = gpio_siox_direction_output;
 	gc->get_direction = gpio_siox_get_direction;

-- 
2.48.1

