Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131A1FE457
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891758; cv=none; b=llJSKkHJRjI/rhaAMGO/b6nAWpqMs3vvC8js9YkK23dmHcbluPjh/MbIlBpHoZsE/Jt8saJ70NNdwEi3LnWJJN0kV/+gCM44sa7lfapFnwZAgWDy1HPxJ0mRdGv2fqz0A85WJ3BluNMIh4HqIBImwPD9Z8fEDPUFtPOTJI2SuiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891758; c=relaxed/simple;
	bh=mT2HO0OOEj3A8IYsb8tFiNpG4Sqs84xk79LBTwoP8aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JSudNyi+OevNf7QeTD2CTz8Tka9CC7xgcS7PUA2ktoc3iGK8HqLqQTscg/Gjvnpr5k1a8IMXvApa5g3V+l/l7zoY8hbW3RJ+YJGf9dJYr7kcrJlJVGt5Tw0zLYXmNnAMAscaQHiuLAmHyc++mHzLG3lztzA5giY+X4oDbrcxx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fth0/9QN; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fth0/9QN"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c14138668so1463981a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745891754; x=1746496554; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HSiEFoWAXctjsz9CWQEbSI2+ZdktKKEBscejuwswLxk=;
        b=fth0/9QNnMqZsWisekOwokupOwFxbFi9zhMcJRsgj3dlcr7TyVolw9R57AeoWhl4HL
         slTOAoEn1pL+HeMuQl2IBk+yCGFPYGJYPDP/lRtWaKF4i9coWKR5+G+3Q8zcKwmP5buC
         wFGYQ4tn4E6OK4XB/XF/QEa2FnIfdLMszGOaLPwsWLQfKFs+CWkGgaS1pBF704DVg0l3
         YlMyjUMRTkN1ILRSZOgJIPnX3E0Zp498V8840UjFzXGREi+AbUVh8FqypVpyooMiwGBU
         yiO5S1vMN7owHGJRUPYJ93/9jqcClVb7zTsdOmkwG0TaHPFxK0+qd5o4l6H9VRIUaI0g
         qtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745891754; x=1746496554;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSiEFoWAXctjsz9CWQEbSI2+ZdktKKEBscejuwswLxk=;
        b=JQJzVSqPPHHZ9rWZG9GQ0d0Ci/iOX1qdVjYDXd70+Nm550lwRA2hUGJjJgNbRRRVH+
         HVU6//MeY0lKY6ryBbia4Uelxh3Y896AnrT2Ic5tW9YvhYGf5ZeVjLQP+YFZgmc5gP8A
         4c20nhK5spIrC2z2UPs/SzWMLwz0S3IMf1MsTS+hq2bifT8uQeobtem3QuGcOCgbm4t4
         V9mPi2sT0j/7kNra7XD4tS1ygf9sRjC2Vhs9M43hn65k+efCmPUlGk5RRAEawuc9TZtW
         UczUKVRgkeQS+vBeNkiQnXTO2m3poKHAV/l63FzzmI3+LmZDaq5sbqckYnZj9/5QmC7q
         KRaw==
X-Forwarded-Encrypted: i=1; AJvYcCWyVGIGppd2GCewTKJjeX5TfzjDMladZxqAXCnhy4+qEB8/j3GjqXZADeXTia0Rxk3rT9Cd2r3WXzFIZj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PlBtfg1CsEiYW5QwP1nWif/eCT3+aVKmTdkM7ydKg/Jiuh9T
	CH3QEP1b5KSJgmrVsvaq2NzYrzAu+Mm2omdSmlSFk3uV+4LoljolfuA8Qk2YRog=
X-Gm-Gg: ASbGncsu0SmYGuLu8BUjv5CijspgNC+CV1Yo7Bi1lXS/XCouIx1NyrOUcApMCu6uOgW
	deFfLAAdD651dUfY/Hv4euSL0DtnT8rNgmM4K/7OB9Rfrbm7mIkhppCU7+gqFwqnlO0Vw3EHBNy
	aOBOnmGJjpSTsa6AZFAMtIJ0Lo1D3YlJEtvM4kczd1H1U/RzjpUbntMuf2xKSvRqeps308oafUc
	wUHSMsTQFYQIyZkPiA4au/CQFdp0gXiPlgwv1Vkjq0m98rh3MUDxY7K6opWAMt4L6SD2fht5Toi
	4bLMpr+Sk2VQOrHqbYqmK6oTXLXpUdmmCeSk7qDbepCKGsmwcnpnqTvmBA==
X-Google-Smtp-Source: AGHT+IFv5VEbevaLhyAwe+YkilWgw/qAmMqzG8wF2aYvolG95zZl1RWwBE8uv/yrQXv7pG9Q4SuN5A==
X-Received: by 2002:a05:6870:3295:b0:29e:766d:e969 with SMTP id 586e51a60fabf-2d9be53e725mr5815680fac.10.1745891753975;
        Mon, 28 Apr 2025 18:55:53 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d973644508sm2582574fac.4.2025.04.28.18.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:55:52 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 20:55:34 -0500
Subject: [PATCH] iio: adc: ad7606_spi: fix reg write value mask
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-adc-ad7606_spi-fix-write-value-mask-v1-1-a2d5e85a809f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJUxEGgC/x2NQQrCQAxFr1KyNjCGOiNeRURCJmpQ2zLRKpTe3
 eDiLR48/l/AtZk6HLoFms7mNg4h200HcuPhqmg1HCjRLvW0R7MRuUpQcspnnwwv9sVPs5fizI+
 34pP9joWlinCfiQrE2tQ0uv/T8bSuP2R74KN5AAAA
X-Change-ID: 20250428-iio-adc-ad7606_spi-fix-write-value-mask-7acdcca46227
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=mT2HO0OOEj3A8IYsb8tFiNpG4Sqs84xk79LBTwoP8aM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoEDGg+0d8QYZ3LlxKQqEiGM3V3iU3sx9hqsQ3d
 pgXIw/SzFSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBAxoAAKCRDCzCAB/wGP
 wPo5CACDMNOL3sJupmUOtQJALaeHaVADg2IHkXkpxWPeW5xKYOlHtf1TSv9ImGtwyTl7Q3Kg94q
 bU1egL1KqTdUbOsdWxNOZqjXGJ/DldiWseTNbaViK7zR761aNCBSxaF9vuQsAJX0Hc+NIgwjzVc
 +jsVI3A2XFFK6TNx9MjHIuL+HbDmEKbu/E9oXSyqm68mfI/QKtIpuasd72o1AvDSESx+6GbVZzJ
 Oi7rfOMJ8i+vsZTeTS0nYPxl1IztyJ9AbRH6tIB9x6jPFA3fkfXLF66ECUmXVH/G2pgSQNg32It
 122uJiu34YzBhe8z7OOkpxGR0rAAUFg4hpjs5o7oulKZIliC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix incorrect value mask for register write. Register values are 8-bit,
not 9. If this function was called with a value > 0xFF and an even addr,
it would cause writing to the next register.

Fixes: f2a22e1e172f ("iio: adc: ad7606: Add support for software mode for ad7616")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7606_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index bd05357a542cf7234d5bb6b718829d6b720262cd..6c1228c7b1b11058cb5186513f032f7c8c8aa8f4 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -127,7 +127,7 @@ static int ad7606_spi_reg_write(struct ad7606_state *st,
 	struct spi_device *spi = to_spi_device(st->dev);
 
 	st->d16[0] = cpu_to_be16((st->bops->rd_wr_cmd(addr, 1) << 8) |
-				  (val & 0x1FF));
+				  (val & 0xFF));
 
 	return spi_write(spi, &st->d16[0], sizeof(st->d16[0]));
 }

---
base-commit: aa1bd0b0ad048855d9efbee4ee8b9a6eee536256
change-id: 20250428-iio-adc-ad7606_spi-fix-write-value-mask-7acdcca46227

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

