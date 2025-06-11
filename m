Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EFA24E4C3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681760; cv=none; b=F2peuDIhOwlz5ealmLYasz8dcPuUU3AUMS/ftZ/fQTn2fWy0djVzYn8Kw85dNugqjItaBwvCOjr+2n0cDCYZYDpPcS7mtJCWcEOYz9CM2umaLFHSovnKYkgxDdtti8QXjZZrKzVGQn+5xo4rsxCsQuxVjofRAujYVgM+9JBRubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681760; c=relaxed/simple;
	bh=H2qSnwk5w335N1zWnLuUuRDW3evPi/7hcB/vx7gI2r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShlxJZVnUzNz3uN7T7lJOTn4+a/2YHfm9aW5Sc5PF0kFX3aGXlWS/1z2ZdBoi818/YNgJJszwc70gs+3+4Fn7WRH5N8toSQqVgRVHas7M73jwOSdjOuaRco/z/rl8B25sWcr91Vv1V1p1THKQk5oVNfs+qepV5X7QlcpMdJedEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1c5DQq1t; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1c5DQq1t"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-407a5b577f8so90967b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681757; x=1750286557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=;
        b=1c5DQq1t86v9RC79DVSTuOi0nGRnYU5lFDOjmPwj8/pkxwLp7v2l0duAIupxLYF0Lv
         Jms92khW/DzuGb51Jl8f1kjF801tyNq/G2g71wwG7E2eTNBTM9NIO83FfQ1z6+M2BLG1
         4f80YhqIhAhy3s3wdyYzZl0HKB2jEzMvRvJMnu2haPOsKgo2NGr6hb+MkuTFB39NG/uh
         8/B7/YsgKTepTZzv9m7kK4plTYqYkNSJFDJ6cyZrXrUkWGpoStoO7rGxaUbxRzNhKA7B
         pJJ7+Wn3l+RpFhR4Rb+ANDYmTsZ7KZ25Kaq3R9zW4blK1pYnkcsfQY+GCUejpbavHqr1
         LTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681757; x=1750286557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO1R3xWDaYXIM2zvzfZtCHLOSbM0nDuxCxYsdjOhuqU=;
        b=H4CUDHv7lZwv1orWLpUGqMICywfm6cZHHkw6WxxqHHZQZIjZlkP5ljVQHXHlfggFsM
         qDJFZcXqHkGPhzIRgJEBAXI2K28M+XRpL6orZRr4hdanJxEhIjQon0Ge6N6wiJr+e8DV
         krCfvA53zPNFOf1/V5XvOB6KkyNH/8cCQsLxcVLOoupG8nQ7RZ8Zll/tM9gVuwCx3awp
         Dv0uz9HlzcpZwCdFymU4uiAvO26xoRieEVTPeNK4PeM/K8/2MLfHL8xZQ5Xx6ruThwiZ
         YhBvQSW3w5j9+MZAZUZQcFa4toZP38rFxQVlRBwUJMkVHMqsqh+vuYTtJnvu/3lPouoU
         Lajg==
X-Forwarded-Encrypted: i=1; AJvYcCVxxG3md6BI1izVx86Fd0TBsjc/OALE82mBSvDixOMhqZQ8NUnM11hb700U/2Yrmu+sqJ5swFqranKoIIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlqa2oru/NTkfRpVvZKqckPrLEPM5YYF/KCah+HeXVh/MQ78MB
	570p6fQgf9E5ZiBBcPg9fVlPmzN1qJcKTzbe+DTSC+cN8YnB+ZX7lIcxOc8S46ZrpfU=
X-Gm-Gg: ASbGncs4lqdQ4c86Gq0m6kknTxmXVX1Kbk5KgmmmtEq7X9JQEQ685xTAoZ99Sl+JY8j
	oPNC3fbhBGk3HGANK+IGJo7Oak0ClzQAteOrUEaIUQ18BStgt6UzdsC33zDddD1malc3sVffna6
	UeEjYGsuQyc85ToYNNIwKZ9jMgzRV30AZmnshXwoes7LC66legVACgpDRhqdJ9bHsdWAZK+etlY
	Dmu76DENCDIftB+Ek9lIuJPfeXzQe6yV4bSBneiNFv1S78U6Oj4UYSy8WGcyahSQ1ilKkZQVdFW
	4+00SkDoXzcZeioUNRDhpFlJu+X0oRKhrY64XdxxnqEswAArbLFvDY2Hb8yQuqOOXpvP
X-Google-Smtp-Source: AGHT+IFExQxTK2nqz9eZvqFA01OLk3tdW0HRirCOET6sNhsVUFcwPfvM5Peex5ov7to5WvXVcBavAw==
X-Received: by 2002:a05:6808:218f:b0:409:f8e:7273 with SMTP id 5614622812f47-40a660deb1fmr937185b6e.4.1749681757305;
        Wed, 11 Jun 2025 15:42:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:02 -0500
Subject: [PATCH 10/28] iio: adc: ti-lmp92064: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-10-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=H2qSnwk5w335N1zWnLuUuRDW3evPi/7hcB/vx7gI2r0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXGMQtBWy5ZBcGQvb7srptCW55i3K59YMUWH
 K/p9lukFTSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFxgAKCRDCzCAB/wGP
 wMdrB/4wnul03c3MOAO6mWCe18RIhEvueAt8702Bg9iNqcJOIXzAq60UtlsL8lL9KfJBeyTWIE8
 Kn1YcuPT6kG/NM23xq9DfwqkwmJRaqql/t9NtrWj3fcDZ9hisOphYqKQTG/igEAW5g6Nfcz+8bW
 0MGHwVhT0gE2vhbfXW9+hFrHBHtmM7Ha9P5rGLa3H6cx2R2thSNCpjzS3ShjNnVhoTjLv0YbNk7
 cVrheUS1e/VAQdCaGjeafb/wfh7v0zxFJ8ugIGJ3AvK2hD9WEUPNck1toBMCR/UjT3Eb3fKsEzp
 LKfypHeHbcCyjL/xNms+MxWA4JU4Wp6gW8jxoF72I9jj7qfq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-lmp92064.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-lmp92064.c b/drivers/iio/adc/ti-lmp92064.c
index 3f375c1f586c4153caf9b47c34a0dcf6d5c48266..7e57006a8a1268cdda3a31d7c0366f72e1b11ea7 100644
--- a/drivers/iio/adc/ti-lmp92064.c
+++ b/drivers/iio/adc/ti-lmp92064.c
@@ -200,11 +200,9 @@ static irqreturn_t lmp92064_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[2];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int ret;
 
-	memset(&data, 0, sizeof(data));
-
 	ret = lmp92064_read_meas(priv, data.values);
 	if (ret)
 		goto err;

-- 
2.43.0

