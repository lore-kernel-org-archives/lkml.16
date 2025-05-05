Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2927605F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472956; cv=none; b=m2c3DQgZaC2+r+PKdhyaOlknJ1dOuumrmghoK2/zTrAHzwz+XP3Y4GYEVqejupGTi19uH8pN9pEz4Baf2Q3GPt9NOtZSxEv8uA/FhduesHchUjzqOhvBh+s7rx5kw891ySo3bWBu0DVCgv0tURhGxFEOBRaVA5P2UV2MoZCTIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472956; c=relaxed/simple;
	bh=dExF+ayNEtVJH0j4yAQnVXLvcbS57V3fP2s289ip5jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqJ3MYg0NGoMNPJ7/vJNNQoIkPUnyD+76dBdl7/08gN+eAQqYX3PVIE5SmPi3+V+M2P04ahpls9/J8yEyT46IvNoMoCcckhgwd1Qs7aXfk/KfeWq3cOBgwMl88zd67j3+qHGut4BSQ7aTw/Ezwmhk+WFPUchi1rrp48Y+ndPwJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W4/uDFiJ; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W4/uDFiJ"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72b82c8230aso1357025a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472954; x=1747077754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tb73dxhhrjuAKHwLRnLQdFPUGNZOt/ge7FPEdJDPFQ=;
        b=W4/uDFiJ9KEQcw760kDie9PIipusdFzZA8FplOJZGmwVxKzF9TsyjvIqYPmB97bjbS
         MmA66aNuOuFfY+3M1ScSQru+hO4KoIa4vmkI3yKZBzhO8F9MCwaN6WA30rfD1E6XeqvL
         H5yK4au1oxu0QrAUHrtetrKeeXUYy4hTLWasp/iYryLf1h/K9Cbm2nB1Ob5zs5cW71di
         xb6/Rnm+HsnYFiYw6hvpsdbgHs1dAdYuZLKsGXFdq05LGuf5T19iSlCA9P74nJ9RExkb
         feYbcWdOtnmSyLEB1t82hh8NdNtcs1H461KgrKuuFpgwtb5Tls0fqff3M0h3xI0VT4bv
         yPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472954; x=1747077754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tb73dxhhrjuAKHwLRnLQdFPUGNZOt/ge7FPEdJDPFQ=;
        b=hThwftLlzwC9uUwPTNg7oUbmIpprxOAENLmKYIIgceSqm84xLfCKtvJcg714/p4ida
         0MyHgXhvhDuJovLwmTtvPsrpdVvuE5/AsgJxx7U+SWLY15GcOxVXxgco9BqmNeJeSX/P
         UjMqXI2rPYNiEdyM8hsgD98fcrNZnXSL6v4Cs5kA/pPg09u0QAWSxoRpHoCQJvJQEwdA
         4rEKnMGihSiXdwYEnZxw3xjfbuG8UhMj83HVvNzz1rDBQdG9PhAv/lfLERMMnXOj+bML
         lBNiipv2DLPSF3y/TtSY09LoYFpMKgcnKFLX5FWvVou05474lUq2xYZEJY/S0Kojplo+
         UMqg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmcVw25ijP1IRjJjrXdbxXcYX0DMYJ8Y0HfT2v7Zirm6TUtO+8oBwrQ8S/Rxh3s0cc24+xXqHjD0fHJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/m4na+W77v+kfSjU/cragShAi54ly/cIneJ+JfbMK1/Z9PUni
	LVlVTYYSdVHEmfCpx7hM+uJdt84KvuKdX/9NlhM45OzDRFligj0mCBheqCpNDKU=
X-Gm-Gg: ASbGnct7dzb2cPqwsSrZJs0qv5wjbHkMQa28mTIyQO+coX2s2xJ2mIT6mtkvAOlVOpP
	UeVGTzWVctDV5eaHzPORqL3kqkXZvf+ngfe5iaZZ6S0MY6BsvfrpFoAZ6/h+50+nmQB/49GbggS
	T6YbrC4I7/KOY6JKMABgaGqLwpS5kN2KORI21nu3W8UVp3o3OT8KinQeVx93O9xjcck3wlEqPwL
	ATe65BXuHUpqd19xUuEoW2/MRuBAwgDWCEikoAIcLBsqbfI7SWmgbrIjBtwIIfGQQ4dnqkt3xmr
	I9C8Z0hyvDvaoV7a1JimKcdC7X1/sQwtUxZ+kSIGKkKIm2YJcMCNMPb0
X-Google-Smtp-Source: AGHT+IGtdUPklg3OZMlF4SLcFIpsPetzfRMpGEQ79YKIhwP8b7IkvXGViODJ2c/wuGOwl/orhw3uRg==
X-Received: by 2002:a9d:4f0e:0:b0:72b:9a2e:7828 with SMTP id 46e09a7af769-73206ea3f04mr75461a34.28.1746472953859;
        Mon, 05 May 2025 12:22:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:37 -0500
Subject: [PATCH 10/14] iio: magnetometer: hmc5843_spi: remove bits_per_word
 = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-10-341f85fcfe11@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dExF+ayNEtVJH0j4yAQnVXLvcbS57V3fP2s289ip5jg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ/LzTzhVlE7HPKpOaXoAEtppmqs+HpC2pqHV
 xVu+iwsYnCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPywAKCRDCzCAB/wGP
 wMsFB/464qkYwEJafJ6lnV9M2qWu8IWhPyGFaUXtUgAqPWGt8qpT3UR+RhLkHZcPxXGSHYRmriR
 cKEIGAbP6wm1D4BSI3uD+maUWRN3ovg8YlzDs0amCaa106wUyuqWd1/yEIsc7fWJjPZc6h4/4Yb
 Td03PWQQzkjF/LfAgABT2u9Uy8tfL3BmWK8GH11VJPp+CFIMDibT29yHNt0P7qLA0DWk6mJIXLy
 EYnvcioqrnTA/c7MKEp22/jb2mtOfh//aGAG/X+HhmhrVyzIwwW0bRNrL/98v166DxYKwtUcY3i
 7Us2wPl7H4rdtGjwcYbCpbMwY5XWs00DoVRj87Aww4IC9kBS
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the hmc5843 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/magnetometer/hmc5843_spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/magnetometer/hmc5843_spi.c b/drivers/iio/magnetometer/hmc5843_spi.c
index b7fde331069d6a3d2f5cd2ecd636318d1e276222..6a55c1559b0d8c0c73b4360a9517707651df49b3 100644
--- a/drivers/iio/magnetometer/hmc5843_spi.c
+++ b/drivers/iio/magnetometer/hmc5843_spi.c
@@ -60,7 +60,6 @@ static int hmc5843_spi_probe(struct spi_device *spi)
 
 	spi->mode = SPI_MODE_3;
 	spi->max_speed_hz = 8000000;
-	spi->bits_per_word = 8;
 	ret = spi_setup(spi);
 	if (ret)
 		return ret;

-- 
2.43.0

