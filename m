Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5A2C1E06
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359731; cv=none; b=hyCI68dJQ5gPVtyWJEMi5B+khSupZ+58eenOSn91JXkU4PdkmMhSr/Okt65N7SN0jSq5skaj3wszYwCnartZtlU7M5E8kMeu03GyeozZaqUUgng2sHHOdTK8k0hgMZ782kOtDn5UuKxY8ZgoUrxcHmGBpzPfrfqXc7dgnsKRCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359731; c=relaxed/simple;
	bh=KW72H2rhOsjzvWAD/gfaompbIwAhtAiVxmdxvtY6glI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2kAyxwDIb1x09lQhFwORkIWPVUyqLT9qpsnZLcs+I3XvPavCM0K0+o3fs7ACQCSNrgUZdpNMK+rl2qfuIooKvzQ97eojEMyXKqEbYVSTi6ctme1UTpTBwUXeO95Gd/sn9QEhYPFg6iyrmF9f6NA+JkmQWwLJ6VtgaKozq5TQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AjFjSY4P; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AjFjSY4P"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c13802133so1540946a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359729; x=1745964529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV/JKg4cCCUHZO4DcegT8p+GY8kK4vHWejOXinE1p04=;
        b=AjFjSY4PGLnBV7NZOg+7xZYOcx6JpcZBie9jymRQ0BcnKD3imFNG+hiJQUvNgZ5PYA
         OkLSjJN7Sm4SnLt2YhRkOwPdsdFyQxaoY8F0NsvXVkyi8ZSc4SGuwuNV6qhMZsNGLrV3
         cFELAM7+dLfSosdCkDfP7GB92yqjg2rMDkFWYQPGC3s4h2Iyv2vVWmVWVYi+8W+QQMA/
         VPYU069bf/hiJtnUlfZCvbl8cuyOmHYFZCf+l6cede8xGQTP4ipdFUc2X3Hh2hpLr2F+
         HZiGdh1rOd5PPM681siZd24MjgIYGGkUmZmNz2HbomLzM1cL6egd8jBpXV3kehcOz6Tf
         DgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359729; x=1745964529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV/JKg4cCCUHZO4DcegT8p+GY8kK4vHWejOXinE1p04=;
        b=hwxDoWLKll6/CJ8eVZykxvyZQkYC3EUUqyzcHZFuVYJZIiS8eV5ZkcLPW5zs9gToug
         f6KKu2OPGCGcOLSrqfqWl28EfZ9gn5G2s6N3umFvitDIZ5lbB1LHtoZD/PopI/uOC3w8
         g9wTG+SddqBfnVvpObYUCI7VYOsCfoygKnb5p0GVqfopDb2hj4VzuGRxQIM23445HGk/
         sGjpImg59vyVfgq55iTeDd6uOrsUsrdrllta138zRRBRWQXg/BdbuA1mxWwfyUvk99nz
         bgALKmslVsasO+MoQWDM26l9ybO3gkkMirOosPgUSXM1eoK8/fgbQjsnaG+qt5/ZMQTy
         oacA==
X-Forwarded-Encrypted: i=1; AJvYcCU8nysg8chmZ1RkCOiySXZhPBp8uyR0/hTklXrV7mODcjeQaOMY0PGSxnYMbtRN3CoL5PAwsP3D9ujPtHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwntGi9//SFLK0ViQTEp5EODt6Ox7xb1unJ+0RuPEizUzODxJQ7
	qRvdLqQcE1y9ymjmFKLzyJcQ1UWUtNU7m/rHHGeGq+QMLu+p09yZk8bBk6toLBo=
X-Gm-Gg: ASbGncugRqEdA4Zpvph1CoUGsLFF0/layJLur6bnDMZ/Pss1suSVlDhXwau9BPVrNQ4
	kJRXp0rudUtKyDfbXsds2f3kkazzP0mCZ2PfW38KLfEJr9dd2Q8M2ID5Y2IhsyiVSwuBuvmNpNW
	GSioAKPAXyQegXVc7fXjsa3zc2NNr10bAHs+lTURgiYu8zibFlNc36Yz7XN/TJ5eKy/napaJyZU
	1ZhWmZV3p2C0Sk+ARAfchkKiEB8zBiV55v4z4FjLTA+rDKZ90Lyeu2W5jshF9xozVn6duYZT6yb
	uzQHMnZwJSWjo2jO5xTIL817sfBAJuWrEujM+Xb/6J/3oco=
X-Google-Smtp-Source: AGHT+IE7FZA50BnSF8oJmn4vSYvHiYeflUDA8NfUYzI4hEr4A9R06F1OXjWW8PDV78GuxROjjrL/nQ==
X-Received: by 2002:a05:6830:6606:b0:72b:9de0:891 with SMTP id 46e09a7af769-73006222b11mr11700069a34.13.1745359728753;
        Tue, 22 Apr 2025 15:08:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:49 -0500
Subject: [PATCH v2 4/6] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-4-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=KW72H2rhOsjzvWAD/gfaompbIwAhtAiVxmdxvtY6glI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBNUYLKuoL2l8v5qYxFzyitlCg/RLQk56/h0w
 bWbsz80RzqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTVAAKCRDCzCAB/wGP
 wOFTB/9YeOb2rt8UjFsVZfIlZEmMagVgNxYObu4fQAmL0GyrRub+pif2Ln/S81nDJAOw8uvfdYl
 JH4+CkLnoCMaiuj5bsrR2T3kVhyAuD0L2zqmYyZLMvrHBnkBUzn6c6+6MxfiqzDxMegf312U0UC
 I0QHm7GNU7Q1HqSxBojySMCGlzL9vQi1FtuZ3nw3q86r3fP05Tw9Ycgj6mG8tJKirKk5O5on141
 YD5UgkTJuyRaXIY7lVs7VtewokCoo4aJv97l6WeDdyDiwU3iinkFo1hl26Ozjx2Z55qh85CZxAZ
 Z24lYaIyx1Gy8mL2VGG0INwPKSuHd25sZraxcL2r30GDs1X4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.
---
 drivers/iio/adc/ad7380.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..f89b195c644024151c14977fd43e279a67439fb1 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,8 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32))
+		__aligned(IIO_DMA_MINALIGN);
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0

