Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585924C68D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681748; cv=none; b=GFc+fXfkPBaDbpUYhtPv8zjOeMbQbU0TmqbQ2J0Mj3jDyUNqFTzzhjzCMh/+QnBUglUrCh/tJK/KLyFSkI3kzxWORGmig28BtsLX4BzRXbw3CvU3kXQoISNLk5gqWwNuFTxrwefn7SPXBcqXdo6/fIFSwtU0HmckHWHTk2ki1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681748; c=relaxed/simple;
	bh=5Dt8chRh9Q9zFfR+o0HlVC5RLtjfsBgIEofeyEgWWKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jl7E8YFdt3NF/phT2vEI95gly08Mu7oLafmlEdLkV56mSFpTzOQvvq/Q3t/ciG0MGaQt2WDaBA31KwxCFwfzlxWIWHlUQvX5bGlDEMacmDWhX6gW2HyDZr4hn1EhzlQIP2499/Udg3aAWRFW3G2/4nBgWB4lu9ldGpWoeEA89bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IrYxYQjx; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IrYxYQjx"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-407aac76036so195383b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681746; x=1750286546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=;
        b=IrYxYQjxKQ6N0cYXHDtkeiAcTUyPc2Hdr9r3KCHh1OOZMSYP+auroWnLS1jgogO95t
         liiuE8nbLoMFyITGBXy5tPNNYyGvduCyhI334I/bjsysLvxsRblMbSm8R/sHBbGAoN+W
         bo40h4iSxACTVLIjEIObrspCLkgk2yYEMPM9iY0piN07kTaVBIJhu/wPeWbcoRnYIjr8
         K/Ug6SIorGB/ei01hv8kc4E2YA5CS5KXiuMbq1qhrGBBsVv8rZiRdJJuu7rP5kZz3WF1
         LSjiE73xfkiCycJvNry+Th3tjYAvd4OIrbLysWXqzorWa/UzbXxEs7Tf/tKJwHjYzrir
         skrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681746; x=1750286546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=;
        b=VCj+lunyFW+hTLNs7qS2oC+DD9PfgosIiobXR43WRiJ+mi6B7c69hkXT1c/aicem5E
         nAP8RfCibRziWAFjbCYW6tPsAbSsRkqn8D0xxrz3G4R28Q/5VPXuCJvesrs+aRivRb9U
         AoJlcFIAZtAco6M77wE5EZm+onuJ1DohMCIwqPgTBrMzOIY6ya+8vbzbeQ0V8BjbUYSj
         3uQzyEQKMVb/SIkXm9x9aOA9Xe/kjy8fniSwVXH01lFDvN8crUlBoEAbnW1Qvkow/LUR
         0eChuwASMDtxaQMzECERkXCar5ZSoZMwfgkjazhqKPnI5zEzZYrnF+56maW69OcTC4WI
         FsOg==
X-Forwarded-Encrypted: i=1; AJvYcCVjZnVcpybRuZMaINBeHnU5TtauTDrUUGZFE1J2mqSg3JmnkBQhhSfvzwQkmT6Qp6q6gr0jDaan9wq5SrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRK3pYXhXvgK7Jcw+TgVpKzqxb3Au7OSxkod4Cs9uI/hvORc6k
	3W6zgJ0YZwGAyd9Fazjw9lfxIlogou7sw/4QtZjq0fW+d5u5GYn1+9iTlAmp2puNMF1c1nSRCOj
	RUDO3
X-Gm-Gg: ASbGncsq1oQ+RSZHnAk2TrCN0w+h/I+ITOCI1SXH/k32fox4valwKkXaeQ51lBQo6Fz
	iDMFBREo3G+yHJRqVHQ5OKLdxmsGL/Q2cVNv72/rT28/pxvFbKa7r3Xb9joLUj3Mel2kQj6V9MD
	QSjfjwXWxpJVxsKTaSZ4HDnK+MfR1NL1U2V56y6QrLMnJSedVH6eReYXz/wDmqMLADtbkEyG04N
	4yKfOxSm8Lo7wXaj2836Tmrf6jQcp6J9kfgfTfDk0WwpROcTdwU1KutNpPVQlWI22OLQKLSpERx
	Ym0Nh0vxRq4DbOobrIcDw67NmAsgUlDwUE17yvMYR7kgc4GKjrImhA75ge3TxnvZMudc
X-Google-Smtp-Source: AGHT+IG0W8cN0RBqzvza6bDhDRqg08z0+EUeK0uOjK7EVtYqqJLeVsRO4zcpkxGJblg1Kp+3B4rIBQ==
X-Received: by 2002:a05:6808:2186:b0:403:3c95:3684 with SMTP id 5614622812f47-40a66a419c9mr505006b6e.1.1749681746196;
        Wed, 11 Jun 2025 15:42:26 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:25 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:57 -0500
Subject: [PATCH 05/28] iio: adc: rockchip_saradc: use = { } instead of
 memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-5-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5Dt8chRh9Q9zFfR+o0HlVC5RLtjfsBgIEofeyEgWWKs=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWkPxj+ITtdzYFOhYRqZrV7rzI2N1a8bxnjv
 BHEMh8oTqiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFpAAKCRDCzCAB/wGP
 wPI1B/9lozodgbkP5rQVG6ALBHKR3d7hz5SMy/uywa3QBiiLmgj5QX1cAyGMFHI7hO3uO3aQSl/
 mDQT4eItTwkjzu/N/k2p6HIl0UyXa2lwFwPguAh6Fco94W+bqLyMiXXgd04TmGW4jedL9LbPCgY
 07pa9FRxuw8J6Kg4xZzUitsXeewyNtdFUuzGLvmvEY9oqh7A/1iuMLVZyNULwWAqpBbAvI4BDWY
 mrWqXne1TqcmnTZJBaLxnti67Z2+Kmlj8oL+TyU8uXKtKa9kYw2cN9r+8cjaEZt5I4qaauKXSq4
 I+XFZqyqUd67pwca8QgxuwJVoQn6LMRTdn54nn8A0dcTI+q1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/rockchip_saradc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 325e3747a1345c84cddcfe9a455da6ccf655447b..bd62daea0a3e5b879a8a970d107e3342fda7b8c0 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -404,12 +404,10 @@ static irqreturn_t rockchip_saradc_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[SARADC_MAX_CHANNELS];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int ret;
 	int i, j = 0;
 
-	memset(&data, 0, sizeof(data));
-
 	mutex_lock(&info->lock);
 
 	iio_for_each_active_channel(i_dev, i) {

-- 
2.43.0

