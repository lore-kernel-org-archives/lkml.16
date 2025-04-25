Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEAD225760
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615386; cv=none; b=pfLRk5yWiLqGaXQpBVeJNoDv5/Qd9RtKmm5dFYbr9MSGuGFa7ZmBrs3LxRpM+WeB+9o50IuuTh8duyzgZ6UgdH+sWn9EDFFuNUAiTnkRc1ZKeI0r4S0bPHkpLRkbzR3O0KInFztxED52RLxWpF6ifhfFIGsNAZTEtdOEv1+WJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615386; c=relaxed/simple;
	bh=0ZROZIYuD1zVkkOa3PNcABnV8cSDGoSdT6l8Emh427M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZxxzVqV98MFkx07fkF+JR9qr11hOxr+d4Bdgs0rUzlCXLG/Z2obnty1li8HjqrxadtLLDgW6Zl7ZGLx+20bGtXQCwFnTQFPe/jlxNn5TFSiCKUi0tc4RVwDSgDe6iXVS46lunzIGasA8i0acGFGzwlO1mQ8M0yR0QoaDX5ofXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vKXB2QmR; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vKXB2QmR"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7306482f958so271481a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745615383; x=1746220183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=;
        b=vKXB2QmRYtA9c9Z/Wn4w8X8PRbsEtCUGIBr3C7SbYjLnRs/GwOcqzm06E3srZh7gsK
         Mgd+jAgoD+alYBFHAnHtqRo9ZJCZyHFhyQg6hfuYlchH8otJ9prZ3NRaJlN64qhgXEf1
         78U6UNYnULRggx/jsQwggk2yCrmPg9f9kH8bTV2DFkBHB6dxkUNvLA9jv6eIx/xnx7Ib
         dNjfYTTkGGp57H2ZJGsNcdDQPaXUqEhgDLeq2H54Rpe+zNq7XhFqbODom0ewwPHD6AVF
         BXqKqOG/1Xze/g3M9HtaFwUY62CR1+tf1/bwTNFCvbXafi76BvfQznjC0rnjwGKDK1yF
         1+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615383; x=1746220183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLGFE4jWdVqehv02FfXRMamFv946mVo/oPig2GMtSpQ=;
        b=oOHqGFvFQawNvQmU4WDr41H2/sLv15KuM/YXq9w3/CB58ksL0HcgGxxK4dF+2qdB7G
         FxKg+32b/9DZBT6XvnX8tMRvKs38OZWSTZxcE2KthgVfcwDfHe7UxzCd6dY4H7tEdRmQ
         g7RePbnAQauG3T26wjkLrWCBYrpUAiu4jpOZWR/70o52QSzTCerN3UBtSFKcPyDyRsre
         xUmx+b6fRoqsU20C40CcimW/JcR2G1CRlfDpDTkt9ydpBhWqMjHnsjqKa+aX+QwL0nOu
         KO1zTZ3RALkzmsgo9WWvrYVhoorkcYkWAx1/n/1XZymQV3sxmIroltANgElrD3FKPr+h
         35Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Uq/NW/BGiqyibcgiEJAGJINdlkBmYanvVcQ0mlTSJLtvpBisnAuTFgHnYyzPempp4R/YjKu7HjlbmoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPTLZ+SJot1J/V2FerAyMsJLUUMFrVLwdtsDtt+ObuBb2e/KI
	hKsnzaC0CkLRS7IhjskEL2ZaUtv7kw1LaLh5tdldWF32ZvjcvJZL9StFfxVmxdQ=
X-Gm-Gg: ASbGncstyUxCmqzS/uKc+2RdBMRa7dTx5Ym/dnSkVbtvKRq2JElg1pEsmOgUuQL2/2V
	0a18pPI57SC+ub0OZ6lB55/zKWKlcGJI0n9Zk+fFP5E6KLN/KjcBMIlyL8mJLY2MEs0WtlPelSe
	edNuxlK6S6GywSRYGRc+cWMCHOOZaETmXZdoFk9yldYbwPV5m/1KHpx9Y0ghXUMcG1YzMIwR8VB
	O4ONk037Ks2OdSojY/VlAcw2VO1sGnVjNvqIJouNpCG+xtV9VeLQIOo2OjavZ2So33kg9R+DYUV
	kQe+HUg+6/Bpl5+DBKqFaFnNAa2gkKfrrUtrqJZ+KcACBWhnALcPzdY=
X-Google-Smtp-Source: AGHT+IHuXyKh5ZN8gTfHG9qpfrVJEoH9N4Qd7+y62hF7SPBuooeBppTq0ItxP6Q1b31VLKNINSFoXg==
X-Received: by 2002:a05:6830:7008:b0:727:3f3e:53bb with SMTP id 46e09a7af769-730652484d4mr866727a34.24.1745615383552;
        Fri, 25 Apr 2025 14:09:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:96a3:e28:3f6:dbac])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188052sm847673a34.8.2025.04.25.14.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 14:09:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 25 Apr 2025 16:08:48 -0500
Subject: [PATCH v3 6/6] iio: adc: at91-sama5d2: use
 IIO_DECLARE_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-6-f12df1bff248@baylibre.com>
References: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
In-Reply-To: <20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0ZROZIYuD1zVkkOa3PNcABnV8cSDGoSdT6l8Emh427M=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoC/oJEty80tyPXVTdFqZGvPX6xqzXo1bpiUv2M
 CaUL8XvOzOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAv6CQAKCRDCzCAB/wGP
 wBvoB/0UnRiw0riUGqhqh/XDIPZR7uCez6zobleSUHhagNRfN8sY4l8bawJc5MlIgLLbl8FhYhd
 9/eqeGougvJ/jGQ7YqbmoGTbqoYdi2YQLw4l6W2w+G3nkS66Xg8/LGPSpILZy6RAk97URQr1IhJ
 g6nc4HSEde06PLI7VFJIn96AQxa6ztR5vh8M9P8G/WK2rCC1xQjGyei2MpR7S5YAm/W1O7k/c2/
 Iiczy+BYuiFS1g/LIhku9hvc6zrrbuiXZGQPUi7BDWz4SQijbCiH0Fi3R5SmAPY2a2o0hle7l/w
 ov1SL+pzWf/yX2jcoRIE9yleZxsrAm8YkUcevoy0zlrcxau4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_DECLARE_BUFFER_WITH_TS() to declare the buffer that gets used
with iio_push_to_buffers_with_ts(). This makes the code a bit easier to
read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
This is an alternative to [1].

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com/
---
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..4ebaeb41aa4568e2461506471af0540af9d1a041 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -586,15 +586,6 @@ struct at91_adc_temp {
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
@@ -616,8 +607,8 @@ struct at91_adc_state {
 	struct at91_adc_temp		temp_st;
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
-	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	/* We assume 32 channels for now, has to be increased if needed.*/
+	IIO_DECLARE_BUFFER_WITH_TS(u16, buffer, 32);
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.

-- 
2.43.0

