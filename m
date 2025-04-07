Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7122DFAB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010303; cv=none; b=mVl0H3+55Jx6pASP8nr4ubO2u8N/5HpXQgXx6AskQ84FzkNo27HtmYulaj7hx9VOxLwJFGNrQi4NeREhwSIxC+yeOrDY1bGlZI5fyUt/3LCLWjtTbAFGA/bAIG+hS8OpbF9Wz937ye6ZdD2lHxvdsO53W4hKQsSFTydh8hVi2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010303; c=relaxed/simple;
	bh=JcjRt3IWWdiCtJbwqzp1v4b47hd64XOA+ew6annId/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+6aaprDQAUZry9FUDLI7th5i2RUEfpXG6tWz2wB3yITtP9O0OXKyi+sGWWRO0YD/jdS15zwUwomnl/5RrTRCro/mHE6e/k4VcsRj5KqAEC2u6S8DOd4JRQAqpWTwYxyhaMfg823vl1ckBY8C5UViCbjbckcmNN7dPI2EvXSRr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k7LqlBq4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k7LqlBq4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso25277555e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010300; x=1744615100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=k7LqlBq4pkHIXQtVt4wzq67HhHkrY1si7SqU3CCi9l0K40cvBX7V7Ogk6uWqXLxS+G
         5MtZRQIFSeSlRyikj72XOdzQ2WJ8ssc/CZFPoCXq58a2mlL1GyubZ0vvKozaiY3tGIpQ
         5Z5tFSNjvaR61Ff1K+Zg28EvnHBNs778WK7m7K2+p6qgDX+fLL52TExnEPsHi8CjzQS0
         9JAlTUcjLoBhXtqMCP7favLAmCuB4ILKMc7kPvxjTMmtr6H3A0aSImltvEDT8lL0Ln/o
         R/dogjuSWL+U9IqJ7qGCwc7gv56kuPoQBiwdYKt83b7WPz/1wGWmWamlsMcBFZt+nZYS
         LFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010300; x=1744615100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=v+ejn5JmX5VZkBOfuH7Jda34JhzcmGfP+lZUWkOe7ebCng88tstD5sG6KkBrRuyLcc
         Gk76pBA6Rs00r90JRmaUg77+vuV409I7J/GmVMbZAHqAO8xoFZ+2qlQz3pFUgfbZwBgT
         wYKuh2LL6NUk0ezpDiCDxpWNPr/0QY9dKHazQFjrtpgbuCLNn+HZCVexiII5colPlPq7
         sNmMnIK+oxAUdPSn0MgvFST07AZehUrABCdM1L2kTQP1e5iM/m09heXdSRWQEVFbsiTl
         sYrqPgxvw20jMPFY+NIl1bdjn+GbAzo+0UoJM0blJc4y7xIg60q5x6ElVrp0nGkxr6Qs
         CZRg==
X-Forwarded-Encrypted: i=1; AJvYcCUW+g569bm4qX9yjEmHY+LVeYV606taytA1vyYsUdRd7NNC6T6yU3WpERFI4Kv73DwwvVh0YJVXffgcRJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x1+xeO3E7X8pjm5AoJP9nT5mRFFPKnA8/Q9lhO888ckmEjky
	6ofdrBUJ+0btESxMhwu4/zRl8taYIOS/2FeWGmTk52vRGkGPfb0tL6MB/loosR0=
X-Gm-Gg: ASbGncucjhAtNup53ANxmin1xh0dCZYqBFjRvnFtxTW57+00B5vgpPml1CsQPrXOOu4
	7kibRBidjsioyHhvGfNiNpB0WCVwF50vajio3tqRTjoVxEgZK8beuBW8VmqWo/SiCXF7Of8WoNC
	eum6BlM9I9WWp61Yb1s+5G5JFm0GUpTMckIsiuslxK2n9ObbH5pcUql5vmhsCpv5X8IctMCSC/5
	fCLvPG9qCmGuKqFYoUbsBaKX3kwcN+qMQjODXabDsv+zOeMNuFul+BDZOeISjkKNfkGLhCefpUv
	NbmyH3ZfkXaEWcZYZUhICH/WkeyTQRBCyNqUftAorXeMYLAY
X-Google-Smtp-Source: AGHT+IFJgSB1mfe2t5szPiSLNr2MNwqUf8v+9jwrmbgyH2kFsuYq3Qv/ef4JBN4s56UCzcSRvHeX/g==
X-Received: by 2002:a05:600c:1f07:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43ecfa04a8emr85603395e9.27.1744010297012;
        Mon, 07 Apr 2025 00:18:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:12 +0200
Subject: [PATCH 4/7] iio: adc: ti-ads7950: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-4-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2MIhT3UvouiWSb+JqPeZnzmfSS+HLRvIRYg5KBNUdDc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wzY9NMbOxk6VjgP1/KsmPepcYuP2rlT9xHP
 EzAhaaVp/KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 cnZAEADY4UNBcOSE8f291z41AA1F2ND4+IVzRboTWFLvRw+4K1BaOrnd3ZLW0yDdokNkKCGXp1F
 94KNmgK/lYxNmlQfVYU8N5Y1Pt6ss9q9f/d+VWanGAdv2UBp3I3d7OtrwgnmBAPB/lEzwicIsgt
 sfZsaPf5lNYyx3Jx9NIuCcfVRolZu/jwpY1uJcj8jTfZyM6eoAD2FTlqAR6WXBLaiAO9khXzzvr
 kqiRECyfrVntEMVIYATjhByrdw/x+NamoagDxFJZ7voEBVjZYLQ5b7zE+3U8B+4NFU/LJi6xCam
 zvRZ4l5N/ZP98/x0ypvjG+1nIrnNuZRQo+89QBDcgz+HPqC8cq/VyM067dUKJ/cIilIKi9JEjd4
 bjRZvUdo1ymKm7HpwilINx+4nFjYu1a9Qji2IOUwvPFGbAFbtc/ndlgcnCO4rcyGy5CcERu1e49
 Iu/iqffd0wgl6alpN7j0w44+MEwK3nw0sQSdS5AXD4MgWdJxrybBGmkpxcdsj9ynP8ryR5/t6iA
 WNIAAmUsJdTVSTJjFQIvAdEC5y+xUZ15rbP0FUmdaJ+wldYlpHskzODfNFucF+MEgxPtzsRFeq1
 rf2cGaakRaIjryTMG8EFZSkR2pfnDh7Ls06Ao516+jPWA9WpN922ffqizx2UZg07tGkHTXTltOX
 nBMHrip0BRIKwDQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/adc/ti-ads7950.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index af28672aa803..0356ccf23fea 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -403,10 +403,11 @@ static const struct iio_info ti_ads7950_info = {
 	.update_scan_mode	= ti_ads7950_update_scan_mode,
 };
 
-static void ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct ti_ads7950_state *st = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&st->slock);
 
@@ -416,9 +417,11 @@ static void ti_ads7950_set(struct gpio_chip *chip, unsigned int offset,
 		st->cmd_settings_bitmask &= ~BIT(offset);
 
 	st->single_tx = TI_ADS7950_MAN_CMD_SETTINGS(st);
-	spi_sync(st->spi, &st->scan_single_msg);
+	ret = spi_sync(st->spi, &st->scan_single_msg);
 
 	mutex_unlock(&st->slock);
+
+	return ret;
 }
 
 static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
@@ -499,7 +502,11 @@ static int ti_ads7950_direction_input(struct gpio_chip *chip,
 static int ti_ads7950_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
-	ti_ads7950_set(chip, offset, value);
+	int ret;
+
+	ret = ti_ads7950_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return _ti_ads7950_set_direction(chip, offset, 0);
 }
@@ -641,7 +648,7 @@ static int ti_ads7950_probe(struct spi_device *spi)
 	st->chip.direction_input = ti_ads7950_direction_input;
 	st->chip.direction_output = ti_ads7950_direction_output;
 	st->chip.get = ti_ads7950_get;
-	st->chip.set = ti_ads7950_set;
+	st->chip.set_rv = ti_ads7950_set;
 
 	ret = gpiochip_add_data(&st->chip, st);
 	if (ret) {

-- 
2.45.2

