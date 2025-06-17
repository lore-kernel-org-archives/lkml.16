Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557182E0B65
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163090; cv=none; b=C3LEC/e1jGFhiF7qxn0Unbk2acRXL78+TS+LNAgoogfRHKf5OWQdenhBvAlpFgCA1lySnctybwuQyFIXiUpmttWCTu2D3zbzxX0h4cNeTiQft0AXe/xRmKzEDF1FwAdebVfgmLw21weinlq0hfeQkc2EBYXRzq69KXn3GZ5C7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163090; c=relaxed/simple;
	bh=bxD8Wln+1c1gwTOx2BtC9yxuB8rPQnYC6Cyew1Zz7wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXnbkLttFUzlYd2qiAXFyu4zH3In5KntiZqjEjgloGLv1Ve709s3L+8QUm/jW9KG4j0KDHdgRRjVBBpk/8qb6J41pFHuYGZpfZltlcqkvq0Oh3gdJx8gDlNuv4l8RbivNMz5ksPcy/WfiTP1LMM4rKaxcpbzLslgNoNIf4bcpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mxySF/Tj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mxySF/Tj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d6ade159so46909975e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163086; x=1750767886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=mxySF/Tj82NdWyaYtRcuorlzqeisO5os3ZX7XakLbdXKbF39dWaeNFGV90x5ZcuUXd
         3n+oCu1fOL+SlAQzkiJ+0euql7huwZrWBtNHsarIixiWl80ji7kmsg4y4Y1EKAzZPVrZ
         aXsALG+//gQC6CdplZO4B2Dec5mcDNCSQcMPgK8H0MAprxscgX7v3xKmEZd9AkCLq43t
         QKcEhnaWnNsNbYLFh+oK6aYhzluwnB3/d28C8cuHg71V61EqmqFZ5dRaLuCL8q5m+J87
         FgsrOBVv9msRQz0oWohoABByvZF/v9Ba128Lk1go6nnJjnBaOvSvjUuxQaU6nSRYcVEx
         Hgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163086; x=1750767886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=qGCtF81mMKqOlTGtGuR9yM5XEbWR+BKAaH/AQHRjfLiP3Qx80Z3x7NN3D9Whqy3dED
         Nb0wUB8Kr4gMbdqZUdjYozYsM+wOFbnKlve9ZjxzBVyAHIlp9OF7KiZxaLrtxzOv14hg
         Kkm1O0EltPHmT3yjoYJuCR4v3KXcErAB2CwIrdFJq+8WUeGwHKvP5wYD5F34ULtthyL/
         N18z9aIsy58II3jtlZIwmC5JRDMfn3XUaudst0E9K7ulvOuwKsjBY83ZeRt+tGvgI15C
         b8DpJU9yCj5AUULzycG0rxkJXvDjg+lptwsCtAf7wAWru3BMmbcyb0luwxkeHySKpli1
         aWPA==
X-Forwarded-Encrypted: i=1; AJvYcCUwe4vAU0+PtJ/1uRDLFkUY6tLJiNmrwE4U+kJJLPNPvKmAIUXE3z0metcXEKJSljhG5DZg6RMBkLgx+Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZLldchT6DwMZzFq9ykKXUpk+YBG71wODR77BXK1cC2mKW4zLI
	JL1xWLmW9iLUpiJs3Tdvx7ltcom+O8LN15KZJYxmgPJz4D8OvaYrPM3nV3j0LD87ar7AT7mYdwV
	ITo/3dUs=
X-Gm-Gg: ASbGncukV+NHPSkdCbPub5U1D2viIUjr3pmOlK3Nls1mF1YNbnS5DSABpUBOxzK+Sw9
	FksZtfd6LX3CFLUIB4qPRgB7ZCMRY3+YaVLwI+9GlUsEUp2fyftlh4W0bqmBo4WGPine0+rjdvf
	kL4I3dbnXNc3QeIQFqfNjnTI7QiCK1jrUWUPJNfUNTGeDXsf2PQ9wVVCX+hvUte6Ohe3SZwmVG9
	LpTlD1Xp4tezYcrKjyD217p24Tg7JJWBzvI9s0vR564D5XMc1TnG8m9TH1pUiKcbAbV4mpMvc5u
	5HkPOGGlzfCkn6sLOkSi5FO26c2fHLDQGEHhDKXXCWXpOSLOzvp1kZVx
X-Google-Smtp-Source: AGHT+IFEY3qQ+Fglb9jg1ZhkUiIqMjijlbm8dxytbSflltEzbMtmudgpYXUBSqKCL5VsPPsVFxCG2Q==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr117448275e9.29.1750163085919;
        Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:26 +0200
Subject: [PATCH 04/12] gpio: pl061: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=a1x5aRsn4kpz4DTuXQ3tdXS/YzbAV4e8kj3b/qk6D/4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GIgRCEm14nPNHr3CVnIwUGcS41bLz59WAs
 TXEwqwLAcCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 cs0dEADc+nUolHMR19/mMV5qvmdBmtTJhRhknvVpHeM0XbGqpCZ7wGj6z0n8OFOGOBrqIN3vXbi
 0ZGL9wl2G1YDE42b2BWtFDJSjYhKoMMjx9KePbUSulFNhC7pb1fAxR+N3v31drUQ2jUO8Q/ZVI9
 I2fdKO60nm0ExTLDeoJZfaQZoy7/3sTkNrVWW/9YtP/1hvw/QwqxGc3nq+BWozFQPcHoK7mOvew
 ldZBEzrS5qqC1a01nuQAgIEdB7DeeCvSo0EXDrrXutqcYNK2afxhfYZeUTriuhbXdp4qupp9err
 i0yEmM76PTVq5zfZD0xdQ4bKxH09NwMcaTZ4hwl0n3N8G1aFf76HGqY7INud5TBW/K2ana5kYb+
 wEBuCD+sOThcDNDSc8TwqvLXb22tImhUfaKKr8ULqAbPvCE5YWzH7SkPBabm5T0VSJIEm3ugyC+
 M37yUgz2E6jHwiJ04F9U4aZYLId1h/UfRoLZrOnSQNeCY2oyz2olOiCpwsH1Ctuxk6On6FQIXc/
 SOK95xbuw0JifvRteSfWF9wqQjzNDJ6Lf9VoPE0AF8HaieKhzHW5BoTbsDo8nWpazpjGr03WvA/
 DQjWBu7sHs0vgHmXxbyGw5kdDpzysV/vFPtzli1F3wl9G/irY+PTVBcR7sUbr1rmWTdNOmc7UzD
 sfNnPEFJzOHU+Aw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 1c273727ffa3ac54d0f1e66bd6efb784d2a8604e..98cfac4eac85295915b801a62d62c8d78f6cbc4a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -115,11 +115,13 @@ static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!readb(pl061->base + (BIT(offset + 2)));
 }
 
-static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
+
+	return 0;
 }
 
 static int pl061_irq_type(struct irq_data *d, unsigned trigger)
@@ -328,7 +330,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	pl061->gc.direction_input = pl061_direction_input;
 	pl061->gc.direction_output = pl061_direction_output;
 	pl061->gc.get = pl061_get_value;
-	pl061->gc.set = pl061_set_value;
+	pl061->gc.set_rv = pl061_set_value;
 	pl061->gc.ngpio = PL061_GPIO_NR;
 	pl061->gc.label = dev_name(dev);
 	pl061->gc.parent = dev;

-- 
2.48.1

