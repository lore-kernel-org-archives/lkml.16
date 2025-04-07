Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDD227B95
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010319; cv=none; b=S77lsGLICHzccAVb8T7mh5Cq0Keb11HiWX82iaow9XaPkG3RM9kHYd904xgzftDnBjqM0dvH3JbyEeZOAOSiayYvy4/LprtsrkjKA8gKf1fhT9W1MnUlsTZttYl4/9EwLGfS9fayOeO/KrggAY/RqMHWB/igedvZmv86/Jeoww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010319; c=relaxed/simple;
	bh=5kdF5oVUy/yps6X9BImufh8OuKxxdQ4BjJ7Qv2H6pxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxuNsNPcDPHoU2Vm80ZxhiXJEOLNh3DNktUhr8oMAW7Sy+0v9riWF+xE+aZ3NcbehypDN0+UfcuVKqzmdx/ZsSs3ZgWwcY3ucpmzUGOk2Ohyob1H7BNkeNo/etsEolOQsH8UMPn/SR+gRSfivdR0DpHsjDiXB9IR7Il9HMy3feE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MatPvXe6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MatPvXe6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe574976so26700575e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010316; x=1744615116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=MatPvXe64+0aWbA3s/4/FrI//Kmz2mSQ+u34tLBnNCnLKaEIWKzvISQ0N5dQRbYmz8
         3CE0HgUPDiEa7k/+e7KJ5hTk16TIkU8z1vnfagkzDXYINVXVVptPnC07Ai1pPPb4gr+f
         iLw2/I/XHCnDFV/mxoAdTFxhuEK3OIL+qcgC2GsB6YQiLtpckiHhAFXKHN1BmMBvcTc/
         wORUqXBUfMaPiAZSvrXIcdJxW/jSP1Bd8bmaQ2gapuxKDOgYXHq5TjEQEpYo4YwhlGS4
         TfSm1Szx4cvwNCGk4SLViWWUXGE2CmAmHSVGp7TETz5QIGwHnSiKh4IocpsCWkzQlXZq
         SR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010316; x=1744615116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/lQSP02uZhzaqZfFDZ+bFMWR2NaVs5b5QtoM2HpE7Y=;
        b=ZE4zzVW2IdMU2jnDsWY5iC/NQOzI4EDy9hA5HwMGZDGauk+tQ4jNNIm4EQPZYBeVUq
         3/nkM0d5qBO6ImlwESrQmwUJQG+PT163m+r+5J4p4xNDYJyWVE8RCZs21e3fmm+47JhF
         hcCUZzTmyXeK5R3p2wKvFlNCjYP50vxfE+gw/G/anSHS3NR/V9EPVZ5SW3HbWU2++8ip
         BPlcyv4TrEr3ykzxRpN4YHCbKFJkVlPkC899rk/Xi+iLdA9okB0CPY5y6WjsEF7n+osM
         jLwD72Iv9JFYZwXGweImFyNC0C2v2ERqzcGuzZnI1GCLfm1iR705Q7rrwkuTVvlmB6es
         Yl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLaTRuzBSyZoaUGPp2R7GkJ9yuXEtaNw9OJ0E+iIKxuMHlKSU/hyL0zKAvNEEA7VFtVOF5yONcOlDY8sY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNa41f9O9v6JcpNczdm0RgFvDa1+Pibf6YUk3+RAYOUYaNgduh
	391NFjLwfXhBXwtBjvKVNL5e9jb75gkO7tpRVCSJKmvuFCbj9vLpsSfbPy4ZQpM=
X-Gm-Gg: ASbGncvG0Jdjt/IEekH/ptvTWieCKuyR4usmm0xSvJYze0MTuGDQqyEXTNV+SmGMzJR
	uXuzd1qwWE+etSZZ3Kx7YmSlD4Z/aKRL+Tl9KqA5OUvbMg0qrZrwmjrFVqmKNMuOwk/dsp/3/h3
	N0da1n0K3J1c2Hf8xLBOoxDd/5dFAVhxQWV13iyLPjGoi5ECDCVP22UaXW/u9orcUZ28Kd33KE6
	u9kbet/MlScQj9d9V37opoVn+ZoggZkOPOjrULtRvR2gYt+b2e4SAEIQPQgIpdBHjAogfSbvNXm
	RQV80md44ZzNVEuGIHuLVh24XDTHOhPNeXqHMw==
X-Google-Smtp-Source: AGHT+IHZJ6eZKGM0X4E3G3AiVSKpRFA9oT3UOJNHqKpzBidSstN5tYKbajNmdPvNjyMO/2yji8ci1g==
X-Received: by 2002:a05:600c:4f0e:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43ecf9c3224mr81160555e9.25.1744010300476;
        Mon, 07 Apr 2025 00:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:15 +0200
Subject: [PATCH 7/7] iio: addac: ad74115: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-7-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GM/OUTdtJwVfHBffPnM20PvdLToT9f+xlEL0CqiIT9o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83w0zT2RcvbxxdDl95J1of6Esp1CJCtG4NnBT
 9KjTKwWSzGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8NAAKCRARpy6gFHHX
 cuv7D/wJ8rQB9Y9DlVg0wZNX4DBaBKetOrAncRCE3OlQmy2QTip8kUA5d2j0dZOLtaYHSuznZ5Y
 ADpgEA95zc1bdV+9kVNSlvEL3nek/u4FYhCBOq7JyMHxGw7BzrS5yGEClJBcswxBIVyZcuMsLK2
 qN93D+ck9WHRZBZE8U8RSOnGXfPUgFTRMSvDOp6DkGPOFfNYauVIudkYRurEjPHNyoezOEQwjxF
 ymy7wzw+lx0gvHkiCXF1LmnmL/e/j2tvJ9XO11pT9tmabmgyMMUaJI6sL+N3N2oLPq/ma+1fLc0
 BnSQks+2lCnB+XVkUTahI+AB+IuIW3yifmZGt3cxK82Wcnjhf2uXswwx8p8W/zCq91/P1rc5L5C
 OCLyH2t3VJMdgkT+qm5LM+RaLkS/Xuq1JYGj/fWtiQy210zvBS32EghCDXv371F1DL4CS5KgtzO
 p/hRzaa6j4vd6MSG8NwXNImPXTUQqIvbdV+DENtr/RYKX8PXmky3LRt5MOvxjtP0x1EUw12SUSL
 ARiECEfbnshwoV1PZN9yywQMSDV3iKFs2vUcSF/5LkHqRa7NDni5yZOlHqWguvxcsxT0Zspi+OV
 VhrRnAS/zN1qr+lqepcZa8lDehr40lw0wA3gKwdz8haFRXS0asf24nMmq9uvTLBL1aRPJQGnuYt
 Gw4w2DyrGQIBw6w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/addac/ad74115.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/addac/ad74115.c b/drivers/iio/addac/ad74115.c
index a7e480f2472d..2a809e07526b 100644
--- a/drivers/iio/addac/ad74115.c
+++ b/drivers/iio/addac/ad74115.c
@@ -542,18 +542,16 @@ static int ad74115_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(AD74115_GPIO_CONFIG_GPI_DATA, val);
 }
 
-static void ad74115_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ad74115_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ad74115_state *st = gpiochip_get_data(gc);
-	struct device *dev = &st->spi->dev;
-	int ret;
 
-	ret = regmap_update_bits(st->regmap, AD74115_GPIO_CONFIG_X_REG(offset),
-				 AD74115_GPIO_CONFIG_GPO_DATA,
-				 FIELD_PREP(AD74115_GPIO_CONFIG_GPO_DATA, value));
-	if (ret)
-		dev_err(dev, "Failed to set GPIO %u output value, err: %d\n",
-			offset, ret);
+	return regmap_update_bits(st->regmap,
+				  AD74115_GPIO_CONFIG_X_REG(offset),
+				  AD74115_GPIO_CONFIG_GPO_DATA,
+				  FIELD_PREP(AD74115_GPIO_CONFIG_GPO_DATA,
+					     value));
 }
 
 static int ad74115_set_comp_debounce(struct ad74115_state *st, unsigned int val)
@@ -1580,7 +1578,7 @@ static int ad74115_setup_gpio_chip(struct ad74115_state *st)
 		.direction_input = ad74115_gpio_direction_input,
 		.direction_output = ad74115_gpio_direction_output,
 		.get = ad74115_gpio_get,
-		.set = ad74115_gpio_set,
+		.set_rv = ad74115_gpio_set,
 	};
 
 	return devm_gpiochip_add_data(dev, &st->gc, st);

-- 
2.45.2

