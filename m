Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6342274641
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472952; cv=none; b=d63567jOCMqI34L3Kbm3/Cmy19Xw5fWJN5PTHyZd7qDWL9O/+zjpwEqQL/EvKCSvbZZ+5Yzl6+A3b2gy9XMHqis7ANIqqcWeJoOkeD45vTvMmNC0PS0VHejyrCapzvu6j0dcoOVmGD80rSQi9+37nmOgX8vRXG8WGdjdCrqKhjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472952; c=relaxed/simple;
	bh=colegKoBnBaj0Zn85eGSFoM2l4X0WF8CRsNkNkFslcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsHVcW1UgJA+5RTxWL/RHYhF1mjEjQVMB9hfqVLASmbcZfWDJQeqQsbcHom4IcipNUWR312794cWBnpe3sWbFc9ByEJnIi1SGNXEImQkk+tT+DSJ+0W3ih4qUDAALmmFU8OC8rGBPcbo5XmgzEvPJE8dUdoiOpZah7StB86b0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=T+dXhYjh; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="T+dXhYjh"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73044329768so3651993a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472949; x=1747077749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=En1QdEBYgn61ldEcWbvi24jHhGncP6DVuSw7Kcm+Als=;
        b=T+dXhYjhImVuTOz/3fNeDR3VarX9Ce6Ha3PsTIl/2KifaAoRDiE0kZtBGscZQFrLwn
         cyIXz20rpJJ79oBSQ6kKmSJDx6f9XiJ34ar46Bd4REz40XCGNg5OXIv5GrLssfC8kU6B
         Z4ssttRaUzbXHkN7Sn7Sg9ylOsjbn2g0qGY6jFkRDhbM7axA0OCAxpSrB8s13MeUBKcf
         rRfMUs98kQG+iv9JewHl6EremuSsOUeovXNFT57c2hlfx2vCSQKgUhsUwG2BTTcOLMUQ
         gwc4TB6WcQ6xZGDU3k+w1rJuMuOnZIgfQIeefXJqUrf8kakXuzyM6EKhEjtv6ycxNsqW
         UKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472949; x=1747077749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En1QdEBYgn61ldEcWbvi24jHhGncP6DVuSw7Kcm+Als=;
        b=YCEajRVmQmNwLG/wgv4uHUMMNtUQ9BtSHkXrDpGm4nZ0ftHqG9lsg+VZ+g4YLU9XOv
         ihBMK+vu9vhsh+kjmsXt3n4n1VqYibL2xWHGG8a9CyF+BQsVV1wDkJioqjxJL9EHKa8O
         izAevRZ3j8aGjQ7OlPCbg9x0E/CPMUwgJxKSg6j13RV/s0p1blYoOu7c6/xglmRW9eGM
         +/7tZbflujjMwqYsB3A9ijdcpaCJ54JjtTwIdOh/SSmTGndPm8c38nlQ+vP0DifFX0M8
         WcrCWGA+WLlQQ4ZEQ95TsNImii/fKo41P80b3DJSPy2FUQu7VKPiIvHdYkDHunHB/3Ai
         agiw==
X-Forwarded-Encrypted: i=1; AJvYcCXaFpeEoxA1NN6bOhh1UwcHcYm3xJkuGHE6lgIYa3ziZp+VoharpX224HI0Hwg5k7TwbQwkztZsDtTtCm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEa2BJc/NW0/98i4qGZzPvnasqCoFvpii+xExuLK0xFrMRapJm
	D1xe9hCMb5sCrD96d7wstWL7uwcITI18LCfvZurEEhiN8HMv6dz2VlzkftM5bM0=
X-Gm-Gg: ASbGncvrsZYOAr8UhU5bMqIdqIbexQwOaSnm1ai6dTT60KxtXj9XFwXCOIWQlIDBK8w
	Z8VYBm3fcOCzytBHggH6VOe6uzGq/jmjf0bKp45COyghITqqFa7a3mRZfq2vpMTO3CSNhmebnjJ
	i3WrBEVs/NOMSlkoMnwDnkH3qilR0Vy2Auo1RW5vo7p6ixvmD9k4u5v+eS5vnHXC1Pap1lZXWFz
	qvk8RUCo4CaaqIp6ezLfaSgbJPUeiAkeFLNvrnslcYE5KAyTagQskjHCOm6vlps2qwPZO59YcL6
	fSR3bologsKrim+qpvAXwJ6BHeD3qctvKMof8x1tJRGW1g==
X-Google-Smtp-Source: AGHT+IF6jMiIprPxkzNU1KQDnoMZcl1u14b1u891qBnUiH4qp4KDUf7/7s0CJI3yAhXNJXcdtlo+cQ==
X-Received: by 2002:a05:6830:638d:b0:72b:9f90:56c5 with SMTP id 46e09a7af769-731eae6c32amr5563243a34.17.1746472949722;
        Mon, 05 May 2025 12:22:29 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:29 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:32 -0500
Subject: [PATCH 05/14] iio: dac: ad5766: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-5-341f85fcfe11@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=colegKoBnBaj0Zn85eGSFoM2l4X0WF8CRsNkNkFslcQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ+or9PpPj3O5PD6IukaX2rB+030UEYup/pYt
 mW3+swmCXqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPqAAKCRDCzCAB/wGP
 wA6hB/9ML2x3ygauzSn+BUNnX+9bDErL9o0AerE0MCsDabs6jRGqS6TVD8Mkk64L6KwgXAlJCd4
 VBymjbj3fXXYBtu5+SzV7evHvREvrKv0ZO+rSNy7jLwIn2yV7zNcmL+h06qrT1ndIqp0ovNmSlu
 kax9HDriwTSb4WGmg4IJavJidCa4gP86iE5htTiMgUF28K3aIac3h9HcVKRQzxkV6948mrxemO+
 kIrRd0XNZpeVF3nJQsSUYQyD+D4dVRgMaFwAxGJwYw1Feryb2J7/Z+lNTzxOm/H8AZqH2KxSx6h
 QItLPQTX1uXXntDcgAtwJcp7WPddxtzTrGFBWNlJDrBeGXpS
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ad5766 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ad5766.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/dac/ad5766.c b/drivers/iio/dac/ad5766.c
index dc766c8fd37073457ad2cceeb9e57ec809d7aef4..f6a0a0d84fefd268b4693ecca1e2cc0e8f241fef 100644
--- a/drivers/iio/dac/ad5766.c
+++ b/drivers/iio/dac/ad5766.c
@@ -148,13 +148,11 @@ static int __ad5766_spi_read(struct ad5766_state *st, u8 dac, int *val)
 	struct spi_transfer xfers[] = {
 		{
 			.tx_buf = &st->data[0].d32,
-			.bits_per_word = 8,
 			.len = 3,
 			.cs_change = 1,
 		}, {
 			.tx_buf = &st->data[1].d32,
 			.rx_buf = &st->data[2].d32,
-			.bits_per_word = 8,
 			.len = 3,
 		},
 	};

-- 
2.43.0

