Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C61F875C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566316; cv=none; b=TYLs5G+ERY7bgRUkyHJ/JRQcti4D/eyzdOXKOW+Ae2i79SLceJVv09MamH3b6k+Ho+0d8e/cCGX6OP1BP+2QWNmWcC43qyw1CyJCmBj7h2MI5ggdst/X4zlnYHCUr/LRdChMYuWKgEq2aghwsyXxLTtl3vL+OyxQDxUkAss5/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566316; c=relaxed/simple;
	bh=3iywfMmfWuguiGrQGZCARkYMwz88+y8SW6qE3RQFQbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uW+dcQbxMWA1fZWp1VcQkmVs36UYBDebmzeKDRktTfT2zujRvMwGsTBDeFkkIPVfsXWvpuX7Pi9/7h7kRuyYNIedpkYA1dHpu/T5Sj/anJm9bTDicDFnMOpstgsvqIHcWlmfT6J9b03lZcgTag015Zl9uuJhOj+Rok5So3h6Q+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dcGzJ6EE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dcGzJ6EE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so69721755e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566312; x=1750171112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbAeNQNfAA6yD3395Up6TwuixaQ4LQ4OsQ45S++RIdI=;
        b=dcGzJ6EEoAnF9WeTiriEvCIv3CGffAoZZ7YcdnNzecHt9hc8CagyAhsFx3w+qQfoux
         L92SLZknMBjVJgRYI/S/QrFUaFXlRuhirh9U6KpcnEr7XQ2+KmldS4wquvZja78pct3E
         ekfgx3meI9HSvnmu9Af1AK1Clwi+rM+Q0s3hUDdwzN3u0GhqH08bBOw+QkIvjGB2/4xi
         /01enJEcvqwlY5TqgI33qeLF8bzYVsXfDAzddQH8Te/FlDMzcaQElSNiHG2VK6t+Fc8k
         og+3b/o1oSsZXbibmDLZ1ivv5z7dT29um+iyj5YXsAsISy26m68SxgZ++XqXHdV6UZqV
         NSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566312; x=1750171112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbAeNQNfAA6yD3395Up6TwuixaQ4LQ4OsQ45S++RIdI=;
        b=CS3N2jVlcZoam7/x88sI4j6fNvWKWlV+9obTJpQk7EOs3xqToOU0eRdxBkx7Qc1ffz
         QOmESgHAR8H34oIXmnFJAU29D7LmR+G2cHzbkkm7b4YSc5v5b4kLLLvYH8UzpEDFFWEh
         0rQduoSnCbIbZ3+wxbj9usWnWAL+z436liXESvXEhFdznFm5VpeNmg74BUzKo/cMvr71
         F3QKlUmlhDed+DHKACzUu19Y+rvLVWp279gPW4iM5jzVXxocUiY0huS0zkOiO7+zuobF
         0qsowFX78p/46URnd9XqVXcD01qg+8P3t+SE0OxhOX8ul/W+36xWPKYdR6cecDBTheMY
         IQhw==
X-Forwarded-Encrypted: i=1; AJvYcCUzD60ROACraDALBxg4d0dnXGN2t2FLargcxHzymgDLeR+kGwmjYcduQOLsZYjCp23H/K+WOai8imajEvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2sLkYVk72qUXdlqsii0cNX9vq8uBJbuEmAu7R/QBkJkz7XUNK
	JkZFibVdKObvhM4Nh/ZVdRmRPB3dXsi8APi1rQOJF26ytxQ/YesB7CKoBG1Fhtu6bti63qNZ+1v
	C6Pnj
X-Gm-Gg: ASbGncsFAVVH+TTZ1bs1wT8RyIVkvCx3yvHR4Q6o6JgB3go5nVlS+v3Wl5YEvq2rpMM
	GWt1NYEIN11wtxhMRGVZpmRORfW7FQxEcZzZJjxRW6frnAyDn4dSwcoIQtjLdNSMDRt3u58pqah
	w1cS4WVF4IpM8uzeUhEKylLNxsB51CuDLjcx4UItABZHzhGMfhof26zuBjhWU35MbVQ9luerhBb
	lC9zgygvh7RVDSC8lbPvjvOaS/VIfoHBu37awEq/ZAptpoxH+YMgLzxxw/MGByMUfjeNWcceGQC
	Xm2odB+aM0KpnPqiumn7Kwobj6CSrqug3Dp9ak/ccO2sSowIhLYD
X-Google-Smtp-Source: AGHT+IGNoAiYQhAXMTIDwG94By+OiA1TtpkzZkBJ/W0lgErFNRiyObiTaY3Fg7oTYTkdJbB8ZGUVgQ==
X-Received: by 2002:a05:600c:6994:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4531dea9c40mr32956955e9.30.1749566311703;
        Tue, 10 Jun 2025 07:38:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:19 +0200
Subject: [PATCH RFC/RFT 04/15] gpio: sysfs: refactor the coding style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-4-a8c7aa4478b1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7880;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zLQu1FIKLYBrG00ZMRkDPgP4mnshxpjIaGpQE6BbTbI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENgPxH8hZgvL6dsa6Tj3ckOBEhY1xZCFwMEl
 YzLo7uB3omJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYAAKCRARpy6gFHHX
 ctnVEAC07XkQBi0m2E/8rFvXYo1msouUY/fyTCXM6HKZyQQYwGD4C0SfqV0rLG3MzMrL2MZtjqN
 Zffl1iIFjAM+fQ/SiTwQ/1OhKVQx2xOGjvc/MaER8/5OKV9jP93na7sTr7X2B4eTnxxj8OOLKlo
 QtveQaTq/ExxSmZq0l5xYcsiqGS/l0uw/zPnJ1TUIixjJaittsHQBM7N+gFEm4ejt/OxHhhTAS0
 bkqrvaImD8jGTjvkIUIMbgyKi8YrPHWW2/J9eRBsqTHjoHMMmfER9vF2qDqnCLyiLLd5mOelOYv
 noWJBvpK+AN20Q3JV+kIagt35RXA5hnb8Wc4Yvmwl1uqkgknmFIRG8Rdgvl+4EP/KKFikNxy4Ns
 LbZ1xHhW38TWgJebZkAYQUQu+kd0cUOvpvYQeL0kpr6q0HTMT+DdiAS9Hkk086BKxqWbsr0YWsf
 NIMwbr7PYT/yXCdwJSjUDhGR+TllEfH9OA5Zj2XF8FJGjXGMPDDxadeP7e6cqJjDOtzxjrluXXs
 DIdxmMR06hGKbk44bsidvIN3R99/viChoEKqEhTRYuWKwp+XudwevuCk/PBfsQ/2qZe/gyHWJp4
 l1Zx1ZK4/hAaXzLHY/gA/ybklpxDYTS2Cm3g9bLR9yI5YO3GlmJ9hI2fimGb5GPvnSatuMJxBtu
 lp/uZrbCWZBf/lA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update the code to be more consistent with the rest of the codebase.
Mostly correctly align line-breaks, remove unneeded tabs, stray newlines
& spaces and tweak the comment style.

No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 67 ++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index cd3381a4bc93a94b9a975248ae3e4bd8c2a3eb4b..88f97018fc7995c1e1195c0da4b6a8377af62e0b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -73,7 +73,7 @@ static DEFINE_MUTEX(sysfs_lock);
  */
 
 static ssize_t direction_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+			      struct device_attribute *attr, char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
@@ -88,11 +88,12 @@ static ssize_t direction_show(struct device *dev,
 }
 
 static ssize_t direction_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
-	ssize_t			status;
+	ssize_t status;
 
 	guard(mutex)(&data->mutex);
 
@@ -109,12 +110,12 @@ static ssize_t direction_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(direction);
 
-static ssize_t value_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t value_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
-	ssize_t			status;
+	ssize_t status;
 
 	scoped_guard(mutex, &data->mutex)
 		status = gpiod_get_value_cansleep(desc);
@@ -125,8 +126,8 @@ static ssize_t value_show(struct device *dev,
 	return sysfs_emit(buf, "%zd\n", status);
 }
 
-static ssize_t value_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t value_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
@@ -179,22 +180,22 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	irq_flags = IRQF_SHARED;
 	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
-			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
+				IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
 		set_bit(FLAG_EDGE_FALLING, &desc->flags);
 	}
 	if (flags & GPIO_IRQF_TRIGGER_RISING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
-			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+				IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 		set_bit(FLAG_EDGE_RISING, &desc->flags);
 	}
 
 	/*
 	 * FIXME: This should be done in the irq_request_resources callback
-	 *        when the irq is requested, but a few drivers currently fail
-	 *        to do so.
+	 * when the irq is requested, but a few drivers currently fail to do
+	 * so.
 	 *
-	 *        Remove this redundant call (along with the corresponding
-	 *        unlock) when those drivers have been fixed.
+	 * Remove this redundant call (along with the corresponding unlock)
+	 * when those drivers have been fixed.
 	 */
 	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	if (ret < 0)
@@ -240,15 +241,15 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	sysfs_put(data->value_kn);
 }
 
-static const char * const trigger_names[] = {
+static const char *const trigger_names[] = {
 	[GPIO_IRQF_TRIGGER_NONE]	= "none",
 	[GPIO_IRQF_TRIGGER_FALLING]	= "falling",
 	[GPIO_IRQF_TRIGGER_RISING]	= "rising",
 	[GPIO_IRQF_TRIGGER_BOTH]	= "both",
 };
 
-static ssize_t edge_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t edge_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	int flags;
@@ -262,8 +263,8 @@ static ssize_t edge_show(struct device *dev,
 	return sysfs_emit(buf, "%s\n", trigger_names[flags]);
 }
 
-static ssize_t edge_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	ssize_t status = size;
@@ -302,7 +303,6 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
 
-
 	if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
 		return 0;
 
@@ -310,7 +310,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
-					flags == GPIO_IRQF_TRIGGER_RISING) {
+	    flags == GPIO_IRQF_TRIGGER_RISING) {
 		gpio_sysfs_free_irq(dev);
 		status = gpio_sysfs_request_irq(dev, flags);
 	}
@@ -321,7 +321,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 }
 
 static ssize_t active_low_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+			       struct device_attribute *attr, char *buf)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
@@ -334,7 +334,8 @@ static ssize_t active_low_show(struct device *dev,
 }
 
 static ssize_t active_low_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+				struct device_attribute *attr,
+				const char *buf, size_t size)
 {
 	struct gpiod_data *data = dev_get_drvdata(dev);
 	ssize_t status;
@@ -397,8 +398,8 @@ static const struct attribute_group *gpio_groups[] = {
  *   /ngpio ... matching gpio_chip.ngpio
  */
 
-static ssize_t base_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t base_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
@@ -406,8 +407,8 @@ static ssize_t base_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(base);
 
-static ssize_t label_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t label_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
@@ -415,8 +416,8 @@ static ssize_t label_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(label);
 
-static ssize_t ngpio_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t ngpio_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
 {
 	const struct gpio_device *gdev = dev_get_drvdata(dev);
 
@@ -439,8 +440,8 @@ ATTRIBUTE_GROUPS(gpiochip);
  *	integer N ... number of GPIO to unexport
  */
 static ssize_t export_store(const struct class *class,
-				const struct class_attribute *attr,
-				const char *buf, size_t len)
+			    const struct class_attribute *attr,
+			    const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
 	int status, offset;
@@ -498,8 +499,8 @@ static ssize_t export_store(const struct class *class,
 static CLASS_ATTR_WO(export);
 
 static ssize_t unexport_store(const struct class *class,
-				const struct class_attribute *attr,
-				const char *buf, size_t len)
+			      const struct class_attribute *attr,
+			      const char *buf, size_t len)
 {
 	struct gpio_desc *desc;
 	int status;

-- 
2.48.1

