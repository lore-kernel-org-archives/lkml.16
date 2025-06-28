Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319712857C7
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130104; cv=none; b=bCjZcvTHDu+/lqemIFInwtYwWxiFQT21jow3uw83SaTYDRvTtkigA8e+85tVVbmwMYa/JWWYoxuj6S9oo4VFjRdxf0wIUult33niMCMMIqnKvezX+9a5n2RXB2QLD3l7HXbkoqW0n65uf7nCpjumxRQ6R3THyVFtdLtofgnR6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130104; c=relaxed/simple;
	bh=X2KSmb4HCsHC/HeHjDlqJkqmU0XZcMUMkV1bUX/8/sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K9hJrcd4a0/t2nUgUZXCw8XSlsWtG54CBdfbdQNtMOREMLhlZfFodTrguHuRLMxOotVcDT96DcKZ5mH6wGLKbhOogLC1ktlxJl78OMUdAtvc7Yw8rt5rn79N5EM+Ljevvqz6cwuZMsLFi+lL3fREnZja+RalhUTf9ie+G0kdVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kOSzQ18z; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kOSzQ18z"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60f276c7313so692396eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751130100; x=1751734900; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNEn7suD+Hd2kWZGGFYZnjdopPtytgcb/jMssPmD/3o=;
        b=kOSzQ18z5Z9Jfi/4BSfxTCFnyflQT/yAfKOBNd0Hiu0CdY2WgusLSGCfYRdW8eDKL5
         UjW5Czta8iyd4q2+v/QBR3YdBGbHWVigbViH8Vwe0dsr2K5zooOfwf4lDIG31REV1kDy
         ZbaSPLd1UaMFkoWyEyY2rxFq0RJCNslOBgnc/9RYRzMZr80H4xDeb1aQQz6mHCmwf0WJ
         GmEiu8THw5VaRfM5dVlFz2ApKrYViVubd3uOp4Q35nxDr2jyq6K/jYJ4ABKyUbGqichj
         NrtD/1p3ooKCM531iQxLf+F4buKadsIDFHV2fAV/RhbRSkgdnE4GnHxQ96KR6Hl52HNW
         /phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130100; x=1751734900;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNEn7suD+Hd2kWZGGFYZnjdopPtytgcb/jMssPmD/3o=;
        b=jlCeU3/AsyASql2l1VPMu0xcCtqxmRYtdCDMgHFEVJkxHxvYLJtBs1Vh3pt9CjPkyR
         MpgrbFRYVHlw2drwfX7+X/OqO0fi+iKw4Haq7GJFQqV6lEhXj9+1csvJhIVrLvvncYl0
         F7CTjbuYqf9gar+CkNioPxC82InQQnjkpIMijYbRgrADS/ohmG4/hQDiXHRidE/h0Tdi
         mhTB5pAEKBKyKmqCOFFP6DMiZn1cv+yhJmtQiF5Msxq4cGSlopQs6OxvVQ+bBz/iyNcx
         jz5oWFyqmxhbl0PxlrwEu78W4+bNRDXuMhoK0Pn16r3pzwMS43y8kecNznNH4BvGOku3
         hVeA==
X-Forwarded-Encrypted: i=1; AJvYcCVZK24sDyip56PHRO75jWiz+2ypwMWe0SlExO8n/zS4Eyde0MC+hDJ9BKNAm8dmpqlrWtiYaFVXmWmw6eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydY/FQtyy7oG34tYc0yu/SCiVIXdIq8D9V/LWSFDKqoAkK6YGM
	1ENxqGnMfQHFpCtz+fxfudSb0GkAY3VjCivp8ja/6yjA6stasjAG5w5PPwhmB2AWDlw=
X-Gm-Gg: ASbGncv7rhWnNXGJYzZLHGwGPq7YuNNTXw6Iq6CIY+awIcOpoJtnHi0XtnupDvYYv3f
	SErBW/YD6cJzvNHwLoDph+chQrLJP4FVuj51DLQ5ok6iXbOPV56y/piMMFGUhgNWIOAUjOQB7Gv
	eAFCnwb2wD0+kQrWTmE+W4QWyd6vtqZiN3hMocHjaaB3T/FvGIiQqxAaRAqlp1HOY1796ME4LQJ
	/PNrJF3OrUrzh6fCaIKW1sCTMaam+o6XDxaNM1+o497/PXouZi0JfqUOuJNlFVCyEcMKvCTctMQ
	+6Tij9VgvPykz3QEDNALKGObcGXnJYp+4zpll8sexpnINm8f7pfdoUf97QzDOcG4E77J
X-Google-Smtp-Source: AGHT+IEbaYeotjNAcu6yS3Amk18K1Y9pBzRkOkrHYlQBIJjCg3X86HmLN22n85KsVC/LI8XaPnIEyQ==
X-Received: by 2002:a05:6871:3806:b0:2d5:ba2d:80ed with SMTP id 586e51a60fabf-2efed68536bmr4922110fac.25.1751130100185;
        Sat, 28 Jun 2025 10:01:40 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50f852bsm1602028fac.33.2025.06.28.10.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:01:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:01:29 -0500
Subject: [PATCH] iio: accel: adxl345: make ad8366_info const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-12-v1-1-88029e48a26b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOgfYGgC/x3MTQqAIBBA4avErBvQ6QfpKtHCcqzZaGhEEN49a
 fkt3nshcxLOMDUvJL4lSwwVum1gO2zYGcVVAyka1EgGRSJuMeQLnb0sakIyrL3Ra9+PHdTuTOz
 l+Z/zUsoH2AVrGmMAAAA=
X-Change-ID: 20250628-iio-const-data-12-28e1f81b4463
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=X2KSmb4HCsHC/HeHjDlqJkqmU0XZcMUMkV1bUX/8/sc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYB/qZu5zS+DAe4bECmTsxhAWRh9ooM0P8eWRq
 Ei43wZbnJeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAf6gAKCRDCzCAB/wGP
 wN+jB/9JVxJpqA1P4b6s0wgjvSyxzFPFRRrF//MhkCSVx8c9nhRqSn9YKDCpMjxRUVYHB+opvRG
 TBf9mQrilmGQMg2JWBWCD2slnzvyZJjWBsH47mxuZwokQ2EuvfN7x356LLRImXtIBQ4NLjbg93b
 pnVsfmIjqavJ/Fr5KvMAYypWC+GtpK/7KVJ4pTPrhX9ltcIMduWmuTIwX4fARK248oJsDPg6QNu
 V/zECi4hBURPeknDVdFkh0u/dcDwd1qRDQt7m1iWN/wsqukt3UuR9rCYx9cS0i2JoXSV3+EwXZ/
 Gbem147usgwRlvGHZrPZiPMgChJ7bh+nYd/ajaspeOuokYSa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct ad8366_info ad8366_infos[]. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
I looked into dropping use of the chip info array in this one, but
removing it isn't trivial. There are several switch statements that
are using the chip ID still. So we'll save that for another day.
---
 drivers/iio/amplifiers/ad8366.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/amplifiers/ad8366.c b/drivers/iio/amplifiers/ad8366.c
index e73c9b9833959e498fd03b37f9bedf2226b2f42a..d06ac786501c47518493e382ec2e2ad445349dd6 100644
--- a/drivers/iio/amplifiers/ad8366.c
+++ b/drivers/iio/amplifiers/ad8366.c
@@ -45,7 +45,7 @@ struct ad8366_state {
 	struct gpio_desc	*reset_gpio;
 	unsigned char		ch[2];
 	enum ad8366_type	type;
-	struct ad8366_info	*info;
+	const struct ad8366_info *info;
 	/*
 	 * DMA (thus cache coherency maintenance) may require the
 	 * transfer buffers to live in their own cache lines.
@@ -53,7 +53,7 @@ struct ad8366_state {
 	unsigned char		data[2] __aligned(IIO_DMA_MINALIGN);
 };
 
-static struct ad8366_info ad8366_infos[] = {
+static const struct ad8366_info ad8366_infos[] = {
 	[ID_AD8366] = {
 		.gain_min = 4500,
 		.gain_max = 20500,
@@ -163,7 +163,7 @@ static int ad8366_write_raw(struct iio_dev *indio_dev,
 			    long mask)
 {
 	struct ad8366_state *st = iio_priv(indio_dev);
-	struct ad8366_info *inf = st->info;
+	const struct ad8366_info *inf = st->info;
 	int code = 0, gain;
 	int ret;
 

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-12-28e1f81b4463

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

