Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E52110
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126977; cv=none; b=f414sSA8j9Qtrh/+I+FbbxKoGAFDoJcWuMOqSumLRY11G/wWxB4anapkYHiB8/XMfAKu83kV9VZ3yxzroYfBHs7iDzEk0Cz8KqkPRk9qJfEpmqR7wj12EAVFhFS52RSJ056vVpkf8jf0vonCzn/mg6cbJ21zkiosuzLyNi4CMkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126977; c=relaxed/simple;
	bh=xd9zgN26iUwiHRfuwwnHBEGh37uP/NmSoUedlNGjeVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qEGaA2tJUZ6V7zdL7mUeXurdLPAjKWDkX3AChx5IDgZNGkon1JTnpxVRcezyRd/lmjVCY+0IyhRnk/ouJfCmJqhOcGIw4eXt8fo6K4x8TkxmxdV8AhwAbGPfRnetE9yM/Pw0Asv0wJu/clwiKN68fJX7gnTI/EREaBYMx4tS1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wXTKo23A; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wXTKo23A"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72c16e658f4so478346a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751126974; x=1751731774; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdMUjRTn+e0cE+oX4aeWZd7ydc61mU0zAwixi2eYD18=;
        b=wXTKo23AAGMZwX+/jDqFw5yxYULQLVcxN81FXDwy0jxXZVEqzNmQIIDP+zvmO9UdOw
         XNBkA4nzx/1j1z2/RWaZpRAOHhB+DdgqN/5kxCR97GEJMsVH7ja3cjO11RTJH6sH8Zea
         FHtC5Oh3T2voQ7/1g9U0xeyIHkuD0r4MwwCpVPOMU8EkkurA3Out/0z8Qbn3O2BD2A2f
         J+I2uu4SKFaBWFu0ZEt+8GgPKeaGAhRa8Y1o9tRkjKQ2BCyM+WTci67C8e8ZXqvqrR33
         SksUIIIiI6Xi1cn4rWILixG5GAdiCum7TGduf77iUQ5wH2IFsmYI0SiG1dgw2TbaFinK
         JbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751126974; x=1751731774;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdMUjRTn+e0cE+oX4aeWZd7ydc61mU0zAwixi2eYD18=;
        b=JJ0eWmjUHU3G/rPTutA7mgfKI3jdjJXrBnFOT6+dXoEDZMt/o8Tr8rIIUQhQPeFL2q
         sPFcj/0NQpkFu1Umo3kvj+tzNFq7+gK5B0DeIcy2jhK4wBQpSiJJXvT62ooNphLS6QPv
         PFHglIVebULMKelM0LhxMdBKpy76PJBxgGEZE9OqbUk+Le6c1wh8wM24+f0JTZCplbU3
         MGW+zSzLuWVrMTS4ZcgxomEkl1U8A0BjYM0qNTtuDC08DxQZin38IiF0X7hZn+hWOFzz
         +Mk4FSjcC6VzHIi3RrROc08cPozHYFbQOeMlVzHTWkKCx7q4YNqZ6+kVW7nX1dmLpzW2
         og5g==
X-Forwarded-Encrypted: i=1; AJvYcCVQZ/cDRrY7Tdxq9JSwSORki8+NBKj9UvgoA+KO/0fZ7x9bhHdI0SEag289RI5hYBVBI3xqVkzlAaYfqXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwYHistBgtjb/mAeK7+tjhhjDdH/hVuHkXYVJD3r0FfCBG5uXX
	qusJpqSg55dI4APM0GTgAWlVWDWTe4jdXmDPjM3iug/ucE0AHAsuH7fGS+eRPXKzWBA=
X-Gm-Gg: ASbGncv1yhj9HG9wPZnar9yMD7+FGmYzk9gGWV3L3yGIckEhgPrSO4UDWKsT7EEqG3p
	4V9V51p42kjAFn1qDZErKixuv7opP9oN5iq5gc8Eg8/ZY5VyYUNZ9sQiIKcUxu6s9V98HOpK9D5
	yTujP+3jdtvSghv1Mj4qV2gsD/g5phRn5EtOtpdQ/kBei6s6x9WNh2/lgaykfDjiQnrTmxKQdBi
	9UdrSGHYnWe+nczb2dwhNU/u0xQxZGfTP28RLaokCyZNwzy5qlr+YF8AnRcAODpax7S7BqUi0T0
	369Xa4ToaiKvkhJdmVBd8FtJiSERw/8V6ZlnMvOpqcb+SuxKA6Hoom5fSgQHBRrgMpwv
X-Google-Smtp-Source: AGHT+IE4hkmnbrzjcRiMlYEt2HfpUltmZZWcvFW150YhWFQd9BeNbD81KmjzKrCXWyXVHUU8BsSCXw==
X-Received: by 2002:a05:6808:2107:b0:401:e5fc:e726 with SMTP id 5614622812f47-40b33e4c3f2mr5949897b6e.31.1751126974462;
        Sat, 28 Jun 2025 09:09:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b487940bbsm452991b6e.3.2025.06.28.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:09:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:09:25 -0500
Subject: [PATCH] iio: adc: ad7091r8: make ad7091r_init_info const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-4-v1-1-4e0f93c9cf83@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALQTYGgC/x3MTQqAIBBA4avErBtI0aiuEi38mWo2GhoRiHdPW
 n6L9wpkSkwZlq5Aooczx9Ag+g7cacJByL4Z5CD1MMoJmSO6GPKN3twGFc5iV14obazV0LIr0c7
 vv1y3Wj8k87YhYgAAAA==
X-Change-ID: 20250628-iio-const-data-4-91f4d145abb5
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=xd9zgN26iUwiHRfuwwnHBEGh37uP/NmSoUedlNGjeVQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBO2b9GPfD4TEJkDp3Ez+DgnZViPgd2YzhMIX
 bvccv6WmnaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGATtgAKCRDCzCAB/wGP
 wBsuB/9RXXpHaLBroPGtqQQPP3MLYfCbk15M96LfMFiZBBvnMiPC2KM6h6Vq2bNJrY1o8XxJQeO
 lQSmvRjzJgu9Q8YGWvymvZZ7gbvoaggmxfbtGjBU2PGI84SgLCSGzha+rKWDiaAjL8EWnqrfe+b
 vDPd0xsihVlSnxxMyjZMEjw8qMftG0xqXvEFt8TfNHGSaqGqk6LleyPx34hp2+sXX5dSBL3Xe1M
 ssOG7qUdoi+in5DDJTYuSF7xDpNs//o6fTqDPOWbsNetT2exujI4hCB9KD4qKaI62kQSMLWl7jN
 SYqYlgsnth/tEHb63EXtpPXQv4z3oDmGppULGDDp+KTFDBqX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct ad7091r_init_info ad7091r*_init_info. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7091r8.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ad7091r8.c b/drivers/iio/adc/ad7091r8.c
index cebade4c2d49ede2bd256ccfa9a064f56437fe4f..e93b8bb60e8ea70eedc086551bf09510e78eae51 100644
--- a/drivers/iio/adc/ad7091r8.c
+++ b/drivers/iio/adc/ad7091r8.c
@@ -206,14 +206,14 @@ static int ad7091r8_gpio_setup(struct ad7091r_state *st)
 	return 0;
 }
 
-static struct ad7091r_init_info ad7091r2_init_info = {
+static const struct ad7091r_init_info ad7091r2_init_info = {
 	.info_no_irq = &ad7091r8_infos[AD7091R2_INFO],
 	.regmap_config = &ad7091r2_reg_conf,
 	.init_adc_regmap = &ad7091r8_regmap_init,
 	.setup = &ad7091r8_gpio_setup
 };
 
-static struct ad7091r_init_info ad7091r4_init_info = {
+static const struct ad7091r_init_info ad7091r4_init_info = {
 	.info_no_irq = &ad7091r8_infos[AD7091R4_INFO],
 	.info_irq = &ad7091r8_infos[AD7091R4_INFO_IRQ],
 	.regmap_config = &ad7091r4_reg_conf,
@@ -221,7 +221,7 @@ static struct ad7091r_init_info ad7091r4_init_info = {
 	.setup = &ad7091r8_gpio_setup
 };
 
-static struct ad7091r_init_info ad7091r8_init_info = {
+static const struct ad7091r_init_info ad7091r8_init_info = {
 	.info_no_irq = &ad7091r8_infos[AD7091R8_INFO],
 	.info_irq = &ad7091r8_infos[AD7091R8_INFO_IRQ],
 	.regmap_config = &ad7091r8_reg_conf,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-4-91f4d145abb5

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

