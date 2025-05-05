Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727727603D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472958; cv=none; b=YhzzPcLKRuD139hzxtgZ5rqSoyAnjtwObXBfyw+ZL/XQWHu1Qu94GYZVZhpBry7S9AWSy7Ay0538xfIxjmCb/Y1YOzgdKm9Ubczz4DNoiT6GPNbHfVOF2SOw+gsn0Qia7+tfjBdwF89gRXNr+VEov2cjZ8Ou2GuuScHhAmM5WQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472958; c=relaxed/simple;
	bh=beSl6Lb6HBMMUyISUZGe2OSeSgce2QqlsExDTDT+/zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BO+rEJymiem3PkUGuM0BKMV57kC06gqgvrOqHR4bCOQc8DkS+Ta7WgPm5qUnb/hpSgi/q13T4K6xAenttGUguPvff7ImJmoOEyXfFU1WIQGiwWoA0v9R25rqdIJ92fX/+nvPDFsJ+dcTT6OkIUUR0+FfZmUcgahxV0dOIFpSpX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PohMGvrG; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PohMGvrG"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c14235af3so3055224a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472954; x=1747077754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1v/EBjnj9ijFfVtYS8b0uGz6pZOisv69OcNrPJAxR4=;
        b=PohMGvrGYKsmah9ba9TDQfV3KqQad856s8DvRKkNar55DGPefj7ycX48mymAa/woq/
         seOVKFVcX6hU94wLxlv2Bxq7gge5K+9IO2gtatlMuVvd8xiJ5q0TWuwd63HmF6Wmcazl
         TbssbAch5nYqyUlrIG1rP2eI8rff5FesjQDbggCWPELZDP4HzjTm6yn4lLxlASHF4I82
         HU2oomnfFQB13x+SIplkU2frTmTR8x3fWXt3LDYzKdE0/XD3XcHuaxrxY7FhV8P8DGEb
         CaVdPRuC4Z7gqh/n65SABZCdJQ5UupKPyJkobMnXteIeYyidK5cqUcUZR6Rj7kXzjW1i
         OwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472954; x=1747077754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1v/EBjnj9ijFfVtYS8b0uGz6pZOisv69OcNrPJAxR4=;
        b=T18PPzF5bqIIg/HdHOCk0pxORLAKPB8XR4GnwA40VGP4b59uHTlHTpUvjYkkCCLwh6
         r097HWmDwTXVMx3OZLSeT0qNvFVYiac+YjYcwSAzPAY7m5WM/Cvft1awxgpZ1zaRARcW
         EB8aDU1hgEhg1oJggCW/WwrN7KhTzSJ80svmV/MigSHUtpO3T0sXaSrfLSq1Jv/dgQ7/
         VR/e4fLujcgdBNiUZeDbXBiAQ66l3ouJJz9K9OCC2T+WN/KRWvjHl1t2g04YEFgeGRzO
         u+84zsCnZOeyYZs6FAwkZxnHxFVsXbA8TnlP5Yn2g+Jg1ZPzOIx/TJCkwQyZJZZdY/Ux
         3Vyg==
X-Forwarded-Encrypted: i=1; AJvYcCUy7jkSUM7sVjhWPcsVTjul+wkVrKGEoQI8HziPusAi+cBwlXCcvUS4Yl794QVTa2CDjOuNTScTfxmYz7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUG4xlVZvqQlUDHO9KMXLDTyo1IPZ2JgHMAMpEQXwZzY2ri2GB
	I1Z7s1hZgi2CVpU0bv4EoGEeAVU0bZ4ub4PF6ISgrnihrYdZcD24OBieVk254rU=
X-Gm-Gg: ASbGncvfPtl8rTP8k2Ei+AGg8zZNU1Goq835u3e1W6uLUvLOMfFH8YaQMca4WkOuQx6
	2vMmEa31YHwzMITExGfZYQuAFF12iZC92hKnZSiX7vDyPTF2gUB8mlJgjOu8Gc9oJ2b5yGuYLfr
	IRUk7HuIp42Hlf3mOembrK1VwNaxEZZtMW3GGxLpoKTp4+KXU/naUASeG0FtVdZTUdpG/yrL2nN
	QPv+JZ+X0MXecoVUNwjLli2MEwXe3H8fDBZR6GmGRRMyoR+ESrpbuqfnNRiAwEVosiFXG6EIDpy
	MIBiWXrY2JUT8SH8qk8CMuKc4VJuH9ZtyiZxjMOrSuAptQ==
X-Google-Smtp-Source: AGHT+IF8BtXpAP3w3vi9UxwhBLK/EiwG9hZtBJdYuVcyjrCXI/OE4QI5cd5gqCa4uWVXZrslTsf25Q==
X-Received: by 2002:a05:6830:6313:b0:72b:a009:db44 with SMTP id 46e09a7af769-7320620b70emr397582a34.1.1746472954683;
        Mon, 05 May 2025 12:22:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:38 -0500
Subject: [PATCH 11/14] iio: magnetometer: rm3100-spi: remove bits_per_word
 = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-11-341f85fcfe11@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=beSl6Lb6HBMMUyISUZGe2OSeSgce2QqlsExDTDT+/zc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ/TLHKxnFnTXhNK/eFLB1wz9ye9NBwQAomyQ
 gH+wPmkAvaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkP0wAKCRDCzCAB/wGP
 wNDqB/92ucQCqYBTLJiF0WcBF47q9agkoyjlYFEwkKSjZiMrIrGuwyHpI3/MwQsQi0nBw+1+c/w
 TuF2wfM2p3oO0bx7rHx4Bd1PgCZ5bWx52Ohy2ox4CGUHzK5KubiiCS9UXFbppeViGQ/+kuhnoYn
 90gY6jdVLl10UyCF0rgZ7KW0ujyfBOMzcO8eeobJOX/IMywPODI0EV1L0d0AP+X1DL+c3TMv9Js
 c9ozKR/3JCP1FWEpnVBYqrUDmvA+YaEnIJAwpshbrVKnEU5IMuRCu3perf/hF9qPAFmanvVuH6P
 lCC3m3CgQLaA05tx9Y93oySixbtKr0soaKaLU5lbqAB9gTy5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the rm3100 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/magnetometer/rm3100-spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/magnetometer/rm3100-spi.c b/drivers/iio/magnetometer/rm3100-spi.c
index dd6d48043740c12a45f1d10aa26c732128c7db27..2f60a41c07f7dfdc5e4a083f51b244f677547af8 100644
--- a/drivers/iio/magnetometer/rm3100-spi.c
+++ b/drivers/iio/magnetometer/rm3100-spi.c
@@ -32,7 +32,6 @@ static int rm3100_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_0;
 	/* Data rates cannot exceed 1Mbits. */
 	spi->max_speed_hz = 1000000;
-	spi->bits_per_word = 8;
 	ret = spi_setup(spi);
 	if (ret)
 		return ret;

-- 
2.43.0

