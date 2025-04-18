Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D8421B9E9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993065; cv=none; b=t8YhIecmF9/HVXxDSa+BE6c+1yeyACdpgZ72GdC49uzG+XQrXci8BbbLM+NfissR9rfatQmqGBkwO60d6g5oY+8gvVXSrqE4zgGVdOT77YufOBZR3A6pXRvTKWr9MWB+KSGDFHfKjNLfyLJ6qM2XRIbaybOny8O4RsG3OD4wpDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993065; c=relaxed/simple;
	bh=Ji2Bufzsf6DgjWf4BBNQD3G1VXMnmCGj6mWGvQqpC6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+SCG2eE2BpWVyeUmzQZFyBvXuq4N5qMSaBvEnVfEKJlt95rJWCvfJB/QMm97sBXAwr3C1MGsh5OoY4pZ11i7gREdQO33s88HRNyjDIKy6wUIFERlLS4PCQ6ELq2HwKRmp8uiX1XGwtBViewgMKtEawn+6unrHpIX2z43GlOWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NXEGQMmz; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NXEGQMmz"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f7f7b70aebso1078154b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744993062; x=1745597862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hab2lxvE/fC3IFWY2w9omfjURJU1Di1Tb8agi9lm2zI=;
        b=NXEGQMmz2CPMXMbgPK/CTPkr3iW1Q4qwgnYuFDdUYUflcuvc7xbX7GezDIUaffmsdS
         P5YsFCMR1mqDaQv0D0c6BfNNcEf4y1wT7pU1sh7bFAj43J/1q5WgHYJjJJYktlbSyGiC
         A4aNHWhhgbd51/LBp8c0JBDplJqk+1zvTtU8FrMvuG8QhWL9e4TGONLDXMxEw1GIZ6rO
         /BwMdhsEjDHmsJ/gw2BXZ6FDD2NdYXpsljTP8dbR6478TRhQNdZ58Ufzq3kGizs1plXB
         J6rpRY5SqJxjAcD1CliL6cLJDhnifXSnwyF6O8qK/TsWyP/mpxqakAgVOidsX71qNFIk
         DPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744993062; x=1745597862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hab2lxvE/fC3IFWY2w9omfjURJU1Di1Tb8agi9lm2zI=;
        b=AZuP9Nv+wTCGjBnoxJkuSwfoD4OjSGOKUNo4yZOFPvrQExyrT1mlp9mFfn4nRRody2
         M4MuuDkiaa21eAryj2VH9cOyqJ3XD1fofKa9EGO9UPLRYnI2D2AdUmqoHE6ooi2ao5Qx
         KvxKLLdkE2dDKAcvOoy3mMLcFDHgQyB6mhzKmV6YNe1pd+QzUdb4iyi4kB6LclQz+kZV
         oxXpD9xO8fASzWJ23eS0lMcSVCGiLuPfL599FZgygi/Ict6eEN+MY9FPIuUMm8F74XHS
         gOzvXRHWwjWT8MxwtdlJ3TJgAuny9KQ1k71AVYV7pDLLnGfP0DOGNxzNZHcr1pxgzc0D
         exJw==
X-Forwarded-Encrypted: i=1; AJvYcCUaXhZD0HsYyXHCczvquIBdNuGo2VzN7DFnG7qAl4bhY3DNyBJz3cJxlW0mpWZpSahVstT+lbuDjMP+YSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK7xxNmjAU1Hv7F31Zc+5pbuqYWe2p3SMN/WU/IEl9EqB3p9MW
	MyT8JNUyR+mGKbRmHewvzs/PTyOYf6Hh6po73Wunp79KflK+foUda+LKv2AVstk=
X-Gm-Gg: ASbGncseoO7LLOmV3+62bydlqpAZrXa3Kcs/Zgwd5R5oIhMW9OY0IRCK37aZJ8b8gXT
	GAjicdWPXSYzDQFmqHi59Z2lkyJZjiWYvxMiIo6cdZQyQ1Khy1cEa7tOzp0FE/hAGeSPgC/6N+9
	dxcSZOXoqAkYZmf/pKtCQgN+2cJhIWZXvvvjDOLJ4cDu4FHxqZkVbEtqovvel2t7Pqt9tAuQuU3
	Gf24mNKmf2uKHvJyRpCpeJ8/BmTEBi5e5/SwjfaApElsYTRBc+tKBlJ+irIvxS9Hh9mkq6ACDgZ
	R5bQCG0QYAPAro6Qx77AFJehvqu7KWVHWXG0rTaJ1Ws+zD8=
X-Google-Smtp-Source: AGHT+IG/MpUgMyPK4jKl1uNgegRoH+YvszC0/QY69eyP1nF1ELt8AiR2HwXu0ntYkRWrAaw6L7fBrQ==
X-Received: by 2002:a05:6808:4e15:b0:400:be08:f6e5 with SMTP id 5614622812f47-401c092e403mr1579080b6e.7.1744993062308;
        Fri, 18 Apr 2025 09:17:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beeffe05sm384929b6e.30.2025.04.18.09.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:17:41 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 11:17:13 -0500
Subject: [PATCH v2 1/2] iio: imu: adis16550: align buffers for timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-more-timestamp-alignment-v2-1-d6a5d2b1c9fe@baylibre.com>
References: <20250418-iio-more-timestamp-alignment-v2-0-d6a5d2b1c9fe@baylibre.com>
In-Reply-To: <20250418-iio-more-timestamp-alignment-v2-0-d6a5d2b1c9fe@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Robert Budai <robert.budai@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Ji2Bufzsf6DgjWf4BBNQD3G1VXMnmCGj6mWGvQqpC6c=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAnsUn+ARff5RlLSjf5RfdY2gi8ublq+tbyrEL
 5nV5JOlTEWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAJ7FAAKCRDCzCAB/wGP
 wH92B/42FlsLkWxKApYyrIMJuVdxLFtZ78J6pzL4P+rXHmqEOSiL9eAYiplsxPTvqSvJNT1/BFu
 YZEuSLECihsYpNtqmKCabfw6N2Cp0iXcrngukUWLjkNClBfpAzaUgareHgyOxBM5WUBShJ/l1y3
 rd8xYed07q1bKQfjfIi2AUSs7mu4NOk29cIlxkIMmWw3r4zScL1M8kT42JMbCITU2bAUkWSZUgM
 Z2+WPCof6mLnRhWhZ1N0bvYFT6jzEleKG+xf+QotSM62569wAZUNryQZBqcrryfajIL1nmQ13Kc
 f8w/wiRlFiW4ywldzntwreV69I90wDr2rJ7SO0tJV6++PEwz
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Align the buffers used with iio_push_to_buffers_with_timestamp() to
ensure the s64 timestamp is aligned to 8 bytes.

Fixes: bac4368fab62 ("iio: imu: adis16550: add adis16550 support")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/imu/adis16550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16550.c b/drivers/iio/imu/adis16550.c
index b14ea8937c7f5a2123e4097dc5b8260492044d1b..28f0dbd0226cbea67bc6c87d892f7812f21e9304 100644
--- a/drivers/iio/imu/adis16550.c
+++ b/drivers/iio/imu/adis16550.c
@@ -836,7 +836,7 @@ static irqreturn_t adis16550_trigger_handler(int irq, void *p)
 	u16 dummy;
 	bool valid;
 	struct iio_poll_func *pf = p;
-	__be32 data[ADIS16550_MAX_SCAN_DATA];
+	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct adis16550 *st = iio_priv(indio_dev);
 	struct adis *adis = iio_device_get_drvdata(indio_dev);

-- 
2.43.0

