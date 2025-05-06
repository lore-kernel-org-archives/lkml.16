Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B6526562A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522119; cv=none; b=Lynat7qYxKhRZugZE5hFBd4wybtzBBdAncrdqUmM+9ET76ISDjbt2mb8JGCMwzvglNLUkmbg9vlNz1KL2+JDJcLJD3BlpE0VA+w+uI1VxJAhvXmxkoFjMrZTnSyvlMlZJNZYY0nDdwypQPZ+GTgt+5iL5UfkZrEnA9wwcd+0MPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522119; c=relaxed/simple;
	bh=h/WDiVXfFCZHqvgjoPb6omhRMFBcxZL1KWQ7TBjLi3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iN1yVLq/jb7VjhvdRCuqi3WAZCFkCH0zQC8iGlkMyfcTQt9TZ8dKeC/QQgXuR9Ywnecn3iOVeXOQxwZtx8YF2j3O648iahsfTMWP1vqBfIB4/C/mPHqAmN3X/AK5C2e7AcSTW1d6gKTYgPeAeHQKXiKIYFUzvi5+CZHYVvVH8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Axtsrb9/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Axtsrb9/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso23298295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522116; x=1747126916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5xX5xDK1LhTZKmUeFagQY4z7X//bT5WMr4CQHakD5w=;
        b=Axtsrb9/gBTNBnBN+wn/Da3sjU+W7rcDpTPyyyf1H4KskiR7W6tLd0QNO45rQWCcdz
         XeutclkUh5kd6zv17pINpC0vVDTIjh94HUKdmLnRiX81OPJW9Md3nOF+TF5EdtUgPo2v
         q3Q228AsBn6B7x1sj25FNbQExG70lCmXRonwkAumgFrmjFtpS+CxOxQ0IRZ6L2S2smoz
         eP5OmX2IKRUaypguMtm48Yosgqy2vReL81FH2gUHQG1Sn2j54KjEmaCUNuXC6tquij6y
         9fsdGj1L/t0+9/477McPq9ckrcOQ5Gaz24oGzcS4dUwWlmkQjYtUEodEvfRWQ7RwgGsi
         0Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522116; x=1747126916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5xX5xDK1LhTZKmUeFagQY4z7X//bT5WMr4CQHakD5w=;
        b=BT8PG8n7a//0SdFmXmQKmyVksvCM4QMeQQ6lfeHTzDlojJMbYW/jVKv3v3f1SGi2Ub
         uJ3+qiXY1WuOiNK4jiUlRjphkKqs9p1WQXCo2WxX25WRQvHgzeISf8zLwdvbuff6H9+w
         V9BC4/yCtCMnSGOc6VgE70fDiTsCDFzTUSy6ZxHee8EOCt8vdmsa/pGdJnHB6iXdO2M1
         VCVLZraS0v35snxp7Nk0CypNI6151RzvHj6uJRFMATuoCTbZ5IDcWWeZ1YGVo9xt4eol
         iChaW1VNLIpejel0wzQLbOj2SslqofpC3AYRBRMPjJ32qiKtr/ji1vIxk2SmMT/R8iIH
         WUsw==
X-Forwarded-Encrypted: i=1; AJvYcCXUtCSJA0RCtn2FKieueTt0SmUDllZ7wNJqjnJN2Yt53asgteuMb2kO31nW7HfbVCW81eU7tulEV5NQbUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1cp4k3johVt1lLx2jeQg7ShwevB8EpHYi/zoxv70APstqsiQk
	XPKxtcMcuA1s1dQQDooF4O/ygbZf49kFmaRi/UtEJ6fUBzIgOncaWB4UkvSJaKMykefc+I0TMFd
	D
X-Gm-Gg: ASbGncvZRFNRZyRxGidcVS1IErkqihpn+mJcwroKt0T5QSderV+4Cth+580SJxq3Nc7
	xhtR2g9BOlGZMXxjEJcbNj+fu2nbeRmN/FRcGkFHT5NQJNERTfH4AjV10hF86t7Cs+6QbuJj1YH
	pfPdOgGeRSKwMvABI7oyuNKG4sQjeMaZWp4VUmMr6YXmPDTo+hm3QlKsxCmZcVTCR6WQg36ROyB
	7k33hJmgh8+8Vo0sOc3RTnhTWFUpe+ADCvVXOAetcW1zD1Yx+f/Njikg+ALuguHvcI1BD8aySVa
	DnGIxSJQSWjze6iVGMm7nKGUBWk6BztSENo=
X-Google-Smtp-Source: AGHT+IEhEQmtTeTN7IWRZ8t6vAkVX+cpAae/AbxZLwUc76/VgMs/gN09VBYqk+ftARkXwaYPcjiIdA==
X-Received: by 2002:a05:600c:3d8f:b0:441:c1ea:ac35 with SMTP id 5b1f17b1804b1-441c48dc3e2mr82793035e9.18.1746522116150;
        Tue, 06 May 2025 02:01:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:46 +0200
Subject: [PATCH 03/12] gpio: lpc18xx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-3-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gRCbKDYWwPPaQt6l4gb0BixRmpWGNrb8kCwxis9bt0g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9i0uQJY2BhC2Zrkvn3BoBUEcrSA7AXU5Qy
 HhV9DYw8tSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 cgjwD/93U00fkkxaHhdkDkIlVUsJezLok4i7YHaxAuCQXD7314SjDuTfb66TE169HcoiHhxuRCh
 oZ9hw3ekQ6adWrpAosQzSS8Y2ZhLhCox7bdRrgm5fVQOOH1Q8G+DOyHbaKjLc7aI1ntaZQNaxCX
 KhvlUhTFYk5VEjQAbMqTNCXOpK/wnoHjaB5G/FCOgPrBygbAgZm+HYGVLCkqBh0KmgQQopw5qFB
 bTbl+qG/kj7i1rjObZx6DLtTURDsJj28sztaAM5lHt9fGhrBD28XodsWCb5vU1v9qM7OZIFJ3JO
 cHAed/Ei61otC4cOXACJIOumlsXwVyGXf/W0Ca7VBmdUgSk6PjnVxGMjfEZK77/8dJtBPucS55R
 6SeGYrN6R9bybkiF/oOdzmWfh+VsJHoqcgMgzMJxLUQP3iM1zxxyMADvjoT2dxh/H5GWR0FVzWa
 Kb1/HsMmdhOY+yazJo2P0qrsLQsk3HoHrh3fMzUPgDNd66E2ZIHTGEq4DQSHRg89IbZGY9f40eJ
 276sGF0uzhjcKzLq1iBiDTi8iti8/9WYhenl30CK/2wkos6A9sIbIgTjGKy8VF9+Rf0lGaCS6dv
 LPjIK06bWcIcR8WWzwbvk1lHdjbt5yhXnftqAT3zT9PhSxFX6miZo++KAtjyw2zQnBAicckizWw
 n85veXeo0akuOxg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lpc18xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index 2cf9fb4637a2b..8bb8a87ec1e99 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -263,10 +263,14 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio_chip *gc)
 	return ret;
 }
 
-static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int lpc18xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct lpc18xx_gpio_chip *gc = gpiochip_get_data(chip);
+
 	writeb(value ? 1 : 0, gc->base + offset);
+
+	return 0;
 }
 
 static int lpc18xx_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -316,7 +320,7 @@ static const struct gpio_chip lpc18xx_chip = {
 	.free			= gpiochip_generic_free,
 	.direction_input	= lpc18xx_gpio_direction_input,
 	.direction_output	= lpc18xx_gpio_direction_output,
-	.set			= lpc18xx_gpio_set,
+	.set_rv			= lpc18xx_gpio_set,
 	.get			= lpc18xx_gpio_get,
 	.ngpio			= LPC18XX_MAX_PORTS * LPC18XX_PINS_PER_PORT,
 	.owner			= THIS_MODULE,

-- 
2.45.2

