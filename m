Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E129C35A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749892525; cv=none; b=qO0gmL4h33eCMDmPTGRvblrQcX1uRgCnV9D328/7kEoI+6t1oN0I/jfhLkR2Z5LqeP0zUrRUbYQ0UsDrdWg9QliZpk7XyjcoQsH97KqfSa+rbCucxnooBpWvIiajyA+RMPPaSF0KZ8E20DOErA3fV3NPtrxT7MhW98JT7Px6Ebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749892525; c=relaxed/simple;
	bh=N4PxgLq1UklLd2+7SOZmDIsLnd1oB+1AiA0Eie3Ykko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l31AKUJywVpx7Tdq4UvGJGjJD6u/mWq59c+0EpYL3OtHRC4BugU2pS6l2cgp5d4dUMaeb76dAyOnyM06GdT6wlnf/dGaCg06SKa+UA8wHZrCulDzifZrNju1C4Tdu6kJJeH4S2z053CfIfK19S59R+iJmUm5UapmuD/mHMTOQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m0kfqJ80; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m0kfqJ80"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c3d06de3so3634583b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749892522; x=1750497322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HScxk4eBpHQPzOs90Ehfo4I0XVUQ6OClHqZVBAZwOo=;
        b=m0kfqJ80dtk8QVKM3onukw3dWMrfaRr/H9T5wnIF7JIorm8UJjK3ijweznNiKr0UXF
         bZG8UCKqcKkZ3R5Y2LN/T8jmc1AYu41JfL1tJEEJtzRShcN7w/UVZX/tZ04qInal/CpD
         nSKofhg6lJ5t48T8w4w5hn5avDrCHZ3Z6z/gvTfSTl0QrClUY5povLglHHq8rFGVBnwV
         E8uoQd0jT5+Wrj7bpQjmsFWY/gGjMcpptzW2zqm8gKzgbu6g+WgbV/N7kCvTYhn+WN+Y
         cQZF3jP/tLmPQ4ZWm4IJdY3CDTo5xxFhi1bbmKq70LWNOQAeBlEDZ0FT+kMWYFJ3lwr8
         5hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749892522; x=1750497322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HScxk4eBpHQPzOs90Ehfo4I0XVUQ6OClHqZVBAZwOo=;
        b=SCpAc8PrNy1R0d9sUUju+OA+BDhsSO3PVuE/dLiyBrQpIzJ7O+T5KhndNlQ69ngd6j
         lZZkWCe1/k5O/cqQO9pE+oN6/VylCsZijNQuCpaZX4hHIbWINu++7K4fhU8UxC12Pm+J
         TLAT6Ak/P89hxlZ+oD4+Qx4H/UcUDOdLvHvzBvPQIJFxnuwtVLLuA6mv4rVqyccmoBVu
         WkLvtwqPoPYXsibGqTmAekhV1DJWjBxOlBsPpXbCUaR5aV3E9YWqMlKWf1p9ML6/cxyz
         LlLaOQqvgXtzXU1dR5k28zKLBc7sswW/kVDE0uhZTTjqesOLS7dBVk0Opt6TazQT7olB
         eVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV6zbfhLRQuYFiJJ+QZthSBDYMSlHAaI3JVxxTqELJUdEjBDd9Oxivryy7t48zJsyGnmKuixJWX1rQBnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFH/wkbkf1w8He/Qb4pOL+r7Pw2eJwvkMs28hQSO+5dhs3/62P
	zhTQMTwh1s4UnZ2xp4/Ak5oYEOzX4E2xTTS5Uq9rLyiSgOAS6Mq0mGkoUiyzaDFaILg=
X-Gm-Gg: ASbGncv9QiHuQivBZNeHgeaMepQYjqToJPy5kxbF021gmBNy7WXnZrxX3DIiX2Ojd1F
	poPS/NtPAEGMS+KHlsafTLstWZsV5+b+c7TpUmjt4ehLFE8BCRAfobMpp2GFav4EnSGvtOI0GFY
	9Cgne3yeN/HHBOoNgZ7TtZ63K2m1jKVHq1HEemDrTVAaYfispA+T8rOABbNWL7qUOHUW7iTvk5x
	rjlNWayhtL/a44G1iPck3EXl2JpuwAKSobgrAe/jZ9ONJ0LN9yP6BbrAV4+tjXikHjnSfXPpriV
	OHkwIxNu58btJx6r9zqapXYvtDMlRWijyqUoE+/UiRv8biJTltzQ8Uhvo8ShVStl68rZKkD465Y
	liHh5M0kHqdfdMoGptzlZiuW1
X-Google-Smtp-Source: AGHT+IEm6lgpZHziSIdJ4n5wNGcJaqJw7y5etk9WL4ieNyaXhP0N/zAXYxeAOOLogkH7017UfuUs7A==
X-Received: by 2002:a05:6a00:2186:b0:748:33f3:8da8 with SMTP id d2e1a72fcca58-7489cfc2976mr2558157b3a.5.1749892522235;
        Sat, 14 Jun 2025 02:15:22 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeca93sm2969630b3a.20.2025.06.14.02.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:15:21 -0700 (PDT)
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
Subject: [PATCH v4 4/5] iio: adc: ti-adc128s052: Add lower resolution devices support
Date: Sat, 14 Jun 2025 02:15:03 -0700
Message-Id: <20250614091504.575685-5-sbellary@baylibre.com>
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

The adcxx communicates with a host processor via an SPI/Microwire Bus
interface. The device family responds with 12-bit data, of which the LSB bits
are transmitted by the lower resolution devices as 0.
The unavailable bits are 0 in LSB.
Shift is calculated per resolution and used in scaling and raw data read.

Lets reuse the driver to support the family of devices with name
ADC<bb><c>S<sss>, where
* bb is the resolution in number of bits (8, 10, 12)
* c is the number of channels (1, 2, 4, 8)
* sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS
and 101 for 1 MSPS)

Complete datasheets are available at TI's website here:
https://www.ti.com/lit/ds/symlink/adc<bb><c>s<sss>.pdf

Tested only with ti-adc102s051 on BegalePlay SBC.
https://www.beagleboard.org/boards/beagleplay

Co-developed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 drivers/iio/adc/ti-adc128s052.c | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
index fbf15c83c127..b515ed0bb1d5 100644
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@ -7,6 +7,21 @@
  * https://www.ti.com/lit/ds/symlink/adc128s052.pdf
  * https://www.ti.com/lit/ds/symlink/adc122s021.pdf
  * https://www.ti.com/lit/ds/symlink/adc124s021.pdf
+ *
+ * The adcxx4s communicates with a host processor via an SPI/Microwire Bus
+ * interface. This driver supports the whole family of devices with a name
+ * ADC<bb><c>S<sss>, where
+ * bb is the resolution in number of bits (8, 10, 12)
+ * c is the number of channels (1, 2, 4, 8)
+ * sss is the maximum conversion speed (021 for 200 kSPS, 051 for 500 kSPS and
+ * 101 for 1 MSPS)
+ *
+ * Complete datasheets are available at TI's website here:
+ * https://www.ti.com/lit/ds/symlink/adc<bb><c>s<sss>.pdf
+ *
+ * 8, 10, and 12 bits converters send 12-bit data with unavailable bits set to
+ * 0 in LSB.
+ * Shift is calculated per resolution and used in scaling and raw data read.
  */
 
 #include <linux/cleanup.h>
@@ -110,8 +125,20 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
 		},							\
 	}
 
+#define ADC082_VOLTAGE_CHANNEL(num) _ADC128_VOLTAGE_CHANNEL(num, 8)
+#define ADC102_VOLTAGE_CHANNEL(num) _ADC128_VOLTAGE_CHANNEL(num, 10)
 #define ADC128_VOLTAGE_CHANNEL(num) _ADC128_VOLTAGE_CHANNEL(num, 12)
 
+static const struct iio_chan_spec adc082s021_channels[] = {
+	ADC082_VOLTAGE_CHANNEL(0),
+	ADC082_VOLTAGE_CHANNEL(1),
+};
+
+static const struct iio_chan_spec adc102s021_channels[] = {
+	ADC102_VOLTAGE_CHANNEL(0),
+	ADC102_VOLTAGE_CHANNEL(1),
+};
+
 static const struct iio_chan_spec adc122s021_channels[] = {
 	ADC128_VOLTAGE_CHANNEL(0),
 	ADC128_VOLTAGE_CHANNEL(1),
@@ -137,6 +164,18 @@ static const struct iio_chan_spec adc128s052_channels[] = {
 
 static const char * const bd79104_regulators[] = { "iovdd" };
 
+static const struct adc128_configuration adc082s021_config = {
+	.channels = adc082s021_channels,
+	.num_channels = ARRAY_SIZE(adc082s021_channels),
+	.refname = "vref",
+};
+
+static const struct adc128_configuration adc102s021_config = {
+	.channels = adc102s021_channels,
+	.num_channels = ARRAY_SIZE(adc102s021_channels),
+	.refname = "vref",
+};
+
 static const struct adc128_configuration adc122s021_config = {
 	.channels = adc122s021_channels,
 	.num_channels = ARRAY_SIZE(adc122s021_channels),
@@ -217,6 +256,12 @@ static int adc128_probe(struct spi_device *spi)
 
 static const struct of_device_id adc128_of_match[] = {
 	{ .compatible = "rohm,bd79104",  .data = &bd79104_config    },
+	{ .compatible = "ti,adc082s021", .data = &adc082s021_config },
+	{ .compatible = "ti,adc082s051", .data = &adc082s021_config },
+	{ .compatible = "ti,adc082s101", .data = &adc082s021_config },
+	{ .compatible = "ti,adc102s021", .data = &adc102s021_config },
+	{ .compatible = "ti,adc102s051", .data = &adc102s021_config },
+	{ .compatible = "ti,adc102s101", .data = &adc102s021_config },
 	{ .compatible = "ti,adc122s021", .data = &adc122s021_config },
 	{ .compatible = "ti,adc122s051", .data = &adc122s021_config },
 	{ .compatible = "ti,adc122s101", .data = &adc122s021_config },
@@ -229,6 +274,12 @@ static const struct of_device_id adc128_of_match[] = {
 MODULE_DEVICE_TABLE(of, adc128_of_match);
 
 static const struct spi_device_id adc128_id[] = {
+	{ "adc082s021", (kernel_ulong_t)&adc082s021_config },
+	{ "adc082s051", (kernel_ulong_t)&adc082s021_config },
+	{ "adc082s101", (kernel_ulong_t)&adc082s021_config },
+	{ "adc102s021", (kernel_ulong_t)&adc102s021_config },
+	{ "adc102s051", (kernel_ulong_t)&adc102s021_config },
+	{ "adc102s101", (kernel_ulong_t)&adc102s021_config },
 	{ "adc122s021",	(kernel_ulong_t)&adc122s021_config },
 	{ "adc122s051",	(kernel_ulong_t)&adc122s021_config },
 	{ "adc122s101",	(kernel_ulong_t)&adc122s021_config },
-- 
2.34.1

