Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410428B7F9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424293; cv=none; b=I79hI8oNkxME/5m2bq+cBE3+C43nAYzOYB6297oAG1oEc5lQoIb8MM3J2uV3s0WzOONmwAqspU/V+TzpWvzf5xp8MBy6Czu5tXO/PklyS3Ek3Jb2tpz2uTfiBazkWXogX9sKS0bE+tiaReifjUBzoP7K0HA1WCATdTj4szjT84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424293; c=relaxed/simple;
	bh=QzgSzSdgFQpMV6vi4R4Hr5EA7NH1MJn2zgCyrL0G/xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1WImobgWIgcPkx6oVfthyVg5WxBxuz6chOoZqrdikBCfIP7LCafjJHHjHX7r8JIRe33RwwTRJAnnQCegPVJznfS8VwQLGWh1TUQujxxV+uJpPS8sUBF2jrJMo1xhpdVqA+UynGpD6kmi9q0KLvRdBOkfmQ1otG2zZWOdP6fZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qJJYYjji; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qJJYYjji"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45363645a8eso8097955e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750424290; x=1751029090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFep52We3e7eodnFSPYWgYhyC/cFCZgWW5oCjRTeESw=;
        b=qJJYYjjiZ0VRvC2TTWmxtdd0JpzYdo31DbwBtUmWV7V6834jkIwCbbSrlTOkfiZzVx
         dmG4J09D9WECrqZGi8lWiEfHiKRthAv4XzzkrNrBu0eVHKjpwTvMRyKTd+aJ+RW16eho
         vUUV5kgjqoQAAqKSqvMWXFlO7KNkDL03hfEi5x2uItfUyrdN3TjipAc6iBhaeYq7vwU0
         WfXkyTOmf+7qDKfK7MllMKPM3xgZcd/yC0bHVdIUP3juc/yORCwxsARjBaVnmo1Cuq5O
         iZqrimyBBiYv93q24XOqD4z8o5Yd7g7zn7BrecwOjLNw4jRb44UoBxl0XM9k9KGokexg
         TP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424290; x=1751029090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFep52We3e7eodnFSPYWgYhyC/cFCZgWW5oCjRTeESw=;
        b=cvdG+7RZDfsK8NBdtBnclG4VttPKUP4fGcYzdRGCVfBjaEyHpQzaC23Mrrso/5h5wu
         RKRdKr9k3bXxawmpr5vO0xd/iirBW2j/Hsp6V0Hz7CEO4Afq/Ks6kWsFvG3SuD3PDQgx
         rHRihBFZtHzJIitSf+X8NcK6n3ITOmJXNWZLd+Ft2jDA5iRMZRIJX08JPrtjS/CDF28X
         youy/4cZbekGPvXEL/tcb2V1A4O0MZEPuCbm4dFp2Y4rEcmTpG8dceZQa2fl6K4QiDeD
         u7HFMa/Z0TcGtOqUREnEItrGYHJX4fywVjmBoFXHG9uYsH1pPg2EXU239wrsi2ZM+mA/
         mUag==
X-Forwarded-Encrypted: i=1; AJvYcCWHgx2i8dUSnvJf9k6kY8qrQGcir3Z7mKg5gSZ3P45N3Z92sxUlee9IHjM2NuJKBnBHNSlH1cVRktr7ikE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgS6VnsQ4BYNffxVh0ay6Ca5mmsrTEsrujDTPBVur9Qqoyk3vF
	y8VO6uHhONGf5xvOCj0KqPGHj1RXxAYNInADnmKf/M6aAf7zXg33EAF5pHBqsRR7CWs=
X-Gm-Gg: ASbGncv7zfjoEDMgMDbevuIB8Im4e/xLIlRmtfumWkGWYNnbWScWeEIxbMGgiv2eqda
	D7OgBl6yrrFEL7ZdpTneB6KWZuZWUeHnFvCjJc8l4zI6iLW6vJpCAnCWtkdWUTeqXSSI1cKMWC/
	BYq2D6AS8qHDkb/n31A2qO1rXWoQS1Byoakka9+6PmTnWFMqFGUSDPtXaMXSG7EXuUgv2XJ2VOm
	zuhx5B4lXj2lkrF3OlR0T+ir2E8DpI/1EzL3Lmz1+dG7f0S6QK8q1kDtm/03wOwl0/r66DMZMTi
	VQEdDx/uhYP5ExJ0yL3/VByXe+hjpcrJHQJGYwXYbsXt0VcbwGXS5Xdv
X-Google-Smtp-Source: AGHT+IFZYDVz4aKx1KOULoKaTk/WiIx3+5mte4OaIxsu0t2J5u+9wkQ7uuT6dOIz0QJ3/aEgouUcmw==
X-Received: by 2002:a5d:64e8:0:b0:3a5:1c71:432a with SMTP id ffacd0b85a97d-3a6d129f557mr2636311f8f.14.1750424289589;
        Fri, 20 Jun 2025 05:58:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535fdf82f9sm50522975e9.29.2025.06.20.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Jun 2025 14:58:02 +0200
Subject: [PATCH 2/2] gpio: make gpiod_is_equal() arguments stricter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OFq2jjk5hEbzcqRvtGSawof0gj1zKwJLAuw+vgBeDAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoVVre2l2jVIykSM6DjZOZSIVHOOXzz57CRVo1p
 OuZbSpX0qCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFVa3gAKCRARpy6gFHHX
 ckyhEACozFTJsI5pvYRzEr7BZpy26bXIfNNiqBUNTJopoLAfUluRbpKTwNhek4q3QEJOLx7MbjB
 D8m1wjOzRxqH6liH28UCFAR60CDMwW4Be5yVXUJ8BvZkwR2w5+4MzSO1ciObR181Ju/N2JuohY3
 UtXqyXwRCNkyF1ONfR9Zk1AY4NfzY/xz7v1luYTFjXqwcTMe0u9pkliqbt/OGWY6Pk2PHtVn3RQ
 Bg1Yr9x2YQXjqvLaCPdbqBlZgawMg2+qYw5Yv85xk32+fXmgzKM6DhQX7y1olF96jm2hk69SIG8
 FLOt9wEZBDHKAUK+vK+QtWSpw9a8wPrD5Yw/fVCYQYzCDtjfOSpj1cBzFmdUM+GnwzxxWO6Va5T
 BtkWnGOZlen92R0gAgW1mnEmpUc/t/8cTlnNRi3bEx/gMph7InTeclCQp9YWQQllvfZrdazJkZw
 Rz6uTvbl1Hb8TGREyW2eh65l2JqGm8BDKOCBSGhZg4BT79BUB0l+Oe0VLdKmSldyg35wZ+h0Cx9
 MT/UPR5dFadgIGt2XNlotgcACLInMOj2LIs6IvqP1qhEX1tVyipHAPbTkEz1hCXi9E7xwgh880f
 tLJajg8sVFJJCCtuzKOR3B2L9rovuuuXBfn+Dyokcir69VxL7yubGf+M9m92HqNn/V/zO1EYj+A
 JA25WnUfC71vjFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It makes no sense for a GPIO descriptor comparator to return true when
the arguments passed to it are NULL or IS_ERR(). Let's validate both and
return false unless both are valid GPIO descriptors.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Link: https://lore.kernel.org/all/Z_aFBfjb17JxOwyk@black.fi.intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b4f94c3887fcbe1d90a0ff5800100e9ae7ad5b9..7b2174b10219964a3f106562e1685a6d900d56c8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -278,20 +278,6 @@ struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_gpio_device);
 
-/**
- * gpiod_is_equal() - Check if two GPIO descriptors refer to the same pin.
- * @desc: Descriptor to compare.
- * @other: The second descriptor to compare against.
- *
- * Returns:
- * True if the descriptors refer to the same physical pin. False otherwise.
- */
-bool gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
-{
-	return desc == other;
-}
-EXPORT_SYMBOL_GPL(gpiod_is_equal);
-
 /**
  * gpio_device_get_base() - Get the base GPIO number allocated by this device
  * @gdev: GPIO device
@@ -400,6 +386,21 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 		return; \
 	} while (0)
 
+/**
+ * gpiod_is_equal() - Check if two GPIO descriptors refer to the same pin.
+ * @desc: Descriptor to compare.
+ * @other: The second descriptor to compare against.
+ *
+ * Returns:
+ * True if the descriptors refer to the same physical pin. False otherwise.
+ */
+bool gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
+{
+	return validate_desc(desc, __func__) > 0 &&
+	       !IS_ERR_OR_NULL(other) && desc == other;
+}
+EXPORT_SYMBOL_GPL(gpiod_is_equal);
+
 static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;

-- 
2.48.1

