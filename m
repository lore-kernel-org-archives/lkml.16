Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1972020A5D6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871858; cv=none; b=IOTMB3ZzedGpPvxlm9UC4HL0Hp8h6+vK8N3CIrtJN60Tlm10nvTMK+q6Iii8NnlOt6QAT3AESdXUs9BPLZkxhPTPJniUQSM52Z2v+2TQ/BWoemc9weZOgU5SKnMYWQ4Ua1MuzR5VbE3VvSsz8/GFyGj4zhVV6m6UtKrMXRpWu4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871858; c=relaxed/simple;
	bh=htzNMPXlRVfXDBCUzoC72qPIY7Dbustt/aeF0u587HA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9BWDsewRGGojPtlah9mGt5xnUK+hzduURVpN6HjkC4zX+HxC29yIKp1tomudO1vKohnPUTh0MsO8ZgjPOqhEixPQa4NMIb0gUr05Gziu+0JlD/qfFnUHru7M1zzwS+C0SMYTCVHh44yd858aw4Wyagewd31NxE/cyTCdo5StKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t3/bqhjm; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t3/bqhjm"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fa6c54cc1aso4089149b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871855; x=1746476655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=t3/bqhjmULtzHwK4Rc8GXB9vjCVLfKFWnbe7WR9eY9kYIdoBaIGPUtWAA3PaRgxC9y
         Btm0bxouFWq9IG9Su4QjBIrOo4JN9CfZUoaUZGfcnkPVqFRHWRzqfuqPDmfjcxaZPsl5
         JgjGcTizkQiqyZ18VMbr4Y03hgrEkCX309h6kvDyCljK7wOqTJcapayK2Gsrst3FWCwJ
         IFU2Fy0pSMjVPHwaLSC6vq7igTDqV8rJqVrkfLimj7HQzED6c56qGBA6d8Y3XVQURJDp
         fiIlfFlMNfiNxjrFT7RH+BDaknTQfq3Jn3vVYpfcWtQzZYou03ldNP5A5/LQTpgwROuO
         Rb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871855; x=1746476655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml14j4CWVwjgejgx5bGL2isKAmgSSnndW82GfrPbAUk=;
        b=VrWpqmRzWg+joppDBW4QZkzFaOJQVzCCui38HpdDVf3Xm8UK6RGnhmuYcOSGDuBj7n
         X3U8BF33OXu7l0jNFfTOBlriNeQ8UFNqwJb5t08eUjk6eetlmjJTeDOq19oimAQaxTXH
         KTjX0b9TKIBxtUMKhy2HqDYlRvxESugtFmZ7Te5nQaal2U7IEZuCzoyf8skrZA514ft/
         2LcCEPxMAqmoITx/7BWFWtR4+XJISvhkYRnH+U/QTlnDu/jplVC8t/e2hhTZJC2thDRm
         fZyrxoJ843NNNEnuypsH9Kdgb3li26OIl3rJ6A7C81nfk7vP9e2mRcrytDjDiHGBkeYw
         pIWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/GWkrzA/25vVfeA+4cL3hUkIR7NEuLB2I1UWXBs+iKvy/8h0qLrANZIKq3Llz/MdJPs/4tXU2PH4oplI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfv2Z/ZzjwB8YTx0ibIWgmUF0yz1mAqFE8UpuyLSG/TbtUVKQJ
	ysJNwPxvSiuB9zNyWod2f3cc+IEv16pEnNr+0HMUEkQbAeIjVonvXFrZOoZjzm0i9KrDo3E/caT
	L
X-Gm-Gg: ASbGncu1kPSLjILChFGnCWWciUL0C5DUFAnuoC3KGqzA5ovkrAVOYAbG5WxdJzkPF3Q
	I/aCTTeNBEXITyeFrPB+5HoGq5o/IDNuu364pJILDr4IiXS4grjNjUhAdVT8BziXpep946AvPIP
	KW7PcfadkBEdq2ezZaHVoaH3IDMIvWsgzRHxzCidMeQbEeENAJ1UllJSnq8Gf3twYVnKpDC2YQS
	spiqNgVR4L2/g3C6guS/SVkCzaY9DAYzm23GgB/dH+Abro52W/aZM9hQfH88UPLPZ/ZKX1/xHqt
	v9uiw7Zh35Htv1e4Rj2Uq9oTMT6WRt1hanGvIb/7B1MjujyllSO8OhjhSQ==
X-Google-Smtp-Source: AGHT+IHWDYsPV4NitcaTYpgE7UhDjAc/dkOOE3bAqOcW2gABkaCTrsjM84VlpdSsucL1H4N7hzx65w==
X-Received: by 2002:a05:6808:330a:b0:401:e949:6381 with SMTP id 5614622812f47-40211577993mr179164b6e.19.1745871854968;
        Mon, 28 Apr 2025 13:24:14 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:14 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:08 -0500
Subject: [PATCH v4 6/7] iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-6-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2980; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=htzNMPXlRVfXDBCUzoC72qPIY7Dbustt/aeF0u587HA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+PTGYK6ltZUKAz6ARjAhcxo37S0yYyvXAfZ8
 IeVDjBAieyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/j0wAKCRDCzCAB/wGP
 wE5PCACauVxdlLd4SV1hK2nzoW85CFCUCnNXbPIlokdEh+LfKhvlbt8S3RI9cGDMwumFDlZPZq0
 7Z3BqalYsLPvdH6nQfN5DZSWSeS/cywoHGkyJjFGWJ85e1NdC2XptNEu6GV0gYnp4XXQpsxjzq3
 CYd8GXj4eehMVbOhOOoT/p4Lfd2tj5uaXDVL8TPik9wRlxSdwhhg38Gh7fqxrrPDmzyht60T3pF
 Gcp3eYRkT1F1RljVJIam/foR+bogJEy6bX9w7+SM5JpXmeX8EJoDE69w8lXHFPDdfGRDfLB8Qla
 R6yXv1ErpZzFeweqLdaSp6fpqSy0FdPezOTS33hsc9b/Xd67
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_DECLARE_BUFFER_WITH_TS() to declare the buffer that gets used
with iio_push_to_buffers_with_ts(). This makes the code a bit easier to
read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
This is an alternative to [1]. Also, this serves as a test to see if we
can get a rule of thumb to decide how much is too much to put on the
stack vs. needing to put the buffer in a static struct. SCA3300_SCAN_MAX
is 7, so this add a bit over 64 bytes to the stack, make the stack now
roughly double what it was before.

[1]: https://lore.kernel.org/linux-iio/20250418-iio-prefer-aligned_s64-timestamp-v1-1-4c6080710516@baylibre.com/
---
 drivers/iio/accel/sca3300.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
index 1132bbaba75bcca525fac2f3e19f63546380fd4f..67416a406e2f43e4e417210410904d44c93111d2 100644
--- a/drivers/iio/accel/sca3300.c
+++ b/drivers/iio/accel/sca3300.c
@@ -58,15 +58,6 @@ enum sca3300_scan_indexes {
 	SCA3300_SCAN_MAX
 };
 
-/*
- * Buffer size max case:
- * Three accel channels, two bytes per channel.
- * Temperature channel, two bytes.
- * Three incli channels, two bytes per channel.
- * Timestamp channel, eight bytes.
- */
-#define SCA3300_MAX_BUFFER_SIZE (ALIGN(sizeof(s16) * SCA3300_SCAN_MAX, sizeof(s64)) + sizeof(s64))
-
 #define SCA3300_ACCEL_CHANNEL(index, reg, axis) {			\
 	.type = IIO_ACCEL,						\
 	.address = reg,							\
@@ -193,9 +184,6 @@ struct sca3300_chip_info {
  * @spi: SPI device structure
  * @lock: Data buffer lock
  * @chip: Sensor chip specific information
- * @buffer: Triggered buffer:
- *          -SCA3300: 4 channel 16-bit data + 64-bit timestamp
- *          -SCL3300: 7 channel 16-bit data + 64-bit timestamp
  * @txbuf: Transmit buffer
  * @rxbuf: Receive buffer
  */
@@ -203,7 +191,6 @@ struct sca3300_data {
 	struct spi_device *spi;
 	struct mutex lock;
 	const struct sca3300_chip_info *chip;
-	u8 buffer[SCA3300_MAX_BUFFER_SIZE] __aligned(sizeof(s64));
 	u8 txbuf[4] __aligned(IIO_DMA_MINALIGN);
 	u8 rxbuf[4];
 };
@@ -492,7 +479,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct sca3300_data *data = iio_priv(indio_dev);
 	int bit, ret, val, i = 0;
-	s16 *channels = (s16 *)data->buffer;
+	IIO_DECLARE_BUFFER_WITH_TS(s16, channels, SCA3300_SCAN_MAX);
 
 	iio_for_each_active_channel(indio_dev, bit) {
 		ret = sca3300_read_reg(data, indio_dev->channels[bit].address, &val);
@@ -505,8 +492,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 		channels[i++] = val;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, data->buffer,
-				    sizeof(data->buffer),
+	iio_push_to_buffers_with_ts(indio_dev, channels, sizeof(channels),
 				    iio_get_time_ns(indio_dev));
 out:
 	iio_trigger_notify_done(indio_dev->trig);

-- 
2.43.0

