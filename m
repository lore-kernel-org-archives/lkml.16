Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5A1F3FC6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669217; cv=none; b=eDddgzyyF2MgrlrmqS8wCO3BevsTy69R4aAHhHKjsNvKagFlSeqwNKy33MQlTZclPUZBNEPDxhqoH1KJjSxDE7NR0PSe9ilQ15C9nvWieu6aE8w+gHiLv4TGVZrWa+VPDNf/jCpUmvMz3ZOlbtokfLQCxtnCEF3nPNhHKwNyP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669217; c=relaxed/simple;
	bh=LMMzvYzzvjG38iEZjEOznfplicoDrXdsAljFaqLztwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNRYWCRVcE2XIIRW8XdgQhva+IR3ywivaSI3EtWLygw1an8gof1QDoNSgM4rV9/p45sqopwxaWTB5XcDT/kaQXs3lk7OdG7VeHVCfREBFJfcgcSdPiz8yvckwOqxgcNrXfxTBG+KEzU6Pnp78/Of5dvE71zUsFEL8cPvTcuZdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CgqorTMY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CgqorTMY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453398e90e9so25376805e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669214; x=1751274014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFPrbBis31M1FWPldXMCVueSfhaYkIokgycz/pYcTjI=;
        b=CgqorTMYJg1JOPJ/Hkaa8abYzJn8+b9MG/OxArqIbYlJAMaGkRAkTI6om3v67orRQP
         IJzV71n4UmYYKLgMxypq/hNtToqEehTw7FDClJ4Ccq07Ad8pPvKaKVmE34BsQ5QSisx0
         unH808SS8LXXrC69hOsGFzDu2W6AZ8xrMQxVOTjXkWw+WZlPPRZTsyOLNM8ZqQxAK/Uf
         LwuXeroVizdDbiXPtPoiURkK0aZTrdNl+9AvXA77wLNLQ2+WzGsx9j2iPA0cAFGbipcZ
         AonlD1sMDke5ZICTPcFajPkfMraDoT6lilGoApgWKYa2kFP93501c6JVvMfxyyJopBbi
         EYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669214; x=1751274014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFPrbBis31M1FWPldXMCVueSfhaYkIokgycz/pYcTjI=;
        b=Z4NdFinRySkAha/NgzdbU2u9HvTbZPiWjOTwt5l+2BNqYjh9SSA9aF0wYj9DyvMRoX
         M4aUyTFZaMaLAQYObFaSXJIXibOwG9UAxg1eLWhi/GK/RSzkz5YQKTcSqpu6G7HL12I2
         ct8oO8vkoHTZMTj5caz158p4wVrpcCf/8O+A0Hh8f32jBKimdIKN33A6J6862rXZEcVL
         tN9ZZbQd4g7yUp/EI051tWqDnYq/YvbKnq7dR/ScSB/Yk5QC4xXo1dddljVwDJ14ta5r
         a9czkDI0VD7l/rM9nFhdw5Bs/70l7A3mirSGIS3480kHVdzc+sf/Kpsi7Qfo+fxEQA9r
         U9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUC7e8CW/zYptyo+kT4tzbFjxnDyJ7ZckzTvhpaoa3j1+NLCwlhVSc8wW5wC+NoQFboXq91UTWRhiYjo8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJN4fr1Lj8denluFFPgcCp18FE6rn1fV2f/ZrlA6ZqYbQeOsCK
	MtgCsxDKRk+ZVBdgtJ35QQhyRTQPeLARDSb+k/S1Z8UM+YUU5nkmRfeF3LPl5s6dhYI=
X-Gm-Gg: ASbGncsHySst7kz4lRsDHe1bwYcYWo7zcEuTplDH7Q0P9POsUt008gI/u1dA3eLT1d5
	yAHV0xuAigOoPW668mkR/AvNv3IIjFEIxr8O2g652l2rq38i48xikYI9jROHgYeFvgG7xWQqnxn
	cpSOmMZQLNM7XUaWNeR2SWsuiQd3XuOYWAmhPwMyqjU3M5hI4BeCdm2oqxFkQP9e8Dc+eWpgxf+
	bp03GhgFCKMWSM+EK9gcMpDhLvxzGqChFurrLEB6VmhMbXBVYRceYjLaIdTqDV0YXN3Xw94tCXT
	LsiBEq8Q1smCSTGlIv9QkIeiXYv2qbme96E9dTiDOzE4DFAMDXfKRe8=
X-Google-Smtp-Source: AGHT+IFiqphOwIAp1gwVBxlM5VHKRW3Stro/mAtkhR5RDThXx7HvA9Wt8p1b1VdcA9D96nSU7N3fFA==
X-Received: by 2002:a05:600c:3ba4:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-453659c3b97mr102746135e9.2.1750669214064;
        Mon, 23 Jun 2025 02:00:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:50 +0200
Subject: [PATCH v2 2/9] gpio: sysfs: only get the dirent reference for the
 value attr once
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-2-d592793f8964@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3042;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mzJFO+h0UcAa+8+bwdK7egfjETmRhN80xURJe7gsS0g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReZUDcz/qkX8h1xwuVFBAw4cyLplYNmfw6vb
 1qk7fzzq1mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmQAKCRARpy6gFHHX
 cogtEACKbpXBs1IMdyYq7yvElvlU6Lc6oV8GjwJ18PlQqWVK3cQwlLgV3iVHyhflHGbxIWUPmk2
 bnNMYoPLRKiWup5QKqUgfvLJOCPNGVbwA0W1HrChopeZNde/+docVVMwMcR67Z/+FhZDTpTWQ2M
 NUL+fjoFUyc97/ZP9JYZuwcG7WlJzfc8DDV8MsUtqbm67HgzATNtLdk42VtvQB/eZFZX7ncnN5Z
 D6f29lkIMO1CLMADNCQbHuJza82CXcZuxSXSIQXnK8r7z7J0ivYnEN6MCtOkpYd3C6L+uhiO/PV
 E8nhwbUECvRQGFBGsHdJyui7sHhgOer+ZJi49AG7+Ebct77W0TeFTGx4QYgzk1z29Rk6vJVL1/h
 b9R1yyrvfERxMUjcooBxNHoAYR4qQInyGCYhn4IlkQMPT6NFWc0KuMq8KxxNk8cEYyS3ZcHDAnz
 nvcQbcMWInrcc3o39LONNWBjqkqpYdqMGqT0i/VGGKOxlyklGynKruwujMA5S2FwFhSPHUU7B2C
 Bsrc4LW4SgLQ1hoLJxePvCJTp3OoHxohJBnWRcOJVwZqaDpsmmzl2AXREmRGwD44FQH0eLRqlw5
 t3SOEOhZvcFcVH9elyoCE20sSazlz27hzcXCNR8KuV41BG+2vr2UjJvw9dQwOjF4KAVYv+4TUCD
 i3czUtPUX/CAU3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason to retrieve the reference to the sysfs dirent every
time we request an interrupt, we can as well only do it once when
exporting the GPIO.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fbe93cda4ca16038a1cffe766f7e5ead55ace5e6..c812c58e171448501f3d67e6287d32fcac00797d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -36,7 +36,7 @@ struct gpiod_data {
 	struct gpio_desc *desc;
 
 	struct mutex mutex;
-	struct kernfs_node *value_kn;
+	struct kernfs_node *value_class_node;
 	int irq;
 	unsigned char irq_flags;
 
@@ -156,7 +156,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 {
 	struct gpiod_data *data = priv;
 
-	sysfs_notify_dirent(data->value_kn);
+	sysfs_notify_dirent(data->value_class_node);
 
 	return IRQ_HANDLED;
 }
@@ -177,10 +177,6 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	if (data->irq < 0)
 		return -EIO;
 
-	data->value_kn = sysfs_get_dirent(dev->kobj.sd, "value");
-	if (!data->value_kn)
-		return -ENODEV;
-
 	irq_flags = IRQF_SHARED;
 	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
@@ -203,7 +199,7 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 	 */
 	ret = gpiochip_lock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	if (ret < 0)
-		goto err_put_kn;
+		goto err_clr_bits;
 
 	ret = request_any_context_irq(data->irq, gpio_sysfs_irq, irq_flags,
 				"gpiolib", data);
@@ -216,10 +212,9 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
-err_put_kn:
+err_clr_bits:
 	clear_bit(FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-	sysfs_put(data->value_kn);
 
 	return ret;
 }
@@ -242,7 +237,6 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 	clear_bit(FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
-	sysfs_put(data->value_kn);
 }
 
 static const char *const trigger_names[] = {
@@ -726,8 +720,16 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto err_free_data;
 	}
 
+	data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
+	if (!data->value_class_node) {
+		status = -ENODEV;
+		goto err_unregister_device;
+	}
+
 	return 0;
 
+err_unregister_device:
+	device_unregister(dev);
 err_free_data:
 	kfree(data);
 err_clear_bit:
@@ -804,6 +806,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 
 		data = dev_get_drvdata(dev);
 		clear_bit(FLAG_EXPORT, &desc->flags);
+		sysfs_put(data->value_class_node);
 		device_unregister(dev);
 
 		/*

-- 
2.48.1

