Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6268525BEF9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681762; cv=none; b=pfUQGy4ziV4L1SWzQ520+P4oUAZx6IhLgxAD356OHbykNW8xdzR7pRUdBUskYVTH7A3uHmYlbT+Fin50DXb4bOlAg6f1kqZpWp4TObNlF7JuqvYYx3w0vd52Z+LONKSINb0X9xRMi04nSzX2VtwQKVq+kGFckreGAXQktiM7oME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681762; c=relaxed/simple;
	bh=yBs3XS+1GgmnqB6Z/LBOG9076RbaTKgSQXFeV9Rx9Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUIg3qcyc7dktSzeTKnynfgD6G2nb7XYfc2wxAXdeqaq+uC+cSytg/Gr/UdKnbz32esFuIoMFW3ikLa+C3MwkFH1xwC+qaRe+Z83Cmuag+Z3Scu5dCsw1PsU8yZDl59tVy+K0Q4BzjpvwL0/502BA003OiJGLTBjWb+gBdGm0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zQ71/c/3; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zQ71/c/3"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-408e0986303so224244b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681759; x=1750286559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
        b=zQ71/c/38S23VDirhOmYl/N9BKCgpDOG7jWi7JvUbRAkBPQRwtujDtngt8yIIYjXSu
         Sh54Amdf4BWPgG1H5rMsPWTm8XTzTw3ARaS5XIRFkmGgMnABbgl7g8FAogxUTxqem4gT
         ndnCUljs3Kf2WIGMCyps0cjDw2ZanGQtTyDMQk4yDjpW7kJIL8tqwL8vnL4KNoJuXgo3
         bbXU2/tDXpaofC67LyN6pxIkrt0dzIs9bCUEiZS2ZCZdNmLUmsskg++B7UKxEXvPGLmf
         Ol4v0+vIpbr8Ikzz76FSDYk+7LXCqfcPSpEmz7DxWxExDrgAPfZII1Wwid6JizGu1bup
         ew+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681759; x=1750286559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
        b=XVQdMptC5aDFmQon9QdrfrX/9Cr24z2hy1ItC2D+OQ33oQvTzBc0PtSiDXbaDfxSE6
         VWcUuZnNqA2rG6RSLZaFVtK7M7I+S0xaI93yiZdy7UphvMGqy8ONNivnGMoZyuv61ftr
         fZnichXAFgxnhIR+UrhAMZCCO9wu8eB0ExAnjJ5n2RZKxkQv0eEkGEmPy9AC37ukikco
         OtI1JtPzxMOsplZDNt3lAJ2m8i3TMoXwrUeIAe4w/c0wVdwBoWBh2aR1dTAD73evgu9U
         3pkEZKIyofmHLQHulnZYXxG8E53uqzyRkw+DP15JME7wsellnig+OOXrT66WUFZY0LDA
         76yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD40N99poiDUvTqpx+yW/C7jnCheCllvn13rRe8KP6cWiIffnt1Zb913ptyP+X21VQy5lPkJyWLCIj+DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvM8CkZWB83aeZGHh3kOMgEIbZs177A4Y1wp3QpDPpUgt1yQyp
	eRgvHXjZeELAL6B+b3QZ0O24cXqlciUJydoEmFf6T2SK/0QRN6OuXWQxGwUHUHiXWG4=
X-Gm-Gg: ASbGncvH+b9QMurNiwQIxAgC8WilNN++DcGhZWXwWHWWiCP37nkDQYI7ucE5/rxXrTc
	fcZeVkgXGq8MsmC0u5NMWKTlqgoKkp9mkCl1KaZ3sAuuVIgFBlayEF0WJA7Flvomu00ht0GMBVZ
	ixp1vhRNDix6snN0CdvfT5v/oItIL4hwzlaWKIWUAFVXsJKyBaHNdDbwr0SOQKZ7wbMylC5Joi1
	WzmANcGT3SObG0HMJEd4y+lbrZaN59so5REMThlMpWd18Tbi8o9ZI2Utj1VqWk2KxIzuKx+gowZ
	nsj+edxzxmoGKnosG8FKLXM/RBF8gTdBWP65XIZlFneG3oJYgafvyopRjzjhsWHn431dB//7kPr
	/8WA=
X-Google-Smtp-Source: AGHT+IErlYL4bsSFy9ngVg9McugAmwec16wRc+73AVkKa1/aJVelh+e5fLLya/tzgRaNA/PwviOmtQ==
X-Received: by 2002:a05:6808:2213:b0:406:6dd2:5eb9 with SMTP id 5614622812f47-40a6609c56cmr824967b6e.26.1749681759456;
        Wed, 11 Jun 2025 15:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:03 -0500
Subject: [PATCH 11/28] iio: adc: ti-tsc2046: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-11-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yBs3XS+1GgmnqB6Z/LBOG9076RbaTKgSQXFeV9Rx9Tg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXMR0GMvFJcokv5VGg+Ekcm/aUw3x65eQXt5
 Qau3vKbyEKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFzAAKCRDCzCAB/wGP
 wEqYB/0aWaPu55zIJCA1+8Yh+2nKwvk/9shr5lt8X2HMjBVuKIJBARV1Ihwlk9gBU3FIMvsGMgJ
 W4gNnxW2ahFYBRU9X6NIB7qIDdnlu9FLgIBs+7HvG5ZrFCdOT1vleHncGAZvz81Lg/RtNlspo6w
 s1e4DQd9TKIrPHH4VDXiTl3tRfJ9p25SdmwrE3UDuHM6w2LPmkgKoeJBV8Q9r3QX0867CsQZJaL
 9H8G6DUTaF7neBW/gG1OOaACNgb6ckSo1vV7pvEjTzFp78nLZuf8MaSYHl/PCQHCKhEakB8WqjH
 9f3O2YBAUgw4FjBIASvaE7wTglESbk23by+IQjvgTwOJGF9M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-tsc2046.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index c2d2aada6772aae6fc8d01c3878d6e869d413bc7..74471f08662e0291b097fcb277b8ad9cb6df200c 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -276,7 +276,7 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	struct tsc2046_adc_ch_cfg *ch = &priv->ch_cfg[ch_idx];
 	unsigned int val, val_normalized = 0;
 	int ret, i, count_skip = 0, max_count;
-	struct spi_transfer xfer;
+	struct spi_transfer xfer = { };
 	struct spi_message msg;
 	u8 cmd;
 
@@ -314,7 +314,6 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	/* automatically power down on last sample */
 	tx_buf[i].cmd = tsc2046_adc_get_cmd(priv, ch_idx, false);
 
-	memset(&xfer, 0, sizeof(xfer));
 	xfer.tx_buf = tx_buf;
 	xfer.rx_buf = rx_buf;
 	xfer.len = sizeof(*tx_buf) * max_count;

-- 
2.43.0

