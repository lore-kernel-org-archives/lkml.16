Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417BA2E88BA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163094; cv=none; b=B7G3ZEID8ITWJ50/Rshoqu6v5EiEWYF/7LZxyfNpQK1p3k2DVxV55WN5JpNEj+UbjdBGiUio7dZ9buFj2uEIFnYRVeTVee7nWMtB8quQmB8liok+IobJxyuFG8lkeUW+S13pXGhMD88vNbcIsKSurTJWIi0CHVMOXUWLRM0KCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163094; c=relaxed/simple;
	bh=k4dHPZZ4gqkig6Focr6bfb2InwZS9T5SYeSgNocjwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVCY4ebkXZEVvaS2hO2O5/jh2EUeHnwMMsQNNYQJhFnrOA1qZF/1CXSs6SwZr/Y4WPewbiUzoCyIBYOW9SBL8Wn/im8qtpEn3V0BydNF1it03xYocgsbO0MGpeQSSXb8aCtpDskjh7e/YGcB9GxzcbWbjnCMTWDqpOeTDAjWDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CvaVIS4J; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CvaVIS4J"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so33371235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163091; x=1750767891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKQWt4//oHPqdwtyW4DHzL6S4FclhuKp/qxVZV3GJA4=;
        b=CvaVIS4J6DyTJJuQ9ekrpzT/1gUNtHl6g/+rszZWJKaV5iwaDKtve+0Ow69TGo+Qv/
         0XrM5gt+qVp2trU7QDPPAzj9aaE73E94jY78TvN7Wrm/LB7eLJ4aW+6yPrqUtyb9FiIa
         bWtq7FyubYt7BRP43WjLH/V8YHM1t0eludAKYf4rkOb8OQX0GV9foFGx9jV8qVxOItZS
         6O0kcHcr04j/4uLtHm4GH7+A5WasGsaemyGYfMA+iB18xzYZo3XZ9ces0K/V5wGQYmgM
         qQSC8olW+u0Yxp5gRUoMv5lexAasK6nQqk/Na0FCjhIx8YyK2Arj16akFMCgDPULuK14
         llAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163091; x=1750767891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKQWt4//oHPqdwtyW4DHzL6S4FclhuKp/qxVZV3GJA4=;
        b=CKBx3MwfL6jC9/dpMTvoWZHfqz+eVH6aAGEVsgbnVz/xWPnPZxwTArMp/nc7Py5dDt
         nCLqjkxrjqNggTDOP7wxK/UMIfzALf3sLWg2NgAbSfDjUcjqJiUH3vND/ypPnTQWs6de
         5EAc9KPtXnQLtAEUBh9baJZgefDgml71ehwMA3lJo0QZ9RkH3TdEu78JUdRQ/iRDa3aL
         KEdZzo7Iz1Pmk/NeAfXCiJDTm7nu0d0zPp8j4qMuGfEag2XwUFy8xEOwKIo0OktOTwqZ
         ogxqW8lBOAil5L/OwksnUTIfO5BYCLYYHi0FS+txaX5rZWQL6bQyPkOXtFt9iMVYC4vI
         3CUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY/My4gORSBd7KraqagfXWZYm857Xepad8qY69+bcnXJkGHlvyggyO1kImhwiqzpHSTzgxplxAjC8Vp+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxmrJskdk2RMxdV+85TKQoaRgb6ocRyEC1bIjJCYRjerAsoIv8
	SL83a9JDLRMSmyxnjnrEozxNqfoPNP5SiFgvpR8Oq9NZuoUO401zMFOlucNbwyCvJqtNi4n8Z+z
	YwW9o5zY=
X-Gm-Gg: ASbGncul8fYe2gZmH8Lg36KX62e6xXOlTWFyk/j8suT3VGFY6lbu5YAhyEExEMwZMYA
	Iq2BNRUQMMdn+/rJBHKDFSwczOHPb7i+eUW5eUHainiK1jCSiYvNAlkzo5VFTrdaPabuHhwR9VM
	umxovdxaB2GddgKcL/av5hdYXH+ZbJ+6OMaZrxULWAgVRV7hXr4XNjznD7CPoN3zC6h/yOroizW
	fOi+UQEXXzWXIMx4gA3XA6hqHEoVE2KGCLS6tp5e11M9l16qFun3Zzpa9iEuU7n09h1Ye73atHF
	DMnykrM/18WTNiZhYKTsCtXkaQnau62n2S6A4D4x8fZxx0o/qvt0hxiQ
X-Google-Smtp-Source: AGHT+IF6eYsaKpvLJvmiUt8QAE8cQozg8YKi52ZOS1NW0clbxh8hC/2bJbDvUtJBCX2vBadvgAd1AA==
X-Received: by 2002:a05:600c:5490:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-4533ca550e9mr126976755e9.9.1750163091328;
        Tue, 17 Jun 2025 05:24:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:31 +0200
Subject: [PATCH 09/12] gpio: reg: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2vGuNGgCgh0pc+4hsP4u+sm/9GXFZBWpDEWg7HI60YI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6IRA8tyBhHC37R2KBIo+pHJI7AEfyKcsRQq
 WM5zs1FSCiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 ci99D/4hhJaBJIevMhmTwG4mOMgBexZpMsXQOU3lkV3o0lyW7sCFFoT4RAxJkgHQb3UY4BdCzYR
 hsuVsjmoiLXcB24EATcTHXDb+I4MldGSrUNljZkUqOcM2wOGt1cT658ZCdGGoH1vlNWLNHOVT6/
 2sL/BZgYNCi2AH3VGnf8a00O6kLdiRfcwLZC+PUzfsrpKn8gF1Ix3Mkbsa7OLF84038LJq6bI1c
 c2VRA2dqE9Gt+iutb+pLDOys7jK/e7YtrEvr6TVipW7t9rd+wfSGx6VjRRdQOzpRg1eu+J+Xi8T
 AYWthV9MGLhyJPDlQWECWxURTOjIym45RF7cVhwDCcsUKTj5xSOxGX09IUdOZYJR0VGfLcJPnbb
 8BddmRCCqi8QUywmi0PQdgTEK7df0vHiAsu3qsbCUCWv/gGbWZLFJNBy/KO5u554GAGHkJBg682
 j8YI40oL+nnf6nrN9JftBHs1Zd1kU2plsmAdp1w09XQCrJHaFQY3rUn6NEacZyxNZh1mzMfxSNZ
 G1fQZCb+TzEfZ+NGQJGbHU+7rf1b/xGILFLDqr+ip8XKYSSu5+No4Mauf3r9NKCxcIYvTtPMDBf
 uQx3IwCLQdPUqNBmuCpK8CrCHmX66eULZioJiClL3IJoMf8EKjEJF0epLFCIxutnFYCk+3O0QSk
 07I77UmQH5zfvzQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-reg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index 73c7260d89c083a702b1d914ddca7a573a37de4a..d5f3d8f18b405d124b17c338d79846214f9e97de 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -57,7 +57,7 @@ static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned offset)
 	return r->direction & BIT(offset) ? 0 : -ENOTSUPP;
 }
 
-static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
+static int gpio_reg_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -72,6 +72,8 @@ static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
 	r->out = val;
 	writel_relaxed(val, r->reg);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	return 0;
 }
 
 static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
@@ -157,7 +159,7 @@ struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
 	r->gc.get_direction = gpio_reg_get_direction;
 	r->gc.direction_input = gpio_reg_direction_input;
 	r->gc.direction_output = gpio_reg_direction_output;
-	r->gc.set = gpio_reg_set;
+	r->gc.set_rv = gpio_reg_set;
 	r->gc.get = gpio_reg_get;
 	r->gc.set_multiple = gpio_reg_set_multiple;
 	if (irqs)

-- 
2.48.1

