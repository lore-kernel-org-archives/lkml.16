Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13E2C031D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163088; cv=none; b=C3mLjDLlSBKTpqv7DbuWMR7QzlKzuuFyBEpA+I65K4ENmtTaf2vbx7MdWGptey+0I+dh5DVyA7gbgDaIUdeNdwL679gU+kzQvh3tdOPIpSkLcKRAHPpN8h2r/xtB3k1Lm5KVsOXrUzb5v5ztXfUzsfTInIuGcPIA1w1rHRZNbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163088; c=relaxed/simple;
	bh=kEfiCA9+OheiBriw2pdL33nAXF823N9SCYa1haJTgFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuDfGz+MvXeHZpLaCWK26qAeZX5Y1vLzBddPPXHejKItFTOklMpEG3Mivtw3mDxXba9XVbqtUvyd0ezlgXxYFdIqaqB5Sy7ceSQviGJTUMZrFCZrPz6jsSz3rqGqhKHmKlxhTLfKmkPXlzVP4sm+k468wvG/Wr2bN/4Z7as4Qi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wf+JYzOt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wf+JYzOt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so41872215e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163085; x=1750767885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=wf+JYzOtVxxK+GraGdBFJUY2egrf6hA8gNx9CwNYQ4bMMlZBibKD5Y9T2XJ/6XomWr
         ELizPUJb+8OPVyMX8mRfpLuh1iwwnG4iqhJqmkIwZKxNhuB0brJVi/NSWRgxQRrkdELY
         hn6gu+RQSv0U4wd0+AO4Ki01k1KpdCXYUPcVOS2tMAhlxbdrpqKD0mjMs0umhi+zR0Iv
         u81JG1z0yRiiGkQk5L6MNu+tfQG1vi1Vpp8gVKvIuSDgwQKh7n3upAGaCCsDXqukxYGr
         gurlNsLt+IpJwL4La/8GXGntu5vSy3kyHGf7h/QNZYVSmN2zwKrrKLBW5L5N6d6BAgzo
         QkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163085; x=1750767885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BunBstoheAwjjbUHp5liz9ofrsXDKVHtZqsL4Aji7Bo=;
        b=rwo0s2XNLcEhB0SDrMY5vpKj6zQqmK/IGjN+/mQBLblhxEgubYddeQY7cmlIJA4H5R
         n7WN6QJwPx1ZxMHGBv9CINLMh8IYyxkRz0K+D2hCeipjbSMXioJxJ7wzAniqI9UzOIsZ
         7AtzWj9WyeFppVnTkuZcRz1acDKTN0LMhG9vRXUDJoxF1Ye5kj0VfDgAXUcL7mQhE4t1
         eQXRgV99mKvAW12wv5lUIOGaGgKG0pf1HXZr9d2U3Yw6YdDqvFEtCrZqHCwQpXsjrA7U
         NX5WQxjg7Y0p+f2y1+jPyKNFLh41TexA4BkDY/9QrA9w3ks3XWcZofTL1Bge81vvgKqF
         SuIA==
X-Forwarded-Encrypted: i=1; AJvYcCU36yROmrqO2Uyg2zWt9b21aKIhvva++Z/ZtIkauE6TTn3Kcl7nCDTAeCdQtqHTpBqYvsaZBnDl48CIi48=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGY+2aDGn4nC1PCjpwdNx9uPBrT8A0OU0HE6YV+Bo68xmPObrq
	wRKGzc3hJQ+MQ8BcoJ1z6mt7YoAtAnB/iHclqoHDEonimCeqpHQxz6IsfpoVX9fGMCrpENn6f8Z
	WH16oXzQ=
X-Gm-Gg: ASbGncv3lVOrAqG7T4joMl7eCLuccbHEr4nQ0tm3puN4ylPiyRkKgI+UwN8h7SMi25i
	6qYwSmbhevdL1Yi4lSoOilPIkA36OQXjUpSQ9i6iKBg1wTu9EvHEZsHXWfMDfu4MrcMgTxC/uA9
	pFPtlbHVzDtUVuq3FGA27G/XLpMhFuIXqezwwKzfzp8D2akGX3CF2OAjz0xs4fwVddh/CnyzT7d
	pzbM1r8uE2pKmI+xCC2FBNGmoWd7Dzum0d49ENB9ktp+vF7hewwiKth0bHMo28T5Tu/frR8OEKt
	Q++8gP0qHPGLMeQi1pVAUE+b3ocHUI1N5Qch9dl5tfVsVH2d0rYG4F5ktoY5VB9I0Bw=
X-Google-Smtp-Source: AGHT+IG38n8yT+e1ncHPeSEVdH68o2T3Sec5cbPfOxOX3fgfc6HVuUUwfA/G8YafCEi55IS/XLmI7Q==
X-Received: by 2002:a05:600c:b95:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-4534b4d8ad2mr71541235e9.18.1750163084982;
        Tue, 17 Jun 2025 05:24:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:25 +0200
Subject: [PATCH 03/12] gpio: pch: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-3-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mZa8mgQmqtI4o68XMiXnsHjV4blkeihaJT265+ul6Aw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GBgn584BsrCfQRzkIjI/k7X2K32+hBm8cd
 O+tckc9Rs+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 cjbdEACbzA8JpfrD7XUVbbPk6TErktnsgMRnasgtasnTq35ZQ7HTTM56J8h/KEe46L725xvuI88
 VuGInJdMnPsCIINM2YsdxaBMunDAu3WvbcjoFDvQI0fYBmUpwfKouTrWsAL6gT4R/4PHH+DwaiB
 X3xZE2T9O1Coo94LvdLCNRg8C8V8QcfPttoO8tkKhDx8TSmOpBm8USV3IWbEwaQtxg61tGSuHrR
 xqYJGCe9WHkzvi/HN6Jk7z6E4ZXeqDKb19RnFaVjuz8rOMHfsjluKQENenMk2bvC4Cys5xKEuWh
 U1c+BPAPmK9AeO1byW1GlSYvqhxH2h6/uPs9P3e84RMlESHHR23QrJU388WSaJgIijeFcs4dFYm
 d7sWvPXNahCRoQZ4foUQbd2FsjPBWi78q8ZdG8rglnJYuetBj/5YGaESAn+Fc7sALIJrbLVgZHU
 k08mlvs0JGIuVvO+5mNHxROprqmNCR3CvQ/h0PrKzgg+B6j5SC7gDCjqGew481k0A96cYuU+50u
 0+1F2SkqTVVjfOSV/czlhcWuv/5MdprAvks21HPS3vRN45BvMDvcr1DaAlkMvslrxVo+n1Kqy44
 IAd9NmvSk1D/Yl9Npe3DgTVDHRuQGo4yD2n3P5wGzVXMpo12sFtubyoyJT5k9tn5rTZpd5Mb96j
 SaNb6luqvXivClQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 63f25c72eac2fb98156eb7682e780247a893d7e7..c6f313342ba06a1386d8ff8a882c9344a9e809e7 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -99,7 +99,7 @@ struct pch_gpio {
 	spinlock_t spinlock;
 };
 
-static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
+static int pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct pch_gpio *chip =	gpiochip_get_data(gpio);
@@ -114,6 +114,8 @@ static void pch_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 
 	iowrite32(reg_val, &chip->reg->po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int pch_gpio_get(struct gpio_chip *gpio, unsigned int nr)
@@ -217,7 +219,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	gpio->direction_input = pch_gpio_direction_input;
 	gpio->get = pch_gpio_get;
 	gpio->direction_output = pch_gpio_direction_output;
-	gpio->set = pch_gpio_set;
+	gpio->set_rv = pch_gpio_set;
 	gpio->base = -1;
 	gpio->ngpio = gpio_pins[chip->ioh];
 	gpio->can_sleep = false;

-- 
2.48.1

