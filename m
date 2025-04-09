Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816425D556
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188054; cv=none; b=TmflxA6k8TOWJ+qYXZALzZhcjHNpfbuJ+lBJyZ2J37ixZY814n/Zp1+J08h+iTvyFa9esjKP3os9+u9pTyIFXwt8/rmQyww4OTsrW3qlP7XndtWgHAq7jcjtNc5eOikS7QmJXTs+6raSawXqVampASWx7WlnEOmeeu9Df3xliXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188054; c=relaxed/simple;
	bh=JcjRt3IWWdiCtJbwqzp1v4b47hd64XOA+ew6annId/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9OEJQ0SjBwdoVX0XouNhZGddQ48pOuqQgOGNcuUdwNpgdF+7x96d5wmYW3s5jkk5lRZuYU8C4RGBkKELzUhv+318IvSEV0uN89wjBUAusyBJsJPF4O6AM1q9c/K9/elVYb1Hd8KnO1en9dDwV001zAJatxsC4pXtuaPovgo1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vqaahOy5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vqaahOy5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso45354085e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744188051; x=1744792851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=vqaahOy5Vhf3YpjRKW4IwqPFQyJzZzqrQBpO9yIhs6RrwfvAafxpqdrb/po3cI6YmK
         NWoXLtIGhQ5ORU0YxoC+TlMy1V7mOAh2S1aj6yu/tZ5jkcDdi0FgHZF0BTc1FKtgxJ6T
         V5uL18f+ZZFQD7lIvmdWCWRJHI5NbcMgu+TL61HFBxuEYKTxPRW0m2CelL6o+qMxwSHz
         UmCmJCj59xh1Zn6xxaKNiJxjdys5r933Q5KF2i1vBFYXuZTl/+tqEbFo18ogQN54Gha8
         5TfteYLgHylgSyuAOpWWzNx9OucWVfy1GN19mnqRxXNxl2xLv4RYiuGB+pRcMp+O+5qt
         BhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188051; x=1744792851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYtkHCFcaSF7UbWnri58lccyI2lE1qpEsdGVCNframM=;
        b=Iw9CbdY+wZCagR71PCUbjW7PiDpEsCF8QPPnQy3wsuuIza4ECp4FZ1PDgDrW9J/wIP
         yvyIsTAdgpgY+QNfQ5cW8emOdqZU62Rd4suAa4AGNQeOoUe+5SFOAJWK1RSQL7m4XqUB
         1efdyj+qkbAVsXt4N+Iqti32d1NIbCsbkF2cREuBCxHY+vlkSnxbYpfVe17RySa9JLt5
         VkIW2a0MMN/Jk1Cq5czplPVovadQHD6go6OmM8FW9u3uFYuUACf+PcHyEgM84NJx6gI2
         tHjbOisBlgIegMvV9bQGrAs54ISSl9jXTy40h+1MqsCWWc77BZUqG/iqeCoCDAo09wsj
         UegA==
X-Forwarded-Encrypted: i=1; AJvYcCULpQluOi9kA2tycVbDmEzNNXRyrMdEgQMai0S81Q8jPhfurELmYVCV4ZxtojJzPhU4XNkxwSn3m9LHQeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhQ5pAZMSP1p1rAx0LKcktbofRVWFs+2QMkpMgQDiQbnIlOe5
	V3JrZgbCWAbJiFhVuU1hOI+C46QljYhUJWwOR/8+KEcS82Iu8XNChpYzKlU/Sppe2GUfQEq6qYV
	L0os=
X-Gm-Gg: ASbGnctQ2WjSBRL7/XBIzrx+AWiUK4AsF5NcurNlyQGvIQfWBGWLvCnSENH77eEWNeD
	B8wYyyItKd80mG4Dy0MIluia+oNFXDbVrod3QiE566ZRgZ5qP8SJ3aRAHB8Ug38L/gJUHRxNawU
	VSNVHX0JtYArLkgGQnP5lxWPADHWROL8iInKTvxF4L27r5qHK0tmh6cmsbPRQXUGI+GFH/fWHCa
	5K+wpQ7Cgd5sE2VD5oja8deNHquLZXg1ZBW2LNz7zFzCOaE91tUzgP9PsbDBkHMUSthG329WsT0
	I7+xKq6egtXOOkGfuXdgBHEdoVme7XRObA==
X-Google-Smtp-Source: AGHT+IGsO3C+MGGdKhwPSByKad+ec5QzbW4TU0+WbuJN6qEWAsyjCVw9P8iRYYQ6yhP7Q/xszVDWRQ==
X-Received: by 2002:a05:600c:1d29:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43f1fc8345bmr14884195e9.0.1744188050684;
        Wed, 09 Apr 2025 01:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm8726235e9.21.2025.04.09.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Apr 2025 10:40:42 +0200
Subject: [PATCH v2 4/7] iio: adc: ti-ads7950: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-gpiochip-set-rv-iio-v2-4-4b36428f39cb@linaro.org>
References: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
In-Reply-To: <20250409-gpiochip-set-rv-iio-v2-0-4b36428f39cb@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9jKMjREirvPxTpHQ9hbsW4kwhT8F08OGlVFso
 dl3acAI19KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/YyjAAKCRARpy6gFHHX
 cucbD/9dp4DbiVLe0Nnj1IgUfrlse8TDg+7aDhEaAd9rA45y0l1y7uMV+HkiO5R+Z2Ndzx4qODP
 cywQxb/9nl4dtPAlb9Lfx5J4MdRaJ/d0qybEsxpP1eJvQJmgxM96v7t+JiweohlfvmAkt9L8Lql
 rUT8PsL16yg1GLi8Henf3rKwS97TmHA4uxFpKAchccleQVMLxUSObVFlKdAzNk6wR2DnwWn51PK
 c4CuihlDTWSfHYyfcZ89uVgrP6kDmNWiQumUeRVcIwK9uFd2g2KpQ+RANgPL5Mb0r/uhrDa7rf5
 DKg+r2j0dYhr/lUdhVm4jH04mGGZeCBTkUvGocaDiS9Zzy0bOmt5duJjQCMzYKf9r88s5gNAR9U
 Uy22YgtFfR0e+0UeJexBnI0hMGK9kw2pGVcyVW6FMeYW6gk8ePftfiIDr1SCBY6MTShwm0/sqVC
 tDVyBrkyy9b5EiJs5ho+bP00OvoCrFrSgNDAC3ywXKA/qKSPEk0iIhliCzFg+eCy5zG44luJ5Iq
 QRO+2rRq5S6tFjtnEwPR5tDydLUllDRMqfnE11kESudCf9WQgRjjSAO7c7g3eZ8txunucQBBVJG
 lA9JoXIb3sMaX8D3wiNPubO9PivBI+pBMR2vkhEJc2KrwMo+ZM1ly3E+N0g/0AGFgxsVm6uvV4T
 Ck9ptDwL/Vhputw==
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

