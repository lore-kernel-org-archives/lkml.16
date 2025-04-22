Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE326C3AB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359728; cv=none; b=N0IFWomsUInPdr5jPXFliQYeTG7zpAJ+HFX3ZCaaAk2uTh8nEwm9HNAah1wRhpvoWJ9zmP7sZ7GTiaUe0LeT/malX5DV4hUyxkjx/80XWL1d7FpUesm6Bg9Y+O2nXHs7sXgWc+OdTsas2H9CaOJIuccY2eEVO4u/Jk0f4xDY3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359728; c=relaxed/simple;
	bh=NLK9rHWGxHgHc450e6JA3Kx5J3+N1Fpz21XOi57G4v0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Owulq52ZuaQrRxudwkdPE2TsonWAv1ooll4vMlPE9wNtkyRLikfKcTPsJTqAUaD1rpwZsSKXeQJNwVgNkm+TKzOc43ePnxrX53BN79TJvzpcD4IcP2WL1EpPjMqeQeisQrWccooGQwZzuv1MPZlP04sf7hhD/KyP8cemvWK4iwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e/O7UYqD; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e/O7UYqD"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72ec58e45baso3526993a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359726; x=1745964526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=e/O7UYqDUkRefYvToUKT446kzKBO9A0WUHnPgj/zYSgLmQ4sT5e7hPEoYoXrCkGgBb
         cQRdFAwflvGs9qoj6LKPYQoEsmhJnaML7cMVJMHNmOnj/owTcHzyqL0az1NekvDSdD53
         J1uT4r55gwwmOIeGpIfs6tw631RrlzkXdq9vaKtPFOxYYxcQABdMu67o94kKikEk3+Ny
         e3O/lOmvmi4h7DexBFJJPFQkeXQTVjTrO67wTkbm/Sl5p+NKUvGvYabITMukWhiGUB+6
         6vwZuHkW5lDZvribfw34G5EE/IAMar0BILG9BOsIg+SsHcrzqSuCRVxoVMyzJkLFGY6w
         Izuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359726; x=1745964526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=BKU+ac/c5BpVNSWaCRXVAJDmzZo6Mj4SVEt8cHkgt6n0Nk66wgsRsa6Fop9PU3k6K5
         8d1Gc+OuYYvId/1d4OVRRny/bwm7C6bd6jK9g5ljA4oFzyJfOidF8ImC2CpLzFKg4qko
         zylaNMpp0iRW26pRhgxBsZwV0k4Jpcu+eOHot3UfR2auIawoBboz3tH6jaqqJw5asFZE
         V+YhPc/9NX40juJaYtbF+4N70npvFaMyU9kkwtrdZy3DeAzSv16+avCEVYfvb2qPh9WN
         +x4pp6u19+JNZ6lIVMn/NgGM8QjftfiyCxttled8Lx6MYg/rUGiRAT9luFFKoaOHSkyL
         AwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOL4ncoAjRr0lRpEGwuyrD9ZMqgoOCFiw+Gf/FEJsPdmWofbKWqbyh080Sn/VV3lM00OnBZaAquN2q9Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC2UbhWVuCZmpZ5lTUrt/pvXpj2KADCaE7GgICkTVvR/KHUHfF
	kYikIjetg9eBue9lBFzK60v+NP0iHadvthMd/Llc4qHU+h7PMJA3EyS2LM5WFes=
X-Gm-Gg: ASbGncuEER6/I/j33iEDaj/SAz8GWfE+tfHabbLwD1P0QJrhz+zBPtzn5ShozYBhPDJ
	uf/gZYdXPv4YYFHtIKfbpEwhFfGs3E45zuXI3/9mMqxovIqTZugLy75UdppAH0fVW7wpwVzfjDA
	AE6cZ6B/MU0SO5GE2tT+fCWD+0k0/08bgeLwyp+OHRfQ2Mb5ZjGG414t+IgLs0PVv+wUXEgVJj+
	HGfHhXt04Xj6Q4DbU43AZIG0oFTV/vWyA+zdKikN0c7wx0gz4GrlS7jWsKVmkKmqSodeQp5qe8Y
	gHYkPnQGpC+TapXa/+iO6jo3sCQhvz2aPFFRjqBC1YX6aW4=
X-Google-Smtp-Source: AGHT+IGFNJO8mza9AqNofho5qSYBgvNp+Om7GG3O2Gt9GY/65S+lLd+LZcwXnwmwWqXB1V0j4m9iVw==
X-Received: by 2002:a05:6830:d89:b0:72b:f997:19c4 with SMTP id 46e09a7af769-7300633746bmr10719999a34.26.1745359726102;
        Tue, 22 Apr 2025 15:08:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:47 -0500
Subject: [PATCH v2 2/6] iio: adc: ad4695: use u16 for buffer elements
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-2-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NLK9rHWGxHgHc450e6JA3Kx5J3+N1Fpz21XOi57G4v0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNEF8NBH0RqMMLTfdFHjCNvkxbyizvXzbZOT
 2HLvY2UrbKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTRAAKCRDCzCAB/wGP
 wNwyB/9rs4fiIS3OMnMGfruRlEWMmXyGhafV1CQnLWK3hgPBA4IaLbeHMxHscn+SRfkt3I9izF8
 Q8UWmSNooqT9zexYI/fpo7YhisDh9lWY91+Ru9+btIYsKwdZ7kI/4NpprLyDDqaKFr7AqtqjnAz
 fRhs7v0HUAi+Kq8sxshNAPdN5DcjIfOZ2szwGmrhNZl/b7x7Cse+4Y4TNXucPW2SPhYF7SKl1n/
 xBRPIVI+pDMV6g++uaysZeJ3AwhAQ+ZLI1YUL9U+jp2I5sx01IUB+XuF8Kl6WEq/rXhiFJ2CN/c
 7fjUlT4VnU7YwQrTrN7oOxOA/VPZfoMIoRPGRuzDsIUhOdJ5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the type of the buffer elements to u16 since we currently only
support 16-bit word size. The code was originally written to also allow
for 32-bit word size when oversampling is enabled, but so far,
oversampling is only implemented when using SPI offload and therefore
doesn't use this buffer.

AD4695_MAX_CHANNEL_SIZE macro is dropped since it no longer adds any
value.

AD4695_MAX_CHANNELS + 2 is changed to AD4695_MAX_CHANNELS + 1 because
previously we were overallocating. AD4695_MAX_CHANNELS is the number of
of voltage channels and + 1 is for the temperature channel.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 68c6625db0d75f4cade7cb029e94191118dbcaa0..0c633d43e480d5404074e9fa35f1d330b448f0a2 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -106,8 +106,6 @@
 
 /* Max number of voltage input channels. */
 #define AD4695_MAX_CHANNELS		16
-/* Max size of 1 raw sample in bytes. */
-#define AD4695_MAX_CHANNEL_SIZE		2
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -162,8 +160,8 @@ struct ad4695_state {
 	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	u8 buf[ALIGN((AD4695_MAX_CHANNELS + 2) * AD4695_MAX_CHANNEL_SIZE,
-		     sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	u16 buf[ALIGN((AD4695_MAX_CHANNELS + 1) * sizeof(u16),
+		      sizeof(s64)) + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;
@@ -660,9 +658,8 @@ static int ad4695_buffer_preenable(struct iio_dev *indio_dev)
 	iio_for_each_active_channel(indio_dev, bit) {
 		xfer = &st->buf_read_xfer[num_xfer];
 		xfer->bits_per_word = 16;
-		xfer->rx_buf = &st->buf[rx_buf_offset];
+		xfer->rx_buf = &st->buf[rx_buf_offset++];
 		xfer->len = 2;
-		rx_buf_offset += xfer->len;
 
 		if (bit == temp_chan_bit) {
 			temp_en = 1;

-- 
2.43.0

