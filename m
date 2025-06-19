Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A47278E7C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322019; cv=none; b=Gxw7VXJKPxwJcB4s/lD/AMqpgft4YBiTlRXhc2gjbohRsy877PGPgeNK1nbm5seoSqcNVZXPIssewp5mJScxkl3VVlOS0/ewXuzqwCf3VwILuee7s1tNFOhe+8uHP7WOBVZ4TFU9yqeGTJiKSe4eRjDyQTg0ToHbePLR5k/7kjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322019; c=relaxed/simple;
	bh=COE46zuDiGK6rLwTnt7+1d3gjUwt5RswqdYUD5pUbdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4iB9LToems8k+UG36K+y+2JCP8ct1YI/YCdXfRQqGjLjsoNrPqHL5JnUX4ShHaVmA07uDbBlP0H5Qwk5KAP9yuJ+sTwqQ8rfyBO+YyEXBrz87rlhTQTqBcpWlZynkMgXLBmbBKMJkXte0gVX2NCjbTBEPPlDXDB8gmrWmoy34Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M/UztOJ8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M/UztOJ8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so5995335e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322016; x=1750926816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=M/UztOJ8RfBge7iEfPQGJ1+ml8t12dHjQzlaINUJ1l248wTJTAiS4W+gxFaoVNo5MD
         Q/+NjapzaK0R9uZKL1djiGJHsIiH2yMsxd+iqla/gslt5GOsTrN1sMliraR4dBhjv36T
         REkdH0wWQverMicS7p+anjliA32jQqZwt84Y1xOpIxA4V5wLn1Qniu6gKzE7R7qxOPRE
         srRU+o72s/EBM5O4NC2JeG6V7KvkEUgtK50+zv0q+K8/x+0mNiebLfBL26yYuEj/k81+
         4RghNVE3pxGFN1pgOtelXTVlEvkeYq0G+yWmUC2dtD8aCm9WhCdaSEYuRgWxqI/HGSqr
         4wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322016; x=1750926816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUxEFCxSV+En4LdALjtxQKt1K3KufAQa0J+EdQHN8Wk=;
        b=AZIuhyday6UMIGPyYQ575SdmZGqlTJU3j5D9PB0iX4IpVT6zlvBtHAZc/NyK3qUZUG
         sBXHX0Omqx5PgOKg4ODczOOD03zJU9n63AP11U5cIGxNPiOEWy03oDcgPj8No9SuBlz/
         MGUR4Hh8D5u9+91pOHgF29ngNu2UKX/+xdmvyF2+qfeCSYjlosUSvMNlAk8/eurqy/34
         McGWBdnDXzoqb7ac3mfEeuT3tPWTnDl9UOKFFHhoVHUQFY3nyBRLKCqtJucppTvaS4iU
         1gb17gncte45uS8y4G8gK3seTW8xtx2OANsq76a8G9ElkIMOqOhL0vGdkB+Zja46injL
         C0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFgPukaHbIyyyxi4SxkU8haUra2g4Xyri2BfF2cvra9HHPG48jTDh4EC9lXUyolJJxHE1/lZNc2mCh+OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMasLxnTBEmdcPE8e9VmGYgXZR1BxpsRwo6HmW2hiGnay86Zv
	+48RGFRbLsZ0yZXrtT+2zeAcL7MNFQZ8JO5oMlnVv00A3LtJ2uPUIpdMyyzDCy3r2jo=
X-Gm-Gg: ASbGncuYBowIhfu1QBoC7jSspP9OpJ/cDpa8NsUd8RUq5HeYiXjYsvIDCenzJFKUnl6
	fB62d6bzJwyMFzja3qp29CitBN864Ff5YaeULg/DAA9rrKgt/xBNK8L+q012gTQcH0GHmjHw4mr
	ePR8HkFQuWlu2cGW1IUnLvgnC6IsAAoOfXErqTDR7Xg/FDE9kFwrSkp85oNrko9wZUEX+R1LuNh
	YzTpgMeDqNShns84yohCaCQ5QP1SrSOQ6G+zK4CGJRtPb1zr8Q5YOTy3lx1EgBt/QuuMM7NTkqS
	j9ulAM0qehF3yJGFFT8p9XF+h8y8ju6EYLk+5UPVqKYNqcIQUXuvt+Gi5Yc+82qd7zI=
X-Google-Smtp-Source: AGHT+IFfsPhVrHgeuWzX3+6sQmR19Vl1yy5xDC5faeBVZQvTDHkV39fKCws88JWALuInD7mjUF9AVg==
X-Received: by 2002:a05:6000:4803:b0:3a5:3062:793a with SMTP id ffacd0b85a97d-3a572e79d41mr16470567f8f.33.1750322016552;
        Thu, 19 Jun 2025 01:33:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:23 +0200
Subject: [PATCH v2 10/12] gpio: rockchip: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bJZscimERewZNLI5pGqQIjH00bD6YcA1Kc9nHnuKKr4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tTDKdHYa2tugbl7ZgbX8M1+hP8adwm5KKEh
 MqhI//NcwuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cuAAEACjn7R+KR5/zt3QNdbTEUEkbL3xT1JlWMeyK1RMVSZHp3CYFxhOFf6/8w/Xq04lnJRQ2M/
 lvWSlbFLft/9IseHT/Ism4eMG7xKvNSHWLB3vEONd12JYS9fWNcn47eL61YBQUF1R3LknWWtW/x
 UHnsEEr1iYZB36AYooj0M4Z7raU6Xt8srnztoZ3xhNkaY+Pa+p9KHAhj/8kN/ipuyAphKXdk0r2
 knA1yAb59U2dR1V9Ru5eiUOenbf9shLNvwnW8Wkjl5uOpxFD2lt0mWpFGYVvfoyGaeMw4e/hERJ
 2dNPhzDGhylpw/va5zlOzxFjqzttvo9MzKX/Tvp5HrAsCreSibdjUR28e1VD+CqzNjDsmCpyqTT
 Czq3I7mLvtqc5cDZVsVoYve7pbUWNqsQSxKxo+cztDof+wRRCRb5IbAzrN2BBXg6S74kWSSImTZ
 DOjr+HHnDnLcca18BTWMAYdEXtFdeuvOqMTujZd3kUXVq1qZEOAClLVXpmVgxxDTNkaJ/cFC5jl
 IE3Nhh/5s2pbySabu6Q76yGyMgclCRvVhOsgKIPaeieT2bt/NtlP/vHLqXkK+ouSR/aeYlsX8jq
 5ohEONkE86sx7b0n6GxTh0XkaRULQDsItKSIkMa0QjnJLrB0EGYdtLnfz+ozQ/yxhndBWKEYMww
 QpzQm1rT3j0ULzw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rockchip.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 64700a003f9a17947dd38baea23a066e8c057caf..ecd60ff9e1dd1a090bfad204c8b86c4d7fb68ce7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -177,8 +177,8 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			      int value)
+static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -186,6 +186,8 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	return 0;
 }
 
 static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -325,7 +327,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static const struct gpio_chip rockchip_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = rockchip_gpio_set,
+	.set_rv = rockchip_gpio_set,
 	.get = rockchip_gpio_get,
 	.get_direction	= rockchip_gpio_get_direction,
 	.direction_input = rockchip_gpio_direction_input,

-- 
2.48.1

