Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD76524502E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734145; cv=none; b=YlQ5GKv7h5Xhucpe2ezr00Izemux1D/5sj10VV1pOXOzvdvTlE4J1Hx8mdQuwDtDozV4v5u4bLV/stC+YWTJBx1wnhO3GXuPlvOtaPCLIh3rQplEph/iAEEJjcMOKxf67RLADAZjII1HUVHPVcWDYYa27+XbsNi9FhDKHBMOSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734145; c=relaxed/simple;
	bh=85haVVGK9Bcs+IGMqbyClCBY80jPljKCDJVYKsTGn2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gcosaum5Yy6IxNe5227N8PKzi3hS1+DNJ8uQ9+POc97wx75DKkeIPhYqmK4dj1H1901zlnhkejt4/IYuUsi4sNDdpNgqpw7nm1KeIdegM+Y93tVQ8EI38Z7OjZNS7qzrNWWAlJMuhtcdHVbU2A/KC65GfLoFFuYbePnnzeDv8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MRoO7XI+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MRoO7XI+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cfb79177so5343865e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734142; x=1750338942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=;
        b=MRoO7XI+jh91AHkx/TICYRdn7kp+jtwHjcM/Rbsrgt77VOu007rWWcDFw9q/3Ybr6R
         ItURHVZGOwzxEc8fjICWudMIYjBqSOe5ZnTArJVQ4OJS7Pb4lFv2NvboPje5nv33O4oq
         //2z2If1hOwR95Lj1TnEjN0eBcpzP0D6tEBAdEBQBVu1s3pwbxtDlQjZwYZ5OWIaqkeO
         s1o/5mJ+esXaOS6T8J6gIV8lSJ+mp7xTGhzp1OofX8l6rOzOafwimz3k9QSRRdT8zCsv
         du5CW52dfFRiyS7Mi5xOHxjN9ye8GK4cI20XmxtYdTJXV9iISlN5Gqy76ONgt0wV1V/A
         NBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734142; x=1750338942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYW0+B04sInxcyPw7RL4odLCTvi8nL12cX8+rIobfUQ=;
        b=jnBWPKelkcAgqleQprQklovBpOjjtAm8vy+fUJlJbE5eDs5R3K+1GAaQmHVR/+VZdU
         LQ4gbC8lhRN+O6bRTZP05OXw3e+jA7NqXwaC1WyZKQaQxNSEEG0Cee/Ed5b06bffKwPl
         ofM8AkOUeeYknQwlDxj+z8iv7oQjTt9Pte+frmbE6N3JK6CK1t0/mErSDOCarWvcCyxt
         ZAyB8HQJGR2GHQW4f4IvMpC3yjCfGgeZ2K5fFjonZcT56sw0NU4h8r/XrQKLp+cDOOSm
         +EF/QWa6ig4NW8iQBaeQesrCF/5LdR/xkeKyWV3cybkTxVG02ByRtbEyj3Ev9iPGfFnm
         GVhw==
X-Forwarded-Encrypted: i=1; AJvYcCVVVbvEBc+N/QHpd2gM9ArhqeAG2E8XvoHQI95ZqxtGzQ7sO6g3FPjUYyzjdIhMcnQd0Karo6Wjbns004c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkUSQuCnozwDQCoYYPNnIUl/xc7E7XgfYG0tezyXr433tlFQV
	ptlEH4ehAsRLGTFhQeUooQmFyYxIFcwoxk3Emvyuwh1T+BlW8V0reSY7hWa3coKrNAI=
X-Gm-Gg: ASbGncv3EjxsPWhQ0VMPPn/vcJ8tqJW+nCaCSvO/KUO2wZJtiATMLKFDf6zkSXVsHlx
	IBFCTBRMx2FJRQeoxyRnMd/hJDjOEHOL7bLFNJ09OLyaOg70SM3AActe8R5UByjLWoYdbAUah23
	ZMAMwhq+l1jLoG7qbql69+lqQCa/WoEOqmW+rZtcjL8BHMjUYVu8RQhFAC/u1rkvGNB+D/u/qQf
	Zcujxx2yrk1mrHeGIwPuP/4RLo7MA6oB88Pv21eMMP4xFv3JnUDA3eMDoElRqiPmqZ0ev4LmPaw
	j0cHK44mJx3lZwRapU4PnVM0LOudJLK5mc2dBbDVnWrYErbPK2/u0jc=
X-Google-Smtp-Source: AGHT+IFpZ9SXfAbcx9UYgsykf4kQVZZ7hDQIXoDecEBolRJ+pnmV+MNhvJktOJmHqFQTsif+GRyCYg==
X-Received: by 2002:a05:600c:3586:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-4532b8c2f2bmr38451605e9.14.1749734141385;
        Thu, 12 Jun 2025 06:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:23 +0200
Subject: [PATCH 14/16] pinctrl: sunxi: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-14-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nIb1ERVNbKJsSviHJxgUP0dw0VlXNMpXQSUn3radzBU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLnDirgrB5LayZ6bmpzTb9vnrrWDTKxpwuY6
 6GuRs6+7+OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cjGPD/wNvb4j//YoAIysQkS1R/JAVIQzuJnhYsUG1hvGNE0K/Tj2zywZqHvUHGhwy0MMfY4/IPv
 ipPG/UE5TMpaAfnUreWMO+6gxvRyBKLPdnaXZFXBx84htL1YUquIbzHMfT+cuIwtCnRANTxi9So
 I+0/W4Ejq/+fTnRec5gzwllQdA+qwsjIuNLHh2hmROmHFzBhnrngKJdRyiYjB4n08hMg33DyloF
 R+WMLG5USaOhzS/cXh74PjDCSNab71daGuxVVLjx6sNQm+imFmYb4aAZaHP34eGfUMMInd9XzFM
 SSClmvWkl4TCO/CRIH9s2dok8DZbUhgNwR2461FteN5+z4/wJh7owtQ3RtsRJeriFnI6cdJNxiH
 O/cD4XHBvqloqHTCEeD0KHICq0c4Ka6xKLZZaxo1/eJAtBPvQDdS6VXDNjKjxr4hpedktowfEPL
 8dzAoSnwDri+1MvHu82L2GIfD+vUzkRxP8AhYFQlINlgKg+FSNbV8utKdF7Dp/RvA0AyTR5AygF
 CpNuMQSY+P7pgwk41Y9dwdiFlxRy30of81JlYjV6kdmBpB17p+eWnhfObkprJ5ndF6wY7DM75ri
 VViJexUTAn0tAMuSEcLxSC3FqL/JUCBI8vRA1fvCu2BIbzgjhzOLrsorSrBLj10sqL1w8ZimBia
 8eHbwXrot5DU3sQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daacdde6209b0b5c84e010ef3b846c9..9a94c5276828aca51212f536400897e447c62ecd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -955,8 +955,8 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return val;
 }
 
-static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				  int value)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	u32 reg, shift, mask, val;
@@ -976,6 +976,8 @@ static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
 	writel(val, pctl->membase + reg);
 
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+
+	return 0;
 }
 
 static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
@@ -1597,7 +1599,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
-	pctl->chip->set = sunxi_pinctrl_gpio_set;
+	pctl->chip->set_rv = sunxi_pinctrl_gpio_set;
 	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
 	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq;
 	pctl->chip->of_gpio_n_cells = 3;

-- 
2.48.1

