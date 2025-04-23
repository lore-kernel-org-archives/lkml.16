Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77D2749E4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394847; cv=none; b=sclg7+qhIbBK3W15MA3XRnEi4a1KwWfstpefWofrskPYeG6qQIPXhqzIMHTKX7sDuI78/yp3RQdmzQEdwBSTTxwotrT27uh0p4km6J17sxJHHtY4SsXyBbPgmNxxlFrbriCWAVlTioqFitFt19RrbODnUd/rO9O59q0ukoANMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394847; c=relaxed/simple;
	bh=3Ii8s2p/qcdFuMe8SVAPXc/efpCSMFMl0mlUoTEBswI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXDiAquAptD36g0Hjn8W9fI1Em2j9l6wFW98CFxNaRBeZ+iJQUjxviv2e/b3IEnLfdPbbQIUC108z3OkuOILVFmwcQ3ZGubC9VyNEqZdrJ0kGu11hvLDB22vlvQ6UjbJkoRQhbAR7g/lv+q60m2/DLTITjbwUxNXDNCsDd0BMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mTnVEntE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mTnVEntE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-440685d6afcso57049715e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394843; x=1745999643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G50tHg+9cPiXzkRpuZie2LXfSMz7hYXUT5tobf0KFow=;
        b=mTnVEntEoLLNgtvVkc66Fo6QuA+P2oveflOhOrsm6JJfGRsB/k13MRHT5Znez7slnk
         ACvS9M0+fLtcWr0Fn78Ia1poKdOxzyYXQCueOTorKmwwPOHfAb6CQ6UQOg2xFtdAErf/
         EvhNdKgbtORqh79UqpI/v1uFKvHTDpGhu1ixfM+tDY/qj61+LjTjfJT8vH5LWRVm2I2Y
         doqncjQdpYtlPFKcK25u35mSLlO9JfZyFg1+CN92JAROARI53POnmONnAzW/fo2E9VK1
         XsazlD7SHJn0GgmcjB5rE6CPshbC4p4mOxWChuVL4MDwZvoJPEf33uE00yrcEwQvzWK5
         n33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394843; x=1745999643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G50tHg+9cPiXzkRpuZie2LXfSMz7hYXUT5tobf0KFow=;
        b=mK34DKM8BkjCdVwOfCahBqJktFqmXbzNwEcOqmHzWsooggtPwPBR2SQQlLoUyLLfBK
         GNBTgThGH2Xu+gr0gpVR28s6IOGT5EmR0SPrRUCC6cmZzZ4EF0fk7tyOOfIkeSN4+aWI
         GQnP9ech46/bM3yRu/B1pd6Cxg3zRQ3xSv+gn/cRgTJl1pQnxzzF5TxfD/g67gnQ+qH5
         0JN9+lF6CYtE22oO1M3yC5Kr5pnzdEG4thU2avKyrwQSB0gRDxIMXMHsusjcQeybuuz5
         15f3RZCnM1o7nrdG9C/LZijOqnlf6/wip/xwh4A91EhN3tgLlgFh15qaFS8a5Ddh19up
         C1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXX8vH54nwqhZaHepdpxrxsJzPRZ1ssosrmWTeAZdfg1JgJPZZ8H6M37TA7oEYbPZ385cCePhoKMMcqAX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNHH7oXBMKbgYTPBD4JwR4We6COuLIePZJRVg2o7y7OvxeGk31
	yL35KHQUEQ5BjLOWkisIiaKHdzSahUWGAyQDMLv5GmcUzqqGWa2rkbjMSBjblpo=
X-Gm-Gg: ASbGncu2VpVaciiLkU84cEy6e48t6Ntm6we0MAxEIfeOrPbIGq1EULfLsGQksc42WD/
	g3lH3PMiRNEKfwc5splFl0AIwNfnSuL6BCRJECY4M5B9BAGBhN3tO7tLpT7HnXOtyBFXi6VceiL
	lDKy+o5G3EnYOMhg1CiOtJuWfO4lO7dBss9bKzSGifvYSYqnyS29KxEneXa7QoBlFvhjv/rg1mF
	wKwV0TbpYkkxEBbflsjIjF0q871IwghARujDBmY2Z9j/PrsYv1BFJsjsBIz4By2KWmMsCbZsblZ
	8INJSgnuozzWY2OEGawGy4g/7/UVXO8Krv4jgwACzd+7
X-Google-Smtp-Source: AGHT+IGvXTJ6ZnfxoE28QibdMukAk1jobBJ6uY3/oOh8NYBRChEhWLE8jpG+gXPQsyB16QsY+BFf1g==
X-Received: by 2002:a05:600c:a088:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-4406ab9767bmr210592445e9.10.1745394843119;
        Wed, 23 Apr 2025 00:54:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:51 +0200
Subject: [PATCH 2/4] leds: pca955x: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-2-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l2zdj6xneEh/Gk26Dc0eMWJRRxQPVwCJnsn65X8LVNg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyX/ngp3PcuZDqy3Ua2tfkLyx1/xsgD8bsIE
 joXG4dBiPOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 coIND/0UvM9H0Fn75mnFJ4Ib5MXYYwVT9suj73IBJKfYp7aqXXoxUcpByilyJ0agYWNMRhsobGO
 s/oI89fln0XTsleS8uMc8pXvuoTi0KcatR3NeGiCGlZBev0oNvaMVkn9ZLEF4EJw0fMtBxYMn3k
 Z6BST6/1+6uX9OyKUdDUzZNMyCRztmf8yWk/vdoKTLEUxzW88ppyl3vAu/ZYFr2QBuB1ynJLv5i
 eA0FcaWCTC8RmOKE+v4q5r0n0sdAC6aIBLOuQ/gqn22wDqVZMGXDPtKwryaS3urFcGTtAcsfC2N
 2FmLLkH4/mYSliEIiY7RW+U5AsxItOtl1iba3SI81o2Ym73rUsTCVfX14CpuhRSZksGkAW1kwBI
 6Ihdv6hXi7/EBQAb98xTY5EzPvDm8mqLSTJE466nlZ7+CJImoq0nuQpLVcL6uGOjdjlNOLJFhM3
 sMg1EoAFfFiJyiF77za1Mh+7wZOKV1poPoWdjQ6IfXZNMXzxlZLRiHoXDYvU3OP+U67D9w1NZWj
 0awPnKFtkMeQdnCAxADE0KoplYdX8M62s3MajaeD2Hl73UAqaXVgN6BiEYuL3qEKO0V7oDa2Hcm
 7IFwc/x9HWBiVQYNodydT3su07qbOXk4eoK68fqNS2TLGQ+JEQ6Lu+o+ZOTJcWaVSnO2exudDds
 VN9GzjLQ1pCJcIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-pca955x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 24a40a1cdb15..42fe056b1c74 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -495,10 +495,10 @@ static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
 	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
 }
 
-static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				   int val)
+static int pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
 {
-	pca955x_set_value(gc, offset, val);
+	return pca955x_set_value(gc, offset, val);
 }
 
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
@@ -737,7 +737,7 @@ static int pca955x_probe(struct i2c_client *client)
 	pca955x->gpio.label = "gpio-pca955x";
 	pca955x->gpio.direction_input = pca955x_gpio_direction_input;
 	pca955x->gpio.direction_output = pca955x_gpio_direction_output;
-	pca955x->gpio.set = pca955x_gpio_set_value;
+	pca955x->gpio.set_rv = pca955x_gpio_set_value;
 	pca955x->gpio.get = pca955x_gpio_get_value;
 	pca955x->gpio.request = pca955x_gpio_request_pin;
 	pca955x->gpio.free = pca955x_gpio_free_pin;

-- 
2.45.2

