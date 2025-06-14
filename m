Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA2298994
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749892522; cv=none; b=RYvOKHLhJVHqGGnC5RnaA0fml+/GnNT4JTyRhgaYIvSCssPkILRCmClJUEVx/6+H1S4qHmCUQSB6Qg8d26RNxKsD9vOLX7amypM5xDkNwUwwVoFhIO7Jg4u7DfZNi21sYcmUAjpdM6eYQqhKKRUszhIraKMG9bR8ORvmED84L/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749892522; c=relaxed/simple;
	bh=6CStx4GM+Y3xRsxoA6en/6NoY4ToN/JCjja/wXmo/io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nEntYoH3r6YI07IEtZNmO5A4l9Q3/kow6SXeZEiya9922+twX8tm3NoekAzW4jWrD6UV81psao3m5TqL8yHnkDiZ3stBfNQ6Q1aoeSPrqHYn3lRJAJFj0pPWbJnLlYUM0OQfp9dmwq+ZjQt+Sjwud78HTYn5aTsWSlSrr+sfI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=l8N2z5fw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="l8N2z5fw"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7426c44e014so2420005b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749892519; x=1750497319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruL1mkmUl73CN9P+D9bFSJBj+1HrTlzxAkeWKwt6bdE=;
        b=l8N2z5fwe/thyOhnJXQOBjGZHogb54jbGjRVmJw66OLnf4Nguo+Pnm2Q8eeQN/kYr9
         MxKxqL8dsnpLfaTKPC4yKOKGlFipxh/5YzSIRyKrNkXCAhRrQ4XFa0m+8nO+y5r1/2gk
         Yc9jpuXklHb1I7788xDiz/wqEfxCuqUPL7EL/APZX0JOEb8HI/CyAhvc9xz4ZdK3qRuV
         gjTtr0Cnx2xr1Mj2c0fRLlkImhhK4esfSMlTB1GMT8kuUw4Vv8yMiCHQc8TF2qZLpOGC
         Dzo7rllO63mGnv4doIewWBXeXK1UV1R5XNT3VMACXoPVm9WnxpaX1bnplVXp6CpvCIJy
         dJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749892519; x=1750497319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruL1mkmUl73CN9P+D9bFSJBj+1HrTlzxAkeWKwt6bdE=;
        b=DLwYgAitpkNYijH4qD4yig/XIp43eeb/7X1dKRAlGebCKZ3xvhKQhd4JTENfp9BlAO
         ijE0uHaqRP6QdPkXw/m0z++uZ/YFnAtk08INsVPLBsnU/NONpyhmUiN3dgP7Wgq6zrhM
         ZwdBSys0+I/R7bjY+O1GNBtE4dzDKSicOMLCF9p0voxAmkIWbf1u32Um6/cCnBUadxQH
         Ze6acZ1WAja66S7Qb1hQicRic1EypDPAC4bU/ZuWi7xVwe6mLpCwMT8ZIGPRUPTgfG9s
         akbCefYq2cDbUWZ6+XmyIUMFeJ4tCFRrn93LZhKYyGQU/z01TepWqFIRd/nAqt+u2VOz
         dFMw==
X-Forwarded-Encrypted: i=1; AJvYcCUJcflXdOBwh44/i06jXHqsMqHbiMw2oi5MVBMvGo0VcHw8/jIuBn9BtczTbkFGX2bhHHGCqv4YQAVv1KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAPulq95fg1RdGYztAAFMhOfuZkTg155C1Bl4Pf5Yxsd3q5mZ
	1inYirq8iN0TT1ISWFn9Q5uc/HYpbdcBdtOUJsOyws5Q7lgzqjFGGyKdQGmjzVkzHWs=
X-Gm-Gg: ASbGnct9sdMdsqt9j6pcDXVjb1ZnxUHDNeOuyImHSctS4q1Nx+zCorVRADFg801lIw7
	1ynbjrSmaSOCOjIh0XE0ruNelM6TQJXMQLueAp8TffzTUGt+2P9R7MqYXGfMF9Ikl65bFLwWUIf
	F26s1wWl4Au+O60lJ03ygVgL3mPjCepjj1iklOPSrjWjQFv3i7sz3PMEdTDO8vqyQnlNmvQ1nOW
	7jMke6jyfviINdW+L60368LfLIPIf3lcqSWG4qlT9Yue96kGBtMffXSLgGBqRF1SWyXJZ4C1CmO
	0KUZOGVzdaO834gxqyS59CNLvmWoBCGpU6FDrnL7lkf9baW2ujkzUS2SJedeeai3PfjBOdW9/f1
	qN5XhBYF00jcJlie15oobXD34
X-Google-Smtp-Source: AGHT+IHSee8KOn59ddbeorITEpHraU3p7NzYaHpJvhmIe0t3qhX7CI8PLz19NGTzc6rsINk8EjOJAw==
X-Received: by 2002:a05:6a00:3c8f:b0:746:2c7f:b271 with SMTP id d2e1a72fcca58-7489ce0d374mr2695253b3a.9.1749892519104;
        Sat, 14 Jun 2025 02:15:19 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeca93sm2969630b3a.20.2025.06.14.02.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:15:18 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] iio: adc: ti-adc128s052: Use shift and realbits
Date: Sat, 14 Jun 2025 02:15:01 -0700
Message-Id: <20250614091504.575685-3-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614091504.575685-1-sbellary@baylibre.com>
References: <20250614091504.575685-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adcxx communicates with a host processor via an SPI/Microwire Bus
interface. The device family responds with 12-bit data, of which the LSB bits
are transmitted by the lower resolution devices as 0. The unavailable bits are
0 in LSB. Shift is calculated per resolution and used in scaling and raw data
read.

Create a separate structure for each device type instead of an array.
These changes help to reuse the driver to support the family of devices with
name ADC<bb><c>S<sss>, where
* bb is the resolution in number of bits (8, 10, 12)
* c is the number of channels (1, 2, 4, 8)
* sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
and 101 for 1 MSPS)

Complete datasheets are available at TI's website here:
https://www.ti.com/lit/ds/symlink/adc<bb><c>s<sss>.pdf

Co-developed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 drivers/iio/adc/ti-adc128s052.c | 115 ++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 49 deletions(-)

diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
index 1b46a8155803..2b206745e53d 100644
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@ -41,13 +41,14 @@ struct adc128 {
 	} __aligned(IIO_DMA_MINALIGN);
 };
 
-static int adc128_adc_conversion(struct adc128 *adc, u8 channel)
+static int adc128_adc_conversion(struct adc128 *adc,
+				 struct iio_chan_spec const *channel)
 {
 	int ret;
 
 	guard(mutex)(&adc->lock);
 
-	adc->buffer[0] = channel << 3;
+	adc->buffer[0] = channel->channel << 3;
 	adc->buffer[1] = 0;
 
 	ret = spi_write(adc->spi, &adc->buffer, sizeof(adc->buffer));
@@ -58,7 +59,10 @@ static int adc128_adc_conversion(struct adc128 *adc, u8 channel)
 	if (ret < 0)
 		return ret;
 
-	return be16_to_cpu(adc->buffer16) & 0xFFF;
+	ret = (be16_to_cpu(adc->buffer16) >> channel->scan_type.shift) &
+	       GENMASK(channel->scan_type.realbits - 1, 0);
+
+	return ret;
 }
 
 static int adc128_read_raw(struct iio_dev *indio_dev,
@@ -71,7 +75,7 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 
-		ret = adc128_adc_conversion(adc, channel->channel);
+		ret = adc128_adc_conversion(adc, channel);
 		if (ret < 0)
 			return ret;
 
@@ -81,7 +85,7 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_SCALE:
 
 		*val = adc->vref_mv;
-		*val2 = 12;
+		*val2 = channel->scan_type.realbits;
 		return IIO_VAL_FRACTIONAL_LOG2;
 
 	default:
@@ -90,15 +94,24 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
 
 }
 
-#define ADC128_VOLTAGE_CHANNEL(num)	\
-	{ \
-		.type = IIO_VOLTAGE, \
-		.indexed = 1, \
-		.channel = (num), \
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
-		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) \
+#define _ADC128_VOLTAGE_CHANNEL(num, real_bits)				\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = (num),					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.scan_index = (num),					\
+		.scan_type = {						\
+			.sign = 'u',					\
+			.realbits = (real_bits),			\
+			.storagebits = 16,				\
+			.shift = (12 - real_bits),			\
+		},							\
 	}
 
+#define ADC128_VOLTAGE_CHANNEL(num) _ADC128_VOLTAGE_CHANNEL(num, 12)
+
 static const struct iio_chan_spec adc128s052_channels[] = {
 	ADC128_VOLTAGE_CHANNEL(0),
 	ADC128_VOLTAGE_CHANNEL(1),
@@ -124,26 +137,30 @@ static const struct iio_chan_spec adc124s021_channels[] = {
 
 static const char * const bd79104_regulators[] = { "iovdd" };
 
-static const struct adc128_configuration adc128_config[] = {
-	{
-		.channels = adc128s052_channels,
-		.num_channels = ARRAY_SIZE(adc128s052_channels),
-		.refname = "vref",
-	}, {
-		.channels = adc122s021_channels,
-		.num_channels = ARRAY_SIZE(adc122s021_channels),
-		.refname = "vref",
-	}, {
-		.channels = adc124s021_channels,
-		.num_channels = ARRAY_SIZE(adc124s021_channels),
-		.refname = "vref",
-	}, {
-		.channels = adc128s052_channels,
-		.num_channels = ARRAY_SIZE(adc128s052_channels),
-		.refname = "vdd",
-		.other_regulators = &bd79104_regulators,
-		.num_other_regulators = 1,
-	},
+static const struct adc128_configuration adc122s021_config = {
+	.channels = adc122s021_channels,
+	.num_channels = ARRAY_SIZE(adc122s021_channels),
+	.refname = "vref",
+};
+
+static const struct adc128_configuration adc124s021_config = {
+	.channels = adc124s021_channels,
+	.num_channels = ARRAY_SIZE(adc124s021_channels),
+	.refname = "vref",
+};
+
+static const struct adc128_configuration adc128s052_config = {
+	.channels = adc128s052_channels,
+	.num_channels = ARRAY_SIZE(adc128s052_channels),
+	.refname = "vref",
+};
+
+static const struct adc128_configuration bd79104_config = {
+	.channels = adc128s052_channels,
+	.num_channels = ARRAY_SIZE(adc128s052_channels),
+	.refname = "vdd",
+	.other_regulators = &bd79104_regulators,
+	.num_other_regulators = 1,
 };
 
 static const struct iio_info adc128_info = {
@@ -199,33 +216,33 @@ static int adc128_probe(struct spi_device *spi)
 }
 
 static const struct of_device_id adc128_of_match[] = {
-	{ .compatible = "ti,adc128s052", .data = &adc128_config[0] },
-	{ .compatible = "ti,adc122s021", .data = &adc128_config[1] },
-	{ .compatible = "ti,adc122s051", .data = &adc128_config[1] },
-	{ .compatible = "ti,adc122s101", .data = &adc128_config[1] },
-	{ .compatible = "ti,adc124s021", .data = &adc128_config[2] },
-	{ .compatible = "ti,adc124s051", .data = &adc128_config[2] },
-	{ .compatible = "ti,adc124s101", .data = &adc128_config[2] },
-	{ .compatible = "rohm,bd79104", .data = &adc128_config[3] },
+	{ .compatible = "ti,adc128s052", .data = &adc128s052_config },
+	{ .compatible = "ti,adc122s021", .data = &adc122s021_config },
+	{ .compatible = "ti,adc122s051", .data = &adc122s021_config },
+	{ .compatible = "ti,adc122s101", .data = &adc122s021_config },
+	{ .compatible = "ti,adc124s021", .data = &adc124s021_config },
+	{ .compatible = "ti,adc124s051", .data = &adc124s021_config },
+	{ .compatible = "ti,adc124s101", .data = &adc124s021_config },
+	{ .compatible = "rohm,bd79104",  .data = &bd79104_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adc128_of_match);
 
 static const struct spi_device_id adc128_id[] = {
-	{ "adc128s052", (kernel_ulong_t)&adc128_config[0] },
-	{ "adc122s021",	(kernel_ulong_t)&adc128_config[1] },
-	{ "adc122s051",	(kernel_ulong_t)&adc128_config[1] },
-	{ "adc122s101",	(kernel_ulong_t)&adc128_config[1] },
-	{ "adc124s021", (kernel_ulong_t)&adc128_config[2] },
-	{ "adc124s051", (kernel_ulong_t)&adc128_config[2] },
-	{ "adc124s101", (kernel_ulong_t)&adc128_config[2] },
-	{ "bd79104", (kernel_ulong_t)&adc128_config[3] },
+	{ "adc128s052", (kernel_ulong_t)&adc128s052_config },
+	{ "adc122s021",	(kernel_ulong_t)&adc122s021_config },
+	{ "adc122s051",	(kernel_ulong_t)&adc122s021_config },
+	{ "adc122s101",	(kernel_ulong_t)&adc122s021_config },
+	{ "adc124s021", (kernel_ulong_t)&adc124s021_config },
+	{ "adc124s051", (kernel_ulong_t)&adc124s021_config },
+	{ "adc124s101", (kernel_ulong_t)&adc124s021_config },
+	{ "bd79104",	(kernel_ulong_t)&bd79104_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, adc128_id);
 
 static const struct acpi_device_id adc128_acpi_match[] = {
-	{ "AANT1280", (kernel_ulong_t)&adc128_config[2] },
+	{ "AANT1280", (kernel_ulong_t)&adc124s021_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, adc128_acpi_match);
-- 
2.34.1

