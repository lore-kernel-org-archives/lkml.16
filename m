Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0824635A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882114; cv=none; b=qxyPcFT0oX+aWETNm7Fnv6HaAc4GME5e+UtJBYe6DcO+ft9dsUmv2bPuSPK5ite4FAgKdcU5V0b4WEhAqwdTW+Fb11Q9LGlyFpYMjYeKyvv01N0qGpOfqlQqDY09bxrPHnqzGQUL+ZXZwBrd0FUwJ0AqsvlqYyUeIa0sdQTxbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882114; c=relaxed/simple;
	bh=Vy0Sg5/yfIQxGTiF+YsLYiZrGZGxLfxXhS+B2ZRsujg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSJhxjZaCUxHB2J2RoNfdJ7gNPE5gZF6hRgtkZP8t+cHn2KVBJ7U+vY+HPLAOfmkERpK6hY7hi2aNyPOcnMCVqAV2swaQIizL+w+tIh9lpUI3VI3RW4ER14yWx61VkkQzchdByDwxTw3xXXschQ2VpMOKW0DnNYs9pNQkMG+DQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hJqIGHmB; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hJqIGHmB"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71e15717a2dso763046a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882110; x=1739486910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7U1tr86Bxzg8KMxqprTIoKXgh7O+YeZXgnU26M/an4=;
        b=hJqIGHmBbg7GV++307TnlCnNUt4Ks0z26mmVNcG695DwU2laOBo4AsjyyvvmokN3DK
         hBzsZrKDks/R/wdOemNM5x9MfD5eDe0Z78IjwGKy49AvJHPzFFrSHmWKAwdZmto95lWP
         JEoS3bOHyiGm0iNoIeWKKuY+g4Df9zQae1KUVqE8kYUR1/h605jEsaSoBQkS2FGDwYpz
         KucYjdgWEaPTVa9thJk49G/LcG/QGIkbiQQmAF+D1HapnieeGo4QkD55gjm+caNQcGHX
         YPev2CQCaCYMSG9IWw5LAOEkiZuVeej8qMjI00STsqmvsl38qosPDAUO+uXZMglyxcE1
         UQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882110; x=1739486910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7U1tr86Bxzg8KMxqprTIoKXgh7O+YeZXgnU26M/an4=;
        b=SudmMapyVX/PEvqU7+daldXplwIQxE9JyR/g3+UbskoUOjOFVG6FAEULVeIfhR6kna
         kJWxAs4NXWLCrnsvN20Ep8KIiRWRw0z3W9EQOnlg8xnaj2c8wLzMLFBMDeU6ZFceyfu2
         LjM+VNYNF4YnmTDf05oQxiJQ93wKxqX4AxT+wav8BZ5xQL1FcDOfx/D9Gd/VI8OJtly2
         4RRQPMo9X2LbKGbdReD5ihN82LAHGojgDGm9TKmhc4Xkr8IRDiu8BgWCltUwlN0K5NMr
         r8UX8DacaOiaNWwriE7Zi+ZSYHcc+nYY5ngzfnXGpU3A2P1JVMJH0e8l0ornqaZiO/2L
         DxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWPzvaR03vTI7RTYFLJT52SOp5zAuV/Yoo+SjdhgnCDS0+5f/6Hm8Sw3cxZXgMCthCjCCup3l3dFLrK1ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxry1Vre2dA7pm4n1GmRttvrer6/jOU/hTHWlKH33vOYsuw6TjP
	ZjPUz3b48+y9Z9tygsuNdgiMdtexy3y17HFCzawl4X1FXCQ0OmvId/uTI6N06DE=
X-Gm-Gg: ASbGncuraHx5rVdqZKzxTRsCRp2qsOVVz4bCPdkOkNAAOngEkxh8JfNmM1AjKZsSCGz
	l2qdjuGVXAM0w2tQCpo4vLDfPvZd5iX1BcbuJ3m/olgCY5yA8fyUH9KZ49XYYh3EcKrN80IOLy6
	65qA/EFhEazZ4RodhVJ03s900S2Xmrmh9Q/WN1Ls3chbO+MMw0fFOqrtQ/tNiFCxlR5Slgt/Jmg
	3G0q8W9vY4u2xqLdYS2BHqDdjtc1lDZMfNkmGcDO4CrJy/vh6GM/Lp2NymDpuUvn7V11zJJ+3CA
	nD9T9mP8oG6cNJ6Q3sSo6GtIKeJjYQC7/bU+bDnsOck62tE=
X-Google-Smtp-Source: AGHT+IH50vqJ+UKd/x8agnmRsrebnsoHILBPEML/hHVzdaMwyiH1jtZh+WCDNiEdIClFYG2pC1GB1g==
X-Received: by 2002:a05:6830:6710:b0:715:3258:4ea9 with SMTP id 46e09a7af769-726b88023b4mr646049a34.16.1738882110277;
        Thu, 06 Feb 2025 14:48:30 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:28 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:20 -0600
Subject: [PATCH v2 06/13] iio: adc: ad7606: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-6-1c5f048f79c3@baylibre.com>
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
gpiod_set_array_value().

These are not called in an atomic context, so changing to the cansleep
variant is fine.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7606.c     | 3 +--
 drivers/iio/adc/ad7606_spi.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d8e3c7a43678c57470a5118715637a68b39125c1..9a124139924e4a4fbbbd234a8514eb77024442b3 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -818,8 +818,7 @@ static int ad7606_write_os_hw(struct iio_dev *indio_dev, int val)
 
 	values[0] = val & GENMASK(2, 0);
 
-	gpiod_set_array_value(st->gpio_os->ndescs, st->gpio_os->desc,
-			      st->gpio_os->info, values);
+	gpiod_multi_set_value_cansleep(st->gpio_os, values);
 
 	/* AD7616 requires a reset to update value */
 	if (st->chip_info->os_req_reset)
diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index e2c1475257065c98bf8e2512bda921d6d88a3002..0fc41275e79f3af282c0ee4f31e222bbe8d8c1d2 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -297,8 +297,7 @@ static int ad7606B_sw_mode_config(struct iio_dev *indio_dev)
 	 * otherwise, they must be hardwired to VDD
 	 */
 	if (st->gpio_os) {
-		gpiod_set_array_value(st->gpio_os->ndescs,
-				      st->gpio_os->desc, st->gpio_os->info, os);
+		gpiod_multi_set_value_cansleep(st->gpio_os, os);
 	}
 	/* OS of 128 and 256 are available only in software mode */
 	st->oversampling_avail = ad7606B_oversampling_avail;

-- 
2.43.0

