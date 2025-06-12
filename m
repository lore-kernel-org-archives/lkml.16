Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DCE1917ED
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731078; cv=none; b=moPRvIKgB8swuKvgo/a+o0s+7KQtpFturob1vbBYT7q6ZUs0ov1vNJ8kETHpBHnJlhETeu+i2ZLaeQAnoNZakNLgmu/YL5UMUGniT6yYWiUP44HUI9o86z6cdWVqW0dvTLyd3DbMD1wv8H9iNsoBRERqg8t9jk3R/UIC5j0aVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731078; c=relaxed/simple;
	bh=oxRzqs2YTa4QU8cvrEN5AujTnTPtgH8DlIBXKsLdGNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPK6HBFrbDzV/abqLAMQS98yh4s8A9JH3cJN3KcT8rKskOdSdJnIkWbay1C586V2wQUiEU+puPdCrycyIMcU1DG+NRF2UUrs1Ea4Ocb9NWHXRqi3znpEtmC6cKUJ0ZhAMeWCE0VB4VBON3BjFFn0FDIpAklVxu08Z3I1LaUOKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0ub/29ua; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0ub/29ua"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cf214200so7662575e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749731074; x=1750335874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsPtVE+X/kojH8LA55GlPPVVZDmZO3IjemQIFzH3hyc=;
        b=0ub/29uaTgult45I64Oy9MnSpYfQ7sZ8jBz+9bX6G1YTn/fN4n/AgfQsQA4JMa8vyB
         1Qrcqy/Z+qYVQ7Ii0U9XkHadCtjRQXGGbJ4CfZp1v60wSG/AFZ7JzJBusIfhMndPuVxY
         /O/MQUo+xU10q9whyoM7QRid6CSLgsAzUxzn7sVh17jzYKyqZmCuT1faMrpRNiRV7vTm
         MPLme+aA8Pa/8nsYi5ALVbbk0mVoyr+qzmtsDfwf+RrruKP8tP8wtQVGBEzO9cApmflq
         rlMh2n8LYrpTZbSW54AVBsFXWz7Yi96LtDWJjcYAjgZiJEUJbVX873m0CqjmQ4qQWO2/
         lnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731074; x=1750335874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsPtVE+X/kojH8LA55GlPPVVZDmZO3IjemQIFzH3hyc=;
        b=fHYWjpjRunjk7xd3kI/YbkPai09iVgLLwsA9oYLUIiLnbt9IxCB+9p2uDFDPrgQ5jj
         z00gJDbjsQkT/BaVntdF0FKC2296lAijdH73WcXtTZ5LM1l4Q+wa6gOlGcqEVVoSLT8w
         CAb1ly0qDH6yGy7I3wMLRuXQCqE/u515KE/60lkHpXqkKmmEA943HfBSelhSV4Blw77D
         Jro8JoSfpAGibvVSCzWvYfFuZC3SNVlo+NVMTkA0g6FJ/lAqrsget6oYPPd6516/ShVI
         L/y2boB9dINkucqXaOCgn9yAdIK2IQyf44SBV6mNp26plFjyKWE31qPnL9U5lZP7WnmV
         0Gjw==
X-Forwarded-Encrypted: i=1; AJvYcCV+MyZnjJhXPM/AAjtDlbSif9IRx2S5l7CrLwAPa9Eg1nAte4BRSHOCbMXltOrOSCMt1iMejq+byWIzfvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzciQ0pSgLdr8LTfL46y4TH1VtGf2tDGaGbCqp/ri4pBoJii1Dp
	JuoHJJDPu8ylrUDT4sBnpnSAjCyRPbLbnmohvynfSYQf/zsRMJoReqZdGftw5lMf3QHeAxyQ1wF
	XwlrJy3c=
X-Gm-Gg: ASbGncs0ff4g3LpM8D4499RAsRt7hhZaKuhYa4VDsRRVuW/gQejEgx8mL5m1QnganT+
	MENac41hO4SMvths0wTjje+fDuljBqjtRgMjyojdH/qgHKZ8x6L3mzc/0Zf3KQYIiNLjlDpcDka
	L56V3SwktGo949fgxSmP+0xKeJejR3LcqsIx81ooMGQo+HfpBP0T+ZGVKZryM0l+CD17pudnyT6
	WXTklbhkgj/vNJfI2eWD5ps5UF4BZ0BkC91D0YToVmKGTuBbXFUcyVaTLZUTcf7KZfBbNfayzh/
	3+jsTu8Fp2JPk7L3XNgY2/R3PURjIGXJSb2TX3Jf0CLlN5w6Yg5csCFIXAmao9RjTDA=
X-Google-Smtp-Source: AGHT+IELEBuYFvjSI+eQRlGP4k5z4CcnvHKWjQPTTuZBQaJR5a78aOR3/sjZ6wsqR6rFzopUsc30Cw==
X-Received: by 2002:a05:600c:c490:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-4532b95220amr31206475e9.21.1749731073956;
        Thu, 12 Jun 2025 05:24:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e176d30sm19140765e9.37.2025.06.12.05.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:24:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:24:31 +0200
Subject: [PATCH 2/2] pinctrl: starfive: jh7110: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-2-8507b46516f5@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mdl+gtoGhzIYFpSeGYTAYQw4bN0QjBohuaNL1t5cz2c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsb/WyTl63agq6SLZpf7V4sKigXrebGJy5sDb
 4pzCpbs0p6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErG/wAKCRARpy6gFHHX
 co0CD/9tyorBW1FKapOqLnh9viYQjjNwIoJXpsHap/ajESks2BLspOMf0DhYcUUodr1gIdWNH4/
 J6p7iIYUofAVSspEbgeIjNMLPGGsakP0wNSWsUgmSY1gGvNpOGNtNaMS4+1pOgJsYW6xK8nstgT
 Mkyn766B1HmaC4Y6cLRqFfpfeWFJHqcH3uwk50ULgOswcBzq3jdNqm0UttXoC6gAy9b8bt8Mi+3
 P0f5dhP425maZB5pHLe3Vy0+rioPYzFU4OTO8zAX/CzugrYhhGwVCpFZkzejKevzGzUfK00rkkB
 rUQRrXMXMvw5rXEYBiup7fmKbeldHHXpxDdvmOXisJ0yTBFF67BJ3gmTGDgQXsAkz9tBbRf9dCr
 DiK6uhYvi0Syx5hW/eSKOndkH9vmU8iqCQP/zf+bnE2XcvnqyVXZQU0hDUY2whnTRmlae2Iufgj
 xeTk7CLd2Fk6dOZ0kV54zuhBceZQ52xjxVhyE8w7icQcKH2A4oF2uoT6dNl30RIl8MfhrsiF5iK
 FTz4Bef31S+pbhBuM6SreYQ9bHJFF9+H3sjSFRDblBYBKtQpikSD7fhr/HoL+KKZniPgnx9+jSP
 S1Pbz0xnu8x71r5mNLrZyJcIIMw3ilVxZwRad6990laM2Z7OGxrkEt9ZgowxSbXkvplI+FQAZPu
 11lpVwJdeWa2k5w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 1d0d6c224c104e7e970d5e31e52b2fe3b19e2cad..082bb1c6cea9b29257b197f065c1a9deebc997fd 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -608,8 +608,7 @@ static int jh7110_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(readl_relaxed(reg) & BIT(gpio % 32));
 }
 
-static void jh7110_gpio_set(struct gpio_chip *gc,
-			    unsigned int gpio, int value)
+static int jh7110_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct jh7110_pinctrl *sfp = container_of(gc,
 			struct jh7110_pinctrl, gc);
@@ -625,6 +624,8 @@ static void jh7110_gpio_set(struct gpio_chip *gc,
 	dout |= readl_relaxed(reg_dout) & ~mask;
 	writel_relaxed(dout, reg_dout);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return 0;
 }
 
 static int jh7110_gpio_set_config(struct gpio_chip *gc,
@@ -934,7 +935,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 	sfp->gc.direction_input = jh7110_gpio_direction_input;
 	sfp->gc.direction_output = jh7110_gpio_direction_output;
 	sfp->gc.get = jh7110_gpio_get;
-	sfp->gc.set = jh7110_gpio_set;
+	sfp->gc.set_rv = jh7110_gpio_set;
 	sfp->gc.set_config = jh7110_gpio_set_config;
 	sfp->gc.add_pin_ranges = jh7110_gpio_add_pin_ranges;
 	sfp->gc.base = info->gc_base;

-- 
2.48.1

