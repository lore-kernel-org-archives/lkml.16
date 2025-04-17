Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691322248AE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908818; cv=none; b=t8LpWHe44SXiHXH5zAgNxI99YvdBmYZ2QKkYWpOaa7UpvmLRIbZBYil13XUelvvRxIT9loMym1RIFg3WGvQ2kEiX4OAyD89qbDOEGENafY+Qnbef18tzFTZsgfRPxdoNn1ZzNJ9Ybo9vqm1APOsugJBhfoTgCu9B1BD02n1ecPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908818; c=relaxed/simple;
	bh=Sz+7sWlyolxS4Zl/eEi8a9e44hyD2IGfO6dXn8EDJGw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YlSAWCDl7nBjvRCYNnI2YtJNVGPDeE6rIkwqBr5+LtJMJhMbhwvzuuYGpXYqoJa8mh/nhgl/5bZGhsVczOCB0/umtxopYCU0VXKxUsIjERd2IpsH/gLVSxoGrW+UgSS4zwipoNwifzlW37vFejMJx1EArxdGTKB2D/0/iryIToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SnK8VwPl; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SnK8VwPl"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1148409fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908815; x=1745513615; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMsi2WwJ6hjhub+TfZ/EQK2V+POxMxNiG2BzOtIkvYw=;
        b=SnK8VwPl3LPb76nnvSb4z0D1/tyGV7x5zbiBFAFlUOFLnnFHT01/YdvQi2vmOHvhn0
         yjAJ/dSJljFZuAH7XrxmMvRopQ9TtgW1aENU3663K8BGHyTtxdwUvG3FHc0jOkynGqov
         VZIv1NpmzVbd5UNESm55CKWeqw80p/qOh336HXNWeA9eeKnPKCcw51TpIvTEtXkC9Qb7
         AYLqdZ0xboXq6Ozk6FCaEbHAhNZTXRmzgKiYZhoRuZ8WUSrCVAoPtTzEDg+itcAcBQdP
         UNLlnxoWK4plFasLpBPReDjlmR1u9xyIZjRmkI9Y2hM+Msw+yuQA08pA1do3yRfWwixO
         zS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908815; x=1745513615;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMsi2WwJ6hjhub+TfZ/EQK2V+POxMxNiG2BzOtIkvYw=;
        b=LBenfSfoQzBo2H7qG4jkcd926h/8QSJRiMcoZgHQqD1bCJ5OmVamGvWmczPYPGxrT3
         jZb/YEsd9T2x8dTOC5QXSXwVUIvx7lxZMMrwXP43yRBLtYOle+lBb1zmmf0gai4K4pg8
         D0He8FUSbfuzXJw9Dv1+aczEivDgRQvfTc9JnF5nZVLUYbaAMF2L8S3fvdhfjR5b6z4Y
         mLRnKu9+y/z95G+UGjk5r9wEhuwH0rFwW7S6T5uuEVyexFbdQ206J7JlHDKWf8f6CqQ0
         mHYiAx09ZpU00P3kWcY5UL1iN+LqOm80hUeUBaDLmGCaYxpWKfzrszifnlnDU6xltAc1
         o9cg==
X-Forwarded-Encrypted: i=1; AJvYcCV3GSolKpj8WX6bD9kE3JHAv7ucuXc8H6Jl9o87zp5euftsnBMLZbpbQDCNqa5VVxQwg4Q07iL1u6X748Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhxeWlXlH8MWcx6DE0OQFTThhECe2QS76oXYt563L2tHz4dBeG
	t3Mh9FEh+ikASJS8N2Bb2is5rMR8LedtcLzp6iujBuVDGEIioGw78DqqluVn12g=
X-Gm-Gg: ASbGncuRH4WGfbjM0u6VONnfxsbaWMX6VsqEjghtYD+ucgqWsxNBernOnxVN3IgxhPz
	GhV8iXlaPhWo0vk7/88Ri1r+/mUOjLXvcu7oWJYbcR8tzELh7JiqYioQMmuXGL0NHiZIxiOVr84
	tWCqYktaHaoNfIgAZL2WFvly/tP2iTwiWBkTQggeOqY+B+EsS29PXKU+Oe2oZCF0iIeuz0dR9fB
	RE501Lab50hcAYbJyAMYSY+r1khDfyvXtGRyN1+AmaTm8eys1pDnv0htQh7af61jcGOfeEmoX7U
	MfCmVMRjMwSedTmio6mG+5npA0+2zKkrKWOsG9T1Yg2nAog=
X-Google-Smtp-Source: AGHT+IFY/vO7y8M2CG7Oo5TX+7MViwzoQKB+pziGqNMOOxstSmF5iwhAC/aDMXMw925f6TrhRA+Olw==
X-Received: by 2002:a05:6871:71c1:b0:2cb:d32f:2f18 with SMTP id 586e51a60fabf-2d51df2a8f2mr362900fac.16.1744908815275;
        Thu, 17 Apr 2025 09:53:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/8] iio: more timestamp alignment
Date: Thu, 17 Apr 2025 11:52:32 -0500
Message-Id: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAxAWgC/x3MwQqDMBBF0V+RWXdAxVrpr5QuRn21D0wiSSgF8
 d8Ncldnc3dJiESSZ7VLxI+JwRc0t0qmr/kFyrlY2rq9113TKxnUhQjNdEjZ3Ka2cvEOPms/lWx
 4YJxNymKL+PB/7V/v4zgBSmlh324AAAA=
X-Change-ID: 20250416-iio-more-timestamp-alignment-6c6c6a87ebda
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Sz+7sWlyolxS4Zl/eEi8a9e44hyD2IGfO6dXn8EDJGw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHTMUD0F9owkDNUGccr2O9643S49NzTkqNd8
 qD0QXO+JF2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx0wAKCRDCzCAB/wGP
 wPrkB/44BUumGHVPTUE3N/as04EvFSkdabzEdJ+zuY8Gv7nu0W0unpkR8WIuN6freUelK+lDnsz
 aoZzHpnCJbmaP0oogKGJpWPhmUGK8+ubL5bCgkevBCpizO9+B2P7PmmH+QRI1YJYk/nTwR03+Be
 tys5+hxNRkMNHrz1Vi3ORz04S579JM0cyJnUMg2HcI0jYNC4YWvPBxy5UQTMUVcdmLshiV+seAv
 6oSaxrXmLE0I55TicHv9sP3uNkJuRCZJMEjb7AM1yl3wpkStx0bTjU7SzSkI01INwxLmBRzuj5/
 2u2+9LvXToRIZ5CF/BHCR3JX5yD4lKx41QwRgNWsXt06XUpE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Wile reviewing [1], I noticed a few more cases where we can use
aligned_s64 or need __aligned(8) on data structures used with
iio_push_to_buffers_with_timestamp().

[1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (8):
      iio: adc: dln2-adc: use aligned_s64 for timestamp
      iio: adc: mt6360-adc: use aligned_s64 for timestamp
      iio: addac: ad74413r: use aligned_s64 for timestamp
      iio: chemical: pms7003: use aligned_s64 for timestamp
      iio: chemical: sps30: use aligned_s64 for timestamp
      iio: imu: adis16550: align buffers for timestamp
      iio: imu: inv_mpu6050: align buffer for timestamp
      iio: pressure: mprls0025pa: use aligned_s64 for timestamp

 drivers/iio/accel/bmc150-accel.h           | 2 +-
 drivers/iio/adc/dln2-adc.c                 | 2 +-
 drivers/iio/adc/mt6360-adc.c               | 4 ++--
 drivers/iio/addac/ad74413r.c               | 5 +++--
 drivers/iio/chemical/pms7003.c             | 5 +++--
 drivers/iio/chemical/sps30.c               | 2 +-
 drivers/iio/imu/adis16550.c                | 2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c | 2 +-
 drivers/iio/pressure/mprls0025pa.h         | 2 +-
 9 files changed, 14 insertions(+), 12 deletions(-)
---
base-commit: 3159d40a2ca0ae14e69e1cae8b12f04c933d0445
change-id: 20250416-iio-more-timestamp-alignment-6c6c6a87ebda

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

