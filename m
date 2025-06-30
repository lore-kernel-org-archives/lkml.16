Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E425128B7CD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287051; cv=none; b=Adac+qUxmv4Ts/zg9LXeJVF+TAA2NfHm8n+lD2Mk1+Eu6+/CHaD6nmIbzkk5EcFcxxHaQyUxwvkK8mWVX4NN5PuP3tQDVf2pTU0iW5s0x2hHKonMZiuM+hHytAHQKh0CIkj4VQYVZvM1FqhDZF77/960KuFT25byOKvcY/DeE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287051; c=relaxed/simple;
	bh=dVhptWyUX31qCV18QbJjEQNflGg+smlFPAVFwZj+iCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPVulgcODg1ZepiBaTzH22QgwKWP/RBf8txCL2PXC+PbW06ajxCVoK2rPeWJVC3WSnFHwrWHv82gy9xdgrnchtVOuv680t6ktU/+PktDyNPChtDrFUSEaTdz4j+dZk3+aFlv5SZEIVTlGg+1iZ8aJkrAw2+kEFA+8Ydo0sZBSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3gVzq4pk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3gVzq4pk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453647147c6so48040155e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287047; x=1751891847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imVsZbAQBzDf1SazNgg1aOZFVItNJ6dUg7IELdUFoDw=;
        b=3gVzq4pko5JNqzs1TgY+w7cZ2ukGP861DHN5TCceIZprvCBO2Rpi6FQurO4QuokMfB
         Aq8Mj9FeMuVj48UngTb8HVd5mn7L1jfjERHaUdUqNRqS8iNmVhKP8UGUwATQoOiL7pNL
         M3dWa2zvRB4CCxXYXmheSQNs+dvQiAZnZDQHaSvKy0X2ZYcN4qS8p/o0zLTk8lyLtLjt
         8NaC8HtISliSmzTv7cZZFl01Hh6MSufAYhEqzrIETeGrHvw90eSo61zMzo7SK1O6BF2f
         QZxFMH2s2Napx5ah+plaDYQbTYFn2jQICza7/lI9PE4OkB3BBUjCAouWW+TxqNQAf7ji
         IVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287047; x=1751891847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imVsZbAQBzDf1SazNgg1aOZFVItNJ6dUg7IELdUFoDw=;
        b=kkNOKMOd1jNHl2wK1pyKcsPELjvqzPDjm6Adp7qZWrO659HHyB6cV6753/tmE8piEB
         O8nROqQBFWCv3aCFQzjLxUIErhpyb4h8soetZKjM/RUSi2gNG09X5RQ5U4iGgjNCRByF
         fS1F7Fht4r0Rg5932kVZ1HIeyTWDeWHs5KRV1ZTQjjbh2lxue5fta0vBC8KPNGV+TCkb
         ldg1ZJqlYdrqYAbPWF/24luJzGGSKhFSFtIfWzY2mPEoJMFKhdO4LYTd4RRXTf71KYwH
         DZ1UX6wXrk0X65trjkCbpU1pL3kMhUqMfx16FGn7+RcuFLJkZsreEmZfbH6iyJfTXFEh
         1XLA==
X-Forwarded-Encrypted: i=1; AJvYcCWvF9BnoZY7CZB7SjlKvpav/B5D0dYAFrB4UJ2PW3Ph6ObWdxD7ulPkZ9p7yo1iiNLRm21QT59KEn+2ARY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ova2o+HIMdbKHA7C71vOlklB2hyPhz6mL1WAiK8+Bdh6kD/v
	A/e4WpvfEaOrgSq5vxLz1gysXQGpxCkOeuQ5GdKi1VqjTBKL0KQeKQe1H2xHvBgDVe0=
X-Gm-Gg: ASbGncs9Xm7BuoYCIT/CaHHlfPLA9y9JERfSCktFQg/BRuLoDKxdGgcc6PSF3TlLnHn
	Mzk3KRvD3sLFkJ4KUZVuVphNz6tqTba+dY+WLRPkq0MH896fI8WIIYuxOwCoz6Sk0DV59aME0a0
	TbWdfjVfDXo2pztixJRMPYYgJNBi2HPNNDNwDJgQ0omeaT+8LJMJZQi7G2K6BsNyRbymVcb8CTq
	hNcFPA+fK96hliwsfadB33mHMz44q1cAJypIgVm4aC4/Azs/81K6wM88gWXc1JgqT0WIa/JN2AF
	uOWawEfUhWlAqgAYxak79s9GnAL4qJ0GZnreAo+uEg+ZSOaPW4tQuJ9E
X-Google-Smtp-Source: AGHT+IFy8BmpnlqFffwzEz5rP8UGbLV8yOnRroXjVD1iAIVS9avXwdHhASRds44KvyfDifpY4wEa4w==
X-Received: by 2002:a05:6000:402a:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3a917603734mr11753529f8f.29.1751287047155;
        Mon, 30 Jun 2025 05:37:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:37:13 +0200
Subject: [PATCH v3 06/10] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-gpio-sysfs-chip-export-v3-6-b997be9b7137@linaro.org>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9706;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Nc7Thy8NzSvpAfuT6mt4NjvezmoUliNEfqX7HBQaQK4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT9Vrl01mtlYmTmCiQ5Nrdm+1CUdCDUY0MLB
 CQooHmbpu6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/QAKCRARpy6gFHHX
 cn5TEACIjXKqB2x+cELon4IFX0pg0YFRYxd11UsJzkA7Mihr9oTasNh8pSBOpJSkkkphvR+O+/B
 4IW/h+DZJ7j3cUBtyPyQytRmsynzry+AXzEcYQGdxlW8UNZSK+Cs5ZiS9aXy/MxoIEViZteSGCF
 eDuY6PCrX7R2CFzDXKaqDiEWZ6uFi7m8YcKiMoCl/SunfK6jbxbMK0hzHZdp5qh0ImMMbsTjhRU
 HclLYhnZWV1EBt+lktIA2gHXj3PJJDUpIDR+zy+xzE0xS3qhCWIxZqfMQAEwWby8hdQLB2i/qdH
 eP25ft3rr9SUqDtPE0J+bv8CW9s8E+lU91unsXfzq91qK94ubH0/794cV9jyXj0GoPkI9JAOIn6
 64xlDbVthzB2JEzm/Z2WoCF5ERHzj6GDkUbBbbhqVumpc73T5UtLVV15F4EsopzD1tIxul9DPAu
 4sCXO7oJ44t6LDDGb28+av8c3VlTLd1KgfEbm2otikCA8Vpr6z+5VtcmZzQe994sez4mKn4Ah+s
 dxyMwon1RifyXVEc87wvpgwPz7tyi0tuoivJX5lw5uV3ahe3jhfnw/82FglNSRCRR9y+rsGVUYC
 LEklLk5cNL2b+2LvE6Qg+nbOn7zAoH4torTrKlBsqqK/f3VQcm2PPMu7WftcR9Qsly0venA8jgN
 9a4s7IfpHyIsL4A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently each exported GPIO is represented in sysfs as a separate class
device. This allows us to simply use dev_get_drvdata() to retrieve the
pointer passed to device_create_with_groups() from sysfs ops callbacks.

However, we're preparing to add a parallel set of per-line sysfs
attributes that will live inside the associated gpiochip group. They are
not registered as class devices and so have the parent device passed as
argument to their callbacks (the GPIO chip class device).

Put the attribute structs inside the GPIO descriptor data and
dereference the relevant ones using container_of() in the callbacks.
This way, we'll be able to reuse the same code for both the legacy and
new GPIO attributes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 122 +++++++++++++++++++++++++++++--------------
 1 file changed, 82 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index dba9dceb5e79db16f466ee40255c8f646b6b6d15..c1de8846cc4c1fc9e871dfa4a7d7a8f287043c7d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -32,6 +32,15 @@ struct kernfs_node;
 #define GPIO_IRQF_TRIGGER_BOTH		(GPIO_IRQF_TRIGGER_FALLING | \
 					 GPIO_IRQF_TRIGGER_RISING)
 
+enum {
+	GPIO_SYSFS_LINE_ATTR_DIRECTION = 0,
+	GPIO_SYSFS_LINE_ATTR_VALUE,
+	GPIO_SYSFS_LINE_ATTR_EDGE,
+	GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW,
+	GPIO_SYSFS_LINE_ATTR_SENTINEL,
+	GPIO_SYSFS_LINE_ATTR_SIZE,
+};
+
 struct gpiod_data {
 	struct gpio_desc *desc;
 
@@ -41,6 +50,14 @@ struct gpiod_data {
 	unsigned char irq_flags;
 
 	bool direction_can_change;
+
+	struct device_attribute dir_attr;
+	struct device_attribute val_attr;
+	struct device_attribute edge_attr;
+	struct device_attribute active_low_attr;
+	struct attribute *attrs[GPIO_SYSFS_LINE_ATTR_SIZE];
+	struct attribute_group attr_group;
+	const struct attribute_group *attr_groups[2];
 };
 
 struct gpiodev_data {
@@ -79,7 +96,8 @@ static DEFINE_MUTEX(sysfs_lock);
 static ssize_t direction_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       dir_attr);
 	struct gpio_desc *desc = data->desc;
 	int value;
 
@@ -95,7 +113,8 @@ static ssize_t direction_store(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
 			       size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       dir_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 
@@ -112,12 +131,12 @@ static ssize_t direction_store(struct device *dev,
 
 	return status ? : size;
 }
-static DEVICE_ATTR_RW(direction);
 
 static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       val_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 
@@ -133,7 +152,8 @@ static ssize_t value_show(struct device *dev, struct device_attribute *attr,
 static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       val_attr);
 	struct gpio_desc *desc = data->desc;
 	ssize_t status;
 	long value;
@@ -150,7 +170,6 @@ static ssize_t value_store(struct device *dev, struct device_attribute *attr,
 
 	return size;
 }
-static DEVICE_ATTR_PREALLOC(value, S_IWUSR | S_IRUGO, value_show, value_store);
 
 static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
@@ -247,7 +266,8 @@ static const char *const trigger_names[] = {
 static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       edge_attr);
 	int flags;
 
 	scoped_guard(mutex, &data->mutex)
@@ -262,7 +282,8 @@ static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
 static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       edge_attr);
 	ssize_t status = size;
 	int flags;
 
@@ -289,7 +310,6 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 
 	return size;
 }
-static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
 static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
@@ -318,7 +338,8 @@ static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 static ssize_t active_low_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       active_low_attr);
 	struct gpio_desc *desc = data->desc;
 	int value;
 
@@ -332,7 +353,8 @@ static ssize_t active_low_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t size)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpiod_data *data = container_of(attr, struct gpiod_data,
+					       active_low_attr);
 	ssize_t status;
 	long value;
 
@@ -344,48 +366,34 @@ static ssize_t active_low_store(struct device *dev,
 
 	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
-static DEVICE_ATTR_RW(active_low);
 
 static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
 			       int n)
 {
-	struct device *dev = kobj_to_dev(kobj);
-	struct gpiod_data *data = dev_get_drvdata(dev);
-	struct gpio_desc *desc = data->desc;
+	struct device_attribute *dev_attr = container_of(attr,
+						struct device_attribute, attr);
 	umode_t mode = attr->mode;
-	bool show_direction = data->direction_can_change;
+	struct gpiod_data *data;
 
-	if (attr == &dev_attr_direction.attr) {
-		if (!show_direction)
+	if (strcmp(attr->name, "direction") == 0) {
+		data = container_of(dev_attr, struct gpiod_data, dir_attr);
+
+		if (!data->direction_can_change)
 			mode = 0;
-	} else if (attr == &dev_attr_edge.attr) {
-		if (gpiod_to_irq(desc) < 0)
+	} else if (strcmp(attr->name, "edge") == 0) {
+		data = container_of(dev_attr, struct gpiod_data, edge_attr);
+
+		if (gpiod_to_irq(data->desc) < 0)
 			mode = 0;
-		if (!show_direction && test_bit(FLAG_IS_OUT, &desc->flags))
+
+		if (!data->direction_can_change &&
+		    test_bit(FLAG_IS_OUT, &data->desc->flags))
 			mode = 0;
 	}
 
 	return mode;
 }
 
-static struct attribute *gpio_attrs[] = {
-	&dev_attr_direction.attr,
-	&dev_attr_edge.attr,
-	&dev_attr_value.attr,
-	&dev_attr_active_low.attr,
-	NULL,
-};
-
-static const struct attribute_group gpio_group = {
-	.attrs = gpio_attrs,
-	.is_visible = gpio_is_visible,
-};
-
-static const struct attribute_group *gpio_groups[] = {
-	&gpio_group,
-	NULL
-};
-
 /*
  * /sys/class/gpio/gpiochipN/
  *   /base ... matching gpio_chip.base (N)
@@ -645,6 +653,21 @@ gdev_get_data(struct gpio_device *gdev) __must_hold(&sysfs_lock)
 	return dev_get_drvdata(cdev);
 };
 
+static void gpiod_attr_init(struct device_attribute *dev_attr, const char *name,
+			    ssize_t (*show)(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf),
+			    ssize_t (*store)(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count))
+{
+	sysfs_attr_init(&dev_attr->attr);
+	dev_attr->attr.name = name;
+	dev_attr->attr.mode = 0644;
+	dev_attr->show = show;
+	dev_attr->store = store;
+}
+
 /**
  * gpiod_export - export a GPIO through sysfs
  * @desc: GPIO to make available, already requested
@@ -665,6 +688,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 {
 	struct gpiod_data *desc_data;
 	struct gpio_device *gdev;
+	struct attribute **attrs;
 	struct device *dev;
 	int status;
 
@@ -709,8 +733,26 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	else
 		desc_data->direction_can_change = false;
 
+	gpiod_attr_init(&desc_data->dir_attr, "direction",
+			direction_show, direction_store);
+	gpiod_attr_init(&desc_data->val_attr, "value", value_show, value_store);
+	gpiod_attr_init(&desc_data->edge_attr, "edge", edge_show, edge_store);
+	gpiod_attr_init(&desc_data->active_low_attr, "active_low",
+			active_low_show, active_low_store);
+
+	attrs = desc_data->attrs;
+	desc_data->attr_group.is_visible = gpio_is_visible;
+	attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] = &desc_data->dir_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_VALUE] = &desc_data->val_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_EDGE] = &desc_data->edge_attr.attr;
+	attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] = &desc_data->active_low_attr.attr;
+
+	desc_data->attr_group.attrs = desc_data->attrs;
+	desc_data->attr_groups[0] = &desc_data->attr_group;
+
 	dev = device_create_with_groups(&gpio_class, &gdev->dev,
-					MKDEV(0, 0), desc_data, gpio_groups,
+					MKDEV(0, 0), desc_data,
+					desc_data->attr_groups,
 					"gpio%u", desc_to_gpio(desc));
 	if (IS_ERR(dev)) {
 		status = PTR_ERR(dev);

-- 
2.48.1

