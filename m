Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C5309DA0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405987; cv=none; b=rvXCj2+0Maq6Fgj+Gha84McyhA8kZ5rIagYg/wixxw+W+RJxAoKm/EnBecE0g7TKJFH0YnLyD/ZDA8Eg5hwaW1NVkjg21bq1OHCxY5crgM3Lc4Rt0MWs1Cm2ytidkJD5gXE+EVXriYUudtxhrbN9z5MkC9oGSEYIVah72prGBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405987; c=relaxed/simple;
	bh=x4deODr2J/B/ZfZk3+/1/BV8bYxvy5G2y6ggy6cAeUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwk9TAEenGN1/q+GgMYZIULrVtUMnDvCLZZTLA/4NQWxj1Ot55mC46IP1E8R1I0bylho+9y3+dyQyjedhQriuZQo6Acv50xNpzT0igdc9fkdcFzRzBCknuTWnwpaMNVh2lqtrNWsFL469uksMYXx9dNbipTDnOaiwvV5l5L+UgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uzFV2QfR; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uzFV2QfR"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-610cbca60cdso2398668eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751405983; x=1752010783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suln3ZPyOtbgf+467Jl0jyyrQzWY3/ACSgQiyK4V5QE=;
        b=uzFV2QfR/9O4bbbkOJxLfJ4apFXo+I2UDKekRLkUk2CR62s4ds7TvNdaFJaNr15UV9
         as/jpcwB9qphSeaOpw+0nyZirN0iBZ/+21NSkzFTlY9vKyriqkDIsTTGUn76ST45j+PL
         U4F8fyclyDjm/uQeJ5aOMvZB1eegv4aE+CaF3hSJPBypZkguCgesL/zAd027ZMb+LYij
         qUb/Fdbts06kGmSjvYCwBQeIbF+HLGlCkkYpU2RInFkQcZCCL/lPEjk7ZViE3OA+FeMH
         dGFz25q0NMAiRxEp4JxBUjleM5GP32g4p/+s5aLh7lnHZQFOd6lR4A8oFEkWLs7Gl8d3
         QWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405983; x=1752010783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suln3ZPyOtbgf+467Jl0jyyrQzWY3/ACSgQiyK4V5QE=;
        b=aX1oVpcanXmwJ7VTY9c9S8eHLL14OwCiBwpur6riY5SkG2HXJYYG5zqrgYzaFkTsxV
         EYmtZkDHnKFrmw0nU8eLe1nBvC2XWjJN0P+HX9kTDuDjdau/TpXr4Li5k2kViEC+/mNB
         xL3KmJLn3WVj2ocAHNC9bQFP5cl6h2a6JFwES6l9TBMTwsR8jcC2qutpuvRTnfittMR0
         FIX0brB3H3CCHSYeEXSoBg0xU3EzEU7VqiLjpDGNk+gJcOKtSLYrOtbk77IPW3cZwfmx
         9Q7vXiN1IVSuaIuMyT9cshJLoRNUIMNX2YO/tuz05sqpqUgU7nydFxQPXm8WKbj5ewr6
         bNig==
X-Forwarded-Encrypted: i=1; AJvYcCXDrtc3swxArrS1l61tmAAOlpTwaG+fa38WfgiAh9P+osy9viNgT6w0Ic4J3Y4rJ3bjmhrKY2WkQwTRvAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVkEqeR/Qs11ihxPjZPS0qVSsy5LDhEPPzVK6x8ClyR63r9nS
	cXz+kOMGg0fnDSm9jua69u0KQHXwc1yYWTn0aZAwICCB1raVgF5DZFr+j+Bn/2hCCW0=
X-Gm-Gg: ASbGncuI+HOngCZ6hP4XUc/mu7IfZLWmJz0CuOtQA/UrT8mS8BlbOKXrEngSaGHdVrn
	yscnPV0vVEQWTM8iF/hKzRtEHp3Q0v8zQ2D2SV9cNkEy8NHEQnj4xbgDf/MLJ5ePUW/LA5NSVfw
	d9UhwPMfOLRfBdK7VOXEECXMUClHhBc5an7aiz6N8mx5u4Dg6TTZHG+BsuZ1UQnkyJvcAHJsJdx
	RbslKEhdp2WGevbV5+hFUkTyBePZxCAm2/80GgyzgtWnqQpgtq5e+HTgosmU0wv+TElhsgCCqah
	4hCtjLTZSqjGNTOTyzEvxpsTGtgkU/rEeygABV9/VvRgr4kR/bQ8xGsAsBRgyvxRqOPr
X-Google-Smtp-Source: AGHT+IF6kRQojTr3O2i9DG8mL7DMuXbV8rMwlD9TonhoHxqzG4+HoL+1QVcxeETXqNSATHlBkNqfyw==
X-Received: by 2002:a05:6808:1a0e:b0:409:f8e:7274 with SMTP id 5614622812f47-40b88e07cbamr163963b6e.18.1751405983560;
        Tue, 01 Jul 2025 14:39:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3243deeesm2288335b6e.48.2025.07.01.14.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:39:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Jul 2025 16:38:00 -0500
Subject: [PATCH v3 12/12] iio: adc: ad7173: add SPI offload support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-12-42abb83e3dac@baylibre.com>
References: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
In-Reply-To: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
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
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoZFWKFauMI32n+rVJ4X53stwAqiiUvPd+u9cFp
 uvVIaRAIL+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGRVigAKCRDCzCAB/wGP
 wE4UCACbCLWfN9b147eeF/3FnSESrviOzb6Fu37NJlnlvMpDCeG1q6ArK8xrmF+fw25/vektB7i
 h24Bm6GTgyEVq+Q0MOPABO9fDJL2uSWaRuVrRrqVr/I9AbRWr5dIfxqQJGtMT/VYQwGAMcVp3h3
 BKUeRv4tRjoETflevaU6psSJMOPzxt3XW7qTSYHuoYAZgWKFvqj9OJqtXTPaBmFuhtx83Jf7WCm
 sjQKKjGVOsn+yZ7Rzlpy34BGCYtFC/SsI1QHMxSe2idYDvGQZlJE5f7SFF9BNCb0VPGmd9A3Rah
 SAjh5D/znRiJRVMB4W6hFq60UKW28JwAD9k7EOd0B3ZEBd/b
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

