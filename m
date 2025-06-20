Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81424C09E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750458098; cv=none; b=PM06ayQkoXONrgFBJ35uTmsG7qt8Dy3lIS1P9nbimTWuMOgSyH/eMSLM1VDQr3fymIJZ9Ddl1VP1er8RxVbWeA5aDcaG+jMPO343Sj9MvP7oTL9IHLquc+WlrWmKHKctEEEoeKSu3/kyE7WY7/mhYS+P+meSoNUgajgwmLo83oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750458098; c=relaxed/simple;
	bh=cddbpWXqEEIcj2QjKN8G7oDTDa9572QNRGwDt6kGyjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMBAG8Bow7cyzU9WO0LhNijdQwLAcB/2tVl7q1tMh7BNtfDGRLsR5r8ptWOCSPf1JoQg4F0wOybVUJoudNPvoqUxctItiughV+IVEhW2hRz1QqIZcNTRsv8BJT+HB9QUbe87LqBHozw2Iy0805BgektunHlx8RZwyfCArS19Rrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RA6lrfRn; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RA6lrfRn"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73a5c3e1b7aso1604604a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750458092; x=1751062892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcT++7C45quX0bPAWijBUd9v7dxcY6r0k5c1R2+o2CM=;
        b=RA6lrfRn30qoL8lAM3msDtijjIcqJTQuc1Hyx6q/ovEp8mvEwu+hMbdQhwnB5kmwoA
         mA4qgfCzNUSumVykvUGBHdezHT6Jp6P5bovKdp3o/I3KYwsw2CpeEM7VuZbSHUIAhXEo
         B/KiTlbeeekcChhvTTyDz8q2Gpgx0weNnQFF0bhpO25clZbl0N+ubV9ZWmakiDIdIkun
         8qBrs0xXuVICHAK51TtTnDcUKX8jOMizxa8g6NR36cUY7/+bLWqxmVjIH8lmMIclk5sM
         OdUmMxYxQD2GZnI2D3y/E8rD7owBulrDmPXigdxXIECvToTMzoxtChNZR+oANf9izRlD
         UDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750458092; x=1751062892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcT++7C45quX0bPAWijBUd9v7dxcY6r0k5c1R2+o2CM=;
        b=i+0m8XHADPa0vq1ruRiSDe/jRHGTmxuoTIwKGUioGZuo/7yiUj1LkqAaU5eumvrA4q
         WI7AcGvEmgwpkp0Qjfkl9RqS21CpJXyIsnMusX4Fb3SvSvrpW/d34Hwl8GXUAscA1WtQ
         I+ZPznsuucgtLFaOaDd0HW3zWoGrNNvSxI+8H/Bi+fS7rPAms8n8zya9EkthsHMnNwVc
         qGYD/apRblsoqrdPfz4TdWPtREzAaRBe4p3CJtMSEzgYKN4/zmQGFceaMXg5jlUPM2yF
         19SIDq3E563cql/gexZidCc1g+CCGUd5RuznkB1TvsHK5Hkyr4boEmRrSAlJLmXNG6OG
         7MLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxCFByMID99KTrCxjWnVQj/5CiUk6sL+AL4wn1pKL+0lbsQr7AkF9+VrLb7zBMV0iLBE7pjqvAz0jFaNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAhEDjR7vghPb/OGciw6sSJIUZ3/d7CPNnf2mGYTcvsTe9sx7
	uUimORNNUzhYNBgJxhW0YxzzZbuRySBsEjExo8gOfqNMoMkqIE0cKeEgjPhOArVV86c=
X-Gm-Gg: ASbGncsNPuJQGs/hEH0VmSKahXMart/JZ5JWXXe5PiUsG3SDQ9rXL2FswGg8+n00q7Q
	cEm0oSCJ33Ba7ofIYphucAjG4Idv1fu5YD3meIs4Woezy4fqKLvI7/nIzUFBDPTEXA57Ae8Toqv
	PyFgYPUoOJRY00W6U2zSBORT2SyUCqod3R99MCVq73M/R0CtQyaslvUW0UIfbbsUgaFZaznXr/6
	PpJoXoEyClYIg27PkGsiSoh+V/f4CYMBMOp8POtABTq2CiufhATB5KGUlBXyavyWWHJ/jX9F3GY
	Ao1Mt1NguADKV0sZISK1KsUKtYUuov88+H4Hj8RYmWs5Ak+UV8vok9WkDW6n9jMxcHeH
X-Google-Smtp-Source: AGHT+IFfdGgCkgkyBiTBFRzPhVVwmPDFsxlUzyb+wnJ7zOP3uPcIaLAMRZYbQtUAa4MqqkfiKxpLug==
X-Received: by 2002:a05:6870:d109:b0:2b8:306f:c5ad with SMTP id 586e51a60fabf-2eedbb795damr3298515fac.13.1750458092521;
        Fri, 20 Jun 2025 15:21:32 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c4bf:cf27:203c:f8b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ef481fe06esm7561fac.35.2025.06.20.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 15:21:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 20 Jun 2025 17:20:11 -0500
Subject: [PATCH 5/9] iio: adc: ad_sigma_delta: use spi_optimize_message()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-5-0766f6297430@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6152; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=cddbpWXqEEIcj2QjKN8G7oDTDa9572QNRGwDt6kGyjI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoVd694+e7CAINB1ltcYwO+0KLA/51zFkpHDmJC
 DuUjXS1TyGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaFXevQAKCRDCzCAB/wGP
 wJ2+B/9HPYKdZ2KMqtGKaTpOky4qhHk3F2oVPdclcUbmcsqRtVz+TAtzAM4leaYSgN+MAPwzrXV
 EjM4wHuJB4fVUYlUJxMRK2N+CmUPCjrViQhdJlhwhTX4Zp8j2EHiwbts1okgm1p/SmOfZHj+b8r
 kMPEPx7dkXDmybmv3tiZCoDbDUGVBm/SZd6pBtjWxiCcNPbwFiUFLi9bNEnEJYcdP4tQMtCmvHY
 HtFb21omke1GTBHaEPldWWnt0VI7fDlOivjO/hG89fJVdZzhO1q4iRk2AgpClQw4LV9+mxplv/t
 9G1Q12Wck0rplQ1AMe60QQj0aoDNn8z+RHcEQoacduNdsVEH
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use spi_optimize_message() to improve the performance of buffered reads.

By setting up the SPI message and pre-optimizing it in the buffer
postenable callback, we can reduce overhead during each sample read.

A rough estimate shows that this reduced the CPU usage of the interrupt
handler thread from 22% to 16% using an EVAL-AD4112ARDZ board on a
DE10-Nano (measuring a single channel at the default 6.2 kHz sample
rate).

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c       | 74 ++++++++++++++++------------------
 include/linux/iio/adc/ad_sigma_delta.h |  3 ++
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 883cc02d4099908644af523bcf66c0178fbd0e55..a9b97f5d4107a2e1bb74877d30403445e9b04a44 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -458,8 +458,10 @@ EXPORT_SYMBOL_NS_GPL(ad_sigma_delta_single_conversion, "IIO_AD_SIGMA_DELTA");
 static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 {
 	struct ad_sigma_delta *sigma_delta = iio_device_get_drvdata(indio_dev);
+	const struct iio_scan_type *scan_type = &indio_dev->channels[0].scan_type;
+	struct spi_transfer *xfer = sigma_delta->sample_xfer;
 	unsigned int i, slot, samples_buf_size;
-	unsigned int channel;
+	unsigned int channel, scan_size;
 	u8 *samples_buf;
 	int ret;
 
@@ -493,7 +495,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 			return ret;
 	}
 
-	samples_buf_size = ALIGN(slot * indio_dev->channels[0].scan_type.storagebits, 8);
+	samples_buf_size = ALIGN(slot * scan_type->storagebits, 8);
 	samples_buf_size += sizeof(int64_t);
 	samples_buf = devm_krealloc(&sigma_delta->spi->dev, sigma_delta->samples_buf,
 				    samples_buf_size, GFP_KERNEL);
@@ -501,6 +503,27 @@ static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 		return -ENOMEM;
 
 	sigma_delta->samples_buf = samples_buf;
+	scan_size = BITS_TO_BYTES(scan_type->realbits + scan_type->shift);
+	xfer[1].rx_buf = &sigma_delta->rx_buf[scan_size == 3 ? 1 : 0];
+	xfer[1].len = scan_size + (sigma_delta->status_appended ? 1 : 0);
+	xfer[1].cs_change = 1;
+
+	if (sigma_delta->info->has_registers) {
+		xfer[0].tx_buf = &sigma_delta->sample_addr;
+		xfer[0].len = 1;
+
+		ad_sd_set_read_reg_addr(sigma_delta,
+					sigma_delta->info->data_reg ?: AD_SD_REG_DATA,
+					&sigma_delta->sample_addr);
+		spi_message_init_with_transfers(&sigma_delta->sample_msg, xfer, 2);
+	} else {
+		spi_message_init_with_transfers(&sigma_delta->sample_msg,
+						&xfer[1], 1);
+	}
+
+	ret = spi_optimize_message(sigma_delta->spi, &sigma_delta->sample_msg);
+	if (ret)
+		return ret;
 
 	spi_bus_lock(sigma_delta->spi->controller);
 	sigma_delta->bus_locked = true;
@@ -520,6 +543,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 
 err_unlock:
 	spi_bus_unlock(sigma_delta->spi->controller);
+	spi_unoptimize_message(&sigma_delta->sample_msg);
 
 	return ret;
 }
@@ -541,7 +565,10 @@ static int ad_sd_buffer_postdisable(struct iio_dev *indio_dev)
 
 	ad_sigma_delta_disable_all(sigma_delta);
 	sigma_delta->bus_locked = false;
-	return spi_bus_unlock(sigma_delta->spi->controller);
+	spi_bus_unlock(sigma_delta->spi->controller);
+	spi_unoptimize_message(&sigma_delta->sample_msg);
+
+	return 0;
 }
 
 static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
@@ -550,51 +577,20 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct ad_sigma_delta *sigma_delta = iio_device_get_drvdata(indio_dev);
 	u8 *data = sigma_delta->rx_buf;
-	unsigned int transfer_size;
 	unsigned int sample_size;
 	unsigned int sample_pos;
 	unsigned int status_pos;
 	unsigned int reg_size;
-	unsigned int data_reg;
+	int ret;
 
 	reg_size = BITS_TO_BYTES(indio_dev->channels[0].scan_type.realbits +
 				 indio_dev->channels[0].scan_type.shift);
+	/* For 24-bit data, there is an extra byte of padding. */
+	status_pos = reg_size + (reg_size == 3 ? 1 : 0);
 
-	if (sigma_delta->info->data_reg != 0)
-		data_reg = sigma_delta->info->data_reg;
-	else
-		data_reg = AD_SD_REG_DATA;
-
-	/* Status word will be appended to the sample during transfer */
-	if (sigma_delta->status_appended)
-		transfer_size = reg_size + 1;
-	else
-		transfer_size = reg_size;
-
-	switch (reg_size) {
-	case 4:
-	case 2:
-	case 1:
-		status_pos = reg_size;
-		ad_sd_read_reg_raw(sigma_delta, data_reg, transfer_size, &data[0]);
-		break;
-	case 3:
-		/*
-		 * Data array after transfer will look like (if status is appended):
-		 * data[] = { [0][sample][sample][sample][status] }
-		 * Keeping the first byte 0 shifts the status position by 1 byte to the right.
-		 */
-		status_pos = reg_size + 1;
-
-		/* We store 24 bit samples in a 32 bit word. Keep the upper
-		 * byte set to zero. */
-		ad_sd_read_reg_raw(sigma_delta, data_reg, transfer_size, &data[1]);
-		break;
-
-	default:
-		dev_err_ratelimited(&indio_dev->dev, "Unsupported reg_size: %u\n", reg_size);
+	ret = spi_sync_locked(sigma_delta->spi, &sigma_delta->sample_msg);
+	if (ret)
 		goto irq_handled;
-	}
 
 	/*
 	 * For devices sampling only one channel at
diff --git a/include/linux/iio/adc/ad_sigma_delta.h b/include/linux/iio/adc/ad_sigma_delta.h
index 5056677c9941afadc2383febbcafeb02e23a4f44..2037bb68b44115681ff48f66b580b63f50c2ea9e 100644
--- a/include/linux/iio/adc/ad_sigma_delta.h
+++ b/include/linux/iio/adc/ad_sigma_delta.h
@@ -105,6 +105,8 @@ struct ad_sigma_delta {
 	bool			status_appended;
 	/* map slots to channels in order to know what to expect from devices */
 	unsigned int		*slots;
+	struct spi_message	sample_msg;
+	struct spi_transfer	sample_xfer[2];
 	u8			*samples_buf;
 
 	/*
@@ -116,6 +118,7 @@ struct ad_sigma_delta {
 	 */
 	u8				tx_buf[4] __aligned(IIO_DMA_MINALIGN);
 	u8				rx_buf[16] __aligned(8);
+	u8				sample_addr;
 };
 
 static inline int ad_sigma_delta_set_channel(struct ad_sigma_delta *sd,

-- 
2.43.0

