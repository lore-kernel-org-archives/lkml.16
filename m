Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82632472B4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448143; cv=none; b=aR8hRe8bWA/b4sqzMOVqN3Oyn70vOtqjQCVQn/fsJcZ3yaq8wptyaPK2liYVKHzdLZcUTyPy/6PjrtfWAO4USsCGMFZCCV5e4JCtldWUCqJzf9+sIYFumZYkfM+xlvOu2uNcCEdmzIgjq2OZayKPZN1I+E1yqvmFfNWc983j4DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448143; c=relaxed/simple;
	bh=tyJykNA9JXtsEmAKpbmxVrsK8pxuyPX22uRvQ3leZaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ja6XU4S+X84Y84GM3Tuu2h6wBICJpISKdC+5teFos8i8hBlagJNFwIqUuCjnLf6jocPvu3ISlE4oxQkIP19kJbGZF+GBwiMX1ZE5s1/44C0nf103cnyTl1o+XZLv7Naju3+oscgefD9jTnKuo4BDaN4Q5OZrEYDeyph0I5NRFwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dAfVStGK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dAfVStGK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453398e90e9so34173925e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448140; x=1752052940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=;
        b=dAfVStGKM/F+wFUixwbSyGTJoQ2cgjWnGUGUKBIKyimawyUiZ06GBTy57vSXVz/wzl
         0omEEOureH9KkXCSQ5bSP5KLkHC8ltmYRL7UK9048fSteYgOeCoOxxrlpLh1tu1Vcrlb
         4LIcNtYdvq+YEwxx3zABaWC7Edn27IRGnZkh7AWxe37e5kb4ys1ZDwaQ+0qiboQf+TQy
         w/hRShIk1KcwmvlDfn+xp/3j6dYmdcweczYYpGkCR3p5BJG4VsFL3JlwnIARpPUml0QN
         GYf3OIYRr9eLrB7ZG9maxQwaDLH6DQDm7Tn2hnY76olJhFKnIIuKyV/Gu/xZQILS8r3/
         QS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448140; x=1752052940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=;
        b=a4Kqlu0GNNTPYc5kpYmVez9brzmSdln7gNvri5nyt6MVQHJAesSswFowikVHOSNNY+
         1n+BqjGkzzBgPPsNj4YdbZd13fxQALVGHjJTHuFiHCZ551gfFInP2rhL7E8TGSWHaFr3
         VGO/0KfT+UNKN7sUc/AF7xfU/Y1hdytW19LhGtHdDLsoZMbzZByUnvE3GY3PV+hYgxke
         4S/12gXaEw/ge8qvqvym7YVH1H+GWk+0in32SM1SHGWwSME6VMxkoh93G4xh02jEvtit
         Hq7guf1Z8p6S9GDjxILuxOeaNqSim3m4Kkt1NKTRy3xXTyLsdgIpR7Bm6FwGVxkICi+O
         cSzw==
X-Gm-Message-State: AOJu0Yy/nUA6zNXWaIAG+V9RndO1SavaRPssF8cNQx+5G/nPErtxnpVB
	9O4ho4mqDNXjdwSWIu5s05sE/HbnnpRH4tUqC6Hrq/+BxR6qt0koNPXGO7XY05Z11Dg=
X-Gm-Gg: ASbGncuColP3/yPnY06TJSnkHc2RPeeZz2V0eM5OrNibgY8F/bC6fWXLFa9AcCjEguQ
	nnWT7ePJUYZFhsS2cev+ZPwS+4scoTeapMxko6khjA0ucJw8SEjftoLj9mnzTX/l7nDWCKvF3ps
	kYYQhTm8sxEYDdQ3mTonLCLmyBy+7wVrNyzqkM+wgXfqsf2DxTpQ8Uglt1tTuDtbyTta32uo44D
	qMst8QQ4G8WHDa6nwDjHWa9DL+Ha+cvrmyUT1c7Upr+xC4qFRZDd/3YEDi0P663jOAgRJjBcH/6
	hL5naH96goibBwjfzB3DSfqVmn/z44tJlCPVUauKe1GU3nUbOGdFsQ==
X-Google-Smtp-Source: AGHT+IFJrU/ikcBRx1Xx3y3CO3Xl5EZm1K/9rmg09Re30z7P2KS1UPvPZTAXYcN+r1p0EvB1jatrfQ==
X-Received: by 2002:a05:600c:1d1a:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-454a372e257mr20008535e9.25.1751448140059;
        Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:12 +0200
Subject: [PATCH v2 5/8] gpio: cadence: use lock guards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-5-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bk+ifnf5IeXV0G/nLqnGxGzgGzg1ByJ+7XwxWcaWlmY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEg9KNgCFhZ5UtYv9wjTJ3eMXjUODBpO+wb
 PCt7nnTMAeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 csNAEACkpQv7m/AU3g7yjr1wp65de2B0s4Lm1cV5TrvXTlGYDwOuPfXVk5DxB/Em3KcTEwtlE/4
 RWA9JpR93rPV1btwtVrx/82hueypt+EsY+xMyxJrCmuoxwa6syx8ULjU0GJ+iptb9w9RkweOQEh
 fDTaCS8WmmKhKNC1m65+eg3G0+c3jaRQ1FXE/C6wqeYILGRNS9SWb6ZGiadv3AFB4WaBdiTsjn9
 JfTcVepzX9vT7aSsgY2Kz3ZRAnXZshGxm+tP0+rq025yE0SoxO9+yALIGcTY61qunZePr7fHjuR
 bzCoJjJ58D4g0DDy+KLy8nqkbogviMcEpQvfJHQm79Z3ApgVzOwk4A9Mh+4BvG+7ojJo5fvk3Dn
 KCbIH0AXYQhMnQ1rjNHJCPC3fLWE1E9BMT3xwfJWDSzqd3OGwPECW/+Nh+/ziLuY4ya6lN48/+/
 Re7tql7R9ONudhsB1UuOri15XRayJJm+MynOps/0P9d5VyafpYN6hfOyHpbrAbfn1eys7aTuHLc
 yuHH4CLFwXbCmclamn2uCj0lASs9cN3LBr1yIzKCI5BEPfG8ghfAu7VnGD3NL9cBcT8TS6WZumA
 h1GKK9cFtnaVYyg5ZwvNGesJn4tci8QKpBqcg/6JfNq8c2x8P7krZL27a2E4GOvLJ86c7NI/bWy
 BzYw07XnOr3jksg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock. While at it:
move the gpio/driver.h include into its correct place alphabetically.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e9dd2564c54f879cf1d49442dfa3db0004473d35..e6ec341d55e9047b2fa8718799ba72d54624388e 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -8,8 +8,9 @@
  *  Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
-#include <linux/gpio/driver.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -38,29 +39,24 @@ struct cdns_gpio_chip {
 static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
 
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 	return 0;
 }
 
 static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
-
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 }
 
 static void cdns_gpio_irq_mask(struct irq_data *d)
@@ -85,13 +81,12 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	u32 int_value;
 	u32 int_type;
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -108,15 +103,12 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	} else if (type == IRQ_TYPE_LEVEL_LOW) {
 		int_type |= mask;
 	} else {
-		ret = -EINVAL;
-		goto err_irq_type;
+		return -EINVAL;
 	}
 
 	iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
 	iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
 
-err_irq_type:
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 	return ret;
 }
 

-- 
2.48.1

