Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108C254B05
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017163; cv=none; b=px4GcB4Cn8S1r57+JdHLGQSITubFD46JMTICD67ej32VURFcA+7I8BGmomDAKww5LNWzB6vljCaKEeZ2zYZfyfPjUzul0dsy1fwHeY10UnNMio+Z1RpMrREzkTR7hpj6hyRfdcw6P3kHSs7fY3QjPHgIzZ68QrCqd/f9ETpZxBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017163; c=relaxed/simple;
	bh=dE+Bh2dLzHZaDfFfGvJCuONf8Z/4uctHMsmHaIg81Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=te0k7EwKbLJ2p9h6IBIb4Zx+PtRTHgChGR4IyNpV0e4K5fpzNbI0d5gG43Ld9JxYxVGeIaqFuObPiprSjgzdawURRLXtOwLdpurqZ2EmmEBRXLU5yZ5Qndvi82bApitySWMF2qRjXGJnADGqJeqAOEyLz/RQmpvcKd4Uh0vFC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UL/t0b9X; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UL/t0b9X"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c1818c394so1373299a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745017161; x=1745621961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYflLc6ZtTC/uqwD8kHGOb9ooOEq6qvp2MOFP8DwFKQ=;
        b=UL/t0b9XNp4dht2NpEfbCUGcJDQfBf+baHZ90TzTQE6P9O7Zey3PDa/f/IvAEj1rMh
         9khCcHJnKPMo4gfbpuIxUE0d/dO3dDPIdomrU9GOyDNIhFZ52lZyBVsfoqKGeW/g+F/3
         aRGgR+mBPwq0lC89ZxGULUP6iRhRJQ6XWoatmxcYR8ezaRpooMHeqooR6/4iAPRy4yt7
         wjisIyXTKUGLZ4/HPBHv6zBoCU9gPYDFtyOw9JZ6EHhxs8OKqAB0qPXEid75bBp86MGz
         itzgWUu09/hvJbCo4juE7gFgDKyTAyYa5t0srHwm2DBe8EXBl8zdGT4sEwHZp2s0e6Ph
         4keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017161; x=1745621961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYflLc6ZtTC/uqwD8kHGOb9ooOEq6qvp2MOFP8DwFKQ=;
        b=LR0IONPif9cEkxsfi8vVTwPv9OczuWs5yHEwdaunJXuG4X2GFL/RwDDzTeBtHrx+9i
         2R6zMBMHEgl4bmV0eXTwaUg5JQBOBYMf83hqqmLX/exU7ER4/i7aAsPO0mGkJE+FSWCB
         0AnNnfqhH1RAOtvkkJsYbzJ6ssDXol8UQlwd9nstfCDYhZTG8ktPczhOK+2rxFtOvBRX
         jaRIrzvEViBy8SD/rJKZPP1c5V0jO2WyVIrZ123IfUBdOOOoQ/KFaSJSTimCXM+XbvFQ
         OFM6lJGAALfXDuYI3G34l5GlRXzV5VWbSul64sZ/P2ELSC2aIMOe9KERGwcVbznvKcLm
         baXg==
X-Forwarded-Encrypted: i=1; AJvYcCX7N49iGwT2qjINcPWoelMnO/yUvaP4GFPTx4apsoYipMg0OXfQaBAZ2x0blAEExD67J7xCgA3u1erBbD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqSXn9IOTOEgS2gf03yfwiOqmPI7+xSUQTaqWyQNThNoNZEoId
	KGv9/0XSKqoN5k42dvL+mbS41mMBYuhQZX2H2ON9XwqcqhVp/IEcLp3EAVjnW9zjRLieUr4ona1
	7+o8=
X-Gm-Gg: ASbGncvKqeAfHdQw2rXs1pCRayRITqbZ1I+I+8goyIK/S00fQfmYFLDlv0rVNtYhPIz
	4n/3dU9iti2l70zQKZ/Exq8PyeuUT8KMbvLmafFTuhPBuUJMVWptnxzPFjDSIcpjDicn+1Ss3v4
	MXT6aHMP/foPAefv7CzErp29X5JJsyY7xpj6P4cIG68xYK9G9tgvK9s14rSZqQdb8DlrM3oXEUU
	qRvz675vC45cAPPCnLzItch4ec7RdK3CkBtv91XYQq4bO2ZomrrC8i8Rnmd15E/tPzjlwryCC0u
	8v/XBqxCMCJac8bDVoO4aRLXHZFhBIb90RmvW/3Ej8yZr/g=
X-Google-Smtp-Source: AGHT+IFyr8tL3f7/Gclxxm0qCx+apQWNKvST6w//YiaITYAopkMwLe+KpXjHV8bVZ+S3OC2Ex+Rp6w==
X-Received: by 2002:a05:6830:658b:b0:72a:10ec:3637 with SMTP id 46e09a7af769-7300622918cmr2588254a34.15.1745017160817;
        Fri, 18 Apr 2025 15:59:20 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047ca051sm500187a34.36.2025.04.18.15.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 15:59:20 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 17:58:35 -0500
Subject: [PATCH 4/4] iio: pressure: bmp280: use IIO_DECLARE_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-4-ee0c62a33a0f@baylibre.com>
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
In-Reply-To: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2758; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dE+Bh2dLzHZaDfFfGvJCuONf8Z/4uctHMsmHaIg81Wo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAtk7JE5s2L1ct8bmryT0sZgPM26LmpBqyZcvV
 sJfFqw7IoyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaALZOwAKCRDCzCAB/wGP
 wP+MB/911j/8pWylCV/OBlqSeXb8qXnXesTzGfthr0UOUhdXRaPH4alE6i0zLQxCV9juG5aEeQ+
 HIwQ/YYY4vz2o9fdKwdeeI28nPOnDaZoL/S5U+aMwQXkWQ9XNtpHKe6FGI+PMWD2KfXcWxJYddW
 XakmXPOQBMwiSha6+k0c0dX44Nqo3xADjw6thtb38cBoiLIMdIHGQzojL6XbOD5d4mlup+pzp0y
 h07zm+u/2MobSqFDb/ag7+5vJvy08cffFWILTsSFhf+SnhZVrJ0EuQci17F87JY1+b+9s7EJEOe
 667j+A32xQ7dnjFQoJo/Ibb4mjTUfVJQY5gISdYggw5ZYigB
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
and understand.

The data type is changed so that we can drop the casts when the buffer
is used.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/bmp280-core.c | 8 ++++----
 drivers/iio/pressure/bmp280.h      | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index c20cc4a98c9c494a9c8843518ba2f17b41be18a9..847340e38fd069643c3d38037dab1bab727dcc8f 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1107,7 +1107,7 @@ static irqreturn_t bmp280_trigger_handler(int irq, void *p)
 	struct bmp280_data *data = iio_priv(indio_dev);
 	u32 adc_temp, adc_press, comp_press;
 	s32 t_fine, comp_temp;
-	s32 *chans = (s32 *)data->sensor_data;
+	s32 *chans = data->sensor_data;
 	int ret;
 
 	guard(mutex)(&data->lock);
@@ -1228,7 +1228,7 @@ static irqreturn_t bme280_trigger_handler(int irq, void *p)
 	struct bmp280_data *data = iio_priv(indio_dev);
 	u32 adc_temp, adc_press, adc_humidity, comp_press, comp_humidity;
 	s32 t_fine, comp_temp;
-	s32 *chans = (s32 *)data->sensor_data;
+	s32 *chans = data->sensor_data;
 	int ret;
 
 	guard(mutex)(&data->lock);
@@ -1903,7 +1903,7 @@ static irqreturn_t bmp380_trigger_handler(int irq, void *p)
 	struct bmp280_data *data = iio_priv(indio_dev);
 	u32 adc_temp, adc_press, comp_press;
 	s32 t_fine, comp_temp;
-	s32 *chans = (s32 *)data->sensor_data;
+	s32 *chans = data->sensor_data;
 	int ret;
 
 	guard(mutex)(&data->lock);
@@ -2957,7 +2957,7 @@ static irqreturn_t bmp180_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct bmp280_data *data = iio_priv(indio_dev);
 	int ret, comp_temp, comp_press;
-	s32 *chans = (s32 *)data->sensor_data;
+	s32 *chans = data->sensor_data;
 
 	guard(mutex)(&data->lock);
 
diff --git a/drivers/iio/pressure/bmp280.h b/drivers/iio/pressure/bmp280.h
index 5b2ee1d0ee464797d1d9993a014d8f84c37d5596..86ec525ae40d92cc562e998dbe992f091343d88a 100644
--- a/drivers/iio/pressure/bmp280.h
+++ b/drivers/iio/pressure/bmp280.h
@@ -456,8 +456,7 @@ struct bmp280_data {
 	 * Data to push to userspace triggered buffer. Up to 3 channels and
 	 * s64 timestamp, aligned.
 	 */
-	u8 sensor_data[ALIGN(sizeof(s32) * BME280_NUM_MAX_CHANNELS, sizeof(s64))
-		       + sizeof(s64)] __aligned(sizeof(s64));
+	IIO_DECLARE_BUFFER_WITH_TS(s32, sensor_data, BME280_NUM_MAX_CHANNELS);
 
 	/* Value to hold the current operation mode of the device */
 	enum bmp280_op_mode op_mode;

-- 
2.43.0

