Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8E2857E1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746557417; cv=none; b=m7w0P9vYMmpfuEEX5EWKzTUQcz8ozFjG2DHAz0aVGNIOjwCkt235I12jJZA/p4w/fIiI1SXDFDz9DH/KtThyk26T1sBXZyvTx17+11dSIkzbQaXcod+yFjwEqzWthwXQSpawUmRb5ImaEVN5AtxLy3lGRxJrAf/c4G6ipy0Bfpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746557417; c=relaxed/simple;
	bh=XvQbqmH7xE7HHo1iSyh3dpMALRcHlXhzRemluZQnUkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RnOFWk3kfeSzIIO5aUzW9OaiSuW4j3VbZEzW444+bonl2sF3+ZaZesFP6OArfu+z6iVvzAJ+CdTOfIa+u3Ps2+yKQe0chM9rKCvdsgLWL6ip2sa4zJWOVXuQ7EYbsc50uPwEwGfJyygHyYoRSc7ET+chdNpmU6aCup17+weWD5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AfhBvyhW; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AfhBvyhW"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6063462098eso3533863eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746557413; x=1747162213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nm/+MJMT91ImGw8R482ZmoYj2Z+/nG72VMRoI1EWHKU=;
        b=AfhBvyhWssKnjAOlQ4PVTYnLicjfbJkxFeomlX5gw+a8V0ZsWxVPtRWroEsP5tKdRp
         cYsZ6EOKYHW/ItKP3kGKJUikVFu7tsLofs/9guKc/VKfyp0+ZDHuK64ZBdYzlu3yAn27
         YRneQoj2dTrSEgpmtYJjrjSQHPaEbocC0cyjdJlHolbAeibpZ2IDphjB9HKGvZVtnDhx
         k2Yrle+fEzHYdUO2C9D6Yrfd4Fan+fz+8dj8U2utbfB6i25aJTggq8sAhzSlmnlCUQTH
         PMLR4H7z2hDu+Oe2nFsW3dWNePvzXsmIcEWQUfPWd75eeljWwlwMmlkfmz/hB45pOh+6
         InUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746557413; x=1747162213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm/+MJMT91ImGw8R482ZmoYj2Z+/nG72VMRoI1EWHKU=;
        b=FMoPt8x4NmRiVerOQuFidRgYBRDmtkeWWY1n1vNlRKjV2ZDCY86LVrxBq+0laXT9aM
         Hi1/djta3oSMxMwNj78bTnCNFlDxHOX9xoQEpDGJ+Y6vc94qjFWdLB3v29NCon6FVaPc
         ylhHivdbGDDGNCK861oIfJz9D7FH+kQs0gsi0046T5x46857BdETgoVgz3fIrfwv++CN
         2v2e3nVDB+gNzBPHYHw/2wuewz2rAd67wqL0YyIji2l301d+IeVqhz7vnEfCc/UPqZM7
         yUCwKWqIeuBVoHqv1WvSwEddd0i57sRrZHBDoO2nYnzAZhBfu6jIRn4hWW9SEpo6scRl
         OsKw==
X-Forwarded-Encrypted: i=1; AJvYcCXumDmtWTcuH5nKcsKa9rL46+YGZnFpTvYiUgjdEJYrnJUoLg9YCnO4AtTUOzK/wgxt5v70OM8C8Ezdc3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVVC/doCphCwiV2wlKE364cZYvh2TdLWTHTKdHB1WV/LnQ0bM3
	KJPuVZvw+Xr//hUU5VcYy0zn9tP5l4wCjj0aPZ3j1FADFUHOQ4ZocftpiGlyLFg=
X-Gm-Gg: ASbGnctYuC7JofaZiwJZCij3Qlj0CX4M1buEcAClPz/0CW+BjzHtgjY1P3ZItar+K3J
	hpIVd/IozXmPOnv9+plJSQy46Okma4PKzV3tXfIY5HgGDGwUI4ncpsqbELA2YSq5Fr5cVTa1L06
	ecVS2iOSYfXo5jshLJlotbRvv32G54lU9gGiljDnrKzG0i7ZDqiT5dXOfAmnXvGsuwLk/FySmvn
	hc/0BaJVgzOqpi/6T+c9xb7gPvOMrQW02rWGiDAS33pcx1wfbY7yCf8+NBT8UAKNw91ZV8u31BC
	gBQ/Yi/eUr3NfX779fLVf+KO/htLe8vIn6T0T7uN30AXepU=
X-Google-Smtp-Source: AGHT+IHTylIT4W6XFyzJm4YfeQcY/tYIVpe6JmybwHgJ52t6Z0UujAqLA9E53P2UHjlL3QQNIg+8Iw==
X-Received: by 2002:a05:6820:190a:b0:603:ff3c:7d5e with SMTP id 006d021491bc7-60828d3eabamr365507eaf.5.1746557413268;
        Tue, 06 May 2025 11:50:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:5172:9f6c:997a:41ea])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7cab6f0sm2348485eaf.5.2025.05.06.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 11:50:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 May 2025 13:49:57 -0500
Subject: [PATCH] iio: bmp280: zero-init buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-iio-pressure-bmp280-zero-init-buffer-v1-1-0935c31558ac@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANRZGmgC/x2NwQ6CMBAFf4Xs2U1KUxT8FeMB7FbfwZbsgiES/
 t3G4xxmZicThRhdm51UPjCUXKE9NfR4jfkpjFiZvPOd69yZgcKzitmqwtN79r3jr2hhZCw8rSm
 J8hB8jCGF/tIOVFNVSNj+m9v9OH5VgEIfdgAAAA==
X-Change-ID: 20250506-iio-pressure-bmp280-zero-init-buffer-942dd4f48719
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=XvQbqmH7xE7HHo1iSyh3dpMALRcHlXhzRemluZQnUkA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGlnW1IW8TWSVfuJinO3UtJmoud02Vma4wfVGN
 5a3n7+vIZqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBpZ1gAKCRDCzCAB/wGP
 wGCkB/4w5KsBaU8ShP48l7PCWjnvUJuAPq5kcT72aUmgEB+ScN2PyMqQc2JhHUa4GHFKY06n2uw
 aDiW3ZpZZlFDxiL9b87IcBToRI6HKjCwwOoYWPXY8xcFYQLl8iBqjyo21RJeTzvi8WLFHyfZeUS
 4f9rGwqiYZd3SvCAwg0nXzu7Lv8e0p0myOjW3hIZFaZI0rV5HbD1wl+ErcyLjiu2JXrAE5/HJeM
 EbpY4qJokLK8/4xkE7TwYz3RqvdIUIiLm7xuIDhZ7Fxc8ADbxCUzxt1fY0haVCCSk3SqqLrDf68
 cWzw50j3bVxGs7qSLNDNfFZNa+SRFi1AQ6z9oGLM0jXL7Yl7
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Zero-initialize the buffer used with iio_push_to_buffers_with_ts(). The
struct used for the buffer has holes in it, so we need to make sure that
the holes are zeroed out rather than containing uninitialized data from
the stack.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-iio/aBoBR5D1UMjsSUfZ@stanley.mountain/
Fixes: 4e6c3c4801a6 ("iio: pressure: bmp280: drop sensor_data array")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
The patch this fixes is currently in iio/togreg, so no need for stable
backport, etc.
---
 drivers/iio/pressure/bmp280-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index 5728cc18cced223284a2c41dc6dec6f47169c797..f37f20776c89173b0b2a8e28be0ef9aa30ceea53 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1237,6 +1237,9 @@ static irqreturn_t bme280_trigger_handler(int irq, void *p)
 	} buffer;
 	int ret;
 
+	/* Don't leak uninitialized stack to userspace. */
+	memset(&buffer, 0, sizeof(buffer));
+
 	guard(mutex)(&data->lock);
 
 	/* Burst read data registers */

---
base-commit: 7a175d9667b21b2495913ec7496a6c20aa7a4a89
change-id: 20250506-iio-pressure-bmp280-zero-init-buffer-942dd4f48719

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

