Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFA01E571B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183043; cv=none; b=qq/zuKaKPhUlppS5QJSVH2zCy8CPe6kEEJwTeDGXK8/15dJHq+gfDghPa6dXA4qxnkEmwnp1aBdPMMq43rbhcM/bfb+qlgnZtLapF3mvwlyF7pnhxKe5ko5FjWc5gi/LEuZ2dZs+RbuROqS43z0Znw1TF3MgE/FWb9ArO5LGeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183043; c=relaxed/simple;
	bh=b3SV5k/KQygSUmsLcH/lbc71WE3VIsoF0AdcugQYbDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqCk7HYJkQrSE75vfIB3vDAaGCc/CaMAxwoVax9Vb+fhQs+pdBDrx0rIDfH54nFWlgWDEPdGFt8qugWQjgKF5gZQtlzzhWTSy7jkl3obqXrih0E9Y067hZs/zs7BP1w10F8KtLlki0Yhh6tNPWyKLXbnwEfLX5WMZ9QGG0Uu83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mcm2onaS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mcm2onaS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso1597666f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739183039; x=1739787839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ank6bIl11Gd54JLurACsKZbr/Yd6r6NjJq6xSc8Bh8=;
        b=mcm2onaSlypuq7rV6IIV/YXCq1YPVxESOnYvvtkw+FQNtI0lGCYr7agK7lJiTh4G2u
         Ksw5l0yIxDUSLdrOFzE5WQNttEa8jr0YCvcHMUC+OpqHE4vTYDYo9TIhjkYjw3DS2OQu
         lWJ7TLSnIXAtC9rKjHUrUOjXw8qhhJp8Z3AKf3tSU2xRdIVCdh0f8LCi6mfFCHbmB0m2
         SnfoB+klg4n9Qt/15Z2x/X4pPFgNLofTykg3r+n9YzGEs59jbqMVGqavrkvSQRnP6W31
         ZvhBQRkxOnLfxZIu/fxHsoyxzhRdsyCm9ZvRW1KD+mm0JhZzq+DKWHHxz+OM2cCE96tY
         WUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183039; x=1739787839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ank6bIl11Gd54JLurACsKZbr/Yd6r6NjJq6xSc8Bh8=;
        b=aSfGcFgopdtayC31Dqs5uGbLIkHex9EMWUyqP7iL4cD/3ADZb16yk20SmXm/9kNptg
         TH6/kdRcsIhRwevr1os9yA6iKLFpEqXNuqYS5b1rUrG20wxJIAhb1aidN8WGQr9GvDN9
         5NibjY4IBBAegg3GLogwv6J3Q5Qet+PZvA/tm2exVGrsaJiQIQu78f2TWJMhvV2BJcYv
         LW70bRnTeth8qMjs41s/oNsexxYMAgB642w55HG7s12c3Ya5ehCdcMY1Tash1sRXIbYo
         SUDtIqyU071ZFb7TK2Kpx6QWRd/kpaL7MzRN9qZHZ/U3Lp1tvC6UksNdl2xqPigPS9K4
         YTVg==
X-Forwarded-Encrypted: i=1; AJvYcCXsL3rE7RHfW43EaMCgf35rhfor1y2y1araILN4jae98c7DxGDKNZTXwv0Jz9ekTb7O0GRtonSr+w7F1/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IQ1/GZbVAuPJXbMm1sGmkTeisOfq7jVOzL7bk3cou+SBBq4M
	UAnpAiWpim5hP9+c0qOJZIzdkH0h5e9WnBZeyQHRJ3DWHmjVR/gFon2QyjPgjH0=
X-Gm-Gg: ASbGncssYtTsjv9PmrJWZ8miR6YZdSvbKDqQsIV2JbTrUr0p+XlHo12JYwSUxaFykDd
	t95bRrWzOTaBYnYR2xfIuICLrWjozqOw9KepYugstmzOUFTZ5it7LGxm9pCZp+AwqRaOc8EVVzu
	nEnnDGrTzB3+L7QksM953uoS3oNOUpl6pBaMlHqoXFtAoIbHXLWaNlKIJIdqnf+geKPnFHfUYTv
	3vmnQ95UIBgN1npPMvWFo3BSaLGZBDxtLkw7Hmvw3zKPD+orPwccseiflKFucanKOFTFkgOi2K6
	RwGTrDq2u5URJ+I=
X-Google-Smtp-Source: AGHT+IHCZAdBMpY2sRfYAHGzsluTp1uiQftR0w2RkUbnpBtWvkkmyFwOKCoa7AkAT+7SAHKlPsYaMw==
X-Received: by 2002:a5d:420f:0:b0:382:51ae:7569 with SMTP id ffacd0b85a97d-38dc9104440mr7170729f8f.18.1739183039083;
        Mon, 10 Feb 2025 02:23:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm5846535f8f.83.2025.02.10.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:23:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpiolib: move all includes to the top of gpio/consumer.h
Date: Mon, 10 Feb 2025 11:23:52 +0100
Message-ID: <20250210102353.83132-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have several conditional includes depending on !CONFIG_GPIOLIB. This
is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
practice there's no difference on modern machines. It makes adding new
stubs that depend on more than just GPIOLIB harder so move them all to
the top, unduplicate them and replace asm/ with preferred linux/
alternatives.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/consumer.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..8d467344528f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,10 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 
 struct acpi_device;
@@ -183,11 +187,6 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #else /* CONFIG_GPIOLIB */
 
-#include <linux/err.h>
-#include <linux/kernel.h>
-
-#include <asm/bug.h>
-
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
@@ -608,8 +607,6 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
 
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
-#include <linux/err.h>
-
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
@@ -635,8 +632,6 @@ void gpiod_unexport(struct gpio_desc *desc);
 
 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
-#include <asm/errno.h>
-
 static inline int gpiod_export(struct gpio_desc *desc,
 			       bool direction_may_change)
 {
-- 
2.45.2

