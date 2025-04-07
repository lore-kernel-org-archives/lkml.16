Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B36225A48
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010027; cv=none; b=d/du+8v/Ljr9qnHbj11YTsJh4tYJlez0bnFkdHiPkk9uQu4TZAbKkxutCtQzSFdzOFkwq0SXcHDqiNRujJ5nnDpIusfkhrsi6DYkg/CKG6txFS9l9RGgSnmf6W3RgiF4sUKPXZBekDeFo4+KVhd3mBpI8s5wRTjCE4TVVPEOq6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010027; c=relaxed/simple;
	bh=ksgMNh86Gb5TqWWXr6fwh4KwzaC1B3egBIbaiSO69I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W80/KfDs1BeKPAs2GZBg39qaAEz7Nd1OYXdFSpgL+OsCIsZtVVBQssrb34Og7tBYlO6E5G5b+mIGMHVBjPO/ZTO+kKTU9aMVsxUB1TEiWpgNR2zlnlaHD6GRZm/r+ShZstmpSq3af3yBE66DLo81fV5qZHzqXYdPJf5vlCJwHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PWc5nfmD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PWc5nfmD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c266c1389so2777628f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010024; x=1744614824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sauICvY2GNu/d0iZ8lKdFH04dL21IXhvdergpTZ3jAY=;
        b=PWc5nfmD7nwr3WNMqg495FRLblCz919oYOydqtk74HnctvYxhRstt/bHsxtp3/aYwt
         O3DxPyBDJhnjBPsoX9QG4iaNCwn6Hsz58AteG+FAMvTnaqvghHc8h7DHmwwW56OjqX3p
         UK7YJS/w5VGOthKX/i3yNiejDR9cSBzS6+MEpyHzcH+90i0Vm7gFeO65W8NHvNk2hHgE
         Dszm6nW0NiyjhmoLmC0GcWluALDSFaGKXMy+D4LolGrbuOFW5vaHFUcuX/xBqTZ2OuDe
         pkxW066H6g9KiTkLNZcdEcdiY5qcGUGhO3pK/42fXrlhAz4S0ButjPmTAIXdxJOMHuiE
         wyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010024; x=1744614824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sauICvY2GNu/d0iZ8lKdFH04dL21IXhvdergpTZ3jAY=;
        b=B6ryqsWsiW03xEOlBqrP/zYm6KGoUDs5Q7rrzl0auyArblO69GawVszvXXZjPi5ez1
         D0a77kbEqDplenjoxmdQq8HKwvj0n613QmImqos7r0xy5HA2BoDW3WbCPyKCMYuxz74L
         v6x+YqOa6oYorALFfPUf75KxPbn/GRYMRiwm6MNQEArK0FwUZVJ5ZTIEukzRHDVjcG3j
         FILGtQ7O9WH+eTQ5W7JKc3mJyld8c+AKoEOCfn2zPo1woBhJE4I7Ht0vDJqeY7cnNaWq
         +8en09iGnIFdpJzuXr4pU+uLJkd9kFLwQrWTLi7bvMraqSpouMZMA/irWKdMwJk3qaat
         e4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXyCDgqGWH7D01zBRplEq0AlQjU0ayq4lIHT4fdwbKiRYzwZfutphP/mXkSrlbJy4Rmr1fItQ7D3VuPZOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmb3db79Elpawk0FaVdbpYWj+Z76TwFaOJQFYvGSMui5+Shrr0
	6CFUjPeIF53o4cRaGz2QRVid+UUtx0B2VwDVNh8srhPpR/WBXqiEL742NwdUkkE=
X-Gm-Gg: ASbGncuN8/DuJnJnfz53dlZvsAEubZ3ZRfB2ODHhJ/VjAK2HMYb1Sfifh4gPvzcTqZE
	CKADjETabSujYZZvaituQusELTmXCYg78yRnGj107iKGk77yenmoXgD1chGtob5pYFL2Fu8enkU
	jMQkCti6fteVeV9x/r9x73HKLSjvivhAa1e+HxGwL5LJAp717m1ir62IZJXpxuDvN8hogR9A3As
	2yHOznBkmxekZ/V4YZ4s51LtKRLfsecVUmmqXcUqqIMl+9aZJYgD22b1aWj0jhKZBZqGz9nklQ7
	uXOBbXu3ka5ScTyF6fHmq5k5TRvjTOiz8uD/bEDgCF73uMe2
X-Google-Smtp-Source: AGHT+IET2/k8WYw907bVllamJF5bVLK+JZ/6K0xA/5CGjA1RriXq4TqZb/drjilOXTTBto1d3wZyuQ==
X-Received: by 2002:a05:6000:186f:b0:39c:266c:136d with SMTP id ffacd0b85a97d-39d07bcce91mr9558796f8f.12.1744010023815;
        Mon, 07 Apr 2025 00:13:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:21 +0200
Subject: [PATCH 12/12] gpio: ich: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-12-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i9kMgN5vraePIBzVin0YNojFDKLKAlftYcTP7Y1Nccg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sKeGi3udRSb1Sw3Ipb+p3w9GsXMiEnZljC6
 RQzVFe+nVyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CgAKCRARpy6gFHHX
 cuyxD/4o1AmB9t89cQnAf0YyC9wdK7KdIRyopDsQc445ExB/wWNm3fbat43Kj4GGAoLd8KCjc1q
 PG1mHa4YpBjhmNvU6hg8wUfQyN3C1wf3jXBYHOn7Ts3mHDCVi9WOitafwSf27aYja3RW3lpXl6H
 nvEbH7KVjuFrjpnYgD4AsJc8mGcUSv+g3mAAk4PUVHEPK+3THey0qzmU1uL/mgxUkw7jnOjcIlt
 raDjndjF72lCBpjaWK0iQ/WrbKlePVhcMNAUyaN239U4NpX9R3E919D+KCx8ux/6ds6hoKbLqrh
 hBCHrqgXXLAuyrJVnq8X1aMpu/pvvVW6a6ei51TUDCieBdJ2kBpGQUvO+lTWYOf3y2kd2HPZUhm
 Fh1WSwnpKe6gaUdgD6e4wC5p2UhZ7KBJonc6vny36UEvo0dZGZrxdHg5UsLO5Tq6Oj6AHxY/ChZ
 hQMVZtKIZHc2Iqi8e+3BUKD6hbS9z1J6kh/LQpqpHRdO8VxWW0kt5s8js5IKQDpTQUDkpz7hAdk
 WZpbMj//rZrYjp/djyR5irUHQ7KwBS2RsvGa0TRmdwGgyECJfhrVsIXvZDkKAzWFOJPkQhalyJq
 sNB38EemKTWipHl6P4JsX8ObhIZvAZxMXGs1fXDfq4OIrKgOQiBQYBQjCKyedokBvd9AIDEBZ7R
 qgCDTPqepWM2tIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ich.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 0be9285efebc..67089b2423d8 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -175,12 +175,16 @@ static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 					int val)
 {
+	int ret;
+
 	/* Disable blink hardware which is available for GPIOs from 0 to 31. */
 	if (nr < 32 && ichx_priv.desc->have_blink)
 		ichx_write_bit(GPO_BLINK, nr, 0, 0);
 
 	/* Set GPIO output value. */
-	ichx_write_bit(GPIO_LVL, nr, val, 0);
+	ret = ichx_write_bit(GPIO_LVL, nr, val, 0);
+	if (ret)
+		return ret;
 
 	/*
 	 * Try setting pin as an output and verify it worked since many pins
@@ -252,9 +256,9 @@ static int ich6_gpio_request(struct gpio_chip *chip, unsigned int nr)
 	return ichx_gpio_request(chip, nr);
 }
 
-static void ichx_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
+static int ichx_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
 {
-	ichx_write_bit(GPIO_LVL, nr, val, 0);
+	return ichx_write_bit(GPIO_LVL, nr, val, 0);
 }
 
 static void ichx_gpiolib_setup(struct gpio_chip *chip)
@@ -269,7 +273,7 @@ static void ichx_gpiolib_setup(struct gpio_chip *chip)
 	chip->get = ichx_priv.desc->get ?
 		ichx_priv.desc->get : ichx_gpio_get;
 
-	chip->set = ichx_gpio_set;
+	chip->set_rv = ichx_gpio_set;
 	chip->get_direction = ichx_gpio_get_direction;
 	chip->direction_input = ichx_gpio_direction_input;
 	chip->direction_output = ichx_gpio_direction_output;

-- 
2.45.2

