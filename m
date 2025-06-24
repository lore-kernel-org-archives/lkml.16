Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE51BC9E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805102; cv=none; b=Qo2cgTGFY5R7OqP0PGLYcDjc+25bRDXBCG6aMU5rqL+SKvKrvggyE5/lHnF6Ckdm4ycFajekFAf1V9gE93Qed6FgI5IRQ+Fw4TkkR2zzjQeLeUMEiQ8CjnP+T9gcTnefX0BQbxoYvLm0i40VVQAK5AZm015M6+TICxzJ5JVeidg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805102; c=relaxed/simple;
	bh=mcJFllEeRF+yE7slrMbAaaS2eHVpby7as1ptgR6ihnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=edJmpcpg+t2oNdfFlPJK5MBjfhSnFM/6lqM8aMXAHXt4sSXkMgV5g4/KH8NzjIGJS2S2P76rtaiFhO/OthzmD+dsgJN+T221b4z2ER6aJ42aMQhcW30NnCM4JtNlMRY8ZHKDOUWezUQY3CCQkCqD1N3HMPvnKs1OT7k9Qr40Qc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XJchwPpw; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XJchwPpw"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8762a0866a3so32457539f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750805098; x=1751409898; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRXMbmGHv5qc0+GRIglNxAEcLatX5Y9+ZZFfOH/sgcc=;
        b=XJchwPpww2xDUEi/0t2Go4QNJyfs6gmyh+Z391LHtt1DZvm0jenF9v/wcIE5si5uq4
         gvdLh7LX+dEqjvzmyblna39xz5ScBmfNT5CW3Y25CZFqRU73Izu2iMYPVMxeHZsBLQEU
         nqFmsorqSX8vts3ZzSiw4FrcjO5XMkj4S0YVPd7WxM5o4vT7MFxI2R15hU9tNzzYDL2Y
         GA6ZoxAx2/bX1n7qLjm8+sc3v3ElIAeQd1AtzV6k56OfrgFcM2rL6F4OoOB9erYxbIEl
         PKtr61OJpnPuGIRbnmQnfsanxJiJfkI7IDqg/vyUc+1ZL35HOi5PRWeR4pS0XJd583qH
         myYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805098; x=1751409898;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRXMbmGHv5qc0+GRIglNxAEcLatX5Y9+ZZFfOH/sgcc=;
        b=Vu/FukpPHe/L1F/NmtK25kH0rtUHDr4Qpo8IAcrDfEn6jNFwL9USLDP1t2R5aQDgj5
         L3yt0of6fRLYD4dqHo4vs5LmegIe2wCS3pdW2/qeL8Gte0C4EjD9FAk2PvBbqmJM8nyX
         cNEF7XeAYrIItlD58rnY2W1s46SyRwNCcuZKp27xNa08Qq7NwDJojAzFNjErZ9IlLRKS
         1D9rrRcYxV2OJMaJ3MUjTMhaknFbhuJlxaSPThibj03baA8xOGF+GZIi7YFJoXjIVNWY
         htPqP87P4QdG9W7U4/3AZG8jetnGHamZIAx4sX56FxhXn7Ne51IbkZZ05WmgGHAv9CZf
         5XsA==
X-Forwarded-Encrypted: i=1; AJvYcCU2y9rOEzoaX6P6hpjg/lmMLDOV2+mp5DdOp3d5zHXWKJ4/bPLi33Qvv5PLxjLckffbT/0wdK05EhVRDRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQd1e7/bzJvixuUIQGzn64akIUTqeUcc4O1uyCq+cYj+dKdQ+s
	i/V7hKXPFsY/fds/izFqsObmjQ3o5b71zclzdpv7/4GPoJQ4d1oleB19kP6Jpx89S6Jg1zEU36M
	TN1cP5Fw=
X-Gm-Gg: ASbGncurlA4qOVJuKj8lQvkjsS42pVF2A1hh5jFmBSYSpjWbDmt4dI5c55Y2fVD9abv
	9SORyMSittJq/pxraSNsd6qZdlecryshLMvAVIpsQs3sK3COFTWShiLq+EPEGuJxrK1vendj9+T
	NqCcpoMCDT4uYxkNKTCGFEfW8Bw7ZJivoK6FYxD5uPM6r76ADIVCJxMAC54u7MbxAnlsAjKKbrS
	s83HD/VDshaovmDMnage7gtUNmyYwlQtb5I4ZpHMjVl1IoYu935Hc2JFD4gPpH2M8mGicj56Ou1
	ZK5cHDlXelEtG46epJHhdJW8pxjnWNcyUsopQ2YH+YuhzY1i7gXuBQLmzfGVbJqI
X-Google-Smtp-Source: AGHT+IH7S88HndQYh/y+AH2dYPlp+bphbSdHifv9VXqm4+49L6EVcl77epJmUEAPqt5lk9I3IFqEcg==
X-Received: by 2002:a05:6602:378e:b0:86d:61:ce7e with SMTP id ca18e2360f4ac-8766b4212damr169849139f.0.1750805098487;
        Tue, 24 Jun 2025 15:44:58 -0700 (PDT)
Received: from [127.0.1.1] ([208.115.91.129])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-501c9248983sm1086444173.11.2025.06.24.15.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:44:58 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 24 Jun 2025 22:44:51 +0000
Subject: [PATCH] iio: adc: ad7380: remove unused oversampling_ratio getter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-iio-adc-ad7380-remove-unused-oversampling_ratio-getter-v1-1-26cbee356860@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGIqW2gC/x2NUQqDMBBEryL73YUYo5ZepUgJZk0XaiKbKAXx7
 l36MTAPHjMnFBKmAo/mBKGDC+ek0N4amN8+RUIOymCN7c1gHTJn9GHWjN3doNCaD8I97YUCapX
 i1+3DKb7EV3Uj1UqC1DvXdoMdFzKg45vQwt//8XO6rh/EybYUiAAAAA==
X-Change-ID: 20250624-iio-adc-ad7380-remove-unused-oversampling_ratio-getter-e54413627fe0
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Remove a call to ad7380_get_osr() in ad7380_init_offload_msg. The
returned value is never used.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
I wrote this a while back but it looks like it never got sent so here
it is now.
---
 drivers/iio/adc/ad7380.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index d96bd12dfea632b62475d6537c8d6601b042de1f..abcd4cc70074723303b9b67e2b89b0c4b43c6884 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -1165,7 +1165,6 @@ static int ad7380_init_offload_msg(struct ad7380_state *st,
 	struct spi_transfer *xfer = &st->offload_xfer;
 	struct device *dev = &st->spi->dev;
 	const struct iio_scan_type *scan_type;
-	int oversampling_ratio;
 	int ret;
 
 	scan_type = iio_get_current_scan_type(indio_dev,
@@ -1195,10 +1194,6 @@ static int ad7380_init_offload_msg(struct ad7380_state *st,
 		}
 	}
 
-	ret = ad7380_get_osr(st, &oversampling_ratio);
-	if (ret)
-		return ret;
-
 	xfer->bits_per_word = scan_type->realbits;
 	xfer->offload_flags = SPI_OFFLOAD_XFER_RX_STREAM;
 	xfer->len = AD7380_SPI_BYTES(scan_type) * st->chip_info->num_simult_channels;

---
base-commit: b57cb7c47e31244bef6612f271c5dc390f761e17
change-id: 20250624-iio-adc-ad7380-remove-unused-oversampling_ratio-getter-e54413627fe0

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

