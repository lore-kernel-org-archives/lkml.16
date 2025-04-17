Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDD254879
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908819; cv=none; b=q0bmMjdCQx3sBHro2/zwcVIuIVYjjiNYVwt/tr6mOx+yeDrhbMBFfUkBDLvGnnEo8yjiQaAatPhq5ES0E8VAkVYoFJR7EekZoku3DcKEcQsbB7URb50dCPs5+69bhqYDXWttekCP+0NKexkaLDGUcv8H8TtdnhVMMDbM1A5yEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908819; c=relaxed/simple;
	bh=3GHpd6dz9Xc3JIqdZ4xpPWZT/4sI8qxCKSwerXxcldo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bgjkl8w/FMQuUBf0rtZAvnkXa7aM3amy2bkkcD8SdpntAKizx1x++O26dVXA3Q+mHTZdCbN8D09Yn6NHNQldvkgzPHzsAN++O0KofH1Am0Pgg+kiyW/Qj995J3Q5pJQyf8b0FUNeOCYjKsFyjCbQmTMQpoTwRkMLkK3dvX+sCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3Vy0RwhO; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3Vy0RwhO"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60297d7ab47so529673eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908817; x=1745513617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urgZo6HtwVajmJ+VMQkmSQjRZHquFbKRUH55wzxTQsc=;
        b=3Vy0RwhOYHWvFzJuBKMb3CUvGTPKcptlE2NgUMZUNCaUpxhFY7c2kJLE1gRSDo/Kks
         VaC3t4ETLr+Je4kLDU82ap3gwBH4lqXnibfm50PqMZY9KNK6CFjLmXm4wDwN8QhKC2Lf
         S4LTJEFFQ/pfak11nvJoJBzU5++ToOklfDcWCis37dsOhTgHk0k2P26v2+ZRfjAK68Zg
         CKVL/QIV9ShF2oZreWHcQfQOoazikhqFjBqUhhaabVx4ZHeA/+w+4UwUuV5gTKQNb4oz
         ymc0Q5BNFaOpG7VAmC/5w7xovYqEfqzUpxsBgrFWALXbrvlrPMnEPxbEsf/I87TXXNNn
         N9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908817; x=1745513617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urgZo6HtwVajmJ+VMQkmSQjRZHquFbKRUH55wzxTQsc=;
        b=jeRwP63FmbS4z0wJyCkQZY6o4I8Uv3djvhsWa2znXjtSHY1I9BM1wzQdvwjM0cZe0d
         GWb/bxP6O/mUJetzIPm3gnt5Y/XIsINttHlJQvcQqEzeNeHysKuNM6tRtf4Gx0gJJ41+
         xKz7HwPzo2dvKDpwHc19bCpnW+r5oS5N4rUosDeKY3mRgbFZ/eCCLgwI9+VAZaWJ+B90
         wMi0Q9djyjOuoZfi9WqzmUIz2TrfHT68PiOvaBR3o7xuO+ep0rmexGSmtnE9sp3eixiO
         rbeiySz4V1qokyib9LJ7atPZoWlytyhO5e/aORdWgu9f0/hPAzyAUUDEMKVHwbGlvPHB
         EO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPA04g23daUAhkSea0h5PFulXxG/P0S/37t7Tz2gLMXw17nvn2lQwthETRgNsFV1FluxZc5cG5cbTVlLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ZQDYsigf1D90PS1YdL/HplIwAdX2R+eUJgJpwkBEZkiAb0FE
	MH0Yhel0k10fZ4vcVhst37brQ8aXRUTRlAY918VJla+4x9cucSuTADMAwK1M1cM=
X-Gm-Gg: ASbGncslNVpRoK4wAhQpzHITed6UWNVGHv/t+slmaeMA/aNY7/cA56FKTEbAw4yl+dN
	5/XfxLA3QRzAsYQxWVSBAdFec/8FlV1Eag1qbEZD3kjSFVDQD56YmVeXqWQN0KZ5M1uPQezUugR
	xKRCWC399gmv1dUOYMhxFBVDZJ2ABhpMAHkse6kQRP4QzAml4rj7PhdkJZ+PolSbRjygBd2H5vb
	qM2NU7HEhd0CjAZh0+V7ir1c/Bypi/9GDetV9SGQAG+N+kkT6x9/EBzNbWJwVJTb8WWzacyal09
	9xPb+31o71n8RJbbNyuUAlnk/9oI04+2/+Vo3VmIXO86tBc=
X-Google-Smtp-Source: AGHT+IHBMalnX/GkmDtCv+f1x7qh5UNts/SZQEVLrZNpUXQl72Kd/ilm5X3OIBmpcIcTGM/GMMDEDA==
X-Received: by 2002:a05:6870:4f88:b0:2d0:4a2c:7be6 with SMTP id 586e51a60fabf-2d4d2d3b3c9mr4250599fac.30.1744908817353;
        Thu, 17 Apr 2025 09:53:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:35 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:33 -0500
Subject: [PATCH 1/8] iio: adc: dln2-adc: use aligned_s64 for timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-1-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=873; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3GHpd6dz9Xc3JIqdZ4xpPWZT/4sI8qxCKSwerXxcldo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHapmPoJGvzEiuALVzGsh9ToDLFxuW4TbQ5R
 7lBYAYqMbOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx2gAKCRDCzCAB/wGP
 wOT6CACeVDDKfDNuZTZfOKiNnIAEqMI+pxNQ8ap3qk+HKIbWt6YPw0yt3LkJQCHeOlxwqIgeHsa
 inouAIcp1tkzHBI52RUlHaYGuAjT4mOuwX1xy+jtlqm9HMdv3C6noj2PS4Bq15vHyw6a3uW0oeF
 4H+p2/XpeenenXw2Euxv2/O5lWq3DYipfml0HFQqksM1YrWKVypQyZfdvo0u3d2AlxyWycSPe4n
 RET1aMX1SB6MTVEiOjzHoiwMJZUuLU1jQuOQ2ByivQ2sgtWhZS8K5jdFoK3aKGZoHCIWj7Hc25s
 EEH/9/vc5VVzuUXZM2GyUsQdjFzpmuouco4AsTHhf8uBlBYe
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure the struct itself it also 8-byte aligned.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index a1e48a756a7b519105393f77c4aebde1f2f85d50..359e26e3f5bcfe16d723f621bdfc01df2dfcf6a9 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -466,7 +466,7 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct {
 		__le16 values[DLN2_ADC_MAX_CHANNELS];
-		int64_t timestamp_space;
+		aligned_s64 timestamp_space;
 	} data;
 	struct dln2_adc_get_all_vals dev_data;
 	struct dln2_adc *dln2 = iio_priv(indio_dev);

-- 
2.43.0

