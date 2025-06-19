Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01D264A9E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322012; cv=none; b=jhXw6Hs17ar1tCImiV0uLxE2z8ZeL9Ja0m8jhZRZ7TmpjElrXCNRQD/tngjEcxZHb2NZ0A6oEIgvHOAn9kNyhXZygiO2d26DgFaN4bN10QrSNQiLS3Ze/vDRz5gwnytQeFIr1LKBeYcu/kGx1D7GcX7hinYGNW7SY6NB1KxRWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322012; c=relaxed/simple;
	bh=kEfiCA9+OheiBriw2pdL33nAXF823N9SCYa1haJTgFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiNE7rHf6R4mIIxo83zP5oSjMUAiuE1JlPesuAa0HSMijQzgM3HyxWO/WyVNU2nun0REW75SN4IoZ3u852gpr3adTqnouwKNNsmVxCaRrKu08CB7uwI+FoVp0vGHsqZ1nnU+h8eO+bOtSytxe8h2fPvYzb7IMDrOFeFsF9CgNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NA2h3asH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NA2h3asH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f379662cso466959f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322009; x=1750926809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=NA2h3asHbxEWG0dXYV57Zwo7DzfDvtxtyH22ft091dMRYnrxFmGgMHTHh8ctJCjSU6
         voo47AO8lBLHLojbyYxr1888wPeVKeQmtayI4KukIqwMA0yf4q5kVPAaimuRKCl3W1BP
         eW54mgTTN8O5jGKZmZztPhIk+I9n8oT/UM7oLxBj7QXxgd5n7cqBVNM1DjyGsviyZ4iO
         L2YMj09KLXx5brVphtdEX/I+MPTI9bGhjNu64gLQwcLrMRAYmZaeGz0wQSr4E8bf3Nqb
         sRm1PMocNaRQa7KYTyNSWbpsop30NCLfFwJJ7pzh5lsSiwyWzinN5nGbkLzuq6T6uKKZ
         H23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322009; x=1750926809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=AKwlPdR6r0otYRTQanpQQiBOlff6QtSWXUDOPo4mFv1G4ldfLakh6uhxu9O3KTOnLi
         azgaQGLHNGkinLboZknkc3F7ocIu0zibOW+qmYu605LZT9JV0qkQpuCqiXSziP+Z2qY+
         T2G7xdglMD9RLjoU9ptw0oa5unxT2+y7J4bhOR7bmrByaivrD4uNmHI7YVflixc9QrEb
         MKKuzMrN7krwAaFajoad7TzwfMd9YwnxZzRQQbAAKfD5Bc9Crc+/mcj5WaOweQGF3Qbx
         0fsJuFS/5tO7zla3KD+aJWOirWoxSGf8T7m2hGY96NWNZL1LpVdmHZCvnYTqoGNC8s67
         +qFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEuD0dP3slfYOWunh1hfO6tuAyR3Gr6ZnhUtHybYxZ7p2l9a9IzBOq6G/r2I0+hApbJRDCMkRpY9p7qcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzEgn0vGj4V/6mV0TNXdN3gdDf6QsANIIqDyCalNsk9mRwZBk
	ATkjShvVua35EDFBuDx1aYqQhOmyltxY1hpIBg1emB/N5cpggXCLObsjaHEzdkd6294=
X-Gm-Gg: ASbGnctvI/bORnLtz7RqzyPn/VnR8mYK2LdUy+wFSBbL605b8a4obq+oHr8zSB19xk0
	u+JSYyLnRkMcW7yKieyheB3W6LAd+XvOJM+iq6kcYrE3jT5G8yEaGIj8piIgps7d29gAwx4yNJv
	SAymRzwHyod/EkHzYCjcP89jq9zStNcOCXs5dMNuiC7CZy4CWL2WpGQJEkCGpN4DsQwfufVg4V7
	499mbWfFwqDg4gILL2xyXM6XFQXFuAhvQf7PP2003XHaLFMd5EFwpqLTxcP53UiY6ZbV4VIBJ7a
	mxjjV7DUMDtcyLXzCHdG+EtWvw007bEpNGwYZUO22O5ANUGQGKXywCSv
X-Google-Smtp-Source: AGHT+IHPLcB8/29mYtkUt8iKok7FC37biZwWB/Q/SP56+aQt/F1bk12ty9NxJOh//CgnB0DvwIlwFg==
X-Received: by 2002:a05:6000:2884:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a572374884mr18221393f8f.21.1750322008719;
        Thu, 19 Jun 2025 01:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:16 +0200
Subject: [PATCH v2 03/12] gpio: pch: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mZa8mgQmqtI4o68XMiXnsHjV4blkeihaJT265+ul6Aw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRA5Lt5tCecOg14IUXcT8lEaMqPIFkzeDus
 xIhrJVliUeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 csRrD/0X4kU8CvgNicRwRcPWkiYI5uyEKdHA44BuqB296GSDxiSMQlry3tpH3bDB615ncgTzJma
 OeW1E/h2/kWDyXb/rNf+JC8p6+Vp2CybgFfPoOITgwBlsGU94i2zsJVj59QgKSr+zQy/72qvBHn
 30sFm5mbKzrutIuUP6hJcSCzDOlVbid1hEET+ln/VekIRRKHcacMTBTUZ0WWa/nfcUZRTZzAX2L
 tFfYnE55xhV5+Ol+XjM9Z9Mq/lCTwzhN2RBjrgLNtGizgzogE7BB3D1HB+DnRNGG9MY4m9dVllv
 3OxtMEmV0j6XpjJIYQjMNDJFdRJgoMbELkgGEgBPprC6VEPHwtkQVpt8lk+IxBBa/qHDuyusXaf
 7ov5BUaSMqQwsumEzkNW99h2bcqbJ/5v+eU/7YJeMAed+Ayi4yN2/UGvuQwxTH7gPEhgYLrlwzR
 8UCVpkgDo5KYQ0WCsn+HvBworLov88KlUpjNIBrq/cV+Xmp95zE7w2JscdCfsFoclXHa1JsL4+i
 m1+oxV36y02XpfZ2aTxmzR4poQQrGV7KNVIehnHYTNdmNfXIhcHi6ksh5yv3TnZq6PtvyGM7wZb
 L1a0SsyjT037zulwfvX0arMDLrHDEDL4AFJENcGpmVSVfgEDcvQNQ3jHDR/tmWO3BUf6Lz+Se5A
 d+JfGKVb7WYgPOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 63f25c72eac2fb98156eb7682e780247a893d7e7..c6f313342ba06a1386d8ff8a882c9344a9e809e7 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -99,7 +99,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
+static int pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -114,6 +114,8 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 
 	iowrite32(reg_val, &chip->reg->po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
@@ -217,7 +219,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	gpio->direction_input = pch_gpio_direction_input;
 	gpio->get = pch_gpio_get;
 	gpio->direction_output = pch_gpio_direction_output;
-	gpio->set = pch_gpio_set;
+	gpio->set_rv = pch_gpio_set;
 	gpio->base = -1;
 	gpio->ngpio = gpio_pins[chip->ioh];
 	gpio->can_sleep = false;

-- 
2.48.1

