Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0F2FC00F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633949; cv=none; b=XtYA7cOumExXJ0rJjgBfBn2diEMgE3AjmqLaHPVV2HHmKXIaX1fgnVOwRmZ0r03dL7sodpydkSDThMYM6ARY6l0rYDGsWwIpuiVqkZOtkFfAx3OuLMHx7ps8nr+DpFGRB9L+op0cGgllPWPbdlq2ag7EfWWsyvMYGgZHz8ElO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633949; c=relaxed/simple;
	bh=MRAmlbg2el9RlT82IXfipSqk95B1KCNXrlmXQW0Xgmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=po14U24TPF3+/xQ+tTFGfJpQFqv54IDTpiu44qUxLMPhwhvJBDnslrNU5QYpPGMEcTPg3jqK31/hEGpEOQ3hCUzPIEM9D9ZwnX/a+dOpesB81LyZRqM8Roj4ETkasY5cVZwND1qxvmyxb8ilIdrP1Nl3BUNz8r0qaP+jkpCUoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GBMdmUer; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GBMdmUer"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso699927f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751633946; x=1752238746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mWdlg54oJudcLcZCbZIGM2v7WwK4QYuaO3Uvq5fqN4=;
        b=GBMdmUeru27gLfP01u/KnRnlevwTU6jvxOYIiq09CE8AmxnXH/OrExB2AjSfIxku3i
         jkKYeFzsnzdulSqXnJbnsmy0mcHCS2fDXTVPfBjV1DHeNshNVsXWJLSFuW92C05xa9H+
         N+bImZ4Ybg+zrrrzQ3V+RLQRbguGFXEWscUnB9IaQ77n648e7TJbwVYQMIZ4H1YEEJq0
         s/320UrEGQJv5MAG25uh3SRYk2m08EcJVCgjd1TV9iDGrLEueyV5z1rcQOj+l/4z9nuC
         K0oWXM3rdcW8kqjCyAd3Fz/VTvUAyAXh/OwX69oEGdmKjTOIqEfYXHEVWap1XJYvL9UU
         pFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633946; x=1752238746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mWdlg54oJudcLcZCbZIGM2v7WwK4QYuaO3Uvq5fqN4=;
        b=va0l6YFVB6OAM7MrPR6hwS6hekBL957y9NMyo2DdtGW7qcVUBYy2GTMkr6aStTPJVZ
         QL3bd9xxUwje9dxsXT6jrDyngVIb6vqXCGcQ1KYXTlfDNWNAX44kF2KdPNp5piMp2kUS
         9zJUrW/YaQ0GmCbct+YaNMJiYideVwzrH8HJG0wl5pV9WJiOwMQTUqrHLbZtOPFEFCwb
         LQ+kiW7dqX7E9HznOQDDN6/rjBmdfcb5SG8TQz2VuI7N4llTKixk/YtPnkgHbI9CUCRl
         EYPKxGT53uvhq2QckKJ0w62Xxw/VGidyhDeBFFOlX83kPDLAgafVPVNC8n4IlR8ZUZWt
         d3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV2B7CPJIpJBq61MUGtHg+z5yIi5iRl/K9v+uSWV6/woO8fqXLvw2GILK4B/5BawQ1J898dUViz9mPwhag=@vger.kernel.org
X-Gm-Message-State: AOJu0YywozP2foa4roo4hl18ZtjtucYQaP+2lBAzf2Yz9fvPW3nUdSNf
	pjY9UBLKTHNGnrpyN9jIj9YEw3CwCKTy4pTNZfBBohOrJIjb7mFpkLLsU9e+/M6MHKk=
X-Gm-Gg: ASbGncvI5gt+f2pKQf3pF7CvYC+jbf9CwvVv+q15M4oaVR0+1ocROITzQDB8gXbxSS0
	u1r0kqqh2RBvxZO51EprRWycw615CW8ne6FwbwBghxB8shz4BR2ASvXvuyZ8gu6ZHtTsKrmms0P
	HcNYbWGj6f/clauA97Mpb4foxFriOOTtwL8xC2/jpuz2icU+DT5lWKWPkJ/3/qCihgxDVwez/aA
	RD7o4o3XGk7wRJGeADbiesOyY6ma6ej8XDknWG+tDjSXNM09L8exW0nHIKo0gSMEo4jCU1bDQuk
	oiwDrKvsGpbka/B45uVJ4d8LB/7jwZEDHMToj69eXF2iKbm7/Rvr/H0=
X-Google-Smtp-Source: AGHT+IHUN/J9ch4zZkcw26qV3iwG7fpp7cXYR7gk3IfEtkYyUXzrE2xtjGDXbgYjpYTt6DFJW6B8xA==
X-Received: by 2002:a05:6000:2006:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3b49700c452mr1896057f8f.10.1751633945736;
        Fri, 04 Jul 2025 05:59:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm56129665e9.21.2025.07.04.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:59:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 04 Jul 2025 14:58:55 +0200
Subject: [PATCH v4 08/10] gpio: sysfs: export the GPIO directory locally in
 the gpiochip<id> directory
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-gpio-sysfs-chip-export-v4-8-9289d8758243@linaro.org>
References: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
In-Reply-To: <20250704-gpio-sysfs-chip-export-v4-0-9289d8758243@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cYZbz96eXlnV3MjcgWxLoHkCLzWOQdWS5dSJMpwHOg8=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBoZ9ALt9l9ireev9OrRcbTpBT1GQjAIm1/4RaPw
 udOH88TBkiJAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGfQCwAKCRARpy6gFHHX
 cgvxD/dEQZku0pJR0CaOwt5rW6WAShbkSUtJIB/x2vcU+5upUjE2ADZzspk5Y+4CQtspOvMTIDD
 jmNoB3qOidul8p5fFvsvCi/ZZqYODZ8AJIIin3TfGLSJ1yPphG/9YF2pAPdaV7vxTLKmAufRDc5
 u8Dv1BcK/5vec0NDFx8DnDtKoYgIFlDvM9tzpOXZuUN1zk6wgUrIH7Jk16Dc7tPlu0LTROGObpN
 bBNYT7Ki62zia7DsgdluaKXDlrgm37QPU6GYk5dCKvJvGj8razz987i3Ofg7SgkPLbALH/T/sBA
 wLwD4eKAUH9RC8J0/2RMrMZOUjPQ6ZXYhvwrpt/7fP7kjvrPj54DJTazLmDJpmvvx2JQt4CesQ2
 jm/oU4uJv/f5cyphZHFaXuAw985kUEbAEQ3BW1aD0GjCGNSrbk/Uwcl/sG+EOalhFBrXiC5NCVg
 Btud9CzPFyIxR2ZrYCbtsI8FB4MriFnPIwc4ARBNCHgUPO/nHUAHFB4TdKCTlk55Q+eUecTeT5l
 TCclBQpI1fjNBr/AezHyLVumMx29N0TUPsLpvyQwovceSa7NO2XobM50M2ddcgvpBmafl7Cl8pX
 23CR7B9xfzZNfzpJ/jPglyyqQqBsKe1ZIx8Wiy+E/FtKPgSgUU/3PCqS+iAhSJRezLnnRrmjxW3
 A9qBdzQAb347N
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As a way to allow the user-space to stop referring to GPIOs by their
global numbers, introduce a parallel group of line attributes for
exported GPIO that live inside the GPIO chip class device and are
referred to by their HW offset within their parent chip.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |  3 +++
 drivers/gpio/gpiolib-sysfs.c          | 51 ++++++++++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index ff694708a3bef787afa42dedf94faf209c44dbf0..0d3f12c4dcbde4f93da33707cd36e9acc0ee2fbf 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -27,6 +27,9 @@ Description:
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive chip name
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	    /gpio<OFFSET>
+	        /value ... always readable, writes fail for input GPIOs
+	        /direction ... r/w as: in, out (default low); write: high, low
 	/chipX ... for each gpiochip; #X is the gpio device ID
 	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
 	    /unexport ... to return a GPIO at HW offset X to the kernel
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index ccc293a4cc5d51294703959317061af55fb0dab0..563e38456c33cd3a6e8674485105ef45ce8f5095 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -41,6 +41,13 @@ enum {
 	GPIO_SYSFS_LINE_CLASS_ATTR_SIZE,
 };
 
+enum {
+	GPIO_SYSFS_LINE_CHIP_ATTR_DIRECTION = 0,
+	GPIO_SYSFS_LINE_CHIP_ATTR_VALUE,
+	GPIO_SYSFS_LINE_CHIP_ATTR_SENTINEL,
+	GPIO_SYSFS_LINE_CHIP_ATTR_SIZE,
+};
+
 struct gpiod_data {
 	struct list_head list;
 
@@ -54,6 +61,7 @@ struct gpiod_data {
 
 	bool direction_can_change;
 
+	struct kobject *parent;
 	struct device_attribute dir_attr;
 	struct device_attribute val_attr;
 	struct device_attribute edge_attr;
@@ -62,6 +70,10 @@ struct gpiod_data {
 	struct attribute *class_attrs[GPIO_SYSFS_LINE_CLASS_ATTR_SIZE];
 	struct attribute_group class_attr_group;
 	const struct attribute_group *class_attr_groups[2];
+
+	struct attribute *chip_attrs[GPIO_SYSFS_LINE_CHIP_ATTR_SIZE];
+	struct attribute_group chip_attr_group;
+	const struct attribute_group *chip_attr_groups[2];
 };
 
 struct gpiodev_data {
@@ -691,6 +703,7 @@ static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
  */
 int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
+	char *path __free(kfree) = NULL;
 	struct gpiodev_data *gdev_data;
 	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
@@ -780,13 +793,46 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	gdev_data = gdev_get_data(gdev);
 	if (!gdev_data) {
 		status = -ENODEV;
-		goto err_unregister_device;
+		goto err_put_dirent;
+	}
+
+	desc_data->chip_attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
+						    gpio_chip_hwgpio(desc));
+	if (!desc_data->chip_attr_group.name) {
+		status = -ENOMEM;
+		goto err_put_dirent;
+	}
+
+	attrs = desc_data->chip_attrs;
+	desc_data->chip_attr_group.is_visible = gpio_is_visible;
+	attrs[GPIO_SYSFS_LINE_CHIP_ATTR_DIRECTION] = &desc_data->dir_attr.attr;
+	attrs[GPIO_SYSFS_LINE_CHIP_ATTR_VALUE] = &desc_data->val_attr.attr;
+
+	desc_data->chip_attr_group.attrs = attrs;
+	desc_data->chip_attr_groups[0] = &desc_data->chip_attr_group;
+
+	desc_data->parent = &gdev_data->cdev_id->kobj;
+	status = sysfs_create_groups(desc_data->parent,
+				     desc_data->chip_attr_groups);
+	if (status)
+		goto err_free_name;
+
+	path = kasprintf(GFP_KERNEL, "gpio%u/value", gpio_chip_hwgpio(desc));
+	if (!path) {
+		status = -ENOMEM;
+		goto err_remove_groups;
 	}
 
 	list_add(&desc_data->list, &gdev_data->exported_lines);
 
 	return 0;
 
+err_remove_groups:
+	sysfs_remove_groups(desc_data->parent, desc_data->chip_attr_groups);
+err_free_name:
+	kfree(desc_data->chip_attr_group.name);
+err_put_dirent:
+	sysfs_put(desc_data->value_kn);
 err_unregister_device:
 	device_unregister(desc_data->dev);
 err_free_data:
@@ -883,6 +929,9 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 */
 		if (desc_data->irq_flags)
 			gpio_sysfs_free_irq(desc_data);
+
+		sysfs_remove_groups(desc_data->parent,
+				    desc_data->chip_attr_groups);
 	}
 
 	mutex_destroy(&desc_data->mutex);

-- 
2.48.1

