Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEE429ACC3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749892523; cv=none; b=i8Mcv0RpAare2+EA+1Xf5RuUat2uTW8n7HQxcc1JyRVagM+sTtBU4g2gPEX92HiodmWtlEEzMjZtCRqxt/UPu84K3BvbYq6yR9QSVXGYALvyN7wDYTQFCbw6i3FO+6UT4uHIltjVktit7NFmiapGf+SU8zPhGUfjbyzRW+vYT6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749892523; c=relaxed/simple;
	bh=SkKJiZJp2DM+9aH9ZqZNdByprM9DwlhGCimKeBh/YJM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c9Eu0qIf0oOjSHCSMdLWiBbPLwLqEoi4fnoN+JlUxoeh5iMc5hCJPeYeoVPdJsELHaHRXkfQuIpBQDLDG1m0RI7QdWDJG5kyYLq8fFdyJYPMRURU4llqihqWPHNUTqE+C+BTUHw8xc18jTXth362ZkfLwVgMyCH54lw/0fxrK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oVRF1O56; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oVRF1O56"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747ef5996edso2685501b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749892520; x=1750497320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXZGIEfZDDccmiTeVzsKZm7Nu0ZNmUD8yr1NHt0MQH4=;
        b=oVRF1O56K1Hh24zE0tAUjrbYdRihak45ulQ0eNeZ7215esE/cREXlrdDFkefle03iX
         hadQccbty4TO4aMeXIrh5G1iRe1225zNvcshpCYfkulqD1MhfW/IqkMTQbyB0H046TFN
         xjFd7o8siytp3fj7jXqT7k0ZH50W658D/KuXrTxmI799/YYWetvgUcQJG/oM/S54h8aq
         NspWsCvTgFaY/RRKpRRND1sbH/gb/ODL6F/itT6QrO1GWJzPZitmes1BuCXh/TE97AxU
         jT1WdNyiIQcfcDjAx40JDXALwou3y02eQRN2xrDaMwuly54g8mN0JAKAeejawCHwNIN+
         a1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749892520; x=1750497320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXZGIEfZDDccmiTeVzsKZm7Nu0ZNmUD8yr1NHt0MQH4=;
        b=Dy4Qr+yl+ZoSnFHHwnafdVgKCZmiiT8qZzyMoMuHp5/R6OkCGGhgSwX1VtAj66NUQU
         JG1s1roOrE747rydEn5ik5ik57HZ0w9oYcbCyxPT42W+6dn9zU6DN0CX+Ve5Vmud+t/I
         lvNPh9qwoIiUYZsoR3zqEFSH4eqo3bEGzCy9Iq3GlVifXWMPwtq6B5Td5tptqhHohfuG
         LbW2zIgYUyOYbzzbP90ezBWz8pE+iUqkTQHrGrwo1pV93OjXdVY+eeSVYsQf20ms8X0C
         4A/GSeeLI6Yi68LVvKCxiPpEi+h9KAavVYD3l8wF11cpgCT8RTFBwfE48J4qp76hYPt1
         +D2g==
X-Forwarded-Encrypted: i=1; AJvYcCXdTw3ellJeEkg3A2L8DqB2jkrfzyb3EGnT28bf8lWH0X9oMf08u+0qMqv0zKvcJCPjqDbPHZqr3v5tWBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM2axh87NFww9mYC69WBO/nhemkzhbrmWFBavelDJ5jIuBJwZ/
	P33Ed9QVQXwJDI8qw7fTm9F1ytK60mBMUZ4RHBfC0MvPT7YZ8Rxu3S8SnVr6anuIG8E=
X-Gm-Gg: ASbGncugxnKGKiCAZv1RYP5+T9jGrrSKN8sG+0D1N9nFy6c0Mm2gXg5Wmi3JpUv2Z6/
	DMTK9apxM6Y2wG1JOI78HMfAaiPju+S9IhRsK4+JexwmJ87LvpYnEyKZ2Ny0ychPZCoB0igykbz
	C3s/RAzRkboySiXuuCMPibiT390C5julRBMawNnLuHlctEZKjaBqyaWhawsQ2+vGO5fKRk2bMx8
	ZiE2eCB0OYmHjTh6eGwQccZwNbMAyVmVRHd4qYiRHQHD5fSnOg9jhTDGYTcMnstnfVPQskXtQXH
	NGzUKjd7sEc8facktrmFXXeOnpR7e7kB+rXnRElm3ZklGOL80HsNjYVnLFDaiYRzyiNjL7hb8Ui
	98galre7KwP/q3z9yEREY3Wqe
X-Google-Smtp-Source: AGHT+IFQviDBIfPu42RTiVXXTb+Ho8Tlb2wzrPdUami1CUBjU0n+pKda8Y6gdCAu9tv+g7jIA/1dSA==
X-Received: by 2002:a05:6a00:4b0f:b0:748:1bac:ad5f with SMTP id d2e1a72fcca58-7489cfbb64dmr3449698b3a.12.1749892520692;
        Sat, 14 Jun 2025 02:15:20 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeca93sm2969630b3a.20.2025.06.14.02.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:15:20 -0700 (PDT)
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
Subject: [PATCH v4 3/5] iio: adc: ti-adc128s052: cleanup changes
Date: Sat, 14 Jun 2025 02:15:02 -0700
Message-Id: <20250614091504.575685-4-sbellary@baylibre.com>
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

Arrange device IDs in alphabetical and numerical order. new device ID addition
can follow the same convention. Also, arrange the structures in order.
This is a cosmetic change only, and the functionality remains unchanged.

Co-developed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 drivers/iio/adc/ti-adc128s052.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
index 2b206745e53d..fbf15c83c127 100644
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@ -112,27 +112,27 @@ static int adc128_read_raw(struct iio_dev *indio_dev,
 
 #define ADC128_VOLTAGE_CHANNEL(num) _ADC128_VOLTAGE_CHANNEL(num, 12)
 
-static const struct iio_chan_spec adc128s052_channels[] = {
+static const struct iio_chan_spec adc122s021_channels[] = {
 	ADC128_VOLTAGE_CHANNEL(0),
 	ADC128_VOLTAGE_CHANNEL(1),
-	ADC128_VOLTAGE_CHANNEL(2),
-	ADC128_VOLTAGE_CHANNEL(3),
-	ADC128_VOLTAGE_CHANNEL(4),
-	ADC128_VOLTAGE_CHANNEL(5),
-	ADC128_VOLTAGE_CHANNEL(6),
-	ADC128_VOLTAGE_CHANNEL(7),
 };
 
-static const struct iio_chan_spec adc122s021_channels[] = {
+static const struct iio_chan_spec adc124s021_channels[] = {
 	ADC128_VOLTAGE_CHANNEL(0),
 	ADC128_VOLTAGE_CHANNEL(1),
+	ADC128_VOLTAGE_CHANNEL(2),
+	ADC128_VOLTAGE_CHANNEL(3),
 };
 
-static const struct iio_chan_spec adc124s021_channels[] = {
+static const struct iio_chan_spec adc128s052_channels[] = {
 	ADC128_VOLTAGE_CHANNEL(0),
 	ADC128_VOLTAGE_CHANNEL(1),
 	ADC128_VOLTAGE_CHANNEL(2),
 	ADC128_VOLTAGE_CHANNEL(3),
+	ADC128_VOLTAGE_CHANNEL(4),
+	ADC128_VOLTAGE_CHANNEL(5),
+	ADC128_VOLTAGE_CHANNEL(6),
+	ADC128_VOLTAGE_CHANNEL(7),
 };
 
 static const char * const bd79104_regulators[] = { "iovdd" };
@@ -216,27 +216,27 @@ static int adc128_probe(struct spi_device *spi)
 }
 
 static const struct of_device_id adc128_of_match[] = {
-	{ .compatible = "ti,adc128s052", .data = &adc128s052_config },
+	{ .compatible = "rohm,bd79104",  .data = &bd79104_config    },
 	{ .compatible = "ti,adc122s021", .data = &adc122s021_config },
 	{ .compatible = "ti,adc122s051", .data = &adc122s021_config },
 	{ .compatible = "ti,adc122s101", .data = &adc122s021_config },
 	{ .compatible = "ti,adc124s021", .data = &adc124s021_config },
 	{ .compatible = "ti,adc124s051", .data = &adc124s021_config },
 	{ .compatible = "ti,adc124s101", .data = &adc124s021_config },
-	{ .compatible = "rohm,bd79104",  .data = &bd79104_config },
+	{ .compatible = "ti,adc128s052", .data = &adc128s052_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adc128_of_match);
 
 static const struct spi_device_id adc128_id[] = {
-	{ "adc128s052", (kernel_ulong_t)&adc128s052_config },
 	{ "adc122s021",	(kernel_ulong_t)&adc122s021_config },
 	{ "adc122s051",	(kernel_ulong_t)&adc122s021_config },
 	{ "adc122s101",	(kernel_ulong_t)&adc122s021_config },
 	{ "adc124s021", (kernel_ulong_t)&adc124s021_config },
 	{ "adc124s051", (kernel_ulong_t)&adc124s021_config },
 	{ "adc124s101", (kernel_ulong_t)&adc124s021_config },
-	{ "bd79104",	(kernel_ulong_t)&bd79104_config },
+	{ "adc128s052", (kernel_ulong_t)&adc128s052_config },
+	{ "bd79104",	(kernel_ulong_t)&bd79104_config	   },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, adc128_id);
-- 
2.34.1

