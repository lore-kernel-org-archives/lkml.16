Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413642AB0
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751129287; cv=none; b=I8ie+3h3r2DwaHbhO1JnUIYTrPQT6ClxDlQwMRjdH7PyFJ32d3vlysJWGfuHlQFc19KzBQVT4GbWXYPifvENh7REE73094xZU75BJjawtPjS04blOiMMeS3eazg2SjiZbKs+NPQzAREp4FDcRdNWi4VhP9c3x4DEthD6SrsLqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751129287; c=relaxed/simple;
	bh=HZ//Y2K0uLB5kUzMtO2XZBj9R2SSfFnWS2P7z4FMbnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g66HQnLxEYmrI+m+kDctLfv6Zya3SsKEBqaBuKmkiqrd8b5t1j2P8oKH+mUL1/LbIBxhF2V6KnNgdm7xz5aA22SXZACWCGhn6rTk+97yTGKz0pwxc6sP2TB+LRK/6JczfUQ7CrHyRKt0EsOCowy3Tk6/VggqXJZOTnOsC2JfPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wQ4iIAc5; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wQ4iIAc5"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40af40aeef6so1057091b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751129284; x=1751734084; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmlFpqHEoG7G1XXNLWfY8kop+YPpWJd3ItpRxDsXJ2k=;
        b=wQ4iIAc5fHmz4gSbX7oPpz8eMUoQZKqZ7FIdppDpxsPOzhTGQId0JFlvoda+PV63Mw
         s7I2FnXbbQIPayeuvyBSDYDLfRGXh4crkU3VEs60+utpLecYubJISOoVm4NDqhK8jyp/
         lBWDfIQ42FdnoQQy+lZHD0GCTG617SfWO5q5tqG7cGs+5q+Rki//BgOAn7rJUXrJUjNA
         07dLOpewnH7YeFJ4wRPXvHynh19m+nRyNOS7WUD6LuuGRf9Yn7FMfDfxdEK5P3Mgx6gW
         o/U2oG4idQWmTIdA3TucC3FO77ADlsy2PAbXl+6TqhE7tNveoCYzI3t2q/xsGAK2erIr
         hazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751129284; x=1751734084;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmlFpqHEoG7G1XXNLWfY8kop+YPpWJd3ItpRxDsXJ2k=;
        b=ILAWFer76F/Br6hBmPmaMVg1We8ardA9Tb/p4+yTzV9wHufV/ufON/j273roZZr3cm
         lsm0Zln/jNb1ysAI/lNN7kRWuygzkvJ+m1GMt0WFDPEclQVjHeoapTKj5EPV7Wh5ZXTD
         09z9OWFdvOkxiHK83Fo8ytfXvpPpB/LpgFfOuPLb0OR7LUQFIOv8bKNlopNrhwQHkxNy
         bIcosQX1oIEzRQF4XJEPEbUz44XyDjjtxCpdcaeYyw+4PTxHOzcBEi38iUTfs8npc6tq
         LOigtts3kDtrsdOHUH3p2+t/DW6NBzq+dwyNkIdwMPFhPGtpnhe6920CPl+d2kwYiZwF
         hwGA==
X-Forwarded-Encrypted: i=1; AJvYcCWfW+YH8iTKD41uYOWwVWoizkxQBmEmzvEkm9+D1kZeYPdWldpoUwgNu1Ys07nNadP3XLc8LGbq3G7k5A0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqts2EUB0GFaKUtOltAZUHXTkGdlISKYmmM1Z15gXTS1nVuWaE
	2/LbAciwqGRkbzoILtvZvrJCvT6SwgFMCbxf/7UgDKGHEystbwtYuIFqi6W01p+qH/Q=
X-Gm-Gg: ASbGncsOraN7Pf5XKmSeZYdlYD/XqZq6d+xyHyNR9P95qS12eTJaQf/NuRG8b0HDU1B
	ptQuAYkdkbSWjWFmWaDD8+YESGDn/jmMRhf5583S+SIKkMFdUPQUA+dk73SCdi0Ad+Aix5jfP0B
	AxtEeaAq5X4MLQUOzYi4S5I0JTaJqS7aryT6tC4TwcqlZwSHZKX1XOtm3250DO38Oec9jzBNPhO
	K8QsiydTuY7kZllKjNKLnh8WfNVxvtUZHQ2aYJ1oNR9Nrg9/gZe8uYJ5z1HK/B/kbl7TyZ0x0FD
	L4U5aaClirkSEPoj3gMNCy0KO5WPBtigwNu1y5a/2VHTDtZhsD/pS3ROtp1kolZersJy
X-Google-Smtp-Source: AGHT+IGPhXDekeKt3kh/YkCyfn9XUuo4x3XOBxDW2r6ba/CZMKwPz/iz381Hxp6O2yGCdHwM0lGHZA==
X-Received: by 2002:a05:6808:23c3:b0:3f9:8b5b:294c with SMTP id 5614622812f47-40b33e49e69mr5400146b6e.31.1751129284179;
        Sat, 28 Jun 2025 09:48:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae48esm876826b6e.13.2025.06.28.09.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:48:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:47:53 -0500
Subject: [PATCH] iio: adc: ti-adc081c: drop use of model array
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-11-v1-1-268189459192@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALgcYGgC/x3MQQqAIBBA0avErBtQIbGuEi1Mp5qNhkoE4t2Tl
 m/xf4VMiSnDMlRI9HDmGDrkOIC7bDgJ2XeDEmoSWhlkjuhiyAW9LRalROn0PpMy1pOH3t2JDn7
 /57q19gGOiqoWYwAAAA==
X-Change-ID: 20250628-iio-const-data-11-1c6b9e28aded
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2833; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=HZ//Y2K0uLB5kUzMtO2XZBj9R2SSfFnWS2P7z4FMbnQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBy6uLICagDefVxEIgZfMwEUhPN1xFLCpmfmR
 zLOgJD11WCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAcugAKCRDCzCAB/wGP
 wKELB/95Z85oOsmtBUIwe8GrPfyyxbYD7DOg4KITLqlr23Y0eQeWxoH0B9QUUPhPUDpR9obQF9n
 lbSIFIRoXZm4QZwns6wF3vlFD/SnkmigfGIVUuUq9XluJtFYfj8qF2nDoDFGpd3L3WzarzgYsWg
 6U1XG/Nm6c6365q/0yFeIZ0Z2rtu+wP9fKS8BIzSDm4xl8Brnt8ZhoomP2EDhW1zUtspCi0LDZy
 4UikqnV0Pa/AMpcoivZMQdXHgrF92Ng2jKqRF05dImiWrWvVZuMCDZTn42o3sfcKXxn5dZSi40w
 rUZqrYgZyAIAXSs/HU2CqnudNsYfxQibTgK0IenuaSmUS4Uv
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the ti-adc081c driver to use individual model structures instead
of an array. This reduces the verbosity of the code. Also, the data is
now const as it should have been in the first place.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-adc081c.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/ti-adc081c.c b/drivers/iio/adc/ti-adc081c.c
index 4f514db5c26ea803660087ae02b2cf8ec71911e4..c09f41e8867c45a44a98f4409946c3256d34280f 100644
--- a/drivers/iio/adc/ti-adc081c.c
+++ b/drivers/iio/adc/ti-adc081c.c
@@ -112,18 +112,9 @@ DEFINE_ADCxx1C_CHANNELS(adc081c,  8);
 DEFINE_ADCxx1C_CHANNELS(adc101c, 10);
 DEFINE_ADCxx1C_CHANNELS(adc121c, 12);
 
-/* Model ids are indexes in _models array */
-enum adcxx1c_model_id {
-	ADC081C = 0,
-	ADC101C = 1,
-	ADC121C = 2,
-};
-
-static struct adcxx1c_model adcxx1c_models[] = {
-	ADCxx1C_MODEL(adc081c,  8),
-	ADCxx1C_MODEL(adc101c, 10),
-	ADCxx1C_MODEL(adc121c, 12),
-};
+static const struct adcxx1c_model adc081c_model = ADCxx1C_MODEL(adc081c,  8);
+static const struct adcxx1c_model adc101c_model = ADCxx1C_MODEL(adc101c, 10);
+static const struct adcxx1c_model adc121c_model = ADCxx1C_MODEL(adc121c, 12);
 
 static const struct iio_info adc081c_info = {
 	.read_raw = adc081c_read_raw,
@@ -203,24 +194,24 @@ static int adc081c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adc081c_id[] = {
-	{ "adc081c", (kernel_ulong_t)&adcxx1c_models[ADC081C] },
-	{ "adc101c", (kernel_ulong_t)&adcxx1c_models[ADC101C] },
-	{ "adc121c", (kernel_ulong_t)&adcxx1c_models[ADC121C] },
+	{ "adc081c", (kernel_ulong_t)&adc081c_model },
+	{ "adc101c", (kernel_ulong_t)&adc101c_model },
+	{ "adc121c", (kernel_ulong_t)&adc121c_model },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adc081c_id);
 
 static const struct acpi_device_id adc081c_acpi_match[] = {
 	/* Used on some AAEON boards */
-	{ "ADC081C", (kernel_ulong_t)&adcxx1c_models[ADC081C] },
+	{ "ADC081C", (kernel_ulong_t)&adc081c_model },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, adc081c_acpi_match);
 
 static const struct of_device_id adc081c_of_match[] = {
-	{ .compatible = "ti,adc081c", .data = &adcxx1c_models[ADC081C] },
-	{ .compatible = "ti,adc101c", .data = &adcxx1c_models[ADC101C] },
-	{ .compatible = "ti,adc121c", .data = &adcxx1c_models[ADC121C] },
+	{ .compatible = "ti,adc081c", .data = &adc081c_model },
+	{ .compatible = "ti,adc101c", .data = &adc101c_model },
+	{ .compatible = "ti,adc121c", .data = &adc121c_model },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adc081c_of_match);

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-11-1c6b9e28aded

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

