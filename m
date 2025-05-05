Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189B726B0A0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462768; cv=none; b=YtI9HJ1UGRKyxgE0nPXl3MAWdJAFfnWjZvL/tTKLDQu7W7h7yOHJBmD8w/tfJIA7+lFMx9hAbe6MHGuu5cuOCa5W1oiV3/0em678u32YB8w30Efh06ya0ANcjwPo80n1xN3AKp6tDiU2JKrKTD/1Gh15CSqDc1Gld5gX4eEiwvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462768; c=relaxed/simple;
	bh=190oW7EKQBK2cT++cC5GYqS0UzCs0C8IHqrc3B+wC/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFG7JIG0PkNiYFl7Ydm/GPq2UlB6xvu/RTqT7H0YbR6OO9lP8LyxWSXX+p9objStDCauC6stq/9avkV2XY8kFuKdMgunnMxZwkX1K8bVXZ0RNDVeK4y72kSw7tzFKlXabWLjCLnoPRqqHTBB0o0I5sNNin+O7UMIRc8xvqeSGs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yvhX9XcI; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yvhX9XcI"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-400fa6b3012so3551440b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462766; x=1747067566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbiKfNCGbqClWfG31adrWThk5ngEJnmGvuTSBtroQo4=;
        b=yvhX9XcIcO114fo8TKt5QlM/0PRLD373HsY2rU80rFthUgoFuqKMKFXQzS4C9s3nbk
         kzkAdBioxv9KiljVeiv5g4vlLXf0mo+u7So1ulXyCItewo3JtFcLwrAWdqj7dBasxMht
         1frgFLQcgMMqjkZ5IVf8bd1Kc01/f2BQHPtDVj6UdH/M4ytAV67A5dGYWK6I8fice56S
         YIu6BlbcaBpoJ1UQtIMx+EoSQQnvWuj7aTdgvV7SHme4yZWVdjVzM1MfWyZqd5K3X3lj
         dy6ad2eIeDb+PaCImKfcJAdJFu72KO3YtsjvJmBjdBvOWlBDBrLdW1xR3SrsCPNEqb4/
         XIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462766; x=1747067566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbiKfNCGbqClWfG31adrWThk5ngEJnmGvuTSBtroQo4=;
        b=cC6s6PBaEymOFYhc1tOOLTY7sLVi1m0lHb1qk+bEr4HGhCLNzQWIg+cGP6ColgUSyy
         nlxKZrTFUPum5g6WklcPiBAcV+yhDCu+Xa0fgLOw/YzNShXzj1a9pJ5gjrJpYtI8FzRp
         pA/KoMLtXmWc0AiHHhpfW97a1WotI41lW5OkwfNAFgYT95zdUkRm0KAP52aZdVqMYkQc
         JmpLEdoNnZooBJKmQAppnMFbuxqbfpm816Q9QhTItUdO+WeDus6tIZV3YIEv41O+ZlxW
         uUYXqmpIEImYe2LXsRLZosFZQkSWNv1BAAvGilnO40Xa1LQIFMF21Wwx2JYFg73XE+Oe
         X6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWzTIMqNswG+SkKCknvO4ekNc7o1PjMtqe3nMCgLqUme52PoI1y2qJhG/Q77MvSBqPOHQ6IVwJc2syxSoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSC4jchdE0DZYqDOmlQkZ6BLKJuvrkLHfNfVS3WMBeCPHQkrfE
	RVkQtyTlzHq1ui6x7mOSfIPgBi87a9VgSBdoP6Un2EyMogulZZRNnrn5xxnGUaU=
X-Gm-Gg: ASbGnctHTeaJ9lBiqLlAnk6tgcG1iYtJwx3JhDHttiqr3sBPuJBYWYwnC/3nF4JHB0K
	h+4ZVpnr/1+dPQq4lBJzfvcP82NFGK1No3BaR0jsMo9ATll8dwYr63UW8LnX6jHBuiI+8lxRyX7
	MsYeCIhbA0HTP8GzS9+1FVUN9ElzV5w3wThgjLGo6zotBtIVxMDbbSne3Id4fhedUv9uDov3WTA
	cmWD1zaOKSemedfkvWIojoeQlX9Vtqv7HoM7UMweacWLv9+NGiOmhoJq9rGDehOAQfowBHHRe09
	Kt56PTyC7VIQeMHedZK/5E3HkWLi+1XvdXkQVrGWR45cTQ==
X-Google-Smtp-Source: AGHT+IGjVvx13O/rf133nL3urpzlzpZTfLRHIzG/5ZXSnqMUPazyvAzh0R6WlxrPiFRp18aa2mb6Tw==
X-Received: by 2002:a05:6808:200f:b0:3f6:ab0d:8db1 with SMTP id 5614622812f47-403687e92a8mr106932b6e.3.1746462766163;
        Mon, 05 May 2025 09:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:45 -0500
Subject: [PATCH v5 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-4-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=190oW7EKQBK2cT++cC5GYqS0UzCs0C8IHqrc3B+wC/U=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOgNgp+O5onlvKdwSMSAuSxVRXfym9gmQnerJ
 CwXAjJsRDGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjoDQAKCRDCzCAB/wGP
 wCzGB/9tkNAu3L/NYL4jUrJdPuq4kd5U92kII2ncj9G+E8nygqUsgfvB8ZVCttp2uIGhWPa0KjU
 L+FgFikSr5TpwK+Dx+I9xp0oHZvKGMWhG+vFSImOX4ddssY87CnMto24juggEDAIVO0Nr1SDTRN
 pqYXD31idseN7tLXHs0YRZr2jqf5pzbj4eaFAi5HOhZ3EfH4MmFFNvkhbfsA1CcKGL7LYJHc4ty
 LBDkdk1VL2vTv2TVXt1cw6t4a1oyRqhzW0q10pgQuwzxpjUH1bOmENiAQLTKWqntQFXOlVBfKwF
 SwTPdAUlIgd+3/HpuvBvsIAik10kcLajLaNABIAPw9tXT4Hg
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
point of confusion that this macro is only the voltage input channels
and not all channels.

Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 992abf6c63b51dee222caf624e172455fb9b9900..cda419638d9a88debb3501d05a513b17a4ecde95 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -105,7 +105,7 @@
 #define AD4695_REG_ACCESS_SCLK_HZ	(10 * MEGA)
 
 /* Max number of voltage input channels. */
-#define AD4695_MAX_CHANNELS		16
+#define AD4695_MAX_VIN_CHANNELS		16
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -143,8 +143,8 @@ struct ad4695_state {
 	/* offload also requires separate gpio to manually control CNV */
 	struct gpio_desc *cnv_gpio;
 	/* voltages channels plus temperature and timestamp */
-	struct iio_chan_spec iio_chan[AD4695_MAX_CHANNELS + 2];
-	struct ad4695_channel_config channels_cfg[AD4695_MAX_CHANNELS];
+	struct iio_chan_spec iio_chan[AD4695_MAX_VIN_CHANNELS + 2];
+	struct ad4695_channel_config channels_cfg[AD4695_MAX_VIN_CHANNELS];
 	const struct ad4695_chip_info *chip_info;
 	int sample_freq_range[3];
 	/* Reference voltage. */
@@ -157,10 +157,10 @@ struct ad4695_state {
 	 * to control CS and add a delay between the last SCLK and next
 	 * CNV rising edges.
 	 */
-	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
+	struct spi_transfer buf_read_xfer[AD4695_MAX_VIN_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_VIN_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0

