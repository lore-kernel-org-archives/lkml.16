Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B542D4B66
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847636; cv=none; b=WAb2yvNkt35adG0tRFlnubBVSB7g3tP6K0yyHuQUgZ/DHl0vmoIzmhJOdT+NLqwG7LCT7CrLa/cuzUg+sVnGZsSrg7iPExqVgRlNVfLzTbntfOpdaDTRb55WFzoF1olazzjXTz5rPgO2vMOHl3oPgpI1gQp/xVcdHAorFU+TCMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847636; c=relaxed/simple;
	bh=GEuDJx5QPTHM5tc+m1g3q7+5FM3B/iURX5AMDE0fWQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSkloiDP0V99e3oA8HEwIbfaBYe2aI0M/ySQU5PJHr1pAPfjAoa9/HFxDjttz6V1JFSmoNuI65e/A4wZiHt5KwBMz/L1crWMTOZczGStoJp99HHCUIbaOu9gqrP9kUMuXgM6FVzFrhxC8SaveH3HAl5/TdUAPjgRuve99h9hRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qooIYMrd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qooIYMrd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54690d369so5585293f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847633; x=1751452433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=;
        b=qooIYMrdt0EPptZzUHhspOp+T5VCn3xaUQWN8L0lNrYGK01w5G3TTIDe8RcIEFy91E
         W0YZL0wtW/Pc7EVplWX5KGSoy2bRKWhuh/ultWDElCjPHd0pmMr6kPlaEHKntXUdKmXm
         pxQBi21vCY/ZPMqApxkhVMmJouYoJTEIHJ9mWudgNHfyJ/zyqPabaTLTocvZxGyZIqGN
         3MpbRnM+SVWVoxFEyyude5ebCa79oDVyrnlxTlptUYiiH3W9MHaLjtWUIMYb4mXGipFK
         LeCN7JZtJQBJvpOOHROwqNjZxfyjyEje8K4UL8v08ticuUDNQNyqqYENF4UIvEc8BvQ1
         jGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847633; x=1751452433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC7Pu9soozWv+X4KdcyQ3wROHwf5kQLULZRPlnwsRdk=;
        b=lKbn6TaQdusutG0uh8oWlkju5zUrpLu6347TGxqpQMSoCLHBnfKtZq9mu0vTx4D/b9
         S9TTq1+3TYhLuahzAYnrNVoZU6gSM9YukXGgTgX9xNAFuyKbdQvebXp5vYEp14G0qZc8
         yv+hJydS/zhDKxqF9+awSCRg5CXJk4VwKjF7HxCIq4pSNs74YtNjK7pRhE84Lc6xU1rX
         PTmYZdRm/TN9dPS+TUO3A67chkcTYQaIbzaRDFNWYujh8DwtD9yZJOtfxAZa5tk2ku7i
         xnMvNEtciLcsfZs2dzzBSWeoC2VzmGp3PCRVWHs0MsDry2wRPX1B30KLSF2lOnLXo6NW
         lc7g==
X-Forwarded-Encrypted: i=1; AJvYcCW3odHhnitSaJwbs0lvbgaTatK44LPOxDD8Uz/x5kXVJCc3RNYTxOvd+z4btBCKGN1kqZNa4+E+Ft35QN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu13GinjdDKOcRzeOxNgoeaKaJskZ9FPEct6qR+j31/45mioGH
	jJv7YV4ASjofi/ji9JqggXbfRw1U3FmePDs7efHRjZqic6Q6PqIj8vC/TAqwWD2or2A=
X-Gm-Gg: ASbGncv82ElkQcHswt6IKt8W57T1wuCkcmyX480xwsv9f0LXtO2moJgurqgF+woqMfj
	wNPtjEkPD2DSzrcUYr5fCH5Rcieru/vhzeFer3P/XFVLLOqTckC4gP7Cx0j4lrf9k6fIpDpS54m
	97l9vOVUYujJg39m5IbTZCwWfTO7mj/Z/J2TNfaKetoe6S9crn1b4P/m0aoMtZpg4GyMBuZn3aP
	KYhXDsEupdxtKkyiZvKYH+3afogDv0AZfrtK0dZz0qgKoGyDETdXKGeLDHRgq+gsqmpuMNOA+7o
	VLvsy/+d9WHvTZYJetV1Zaxlcaj2FIZcNnKt7qiZMTQViIrCMxZJ+irs
X-Google-Smtp-Source: AGHT+IHxR2qvRGmElBXq67F0SKZPrxii/yocT/jg1I7d7lhCDWU0MVv4VQ0cqFQ8XWvWsQzZJx/Yjg==
X-Received: by 2002:a5d:6f18:0:b0:3a5:8a68:b823 with SMTP id ffacd0b85a97d-3a6ed60755dmr1812393f8f.23.1750847633454;
        Wed, 25 Jun 2025 03:33:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:35 +0200
Subject: [PATCH 12/12] gpio: tc3589x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rb/GoPaCoaNCEXEQPUk26EQjk/xqS/m+eP+cKDaCCqo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA575QX9X7E+WHE5PW5iX86bog1E6GPj/k+
 5sFRK+FqfOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 coHHD/wMH31t1wMzv3QMkuAnqPWJ4IxSDFv1ZkrRfqK+WIEZZxs4GldQzrDhHJxVM9B3Zzy03Fb
 bvX/ND0cQ3SI+J2zOWX0fHQcj2xA+0ifJsiNXu87Eyad0w5lDmO9bdKEN2LyKDDZim6lcAVsbti
 hdgbzWxvuI4jmQkAT6cyxZNyHwvcegXwpRUz+zLhzf3kym7keBczoqdjcm0xSu0iFc3uHIeW9jM
 xMEaTrLbsSbDeZrt61DYlgkMG5qgy6Mu13GvMKDnkI9zpduu/0EsTWrNAsVMUmFb4bnTt70W4iE
 xNtlJWglIEdv8FdUFf7jeCXtULeoBTpjycxN56IraT4sgqt2HobWV/XKvbp8bia3nQ8mXH6Q2hT
 3Hu1kLt+Cw6fVUP+P3uTsvGiB9tGA5YPXuMc5jIRx/j6fNtXgEYRJ/8Bx7ZAYR/Aess6RFci1fn
 ctW05dqgrdFEBPMNOI1rEPNEutdTpLmiAD3bWHElDMDPL2+0Lq1fFXg0IMcSQTma9yHnfxPK/z+
 lULXHRCP0lqNRXlKxW6f1n/G5jg5FdktLY9gGWbukblkSYdXc+plpftzge5t9UC3369vcSOK57E
 J981JOpgHxMxN2mEgtJm9Ia9ir6wIUceZ6AuLO7I63GooqvnLgso58PnGKlFhj3ehmzut0m3/Rv
 wBMQPc2MAszYITQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index e62ee7e56908f9125ccb6deb21130a5d9043fbde..0bd32809fd682bac7b16b1f251887abebb44acdc 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -49,7 +49,7 @@ static int tc3589x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(ret & mask);
 }
 
-static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
@@ -57,7 +57,7 @@ static void tc3589x_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	unsigned int pos = offset % 8;
 	u8 data[] = {val ? BIT(pos) : 0, BIT(pos)};
 
-	tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
+	return tc3589x_block_write(tc3589x, reg, ARRAY_SIZE(data), data);
 }
 
 static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
@@ -67,8 +67,11 @@ static int tc3589x_gpio_direction_output(struct gpio_chip *chip,
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
 	u8 reg = TC3589x_GPIODIR0 + offset / 8;
 	unsigned int pos = offset % 8;
+	int ret;
 
-	tc3589x_gpio_set(chip, offset, val);
+	ret = tc3589x_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
 
 	return tc3589x_set_bits(tc3589x, reg, BIT(pos), BIT(pos));
 }
@@ -146,7 +149,7 @@ static const struct gpio_chip template_chip = {
 	.label			= "tc3589x",
 	.owner			= THIS_MODULE,
 	.get			= tc3589x_gpio_get,
-	.set			= tc3589x_gpio_set,
+	.set_rv			= tc3589x_gpio_set,
 	.direction_output	= tc3589x_gpio_direction_output,
 	.direction_input	= tc3589x_gpio_direction_input,
 	.get_direction		= tc3589x_gpio_get_direction,

-- 
2.48.1

