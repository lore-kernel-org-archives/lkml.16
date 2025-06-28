Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797B1AA782
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126195; cv=none; b=GEsVVlC4t5q5qDvvZzFveT3nUY/bzd0P5zUJi9ILoFfEJV/0ehSP7x4IsRUwqSHKKL+YJLbp3XzINgL+ie97solgnrnkCBIUS7rk5xafFFHaYa7FNnQDBKrS4xj5TrVlzG6/oxvpQmEsrFL3UTsRqi5pRf8hS5mz+nWwvqp358o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126195; c=relaxed/simple;
	bh=MpmkYzDw2ENeKfdY7gFPxkRwKR0kz2gYSaXwL/jPWdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vq5cen8YS05QobXmf0KcZkmUg52eVWT/W2h+6tLgxfelLxyKz/iP3XMvQu218wMM7HDtitV3wvwy2JdH/rGBRz79gSKPDtGIenVxj16s87MNTseNOURRB7sf5bXMnYpCfNph4CSWI38QNGXOrZhIjD2M8H3yvcpwFVIwfRAbPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QXCT19Pm; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QXCT19Pm"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40a55314d06so1042158b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751126192; x=1751730992; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDtJDztfcuj1J6VjhwWfrKLId4IVubmJY2qVBXZS7iY=;
        b=QXCT19PmxYf41lGlYdqwH7aXfn6qaLTQVDWfW44x0nGPx6QFRS81awof9WtpveIgCr
         pyxyvWqaSMFUC+OXdGDZOqYNUblFf8zjEC4V09pM9jPa6/6KAHiM7s9rhdyg5wiSKlV3
         8URhUx1ROzvS/gTtKB/KVE/pmQt9lMv/P9JqMbZXu7hwc7xh1UsP/JxqD89Tk/BZDURw
         PHBsJ4L8bFLWjgKavp4guvatwggOlYJ8Zw+TIxUlYYZV+oOtf1RAZMzcqrRyrY7u2I7P
         Z+GbPc7cuUsTbw9xtnscOhS/iPF6hyVhZ3lwbOjgqk/LfQysEFaccUZcfsG1+fTN+zGV
         XTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751126192; x=1751730992;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDtJDztfcuj1J6VjhwWfrKLId4IVubmJY2qVBXZS7iY=;
        b=mzghO5+qXsAeWNdCYKMvV64j3bY7QLVkpN/uTFJ5zb+DnFr7mzj+B0j2RDpW2jyhhQ
         3Q/alo8wmpiE8yx/uEE6iEg4UhecO9ia+gPFqzjkNAo+FRUiXqg+njMRzk6TZe82pMHT
         74lekrt00cGhswqbOSwTGu0N3+zKEJdvUOkq9cAzYiNtZMdW0LSdI35tG7YthkaAp+qQ
         +Mnn2kHREC5SWWbC8xVu2bfJ8MY0Nfg50tl6mPTnphKPcGSL3ddo9wvNq2eqWOcDVDfG
         nkKQ7VcV6KPgperrQDwLs0rdOFA1S5qeopykIlypJyMeTbxBonnHkBKjFg02+ncCZKXT
         6hnw==
X-Forwarded-Encrypted: i=1; AJvYcCW2/XLjawZBawhMwOaLWSzbodVmcbfHZQNBOsX1LSmwovVgXoxu2KWYO3ne7V7CzWzKRksV8fs4Ii/omn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9e+Xn7hk5e/8n0t7SeQNF9GjtANol85Uq3IG7gGAT5jiLN1T/
	sB9emYMUd3ilD/O/eaYQMAx1fYglCNO3CDIx6mHGsa1oENkOBMSOXBpvRfg4MRg/PXw=
X-Gm-Gg: ASbGnctHrVMvvRzA2ew1qiO611SOa84OEXVtTUJ4ssOzeRrAaQcWjWtoOqEFaTtkO2g
	N1+ru5l8fG4uiZj7IvHjhknqif6noTxVpbaP9jZmgjPd0e6i067bUI1Q1qneOVgFKEg8ar/LYhz
	4tqD5kTXwO2u0F5ZWfTeC/SzUQKO1qsWGbKiUqDgo0zekt88/7gxaszT1xxcR1QbJdy5yliXLdh
	/n3NaFGJfS9xz4xMrpf+HuHvb+vUFV0tzABk9P2MrdX/4KJj/jkpuWh6FHGBVYUkY1cgcF9Hp4j
	r14fQmmxBsQSmLtWd7sbQ6C6idEoESP9x6il/71J6r6hb/13AD0XZi/xViOCBw/AP3wb
X-Google-Smtp-Source: AGHT+IE8h9gJsbwwdHyrIwOBBihC6aQCDDOTYFgRQ5JMP3F/o1/9spJJsCVXPSCaS3Y5KzrGeyHKZA==
X-Received: by 2002:a05:6808:21a7:b0:409:c6:c147 with SMTP id 5614622812f47-40b33c327f2mr5841613b6e.6.1751126191825;
        Sat, 28 Jun 2025 08:56:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322b5900sm868652b6e.18.2025.06.28.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:56:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 10:56:20 -0500
Subject: [PATCH] iio: accel: adxl345: make adxl345_events const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-1-v1-1-a32d96d01c2f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAKMQYGgC/x3MPQqAMAxA4atIZgNNUVGvIg79iZqllbaIIN7d4
 vgN7z2QOQlnmJsHEl+SJYYKahtwhwk7o/hq0Er3atAjikR0MeSC3hSDhJam0Su1dZ4s1OxMvMn
 9L5f1fT9Kt0ruYgAAAA==
X-Change-ID: 20250628-iio-const-data-1-b198d00f4d1b
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=MpmkYzDw2ENeKfdY7gFPxkRwKR0kz2gYSaXwL/jPWdQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBCny0MAg1Ay3q0OSsM9GfcGSfk1cUjugNqoY
 sewWD3tvwqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAQpwAKCRDCzCAB/wGP
 wGTlCACIh85BEBXiCKOJmKZxfXKPdb60mpqCaG4k9c2cpTtzpJ/HWlfTlKpWBvva56GRZWxhokm
 qRfwxIg4B7QjT0z6mfgBo1K2OFRxaR1Oh2lX5ZuejhLvu7iteLDX4gXPykgoaF3QYvuQtDwk8gh
 1HmXoNcIt4ZjYRm+TPw17286K4k9WNtvYE7nJR4E3cL3FsxkYT+FXvU6d+Ch5H5RRSxAORzVJT3
 fc8f1UJRRvY0Uq+dhV++WWb7x6RTIC4OwyHmedfFPJvuu8k9mslIEz9ms4NJf9jUZ/ZxSrCcQ36
 J2GAmlIC7QIlMagfeU4rpP93rsAw228sMiU/JkQCvj6wXUe8
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct iio_event_spec adxl345_events[]. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/adxl345_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 45d71940c5ac3e042265615fe95238b9d29855e2..e21ec6c15d15e7342b12226dc8fcbb091324e353 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -143,7 +143,7 @@ struct adxl345_state {
 	__le16 fifo_buf[ADXL345_DIRS * ADXL345_FIFO_SIZE + 1] __aligned(IIO_DMA_MINALIGN);
 };
 
-static struct iio_event_spec adxl345_events[] = {
+static const struct iio_event_spec adxl345_events[] = {
 	{
 		/* single tap */
 		.type = IIO_EV_TYPE_GESTURE,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-1-b198d00f4d1b

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

