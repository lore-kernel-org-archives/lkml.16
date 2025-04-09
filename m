Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4525D537
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188053; cv=none; b=AlFKRiF+Nmlhs0UCUL0RqlJGxksLdUQ06KfBEu05IxtJyKwtLc+eIQbHvxSFNRaBr+zebbjfTmuzdrgR+TRSQHvgNRbCSBgpZIn/4oMwle4bhxCGxlfRs84TC6rPID73uMOl9HaQ0dm93NrI3X4l31fQHaOptgqi+zE9GvP2YF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188053; c=relaxed/simple;
	bh=gxGXKdhzWEuXStZiMA/X/hybIN564vOdNtFHOk/52z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmWdHgN3WlSS14TKxX94gJQGFjj4uxNrZ1sBANmRh1uPpbwMWI5BEvfrEkRih7TBLD4W4p4+KGCGqezVidwUCAh0M0N3jEh8eGNgubtRwG68JK8VBUqddb5hWPK0pulHOMogTdPx+ROIkTG7j0UPGMAgj4VFHG716uNK2n8rg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qPl/DwXT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qPl/DwXT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso36894135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188050; x=1744792850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqu//KhUPfwXLE3I5j0Bgts5m4hei6jVtXeNlPcXOcQ=;
        b=qPl/DwXTogxgfal1dsIk/fXWnJpxjU+oeatrNOXkwOhLXz6tODESad8tIfutUefAja
         tvPh700PU6UfCuypKrNpDlMh+tgzciClFhQq4wM6GZngWaekxEUqBEsQu9zAynPmRJLQ
         xyuwRqKhX9LLSYpP8ucgpJmzYg2JnRcbolpfwpjFQiVcSmtrdQcCRkuaPJHuKWMtSdk0
         45qVOeDkachjkVZcGXe6bpmWH/6tBg+uYFPsa0ihN2ljZIihvI2TlztWqsWRUO8yQD6d
         Kt8mZ4b+UAoj29XRJG7AzEeO/i2efbwb3wFCkNJYYpJfp64MG2AsiUqUAhqsEt0j9ADb
         pJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188050; x=1744792850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqu//KhUPfwXLE3I5j0Bgts5m4hei6jVtXeNlPcXOcQ=;
        b=Iym3ep7FRxZRP78oAqvmMBoLdTY+91G3UuNgurVXb+jfpYoLUQVJt3J9yT9uxnWld+
         WcAJB05cuaLdvgLUWpim01ieoHMrWBx5OJDNcYTYRA+X4T7OtDy0vstYhqXXlzbk8HJp
         +aVvuQ8LJZ6QUQicjZG8HyIJzAV/cFh1i0t805kky2reIYv2JWdzvHgA5+AN4q6r1KcR
         93XTaWIHTlPZJSJ8RmE/Fq8Uf/zT19/TE1J6+KvcRTHvnHL2zuU9sWABFzSwHGu5doLl
         Sp100qnHTGVJ8wcLT7dTs3OC6Uj5iSKqZhXu8oskbMSNxMYYtXrs1m2iGb8VDMyR8Ft+
         TM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5ba/HDJHiBWVgJBljTm9v2rE2Pcm97OfowPkM/TTvyg2bkqfneuW5fSDw6VgKsLW9QsoiwGWVH+65pMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FlIX8mGK+TzhPKWEWZ73ZV1IwkYqVtF248NQLgT4/GYO8jgV
	u0s+ptfzd/cJmJBuc3qoZR+u4WHpClxGDV+zVGl7Dk0cUlE6hmkd14z4r7iq4pI=
X-Gm-Gg: ASbGnctmomm86NqykhhN916+mkRtZ9YIeiQZdJYGMeOWri6a4ZpyJK4Yn56VYQDk1/Q
	5QAyZL1+FjsGXygsosPujX2BodbxhSHlKRVHbEFXQw7dkCV6QaM/G/Icsu3roeI/8o/kbnp5PQC
	gYiQ50wSh/9ga7RM0Aorn6r0iuqy0PaRG7o/j7gvDr4K+jROQx82/Sx57qvjXREppiQBW8eVIEJ
	bp9WztuvRzms63JQxH0sGDM2Vx7szZqvxbZZ30cORGbAgPKykiMyu66zJQL05WmsSxIGzi3EWMJ
	jt5Y8w8FEgbsrFAYA4veV7yGcFdMHc3z4w==
X-Google-Smtp-Source: AGHT+IFQaSQnLwU0VEjFHIjrpvzzFcZ2lgG8zcPTh7uJ/6342DrfMD2nx7Rv7HiTz2TTTzkRWCacnQ==
X-Received: by 2002:a05:600c:848d:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43f1ed6d5f4mr18545235e9.27.1744188049678;
        Wed, 09 Apr 2025 01:40:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:41 +0200
Subject: [PATCH v2 3/7] iio: dac: ad5592r: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-3-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fnDmXboqjAytf+JwxDCnzSlv7dbuRg+HhyIHf6eACqI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKLNjV6MOXlUjP2rTD/2/FOeowSfT1Iz3o8p
 2PkJLlW4rOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyiwAKCRARpy6gFHHX
 csZlEADg+yGd1CO9xt8lAUeIVl9cl+71kBc/LF9KILRniGeAMj/b2ppdqq1HEHYV87XdvZ+fG/j
 pxzgvy6bUJF7k6OKAaqB16j8WMsO8RL7MNb4sCdtztGiwfxXbj20ONS5XYeTJqmqreNKuC+LKyE
 ol5MSr413EKIw0g+DcXt3P0AGKx6H5BxNBDhTDCjENEn/JGs4lwON5oXceaTpgKCgxSX29988pa
 JXB6PZfOW3E3fYW0CnOzADIH0XAFQ43eBoK0CckalyVrLmFXGjnsMpPhoeb6UPDHCifI7TFTeUD
 Q+xC9DRuFydBmtdA+Bv043SBSlIKZ/sNR6RZ38wb1+psuVT29Ddqto/53NtdRo4EgosGM+Ko0h1
 pOCR5gL3RiWRkC6hW1s/xDiwwFwrrp+92eKMi91I2Dsoe/vQ6Fb7NESAgBl16ug1+V3qTyf3yc5
 zxvChnc5VXwk61r2Qv5d+Jc1sCOfy1KqBt1MfNKiS72Zgt5/NsaprP2Yn6dIM8TS5fo4t1Q03Bk
 RrZDBS3GBn3BmI6fFxoye2lwCDtyxSJAmBw6LO/keaNgT4whVlUtAG7hrC+2B9AcR1foEllvTnu
 XDbITsldtco9wbVKPpv7KhHligDhKC8NZSou6FshdwxFeB2l9YM6jFxsyRL2u5nx9hGriDt2tTM
 0BwgkjC6xNNGvvw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index ada60f5ff1b6..c4c3453da823 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -40,7 +40,8 @@ static int ad5592r_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int ad5592r_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 
@@ -51,7 +52,7 @@ static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		st->gpio_val &= ~BIT(offset);
 
-	st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
+	return st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
 }
 
 static int ad5592r_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -128,7 +129,7 @@ static int ad5592r_gpio_init(struct ad5592r_state *st)
 	st->gpiochip.direction_input = ad5592r_gpio_direction_input;
 	st->gpiochip.direction_output = ad5592r_gpio_direction_output;
 	st->gpiochip.get = ad5592r_gpio_get;
-	st->gpiochip.set = ad5592r_gpio_set;
+	st->gpiochip.set_rv = ad5592r_gpio_set;
 	st->gpiochip.request = ad5592r_gpio_request;
 	st->gpiochip.owner = THIS_MODULE;
 	st->gpiochip.names = ad5592r_gpio_names;

-- 
2.45.2

