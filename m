Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303AD2C15A1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771669; cv=none; b=P5so89NJDl1IilJLOgMeDcbX4PJrxvQDRGMz5aldniI3LQy36NsqcSeRozS5Hi6Z3GW1946uD/DfzVeyBoqYSa3VKCRYU+WBmmMo2L9Qyw8BsnZM0JdjadzVJAXBZ7MR9wnszg52vGJx0xqIGQacxng15dvOn7AB+MSczLHo1Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771669; c=relaxed/simple;
	bh=HmodalnC2cc37/f99i9xU93F6NQ40xsebYW/vO/TJkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPkJ1QFVd5fGeZYKPx27lnD/R0Upm33de25LR0AV9JwMfBK/2/JM7V/mdQ7iVym+FrH4zPMyA60pyto+kOUFpvyVDZv8i+9t1bhWWQTDk0rCOy9ef7HlP1CFPbFDRu1x306zsLG8T18udhNlIckG8cQHDYUXVgK5EJPf8WgqwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=incjsScR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="incjsScR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a52874d593so5206787f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771665; x=1751376465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=incjsScR1E1YPAV4yz5BTpm8UajXhlY7PDjQh7558H3+bEQ4CICarIJfxUPEf+Uu+r
         W8RFKBhxWXw0BusA2BGzrabfd6PBn7dnGoZ1NamZwYE4TYrd6hebTPGD4KqXCkyVxmoF
         Y94uhV/veFYx4ZXug7d02zc3SgQo7KBvHVD80rphe3viYmPhh4JeELrLesjx2WR7JBlz
         D0qVo2e8LfWtUBjAU7pRbiuZS8VR1vQtmSts7GPzBiPWOx3zUy1L5RPlIOCS7cc1wfWH
         8k7ut3sbVUqUpfMxcBd0SeWfyIP31A/KDc2IgxqvXH8pzAzg3b/lzpiM2SsniPvOxazo
         uSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771665; x=1751376465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=ZrDATkXLtz30iE/IbfSgClytRoVuKRw/9YGCQhBFJA1o4f0GRbeazEzjWg1HR9uh0K
         oDqES3jK3EvrzdLHN0jUOgiS790A/OjeZAvcAS0JUXoeoPYsLubaS4ZTRjU5FovVF8e3
         nCq+qCRnAXURK+h2W5/IPG22J0c9W0eg9GIXdLZ1pdIvYS6coIf4+sOVIYm1PFFSeV5u
         UD6yvWXN8NlsrYyr/kEo446yMkWao5PXjzrs0HJ7HJiy1Jb1223ycDu/5f6IRcPWW4mL
         l/SVL+qZUQZlFPb6PMCIIJNlTJ82gk1Hk7OWgmaXQntojpqEQYghCr77gRyQSvfNHiG2
         oYKw==
X-Gm-Message-State: AOJu0YzT7eWUc8AheMQ1JvJ/tX3T5FLH6qoCohx02Uw2MHwfj/kdfn8j
	ioC4tGAru/DO2Q28gB2GKhZ/A59LNLzS+Sx6gHaaemX2YzLkALmWQ9IGyUvwa+XZ/oA=
X-Gm-Gg: ASbGncu3CxtHIxlDnaU5XcatIjFqVTw6TImD9DMWrnGwjt+s1h5KcNHNdzeF/9sB4/P
	WXo3BvsmPCHRkkQM7+ujE5w6WeV5fVr7vTalGDLJd46sfiLcEtjgkoVAQXHLtroQ0cZPHuLcd64
	E1O/xTTNevsR9SIvLRj+GxPPAVJnq3Uk6iX8tD2VdSlJ7Iw5unGWwcRomwSNsbn+qgH8qirD0BX
	N6lFCJi5WkvWq2HHpW/wTlVGCZcJu3nDjM2b8iNVkxUq50/zYcBGfY5msBiAhpIVwBeNe3dd5vg
	krrcLj6lz5sqz4y/M/o/6V7Mv7MOC2i68BSbMeQuvVoVMdAWXzJgKLo=
X-Google-Smtp-Source: AGHT+IG5KWF0KCkThs6nJ6gal57FkJx7NIEiZyyWqT8Kac/vBWN9gXYyILceeK2lSrSaeIISymjmOg==
X-Received: by 2002:a05:6000:2709:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a6d130710emr9619060f8f.31.1750771665372;
        Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:34 +0200
Subject: [PATCH 2/8] gpio: mxc: use lock guards for the generic GPIO chip
 lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-2-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L9QElStGogw0fz3XtB/b3BDhicIIjajUB8CqB/jaGV4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMkiIjVTe0tH1WLgnWonfVy8AhQhRKYcJ31
 wTEBATW7SCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cldLD/40hHr9EmEoxhdje0Mr2R2lm8PEsqdf2M4DnyDRT6tAwlnsdqL9jxCd9LnltXjUv8YaQVZ
 XIrsv3kkjxA4P3TYFdyjv+So7dj53stDO4C5FpFtRRdZ3JObzEBRw8oROkRXVpWhupxOgEp3AiZ
 cEf2ROA83kJYU92OvfD6hVf0XmbiHxj8BBKBT6ad/d3S2PFKeR04f3Tafzx78NlSjT4nnpfQGCV
 cqMA/sOeaghF3Y6O0rgEk2gBZxicTADRpyAVp1kaWdFt+w91EcKCFgdREm8N2hAqKoEbuTlgaiN
 1TVhOv9ZDQoF1sssO0rRuAtXymrdk946TUI6VxZ/YKub3fyB3Ve24n927i/pMf6ON3HOXPElNUg
 QdKP8i9nZce8YeDffxblqGqU13hpLoxrBl9JT+XqzYJ5cFUx8ykf0eDd5UHHCmrNbJS6nBgswZG
 PQAdXxTFkOUkda25LTKJpq5zT+u34gTyBUGG+CyxGiy/nwF0H/ZfVnlisyJvfA+GhNe7zpYOlrU
 ptM+8UVlNhzz4mNdJK3vUAVa2Bfg2P5I3Y2HYKOyNgVrMtwoBm5Z/xrkkbOCUWl1VmjYp8AtnAB
 IBck4wL8fYgyCFaqfuhau5035FFG0WZ9xSwqAZQHFZV65uPj/pUKu1wWuklwJcboLvAsMUKMJ3B
 Cdq+ee1OlBEp3nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock.

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

