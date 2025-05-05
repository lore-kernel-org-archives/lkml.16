Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B8270555
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472947; cv=none; b=MSMAYx5fyWLsgOCAHTWr+x0sYCdEOj9GLiJ5OvmPPAlERs0oRh4BVQ7Pl6dwXX6H9zXD/QVt/Kw8+9U01/kP+dQx7IFJowmUSx1j7YMVWrKIma/I3O+fj0ohKlsJxO2ow6jnFiVJhIh3jFO/GfMOgWn+Ht8Idp3byA40BPPo6IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472947; c=relaxed/simple;
	bh=eEbRtA/1AVtNKKSpkTMGRBnBrwhRCmUWINQFMAKTavk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/9OYkR53yWTeap6Px5K1B933egxTze8UHDYqTyi/cbqRuB9GI7HG0Hi/twlzLFRaxuV23G57jK0FB1MLved8qkgvEJMmifMfRMbr7Mj1CbYDzL95oi8J1YIM0FANWhRqir0wwOo1X6y/q6AXAimaHoefgJals9rULrmZNapu0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iUu+bjOh; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iUu+bjOh"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3fe83c8cbdbso1407568b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472945; x=1747077745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdhNP4X0/GICvJpAQY+7kUUTrTHMClamNEnMpORuZ1I=;
        b=iUu+bjOhcCuErP1nThW+4IctznKp8ujtGW1UlatUoCqoAxgK5dXKxMDWSEymUxsV/I
         HYc6FTv3BRlK8cBbO8ivnMCSw6Cxelnyi6iJImFcAyEv/S5AwAylsY6ce9KwtaeYq062
         myunxpYVlxgkCxt2sY0uJH10X14/MsDI+4oCM+Dbq+UkKNpu5MkBuwV9EBD7aytve2Mv
         Y2alkTBHvI1TTIPBk2o3tuLkFqwziVbInZ2gAMY1NyUdBMal9upxEf9XuLzpC0XWbQUV
         vmTfnY3tIF7pBvhew5gd2vA2G/23ZwFxVftP1lzp4vUF67E0zEl5RcG4TFo0shu3/xuD
         WAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472945; x=1747077745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdhNP4X0/GICvJpAQY+7kUUTrTHMClamNEnMpORuZ1I=;
        b=mzCfqrS8uqFXKjl9Tw2tJL7eElmhzN/JUs2HBTbqbJVgWesVL6gtNpUFn0pVEoUNpb
         lfJ3dpNJK0MrT+LGRdqZpgMF+3DDc1ItTB2iSke+BOHFfwUGBJZaS0fJ+zagyR+graRV
         dnSGwW9Y1vv0jYA3+Ac7IV38A2yVwpumXpIpbYLpg2sGePAZDYur1Tal1O7vy/+BAYdI
         WeQ2ECVYkaAildxcbCnhQM2iDJaAa0PrNZCnt4J7zdEa84ItNKjCLR9UQ45LxAZA/rWD
         ydu3BBEM8LGRs2spDdnDhljKsZpJA1TkdbWWwu9dUVQ7SOJlOIoDdPi4+aZAQJ+XbqFn
         UBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrOGRWCLP9rJoyASV6shk5QuGKmpj4USIdyM4rdTJZKdIF/Izd3wEchUTdQYzYvZNSNsevLMm3LIuYw0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdl/3CDcUsdfKKHF8r2sSR+ZEf+hylvMA/1M0OTgkVHa9+DjRL
	faScBcV55AvRvk/OAFTo0eJrvjIw32iSd8f4XU8QVEFH/xmlT5+Vf4LWINlzkgo=
X-Gm-Gg: ASbGncve7h4KFp29/xtRHYjyKjutLNM7w0BgVhocuRuRCcd5ernD4qlZlrKHjHueN5B
	/l8oRUeFGRGng+LaHrDBE+QiAzUrrDfJp9chGQYThepoE1dyB32Df2UHzh42gEZyFTtvejcNlXw
	N47x+m5lkRF3ZPfiRyru0JGVwM4bTBq3J8N/L5v6zvcrhTAarJbIfynQ9FKrEofTKCMJrT6Bc8d
	ap6Qlmxrb/sEXbn2Q5Rx9vLjYMRmNZtoKqz6b0wWn+/0J+XBP6L4zMT9aVVacXJ/qbMuh11zuIX
	nAS3UKh+hkC5f9zPyleJZ7YDzGs3v0ZuozYcvKakTDwv1T5WPiXBKnd/
X-Google-Smtp-Source: AGHT+IFP4LwculZpDHytgFOooYQO+DAe37OX6SW3bUx+SsxFcmn5CXLjoaf8bYal835tNPCOTXYE8Q==
X-Received: by 2002:a05:6808:4489:b0:3f9:8b5b:294c with SMTP id 5614622812f47-4035a5cb66fmr5946892b6e.31.1746472945262;
        Mon, 05 May 2025 12:22:25 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:23 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:29 -0500
Subject: [PATCH 02/14] iio: adc: ti-tsc2046: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-2-341f85fcfe11@baylibre.com>
References: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
In-Reply-To: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Esteban Blanc <eblanc@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 kernel@pengutronix.de, Song Qiang <songqiang1304521@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=769; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eEbRtA/1AVtNKKSpkTMGRBnBrwhRCmUWINQFMAKTavk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ+TdyfFdvYnGSjQxnbn78dirXh7N6ymDOCSt
 p6Iw0xTwOuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPkwAKCRDCzCAB/wGP
 wNK2B/9t8MkypVvdiIhYPu9BWZjy0pVwj6ZzrIdSNRYIeMxUP6P6xr1urgyWmY+jtK96XZ03LDw
 I+rHBdNju9wVH9x3G8GiY5rETGj9GeqiVOHaWaONF5ICNW8joHnAnm+BP12udwiQZabd7PVLHPm
 N9VNWF03UgTT7QND9xjVOuqpFyJbt+Wka47CvmggvevcKmkTO25EsIHzpf17BjhY7oXHbD3wh57
 NWVO1A6nw3BXkbA8/+yexdX+DhUyPuQ1bdMBIm5f2jSeyu0hDnP2BmaedWqRkAp/G2IDHgU0Q7P
 PvF2AVLT8B8t11fCqLzfvuyahnca43WFdN5P7GqG51kqSdQC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ti-tsc2046 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-tsc2046.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index 84a9a5e66526555b02497b105660c4822378483b..c2d2aada6772aae6fc8d01c3878d6e869d413bc7 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -761,7 +761,6 @@ static int tsc2046_adc_probe(struct spi_device *spi)
 	if (!dcfg)
 		return -EINVAL;
 
-	spi->bits_per_word = 8;
 	spi->mode &= ~SPI_MODE_X_MASK;
 	spi->mode |= SPI_MODE_0;
 	ret = spi_setup(spi);

-- 
2.43.0

