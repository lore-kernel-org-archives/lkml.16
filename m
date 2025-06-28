Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96526056D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751133178; cv=none; b=jCbpACfj6/GsRJgFACTEHpRtUBh3zmBaywVP043JeYpNzDP7A0f7ob0DEI7xomF0zPj1t8v9ybshNy6bCTqEEAuqV1GoT5s6dc6YdrpoWF1sGvEswUuE2ZczMtNQS8vo+QNdo2x3pul4y56SV5lLc+xuP7fLSbo/LouhXuHRi+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751133178; c=relaxed/simple;
	bh=HwZVNJRHlmnj9p9W6rHIwbWpVKaSVUJWBS6DuaB3HeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqhqTjVjusB9Puod77kK1azc4Vmst8MDbzZh8uKUZ8X69tZhuwyL8aMazsYDu3MG4ES7fdIP7pg+XohEF/vYHqAb1HTPdWGTqbEJgxrWVIFTIIuCY0MP7dmSBPCFjHpDL0zZVbfPtwWcBPjVZoiqpQX2JtxEEytwV71FgExSkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0u/vyFaq; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0u/vyFaq"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ef60dbaefbso595855fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751133175; x=1751737975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuUZifK2n0avjWFvzjHdGhgHXYgsXuK/FTKAkLBN1FM=;
        b=0u/vyFaqDJJjhpEfOWmk5W8u5ihubD7Irzwy77MKxtU0n2gcHqGzjNC66qg/E5o9gh
         U6nC1qJm+yEJ6V7pRvrEuj8ok/ZmEXiDkc+/Mc3GbQuWw9RwPJfLzR1b63Eqx8BQh7Ao
         he7PYNf1MYpe8uGqb4eMDIoWxzQALsinIKoE/XSEDl+tOhJ91+Q8K6joWorM/mDthLTO
         2BybzaDRVNDAZg8nCF3cA5x70ItOQZTXSImbYdMbhjiG+01vOMUtnyhXQALMB2zPJzvG
         Aq6UupcBy74vpaBvz7y2K3hQdFD4Pa2BFSjBgTbKUqOtQij6BkKzpKotuyeBxEVfTwDx
         im3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751133175; x=1751737975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuUZifK2n0avjWFvzjHdGhgHXYgsXuK/FTKAkLBN1FM=;
        b=crWh12sGXCxfY0paSfi2bL1HoJ3K/iamGwUI/fbrdqTVikFi9EYb+uSIUWUXDwFQuT
         Zgtcf/wK3+Ljm5sD6+VNZtZ268BSs4MWoeNoYSdRwrUlD8s9O/zPmjdU5yyrOuovedJ9
         UqYINLYl8Cf4yHvlH/NffbzPyPc+3LFJo84GxjWXBw/wIKyOOVJwrueMcYf8qk+tZxvD
         PJUcuXxkz9+/4nmWdGLwcVBWsG7Xq9EXOd0RFgDlzRjyUNQGwKGzk8QHG9ew6rcx/Rt8
         oUELezUQfh59vcQMhG9YLJY3a02Vr8dy7Pyds/xzU/PeOAftoTbe9XMMWf1A/SPk40ws
         hbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhrtaEsMCp8eGnbH1FE9gUAmaZQr+8zcWRSvBwiMcKmQGrwHDzfjbfn/62SuQJxe1rljlcIqrsK/3cRIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3+hShKp509Zddm18kLZKZexxIjrEG/ztnMRf9hPu91SAmHv6
	pwxo8Y52yr7Roko83MsBoN7BffNvvshCDn2G+SS8Uqvl4uQzWHsaYRmlapCOQ10E8vSVt5MLXkV
	UnUTAmQk=
X-Gm-Gg: ASbGncuygYeac2UMB9CjV2Jk84dsYt3N+bqw/+vN/T+Drd5nZCffORS34pdpMQPnKH+
	K7ncgrIm38I1RAKxcr9fjpSdCFtDyJflOCrq0VEhUar/ZK6a36kkhYFSBk1oZcY40B62+PfhKde
	NN4BDZbsDYi0QMKhTDlGFl4jeSNjO7WGpdvM4kKt+R620L/fWIWyxPEgSGubObTlqnXLd9FK3QN
	rF908IIksUQVSuy+bzeWc1Ap3kCmHEc0c2KMUNchNDQObFh6jMqyc7oMToaFqXTka6j6XUxdMnC
	URQ7gaw15zyI0aKw0tnFfyrtVKtTta0cn2wbKu26arc7003RuJD5hEhOCeT9TK3Z94q4
X-Google-Smtp-Source: AGHT+IFV1BzZ4kGHJ8cX8++Ttrj1FNUBznzNCJSgyL5m3JIEqd0UkaCsyuFgEBReyQPOCaGQMfUKEA==
X-Received: by 2002:a05:6870:610b:b0:2d5:ba2d:80dd with SMTP id 586e51a60fabf-2efed474d8amr4775499fac.12.1751133175567;
        Sat, 28 Jun 2025 10:52:55 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b4d84sm1593530fac.23.2025.06.28.10.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:52:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:52:30 -0500
Subject: [PATCH 1/2] iio: light: cm3232: move calibscale to struct
 cm3232_chip
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-20-v1-1-2bf90b03f9f1@baylibre.com>
References: <20250628-iio-const-data-20-v1-0-2bf90b03f9f1@baylibre.com>
In-Reply-To: <20250628-iio-const-data-20-v1-0-2bf90b03f9f1@baylibre.com>
To: Kevin Tsai <ktsai@capellamicro.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3020; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=HwZVNJRHlmnj9p9W6rHIwbWpVKaSVUJWBS6DuaB3HeQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCvn66JVEyxft9qnR8O8M1QWUxrQs0q4EuVvb
 0talSGYXGiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAr5wAKCRDCzCAB/wGP
 wDAZB/oCHCsvhEZzwlg+zP1GMIVVIl/5iSOMpHhqw+08H1G+2RMpZ7pQyEp2SJITveI1yi4shtF
 veWuH6Ve+N0W6ORoYwZNnHiuBEm9W51kjDfhgonTrDILeuGEbLB3C28B23sRZT6SbbtJYpx6MyZ
 4DfZKC8pcQJ8J/zEZJufdwPE6fIX0Ur0riKfjjNf4BNPBH5ZXtEZ5jVRPZe0h5zMIFeP9yK30eO
 agorW2DbK6eqHhUdZQ4iEqFBlPZWt3yU1dznpHT4hJ6Tosb2EPggy76hK99f11+c8Hfuwel8/YM
 mjbaZ/ih/ywerka79Gqoqs7TkOW9K+jHncqiWEJzNeD0u+sP
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Move the calibscale field from struct cm3232_als_info to struct
cm3232_chip. The chip info struct is supposed to be const while the
driver data struct should contain mutable fields. Since calibscale
is a mutable field, it should be in the driver data struct.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/cm3232.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/light/cm3232.c b/drivers/iio/light/cm3232.c
index e864d2ef036e87b7a3ca286770594681eacd8e58..b6823a5a0860a32a65b6e3e76b4e22bc9cd14312 100644
--- a/drivers/iio/light/cm3232.c
+++ b/drivers/iio/light/cm3232.c
@@ -54,7 +54,6 @@ static const struct {
 struct cm3232_als_info {
 	u8 regs_cmd_default;
 	u8 hw_id;
-	int calibscale;
 	int mlux_per_bit;
 	int mlux_per_bit_base_it;
 };
@@ -62,7 +61,6 @@ struct cm3232_als_info {
 static struct cm3232_als_info cm3232_als_info_default = {
 	.regs_cmd_default = CM3232_CMD_DEFAULT,
 	.hw_id = CM3232_HW_ID,
-	.calibscale = CM3232_CALIBSCALE_DEFAULT,
 	.mlux_per_bit = CM3232_MLUX_PER_BIT_DEFAULT,
 	.mlux_per_bit_base_it = CM3232_MLUX_PER_BIT_BASE_IT,
 };
@@ -70,6 +68,7 @@ static struct cm3232_als_info cm3232_als_info_default = {
 struct cm3232_chip {
 	struct i2c_client *client;
 	struct cm3232_als_info *als_info;
+	int calibscale;
 	u8 regs_cmd;
 	u16 regs_als;
 };
@@ -222,7 +221,7 @@ static int cm3232_get_lux(struct cm3232_chip *chip)
 
 	chip->regs_als = (u16)ret;
 	lux *= chip->regs_als;
-	lux *= als_info->calibscale;
+	lux *= chip->calibscale;
 	lux = div_u64(lux, CM3232_CALIBSCALE_RESOLUTION);
 	lux = div_u64(lux, CM3232_MLUX_PER_LUX);
 
@@ -237,7 +236,6 @@ static int cm3232_read_raw(struct iio_dev *indio_dev,
 			int *val, int *val2, long mask)
 {
 	struct cm3232_chip *chip = iio_priv(indio_dev);
-	struct cm3232_als_info *als_info = chip->als_info;
 	int ret;
 
 	switch (mask) {
@@ -248,7 +246,7 @@ static int cm3232_read_raw(struct iio_dev *indio_dev,
 		*val = ret;
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_CALIBSCALE:
-		*val = als_info->calibscale;
+		*val = chip->calibscale;
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_INT_TIME:
 		return cm3232_read_als_it(chip, val, val2);
@@ -262,11 +260,10 @@ static int cm3232_write_raw(struct iio_dev *indio_dev,
 			int val, int val2, long mask)
 {
 	struct cm3232_chip *chip = iio_priv(indio_dev);
-	struct cm3232_als_info *als_info = chip->als_info;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_CALIBSCALE:
-		als_info->calibscale = val;
+		chip->calibscale = val;
 		return 0;
 	case IIO_CHAN_INFO_INT_TIME:
 		return cm3232_write_als_it(chip, val, val2);
@@ -339,6 +336,7 @@ static int cm3232_probe(struct i2c_client *client)
 	chip = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
 	chip->client = client;
+	chip->calibscale = CM3232_CALIBSCALE_DEFAULT;
 
 	indio_dev->channels = cm3232_channels;
 	indio_dev->num_channels = ARRAY_SIZE(cm3232_channels);

-- 
2.43.0

