Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D978A233D8E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669222; cv=none; b=Z11WbNxeV6VauUwue+CiN3J6g3wjRmTFhWVxWb6agm9NkVvOIfadgQrbc7CTAyOEGRm2V7SzxhBSpwc1AtUFBlnzDcb48xVVo28qlzmoZVO5WO5cqKE5GQRnQp55vp32aTE0sEjIGDsQnOz3xfpBD+H5frEy85CCbcNAlXKqPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669222; c=relaxed/simple;
	bh=2VmufPqh0O8zob2k65E7xE6hRVRWUfbSQ0bsi4wykUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVhgIS9iYpZjIUxaWrdh/9X+r7uUW2OXG0+7nh0c0Yl7QY4S8ExGOCV6MSYv0pZnkSDIUsWYD5iu8LqJFwud1q5ohynsZ/4Yy+UNAsDzib2cBIWZSqVk0mdZmNV/aaz6T9959nUMC194/WcpkGCSwOTt15jYneS0t8/IEt1Dhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JZQofE3w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JZQofE3w"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2148422f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669219; x=1751274019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+0vM7w6nkRT64n1GtokbFb/+RihdtSIZj9Jo0wZAR4=;
        b=JZQofE3wn7nmP9NtwCUxp12LbKFEQek1YeFcOA9zdNu2xrD4arz2dLRN3lM80WAtEc
         gMgw4iAi9Hc/aHAIuRWBGlerdGO+7KOm8S16zRndzanHl7GyRxjYb2W22aM1KSXlSeGf
         8wcQtviHrjuuAWRxw1pc1T4yrTgJhINFBkJTjPr0TWq5v80Q/RpzH6wMwnOVNcXyorYb
         5QdqTyU6416ffwyjk9UEVdGvsbsxVIz0qXKMu0TQHNY3stw45/PNb9VBafy7OaWZJK4w
         lksJdjlIRXwaK6GgDNlmKICWbjVY6CJUOv45XI0D9w6GILx3+MbzcNlY14lavE43iMsL
         p0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669219; x=1751274019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+0vM7w6nkRT64n1GtokbFb/+RihdtSIZj9Jo0wZAR4=;
        b=oIQYndGelo8P3zNzjkupWmVdaATvLdFtapxWFp4ZwGb9Mnble/h6epyLMSi/L0y2Br
         yCe2ccRb3zDU5Xy2sOhlycflK+C+foxnlUKEDr1Cn3lloBJtZqFVfxfGAZAR1ytpm6lZ
         kEvy58sjjZka0g8JoItG2BgFbiMRObCXLafgFGjdCEHL5vATYKrg5onhpTeRE3QkYcMo
         vU7TjBOWJFd4K4E1gjZUul3S67vM/YlDbGy6BtRG51PN96ZS2xtH9dppJX/cnMnZpsWY
         q1S2FNyvkpjB/wuKyyu6npTVFgkBZZct2pK76tpQaYbasqLZyO12z1M5/wVqvi24GAWO
         v5jg==
X-Forwarded-Encrypted: i=1; AJvYcCUZessjQTYONCSod8KYJlH841IgXvL7lU6ffQIKBJwmH7X6i4k/pJ9q5JoG9liv9bIVkfhtSlHriiy2Ftw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlsSAdSHCcuR9g/nzn8+phUa40dIlSfseY/hdsVV4gGXpRqRUm
	XtNqWZ2Uobe1O0RHpZ+yS20Y0AuiP4qjSIYh9hupn3jI4r74FLu3XBNN8on5DF+RYXY=
X-Gm-Gg: ASbGncvgDoGsW3IN/SmtVTdT8EumjNy8D1+5Rcv9SPYj5N4vVGcD4424GrqjbVTMfDF
	m9ZnShCXQ/F49MA7nvjfuBam15RHyRrn48CYdV8srgOPBSRd/BBGh0QVCu9Obxxe2eWhZCZRjFD
	rXBRO9hAR6YNRrzzFv4rwwguYXUrgepBdl7zuiuYSNQ9Uls2WgUbRLBJ/9QRN81dj8afyWvIdv1
	3sWSwRaFh03wTcq15/VgVdWBEJpbD0iwg9xmoxqmQwMgTR2ffX+44A8Nx5fa5pt9aSOKqUof1DA
	rZGjQdQhFieepuv4wEjxit6M431qAcAmuZqP8B79h1MYlCe4akCepRU=
X-Google-Smtp-Source: AGHT+IFaA00mQlzYeRtEKnzTDLTtco3gZtnGppI8xwcvEBY8Eay6CEe1tBFIEgHISAmJkVX3QY4cDQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a6d12d5316mr10971030f8f.35.1750669219164;
        Mon, 23 Jun 2025 02:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:54 +0200
Subject: [PATCH v2 6/9] gpio: sysfs: don't look up exported lines as class
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4839;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qH4qu97yZoN50VbMeaJJSPzOabP/6j28qPrt7PTU/qo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWRealUcoRRY0OStafiz3dgD4Xi6PpbdP2Ydn7
 5yVnpwrFFSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmgAKCRARpy6gFHHX
 cgMpEACVlJ7OIqJln5Z9luPvKIw8+qN0RAyFHrmMPwFjT7tyyRoVcnTYKcg9OgbENdzKndXVHfr
 V33Vmj9PWFv4bXBoTvbBeKAE6a3uL6DJaHek5XMqER4o6AXOgcxgdgp0DDCuHw4mJLu+0CjOUxa
 sYfaRyW8T8rx4DMiW9JnxaVmsjmYorzhVY+Sib0aHQz39Tsv1NrmhFo2MgqFEYEBHLKYls3LIXu
 9p0zlG6SXtkx+vMTLm4lwLOZRYNMfYbb1ktbkmkCZaP5e2wrSMrLkNS1KYKAI+34bCoZOnm6D+2
 E6tp+Cn0bHj0IMl1oKDVwKBPUk2ViqQjDRbPE8G05Rm+368eNwEXbPx1B7R8MxUYsB8nEGmLX6k
 j+cQOV5eSg/9sMSDhHZIhSBAOmzY3H8aScjEjuNngVJ1qBLQtse0GP8eR9Tgtgt73x5YBq/1k/n
 RbXhyEr+w4hJgFLhCWzJT6V5adNUlqiq99iy7GeFrbfzIL+9+NTw8sFIIAeiFf/DH53uZTLCqj9
 1xKN/lid9CzrBHZxGdTCrN7uiGVmrMSjEoXOA3t9pgr+wHuyxAUJ5XQzBQ9PplET2DBKMJ3Ttgg
 1sRUxRnqP90dd06kaqAEvIDd0GBEfFkH4V4Lv99Rkhc3EmIRQbtDvG6brFH2xmqPv9F3V8CLGf9
 u3N4L7L0fLHqfeQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for adding a parallel, per-chip attribute group for
exported GPIO lines, stop using class device APIs to refer to it in the
code. When unregistering the chip, don't call class_find_device() but
instead store exported lines in a linked list inside the GPIO chip data
object and look it up there.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 60 ++++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 515fd0d307cf820b036b1ea966b300715992359f..adf030f74eb163f5d8b1092d00418b84354f923f 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -43,6 +43,7 @@ enum {
 
 struct gpiod_data {
 	struct gpio_desc *desc;
+	struct device *dev;
 
 	struct mutex mutex;
 	struct kernfs_node *value_class_node;
@@ -58,12 +59,15 @@ struct gpiod_data {
 	struct attribute *attrs[GPIO_SYSFS_LINE_ATTR_SIZE];
 	struct attribute_group attr_group;
 	const struct attribute_group *attr_groups[2];
+
+	struct list_head list;
 };
 
 struct gpiodev_data {
 	struct gpio_device *gdev;
 	struct device *cdev_base; /* Class device by GPIO base */
 	struct device *cdev_id; /* Class device by GPIO device ID */
+	struct list_head exported_lines;
 };
 
 /*
@@ -686,10 +690,10 @@ static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	struct gpiodev_data *gdev_data;
 	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
 	struct attribute **attrs;
-	struct device *dev;
 	int status;
 
 	/* can't export until sysfs is available ... */
@@ -751,25 +755,40 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	desc_data->attr_group.attrs = desc_data->attrs;
 	desc_data->attr_groups[0] = &desc_data->attr_group;
 
-	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), desc_data,
-					desc_data->attr_groups,
-					"gpio%u", desc_to_gpio(desc));
-	if (IS_ERR(dev)) {
-		status = PTR_ERR(dev);
+	/*
+	 * Note: we need to continue passing desc_data here as there's still
+	 * at least one known user of gpiod_export_link() in the tree. This
+	 * function still uses class_find_device() internally.
+	 */
+	desc_data->dev = device_create_with_groups(&gpio_class, &gdev->dev,
+						   MKDEV(0, 0), desc_data,
+						   desc_data->attr_groups,
+						   "gpio%u",
+						   desc_to_gpio(desc));
+	if (IS_ERR(desc_data->dev)) {
+		status = PTR_ERR(desc_data->dev);
 		goto err_free_data;
 	}
 
-	desc_data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
+	desc_data->value_class_node = sysfs_get_dirent(desc_data->dev->kobj.sd,
+						       "value");
 	if (!desc_data->value_class_node) {
 		status = -ENODEV;
 		goto err_unregister_device;
 	}
 
+	gdev_data = gdev_get_data(gdev);
+	if (!gdev_data) {
+		status = -ENODEV;
+		goto err_unregister_device;
+	}
+
+	list_add(&desc_data->list, &gdev_data->exported_lines);
+
 	return 0;
 
 err_unregister_device:
-	device_unregister(dev);
+	device_unregister(desc_data->dev);
 err_free_data:
 	kfree(desc_data);
 err_clear_bit:
@@ -828,8 +847,9 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data *desc_data;
-	struct device *dev;
+	struct gpiod_data *desc_data = NULL;
+	struct gpiodev_data *gdev_data;
+	struct gpio_device *gdev;
 
 	if (!desc) {
 		pr_warn("%s: invalid GPIO\n", __func__);
@@ -840,14 +860,22 @@ void gpiod_unexport(struct gpio_desc *desc)
 		if (!test_bit(FLAG_EXPORT, &desc->flags))
 			return;
 
-		dev = class_find_device(&gpio_class, NULL, desc, match_export);
-		if (!dev)
+		gdev = gpiod_to_gpio_device(desc);
+		gdev_data = gdev_get_data(gdev);
+		if (!gdev_data)
 			return;
 
-		desc_data = dev_get_drvdata(dev);
+		list_for_each_entry(desc_data, &gdev_data->exported_lines, list)
+			if (desc == desc_data->desc)
+				break;
+
+		if (!desc_data)
+			return;
+
+		list_del(&desc_data->list);
 		clear_bit(FLAG_EXPORT, &desc->flags);
 		sysfs_put(desc_data->value_class_node);
-		device_unregister(dev);
+		device_unregister(desc_data->dev);
 
 		/*
 		 * Release irq after deregistration to prevent race with
@@ -857,7 +885,6 @@ void gpiod_unexport(struct gpio_desc *desc)
 			gpio_sysfs_free_irq(desc_data);
 	}
 
-	put_device(dev);
 	mutex_destroy(&desc_data->mutex);
 	kfree(desc_data);
 }
@@ -899,6 +926,7 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		return -ENOMEM;
 
 	data->gdev = gdev;
+	INIT_LIST_HEAD(&data->exported_lines);
 
 	guard(mutex)(&sysfs_lock);
 

-- 
2.48.1

