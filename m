Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE5E25D90D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681767; cv=none; b=JLnclSFnzSKBhtpuEFki0jJEdOKcM90QUdm2I9CKACZ6j5aEDOpbKdosp0rvVgPu802MHHLpjAyxD0BlEWpJ8KfQqSkvkRVrqZl9OLzbRvVT5zPYLwntW2+MtaH1zHK53aJoWbLDbdtPr+4tN0kHQJV/yUcXOuwokPAyMUPoUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681767; c=relaxed/simple;
	bh=/BUF3sI3UgUZuWXo/TdJaTMxjYqN2OTvccYkHdo0CWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBz9nNvXojjTCWcqf1sl7EM1z7oH/pAB1Nr4VbVAOFCa0cT6cmJzDmj7j448oaFd6nfghSIl8UkLaZ9rG3TytlGr/VP2RV5pP3Pju0g72U07QqAd+6/RxCPDl0vIF7Plq+9E39ky6y6kDTfo6eH9cLEWNJLPwfJFL5v/z7wOQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0v0cNQtC; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0v0cNQtC"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4074997ce2bso101147b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681765; x=1750286565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2UNg6SvTUsLvS4xPi0bVdlEHCiUbwbx1DnGSz9PULU=;
        b=0v0cNQtCh+80+vcD05qyU5VktOD1MENR/RmLK2oiAkVykf5VcvPt7kuiwv5obHwETM
         CArZdQ2BTvsh3/Iy8s3slHLlZhHQefd9HbfAk2IDsfYyYvdadX4lUFDne8vq4kYQSw4b
         ua8hnG85ydV5RYDBcBVjrfybJACZEAlHH4DDdKmKl9M7SBycsJrqVu+Cz9xEFgzr7j34
         3y3qBpFbnRJxH0hwAyB+B8aqfaSvYHIXIKcSUuFRdKhhCAPyfxC5UbO9iQxKNweNunbm
         6T+DyJzM0ESI0QNYrMgZwndn76i/idnRWMDeOsA9aWzik+P08C6QDkaJ9IryqYfL6iKl
         pGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681765; x=1750286565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2UNg6SvTUsLvS4xPi0bVdlEHCiUbwbx1DnGSz9PULU=;
        b=A32hY4yePobe0Z80OOBgSEkwxek4BFO1BlsQ8M4nuFAsK1lhwWzb/AcXZ64apfl5BE
         c1IYubpIQfD21Z7f8bbH6PdoagSy2JR9+n4NxGJ6Udej57PWoCEY9b8GqsqtnPMGLN53
         wUfyiHN9G8GASS5LVW5Pgqf7NxshL3Rryd66u4bLLdSkbshAWn3kd2biouRmABjKYiAt
         HbO0ibyYGf4zDH+LoScvbl6J0rVk7E5E9BDiUtpSnygtPG/IF5oozqRdKlMsHi1ltI+h
         I2qYjRtXyp/qCIbQCcszk08/2xGoN/oec4XWolk7dxb3X8mVIWfiKsXx8azhlxoUVZLx
         ztgg==
X-Forwarded-Encrypted: i=1; AJvYcCUtqmZm+sYv3K1Y01ytKQDc3Q39jHSS5IRj0OORzDBAhr7GblHV9oJV9SbrQa2jlsDb0qdWTl6PsUcZfZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Vy6hC9JhGquI4Gf7Ca5TV5ahAxZIzqh4n2tun2P8QY5KKst3
	CQqNLHKogm7qobtNQK4kpB/BZvBjDbEOqxhUyk9gsiF4GtA0HHT2oOsZrC8odgsmF/c=
X-Gm-Gg: ASbGncs+TuLCOp3AX/vOxRaQp77qV+S374+a0S44i9ceDLgIURHQIf0aHs+bmI/PEG2
	WbVz2djvna0ykDVfJu3yWJhQH6Ue6wRobC51XcJG1YRQvrX1kG5X1TGKvIjXiB18YmNOmdrtbd4
	5Kq7uNlXeInNbwDGEDJoQgp5BI/ihZOMHHYja4ZgQxGmiMQ+Eus0ZR3m+GLGiZam7+T2IMJ9muI
	m/VPRKu/KU/h7lZwJgv9IuXq/wuUUNH/qsrB5yRhumu0D4bL/FOluW96ARLshTYTkJf6Ey3uQVm
	kDBk5t7JVD45qMaepfTyMO+IfNTLScReLNk1r6lVy5i8O1/2epvAJvopayQ08wijFzGF
X-Google-Smtp-Source: AGHT+IFtdjG7FJlzUxyoQdzNSopQXJAu7gY8CXP2Gzp1csbup6tf9jsf+umiF0SzQmKRhZKr02rKRw==
X-Received: by 2002:a05:6808:23c2:b0:407:a47e:6e43 with SMTP id 5614622812f47-40a65f9214fmr957924b6e.1.1749681765005;
        Wed, 11 Jun 2025 15:42:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:06 -0500
Subject: [PATCH 14/28] iio: chemical: sunrise_co2: use = { } instead of
 memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-14-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=/BUF3sI3UgUZuWXo/TdJaTMxjYqN2OTvccYkHdo0CWU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXgx0zbHn3Oo3OHG9JE4qdzOSIeNJ0xKf9sX
 wnfAW8aNIqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF4AAKCRDCzCAB/wGP
 wKEOB/4rZj/0DQjmcBcARn4a2juCsZtjNAGxZS6Gnnpvb9lBcZ/M7WLd2TJ1FU4tng8kNtGsdpl
 xxpYcw9zUa03RA+T15dk478hNrBOrf2769q/x+Z1ASRK6yXK3oE8+pjK5cy1Um2YQXRWQEm59/3
 /79KeHDmQDe11sPIhDQI+6E6v3n71Dc3Iy4yldkp7noMM0+e6hb79BqwrA5FGzOlOZWqtZlPc2T
 +cXsU8GS8cJdJPtJ2N+qcs/bXCjapsQgI4a2JVuet7WD3ZhgXF0vk5hcotnb2Rx0o1conJ7TdH3
 UiMPLiwJFamoQtn4+HaIKDh9EXnxtMphf1igA9vqBfUQt1tI
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/sunrise_co2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/chemical/sunrise_co2.c b/drivers/iio/chemical/sunrise_co2.c
index af79efde37e89170128ef9351bf1ad8b993d4a2d..158be9d798d26199cfb40ef0d294f967ba8a737f 100644
--- a/drivers/iio/chemical/sunrise_co2.c
+++ b/drivers/iio/chemical/sunrise_co2.c
@@ -51,13 +51,12 @@ static int sunrise_regmap_read(void *context, const void *reg_buf,
 {
 	struct i2c_client *client = context;
 	struct sunrise_dev *sunrise = i2c_get_clientdata(client);
-	union i2c_smbus_data data;
+	union i2c_smbus_data data = { };
 	int ret;
 
 	if (reg_size != 1 || !val_size)
 		return -EINVAL;
 
-	memset(&data, 0, sizeof(data));
 	data.block[0] = val_size;
 
 	/*
@@ -88,14 +87,13 @@ static int sunrise_regmap_write(void *context, const void *val_buf, size_t count
 {
 	struct i2c_client *client = context;
 	struct sunrise_dev *sunrise = i2c_get_clientdata(client);
-	union i2c_smbus_data data;
+	union i2c_smbus_data data = { };
 
 	/* Discard reg address from values count. */
 	if (!count)
 		return -EINVAL;
 	count--;
 
-	memset(&data, 0, sizeof(data));
 	data.block[0] = count;
 	memcpy(&data.block[1], (u8 *)val_buf + 1, count);
 

-- 
2.43.0

