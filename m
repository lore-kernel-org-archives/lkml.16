Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379E25B1D8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681758; cv=none; b=ip/Yp/X/eVT589GBCbh0dpuRomhrdBzRfirQW+l7H9W5D65a3ENV9guLYgm4lJqtycMDPx4IcjdHip0y/PCQBPbT1l1W8+Az0ZDvZjtcW34jtiOZNKMUoAo7rPfoK/R3l7yWT9NEtelSaJez3T1j68xyvpncXLIgd1XqZ+7oKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681758; c=relaxed/simple;
	bh=Fa5HFGJPviPDbkysR8aRcatKX4I+wowmJDzu126VxiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1F4njl7sktfcOqTl8SY4kGMnap27Ob5yfATpQ3VTcqf1WvDLc9j83M0G2DouaglDBvKK6hi7qckD/O2kuFHVrrixBryoy509Jh3sJQaV6uLatrtUZQGgmaR/1DEdvrlynmQrEpMuby7ErhGvcFxRVnkWrd7Giql7GMvL2qnNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1bgAP0bz; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1bgAP0bz"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40a6692b75cso161726b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681755; x=1750286555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9BvUpsqK/JBPl2TbbTXHb6yTJ1fEP8VZTqeB2IMqFw=;
        b=1bgAP0bzexJDmMqcqUkpZIsnRq8Xs+UKrEXPxx2nGlZQWiNQdo2gsEYNnouTr+Lq3+
         sBktmqjMcBXBqwY4H7bmo9KNYWCEwDxX99k7WVRvdJ9cKKN20MkIVozUzRcSNa3pGYQB
         vgFVQ7LeYvLMm3saLwcw7LNrsBU9sfCbFof/7GdcyAUpUAIsxucJsLZPJJKnL6CYUkKT
         XFIRG041iaXwCAxFHCtWlq28Epd7Tupir9ZBwDhFjtkSdYIc6WEOTIGVWJO0Ok20QZXq
         YZ5P/1Npycwio9ReKmn/aE0Ny3boeAy8eY0no9xFVqEHfIrI/oNaJ5r9oKXqk+q+2Jkn
         bBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681755; x=1750286555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9BvUpsqK/JBPl2TbbTXHb6yTJ1fEP8VZTqeB2IMqFw=;
        b=VRIJKDIwKLxwC7LV2hZk0Oglw0S8ADqYbl8gMkE8JO8qbzVi5OqHv6IxOqEERLKhW1
         2cpV8BJQDJSeVSAwdYOeMthJMFQHweJ3qqVUo/PIOBmcAPMal01iDg9iP4jfjEBnyeWg
         SFxGejxL7mrMRa6gaFeGoh1pagl5f7TFzWpq/wdbPkvORPwjvxIq6UZIq3d/w4i+9rvl
         E2zaeA4Ea5C/QPuoBsvPTIa9A9qxAFxahGUVTkf3sQaBW4/viFWVh7bVqLuO5HW+bFGc
         yJhp1WfWganpAGKsXhEryU4B7cwomGn8Zu8m52KGnBlYu+AYcGowz906Lu6/jLuJAO83
         Ndlg==
X-Forwarded-Encrypted: i=1; AJvYcCUbM6xEUAfu+4kGdodUzHioYDVqsUTPCab5Y+DGQke4dciL8um+wVyXC3ooMIxSE8sQiBgJkuWJwvT9qnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHqO5Bc9W8OBOvlvJPvJXris0l7dlMlnvs0HjKIF9PhYHV4hm
	JxKZ6KVlC25C14drXZ8OED9k18vr/Uoks6xZ5ZTwEY6CaWQH/kKSZd9c/M9+SE7Uuwg=
X-Gm-Gg: ASbGncvg0e3miuf6KDFhsDD60YGRI5XTUOwL2+YM9pBhEeji8vOM7wBqBhvaBmJNcfO
	vnSBgDmzBKzkKgF5BzOEdfwEG9ttJhHz9g3akY53DUNPeXvJkGe/IJxAVqIR/0wI2RylpgH3fsT
	wud6Ob2NfwCtuECHSh7WZjkmOf2ZZV8kr4/p2P71B7fL7K6pP1n7J4yy7M9Vp1vJkXJE5PXxAtn
	X20Xv55ud2z3izbOxV6ekmdu4O/3URh9AaZVi/6ZAZNNSQ+1UuuV+75NpNG/6I8azfxJsa51Xe1
	a6kyKOmlu11kD46tb8kDqKIOPF8otiHFNQeC06RZImfggndx5qcSDFHW1YFj7WhuTIRg
X-Google-Smtp-Source: AGHT+IH4s7lziWY4EX5g9K2vsF1LhCQHLal8KFovkbFZ6XWeE1Gtee1uuWTA5RlWmKL64/b/sVT1OQ==
X-Received: by 2002:a05:6808:3512:b0:409:f8e:72a6 with SMTP id 5614622812f47-40a669bffa8mr423102b6e.1.1749681755112;
        Wed, 11 Jun 2025 15:42:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:01 -0500
Subject: [PATCH 09/28] iio: adc: ti-ads1119: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-9-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Fa5HFGJPviPDbkysR8aRcatKX4I+wowmJDzu126VxiY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXAO2JaPHgSGAZdorjz1JGy3kAcpjr9Jr7g+
 ungIXqOY0eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFwAAKCRDCzCAB/wGP
 wHxjB/sFWh2ELQP61fduPRox8/3+KyTM+RQlgumdT7LlO1lLAEpiFtW4X7LruzoNcg26HI9DIYM
 5xMgNMPlGQDH43u5zRNeQb95sLGhX38U/gEtybJQi9OUyW5XA7GeaqKbCi0nbrZHcDXAaw653s8
 Q0RMbiOeC7z6YROCPWks3b4eF5km/n+4y0RKw0Ifa3ipSc4Z7II3nQzGglfRIiER6v4xfR7JQsQ
 pOPPQ0zXq7qFUoYOnx0ctpg/4uipiA1WrZfArVpBS+2ma7OGrqtQKtP5I39yVCX6SdgiNFnLCg5
 DI3AqiaO66yFIW4VRSNdwSecT26YAQ4pOsJLv10vRGEbzusn
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads1119.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
index d280c949cf476c7bcbc1e046755619ac31d97c63..d2f86e1ec65641feb3625218611fc8ca00e9f64f 100644
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@ -507,12 +507,10 @@ static irqreturn_t ads1119_trigger_handler(int irq, void *private)
 	struct {
 		s16 sample;
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	unsigned int index;
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
-
 	if (!iio_trigger_using_own(indio_dev)) {
 		index = find_first_bit(indio_dev->active_scan_mask,
 				       iio_get_masklength(indio_dev));

-- 
2.43.0

