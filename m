Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E42E7F37
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163098; cv=none; b=mINEKcaNb43bVQF0vVWTOK3CQ2UxCroKy2PnCKSWMnh7/9+9loLZge/sFMM1QGuhbcmZAGvedin4wJBjFDHufUTjvczl+KP7wpVnRN3Cmiamcy5g8Zyd71JWrgeR68VOg3GqBSxV4AmGkXXgEAuWafn9RohGcY0CRXyAu6eJuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163098; c=relaxed/simple;
	bh=eEv9Rs9Ob2RKbLYMX17232517BahJV9MYVei3h7Ywh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jB03LJ5ff1UEkNYIgdZZImJzGx+BsqzL/P5FKGQ/fvZ4lzR/CQ/Nmyx8tjA3wi9ntmdGoEfilrbftgQuiMviyWEXtadNumk3VGR/u0gezV6228iMQbdPHmgVdbST6oFd4DF3H4ZSBGo73nrCT3EUFRh2AwjNSiuzTkKgyW193N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CDmMpoXb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CDmMpoXb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442fda876a6so49884445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163095; x=1750767895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=CDmMpoXbxEegq7QPOKmmcINarHvc8jcxc8YT36fh+03SQl/OO2MqlQxwX0XtggyF3e
         D+1aucq85xUt/desvwkZWRXMQAeUzCSCS+Lu/TKJSNhdPncgAS1VzJICKbzh9/vWc3Jb
         45GKfuuyjpJ4U0nzaC0kXGpYfMmEQFUXroSnZ13eJ7gbvPG7XkpQ7DWe8Wl338FQ2Vm3
         GHpudH1ktgXvvOaKhYjFi0uPRnTnO2bkJmkCYmkfcjDlnbWmGjCbCiLXSxXLABW2LJlF
         xl82wTqB8w46R8oMJwG3ZT8icTnMy4IveJokuwyiu5i5PXxrJZUNITmtZM+ZaYlt0RP+
         558Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163095; x=1750767895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=MDajhPRrJXW6Nfvf5LwQ05RbbuZGMRlb/3a7ewByzQCN53QuEo0BaITVx0Vxn5lO/m
         7swqUAiQJVw4h3KIvAp8/AIpJJcpfUM1aGGY6Ki3Qk1MacSP53wCcGXiIqqVBqFa8Jwb
         Dka8JJdXP46HClTc8vEKWuDo4/A1X9R+jKt4MI6ZTq6HakuOkTgzHPTataqDEUBOc/oH
         acKgxpdZO4Hq3OvM0bWUb6Dc1WrGKRYs4iIZgyv5j2Q/6T6v6Y57V8qbLYkcbLa1NK2k
         bxDCmzQJT9rn2R6am+pmR+DP4LeASIvg7IA0GM1NKQ1eGPVIBpoLX588L7MgiZJZb5An
         jYEA==
X-Forwarded-Encrypted: i=1; AJvYcCWFu9MehS4eoaw72VIiL9lJFh/QyJXipMad6NYhJR4yBayE2HN38UIQGWG09r5aMRgm/ahHzg32i2DfA8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVMd+bVjYoV/hFPC2Na9jV4ki7dh52NXa5Z3b2TPf8n1zE5H1
	TTHaDeih18vzGpUoNa6ooRKowFflYdz9uO/LAmagBl15E2m5Wft7CywshMdTs2qyRThYyMeuINz
	oKT0MWIM=
X-Gm-Gg: ASbGncuSFydqLfbl/erEyNy6g0vOX7G0EhJaHiBRrtWDY7Trd5/AD6RCFseL/9zPvVO
	lwBIyCdXUL4N4I40IVJX91YS2PKND0LSJ475rk8jYOCInLht/lEm0p0q8foQxuttgf9gyHkRxIo
	ENzzpgiXAr0X6dexfAB8FDF25smbwExQWM6H8rlSigJeRLcC0EJWYdbQZErQ7HgT0kwD7fyDONv
	I5bD2Qfu1XH3JlVmxIQ7pOJg6hgEUeFSBHK+ynap2mt9/d9uhcHBo80mllBD+c+w0jH+7P86WS1
	KMsN3ZFKhODT+JdnTsIj5qfCPWyiIr1FPiqksqTjaDoCYm2J7eMcpZTr
X-Google-Smtp-Source: AGHT+IFsTWQIKZSJGIY/CXmS6lZIJ3ZenpODtlq8yK7uNveBH+mmtvLiQ+k6AgHQE4CwrhnHTwO8nw==
X-Received: by 2002:a05:6000:2382:b0:3a5:3bdd:6cfe with SMTP id ffacd0b85a97d-3a57237e161mr12452604f8f.26.1750163094424;
        Tue, 17 Jun 2025 05:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:34 +0200
Subject: [PATCH 12/12] gpio: sa1100: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-12-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=c4Isjx61IsXwy1L10lydMFlqZBELu3z3ba+yBwH+QRc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6Ipp+OYSt+ikqj2UvGKKNMCmar+1zqMNgVE
 W9N6iQSuQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 chTeD/9I14P9RY3COUbCjQedgou7h73GVSmQAfpsU1+oR9NX67oKSF9DMr17US1TFf2xZifaFyB
 +A7PUaOjWr19fNg2617gbOaCxUfM1fd75XPrCYVHaR6PUWMzfvo96J35H4Aq1E4rp3nv6j8oYnp
 39K7mMEvi66do04dqvXYuAp3nGAPJ6+P7RXanRnhC0jbJ5JbGuJdG2pSH4gX8+YW3cc91WVrb7d
 4GxpxIYGWe0bGcDqZ17neqzVyzrpEluCO/VrPr/e81YyaUppzx9GoGtYMBXtNCd80QGyeAzfkOr
 FavT1ZDpRsyWPsF7c+aJ5Lk2ADy5FyToc5wtk1/IEhbCOc0ecPrrl28VY8mITwHwVpRtPIb48LK
 40+TDflwhqQkl4wvcZUGrZQJYaGEALsIizpjR0LRHe/nQxSHyjrudyn6DrrgfwWkzY9UBJsQMA8
 skB+VxmtuPO4gOKaUTkFlDa+LkasazYamiCrWNrJvXwY6PWop8tn0K8svtQ6P8S5HWlzSK0N6UZ
 Rxn9y/tS3F6w2S7c6XQTEEvtzi1V53Z+wxP2I/VELpg0AZVFcM1+55C+GTwbWshUf1qcMltwGSP
 vupnX/UiKGo9M3TMglMKZkB2CyR3GvqKjQ2rjUXGTgNK2IXSeKzrZbsyRGkQiOJDgGbpYuU5p4B
 SKaO1D2IiPKNZTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sa1100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 3f3ee36bc3cb19a7baf530def0575d2ff09dd3c5..e9d054d78ccb8485b9f662fcec385fe0d0edc0d7 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -43,11 +43,14 @@ static int sa1100_gpio_get(struct gpio_chip *chip, unsigned offset)
 		BIT(offset);
 }
 
-static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int sa1100_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	int reg = value ? R_GPSR : R_GPCR;
 
 	writel_relaxed(BIT(offset), sa1100_gpio_chip(chip)->membase + reg);
+
+	return 0;
 }
 
 static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -96,7 +99,7 @@ static struct sa1100_gpio_chip sa1100_gpio_chip = {
 		.get_direction		= sa1100_get_direction,
 		.direction_input	= sa1100_direction_input,
 		.direction_output	= sa1100_direction_output,
-		.set			= sa1100_gpio_set,
+		.set_rv			= sa1100_gpio_set,
 		.get			= sa1100_gpio_get,
 		.to_irq			= sa1100_to_irq,
 		.base			= 0,

-- 
2.48.1

