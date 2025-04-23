Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095726AA93
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392532; cv=none; b=CFgMs4eHeo0waA9dAkU/Vxy+H6q0WR8YO62uOVETWFwTiwNgY4LXh6ZZzjc3zGj6g4RuIdQ3CBOSIx67izPKK01DN9qKB92JG2ooCH3Yu9N4gVVAGfHSJfsRf2rXG1tPzfMgqLhBtQyoWlOH1lbujb3OknnhTGFzqC8ZCAt3RnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392532; c=relaxed/simple;
	bh=sl1wLB7qfa5cmKKEREVGzg9gBscjJ57jgLR48mBriYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omzehrFcWSCv2SU6xrG2byulD2TajOCskXjFzf6svJpkFoLeXbtEJb5WrW7urJLAzsrkU++I+qyEK7iCeOS8cGGprV0blK8MsLapIxB6IGDsIzab3Pc845BHoOa7ieRdn+u+iXzPkh6+Hw/lP9ja3SApjQLHsaae14GGdNusMBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BXDG2Dwr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BXDG2Dwr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3880766f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392528; x=1745997328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=BXDG2DwrSe54Os8xMKyG5ZugMVHd57apd5M1lZBamZl3be4590IrFrDJa/mKS/wL2I
         dFePDMdrU3KtmaaCQED/1Tf4et0KhjtBDHfPAFRAn6h7H/wqUMN9TQ7MXNOhGhf3IpWD
         i7V+95z/06mHc44oWk8urafLeOmGsQPqJAvjRZeWgcqPRyPKYnNBJHkn7UzdeWZD9XsV
         p2fYvB99jFyaQefkRt+BrUrbj399wAS3oA8ZhsO85VHar0VWm+skvFwCobsB/WDt+wuO
         BCklaax6LFNG9ZM0H4umN5oO11NvvGdSDuGFtIoTQ0J08Uk5bWjyupyR6tCBz9UXr13I
         bssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392528; x=1745997328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDPnLb9e7MtlJKq+kitIrFY2UoRe6RaLIN9ni7aHQLA=;
        b=hJ2Y8FWQ59WgWrOKhCB8PCMdewjaEOytTxgbRZQN21J0aapnxAWm8wm/XgRLJyGBQi
         gep0ogGk554WCSI1sOI8rAicLYHRSrDnSnD9QFHnob3GAsf8bXywprdOqI6vQ5AeTAzd
         Bi0b2XpQbP9hFGZLXYqAqRI88uD3L8aUas+NPNDzXtnLVIgRDMM66FiGfNd2g62kTsFA
         HfjxyU1hbQHn8RH1YzWxZ1JZGBaMKz1eaZDAenYDZcAJms/uU5/zmGtFAy/cMJP5MJxl
         hKlPp2DnhWfObbI3hosu4bxx/gLAw8LLxsSuFDzGRen04YdgISkdTUMhnF38x05EgnAz
         wMcw==
X-Forwarded-Encrypted: i=1; AJvYcCXQvDAKwW2hpvE8kffkFtoGPgx0HEATUauYp/c7pujIrD+4HxwxnPjCerJaKdQmNE3ykGT9GGKVvh5p44I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyint5CwOfp/0u3IPQ+QKwn6w37nYcawJJLIwTVwtmz6KqR2PjM
	NGPDU8xxfxESszR6P9n8om8f64Cc6maipTzJcOfedzfZ8XcDFUIWqe+SE/bvTkY=
X-Gm-Gg: ASbGncvV8ryxzWvZDSodcN/+DCbwl+4MTcRqVh6/lO8kI/UdK/KtrqKJlbGsE44cU6c
	fUf1aYGsh8LI7oV37r+iIV+xZRUiPEWbKZPPAZi74TDzAOv6xq8IYeE/Vdd22VIkNJjf0GnMKg5
	9pV6PRdheN1lVd+hafLgelcVgF0wxoxDWhuhpQHploJwatCROZ/9RAy6E5Q4zY3/z6mcBGTEOR6
	CaWaeKOax3TbBW1+ODSUTstLKuyOIt2rBRes8KHeuIF7w5dd3BZ67+Jqf3QVn+FetF/Q3eAU3p5
	QWxRQksfdKWJ6A1jxA6WINIP/ZenK2zhMg==
X-Google-Smtp-Source: AGHT+IG4ElSHC7IwlTsGTLIS8AFpJo6V3IEFvD0t8DPJXLGCbfVBAFrUXLFfWQ80OqkPgdRhHCCGkA==
X-Received: by 2002:a5d:47cf:0:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-39efbaf6f60mr15814842f8f.54.1745392528677;
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:14 +0200
Subject: [PATCH 12/12] gpio: lp3943: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-12-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FKv0jedtK8ZiOafLuePhziFUAqITUizBRiw5s9uuJh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJODsx6BmS5Uu3epYT6N1MlKACyMV3s6UBiz6
 5RntwZ/tcOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgwAKCRARpy6gFHHX
 ckvDD/9EH2Cq8MY5MoOXZTt6EMH1AEYUaKFr0FsHiSrhY9sp8VAZlwuAebQrfiTazzJ54yI1HAA
 zxk/F2yLuHJo5SxVJs7u6h+/0wf5MNJhKNr05ZJQdTzhn3M0KsE2MJDCzvf189nXA3B5BlBysbF
 KLaDTCGPJBGO9DjOm3BakFKHwT+YN53PZFKNlZkpjg2q9EkmGgondq0BFDC21gw5BDK8NCpBYwd
 YEYQ38fp/o/YGTlg4Dia8DPwYwmzI2mzyG7H/HnGGlWbqd/OqaHf4zx39t+kcKq6JQtdnn0s9SK
 1/SEkXmveDecJYUqkS7ckKP3EUD7nZcEReypoLwPhYn8Gi3veJVeEXns3Bfz9tnQororc28L1b5
 z+ZS+HTK2fV2O2HThQThzilNSepFKOq6Q23mFIiRnP7JpEKRRd27GgfknT6+xC6Dya2e4ZZ+KKO
 +UuGlTDBQFU48+cNeuJVfJYXNZroT6fbFjMpPUAZ0B/FU622qgWCjtX2Okt8O5bHdu9l88Xv2wV
 FHf/+EB8a06+atxP5WHtqCSfEv48CirSDeUCg1w+qeQicvBiJ7JmJKXm/u3OEGPAH3toIq3ktI8
 KTWWXlFIIUkIlVM15leFB/hrsHmBZgrOaLWx4zbAy8YNfAKZh4e3P9pPkKNRtXI58kWPncyMps6
 vqDvC+FesU7V9xQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-lp3943.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index 8e58242f5123..52ab3ac4844c 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -147,7 +147,8 @@ static int lp3943_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return lp3943_get_gpio_out_status(lp3943_gpio, chip, offset);
 }
 
-static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
 	u8 data;
@@ -157,15 +158,19 @@ static void lp3943_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 	else
 		data = LP3943_GPIO_OUT_LOW;
 
-	lp3943_gpio_set_mode(lp3943_gpio, offset, data);
+	return lp3943_gpio_set_mode(lp3943_gpio, offset, data);
 }
 
 static int lp3943_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 					int value)
 {
 	struct lp3943_gpio *lp3943_gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = lp3943_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
-	lp3943_gpio_set(chip, offset, value);
 	lp3943_gpio->input_mask &= ~BIT(offset);
 
 	return 0;
@@ -179,7 +184,7 @@ static const struct gpio_chip lp3943_gpio_chip = {
 	.direction_input	= lp3943_gpio_direction_input,
 	.get			= lp3943_gpio_get,
 	.direction_output	= lp3943_gpio_direction_output,
-	.set			= lp3943_gpio_set,
+	.set_rv			= lp3943_gpio_set,
 	.base			= -1,
 	.ngpio			= LP3943_MAX_GPIO,
 	.can_sleep		= 1,

-- 
2.45.2

