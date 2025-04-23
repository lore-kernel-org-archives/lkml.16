Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B437267709
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392524; cv=none; b=ZTX0Fd0QEoKEgLPlDAJvRhrvyJaQn1ioVvFkswQyWOlxRLPPvQzKnLn1uC+pq/VUPIslQB25Hnn1s+V+7HkZWqsXG2g+49633tvpBkG5XvwM/BiTIbFEgPFms6HukSIPYVop9cjov4UOwbjugfrsSoRZlNPQAW+Nn+nFXfh83PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392524; c=relaxed/simple;
	bh=580JJg8Ww3ZiyIW4O3yV2fBLgEg8aiONXpvmsEP9WsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjyjorKydCjUy7tBGFPHk5srrYWfmqmwgQ8CbAGx1sPe8bql1ov06kiyDYAY8pwguQwhUvtbjOPm4RSPXam3KbWJRKCZa89hwqa6cFHHsO6ia7qslWCsXLRlUDevlA1iX7m+k8UeQwqoCLeMHtYSKlfsOCxqf/v1nKeYfMh7uvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jxNoPTEn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jxNoPTEn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso28371615e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392520; x=1745997320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=jxNoPTEnq/+0Tcaixz3OevV5NG8vqTM9uQvGcOsjPSrn2mrGiOo/D+JGRWVdRjP/Mm
         KENxEqxLdWgJ6aYajFmmljwqpp6LK7NndDyKwvAjmqviJ7BiwpOXmP8L3b80VKWlXfgK
         gGhcDL0IsHnLn7gSZzCPAs1T5FE4s/Ke6GMH1ATbXV+mxxaNtEvMMoWNo3fT28+J07K0
         Iuv1rGIzDPu7Mlb574+KAMhD5kOmxfmldnf6MoUjhYhWJkPb4mn+B8Ju7xBGuRuyvwdJ
         5uWGPj7+wruYp8WDR4Vjjyv9VxguYtxOrhjwmR38PZKdJX1UAS/mdwvqfKd3bAtb1rQS
         6yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392520; x=1745997320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2qxZ5SNufiuhH2/QCBic5ml0Ty+5BazjFOvOXbBOTw=;
        b=GO/EejKq5vwuplCPx9XnR+vUzBxAcOu2+nj17cHWD/j07C58mFBISxhI2zw/When8k
         JbF3ARjSoK7fHuHnkph6lQ3krQW0iFbWrM6p+/asbOnGVn3HtnY3CWiynpYcvqucWu+u
         kUbC0OeexcUsIjGx0+uWuf1BxdV06ViImOKImMZqiHteN8zKkObCYRbPAiXQLXbuZGrD
         BYjS7L6tqizFZmD7uEskv6R4bEmE8jsnuuIk3AH0+M9SkRODGFdjP/Px0TABUlKta4aA
         5BPfNzqmDsG03uRkuk2rMOtJM/qeSz2qTE8Pp9J02uLpzl2hLOZtDmSuYQSyVZQGsk3l
         QnbA==
X-Forwarded-Encrypted: i=1; AJvYcCV7/msEtRUPFNQkx0pdUtgROx6BvvHaAVtCtLxmTEvFCoTLSpy9KYTFJsvcVzvXktr8YFn9Qh2rQha91U0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/IecNK79ZEmKJP4UWloRRzq/T+TJnILva7EO6+cyhqLrJpgq
	mKbFDUcuFQtjLRPlYneuLIrSfGQLDrRQtha3GWYsxM/SBucnEse/zThiVwcT8no=
X-Gm-Gg: ASbGnctLk3NUgadp9kFGU6XsGtWGvwlBIFrEKh71eLAmCeZPaSsrlDhWL0j/7Q00Urk
	5bDg6bNWDk91gXi8cZRTL6oxiwfo3Z24WaVjxzzeRYcGzeoetWFX5ahCKFhsjq1PXaeMRDvUUFe
	1jXEUm2cIxTpPizAmnak2397pBDwzKuDRl2UMedKhVlZd674NtcbHOq9jRn/Ix+PNIW1llxF28l
	1mFCy7e9dwaeUBtXPU1Iom6gRtb0NSPMDx6undbtle+GeAm4d5UNztZIClhABlEzawG8KQktQsv
	HoHbiUh4zYWzCYJo+K+/We0DfoJaxNcXWQ==
X-Google-Smtp-Source: AGHT+IGX9aP5FGs6mIYBjE2Fy/Cf3MYPL+aEO76HfSyqqWsd5X9AWMYdMfxaiJI4eGNh/jiqHeIceA==
X-Received: by 2002:a05:600c:4fcf:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4406abb245cmr171540525e9.15.1745392520323;
        Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:06 +0200
Subject: [PATCH 04/12] gpio: imx-scu: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-4-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FRmNocCMgDCqyKK3swLP6cODkyyIC7OT79L9GAY0bjI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB/Ov6sr/uWpQe44AZ9kTd5SkCbX39gaQdU
 ccSZyRED5+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 cggXEADC9I9dAp8L1/RZQY0dK85ZOpEVf6XAJMrSnBsXrkLU6zw7OZw5gZkWmuoJf4VcHq/ObGx
 OOhgSlr0WVXDo6p+71iJY1PXUy7IXdkfl3o8/f7H3TRHoczV9Tlc72JuZl/EJopVg3cpI5xRoPS
 zq7H8TZvPbwH49XwIanfFJCXAORxh8P8YSWVm1rn/oqrMUM35wIXkPe5Mvqq8DWJYWbmHgh5z3L
 /tq3HhHxfZGOGDZRbGsT1shgiAcVugWAKTafplG8JXQ93NdJjlrlM4Lno+p0DWjUd9JLjleYD+r
 ZochpLmjlXyaxqH1xATLYR4ZZDAMuji1wbopYnOvFT7HxoAqnRxFkPTSvkBS39wNw8TwsG5XuOO
 5TlTkSEfB4W3GyMmWqhv4AvCnIyll2p7V0/2Vkq8OfR2fHJEpKwZfwsWdfBeCFK6BsLwiTZge23
 bDWGLZfvXivk+h26DY325XhI+4ZtK/PJaabjA/YAF40tVztEJgXYxNx/7SGj6vFpKTj9MS1hlFz
 NkdXl9BY3YDy32+JDNv7DYgBWB0L7/hVA1cEX9nz8gQDN3Nq0+toSuigcaC02VYkZgp/cCKC4ZH
 bgMWCHgNflrBiDi5V/EsYMZBTaQQiiaoYLijx72aN++D6tnudp9Y0o/dqxjScLYfu8xNbjfcupu
 LRcbpKCJb1Q4l3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index cf98b948f804..1693dbf1b777 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -52,7 +52,8 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return level;
 }
 
-static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
@@ -65,6 +66,8 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);
+
+	return err;
 }
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -99,7 +102,7 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = ARRAY_SIZE(scu_rsrc_arr);
 	gc->label = dev_name(dev);
 	gc->get = imx_scu_gpio_get;
-	gc->set = imx_scu_gpio_set;
+	gc->set_rv = imx_scu_gpio_set;
 	gc->get_direction = imx_scu_gpio_get_direction;
 
 	platform_set_drvdata(pdev, priv);

-- 
2.45.2

