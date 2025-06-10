Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C199225A35
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566318; cv=none; b=txk/loG+0/HSszCIcGTMJ1DhJ1+5VvUlpJoKGM1ZjNnd8EXKClVMuKSU4kvMvmijwVo9xPlv1KjHmOxioWKTN0WwVcH147vSLyaa00ivr1tBCsS3etbwCaVzADcLsbhthYgYhrGusxOzWKbD7Y9U85L9znB8/eEo1hce6XKEFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566318; c=relaxed/simple;
	bh=2i3eMCTDD/ZK85w+pfSMGIh1H7DR5YiKUKwBrEFjB0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqulWl83qYIVp62WDhWmSTIYDFIspDshDjgjGwMLirdvT8rq6f/fMztXHHE4epeNcaKIZ5D8DX6R/6WQIlzoX2rMIGabD33oldCx1XcR3sx0zaxBD8sQF0RGktVHLgpWngzqPRJkEFJ1hsZlSZSdqVe38iuHmlLd2MXUVXX16K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xzqWTvjM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xzqWTvjM"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54700a463so1518165f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566315; x=1750171115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFKF+c+Y40KVmL7E85VKf6TTXAyUq7dCBYKSOqXQFJM=;
        b=xzqWTvjMILYFmwRjRtMFB2HTyEcW/Nyr7/PtH/HDLBY0Uk2zo/Ym5+/Y7Ky6LPDzYL
         HcKIW+ewpk1nk3UjBD7mVymKf7n2nLpQIsRik+b914+fzsLUBmcKclr3cWIKUBfA0JLP
         zp3biStMHyS4yWVFWOiE4ZSI/P2rFRRaIY5jSu4dKj50jhUQRTVgklk35gBYV+W571hy
         0v7gexF/TaVW42em/tDLEOEg8Kz7J9bI9g9qzLNEpYimDGc4vpTUfsFKWw9joMo7P0ec
         mHQDh+/smm8tsLYsF4DPcRZsV++ZeG2OPHxW9Jy5xOb17k+PGy6Istbew+WCcckp/FTl
         lw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566315; x=1750171115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFKF+c+Y40KVmL7E85VKf6TTXAyUq7dCBYKSOqXQFJM=;
        b=dco1nru7yDhU6GzKyYZvc8MjLINY6prfa9VVY8SR6JtKFYMAIqEZX5M9i2kbo8l3xu
         /UDhQfhYQnUlVw5HiiJKxV3GJ10Mvo7TBCCZPu2LkL/s+1PgwQClADHNJYJYuRIyBtAn
         p2gzOQ+6mVGgBW7sT9/zXZjnU/xbzilXcAC+D4Hrjp8g46VPEXhoy/DNLk/cJgd97/AC
         dk+lEaKcD61cCRwVMs+Z0ZDSQtpvCSClGtr49HC1NCpaY0s63SKBO0nBksUm1H7HFNNB
         ZUlAGKsKsRh5ASX10qUQ+pWE6yL5wr2TaVp0DaHMaI4KpGXwhKU2pXd/GZUtuSwETaoI
         /l6g==
X-Forwarded-Encrypted: i=1; AJvYcCUcamtWFuD7xe+qACKw/OOtcidTl8cl6sAwGIxcrwgguOn/2wFBDOwxxTEsmqTZUOF/ADMXn662PNLZZfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIyFk5+aKzajZZGrOdqWm1eFH4U4DhM7fU9DFqJyyh/nhGTD7
	iq92fuhmX7LhYj8lc1epAquBwHlZ7DZDyNwibkNXVD0lBcGDK50bmtGadaOd8QQdta8=
X-Gm-Gg: ASbGnctJqRisghXkHqV05r1wNql2/t9rzi/3OSoWFK+LVVILa8anLnnBNz9p4wBrZ4/
	D7F9pfrroIvqYr76V4iPYNPhiHzPqUXi80UGNpPphdS8YW8Ru4GAzGIO2jsWY1eEvn7wIQwoTd2
	oBNvUHgOFxMccH6z759wSivMSnMvevZVWdpkrKvKbwo7rvK9YL1LYCDhWqxp3S3vn7iM9Ef2QQB
	h8Uxr2YB1kOacF8XeMGA0sRtY+FnjRO55MhOhtprMc7PiyPjzBgTdbKWFK8Ep7lf5CdbI+UyhZX
	3AlktN3UM0emn9fwkicF6unMT2jVy0VQxMrCFbVgdQSyV041A7ZaHGi3j/TqPTU=
X-Google-Smtp-Source: AGHT+IECbU4hjZU9sCCG6i4ZxFM91y8FwBqtSLg4Qf5RSAv8WzK3WKhk1i/LqRYNTnbUtcdd56QJBw==
X-Received: by 2002:a05:6000:4014:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3a5513de3a4mr2961541f8f.5.1749566314767;
        Tue, 10 Jun 2025 07:38:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:22 +0200
Subject: [PATCH RFC/RFT 07/15] gpio: sysfs: add a parallel class device for
 each GPIO chip using device IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=w7p2yull84975cImPopktS2uQOfBsB0R5FKe8qO70gA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENhEmxY4aZlgWJMH11gEUNSIR4WcLQEjT2HQ
 S1PxDMP4luJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYQAKCRARpy6gFHHX
 chK1EADYlG2LY7SHs50ScXDfPYSEoxyHNpcHzohgWjYDOclTcgHIXHnu7WauGqxcU+R4CC3mK1x
 e2GOVvZ6aKIg2Z3GckgiJsqyGgoW6KyaaNfBSMIxQIXZpvpQI9fvQBpCaOr9wz39s/vMkTf0EwP
 M5LtNxrqRFcF7tHCVAteKVoxVWLMU0ob300Zs9UJwZInO0mP9pxXB/JhGazhg2HaZWzWeCa5LSx
 Msd1uIe6fSj4ydBgz7imvEY/xmIwyAsY6yWwSq1ayE0RR8f76B3IUdbwEJjOfC3FBBPVBu9pRfN
 Vu0gH5ujvxe7qlj24ISHshW+kqMzmvHWDwTY+arVNQgU/MtRQrbE8+3sfbTx5OqA5YqUm7x0oEd
 sVDLYBh17tptCx1ySYwejEd3N/NRZBFGHQt7hIRnCuDnZfd94P4NJH3FdmBpjHDrkkzrInsP7rE
 4f45QloN4lVIsZIvK9WaEgDAFOP303OPiTBfgTwqq4BDlPOPFfPVlexsRZ17DBJP93tVcm3l7Tp
 P3kVOO8jlfVdRXDOgiolfMpZNUZooRqKW3R95q1VHCsSX8Th3+pGZWH0KXrH8xl20FA0KoaLFlN
 fXvJJ9ur7TXSih0EGalulEUv6J1TuYMBTJnV28uQ+DHR9DBGPGO4cwva3KvCZvUizYn024mz4ug
 cTEQEX//BD7Z/+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to enable moving away from the global GPIO numberspace-based
exporting of lines over sysfs: add a parallel, per-chip entry under
/sys/class/gpio/ for every registered GPIO chip, denoted by device ID
in the file name and not its base GPIO number.

Compared to the existing chip group: it does not contain the "base"
attribute as the goal of this change is to not refer to GPIOs by their
global number from user-space anymore. It also contains its own,
per-chip export/unexport attribute pair which allow to export lines by
their hardware offset within the chip.

Caveat #1: the new device cannot be a link to (or be linked to by) the
existing "gpiochip<BASE>" entry as we cannot create links in
/sys/class/xyz/.

Caveat #2: the new entry cannot be named "gpiochipX" as it could
conflict with devices whose base is statically defined to a low number.
Let's go with "chipX" instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |   5 +
 drivers/gpio/gpiolib-sysfs.c          | 191 +++++++++++++++++++++++++---------
 2 files changed, 148 insertions(+), 48 deletions(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index 480316fee6d80fb7a0ed61706559838591ec0932..f856e286051d6bfa4990660dcb25b3fdb27cd0f2 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -27,6 +27,11 @@ Description:
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive, not necessarily unique
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	/chipX ... for each gpiochip; #X is the gpio device ID
+	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
+	    /unexport ... to return a GPIO at HW offset X to the kernel
+	    /label ... (r/o) descriptive, not necessarily unique
+	    /ngpio ... (r/o) number of GPIOs exposed by the chip
 
   This ABI is obsoleted by Documentation/ABI/testing/gpio-cdev and will be
   removed after 2020.
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 956411fc467a26a9827c616d8dc067c70f9244bf..a3403b963d6488aad24e47e9e28e0439676de704 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -46,6 +46,7 @@ struct gpiod_data {
 struct gpiodev_data {
 	struct gpio_device *gdev;
 	struct device *cdev_base; /* Class device by GPIO base */
+	struct device *cdev_id; /* Class device by GPIO device ID */
 };
 
 /*
@@ -399,6 +400,14 @@ static const struct attribute_group *gpio_groups[] = {
  *   /base ... matching gpio_chip.base (N)
  *   /label ... matching gpio_chip.label
  *   /ngpio ... matching gpio_chip.ngpio
+ *
+ * AND
+ *
+ * /sys/class/gpio/chipX/
+ *   /export ... export GPIO at given offset
+ *   /unexport ... unexport GPIO at given offset
+ *   /label ... matching gpio_chip.label
+ *   /ngpio ... matching gpio_chip.ngpio
  */
 
 static ssize_t base_show(struct device *dev, struct device_attribute *attr,
@@ -428,6 +437,111 @@ static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(ngpio);
 
+static int export_gpio_desc(struct gpio_desc *desc)
+{
+	int offset, ret;
+
+	CLASS(gpio_chip_guard, guard)(desc);
+	if (!guard.gc)
+		return -ENODEV;
+
+	offset = gpio_chip_hwgpio(desc);
+	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
+				     gpio_chip_hwgpio(desc));
+		return -EINVAL;
+	}
+
+	/*
+	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * request and export were done by on behalf of userspace, so
+	 * they may be undone on its behalf too.
+	 */
+
+	ret = gpiod_request_user(desc, "sysfs");
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_transitory(desc, false);
+	if (ret) {
+		gpiod_free(desc);
+		return ret;
+	}
+
+	ret = gpiod_export(desc, true);
+	if (ret < 0) {
+		gpiod_free(desc);
+	} else {
+		set_bit(FLAG_SYSFS, &desc->flags);
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+	}
+
+	return ret;
+}
+
+static int unexport_gpio_desc(struct gpio_desc *desc)
+{
+	/*
+	 * No extra locking here; FLAG_SYSFS just signifies that the
+	 * request and export were done by on behalf of userspace, so
+	 * they may be undone on its behalf too.
+	 */
+	if (!test_and_clear_bit(FLAG_SYSFS, &desc->flags))
+		return -EINVAL;
+
+	gpiod_unexport(desc);
+	gpiod_free(desc);
+
+	return 0;
+}
+
+static ssize_t do_chip_export_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, ssize_t size,
+				    int (*handler)(struct gpio_desc *desc))
+{
+	struct gpiodev_data *data = dev_get_drvdata(dev);
+	struct gpio_device *gdev = data->gdev;
+	struct gpio_desc *desc;
+	unsigned int gpio;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &gpio);
+	if (ret)
+		return ret;
+
+	desc = gpio_device_get_desc(gdev, gpio);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	ret = handler(desc);
+	if (ret)
+		return ret;
+
+	return size;
+}
+
+static ssize_t chip_export_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	return do_chip_export_store(dev, attr, buf, size, export_gpio_desc);
+}
+
+static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
+							chip_export_store);
+
+static ssize_t chip_unexport_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	return do_chip_export_store(dev, attr, buf, size, unexport_gpio_desc);
+}
+
+static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
+							  NULL,
+							  chip_unexport_store);
+
 static struct attribute *gpiochip_attrs[] = {
 	&dev_attr_base.attr,
 	&dev_attr_label.attr,
@@ -436,6 +550,15 @@ static struct attribute *gpiochip_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpiochip);
 
+static struct attribute *gpiochip_ext_attrs[] = {
+	&dev_attr_label.attr,
+	&dev_attr_ngpio.attr,
+	&dev_attr_export.attr,
+	&dev_attr_unexport.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(gpiochip_ext);
+
 /*
  * /sys/class/gpio/export ... write-only
  *	integer N ... number of GPIO to export (full access)
@@ -447,7 +570,7 @@ static ssize_t export_store(const struct class *class,
 			    const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
-	int status, offset;
+	int status;
 	long gpio;
 
 	status = kstrtol(buf, 0, &gpio);
@@ -461,40 +584,7 @@ static ssize_t export_store(const struct class *class,
 		return -EINVAL;
 	}
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
-
-	offset = gpio_chip_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
-		pr_debug_ratelimited("%s: GPIO %ld masked\n", __func__, gpio);
-		return -EINVAL;
-	}
-
-	/* No extra locking here; FLAG_SYSFS just signifies that the
-	 * request and export were done by on behalf of userspace, so
-	 * they may be undone on its behalf too.
-	 */
-
-	status = gpiod_request_user(desc, "sysfs");
-	if (status)
-		goto done;
-
-	status = gpiod_set_transitory(desc, false);
-	if (status) {
-		gpiod_free(desc);
-		goto done;
-	}
-
-	status = gpiod_export(desc, true);
-	if (status < 0) {
-		gpiod_free(desc);
-	} else {
-		set_bit(FLAG_SYSFS, &desc->flags);
-		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
-	}
-
-done:
+	status = export_gpio_desc(desc);
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
@@ -511,7 +601,7 @@ static ssize_t unexport_store(const struct class *class,
 
 	status = kstrtol(buf, 0, &gpio);
 	if (status < 0)
-		goto done;
+		return status;
 
 	desc = gpio_to_desc(gpio);
 	/* reject bogus commands (gpiod_unexport() ignores them) */
@@ -520,18 +610,7 @@ static ssize_t unexport_store(const struct class *class,
 		return -EINVAL;
 	}
 
-	status = -EINVAL;
-
-	/* No extra locking here; FLAG_SYSFS just signifies that the
-	 * request and export were done by on behalf of userspace, so
-	 * they may be undone on its behalf too.
-	 */
-	if (test_and_clear_bit(FLAG_SYSFS, &desc->flags)) {
-		gpiod_unexport(desc);
-		gpiod_free(desc);
-		status = 0;
-	}
-done:
+	status = unexport_gpio_desc(desc);
 	if (status)
 		pr_debug("%s: status %d\n", __func__, status);
 	return status ? : len;
@@ -561,6 +640,11 @@ static int match_gdev(struct device *dev, const void *desc)
 static struct gpiodev_data *
 gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
 {
+	/*
+	 * Find the first device in GPIO class that matches. Whether that's
+	 * the one indexed by GPIO base or device ID doesn't matter, it has
+	 * the same address set as driver data.
+	 */
 	struct device *cdev __free(put_device) = class_find_device(&gpio_class,
 								   NULL, gdev,
 								   match_gdev);
@@ -785,6 +869,16 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return PTR_ERR(data->cdev_base);
 	}
 
+	data->cdev_id = device_create_with_groups(&gpio_class, parent,
+						  MKDEV(0, 0), data,
+						  gpiochip_ext_groups,
+						  "chip%d", gdev->id);
+	if (IS_ERR(data->cdev_id)) {
+		device_unregister(data->cdev_base);
+		kfree(data);
+		return PTR_ERR(data->cdev_id);
+	}
+
 	return 0;
 }
 
@@ -800,6 +894,7 @@ void gpiochip_sysfs_unregister(struct gpio_device *gdev)
 			return;
 
 		device_unregister(data->cdev_base);
+		device_unregister(data->cdev_id);
 		kfree(data);
 	}
 

-- 
2.48.1

