Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3923E25D90D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681780; cv=none; b=S/D7DqM8wm1E57JLTzatVW4aQ/2r9eZJHmbw5+jlsgBABkBauXHxa3yQkrqBvt0RDVYwSoncCKGWXN64POe77FJqYHZUbTxxdQq04CmUYEOLqf/4BPrY80gAeupwluDW93oKrpf4XVecxPa6Vs4wn5/xaIWV2yKke1MSrRdwdgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681780; c=relaxed/simple;
	bh=iremmMu1ndnd7A4Ps07xEYpBZI14kNGzGGkmeue7GjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szUNpszA15zAyopnFtUp45dqacvwu5WvZ1gvEOxwDcBQRcmDKWIs5jjeqdB+L4fYKgHRMJyenFmZ5YTP4hNE9vtbCiMrQ8Idm26rGx8L+oJwRBj9JFb1ZTbcNLRFe/7KYpM8WwbLdlCzJvLgjPYN3NFtcIQNVNxhZDDrG/vLHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UppqaxXN; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UppqaxXN"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-40a4de175a3so219918b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681778; x=1750286578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gNeyiiatnOg12pB5RbWcv5kPhqcJXqPYg/9AFCOdp0=;
        b=UppqaxXNXYQQBK1xtmEkImo9br0NF6WhxmPgCJznezuAsTSdKUxd7Zbu2kGq2UEpmG
         U9YKjlez62Ur+4CAGF5PUI6bsxZZlZRIJ7hzW8Zg0bqqlYp2nNHLSwnLsPFpLjtSSDRB
         tH4jd3NOF9EvZ4GjDS5hfZVU6Vu2x+OQjaHp8JepyU8+y4roPl9G8C3QQAoYEcKHc0ZF
         d0zMJamRxDe2zrU1mBeZNLRZU/WmUD7g6ZCBKR03NnN4PkvAh2w0bAJTLYoFHsRdamNk
         WjLeG2ZUMT9F6TnAyvsZDIss7nzvdLbSzNqs0GDTiNdJACZVADRAYSdapIH6Mh2OHrHK
         ov2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681778; x=1750286578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gNeyiiatnOg12pB5RbWcv5kPhqcJXqPYg/9AFCOdp0=;
        b=vcN1MzARQggt3a+kCkQnFy2GZ21d+qUIlz2nIu1DUKUsmX525266JXQMCjyXgfHQnN
         dhOlVmpL+sohVkAdU1g+KcZpYgGAwGcputNa74EF7xCcInK+x82LLjA7QIn3ZYQNMKlG
         1u9gCBQ7I2DqwlcYR9+ZaLKp5UnrI18IHVnhpXwO1PAWy1/53vRtI/3aWv0+a+9vsXDj
         qGut/w2dvNcinQnbJ2ojDEfRLtecKOHqj0o8siIPpjcOrN4r1vrKHoZDt4+3MSNh/KK9
         04caYVCuP3OwjLOEAXJbbpcb4T+hSwU+sorEo3vTIfagI6FCFiYzmOgEWn/oxnNOPKB5
         c0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWiboe9etdVVhk7JqN0Pjbr2zeI+Lzvr/+Jk1swYflXA9v4wSELknBq4E21b/BGlX+0/xBBXVWCyA9kp64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYvbOsITrZQmEBpDAallMLjWs75hldbYg6PJLdC3qjzhW+C6Z
	7eMhnx3A71AkYqdJWDYzin+8DCfNf/vmVtf7OM0tONkIXzGsPwt84hc2bA3/zs8q/e0=
X-Gm-Gg: ASbGncslIcdhgccv9xDZMWWlm4wgE9w9VOYkzt7Mv8vqK2mVUZOjcuB/UaBWKlAbohW
	RXDjzA2ALHjE12eWHQ8Sh3uXZf75eYvEr9cpYPjwLXaK4lbuBZ5ci+YbI5VfIivy/oYALpG57gp
	nKRYz0A3tCtiHhlUj3NKGTx9XyjedasDCXpkyG1fl3rn3OVwsHPeHo4FpNqJwY0bl9bQGuWbG7/
	yLNap6AhjdPkVlGCELmFnVosaqmdBRh12LgSGV50yvkXcABhylw1hd5buQclqmiqLwLMn3YNZn0
	yP3qR4aTQ51kFcNp0c6iP/GwCbcMdG2M7oOIAv4pI4u1l2q3S/gbT3SJTU5P77BDwURS
X-Google-Smtp-Source: AGHT+IF8vLl1oZyRXlNmWN4+7O4lpLib8z/LRQvjmS2nfSR+pVwcY8I2vpYyrg4nGSIO9hYnaIgubg==
X-Received: by 2002:a05:6808:2395:b0:406:59f3:738d with SMTP id 5614622812f47-40a65f82d85mr1058633b6e.4.1749681778380;
        Wed, 11 Jun 2025 15:42:58 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:57 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:13 -0500
Subject: [PATCH 21/28] iio: light: veml6030: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-21-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=iremmMu1ndnd7A4Ps07xEYpBZI14kNGzGGkmeue7GjM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYP8WsYQcwPg/QZttEVQAubGL55qot8Hvrta
 PXX1og+vq+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGDwAKCRDCzCAB/wGP
 wMjAB/9UreFKkkIj5dONnjnnK8DcB0PP9NwVYQE0mLIdoU7NMfJo1xDYNFB//ohFjvbKA3cP7xn
 TZULWqPy8UzorusrfpYLqSjNuqe/iSnOJUyt0URfEW+PFO2iBTYLbevM1E3jZs4OP3y1H9P0LkP
 lzFF9/gmEjEOZ8TX2HDvoHjSthCnmkIbB0rZgSAWzV2CtwsWAbz3cJmYxU45vdgfhXTi5o81ife
 +AQ7EmHHgG7cy49HOGnvublhmnWgpvoPulkVMW5/n7FkpryUfUCAzJ65gmUs/8B74qZPpycDA+E
 4e5skikbdS1v1z198Lxa16R09kc1jTul4iUxmi1lPrhTkD4C
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/veml6030.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
index 473a9c3e32a3a53f373595a5113b47e795f5366c..0945f146bedbda79511e704158122acaac5e60c1 100644
--- a/drivers/iio/light/veml6030.c
+++ b/drivers/iio/light/veml6030.c
@@ -892,9 +892,7 @@ static irqreturn_t veml6030_trigger_handler(int irq, void *p)
 	struct {
 		u16 chans[2];
 		aligned_s64 timestamp;
-	} scan;
-
-	memset(&scan, 0, sizeof(scan));
+	} scan = { };
 
 	iio_for_each_active_channel(iio, ch) {
 		ret = regmap_read(data->regmap, VEML6030_REG_DATA(ch),

-- 
2.43.0

