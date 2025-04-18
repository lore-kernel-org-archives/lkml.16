Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CE22FAFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006391; cv=none; b=WMBr9MRsUqyyEkZXkdKnicgejtT9q78t7Yx/WMj/4pMIBypgePzJCRg4hEVQtPuXAvY/C0FuEZBWtBxX0K51GVt3aCKX4OhIGGnAiA5F6FqY2F/GLkLKTnyfi4cN8eK3XGH88uZMLssn+eRP4r+ww6qbSO3zUwCA9QTvJREYtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006391; c=relaxed/simple;
	bh=uGEGli6agFbSIEZPgrYVG1FE8mDYaDMCfJyp/lazgiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jjj+TGfy8fhEZnVv9Z+J3BZUS7P+xWnMlrSI1ylQWK8gvd8ZvmudxIcobfi7d2MwchXvgfQkNbzXJqG248WGUcvURWnvcrRmf3JsRjwKPhnjcyamGJCGwNIqH1ry0HRrEsH5CDqYZXPVGSGFR+wi0oi+KfsT9QA9x9f6lbrG4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HC3P4PDu; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HC3P4PDu"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-604ad0347f5so521840eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006388; x=1745611188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
        b=HC3P4PDuwWjmZHn1NV2atHpeI88rsWvlQjNqT6Kks9smJm2Yme6gsTUe967WKG+k2X
         oKg3+/1Ao1jvMbWk6TWMPnJ2RJ8ORTsf6AjGARYr4YYhxqQciv56FCeYQx33wK4DOdJA
         qkNtoxXFv9MlG+QxuMoPCUDG4QPeR4sAXovkSdf53WG450xxiDb3/RvvhOGQcehWP2GY
         aBXf6fzoI3u0rj3nVyfA9mxpZlfBwKMU4wbpEYn2A6wPm9oJiRVBD8+6d8yBEJWbi/MW
         XytFzwz0vEHBHNG4VqSeIlxG1wwNR2t6NmLAJbDUCYt+P5ouCqArny87lO7HzH0ZW9Y4
         cDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006388; x=1745611188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
        b=dQygOYy/lvDiBdf0bP3eDqvAKbyoE6/xpQMBogDdMMtQfD/6lXyiG6A4mWqawONLyG
         26wegs1GHIf2Zd+HIbAmcvBsND6sF40tQqEw4uB7WFXZr5akRRlo7DWgMg5Ufvzb2QMQ
         y4U09+QnUWCHSfUhBe2SWdSfbbSOHFWf9KgrCnGnn1sVrzkhZQ+zuvovR1WD6pQjR6nt
         B754rBrt6JBtHKFRY21LrS5pY/UpbNfq9IQ5vXHTchQkqNdEkQtrPgVdW+fFX1KEAOVx
         IaA3SQqn7IYY0Tokn8sp00hEDlLhL8D69na+7YiiVq1p9ILSIntzLXXeaa4b96S1b/sl
         Wdvw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ei8u0TEMHfXWbN4wKJSJ/H+7nsJn6L9X8342J/jWFNg0XMOXERheGBfYKOSGU6RJSTs5jayMF/Svcrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YysTHNhChx4wBpLv/ZlEb9ui+x/ocuZyZI5KAQLeeGhcqiAwrXw
	wRrjKm2UmkBQJWYunFRrd1TdE4IR947bpY7vkExuXby5x9xv2qyWLTIFvDbQKpg=
X-Gm-Gg: ASbGncsRD/y9pFZIxRdiQxdjfnf+BudIETqjy0HLLjcpM2SsdlE4WsN1b5wCVcqkaI8
	3/ArDzDZJl1vNKxTZe01Ruy0m+wBmsHqpgoh1vNanZ6f0jLXDm8P3k8OMlN8ScN0eSo6xW3wBDo
	yZGFyqxxx18eIXoNVElF0rkmsVpX1xuhgJJeApt0zbwXxIiyq74VdXaOVYiT/sNO8N5bvJdbP0p
	Pjx35gkgMQl1btfDBH/F/5Hwivc1n1u9p4EpMblTYjtwt2lJ9XqFTK/KUhEH9uiEdN7pu12z1dS
	b1+ADdh6q1iiYVXOF5y+iNipqX/OhzJyHCYkgJGOQ5vobng=
X-Google-Smtp-Source: AGHT+IFj8rQZMZvtPmVYvlswaBgMb9r1fm1cQCciAYKz5X9YEKQwhLXdNPStKbPWJNkdDXJj7/qY+g==
X-Received: by 2002:a05:6870:9e0d:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2d526e0b311mr3083100fac.32.1745006388641;
        Fri, 18 Apr 2025 12:59:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:21 -0500
Subject: [PATCH 02/10] iio: adc: at91-sama5d2_adc: use struct with
 aligned_s64 timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=uGEGli6agFbSIEZPgrYVG1FE8mDYaDMCfJyp/lazgiE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7vX8GGgAAxPwrJ/N9bdFji+tUrDObD7oWs0
 DvLOxngo0WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu7wAKCRDCzCAB/wGP
 wPcDB/9Rn9JB9hcWF+vXoNFbgTyeYaeIohNCTpSNvM8pHIkYDyV+bTUeYPRDtYP+ubhiUNbAVy3
 3VZ841HJG9nqewSUOCOlBAE5AkziGAUm5bSrkL5ifXr3DSLzxkPnrQ3Ao3AiutbhF1sclOUJ3ye
 nheGCoAyzEluF3FJD2g70v8IDaD6bh6vaEe2yMQL8BSBuuaP5NZQw8HIM6Ek1xhsC1GWZ86urbo
 8Xxzad8bX2Qv8/zWuuH7qTCszseLNJdsXQXnyGDF5WJ/xCTvHU0VOpfaB/PB1RPj58Y97aA9QDD
 PTkAvQX6xnNlTfsPVMqA6uDJtbSh6vQzTQnrXLTEGHqPBUM2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64 timestamp_instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..07ced924f7a6ae36fe538021a45adbf7d76c2e69 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
+#include <linux/types.h>
 #include <linux/units.h>
 #include <linux/wait.h>
 #include <linux/iio/iio.h>
@@ -586,15 +587,6 @@ struct at91_adc_temp {
 	u16				saved_oversampling;
 };
 
-/*
- * Buffer size requirements:
- * No channels * bytes_per_channel(2) + timestamp bytes (8)
- * Divided by 2 because we need half words.
- * We assume 32 channels for now, has to be increased if needed.
- * Nobody minds a buffer being too big.
- */
-#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
-
 struct at91_adc_state {
 	void __iomem			*base;
 	int				irq;
@@ -617,7 +609,10 @@ struct at91_adc_state {
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
 	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	struct {
+		u16 data[32];
+		aligned_s64 timestamp;
+	} buffer;
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.
@@ -1481,14 +1476,14 @@ static void at91_adc_trigger_handler_nodma(struct iio_dev *indio_dev,
 		if (chan->type == IIO_VOLTAGE) {
 			val = at91_adc_read_chan(st, chan->address);
 			at91_adc_adjust_val_osr(st, &val);
-			st->buffer[i] = val;
+			st->buffer.data[i] = val;
 		} else {
-			st->buffer[i] = 0;
+			st->buffer.data[i] = 0;
 			WARN(true, "This trigger cannot handle this type of channel");
 		}
 		i++;
 	}
-	iio_push_to_buffers_with_timestamp(indio_dev, st->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, &st->buffer,
 					   pf->timestamp);
 }
 
@@ -1643,7 +1638,7 @@ static void at91_adc_touch_data_handler(struct iio_dev *indio_dev)
 			at91_adc_read_pressure(st, chan->channel, &val);
 		else
 			continue;
-		st->buffer[i] = val;
+		st->buffer.data[i] = val;
 		i++;
 	}
 	/*
@@ -1691,7 +1686,7 @@ static void at91_adc_workq_handler(struct work_struct *workq)
 					struct at91_adc_state, touch_st);
 	struct iio_dev *indio_dev = st->indio_dev;
 
-	iio_push_to_buffers(indio_dev, st->buffer);
+	iio_push_to_buffers(indio_dev, st->buffer.data);
 }
 
 static irqreturn_t at91_adc_interrupt(int irq, void *private)

-- 
2.43.0

