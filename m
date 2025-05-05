Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1427464E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472950; cv=none; b=DRsvNRYnWmTzoTLK41bWaO2FaSmuwU08JyR6Zd2QJw45YqBoWrYbVs/5Fyj9HWll/4f9vY09gvXPY29h7GYChMs53a8SgvoLCa+BLo9D6AuhGbB2CWw1qPXaVIjcpLPeCvteahfFT0r7prScShBzhwYwiGCk2GKc7vMPlOcLupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472950; c=relaxed/simple;
	bh=fqxIyfja2TG+RPVHXvxo3s5HiNJPQBH0+aehmw+7fLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBAQvjQQY3Pb3p9TyV7gA7cyKFtRIfSnS1vnsCIq/Sjwjmh2iheBgRbdxJTsEzvi+yy4go6MzVvtB7+w0oPKH2Zo4nLyolgggYmi64w9HQtchQzFSxHqNjLPTIVkXRYLcDMSXQG/Xef4WPsD2K3IuOEf8mo8++ovSaC9oL82VDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C4LJgICt; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C4LJgICt"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7301c227512so3356109a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472948; x=1747077748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GaQ0qD1htcx0uX6tZ+7jRM6UbEY8HZq4N85AjHlpNc=;
        b=C4LJgICtwgmK2mFnbZFZUSNbgz9Dq62AiOcQBPaY5qRTxS4cDT5HUbLsvkzD0YBWfu
         oNoDud4l4N8k7OcovkVnor2CBT33KuR2+vlbAFjHRx4LY6el3sLUXvPP4f2o8UC0qtx+
         2VJwhFkjdTx/2C0t0Fc6eXvflYEBAbZ7an3rdG0NdX7tOVb26wey6B9XcaLH+lwiToIR
         0zJdPWN7MXcLdg8K6u4JSOBdDk5eOoeHJOVUvm2jn1tJAecKR2q4+pF9slijfuNrDFSR
         Vx+WMEU/OrIDJWS6noVBCZrUt3xgWVfmWiCzSRei2KOQhzadrd8b7DAtSVJP6aqjp+N3
         4mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472948; x=1747077748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GaQ0qD1htcx0uX6tZ+7jRM6UbEY8HZq4N85AjHlpNc=;
        b=BXN3WzX+zEe+u1GQpChOyijy7IJ83A/CvEdMSjcvv5ZQA6O4l1MagvXQfHCE2ZCq5q
         3nycGeB7eJCJHBg+srpDkI9KbbGPZLId91nPBswoaOHGryHQqthsrMqlXJrohp3NyBeS
         JrnKera0KsAEIV0HMweG3hByw/AxuPESqvpLRrfdLxQSwDCe7LL4eFpOYILPbo5c4KWZ
         N/yPgy4C8E3efVTXjud5WoLgz0YdgeA+xEIErcRlrLWLqApXX2jp4+ZpR3z/1mcoxaNg
         wsIen8X3wLZA4qvNqBrSJyxHpzHajqRwmJgxP7J1Wt84HeRNl93KGy1yHnk56Dk1Gdrg
         XycQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM+mikU5H2/ZJw5R5IAEMeV0vn3jDY8wGHY9nl1x4wMtpjwYVwxxhGNFrsjTlZ0VdcBMEkrfDX7Ywzwzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxghaT48nvgW/67rs9FV+FY2iyComP2b3IVfLVILTK7Pz/TBFbw
	NdamQX9G/alR4XllcAK3LVku2Bnff60+aMRYQL9mGkHV+jgCrQTHAPDyFB9OL7g=
X-Gm-Gg: ASbGncuvnjBkNb3XxAXJ8nqaksa6/+1LnLkPLTprZV7RjKpErTQvp89EF11oT1amp8X
	CMxAAEInQ6eMRye5YkaYY4IAW1dymlRXATQypO0WvvDaKMTQuT3LEK+cY0Kds0YB+tNjsM1zgYT
	Uj/+yrI+dycWj8+4spHTKDguLp/wnNKF882CBx5aBtubekzbPjezJnUBihzXG5lY6dTAZB3FaU4
	At+pydcKk2pLfFCjtXfvf1gO8wN0ApLs0SOoGXm9TpSQ8BHQB4C53AHKVKXmh+5GueHvpLXF6Ll
	hQNZrgiJLoqAPcuUI1NFrCI8ZTOtcYGwr3Uc7L/GYUurLq2YIjldWt8d
X-Google-Smtp-Source: AGHT+IF36vY622ewxTuUs56rHIJSkbZjcvyKU7lkaOYMvBXSgM+/TfEola2PYnMEq9Ot7LzWUZeKAQ==
X-Received: by 2002:a05:6830:6404:b0:72a:4762:d387 with SMTP id 46e09a7af769-73206dc17cdmr93092a34.11.1746472947937;
        Mon, 05 May 2025 12:22:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:27 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:31 -0500
Subject: [PATCH 04/14] iio: dac: ad5761: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-4-341f85fcfe11@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=fqxIyfja2TG+RPVHXvxo3s5HiNJPQBH0+aehmw+7fLU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ+gqLY7x/JA1itYeDfyzmzv4xLJWQO9wP30U
 TEkqvT63amJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPoAAKCRDCzCAB/wGP
 wNbKB/4s6oJCMyJE1XwZeyV/6fyZjzVKETfRWxPO1ooSaXcStBa9hAE3YJbkXDgLR7FMmZKO9Q1
 df067PKR28kz4uDdOH171gnfFusSM7V/05+d6TdQkMeE2BG/kcguVj1BaIFRlKVth+HK5EeLVFN
 qgLpQD3awB75XIz/IGoRZfrvLg8IDqMuBAyBvvIlwgqNEoAvqdgLCX/y4P9lucPJU/osiIlzQNB
 yxZKgLI9W89oAJOhCP2VJkgPSEy9O0QS5+9ik4UzUEJ7CA1OZhfKJaYJrv55Yb2oiBhCKGQ9/f9
 Oj/I56tqJpGyc1unQbbnJ1BXbv8gArOXcDyIahTliJzeu9BH
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ad5761 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ad5761.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/dac/ad5761.c b/drivers/iio/dac/ad5761.c
index 124571ba35d1021cccbcf6883cd16607ba108af9..b5d20f04f070a170d911aff65c88600bd2de5428 100644
--- a/drivers/iio/dac/ad5761.c
+++ b/drivers/iio/dac/ad5761.c
@@ -137,13 +137,11 @@ static int _ad5761_spi_read(struct ad5761_state *st, u8 addr, u16 *val)
 	struct spi_transfer xfers[] = {
 		{
 			.tx_buf = &st->data[0].d8[1],
-			.bits_per_word = 8,
 			.len = 3,
 			.cs_change = true,
 		}, {
 			.tx_buf = &st->data[1].d8[1],
 			.rx_buf = &st->data[2].d8[1],
-			.bits_per_word = 8,
 			.len = 3,
 		},
 	};

-- 
2.43.0

