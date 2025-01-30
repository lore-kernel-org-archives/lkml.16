Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5571DF960
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235338; cv=none; b=ot+ZEMrM4CfJoEv5MG/eCy9fCwAT7unz8TSiGxJE7QGehb+iXJ/6ebd1/0VkHT81WJf9CZUoDttk+A02Uy4riuTjYZ8riWpoDtLk8aWFbEKJ0bQopYcQb1RCI0VB99Yzi6dhdlF6beQ8ej6wcSgB9F/36OGAzjtcVRvsgyjVBqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235338; c=relaxed/simple;
	bh=SRXFxvtaomd7dncfECqCKnYuxcpzErN8efr+LwBJBWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDtPdkkCDgHvsvcc/2fntW+h73sZRs2Q/srHFh4b6dw4jtp3RdQqhc8/1NhehrmXdPHws4F9xxc47yb31yE7ZKkD3WAV7zJjAkuX9MxL8PSKr8AC9U92El5s12Gcsxzo5lZcnLjOstQHkufAkC1M6xccWu9pHqKCsz+gtEVhPp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1HlglLDK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1HlglLDK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38be3bfb045so1265077f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738235333; x=1738840133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UayGYi9vbQCj4e06kROwvC20GIlvXwKmVBbFVZIFCJQ=;
        b=1HlglLDKDPfZmXcebFXfd+lamLzuur1Hciyhkl9BsRo8HNAMfGpoM7btO+MxYgQn7S
         j2E8MfAnwWS2ujlmlItMLG4aT1i5FudGsAAlHaxRq/4ovmBQltiEF8mMc5UF/yzBu5z7
         lN2164tgZaV4XuxzDW4z8H0+UsYGESz2prYlLzbRsEfjEHfSRa93ghQC1Fe4ZrVqLweZ
         JGbHRUIL5Tv2V02I744xf/CuKy29JSPnWm2pTDzD0H3/ECQcoecz1XYxBj/jeuF+kSKb
         2rnu3yBdiEgJ8wnkq8nSqkA2vIMOSaPv4Y1tusN8jq9f/tauZckOESNyadhb7+tMFiJw
         XIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235333; x=1738840133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UayGYi9vbQCj4e06kROwvC20GIlvXwKmVBbFVZIFCJQ=;
        b=LNBkSyJhFTJFNRVAnc4qvZedsyFTb6EOiNEgleDpUyJNaDwpRivPMnQ31O+buBt4yX
         1Pl+tww9W7NHmtU6bF2QC8rBP0x263FviNIRf4HV2OjWIF74R/wgWGsuPD01lzM+sZ1+
         ucWnPbjyjIkGLxrvwLGOqEgOaTLOjwXgAFApEWODllbYoAj4Ls1J8paho8Df0zaHaBTB
         z5m8doFNbOhrPjz/RMNiEoDx0ninL0zoBjz8TvfBi1nr9OVa4bpf0Rx1U44x/xYye4T6
         D+q2kEBtLRfk7LZnaq46SaZqDECya5FLttwwszz0yuJWZtkMjbJrC/15OPXbShL6Eexe
         A5xw==
X-Forwarded-Encrypted: i=1; AJvYcCXF9e+ND25q4zbbQC8YIAMV1Ns2Gff1TO0166LW/FT85XNwE2RQbnBEIm1Xx85YKp2GoLeLsXWW8AjjjzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdJTzRWAfh1nSyjiM9Af5Bg2WtN7E2c7D09Stk6Vhp65IXYvA
	YzlP0RRHb9t7givMCeICHZ+wwKbZmdTKAhnCXFD8iVC3VO9k8on/oGmrA5zwTq0=
X-Gm-Gg: ASbGncuGgz4qbo3eulIt6xxTonh8CUZLRIRXHdmu9fMdXPpe0ozHUZK314xj6Ppwn4o
	7JT5E+DskAiDno99GJyzLIs5p+UkZkKi5gX3m18TB69Z2l9YscmXSa+nPBnmalM8a8xaPPXy4Ds
	wnycdokItX1bOPX2AJHLqHiDWBx9bZTNJgFZwRG2QWAsf1rxc0xA6IBajKwijxmVfKMPA3M6uqW
	jCwQK/mM2Qi9ie1L0iDpcGt/U92qyqdC2oElIInmDOJ0AaSL+vR6hy7+TciwJsAuxPnje2fna2T
	2liCJDOOWoEOd56N
X-Google-Smtp-Source: AGHT+IGMXy0Vlqp3I6Y4A/IetFnHXnW6LN3wV1XhbgQiMOsQ3bzN7Xk+rfgP1eUkOVdTjuMdYFFkMA==
X-Received: by 2002:a5d:6d0d:0:b0:38a:6183:77b9 with SMTP id ffacd0b85a97d-38c5a95722cmr2521220f8f.6.1738235332944;
        Thu, 30 Jan 2025 03:08:52 -0800 (PST)
Received: from [127.0.0.1] ([2a01:e0a:448:76e0:2c72:cd2d:79b2:82ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bb2sm1689225f8f.34.2025.01.30.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 03:08:52 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Thu, 30 Jan 2025 12:08:29 +0100
Subject: [PATCH v3 5/6] iio: adc: ad4030: add support for ad4632-16 and
 ad4632-24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-eblanc-ad4630_v1-v3-5-052e8c2d897d@baylibre.com>
References: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
In-Reply-To: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Esteban Blanc <eblanc@baylibre.com>
X-Mailer: b4 0.14.2

AD4632-24 and AD4632-16 are 2 channels ADCs. Both channels are
interleaved bit per bit on SDO line.

Both of them do not have evaluation board. As such, the support added
here can't be tested. Support is provided as best effort until someone get
their hands on one.

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 drivers/iio/adc/ad4030.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 45d99152d84aeb878c7554edfdc32d3a1295e9c4..753051edbf96e3532d3178726c1cd159263d7355 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -35,6 +35,8 @@
 #define     AD4030_REG_CHIP_GRADE_AD4030_24_GRADE	0x10
 #define     AD4030_REG_CHIP_GRADE_AD4630_16_GRADE	0x03
 #define     AD4030_REG_CHIP_GRADE_AD4630_24_GRADE	0x00
+#define     AD4030_REG_CHIP_GRADE_AD4632_16_GRADE	0x05
+#define     AD4030_REG_CHIP_GRADE_AD4632_24_GRADE	0x02
 #define     AD4030_REG_CHIP_GRADE_MASK_CHIP_GRADE	GENMASK(7, 3)
 #define AD4030_REG_SCRATCH_PAD			0x0A
 #define AD4030_REG_SPI_REVISION			0x0B
@@ -108,6 +110,9 @@
 #define AD4030_TCYC_NS			500
 #define AD4030_TCYC_ADJUSTED_NS		(AD4030_TCYC_NS - AD4030_TCNVL_NS)
 #define AD4030_TRESET_PW_NS		50
+#define AD4632_TCYC_NS			2000
+#define AD4632_TCYC_ADJUSTED_NS		(AD4632_TCYC_NS - AD4030_TCNVL_NS)
+#define AD4030_TRESET_COM_DELAY_MS	750
 
 enum ad4030_out_mode {
 	AD4030_OUT_DATA_MD_DIFF,
@@ -1169,10 +1174,44 @@ static const struct ad4030_chip_info ad4630_24_chip_info = {
 	.tcyc_ns = AD4030_TCYC_ADJUSTED_NS,
 };
 
+static const struct ad4030_chip_info ad4632_16_chip_info = {
+	.name = "ad4632-16",
+	.available_masks = ad4630_channel_masks,
+	.channels = {
+		AD4030_CHAN_DIFF(0, ad4030_16_scan_types),
+		AD4030_CHAN_DIFF(1, ad4030_16_scan_types),
+		AD4030_CHAN_CMO(2, 0),
+		AD4030_CHAN_CMO(3, 1),
+		IIO_CHAN_SOFT_TIMESTAMP(4),
+	},
+	.grade = AD4030_REG_CHIP_GRADE_AD4632_16_GRADE,
+	.precision_bits = 16,
+	.num_voltage_inputs = 2,
+	.tcyc_ns = AD4632_TCYC_ADJUSTED_NS,
+};
+
+static const struct ad4030_chip_info ad4632_24_chip_info = {
+	.name = "ad4632-24",
+	.available_masks = ad4630_channel_masks,
+	.channels = {
+		AD4030_CHAN_DIFF(0, ad4030_24_scan_types),
+		AD4030_CHAN_DIFF(1, ad4030_24_scan_types),
+		AD4030_CHAN_CMO(2, 0),
+		AD4030_CHAN_CMO(3, 1),
+		IIO_CHAN_SOFT_TIMESTAMP(4),
+	},
+	.grade = AD4030_REG_CHIP_GRADE_AD4632_24_GRADE,
+	.precision_bits = 24,
+	.num_voltage_inputs = 2,
+	.tcyc_ns = AD4632_TCYC_ADJUSTED_NS,
+};
+
 static const struct spi_device_id ad4030_id_table[] = {
 	{ "ad4030-24", (kernel_ulong_t)&ad4030_24_chip_info },
 	{ "ad4630-16", (kernel_ulong_t)&ad4630_16_chip_info },
 	{ "ad4630-24", (kernel_ulong_t)&ad4630_24_chip_info },
+	{ "ad4632-16", (kernel_ulong_t)&ad4632_16_chip_info },
+	{ "ad4632-24", (kernel_ulong_t)&ad4632_24_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ad4030_id_table);
@@ -1181,6 +1220,8 @@ static const struct of_device_id ad4030_of_match[] = {
 	{ .compatible = "adi,ad4030-24", .data = &ad4030_24_chip_info },
 	{ .compatible = "adi,ad4630-16", .data = &ad4630_16_chip_info },
 	{ .compatible = "adi,ad4630-24", .data = &ad4630_24_chip_info },
+	{ .compatible = "adi,ad4632-16", .data = &ad4632_16_chip_info },
+	{ .compatible = "adi,ad4632-24", .data = &ad4632_24_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ad4030_of_match);

-- 
2.47.2

