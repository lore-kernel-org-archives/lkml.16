Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F01253333
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145450; cv=none; b=r9VzJoLMe4eGVJ0yEsaiBXIXukpwtXbKr2qCvnXzHgpcqZbqJfAL1L2uN9SUVca4DzDrMdARO/8ISsotgGi4uabuDOKp5focclIa+b3327kytIxcCHRsGtDURQFOq6ncI45mkRthsWXmUic+OkaPmg3V1FKD58FjBRweVb+bX/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145450; c=relaxed/simple;
	bh=u6I5ChrGSsaC0BcEBjsNrdJcdIq+wMAYxy5QhBHr4rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/+V86obr+v8q59JZ6itWTxEBup4IPLQlZuyoyQxJ3xDYycgjPU096gu/+WP6LHZAT0lMgGozr2ExUesVr5ckt3yMj6EE+c0aS1VI3e3znrGoemdKEOFHblt+63csbqgboTmQe3FWbSSnNLTBONJHPGu7DabYbTvInTA4dwbOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H4VBnPeS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H4VBnPeS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso49837f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744145446; x=1744750246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PwO7TFjGXlLsI1pbG0l9bXuBqPlwUh0ZLM72PzotzQ=;
        b=H4VBnPeSybdUl23PWSPNo6QvilBDE1e0pqyu8pcci4zOwQnerZ8I0RzzhFBjt7pxDJ
         4A94yMEZf4NWG8K6TmBRkFeOFNJFFJYmiXzzc+1ADYBdwrLUzbeO00WfXftGJ4beLtPe
         ClVpd4MxEkxZ0aL/+WAjjTNcQxSwrvMO0SIHPCYWJxpNBO3oT5PQ1Fi5zxvQgBmOZSLV
         ClDfTJw0wiNXNQ9W7/RpMn7bt6q8gTQbLz79nd8cKeg5BXv52Gq0+WbL0Eib/waokuX6
         Rke/iY6AQmO7csSOAAAqRssD+lVYkiR1UMSHioNBO+nY9IRbu/hqOusQBsrFlXZwENxu
         X6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145446; x=1744750246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PwO7TFjGXlLsI1pbG0l9bXuBqPlwUh0ZLM72PzotzQ=;
        b=EdPi0cpP8k7hYPELzykC/kJa3sN/qy3sKoRATrQFSDcmeri6eRYmmxh2dM+ExvYst5
         P+x3CVBKvKfbtFB+4BRo7a1zn5dhmUXv+vDqpX8/MeMmCsuiNbiwVXb7eNx5mx4dHYsd
         Y4K31bLNq1ZAue836edGO5HmmWtQuomOVmT4L/K4UnWk166/e9w4Sm/lKYEaffBsPkPs
         LjMkDUmqiFcxJWxboLwbEN31bwj6j7GzE0CDeNf1kkkh7tUkYjr7N9704EJJgkIUuC9b
         9HpR2mRnTZxnYUkjuqhMeIAN5T9wciSZxIo7Xbrbzr+Ej+kecvaPNhP63E1DSWarcJZu
         NFUw==
X-Forwarded-Encrypted: i=1; AJvYcCUz6zPJB3UXN/4SH271vPy7+ioCux+pHO9jL/RzTW4nm+b3kfpaL8iBytuprNsO/J/PJIWQpVwjwofPGLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxchXAuY61P9JW0VuO1zabxrgR8k5woTHghxlLLJBfIyZgJgAS
	wCMOFzjjS1v/iQSwxu4HoyoBp1iPMMn7f7bFRB8pLjgUyC23AgT0IQoAANxeH3ciE60xC+C/3FC
	o
X-Gm-Gg: ASbGncvZTMbHxn3V0ZRQ6+Taqxjc98wWQU83ocxb3XydmTB0d1AqumbDWT+uLECCNrn
	GGLwGflm+o6LZ8qaFcTn99sArCUKlo3JlRbAiADx0dv1/DzxeMmP5VX5R90v1G30b49WE5ET+A0
	O9ejZpVscJnjf1LorXY9hkmS3suHyzSGRZOOJE12AaN5aNwwQ8dCEWHuVzJ11i3qyu9XImCDq7i
	wXzKM0N+peo2vv5GR13Fgx2sd052EgA3rDo66501T9YfaT22V181ll377GOiq0brVJGpZ3nPo3e
	2ebQzPon55cTh5QLkset16phnntZlLwO/F380eFSxIMicJJcV3FN4nDHYamPSZ49G2s/cgaI8Du
	BgB6gMPW2+glc25iFUT0MpQ==
X-Google-Smtp-Source: AGHT+IEYxqvRXJ2S4Gl2VcSiuafn5XShzbd30+YcZCFT7BH83PBXNJjmg0XOVZRu0H0lq0AcWvjg6g==
X-Received: by 2002:a05:6000:144b:b0:391:21e2:ec3b with SMTP id ffacd0b85a97d-39d87e84c8cmr353155f8f.3.1744145446022;
        Tue, 08 Apr 2025 13:50:46 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm16367156f8f.98.2025.04.08.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:50:45 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 08 Apr 2025 22:49:01 +0200
Subject: [PATCH 2/2] iio: dac: adi-axi-dac: fix bus read
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-ad3552r-fix-bus-read-v1-2-37add66aeb08@baylibre.com>
References: <20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com>
In-Reply-To: <20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com>
To: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=o6accVuWI6TL7qRXk6sJ34qloa1W0T8BNTkGAf2YT1s=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/2n3I/3ZmsH2Q4H2xfxuPHgvU/8HPm3Mz0VAl91Ok1
 fL+/LUvOkpZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExkWjnDb/akY7tWCB8Sigpd
 8tp8znSb+5cDHX4KTJM607KiSodzIyMjwx7/kjseW/dtyXlbmrPZT8q791KXZMvc1kXvDuw+0ct
 fywAA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix bus read function.

Testing the driver, on a random basis, wrong reads was detected, mainly
by a wrong DAC chip ID read at first boot.
Before reading the expected value from the regmap, need always to wait
for busy flag to be cleared.

Fixes: e61d7178429a ("iio: dac: adi-axi-dac: extend features")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 91557aa6797a3478de3607e5733c162d7745a3b2..de959ab116e26f98385d5f5c259d6d1e01a448d9 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -780,6 +780,10 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 	if (ret)
 		return ret;
 
+	ret = axi_dac_wait_bus_free(st);
+	if (ret)
+		return ret;
+
 	return regmap_read(st->regmap, AXI_DAC_CUSTOM_RD_REG, val);
 }
 

-- 
2.49.0

