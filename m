Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B0221561
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009702; cv=none; b=f6yN9rE1fg5wQK+fvoFFEo1v4M+d0u6e60nD4CT/BptzwLrEq9XEUMooj9j6cQBVU5nWoC9JwnhP2cCwmcNUyRWJklUt049X0pjGXlc+Yx+Y4xFodJ/rLtsUpBWney/HOdtE9GEQEJmr45RO3Bf2evOAP6hm1BX8PCvh3bqvF90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009702; c=relaxed/simple;
	bh=R6cE3H7QS2IztN7f7gNfpGROMu/XgcQXBtlhfJoXJOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INPPnBG7xH4/o6Xe133GNQBGe/faMojXG+tKjFdzRtfh1/ZzX4OTTdockSXh0B9ve1aOO9Z9tVxbaH5zkQapLqpX/JJwZJYJA2P0RnxtewXAaDXJ0WPYsGt+qmN14giYqFNsbhenKmepaZcrbuOhin1/YPTiZLtIU8FoHExYcLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xs/afFsG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xs/afFsG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so39707885e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009699; x=1744614499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6HQg7IM9ko6EGxT6ZTvsjDyVUo0XPxx9roXI2fuPI0=;
        b=xs/afFsG7IE9u9GRNz1ieK5oW4M0z+Cay93PG9MqAtxh87VVYLhPC6hRKOOGQq2jg7
         KfyohsdYngSqLGdW5MBByrTz2bfxJN4yMCSXGjgi3NjRvaCC31HsGqfMrnuc2nnfOgSB
         OXxul1AcCQKgpkudolxB4LksXph5G2Xtgmwylii1Mq3GgXdlZhz5+q59BOam0Y8lCbsd
         sPmmtny/fz28ujj72DOvi/2HlZ/v7SAZGTgpyLmlR6fUrIj2FUjPTahNO3061m7AGwSo
         gpZpbuRNbxROM6hImFjKvZMLJmUV4g+CJHlk68erYtNA/2OjcJ1aZCWNE7DlIpgl7Mf3
         J1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009699; x=1744614499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6HQg7IM9ko6EGxT6ZTvsjDyVUo0XPxx9roXI2fuPI0=;
        b=kKqWhaipjmMP7erRwVdkPXnF+sn36IbGkNG+ypg9IseTOQdkr8EhqVUwmUsREwxK1I
         eoc4csdPhI4ckgq1oepdjRUVAgycIO9srpj9CKdIM/Jw9Lpx+grkIUCHtW3+oVpXUu7f
         jE3DZX8B/5QRBzqHLS6oHdqe8DyWHToIxa7VKNS1HFtaRay6iS5ZRre7Nbd9fpEADn7L
         ujHhlNaDciaJzyQpWvJ3SxJ8ceLQUSAH70yWeNvoCQQmrMC8UDYTQolh2fcbCq4MSNnq
         3PPLf9QP8B7I/p7GxhkOskwSPAdhkj8+11qWgfWDHNwxQVUxhunpbcE3yL/FaxRr5Eer
         CBOw==
X-Forwarded-Encrypted: i=1; AJvYcCXG6b7MdPLV05wyychWm7sINuncYy9oqraQDDliLysixRxrniabcHMkuSUA1NO8ukMULlK0V+f30ZAThsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTnwnm5JTPYRbZWRDhtWkEZNgYJZ/kCSpl1UpZ1MD3/e2ry/l+
	pPrZcwzKcoJDpqt8lMFJsrFCZr8dJ0tRm6UEuYEPbqjuMCMtiYnLQ7selWhdAf8=
X-Gm-Gg: ASbGncvNY9SMPqC0pgMxvgv1J2zI5a4qtcwx5h33w9zesHUJxKxitn6fgjBV0OMwH2X
	29XCzAbPUHxyw+4jBqJ8mK2llG4oPHH0/GmJLG59MNLIASFgN/94Tf6XgMiPmRysKnNtMdCltI6
	v+5eiRquz6kGo98Gbg7AMUIj99Vqs4PVC+miWEX/TmX9cLgPXagqeS3hXQA/Mv3N93lbjrbPF0e
	8rfvCACnR8QeK2/2tuzEsGcwC4JzvttmF7x0wSJHQgx2sutWvNV8f31X6g/m0AjXSqDtk2raxZL
	xA2Eeu45SGSXhp/eXkTcz0HLBJHXVXgdAD++V/RheYXWUamk
X-Google-Smtp-Source: AGHT+IGnDp+U6NTy2KgWw8GVMqiTf2AI5G9fl/8pYk8ye2ykGL7Slj6+nDIAgQHX7tN8gh5Ryg4Y9Q==
X-Received: by 2002:a05:600c:3595:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-43ecf9c795emr94583485e9.24.1744009699253;
        Mon, 07 Apr 2025 00:08:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm124328775e9.23.2025.04.07.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:08:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:08:14 +0200
Subject: [PATCH 1/2] gpio: provide gpiod_is_equal()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
In-Reply-To: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rHHj9OMqk5Ewjl4lWvwCljvJz5WXzQS6SDbzJn1VxDY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83nh0EBtQERxXcoVOdEt8tQ4HeCnhFusg9dRM
 H25QgbDDfWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N54QAKCRARpy6gFHHX
 cnXgD/wJXTZwXpXInptFEqxddNUTWmEkcB7BySASfSZeFHEiUS6MdTpeLJQ6whgwoQe8IHnjzFW
 id0fuBitsFIoCmhpe+pIcrstFzM1WGOSO0sah9LhOkJ56S3YYfMLfVaX2mgaroMvplAo42IQNyX
 GJda14EgOYSD777uCSrneG/LPTgOYZQAE224syRYGDzi5u7G9lsxRLfy0pzpF9GqmA75NT++zg/
 EksOflERx9qVMf1e/Gw1RH1hIYAX0jqGGPSDTzYk4UkBxeZkxHOQx9pIQNjJMjkE6X+ulluAfz6
 F0070CxZmzvYd1S+CvcskNE9rfQY44JcziB/baYpT8UwdSLJlY5KBuc0zMgcvhcavMQdjp6wn+8
 c7c4Wl+NCB2sJsCZR0DhbwcjDiE0lGd9eVWfq3jIv9grxFIdE7sv5McI2arrnIBs3cNtQMBOFvZ
 KOx/l+r9M3pf3xqwA2xnz3cqggiDEMxC+3vOnz+zeDF2g3OEbHlE14nZrevtQlEcBollaWbAdOZ
 QmqxHXwU+nWl38UbnR3dfk44btUmqaxfzffia1eyqGVsmWTaUHqofnoqGnoSRwauNevh047vJKV
 dydYrNfnBAfuHQfomy4kSPckDypQl3eGHoXJB5tchz1lwKdRnsZCrh1oPuZUUQKvu7wYXVclF/r
 PGJF3fhu8bQcPEg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are users in the kernel that directly compare raw GPIO descriptor
pointers in order to determine whether they refer to the same physical
GPIO pin. This accidentally works like this but is not guaranteed by any
API contract. Let's provide a comparator function that hides the actual
logic.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 14 ++++++++++++++
 include/linux/gpio/consumer.h |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b8197502a5ac..2e5b6982e76d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -265,6 +265,20 @@ struct gpio_device *gpiod_to_gpio_device(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_gpio_device);
 
+/**
+ * gpiod_is_equal() - Check if two GPIO descriptors refer to the same pin.
+ * @desc: Descriptor to compare.
+ * @other: The second descriptor to compare against.
+ *
+ * Returns:
+ * True if the descriptors refer to the same physical pin. False otherwise.
+ */
+bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
+{
+	return desc == other;
+}
+EXPORT_SYMBOL_GPL(gpiod_is_equal);
+
 /**
  * gpio_device_get_base() - Get the base GPIO number allocated by this device
  * @gdev: GPIO device
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 45b651c05b9c..7355abadaef4 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -180,6 +180,8 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      enum gpiod_flags flags,
 					      const char *label);
 
+bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other);
+
 #else /* CONFIG_GPIOLIB */
 
 #include <linux/bug.h>
@@ -547,6 +549,13 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline bool
+gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
+{
+	WARN_ON(desc || other);
+	return false;
+}
+
 #endif /* CONFIG_GPIOLIB */
 
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)

-- 
2.45.2

