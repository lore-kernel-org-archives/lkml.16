Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C027978F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472959; cv=none; b=QhxyA5BzCQgAIqH99WNBp2ZTIj3MhQUup3RHBngI5cd4ttSKufH+yXRYfyQCpIlz5Vokv4WJj46/PCwKRD+bCe6+hXGm8T+ILVPbNvqEo026h3dRTl7zth3LUzG2C2mzN8vS70IcPGPQ8AxW3InesaEnXJmlpgCQ+AqU6JewRWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472959; c=relaxed/simple;
	bh=woZ4lz73rZsU3uDIGwFORkcYXM8MzKKl2AxtHRksu1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rV+4T0EGM+qEpQmJawj/ACzUHKGYGXSuuPnWqHqtVqCsk5gmOt/0qdHuo+STnczMQZFx6wxxQv4BVJPxDXv4AaZ8aeh4HiwE0x1A7hJA3LccJVIc2p93IemQeUOed1cM82giEkyqGvGiYBg2Fe/uQ9fUEqcovgcotsi1rBQ5MDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=snba2dhZ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="snba2dhZ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c7332128eso2793490a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472957; x=1747077757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LByIDAchmcEufChFWQbH+s0Ti2HHvw4wiXz33sw8/Ro=;
        b=snba2dhZuM1g81skgcp0s2VbGwxnbrcSjSIW8SI+8qz5tYLaH/kp0f9LW9BUTgb0sj
         i852VKhnVNKnCfQGnnNkXpgLAfS4m/F0wUrVaBY43eCPBQCwHcLj1DTXOqJOL9eP2KeV
         N6tQiebE9lXNXh0AYPLVyIRqRN6OAOH6pSriQq4bTu5WIhQ1m2tVTP3uZ15wX29/PGGf
         KcHRAtiXp+22kIHRlspTf2J8wer4B2IxPC8cz4Xn+PA19npB0wD6ZnQ+peSeQo3/25sy
         r1VxxaG38BlzzPzXIdNu9LhWQuoQekdQZZUPjWFWtS9rsCOfEfY3QqZbWHR3sRHFjWNT
         w9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472957; x=1747077757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LByIDAchmcEufChFWQbH+s0Ti2HHvw4wiXz33sw8/Ro=;
        b=h0WoFW+FyHsUhS3vEmdyJaVB1dj4i1rld2ae7KPjU6qzMrNTghip2vW61yI2J7Yv3R
         qqmS33Ej8YUaMp3ajP33sHZcbaDkIRWz+m7Cau26+s5LvLbB9QIvGMX/3PhQJ/RTjGuQ
         t5gRRGtzVYzHpkJZynvy9gKaKgb6Sdylkz2IqCXFsBrhwb8KVn2mIXGn4j5QyX7t2gzk
         2yYSK475hV1FKE8FvGD121OGdal5QOTrDs0z48eW/RLXx3c6ax/RCKdHImWGuT33MYyf
         eFiRfHan/QU0carZlaP0xezCMHudV1qM8RO9xJf3b5Y8PVxBtlHFyth6/kdfxD4kTvkN
         8kug==
X-Forwarded-Encrypted: i=1; AJvYcCWwiAdt7xB0KIeBoj5HeGVQYKmH8bCvaCP3/H6HsksV0d4tUtTlC6qxqRO3ll/vlS8EFJsugOFQpWV1nis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFvIb0MshKvOwNKoFs9KyXhi9DjzlvB4g1mof9LwvjjoO8Zqm
	+vxUxgbSYPwBPasD6O+fjkVZYQ566ThMVGk8FQc37VcVf4U8BNU0KV8ozoP1ztU=
X-Gm-Gg: ASbGnct9O94kzaPIAIwIx/f9jh6PxP9/AhB/hAU+xBE5e5IZIOgLnl7qhDtBNS/pIIX
	fHX5XMNwicFORY/RhC9IKv7Q58LACcuxy2E9a3nvJeeyM0LUlFZpS7+2HEC947M7/dnzc7m4yX1
	LMpM9BR42xf18SLHLsKBluBNs9yXWlz+bhk92LrCPy8wqutJ/ZAfrQoN1J4CqlO3BJcqL6p9fOD
	84qxdjowEOdXkrCIZ0A+go4y2wqyN5zZdfotetOTP+wKSKcjiJ4TZ1oNmR3seKJ85aFReu6yTMf
	vAywXXCCwuUvRe7LrkjcLQtB6NYNNinRvYCPR+GXOkrXjA==
X-Google-Smtp-Source: AGHT+IGylEQxYRjmZfntPY+Ne/47DFT6SNOaHBZrW4Qdk/QT/pAd+7G/jDVvIVeAxzxnIX74dMLO8Q==
X-Received: by 2002:a05:6830:7009:b0:72b:94cc:4145 with SMTP id 46e09a7af769-731ead69406mr6815120a34.5.1746472957173;
        Mon, 05 May 2025 12:22:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:41 -0500
Subject: [PATCH 14/14] iio: pressure: zpa2326_spi: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-14-341f85fcfe11@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=woZ4lz73rZsU3uDIGwFORkcYXM8MzKKl2AxtHRksu1w=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ/mdzZd6TKWJyJYAJUkkexWtskBG6pwbxJzd
 8XJQ+/8jIGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkP5gAKCRDCzCAB/wGP
 wALaB/0UzTYy3QuI4RxqQIDv/5EVvtWzAvZbwCuf1+CjLoydQo1PU2nE8Hbgmm6f5WYKrZHBU1C
 luXg4ZcVDVrpKgXsXdXbfJ9qz5/C3F8kkFs5zdRBlcNu98CMAyxlbPIprhvWUI3gKeYIjU50EKb
 /1oVDAzaBtvJTct3XnEtIMSi62wqQGIE9Nz7/WJHVgqRJ+XGplDHBVYCDW+M7PClq6fGy4HR9Jv
 N5ymXoTFzO7ohwUu8ckCJJCsib4xXAnQ/Q/GnUcynTv2MpZMQLQzWyn4jChM4G2Op9IgNoQMk37
 Wn8Z18s3VzutqY5sjGCxTBAkKEhARyiarwMJm9/KSFcv4Go6
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the zpa2326 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/zpa2326_spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/pressure/zpa2326_spi.c b/drivers/iio/pressure/zpa2326_spi.c
index 8a695b065a5fa40caee128b7eb8afe8485e72659..af756e2b0f313ab749ac0e83c6915912db0ff333 100644
--- a/drivers/iio/pressure/zpa2326_spi.c
+++ b/drivers/iio/pressure/zpa2326_spi.c
@@ -47,7 +47,6 @@ static int zpa2326_probe_spi(struct spi_device *spi)
 	 */
 	spi->mode = SPI_MODE_3;
 	spi->max_speed_hz = min(spi->max_speed_hz, 1000000U);
-	spi->bits_per_word = 8;
 	err = spi_setup(spi);
 	if (err < 0)
 		return err;

-- 
2.43.0

