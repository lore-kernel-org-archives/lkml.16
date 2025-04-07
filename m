Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362D226170
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009772; cv=none; b=E49FNGJmq2GLTosU9Cgkt2w4jsFTMCjuQ4AhTPu6bPe5QRGfj7FEgOjtnp/qEToFifj+u0lFLhP8x57Q1Cv3P7+fQ8N5bHWzOEwwT/JXFUUqApw23O1p7VtMC2donQ1gCEVjnKxOYs9mJgiAYipTvzM+XNrQUtB7VbFMGsNpdYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009772; c=relaxed/simple;
	bh=Xs8kT13TgDgVr1qQQSggiPnN5GRLN0/V9PojPokFU8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHtSKE9kifY8sS/D/pWKZ2gpheu/OlUHYceylgcoyOXc/i5tXqz2bVmXyCG8G98GCgl/4ld5QTPeDx1UReXdkxx27ZIqRx+Oo6jtewQtKY3Y8iVkZUgeqGdh3oaKSuA55tyBlgrPYyZR23ffDfr6920Tg1mshBKfLobvcbjpyMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SLtCwcNi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SLtCwcNi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ede096d73so12713705e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009769; x=1744614569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=;
        b=SLtCwcNiO8bPbKD+/yFoDWx3A55MuLsnCvTZBtUQ0jDqPlYz4HkLJiIFjZH7UkC5Er
         SVliZDQZQ7L4zNAdx9CE92503bWyi0XYQ6HFIYW12764b44d8+vRjm0fpjJ25VNb6O8J
         3SZGgRDWctv5ix8GZ9gobuLf/2BZLKiP9q0Ja/X13uNQ7V216yOGFHguDMWVRxc6dDoK
         RFMC98xUZIXjc2upNQ/f3KMkpNXKCKr6mkSvzzTjxEKHTyXV+eQKq//PW7hVshTYdAjq
         CghiMQSm31bBEHeqrEb1CWGDwFuzjq3zj02ZelfmR/dR7G67ILR4NincTc46y+ihXjUA
         ODSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009769; x=1744614569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=;
        b=BkhU4yF1e/UQbbV3pyp0nITW580AAGNaNoQCMlrGF3A5i2fuT54LnQ0NozfPIppTwn
         kVYKyf6crme6MHrX6qBo5IXhHtL6CrtpjUjGOdook1kByfjzIl3XlLza2z1gV0UNaTsW
         s3U69CEvgSQo6RA9iOWoGzoYx6KJBYxga+soQTj9KHyAvdwKyOLSAP81S+S2I/IXGXpA
         +hmToYNzJI7HcLm9ErX411dy2HdkYvjE8SzrZTOQd1ifF33Q2YEXZa5L7iXheaFVSpZp
         U6G2G8IhkZ5vPd/oHy3BNABlzfJqu25cwy37KeLeUAhYhQUFRHymqrX0orHX72iGuTsH
         dW9g==
X-Forwarded-Encrypted: i=1; AJvYcCUbYUW3vd+pfXdxSMsJGTiL0uEj3fvvSUvq2Wj3u6ykCxzRM5w/0RVsYLX5ap5I9ZrEZPyGAkFyd4UoT0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp8qvOSeTGxgL9U0dJOOkYYU8kzJHDw9zogIzLWnEp9+h4/wIg
	K0mqE1iFsJyo8xax+kxYGojHWRM01v6ppwREwgV9xsE64bS6MeGRdHM0DclvbZI=
X-Gm-Gg: ASbGnctOQsDRa2PWENTy4L/IoL53gnMBD5p0XYED9MlwxDCNr8T+0tf7aBX655hPD56
	KIvHz0nrr1iWPHQbH2U1gW8m09t+MHqfho0ri+7t91Pakmuy5vvhYJvgwkJLt6VLO9B9iUR2mvu
	6TBBPGGYnheNbyFVbPXRMDxAIHYT1MoDPh8tPJtQTfc7koLWkx6iv+UlWuSylro4htwohPEY7Zo
	skkaCOWftIssyefhpHkIo0DB5EqOyDb4f04QvafXeebxtCRVPp2M47FHokBJ3zrwrXVdl4O+3s2
	DciPKUJZBhoF/eizoeUaQ0IIxCTvBjPAKYmUwQ==
X-Google-Smtp-Source: AGHT+IFoq+Y3x3L+TzUAPfnpayxhMl0EXTH8ChvoeKZsiBjolFAg72wzCsqeqv6HGqtEWqKDzyAzpA==
X-Received: by 2002:a05:600c:5394:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-43ed0db4aa5mr81239825e9.32.1744009769231;
        Mon, 07 Apr 2025 00:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:21 +0200
Subject: [PATCH 4/4] ARM: s3c/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-4-9e4a914c7fd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=abv30zYA5XuyGwoeP1ru48ZEwjgixTtNG3nmu6YE3a4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83oktedBQx8pZUxbFWhdPQr1mhvAceAMNekvM
 eg9/SFm5bCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6JAAKCRARpy6gFHHX
 cr4uD/920+W4HTn/DythHwMtCVrHef5JpB0YFglUyOJ4l+wrZNhV0VZcDRiw3F4l9uygDSEhyso
 biZUtfnWodZkYBVGq/dILl7oXl7vF8oWyBJBOzWK3dQxlFdzjiwjxS61wFDTiJtDqrwoHDBGvTP
 cdZzcOKwYrcWrxD1m8tsHEr4sYBaocCBaMA2DwOBsmTMuwLcnEhYE5HaoI7qjMdz+F5QjH+F5lT
 F4ogzhuGDbEZ6J5R06tmUkVr48izLrPyCCplJRhaREIq62mx+mTilrFqFpqxB2iDdfr46vmCzuJ
 7xIvHs5P4COrgPm6/I5bKr+h3+1VzO7HQFBoDKY2Xuzejttwa3sTTD2RzFuKJiHYYkQM0Oxw178
 Evb4gwQE/VxyQWocnlavibF52tIaBu3yLnHlf677OVaESjEllEOiw4lWfYVjj0vfVMDeR1OMO1/
 +KBoC+MsYFiv2hkzvDRonuAMQITxCp1ygc3x2w6s9X7KYWS1CkudDWlCs/NRSMobunZUcYUkspl
 nsvorsS0oxCLJ07Oetc1JL7Q7A9uln5YELWlRQEIIT8hUBtLX7zVdJtvH6QwPqg5flDaNLjrTz/
 O4tqaQq1mIozfl75z4Xn3k4+O6OudAZzvKN7VnXBJAK8HhrKrll2cDu2DajhxBcH61elXnqtFyn
 KFr7Ne2L2ryXdeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..ea496958f488 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -430,8 +430,8 @@ static int samsung_gpiolib_4bit2_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void samsung_gpiolib_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int samsung_gpiolib_set(struct gpio_chip *chip, unsigned int offset,
+			       int value)
 {
 	struct samsung_gpio_chip *ourchip = to_samsung_gpio(chip);
 	void __iomem *base = ourchip->base;
@@ -447,6 +447,8 @@ static void samsung_gpiolib_set(struct gpio_chip *chip,
 	__raw_writel(dat, base + 0x04);
 
 	samsung_gpio_unlock(ourchip, flags);
+
+	return 0;
 }
 
 static int samsung_gpiolib_get(struct gpio_chip *chip, unsigned offset)
@@ -515,7 +517,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 	if (!gc->direction_output)
 		gc->direction_output = samsung_gpiolib_2bit_output;
 	if (!gc->set)
-		gc->set = samsung_gpiolib_set;
+		gc->set_rv = samsung_gpiolib_set;
 	if (!gc->get)
 		gc->get = samsung_gpiolib_get;
 

-- 
2.45.2

