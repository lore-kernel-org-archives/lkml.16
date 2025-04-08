Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C942627EA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097145; cv=none; b=JADn1AO/KwObbSfGdsW1qqVdQKMXoDZ97Mu0t4Z4h2urNd5rQnU8SlJ7CRUh1DBLzE+NOgN7bBg7tDVwZOB1MtHhVCMLxcsKHMzb9j90DSkQYmOeuanddo/xO4MRjKpBo6u3phS77+CKsIZEBdBJ1+n0kVEvXZcRCIk9b6Q3Z+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097145; c=relaxed/simple;
	bh=oFDJBxlaVibC5gJZK7MUiCXZSDcBAlZc/J2265/ifHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ll74lAS1AJOycCHy28VSRlhYTR1jyZgF2KZ3/b9Q4WMRFptm4Xdb8emKZZwSS00hXFBuPm+ngmvAKZLx83gmDO6MqBQ8kZUH5+w+RiG2/XBDfkJ8LBeLdvnG7Ym/28BLP8J5yT2TKpiWsK7KADJEzb+Eq9ecz0WUsIn9xqyh83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xwb3wcmR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xwb3wcmR"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-548409cd2a8so6174038e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097141; x=1744701941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=;
        b=Xwb3wcmRapG3dbmjNAyJRGnSMI4HC6dZq5ykpPRQmSXpJdCQBva8nF3DLsnwGUihnY
         m6Uei4QfnxKLDLNU2GWsgyE8cvq6EQg20ABaCfLIUNSTY00ffGT5NniYpkP2m6k11xO9
         hnRn16idI+gTAFHF4jGq5OvtlM9X4aGmRK1Z1IXEklKigu5wNB7HaO8KIu1GwL6pVQe6
         3OThuB3L8X+C6D3vrF9ObJn12t+BsE0tqp+fmnmeHaKob4QP4bujUSqU1LcsuCrmTzve
         9tYB/8o3nOj+TQKACHZEy/SFkA2wlMpQUQ3my6BrMZY/8Bf/BoCM0twXQRQzycZU7DvH
         hlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097141; x=1744701941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=;
        b=uaD1CWCFu8JH6jYefYyAMytBf/SX8HBuDM7pPXh9aiDcnUtyszNz7WY0OKU7rhcPUx
         OFRStGNeXIkLMQZjmvtT+xIFAhqyqrtrys02BXxBdhS3q/cIoYLGAMqvIGGhrGy4gDLj
         qcrM0kpPgsSgQssifB++DjEwyvjWQ5M6GAmITXIoUAQvdCNCl5qDw17bksBWUwwZkua7
         4siyX/lL3hzKnkEAI3gMnVcY9TugKWRKc/RZEKrFAZvvQoBR+sqQW3x2NF+Q1eEXDsVN
         I1yv7wZvZ48F2tFlpxbaX4opgzqpGu4RPllCwCjEbJzUYDh0SnNjEIoJjgrLPR5tzgRw
         Gj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpHNS6NHbpqoXH5oa3MSQqWqtr54pNlUuPhR7dhOYvWBvBjnJFiEzngGMkPJJjdCgzt+v532DzOKFKtb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdp+jg7Si7BhU1fcVr8SSIyzOT/m8B2t6T3ev0Bg43BmQcbIZl
	B50Zh0wDdLmM/ntku+VwBAj9km3ySl6MSGQpnzT1HRMG6NvaGBLZlJnrtsMLPX68zeqGSj3zsAx
	SgvU=
X-Gm-Gg: ASbGncvccyHjPo0kCJ2PTnS7pFGLRx4q8V7VWd6gIsB/tJ2UjumBLG01OU2GGWAk9aS
	bDfQEf3/JWIlq+pifijFLrIxesvhdoJGWYUxJnBXud7HVf2QYZMw3qwZ6CLCDOM1Rr0rW5JWIVl
	9rZAYZfB4h5vE7OG6V3Ba0FzlFhGjV0lmEjd14+J6MnJoEIRPwyNpMZ1DpTYtrNfE/R2AjgMSOd
	nG64cEGj1OAlkbQ3df9uKvgAbbolkPFp/fcDQSaUNIG5Gu62sEEDFFHOd2DWnhpMde68h/zvDzH
	C7RA6n9qSbu1kDaNalqTzihKecbqf6yczXCUVA==
X-Google-Smtp-Source: AGHT+IHqIWuX5sWz9MJQWDS2IT6lTfF85m614lClDoVvdHMGky/Ix50ZxwKNqFgfUZCLhjcPg/Mzog==
X-Received: by 2002:a05:6000:4313:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-39cb359830amr12025582f8f.19.1744096669312;
        Tue, 08 Apr 2025 00:17:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:38 +0200
Subject: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6oXQdDn+JiYI7kPrR9MR4Ulr8BlxDaIdgOQst72f6aI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZS1CVSr+OpPpLt+g73dsnxK7Cn+5jOBkEm
 S4RhLYFpI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 ckshEADgmKAecLNRDwbY5cLUNohPOOEtx7wPD6IeqZgsOFSImxcR1AYiTklwNvcEyx4WnHhAmzb
 oG3lzRmS0xFVCzQi9mX4uHbuIJXP1MxN2ddsgnB6lg1CEj1b4qv6DNNxxtBQ0ipnDwRNuawQcwH
 aeYqABy61n2vfrZJBJVOSi9TQAkdSEJwgvanfueiX/vJnvVKET+cxjJqHSgRCxlPdre/sm0kKMI
 CCPKVMovBcpT7OOGP0j4+p0kCB6NCqevlaTewuoV/h4tWjYpF6SH9gESREPjsk7R213eO+DWr4n
 UFTfB1ByxQw7vd5agHmcng2yl1ZV7SUNOsT5kf6nSoI4cvkeO4ons+t63tePlkRUDoQumIQzhga
 N/mIkjV7W2xjVvZrcZEGS63D38/fzY4sA7sVuWaWgZwWrCrfhPajPxotxjxOsvTWXSWJkfh6ixI
 f2yLdNBgi9wSYNat2UoYPTLeRh3lzFjphWxPajFb+ZQczTx/bXcjtpDXNQewa78BXhZ30rEIrF/
 M3gIErsXpEjyv3RmSJV7CGPdxfLwaxjHq9SZNfNqeeYValUtoqirxITK0jSaQrmdUBMmUx/IqJs
 XwWZMdG3msE++lZ6NvgjhT2WFVsie3VhFAI2l/WdsxXhiwXItFE0r0m2V8VtqyUKn2/YCh5ew2+
 nnZya7p1LkYH6fg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 8b01d312305a..5db839fa9b3f 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -390,7 +390,7 @@ static int atmel_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
@@ -398,10 +398,12 @@ static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 	atmel_gpio_write(atmel_pioctrl, pin->bank,
 			 val ? ATMEL_PIO_SODR : ATMEL_PIO_CODR,
 			 BIT(pin->line));
+
+	return 0;
 }
 
-static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				    unsigned long *bits)
+static int atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	unsigned int bank;
@@ -431,6 +433,8 @@ static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 		bits[word] >>= ATMEL_PIO_NPINS_PER_BANK;
 #endif
 	}
+
+	return 0;
 }
 
 static struct gpio_chip atmel_gpio_chip = {
@@ -438,8 +442,8 @@ static struct gpio_chip atmel_gpio_chip = {
 	.get                    = atmel_gpio_get,
 	.get_multiple           = atmel_gpio_get_multiple,
 	.direction_output       = atmel_gpio_direction_output,
-	.set                    = atmel_gpio_set,
-	.set_multiple           = atmel_gpio_set_multiple,
+	.set_rv                 = atmel_gpio_set,
+	.set_multiple_rv        = atmel_gpio_set_multiple,
 	.to_irq                 = atmel_gpio_to_irq,
 	.base                   = 0,
 };

-- 
2.45.2

