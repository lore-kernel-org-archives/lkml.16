Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EFB246324
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882112; cv=none; b=cj75CjNlGsEeN5UACaN3+Hco34NG0V2NItL9WeriaWhdpOtWuYIA/ohQ1ShGIQl7GJXg8xU++Sz25vaLCkQBtQykuqd8dglINebrXJ7kxb3SeSfUG3fWlDKBTi3pyfUzluiPnFMngE6RPHOxWF9yViYvmKKK1ZpdTNhDht9rAT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882112; c=relaxed/simple;
	bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jT6bNVo2/vU7p876ldudeICNiSHaY43v6ShTKuB3Sqzlvfhmc6hsnhFMJ91rETDn4mO7XddcHC3kbEAsqG+OYV0Wc9Evdpy74Q+ThUSm2cC4B+QanTJfc7X+43ZAY1ehRI2iJ8EafMvNrfSCFMXbzhP+Dg0ZCS/4uU5RzxdgOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vXsnwKxu; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vXsnwKxu"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3eba559611aso410796b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882108; x=1739486908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=vXsnwKxuC71ZpjX0nbYzQvtqVo6OCEuNOXds+okgver7+eVdKXmmAWRZ54Thz+OlOv
         NuhCFxG1N01NsmMhVGyZpKW/y7TYPrahCu2+KpHU1wIFjLmeMweXSt2xh5hQ8PA5uwas
         lLw6la+v7QrTwYGmAEGIBRkIhjC+XJCb0A3aFKtH/aHHHqkb+CJ1jjM+LixP6ENvMH+x
         NIoHa+hlCWZxQBqKg/uZ5cYFgAVOuDWCpioO7yN4y83nOjgVt00GP6uyFJrhO/A1QVAd
         +Wo85rhB/AZSM5Sz/u89qYKqyITVswuV/ShwQ9dodVE1GHEFTtRaEB9AkSPiqZ6hsry0
         pc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882108; x=1739486908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=HBe89Kmwi0wbXbpE2uc7lrvZxjdWvtPXJQIF72G5U/dHXZl+rSCdUN1LR+6IZvasus
         y1Qcawh791tP0/SOAEEzT2yYSVTrGoPrbilQMo3QFn0pOLG3ihmhf7GnXcBuWZYVqQLx
         vU+mwLiI8F8mKONbhGA34XviOiQlt56zPQ5JLCWEzKuyMgTp/w1tV54yDVYtqhwu5VIe
         zgNNIANLPK7iSJ1RUUvEzOcBUEcgI7P0VdDAtbv5Z3bQRirncDWTagPL/NzyuI2WIpXr
         A4vpq+kUIAz63FY6CIVKkiYzq0ozerlKd/LbbnI9hFHTvableGq+HClp9E2zZlDTGueJ
         L0+A==
X-Forwarded-Encrypted: i=1; AJvYcCXe4PUZhh1oXyKq/A2kMjO0wtyjpQSU1Zd4Z2+P5W9bQ3t1bsJMvYOxmLw9FnFMGJtu7oy6xnbADKfihRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8INbuJ9ZEcppMNqF/y3igDk+U9BNZdpRZsRlyJLZzK/B26+lF
	6nmCR9wjJIPdCDco5dCY/B9ylANdorU88Dd+/zNyD2KS3RFSlzNoMo7jL//33Do=
X-Gm-Gg: ASbGncu2NGeLBPx5nGNudQ3D75TRDRcTYYO1l+tCS9Rby7pip2tYNo3ERjwEyu+KA9n
	Z4bZ6hsIUBhL/CKCgDwLjbjqNOVtMc8HvunpBWvThI9dNc1oiwYg19A07x55k3jU8MHKoRPu5tq
	DUSO24bd9ng1BtGx+MIInBGwQQw0qVYW3ED34eOi6TZkSGVkjsEg4vJsAFWNY0hJDVO35VYienw
	ywb366STlLx5P6r9h/H18OkfW+Jkzx75u05jlH4LZhcwSJU7YqWPfNpwQp6H3ziU2LD3JzApy9Q
	Bv1uE1cs0dsIzCF32wPnyVo+pE7L3pHeTyNxj42+1a/ouLU=
X-Google-Smtp-Source: AGHT+IHR3rdzOh31Bx2HFTQsJV0ppIelp4NfQddbrynjHIrf2JbNfAwcWx67zk6KGYi6B0FrKmfqwA==
X-Received: by 2002:a05:6808:189d:b0:3e6:3a82:f790 with SMTP id 5614622812f47-3f3922a086amr707666b6e.6.1738882106950;
        Thu, 06 Feb 2025 14:48:26 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:26 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:18 -0600
Subject: [PATCH v2 04/13] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-4-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..b4c9308caf0647a3261071d9527fffce77784af2 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
 	gpiod_set_value_cansleep(ts_nbus->strobe, 0);
 	gpiod_set_value_cansleep(ts_nbus->ale, 0);
@@ -150,12 +149,11 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	struct gpio_descs *gpios = ts_nbus->data;
 	DECLARE_BITMAP(values, 8);
 
 	values[0] = byte;
 
-	gpiod_set_array_value_cansleep(8, gpios->desc, gpios->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0

