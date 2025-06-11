Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A2A59
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681737; cv=none; b=th2u+xP6zN9mVXK+XlyYvU6MRlcvw9fVkgw/Mi4A6v/9eYizCGCF3p5+3xix9NzQmcZFYU2Da8mCo/uKwY8bVADU8iOz+uJHk8v4xJX7hKP3PrE9t8Q3g0LH5KuoksKRFRDfRAD9bsTWo+rGzNh4QyUTgnwcTfX60X/GuYM8m0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681737; c=relaxed/simple;
	bh=yr3KMlpdAIDpFQpkD3xC/enXTLilJ1AAF5YBAl5/CHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jx/RD6Zv/QLATkB/TVoVU9IvfSQ1+C4jBd+CKNzF79xEthHEZ46k7gU03E2J6JwY1JW3kvqmK5g6P4XoHvI1N+4/7yqmpPSWKXsQWVnZWp+gSZLhdtPCnCP9qpg+u5a6lX2b2NpqwrVRDuaAS/jUxehUUeAo0YCFPuoOL08hvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cu+hf2rs; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cu+hf2rs"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4067ac8f6cdso245181b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681734; x=1750286534; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=;
        b=cu+hf2rszaGDa4X21jSbPXKEUqKWBfxCYGybkwYMVkA9Sx8JrgQTruP7DXuVNAUO34
         /X69GrKTeGu+xOqxtvu75uOklsphXIH+unS+Uv4Eg7N3Mdr0abHJmoPCDnwBNztyVFoZ
         X4F1y5KodZxRjpK6x9aGhclgRkpRhDZnTu5ri3STXh0gmpUUuyB2/dzOMxKq0/4zRJ/q
         4eJx1wO0JSeeCW5VrSoton7xTsweWTLvmsIjwm9ilYvZCSVNOkchiCK20N+DGzdA99q5
         ROp9OIGp0Qodg/IN3glRUoMyijglO3FnPHMbqOb4qsuDjIythvHpWjbVNG9Se+yUbT4C
         Loog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681734; x=1750286534;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BvPO14dME7rxPy0XG4Suixfv/o3vfcBS7p0YrP3lVs=;
        b=ph60/aL+izDZUZL/QWq81DP+7Xu+uym/R5Hm50eUJy5EULnO6RmjFZYwKLRzktOKur
         a0DTOMcc3NXAE1huwYcsVAQDMVir0X3flKNY+lwF0oWBA00CmLsmIuAj/bCsKB3wpo6h
         HtC9qkE3k3jisbQvh1N1gCzh6iU0zTQm1FRvKJGmD2RS5lG1y0h30ycp2T4u2oMmeQM3
         Pit6JY3u+SIaHQl+rb6UTKX5l1KFfCBbaS8TFpEqhVZoy/KzrXcv9zSOo6WtocvcKxy7
         hv+c///4OByrqBMYs9btjybGWBbXtC/BdmebmXXRS5uzzCKDjm+gp6j/3e5NN2L9KG3G
         IU0A==
X-Forwarded-Encrypted: i=1; AJvYcCW9o2c6RfbFAhiHFs/XwZy5ts4M1wGO1mg8FWCtMA1zYt43lJibc586RcKKm5TWFjajKg/LHMWe+c0gzNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Zsy/NwlBVrSRLbhTT4KhWE/BNoC8H3J4Bm19wiOUxFGyEaoR
	zSddwTxcnD8FrD9hjeda+oauqmviLRPBKi7R3FIpUPF4lXAHbqSAZOx5X9nzi2TLF+o=
X-Gm-Gg: ASbGnct+G+gmK1Z+stBVSh0QqwXKVExW1xDlh26OBIv1tgmkFCalH3zYVH8iK7dZR5M
	94OKUKzc9498tZqSzZ79lf98H4YhKLcQfj+jeXs+tRJCo4ktJwM5fYyeljLu7tLgXntuk+PJGTB
	ZUhWRXppg7fbrtCI/75srBngNmFYO6aqZy3a6zCVnez7ovux5S1+J6akwzDTXXkFPSqK7EsIs53
	GyHEd6ofoHA5dWTVosmahxcmFCkxgYpW19HU/J4MrZJC9Y56TxmuE25Rwjw3rOb3x/7OESDPP2F
	ky4fWO/1dCIscmG8CSrailHS3GI5xpGM4HYSJrBk4eR5bIrtED6bk/pEZTAPGZygt8Ox
X-Google-Smtp-Source: AGHT+IF44UK8AdQd6fFvDc21ilNMu4m0bVVIKOfl5xOOjYgMQm/xz/i3oLPfD33Zol0pZXaxSSar7w==
X-Received: by 2002:a05:6808:4fe7:b0:3fc:7e1:a455 with SMTP id 5614622812f47-40a669c01efmr518853b6e.2.1749681734252;
        Wed, 11 Jun 2025 15:42:14 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Date: Wed, 11 Jun 2025 17:38:52 -0500
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwFSmgC/x3NQQrCMBBG4auUWTuQCVXBq4iLmEztjzSRTFBp6
 d0NLr/NexuZVqjRZdio6huGkjvkMFCcQ34oI3WTd/7oTiIMFF61FkZGY2shPvmDNndb05C4TLz
 oYtrYJfFplHDWeKcefFWd8P3Prrd9/wGWqNUmfAAAAA==
X-Change-ID: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4170; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yr3KMlpdAIDpFQpkD3xC/enXTLilJ1AAF5YBAl5/CHI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWAfjXY88M5ZYDZ+7DX9ossNW945JAucW1/v
 jGUtSZ5M1eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFgAAKCRDCzCAB/wGP
 wPuQB/9qvN9qaCT672/2gBbYyejlFF3k1/j6Gn/mB3Q9wXva2BfxWsvzY/aFxXDjRUixvEIYtHr
 Aa2OgjvXXp8xeKaF9+2tuO3eZMkPIlIsGMSh8RlslM5ziujYyK74q8EbozYwpwlW1iEN+nhz2d2
 veKGy321c5RC4/6ArZl7vHAkwa+0YbhQgUQMiL/p0G7uDdnZaPAOsMjP3qOZAFm5g5e6xP3QeuZ
 NXEr3Fmbf7SKpE+P8cDfUrlyI0ktmNb2LmQCFLyFLxJcwfPz1+dMjbqnyCkB+OsBvSwWgo6eIed
 GyVNvi0jVIHbMRsHldgnXbcgyInHxugOhj5ZAno4ZKQqOxLc
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Jonathan mentioned recently that he would like to get away from using
memset() to zero-initialize stack memory in the IIO subsystem. And we
have it on good authority that initializing a struct or array with = { }
is the preferred way to do this in the kernel [1]. So here is a series
to take care of that.

[1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/

---
David Lechner (28):
      iio: accel: adxl372: use = { } instead of memset()
      iio: accel: msa311: use = { } instead of memset()
      iio: adc: dln2-adc: use = { } instead of memset()
      iio: adc: mt6360-adc: use = { } instead of memset()
      iio: adc: rockchip_saradc: use = { } instead of memset()
      iio: adc: rtq6056: use = { } instead of memset()
      iio: adc: stm32-adc: use = { } instead of memset()
      iio: adc: ti-ads1015: use = { } instead of memset()
      iio: adc: ti-ads1119: use = { } instead of memset()
      iio: adc: ti-lmp92064: use = { } instead of memset()
      iio: adc: ti-tsc2046: use = { } instead of memset()
      iio: chemical: scd4x: use = { } instead of memset()
      iio: chemical: scd30: use = { } instead of memset()
      iio: chemical: sunrise_co2: use = { } instead of memset()
      iio: dac: ad3552r: use = { } instead of memset()
      iio: imu: inv_icm42600: use = { } instead of memset()
      iio: imu: inv_mpu6050: use = { } instead of memset()
      iio: light: bh1745: use = { } instead of memset()
      iio: light: ltr501: use = { } instead of memset()
      iio: light: opt4060: use = { } instead of memset()
      iio: light: veml6030: use = { } instead of memset()
      iio: magnetometer: af8133j: use = { } instead of memset()
      iio: pressure: bmp280: use = { } instead of memset()
      iio: pressure: mpl3115: use = { } instead of memset()
      iio: pressure: mprls0025pa: use = { } instead of memset()
      iio: pressure: zpa2326: use = { } instead of memset()
      iio: proximity: irsd200: use = { } instead of memset()
      iio: temperature: tmp006: use = { } instead of memset()

 drivers/iio/accel/adxl372.c                       | 3 +--
 drivers/iio/accel/msa311.c                        | 4 +---
 drivers/iio/adc/dln2-adc.c                        | 4 +---
 drivers/iio/adc/mt6360-adc.c                      | 3 +--
 drivers/iio/adc/rockchip_saradc.c                 | 4 +---
 drivers/iio/adc/rtq6056.c                         | 4 +---
 drivers/iio/adc/stm32-adc.c                       | 3 +--
 drivers/iio/adc/ti-ads1015.c                      | 4 +---
 drivers/iio/adc/ti-ads1119.c                      | 4 +---
 drivers/iio/adc/ti-lmp92064.c                     | 4 +---
 drivers/iio/adc/ti-tsc2046.c                      | 3 +--
 drivers/iio/chemical/scd30_core.c                 | 3 +--
 drivers/iio/chemical/scd4x.c                      | 3 +--
 drivers/iio/chemical/sunrise_co2.c                | 6 ++----
 drivers/iio/dac/ad3552r.c                         | 3 +--
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c        | 4 +---
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c        | 6 ++----
 drivers/iio/light/bh1745.c                        | 4 +---
 drivers/iio/light/ltr501.c                        | 4 +---
 drivers/iio/light/opt4060.c                       | 4 +---
 drivers/iio/light/veml6030.c                      | 4 +---
 drivers/iio/magnetometer/af8133j.c                | 4 +---
 drivers/iio/pressure/bmp280-core.c                | 5 +----
 drivers/iio/pressure/mpl3115.c                    | 3 +--
 drivers/iio/pressure/mprls0025pa_i2c.c            | 5 +----
 drivers/iio/pressure/zpa2326.c                    | 4 +---
 drivers/iio/proximity/irsd200.c                   | 3 +--
 drivers/iio/temperature/tmp006.c                  | 4 +---
 30 files changed, 34 insertions(+), 85 deletions(-)
---
base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
change-id: 20250611-iio-zero-init-stack-with-instead-of-memset-0d12d41a7ecb

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

