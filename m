Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C092652A9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681776; cv=none; b=fHgfRWQzoGDUUEdz+OfZ8NwKaF3HnjSKH1jJAHwnya90Y1iZO1+GLTP5ENKcqUnW1KX4g7a0EkhvyEaKx26Ul26VE5IKiZz2ns6m8Lkke+PMjflQfjQVGfoD6QDNEw2fLou+196Q8s++/7oKwAzGgWiBdDNPBAvXry7USryd9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681776; c=relaxed/simple;
	bh=gCWBhc3n+k0rOzdOzNEkxMDkk/9qdZ4NyBLN5i838X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUyFfT687rp5gjWUJV6uJrDjR/xT60YbTGyuU3NvZQKkbGjEq1IjRipzvLTtZTnm3nLhH/pFXIH/hLqYZIQiboJIiqzNEIbEqxIBiBai/XjnpgUqjShYl1HzS3qtiaiXWj5nWxfY1bArkoEaeDw+31aPvR/JBINv1KQsxUHtabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WbwPIEBQ; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WbwPIEBQ"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-407a6c6a6d4so131144b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681774; x=1750286574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=;
        b=WbwPIEBQOjtAMp98yMv0P3Moc+gaNX+fMi9pO+1VepDERLHo1zUFwYfrxZA43j9kuu
         uT8zH3/wsFwlfJufdheu6lGRB99o6HtFqLpN8f4O+9wbScdnmGe52L8w+M3eSd85mua6
         Lwvm7DMaxmAiUZBMXJ93Q9htL2yXZcYHRd7/VwwcLc21oN5S8qlPztUCfCO6wLREP0pu
         GKuwmzpWKo1uJt61lym2M63hFtLj4Ag8Pfzblg3MIbzBDMkpreWAnAG70JpfYzxjhWiT
         gvzdPYJ22hTXgDkQUXrU7yFBA8ry5JMwVuphx/+9fx1nPsxmE8q8VLOCT3n+jI+NZFtN
         SZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681774; x=1750286574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=;
        b=VqLoyoXSn3+qiYgMNTkt0oT8iWNzx9t6MqtL7+ndYZImElIIk+R1ixiTNJDvreFmeX
         9eC+p4TQyHDwAUcACuYGK9d7JfQti3jlp+X7MHAUsAsQ5O7YtvIuEFJjcpPxLI8AZKP8
         VZxwZ5xdUCTi7Wvav2mijwphLRVso4RyPZWbJwHmWR5yYPaFj9evqToIM0HJFmK3wTW+
         GU1lAidgKxmJ0h/0I2JOThz6zrLT2kVa+2EuSGD/MJKyRYoBRWfw/ELVWfKbJ6x6SQME
         Qe8vf82aqLrzo3InfsukeMYsdvPfKA3cHBgsPPm/w8nM+4JBXoLEdZnLGbSxRSZ7Mpkn
         5pdg==
X-Forwarded-Encrypted: i=1; AJvYcCXaSJ1+WMiJf0KqfTHzX9hnVR7EU9jAOr+9Wg72GEPeAJWUEgpkG4KiBc37VmUxEZphRxj/nlLHgSc3nzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiiOnq/6JCiaTJWUcOFXxISHuO316EakfAd/zcdqXu4Mb2x9Jd
	bXAnD3pkY73qYCA8OCZrgOyo5A3Lbgfdef2gelnV2/QNBvAJQ3GnR8qFzKafKgB5PXU=
X-Gm-Gg: ASbGnctGtgU82xGJyu0u1lExzcqd8NRhRoqNJMlH2NS2SGsa1nYj4SNde+L/SQrJqgp
	IzIv0FhcyOBmKmS5maqRipCjgbStqLKN8p0HyJ3odGV6SXrLQUN9pjsW/UM/kGqWNj38IJpl/oL
	TSnEjzL9/O8YUyvm+/YT8HTG5taF/gxOi6DQhnJgNnWGwcYYJgvGSA5HbhupASquWvPpvTv1vPj
	6cJxrwWhBLiGlQBjgbMYHYjqT3YyGcmWZGxQQ97zZYE7Ucxt7WVbcXeMy0FHpVCSsiWwNEeYntx
	Yqm9ZdUo0vWiijwiaAOWFH+LMdGrU+0TuqBrSVbYOD5016eCFbUvN+qIJ2Z0lUnOhJHh
X-Google-Smtp-Source: AGHT+IEno7iivJ7V9DJ4jS9BfN9qMtC3Kbpn1hoqPd/0X7I8V1hxaDUFP1SUYvG7cJTjWfN6V3+JZg==
X-Received: by 2002:a05:6808:1a10:b0:406:6fd3:ff13 with SMTP id 5614622812f47-40a5d127d4amr3587773b6e.25.1749681774060;
        Wed, 11 Jun 2025 15:42:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:11 -0500
Subject: [PATCH 19/28] iio: light: ltr501: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-19-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=gCWBhc3n+k0rOzdOzNEkxMDkk/9qdZ4NyBLN5i838X4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYBVhD9q4Dm7oGQ6HylErBkZw8NPS9LtGnpg
 QcqtFQcxeCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGAQAKCRDCzCAB/wGP
 wNsdCACOa3y5zsZO5jRJ6TXkHQFX74S3Nr/9bVgpmLdGxld4Z+7+JIvhiis7hU/SPgSfaXy1HEh
 ktDMqm+R/k9m6uW1HuOC7FUOZJLVTDEKAKUxRNRhp4bfH2LUFh/G/3GgfwO9f8PoXq/NmULXpda
 7A1aG/YSYU2eMZZHKx2FjIlroUI+Q0DIRxoJJRuaC+0ZUZnQcDdRFGU+SUR6ZUAwal16z0jOcSF
 j9VebgtqFrmJs6emiKebaukDj4wXBej4ZpE+d+H8FqpWL6gldFBpIJFLejRYOTZaFfnP4LO0Eri
 JrZp1IDGBtR97RjR801xEzHW4QUVCM5l/UjRUFcCLscdfHuy
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/ltr501.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index db0cc3642bd8010358de8515c24337d7385bce38..c14767472fbe8620ad59c8417d2ceff14f9485a6 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -1279,14 +1279,12 @@ static irqreturn_t ltr501_trigger_handler(int irq, void *p)
 	struct {
 		u16 channels[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	__le16 als_buf[2];
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
-	memset(&scan, 0, sizeof(scan));
-
 	/* figure out which data needs to be ready */
 	if (test_bit(0, indio_dev->active_scan_mask) ||
 	    test_bit(1, indio_dev->active_scan_mask))

-- 
2.43.0

