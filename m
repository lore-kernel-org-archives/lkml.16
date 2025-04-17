Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC61E4B2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744926268; cv=none; b=cqnoqoiortg8T8tGq9n/+r1nW04S2UU4wWG5rbj2nDq0sUOMoZbonhdQfFk5/NDnS9NN6F8aXzF6qcyG6qRxqXNHhwBs23XQxeKPqEnAyL2QGIRmUISLV21Nf8RaPuDec55EzcQ9mDy08qSiGhTNdxM/uw1Z8LUJXS0Ht2tpVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744926268; c=relaxed/simple;
	bh=Z8H0UeKV6n4GNYqtcRBzd5m/l0uFXnW7YgjPaymZP0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UWJg7bDsheKMrxB1T29HKx1qUG3eik5Bk7qYEJcT08/4gR1mgqq1xuI1n+PhaXQ1lc7SGSN/9tr8+6QNWi7uE/iY+dDt+Bp8THc+Co/3ezUJI3b0h2SkUMudUToXMrxpItjlkjYqsFryewLy8S/TypZR8pvAx3LKmWFHl+CS+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e/P01wFr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e/P01wFr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so853270f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744926264; x=1745531064; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBFmVEPSVrHwnGq833HFyEFbm1Am5W1x46GKoIrb/uQ=;
        b=e/P01wFrfoBO+x0OXHV3KMVKiizt5wD70nDAS6nNgTtJ8a1Kj61ppm2vc3EmiqXIGE
         /yuYutL/+stn0/dMQLT5ZuPIcavE0C9jbg2hFY/juDV2xbs7+JUWYbJZYGFvYJdsZQYp
         7gX52ddhfOx612NBffYFPdCVtxv7MzDs6kLRbCy75CJ6OD94SGYPsTNd4usUW5+H8pkD
         n/VY1iUkXmT0SO2RlvQlDHk0JBXuazXroillKvyA36XVE8qHh0mfHfNedk9mWPT3rhr6
         hoY3VxVcZyQl2uocpovU8aYtFMvhKNLDbrRZ/XbR5L8OpupBNmjdKcTQtwPDmedWOjQO
         C9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744926264; x=1745531064;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBFmVEPSVrHwnGq833HFyEFbm1Am5W1x46GKoIrb/uQ=;
        b=TRJ4T3lj/nbZrAzCynza3YDp7Q/kwRE7N/FsxbhP77+cxVu/6AKIVg+1LQ1eAIIMV/
         5Evny8uZCfgRKJYT58b1IUdXqsMUPvkf0NP3DPm/SDTOHjwgzcWtXGysEAWqSnwE0+aB
         IFByseVcbv0Ag1n81IrFrvgafuvrW+vor/O3vLQCMDHmDJOEfFCqPRbPj9BsDHedeTrR
         HxLtBDNW0+QoqPNQBsnPYVsGAZX5yDo/prtwfCHr397OQYArSAifMgkb3YkZIvFs0OCz
         9zzAT5fbS0ewLJ9U/6ZVGGOyZVGbQ9/zjLz6Da5T8bbK/sfJkdR+1W50LTRFEC+eEGu4
         iyYA==
X-Forwarded-Encrypted: i=1; AJvYcCVTSnV15k+2r3dLQsH+W6Nj0u/MIUN8K1dRmrFyAjuYSzMz9Fbz3TLEEbAcDzK+OIxesxU1AD3R7L/tt5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBzzkHJWY1uG+uqXmehZ+Ry3dvgCgsXlFT3voAxUGSA6QK1EW
	ZNVk4bTb5RKMZlPPGwx8GIRuKXfbCR5njmLGSDr6yF8hEpYZaQrOir0LeywmNHY=
X-Gm-Gg: ASbGnctMc0EifvjgCA5NIBGNj+4uH+087CfQmekAFLu3nfijei1qe1VvJCZaiQps8Dl
	Dgq+iG7RU8pDkm5QB1PsBOVHfyMtiv0SLU3j7uJUqU7aAXwjbM78t2iPFH92mQ+tIRA6SZv5f+k
	lUsAt7jqtLU6cjL8dHYkP9aACFK+/3oRgm33MIboKls9VnEN/SnjWAJwdhYuv/1PlHdEXr75I3H
	qqeRJhQ3llSgO7eaS++2n92hSbMcx8h1tUNXHn2gozS/zjSkzWUCJZU+bBKNWfHujpuQSfquscW
	DouIa/UBiKyrXgiiNcHTArQ6uhuFCOT8OE3hAw5TJdsXjaDwU2vzw1dS7dOwsPD18+CYwqwB3u/
	kYSJyub1J29pHNweI4CPFOqN+7dDQ
X-Google-Smtp-Source: AGHT+IHTF5EMJwHhbB9yGSoZvy8o4ivHEImtkv1Z3X5htHr/S3sX8LVDdG42TvQEzNml/ZWrzgECLQ==
X-Received: by 2002:a05:6000:4a11:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-39efba3d0d6mr312407f8f.20.1744926263900;
        Thu, 17 Apr 2025 14:44:23 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406acc31fbsm4203375e9.32.2025.04.17.14.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 14:44:23 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 17 Apr 2025 23:42:51 +0200
Subject: [PATCH] iio: adc: ad7606: fix serial register access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-wip-bl-ad7606-fix-reg-access-v1-1-0ce341f3cfc3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANp1AWgC/x3MQQqAIBBA0avErBtQsayuEi1MpxqICgcqiO6et
 Hzw+Q8IJSaBrngg0cnC+5ahywLC4reZkGM2GGUqZbXDiw8cV/TR1arGiW9MNKMPgUTQmTYYbV0
 T9QR5cSTKxb/vh/f9AI8SdiNuAAAA
X-Change-ID: 20250417-wip-bl-ad7606-fix-reg-access-729c21478d1f
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=hXaDn6noe6picTrePR7Qia5Jgk/9c/68JzwbdzSufT0=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYshgLL2zTOLQK545X1dMWbPtgMDzOFO7C7XSFycYvLOf0
 VTUwfy5oKOUhUGMi0FWTJGlLjHCJPR2qJTyAsbZMHNYmUCGMHBxCsBEnpxh+Cvx/9TmK7un6JZ9
 ydn09M3XP6tkIrVnnFz/Mv2Jn6Cm+fJaRoZVK65nKxqyJHSHtW11YogpWnPqUI6flZIS64H5tzs
 5m3gA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix register read/write routine as per datasheet.

When reading multiple consecutive registers, only the first one is read
properly. This is due to missing chip select between first and second
16bit transfer.

Add chip select between the two 16bit transfers as per datasheet
AD7606C-16, rev 0, figure 110.

Fixes: f2a22e1e172f ("iio: adc: ad7606: Add support for software mode for ad7616")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index 997be483ebb93293481b922e13ece4edb47e940a..bd05357a542cf7234d5bb6b718829d6b720262cd 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -103,7 +103,7 @@ static int ad7606_spi_reg_read(struct ad7606_state *st, unsigned int addr)
 		{
 			.tx_buf = &st->d16[0],
 			.len = 2,
-			.cs_change = 0,
+			.cs_change = 1,
 		}, {
 			.rx_buf = &st->d16[1],
 			.len = 2,

---
base-commit: 8dc6b228d746b1a900bed28568defb2266fa4c43
change-id: 20250417-wip-bl-ad7606-fix-reg-access-729c21478d1f

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

