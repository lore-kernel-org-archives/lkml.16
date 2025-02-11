Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD91FBCA1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275735; cv=none; b=CIjG3yQt6XswBIbXREwMTlrlIx0QbuNq49orRa5W1pNEzmF22qKjxIJ+JjAxbN9ZBL5Lp05/M3W/1dGhRCDPsthcxEnIfBy7L5u1DfdEQSlN0KTsTgPYo68OXV4O0pHU9t3drwAxlnnL1ujACRADyzdMY/A+tn+RcntwMnfgYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275735; c=relaxed/simple;
	bh=DMmQKJUWoLWDTo6CsUcRWGqMfh0KVbe3frTIjat0dVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTP72H4px8oBiUSXStfX2wf3B5tpKDLXRlCOq2LILpll6IxMj9FN5ui3GW4y/qC6gg9cxQJI1KaW7pB4M5p88xo6Xqc/x83XgyC9C3rNZf859jMRG+8tcqMZTaNOplCZpXL/Ad702mzecPqbW/NnI2guym3sJ/wyPGeZta4VLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wEXSWn+2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wEXSWn+2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4395578be70so3867195e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275732; x=1739880532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aW+CbC+3CkKX6aO8ZADFZPA9ixVxGeRfqoxuCdLGR9k=;
        b=wEXSWn+2CACgypv+TqvOq4RAmQXX7MaHs6meynTIne8CStuRTWjuqIEYuuzM3oFKg0
         HiKjz9yz6a8a/bCceHnYMNNBsQonZ/3blbDPREWWC6CX79kyBYUU2wNw/IXvKS+trwww
         5wbs0DqhJH/KvtmVuACuLb6HI6UYdOHKzKg66a7yEMC4+7Q1UXK2CIq/IupRKhr4IK0B
         GfAPn9A84G9WVprh+NiXCnPw/n9tSn8xZua4X42JlmH8vyXJKhnR0BuA7T65ZuUdNyl2
         o6afhCcikqG9ZjRTQbYKQBdFDpnyTo/mI0lAa83YxCpdnyQqoetVUHP6VZiy+f653kl7
         yoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275732; x=1739880532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW+CbC+3CkKX6aO8ZADFZPA9ixVxGeRfqoxuCdLGR9k=;
        b=w3k7oJiKIPGqqpq9jo7mDVm5CsiIlgtskMLvZ2h5vBqqS6ax5m/NMpUFMH5TSaH6yN
         0YEvO6ahpq0YR2PoyB4A5FzT6j+gZ45cIF6U26s7eo0PBHPkWzfdUJ8i6Z5rSTJ4ivVU
         hPJmkV8RnXmsAfocwrzi03thYipV+VH7zTG+sYUkpTjRltiapfGXXeoFuEo0iZ+bXPLa
         PLLbiOGxGrSZTerG8GunMZMx9saj2OdWV62v/c04ThyeciyjUeC7Fz/Juftes3Dk2rwn
         pNZSmHBTwAavO8A0t5lwiL8bOq/6Ep1MBjd442oX5b94NrPF6SrxeUqzog9SQGvLPXQ3
         FeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV21/GHhlFtALaRKjI/Gc9msX4+PIynDBtArxtWdDyMQYUF+8pMo841htLzJ9b3V38Gt0tagR3yF8z/Npo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HZaB2maJXdPINE6dwVaDywVMrqyUXWD7fRNmkBOHZpsu5Tuy
	9Md/BZNfC3o5Jg1hU6xQEUgOmZ/s1lwS60sFaHSutBtfU2kmFX62hfzmXCKEaE8=
X-Gm-Gg: ASbGncvTCb0yKC2Gl34/uItgwXhuofltDHd88cnyiYSPUeNbILOf1H9482MUzwHd74F
	wqsZt5+8iWY8YXGKe2qWmmAW8oKwlixCkt1OGbDigZKhM7MiG2ravemhl5qWyFx2arhCAHWLdfO
	S7BIgHKVyq8gXX9dFkMmKgs6nHgaVSpXN2KuljWd10ndSU/pl7gWlVsynDHqPcMtMmU8BoDLS6t
	vUvJlhqW5fH60SWEWnYoACMnkS09KpBuDXk/nM0Oo74EwVMMDi4HaoVxyyxOE/27FXvM1uaCM3F
	xPIySWKjRYle5A==
X-Google-Smtp-Source: AGHT+IGDzevVeKanekK8LsK569/EGDe7hIKmgjII5hLLH9kDMlcAizGPk9JfK4EPb34oW1q9kfAhqg==
X-Received: by 2002:a05:600c:5844:b0:439:5560:c9a1 with SMTP id 5b1f17b1804b1-4395560cc1dmr14883275e9.4.1739275731736;
        Tue, 11 Feb 2025 04:08:51 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393b66f3e3sm86966375e9.19.2025.02.11.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:08:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: latch: use generic device properties
Date: Tue, 11 Feb 2025 13:08:46 +0100
Message-ID: <20250211120847.42437-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace calls to OF-specific interface with generic device property
getters. This is good practice and also drops implicit run-time
dependency on CONFIG_OF.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-latch.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-latch.c b/drivers/gpio/gpio-latch.c
index d7c3b20c8482..722eb5b045f5 100644
--- a/drivers/gpio/gpio-latch.c
+++ b/drivers/gpio/gpio-latch.c
@@ -44,6 +44,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/delay.h>
 
 #include "gpiolib.h"
@@ -138,9 +139,9 @@ static bool gpio_latch_can_sleep(struct gpio_latch_priv *priv, unsigned int n_la
 
 static int gpio_latch_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct gpio_latch_priv *priv;
 	unsigned int n_latches;
-	struct device_node *np = pdev->dev.of_node;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -172,14 +173,16 @@ static int gpio_latch_probe(struct platform_device *pdev)
 		spin_lock_init(&priv->spinlock);
 	}
 
-	of_property_read_u32(np, "setup-duration-ns", &priv->setup_duration_ns);
+	device_property_read_u32(dev, "setup-duration-ns",
+				 &priv->setup_duration_ns);
 	if (priv->setup_duration_ns > DURATION_NS_MAX) {
 		dev_warn(&pdev->dev, "setup-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
 		priv->setup_duration_ns = DURATION_NS_MAX;
 	}
 
-	of_property_read_u32(np, "clock-duration-ns", &priv->clock_duration_ns);
+	device_property_read_u32(dev, "clock-duration-ns",
+				 &priv->clock_duration_ns);
 	if (priv->clock_duration_ns > DURATION_NS_MAX) {
 		dev_warn(&pdev->dev, "clock-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
-- 
2.45.2

