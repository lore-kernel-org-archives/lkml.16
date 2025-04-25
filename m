Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22F238176
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572121; cv=none; b=K9RDiJumrhT8eAI74eqD++vyXkKt8GSJf2FIEIJxcLQqaMmRBruxVBUB2KYj4VaZL7nD4GxLNhgVqtO128qTdvTGIiTNoLsqqZGarKR/4V2/Dpzrx0MH75G/GbTxpiURamE3T8VSVA1dgAsrIqA6hXKr06A1Vc/Gq72iQ5fB1Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572121; c=relaxed/simple;
	bh=7S2gc7URb0PsBGnyXfc3DFJmPNy7b/D4W8R2OlvjVzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMPW/ntImdK7RHh70BE6PhQnLnRvD9NUcVKKgRUUUwUIe4qCtXwIitM34ebsuLlR5VSlf1wtgSVdQOTvc97SNO2Nza4656HiAS/fqwnMyjfYO5S1AAmbGs1H/k5kaWUxr/NtktZOHxR2w+8XVg7TMy1y981vUa0IDC8rPZ2VFGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bleeBNnS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bleeBNnS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so1766025f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572117; x=1746176917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=;
        b=bleeBNnSBR2zpbd/GXqXLkA8MjBbnecuVfbJsdF7sqfjetP4QKZhGsqPkXLpMYE7RK
         EQELdh7ryuoMcwXvq952f2uGBH6Pb3RU7I8I2fVov2oYzzgdPrTLDzaYWuZ6QvJs4VOJ
         KhOtWvuwTlSBchPMC+mZ383Np88Nz48Rxr6+ocrp313A4wgVUVKcAUj/BCjXHrdwxZ0O
         0ZY66EvksaWLK84MzkXAd0lOu7JqjLvLpHuZpa0Y0XFLFwtXv5maRcxe78NRghdhxmvh
         ffLRPsqIU5gT8PmFG/2DhhrZ+e+OXcKexKt8UMOimlLYqBanrwzvY8CDafVezxCw/zRy
         9XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572117; x=1746176917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=;
        b=i09HVgCcNvPlJettNH/Jeyy3pYZ7jZSNqwycwrEWM0LoXDEjUx4wg7oQxURxdfvb4+
         AaFHa3ZjnQRndzBAV0V7ewDZMXMrFqRj6e9xTGgnBhM7jXqhkCEQrLh7tlgcOUL8pzsr
         MxjRuLKZDXhpUzraHfE5XBQM1PrwPOP6QSHASmZp+8yVLJKiYpB3MH7yhv4aotLM9FBr
         TklcMu2zFIu8GX+MomzItBsL+fPbbLBbEaR73FqfAfboCm/vejNHCNxCL1ezbjra1yJT
         nro0FRYkRwGgojSEbJx67o8fmyQZSp8FNvPUhxGUwC+22HvrR0gZMX2ilJYt0tNjiNPU
         +JvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrr0giCLHi/Yk3ooHhEPyyV/UAVxfC24V1wXGKPEtSrfWb8JSo6wWCWW26IhqzXTwpCtr69DhY7J2y1Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk16j9AhyA7Fv+RRxC1f0xvJBBdXF/osidCeLpiqCD7PnfVBi+
	d1TGK2cnSElVqNO5VUhiBVwoSotcAZQkjgMerrbDBpu110D427FSmRv3UJGmYyrvW3pTrjKlodf
	7iFE=
X-Gm-Gg: ASbGnctEMu+jKRRH15ClmSVn5K+uvwL1Q4yLjutXJQpMpm40jlCwyN4A/IhtQNYrYi7
	62pQwl6Mpl79gk3tZUlw3eciPI5khIapXB9zGe9ZorqJgdEOXWmq4fwUCYtYNDj7UAO1AOyAzqR
	G/kZDKXCxnb0jQ8BgP5BvH0KDl5rDlu3KivBsClc+PDSC9F5vnYnW2A3RdqpE67fERrL51JVNf2
	K7SnfE68wmyKGMdRaxUFbiThLZsdzFfQh6hCLxUPnEVrfApZA8ryavDBA2gGGwvea3pVk9+MZwy
	ok3VIR2R/bFqdaYsESwNRk0PMBb2NaT+9w==
X-Google-Smtp-Source: AGHT+IHCuNyR95UNYI/0izXIj1LRfHaEgDOIQ/KPvSJKLbV9AkvjEqEphDC9iCD0AWLDlHAVDkvOOw==
X-Received: by 2002:a5d:64eb:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3a074e37904mr1224414f8f.27.1745572117165;
        Fri, 25 Apr 2025 02:08:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:29 +0200
Subject: [PATCH 1/3] pinctrl: bcm: nsp-gpio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-1-6b8883d79b66@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N7w6ShEtcDx0natQtD0HEUwZNrRzhk1g4hjaD5jLcAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPQG7Og0taBdL06rmp2Qd0XqgRcsFeRFXYf
 fe9a9gFLc2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 clLhD/9631+iD3Op/0JhcmhzNPwc36GbPSCVaPf9M9MHPdntWvM1bDIAYa23+LE1y7HKaCnoA2C
 vqCHsaNy2PZUwRuPg7M6COErn7z7+BXKuGLRHmQoabLd366zB8+maN2WdoAZfUOjpPEBrDvuv9D
 ckhVkzuRNCuVd0LbqoXhFKtJZngA0GRjBXgbN/bBF0+ewM3B/zFdkBZgizZwaATSNjFzs+8WhKa
 ahubiibF7/JrllxjeyvJHhvwRbk0itwqtmCT5XRLMvTnZZIidHv3EAF1rdpVcD8sLq2+IM1/sj2
 9aBJteBDYzOLrxAN67IU9ZOHHmWhwdoOHR/85ADJeF8eyrhtZdOwcmenqwoF4u7KfSndhhaRauA
 Jl20Z1Jvf97+mOJMMV9T+tcVaWNYe9fuK3HUgZatheNov9YjPrdalfdLhEzcsDlv3vnYJNWgws3
 wr98ZphmsUhsXhTK2PdTDPp4kNJnj1jAo/xxd/8wEubhn6rP/vVKvE2YKjLPbgCnsaO2KYqvMNy
 Ee+3d6aWvp9dq5Q+XNLbrroMe/U22i37w5um5akrVDwUmnwMdJQ6JvVG2ql9sKmBo7zIgjZDv9H
 UeQ8p2ve7Q+VDL8EdifOCZ/+MzdlHrDHQivPB50M7JsPuQA2b2gPsmcyKG9j/rHlO13W7+MKKmZ
 COdKenIJr/yyboA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index a96be8f244e0..b08f8480ddc6 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -310,7 +310,7 @@ static int nsp_gpio_get_direction(struct gpio_chip *gc, unsigned gpio)
 	return !val;
 }
 
-static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int nsp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -320,6 +320,8 @@ static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u set, value:%d\n", gpio, val);
+
+	return 0;
 }
 
 static int nsp_gpio_get(struct gpio_chip *gc, unsigned gpio)
@@ -654,7 +656,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = nsp_gpio_direction_input;
 	gc->direction_output = nsp_gpio_direction_output;
 	gc->get_direction = nsp_gpio_get_direction;
-	gc->set = nsp_gpio_set;
+	gc->set_rv = nsp_gpio_set;
 	gc->get = nsp_gpio_get;
 
 	/* optional GPIO interrupt support */

-- 
2.45.2

