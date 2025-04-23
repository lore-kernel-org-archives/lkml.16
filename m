Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99079268FC2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392527; cv=none; b=WFzVSjWNCbbd+Xd+GLxMhiuHyhQN3kacsnLh6wuHfSQR2q0izY/AOWsEKMDHursob3ASudppLsBjHKBPwvWdKY1ktqB8iCcYNmoUZ3flEqaEW5++/XfJeMWlFcpWoRalLENKh7iVH5sFt1jg+I+0fCS6w6FshVcCGjLe6qIkw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392527; c=relaxed/simple;
	bh=yRgnB6XWkeKpphZU/tcz+wQT2+c1lDPE3YxdJdOW1tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgimacM2wMqcYvFFyvOx5TItC87eLYEf6XUuvat4JGEKwXshlqICfgl31VzC8xkV7wCjdqXbF1ZRAIXliuyOftWPpx5KTf8PC7PyUJBLwgy+xKA7hlt3iaX+v0jNHHNb1RiVwowge1xRqWWwUNmb6Uj4otm6+t4UWbLebTFEfyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wHI3gZct; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wHI3gZct"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4329605f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392524; x=1745997324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=;
        b=wHI3gZctCjELGzmeMNNi5SnHuw5Ns8pY4ql2h6g0gSjBQKyytCAo95FvNKHY0aZPWb
         lOTt9XcGrQGsLljVli/lPt4GgWAelAVZ52MC3KfLRTrjg+l09C6fTM1rJch0QeQGK4CU
         /6wZz1zK1HwY8gzADxvDSbdUlVMrBHXDxfMK5bVXbzOZkHrhdtcg0sF64XnxujzWGUFP
         nb3PSGLjtanNS0m9a4iaymyKx0nunKC9tutBKyWcpZV8buYCsefPxpm7VUFd9DZBW3aX
         HTQoCEl4p+B13eKeolWgd+SvhPFk+KjOcXCC5s+0rv3NOxYETxEAqvHNSuC+9eSxUmWE
         vkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392524; x=1745997324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dUpHlzVQ0Nluzp3HoN5pgyga3apGsC9qYfohIDy0Rw=;
        b=mv0wJaqJMCwyQyEpFMHhYdmoknEqnu3OM25G00RMycjqxyC7vdTMhs3EVQgDEF1EF8
         jbg6O8zquXrbvHC9u68UeVq8d+RqPLNG0FObF3WCMfiP5oFqSGbfwXO/VEbpeAIcV8JK
         tTRUWytpIUzzwccQnZGdBYeld2f3z4kJOFn2a4cF2UpNwJJ6RtGdpOzBz+QY2A3zpBTJ
         oTcxKlNdGxnKhvj/oKdCROVXfR2mu8Ey2EdGm3VmBJNw9QyL+BBhn2aR5Jbhmcx9ejgl
         jaMO64HdtlpPUTUGso4CQDMW5R330qI0PEf9ih9zCyQMGJIgzwh8uAcIjDLh5PG2bug+
         MNFg==
X-Forwarded-Encrypted: i=1; AJvYcCUwCNUZ/aeqxY6WtGR7SLk9CVzBxcX0y3hlyxryZJB+jyCAdYNGyVU/hz0VbALrGr5fEVA100hn0Bjy/NA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6xgLWi635DlUVGey/A5Mm6yjtmwnXcc7aC7NlZAghZXgOtcg
	9kyTsQo5eLKS0+i3Z9gzNIFr6vJTH/T2ERvL8i3BTTmyDDx/9ZmGuuzGXtoHQKY=
X-Gm-Gg: ASbGncvmHsvkpJ8mKEhaH8Tmgzri3pFL9FVpmuE+1233c6VXDnzHVjC4rIg4FFXTvjA
	9cesUXebW7oWC6qPaOsNBQFKZBwHCR1jN8tgSvG+oqMURtk748pnbaxmWInRqOP+uv59e+nuW1P
	Sn7qVSqF2r+b8ADP8bjE1c4M/kph+je0Lmmku7ZdCtiD/OdTR813RVzyhY2Ed/HgyKMcoZ5hT7O
	OFdDv2xvMT6IQkli5AveSIq/iM6T8cHiiOgOXhZRw6vC5vrBrULsRx35Tk+ZTTMjosv0YpBVUgF
	l9L/1f3O9V6JqnSAuH9OqEUTANN5oQeS42F8VSIt3CMY
X-Google-Smtp-Source: AGHT+IH2MsdDNILYCsPMW1ySHRfLwTlUNKKijfetG6ax3upZnauWSGQaIMu5VBaZHo1H5K5p/SAe6w==
X-Received: by 2002:a5d:5983:0:b0:39f:ef3:b51b with SMTP id ffacd0b85a97d-39f0ef3b57amr5697581f8f.32.1745392523690;
        Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:09 +0200
Subject: [PATCH 07/12] gpio: kempld: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-7-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GEPnmbXoB7fEIW2iO7oP13YH/mpOLXVRPH64FaTpdkA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCWLqOVcCM9B5CKNnljLn3XvSwrTZkEt5m+
 EdjAfGiBV6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 crz5EACpKy3hnh8x/i7lz5DRdTzrevhdTvj2GHcaNqpC9nMq/9jQxcxHyV8D4Aa1c4sEmS55ux0
 xEHbzaaP+jMTCuDrvmgZYLuXPnj0ff1cVBdlqgXoat5CuZYIhFGjUHZu8TIXRyE98MOmXtM+zpf
 KR15+MKLF/MFgGPf+pFiFnhZQgiIdMTUgGuYDND1XzyytYPoDWairH7zw5gkYcUMo4PtKwu8hzm
 ki47tNZZCvyhrwVSrSavZMGN3WH7RrbZakehUkRbsf5zUihpWT8G0DNnMLd/8HjNkj2ljjlEpaK
 pFUx4muqwiDLXH0i1ggHXDG/c4PJKLo9i+xdghac3TQd6m6LQTA+qNpZ3jl8cwch1hf06Je/l95
 c/9adIpl0RriXYQFD8+djuJBhz9g0QNW4pa1Hd9Apr9fbLFjJmvHyyky+yoivb06oIgC7sEImX2
 LRyro8kke7ChteD4VA1/U23BKFJSg51Zb6NZRS34JKgO05v8l7VUQf41tUrl+ZTacPXjSJ9r/lh
 pqjbObBMXu+TTSIsK0AVAf8FMw9eSndey7MuOkQR0sLiabTOSUvbKhO+UgZqkbWRJkZ9VPwQ86w
 Mq25Am90HWAI+h3TYxDI0hf4uOnIAjD5tyAAygo1CqvmeiCnPmza0EgnN3nD7OTQsBXACgi2MTz
 oi0POfIjKW5cr4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-kempld.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 4ea15f08e0f4..e38e604baa22 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -63,7 +63,8 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
 }
 
-static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int kempld_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
@@ -71,6 +72,8 @@ static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	kempld_get_mutex(pld);
 	kempld_gpio_bitop(pld, KEMPLD_GPIO_LVL_NUM(offset), offset, value);
 	kempld_release_mutex(pld);
+
+	return 0;
 }
 
 static int kempld_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -166,7 +169,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = kempld_gpio_direction_output;
 	chip->get_direction = kempld_gpio_get_direction;
 	chip->get = kempld_gpio_get;
-	chip->set = kempld_gpio_set;
+	chip->set_rv = kempld_gpio_set;
 	chip->ngpio = kempld_gpio_pincount(pld);
 	if (chip->ngpio == 0) {
 		dev_err(dev, "No GPIO pins detected\n");

-- 
2.45.2

