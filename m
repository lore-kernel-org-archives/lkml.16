Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35242BEFE9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847629; cv=none; b=jGHaXO4Pzhb/snfro0RYAeoVfJXgG4ih5j/Ibnh1hgeiEBj6wyc37jmAMBNhx5Zlaz5QyS4b6Zy9D8ZJFePuQ5/1wnt23suxB98IydVuWcnQsbR0L3TyEXNd8DF5c70MlKv0D4fiCVPu2h2C1HqWOtdkrjshfB9Gflp+4e8LRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847629; c=relaxed/simple;
	bh=/D31nXRZN62lyyN7INw9F+q2ocTvI4v3vtlufAszE+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chsCr3tJSt1Ebwlq93G3h9Ki8d7t7vaTBn90y8OIAqvqEhMSVqKyshKGprR/BbkcA9EOC0WiWh1vu07CC76MQy6sm/lJ8KvT0N5CNH65PLCmWObQ7CLEg6yaOKtejRD1cWBMCRBv14y5VJVyaEgHi1OtD8GvCCU96s/wbfN3h0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kDkvPJc/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kDkvPJc/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4530921461aso11642675e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847626; x=1751452426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
        b=kDkvPJc/r1C5cRpU3Ff+58kWFkkeabY6+/Pso5nhoJ+SqWEqIHvj0dI63/N7IRg+w2
         xNVomV3VxicrTa2xJg97oWZUw/qG9WwYGvr4vVE5qAmtgTjm0OvLMBiT68RS5UW5Pcw+
         ECS43KTCPNz0JoWXW6B1BFeWo8PsUL3dop8TzJru704SQz5Ca15RC0QnrftQvzEbvcLB
         n8xRqHhOWeCWLu5FHoZfu19VT8RlRjBeiX7XWfBFgYJDab5ypztuaHD/MygyaIRIZ2CF
         i6aTxVfSlceoS0My7LkYwJm67SFcgmHJL90n23BW0xa5I5LUS+pDRPgL5orx3aHxRHaM
         WYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847626; x=1751452426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyQ3PrYj0vw+ZbLfSxsjtcAJfx4MxDD9O7DR/JlwJVg=;
        b=PkCCS9FeWw5K8ALVkmF4W85Mch2c9jsx0ihUfXY5vIig/QQuzP/R//YVlQQ/v8yBJy
         arGqgpd6RP4uGeZqEBCnzmuS1UEg0Ljg5X9TBIpwsjSFEe9pMzO3KghYhbD7CHMUzaOD
         veC2s0TITSmpwTEEn2kqnJzxyk8dGU4mq61FRgRhAI5jdghNg71DlEqMXEBUPndUFIVH
         kDNGOkKY1l201LfEZaEMqMn6KqVGiNYDF5YJtTwwbZ52ca5ap8aZB8VLyDhKs6Rq03qi
         +eVHt2enln0zzWDUGRTibqsnDYcOSWcjWkOBfmZhKuRNGPWaOTFvx2tqh+AZZv5f33Zp
         UAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVbkHoeWhIPOtEKWRDr8p7yjFSWdD7VcPzSOzEo6h1CCYiKoFa5lX6Oj//zWsCJjquN0TjeMBtu9Xyv1s0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyhy53BJ89ybFOCBg0C5FBaUiFkb+Bgo1sZYH0MjDGSHUqt4tj
	vW6VrGE828dhDR3sN06m6EJV/t50leE7GweV7XHLOB1zojBMUvwuiImaH7PjKb2jIT0=
X-Gm-Gg: ASbGncu8YY1QpDwcnKRBSEjtFp8268ClWsUEjbQXPSQ3ch41z1jMtw3JxE0LKSukQdl
	xsY07FD/6Ecnpyk4Q0+dzU/oZznLLhb8OT+fOhKezStwc8uHxcGtR0jU9o4RYpGCRWooU+9XQoW
	CO9MiEEZnDhny08ikj25KE/z+CEq6E13TvSSb0Ib7vu6zBwHSDbGy/ylmaXDp0IeQsSeIOVG28f
	MrTF+PkHGucMrnrluhXJSh8qd89x2OFtAx/88qgHPU1KPQI6Z5fqdPQ0F5IebJrsqw9I0wEl98Q
	J9vP6wgzscvQC6CM9mSnKF81wLfH5+8L420sccKkYFg6VbUVrXzWxWY2
X-Google-Smtp-Source: AGHT+IGJBQOkw6eJT7V+Tc/6OJa3rfu5ZRr5gF6yKyzRI/QtnAOx+SjmcHMjXnKIxCo+GCFyhzPYEw==
X-Received: by 2002:a05:600c:c04b:10b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-4538269fd07mr10337845e9.25.1750847626370;
        Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:29 +0200
Subject: [PATCH 06/12] gpio: spear-spics: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-6-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vMdNPd5jRPkJ9QwKPdJC9QQNnWlRPg8OHEfjS70PZL8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/CBkqsRRCcLd0UFu9RXVYmSHO9jQsckaJE
 pp2PCUKjOGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 ctwSD/9Mp/zVOVvyZVeHYqyme3BxhbzcR9pcx5ATfalyilg7HNmKg/32h7u72xZD3I1wE5lhqu7
 w1czMVrQqd7UfT4/BpolTbZNq9c4D3ZR6dAUhktF/cx5bXVfMauk7BkwSn/SJ585lE4Rgj7ZYes
 0IFjVz8KTIXc/AA23Ck60F7M//fVSTCpR1IWgTGE1a9T/V9chKJksSUZ5JBQZ1ipj4wfDSEQzhf
 1lFx4i72i4HLleD2elpfccU1Z0Cor3a0tMywrN+NIfQfzrEG+7Y7qHyaxkLWDEar4rv7Vc+o0V0
 jy1ZuwHHuNu4SKKem9Lj4cKuaTkMACootTDGvZUNhooPVv0m2fGdM3yp+5i6jR0GGwXBt9mwBfu
 QxawwHxMpmWMlppx0csAhOiLpiVq+BSklp/hxYTLzJJl0D5g699IYJyJNdZtHYm5tE+jpt5pT5J
 DHx9ueCiReim7jnqdaBEvDJcE8BjSaO3VjKA5GfwRzcoJ7qxZdVKxg8K6dHxTXxop8RnO1nd74z
 g2tQcIMknTnWHIgH6qp0O919ogwx8HRPwKJ765jHeAi13F7btqMOI3SivTQSSRwVxBhG/3zGbp+
 YQhLXkbn8Z1A2YZoc4REvxRZeJ3E4dSx3HuNv92T8bO1c9MPNpwQRjNICxgXuDOuXAGDFcdwZ9M
 etbIQJG4192v+3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spear-spics.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 964b7dcb30b7a5bccda964a637f7fec97fe02aa4..55f0e8afa29143649e868a02edc19d920e10c31c 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -51,7 +51,8 @@ struct spear_spics {
 	struct gpio_chip	chip;
 };
 
-static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static int spics_set_value(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct spear_spics *spics = gpiochip_get_data(chip);
 	u32 tmp;
@@ -68,13 +69,14 @@ static void spics_set_value(struct gpio_chip *chip, unsigned offset, int value)
 	tmp &= ~(0x1 << spics->cs_value_bit);
 	tmp |= value << spics->cs_value_bit;
 	writel_relaxed(tmp, spics->base + spics->perip_cfg);
+
+	return 0;
 }
 
 static int spics_direction_output(struct gpio_chip *chip, unsigned offset,
 		int value)
 {
-	spics_set_value(chip, offset, value);
-	return 0;
+	return spics_set_value(chip, offset, value);
 }
 
 static int spics_request(struct gpio_chip *chip, unsigned offset)
@@ -138,7 +140,7 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	spics->chip.request = spics_request;
 	spics->chip.free = spics_free;
 	spics->chip.direction_output = spics_direction_output;
-	spics->chip.set = spics_set_value;
+	spics->chip.set_rv = spics_set_value;
 	spics->chip.label = dev_name(&pdev->dev);
 	spics->chip.parent = &pdev->dev;
 	spics->chip.owner = THIS_MODULE;

-- 
2.48.1

