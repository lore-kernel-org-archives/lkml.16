Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D5255224
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908829; cv=none; b=f46AhZPakXVKuRDtZFZq0s9NUzYcBVwnK8Cl1BZUHINx8NBeRCh+FJgHjtpfHebmOSubvx8n7ySsoELK8RKsdq+zuAr0IiLJnds8ZQHQLElkl6TvO1EuU9IkXe2ZX+7VXsyLwLDUIK40gbAZObNefdiplWw4MDtA2wklNUxgQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908829; c=relaxed/simple;
	bh=AFJNlLXsHh9BXOAhnBjIC5cwi3XBep4QhbIvlXS8quw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6whqLEr5Ty83XVNOu5Y2nvqp2Cqo5Bi17dCaXTIGtDW+UdJLeSikAGj0fiwIFoPxj4/YRgr2Cz2gO6DWB1zhGaDeQK8EypoE5EWLa5Xnz8cF40T2yX47NJ3Y4Zrcakf/1NGyT9G6bRuSnG1dvLN9SsCyba4jYsbhHmBUwFYBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=P8WC0FCC; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P8WC0FCC"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2c7e5f7f0e3so294504fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908826; x=1745513626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5Nrq8vzcfz+EFBHkAeCo3MqUNhANOtEHSIPQJ/9lRE=;
        b=P8WC0FCCporbka7EEgCiwoGOjVFqnYezu0awONvQpYY+H93EDovk+t8N2nTZ5qHSN8
         8r390C4JP/zRK1kAQaYKdEpAU5UvmQLAKmlyZDcT1qmKMWeAQhVR4x+sW677XY0QXtWG
         r/OSxm0hzW9Hvcc0D0fkQum3sVgLlpQOtN/ah5ue2LNkvApaP/4ErxBPqLEEs6fMz0mS
         7g3W50P3DX3WM7WSgujHWxLuwAImpcsjyKd+hd85mQF4XQ/uaRyqsZsf1kTaw1BOONlF
         UNPFrXtB0jeDnY7iYnEeX9hm4DJSzV9vH9eTsKv3UT8rWTssnMLnDzUmGnD0IlSufG+S
         kmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908826; x=1745513626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5Nrq8vzcfz+EFBHkAeCo3MqUNhANOtEHSIPQJ/9lRE=;
        b=X2Kr+HEcCTSdE7EPJEk7bS80DffVSQe+pnZEoJqbil2AAkdyFvGc8QdcPyCbBJ4hVc
         ldZ/vwzUMN7dHB5ItR2Hz7i0fDYL0hdpy7gnDxXKfusNT0AmSiqRT/3N+2AhE5LcmLt9
         vVcdfDKiXbxFfQBUzhKvvfgHB7pTAOo8jYzNXcdQAOP19TYcXV9ufgqEFa464qY1/hCx
         1YSCUDMk4nwZ5gVea4S3OvF+XWsUEES0OINI5ex5E9K1dM72340v8npIoMlbHxmqj/Sz
         Nj4uStZcTaa24vBeZlJ1J3IIk+lHnRCxWiORcyuf2/xrsvNgkCxK/ACvUBFJfO0df7BU
         HFtA==
X-Forwarded-Encrypted: i=1; AJvYcCUkiJ4d4BNmYj2CkhjMakBVnAlTYyXMdFA55WUMbKO0hZ16sbdZprroHuOQ+yF6CT6p3YCa5DJ93G9rcyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5RuCvY3+0fYgcZesNElp5MfBe6PEWBVfs9gkCNtY+ccO+zS9B
	VGnteUwhD+9lF43FsC+O3qq6SMd+td3sJe79QmVGON477X9iKxXPD9taF/yeqS8=
X-Gm-Gg: ASbGncuI9i2LmC+kKRPs9pIjtiRonodqHp8Ndkl1fa22gr28PsttdRzYaXL+mEO+MkD
	c6notBPYj2DU855UDa9oRepyW29Gt2y8ndjF7ejNJftg4jaTPUnJTzkIZNQ66y3nMnIfH9qts4e
	4WijkuC5trJ+I8WDP+qBhxogcT0OE/seYqlwUSECbDR9p2sB4Zr1YvwASsrRKFqZQw3rX5paz/b
	mfmdn6KQ7gYIVT+IF9yP8onZbeEW6tL5TPYYiFWVCsj6BxqK09GVbpcIIAAUOqORKeqSMYvKdAt
	VmLHpMYHGQkqvApTxdtJHY53HhSlE+fhYBW1Bp0FdKLbK4DJLtmaIFajgA==
X-Google-Smtp-Source: AGHT+IHmOxwxeLTqlsojdjpuPG4A188GY1qTUHeyx1ubjxlX5E2Wi9qeVbAG8c3V6wD+0sRgMw1M9g==
X-Received: by 2002:a05:6871:5b21:b0:2c1:9a53:83c4 with SMTP id 586e51a60fabf-2d4d2d25103mr4718196fac.26.1744908826565;
        Thu, 17 Apr 2025 09:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:38 -0500
Subject: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=AFJNlLXsHh9BXOAhnBjIC5cwi3XBep4QhbIvlXS8quw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATH6e80MC8cebAk9/XyMJns4mNmoR4XlpZvAU
 HLW+5/PewyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx+gAKCRDCzCAB/wGP
 wFaJB/9v53vyNRV637CJXAFuM6viMOUQbTVVQV74CaXFCutdFctnVJn/WI3JoemgSbu2oRTqbeG
 P3lnHkDd4rmKcUfkI0rWJONtRWzxU6HakQyxrZN8xnEXl0548q5KvocyrNyIb9spm3YQ/Nnd2YR
 bkeTkMJx65tgHhz+Hg4qeNM+aHJbclsUEjCsSEJ51tzYj03BY+t7dImKthXIXDXM5ooLzyGxEXl
 07DAuQl46yL9zsKlOzapY1Q7zfeXubLjk4Ul5TdTlxlQIQoAoN+gky0z5FYdQPrYxvqtGSYJKPG
 GH+zlFi7Q9CWtB4jxfifTOh6JUQuRTcC2HW1QQKEQU6nD21b
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Align the buffers used with iio_push_to_buffers_with_timestamp() to
ensure the s64 timestamp is aligned to 8 bytes.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/bmc150-accel.h | 2 +-
 drivers/iio/imu/adis16550.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/bmc150-accel.h b/drivers/iio/accel/bmc150-accel.h
index 7a7baf52e5955b4cdaef86aeacf479459b76fe94..0079dc99b2c3fba927f73bb3ee8bdc0ea049833e 100644
--- a/drivers/iio/accel/bmc150-accel.h
+++ b/drivers/iio/accel/bmc150-accel.h
@@ -63,7 +63,7 @@ struct bmc150_accel_data {
 	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
 	struct mutex mutex;
 	u8 fifo_mode, watermark;
-	s16 buffer[8];
+	s16 buffer[8] __aligned(8);
 	/*
 	 * Ensure there is sufficient space and correct alignment for
 	 * the timestamp if enabled
diff --git a/drivers/iio/imu/adis16550.c b/drivers/iio/imu/adis16550.c
index b14ea8937c7f5a2123e4097dc5b8260492044d1b..28f0dbd0226cbea67bc6c87d892f7812f21e9304 100644
--- a/drivers/iio/imu/adis16550.c
+++ b/drivers/iio/imu/adis16550.c
@@ -836,7 +836,7 @@ static irqreturn_t adis16550_trigger_handler(int irq, void *p)
 	u16 dummy;
 	bool valid;
 	struct iio_poll_func *pf = p;
-	__be32 data[ADIS16550_MAX_SCAN_DATA];
+	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct adis16550 *st = iio_priv(indio_dev);
 	struct adis *adis = iio_device_get_drvdata(indio_dev);

-- 
2.43.0

