Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29364130A54
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751131680; cv=none; b=OjQ4WikqNG4iqc+fCEJxjxRq2ukrq1MrSrSLuyBRFQQcm8kwDIorsFVxBsxOpbSziUehf+mDIHb7YLbCDbsSCisAtNVyn2kuu8bpVT1fBboJBQfDTEaFazm0PyONIGPpCvB1ZNqflDymYu0hdnOLaQKze1ZPsVIiSbfp0rY6oTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751131680; c=relaxed/simple;
	bh=EmltBKfHj5g75aO6COI1jvnMBDJqwWHFLAwBDTwW8nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wv65zRVSJcsx0VqIT+0KFeExo8hQfZ8J1IFTTSo6dw0A91lzZdHpihsJiGab6zXCxL9FYEV9ywwDiVuDOn8rn/DofzSUtTo2LZgXUpPwo5qaywsqNAZVAJDLD5tQarG94rRzY4YQcm4vKlVWNPaQfGmnYwHmFhlmqVHf8Gv1m80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3FN/ZGnb; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3FN/ZGnb"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4079f80ff0fso2486868b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751131677; x=1751736477; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6M6p0rWJ9SqRjH24WTa0Ow33kY4G+RyGuhKovp2iAU=;
        b=3FN/ZGnbOCt5hZC+CWlba2ndRj8viVo0SVcWRwNqUXdJzx9Yx0/p5DRU9vxTMFTh2q
         5MVP2EJyegDGLvMaOhnbDk955Qr2kNxMfYA/ENFba797vmsWxbBbTYY26jndveY3Xioy
         iEwLmbc33ef+NtkuOKEI9vQO5K9KrG0PIBPgq6/o/N7LPL/Q1fHF3z+LROa1ZMzphhtt
         xH7YkgsHsFwVbB1W946o9GNt4rOShBJH1krP/pGXs2KOcUUHuHw8nVYxvjyDSvGzdqoG
         4XDGFWhXwm/C+jbSdTLTokWN937OBwXZ1Ot96URPRcldplVV2Vu8aqhbFzVl25MmoSPg
         Nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751131677; x=1751736477;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6M6p0rWJ9SqRjH24WTa0Ow33kY4G+RyGuhKovp2iAU=;
        b=eft+xMTuRq9OspoRMD8VCtLgZq2E6rXM8P3/9m4Qhlc8BzsB6qELOnWU/xfiplYajE
         mav2z/CeC/KXJqIE0zBB3+9YEE3d4U8p6apCgAVOGnd2tD/ssl0RhMlix+zMP2Um/T3Z
         rrf6EigHa/W/CWT7+OmXjpL5pTeaC3tK/Hu5pauyA+1mAr87vSlkNzxjc7rOlWUzQ169
         hsgjIwVOPhQRA47wl17YCNaqvzBgLRR1ajuzaF6qZYC7wiT7kSYH8XKgd+mk1Hc3xz6+
         S/7YhiBdMz2OxTJXIvzt/h9dxzrW0vSaI3dGQ/ZZkyrX50OdXmPfKVSh6qpFuhxKQdSF
         0+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWE4xoQjk19PFvdtTA9C40r9f+ozdupLXulvL4eyIRSOX4yYtYNnjnA77wjHpZFGNcZZaObDbwzdkI2mU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xaDnLuCMqq2X+/urMRBJsVm4Jp9onRJ9Iqba9Gymak7VL+kD
	c3dZA/6xSEBeQdkAPng7eyhgxO0A1kWfsLYWf6qv9JJVaInv8X7FQPk5aZ7Eo6/JDXc=
X-Gm-Gg: ASbGnct6BFS9l7tz1BH/+bK6+S9OBAbGV52P7NiWBAQPgCeT+9CHCU6828mKmqJABc/
	TnTb3HqyOABf597XE11TM718sInrfF81h+Hp+4HecFnKbR0GnFvd63goNR4piUKyCl3MWhh2prZ
	kisOb3kH0WwW58a787JGYM+iPNVYvhft/0mmZqEO+pcT1HJ5NMWITAp9XYnQv2PAsh9wF+xpIB9
	kWDeDKTxnM69uiiyrwCaGBFaM5ubspr/kAo4DVodVupfgso/9WChE4wpAGTd8I+s8vmMnOaJBek
	OzQiSsyCA4hNS4qyoRQ1DGSbevRx4IUlqeTswD0CFP/zPSSAWPW3XM5scQ5G4P6Lfl2g
X-Google-Smtp-Source: AGHT+IFtdxCEo+30Rr04xKRBABvAiy3QFIEoRr5lo+tTjUlIMIX1fd7eQMXR4lLfU47fzQBIJ8E/vQ==
X-Received: by 2002:a05:6808:1913:b0:409:f8e:72bd with SMTP id 5614622812f47-40b1c8abbd7mr9855415b6e.6.1751131677000;
        Sat, 28 Jun 2025 10:27:57 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322892c8sm887073b6e.5.2025.06.28.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:27:55 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:27:46 -0500
Subject: [PATCH] iio: imu: adis16400: drop use of chip info array
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-17-v1-1-a215ebb653ec@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABEmYGgC/x3MTQqAIBBA4avErBvwh1K7SrSQmmo2GhoRiHdPW
 n6L9wpkSkwZpq5Aooczx9Ag+w7W04eDkLdmUEINYlQWmSOuMeQbN397lAZJeW2FE9oaB627Eu3
 8/s95qfUDd8sGCmMAAAA=
X-Change-ID: 20250628-iio-const-data-17-e2a380903879
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15248;
 i=dlechner@baylibre.com; h=from:subject:message-id;
 bh=EmltBKfHj5g75aO6COI1jvnMBDJqwWHFLAwBDTwW8nc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCYTKp6ecqBsm0FYqBCMY12akA7MFJQf9h7Vx
 hzTOnqtpeCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAmEwAKCRDCzCAB/wGP
 wD8TCACFShU+87c7RFPDZ9Sh3XY4Wh7TBMnG3ERg3pLkTmxtoHynhdS1XWwyLKXsgWExjEd+y2m
 HNIHz94SQvMhoVaETDLJ/YRnkLTqNCVj7gSYeQpjgjPAwurTFph1x/jytEplrJNAc6cVbcH2sw2
 4nI7upgoyvrItEX1rJOAotN4/UQgVy0/emhnKuo/5p8+afD8kNbfqlQJPDXruLASHVc7hBHiaUh
 4x/+THXzkS2NkCo0RKzaOZmP4c5Wr+YxvkHWEmLhDyaQnPDuhv0CTATCkPivWe8O/0GYjqenJxA
 1swbqTk+3+KfU+k+PrN4S4HCNYUGhQ0h+8JrpyztwO7Ogpr1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the adis16400 driver to use individual chip info structures
instead of an array. This reduces the verbosity of the code. Also, the
data is now const as it should have been in the first place.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/imu/adis16400.c | 314 +++++++++++++++++++++-----------------------
 1 file changed, 153 insertions(+), 161 deletions(-)

diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index 90ed3f9bb39c502996161d9df3addcb093ccd11a..36323ad149e04de69f58403cb39d41df64564201 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -170,7 +170,7 @@ struct adis16400_chip_info {
  *			that must be enabled together
  **/
 struct adis16400_state {
-	struct adis16400_chip_info	*variant;
+	const struct adis16400_chip_info *variant;
 	int				filt_int;
 
 	struct adis adis;
@@ -289,19 +289,6 @@ static void adis16400_debugfs_init(struct iio_dev *indio_dev)
 			d, st, &adis16400_flash_count_fops);
 }
 
-enum adis16400_chip_variant {
-	ADIS16300,
-	ADIS16334,
-	ADIS16350,
-	ADIS16360,
-	ADIS16362,
-	ADIS16364,
-	ADIS16367,
-	ADIS16400,
-	ADIS16445,
-	ADIS16448,
-};
-
 static int adis16334_get_freq(struct adis16400_state *st)
 {
 	int ret;
@@ -984,137 +971,142 @@ static const struct adis_timeout adis16448_timeouts = {
 	.self_test_ms = 45,
 };
 
-static struct adis16400_chip_info adis16400_chips[] = {
-	[ADIS16300] = {
-		.channels = adis16300_channels,
-		.num_channels = ARRAY_SIZE(adis16300_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
-				ADIS16400_HAS_SERIAL_NUMBER,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
-		.accel_scale_micro = 5884,
-		.temp_scale_nano = 140000000, /* 0.14 C */
-		.temp_offset = 25000000 / 140000, /* 25 C = 0x00 */
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16300_timeouts, 18),
-	},
-	[ADIS16334] = {
-		.channels = adis16334_channels,
-		.num_channels = ARRAY_SIZE(adis16334_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_NO_BURST |
-				ADIS16400_HAS_SERIAL_NUMBER,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(1000), /* 1 mg */
-		.temp_scale_nano = 67850000, /* 0.06785 C */
-		.temp_offset = 25000000 / 67850, /* 25 C = 0x00 */
-		.set_freq = adis16334_set_freq,
-		.get_freq = adis16334_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16334_timeouts, 0),
-	},
-	[ADIS16350] = {
-		.channels = adis16350_channels,
-		.num_channels = ARRAY_SIZE(adis16350_channels),
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(73260), /* 0.07326 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(2522), /* 0.002522 g */
-		.temp_scale_nano = 145300000, /* 0.1453 C */
-		.temp_offset = 25000000 / 145300, /* 25 C = 0x00 */
-		.flags = ADIS16400_NO_BURST | ADIS16400_HAS_SLOW_MODE,
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16300_timeouts, 0),
-	},
-	[ADIS16360] = {
-		.channels = adis16350_channels,
-		.num_channels = ARRAY_SIZE(adis16350_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
-				ADIS16400_HAS_SERIAL_NUMBER,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(3333), /* 3.333 mg */
-		.temp_scale_nano = 136000000, /* 0.136 C */
-		.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16300_timeouts, 28),
-	},
-	[ADIS16362] = {
-		.channels = adis16350_channels,
-		.num_channels = ARRAY_SIZE(adis16350_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
-				ADIS16400_HAS_SERIAL_NUMBER,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(333), /* 0.333 mg */
-		.temp_scale_nano = 136000000, /* 0.136 C */
-		.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16362_timeouts, 28),
-	},
-	[ADIS16364] = {
-		.channels = adis16350_channels,
-		.num_channels = ARRAY_SIZE(adis16350_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
-				ADIS16400_HAS_SERIAL_NUMBER,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(1000), /* 1 mg */
-		.temp_scale_nano = 136000000, /* 0.136 C */
-		.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16362_timeouts, 28),
-	},
-	[ADIS16367] = {
-		.channels = adis16350_channels,
-		.num_channels = ARRAY_SIZE(adis16350_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
-				ADIS16400_HAS_SERIAL_NUMBER,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(2000), /* 0.2 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(3333), /* 3.333 mg */
-		.temp_scale_nano = 136000000, /* 0.136 C */
-		.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16300_timeouts, 28),
-	},
-	[ADIS16400] = {
-		.channels = adis16400_channels,
-		.num_channels = ARRAY_SIZE(adis16400_channels),
-		.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(3333), /* 3.333 mg */
-		.temp_scale_nano = 140000000, /* 0.14 C */
-		.temp_offset = 25000000 / 140000, /* 25 C = 0x00 */
-		.set_freq = adis16400_set_freq,
-		.get_freq = adis16400_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16400_timeouts, 24),
-	},
-	[ADIS16445] = {
-		.channels = adis16445_channels,
-		.num_channels = ARRAY_SIZE(adis16445_channels),
-		.flags = ADIS16400_HAS_PROD_ID |
-				ADIS16400_HAS_SERIAL_NUMBER |
-				ADIS16400_BURST_DIAG_STAT,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(10000), /* 0.01 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(250), /* 1/4000 g */
-		.temp_scale_nano = 73860000, /* 0.07386 C */
-		.temp_offset = 31000000 / 73860, /* 31 C = 0x00 */
-		.set_freq = adis16334_set_freq,
-		.get_freq = adis16334_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16445_timeouts, 16),
-	},
-	[ADIS16448] = {
-		.channels = adis16448_channels,
-		.num_channels = ARRAY_SIZE(adis16448_channels),
-		.flags = ADIS16400_HAS_PROD_ID |
-				ADIS16400_HAS_SERIAL_NUMBER |
-				ADIS16400_BURST_DIAG_STAT,
-		.gyro_scale_micro = IIO_DEGREE_TO_RAD(40000), /* 0.04 deg/s */
-		.accel_scale_micro = IIO_G_TO_M_S_2(833), /* 1/1200 g */
-		.temp_scale_nano = 73860000, /* 0.07386 C */
-		.temp_offset = 31000000 / 73860, /* 31 C = 0x00 */
-		.set_freq = adis16334_set_freq,
-		.get_freq = adis16334_get_freq,
-		.adis_data = ADIS16400_DATA(&adis16448_timeouts, 24),
-	}
+static const struct adis16400_chip_info adis16300_chip_info = {
+	.channels = adis16300_channels,
+	.num_channels = ARRAY_SIZE(adis16300_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
+		 ADIS16400_HAS_SERIAL_NUMBER,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
+	.accel_scale_micro = 5884,
+	.temp_scale_nano = 140000000, /* 0.14 C */
+	.temp_offset = 25000000 / 140000, /* 25 C = 0x00 */
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16300_timeouts, 18),
+};
+
+static const struct adis16400_chip_info adis16334_chip_info = {
+	.channels = adis16334_channels,
+	.num_channels = ARRAY_SIZE(adis16334_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_NO_BURST |
+		 ADIS16400_HAS_SERIAL_NUMBER,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(1000), /* 1 mg */
+	.temp_scale_nano = 67850000, /* 0.06785 C */
+	.temp_offset = 25000000 / 67850, /* 25 C = 0x00 */
+	.set_freq = adis16334_set_freq,
+	.get_freq = adis16334_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16334_timeouts, 0),
+};
+
+static const struct adis16400_chip_info adis16350_chip_info = {
+	.channels = adis16350_channels,
+	.num_channels = ARRAY_SIZE(adis16350_channels),
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(73260), /* 0.07326 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(2522), /* 0.002522 g */
+	.temp_scale_nano = 145300000, /* 0.1453 C */
+	.temp_offset = 25000000 / 145300, /* 25 C = 0x00 */
+	.flags = ADIS16400_NO_BURST | ADIS16400_HAS_SLOW_MODE,
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16300_timeouts, 0),
+};
+
+static const struct adis16400_chip_info adis16360_chip_info = {
+	.channels = adis16350_channels,
+	.num_channels = ARRAY_SIZE(adis16350_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
+		 ADIS16400_HAS_SERIAL_NUMBER,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(3333), /* 3.333 mg */
+	.temp_scale_nano = 136000000, /* 0.136 C */
+	.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16300_timeouts, 28),
+};
+
+static const struct adis16400_chip_info adis16362_chip_info = {
+	.channels = adis16350_channels,
+	.num_channels = ARRAY_SIZE(adis16350_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
+		 ADIS16400_HAS_SERIAL_NUMBER,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(333), /* 0.333 mg */
+	.temp_scale_nano = 136000000, /* 0.136 C */
+	.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16362_timeouts, 28),
+};
+
+static const struct adis16400_chip_info adis16364_chip_info = {
+	.channels = adis16350_channels,
+	.num_channels = ARRAY_SIZE(adis16350_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
+		 ADIS16400_HAS_SERIAL_NUMBER,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(1000), /* 1 mg */
+	.temp_scale_nano = 136000000, /* 0.136 C */
+	.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16362_timeouts, 28),
+};
+
+static const struct adis16400_chip_info adis16367_chip_info = {
+	.channels = adis16350_channels,
+	.num_channels = ARRAY_SIZE(adis16350_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE |
+		 ADIS16400_HAS_SERIAL_NUMBER,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(2000), /* 0.2 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(3333), /* 3.333 mg */
+	.temp_scale_nano = 136000000, /* 0.136 C */
+	.temp_offset = 25000000 / 136000, /* 25 C = 0x00 */
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16300_timeouts, 28),
+};
+
+static const struct adis16400_chip_info adis16400_chip_info = {
+	.channels = adis16400_channels,
+	.num_channels = ARRAY_SIZE(adis16400_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SLOW_MODE,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(50000), /* 0.05 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(3333), /* 3.333 mg */
+	.temp_scale_nano = 140000000, /* 0.14 C */
+	.temp_offset = 25000000 / 140000, /* 25 C = 0x00 */
+	.set_freq = adis16400_set_freq,
+	.get_freq = adis16400_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16400_timeouts, 24),
+};
+
+static const struct adis16400_chip_info adis16445_chip_info = {
+	.channels = adis16445_channels,
+	.num_channels = ARRAY_SIZE(adis16445_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SERIAL_NUMBER |
+		 ADIS16400_BURST_DIAG_STAT,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(10000), /* 0.01 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(250), /* 1/4000 g */
+	.temp_scale_nano = 73860000, /* 0.07386 C */
+	.temp_offset = 31000000 / 73860, /* 31 C = 0x00 */
+	.set_freq = adis16334_set_freq,
+	.get_freq = adis16334_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16445_timeouts, 16),
+};
+
+static const struct adis16400_chip_info adis16448_chip_info = {
+	.channels = adis16448_channels,
+	.num_channels = ARRAY_SIZE(adis16448_channels),
+	.flags = ADIS16400_HAS_PROD_ID | ADIS16400_HAS_SERIAL_NUMBER |
+		 ADIS16400_BURST_DIAG_STAT,
+	.gyro_scale_micro = IIO_DEGREE_TO_RAD(40000), /* 0.04 deg/s */
+	.accel_scale_micro = IIO_G_TO_M_S_2(833), /* 1/1200 g */
+	.temp_scale_nano = 73860000, /* 0.07386 C */
+	.temp_offset = 31000000 / 73860, /* 31 C = 0x00 */
+	.set_freq = adis16334_set_freq,
+	.get_freq = adis16334_get_freq,
+	.adis_data = ADIS16400_DATA(&adis16448_timeouts, 24),
 };
 
 static const struct iio_info adis16400_info = {
@@ -1157,7 +1149,7 @@ static int adis16400_probe(struct spi_device *spi)
 	st = iio_priv(indio_dev);
 
 	/* setup the industrialio driver allocated elements */
-	st->variant = &adis16400_chips[spi_get_device_id(spi)->driver_data];
+	st->variant = spi_get_device_match_data(spi);
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->channels = st->variant->channels;
 	indio_dev->num_channels = st->variant->num_channels;
@@ -1197,21 +1189,21 @@ static int adis16400_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id adis16400_id[] = {
-	{"adis16300", ADIS16300},
-	{"adis16305", ADIS16300},
-	{"adis16334", ADIS16334},
-	{"adis16350", ADIS16350},
-	{"adis16354", ADIS16350},
-	{"adis16355", ADIS16350},
-	{"adis16360", ADIS16360},
-	{"adis16362", ADIS16362},
-	{"adis16364", ADIS16364},
-	{"adis16365", ADIS16360},
-	{"adis16367", ADIS16367},
-	{"adis16400", ADIS16400},
-	{"adis16405", ADIS16400},
-	{"adis16445", ADIS16445},
-	{"adis16448", ADIS16448},
+	{ "adis16300", (kernel_ulong_t)&adis16300_chip_info },
+	{ "adis16305", (kernel_ulong_t)&adis16300_chip_info },
+	{ "adis16334", (kernel_ulong_t)&adis16334_chip_info },
+	{ "adis16350", (kernel_ulong_t)&adis16350_chip_info },
+	{ "adis16354", (kernel_ulong_t)&adis16350_chip_info },
+	{ "adis16355", (kernel_ulong_t)&adis16350_chip_info },
+	{ "adis16360", (kernel_ulong_t)&adis16360_chip_info },
+	{ "adis16362", (kernel_ulong_t)&adis16362_chip_info },
+	{ "adis16364", (kernel_ulong_t)&adis16364_chip_info },
+	{ "adis16365", (kernel_ulong_t)&adis16360_chip_info },
+	{ "adis16367", (kernel_ulong_t)&adis16367_chip_info },
+	{ "adis16400", (kernel_ulong_t)&adis16400_chip_info },
+	{ "adis16405", (kernel_ulong_t)&adis16400_chip_info },
+	{ "adis16445", (kernel_ulong_t)&adis16445_chip_info },
+	{ "adis16448", (kernel_ulong_t)&adis16448_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, adis16400_id);

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-17-e2a380903879

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

