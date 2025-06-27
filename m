Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3B292B59
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067693; cv=none; b=h4sAHq0emtNzpH3KASlA8vBkkDJFC+O405ia3GQGo6H1Ou/FLY5zdOeNpkAXGE0T/6GLEzX2tug65r6GghtoPDZNpilrkW7EPJWaMU6tCzL6OmQ/AeaMWPlKnd4nSje7hcx5zCBdg8+J+f+HTaLPjvST2hSaLTV5y/omYUsKx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067693; c=relaxed/simple;
	bh=1w9k49FoTu+/FNwh8fqdJnOZWQOe3GEkbod4N9CfdFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5a5rw8v6YVAmt+Ll82pHfCOGkAbgMLYgZuDH/4KtTt19HjJXase7TnD9295yeovT/KO+/4HaHkw3faQZGYz/92z7b6j0+A2DYDDBIBGO8vfjnVdJ5NJdEulGzTv/YWkt8qN5jBRr1Ql01c6jatvKVzXVA2PcfVVztDJ0hyGKCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AYyrBXmh; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AYyrBXmh"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40b1c099511so1563491b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751067689; x=1751672489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNbL5PGqFNoHzfRCAsoh2AXUDM6lXVyWkMQwcXklKjI=;
        b=AYyrBXmhI5Tdi5pXytgQSVzDR9M1qHo1nCBt5p/JGVVd++Hy6XRa0e32kWe0QLZnOk
         DjgImImk1ERN9RmI+pskjtY4ig8IaGbWNbVWyqlK9F4yTHqseP/us73j/+CICE40rBrn
         JmA+sVOYET5r8zlYB1ndxP+DVEhonN/oIFMnKVqjP8LXt4mxsfxXSu1+QvHc9SwYuhAe
         A/vSRMLHZbo5cFqXajQ5KaoxZoX9B3K9/Nr7XqUGEeOow1EWuj2fIHZJLkC+hHmykLXQ
         RobMhBnd5g8163ZCqOq7hVoW2YL9yUQZkKSvBWfrwmRRF7+U234Q5gJYUtKTYbzN89kO
         dcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067689; x=1751672489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNbL5PGqFNoHzfRCAsoh2AXUDM6lXVyWkMQwcXklKjI=;
        b=ZsTpKwdx8MC7VeZ49NM5Scx2fmF2yJa3lDMb3pWy74E+EkDcrN1SbEhHjjZZe0g9Mz
         0SX7uyhSkkivTJz+clIeKc9luoamDrnpgtrrnVHevUR6WyKDdTaToAIHcmY/HmfUzKVz
         Yyns3mw8O5pSmPN77VWh8G3j1+b2BJdiLbVp4BfxqzavJ7RVUc2r/PwHW2Tzvs4QPjiW
         OISOv4XNVeniP8h9cyx5pbN+auua4KHypd7haw/52SrttdBC7SfhWO21hfwCNLRX4EaD
         j+g005Fy3bK2dDxu4GDcr2CgIvzdYSsN+72yJ5NHDiUn9HQUZyFXCpUUU1SbDbl79ly5
         2TOA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZ6sKPN5gT1Ebt5VNNtYUU9nrfD+g+woF1nbqKzT+2PypxZsEjiVrfPN+cCJeZ5lvkR9oLcjQ6tqRv28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8oot7PX/MT1/4dxyVklsJjf7vDtOHfNGM1x2UND94l4bwfoNL
	KHlPJpHR3lsAiqFnRxei/VAv7pXVsvj2k2I4TW611WojZHQajzguXt1ZP9P19K807qg=
X-Gm-Gg: ASbGnctFaE7sK5MzS9F5JQ/cVRUIUXyW5Hn8tl4la8Ug8sQFFXYrW5ZErdmvch8H3bX
	K5MyDi7SFI1Ek8nsEc5Ogtxz42oEeHr1eEKakV3Y2lwtinCY/KIglM1fP8ODXUEyPdj0vyaeQh2
	bECMMU0k280jyTry1x1mRW0wt9p9msykS1ZdwV5mxMzsmN/YDuKUSZeOQpz4sfq5X+NjL830zY5
	SBJymvR7PM6JTHlVK6FWl7yJ3zq+vedOS01KTcsCqy76OHu2QPrM4WpFBZyDIp2UzS0u1u+YrNV
	5Gucp3R/5LWOCtxQwvoPQnAxmFMzKRftxFtIgoYetIphyHUOCi/tgI4A/0Ackw4MKfE=
X-Google-Smtp-Source: AGHT+IE7yAgNDxWCpdbfAu7y9ArOuEbulXmCvKPRZ4Y1LCezFJVsZ/pxp8wI03z2qqsNqcIa9dUGDw==
X-Received: by 2002:a05:6808:120b:b0:40a:5b53:6502 with SMTP id 5614622812f47-40b344e07f6mr4141978b6e.9.1751067689519;
        Fri, 27 Jun 2025 16:41:29 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae4e9sm568483b6e.17.2025.06.27.16.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 16:41:28 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 27 Jun 2025 18:40:00 -0500
Subject: [PATCH v2 04/11] iio: adc: ad_sigma_delta: use BITS_TO_BYTES()
 macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-4-f49c55599113@baylibre.com>
References: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
In-Reply-To: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=1w9k49FoTu+/FNwh8fqdJnOZWQOe3GEkbod4N9CfdFg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoXyvtTvFFxTVf3HN3d8mcYeIBpjOEsZtLqO7hz
 I6L5y8d9/6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaF8r7QAKCRDCzCAB/wGP
 wE5EB/48IvAlfz2ZPEHEGilu+LpJo2tza3hSAq8BbMNnerbFXPfA7uMSKR4XIJgMOHwC4/qkMi+
 gY/c9zjHpenIYdxEyGguzsD7t0T2rA79elo3i21y1q8iA8J3swuw+zd3aQboEjB0UeW26XiteFp
 CbNgSXDCNiwVgtOsFEHIDYt5CwFfTX7uAYpO+SYzCtyC0qK+mIKiqm+OiASnUaKBGoBgg5NCFds
 7uePDwtIx45NeZ5UEhojp+Cm7uRT3PH9EiaoP3WbaTmRIcaRvS92Hy2hN7eyvIXPnok44bpmw4V
 12SVbniqSV87Gu+1yf5S4bGzuCG5qLEr36Htis6kbRtzWZUc
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
index 5362157966d89cbf0e602716aaaf0b78f3921b11..64ed8aeb71f7c6ca19fff0438fa5ccce0c1d8f8f 100644
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
 
-	samples_buf_size = ALIGN(slot * indio_dev->channels[0].scan_type.storagebits / 8, 8);
+	samples_buf_size = ALIGN(slot * BITS_TO_BYTES(scan_type->storagebits), 8);
 	samples_buf_size += sizeof(s64);
 	samples_buf = devm_krealloc(&sigma_delta->spi->dev, sigma_delta->samples_buf,
 				    samples_buf_size, GFP_KERNEL);
@@ -543,6 +545,7 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
+	const struct iio_scan_type *scan_type = &indio_dev->channels[0].scan_type;
 	struct ad_sigma_delta *sigma_delta = iio_device_get_drvdata(indio_dev);
 	u8 *data = sigma_delta->rx_buf;
 	unsigned int transfer_size;
@@ -552,9 +555,7 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 	unsigned int reg_size;
 	unsigned int data_reg;
 
-	reg_size = indio_dev->channels[0].scan_type.realbits +
-			indio_dev->channels[0].scan_type.shift;
-	reg_size = DIV_ROUND_UP(reg_size, 8);
+	reg_size = BITS_TO_BYTES(scan_type->realbits + scan_type->shift);
 
 	if (sigma_delta->info->data_reg != 0)
 		data_reg = sigma_delta->info->data_reg;
@@ -616,7 +617,7 @@ static irqreturn_t ad_sd_trigger_handler(int irq, void *p)
 		}
 	}
 
-	sample_size = indio_dev->channels[0].scan_type.storagebits / 8;
+	sample_size = BITS_TO_BYTES(scan_type->storagebits);
 	sample_pos = sample_size * sigma_delta->current_slot;
 	memcpy(&sigma_delta->samples_buf[sample_pos], data, sample_size);
 	sigma_delta->current_slot++;

-- 
2.43.0

