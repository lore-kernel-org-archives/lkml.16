Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA25269819
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392529; cv=none; b=jE62JgcJRVncB/fZyC8v+pnPcoHHewlLpjtsnrsgQvWGrh0uDRnZN0g+y+2DQtX/YJ1AD+KrooPgGzOCpS496scoZOWYOEBUuSp0K/4ZfsWejkXOK8YK/iOdEfmzY/i0tK9GL/ivs0HlU09h7x1dPEPMsnk+ZRnTQyShO7aCafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392529; c=relaxed/simple;
	bh=HxZIVHd7Ya/Rp9rdtaZgnyu2HXbkzYuPBcLzfbMctys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UO61iFWmvuc9WNx+sj9sJKgh/X31V7erT5kOMO+GkAXmBhXwjv4QyH+lmrSeG/tEOaKK2/pYe2QEFGf/XTR72tjh1gcOVrCSdVK/vQVphkLeFggJsFlHcCnFmXKqBg0xviZCYG5G+K3ohN5g7uiLdRRqJghMUTYeIWLV4OaL99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qvMwyblT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qvMwyblT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso57715135e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392525; x=1745997325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=;
        b=qvMwyblTF70gdkEepDKYC0ht6T0G/gZPeUP0X7WtLVUGfG/EXh0p4K4F4RbkbWi5NR
         kGiDZTVNxp9vmB9YXOR3Yz8CvS1pGnbIS3hsT0uFsL0JZUvf9UFa4WKzOF1UyEEux3RA
         XIVkpOnpCmVu5rl2m+nS/Bp4/k67MiRoQ3KebXMz073R8gjcpbBYEcW3UkQxcCfQTwou
         hNdmQvAzo6LKazDzx455RXqazEwwauNDRwuQMND28HgSi9fWlRELLeUoXlKX1sLSOUF7
         O0y7glq1h2UR+/SqI/ve203QnQwn56e0o6IPhdaXQJGJ2kSkbbGjeG7Vhm4cZKb4yh7I
         WrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392525; x=1745997325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=;
        b=gnY5H2j7j0oLSooUTsWqivdLfWd3fjux0xJ6CNDEEywx+xd4VSTffXYwAkdipkvoCK
         ZJW4rXZWxO5RENpK36cAjc6zA+LyZD2PuN2U2QketRMeFZcSmO5ksM4jCZoXUB1HyuGY
         ClMBxFx2axS+YuGiQEJKfgC+zlXHVrfDNvknJ0XtbOq2JX2rZaqXHFhlaNAJQ6fT6aAF
         EmRYA0C6TPwGgoZ1tBLuYqPSbzTP1RQZUZTWFgyH2SjsIkFARpQX0M91LIhFRKDaCW+7
         la5UR/acihhM4GE7SFq6zSBGopgGDGT4ceWQbeT7QpWw2aMqYg/Wk1j4nQaB98haBjJI
         MmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQde3iJUPbf3INOfzydXpICQ/DMeVk+2PB2gLrDcWfZNsit779N/eFiZJMlE4hD1ag0cLjg2jqobMAlHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlggWIMLAncT5bDnpZip9PFXQVrtrsGSThgxg3OiFBi07wQeGx
	eN44GSbxO6FtC+T72thmVDkD3XqXVrKuf5ZCPtepueDwjNDmPWJl1pmjq1MOv2g=
X-Gm-Gg: ASbGnctV5Fx0Cr/7MMY4liNi4zsa8n5QhgsHLu6PlwBWvBimTRqJZPs+ugtZJTMXxrd
	RwqutmDIfOCvB5txdQCkFVu3Q2K+Cz/JY9U38RN+PyneeJcYp1I2da3e9+a0ulpgFBYY6L9pP2+
	UlrXbJQsbkEgB/flYHtQPmLcmaUYreuSyTEtst3EEQf9sI5ylKsJXx/b30KskCXgRScFbg48y99
	U1H5r2HchVNEq9EyG/BKWECzpR4kXKGAwmFI/pcw4huVkWc+l4eIsdIN97EHe73hmPemo5cdmcr
	paNquZXj8xMnzb3Q1wbUphXSSevU3Dzihg==
X-Google-Smtp-Source: AGHT+IEn1spt/h2u5dpKe8vDHbB7DwPQ7hB5lVmJHia8LQyke4IXqZH06mvc9G/kfquH6FxEAPcrzA==
X-Received: by 2002:a05:600c:1914:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4406ab70701mr153653645e9.4.1745392524615;
        Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:10 +0200
Subject: [PATCH 08/12] gpio: ljca: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b4e9Yh21OkyIv9obgoEt9uaVpzJ2jn0uGM1AhPkmL8k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCVzTKB9P3OgjYJzBe1LF+XVaeO2f9Li9su
 ekmz2jV/HuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 chT0D/9Pz0ea0xoZZIO8L5T7J6QFHTeq5HWhqnCTnNTNkelWPIudJu0KNhs3oCRhcZT/u71VnLL
 WcJEsXuNcdIoK7140LbEMlu3xYC61N0tP0CCMtrRT4B4Ddv2FQZY9WOE3FaFsluPeeDlaZKjIJI
 xNbkSCV/U3XJO8dxLCewcUf+ju3Tb/kddy/4qFAC07yNbcjEEKFg8wROjW10gAQDu2L1famCSmL
 Q9vP0Fiynki7tK7OSm8dDdN4a3oLsmuyx+c79R2h/o0YnvAoivFZXfoe25SwXg0BRkk+hWRtlZP
 r5c3EhV8g44ZfP6E4D9t2xzFNLpuV3pqruIsgzse5vuIsW2UKLFzeiq5MTArUpDRuj8jiuDNbSO
 g33fz+nv37+1yzrIzstqCtSuNe0B64gixzlLEmRlLxq2yrM2Dsmr/bMs5upNB4UdlU2/Aoa1wp5
 QPqX2giIFEH+huZ65p+6UJoPU067Q/kFuZmGVO/KzrFNMRcO0EWeyspwsBTBBK/+1FdQPADGpI7
 gDrHr5UCRdmfoCd4bQLS7C4AosydlvVkfNTnSjgy0JK9ORZcpsKIYzxEnUyHHfv2hSrdqJO98MO
 4I0iE2dE1nBKtQKxvrFQRIF8qPKrJtCoHpZMSJci3zKDDWnqShghUOaMKQpof5pYSu/UYM6rADX
 fYZqx3dLCF4OPIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ljca.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 817ecb12d550..61524a9ba765 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -144,8 +144,8 @@ static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int offset)
 	return ljca_gpio_read(ljca_gpio, offset);
 }
 
-static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
 	int ret;
@@ -155,6 +155,8 @@ static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
 		dev_err(chip->parent,
 			"set value failed offset: %u val: %d ret: %d\n",
 			offset, val, ret);
+
+	return ret;
 }
 
 static int ljca_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -183,7 +185,10 @@ static int ljca_gpio_direction_output(struct gpio_chip *chip,
 	if (ret)
 		return ret;
 
-	ljca_gpio_set_value(chip, offset, val);
+	ret = ljca_gpio_set_value(chip, offset, val);
+	if (ret)
+		return ret;
+
 	set_bit(offset, ljca_gpio->output_enabled);
 
 	return 0;
@@ -432,7 +437,7 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
 	ljca_gpio->gc.get_direction = ljca_gpio_get_direction;
 	ljca_gpio->gc.get = ljca_gpio_get_value;
-	ljca_gpio->gc.set = ljca_gpio_set_value;
+	ljca_gpio->gc.set_rv = ljca_gpio_set_value;
 	ljca_gpio->gc.set_config = ljca_gpio_set_config;
 	ljca_gpio->gc.init_valid_mask = ljca_gpio_init_valid_mask;
 	ljca_gpio->gc.can_sleep = true;

-- 
2.45.2

