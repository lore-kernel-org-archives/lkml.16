Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFD1DE881
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871850; cv=none; b=fQSoDChlCpFom3uVIBguiq88lm1BAHyaxUDq2OVNpsaeNZdMuh2zibODYKHL18Ic9AS6Akgwl15APdAyZHPjNfF18JcIrkNzhN/bqOd6HeOKcwCfduSIYs+i3FHExz2JK53BaRxzZsSL0xzesejt+bK7DqoHD3AuiMHlSmR5p2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871850; c=relaxed/simple;
	bh=NLK9rHWGxHgHc450e6JA3Kx5J3+N1Fpz21XOi57G4v0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYMqrgY1izVqiIRdFcFPi1vqi0Jp/4jTrTY6VBGQ9gnLQeCz7tgoY7YJKCmavaXkpAOuclzvOMZr4cHTDmFvjLhbxb267mL+7QOKULKn+cea22S6y6PlWQPRUBWwsVcqnminl4V8rV/yCwhUXxlmQmH2ttCQ8gVhMDPDV9kcQiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MSfGJ9Lu; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MSfGJ9Lu"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f8df49e75fso1164131b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871847; x=1746476647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=MSfGJ9LuVGkCaxiI29iFe/VNm8EdpC6WCQuqK+KjBRAswrD7UhGgyxuv5hyg/zUkLl
         o1sDJuJIy21DaI1VMQULOPOCdC9M0EpHHoPjU+ZmwGjo0kDc65Sph7YqKofaO8DgKi+E
         4sEqVStZUEl0h8P2cerK/I1acvei5OIeVkEVwB3SK9uNdiLM5I6Pf/g8rHRiMGtEbRa1
         Zhtg30KGLUEWRL9uCrg9FPIVz/KQnHiebuaKkujD08Q1kj8Kqv36AHvx2H6AZ6AbW6AZ
         AbCoqAyWDZy0tGtnMP6/3kfrVC7QaAP9bNpDq3aaNKguHIgk/51iLd66fPInLm+BiBEy
         jUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871847; x=1746476647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2koMhN4hR5KSSnBsIlIFgfxzAiKDp/j1dG+oyh3qTA=;
        b=IfIuC+Z+cfRXcQN4rzN1U8gq8iURa9rK0PtV5ZfyU+W1inru7FYao4WUme9jgrybM5
         SRslRkginpbuV7CmKDV0FpxoRkm86lXrOuP6x0s+Xi0jElRTnbA666JdLPdTS1/ZXbBU
         3382+59g3iuY+y8Vbs7pMiFQEkV44dVo9Br7fm/SrU9DEs4GtcyohV/2TZjNddvunXAO
         QgIwa+nV0n6LTrHCYuopwDK77kjFGsm6Ft8HzwbZTPxw3j9emlsn4hOE54MvbvmNyku/
         fgMOf5Cy6FwbhGS5Mz3B77Dcw3n9AHf/sBIM7P84wbR3l63sVlUN5CjcE5G8eAGE09y3
         q2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX139cJ99RE5QR12FeW+feAvP4BDgqzSLDxJmy3PI7nM0GdMJk3KlEoZ5ZrEOGHIK/TYn8b0u3mQjlJUzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RTCsPjZr4FwFi7UiaJ4PINrNkKKeGI8V4LbY3LqzAMttE8Oc
	U/1jO/NAJ89EQ70bSkGJ3jo19EfqqGzp/SVgRwIi7wvoAR4j/keJCIzrmFr17s8=
X-Gm-Gg: ASbGncv//cY2eXh6VhGUTYuOKqgehWPMnY3Ufw70roXEcXBhQGZUgfWGAUeqU7nYwx5
	Ymd0MWEi7scBejxwQN1t75WhUNru1W6tRzp1V+2j93ud+yeIBo382cfi5gr7QHhdavxlvJpEKrv
	MYKsiLbqEnj/tozNxszc7lCXwvAFQtd4s/pKpaQAPD78TFSYUNBW6U2q7B2BfoRMKO4RBKQ3i7A
	1UCYdarty+rVz+sKNsV+n4lx6q8m2Fxr9TAT+wf95pUNPjOIK1Oh9IosQ4ht0FlxlhFPQnxN5Ul
	CaTkqSiZpETUQblOPhBQU/OdTYDSQ5vGa6SzslN/rr/pFLA=
X-Google-Smtp-Source: AGHT+IE2t1mIKjTbfLOxxHnPGtF5EANZEhBUSNDmzIqx7nof0PYr33NBqzeXXAMHb0wVBbQ/ZHOTBg==
X-Received: by 2002:a05:6808:3386:b0:401:e7c0:62b7 with SMTP id 5614622812f47-401fd6e2ff3mr6007281b6e.1.1745871847483;
        Mon, 28 Apr 2025 13:24:07 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:04 -0500
Subject: [PATCH v4 2/7] iio: adc: ad4695: use u16 for buffer elements
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-2-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
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
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+O4WpNLbL3CYKCp+PPUsjmA9mnQKptP+x5eq
 ren3YBYwRWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/juAAKCRDCzCAB/wGP
 wAtvB/4vVUEBo0j0lHeSRNlDndrnUGlRw/RjDbtLEEZfSuKleOliq3a7xcyqLmSE8l85l1qeMND
 eLCSL522/2esSp4tE5jPHvqeLOokuWiy8HrX0U8V79et+AQSe4Q178E9j1qgV+HJ/kxSMtuxSZy
 DwXsfcULwYiB7aLCyGKdgDKkjXBmLGDVNLU+ooKF8xABky2jX+R8g1clxwuUKk1aWN8c5GZpUzc
 aD+jYlThFlC/yF5p9noGzD8oD+RfSYC0AlpuI2cUIJVQqei6XeDO6E8xMd3uIj1ouPdmohMu0JD
 5O45phj5sO9zskocZ99/2RyH1ZnmderDB//fPMXwIbcNufJP
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

