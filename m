Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6245302CCA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405978; cv=none; b=kG2rcYNiiW5rnRs/5QJBVXood0+Qz15VBIPuCaBnnVhJt8OS1qI/iFoFJwEZ+GNNj4u+6Jf7yRzgnijySG9kE+JJEMQFWvP3eHiPm17eF2uiCqY4BN8+zN0xsSthuHmbLPLz7In22yXr0Q6eDMrvUfWRQTKKZFWrolGM/qnYhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405978; c=relaxed/simple;
	bh=M4/tNur7tRszJi5SmRurWDX7ISkKNes7iozPTRRi7As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPclmCytFQkk0uKMWkQJWKQrcgpIQJ/+B1XdGXaLREex5giPcBG8mVQZBnYe1DIuLkTq8WDfzQACsn9DhyoiEoURWYgb0meqGBwTFe3WFDqQq6PqefV75n4DOko0wCWqWN9ducWi+ncdXDeolx3/Z6l9R4ixmdCPaN6W8e0CuLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pnciLUbd; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pnciLUbd"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40ad1f7c23bso2568863b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751405976; x=1752010776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJKwd/wJqdB50K5/93gQjs+L1bIrA5xTZSKkVy95VeU=;
        b=pnciLUbdK9Wuq+OqTh0HJ7yj/l4vMPqo2n4o5V7Xz8NwgBbj4FI9fsx4Cfpm+Ewl+3
         eT2ZKM6GxCfJBM2B9RJoPlygIV+2IPuR30bSSnHawgt0eEq8lof1thGlptjeLsCP9vAz
         lL8aXlmsAv2fPe15N8bQAGzlnohgiWoKsRdLFz9kRYdagBBdlwIqHAuHLEwBGzKFNfB1
         6+XMstybcKCw1sGv/VL27Q0IMeyGS4js4j2f9yFi8hyI2S3XUJhZjKzb7/1xUz0AEzjD
         MU4QGE0fGnoyy9uPqcYlu0xQL+xwmjqffr+da/HV9cBxfPAUzDBrra424KvKpl8Cga+h
         TrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405976; x=1752010776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJKwd/wJqdB50K5/93gQjs+L1bIrA5xTZSKkVy95VeU=;
        b=M2jrf8JW76pJb5RzJ3IUMBo20F2IGnWPQMB8np7fUEt0aNbHmG09EaAWA6H/R5MmCj
         GcLk8qc+yaAl7tR71UTgMsFNVpdaxMXQcsWeCJ/i5JrVicosHLUUaSRLSOBmi+OBp0l9
         9GIem3zs9FkG6kvAtOi7DgAroZ1jqVvWtDeA4nMG4IgNlU17VRNvwHLYOxTm0IiFVDPI
         7BgUYJcC8nx3/i4v07mnfnzqE9R6YEz5pJ02ibAaEzun+kB2zFkZ6J867UwLMJ6fqSm+
         vAkF14RofZxHqFbaqkUEQA3pXb6j9opnbipbFbBE2D4WSHTjsznDFALPanqx4uhv54us
         VolQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3u3aXmzKdweUWH8l+FHvROiad+w2AeNqfDCpaqCUvR+GzfjtiMqZxVoMYOWjP73ooV2EyzH+WwteGog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKYW3lZFNegGjRinvQv3flWYpXpzcDQrKiLO768ZLJnFsS2Lk
	YxA6eTJYD2iA/y/+txkD12Jj7VkzFpe8R2VvCAPXSkOObVIX2sq8WBwBIOPgMbKSwn4=
X-Gm-Gg: ASbGncuYhZOG20XqdxIBLjJKb+QzJV5bz6hvVZz0xuwi5+CS0ueqMAO1nd5cfVhVnEr
	aAEyYobFYB4Eoo5hg+VHFfNSy0A9pEuHeUsZ7psjjAbe4Id3PDWinmurxvln8cJrJs7IWhTcmO6
	ebi89H7/sYIluF3E/TKy8HjHPfROpAjYchazyYZiSAIURGDoL+kTJ2ZYsfid8WOALNgxte3JVIq
	i62eOjguaySkZ2YcajhLSjXCtjB7AYShibbQ1oakn2Faio4iR53wYUNrBNo27dXzXieNqP+fqIE
	TTYxMgU9R+B7fphIxPt4Q8f/6s837LDEuO8wAcDPA+z77B+KmN2yauxvwLz2lhK97xA/
X-Google-Smtp-Source: AGHT+IGJwGygej2LG3wxVUQEglbyRiCBO9CmndTg/hDO9OykoKuP9uFYVTtjhgsdZ18CyZNtp0nULQ==
X-Received: by 2002:a05:6808:1a0e:b0:40b:3bdd:ba22 with SMTP id 5614622812f47-40b887e8847mr258915b6e.24.1751405975748;
        Tue, 01 Jul 2025 14:39:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3243deeesm2288335b6e.48.2025.07.01.14.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:39:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Jul 2025 16:37:53 -0500
Subject: [PATCH v3 05/12] iio: adc: ad_sigma_delta: use BITS_TO_BYTES()
 macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-5-42abb83e3dac@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3583; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=M4/tNur7tRszJi5SmRurWDX7ISkKNes7iozPTRRi7As=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoZFVb7+LH0qfzvjwAMFEUcfYoiQ60yFKMGt7Ci
 pr12dvhRhWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGRVWwAKCRDCzCAB/wGP
 wNn1B/9y+qz2FL8FnW6WawUuwFMrHtRYMozxtssOsHG/ot66OFx440acYcwz1vhVWCV+oPoCSeC
 TR8Dz4W1lWC34MhU5bZU+S/zYVPcZahiqrN4CHMaSisb+rtyK9uJr4Y+3yl0uVU/XRdlJozY+LH
 iYzpVnyKasHWp0UkNKuUKZ1BA09RgkNw2LPOS/vOzQITcPQM6Wupc2ERC0qYhhVtARYuex5I88r
 PI+EBh/oTdiKNyo7hVleIZjLGja5GiZ9mPn6Oka5MQArXX5FCyE71rWRFsgj48ZNPb0OmpI//3k
 CEZI7AaEnRH4o1vffi29WvPR4lsSqPFtWj324UBgidI+kjmm
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use the BITS_TO_BYTES() macro instead of dividing by 8 to convert bits
to bytes.

This makes it more obvious what unit conversion is taking place.

In one instance, we also avoid the temporary assignment to a variable
as it was confusing that reg_size was being used with two different
units (bits and bytes).

scan_type is factored out to reduce line wrapping.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index dd15c357d1494bf5718e50e50a514cb4d4556f2b..f91f7ae6dfca05cf3ae632a5f19990f3d153b706 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/align.h>
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -190,7 +191,7 @@ int ad_sd_reset(struct ad_sigma_delta *sigma_delta)
 	u8 *buf;
 	int ret;
 
-	size = DIV_ROUND_UP(reset_length, 8);
+	size = BITS_TO_BYTES(reset_length);
 	buf = kcalloc(size, sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
@@ -419,7 +420,7 @@ int ad_sigma_delta_single_conversion(struct iio_dev *indio_dev,
 		data_reg = AD_SD_REG_DATA;
 
 	ret = ad_sd_read_reg(sigma_delta, data_reg,
-		DIV_ROUND_UP(chan->scan_type.realbits + chan->scan_type.shift, 8),
+		BITS_TO_BYTES(chan->scan_type.realbits + chan->scan_type.shift),
 		&raw_sample);
 
 out:
@@ -453,6 +454,7 @@ EXPORT_SYMBOL_NS_GPL(ad_sigma_delta_single_conversion, "IIO_AD_SIGMA_DELTA");
 static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 {
 	struct ad_sigma_delta *sigma_delta = iio_device_get_drvdata(indio_dev);
+	const struct iio_scan_type *scan_type = &indio_dev->channels[0].scan_type;
 	unsigned int i, slot, samples_buf_size;
 	unsigned int channel;
 	u8 *samples_buf;
@@ -488,7 +490,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 			return ret;
 	}
 
-	samples_buf_size = ALIGN(slot * indio_dev->channels[0].scan_type.storagebits / 8,
+	samples_buf_size = ALIGN(slot * BITS_TO_BYTES(scan_type->storagebits),
 				 sizeof(s64));
 	samples_buf_size += sizeof(s64);
 	samples_buf = devm_krealloc(&sigma_delta->spi->dev, sigma_delta->samples_buf,
@@ -544,6 +546,7 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
+	const struct iio_scan_type *scan_type = &indio_dev->channels[0].scan_type;
 	struct ad_sigma_delta *sigma_delta = iio_device_get_drvdata(indio_dev);
 	u8 *data = sigma_delta->rx_buf;
 	unsigned int transfer_size;
@@ -553,9 +556,7 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 	unsigned int reg_size;
 	unsigned int data_reg;
 
-	reg_size = indio_dev->channels[0].scan_type.realbits +
-			indio_dev->channels[0].scan_type.shift;
-	reg_size = DIV_ROUND_UP(reg_size, 8);
+	reg_size = BITS_TO_BYTES(scan_type->realbits + scan_type->shift);
 
 	if (sigma_delta->info->data_reg != 0)
 		data_reg = sigma_delta->info->data_reg;
@@ -617,7 +618,7 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 		}
 	}
 
-	sample_size = indio_dev->channels[0].scan_type.storagebits / 8;
+	sample_size = BITS_TO_BYTES(scan_type->storagebits);
 	sample_pos = sample_size * sigma_delta->current_slot;
 	memcpy(&sigma_delta->samples_buf[sample_pos], data, sample_size);
 	sigma_delta->current_slot++;

-- 
2.43.0

