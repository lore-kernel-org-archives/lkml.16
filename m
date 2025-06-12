Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B8224B07
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719700; cv=none; b=EVXl/d/gyJSg1yWMlfsX8MV/9HT/VbHdKvPu+kIMsDYQtDA1TQtWhz0LiHmPLXHGwWWw9xLH7BlG6xQUmxcSV88GoDvBNT/JUKTVbQtMFVACACIHbrm0YdZe9bbq1skrgQUfNXkG8adb8zHS034UzOab/xDair7O2QPdC2zlKms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719700; c=relaxed/simple;
	bh=I8WC8VmyVZpOBN9ahF6WdBk7M+DI/Cl/vSHnInFjNoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5lHz8233bE95JbyZeNzpQpSwRyA1qhEVmC76bWwGJ0xk4KzygRtHtskzzPMzs1sI9CyAnjmBvBODj1Y42IW0p3P8oYyQKNd+3pXOIn6iyEal4odvbB8HsPTR9k/0BnFBHVZiURmfofM9o/7UVj33Vpo34e02QVxaorpLDbMM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xdvK4nuD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xdvK4nuD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d54214adso5563635e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749719697; x=1750324497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjpbexB8EDGUAbjJEhoZpzc1eJdrhJw0+iAd+J3JqeU=;
        b=xdvK4nuDnWLLxKiBvp4lZV7pLRLNLsIR4Iy9zAkBSLVjdxaRHV6XHVmYmxVeIA/lPt
         mQonUxdpPQlNJy00hQ7wTSXy8nrTxakP1dW8K41kHUOMs6q88AMybfskNCwTA3yvqQ0o
         fOMCMR9Q3idoYXS1DycOWqMSq/EL/xlvQ0rYewMkIGusuWFbs5Msj4vHdv7VCjuHHd8t
         8AWpzZXsjM/uIMoPL9uymT+lFbFxzrkAF3QqJ4aYrnZAfbI+OowZNySJev4C20ZPmfiT
         uHSyIAFRlrBcn9cv5Egfr6R6MQRXoNJrk+B6QuWPUKu28E2c9MWcRQYjiaOgNaGQS2el
         lb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719697; x=1750324497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjpbexB8EDGUAbjJEhoZpzc1eJdrhJw0+iAd+J3JqeU=;
        b=vNrBXPZxTJV6ddEgQ4jAwXK9utYDPFYRx3i8M+2VgB7MIdm8IlFHDCPJslik/2I7cd
         YCHhNjx8Ue/dy2+/a+wHitHKyOf1Id6T19aO3b4nesveOvi+doj871AsDOuE4Ax3eYc+
         VJ/YE8DVSTndH0t9UeNjPSgDBIUMdA4KU0ZGU0oiWPI1GlElGZKVFoziXeLzEfV3b65X
         NnWvzO/YQLngGJEe8v5jo+M0QqBMQgjmg+3k/UAl/tmuQVWgmxP9OmE+mfRqpYrXB6Tw
         venFyzVe8+wevvRwOdY09moVpSyoH7OEBk/B9NK0XcNd9ySJ4vcqRsVKSaUpngAjuzqm
         SGJg==
X-Forwarded-Encrypted: i=1; AJvYcCW2NAlZUliPr0T5DIfUJNvoxOqPfi8ENetEJLlD8PNA02yesLxDp2cL4NDJvlWeNTGUDDecZwGk1oiu3HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbBptJ7iXDvhUxLSHIFr7rNlzro8/8sq2/VwQU7Upv4sXaqA+
	KCBD3Uc0FAuTAyhxg482QVuwyIe7S4re7kNAst4TMAcyan3dqP5BnR+v4eN2RLvLDSs=
X-Gm-Gg: ASbGncsl1GlaB7BaFS+RFxCzO2D9IwjIFgrS4CYqz41hebSXpmCDGokGugsKH8Eh1w3
	TQq4PYx7VPaZf9gsxK67rjA+pxvEhoeVN0QzfLA8E7Ma1dTnrmVp11MNDiru6CDRt9Lkbqibzmi
	SxY3wB60OMH3s7uSydvZIjFowA7z248PAU1uw3UkMzVx1gAztpCV7tKGDwuFo/AqPwSnXvcgEjZ
	92Rc8LGZHNgq6/9jC9WPq4juQdBINfZuBuXnd12L8Z94zRhHVo1T20Q83DyTlSsVaUlFVCr4pu7
	2WjHZXrtG5xNpCf86xGAHlN9j2UJ2qV7rA55EHErRjuhwTQcu/Sh22HDU1G7Iqo=
X-Google-Smtp-Source: AGHT+IEj7fJZOfU+EAHw6kzDkmORmQcdeioJZFJUMmFWmfkS5xsy0lkDbMfqprMQGHqbWZtbCMvaDw==
X-Received: by 2002:a05:600c:638f:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-4532486b850mr62066355e9.4.1749719696749;
        Thu, 12 Jun 2025 02:14:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25ec9fsm13940585e9.34.2025.06.12.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:14:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: msm: mark certain pins as invalid for interrupts
Date: Thu, 12 Jun 2025 11:14:48 +0200
Message-ID: <20250612091448.41546-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

On some platforms, the UFS-reset pin has no interrupt logic in TLMM but
is nevertheless registered as a GPIO in the kernel. This enables the
user-space to trigger a BUG() in the pinctrl-msm driver by running, for
example: `gpiomon -c 0 113` on RB2.

The exact culprit is requesting pins whose intr_detection_width setting
is not 1 or 2 for interrupts. This hits a BUG() in
msm_gpio_irq_set_type(). Potentially crashing the kernel due to an
invalid request from user-space is not optimal, so let's go through the
pins and mark those that would fail the check as invalid for the irq chip
as we should not even register them as available irqs.

This function can be extended if we determine that there are more
corner-cases like this.

Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- expand the commit message, describing the underlying code issue in
  detail
- added a newline for better readability

 drivers/pinctrl/qcom/pinctrl-msm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f012ea88aa22c..1ff84e8c176d4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1038,6 +1038,25 @@ static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
 	       test_bit(d->hwirq, pctrl->skip_wake_irqs);
 }
 
+static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
+					 unsigned long *valid_mask,
+					 unsigned int ngpios)
+{
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_pingroup *g;
+	int i;
+
+	bitmap_fill(valid_mask, ngpios);
+
+	for (i = 0; i < ngpios; i++) {
+		g = &pctrl->soc->groups[i];
+
+		if (g->intr_detection_width != 1 &&
+		    g->intr_detection_width != 2)
+			clear_bit(i, valid_mask);
+	}
+}
+
 static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -1441,6 +1460,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
+	girq->init_valid_mask = msm_gpio_irq_init_valid_mask;
 
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
-- 
2.48.1

