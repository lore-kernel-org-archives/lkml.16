Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788724E4AF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681743; cv=none; b=iutoGNwpNv/hfCocKrUsSngPEVHfZUKLcMI4YC8LRD6mHs6SeWCBECpz1a/JG65pkYcRCeTAx0/Ye+gqB9g+rn94EhOJcinlCwwecLk7VO6L57fU6phfCd+Kn+Rs7qQ+Hlk7JRPJGxnXw42RbcD3XfZ//BqyzYTjGMSvG6f8IE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681743; c=relaxed/simple;
	bh=GVMTt5HV+6sU3Z7U1BlFtbwhTBkXJGR3/GKRAQsHmF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3jBGfb1TFH+I5u4hmOM1HXpS2Yh1d8LEKP9KXPOg303zTJrdAbMDJOItug9h8Og5cuivIQckAVAWShoIVoOMIxLQI1u2w2z1sM7jljdN+NuXitLmSKllZiSXY2S/GHpTs+MWNKVcUcGMcmDjRmhns6ychX3VciNn8BlEBLsmsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=P1jiZkch; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P1jiZkch"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4079f80ff0fso864570b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681741; x=1750286541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=it4RuztzhdZ8XnjsMEgLrvbjv0hSp4aT2tXycz5bWd4=;
        b=P1jiZkchtnNjwO5qGYuJ1g5+GZnEZp5m/WTs41KQGtvf8G15+AQL33S+UCdGuV6U0T
         G462k1nyrA5+GqZGAfYnIRbZwDKNZ8NaX9fC98JUDAhBbBjfLzoGJPzw2odULC0DOQBY
         tyaWvBj6U3kx0Mv9V2UMf5EpT1UWlhhs/AdUoF+AsOPqI8AF/npOsj6QfE1iynhmrzu7
         yNxqqzbB+9xTrmeVXHmYTg/DmvdFecB4RkauRm5UKFH6lTnQJ7sQzNCzdvznHSzri5xq
         BXgGln1OCubbwXXph6o6SPuIMRh9zESC1tTaYZEdflI1anUML8q+CIVlqexvzuTe9JxT
         EdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681741; x=1750286541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=it4RuztzhdZ8XnjsMEgLrvbjv0hSp4aT2tXycz5bWd4=;
        b=nFDFDr8Kku0rl/PTWsdK1ybgKKuLwLVI/flEEPHzo9Rrd86kRxN1SmxnEi+LC5EEUg
         I60muuAPW1dPBVzzAzMarhcHTKTSKTfa+ERvjHsEpE3Kj639Luhimy+N2otj7E3sDsUG
         vIUXNj+wbHqD3yJOzf6fG7FzXcaeKb91j0uBriklpGAGKU9epyusIoSkDPBE3UlztqPY
         0BCDmjAxFCS+sN4Kv/rh+phfeQWw9McQ4L3a7GUPk0BX0awuxkRz5wc1C7DIa41NM15R
         HmH+M5DeVt37puXlSDV8OvvIXQe4Aa1gzdzweSjRtx3bDxA6/euajnethcuP140IcSQr
         Xx2A==
X-Forwarded-Encrypted: i=1; AJvYcCVV+FXhhdD54ACT7LJZ3MWMXC32cHvc4ZQHdvNws6bQMVN2+2ceORVw/v1vSy/VFZVMWWorTXujyisBGG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBYiNbKFwvnNtzeGrpvDSmPsxnvozHXsaMjpP+05R10XjNeWXf
	lo5ONkYETKEM+3WsLRmMqL/3OPX/lK585V1wII5wxVyOck2YjPtCgkGjJH3CwiXvjpg=
X-Gm-Gg: ASbGncv0x2eyoSlopBZdLp6VhMRoYUEGnVslDt3jbuUrflNQhbhO0dHOhqREik43eEm
	Mcy9CZSfFhVjGCTYO+v0crk+79RrnEcZSqthjQe0li8x0BaqtNCJKoLIeb6DYpUFYPinblF5qT5
	Lhj0ClmiT7E9lvUUKpgYZTZOinXPXNfi+KRptGemQr6LC/yDh17thNh+cCD7IDGpx7DlYlyJL+T
	uau+PMOCyqHI7gti91L9ymOXhSlpDDV3x2tn0fMDDWpI2LwSNFWXq6smudJi3wcAJmLrLp8ndbk
	RIibCFukA9tryq5E63rJg6G/mMCPBm7oWbcqaPV9hbvYVhFfN0xmk1QoBY7E3Ws+YIcz
X-Google-Smtp-Source: AGHT+IGNZz5p3ryOjEvuo2EytJHiwibtf40ayr30CzxMgaTKJOSM2lK2oXZ9zl2uyt/uz+jI4tTCtg==
X-Received: by 2002:a05:6808:4fe9:b0:3f8:18a3:b1cc with SMTP id 5614622812f47-40a6603250bmr879166b6e.12.1749681740764;
        Wed, 11 Jun 2025 15:42:20 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:19 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:55 -0500
Subject: [PATCH 03/28] iio: adc: dln2-adc: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-3-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=GVMTt5HV+6sU3Z7U1BlFtbwhTBkXJGR3/GKRAQsHmF8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWXt88+FiMtb/ry4nJTdUhGkqkIB1L+peIvw
 BF0bdO4H0GJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFlwAKCRDCzCAB/wGP
 wOiFCACM1Flijyrlz3Ef6dBSmJytrbKIx/vklETWdfDCxgwR2zDSTX9DMY/Av6gM1UoiYnRF3oF
 7aNaVMVunV9IUE2l696XaykH/jPIiR1wt6QjtWaDFVJgm8mdU7qE25z4A8m0SjqHGOePx0/mn4a
 VQidG4ET9kCPSiYMAX7fH+jc6NgevlNMrrYmCgPdpO4/Or9RGrSLyhebufoZoeKn/L+CoasNkBz
 Ss7ip82sa/hjy5YFdj15avGsrWFIqCVjLbKr5nP/k4kJFOUeDKQsJ37NFU85Z6iBC06G751GT3n
 MOCLdFgqv1rPFyxcOt4HLY50/hztFVr8zuzyZfjp6XcROfG5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index 9dbd2c87938c23d91fc93269763263fe73ed5206..5aea7644780f8b32ca6ed80b79afd07220d46a5c 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -467,7 +467,7 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *p)
 	struct {
 		__le16 values[DLN2_ADC_MAX_CHANNELS];
 		aligned_s64 timestamp_space;
-	} data;
+	} data = { };
 	struct dln2_adc_get_all_vals dev_data;
 	struct dln2_adc *dln2 = iio_priv(indio_dev);
 	const struct dln2_adc_demux_table *t;
@@ -479,8 +479,6 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *p)
 	if (ret < 0)
 		goto done;
 
-	memset(&data, 0, sizeof(data));
-
 	/* Demux operation */
 	for (i = 0; i < dln2->demux_count; ++i) {
 		t = &dln2->demux[i];

-- 
2.43.0

