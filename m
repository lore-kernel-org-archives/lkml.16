Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83371DE8BE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871854; cv=none; b=O9glw13QvylbKnsxjVF1ztf6ujTLPNfjQI3EKVzWxkVDMMubwASE75arNm/njKwo6FBxm2F6CZdDqb1R1bIvWsxHzlJFBrLT4cUj++qWi0nf1BMjv3ooTyHyddQnhz4ja08oGFbXRRTOgIwEbtRHCXPoeK5ZB+nU+kvPruNI8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871854; c=relaxed/simple;
	bh=nanWm12O8sWEDAW7A9yQbxbSGH+6NrUboS0jgt5GWKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKfMSKjv9vSWPDVUC7OQvdimdi+jtZKmAlFOQiKuLgHhjB1Lz3d3iJ4MLFVGwGMEy2D6L2hrl/2rauXiuMek7P29fkqcGeyK3j+L6ULayQqMETPxWu/FfPV5IH8iqW1bMX42ufsKysMzk6kSHVaRU6m4owNHwveraK5PfSrkCY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AlHZpYTz; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AlHZpYTz"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3fec2899574so3887214b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871852; x=1746476652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcGVfBKy10j7lIsh3ZFh6lbZwRCfi9c6uNEy2I7W1UA=;
        b=AlHZpYTzpGWsflq4qRtxQQ/J2KWDHXRfOItpE6q3u7lHmbXJgkEEf04vTZBX447jcB
         1aHDVj3IEyS/wnSF0QR49u/Yffhc9jvXKxo4AW8JiMxYJ/j0Fdtdi7OI4u9HNR867rJc
         jYZe4vmlquKq5RY3t+ZcfsgskuTU8SX5sqZztSd/mrZZx4Dp9+40oTqneyqBpBT8cJZb
         OuyOC161/6OmMCMfGvdtvLFYuMM1Ihz8Pz5PZGniY8/jYS9mjMTd9hRhDGQ4Oh+xPf+/
         IILVMvcJHbmySjeYBCzPk+BNyU+w/Gkzr+A33EHLEEhKNvq2pbIixFRqMkN3Xqh0QBEo
         V8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871852; x=1746476652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcGVfBKy10j7lIsh3ZFh6lbZwRCfi9c6uNEy2I7W1UA=;
        b=aGkwUSGi21M5Vlyhk4fJOS4FIDwtsrru9Ouco+/3jdvJPD9mv49FXWlBMU7YkmNNIm
         8EpOvp4hidoZ5mGoEUtOMuqqiA6pU69C1LxS41uMg6Eu/+m7fzBIKu/7us4IWHbSLxgU
         3n+VlQGWRcyFCHgZxQacoRHY2ViwFxxW37AYKn0Fyvdq/iFZWNmL/vEa703GeiJv7FZe
         2fyPODiLpDcBJ0FpEGlOrlhNBgGbvMnA9828CFcuZDNs/ka2c7OeFcWrSfjBr1FayC7X
         JgaPFNiojtC2Mi4O2suoTwsaAfJskcRxGJZF0TPsti/Bhbl1Mn58qliwm9Xwm+y9ppg4
         iWDA==
X-Forwarded-Encrypted: i=1; AJvYcCVPjlQ0EJ/jK8KEY3cNuwqU/z4To2AVo+oCy92/VP/oNSa1X3EyP3Q5IEb9WbKh/aoaKHGR8KlnLg2zuqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGbswlIv8vnPSBr9d1CIchqKL4DJQ9ZFRX+mfzefzvne1VGZ7/
	RlkAeHQ2/hwqWfrfjQPieLClegndoBdmHaMvejeqm0LUdP7U0q32OIVHqZE1ks8=
X-Gm-Gg: ASbGnctENHQUIHPYfcrD5Zscm6ofsDCC/Xt3tOpYManXFpwDZCjaLYPTD+xdQm4XFz4
	7vYI2wGNiC+A1n5YCDBeAwEqD2P4y2lO0INg2h8hfFXhxwIF6Vrrc5+SwyoC0073A0RxhCX+pka
	D6uEt+p8eOADQ4Q46EyCxuDgleNUEiDfHYCJ/6ZuOVv9jbJoDKna/M0kGuVjAsViAPE8MLtgexI
	eEybAVAhmhiivAxSM7TzcTpOcfMWqVubygqzTkQvgeH+1Am02Z0IJGY40eziTn9ZeZSJhENS/8+
	cZOFKcjfeKH0tmOJnebE3ujghlqC9ZukhrqYIVHK5znIQFk=
X-Google-Smtp-Source: AGHT+IEb+KKxDX5mBvLXoNVemqhE3XcX7CF3Y6nuncxEYl228EfBM3oiBSyxB3e3mBnNUjlF+VK9ZA==
X-Received: by 2002:a05:6808:1649:b0:3f9:c0f6:2163 with SMTP id 5614622812f47-40211563838mr157747b6e.12.1745871851251;
        Mon, 28 Apr 2025 13:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:06 -0500
Subject: [PATCH v4 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nanWm12O8sWEDAW7A9yQbxbSGH+6NrUboS0jgt5GWKA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+PFy0bVmPGBbjG6xCEDLcT/qRJBTQFi0pLJm
 ThYX0Otc9iJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jxQAKCRDCzCAB/wGP
 wNKJB/9Vu1Hc/echPMZS5/e8T2LKm5suaZENLfRduq8jeTJvcZFBSsRBKspHIEWX8Ym9s+sT5M+
 L8HvpP4kDkzsdAuuyIituDXw6GUBw3yVBo2hFjMg3HyWSmw1XqGfF0RxBYNH2s479Q4FO4myQlI
 jIuupvmNum/EB7umVxyFyiL7MbGJjQfSkNt31O4lKqo5fmpuuNyqGkFj5OcdBw7x8KFLAOe5IEz
 inhZgvoB4krefxIHtMDvXiqJHy9V/U7FDW9E7lFs1+PEGCNXetM8bzc/JwXfU0MBmlUPSlL6nih
 hiDeS3XeNJaxEjX9lrUXiYfu8AqdntMb5hO+ixArISTEiHGi
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
point of confusion that this macro is only the voltage input channels
and not all channels.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 992abf6c63b51dee222caf624e172455fb9b9900..cda419638d9a88debb3501d05a513b17a4ecde95 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -105,7 +105,7 @@
 #define AD4695_REG_ACCESS_SCLK_HZ	(10 * MEGA)
 
 /* Max number of voltage input channels. */
-#define AD4695_MAX_CHANNELS		16
+#define AD4695_MAX_VIN_CHANNELS		16
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -143,8 +143,8 @@ struct ad4695_state {
 	/* offload also requires separate gpio to manually control CNV */
 	struct gpio_desc *cnv_gpio;
 	/* voltages channels plus temperature and timestamp */
-	struct iio_chan_spec iio_chan[AD4695_MAX_CHANNELS + 2];
-	struct ad4695_channel_config channels_cfg[AD4695_MAX_CHANNELS];
+	struct iio_chan_spec iio_chan[AD4695_MAX_VIN_CHANNELS + 2];
+	struct ad4695_channel_config channels_cfg[AD4695_MAX_VIN_CHANNELS];
 	const struct ad4695_chip_info *chip_info;
 	int sample_freq_range[3];
 	/* Reference voltage. */
@@ -157,10 +157,10 @@ struct ad4695_state {
 	 * to control CS and add a delay between the last SCLK and next
 	 * CNV rising edges.
 	 */
-	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
+	struct spi_transfer buf_read_xfer[AD4695_MAX_VIN_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_VIN_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0

