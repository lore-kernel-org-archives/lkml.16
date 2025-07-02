Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E912459D2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448140; cv=none; b=tCb8BvayGE50veko1aNBz3b/CTBOWBh3OHadvwTf3gGUe2FzWaYYq+SBerpTIoXLxhjUPfrRuk7FnGJ4Xile4v4WIPEjIXZrx+fY7zi88f8i74hajtXcdtI+zbgMmEj8xohVFKH1ejzJrZGmJ776fUagboCapQu0O++uePGpaGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448140; c=relaxed/simple;
	bh=0wJ3VYCq+XU4SPkOteN5MXhoBb6WcYnpfBxrVLUCSwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHBIA3/bfsLlNulXjJc6rQ87zZOXYnM2s8OGr5jHel2qsxxqo5zE1SUn0bjGuhb8+JJI6A/ZLyBq+qZgNgu3aj3EhyyFZ/1rWuLfgw34pEfvmbS0BNPUbRz2B6Mj2U53vMURT/CFhc9FkouZWNYTvGXl0s0kZ5MNWVn/90ABX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n5cddyhx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n5cddyhx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so43562825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448137; x=1752052937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=n5cddyhxXJg1pY4otvSoqJlP79MHBHUc+VJDcxfZty3Ugv9R1UAy6VfrISEU9rkBXO
         5QgBpYnXFv+EhrZWnhGa/yXQXqktnBd+HqKVFLITQnsgKA3J+KLhlv7+jU6cJaJVICCx
         TZ02YFUXAGQB9h7nEhZJr0hJkxcUEO54zApLzxaQBKJYoEdU4wGn/Y7zAsE3s0VP1KDb
         n6bA41bil4XfwkfflHRojrbLq24svB/L/y6DppHtgLCZlQ9reX/60PvJhXaODdfxsiTq
         zY91QRtCJzFFnTAM1rl0T4y2OjDEqilQoiDfThRaSBVzdaQ4PCP0yRcB6p29EJlTIC5n
         bp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448137; x=1752052937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=pJEMusIi6FXNtC8PXS0+9b7wbDiVYrzy+vSXCpoGN4hxcB99o/HBBKyNKtljMIgeWc
         OJUNm1Pa4dfZzr+fTFXHzk+h4Mphy+G0KqQcUxW/Dl2kzaCrJQtI+UCgUt/9kqJ1N77F
         WbzTYVBbZ2O6aobVCVeGtAX74IrqrgknEx3NvClY/96c4H1sumX7lWdS+5FqagRY/gwB
         kQfuWSVGcrCa9dgjTdWthuFDnh9bYDp8PgU3wGSPOi/DLnMeO5VRarcpx4r+6qfLTwuT
         ZETRztPHRVqlsxwtU4KGkD9NdzEZ/iCAMQSE1uMZhWIZi1HGJWe8A2Ii8macIaevUI8H
         h8vA==
X-Gm-Message-State: AOJu0YxZhCEe6zU9CjMkcKf4OOnoNZoq2l6n5N52EJj7jCj9+1lkdXpN
	ALiopF/G6szKVtcQXkpAmMEZhBr+XmS3zxinT4oEfq9jbJhRGjJezOX4pzWae1EFXZc=
X-Gm-Gg: ASbGncvFedmcSc/SJwAbFcV/SdsgUPwiCkRRNtuwzNOi0Yk41jsZ3QMDNL98oG4A49d
	IKmmMFX2upGF8NUC6WWXnxpJSNM0ABsDTmcT/0zosYYrTADMvUSlfiRhtL/+rKJ3cnXk+uaUAFk
	D6AGLq5Q6UKz9sDvIx6e9BAgMq21eapsG0w+C+AITy6O0wiM3xDIE895qSNN8YReDXiJ5v5eR49
	9f3CREFoaOKWbZ+FT5tURNOmJzsuT34lbhx8iCPCtLZew6yV68RcNYqtryJ+19mk9v3QUOnsc5R
	Wf2tH4vILiRe0118lH/RGd+JD+vteEzVZ+pQybAHpuCQ4SfFEpZzMCmfW670Fip1
X-Google-Smtp-Source: AGHT+IHbZgnhQJE6hWX8QzU1x6mPMLzGFrm4P9DO+m2Xac8J6ESQfWF51nMTQk2usCHmJA4Ncp1IXw==
X-Received: by 2002:a05:600c:a406:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-454a3a71785mr17378425e9.29.1751448136731;
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:09 +0200
Subject: [PATCH v2 2/8] gpio: mxc: use lock guards for the generic GPIO
 chip lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-2-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Nhj40fNUX1gi865SKkLYi1vu0OSypgr5Gc9r4LLn2tA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEIGYyx51RBbJ7CzXYFDk/AnkSqzP89dgF6
 L+qchczKKqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 ctL5EADLxOrAEbJSR2Mh80T7Iol3UM1Tdb2AzV5BYhIuzDVEVU7rCgP67SqvrsxLrxDqmIuiL2X
 k22Frcv6RN+XT3rCdfvh8Hkx+TqVkbaAKstzQEkhjFfRe0Z9VJb+R+ql5yd3P3LMQ8hULvdLQHk
 GeQAmaVdeErjT6xzypPJCvsFUS45oUUDQAHlpb4f0EpdVZ6n5r0MtKOJimTPlLSht2YpsODgw4+
 2juaSesJUw5aQXC2Q4fDcjsJarDAZ94aV0QXwJ+x/YFFrQ5/l9ydKgIpBG5iOjFQwqJgqwfJfoG
 M9Pcem2Sz2oTsqCd2qw1eu1kwqZS7EMa+PI6/IHT8dCViyKfTeTU0CAogktbHEc7PK4CNvlJTEf
 IwoJfpM93dcMzElNW57kvB/gJ3NySccCpQEuCrLcrIlP9J1/9n26ugjx97o/Jkr0/iK2p0346Z0
 vMOegy+lHXFjXBrWr9roJpgS6ZAdGmLIfW18LppeFkXAv/lFw1TolYE1FduuKS0YASPNUqn6xRX
 aV0SxpQotRROjkTa34UzpE+zisA06RWWD/Cpf20Sa5kzSUPv0fL3FEf5OOMYvUlPHPd/gKIMyZ7
 7DhDoTCSUfmTf2NlEXl8z1fU4VzSMMAGjfGf6wAiPiwF4waMfPjdZ8E+DrIX7boD38Gwqyit8AL
 /h1jeFyl1o/LiyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4af5a2972d12f68909dd87d9396921c80445f87c..1c37168c8d0a657d7f93067d9ac95cfbd821f757 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -161,7 +162,6 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -200,41 +200,38 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+		if (GPIO_EDGE_SEL >= 0) {
+			val = readl(port->base + GPIO_EDGE_SEL);
+			if (edge == GPIO_INT_BOTH_EDGES)
+				writel(val | (1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+			else
+				writel(val & ~(1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+		}
 
-	if (GPIO_EDGE_SEL >= 0) {
-		val = readl(port->base + GPIO_EDGE_SEL);
-		if (edge == GPIO_INT_BOTH_EDGES)
-			writel(val | (1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
-		else
-			writel(val & ~(1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
+		if (edge != GPIO_INT_BOTH_EDGES) {
+			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
+			bit = gpio_idx & 0xf;
+			val = readl(reg) & ~(0x3 << (bit << 1));
+			writel(val | (edge << (bit << 1)), reg);
+		}
+
+		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		port->pad_type[gpio_idx] = type;
 	}
 
-	if (edge != GPIO_INT_BOTH_EDGES) {
-		reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-		bit = gpio_idx & 0xf;
-		val = readl(reg) & ~(0x3 << (bit << 1));
-		writel(val | (edge << (bit << 1)), reg);
-	}
-
-	writel(1 << gpio_idx, port->base + GPIO_ISR);
-	port->pad_type[gpio_idx] = type;
-
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
-
 	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -250,12 +247,9 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		goto unlock;
+		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
-
-unlock:
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.48.1

