Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878522E3E9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566320; cv=none; b=tFDOKGdYHjUfwciRw7UV3wko744TWSjWQ6hViT2oXVstmIOjKF506NTgyEEaKht9JVEzVPzJbMjcO5AyuGRHF2mYw0lKqCI8krGBqGA28/tnHZt6P+jb9FEubEWLYsG/Okz4HC9havLKJzAlV48z/tvcrLAOWKc8a+BmvyKVwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566320; c=relaxed/simple;
	bh=XNu9jNKy3ua2IQdVl9HbAC1d2wbfpHsCqHYoaysQ5uQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mnc/4VlYBjK+CaIbk0ClvZO7V9a+g2RsWaxa2zEieKNs/E/avIRRy4cZPMknjMnj6OT1vCqwwvjwAo/2Ijq+oNgJHMHr+F6ZE9logtuqOb7XR2t6FOPcHfM0+tauBH6JOShHipQZeO1nvPUU2tp/81RrCJg0TFH695DIZIDSgKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WNJie4ML; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WNJie4ML"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so43429995e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566317; x=1750171117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YajReGdgQoE1Z/C7Wj+XydGRMG4Oa8NkzwnsH8hrzWI=;
        b=WNJie4MLE073hSfzxzaBj4k9hNKxypKcMK3dh2fNcaU8V577bxSSO1H/6GFAUClsSs
         S2HxsZKoPziw5IS0HxXDPCurlKL6uBBZXSvl5/VYSlZKJtzLeZ+6tUxoy/zW3WLF8bW2
         VqW6dWVUPQPk5UuFpaYq5rFl9amWX3KnqJfesVs9isAHTR/+RACyAN7beH5Ibj+gYFib
         HcSkWV96KStJZ4vOfw8TgFHvt9fSDf+SzKuBam8x9HA6B8jN52GsNfYHD/vTDPcSXgBN
         HY9wY7n5SszZu1Nc4nVFoKTRZe8pJ7vl5FtfVNbWooq9Gaeap2iWvcfA+nOcjFlHlxKD
         trPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566317; x=1750171117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YajReGdgQoE1Z/C7Wj+XydGRMG4Oa8NkzwnsH8hrzWI=;
        b=wP9FsKqsnHm4yrmRQm0u5h65NrngYg3JGOkRHp3ItO5OG0efbZqjyHbyxeHFE91h+o
         UCUrsLgDF+53sLpRbJkI2dENPikIN6+AWmiCMNInM/Us3FP65xph8UjHR4X+VVp8LRJJ
         bJn6jKowfXCVqOw+DCvo3pEKFsBuXtG4HN+IxX4oWLVC2IiEVjyxNkoQTsPLY4hJ/sj9
         sxIJTybHM/y7M9iUnL34BUvOpgwb5wfHk5I2Z3MIqTxup2zVdNUyXSRiK8KYrHhjU78j
         tqS73RI6I5+GyVUDU/C1E9zuoK1HWiajOuxSv2vkJONjZmwQbFfM6vhp3q7IkIlBwHw+
         S4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8CfpsSfxEY+IG69gevHd/VNJuLPiyarQYAA7k8G+PXISgMEC+zhdnhEpgY2VJO6XkjmORzD7kt25Mzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbxBS70zW+vvH4WgwJ5rbUg/df/AxlFxKQZra7ZVmRhZg/Rz/
	oETPT7lMRtnxXChU/rPskekFfr1b5lxzldCupnhr1zXWVE2iKldFcsglGpAKge64Gd0=
X-Gm-Gg: ASbGnctI7n95eTazYntBoXNWuk+KD+dNwua/Oh0QW0daL2k1U7eENL63Ncs8bjTrSw+
	aB4BLIQpp8zC8NixtjUGLENaiq8ZnU/Jh/lP1UwtQaw/rM8WQ85fNz0aeM6QRyKeDk749qrB6Po
	OQYnM636tRNX4lnDc27Vn+/C/y0zoAjQPlPmHPwTi36e7iU8uqtwVN0Tmc+wZ1wn+KWOzefD9Pv
	78cz4EYp8ddawz0jpJe62srXSxPGZ90Pg1WJLIwqGn7avGdN/bBIGaXhY1fICrVlZq6/9ykzLdT
	EixTgCm8C8Stroev2oGQL50LzHbd3MknmCObbjS/KBPc51U1yaDC
X-Google-Smtp-Source: AGHT+IGpIgzg2zt99tcbqnYnzxYWTCfru7Fp0Z5Kk+LmJUDSRUBZVf/+DrtWRpMW58oPYNNscrudSg==
X-Received: by 2002:a05:600c:1f1a:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-4531cfe36dcmr39161775e9.15.1749566316871;
        Tue, 10 Jun 2025 07:38:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:24 +0200
Subject: [PATCH RFC/RFT 09/15] gpio: sysfs: pass gpiod_data directly to
 internal GPIO sysfs functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-9-a8c7aa4478b1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3362;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HrHcoKPsz+vmq5v1MUbvC7Htqt6DI5nn37F1yRAxQX0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENhsMp/mzFFyPBKPP4HKjdQsItOwzPyi1qHt
 xuFIxJry2OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYQAKCRARpy6gFHHX
 cmHKD/99QWLVXGKMbnwVeDhRJIx648P0hzrOJ+ygPg08yMj/6wswBGgohasJ8icD0oGMiRxywA2
 /gDEDYT6HGozGJAfF/CUeBiiHNuxQ6hXbn6oaPAV+L3dEtO4z3vJwoic3R8tGWpf+Yo8tPNeJe9
 qmLfujX1lLR0EdFtsIKcsdUKkRw4tpb8RvuUz6jJV9SkMQxXD7fzfXK1vxWYdXJwnNJJqMzwYPk
 twYgL8k4XnJ1sAcjIf3Ik5RM5b+X3b7CIjsTkQr0ArrXTFYxOBXuy4QN7ZgwA+NXl9EkyIbGD4e
 ji+bm5YZ5KQCfJ2kfmMisgHOTloerMQz96P6e7NLoPEupihblRzQ7lCn21aRNKDXLFJbG7Ng5A1
 e4yz9EzO0cC0GF4Cf6jeXYhgMyUlLX3N4vw3ZVrLNSndAA/1Jzyn4KSxy8hDaX/+mYcy+BgIePT
 jrTwytSidulC5wAnl31PFRB1vBi2rr452ex1iUPWyYoPkWPUhFeM1RVNZijLPT9qrctFvit0TEz
 A9+mA9oJddx8i3DvD+ppA4Nkzoh1i3Um1/o1nCff1BTz8TOghR5ObJsF77AiVz4hjBFaHpSi0Qh
 ZO4xo6pPFbTG4uqxVBQXZTvjbSHSSXAcPDxGeVE+QRXlaJ6dOb5vSDOXhqPbR6wiLZpywUt0R8v
 TkpcFhPD7auNGVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

To make the transition to not using dev_get_drvdata() across line
callbacks for sysfs attributes, pass gpiod_data directly to
gpio_sysfs_request_irq(), gpio_sysfs_free_irq() and
gpio_sysfs_set_active_low() instead of having it wrapped in struct
device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 642635c9f84bbd869727755e72781fae31a9cca3..811328c8e72d819bcd4b4215cda450c73aaa65cd 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -162,9 +162,8 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 }
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
+static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
@@ -223,9 +222,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
  * Caller holds gpiod-data mutex (unless called after class-device
  * deregistration).
  */
-static void gpio_sysfs_free_irq(struct device *dev)
+static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	struct gpio_desc *desc = data->desc;
 
 	CLASS(gpio_chip_guard, guard)(desc);
@@ -278,12 +276,12 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 		return size;
 
 	if (data->irq_flags)
-		gpio_sysfs_free_irq(dev);
+		gpio_sysfs_free_irq(data);
 
 	if (!flags)
 		return size;
 
-	status = gpio_sysfs_request_irq(dev, flags);
+	status = gpio_sysfs_request_irq(data, flags);
 	if (status)
 		return status;
 
@@ -294,9 +292,8 @@ static ssize_t edge_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RW(edge);
 
 /* Caller holds gpiod-data mutex. */
-static int gpio_sysfs_set_active_low(struct device *dev, int value)
+static int gpio_sysfs_set_active_low(struct gpiod_data *data, int value)
 {
-	struct gpiod_data *data = dev_get_drvdata(dev);
 	unsigned int flags = data->irq_flags;
 	struct gpio_desc *desc = data->desc;
 	int status = 0;
@@ -309,8 +306,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 	/* reconfigure poll(2) support if enabled on one edge only */
 	if (flags == GPIO_IRQF_TRIGGER_FALLING ||
 	    flags == GPIO_IRQF_TRIGGER_RISING) {
-		gpio_sysfs_free_irq(dev);
-		status = gpio_sysfs_request_irq(dev, flags);
+		gpio_sysfs_free_irq(data);
+		status = gpio_sysfs_request_irq(data, flags);
 	}
 
 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
@@ -345,7 +342,7 @@ static ssize_t active_low_store(struct device *dev,
 
 	guard(mutex)(&data->mutex);
 
-	return gpio_sysfs_set_active_low(dev, value) ?: size;
+	return gpio_sysfs_set_active_low(data, value) ?: size;
 }
 static DEVICE_ATTR_RW(active_low);
 
@@ -814,7 +811,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		 * edge_store.
 		 */
 		if (data->irq_flags)
-			gpio_sysfs_free_irq(dev);
+			gpio_sysfs_free_irq(data);
 	}
 
 	put_device(dev);

-- 
2.48.1

