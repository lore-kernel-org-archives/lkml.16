Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF88264A95
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522119; cv=none; b=QBa3dzH0Zx27zFS4r4CKdXiSwW4UUCp0RlMUHoq5PGCy54lG/7TR3rTCVSODzF+1W7xu1+pWG4eYXtVh+O3njl7P+X8N36GY56y+Dg6S95DlD89eZrHWs02TwzZYkKvFYDM0XCvdrnIGOBCkZ8tF6sI0sSovOqSBU3ZmTTbQtuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522119; c=relaxed/simple;
	bh=2or+JBNGnO4YRdXBRTn6HPiuWZpgrAjupHyyTXPwtVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAzhB5+evF+e0He8UID3YVPGhB7X2U6Ix/xHi0QOgbRu46bufQavIHKf1tOqsIl2siW6Wx7SpEElZ4LXfnoNSWlQEVKtAAQ3yZVwh7yuOakDi44ihspIRmfGZv++HSFoDJ3r4w8BwIH2r7hQ4NBE8GdsQGt7HG1pZjwjP2EoGQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mIhx1pNX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mIhx1pNX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441c99459e9so15836555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522115; x=1747126915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=;
        b=mIhx1pNXiRg6DKqnGmXv7U3tmrU2QkwhC0UIUDnOP56SBA3guWJq42dedFTc67sEmp
         ouM1pj7gJbytnit+E3ok730tsVXEhKP3WyQY9u77zqIE1NLCmHn9+GHPzbIdY936A8+B
         hcxHqLrO1WYiejhnXgp4f7pkF7mP4qLtIvk17DDHe7zbx8xJVu1mBDv8YKFp+3T3qDBA
         aqPjIULm516IAzby1rzStCMCt+Bp68mB4tV2GdSFAOx9iipSpS3GskcsnakXJQt83KaA
         f63897Aii2+6eVbOny/THQIIIUXQvDZhV1o3JFDQr9KOTZX8GTHRG+fTqXpekFgXRITK
         BUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522115; x=1747126915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRbwfcPISTocHOhXVUtVqcS/MjhgKVKyymoCXJ3Oarc=;
        b=uHjRVtLas+JsAc8VdjvPoVL9ck73V3edCn5UPdFqAX9EAMCYCKqLkNGW5y9JopXinu
         xZIP4pqkxNzjwKzZxOXFZrwtpWOatBddBWXPKNJIphQnb11nkL3XxwAe734EtuSB5rxK
         3kNznfy75RG3A4BxjZSGj4z1yPYo8fzjwBwcaD9gtrH/UbNUsz1q7BZrx5NkA6EaqBi8
         sep6pO5C2MNz0fWXAnop9Mp25cNmEEwVgwSHyBZuEghme3QpZ5f+254Jis/dyiyy5caj
         VraGLx0oi6+N0xm52TT6gA0OKnYk3qeCoQzZe/64jS1gFFKwkHjUkxyXeHJFos75kqMJ
         zkZA==
X-Forwarded-Encrypted: i=1; AJvYcCXlVMe6MDnvUXOERb1tIAJaxgsRoPihYYOlGG/ZnVeEkHlZXAWCT/aqYnghRmKz69vKp2/XfBfN0UCGCb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyI2gN7LMQg57JGjTLNX3NuqbBT//960V8eXxWxgp59ETu78cw
	jrWhfcJHKnxlqrUWOmkrc2NxI3TJwoeeE3QVdxFLfJ9+V2tKNLzkQbvE7oJ6vU5xiCDdbXCiR6C
	r
X-Gm-Gg: ASbGncv4RSrfxYbca5L84brp6obNOG7dRfKrl34ZEwhb35THghZ/ycLTY/yNHUEwBus
	QO2xFBRW3bM1k3RkacKz6nQe50/LVvmxe8km0ccPVJF5FNR7sPVPF+N16o2j7W3qDdzGN8VVTTp
	bocMD+4cBBHtjkONalj6Ngde2pP6E12PKItg6MJB3AxXa0LjuXreEbS/HZj4PONbjfvyAQRSX9M
	WqaFrTnM3lQ+jJOF0+72tXddoiGU5fOGOY0gAncLFtGZR4YGx4x/ttsiXsuSPFicQ8OD+6d/bg5
	hrp/HXtZHRolUCggyXPzMOeJggh8hh6xpU4=
X-Google-Smtp-Source: AGHT+IFaS4uuNDBaE6dhkhCQZlPqtoW9s6ejNK/wKywX5ZJFKn+MgnjgDQY3rIFa7aCju9NeyyMDmg==
X-Received: by 2002:a05:600c:1987:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441bbf33b31mr127301045e9.24.1746522115124;
        Tue, 06 May 2025 02:01:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:45 +0200
Subject: [PATCH 02/12] gpio: lp87565: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-2-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=g7BgjBBWPP4HAHZDBrZkWD5sdQj4Cs5tbDmVip+FOsM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9ERgHtadWP7KkHQX+SJca3tVfXEyXuW72V
 BoPbo0tG1CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 ciGyD/4zlyrvqUlkFdwqgF6/1bmPTMA+93X1SFLWKapDdKrqY6qB5ax4uK8vlaoVJj+EGNLpV45
 PxHxDOaQwYLAlMSatc7jXiGCGhFX8dfDyqEcKM4w1ow25Cgx9GaOf2IxMKeUtA5DljGR+fvaoLo
 itfBnXi9u0KhlfX6aoEtMfKJjL/waIWp4HMGISTreeWZBiK/Cancv+qdCZem5nlVnQToK+nrrY4
 C1rwbZ20aJhha4hrK/A2mGKhGOtA1qA/CXE7vBSKVVN5BraH3iAvlbNfWgk1rCz6X9x58IRAE34
 gc9M0lREJ5yJoopjEyvR7jxpGpRZ21kiuIMlvD6PRwNyUwi1j8I7SoxNr2UwWq+vmQcN/qnE1nQ
 fFlHfYEhHGibqrl/EgGf/eeG0O4qc1GcoCLK2ocm+ENCoFiEpiPYbS56b3rYUHy6JFWD1+RIJ5/
 4hdQE4Gm0b7F0sOa7+yC0sijojAZ8yPPZFhHayprULmzhS9MNlO9lAOjh/VXpKOrdfi2lnarnvy
 HqvtmfwYKU6qCO7JnlJP8GRepr43s/XAN4BVGd4J9hX+CcPSLfKB+xkM/D0XukauNtFoUctNuX2
 0VmdoCwcYQWChvaZ3d49YENC3PYbDFUmJm1LMxRXD8oMQHMSi6YELPLvRftvqL0K5n7q412i8uz
 XTil/+VBYkSIXwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp87565.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index d3ce027de081f..8ea687d5d028a 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -30,13 +30,13 @@ static int lp87565_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int lp87565_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(gpio->map, LP87565_REG_GPIO_OUT,
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static int lp87565_gpio_get_direction(struct gpio_chip *chip,
@@ -69,8 +69,11 @@ static int lp87565_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned int offset, int value)
 {
 	struct lp87565_gpio *gpio = gpiochip_get_data(chip);
+	int ret;
 
-	lp87565_gpio_set(chip, offset, value);
+	ret = lp87565_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(gpio->map,
 				  LP87565_REG_GPIO_CONFIG,
@@ -136,7 +139,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp87565_gpio_direction_input,
 	.direction_output	= lp87565_gpio_direction_output,
 	.get			= lp87565_gpio_get,
-	.set			= lp87565_gpio_set,
+	.set_rv			= lp87565_gpio_set,
 	.set_config		= lp87565_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 3,

-- 
2.45.2

