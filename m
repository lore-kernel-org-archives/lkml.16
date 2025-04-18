Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C132253B60
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006409; cv=none; b=u/aJvFLmqhQfZn2BMXW8FnfKI3/JSVUVk0kGUBP2Ns5FR43B84hS2AlMMZpqE1yRY+43ChdPmSRJ0l7TC6v/XDYXweC0YXSGd+ddoED3lcCJslD89XnwaCkYQrP8uQtkQdIoZtg7GFAjBDrU7bhUnXxl6c2wwFp/F6g5u8Y+/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006409; c=relaxed/simple;
	bh=ARIVPfAYjojNb4iBMLsUhX2LD/OFISQyTpJFmR/jUmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlZ2Q/ywR5Xa+ITdAdSiC8x5Z5vIY8x8FGn//Uv9t63nqEyIu9wBcgBTOVBLMd4TLuZ8hCmw5hIAytaSE2VJqAmaHcKmc4spM6I7p9+k137hR7LFT+5Cp0ljhJkqN48pnxZoHoSVFX85ypZ7FoGUcyjhYJkHqRi9BFRJngvar+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SssKJbLt; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SssKJbLt"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c40235c34so620415a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006406; x=1745611206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
        b=SssKJbLtZ/fQqMg9QAKLKEvWhqwja9r5RRZn9WtTwnuObFLmGdtvLyzu6DM/DyqFES
         efVdhR5itnusXm82JzwgNiP3iXxnnA0QkHJHCJl6d7fx5p1EDwkN4ZSApCSozARnGDWN
         wKPNB7Gr5j8uLGrabkp26Is+75/fYop50YhOPSdOOI+1AhQaLC4gRf5g0/gRLK3dunZF
         xwrMyADK3d7993Sg2sK27AjfdpKJ5e9xCmg1yK9kuCGaKuE+fCgX4iRxh/dacxwGYiJ1
         wqc+xLp071361LddX8Ak0Gi2drfdklTjFBEZEVa3Aq+G52qLInKy+wMmVwpPxB+qRpSs
         r6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006406; x=1745611206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
        b=YxnAdl3Zr/BvR+lvQaRjuc7IY0WzocclsTDAIHINVWw2AVmzYxUUzQIXMj8e+05clm
         7tTJrzS13hRovhEDmcYoWA1zxCmBMaaKKgt9I2awpQto7DfEXtXXBve7PPdfVffs2Euj
         g1JB7WqJGJI7kAJuXQ6r/+P9WYrFYiKP1o+g8WR55WgptiQ7NmGRZo8zkt32QR8s5QgY
         AY3yRD6UP9oeysg9ez8iLXlVZCva0ktj6On8WQc8TEtDP4OVr05AePlatEKssqiphyBx
         Pm1sqANAB7sQyZ7HllL2Qh+6/IPTYNVq8lh9pz55deUwu7byUewAqWf9RXAp92jheXU9
         S63g==
X-Forwarded-Encrypted: i=1; AJvYcCXucMWmJACri1kNoOn9icplv4d5G3bQOb0+/vYQAFmEEm4Sv19XdWQx0okd6+ABba9TduNF6qiOgpBmWyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOO0CHFFaG8TCCtkgc2oSuAI6egi7G8m78vodqeA1mrj9MDKn
	cqmcn1/O9dOEcEKsFmKU65vNEVWa0EYvyIxFy+vN7Nn97AtYcKTZSiCQjHqRdTg=
X-Gm-Gg: ASbGncsXl0TvLZ8XjZgbKa5bm1ofMqqMuOMnOm/tXu1Dk+KcOOZSDjvYV67BVofuR3o
	+4y7/hFqHDAteVahZX9ZPEQCD3Lz00gdrshlj/HqcPH658lbFflHVUup8MTQy4aMGZ8f027Uewn
	eHKP8wyNtmfJddq21Lqq62vbaLvF36sfrEtwy8Nb41xsVrUSch3YpYq7b24hwRg67r+HQj04x+R
	Z4QPBwIS+qJ4IEjP52TfyYIScvPFQwIGSC2E2ILe0NW44ftsU6ooWL0jaA9peX+ahx52ZRIbNpV
	FeeFvsx2PKNlwFIZQvZqzW4DOMLLrHxrlhyairFPll7uszVc/13Ls94btg==
X-Google-Smtp-Source: AGHT+IGyvAhFlRCsX12Lhwr22tKkpHolc2Tt6LGi5+wwx4p3gTPOGLhHmLju7HF0T94FQvgvVlBiHw==
X-Received: by 2002:a05:6870:4413:b0:29e:6547:bffa with SMTP id 586e51a60fabf-2d526af61c3mr1982271fac.21.1745006406486;
        Fri, 18 Apr 2025 13:00:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:28 -0500
Subject: [PATCH 09/10] iio: adc: ti-ads8688: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-9-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ARIVPfAYjojNb4iBMLsUhX2LD/OFISQyTpJFmR/jUmA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8gnMqNGtdNT2ZIPYnYVdyTTiuNmSwk6ytsh
 TVb3PrODfaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvIAAKCRDCzCAB/wGP
 wBNxCACdVaOqC9XUOO3XNtkEYvq9VgXfioFD1KTARQagGK8F4RZ52Ql+vvMTIfwlpvJZ2gt1C6p
 2H95DFKR9LUWM73Oc2uor9X8qIw+B85vCeAZAV4Ux5UDRP16K0Q7Ick+F/d72GPdBKSM3cnPUAq
 wNHPB/7otHliUHUsABIkKUC45xghvbM3+0JbwXMEuLAcC0xgu3XU2XGzKcuqbj39kBioJKPOLje
 7uhR6CGsgbp8xEjN+n3V/Q9CdEC0y1JBy7RPnbUXTJkQiccRgPr7kgv7T+7V2Qm3YGDkxz7YnDa
 0zhX+IsfH+cnM/RBIpCAFz6Fa+Uz/hbt5JnBiJfw2/EJvSyj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Changed from struct initializer to memset() in case the size ever
changes and there could be holes in the struct. The compiler generally
optimizes calls to memset() anyway.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads8688.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index b0bf46cae0b69eb1fe8d7734c8a32ac642c5d0cd..2a9cb7d9bbfae4b282682d755992acd47fb88b99 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -380,16 +380,20 @@ static irqreturn_t ads8688_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
-	/* Ensure naturally aligned timestamp */
-	u16 buffer[ADS8688_MAX_CHANNELS + sizeof(s64)/sizeof(u16)] __aligned(8) = { };
+	struct {
+		u16 data[ADS8688_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	int i, j = 0;
 
+	memset(&buffer, 0, sizeof(buffer));
+
 	iio_for_each_active_channel(indio_dev, i) {
-		buffer[j] = ads8688_read(indio_dev, i);
+		buffer.data[j] = ads8688_read(indio_dev, i);
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &buffer, sizeof(buffer),
 				    iio_get_time_ns(indio_dev));
 
 	iio_trigger_notify_done(indio_dev->trig);

-- 
2.43.0

