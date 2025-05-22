Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4908828CF64
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920612; cv=none; b=skN+gBKeWzkwOlQLtk40QeOB/FsGo7RoYT95DuowmUom+s5yz3M7cmTsMXVjj3DxEMkMk97u78U2RMUUyRr9z5jJHxtf5TMTzMOIy/LZPZz9VhI6/ijKYdnEWsN8nwG127BKDy/s7wHtCJBZj80HoVFHNEGtKrxTn+gaZTvVAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920612; c=relaxed/simple;
	bh=0nIe8gZGvoRF2DsBrKBsu2KJOvKQjVrW3XZFMPilYfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmGzq03kDvs9dayj1+DcetzYXuH9Ql+16zRckWpIUM8Vwztk7mrs3fpp+8Ipxpw7PNxZErjTvdHdpEy+p4U/+0Yh/9OEy3y8RVJOO3NjdZ0U+gsmaqlZeGczgFMW52RuLKzUPYoeuCHPt40gt1NAETZzKCzgeN1p2QN0imv+Q3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ORxk+uFG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ORxk+uFG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so88677735e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747920608; x=1748525408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zedGelCVtGkH8UnHqcPHmZh/ZtT25oJw7cbep5q21KQ=;
        b=ORxk+uFGYPatKcAeZKGipant+8cOixogU8t4Eh1N2h8PnmZRd3//zNv0gztgGqD8V+
         LLjCcmGrwTAAMYHK+tqwB3rOd9REicMPeIWDXyNqap00ICB7JRisjioSVHtvASYxaKUt
         taWgSRu6r3JzO4LVQbHdakbaQwzfIJGagqjQmQVzmIZ1oIYV8637d/xoKBvt0m2Hel7E
         YfeL+cWFu3gY//nMpXL9zb6p07XlPLhJHyhzWUNmdbGyZ+3TNFI7LcfYWqqjVJnAyHoP
         UJkm9iFVd/xAnKt5B9NLQKRcJG78+XKuzh7rAjipxTGHra5tUec3LlXp93e7ADTfuFM+
         BkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920608; x=1748525408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zedGelCVtGkH8UnHqcPHmZh/ZtT25oJw7cbep5q21KQ=;
        b=UY47grT7HoRXHd3IbtaSEZXkjU3TfvBKzV+1qpwR+kGH3gf0ZA/Fhw5zMn69/sy5BS
         EGKrPPjrB3Zn0TmLbgEhSYO1ZgS+lWHv8Az471NhXkYDZTblucz4O3LX0r2/pgvWe0od
         izJz+NHmrbiyzTGiSFWtA1CAgPECMLM2Xy75HWPTccPM6R6iaBQtmmdImIETsqOrlC7v
         2ln28BGKc8TstM2NRtKsY/zSCGY4eVt+iGRQjAb9Tr3qAzbQUcPIZ1df0qafnu6SweI9
         oM9O0iTaFRT4igpe49iBA/Kscq65TODX/eUonZ7eNIkGCSF8/FSn0eDOdB+1XbpUDk7P
         tRVw==
X-Forwarded-Encrypted: i=1; AJvYcCU3zqT5BXcw7FOXAZs3A3iD64r/DZa18OxW6Oj0VUIwVGuQWDRXA8UxZV3G9yn/UwESL+l/R5XfdfFL194=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMALMWwTMrRm1qZZscbXdJ9aD91VaobRwmfBsRlqeWT99oFtfp
	mOGatBVGN2UuD71mATFZEIvlp4nXrvUYcMGXRSi+dZLkMgadImeksaDFrH9/ezBI3Q4=
X-Gm-Gg: ASbGncuP8LexLimsxyx3yUB4pYTLwBMu6ru86UKVzwh9MNCb/Gp3k/lcBw6/sOt7Ky/
	vwNq7zCd8uce6iz/k2vEw12Ti4NEXGHIMYPWrY6ku0qWu9gsHI2w9pp+NFvQ87wNZFUauYNWAut
	E6CGEQt7YIuJTVb+32gWnJ8vTDsTJLBHm5M4cz9LYQAh7/O2kkR2ys/VlyUtsT/nij9BawC/jE4
	d6RecRDwAD9/MPiEksIZJZL9m/ZdssDlOoNkwJPP5JoQk25yZ8olDFJEUx5eJn8VsDfDUFo8w5r
	6+5uOssK7eSWcz39UeWDaHb8I4F5GLI6/RyPgjI5PZrpuucvYzwAASh7CjUb2YqPY3vFqKytV+8
	C2jscbAkYK3rv6xN0HhreTtutrccyWrY=
X-Google-Smtp-Source: AGHT+IH+K32qNT/ePQRSF2E0pqSrNhSULvgvzcbuq0HC765uEjE9Op/hJ16W1+SFbnnKw5xt5IFglA==
X-Received: by 2002:a05:600c:1d8c:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-445917d2a0amr152237185e9.24.1747920608592;
        Thu, 22 May 2025 06:30:08 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm109837585e9.14.2025.05.22.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:30:08 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 22 May 2025 15:27:06 +0200
Subject: [PATCH v6 5/6] iio: adc: ad7606: exit for invalid fdt dt_schema
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-wip-bl-ad7606-calibration-v6-5-487b90433da0@baylibre.com>
References: <20250522-wip-bl-ad7606-calibration-v6-0-487b90433da0@baylibre.com>
In-Reply-To: <20250522-wip-bl-ad7606-calibration-v6-0-487b90433da0@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=NW1JeMg0S+0gI2cAzi0BWwFNupEZsJYBOb/eiNBCbAk=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsjQV0t7/bf47Y2NQe19O/43/DA9Xn9xbYH61HczMyNOq
 3X+5Fl3qqOUhUGMi0FWTJGlLjHCJPR2qJTyAsbZMHNYmUCGMHBxCsBEQlYwMhxcZv5+0mq+PfGV
 GWorjCueGKy0u7fxtbSNQIr5uZutYr8Y/kptFJTeJZJr/b18a6mJSM7JV47N5evmvv29+cpWNxV
 zHhYA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix ad7606_get_chan_config() fdt parsing function to exit for error in
case of invalid dt_schema values.

Idea is to not allowing to proceed over when there are values that are
not allowed from the dt_schema.

Fixes: f3838e934dff ("iio: adc: ad7606: add support for AD7606C-{16,18} parts")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index bb0c89fc618874f4a5948d8e537716f87127bc92..f832fd0daf50a69a892636018bda2e43f73d1570 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -319,15 +319,13 @@ static int ad7606_get_chan_config(struct iio_dev *indio_dev, int ch,
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
-			continue;
+			return ret;
 
 		/* channel number (here) is from 1 to num_channels */
-		if (reg < 1 || reg > num_channels) {
-			dev_warn(dev,
-				 "Invalid channel number (ignoring): %d\n", reg);
-			continue;
-		}
+		if (reg < 1 || reg > num_channels)
+			return -EINVAL;
 
+		/* Loop until we are in the right channel. */
 		if (reg != (ch + 1))
 			continue;
 

-- 
2.49.0

