Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C65F2620FA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750458102; cv=none; b=jAC1loXQEaSbXkTKfr8rXz4+nTsYUi7Stkx92cIukLrf+gI8fq+F5SrdP/fkCfbbNoq4XH4xfoJ1bQN/qTNGK5z7jvGVN4xIAt7ZjabqRT+kzVJyG4kn3j/Saa7zeP68ZDEQpyvIRfCCUWExs3KjeW8qkgs9wJH6Y1vg9gXTB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750458102; c=relaxed/simple;
	bh=x4deODr2J/B/ZfZk3+/1/BV8bYxvy5G2y6ggy6cAeUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHJfI+aRZyFucObJcAmIJyMxSbBhRcwaiVcV6ed9z9wQwW2ubeclmgZT5ao4my3b4KFzPPR1LYXV07WGtBVIRMUpsAosXTD/cTVLs6JXEOScgu2ldt0oLr4YAh90gCkQwPdsrHKfGu/IoqJXMLQnFAPBYbXHh1K9NKmAaeuzlj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wBXFihOF; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wBXFihOF"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so633039fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750458099; x=1751062899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suln3ZPyOtbgf+467Jl0jyyrQzWY3/ACSgQiyK4V5QE=;
        b=wBXFihOFLTvQbqVvK/Mu067ef9/6E2ZX887LJFi74M12RFxgU5ZYf71gHFk23oR/F5
         maAQPC6xg4P+hloJfIaL1S55ZBt684Uhs2dmFhxfpDfH3JYZHHR14U962m0qNVXpjh9z
         ZNKKbazxwBlFhLntOzByyrBv8hltAOEF6nYc6HcfoRqMKDEMeN12oRFuBQBYhGm7VNaz
         v9RnpVjEYH2cCPEYTuJjwupP+8gF1OaqoPHEcTw9BQdWeodO3tpCeDdW1+giQYPcGYwz
         W3l6Sru/woLlVgSxY9dfPtVTExJAmb9K0mw9XD2aCElZ1lulin3waH3yS3ouQ8ll/GQM
         C3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750458099; x=1751062899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suln3ZPyOtbgf+467Jl0jyyrQzWY3/ACSgQiyK4V5QE=;
        b=dY+ueqqOXj6fayCwygGFsT6mXQ05lMeXVGcUm7xRwsbwhjcNThXjSkGXvj2In33lbk
         JBx7r86kGKOGt8iKahNnU/0+8FKvV/6GblHBiNtPUzq+XcpJ4cb26kW+grjNwZrM4UXs
         4nW1BwtJ35uMijTTYVo4v4NU3cADtmJ3tzl/Nd3mLQ9bmGfD6t3irMOmjgpw6GTJ6dvZ
         U0HknUx5nge0zVrOW6WZ2RWbEFDAVD6tspZEpHN1tECpSTF7WDpT0gq4/mCTQx8rytTm
         +grZWVxaMJQoEg4Zes14LuEs3x6rGEd832sae9ntWV/tndYYuTq+MNF87ykda8muFCw3
         P1dA==
X-Forwarded-Encrypted: i=1; AJvYcCWZL4BH3VfMEj2x0hl67tAoAAEWL1Xd6e4M33LqvF0E/Fbqu06FuLotK2J3vwF6B76YjaaF/CkuH7sNG0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2uOjQczRmoNinORAUDsEzmORXKKZiras6wGQsh0LQ3rufuof
	aedBupRtUHpVsS0G8Igs2qFD0V+e1d3TipKztjPvXk0RisDiucd1B6ABx8cg5pae1cQ=
X-Gm-Gg: ASbGncvpAZRHZfl/5ynVRIm9vHaNByg3oURfKJZtmGicFhp5478nTBoUe9jLe87gyI0
	Cwuit79GiH2q08F5m5IL4kLDFOUhbyQ0ERvOxtpSxQS9Sv0Bi2cSMTKCBmOJ6cUShY9iH6ZGIKr
	gi95z6Dos3x9pMq3ws3+hi1zv6unp5WLvFYEfCPP5Fi4/jb8/43Y8iebGYPbKgjyQ4cWCzEEdeA
	0TW8EU490X0hW/ridgQjpVh+S3MmbcabjJZhjggHA0JfqysqHpXYBtJQoAgIWRGBlNt0Hcem69v
	myDIj6n5VLOKTFow7c7ITShvzC3VgcsonrvPO7OUff4HVS8JEoepNhkxdZEqEcsvYiHb
X-Google-Smtp-Source: AGHT+IFFZ+omLsO7ZuSN1mPRtGWTSm0ZzIFm+TkweJtrK0ojyctWLeY95qYERn4eblsassMxLl2d4g==
X-Received: by 2002:a05:6871:d082:b0:2d4:e420:926c with SMTP id 586e51a60fabf-2eed96fd963mr3180391fac.0.1750458098820;
        Fri, 20 Jun 2025 15:21:38 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c4bf:cf27:203c:f8b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ef481fe06esm7561fac.35.2025.06.20.15.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 15:21:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 20 Jun 2025 17:20:15 -0500
Subject: [PATCH 9/9] iio: adc: ad7173: add SPI offload support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-9-0766f6297430@baylibre.com>
References: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
In-Reply-To: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2110; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=x4deODr2J/B/ZfZk3+/1/BV8bYxvy5G2y6ggy6cAeUc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoVd7X1mOWlAqdTIO8E8YQGWhnDdCYn3sWy4agB
 JECUdf0nY+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaFXe1wAKCRDCzCAB/wGP
 wIXeB/0cCZLaVXucuun4F3NuAOcZU4Z6XVqoy07XZgydMW8uAoRFh9Smjm8a2yuZ89fNsezuGDs
 p2VD/kJxzwjq29+7Dh7rAMJK9R6QQHvl/JS5jC09PQz8G2xWut4W7gDLfVVYEui6pNRrzB4pDON
 BO151qy8G+Nu2VrofSepYqirPoFAJDaC1akxcLPrBjuPxTlrbBVYIyBg07xyPyJaeXD1JhoBoB1
 OvTWmEVak1PusFL/ETcJsuqtt4F4v4Fax0ueYutobWoern8Q9aHu7Uvon0JR5Nk9omjsAH3gfZT
 HefEfAdSDzo9otlQIPhuHy/Dw8qW2N0sioE4LURsFoIVL0g+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Enable SPI offload support for the AD7173 ADC driver.

The scan_type used for SPI offload is assuming that we are using the
ad411x_ad717x HDL project [1] which always stores data words in 32-bits.

Link: https://analogdevicesinc.github.io/hdl/projects/ad411x_ad717x/index.html [1]
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7173.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index 010339c2b7044da4b36dc894a38a145c2fcccd6a..580d4bf3366b193fa0f13d0a28886d390e1295b8 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -748,6 +748,7 @@ static const struct ad_sigma_delta_info ad7173_sigma_delta_info_4_slots = {
 	.set_mode = ad7173_set_mode,
 	.has_registers = true,
 	.has_named_irqs = true,
+	.supports_spi_offload = true,
 	.addr_shift = 0,
 	.read_mask = BIT(6),
 	.status_ch_mask = GENMASK(3, 0),
@@ -764,6 +765,7 @@ static const struct ad_sigma_delta_info ad7173_sigma_delta_info_8_slots = {
 	.set_mode = ad7173_set_mode,
 	.has_registers = true,
 	.has_named_irqs = true,
+	.supports_spi_offload = true,
 	.addr_shift = 0,
 	.read_mask = BIT(6),
 	.status_ch_mask = GENMASK(3, 0),
@@ -1585,6 +1587,11 @@ static int ad7173_fw_parse_channel_config(struct iio_dev *indio_dev)
 		if (st->info->data_reg_only_16bit)
 			chan_arr[chan_index].scan_type = ad4113_scan_type;
 
+		if (ad_sigma_delta_has_spi_offload(&st->sd)) {
+			chan_arr[chan_index].scan_type.storagebits = 32;
+			chan_arr[chan_index].scan_type.endianness = IIO_CPU;
+		}
+
 		chan_index++;
 	}
 
@@ -1675,6 +1682,12 @@ static int ad7173_fw_parse_channel_config(struct iio_dev *indio_dev)
 		if (st->info->data_reg_only_16bit)
 			chan_arr[chan_index].scan_type = ad4113_scan_type;
 
+		/* Assuming SPI offload is ad411x_ad717x HDL project. */
+		if (ad_sigma_delta_has_spi_offload(&st->sd)) {
+			chan_arr[chan_index].scan_type.storagebits = 32;
+			chan_arr[chan_index].scan_type.endianness = IIO_CPU;
+		}
+
 		chan_index++;
 	}
 	return 0;

-- 
2.43.0

